-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: messenger
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.16.04.1

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
-- Table structure for table `channel`
--

DROP TABLE IF EXISTS `channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel` (
  `channel_name` varchar(200) NOT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `creator_username` varchar(200) NOT NULL,
  `create_date` datetime NOT NULL,
  PRIMARY KEY (`channel_name`),
  KEY `channal_users_username_fk` (`creator_username`),
  CONSTRAINT `channal_users_username_fk` FOREIGN KEY (`creator_username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `group_name` varchar(200) NOT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `creator_username` varchar(200) NOT NULL,
  `create_date` datetime NOT NULL,
  PRIMARY KEY (`group_name`),
  KEY `groups_users_username_fk` (`creator_username`),
  CONSTRAINT `groups_users_username_fk` FOREIGN KEY (`creator_username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `message_user_to_channel`
--

DROP TABLE IF EXISTS `message_user_to_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_user_to_channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `src` varchar(200) NOT NULL,
  `dst` varchar(200) NOT NULL,
  `body` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `create_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `message_user_to_channal_users_username_fk` (`src`),
  KEY `message_user_to_channal_channal_channal_name_fk` (`dst`),
  CONSTRAINT `message_user_to_channal_channal_channal_name_fk` FOREIGN KEY (`dst`) REFERENCES `channel` (`channel_name`),
  CONSTRAINT `message_user_to_channal_users_username_fk` FOREIGN KEY (`src`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3583 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `message_user_to_group`
--

DROP TABLE IF EXISTS `message_user_to_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_user_to_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `src` varchar(200) NOT NULL,
  `dst` varchar(200) NOT NULL,
  `body` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `create_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `message_user_to_group_users_username_fk` (`src`),
  KEY `message_user_to_group_groups_group_name_fk` (`dst`),
  CONSTRAINT `message_user_to_group_groups_group_name_fk` FOREIGN KEY (`dst`) REFERENCES `groups` (`group_name`),
  CONSTRAINT `message_user_to_group_users_username_fk` FOREIGN KEY (`src`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=598 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `message_user_to_user`
--

DROP TABLE IF EXISTS `message_user_to_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_user_to_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `src` varchar(200) NOT NULL,
  `dst` varchar(200) NOT NULL,
  `body` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `message_user_to_user_users_username_fk` (`src`),
  KEY `message_user_to_user_users_username_fk_2` (`dst`),
  CONSTRAINT `message_user_to_user_users_username_fk` FOREIGN KEY (`src`) REFERENCES `users` (`username`),
  CONSTRAINT `message_user_to_user_users_username_fk_2` FOREIGN KEY (`dst`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5821 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `user_channel`
--

DROP TABLE IF EXISTS `user_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(200) NOT NULL,
  `channel_name` varchar(200) NOT NULL,
  `join_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_channal_users_username_fk` (`user_name`),
  KEY `user_channal_channal_channal_name_fk` (`channel_name`),
  CONSTRAINT `user_channal_channal_channal_name_fk` FOREIGN KEY (`channel_name`) REFERENCES `channel` (`channel_name`),
  CONSTRAINT `user_channal_users_username_fk` FOREIGN KEY (`user_name`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=541 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `user_group`
--

DROP TABLE IF EXISTS `user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(200) NOT NULL,
  `group_name` varchar(200) NOT NULL,
  `join_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_group_users_username_fk` (`user_name`),
  KEY `user_group_groups_group_name_fk` (`group_name`),
  CONSTRAINT `user_group_groups_group_name_fk` FOREIGN KEY (`group_name`) REFERENCES `groups` (`group_name`),
  CONSTRAINT `user_group_users_username_fk` FOREIGN KEY (`user_name`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=544 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `firstname` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `lastname` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `is_active` varchar(20) DEFAULT NULL,
  `token` varchar(200) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('admin','admin',NULL,NULL,'1','ee1b74acbfb435a3a38ad3e851cd5eb6','2018-07-01 14:46:34');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-19 20:25:10
