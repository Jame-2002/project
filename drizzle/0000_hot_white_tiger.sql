CREATE TABLE `user_added_coworkers` (
	`user_id` integer NOT NULL,
	`work_date` text NOT NULL,
	`shift_code` text NOT NULL,
	`employee_code` text NOT NULL,
	`real_name` text NOT NULL,
	PRIMARY KEY(`user_id`, `work_date`, `shift_code`, `employee_code`),
	FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE TABLE `mutation_guards` (
	`user_id` integer NOT NULL,
	`revision` integer NOT NULL,
	PRIMARY KEY(`user_id`, `revision`),
	FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE TABLE `user_hidden_coworkers` (
	`user_id` integer NOT NULL,
	`work_date` text NOT NULL,
	`employee_code` text NOT NULL,
	`hidden` integer DEFAULT 1 NOT NULL,
	PRIMARY KEY(`user_id`, `work_date`, `employee_code`),
	FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE TABLE `imports` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`uploaded_by` integer NOT NULL,
	`month` text NOT NULL,
	`draft_json` text NOT NULL,
	`status` text DEFAULT 'draft' NOT NULL,
	FOREIGN KEY (`uploaded_by`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE TABLE `user_coworker_names` (
	`user_id` integer NOT NULL,
	`employee_code` text NOT NULL,
	`real_name` text NOT NULL,
	PRIMARY KEY(`user_id`, `employee_code`),
	FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE TABLE `training_participants` (
	`training_id` integer NOT NULL,
	`user_id` integer NOT NULL,
	`personal_date` text,
	`personal_title` text,
	`confirmed` integer DEFAULT 1 NOT NULL,
	`removed` integer DEFAULT 0 NOT NULL,
	`revision` integer DEFAULT 1 NOT NULL,
	PRIMARY KEY(`training_id`, `user_id`),
	FOREIGN KEY (`training_id`) REFERENCES `training_events`(`id`) ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE TABLE `user_roster_days` (
	`user_id` integer NOT NULL,
	`work_date` text NOT NULL,
	`roster_json` text NOT NULL,
	PRIMARY KEY(`user_id`, `work_date`),
	FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE TABLE `schedules` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`user_id` integer NOT NULL,
	`work_date` text NOT NULL,
	`code` text NOT NULL,
	`revision` integer DEFAULT 1 NOT NULL,
	`coworker_json` text,
	`import_id` integer,
	FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE UNIQUE INDEX `schedule_owner_date` ON `schedules` (`user_id`,`work_date`);--> statement-breakpoint
CREATE TABLE `sessions` (
	`token` text PRIMARY KEY NOT NULL,
	`uid` integer,
	`version` integer DEFAULT 0 NOT NULL,
	`csrf` text NOT NULL,
	`expires` integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE `auth_throttles` (
	`identity_hash` text PRIMARY KEY NOT NULL,
	`failures` integer DEFAULT 0 NOT NULL,
	`window_start` integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE `training_events` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`work_date` text NOT NULL,
	`title` text NOT NULL,
	`is_team_notice` integer DEFAULT 0 NOT NULL
);
--> statement-breakpoint
CREATE UNIQUE INDEX `training_date_title` ON `training_events` (`work_date`,`title`);--> statement-breakpoint
CREATE TABLE `users` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`employee_code` text NOT NULL,
	`name` text NOT NULL,
	`nickname` text DEFAULT '' NOT NULL,
	`roster_name` text NOT NULL,
	`role` text DEFAULT 'employee' NOT NULL,
	`active` integer DEFAULT 1 NOT NULL,
	`session_version` integer DEFAULT 1 NOT NULL,
	`password_hash` text NOT NULL,
	`data_revision` integer DEFAULT 0 NOT NULL
);
--> statement-breakpoint
CREATE UNIQUE INDEX `users_employee_code_unique` ON `users` (`employee_code`);--> statement-breakpoint
CREATE UNIQUE INDEX `users_roster_name_unique` ON `users` (`roster_name`);