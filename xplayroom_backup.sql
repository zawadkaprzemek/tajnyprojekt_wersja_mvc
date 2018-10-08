-- MySQL dump 10.13  Distrib 5.5.53, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: www
-- ------------------------------------------------------
-- Server version	5.5.53-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_coins`
--

DROP TABLE IF EXISTS `account_coins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_coins` (
  `login` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coins` int(11) NOT NULL,
  PRIMARY KEY (`login`),
  KEY `login` (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_coins`
--

LOCK TABLES `account_coins` WRITE;
/*!40000 ALTER TABLE `account_coins` DISABLE KEYS */;
INSERT INTO `account_coins` VALUES ('1234',400),('Able',400),('ada',400),('akawka',400),('And12',400),('Arunio',400),('banan65',400),('Bartas1708',400),('blacklist',400),('Burasek1234',400),('Duder',400),('Endriu38',400),('Guzzi',400),('jakubbury',400),('Jasiek',400),('Katia85',400),('Konrus9',400),('krzysiek7424',400),('leon',400),('maraxx',400),('marek',400),('Mathewmatt',400),('Motuuur',400),('mpiert',400),('Munrurka11',400),('name',400),('Namieny',400),('oral56',400),('Ostry',400),('Pawel234',400),('popederek',400),('Przytulas69',400),('rafalek',400),('Rafcio',400),('riko',400),('roksi4566',400),('rolas12',400),('ruben',380),('Senator',400),('sexbomba',400),('sffgfd',400),('smokerxx',400),('supermike',400),('Szcze18',400),('Toczek',400),('Tooom',400),('Vakart',400),('wariatuncio',400),('Wgt1975',400),('Wiktorek112233',400),('woja',400),('Wojmar',400);
/*!40000 ALTER TABLE `account_coins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_types`
--

DROP TABLE IF EXISTS `account_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_types`
--

LOCK TABLES `account_types` WRITE;
/*!40000 ALTER TABLE `account_types` DISABLE KEYS */;
INSERT INTO `account_types` VALUES (1,'standard'),(2,'vip');
/*!40000 ALTER TABLE `account_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blocked_users`
--

DROP TABLE IF EXISTS `blocked_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blocked_users` (
  `user_name1` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_name2` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blocked_users`
--

LOCK TABLES `blocked_users` WRITE;
/*!40000 ALTER TABLE `blocked_users` DISABLE KEYS */;
INSERT INTO `blocked_users` VALUES ('ruben','Tequila18','2018-03-16 12:27:03'),('ruben','nimfomanka69','2018-03-16 12:27:13');
/*!40000 ALTER TABLE `blocked_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite_users`
--

DROP TABLE IF EXISTS `favorite_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorite_users` (
  `user_name1` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_name2` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_users`
--

LOCK TABLES `favorite_users` WRITE;
/*!40000 ALTER TABLE `favorite_users` DISABLE KEYS */;
INSERT INTO `favorite_users` VALUES ('ruben','czarodziejka','2017-12-15 13:46:29'),('ruben','Slodkamalolatka','2018-03-16 12:21:31'),('ruben','Lena','2018-03-16 12:21:39'),('ruben','DirtyMaya','2018-03-16 12:27:45'),('ruben','malasyrena','2018-03-16 12:27:57'),('ruben','CherryLady','2018-03-16 12:30:59'),('ruben','KamilaxXx','2018-03-16 12:33:56');
/*!40000 ALTER TABLE `favorite_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_permissions`
--

DROP TABLE IF EXISTS `gallery_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gallery_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gallery_owner` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_permissions`
--

LOCK TABLES `gallery_permissions` WRITE;
/*!40000 ALTER TABLE `gallery_permissions` DISABLE KEYS */;
INSERT INTO `gallery_permissions` VALUES (1,'MissBlack','ruben',1,'2017-12-13 12:05:00'),(2,'czarodziejka','ruben',1,'2017-12-21 13:06:39'),(5,'MalaCzarna88','ruben',1,'2018-03-15 10:19:07'),(6,'Slodkamalolatka','ruben',1,'2018-03-16 12:21:32'),(7,'Lena','ruben',1,'2018-03-16 12:21:40'),(8,'KamilaxXx','ruben',1,'2018-03-16 12:26:06'),(9,'Kinia32','ruben',1,'2018-03-16 12:27:49'),(10,'malasyrena','ruben',1,'2018-03-16 12:27:55'),(11,'CherryLady','ruben',1,'2018-03-16 12:31:00');
/*!40000 ALTER TABLE `gallery_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_from` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `user_to` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `message` mediumtext COLLATE utf8mb4_bin NOT NULL,
  `data_mess` datetime NOT NULL,
  `unread` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,'ruben','slodka','na prawdę jesteś słodka?','2017-12-13 12:14:42',''),(2,'slodka','ruben','chcesz sprawdzić?','2017-12-15 14:56:44',''),(3,'slodka','ruben','hej','2018-02-21 10:51:04',''),(4,'ruben','slodka','hej hej','2018-03-15 10:40:49','');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_to` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_from` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (6,'ruben','MissBlack',2,1,'2017-12-13 12:05:24'),(8,'ruben','czarodziejka',2,1,'2017-12-21 13:40:34'),(13,'MalaCzarna88','ruben',4,1,'2018-03-15 10:19:26'),(14,'ruben','MalaCzarna88',2,1,'2018-03-15 10:19:26'),(15,'Slodkamalolatka','ruben',4,1,'2018-03-16 12:31:48'),(16,'Lena','ruben',4,1,'2018-03-16 12:31:44'),(17,'KamilaxXx','ruben',4,1,'2018-03-16 12:31:40'),(18,'Kinia32','ruben',4,1,'2018-03-16 12:31:42'),(19,'malasyrena','ruben',4,1,'2018-03-16 12:31:46'),(20,'CherryLady','ruben',4,1,'2018-03-16 12:31:31'),(21,'ruben','CherryLady',2,1,'2018-03-16 12:31:31'),(22,'ruben','KamilaxXx',2,1,'2018-03-16 12:31:40'),(23,'ruben','Kinia32',2,1,'2018-03-16 12:31:42'),(24,'ruben','Lena',2,1,'2018-03-16 12:31:44'),(25,'ruben','malasyrena',2,1,'2018-03-16 12:31:46'),(26,'ruben','Slodkamalolatka',2,1,'2018-03-16 12:31:48');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications_types`
--

DROP TABLE IF EXISTS `notifications_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications_types`
--

LOCK TABLES `notifications_types` WRITE;
/*!40000 ALTER TABLE `notifications_types` DISABLE KEYS */;
INSERT INTO `notifications_types` VALUES (1,'gallery_permission_ask'),(2,'gallery_permission_accept'),(3,'gallery_permission_decline'),(4,'gallery_permission_granted'),(5,'gallery_permission_rejected');
/*!40000 ALTER TABLE `notifications_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_status`
--

DROP TABLE IF EXISTS `pay_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_status`
--

LOCK TABLES `pay_status` WRITE;
/*!40000 ALTER TABLE `pay_status` DISABLE KEYS */;
INSERT INTO `pay_status` VALUES (1,'pending'),(2,'done');
/*!40000 ALTER TABLE `pay_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_visit`
--

DROP TABLE IF EXISTS `profile_visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile_visit` (
  `user_name1` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_name2` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` datetime NOT NULL,
  `checked` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_visit`
--

LOCK TABLES `profile_visit` WRITE;
/*!40000 ALTER TABLE `profile_visit` DISABLE KEYS */;
INSERT INTO `profile_visit` VALUES ('ruben','kwiatuszek','2017-12-13 12:16:17','\0'),('ruben','MalaCzarna88','2018-03-20 10:21:42','\0'),('ruben','MissBlack','2018-03-20 10:23:10','\0'),('ruben','slodka','2018-03-16 12:48:42','\0'),('ruben','Sandra','2018-02-27 10:01:32','\0'),('ruben','Nicole','2018-03-15 10:40:14','\0'),('konsultant','MalaCzarna88','2017-12-30 21:22:05','\0'),('slodka','ruben','2017-12-13 12:21:31',''),('konsultant','Patka','2017-12-21 08:42:16','\0'),('ruben','HotBetty','2017-12-13 12:39:07','\0'),('konsultant','OgnistaDaria','2017-12-21 08:42:12','\0'),('konsultant','KocicaXXX','2017-12-15 21:58:59','\0'),('konsultant','MissBlack','2017-12-15 15:25:56','\0'),('konsultant','blondi361','2018-01-15 12:40:24','\0'),('konsultant','Deedeeda','2017-12-15 13:14:05','\0'),('konsultantka','OgnistaDaria','2017-12-13 15:51:46','\0'),('konsultantka','KocicaXXX','2017-12-14 13:16:18','\0'),('ruben','blondi361','2017-12-15 08:07:02','\0'),('konsultantka','hotchocolate','2017-12-14 11:38:36','\0'),('konsultantka','ladyinred','2017-12-13 13:51:50','\0'),('konsultant','Nicole','2017-12-30 21:22:08','\0'),('konsultantka','tygrysek','2017-12-13 16:00:55','\0'),('konsultantka','slicznotka','2017-12-13 15:51:02','\0'),('konsultantka','MalaCzarna88','2017-12-13 15:55:51','\0'),('ruben','OgnistaDaria','2018-03-15 16:22:49','\0'),('konsultantka','CherryLady','2017-12-13 16:03:15','\0'),('ruben','Marika','2017-12-13 16:03:07','\0'),('ruben','KocicaXXX','2018-02-26 13:04:44','\0'),('ruben','luckystar22','2017-12-13 16:03:34','\0'),('ruben','PinkBunny','2018-02-26 13:18:13','\0'),('ruben','Dojrzala45','2018-03-16 12:20:59','\0'),('konsultantka','Sashka','2017-12-14 13:25:26','\0'),('konsultantka','blondi361','2017-12-13 16:27:07','\0'),('konsultantka','singielka','2017-12-14 11:29:38','\0'),('konsultantka','Rudzielec','2017-12-13 16:39:23','\0'),('konsultant','singielka','2017-12-15 22:04:45','\0'),('konsultantka','nimfomanka69','2017-12-13 17:03:15','\0'),('konsultantka','napalOna','2017-12-13 16:44:06','\0'),('konsultantka','LaraSoft','2017-12-13 16:50:09','\0'),('konsultantka','malasyrena','2017-12-13 16:58:57','\0'),('konsultantka','pysiaa','2017-12-14 11:26:56','\0'),('konsultantka','Sandra','2017-12-13 17:17:59','\0'),('konsultantka','Dojrzala45','2017-12-13 17:29:32','\0'),('konsultantka','FemmeFatal','2017-12-13 17:33:16','\0'),('konsultantka','CorpoKicia','2017-12-13 17:38:55','\0'),('konsultantka','Skinnybabe','2017-12-13 17:44:02','\0'),('konsultant','slodka','2017-12-30 21:22:11','\0'),('konsultant','Sandra','2017-12-15 14:59:54','\0'),('konsultant','Marika','2017-12-15 13:20:49','\0'),('konsultant','luckystar22','2017-12-14 07:47:34','\0'),('konsultant','PinkBunny','2017-12-21 08:39:56','\0'),('konsultant','Dojrzala45','2017-12-15 13:11:12','\0'),('konsultant','ladyinred','2017-12-21 08:45:34','\0'),('konsultant','hotchocolate','2017-12-15 21:59:31','\0'),('konsultant','Pati','2017-12-14 07:48:16','\0'),('konsultant','LenaXoXo','2017-12-14 07:48:20','\0'),('konsultant','sweetteen','2017-12-21 08:43:19','\0'),('konsultant','Gosia','2017-12-15 13:16:03','\0'),('konsultant','xLolitax','2017-12-14 07:48:37','\0'),('konsultant','AngelaExclusive','2017-12-14 07:48:40','\0'),('konsultant','Hotbabe','2017-12-21 08:45:42','\0'),('konsultant','Natalia','2017-12-15 22:00:04','\0'),('konsultant','HotBetty','2017-12-15 22:00:08','\0'),('konsultant','Lena','2017-12-15 22:00:16','\0'),('konsultant','Skinnybabe','2017-12-21 08:44:21','\0'),('konsultant','Slodkamalolatka','2017-12-21 08:43:08','\0'),('konsultant','KamilaxXx','2017-12-21 08:40:43','\0'),('konsultant','cudownaAlicja','2017-12-15 13:19:24','\0'),('konsultant','Nikki','2017-12-15 11:02:11','\0'),('konsultant','czarodziejka','2017-12-21 08:45:52','\0'),('konsultant','Milena','2017-12-15 22:02:45','\0'),('konsultant','Candygirl','2017-12-15 13:29:48','\0'),('konsultant','XxXTopModelXxX','2017-12-15 11:02:35','\0'),('konsultant','napalOna','2017-12-21 08:41:21','\0'),('konsultant','Slodziutka','2017-12-15 11:02:23','\0'),('konsultantka','PinkBunny','2017-12-14 11:19:41','\0'),('konsultantka','sloneczko91','2017-12-14 11:29:46','\0'),('konsultantka','Lila','2017-12-14 11:31:02','\0'),('konsultantka','Kruszynka','2017-12-14 11:37:28','\0'),('konsultantka','luckystar22','2017-12-14 11:43:07','\0'),('konsultantka','Czekoladka','2017-12-14 12:33:37','\0'),('konsultantka','skromnisia','2017-12-14 12:39:19','\0'),('konsultantka','Pati','2017-12-14 12:44:33','\0'),('konsultantka','sweetteen','2017-12-14 12:56:12','\0'),('konsultantka','Lena','2017-12-14 12:51:26','\0'),('konsultantka','Cycuszek90','2017-12-14 13:09:24','\0'),('konsultantka','Gosia','2017-12-14 13:10:21','\0'),('konsultantka','Samotna123','2017-12-14 13:22:25','\0'),('konsultantka','AngelaExclusive','2017-12-14 13:33:57','\0'),('konsultantka','Natalia','2017-12-14 13:51:11','\0'),('konsultantka','Slodkamalolatka','2017-12-14 13:57:16','\0'),('konsultantka','KamilaxXx','2017-12-14 13:58:50','\0'),('konsultantka','OnDiet','2017-12-14 14:10:55','\0'),('ruben','pruderyjnabasia','2017-12-15 13:49:10','\0'),('konsultantka','czarnaowca','2017-12-14 14:20:02','\0'),('konsultantka','damakameliowa','2017-12-14 14:22:18','\0'),('konsultantka','niegrzeczna','2017-12-14 14:24:32','\0'),('konsultantka','WikiPrestige','2017-12-14 14:25:01','\0'),('konsultantka','MissBlack','2017-12-14 14:25:52','\0'),('ruben','EmiliaHighClass','2018-02-26 14:13:22','\0'),('ruben','Skinnybabe','2018-03-16 12:21:44','\0'),('ruben','Hotbabe','2018-03-16 12:21:12','\0'),('ruben','YogaFit','2017-12-14 14:39:09','\0'),('ruben','Patka','2017-12-15 13:47:23','\0'),('konsultantka','pruderyjnabasia','2017-12-14 14:50:34','\0'),('konsultantka','kraglaslicznotka','2017-12-14 14:56:28','\0'),('ruben','Natalia','2018-03-16 12:21:12','\0'),('konsultant','lizaczek99','2017-12-15 11:01:30','\0'),('konsultant','SatinSandie','2017-12-15 13:27:46','\0'),('konsultant','Regina','2017-12-15 11:01:59','\0'),('konsultant','SweetSweetDream','2017-12-15 11:02:41','\0'),('konsultant','Roksi82','2017-12-15 11:02:48','\0'),('konsultant','Lwica','2017-12-15 11:03:19','\0'),('konsultant','KoKosanKa','2017-12-15 11:48:33','\0'),('konsultant','Estera','2017-12-15 11:06:09','\0'),('konsultant','pamela','2017-12-15 11:06:14','\0'),('konsultant','Slodkisuteczek','2017-12-15 11:06:30','\0'),('konsultant','Inez','2017-12-15 11:06:38','\0'),('konsultant','seniorka','2017-12-15 11:06:45','\0'),('konsultant','Roza5','2017-12-15 11:06:52','\0'),('konsultant','Tajemnicza','2017-12-15 22:04:02','\0'),('konsultant','sexiOliwia','2017-12-21 08:44:23','\0'),('konsultant','NiegrzecznaZuza','2017-12-15 11:13:06','\0'),('konsultant','Venus','2017-12-21 08:44:14','\0'),('konsultant','BiedroNeczka','2017-12-15 11:13:38','\0'),('konsultant','motylek','2017-12-15 11:13:43','\0'),('konsultant','Afrodyta','2018-01-15 08:21:18','\0'),('konsultant','cuteblondie','2017-12-15 11:13:53','\0'),('konsultant','hellokitty01','2017-12-15 11:13:58','\0'),('konsultant','YogaFit','2017-12-21 08:44:13','\0'),('konsultant','Pantara','2017-12-15 11:14:10','\0'),('konsultant','zelda123','2017-12-15 11:15:26','\0'),('konsultant','DirtyMaya','2017-12-15 11:15:31','\0'),('konsultant','niegrzeczna','2017-12-15 11:15:46','\0'),('konsultant','LovelyChick','2017-12-15 11:15:54','\0'),('konsultant','slicznotka','2017-12-15 11:16:05','\0'),('konsultant','Kinia32','2017-12-21 08:40:45','\0'),('konsultant','tygrysek','2017-12-21 08:44:00','\0'),('konsultant','CherryLady','2017-12-21 08:45:55','\0'),('konsultant','CzarnaMamba','2017-12-15 22:04:16','\0'),('konsultant','Sashka','2017-12-15 12:14:45','\0'),('konsultant','nestorka','2017-12-15 12:36:34','\0'),('konsultant','Rudzielec','2017-12-15 12:38:48','\0'),('ruben','CherryLady','2018-03-16 12:33:58','\0'),('konsultant','LaraSoft','2017-12-15 15:37:52','\0'),('konsultant','malasyrena','2017-12-15 13:08:19','\0'),('konsultant','nimfomanka69','2017-12-15 13:08:25','\0'),('konsultant','OstraSandra','2017-12-21 08:42:17','\0'),('konsultant','FemmeFatal','2017-12-15 13:12:26','\0'),('konsultant','CorpoKicia','2017-12-15 13:15:26','\0'),('konsultant','pysiaa','2017-12-15 13:15:57','\0'),('konsultant','Samotna123','2017-12-15 13:16:17','\0'),('konsultant','Pasikonik','2017-12-15 13:16:23','\0'),('konsultant','Asia','2017-12-15 13:24:09','\0'),('konsultant','OnDiet','2017-12-15 13:24:14','\0'),('konsultant','Klarita','2017-12-15 13:24:21','\0'),('konsultant','Thaliah','2017-12-15 13:24:26','\0'),('konsultant','Monika','2017-12-15 13:25:59','\0'),('konsultant','wiernazona','2017-12-15 13:26:09','\0'),('konsultant','Agness','2017-12-15 13:26:14','\0'),('konsultant','Blondyneczka','2017-12-15 13:27:32','\0'),('konsultant','Kedziorka','2017-12-15 13:28:27','\0'),('konsultant','Anioleczek','2017-12-15 13:30:26','\0'),('konsultant','Niewinnaaa','2017-12-21 08:41:25','\0'),('konsultant','fetyszystka','2017-12-21 08:45:44','\0'),('konsultant','SexyMama','2017-12-15 13:33:04','\0'),('konsultant','Slowianka91','2017-12-15 13:34:08','\0'),('konsultant','Tequila18','2017-12-21 08:43:21','\0'),('konsultant','OstraChilli','2017-12-15 13:36:30','\0'),('konsultant','Cnotka','2017-12-15 13:37:31','\0'),('konsultant','pruderyjnabasia','2017-12-21 08:42:20','\0'),('konsultant','SowA','2017-12-15 13:40:25','\0'),('ruben','Slowianka91','2017-12-15 14:36:11','\0'),('ruben','hotchocolate','2018-03-16 12:20:57','\0'),('ruben','Slodkamalolatka','2018-03-20 10:21:53','\0'),('ruben','KamilaxXx','2018-03-20 10:22:14','\0'),('ruben','czarodziejka','2018-03-20 10:23:17','\0'),('ruben','Tequila18','2018-03-16 12:26:41','\0'),('ruben','CzarnaMamba','2017-12-15 13:47:01','\0'),('ruben','Klarita','2017-12-15 13:47:18','\0'),('ruben','lizaczek99','2018-03-16 12:30:28','\0'),('ruben','Katy','2018-03-16 12:30:39','\0'),('ruben','sweetteen','2017-12-15 13:48:23','\0'),('ruben','Nikki','2017-12-15 13:48:49','\0'),('ruben','SowA','2017-12-15 13:52:52','\0'),('ruben','Cnotka','2017-12-21 08:28:34','\0'),('ruben','OstraChilli','2017-12-15 14:05:11','\0'),('ruben','OstraSandra','2018-03-16 12:25:48','\0'),('konsultant','EmiliaHighClass','2017-12-15 22:01:16','\0'),('konsultant','Czekoladka','2017-12-15 22:03:36','\0'),('konsultant','kiciamigocia','2017-12-21 08:45:37','\0'),('konsultant','Kruszynka','2017-12-21 08:45:33','\0'),('konsultant','sloneczko91','2017-12-15 22:05:10','\0'),('konsultant','damakameliowa','2017-12-15 22:05:18','\0'),('konsultant','Katy','2017-12-21 08:45:40','\0'),('konsultant','MiniMini','2017-12-21 08:45:28','\0'),('konsultant','NeedForSex','2017-12-21 08:41:23','\0'),('konsultant','WikiPrestige','2017-12-21 08:43:59','\0'),('ruben','MiniMini','2017-12-21 14:11:58','\0'),('ruben','Pati','2018-02-26 14:13:05','\0'),('ruben','xLolitax','2018-03-16 12:21:08','\0'),('ruben','DirtyMaya','2018-03-16 12:27:28','\0'),('ruben','Kinia32','2018-03-20 10:22:10','\0'),('ruben','SexyMama','2018-03-02 10:07:14','\0'),('ruben','sexiOliwia','2018-03-16 12:20:27','\0'),('ruben','Lena','2018-03-20 10:22:06','\0'),('ruben','Venus','2018-03-16 12:25:47','\0'),('ruben','NiegrzecznaZuza','2018-03-16 12:25:52','\0'),('ruben','Roza5','2018-03-16 12:26:46','\0'),('ruben','nimfomanka69','2018-03-16 12:26:54','\0'),('ruben','napalOna','2018-03-16 12:26:55','\0'),('ruben','malasyrena','2018-03-20 10:21:57','\0'),('ruben','SatinSandie','2018-03-16 12:28:01','\0'),('ruben','Kruszynka','2018-03-16 12:28:05','\0'),('ruben','KoKosanKa','2018-03-16 12:28:10','\0');
/*!40000 ALTER TABLE `profile_visit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(12) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `account_type` int(11) NOT NULL DEFAULT '1',
  `activate` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=181 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'konsultant','konsultant@bpo.com','ff0905eed4fb72f14917a5382219d7bb','super_admin',2,1),(3,'konsultantka','konsultantka@bpo.com','be975a2f38074fbb6d55d7adde9682c1','super_admin',2,1),(5,'ruben','ruben@gmail.com','e384fc93e4323257ad0b592c04212b4e','user',1,1),(7,'Wiktorek112233','Marta200684@wp.pl','8a73a229f2d42d647760ec3241aff69a','user',1,0),(8,'rolas12','Zbyszek0206@wp.pl','0b9a4e3c24d4fea21510984a526d018a','user',1,0),(9,'Jasiek','jakismail@o2.pl','9e38e8d688743e0d07d669a1fcbcd35b','user',1,0),(10,'Tooom','tomaszwolodko1973@gmail.com','958ad825fb2197aa760f65ca536f6360','user',1,0),(11,'Wojmar','Szybkichtrzech@gmail.com','75187abe463900c22046c56559fe841e','user',1,0),(12,'Endriu38','FRYDA-2004@WP.PL','29892c484b22b1fc86fbf86b721e11b1','user',1,0),(13,'Mathewmatt','hgfgjknfg@wp.pl','4582c9b459314e4435a37164f3341f98','user',1,0),(14,'smokerxx','smokerxx@wp.pl','b29d334d2c2f14e5930555ab2b04947c','user',1,0),(15,'Guzzi','guzzi1000@wp.pl','6b63be8dfe51848e5461b6f1c6650b89','user',1,0),(16,'leon','leon3797@wp.pl','e250f39ebb026e0577a67d4f633709f5','user',1,0),(17,'krzysiek7424','tomi24.74@o2.pl','b1f0c5c94fb48455826d7f097ef62526','user',1,0),(18,'Motuuur','motuuur@op.pl','ef4ff949bf590f58a821afe456133761','user',1,0),(19,'Toczek','tkamil41234@gmail.com','1c5c79cb6c1f1ee9384037c2d6fddf68','user',1,0),(20,'Namieny','bubus.n1@wp.pl','71feefde055e4f7677390ef402316c72','user',1,0),(21,'Rafcio','rafalekgierko@o2.pl','cb432249c1588b62e940d621f3899f6b','user',1,0),(22,'Able','cremic@op.pl','b92502acf5b2c808594dd7f5735f1489','user',1,0),(23,'ada','artur19adam@wp.eu','964225f126a40477930bcf922fdb0c64','user',1,0),(24,'And12','andrzej0981998@wp.pl','efc7a8a32ce9961ea29b432e069084f1','user',1,0),(25,'Vakart','darnokvakart@gmail.com','c2e6324f04b2c2f37dec41b3f9aa5807','user',1,0),(26,'Ostry','Jan11-90@wp.pl','22d0d9f6172f185bb95f91bedf0f189a','user',1,0),(27,'Szcze18','szczepan.formella@wp.pl','d1312d37d48d1d8fd73e5806c8035985','user',1,0),(28,'maraxx','ratmarc106@gmail.com','2eb51ccd34e5a01052bdeca8d8b904d3','user',1,0),(29,'MalaCzarna88','MalaCzarna88@fmail.com','71e06d621ae3d1915b4cb83483c867cf','fake',2,1),(30,'Duder','Jasmin24h@onet.pl','b7a07e9e84c8b770a6aab62d34c79620','user',1,0),(31,'Nicole','Nicole@fmail.com','07d231cf1138663df023b1bc8a8c6b83','fake',2,1),(32,'slodka','slodka@fmail.com','39fac791406ba7cbf60866b39188855e','fake',2,1),(33,'OgnistaDaria','OgnistaDaria@fmail.com','ecdb3af2d867dfbaa210a0f3db29d96e','fake',2,1),(34,'blondi361','blondi361@fmail.com','7490ded0265e865d8402ad120f62051c','fake',2,1),(35,'Sandra','Sandra@fmail.com','ac5b0772ca8894cc4de36e71a649f507','fake',2,1),(36,'jakubbury','jakubbury@onet.pl','deb0ad05643f7d618b7bad6a548bf290','user',1,0),(37,'Marika','Marika@fmail.com','0586258fa46ab1508e4598a615cd8037','fake',2,1),(38,'sexiOliwia','sexiOliwia@fmail.com','238ad77c517feff3d6c41ccdaf26f774','fake',2,1),(39,'Przytulas69','mateo997997@wp.pl','6c547bbd14041e76e6f6f932540405e8','user',1,0),(40,'Burasek1234','ursus.bury@gmail.com','4793a8c96ab8de970c97e1c573e7b216','user',1,0),(41,'KocicaXXX','KocicaXXX@fmail.com','d8a2b3ba84b2488e25ab7bbce908116b','fake',2,1),(42,'MissBlack','MissBlack@fmail.com','0842172ea287d4c50d99a6c529f99bbe','fake',2,1),(43,'luckystar22','luckystar22@fmail.com','e79eb3c8ddff1c1e1949f01c1bfaf706','fake',2,1),(44,'PinkBunny','PinkBunny@fmail.com','0f9ed8408fea34b8832e0198a4582686','fake',2,1),(45,'Dojrzala45','Dojrzala45@fmail.com','40df7d0be07d8d243193d03919618516','fake',2,1),(46,'ladyinred','ladyinred@fmail.com','edd73c3a5b5100ffece767858813528e','fake',2,1),(47,'popederek','to41@o2.pl','b13f17e19a369229640c8fd01543e32e','user',1,0),(48,'supermike','namiot4@wp.pl','b15e4e0677d610334cce2b9c8d07ca2e','user',1,0),(49,'rafalek','rsconstruction715@gmail.com','6ba3905a4566293d2bb4e2a51db44301','user',1,0),(50,'Pawel234','jan.jezierski88@vip.onet.pl','f8a6f5ff3735285a1df0481b45540d39','user',1,0),(51,'Senator','pimawi@interia.pl','45261aa7c6896216d7b824345cb5256a','user',1,0),(52,'Konrus9','konrus9@gmail.com','88916e16fbcf355d0f0d0b0af9e9e6b9','user',1,0),(53,'roksi4566','roksana.lezba@interia.pl','5fbbbbcc1371008ffe4fb3067a5a2462','user',1,0),(54,'riko','RoberttoZ@interia.com.pl','ef1c1144bf18660aba67f6965430954f','user',1,0),(55,'Munrurka11','Wojtek.hac@onet.pl','bea84cefc6acb4620eb4ce3a9824bae3','user',1,0),(56,'sexbomba','gawlikkamil@wp.pl','a99827757578908df68ef4956d6ee9df','user',1,0),(57,'Wgt1975','Grzegorztyminski2@gmail.com','d4d63b31bb0f5c67f20414cc23abad62','user',1,0),(58,'banan65','banan1165@o2.pl','a5da570988fc74102ccee86546574099','user',1,0),(59,'mpiert','mpiert@wp.pl','e7ca855bf0e3f099f97df8ae5775830b','user',1,0),(60,'oral56','wernus56@o2.pl','4268dd28b3c2ad264d0e4eb02bfcc915','user',1,0),(61,'Bartas1708','januszsamiec@onet.pl','d923dbbca2e17f84d08f6a5f3b673773','user',1,0),(62,'marek','pppppppppp-90@wp.pl','81f696b1b41e5004b9614cfc64c79e63','user',1,0),(63,'woja','woja-sz@wp.pl','e9fa141e0e2be5c3b9c643505388ba61','user',1,0),(64,'wariatuncio','login5525@wp.pl','12c241aed7db0d0d0451b64cc64f04a6','user',1,0),(65,'hotchocolate','hotchocolate@fmail.com','9f1548569f158cf2a8f5f025e16a2b56','fake',2,1),(66,'Pati','Pati@fmail.com','ef58e30cf177fea224ec5ac1c0774ddc','fake',2,1),(67,'LenaXoXo','LenaXoXo@fmail.com','5d2ca739f785299097f9e43bd2444d03','fake',2,1),(68,'sweetteen','sweetteen@fmail.com','9f47d67788bc823b36bc11420fee2d39','fake',2,1),(69,'Gosia','Gosia@fmail.com','8bf6173145578cf0d7b7794141c2729c','fake',2,1),(70,'xLolitax','xLolitax@fmail.com','a00b32ae81519ac4430a3a9a249cc0bf','fake',2,1),(71,'AngelaExclusive','AngelaExclusive@fmail.com','60d8fa40d43f1dcf0b753189ce2cd319','fake',2,1),(72,'Hotbabe','Hotbabe@fmail.com','415e6c09d031c60c1b0f81f2a2a49533','fake',2,1),(73,'Katia85','abcbcq@gmail.com','68deba8925c41aa0c43af3d81a40370b','user',1,0),(74,'Natalia','Natalia@fmail.com','3283afa1a171bcae8244afbc6ee751ec','fake',2,1),(75,'HotBetty','HotBetty@fmail.com','f98198db19d7fa9d99fba6eebec5f4e0','fake',2,1),(76,'Lena','Lena@fmail.com','fbc2ed0e345d0eca86607c13501a6eb9','fake',2,1),(77,'Skinnybabe','Skinnybabe@fmail.com','cdbc13ef8c41172e55d151331d09f3f6','fake',2,1),(78,'Slodkamalolatka','Slodkamalolatka@fmail.com','9ae4a6b4acf0d329cf72d21fa0a3761a','fake',2,1),(79,'EmiliaHighClass','EmiliaHighClass@fmail.com','07f27b16167d1182137af462edc670d5','fake',2,1),(80,'1234','kaczor@donald.pl','bf709005906087dc1256bb4449d8774d','user',1,0),(81,'KamilaxXx','KamilaxXx@fmail.com','4e03778dd882ab4a2dfb03f8741f0fbf','fake',2,1),(82,'cudownaAlicja','cudownaAlicja@fmail.com','5895d18108841398c756ed507e13788f','fake',2,1),(83,'Nikki','Nikki@fmail.com','d507076fe6a558647150d013cc58499c','fake',2,1),(84,'WikiPrestige','WikiPrestige@fmail.com','7420d1df7c2a8ea9251ad64e88ead19e','fake',2,1),(85,'Asia','Asia@fmail.com','356f834d721e5b66997753ba170bb8e5','fake',2,1),(86,'OstraSandra','OstraSandra@fmail.com','64fd48df79054252ccfbf7af4aeab577','fake',2,1),(87,'Venus','Venus@fmail.com','c63b215d45cb1ccd6bac6d77783f3b2b','fake',2,1),(88,'Inez','Inez@fmail.com','8c4da5398d3df9b4b22c9ab8bcf555c6','fake',2,1),(89,'NiegrzecznaZuza','NiegrzecznaZuza@fmail.com','1811ab5cb8309fbd7d696f5203aeabc2','fake',2,1),(90,'Monika','Monika@fmail.com','34d69568e95f1286a9f99edb34940430','fake',2,1),(91,'czarodziejka','czarodziejka@fmail.com','531fcc6adb4ecdfdea814bd3ffc053ed','fake',2,1),(92,'kraglaslicznotka','kraglaslicznotka@fmail.com','650c7c44289d1d7e0dd37d85cdb4d531','fake',2,1),(93,'Milena','Milena@fmail.com','6c60202918e50d662dc1a56a79c8101b','fake',2,1),(94,'Candygirl','Candygirl@fmail.com','bdd3a141e85a296cd23d33262b3fcc23','fake',2,1),(95,'Anioleczek','Anioleczek@fmail.com','e43217f2e505e3702d0676e794f24f85','fake',2,1),(96,'Roksi82','Roksi82@fmail.com','6f740ba0664c046641f1e96b9bbc5a32','fake',2,1),(97,'Agness','Agness@fmail.com','c8b9467e1740e6bf642e7f0c428a62db','fake',2,1),(98,'SexyMama','SexyMama@fmail.com','c3b5cde1771ecff0b79fec94aaf190a4','fake',2,1),(99,'Tequila18','Tequila18@fmail.com','25dae7a7716ce9acdf42c459fbca54e9','fake',2,1),(100,'XxXTopModelXxX','XxXTopModelXxX@fmail.com','fbc42960cfe858fea17dda64d0d79135','fake',2,1),(101,'YogaFit','YogaFit@fmail.com','046a6c159922578f7749a749e0aa2c13','fake',2,1),(102,'Niewinnaaa','Niewinnaaa@fmail.com','a0618cd78118cac145ff908c61d6ab8e','fake',2,1),(103,'Roza5','Roza5@fmail.com','cfca2b0c88a8963e9622acbb27c08939','fake',2,1),(104,'TrueDiamond','TrueDiamond@fmail.com','b8e3bc5ab1d0beed0380d16ca149c96e','fake',2,1),(105,'Samotna123','Samotna123@fmail.com','ca5398808332b2c5674e76ecdefcbcd7','fake',2,1),(106,'Blondyneczka','Blondyneczka@fmail.com','57c2524088a3773caae73cdbb1074f7a','fake',2,1),(107,'Cycuszek90','Cycuszek90@fmail.com','681f82be1c055a1affc2c95fbfcf2d52','fake',2,1),(108,'fetyszystka','fetyszystka@fmail.com','79949bf8bc7fe69876fff2ac63c0127b','fake',2,1),(109,'Regina','Regina@fmail.com','ee5d4c03c9ef7d661a0e44686470e03a','fake',2,1),(110,'SowA','SowA@fmail.com','eabcb91f1d58fd2351d7a7ad3cabb0b0','fake',2,1),(111,'MiniMini','MiniMini@fmail.com','27279f79ffc71a22eeb80c77fc92d565','fake',2,1),(112,'CorpoKicia','CorpoKicia@fmail.com','dc049009c26d1d0b74a76d6353fbbabd','fake',2,1),(113,'OnDiet','OnDiet@fmail.com','9d0078fd4835c6b8dc0181fae3797019','fake',2,1),(114,'napalOna','napalOna@fmail.com','0a0117428127ef544af433b7e929ab3e','fake',2,1),(115,'nimfomanka69','nimfomanka69@fmail.com','75066e5f612468883f7cdaa6411aa025','fake',2,1),(116,'FemmeFatal','FemmeFatal@fmail.com','39de868206f0fa94f2f0c8a31d6d30f4','fake',2,1),(117,'Lwica','Lwica@fmail.com','23ead00d22694154fbc943972e753e5d','fake',2,1),(118,'Slowianka91','Slowianka91@fmail.com','e5fb3bcd9f1daa53916cdb126ae8ea24','fake',2,1),(119,'sugarbaby','sugarbaby@fmail.com','212e25d6587911d8f1378c8fc478a880','fake',2,1),(120,'DirtyMaya','DirtyMaya@fmail.com','c8bbc24d175ac33ee1bafaae584daef9','fake',2,1),(121,'Czekoladka','Czekoladka@fmail.com','9aaf84db03a7cb44ebb16cc9ee26167e','fake',2,1),(122,'Pantara','Pantara@fmail.com','d75c4c5694a4c8a79622c21de4a2c7b1','fake',2,1),(123,'Niesmiala','Niesmiala@fmail.com','71cb68a1f592e8fedbfa9e263c414d3e','fake',2,1),(124,'Kinia32','Kinia32@fmail.com','c28edcf27b8e292eb7a343bb6a6a98ac','fake',2,1),(125,'Tajemnicza','Tajemnicza@fmail.com','a8fab56c89f32ac1848fe7f07155f9cd','fake',2,1),(126,'NeedForSex','NeedForSex@fmail.com','bd2ed447d713f9d1d3dc74fb2ae505ff','fake',2,1),(127,'Sashka','Sashka@fmail.com','e3abeca1aa2e3d6f0ef7b3b16036f3f6','fake',2,1),(128,'Afrodyta','Afrodyta@fmail.com','3b70fdcb56e2d7c19698d3e2628175b6','fake',2,1),(129,'OstraChilli','OstraChilli@fmail.com','e95819fce10db65edf441bcc69de428b','fake',2,1),(130,'Slodziutka','Slodziutka@fmail.com','778ab56f9e5ba66b9c59d181622eb9c3','fake',2,1),(131,'Cnotka','Cnotka@fmail.com','ddaf660f7261276e527c841fa95511f9','fake',2,1),(132,'CzarnaMamba','CzarnaMamba@fmail.com','ad2b465bf4e9efe987740f032bed7fa3','fake',2,1),(133,'LovelyChick','LovelyChick@fmail.com','eec8db13a70744336eed9ffcc5cc5c0c','fake',2,1),(134,'wiernazona','wiernazona@fmail.com','962e1a29c3b5aec0a3f6263b2a2a5c79','fake',2,1),(135,'slicznotka','slicznotka@fmail.com','3973e44b94662e8448432d651774257d','fake',2,1),(136,'niegrzeczna','niegrzeczna@fmail.com','eca4cdab6737896fe0c55d3cdec15ef0','fake',2,1),(137,'Arunio','Ark_sul@wp.pl','272c6e4761e21f08b74086d536c9166d','user',1,0),(138,'motylek','motylek@fmail.com','dca201ec5708fccf8361434aa03865b8','fake',2,1),(139,'malasyrena','malasyrena@fmail.com','c24ba56e9c2d35b8ecd824191dcc3d09','fake',2,1),(140,'kiciamigocia','kiciamigocia@fmail.com','535c6090757386568ccf8b1195508e35','fake',2,1),(141,'singielka','singielka@fmail.com','f7e67b520416f19f635d429e6131419f','fake',2,1),(142,'skromnisia','skromnisia@fmail.com','fe9ef5bc70b8c77f5e68a61d609f1801','fake',2,1),(143,'Kaya','Kaya@fmail.com','3e91d67b64e50194800f35d09b3bfd03','fake',2,1),(144,'SatinSandie','SatinSandie@fmail.com','b5e438e0924907d1eef342bd79a080dc','fake',2,1),(145,'BiedroNeczka','BiedroNeczka@fmail.com','7dd026aa72ff6f80ce588a45d2375849','fake',2,1),(146,'szakira','szakira@fmail.com','40c4f8f03a68e6ab5e6c82be44349054','fake',2,1),(147,'czarnaowca','czarnaowca@fmail.com','00c091678dda3bc3ae0be185621486f9','fake',2,1),(148,'Kruszynka','Kruszynka@fmail.com','664dde7a622f85dad59cbbc1eece0fdc','fake',2,1),(149,'sloneczko91','sloneczko91@fmail.com','edef5c5daf0fd59b933f16b31d72ea61','fake',2,1),(150,'cuteblondie','cuteblondie@fmail.com','59ff73cdfd5ca533ba9364267c2a3eae','fake',2,1),(151,'damakameliowa','damakameliowa@fmail.com','23eb1eaa94b958cf3a3a469bef9b11e2','fake',2,1),(152,'zelda123','zelda123@fmail.com','643adbe0b63fbc0e879f23f278d47f55','fake',2,1),(153,'KoKosanKa','KoKosanKa@fmail.com','4ad353ed8ea4a8a39c6527a35aad3ee5','fake',2,1),(154,'Kedziorka','Kedziorka@fmail.com','939498245034c723cc3804cebdb8723c','fake',2,1),(155,'CherryLady','CherryLady@fmail.com','b753375dcb056a777def6e1342221c5d','fake',2,1),(156,'Pasikonik','Pasikonik@fmail.com','9ebc94e379eb8d721876f46ba5bd49ba','fake',2,1),(157,'tygrysek','tygrysek@fmail.com','0d3bfb31ea7b1882177f04b9e141533c','fake',2,1),(158,'Klarita','Klarita@fmail.com','72a7bd6232272f25091a70fa478afcb9','fake',2,1),(159,'hellokitty01','hellokitty01@fmail.com','19f513a345e40cbfcb7a6f9ebe69020f','fake',2,1),(160,'seniorka','seniorka@fmail.com','dc5e33f4ee52f0b6c35045b03fa94e7a','fake',2,1),(161,'pamela','pamela@fmail.com','26985d5ab91cc478d55b3651ac791006','fake',2,1),(162,'nestorka','nestorka@fmail.com','c4458b458f2bd98b5fc3519ea4f8247c','fake',2,1),(163,'Slodkisuteczek','Slodkisuteczek@fmail.com','c31d8d85d7a58e2af75f16429aa2669f','fake',2,1),(164,'Rudzielec','Rudzielec@fmail.com','0bbcb9b5abdf546fbcfc5bbe71e959f8','fake',2,1),(165,'LaraSoft','LaraSoft@fmail.com','8bff0bc4bc4995ec6d54dd89e27c0e6c','fake',2,1),(166,'Estera','Estera@fmail.com','97a31ed66240dbb10103cc90380f4e26','fake',2,1),(167,'lizaczek99','lizaczek99@fmail.com','1b52064d729bc61966e44d72c017dc4c','fake',2,1),(168,'Patka','Patka@fmail.com','71f544ed94530fc93ef0e03efaaa5453','fake',2,1),(169,'Thaliah','Thaliah@fmail.com','bf1b2823d50b6d3f23f8355d42233a4b','fake',2,1),(170,'Nimfa','Nimfa@fmail.com','68a304b971b13369744bd8294d346ebd','fake',2,1),(171,'pysiaa','pysiaa@fmail.com','53f6a9339d2ddfffcafd15cd8978036e','fake',2,1),(172,'pruderyjnabasia','pruderyjnabasia@fmail.com','82c1277320f6f8df5a48f678d62a449b','fake',2,1),(173,'SweetSweetDream','SweetSweetDream@fmail.com','428f3988815465ab1e7f1c5c66587401','fake',2,1),(174,'Deedeeda','Deedeeda@fmail.com','2deded6b002f5916ceb8529f86260600','fake',2,1),(175,'Lila','Lila@fmail.com','ce54dab030bf3fd5c09e366c6ae0b3c0','fake',2,1),(176,'Katy','Katy@fmail.com','7df6edd20749618ca201a2751fbed526','fake',2,1),(177,'name','example@example.com','5f4dcc3b5aa765d61d8327deb882cf99','user',1,0),(178,'akawka','akawka@mail.com','70bb9e0b4a07e8ee00274d2fdd59403b','user',1,0),(179,'blacklist','jan.kowalski@onet.test.com','25d55ad283aa400af464c76d713c07ad','user',1,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_info`
--

DROP TABLE IF EXISTS `users_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_info` (
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `age` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `avatar` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `state` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `info` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `date_birth` date DEFAULT NULL,
  PRIMARY KEY (`user_name`),
  KEY `user_name` (`user_name`),
  KEY `user_name_2` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_info`
--

LOCK TABLES `users_info` WRITE;
/*!40000 ALTER TABLE `users_info` DISABLE KEYS */;
INSERT INTO `users_info` VALUES ('Afrodyta','20 lat','Afrodyta.png','wolna','Interesuje mnie tylko nietypowy seks. Może dlatego jestem samotna? Do tej pory żaden chłopak nie podołał moim fantazjom. Rówieśnicy interesują się tylko szybkimi numerkami, a ja chcę przygody. Czekam na odważnych facetów, najlepiej starszych o kilka lat.','w',NULL),('Agness','23 lata','Agness.png','w związku','Pełna wdzięku młoda kobieta o wielu talentach. Sprawdź, co potrafię! ;)','w',NULL),('AngelaExclusive','26 lat','AngelaExclusive.png','wolna','Pragnę bliskości i ciepła, nie lubię być sama... Jeśli czujesz podobnie napisz do mnie - razem na pewno coś wymyślimy ;)','w',NULL),('Anioleczek','25 lat','Anioleczek.png','mężatka','Potrzebuję czułości i bliskości, aktualnie bardzo mi tego brakuje... Może Ty mi je podarujesz?','w',NULL),('Asia','27 lat','Asia.png','wolna','Nie jestem taka jak inne... ;) skrywam pewną tajemnicę. Jesteś gotów, by ją poznać?','w',NULL),('BiedroNeczka','19 lat','BiedroNeczka.png','wolna','Marzę o karierze w modelingu. Uważam, że mam co pokazać. Uwielbiam się pieścić i kręci mnie, gdy ktoś na to patrzy. Jeśli zasłużysz, może będziesz mógł mi towarzyszyć...','w',NULL),('blondi361','20 lat','blondi361.png','wolna','Cześć:) jestem młodą, zgrabną dziewczyną o dużym temperamencie... Lubię zdecydowanych i pewnych siebie mężczyzn, którzy wiedzą, czego chcą. Chcesz mnie lepiej poznać? Napisz! Czekam na Ciebie...;)','w',NULL),('Blondyneczka','38 lat','Blondyneczka.png','Mężatka','Chodzi mi po głowie zdrada... Uwielbiam dreszczyk emocji!','w',NULL),('Candygirl','19 lat','Candygirl.png','w związku','Żyję chwilą, chętnie próbuję nowych rzeczy i mam głowę pełną pomysłów. Może zaszalejemy razem?','w',NULL),('CherryLady','28 lat','CherryLady.png','wolna','Nie szukam związku ani szybkiego seksu... Od mężczyzn wymagam ogłady. Chętnie dam się zaprosić na randkę do kina lub na kolację. A potem... kto wie... ;)','w',NULL),('Cnotka','18 lat','Cnotka.png','wolna','Niedawno straciłam dziewictwo, nie mam doświadczenia... Potrzebuję nauczyciela','w',NULL),('CorpoKicia','34 lata','CorpoKicia.png','Mężatka','Zależy mi na dyskrecji - szybkie numerki w przerwie na lunch to coś dla mnie','w',NULL),('cudownaAlicja','23 lata','cudownaAlicja.png','wolna','Atrakcyjna studentka z głową pełną pomysłów ;)','w',NULL),('cuteblondie','25 lat','cuteblondie.png','wolna','Witam na moim profilu! Niedawno przeprowadziłam ze wsi do dużego miasta i czuję się strasznie samotna. Nie ma z kim pogadać, z kimś wyjść... Nawet nie znam ciekawych miejsc! Chętnie poznam namiętnego przewodnika, który odkryje przede mną nie tylko sekrety miasta, ale także sekrety eleganckiego seksu :)','w',NULL),('Cycuszek90','27 lat','Cycuszek90.png','Panna','Mam krągłości i jestem z nich dumna! Mogę je pieścić cały dzień. Może mi pomożesz?','w',NULL),('CzarnaMamba','27 lat','CzarnaMamba.png','wolna','Rozstałam się z chłopakiem. Nie spełniał moich oczekiwań w łóżku... Teraz czekam na kogoś, kto ma podobne potrzeby','w',NULL),('czarnaowca','18 lat','czarnaowca.png','wolna','Wybieram się na studia medyczne i potrzebuję korepetycji z anatomii, zwłaszcza męskiej. Jacyś chętni? :D','w',NULL),('czarodziejka','29 lat','czarodziejka.png','wolna','Mam ukryty talent: potrafię oczarować mężczyzn i sprawić, że zapomną o rzeczywistości...','w',NULL),('Czekoladka','20 lat','Czekoladka.png','wolna','Pochodzę z Hiszpanii i mam naprawdę ognisty temperament ;)','w',NULL),('damakameliowa','34 lata','damakameliowa.png','wolna','Jestem nieustępliwa, lubię rządzić w łóżku. W mojej sypialni znajdziesz pejcze, kajdanki i wiele innych akcesoriów. Masz odwagę zmierzyć się mną?','w',NULL),('Deedeeda','18 lat','Deedeeda.png','wolna','Niedługo matura przede mną. Dużo czasu spędzam nad książkami i chcę się trochę rozerwać :) Moi znajomi też zakuwają, więc nie mam z kim wychodzić. Interesuję się muzyką, fizyką i chemią - chętnie popiszę o tych i innych tematach :)','w',NULL),('DirtyMaya','24 lata','DirtyMaya.png','zaręczona','Niedługo wychodzę za mąż i chcę po raz ostatni spróbować czego nowego. To moja ostatnia szansa!','w',NULL),('Dojrzala45','43 lata','Dojrzala45.png','mężatka','Jestem doświadczoną kobietą, która szuka urozmaicenia i pragnie nowych doznań.','w',NULL),('EmiliaHighClass','29 lat','EmiliaHighClass.png','mężatka','Czuła, namiętna, wyrafinowana, z dużą wyobraźnią...','w',NULL),('Estera','27 lat','Estera.png','wolna','Witam! Prowadzę własny gabinet kosmetyczny i robię to, co kocham. Niewielu ludzi może to o sobie powiedzieć. Do szczęścia brakuje mi tylko kogoś, kto zrozumie moje łóżkowe potrzeby. Nie ukrywam, że głównie po to założyłam profil. Zależy mi na dobrym seksie i zgraniu w łóżku. Co lubię? Napisz, to się dowiesz...','w',NULL),('FemmeFatal','26 lat','FemmeFatal.png','Panna','Takie piersi nie mogą się marnować... Zajmiesz się nimi?','w',NULL),('fetyszystka','32 lata','fetyszystka.png','Panna','Uwielbiam pieszczenie stópek, szpilki, pończochy, rajstopy... Zerwij je ze mnie','w',NULL),('Gosia','42 lata','Gosia.png','mężatka','Jestem dojrzałą i doświadczoną kobietą, która dobrze wie, czego chce.','w',NULL),('hellokitty01','24 lata','hellokitty01.png','wolna','Na co dzień jestem psychologiem. Po pracy mam dość problemów, chcę się rozerwać. Może to nietypowy sposób i nie wypada, żeby Pani Doktor robiła \"takie rzeczy\", ale muszę coś robić, żeby nie oszaleć ;) A dobry seks to najlepszy antydepresant, o jakim słyszałam.','w',NULL),('Hotbabe','18 lat','Hotbabe.png','w związku','Chętnie nawiążę nowe znajomości... Kto wie, jaki będzie ich finał? ;)','w',NULL),('HotBetty','23 lata','HotBetty.png','wolna','Chciałabym poznać kogoś ciekawego na wspólne, gorące wieczory. Mam wiele atutów...','w',NULL),('hotchocolate','30 lat','hotchocolate.png','wolna','Dzika, niepokorna, żądna wrażeń... Chcesz się o tym przekonać? Napisz! Czekam na Twoją wiadomość','w',NULL),('Inez','24 lata','Inez.png','wolna','Lubię być w centrum zainteresowania, kiedy jesteś ze mną wszystko może się zdarzyć...','w',NULL),('KamilaxXx','26 lat','KamilaxXx.png','w związku','Kobieca, odważna, lubiąca pieszczoty - taka właśnie jestem. Bez względu na to co robię, zawsze daję z siebie 100%!','w',NULL),('Katy','19 lat','Katy.png','wolna','Jestem, jaka jestem - wesoła, miła i wyluzowana :) Założyłam ten profil, bo moja koleżanka też to robiła. Chcemy się przekonać, która będzie mieć więcej wiadomości, haha :D','w',NULL),('Kaya','18 lat','Kaya.png','wolna','Ostatnio robię dużo przysiadów. Mam nadzieję, że widać efekty ;) Jeśli chcesz pomacać albo zobaczyć jak twerkuję na żywo, daj znać, pomyślimy...','w',NULL),('Kedziorka','31 lat','Kedziorka.png','wolna','Mój znak rozpoznawczy to burza loków i malutkie piersi... Mam nadzieję, że obie cechy znajda swoich adoratorów. Niedoskonałości wyglądu nadrabiam osobowością - jestem miła, otwarta i mam duże poczucie humoru :D','w',NULL),('kiciamigocia','26 lat','kiciamigocia.png','zaręczona','Jestem spokojną pracownicą biura. Mam narzeczonego i własne mieszkanie. Szukam kogoś, kto na nowo obudzi we mnie dreszczyk emocji. Seks z jedną osobą od ponad 4 lat robi się strasznie nudny i przewidywalny... Jest we mnie wiele namiętności, którą chętnie podzielę z kimś nowym.','w',NULL),('Kinia32','32 lata','Kinia32.png','wolna','Hej, jestem Kinga i szukam przyjaciela do wszystkiego ;)','w',NULL),('Klarita','31 lat','Klarita.png','wolna','Czekałam na księcia z bajki i się nie doczekałam. Zmarnowałam dużo czasu na poszukiwaniach tego jedynego. Teraz chciałabym poznać kogoś, kto wie, jak dać kobiecie przyjemność - przyjaciela bez zobowiązań.','w',NULL),('KocicaXXX','26 lat','KocicaXXX.png','w związku','Mam ochotę na chwilę zapomnienia... ;) znam wiele sztuczek i wiem, jak rozgrzać Cię do czerwoności','w',NULL),('KoKosanKa','21 lat','KoKosanKa.png','wolna','Mam włoskie korzenie i śródziemnomorską urodę: czarne włosy, brązowe oczy, oliwkowa cera... jestem ciasteczko, gotowa do schrupania ;) Nie należę do nieśmiałych, często eksperymentuję w łóżku i poza nim ;)','w',NULL),('konsultant',NULL,'konsultant.png','bez stanu','Nic ciekawego','m','1979-01-01'),('konsultantka',NULL,'konsultantka.png','bez stanu','Co tu napisać...','w','1989-06-14'),('kraglaslicznotka','41 lat','kraglaslicznotka.png','w związku','Uważam, że krągłości są sexy - z takim ciałem czuję się bardzo kobieco. Jeśli uważasz podobnie to zapraszam do kontaktu.','w',NULL),('Kruszynka','36 lat','Kruszynka.png','rozwódka','Jestem drobna i delikatna jak kwiatuszek :) Taki seks też lubię - spokojny, delikatny, pełny pieszczot... Ty też?','w',NULL),('ladyinred','25 lat','ladyinred.png','wolna','Jestem seksownym kociakiem, który uwielbia wymyślne zabawy. Nie lubię czekać, chcę zaszaleć tu i teraz!','w',NULL),('LaraSoft','26 lat','LaraSoft.png','wolna','Uprzedzam: ostra ze mnie szuka. Mam cięta ripostę i specyficzne upodobania. Nie spuszczam z tonu i nie słodzę. Tego nauczyło mnie życie. Gotowy na seks dla odważnych?','w',NULL),('Lena','21 lat','Lena.png','zaręczona','Jestem otwarta na nowe doświadczenia, ze mną na pewno nie będziesz się nudzić!','w',NULL),('LenaXoXo','25 lat','LenaXoXo.png','mężatka','Cechuje mnie duży temperament... Jesteś w stanie mu sprostać?','w',NULL),('Lila','36 lat','Lila.png','zajęta','Jestem ze swoim partnerem od 10 lat. Rozważam nasze rozstanie, ale nie jestem pewna, czy jeszcze umiem rozmawiać i zadowolić innego mężczyznę. Nie wiem, czy w ogóle jestem atrakcyjna dla innych. To dla mnie taki eksperyment, który pomoże mi podjąć decyzję','w',NULL),('lizaczek99','23 lata','lizaczek99.png','zajęta','Słodka, kochana, seksowna... Uwielbiam spełniać cudze fantazje. Mam spore doświadczenie i wiem, jak doprowadzić faceta do szału... Jeden partner to dla mnie za mało, dlatego tutaj jestem. Dyskrecja przede wszystkim!','w',NULL),('LovelyChick','33 lata','LovelyChick.png','rozwódka','Znów jestem wolna i niedopieszczona. Nie chcę nowych zobowiązań - zależy mi tylko na przyjemności','w',NULL),('luckystar22','37 lat','luckystar22.png','wolna','Delikatna i zmysłowa kobieta o wszechstronnych zainteresowaniach. Uwielbiam długie spacery i romantyczne kolacje we dwoje. Lubię być zaskakiwana...','w',NULL),('Lwica','18 lat','Lwica.png','wolna','Piłka nożna i seks nigdy mnie nie nudzą!','w',NULL),('MalaCzarna88','23 lata','MalaCzarna88.png','wolna','Witam wszystkich panów ;) jestem niegrzeczną dziewczynką - możesz dać mi klapsa (i nie tylko...). Chcę się zabawić, lubię ostrą jazdę. Zrobimy to na wszelkie możliwe sposoby... Chcesz się przekonać, co potrafię zrobić swoim zwinnym języczkiem? Napisz do mnie, a nie pożałujesz ;))','w',NULL),('malasyrena','33 lata','malasyrena.png','zaręczona','Narzeczony traktuje mnie jak księżniczkę, a ja chciałabym być pomiatana. Od lat fantazjuję o ostrym, brutalnym seksie, wiązaniu i delikatnej przemocy... Chętnie zostaną czyjąś niewolnicą na jedną noc.','w',NULL),('Marika','24 lata','Marika.png','wolna','Zabawna, rozrywkowa i gadatliwa - taka jestem. Chcę korzystać z życia na 100%! Ciężko mnie ujarzmić, ale ... może Tobie się uda? ;)','w',NULL),('Milena','24 lata','Milena.png','wolna','Nie lubię mówić o sobie, ale chętnie dowiem się więcej o Tobie ;) skontaktuj się ze mną - obiecuję, że tego nie pożałujesz...','w',NULL),('MiniMini','18 lat','MiniMini.png','Panna','Jeśli małe jest piękne, jestem idealna :)','w',NULL),('MissBlack','31 lat','MissBlack.png','wolna','Jestem zdolna do wszystkiego... Nie ma takiej rzeczy, której bym nie zrobiła. Razem przekroczymy granice','w',NULL),('Monika','19 lat','Monika.png','wolna','Mam w sobie wiele wdzięku, jestem bardzo kobieca i romantyczna. Nie czekaj - możesz się o tym przekonać osobiście ;)','w',NULL),('motylek','22 lata','motylek.png','wolna','Jestem zadbaną kobietą i tego samego wymagam od swojego partnera. Nie znoszę chamstwa i obłudy, za to cenię prawdziwych mężczyzn. Gentelman może mnie ciągnąć za włosy i klepać w pupę, ale ostrożnie... Potrafię oddać','w',NULL),('napalOna','32 lata','napalOna.png','Panna','Lubię anal i nigdy go nie odmawiam. Im więcej, tym lepiej','w',NULL),('Natalia','26 lat','Natalia.png','w związku','Mówią o mnie, że jestem ostrą laską. Przekonaj się, jaka jestem niegrzeczna ;)','w',NULL),('NeedForSex','30 lat','NeedForSex.png','wolna','Dawno nie miałam żadnego faceta. Jestem spragniona sexu','w',NULL),('nestorka','50 lat','nestorka.png','rozwódka','Pewnie Cię zaskoczyłam, co? Ciągle jestem aktywna w łóżku - jeszcze nie czas na celibat. Ciekawi Cię, jak to jest ze starszą kobietą? Chętnie Ci zaprezentuję... Wrócisz po więcej!','w',NULL),('Nicole','31 lat','Nicole.png','mężatka','Hej, szukam dobrej zabawy i towarzystwa na samotne wieczory... Lubię gorące i zmysłowe pieszczoty. Jacyś chętni? ;)','w',NULL),('niegrzeczna','41 lat','niegrzeczna.png','rozwódka','Mam ciało nastolatki, a umiejętności... Cóż, sam zobaczysz...','w',NULL),('NiegrzecznaZuza','21 lat','NiegrzecznaZuza.png','wolna','Entuzjastka sportu, wielbicielka podróży i koneserka mocnych wrażeń, która lubi (nie)grzeczne zabawy...','w',NULL),('Niesmiała','23 lata','Niesmiała.png','wolna','Szukam kogoś wrażliwego i delikatnego, kto pomoże mi stać się pewną siebie kobietą','w',NULL),('Niewinnaaa','19 lat','Niewinnaaa.png','Panna','Mam na imię Olka, lubię słuchać muzyki i oglądać filmy. Inne rzeczy też baaaaardzo lubię... ;)','w',NULL),('Nikki','20 lat','Nikki.png','w związku','Szukam kogoś z kim będę mogła się zrelaksować i miło spędzić czas (nie tylko na rozmowie....)','w',NULL),('Nimfa','33 lata','Nimfa.png','wolna','Nudne są samotne kąpiele... Zwłaszcza w wielkim jacuzzi. Ostatnio zamontowałam takie u siebie w domu i brakuje mi kogoś, kto razem ze mną cieszyłby się szampanem i bąbelkami...','w',NULL),('nimfomanka69','22 lata','nimfomanka69.png','Panna','Potrzebę porządnego bzykania i to szybko!!!','w',NULL),('OgnistaDaria','29 lat','OgnistaDaria.png','w związku','Chętnie poznam mężczyznę, który nie boi się ryzyka. Jestem odważna i ciekawa świata. Czekam na Twoją wiadomość ;)','w',NULL),('OnDiet','29 lat','OnDiet.png','Panna','Sport to moja pasja. Dzięki niemu dowiedziałam się, jak bardzo lubię dominować - nie tylko w pracy... Inne moje zainteresowania to medycyna naturalna i zdrowe odżywianie. Umiem dobrać afrodyzjak na każdą okazję i pozycję na każdy dzień ;)','w',NULL),('OstraChilli','36 lat','OstraChilli.png','wolna','Kręcą mnie kolczyki, tatuaże i motory. Fantazjuję o brutalnym seksie. Jesteś gotowy?','w',NULL),('OstraSandra','18 lat','OstraSandra.png','wolna','Długie, czarne włosy, kuszące usta, zgrabna figura i ładna buzia. Wiem, jak działam na mężczyzn - chcesz to sprawdzić? ;)','w',NULL),('pamela','18 lat','pamela.png','zajęta','jestem młoda i nie chcę na zawsze utkwić z jednym facetem... może z innym będzie lepiej??? chcę się przekonać!','w',NULL),('Pantara','30 lat','Pantara.png','wolna','Szukam przygód w nudnym życiu księgowej. Pomożesz?','w',NULL),('Pasikonik','18 lat','Pasikonik.png','wolna','Część, mam na imię Ania! Lubię przygody i chcę się przekonać, czy znajdę tutaj kogoś fajnego, z kim można pogadać na każdy temat, trochę poświntuszyć i ogólnie spędzić miło czas :)','w',NULL),('Pati','27 lat','Pati.png','w związku','Randka ze mną to najlepsze, co może Cię spotkać Kotku...;)','w',NULL),('Patka','20 lat','Patka.png','wolna','Hejka! Jestem ciekawa, co mnie spotka na tej stronie. Coś romantycznego, ostrego, dziwnego? Nie wiem i to jest najlepsze! Jestem otwarta na wszystkie propozycje:) Nie bój się, nie gryzę - najwyżej odmówię :)','w',NULL),('PinkBunny','21 lat','PinkBunny.png','wolna','Moje zgrabne ciało czeka na Twój dotyk...','w',NULL),('pruderyjnabasia','31 lat','pruderyjnabasia.png','wolna','To, co widzisz na zdjęciu, to wrota do Twojej rozkoszy... Jestem taka ciasna, wilgotna i gorąca... Zapamiętasz mnie do końca życia....','w',NULL),('pysiaa','37 lat','pysiaa.png','wolna','Jestem singielką z wyboru. Mąż, dzieci, rutyna to nie dla mnie. Jestem niezależna i wolna. Nie narzekam na samotność, ale chcę przeżyć coś nowego i świeżego. Seks z nieznajomym? Seks w miejscu publicznym? Wypad na seks weekend? Nie mogę się doczekać, co się wydarzy!','w',NULL),('Regina','25 lat','Regina.png','Panna','Wesoła i pogodna, ciągle szukam nowych wyzwań. Lubię eksperymentować, zwłaszcza w łóżku','w',NULL),('Roksi82','33 lata','Roksi82.png','wolna','Jestem naturalna i prawdziwa, niczego nie udaję. Lubię sex i szukam osoby, która podziela moją pasję...;)','w',NULL),('Roza5','24 lata','Roza5.png','Panna','Szukam delikatnego partnera do pierwszego analu w życiu.','w',NULL),('ruben',' lat','ruben.png','żonaty','Moja żona jest nudna i potrzebuję odskoczni ;)\r\na teściowa to zołza :D\r\na teść też jest nie lepszy od nich\r\ncała trójka jest udana','m','1989-06-14'),('Rudzielec','30 lat','Rudzielec.png','wolna','Podobno rude to wredne... A ja uważam, że namiętne ;) Najlepsze kochanki mają ogniste włosy! Sprawdza się przynajmniej w moim przypadku :D Potrafię takie rzeczy, o jakich Wam się nie śniło','w',NULL),('Samotna123','31 lat','Samotna123.png','Panna','Znudził mi się wibrator, chcę prawdziwego penisa!','w',NULL),('Sandra','30 lat','Sandra.png','w związku','Hej, mam na imię Sandra, jestem sympatyczną i trochę zwariowaną dziewczyną. Trenuję taniec, uwielbiam włoską kuchnię i marzę o podróży dookoła świata. Może poznamy się lepiej?','w',NULL),('Sashka','22 lata','Sashka.png','wolna','Pracuję w banku, lubię dobrą książkę i film. W wolnych chwilach chodzę na basen. Oczywiście, kocham uprawiać seks, nie mogę bez niego długo wytrzymać! Nie wiem, co jeszcze napisać, wolę działać :)','w',NULL),('SatinSandie','41 lat','SatinSandie.png','mężatka','Na co dzień zajmuję się domem, a mąż pracuje za granicą. Czuję się bardzo samotna w moim wielkim, pustym domu. Okażę gościnność każdemu, kto zechce mnie pocieszyć','w',NULL),('seniorka','46 lat','seniorka.png','rozwódka','W tym roku skończyłam 46 lat. Wiele osób mówi, że nie wyglądam na swój wiek. To prawda, do tego czuję młodo! Dlatego nie chcę zaniedbywać swojej myszki. A może pobawimy się w kotka i myszkę? Nie będę za bardzo uciekać...','w',NULL),('sexiOliwia','34 lata','sexiOliwia.png','mężatka','Znudzona i niedopieszczona mężatka, która pragnie uwagi... Chcę miło spędzać czas z kimś, kto mnie doceni. Mam wiele do zaoferowania...','w',NULL),('SexyMama','46 lat','SexyMama.png','Rozwódka','Jestem dojrzałą kobietą i znam swoje ciało. Szukam mężczyzny, który wie, jak zadowolić wymagającą partnerkę.','w',NULL),('singielka','39 lat','singielka.png','wolna','Przygody z moim fioletowym przyjacielem to dla mnie za mało. Jestem singielką z wyboru, ale tęsknię za seksem z prawdziwym facetem. Zwłaszcza za seksem oralnym...','w',NULL),('Skinnybabe','25 lat','Skinnybabe.png','wolna','Powabna blondynka o seksownym, zgrabnym ciele, długich włosach, czarującym uśmiechu i ognistym temperamencie','w',NULL),('skromnisia','28 lat','skromnisia.png','wolna','Kusicielka i uwodzicielka z klasą. Jestem mistrzynią striptizu i tańca erotycznego. Mam całą kolekcję seksownych ciuszków specjalnie na moje występy. Ciekawe, jak długo wytrzymasz?','w',NULL),('slicznotka','19 lat','slicznotka.png','zajęta','Nie interesuje mnie stały związek, a spełnianie swoich fantazji. Mam ich mnóstwo...','w',NULL),('slodka','19 lat','slodka.png','zaręczona','Hej! Chcę miło spędzić czas i trochę zaszaleć... Odważysz się to zrobić razem ze mną? Czekam na Ciebie ;)','w',NULL),('Slodkamalolatka','19 lat','Slodkamalolatka.png','wolna','Delikatna i romantyczna? Wręcz przeciwnie! Wyglądam niewinnie, ale wcale taka nie jestem.... chcesz się o tym przekonać? ;)','w',NULL),('Slodkisuteczek','19 lat','Slodkisuteczek.png','wolna','Chłopacy uwielbiają moje nietypowe piersiątka! Nie mogą ich wypuścić z rąk ani z ust. A ja to uwielbiam... Jestem pewna, że Ty też się w nich zakochasz','w',NULL),('Slodziutka','25 lat','Slodziutka.png','wolna','Chcesz polizać? Odwdzięczę się...','w',NULL),('sloneczko91','26 lat','sloneczko91.png','wolna','W pędzie za karierą zapomniałam, jak kiedyś lubiłam seks... Już dawno nie czułam się jak prawdziwa kobieta. Chciałabym usnąć i obudzić się obok jakiegoś szarmanckiego mężczyzny, który nie wyjdzie bez wspólnego śniadania.','w',NULL),('Slowianka91','26 lat','Slowianka91.png','wolna','Piękna, kobieca i zmysłowa... Cała ja! ;)','w',NULL),('SowA','24 lata','SowA.png','Panna','Męczą mnie długie, samotne noce... Co robić?','w',NULL),('sugarbaby','21 lat','sugarbaby.png','wolna','W wolnych chwilach zajmuję się jazdą konną. Chcesz, żebym wsiadła na Ciebie?','w',NULL),('SweetSweetDream','24 lata','SweetSweetDream.png','wolna','Jestem kobietą z klasą. Wyrafinowany seks, zabawa jedzeniem, zawiązane oczy... Marzę o tym przed zaśnięciem. Mam nadzieję, że uda mi się przeżyć podobne przygodny w realu.','w',NULL),('sweetteen','19 lat','sweetteen.png','wolna','Normalnie jestem nieśmiała, ale w sytuacji \"sam na sam\" potrafię być drapieżna ;)','w',NULL),('szakira','24 lata','szakira.png','wolna','Zajmuję się tańcem brzucha - jestem instruktorką i daję pokazy. Umiem ruszać biodrami tak, jak mało która kobieta, dlatego uwielbiam być na górze podczas seksu... Niezapomniane widoki gwarantowane','w',NULL),('Tajemnicza','28 lat','Tajemnicza.png','mężatka','Jeśli chcesz zobaczyć więcej, napisz... Mam dużo czasu, kiedy mąż jest w pracy','w',NULL),('Tequila18','18 lat','Tequila18.png','Panna','Jestem zadbana i wysportowana, a do tego kocham ostry seks :)','w',NULL),('Thaliah','39 lat','Thaliah.png','mężatka','Mam już swoje lata, ale zapewniam, że jestem bardziej zadbana niż nie jedna 20-latka! Regularnie ćwiczę i nie jem byle czego. Lubię czasem poprawić coś w gabinecie kosmetycznym. Nikt nie daje mi tyle lat, na ile wyglądam. Mam wrażenie, że się marnuję u boku wiecznie zapracowanego męża. Może ktoś tutaj doceni mnie bardziej i wykorzysta mój sex appeal... Przede wszystkim zależy mi na dyskrecji!','w',NULL),('TrueDiamond','21 lat','TrueDiamond.png','Panna','Trenuję taniec na rurze i szukam kogoś, przed kim mogłabym praktykować :D','w',NULL),('tygrysek','21 lat','tygrysek.png','wolna','Jestem prawdziwą nimfomanką. Nigdy nie boli mnie głowa. Faceci zwyczajnie nie dają rady mojej ochocie na seks... Czekam na wytrwałego zawodnika, który nie wymięka po 1 razie.','w',NULL),('Venus','24 lata','Venus.png','w związku','Kobiece kształty są moim atutem (ale nie jedynym...;)','w',NULL),('wiernazona','35 lat','wiernazona.png','mężatka','Kocham męża, ale wierność nie jest dla mnie. Lubię przygodny seks z nieznajomymi. To mnie mega kręci','w',NULL),('WikiPrestige','32 lata','WikiPrestige.png','w związku','Kobieta z charakterem, inteligentna i poukładana szuka odskoczni od codzienności...','w',NULL),('xLolitax','21 lat','xLolitax.png','w związku','Monogamia nie jest dla mnie - chcę całkiem nowych doznań ;) mój młody wiek może być mylący, ale uwierz mi: wiele potrafię i mogę Cię zaskoczyć...','w',NULL),('XxXTopModelXxX','20 lat','XxXTopModelXxX.png','Panna','Malutka i słodziutka to cała ja :) Uwielbiam namiętny i długi seks. Jeśli Ty też, koniecznie daj mi znać!','w',NULL),('YogaFit','26 lat','YogaFit.png','Panna','Ćwiczę jogę od 4 lat. Chcesz wypróbować sexu w nietypowych pozycjach? ;) Pisz, a może czegoś Cię nauczę...','w',NULL),('zelda123','27 lat','zelda123.png','wolna','Brunetka, 170 cm wzrostu, 58 kg wagi. Oczka niebieskie. Marzenie każdego faceta :) Mogę być Twoja, jeśli się postarasz...','w',NULL);
/*!40000 ALTER TABLE `users_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vip_pay`
--

DROP TABLE IF EXISTS `vip_pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vip_pay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cookie` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pay_link` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vip_pay`
--

LOCK TABLES `vip_pay` WRITE;
/*!40000 ALTER TABLE `vip_pay` DISABLE KEYS */;
/*!40000 ALTER TABLE `vip_pay` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-03 13:24:54
