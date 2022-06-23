--Написать крипт, добавляющий в БД vk, которую создали на занятии, 3 новые таблицы (с перечнем полей, указанием индексов и внешних ключей)--
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`(
	`id` SERIAL,
    `media_id` BIGINT UNSIGNED NOT NULL,
    `from_user_id` BIGINT UNSIGNED NOT NULL,
    `to_user_id` BIGINT UNSIGNED NOT NULL,
    `body` TEXT,
    `created_at` DATETIME DEFAULT NOW(),

    FOREIGN KEY (from_user_id) REFERENCES users(id),
    FOREIGN KEY (to_user_id) REFERENCES users(id),
    FOREIGN KEY (media_id) REFERENCES media(id)
   );
  
DROP TABLE IF EXISTS `black_list`;
CREATE TABLE `black_list`(
	`id` SERIAL,
	`added_user` BIGINT UNSIGNED NOT NULL,
	`user_in_list` BIGINT UNSIGNED NOT NULL,
	`added_at` DATETIME DEFAULT NOW(),
	
	FOREIGN KEY (added_user) REFERENCES users(id),
    FOREIGN KEY (user_in_list) REFERENCES users(id),
    CHECK (added_user <> user_in_list)
    );
DROP TABLE IF EXISTS `status`;
CREATE TABLE `status`(
	`id` SERIAL,
	`user_id` BIGINT UNSIGNED NOT NULL,
	`posted_at` DATETIME DEFAULT NOW(),

	FOREIGN KEY (user_id) REFERENCES users(id)
	);
