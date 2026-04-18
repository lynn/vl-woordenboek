DROP TABLE IF EXISTS "article_bookmarks";
CREATE TABLE IF NOT EXISTS "article_bookmarks" (
 "user_id" INTEGER NOT NULL,
 "article_id" INTEGER NOT NULL,
 "created_at" TEXT NULL DEFAULT NULL,
 "updated_at" TEXT NULL DEFAULT NULL
);

DROP TABLE IF EXISTS "article_label";
CREATE TABLE IF NOT EXISTS "article_label" (
 "id" INTEGER NOT NULL ,
 "label_id" INTEGER NOT NULL,
 "article_id" INTEGER NOT NULL,
 "created_at" TEXT NULL DEFAULT NULL,
 "updated_at" TEXT NULL DEFAULT NULL,
 PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "article_region";
CREATE TABLE IF NOT EXISTS "article_region" (
 "id" INTEGER NOT NULL ,
 "region_id" INTEGER NOT NULL,
 "article_id" INTEGER NOT NULL,
 "created_at" TEXT DEFAULT NULL,
 "updated_at" TEXT DEFAULT NULL,
 PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "article_reports";
CREATE TABLE IF NOT EXISTS "article_reports" (
 "id" INTEGER NOT NULL ,
 "state" INTEGER NOT NULL,
 "assignee_id" INTEGER DEFAULT NULL,
 "author_id" INTEGER DEFAULT NULL,
 "article_id" INTEGER NOT NULL,
 "description" text NOT NULL,
 "assigned_at" TEXT NULL DEFAULT NULL,
 "closed_at" TEXT NULL DEFAULT NULL,
 "created_at" TEXT NULL DEFAULT NULL,
 "updated_at" TEXT NULL DEFAULT NULL,
 PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "article_sources";
CREATE TABLE IF NOT EXISTS "article_sources" (
 "id" INTEGER NOT NULL ,
 "reference_work_id" INTEGER DEFAULT NULL,
 "article_id" INTEGER NOT NULL,
 "notation" text,
 "created_at" TEXT NULL DEFAULT NULL,
 "updated_at" TEXT NULL DEFAULT NULL,
 PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "articles";
CREATE TABLE IF NOT EXISTS "articles" (
 "id" INTEGER NOT NULL ,
 "origin" INTEGER NOT NULL DEFAULT '0',
 "state" INTEGER NOT NULL DEFAULT '5',
 "notify_author" INTEGER NOT NULL DEFAULT '0',
 "part_of_speech_id" INTEGER DEFAULT NULL,
 "author_id" INTEGER DEFAULT NULL,
 "editor_id" INTEGER DEFAULT NULL,
 "publisher_id" INTEGER DEFAULT NULL,
 "archiever_id" INTEGER DEFAULT NULL,
 "word" TEXT NOT NULL,
 "views" INTEGER NOT NULL DEFAULT '0',
 "votes_today" INTEGER NOT NULL DEFAULT '0',
 "wotd" INTEGER NOT NULL DEFAULT '0',
 "status" INTEGER NOT NULL DEFAULT '4',
 "image_url" TEXT DEFAULT NULL,
 "image_alt" TEXT DEFAULT NULL,
 "description" text,
 "keywords" TEXT DEFAULT NULL,
 "example" text,
 "characteristics" text,
 "archiving_reason" TEXT DEFAULT NULL,
 "disclaimer_id" INTEGER DEFAULT NULL,
 "archived_at" TEXT NULL DEFAULT NULL,
 "published_at" TEXT NULL DEFAULT NULL,
 "prune_reminder_sent_at" TEXT NULL DEFAULT NULL,
 "deleted_at" TEXT NULL DEFAULT NULL,
 "created_at" TEXT NULL DEFAULT NULL,
 "updated_at" TEXT NULL DEFAULT NULL,
 "contributor_name" TEXT DEFAULT NULL,
 PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "audits";
CREATE TABLE IF NOT EXISTS "audits" (
 "id" INTEGER NOT NULL ,
 "user_type" TEXT DEFAULT NULL,
 "user_id" INTEGER DEFAULT NULL,
 "event" TEXT NOT NULL,
 "auditable_type" TEXT NOT NULL,
 "auditable_id" INTEGER NOT NULL,
 "old_values" text,
 "new_values" text,
 "url" text,
 "ip_address" TEXT DEFAULT NULL,
 "user_agent" TEXT DEFAULT NULL,
 "tags" TEXT DEFAULT NULL,
 "created_at" TEXT NULL DEFAULT NULL,
 "updated_at" TEXT NULL DEFAULT NULL,
 PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "backend_bookmark_folders";
CREATE TABLE IF NOT EXISTS "backend_bookmark_folders" (
 "id" INTEGER NOT NULL ,
 "user_id" INTEGER NOT NULL,
 "name" TEXT NOT NULL,
 "created_at" TEXT NULL DEFAULT NULL,
 "updated_at" TEXT NULL DEFAULT NULL,
 PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "backend_bookmarks";
CREATE TABLE IF NOT EXISTS "backend_bookmarks" (
 "id" INTEGER NOT NULL ,
 "user_id" INTEGER NOT NULL,
 "name" TEXT NOT NULL,
 "bookmark_folder_id" INTEGER DEFAULT NULL,
 "url" text NOT NULL,
 "created_at" TEXT NULL DEFAULT NULL,
 "updated_at" TEXT NULL DEFAULT NULL,
 PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "bans";
CREATE TABLE IF NOT EXISTS "bans" (
 "id" INTEGER NOT NULL ,
 "bannable_type" TEXT NOT NULL,
 "bannable_id" INTEGER NOT NULL,
 "created_by_type" TEXT DEFAULT NULL,
 "created_by_id" INTEGER DEFAULT NULL,
 "comment" text,
 "expired_at" TEXT NULL DEFAULT NULL,
 "deleted_at" TEXT NULL DEFAULT NULL,
 "created_at" TEXT NULL DEFAULT NULL,
 "updated_at" TEXT NULL DEFAULT NULL,
 PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "blogs";
CREATE TABLE IF NOT EXISTS "blogs" (
 "id" TEXT NOT NULL,
 "author_id" INTEGER DEFAULT NULL,
 "status" INTEGER DEFAULT NULL,
 "title" TEXT NOT NULL,
 "content" text NOT NULL,
 "original_url" TEXT DEFAULT NULL,
 "views" INTEGER NOT NULL DEFAULT '0',
 "comments_enabled" INTEGER NOT NULL DEFAULT '1',
 "published_at" TEXT NULL DEFAULT NULL,
 "created_at" TEXT NULL DEFAULT NULL,
 "updated_at" TEXT NULL DEFAULT NULL,
 PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "cache";
CREATE TABLE IF NOT EXISTS "cache" (
 "key" TEXT NOT NULL,
 "value" TEXT NOT NULL,
 "expiration" INTEGER NOT NULL,
 PRIMARY KEY ("key")
);

DROP TABLE IF EXISTS "cache_locks";
CREATE TABLE IF NOT EXISTS "cache_locks" (
 "key" TEXT NOT NULL,
 "owner" TEXT NOT NULL,
 "expiration" INTEGER NOT NULL,
 PRIMARY KEY ("key")
);

DROP TABLE IF EXISTS "categories";
CREATE TABLE IF NOT EXISTS "categories" (
 "id" TEXT NOT NULL,
 "name" TEXT NOT NULL,
 "description" TEXT DEFAULT NULL,
 "created_at" TEXT NULL DEFAULT NULL,
 "updated_at" TEXT NULL DEFAULT NULL,
 PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "comments";
CREATE TABLE IF NOT EXISTS "comments" (
 "id" INTEGER NOT NULL ,
 "commentable_type" TEXT NOT NULL,
 "commentable_id" TEXT NOT NULL,
 "comment" text NOT NULL,
 "is_approved" INTEGER NOT NULL DEFAULT '0',
 "user_id" INTEGER DEFAULT NULL,
 "created_at" TEXT NULL DEFAULT NULL,
 "updated_at" TEXT NULL DEFAULT NULL,
 PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "disclaimers";
CREATE TABLE IF NOT EXISTS "disclaimers" (
 "id" INTEGER NOT NULL ,
 "type" INTEGER NOT NULL,
 "name" TEXT NOT NULL,
 "message" text NOT NULL,
 "usage" text NOT NULL,
 "description" text NOT NULL,
 "created_at" TEXT NULL DEFAULT NULL,
 "updated_at" TEXT NULL DEFAULT NULL,
 PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "etymologies";
CREATE TABLE IF NOT EXISTS "etymologies" (
 "id" INTEGER NOT NULL ,
 "etymology" text,
 "origin" TEXT DEFAULT NULL,
 "origin_period" TEXT DEFAULT NULL,
 "further_development" text,
 "further_development_period" TEXT DEFAULT NULL,
 "oldest_find_spot" TEXT DEFAULT NULL,
 "oldest_find_period" INTEGER DEFAULT NULL,
 "additional_info" text,
 "source_name" INTEGER NOT NULL,
 "source_hyperlink" TEXT DEFAULT NULL,
 "status" INTEGER NOT NULL,
 "article_id" INTEGER DEFAULT NULL,
 "author_id" INTEGER DEFAULT NULL,
 "rejected_by" INTEGER DEFAULT NULL,
 "archived_by" INTEGER DEFAULT NULL,
 "published_by" INTEGER DEFAULT NULL,
 "archiving_reason" text,
 "rejection_reason" text,
 "published_at" TEXT NULL DEFAULT NULL,
 "archived_at" TEXT NULL DEFAULT NULL,
 "rejected_at" TEXT NULL DEFAULT NULL,
 "created_at" TEXT NULL DEFAULT NULL,
 "updated_at" TEXT NULL DEFAULT NULL,
 PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "exports";
CREATE TABLE IF NOT EXISTS "exports" (
 "id" INTEGER NOT NULL ,
 "completed_at" TEXT NULL DEFAULT NULL,
 "file_disk" TEXT NOT NULL,
 "file_name" TEXT DEFAULT NULL,
 "exporter" TEXT NOT NULL,
 "processed_rows" INTEGER NOT NULL DEFAULT '0',
 "total_rows" INTEGER NOT NULL,
 "successful_rows" INTEGER NOT NULL DEFAULT '0',
 "user_id" INTEGER NOT NULL,
 "created_at" TEXT NULL DEFAULT NULL,
 "updated_at" TEXT NULL DEFAULT NULL,
 PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "failed_import_rows";
CREATE TABLE IF NOT EXISTS "failed_import_rows" (
 "id" INTEGER NOT NULL ,
 "data" TEXT NOT NULL,
 "import_id" INTEGER NOT NULL,
 "validation_error" text,
 "created_at" TEXT NULL DEFAULT NULL,
 "updated_at" TEXT NULL DEFAULT NULL,
 PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "failed_jobs";
CREATE TABLE IF NOT EXISTS "failed_jobs" (
 "id" INTEGER NOT NULL ,
 "uuid" TEXT NOT NULL,
 "connection" text NOT NULL,
 "queue" text NOT NULL,
 "payload" TEXT NOT NULL,
 "exception" TEXT NOT NULL,
 "failed_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
 PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "features";
CREATE TABLE IF NOT EXISTS "features" (
 "id" INTEGER NOT NULL ,
 "name" TEXT NOT NULL,
 "scope" TEXT NOT NULL,
 "value" text NOT NULL,
 "created_at" TEXT NULL DEFAULT NULL,
 "updated_at" TEXT NULL DEFAULT NULL,
 PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "feedback";
CREATE TABLE IF NOT EXISTS "feedback" (
 "id" INTEGER NOT NULL ,
 "tracking_number" TEXT NOT NULL,
 "author_id" INTEGER DEFAULT NULL,
 "name" TEXT NOT NULL,
 "email" TEXT DEFAULT NULL,
 "status" INTEGER DEFAULT NULL,
 "first_time_visit" TEXT NOT NULL,
 "results_found_easily" TEXT NOT NULL,
 "visit_reason" text,
 "search_additional_info" text,
 "additional_info" text,
 "contact_allowed" INTEGER NOT NULL DEFAULT '0',
 "created_at" TEXT NULL DEFAULT NULL,
 "updated_at" TEXT NULL DEFAULT NULL,
 PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "imports";
CREATE TABLE IF NOT EXISTS "imports" (
 "id" INTEGER NOT NULL ,
 "completed_at" TEXT NULL DEFAULT NULL,
 "file_name" TEXT NOT NULL,
 "file_path" TEXT NOT NULL,
 "importer" TEXT NOT NULL,
 "processed_rows" INTEGER NOT NULL DEFAULT '0',
 "total_rows" INTEGER NOT NULL,
 "successful_rows" INTEGER NOT NULL DEFAULT '0',
 "user_id" INTEGER NOT NULL,
 "created_at" TEXT NULL DEFAULT NULL,
 "updated_at" TEXT NULL DEFAULT NULL,
 PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "job_batches";
CREATE TABLE IF NOT EXISTS "job_batches" (
 "id" TEXT NOT NULL,
 "name" TEXT NOT NULL,
 "total_jobs" INTEGER NOT NULL,
 "pending_jobs" INTEGER NOT NULL,
 "failed_jobs" INTEGER NOT NULL,
 "failed_job_ids" TEXT NOT NULL,
 "options" TEXT,
 "cancelled_at" INTEGER DEFAULT NULL,
 "created_at" INTEGER NOT NULL,
 "finished_at" INTEGER DEFAULT NULL,
 PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "jobs";
CREATE TABLE IF NOT EXISTS "jobs" (
 "id" INTEGER NOT NULL ,
 "queue" TEXT NOT NULL,
 "payload" TEXT NOT NULL,
 "attempts" INTEGER unsigned NOT NULL,
 "reserved_at" INTEGER DEFAULT NULL,
 "available_at" INTEGER NOT NULL,
 "created_at" INTEGER NOT NULL,
 PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "labels";
CREATE TABLE IF NOT EXISTS "labels" (
 "id" INTEGER NOT NULL ,
 "name" TEXT NOT NULL,
 "type" TEXT DEFAULT NULL,
 "description" text,
 "created_at" TEXT NULL DEFAULT NULL,
 "updated_at" TEXT NULL DEFAULT NULL,
 PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "likes";
CREATE TABLE IF NOT EXISTS "likes" (
 "id" INTEGER NOT NULL ,
 "user_id" INTEGER NOT NULL,
 "likeable_type" TEXT NOT NULL,
 "likeable_id" INTEGER NOT NULL,
 "created_at" TEXT NULL DEFAULT NULL,
 "updated_at" TEXT NULL DEFAULT NULL,
 PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "ltm_translations";
DROP TABLE IF EXISTS "messages";
CREATE TABLE IF NOT EXISTS "messages" (
 "id" INTEGER NOT NULL ,
 "thread_id" INTEGER NOT NULL,
 "user_id" INTEGER NOT NULL,
 "body" text NOT NULL,
 "created_at" TEXT NULL DEFAULT NULL,
 "updated_at" TEXT NULL DEFAULT NULL,
 "deleted_at" TEXT NULL DEFAULT NULL,
 PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "migrations";
CREATE TABLE IF NOT EXISTS "migrations" (
 "id" INTEGER NOT NULL ,
 "migration" TEXT NOT NULL,
 "batch" INTEGER NOT NULL,
 PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "model_has_permissions";
CREATE TABLE IF NOT EXISTS "model_has_permissions" (
 "permission_id" INTEGER NOT NULL,
 "model_type" TEXT NOT NULL,
 "model_id" INTEGER NOT NULL,
 PRIMARY KEY ("permission_id","model_id","model_type")
);

DROP TABLE IF EXISTS "model_has_roles";
CREATE TABLE IF NOT EXISTS "model_has_roles" (
 "role_id" INTEGER NOT NULL,
 "model_type" TEXT NOT NULL,
 "model_id" INTEGER NOT NULL,
 PRIMARY KEY ("role_id","model_id","model_type")
);

DROP TABLE IF EXISTS "notes";
CREATE TABLE IF NOT EXISTS "notes" (
 "id" INTEGER NOT NULL ,
 "author_id" INTEGER NOT NULL,
 "article_id" INTEGER NOT NULL,
 "title" TEXT NOT NULL,
 "body" text NOT NULL,
 "created_at" TEXT NULL DEFAULT NULL,
 "updated_at" TEXT NULL DEFAULT NULL,
 PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "notifications";
CREATE TABLE IF NOT EXISTS "notifications" (
 "id" TEXT NOT NULL,
 "type" TEXT NOT NULL,
 "notifiable_type" TEXT NOT NULL,
 "notifiable_id" INTEGER NOT NULL,
 "data" text NOT NULL,
 "read_at" TEXT NULL DEFAULT NULL,
 "created_at" TEXT NULL DEFAULT NULL,
 "updated_at" TEXT NULL DEFAULT NULL,
 PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "part_of_speeches";
CREATE TABLE IF NOT EXISTS "part_of_speeches" (
 "id" INTEGER NOT NULL ,
 "suggestible" INTEGER NOT NULL DEFAULT '1',
 "name" TEXT DEFAULT NULL,
 "value" TEXT DEFAULT NULL,
 "created_at" TEXT NULL DEFAULT NULL,
 "updated_at" TEXT NULL DEFAULT NULL,
 PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "participants";
CREATE TABLE IF NOT EXISTS "participants" (
 "id" INTEGER NOT NULL ,
 "thread_id" INTEGER NOT NULL,
 "user_id" INTEGER NOT NULL,
 "last_read" TEXT NULL DEFAULT NULL,
 "created_at" TEXT NULL DEFAULT NULL,
 "updated_at" TEXT NULL DEFAULT NULL,
 "deleted_at" TEXT NULL DEFAULT NULL,
 PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "password_reset_tokens";
CREATE TABLE IF NOT EXISTS "password_reset_tokens" (
 "email" TEXT NOT NULL,
 "token" TEXT NOT NULL,
 "created_at" TEXT NULL DEFAULT NULL,
 PRIMARY KEY ("email")
);

DROP TABLE IF EXISTS "permissions";
CREATE TABLE IF NOT EXISTS "permissions" (
 "id" INTEGER NOT NULL ,
 "name" TEXT NOT NULL,
 "guard_name" TEXT NOT NULL,
 "created_at" TEXT NULL DEFAULT NULL,
 "updated_at" TEXT NULL DEFAULT NULL,
 PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "personal_access_tokens";
CREATE TABLE IF NOT EXISTS "personal_access_tokens" (
 "id" INTEGER NOT NULL ,
 "tokenable_type" TEXT NOT NULL,
 "tokenable_id" INTEGER NOT NULL,
 "name" TEXT NOT NULL,
 "token" TEXT NOT NULL,
 "abilities" text,
 "last_used_at" TEXT NULL DEFAULT NULL,
 "expires_at" TEXT NULL DEFAULT NULL,
 "created_at" TEXT NULL DEFAULT NULL,
 "updated_at" TEXT NULL DEFAULT NULL,
 PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "post_categories";
CREATE TABLE IF NOT EXISTS "post_categories" (
 "blog_id" TEXT NOT NULL,
 "category_id" TEXT NOT NULL,
 "created_at" TEXT NULL DEFAULT NULL,
 "updated_at" TEXT NULL DEFAULT NULL
);

DROP TABLE IF EXISTS "preferables";
CREATE TABLE IF NOT EXISTS "preferables" (
 "id" INTEGER NOT NULL ,
 "preferences_id" INTEGER NOT NULL,
 "preferable_type" TEXT NOT NULL,
 "preferable_id" INTEGER NOT NULL,
 PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "preferences";
CREATE TABLE IF NOT EXISTS "preferences" (
 "id" INTEGER NOT NULL ,
 "section" TEXT NOT NULL,
 "preference" TEXT NOT NULL,
 "description" TEXT DEFAULT NULL,
 "created_at" TEXT NULL DEFAULT NULL,
 "updated_at" TEXT NULL DEFAULT NULL,
 PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "pulse_aggregates";
CREATE TABLE IF NOT EXISTS "pulse_aggregates" (
 "id" INTEGER NOT NULL ,
 "bucket" INTEGER NOT NULL,
 "period" INTEGER NOT NULL,
 "type" TEXT NOT NULL,
 "key" TEXT NOT NULL,
 "aggregate" TEXT NOT NULL,
 "value" REAL NOT NULL,
 "count" INTEGER DEFAULT NULL,
 PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "pulse_entries";
CREATE TABLE IF NOT EXISTS "pulse_entries" (
 "id" INTEGER NOT NULL ,
 "TEXT" INTEGER NOT NULL,
 "type" TEXT NOT NULL,
 "key" TEXT NOT NULL,
 "value" INTEGER DEFAULT NULL,
 PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "pulse_values";
CREATE TABLE IF NOT EXISTS "pulse_values" (
 "id" INTEGER NOT NULL ,
 "TEXT" INTEGER NOT NULL,
 "type" TEXT NOT NULL,
 "key" TEXT NOT NULL,
 "value" TEXT NOT NULL,
 PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "reference_works";
CREATE TABLE IF NOT EXISTS "reference_works" (
 "id" INTEGER NOT NULL ,
 "abbreviation" TEXT DEFAULT NULL,
 "name" TEXT NOT NULL,
 "created_at" TEXT NULL DEFAULT NULL,
 "updated_at" TEXT NULL DEFAULT NULL,
 PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "region_geo_data";
CREATE TABLE IF NOT EXISTS "region_geo_data" (
 "id" INTEGER NOT NULL ,
 "region_id" INTEGER DEFAULT NULL,
 "postal" TEXT NOT NULL,
 "name" TEXT NOT NULL,
 "TEXT" TEXT NOT NULL,
 "created_at" TEXT NULL DEFAULT NULL,
 "updated_at" TEXT NULL DEFAULT NULL,
 PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "regions";
CREATE TABLE IF NOT EXISTS "regions" (
 "id" INTEGER NOT NULL ,
 "name" TEXT NOT NULL,
 "created_at" TEXT NULL DEFAULT NULL,
 "updated_at" TEXT NULL DEFAULT NULL,
 PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "res_comments";
CREATE TABLE IF NOT EXISTS "res_comments" (
 "id" INTEGER NOT NULL ,
 "author_type" TEXT NOT NULL,
 "author_id" INTEGER NOT NULL,
 "commentable_type" TEXT NOT NULL,
 "commentable_id" INTEGER NOT NULL,
 "body" text NOT NULL,
 "created_at" TEXT NULL DEFAULT NULL,
 "updated_at" TEXT NULL DEFAULT NULL,
 PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "res_reactions";
CREATE TABLE IF NOT EXISTS "res_reactions" (
 "id" INTEGER NOT NULL ,
 "comment_id" INTEGER NOT NULL,
 "reactor_type" TEXT NOT NULL,
 "reactor_id" INTEGER NOT NULL,
 "reaction" TEXT NOT NULL,
 "created_at" TEXT NULL DEFAULT NULL,
 "updated_at" TEXT NULL DEFAULT NULL,
 PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "res_subscriptions";
CREATE TABLE IF NOT EXISTS "res_subscriptions" (
 "id" INTEGER NOT NULL ,
 "subscribable_type" TEXT NOT NULL,
 "subscribable_id" INTEGER NOT NULL,
 "subscriber_type" TEXT NOT NULL,
 "subscriber_id" INTEGER NOT NULL,
 "created_at" TEXT NULL DEFAULT NULL,
 "updated_at" TEXT NULL DEFAULT NULL,
 PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "resource_locks";
CREATE TABLE IF NOT EXISTS "resource_locks" (
 "id" INTEGER NOT NULL ,
 "created_at" TEXT NULL DEFAULT NULL,
 "updated_at" TEXT NULL DEFAULT NULL,
 "user_id" INTEGER NOT NULL,
 "lockable_type" TEXT NOT NULL,
 "lockable_id" INTEGER NOT NULL,
 PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "role_has_permissions";
CREATE TABLE IF NOT EXISTS "role_has_permissions" (
 "permission_id" INTEGER NOT NULL,
 "role_id" INTEGER NOT NULL,
 PRIMARY KEY ("permission_id","role_id")
);

DROP TABLE IF EXISTS "roles";
CREATE TABLE IF NOT EXISTS "roles" (
 "id" INTEGER NOT NULL ,
 "name" TEXT NOT NULL,
 "guard_name" TEXT NOT NULL,
 "created_at" TEXT NULL DEFAULT NULL,
 "updated_at" TEXT NULL DEFAULT NULL,
 PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "sessions";
CREATE TABLE IF NOT EXISTS "sessions" (
 "id" TEXT NOT NULL,
 "user_id" INTEGER DEFAULT NULL,
 "ip_address" TEXT DEFAULT NULL,
 "user_agent" text,
 "payload" TEXT NOT NULL,
 "last_activity" INTEGER NOT NULL,
 PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "settings";
CREATE TABLE IF NOT EXISTS "settings" (
 "id" INTEGER NOT NULL ,
 "group" TEXT NOT NULL,
 "name" TEXT NOT NULL,
 "locked" INTEGER NOT NULL DEFAULT '0',
 "payload" TEXT NOT NULL,
 "created_at" TEXT NULL DEFAULT NULL,
 "updated_at" TEXT NULL DEFAULT NULL,
 PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "threads";
CREATE TABLE IF NOT EXISTS "threads" (
 "id" INTEGER NOT NULL ,
 "subject" TEXT NOT NULL,
 "created_at" TEXT NULL DEFAULT NULL,
 "updated_at" TEXT NULL DEFAULT NULL,
 "deleted_at" TEXT NULL DEFAULT NULL,
 PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "threads_contacts";
CREATE TABLE IF NOT EXISTS "threads_contacts" (
 "id" INTEGER NOT NULL ,
 "user_id" INTEGER NOT NULL,
 "contact_id" INTEGER NOT NULL,
 "created_at" TEXT NULL DEFAULT NULL,
 "updated_at" TEXT NULL DEFAULT NULL,
 PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "users";
CREATE TABLE IF NOT EXISTS "users" (
 "id" INTEGER NOT NULL ,
 "user_type" INTEGER NOT NULL,
 "firstname" TEXT DEFAULT NULL,
 "lastname" TEXT DEFAULT NULL,
 "email" TEXT NOT NULL,
 "bio" TEXT DEFAULT NULL,
 "twitter" TEXT DEFAULT NULL,
 "bluesky" TEXT DEFAULT NULL,
 "website" TEXT DEFAULT NULL,
 "email_verified_at" TEXT NULL DEFAULT NULL,
 "password" TEXT DEFAULT NULL,
 "two_factor_secret" text,
 "two_factor_recovery_codes" text,
 "two_factor_confirmed_at" TEXT NULL DEFAULT NULL,
 "remember_token" TEXT DEFAULT NULL,
 "last_seen_at" TEXT NULL DEFAULT NULL,
 "banned_at" TEXT NULL DEFAULT NULL,
 "created_at" TEXT NULL DEFAULT NULL,
 "updated_at" TEXT NULL DEFAULT NULL,
 "welcome_valid_until" TEXT NULL DEFAULT NULL,
 "is_beta_tester" INTEGER NOT NULL DEFAULT '0',
 "google_id" text,
 "google_token" text,
 "google_refresh_token" text,
 "name" TEXT NOT NULL,
 "inactivity_warning_sent_at" TEXT NULL DEFAULT NULL,
 PRIMARY KEY ("id")
);

INSERT INTO "migrations" ("id", "migration", "batch") VALUES (57,'0001_01_01_000000_create_users_table',1);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (58,'0001_01_01_000001_create_cache_table',1);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (59,'0001_01_01_000002_create_jobs_table',1);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (60,'2017_03_04_000000_create_bans_table',1);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (61,'2018_12_14_000000_create_likes_table',1);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (62,'2022_12_14_083707_create_settings_table',1);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (63,'2024_03_11_182010_create_part_of_speeches_table',1);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (64,'2025_02_07_072425_add_two_factor_columns_to_users_table',1);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (65,'2025_02_07_142658_add_welcome_valid_until_field_to_users_table',1);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (66,'2025_02_08_172545_create_regions_table',1);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (67,'2025_02_10_131512_create_articles_table',1);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (68,'2025_02_17_042106_create_audits_table',1);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (69,'2025_02_23_034930_create_resource_lock_table',1);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (70,'2025_02_23_083121_create_labels_table',1);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (71,'2025_03_03_143940_create_notes_table',1);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (72,'2025_03_23_215402_create_notifications_table',1);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (73,'2025_03_29_181551_create_features_table',1);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (74,'2025_04_06_003915_create_article_reports_table',1);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (76,'2025_04_30_110547_create_disclaimers_table',1);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (78,'2025_05_04_230105_create_article_bookmarks_table',1);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (79,'2025_05_05_232555_create_telescope_entries_table',1);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (80,'2025_05_16_122753_create_region_geo_data_table',1);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (81,'2025_05_23_232924_create_feedback_table',1);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (82,'2025_05_27_034637_create_personal_access_tokens_table',1);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (83,'2025_06_01_032455_create_blogs_table',1);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (84,'2025_06_04_055458_create_comments_table',1);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (86,'2014_10_28_175635_create_threads_table',2);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (87,'2014_10_28_175710_create_messages_table',2);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (88,'2014_10_28_180224_create_participants_table',2);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (89,'2014_11_03_154831_add_soft_deletes_to_participants_table',2);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (90,'2014_12_04_124531_add_softdeletes_to_threads_table',2);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (91,'2017_03_30_152742_add_soft_deletes_to_messages_table',2);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (92,'2025_04_15_125214_create_volunteer_settings',2);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (93,'2025_05_04_190220_create_project_information_settings',2);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (94,'2025_06_13_124512_add_indexes_on_the_user_table',2);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (95,'2025_06_15_103640_add_type_column_to_labels',2);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (96,'2025_06_18_210100_add_time_info_to_article_region',2);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (97,'2025_06_21_235214_implement_index_on_published_at_in_articles',2);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (98,'2025_06_22_165321_add_filter_index_to_the_articles',2);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (99,'2025_06_23_185234_create_etymologies_table',2);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (100,'2025_06_27_133813_add_bete_tester_configuration_to_the_users_table',2);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (101,'2025_07_26_230458_add_votes_column_for_the_word_of_the_day',2);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (102,'2025_07_30_210156_create_imports_table',2);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (103,'2025_07_30_210157_create_exports_table',2);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (104,'2025_07_30_210158_create_failed_import_rows_table',2);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (105,'2025_07_31_225741_add_tracking_number_to_the_feedback_table',2);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (106,'2025_08_02_043115_create_permission_tables',2);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (107,'2025_08_08_180615_implement_new_etymology_data_structure',2);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (108,'2025_09_01_015447_add_google_auth_to_users',2);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (109,'2025_09_01_023916_modify_users_tables',2);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (110,'2025_09_01_050607_modify_social_authentication_columns',2);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (111,'2025_09_01_234919_add_notify_author_flag_to_articles',2);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (112,'2025_09_02_232641_remove_telescope',2);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (113,'2025_09_02_233112_create_pulse_tables',2);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (114,'2025_09_13_155912_add_original_url_to_blog_comments',2);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (115,'2025_09_15_115642_alter_users_table',2);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (116,'2025_09_18_211328_create_threads_contacts_table',2);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (117,'2025_10_06_175449_drop_language_lines_table',2);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (118,'2025_10_09_104600_add_support_for_inactive_account_deletion',2);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (119,'2025_10_15_103411_register_article_sources_to_relations',2);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (120,'2025_10_21_235614_create_commentions_tables',2);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (121,'2025_10_21_235615_create_commentions_reactions_table',2);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (122,'2025_10_21_235616_create_commentions_subscriptions_table',2);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (123,'2025_10_25_122549_add_siggestion_support_for_part_of_speeches',2);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (124,'2025_10_26_012051_create_preferences_table',2);
INSERT INTO "migrations" ("id", "migration", "batch") VALUES (125,'2025_10_30_175652_create_bookmarks_table',2);