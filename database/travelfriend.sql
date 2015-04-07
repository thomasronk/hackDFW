-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: travelfriend
-- ------------------------------------------------------
-- Server version	5.6.22

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
-- Table structure for table `callmetric`
--

DROP TABLE IF EXISTS `callmetric`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `callmetric` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `commType` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `callmetric`
--

LOCK TABLES `callmetric` WRITE;
/*!40000 ALTER TABLE `callmetric` DISABLE KEYS */;
INSERT INTO `callmetric` VALUES (1,'abc@abc.com','2015-04-06','Audio'),(2,'abc@abc.com','2015-04-06','Video'),(3,'abc@abc.com','2015-04-06','Message'),(4,'abc@abc.com','2015-04-06','Phone'),(5,'abc@abc.com','2015-03-06','Message');
/*!40000 ALTER TABLE `callmetric` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expert_tagtable`
--

DROP TABLE IF EXISTS `expert_tagtable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expert_tagtable` (
  `e_id` int(11) NOT NULL,
  `tagID` int(11) NOT NULL,
  PRIMARY KEY (`e_id`,`tagID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expert_tagtable`
--

LOCK TABLES `expert_tagtable` WRITE;
/*!40000 ALTER TABLE `expert_tagtable` DISABLE KEYS */;
/*!40000 ALTER TABLE `expert_tagtable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experttable`
--

DROP TABLE IF EXISTS `experttable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experttable` (
  `e_id` int(11) NOT NULL AUTO_INCREMENT,
  `e_name` varchar(100) NOT NULL,
  `e_loc` varchar(100) NOT NULL,
  `is_online` int(1) NOT NULL,
  `is_audio` int(1) NOT NULL,
  `is_video` int(1) NOT NULL,
  `is_message` int(1) NOT NULL,
  `e_password` varchar(45) NOT NULL,
  `phone_no` varchar(45) DEFAULT NULL,
  `is_phone` bit(1) NOT NULL,
  `image_url` varchar(300) DEFAULT NULL,
  `aboutme` varchar(500) NOT NULL,
  PRIMARY KEY (`e_id`),
  UNIQUE KEY `e_id_UNIQUE` (`e_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experttable`
--

LOCK TABLES `experttable` WRITE;
/*!40000 ALTER TABLE `experttable` DISABLE KEYS */;
INSERT INTO `experttable` VALUES (1,'abc@abc.com','Dallas',1,1,1,1,'abc','12334344','','asdsad','sadnasdlkasd');
/*!40000 ALTER TABLE `experttable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kandy_usertable`
--

DROP TABLE IF EXISTS `kandy_usertable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kandy_usertable` (
  `uname` varchar(100) NOT NULL,
  `isUsed` tinyint(1) NOT NULL,
  `password` varchar(45) NOT NULL,
  UNIQUE KEY `uname_UNIQUE` (`uname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kandy_usertable`
--

LOCK TABLES `kandy_usertable` WRITE;
/*!40000 ALTER TABLE `kandy_usertable` DISABLE KEYS */;
INSERT INTO `kandy_usertable` VALUES ('user1@bstorm.com',0,'1ralhtym1'),('user2@bstorm.com',0,'22util14e2'),('user3@bstorm.com',0,'techmahindra@123'),('user4@bstorm.com',0,'techmahindra@123'),('user5@bstorm.com',0,'techmahindra@123');
/*!40000 ALTER TABLE `kandy_usertable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `loc_id` int(11) NOT NULL,
  `loc_name` varchar(45) NOT NULL,
  PRIMARY KEY (`loc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Dallas,TX'),(2,'Arlington,TX'),(3,'Austin,TX'),(4,'Houston,TX'),(5,'Chicago,IL'),(6,'Phoenix,AZ'),(7,'NewYork,NY'),(8,'Buffalo,NY'),(9,'Seatle,WA'),(10,'Redmond,WA'),(11,'Tuscon,AZ'),(12,'Tampa,FL'),(13,'Los Angeles,CA'),(14,'San Diego,CA'),(15,'San Jose,CA'),(16,'Irvine,CA'),(17,'Irving,TX'),(18,'Sunnyvale,CA'),(19,'Syracuse,NY'),(20,'Richmond,CA');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(30) NOT NULL,
  `commentplace` varchar(500) NOT NULL,
  `commentdate` date NOT NULL,
  `commentuser` varchar(500) NOT NULL,
  `tag` varchar(45) NOT NULL,
  `who` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,'abc@abc.com','yeah ','2015-04-06','bah','Bars','xyz'),(2,'abc@abc.com','asdfdsfds','2015-04-06','dasf','Bars','asdsad'),(3,'abc@abc.com','sdfsdf','2015-04-06','sdfdsf','asfsdf','asdsad'),(4,'abc@abc.com','awesome','2015-04-06','awesome','Pubs','Prashant'),(5,'abc@abc.com','this was good','2015-04-06','Awesome','Bars','ron ');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagtable`
--

DROP TABLE IF EXISTS `tagtable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagtable` (
  `tagID` int(11) NOT NULL AUTO_INCREMENT,
  `tagName` varchar(100) NOT NULL,
  PRIMARY KEY (`tagID`),
  UNIQUE KEY `tagID_UNIQUE` (`tagID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagtable`
--

LOCK TABLES `tagtable` WRITE;
/*!40000 ALTER TABLE `tagtable` DISABLE KEYS */;
INSERT INTO `tagtable` VALUES (1,'Bars'),(2,'Pubs'),(3,'Restaurants'),(4,'Library'),(5,'Zoo'),(6,'Museum'),(7,'Theme Parks'),(8,'Movies');
/*!40000 ALTER TABLE `tagtable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-07  1:09:41
