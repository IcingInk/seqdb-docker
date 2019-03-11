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
-- Table structure for table `Accounts`
--

DROP TABLE IF EXISTS `Accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Accounts` (
  `AccountID` int(11) NOT NULL AUTO_INCREMENT,
  `AccountExpires` date DEFAULT NULL,
  `AccountName` varchar(20) NOT NULL,
  `AccountPw` varchar(100) DEFAULT NULL,
  `AccountStatus` varchar(20) DEFAULT NULL,
  `AccountType` varchar(20) NOT NULL,
  `ApiKey` varchar(100) DEFAULT NULL,
  `LastLogin` datetime DEFAULT NULL,
  `LastLoginFrom` varchar(50) DEFAULT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `LdapDn` varchar(200) DEFAULT NULL,
  `PeopleID` int(11) DEFAULT NULL,
  PRIMARY KEY (`AccountID`),
  UNIQUE KEY `UK_n6mldui384judl1gi8o4vr9n9` (`AccountName`),
  UNIQUE KEY `UK_t6cw0uwuj6yk5fnoejjm0s3go` (`ApiKey`),
  UNIQUE KEY `UK_53536gw88p3wmc9sj0typrkah` (`LdapDn`),
  KEY `FK_beprcfum14hti2f25qcyaxfwc` (`PeopleID`),
  CONSTRAINT `FK_beprcfum14hti2f25qcyaxfwc` FOREIGN KEY (`PeopleID`) REFERENCES `People` (`PeopleID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Accounts`
--

LOCK TABLES `Accounts` WRITE;
/*!40000 ALTER TABLE `Accounts` DISABLE KEYS */;
INSERT INTO `Accounts` VALUES (1,'2018-12-12','admin','$2a$10$yU.koeIri6ECtDTBv05FOuzvDIIYyN2KIpHqgKR93gHg/pTMZcrbG','Active','Admin',NULL,NULL,NULL,'2018-04-11 09:24:55.341000',NULL,1),(2,NULL,'User','$2a$10$xWykm3LUauNxthMDhfXGfeeYFVsvVaN5uJk8C.1oTVV77ea0.nT4a','Active','User','userkey',NULL,NULL,'2007-04-03 00:00:00.000000',NULL,2),(3,'2018-12-12','ingimar','$2a$10$.qZu/NpL37YNwf12g..zh.R2xxvAGbObCxjD1uNmGXTpVd/.6fGae','Active','Admin',NULL,NULL,NULL,'2018-04-10 09:14:18.383000',NULL,3),(4,'2090-12-21','niclas','$2a$10$5wOLJrYQ75O9EduwAfqZ3.FXm7lg5nJddrlMZoaZ.61DYkLjnVb1G','Active','User',NULL,NULL,NULL,'2018-04-10 11:20:44.551000',NULL,4),(5,'2100-01-01','thomas','$2a$10$fMV8pL9ISjw3cuW92irnge0vrxYZafx/y46dxFbyvIohrhDcaImNS','Active','Admin',NULL,NULL,NULL,'2018-04-11 09:13:56.640000',NULL,5),(6,'2018-12-21','daniela','$2a$10$zpKn5EAKnRyVFLPV6cGSue6emPgI8VyeA9oKotdU0Td/KubVmU7zm','Active','Guest',NULL,NULL,NULL,'2018-10-24 13:13:11.088000',NULL,6);
/*!40000 ALTER TABLE `Accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AccountsGroups`
--

DROP TABLE IF EXISTS `AccountsGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AccountsGroups` (
  `AccountGroupID` int(11) NOT NULL AUTO_INCREMENT,
  `Admin` bit(1) NOT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `Rights` varchar(20) NOT NULL,
  `AccountID` int(11) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  PRIMARY KEY (`AccountGroupID`),
  KEY `FK_dh5l0va08wgkf4t4rydt1qboc` (`AccountID`),
  KEY `FK_o3k28i5e35d32g1i4o6sbo35m` (`GroupID`),
  CONSTRAINT `FK_dh5l0va08wgkf4t4rydt1qboc` FOREIGN KEY (`AccountID`) REFERENCES `Accounts` (`AccountID`),
  CONSTRAINT `FK_o3k28i5e35d32g1i4o6sbo35m` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`)
) ENGINE=InnoDB AUTO_INCREMENT=277 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AccountsGroups`
--

LOCK TABLES `AccountsGroups` WRITE;
/*!40000 ALTER TABLE `AccountsGroups` DISABLE KEYS */;
INSERT INTO `AccountsGroups` VALUES (265,'\0','2013-03-19 00:00:00.000000','1111',1,1),(266,'','2013-03-19 00:00:00.000000','1111',2,2),(267,'\0','2013-03-19 00:00:00.000000','1111',1,3),(268,'\0','2013-03-19 00:00:00.000000','1111',2,3),(271,'','2018-04-10 20:09:49.685000','1111',3,9),(272,'','2018-04-10 20:11:54.085000','1111',4,1),(274,'\0','2018-04-11 09:28:45.779000','1111',1,9),(275,'\0','2018-04-11 09:33:05.204000','1111',5,9),(276,'','2018-10-24 13:13:11.120000','1111',6,13);
/*!40000 ALTER TABLE `AccountsGroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Groups`
--

DROP TABLE IF EXISTS `Groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Groups` (
  `GroupID` int(11) NOT NULL AUTO_INCREMENT,
  `DefaultRights` varchar(20) DEFAULT NULL,
  `Description` longtext,
  `GroupName` varchar(50) NOT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`GroupID`),
  UNIQUE KEY `UK_lysadmheq7r9mxfllh6byrp0k` (`GroupName`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Groups`
--

LOCK TABLES `Groups` WRITE;
/*!40000 ALTER TABLE `Groups` DISABLE KEYS */;
INSERT INTO `Groups` VALUES (1,'0000','','Admin Group','2018-04-11 09:36:41.822000'),(2,'0000',NULL,'User Group','2013-03-19 00:00:00.000000'),(3,'0000',NULL,'TEST Group','2013-03-19 00:00:00.000000'),(4,'0000',NULL,'CNC Loan Diptera','2013-03-19 00:00:00.000000'),(5,'0000',NULL,'CNC Loan General','2013-03-19 00:00:00.000000'),(6,'0000',NULL,'CNC Loan Staff','2013-03-19 00:00:00.000000'),(7,'0000',NULL,'CNC Loan Client','2013-03-19 00:00:00.000000'),(8,'1000',NULL,'Public','2016-06-15 00:00:00.000000'),(9,'0000','','admin-ingimar','2018-04-10 20:02:55.858000'),(10,'0000',NULL,'ingimar','2018-04-10 09:14:18.484000'),(11,'0000',NULL,'niclas','2018-04-10 11:20:44.744000'),(12,'0000',NULL,'thomas','2018-04-11 09:13:56.698000'),(13,'0000',NULL,'daniela','2018-10-24 13:13:11.112000');
/*!40000 ALTER TABLE `Groups` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-08 10:34:39
