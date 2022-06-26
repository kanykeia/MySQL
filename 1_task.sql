--  Заполнить все таблицы БД vk данными (не больше 10-20 записей в каждой таблице)--

DROP DATABASE IF EXISTS vk;
CREATE DATABASE vk;
USE vk;

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_user_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `communities_name_idx` (`name`),
  KEY `admin_user_id` (`admin_user_id`),
  CONSTRAINT `communities_ibfk_1` FOREIGN KEY (`admin_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (1,'aspernatur',21),(2,'aut',22),(3,'exercitationem',23),(4,'placeat',24),(5,'vitae',25),(6,'ducimus',30),(7,'corrupti',31),(8,'dolor',32),(9,'non',34),(10,'animi',35),(11,'quis',37),(12,'quasi',38),(13,'iure',39),(14,'ullam',21),(15,'eos',22),(16,'assumenda',23),(17,'facere',24),(18,'dolorum',25),(19,'accusantium',30),(20,'quisquam',31);
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_requests`
--

DROP TABLE IF EXISTS `friend_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friend_requests` (
  `initiator_user_id` bigint(20) unsigned NOT NULL,
  `target_user_id` bigint(20) unsigned NOT NULL,
  `status` enum('requested','approved','declined','unfriended') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requested_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`initiator_user_id`,`target_user_id`),
  KEY `target_user_id` (`target_user_id`),
  CONSTRAINT `friend_requests_ibfk_1` FOREIGN KEY (`initiator_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `friend_requests_ibfk_2` FOREIGN KEY (`target_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`initiator_user_id` <> `target_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_requests`
--

LOCK TABLES `friend_requests` WRITE;
/*!40000 ALTER TABLE `friend_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `friend_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,21,1,'2005-09-28 14:19:18'),(2,22,2,'2016-04-01 00:59:07'),(3,23,3,'1981-03-24 06:53:15'),(4,24,4,'2007-07-04 13:26:50'),(5,25,5,'2000-04-15 07:08:47'),(6,30,6,'1993-09-14 13:36:49'),(7,31,7,'1983-10-14 14:47:13'),(8,32,8,'1984-01-05 09:42:00'),(9,34,9,'1973-10-06 16:08:11'),(10,35,10,'1976-06-03 20:34:59'),(11,37,11,'1999-11-12 01:45:33'),(12,38,12,'2016-05-15 15:15:01'),(13,39,13,'2002-01-29 17:22:19'),(14,21,14,'1971-09-16 21:54:17'),(15,22,15,'2013-07-21 12:45:10'),(16,23,16,'2013-08-10 14:47:49'),(17,24,17,'1985-04-27 05:49:04'),(18,25,18,'1975-09-17 19:20:04'),(19,30,19,'2022-02-02 04:44:51'),(20,31,20,'1989-08-06 21:52:07');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `media_type_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `media_type_id` (`media_type_id`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `media_ibfk_2` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,1,21,'Natus dolores qui veritatis sequi. Fuga id dignissimos velit eum. Ipsam aut ut sapiente totam deserunt consectetur.','ad',49,NULL,'1992-06-27 03:32:20','1994-12-30 18:28:31'),(2,2,22,'Quam non aut laudantium consequatur. Laudantium enim sequi reprehenderit mollitia. Vel omnis natus aspernatur eaque iure alias. Ad repellat dolore minus dolor praesentium.','et',526,NULL,'1984-02-09 04:51:17','2005-04-23 19:56:09'),(3,3,23,'Molestiae sit quia et. Temporibus ipsa dolorem dolore fugit. Tempora enim cupiditate dicta quo reprehenderit sint ab.','facere',3,NULL,'2000-02-28 06:20:27','1989-01-10 17:27:15'),(4,4,24,'Sit blanditiis occaecati tempora omnis nobis. Sed repellat ipsam qui. Voluptatem commodi qui et corrupti qui eum fuga.','qui',12,NULL,'1982-12-18 22:25:02','2015-03-28 03:54:19'),(5,1,25,'Ducimus ut suscipit labore autem sit. Dolorem voluptatem quos animi distinctio vitae corrupti ea. Sapiente sit est nam voluptas excepturi.','et',0,NULL,'1984-09-24 22:59:46','1998-12-01 18:29:17'),(6,2,30,'Assumenda voluptas deserunt exercitationem vero sint. Temporibus similique et sequi ea. Occaecati natus fugiat id iure eveniet vero. Minima minus dolor cupiditate hic quia et quia.','voluptatibus',794801,NULL,'2001-07-21 10:59:25','1998-12-28 05:29:23'),(7,3,31,'Quas veritatis et in est ut dolorem sed suscipit. Cum nam vel voluptatum deserunt quod unde. Laborum quibusdam aut assumenda et eos ad tenetur dicta. Veniam perferendis nobis occaecati dolore consequatur explicabo nisi quo.','impedit',24,NULL,'1982-11-10 05:07:59','2000-01-07 08:30:07'),(8,4,32,'Alias eligendi quas cupiditate harum dolorum voluptatem. Nesciunt in qui eum molestiae. Totam a qui vel.','recusandae',45630,NULL,'2009-03-28 22:39:42','1978-04-26 19:25:15'),(9,1,34,'Qui ut sint ut dolorem tenetur voluptatibus ab. Nobis id facilis quia qui minus facilis. Et fugit voluptatibus a illo commodi numquam quibusdam ullam.','libero',812,NULL,'1985-02-14 16:23:16','2021-08-28 05:36:55'),(10,2,35,'Totam sint esse quidem id esse. Aliquid dolores sit eligendi nam magnam distinctio. Voluptatem ut placeat quis deserunt officia. Omnis qui odio quia ex earum officiis.','nemo',3961,NULL,'1993-06-08 11:21:55','1970-10-14 17:28:55'),(11,3,37,'Enim et praesentium voluptatem quia voluptate animi. Dolorem nostrum molestiae iusto laudantium pariatur non unde. Voluptate hic dolorem quas odio officia facilis dolore.','eos',6244422,NULL,'2002-08-20 06:12:40','1981-01-27 20:08:07'),(12,4,38,'Explicabo aut eveniet sapiente aut. Amet dignissimos veritatis odio qui dolores. Praesentium ut unde eum aut deserunt. Mollitia et quae inventore et rerum autem rerum est.','velit',0,NULL,'1985-10-11 08:39:04','1990-10-17 19:37:04'),(13,1,39,'Et ad dicta et nisi aspernatur. Dolores perferendis cum occaecati saepe impedit. Rem corporis aut sed nisi ut voluptatibus facilis.','voluptates',20707,NULL,'1999-12-04 03:07:07','2019-05-03 10:30:56'),(14,2,21,'Et aut excepturi temporibus distinctio. Et et qui soluta eius velit accusamus numquam. Possimus voluptas facilis voluptas tempore fugiat. Porro eum ut iste sit vel. Eum nihil et eveniet hic commodi.','a',1274179,NULL,'2020-03-03 14:38:10','1989-09-01 17:21:36'),(15,3,22,'Architecto dolor eum nulla ut quam ad aliquam et. In nam officiis placeat dolore est sed.','consequuntur',0,NULL,'2010-04-01 02:40:13','2014-08-28 09:23:45'),(16,4,23,'Occaecati veritatis ut veritatis illum iure ex facilis modi. Quo nesciunt ipsam voluptas accusamus. Rerum et dolores accusantium assumenda distinctio modi. Ratione omnis exercitationem autem.','tempore',311320,NULL,'2020-11-20 09:34:36','1986-11-04 03:48:33'),(17,1,24,'Consequuntur ut voluptates totam tempora ullam est. Ad velit quia et ipsum cumque aspernatur aut. Et aut ipsam doloremque iste similique sapiente harum. Ut molestiae consequuntur exercitationem et quidem. Quibusdam qui officia velit vitae natus eos natus.','explicabo',93,NULL,'1999-02-16 09:26:12','1982-05-22 06:55:13'),(18,2,25,'Est esse iure tempore sed. Quo distinctio itaque dolor ut architecto commodi. Ut est deserunt est corporis ab impedit quos natus.','tempora',1166170,NULL,'1981-12-12 21:01:09','2004-01-19 01:02:02'),(19,3,30,'Id dolorum inventore voluptatum inventore non officiis blanditiis. Labore consequuntur itaque ea iste ut. Adipisci nam ut assumenda qui laboriosam labore quia neque.','ea',15623,NULL,'1973-09-07 02:46:04','1971-09-05 00:17:16'),(20,4,31,'Eveniet ut dolor est illo ipsum repellat voluptatum. Eveniet doloremque voluptatibus provident aut pariatur tempore laudantium. Omnis nam sed et quam temporibus non nobis. Libero omnis nihil et facere sapiente inventore. Fugit exercitationem vero eius deleniti rem.','sunt',0,NULL,'1994-05-12 11:01:06','1972-11-28 20:26:31');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (1,'nobis','2021-09-10 14:18:17','1996-09-25 05:44:16'),(2,'ad','2017-05-27 11:47:58','1982-01-17 06:24:40'),(3,'quis','2017-07-24 12:41:35','2000-10-08 17:25:06'),(4,'ea','1987-03-15 18:53:22','2011-04-03 19:56:21');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint(20) unsigned NOT NULL,
  `to_user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_user_id` (`to_user_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,21,21,'Et officia qui quibusdam eum. Hic debitis sunt quia quia deserunt. Reprehenderit vero ut velit animi sed. Totam sint tenetur enim deleniti facere alias praesentium.','2000-07-29 19:01:07'),(2,22,22,'Perspiciatis provident reprehenderit autem velit sunt harum. Et atque rerum quo aut tempora cum quia eligendi. Vitae aut corporis nobis est alias neque non dignissimos.','2010-01-01 10:26:27'),(3,23,23,'Ipsa incidunt iure blanditiis temporibus minus. Ut suscipit ipsum voluptates ut ea autem. Ratione et nihil aperiam magni nobis saepe.','1997-05-14 03:21:08'),(4,24,24,'Ex recusandae animi harum omnis assumenda atque amet beatae. Sunt et mollitia repellendus illum. Ex et quaerat natus.','1989-02-19 23:56:09'),(5,25,25,'Iste et voluptatem unde sequi. Optio sit quo qui eos ab doloremque rerum qui. Dolorem expedita voluptate nulla in sequi perspiciatis ratione.','1981-06-20 02:23:10'),(6,30,30,'Nihil optio a quas et autem dicta. Quisquam non soluta labore quae assumenda. Rerum sit consequuntur suscipit rem dolores aut.','1976-02-26 06:50:12'),(7,31,31,'Laudantium repellat dicta exercitationem harum. Voluptatem sequi id ipsa et temporibus. Sit magni veritatis nemo quidem voluptatem. Ut autem aut enim voluptatum.','2021-10-18 03:44:04'),(8,32,32,'Velit veritatis culpa qui. Omnis ut unde dolorem. Sunt veniam quam quibusdam harum.','1990-07-16 02:33:13'),(9,34,34,'Et inventore architecto dolore laboriosam. Aut quae sapiente voluptates commodi tempora accusamus. Consequuntur vel quia animi officia. Deserunt rerum et ad.','1980-12-21 01:13:19'),(10,35,35,'Eum sapiente quae perferendis tenetur consequatur voluptatem. Porro consequuntur deserunt repellat quis qui. Est consequatur voluptas expedita perspiciatis et.','2001-12-20 09:04:52'),(11,37,37,'Ex sed quod soluta a incidunt velit officiis. Sint ut ducimus ut odio corrupti voluptas et. Repellendus minima saepe non.','2016-03-31 20:25:35'),(12,38,38,'Harum magni aut magni dicta reprehenderit adipisci inventore temporibus. Ea molestiae doloremque rem architecto veniam neque. Magni consequuntur animi voluptas in culpa reprehenderit fuga. Facere nobis consequatur consequatur consequatur sit.','2021-09-03 02:46:30'),(13,39,39,'Commodi architecto quae tempore at temporibus explicabo. Sunt voluptatibus est iure id adipisci qui amet. Deserunt repudiandae rerum est sit vel magni voluptatem.','1987-02-10 20:22:44'),(14,21,21,'Excepturi rerum consectetur nobis architecto ut quam sint. Sit voluptatem velit ea culpa exercitationem vel. Maiores id aut ab nam nostrum.','1993-10-31 19:26:45'),(15,22,22,'Culpa dolores sit quos nostrum voluptatem sint doloremque. Ea reprehenderit ut consequatur sunt debitis quas a. Et exercitationem et sit enim nemo.','2016-01-29 10:38:00'),(16,23,23,'Quos perspiciatis natus eos et ut. Quia quibusdam deleniti consequatur nihil dolorem quia in mollitia. Excepturi temporibus perferendis ut ut voluptatibus. Itaque et nisi ut praesentium ipsam rerum minus veritatis.','2015-11-19 08:59:26'),(17,24,24,'Harum laborum unde quis sit ipsa natus at quod. Nostrum sunt dolorem deserunt. Aut eligendi qui sed pariatur aut rerum eaque.','2018-12-20 07:59:35'),(18,25,25,'Numquam aut quis asperiores et impedit. Rem ab similique architecto vero iusto facere nemo laborum. Esse deserunt doloremque voluptates necessitatibus porro iure dolores. Ut unde dolores eos.','1984-12-29 12:10:11'),(19,30,30,'Aut nemo a consequuntur fuga assumenda consequatur ullam. Iste et recusandae consequatur nesciunt numquam eum sint. Quis quis culpa eveniet vitae impedit.','1993-10-11 21:46:39'),(20,31,31,'Sed mollitia quas earum quo voluptatem. Fugiat et molestiae qui maxime et assumenda eum. Libero quia possimus dolorum aut exercitationem quis corrupti.','1973-06-11 22:10:18');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_albums`
--

DROP TABLE IF EXISTS `photo_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo_albums` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `photo_albums_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo_albums`
--

LOCK TABLES `photo_albums` WRITE;
/*!40000 ALTER TABLE `photo_albums` DISABLE KEYS */;
INSERT INTO `photo_albums` VALUES (1,'a',21),(2,'rem',22),(3,'totam',23),(4,'atque',24),(5,'enim',25),(6,'quam',30),(7,'qui',31),(8,'temporibus',32),(9,'qui',34),(10,'expedita',35),(11,'aspernatur',37),(12,'aut',38),(13,'accusamus',39),(14,'sequi',21),(15,'aut',22);
/*!40000 ALTER TABLE `photo_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) unsigned DEFAULT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `album_id` (`album_id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `photo_albums` (`id`),
  CONSTRAINT `photos_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10),(11,11,11),(12,12,12),(13,13,13),(14,14,14),(15,15,15),(16,1,16),(17,2,17),(18,3,18),(19,4,19),(20,5,20);
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `gender` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `photo_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `hometown` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (21,NULL,'1979-11-18',1,'1995-09-20 00:04:11',NULL),(22,NULL,'1993-03-27',2,'1984-01-10 07:40:33',NULL),(23,NULL,'2003-07-15',3,'1976-04-17 05:52:20',NULL),(24,NULL,'2006-05-09',4,'2015-08-19 18:53:16',NULL),(25,NULL,'1974-08-03',5,'1972-06-12 16:50:03',NULL),(30,NULL,'2015-02-23',6,'1997-01-30 05:14:12',NULL),(31,NULL,'1976-11-26',7,'1976-05-08 18:24:37',NULL),(32,NULL,'1987-02-06',8,'1977-10-21 01:57:14',NULL),(34,NULL,'1992-04-15',9,'2011-12-29 03:14:47',NULL),(35,NULL,'2014-09-11',10,'1972-07-13 06:37:46',NULL),(37,NULL,'1985-10-23',11,'1981-12-25 08:30:08',NULL),(38,NULL,'1984-12-02',12,'1970-02-19 12:13:47',NULL),(39,NULL,'1996-03-19',13,'1979-09-29 18:11:30',NULL);
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Фамилия',
  `email` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_hash` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `users_firstname_lastname_idx` (`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='юзеры';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (21,'Henriette','Hickle','florine77@example.com','1bb6e56cfc414249967fd52cc8c952aa331f5d55',76),(22,'Angel','Dietrich','wbarrows@example.net','4dd88e92edb3c49b48c5e4563d7a1ab85d018e9e',1),(23,'Meghan','Lubowitz','micheal50@example.org','e9b3a5bb03e84b7e1fe630998605dee85e1cbf74',818),(24,'Ardith','Predovic','rosa57@example.org','f80e283a731479b14c2ea1496dce9619f88a74bd',0),(25,'Myrl','Smith','bergnaum.tatyana@example.org','faeb5b4ae1d4f80ad101ffb6f4c0f09e1784c9b7',613),(30,'Solon','Feil','devante84@example.org','ac537c9ba474f2f4c4f7c0b30479a98dd4f6a82e',458),(31,'Alisa','Koss','corwin.lea@example.com','beb1e46ff335399222205460280e2874424dbf78',4027597930),(32,'Lavina','Becker','lpacocha@example.org','92e99daa566737126485dbe2c052f7b372018297',470944),(34,'Vickie','Gulgowski','dangelo29@example.com','20e8d5f8a6d7c00ff684896d981bf8e2a4cce09f',908651),(35,'Octavia','Turcotte','fquitzon@example.com','5b6243fcc9c9163132aaeb51f78a8ffbdb53fb59',64970),(37,'Jason','Wiza','laury.bashirian@example.org','e46332856358ba846100136dc880e01d01271cc6',393),(38,'Cassandra','Goodwin','uzieme@example.com','be1488a1f040ffe323bb04dc525bcce447979351',9),(39,'Pinkie','Ondricka','rosanna81@example.com','b5ab4181f32c18e3dbe500a8e23210b54e1d70df',60);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_communities`
--

DROP TABLE IF EXISTS `users_communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_communities` (
  `user_id` bigint(20) unsigned NOT NULL,
  `community_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`community_id`),
  KEY `community_id` (`community_id`),
  CONSTRAINT `users_communities_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `users_communities_ibfk_2` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_communities`
--

LOCK TABLES `users_communities` WRITE;
/*!40000 ALTER TABLE `users_communities` DISABLE KEYS */;
INSERT INTO `users_communities` VALUES (21,1),(21,14),(22,2),(22,15),(23,3),(23,16),(24,4),(24,17),(25,5),(25,18),(30,6),(30,19),(31,7),(31,20),(32,8),(34,9),(35,10),(37,11),(38,12),(39,13);
/*!40000 ALTER TABLE `users_communities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-26  0:32:15

