-- MySQL dump 10.13  Distrib 5.6.30, for Linux (x86_64)
--
-- Host: localhost    Database: seqdbweb
-- ------------------------------------------------------
-- Server version	5.6.30

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
-- Table structure for table `Printers`
--

DROP TABLE IF EXISTS `Printers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Printers` (
  `PrinterID` int(11) NOT NULL AUTO_INCREMENT,
  `Alias` varchar(255) NOT NULL,
  `AssetTag` varchar(255) DEFAULT NULL,
  `IpAddress` varchar(255) DEFAULT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `Location` varchar(255) DEFAULT NULL,
  `Path` varchar(255) DEFAULT NULL,
  `PrinterName` varchar(50) NOT NULL,
  `LabelFormatID` int(11) DEFAULT NULL,
  PRIMARY KEY (`PrinterID`),
  UNIQUE KEY `UK_5et5n4fc8jcen1a6inakmydlx` (`Alias`),
  KEY `FK_di98ww0jwy6rja4tadd2baqrl` (`LabelFormatID`),
  CONSTRAINT `FK_di98ww0jwy6rja4tadd2baqrl` FOREIGN KEY (`LabelFormatID`) REFERENCES `LabelFormats` (`LabelFormatID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Printers`
--

LOCK TABLES `Printers` WRITE;
/*!40000 ALTER TABLE `Printers` DISABLE KEYS */;
INSERT INTO `Printers` VALUES (5,'ip600-1',NULL,'10.117.57.161','2013-03-19 00:00:00.000000','DAOM Lab',NULL,'Brady IP600 Printer (Daom Lab)',1),(6,'ip600-22',NULL,'10.117.218.239','2013-03-19 00:00:00.000000','KAS Lab',NULL,'Brady IP600 Printer (KAS Lab)',1),(7,'ip600-2',NULL,'10.117.218.159','2013-03-19 00:00:00.000000','LEV Lab',NULL,'Brady IP600 Printer (LEV Lab)',2),(8,'ip600-MBB-2133',NULL,'10.117.204.120','2013-03-19 00:00:00.000000','MMB Lab',NULL,'Brady IP600 Printer (MMB LAB)',1),(9,'HP8500',NULL,'1.1.1.1','2013-03-19 00:00:00.000000','second floor hallway',NULL,'HP8500',3);
/*!40000 ALTER TABLE `Printers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-11 10:56:54
