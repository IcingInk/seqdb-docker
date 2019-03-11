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
-- Table structure for table `AccountProfilePrinters`
--

DROP TABLE IF EXISTS `AccountProfilePrinters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AccountProfilePrinters` (
  `AccountProfilePrinterID` int(11) NOT NULL AUTO_INCREMENT,
  `BarcodeableEntity` varchar(255) NOT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `AccountProfileID` int(11) DEFAULT NULL,
  `LabelTemplateID` int(11) DEFAULT NULL,
  `PrinterID` int(11) DEFAULT NULL,
  PRIMARY KEY (`AccountProfilePrinterID`),
  KEY `FK_q48k8qlwetvmy5anf4yo9l8go` (`AccountProfileID`),
  KEY `FK_i3wj6ko1vkec6254r8l6laddr` (`LabelTemplateID`),
  KEY `FK_ec5p689miax2o0lk3sfqjdjey` (`PrinterID`),
  CONSTRAINT `FK_ec5p689miax2o0lk3sfqjdjey` FOREIGN KEY (`PrinterID`) REFERENCES `Printers` (`PrinterID`),
  CONSTRAINT `FK_i3wj6ko1vkec6254r8l6laddr` FOREIGN KEY (`LabelTemplateID`) REFERENCES `LabelTemplates` (`LabelTemplateID`),
  CONSTRAINT `FK_q48k8qlwetvmy5anf4yo9l8go` FOREIGN KEY (`AccountProfileID`) REFERENCES `AccountProfiles` (`AccountProfileID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AccountProfilePrinters`
--

LOCK TABLES `AccountProfilePrinters` WRITE;
/*!40000 ALTER TABLE `AccountProfilePrinters` DISABLE KEYS */;
INSERT INTO `AccountProfilePrinters` VALUES (1,'SpecimenReplicate','2013-03-19 00:00:00.000000',1,5,8),(2,'Specimen','2013-03-19 00:00:00.000000',2,2,6),(3,'Sample','2013-03-19 00:00:00.000000',1,7,9),(4,'PcrPrimer','2013-03-19 00:00:00.000000',1,8,8);
/*!40000 ALTER TABLE `AccountProfilePrinters` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-08 16:20:49
