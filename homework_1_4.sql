# Ознакомьтесь более подробно с документацией утилиты mysqldump. Создайте дамп единственной 
# таблицы help_keyword базы данных mysql. Причем добейтесь того, чтобы дамп содержал только 
# первые 100 строк таблицы.
kanykei@kanykei-HP-Pavilion-Laptop-15-eh1xxx:~$ sudo mysqldump -u root -p --opt --where="1 limit 100" mysql help_keyword > hk100.sql
[sudo] password for kanykei: 
Sorry, try again.
[sudo] password for kanykei: 
Sorry, try again.
[sudo] password for kanykei: 
Enter password: 
kanykei@kanykei-HP-Pavilion-Laptop-15-eh1xxx:~$ la -la
total 112
drwxr-x--- 18 kanykei kanykei 4096 июн 12 12:12  .
drwxr-xr-x  3 root    root    4096 май 31 23:21  ..
-rw-------  1 kanykei kanykei 2029 июн 12 10:47  .bash_history
-rw-r--r--  1 kanykei kanykei  220 май 31 23:21  .bash_logout
-rw-r--r--  1 kanykei kanykei 3771 май 31 23:21  .bashrc
drwx------ 16 kanykei kanykei 4096 июн  4 22:40  .cache
drwx------ 17 kanykei kanykei 4096 июн 11 18:02  .config
drwxr-xr-x  2 kanykei kanykei 4096 июн  1 00:24  Desktop
-rw-rw-r--  1 kanykei kanykei  226 июн  4 00:08  Dockerfile
drwxr-xr-x  2 kanykei kanykei 4096 июн  1 00:24  Documents
drwxr-xr-x  3 kanykei kanykei 4096 июн 11 19:05  Downloads
-rw-rw-r--  1 kanykei kanykei 1816 июн 12 12:05  example.sql
drwx------  2 kanykei kanykei 4096 июн  7 17:54  .gnupg
drwxrwxr-x  2 kanykei kanykei 4096 июн  2 21:40  .gphoto
-rw-rw-r--  1 kanykei kanykei 3657 июн 12 12:13  hk100.sql
-rw-------  1 kanykei kanykei   20 июн 12 11:07  .lesshst
drwx------  3 kanykei kanykei 4096 июн  1 00:24  .local
drwxr-xr-x  2 kanykei kanykei 4096 июн  1 00:24  Music
-rw-rw-r--  1 kanykei kanykei   39 июн 12 11:11  .my.cnf
drwxrwxr-x  5 kanykei kanykei 4096 июн  2 20:49 'My files'
-rw-------  1 kanykei kanykei  306 июн 12 12:09  .mysql_history
drwxr-xr-x  2 kanykei kanykei 4096 июн  1 00:24  Pictures
-rw-r--r--  1 kanykei kanykei  807 май 31 23:21  .profile
drwxr-xr-x  2 kanykei kanykei 4096 июн  1 00:24  Public
drwx------  8 kanykei kanykei 4096 июн  5 22:52  snap
drwx------  2 kanykei kanykei 4096 июн  3 21:56  .ssh
-rw-r--r--  1 kanykei kanykei    0 июн  2 20:53  .sudo_as_admin_successful
drwxr-xr-x  2 kanykei kanykei 4096 июн  1 00:24  Templates
drwxr-xr-x  2 kanykei kanykei 4096 июн  1 00:24  Videos
kanykei@kanykei-HP-Pavilion-Laptop-15-eh1xxx:~$ cat hk100.sql 
-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: mysql
-- ------------------------------------------------------
-- Server version	8.0.29-0ubuntu0.22.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `help_keyword`
--

DROP TABLE IF EXISTS `help_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `help_keyword` (
  `help_keyword_id` int unsigned NOT NULL,
  `name` char(64) NOT NULL,
  PRIMARY KEY (`help_keyword_id`),
  UNIQUE KEY `name` (`name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='help keywords';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_keyword`
--
-- WHERE:  1 limit 100

LOCK TABLES `help_keyword` WRITE;
/*!40000 ALTER TABLE `help_keyword` DISABLE KEYS */;
INSERT INTO `help_keyword` VALUES (108,'%'),(264,'&'),(422,'(JSON'),(86,'*'),(84,'+'),(85,'-'),(423,'->'),(425,'->>'),(87,'/'),(75,':='),(59,'<'),(266,'<<'),(58,'<='),(56,'<=>'),(57,'<>'),(55,'='),(61,'>'),(60,'>='),(267,'>>'),(90,'ABS'),(879,'ACCOUNT'),(91,'ACOS'),(659,'ACTION'),(49,'ADD'),(120,'ADDDATE'),(121,'ADDTIME'),(913,'ADMIN'),(270,'AES_DECRYPT'),(271,'AES_ENCRYPT'),(581,'AFTER'),(247,'AGAINST'),(934,'AGGREGATE'),(582,'ALGORITHM'),(721,'ALL'),(50,'ALTER'),(583,'ANALYZE'),(62,'AND'),(526,'ANY_VALUE'),(660,'ARCHIVE'),(254,'ARRAY'),(722,'AS'),(464,'ASC'),(185,'ASCII'),(92,'ASIN'),(774,'ASSIGN_GTIDS_TO_ANONYMOUS_TRANSACTIONS'),(6,'ASYMMETRIC_DECRYPT'),(7,'ASYMMETRIC_DERIVE'),(8,'ASYMMETRIC_ENCRYPT'),(9,'ASYMMETRIC_SIGN'),(10,'ASYMMETRIC_VERIFY'),(643,'AT'),(93,'ATAN'),(94,'ATAN2'),(880,'ATTRIBUTE'),(911,'AUTHENTICATION'),(743,'AUTOCOMMIT'),(584,'AUTOEXTEND_SIZE'),(585,'AUTO_INCREMENT'),(458,'AVG'),(586,'AVG_ROW_LENGTH'),(755,'BACKUP'),(769,'BEFORE'),(744,'BEGIN'),(288,'BENCHMARK'),(63,'BETWEEN'),(186,'BIN'),(253,'BINARY'),(563,'BINLOG'),(527,'BIN_TO_UUID'),(460,'BIT_AND'),(269,'BIT_COUNT'),(187,'BIT_LENGTH'),(461,'BIT_OR'),(462,'BIT_XOR'),(17,'BOOL'),(18,'BOOLEAN'),(230,'BOTH'),(647,'BTREE'),(465,'BY'),(42,'BYTE'),(969,'CACHE'),(689,'CALL'),(497,'CAN_ACCESS_COLUMN'),(498,'CAN_ACCESS_DATABASE'),(499,'CAN_ACCESS_TABLE'),(500,'CAN_ACCESS_USER'),(501,'CAN_ACCESS_VIEW'),(661,'CASCADE'),(76,'CASE'),(255,'CAST'),(860,'CATALOG_NAME'),(95,'CEIL'),(96,'CEILING'),(745,'CHAIN'),(881,'CHALLENGE_RESPONSE'),(587,'CHANGE'),(564,'CHANNEL'),(43,'CHAR'),(39,'CHARACTER'),(189,'CHARACTER_LENGTH');
/*!40000 ALTER TABLE `help_keyword` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-12 12:13:06

