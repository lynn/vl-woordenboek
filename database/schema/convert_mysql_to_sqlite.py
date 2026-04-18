#!/usr/bin/env python3
"""
Converts database/schema/mysql-schema.sql into a SQLite-compatible
database/schema/sqlite-schema.sql that Laravel picks up automatically
when DB_CONNECTION=sqlite on a fresh install.

The conversion strips MySQL-specific syntax that SQLite cannot parse:
conditional comments, ENGINE/CHARSET/COLLATE clauses, FULLTEXT indexes,
GENERATED columns, inline KEY/UNIQUE KEY/CONSTRAINT lines, and maps
MySQL column types to SQLite equivalents. Foreign-key constraints are
dropped; SQLite enforcement is limited and the Laravel migrations
layered on top handle referential integrity in the application code.
"""

import re
from pathlib import Path

HERE = Path(__file__).resolve().parent
SRC = HERE / "mysql-schema.sql"
DST = HERE / "sqlite-schema.sql"


def convert_types(s: str) -> str:
    s = re.sub(r"\bmediumtext\b|\blongtext\b|\btinytext\b", "TEXT", s, flags=re.I)
    s = re.sub(r"\bvarchar\(\d+\)", "TEXT", s, flags=re.I)
    s = re.sub(r"\bchar\(\d+\)", "TEXT", s, flags=re.I)
    s = re.sub(r"\bbinary\(\d+\)", "BLOB", s, flags=re.I)
    s = re.sub(r"\bjson\b", "TEXT", s, flags=re.I)
    s = re.sub(r"\btimestamp\b|\bdatetime\b", "TEXT", s, flags=re.I)
    s = re.sub(r"\bdecimal\(\d+,\d+\)", "REAL", s, flags=re.I)
    s = re.sub(r"\bmediumint\s+unsigned\b|\bmediumint\b", "INTEGER", s, flags=re.I)
    s = re.sub(r"\bbigint\s+unsigned\b|\bbigint\b", "INTEGER", s, flags=re.I)
    s = re.sub(r"\bsmallint\s+unsigned\b|\bsmallint\b", "INTEGER", s, flags=re.I)
    s = re.sub(r"\btinyint\(\d+\)", "INTEGER", s, flags=re.I)
    s = re.sub(r"\btinyint\b", "INTEGER", s, flags=re.I)
    s = re.sub(r"\bint\s+unsigned\b", "INTEGER", s, flags=re.I)
    s = re.sub(r"\bint\b(?!EGER)", "INTEGER", s, flags=re.I)
    s = re.sub(r"\bgeometry\b", "TEXT", s, flags=re.I)
    s = re.sub(r"\s+CHARACTER SET \w+", "", s)
    s = re.sub(r"\s+COLLATE \w+", "", s)
    s = re.sub(r"\s+COMMENT\s+'(?:[^']|'')*'", "", s)
    return s


def btq(s: str) -> str:
    return s.replace("`", '"')


def main() -> None:
    sql = SRC.read_text()
    sql = re.sub(r"/\*![\s\S]*?\*/", "", sql)
    sql = re.sub(r"^\s*SET\s+.*?;\n", "", sql, flags=re.MULTILINE)

    lines = sql.split("\n")
    output: list[str] = []
    i = 0

    while i < len(lines):
        stripped = lines[i].strip()

        if re.match(r"DROP TABLE IF EXISTS\s+`", stripped, re.I):
            output.append(btq(stripped.rstrip(";")) + ";")
            i += 1
            continue

        if re.match(r"INSERT INTO `migrations`", stripped, re.I):
            output.append(btq(stripped))
            i += 1
            continue

        m = re.match(r"CREATE TABLE `(\w+)`\s*\(", stripped)
        if m:
            table_name = m.group(1)
            raw_cols: list[str] = []
            i += 1
            while i < len(lines):
                cl = lines[i].strip()
                if re.match(r"\)\s*(ENGINE|DEFAULT|\s*;)", cl) or cl == ");":
                    i += 1
                    break
                raw_cols.append(lines[i])
                i += 1

            filtered: list[str] = []
            for raw in raw_cols:
                cl = raw.strip()
                if re.match(r"(FULLTEXT\s+KEY|KEY\s+`|UNIQUE\s+KEY\s+`|CONSTRAINT\s+`)", cl, re.I):
                    continue
                if "GENERATED ALWAYS AS" in cl.upper():
                    continue
                transformed = btq(convert_types(raw))
                transformed = transformed.replace("AUTO_INCREMENT", "")
                transformed = re.sub(r"  +", " ", transformed)
                filtered.append(transformed)

            while filtered:
                last = filtered[-1].rstrip()
                if last.strip() == "":
                    filtered.pop()
                else:
                    filtered[-1] = last.rstrip(",")
                    break

            output.append(f'CREATE TABLE IF NOT EXISTS "{table_name}" (')
            output.extend(filtered)
            output.append(");")
            output.append("")
            continue

        i += 1

    result = "\n".join(output)
    result = re.sub(r"\n{3,}", "\n\n", result)
    DST.write_text(result)
    print(f"Wrote {DST} ({len(result.splitlines())} lines)")


if __name__ == "__main__":
    main()
