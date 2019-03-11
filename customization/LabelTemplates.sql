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
-- Table structure for table `LabelTemplates`
--

DROP TABLE IF EXISTS `LabelTemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LabelTemplates` (
  `LabelTemplateID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` longtext,
  `LabelFile` longtext,
  `LabelTemplateName` varchar(50) NOT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `BarcodeableMapID` int(11) DEFAULT NULL,
  `LabelFormatID` int(11) DEFAULT NULL,
  PRIMARY KEY (`LabelTemplateID`),
  KEY `FK_7ni5bxxry15ocko3jkdtblh0l` (`BarcodeableMapID`),
  KEY `FK_df6kifjhg2ci1s074w5cho48g` (`LabelFormatID`),
  CONSTRAINT `FK_7ni5bxxry15ocko3jkdtblh0l` FOREIGN KEY (`BarcodeableMapID`) REFERENCES `BarcodeableMaps` (`BarcodeableMapID`),
  CONSTRAINT `FK_df6kifjhg2ci1s074w5cho48g` FOREIGN KEY (`LabelFormatID`) REFERENCES `LabelFormats` (`LabelFormatID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LabelTemplates`
--

LOCK TABLES `LabelTemplates` WRITE;
/*!40000 ALTER TABLE `LabelTemplates` DISABLE KEYS */;
INSERT INTO `LabelTemplates` VALUES (2,'A template for DAOM specimen','c:\\sentinel\\labels\\test_specimen_printing1_v3.lab','DAOM Label','2013-03-19 00:00:00.000000',1,1),(5,'Generic Specimen Replicate label with tube cap and strip label','c:\\sentinel\\labels\\seifertk_specimen_replicate_June_2013.lab','Specimen Replicate Label','2013-03-19 00:00:00.000000',1,1),(6,'Long strip label for side of plates','Plate Label File','Plate Label','2013-03-19 00:00:00.000000',1,2),(7,'Generic template for printing DNA Samples. Prints to a THT-163 format label.','c:\\sentinel\\labels\\default_sample_June_2013.lab','Sample Template','2013-03-19 00:00:00.000000',2,2),(8,'Generic template for printing Pcr Primers. Prints to a THT-163 format label.','c:\\sentinel\\labels\\LEV_primer_June_2013.lab','PcrPrimer Template','2013-03-19 00:00:00.000000',7,2),(9,'Generic template for printing Container labels. Prints to a THT-163 format label.','c:\\sentinel\\labels\\default_container_June_2013.lab','Container Template','2013-03-19 00:00:00.000000',3,2);
/*!40000 ALTER TABLE `LabelTemplates` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-11 10:32:49
