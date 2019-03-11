-- MySQL dump 10.13  Distrib 5.6.43, for Linux (x86_64)
--
-- Host: localhost    Database: seqdbweb
-- ------------------------------------------------------
-- Server version	5.6.43

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
-- Table structure for table `AccountPreferences`
--

DROP TABLE IF EXISTS `AccountPreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AccountPreferences` (
  `PreferenceID` int(11) NOT NULL AUTO_INCREMENT,
  `LastModified` datetime(6) DEFAULT NULL,
  `PreferenceName` varchar(50) NOT NULL,
  `PreferenceValue` varchar(50) NOT NULL,
  `AccountID` int(11) DEFAULT NULL,
  PRIMARY KEY (`PreferenceID`),
  KEY `FK_est6u6oyjig1qej4vvsqpylk5` (`AccountID`),
  CONSTRAINT `FK_est6u6oyjig1qej4vvsqpylk5` FOREIGN KEY (`AccountID`) REFERENCES `Accounts` (`AccountID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AccountPreferences`
--

LOCK TABLES `AccountPreferences` WRITE;
/*!40000 ALTER TABLE `AccountPreferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `AccountPreferences` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `AccountProfiles`
--

DROP TABLE IF EXISTS `AccountProfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AccountProfiles` (
  `AccountProfileID` int(11) NOT NULL AUTO_INCREMENT,
  `LastModified` datetime(6) DEFAULT NULL,
  `AccountID` int(11) DEFAULT NULL,
  PRIMARY KEY (`AccountProfileID`),
  KEY `FK_mn2mclv3mcu6a5jjorxgewlta` (`AccountID`),
  CONSTRAINT `FK_mn2mclv3mcu6a5jjorxgewlta` FOREIGN KEY (`AccountID`) REFERENCES `Accounts` (`AccountID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AccountProfiles`
--

LOCK TABLES `AccountProfiles` WRITE;
/*!40000 ALTER TABLE `AccountProfiles` DISABLE KEYS */;
INSERT INTO `AccountProfiles` VALUES (1,'2013-03-19 00:00:00.000000',1),(2,'2013-03-19 00:00:00.000000',2),(3,'2018-04-10 09:14:18.431000',3),(4,'2018-04-10 11:20:44.552000',4),(5,'2018-04-11 09:13:56.641000',5),(6,'2018-10-24 13:13:11.100000',6);
/*!40000 ALTER TABLE `AccountProfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AccountUsage`
--

DROP TABLE IF EXISTS `AccountUsage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AccountUsage` (
  `AccountUsageID` int(11) NOT NULL AUTO_INCREMENT,
  `LastModified` datetime(6) DEFAULT NULL,
  `AccountID` int(11) DEFAULT NULL,
  `UsageID` int(11) DEFAULT NULL,
  PRIMARY KEY (`AccountUsageID`),
  KEY `FK_dxy68kqa1bjydnyckv4coh8hr` (`UsageID`),
  KEY `FK_opbodkrj8ctv9tyjol5g5xwwu` (`AccountID`),
  CONSTRAINT `FK_dxy68kqa1bjydnyckv4coh8hr` FOREIGN KEY (`UsageID`) REFERENCES `UsageKeys` (`UsageKeysID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_opbodkrj8ctv9tyjol5g5xwwu` FOREIGN KEY (`AccountID`) REFERENCES `Accounts` (`AccountID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AccountUsage`
--

LOCK TABLES `AccountUsage` WRITE;
/*!40000 ALTER TABLE `AccountUsage` DISABLE KEYS */;
/*!40000 ALTER TABLE `AccountUsage` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `AccountsGroups` VALUES (265,'\0','2013-03-19 00:00:00.000000','1111',1,1),(266,'\0','2013-03-19 00:00:00.000000','1111',2,2),(267,'\0','2013-03-19 00:00:00.000000','1111',1,3),(268,'\0','2013-03-19 00:00:00.000000','1111',2,3),(271,'\0','2018-04-10 20:09:49.685000','1111',3,9),(272,'\0','2018-04-10 20:11:54.085000','1111',4,1),(274,'\0','2018-04-11 09:28:45.779000','1111',1,9),(275,'\0','2018-04-11 09:33:05.204000','1111',5,9),(276,'\0','2018-10-24 13:13:11.120000','1111',6,13);
/*!40000 ALTER TABLE `AccountsGroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Addresses`
--

DROP TABLE IF EXISTS `Addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Addresses` (
  `AddressID` int(11) NOT NULL AUTO_INCREMENT,
  `AddressNote` longtext,
  `LastModified` datetime(6) DEFAULT NULL,
  `Locality` varchar(64) DEFAULT NULL,
  `OrganisationName` varchar(256) DEFAULT NULL,
  `OrganisationUnit` varchar(256) DEFAULT NULL,
  `PostalCode` varchar(64) DEFAULT NULL,
  `Street` varchar(256) DEFAULT NULL,
  `Country` int(11) DEFAULT NULL,
  `StateProvince` int(11) DEFAULT NULL,
  PRIMARY KEY (`AddressID`),
  KEY `FK_lx56ewrr853p17h0qt2qdu3r3` (`StateProvince`),
  KEY `FK_sn9a64qvbnm650bmmfj23v3p9` (`Country`),
  CONSTRAINT `FK_lx56ewrr853p17h0qt2qdu3r3` FOREIGN KEY (`StateProvince`) REFERENCES `Provinces` (`ProvinceId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_sn9a64qvbnm650bmmfj23v3p9` FOREIGN KEY (`Country`) REFERENCES `Countries` (`CountryId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Addresses`
--

LOCK TABLES `Addresses` WRITE;
/*!40000 ALTER TABLE `Addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `Addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Addresses_AUD`
--

DROP TABLE IF EXISTS `Addresses_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Addresses_AUD` (
  `AddressID` int(11) NOT NULL,
  `REV` int(11) NOT NULL,
  `REVTYPE` tinyint(3) DEFAULT NULL,
  `AddressNote` longtext,
  `Locality` varchar(64) DEFAULT NULL,
  `OrganisationName` varchar(256) DEFAULT NULL,
  `OrganisationUnit` varchar(256) DEFAULT NULL,
  `PostalCode` varchar(64) DEFAULT NULL,
  `Street` varchar(256) DEFAULT NULL,
  `Country` int(11) DEFAULT NULL,
  `StateProvince` int(11) DEFAULT NULL,
  PRIMARY KEY (`AddressID`,`REV`),
  KEY `FK_a52vr69j4yhujfvingbvgwti7` (`REV`),
  CONSTRAINT `FK_a52vr69j4yhujfvingbvgwti7` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Addresses_AUD`
--

LOCK TABLES `Addresses_AUD` WRITE;
/*!40000 ALTER TABLE `Addresses_AUD` DISABLE KEYS */;
/*!40000 ALTER TABLE `Addresses_AUD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Alleles`
--

DROP TABLE IF EXISTS `Alleles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Alleles` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Locus` varchar(255) DEFAULT NULL,
  `Number` int(11) DEFAULT NULL,
  `Size` varchar(255) DEFAULT NULL,
  `Value` int(11) DEFAULT NULL,
  `GenotypeID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_t3mag85pskyujqwuuiu3hvvy1` (`GenotypeID`,`Number`),
  CONSTRAINT `FK_imr3iov7t4b7c2fgtednxil3s` FOREIGN KEY (`GenotypeID`) REFERENCES `Genotypes` (`GenotypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Alleles`
--

LOCK TABLES `Alleles` WRITE;
/*!40000 ALTER TABLE `Alleles` DISABLE KEYS */;
/*!40000 ALTER TABLE `Alleles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Alleles_AUD`
--

DROP TABLE IF EXISTS `Alleles_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Alleles_AUD` (
  `ID` int(11) NOT NULL,
  `REV` int(11) NOT NULL,
  `REVTYPE` tinyint(3) DEFAULT NULL,
  `Locus` varchar(255) DEFAULT NULL,
  `Number` int(11) DEFAULT NULL,
  `Size` varchar(255) DEFAULT NULL,
  `Value` int(11) DEFAULT NULL,
  `GenotypeID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`,`REV`),
  KEY `FK_suc9oypbv4aigggkmbc16q14f` (`REV`),
  CONSTRAINT `FK_suc9oypbv4aigggkmbc16q14f` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Alleles_AUD`
--

LOCK TABLES `Alleles_AUD` WRITE;
/*!40000 ALTER TABLE `Alleles_AUD` DISABLE KEYS */;
/*!40000 ALTER TABLE `Alleles_AUD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ArrayTypes`
--

DROP TABLE IF EXISTS `ArrayTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ArrayTypes` (
  `ArrayTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` longtext,
  `LastModified` datetime(6) DEFAULT NULL,
  `Name` varchar(50) NOT NULL,
  `NumberOfColumns` int(11) NOT NULL,
  `NumberOfRows` int(11) NOT NULL,
  `NumberOfSpots` int(11) NOT NULL,
  `Provider` varchar(50) NOT NULL,
  PRIMARY KEY (`ArrayTypeID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ArrayTypes`
--

LOCK TABLES `ArrayTypes` WRITE;
/*!40000 ALTER TABLE `ArrayTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ArrayTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BarcodeableMaps`
--

DROP TABLE IF EXISTS `BarcodeableMaps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BarcodeableMaps` (
  `BarcodeableMapID` int(11) NOT NULL AUTO_INCREMENT,
  `BarcodeableEntity` varchar(255) NOT NULL,
  `BarcodeableMapName` varchar(255) NOT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `MapFile` varchar(255) NOT NULL,
  PRIMARY KEY (`BarcodeableMapID`),
  UNIQUE KEY `BarcodeableEntity` (`BarcodeableEntity`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BarcodeableMaps`
--

LOCK TABLES `BarcodeableMaps` WRITE;
/*!40000 ALTER TABLE `BarcodeableMaps` DISABLE KEYS */;
INSERT INTO `BarcodeableMaps` VALUES (1,'SpecimenReplicate','Specimen Map','2013-03-19 00:00:00.000000','Map file for Specimen'),(2,'Sample','Sample Map','2013-03-19 00:00:00.000000','Map file for Sample'),(3,'Container','Container Map','2013-03-19 00:00:00.000000','Map file for Container'),(4,'MixedSpecimen','Mixed Specimen Map','2013-03-19 00:00:00.000000','Map file for MixedSpecimen'),(5,'Product','Product Map','2013-03-19 00:00:00.000000','Map file for Product'),(6,'Storage','Storage Map','2013-03-19 00:00:00.000000','Map file for Storage'),(7,'PcrPrimer','PcrPrimer Map','2013-03-19 00:00:00.000000','Map file for PcrPrimer');
/*!40000 ALTER TABLE `BarcodeableMaps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BiologicalCollections`
--

DROP TABLE IF EXISTS `BiologicalCollections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BiologicalCollections` (
  `BiologicalCollectionID` int(11) NOT NULL AUTO_INCREMENT,
  `DatePublished` date DEFAULT NULL,
  `Description` longtext,
  `Language` varchar(20) DEFAULT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `LongName` varchar(512) DEFAULT NULL,
  `Name` varchar(50) NOT NULL,
  `WWW` varchar(100) DEFAULT NULL,
  `Address` int(11) DEFAULT NULL,
  `Contact` int(11) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  `LinkProgress` varchar(50) DEFAULT NULL,
  `LinkCompleted` datetime DEFAULT NULL,
  PRIMARY KEY (`BiologicalCollectionID`),
  UNIQUE KEY `UK_ska14t8hsm48ydpdbdn2mky27` (`Name`,`GroupID`),
  KEY `FK_3eu58lcf41l1fb5b83yomu44n` (`Contact`),
  KEY `FK_gbiqv9ercno7hkdmqp9svtbk5` (`GroupID`),
  KEY `FK_qtmk2q6w736xfc24hj9xbp4bw` (`Address`),
  CONSTRAINT `FK_3eu58lcf41l1fb5b83yomu44n` FOREIGN KEY (`Contact`) REFERENCES `People` (`PeopleID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_gbiqv9ercno7hkdmqp9svtbk5` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_qtmk2q6w736xfc24hj9xbp4bw` FOREIGN KEY (`Address`) REFERENCES `Addresses` (`AddressID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BiologicalCollections`
--

LOCK TABLES `BiologicalCollections` WRITE;
/*!40000 ALTER TABLE `BiologicalCollections` DISABLE KEYS */;
/*!40000 ALTER TABLE `BiologicalCollections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BiologicalCollections_AUD`
--

DROP TABLE IF EXISTS `BiologicalCollections_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BiologicalCollections_AUD` (
  `BiologicalCollectionID` int(11) NOT NULL,
  `REV` int(11) NOT NULL,
  `REVTYPE` tinyint(3) DEFAULT NULL,
  `DatePublished` date DEFAULT NULL,
  `Description` longtext,
  `Language` varchar(20) DEFAULT NULL,
  `LongName` varchar(512) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `WWW` varchar(100) DEFAULT NULL,
  `Address` int(11) DEFAULT NULL,
  `Contact` int(11) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  `LinkProgress` varchar(50) DEFAULT NULL,
  `LinkCompleted` datetime DEFAULT NULL,
  PRIMARY KEY (`BiologicalCollectionID`,`REV`),
  KEY `FK_odo8t97tysglk8nho27ejg69d` (`REV`),
  CONSTRAINT `FK_odo8t97tysglk8nho27ejg69d` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BiologicalCollections_AUD`
--

LOCK TABLES `BiologicalCollections_AUD` WRITE;
/*!40000 ALTER TABLE `BiologicalCollections_AUD` DISABLE KEYS */;
/*!40000 ALTER TABLE `BiologicalCollections_AUD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BlastHits`
--

DROP TABLE IF EXISTS `BlastHits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BlastHits` (
  `BlastHitID` int(11) NOT NULL AUTO_INCREMENT,
  `HitAccession` varchar(50) DEFAULT NULL,
  `HitBits` int(11) DEFAULT NULL,
  `HitDescription` longtext,
  `HitEnd` int(11) DEFAULT NULL,
  `HitFoundagain` bit(1) DEFAULT NULL,
  `HitLength` int(11) DEFAULT NULL,
  `HitName` varchar(255) NOT NULL,
  `HitQueryEnd` int(11) DEFAULT NULL,
  `HitQueryStart` int(11) DEFAULT NULL,
  `HitRank` int(11) DEFAULT NULL,
  `HitScore` int(11) DEFAULT NULL,
  `HitSignif` double DEFAULT NULL,
  `HitStart` int(11) DEFAULT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `NumHSP` int(11) DEFAULT NULL,
  `BlastResultID` int(11) DEFAULT NULL,
  PRIMARY KEY (`BlastHitID`),
  KEY `FK_teecm7ke2c04iprfxcfds7ump` (`BlastResultID`),
  CONSTRAINT `FK_teecm7ke2c04iprfxcfds7ump` FOREIGN KEY (`BlastResultID`) REFERENCES `BlastResults` (`BlastResultID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BlastHits`
--

LOCK TABLES `BlastHits` WRITE;
/*!40000 ALTER TABLE `BlastHits` DISABLE KEYS */;
/*!40000 ALTER TABLE `BlastHits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BlastHsps`
--

DROP TABLE IF EXISTS `BlastHsps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BlastHsps` (
  `BlastHspID` int(11) NOT NULL AUTO_INCREMENT,
  `Bitscore` float DEFAULT NULL,
  `HSPEValue` double DEFAULT NULL,
  `HSPFracCons` float DEFAULT NULL,
  `HSPFracIdent` float DEFAULT NULL,
  `HSPGaps` int(11) DEFAULT NULL,
  `HSPGroup` longtext,
  `HSPHitDescription` longtext,
  `HSPHitEnd` int(11) DEFAULT NULL,
  `HSPHitFrame` int(11) DEFAULT NULL,
  `HSPHitGaps` int(11) DEFAULT NULL,
  `HSPHitLength` int(11) DEFAULT NULL,
  `HSPHitName` varchar(50) DEFAULT NULL,
  `HSPHitSeq` longtext,
  `HSPHitStart` int(11) DEFAULT NULL,
  `HSPHomologySeq` longtext,
  `HSPLength` int(11) DEFAULT NULL,
  `HSPLinks` longtext,
  `HSPNumConserved` int(11) DEFAULT NULL,
  `HSPNumIdentical` int(11) DEFAULT NULL,
  `HSPPValue` float DEFAULT NULL,
  `HSPQueryDesc` longtext,
  `HSPQueryEnd` int(11) DEFAULT NULL,
  `HSPQueryFrame` int(11) DEFAULT NULL,
  `HSPQueryGaps` int(11) DEFAULT NULL,
  `HSPQueryLength` int(11) DEFAULT NULL,
  `HSPQueryName` varchar(50) DEFAULT NULL,
  `HSPQuerySequence` longtext,
  `HSPQueryStart` int(11) DEFAULT NULL,
  `HSPRank` int(11) DEFAULT NULL,
  `HSPScore` float DEFAULT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `BlastHitID` int(11) DEFAULT NULL,
  PRIMARY KEY (`BlastHspID`),
  KEY `FK_g48fynsesdt18nq3qoyjaxrbe` (`BlastHitID`),
  CONSTRAINT `FK_g48fynsesdt18nq3qoyjaxrbe` FOREIGN KEY (`BlastHitID`) REFERENCES `BlastHits` (`BlastHitID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BlastHsps`
--

LOCK TABLES `BlastHsps` WRITE;
/*!40000 ALTER TABLE `BlastHsps` DISABLE KEYS */;
/*!40000 ALTER TABLE `BlastHsps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BlastProjects`
--

DROP TABLE IF EXISTS `BlastProjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BlastProjects` (
  `BlastProjectID` int(11) NOT NULL AUTO_INCREMENT,
  `DateCreated` datetime(6) NOT NULL,
  `Description` longtext,
  `LastModified` datetime(6) DEFAULT NULL,
  `Name` varchar(255) NOT NULL,
  `Program` varchar(50) NOT NULL,
  `QueryDate` date NOT NULL,
  `QueryString` varchar(255) NOT NULL,
  `DatasetID` int(11) DEFAULT NULL,
  `ProjectID` int(11) DEFAULT NULL,
  PRIMARY KEY (`BlastProjectID`),
  UNIQUE KEY `Name` (`Name`),
  KEY `FK_bg9ucdvgtvkvoxjj9n1drmc61` (`DatasetID`),
  KEY `FK_e4661f4v6pobq6g9hun21acvq` (`ProjectID`),
  CONSTRAINT `FK_bg9ucdvgtvkvoxjj9n1drmc61` FOREIGN KEY (`DatasetID`) REFERENCES `Datasets` (`DatasetID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_e4661f4v6pobq6g9hun21acvq` FOREIGN KEY (`ProjectID`) REFERENCES `Projects` (`ProjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BlastProjects`
--

LOCK TABLES `BlastProjects` WRITE;
/*!40000 ALTER TABLE `BlastProjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `BlastProjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BlastResults`
--

DROP TABLE IF EXISTS `BlastResults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BlastResults` (
  `BlastResultID` int(11) NOT NULL AUTO_INCREMENT,
  `LastModified` datetime(6) DEFAULT NULL,
  `OutputDir` varchar(255) DEFAULT NULL,
  `OutputFile` varchar(255) DEFAULT NULL,
  `BlastProjectID` int(11) DEFAULT NULL,
  `SequenceID` int(11) DEFAULT NULL,
  PRIMARY KEY (`BlastResultID`),
  KEY `FK_1v78ota9iutr1glkyp57pmstn` (`SequenceID`),
  KEY `FK_34433uytluhaf06rdf46u3ava` (`BlastProjectID`),
  CONSTRAINT `FK_1v78ota9iutr1glkyp57pmstn` FOREIGN KEY (`SequenceID`) REFERENCES `Sequences` (`SequenceID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_34433uytluhaf06rdf46u3ava` FOREIGN KEY (`BlastProjectID`) REFERENCES `BlastProjects` (`BlastProjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BlastResults`
--

LOCK TABLES `BlastResults` WRITE;
/*!40000 ALTER TABLE `BlastResults` DISABLE KEYS */;
/*!40000 ALTER TABLE `BlastResults` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ClusterCons`
--

DROP TABLE IF EXISTS `ClusterCons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ClusterCons` (
  `ClusterConsID` int(11) NOT NULL,
  `ClusterProjectID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ClusterConsID`),
  KEY `FK_bhu3d918y3o4r7loipn3ynn1m` (`ClusterProjectID`),
  CONSTRAINT `FK_bhu3d918y3o4r7loipn3ynn1m` FOREIGN KEY (`ClusterProjectID`) REFERENCES `ClusterProjects` (`ClusterProjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_mb8baxn860mb530wmepcct0bj` FOREIGN KEY (`ClusterConsID`) REFERENCES `Sequences` (`SequenceID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ClusterCons`
--

LOCK TABLES `ClusterCons` WRITE;
/*!40000 ALTER TABLE `ClusterCons` DISABLE KEYS */;
/*!40000 ALTER TABLE `ClusterCons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ClusterCons_AUD`
--

DROP TABLE IF EXISTS `ClusterCons_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ClusterCons_AUD` (
  `ClusterConsID` int(11) NOT NULL,
  `REV` int(11) NOT NULL,
  `ClusterProjectID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ClusterConsID`,`REV`),
  CONSTRAINT `FK_hx2169dofldjeoofyapn2i8sc` FOREIGN KEY (`ClusterConsID`, `REV`) REFERENCES `Sequences_AUD` (`SequenceID`, `REV`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ClusterCons_AUD`
--

LOCK TABLES `ClusterCons_AUD` WRITE;
/*!40000 ALTER TABLE `ClusterCons_AUD` DISABLE KEYS */;
/*!40000 ALTER TABLE `ClusterCons_AUD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ClusterProjects`
--

DROP TABLE IF EXISTS `ClusterProjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ClusterProjects` (
  `ClusterProjectID` int(11) NOT NULL AUTO_INCREMENT,
  `AnnotSource` varchar(50) DEFAULT NULL,
  `Assembly` varchar(100) DEFAULT NULL,
  `AssemblyName` varchar(50) DEFAULT NULL,
  `ChimeraCheck` varchar(50) DEFAULT NULL,
  `DateCreated` datetime(6) DEFAULT NULL,
  `Description` longtext,
  `FinishingStrategy` varchar(100) DEFAULT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `Name` varchar(50) NOT NULL,
  `Sop` varchar(50) DEFAULT NULL,
  `Source` varchar(255) DEFAULT NULL,
  `Url` varchar(50) DEFAULT NULL,
  `GroupID` int(11) NOT NULL,
  `ProjectID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ClusterProjectID`),
  UNIQUE KEY `Name` (`Name`),
  KEY `FK_eom5gcyan5jrsd0luivtalhui` (`GroupID`),
  KEY `FK_svifa8l2op31413apv1d2unq4` (`ProjectID`),
  CONSTRAINT `FK_eom5gcyan5jrsd0luivtalhui` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_svifa8l2op31413apv1d2unq4` FOREIGN KEY (`ProjectID`) REFERENCES `Projects` (`ProjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ClusterProjects`
--

LOCK TABLES `ClusterProjects` WRITE;
/*!40000 ALTER TABLE `ClusterProjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `ClusterProjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ClusterSeqs`
--

DROP TABLE IF EXISTS `ClusterSeqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ClusterSeqs` (
  `ClusterSeqID` int(11) NOT NULL AUTO_INCREMENT,
  `AlignedEnd` int(11) DEFAULT NULL,
  `AlignedStart` int(11) DEFAULT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Seq` longtext,
  `Start` int(11) DEFAULT NULL,
  `Strand` int(11) DEFAULT NULL,
  `ClusterCons` int(11) DEFAULT NULL,
  `SequenceID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ClusterSeqID`),
  KEY `FK_72w0hbbiv2tho9lcoe2n8oa21` (`SequenceID`),
  KEY `FK_dsjxu448lo4iqpswif2ututtv` (`ClusterCons`),
  CONSTRAINT `FK_72w0hbbiv2tho9lcoe2n8oa21` FOREIGN KEY (`SequenceID`) REFERENCES `Sequences` (`SequenceID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_dsjxu448lo4iqpswif2ututtv` FOREIGN KEY (`ClusterCons`) REFERENCES `ClusterCons` (`ClusterConsID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ClusterSeqs`
--

LOCK TABLES `ClusterSeqs` WRITE;
/*!40000 ALTER TABLE `ClusterSeqs` DISABLE KEYS */;
/*!40000 ALTER TABLE `ClusterSeqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CollectionInfos`
--

DROP TABLE IF EXISTS `CollectionInfos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CollectionInfos` (
  `CollectionInfoID` int(11) NOT NULL AUTO_INCREMENT,
  `AirTemperature` varchar(10) DEFAULT NULL,
  `BasinName` varchar(100) DEFAULT NULL,
  `City` varchar(200) DEFAULT NULL,
  `Collector` varchar(200) DEFAULT NULL,
  `CollectorType` varchar(50) DEFAULT NULL,
  `Continent` varchar(50) DEFAULT NULL,
  `CoordinateSystem` varchar(100) DEFAULT NULL,
  `Coordinates` varchar(100) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `Day` varchar(10) DEFAULT NULL,
  `DecimalCoordinateSystem` varchar(100) DEFAULT NULL,
  `DecimalLatitude` float DEFAULT NULL,
  `DecimalLongitude` float DEFAULT NULL,
  `Depth` varchar(20) DEFAULT NULL,
  `EcoRegions` varchar(100) DEFAULT NULL,
  `Effort` varchar(50) DEFAULT NULL,
  `Elevation` varchar(50) DEFAULT NULL,
  `EndDay` varchar(10) DEFAULT NULL,
  `EndMonth` varchar(10) DEFAULT NULL,
  `EndYear` varchar(10) DEFAULT NULL,
  `EventTime` varchar(50) DEFAULT NULL,
  `FilterSize` varchar(50) DEFAULT NULL,
  `GeoreferencedBy` varchar(50) DEFAULT NULL,
  `GeoreferencedDate` date DEFAULT NULL,
  `GPSSource` varchar(50) DEFAULT NULL,
  `Habitat` varchar(50) DEFAULT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `Latitude` varchar(100) DEFAULT NULL,
  `Longitude` varchar(100) DEFAULT NULL,
  `Month` varchar(10) DEFAULT NULL,
  `Notes` longtext,
  `Preparations` varchar(100) DEFAULT NULL,
  `Province` varchar(50) DEFAULT NULL,
  `RainFall` varchar(50) DEFAULT NULL,
  `RainVolumeCollected` varchar(50) DEFAULT NULL,
  `Region` varchar(50) DEFAULT NULL,
  `RiverStreamName` varchar(100) DEFAULT NULL,
  `SampleSource` varchar(100) DEFAULT NULL,
  `SamplerCollectionDate` date DEFAULT NULL,
  `SamplerInstallationDate` date DEFAULT NULL,
  `Sector` varchar(50) DEFAULT NULL,
  `Site` varchar(200) DEFAULT NULL,
  `SiteCodes` varchar(50) DEFAULT NULL,
  `StreamOrder` int(11) DEFAULT NULL,
  `Week` varchar(50) DEFAULT NULL,
  `Year` varchar(10) DEFAULT NULL,
  `ProtocolID` int(11) DEFAULT NULL,
  `DecimalLatitude_OLD` varchar(100) DEFAULT NULL,
  `DecimalLongitude_OLD` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CollectionInfoID`),
  KEY `FK_s238mngbvqv10t8lwkgqb81xc` (`ProtocolID`),
  KEY `collectionInfo_city_idx` (`City`),
  CONSTRAINT `FK_s238mngbvqv10t8lwkgqb81xc` FOREIGN KEY (`ProtocolID`) REFERENCES `Protocols` (`ProtocolID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CollectionInfos`
--

LOCK TABLES `CollectionInfos` WRITE;
/*!40000 ALTER TABLE `CollectionInfos` DISABLE KEYS */;
/*!40000 ALTER TABLE `CollectionInfos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CollectionInfos_AUD`
--

DROP TABLE IF EXISTS `CollectionInfos_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CollectionInfos_AUD` (
  `CollectionInfoID` int(11) NOT NULL,
  `REV` int(11) NOT NULL,
  `REVTYPE` tinyint(3) DEFAULT NULL,
  `AirTemperature` varchar(10) DEFAULT NULL,
  `BasinName` varchar(100) DEFAULT NULL,
  `City` varchar(200) DEFAULT NULL,
  `Collector` varchar(200) DEFAULT NULL,
  `CollectorType` varchar(50) DEFAULT NULL,
  `Continent` varchar(50) DEFAULT NULL,
  `CoordinateSystem` varchar(100) DEFAULT NULL,
  `Coordinates` varchar(100) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `Day` varchar(10) DEFAULT NULL,
  `DecimalCoordinateSystem` varchar(100) DEFAULT NULL,
  `DecimalLatitude` float DEFAULT NULL,
  `DecimalLongitude` float DEFAULT NULL,
  `Depth` varchar(20) DEFAULT NULL,
  `EcoRegions` varchar(100) DEFAULT NULL,
  `Effort` varchar(50) DEFAULT NULL,
  `Elevation` varchar(50) DEFAULT NULL,
  `EndDay` varchar(10) DEFAULT NULL,
  `EndMonth` varchar(10) DEFAULT NULL,
  `EndYear` varchar(10) DEFAULT NULL,
  `EventTime` varchar(50) DEFAULT NULL,
  `FilterSize` varchar(50) DEFAULT NULL,
  `GeoreferencedBy` varchar(50) DEFAULT NULL,
  `GeoreferencedDate` date DEFAULT NULL,
  `GPSSource` varchar(50) DEFAULT NULL,
  `Habitat` varchar(50) DEFAULT NULL,
  `Latitude` varchar(100) DEFAULT NULL,
  `Longitude` varchar(100) DEFAULT NULL,
  `Month` varchar(10) DEFAULT NULL,
  `Notes` longtext,
  `Preparations` varchar(100) DEFAULT NULL,
  `Province` varchar(50) DEFAULT NULL,
  `RainFall` varchar(50) DEFAULT NULL,
  `RainVolumeCollected` varchar(50) DEFAULT NULL,
  `Region` varchar(50) DEFAULT NULL,
  `RiverStreamName` varchar(100) DEFAULT NULL,
  `SampleSource` varchar(100) DEFAULT NULL,
  `SamplerCollectionDate` date DEFAULT NULL,
  `SamplerInstallationDate` date DEFAULT NULL,
  `Sector` varchar(50) DEFAULT NULL,
  `Site` varchar(200) DEFAULT NULL,
  `SiteCodes` varchar(50) DEFAULT NULL,
  `StreamOrder` int(11) DEFAULT NULL,
  `Week` varchar(50) DEFAULT NULL,
  `Year` varchar(10) DEFAULT NULL,
  `ProtocolID` int(11) DEFAULT NULL,
  `DecimalLatitude_OLD` varchar(100) DEFAULT NULL,
  `DecimalLongitude_OLD` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CollectionInfoID`,`REV`),
  KEY `FK_1xm6fatpxmudxlvx20wg8n5h5` (`REV`),
  CONSTRAINT `FK_1xm6fatpxmudxlvx20wg8n5h5` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CollectionInfos_AUD`
--

LOCK TABLES `CollectionInfos_AUD` WRITE;
/*!40000 ALTER TABLE `CollectionInfos_AUD` DISABLE KEYS */;
/*!40000 ALTER TABLE `CollectionInfos_AUD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ContainerTypes`
--

DROP TABLE IF EXISTS `ContainerTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ContainerTypes` (
  `ContainerTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `BaseType` varchar(50) NOT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `Name` varchar(50) NOT NULL,
  `NumberOfColumns` int(11) NOT NULL,
  `NumberOfRows` int(11) NOT NULL,
  `NumberOfWells` int(11) NOT NULL,
  `GroupID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ContainerTypeID`),
  UNIQUE KEY `UK_ij5h5jfwxkt0ppev6h0ra5cqo` (`Name`,`GroupID`),
  KEY `FK_jhw6u82ksauethycw3p0nuadr` (`GroupID`),
  CONSTRAINT `FK_jhw6u82ksauethycw3p0nuadr` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ContainerTypes`
--

LOCK TABLES `ContainerTypes` WRITE;
/*!40000 ALTER TABLE `ContainerTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ContainerTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Containers`
--

DROP TABLE IF EXISTS `Containers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Containers` (
  `ContainerID` int(11) NOT NULL AUTO_INCREMENT,
  `ContainerNumber` varchar(50) NOT NULL,
  `FillByRow` bit(1) NOT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `ContainerTypeID` int(11) NOT NULL,
  `GroupID` int(11) DEFAULT NULL,
  `StorageID` int(11) DEFAULT NULL,
  `UnitSectionID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ContainerID`),
  UNIQUE KEY `UK_rllpdna6qkanrondp46qn6a41` (`ContainerNumber`,`StorageID`,`GroupID`),
  KEY `FK_4hmy3nk8ec60v0ahr5fpr7vny` (`UnitSectionID`),
  KEY `FK_8b01ws3lovo12oxco33193f2n` (`GroupID`),
  KEY `FK_qrjwbqax7ro6uos8jllr4noyi` (`StorageID`),
  KEY `FK_sii753dw6tfwj8lc4iokho2q` (`ContainerTypeID`),
  CONSTRAINT `FK_4hmy3nk8ec60v0ahr5fpr7vny` FOREIGN KEY (`UnitSectionID`) REFERENCES `UnitSections` (`UnitSectionID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_8b01ws3lovo12oxco33193f2n` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_qrjwbqax7ro6uos8jllr4noyi` FOREIGN KEY (`StorageID`) REFERENCES `Storages` (`StorageID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_sii753dw6tfwj8lc4iokho2q` FOREIGN KEY (`ContainerTypeID`) REFERENCES `ContainerTypes` (`ContainerTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Containers`
--

LOCK TABLES `Containers` WRITE;
/*!40000 ALTER TABLE `Containers` DISABLE KEYS */;
/*!40000 ALTER TABLE `Containers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Countries`
--

DROP TABLE IF EXISTS `Countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Countries` (
  `CountryId` int(11) NOT NULL AUTO_INCREMENT,
  `Abbrev` varchar(100) DEFAULT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `Name` varchar(512) NOT NULL,
  `Note` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`CountryId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Countries`
--

LOCK TABLES `Countries` WRITE;
/*!40000 ALTER TABLE `Countries` DISABLE KEYS */;
/*!40000 ALTER TABLE `Countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES ('1534191846802-1','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:21',1,'EXECUTED','7:060588ba59a6eee73f01cb371bc99bad','createTable tableName=AccountPreferences','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-2','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:21',2,'EXECUTED','7:9f70b6f53cbfe3dcc4ce7c47ed76f80a','createTable tableName=AccountProfilePrinters','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-3','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:21',3,'EXECUTED','7:53709bd264c4c26c246b4b5b6f57c960','createTable tableName=AccountProfiles','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-4','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:21',4,'EXECUTED','7:0d1f836854ae5580522e6ed12abb9b0f','createTable tableName=AccountUsage','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-5','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:21',5,'EXECUTED','7:7d8e64958f666ceef31a67250270ed16','createTable tableName=Accounts','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-6','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:21',6,'EXECUTED','7:5234142af0ca34638dab8c19fa5b8d4f','createTable tableName=AccountsGroups','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-7','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:21',7,'EXECUTED','7:22919219eb6befbaaee5fd6223bf71d7','createTable tableName=Addresses','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-8','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:21',8,'EXECUTED','7:7ad1750cd8b5c246d8ef15ed99c4094a','createTable tableName=Addresses_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-9','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:22',9,'EXECUTED','7:2f6cb0f1f8552ccffafc5037be501433','createTable tableName=Alleles','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-10','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:22',10,'EXECUTED','7:59d843da86ad8f9447af35f5ac92e645','createTable tableName=Alleles_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-11','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:22',11,'EXECUTED','7:61801badd8839b76f628198b7bd13e8a','createTable tableName=AnnotationGroups','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-12','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:22',12,'EXECUTED','7:c430b77fd763e84b416f5718059495b7','createTable tableName=AnnotationTypes','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-13','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:22',13,'EXECUTED','7:ec8b2a47c3cefe3db84bc3cd684cd290','createTable tableName=Annotations','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-14','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:22',14,'EXECUTED','7:61214c3ab763b4d20ba8c95025811708','createTable tableName=ArrayTypes','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-15','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:22',15,'EXECUTED','7:27434b2577ee4f8bc6870085045ad6e9','createTable tableName=BarcodeableMaps','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-16','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:22',16,'EXECUTED','7:f321884c07b5a16688a34bedf77e1bcb','createTable tableName=BiologicalCollections','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-17','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:22',17,'EXECUTED','7:e578adc714fcd61a1394ef67ca724caa','createTable tableName=BiologicalCollections_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-18','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:22',18,'EXECUTED','7:59adae3faf13bc5cc355c502cf2391fb','createTable tableName=BlastHits','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-19','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:22',19,'EXECUTED','7:178dd56a8aff27fc6e35a84a3ae63c22','createTable tableName=BlastHsps','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-20','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:22',20,'EXECUTED','7:844d6c9b9362c22ced307e1daae1ca66','createTable tableName=BlastProjects','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-21','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:22',21,'EXECUTED','7:5718f17ca1fd6f5b48342ddbc5d4ce35','createTable tableName=BlastResults','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-22','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:22',22,'EXECUTED','7:4b93e73da2db702634659afbb12f8ff2','createTable tableName=Clones','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-23','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:22',23,'EXECUTED','7:4fd02a6adb8168c32b54f5df551d5fdb','createTable tableName=ClusterCons','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-24','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:22',24,'EXECUTED','7:d35bec2bb482a10d2916c5c510aa08e6','createTable tableName=ClusterCons_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-25','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:22',25,'EXECUTED','7:e005fc42241e60d6d488757de6ce257f','createTable tableName=ClusterProjects','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-26','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:22',26,'EXECUTED','7:18c6b4e29c5c0a1d3e7c318c4297e2b5','createTable tableName=ClusterSeqs','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-27','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:22',27,'EXECUTED','7:9d26c898f627de471cf961068570be29','createTable tableName=CollectionInfos','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-28','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:22',28,'EXECUTED','7:da8f8ffdd1d18edfceb26c495a2ac876','createTable tableName=CollectionInfos_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-29','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:22',29,'EXECUTED','7:de25314eafa22c5f4b8a8ea114a7662c','createTable tableName=ContainerTypes','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-30','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:22',30,'EXECUTED','7:87ebf3bc3445b00a91d6dc3d491d31db','createTable tableName=Containers','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-31','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:22',31,'EXECUTED','7:3b4016b4a1abf8fedc7bd188bffc6b5f','createTable tableName=Countries','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-32','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:22',32,'EXECUTED','7:9cc0a404a9da4e2dc3415d1aad67df81','createTable tableName=Datasets','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-33','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:22',33,'EXECUTED','7:b58f817041fd0ad80a9ba52b5d2dcd8d','createTable tableName=EmailAddrs','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-34','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:23',34,'EXECUTED','7:21c79481d58e9b61c47e6be9fff48349','createTable tableName=Events','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-35','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:23',35,'EXECUTED','7:a7f68cd7b4a1f1579b0f3848890a6d83','createTable tableName=FeatureLocations','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-36','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:23',36,'EXECUTED','7:aa3b338543de44b250eb80001c279abb','createTable tableName=FeatureLocations_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-37','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:23',37,'EXECUTED','7:a41374d68f32c8a2da56ce5a894a5abb','createTable tableName=Features','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-38','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:23',38,'EXECUTED','7:4ff1e4170d68db6c0baba7eecc5bfada','createTable tableName=Features_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-39','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:23',39,'EXECUTED','7:b4e5a1f2c1015eaa22de1f65dd0f704e','createTable tableName=FileSystemWatcherEntry','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-40','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:23',40,'EXECUTED','7:de2693d866cd214c57962db56611be27','createTable tableName=Fragments','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-41','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:23',41,'EXECUTED','7:c4285078f793d3e28df547c4739054c8','createTable tableName=Fragments_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-42','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:23',42,'EXECUTED','7:59679420ce406c7188611b4d9d11a8b5','createTable tableName=FungalInfos','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-43','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:23',43,'EXECUTED','7:b561f24cb995cd3fba92e4b695656671','createTable tableName=FungalInfos_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-44','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:23',44,'EXECUTED','7:e327b6c9bd8fc57c29150080de568f92','createTable tableName=Genotypes','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-45','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:23',45,'EXECUTED','7:090b33922494f81c98f2b278d8296307','createTable tableName=Genotypes_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-46','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:23',46,'EXECUTED','7:ac2c859419af54c90b01380e56ea306f','createTable tableName=GoHits','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-47','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:23',47,'EXECUTED','7:5661f735df06cbc8fcacb7e6e1e380af','createTable tableName=GoProjects','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-48','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:23',48,'EXECUTED','7:34c185de3f524c859dd629454fb759e8','createTable tableName=Groups','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-49','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:23',49,'EXECUTED','7:c6588246a1d2861788e0f2b3d7a1d7ae','createTable tableName=Hosts','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-50','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:23',50,'EXECUTED','7:bf18972218b466d29935eceede5bc391','createTable tableName=Hosts_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-51','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:23',51,'EXECUTED','7:37438142711667a427b5cf2efeb63180','createTable tableName=HybProjects','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-52','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:23',52,'EXECUTED','7:8342bb0bc7868e3720254110cd2e601e','createTable tableName=HybProjectsProjects','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-53','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:23',53,'EXECUTED','7:a007751be1bc5c282b4b437f44fcfb8d','createTable tableName=Hybridizations','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-54','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:23',54,'EXECUTED','7:c881e0b6d4141663a95579a40766164d','createTable tableName=Identifications','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-55','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:23',55,'EXECUTED','7:8b5c4bea09e234914e01b2af5269bee2','createTable tableName=Identifications_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-56','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:23',56,'EXECUTED','7:d03827f3cbdcc9915dd66ec0e8380927','createTable tableName=ImportPermitAttach','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-57','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:23',57,'EXECUTED','7:b9b546e599aff225097ea79202b53558','createTable tableName=ImportPermitEvents','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-58','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:23',58,'EXECUTED','7:c57200d820b2b383547a0801dbab4e2a','createTable tableName=ImportPermitEvents_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-59','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:23',59,'EXECUTED','7:82c3797f92206f91f02c071b8038d044','createTable tableName=ImportPermits','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-60','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:23',60,'EXECUTED','7:00c054fd3d0ec2717fe18c51373d95a2','createTable tableName=ImportPermits_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-61','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:24',61,'EXECUTED','7:f32ca586e4fec9a3abfcf624e45ed265','createTable tableName=LabelFormats','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-62','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:24',62,'EXECUTED','7:6f5abf91febdedfa68ef64abd0d8e07c','createTable tableName=LabelTemplates','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-63','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:24',63,'EXECUTED','7:3f83ca69f04677471fa9b64b6aa3b7e2','createTable tableName=Lexicon','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-64','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:24',64,'EXECUTED','7:855f5055da0fec6dafb090e55b8a3b75','createTable tableName=LexiconUsage','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-65','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:24',65,'EXECUTED','7:56c1325311e74ef1f9422a492924f93c','createTable tableName=Libraries','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-66','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:24',66,'EXECUTED','7:a5c9bb2a8b4b8ebc9c5fbc965a577862','createTable tableName=LibrariesProjects','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-67','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:24',67,'EXECUTED','7:b02625048eedf43f4e13431d7e26848d','createTable tableName=LoanAct','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-68','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:24',68,'EXECUTED','7:40833a723692e22e5a4ebe9c4f090a77','createTable tableName=LoanAttach','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-69','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:24',69,'EXECUTED','7:9b0c6d263233aba95ffc1370ac2edd99','createTable tableName=LoanForm','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-70','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:24',70,'EXECUTED','7:13d92465011ff4e085af9f8505c31e73','createTable tableName=Locations','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-71','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:24',71,'EXECUTED','7:f5dceddea94e9b660da36e7596bb2078','createTable tableName=MixedSpecimenAttach','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-72','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:24',72,'EXECUTED','7:7122d0df39668c38bcb9be4de6832d9a','createTable tableName=MixedSpecimens','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-73','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:24',73,'EXECUTED','7:518784f1bf57ecb887e5b3645dfdc121','createTable tableName=MixedSpecimens_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-74','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:24',74,'EXECUTED','7:9dbe53a8766c2de0a743aabbd0b11c03','createTable tableName=MixsSpecification','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-75','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:24',75,'EXECUTED','7:bcc1764e2fead3bd4aa60c562b792a7c','createTable tableName=MixsSpecification_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-76','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:24',76,'EXECUTED','7:08d715ad7691dafef0f5f471b0d12cf4','createTable tableName=PcrBatchAttach','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-77','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:24',77,'EXECUTED','7:dd165edf3a03e8ffd7a8be5974c3dee9','createTable tableName=PcrBatchs','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-78','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:24',78,'EXECUTED','7:dbe7462bc60e041b3963b46132314e63','createTable tableName=PcrBatchs_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-79','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:24',79,'EXECUTED','7:23fd5a9957da9ffc56934050b53ae7e1','createTable tableName=PcrPrimers','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-80','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:24',80,'EXECUTED','7:345685a0dd55838c356d2e52e7bd4a44','createTable tableName=PcrPrimers_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-81','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:24',81,'EXECUTED','7:387a8a5f16cfe08c988b6706279811df','createTable tableName=PcrProfiles','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-82','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:24',82,'EXECUTED','7:311937e463462b532b8a17b2ec8863c1','createTable tableName=PcrProfiles_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-83','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:24',83,'EXECUTED','7:03e53fcc77a846285df79c0c12a66bd9','createTable tableName=PcrReactions','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-84','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:24',84,'EXECUTED','7:faef10e656f3fd4f60f389beccfbc95b','createTable tableName=PcrReactions_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-85','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:24',85,'EXECUTED','7:ab86981f76e5036b15f6b61118be3c59','createTable tableName=People','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-86','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:24',86,'EXECUTED','7:6f947a697002b7411caaf4942a4d86e2','createTable tableName=PeopleAddresses','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-87','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:24',87,'EXECUTED','7:be0a33850d05e650b3d1a87482419290','createTable tableName=PeopleGroups','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-88','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:25',88,'EXECUTED','7:c7d4eb998775e7a0c1a4e83c030e5924','createTable tableName=Printers','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-89','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:25',89,'EXECUTED','7:0f6f03e035e94fa4ccf3cf8c42d199fd','createTable tableName=Products','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-90','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:25',90,'EXECUTED','7:3fc14b195e27f1e299498a492fa92c28','createTable tableName=Products_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-91','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:25',91,'EXECUTED','7:35b17eb7cea77eb1fcf27479dd2f78e0','createTable tableName=ProjectTags','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-92','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:25',92,'EXECUTED','7:2437fe3d5a7d3e26b181b2adcbf3718c','createTable tableName=ProjectTags_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-93','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:25',93,'EXECUTED','7:f7fe29ddbf7f1004dc07fe1a511fa629','createTable tableName=Projects','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-94','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:25',94,'EXECUTED','7:62b0d867c8ee6df65fb1b1886b26cfdb','createTable tableName=ProjectsProject','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-95','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:25',95,'EXECUTED','7:3631fd61f17ebff25c380d36433144a9','createTable tableName=ProtocolAttach','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-96','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:25',96,'EXECUTED','7:57bcf5c0a361e11b857200923e93c6fc','createTable tableName=Protocols','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-97','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:25',97,'EXECUTED','7:67d246c8f83d6e6c2ce3a5c03707d74e','createTable tableName=Protocols_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-98','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:25',98,'EXECUTED','7:e3ce82074d4f20cb1298fbe20d6e3989','createTable tableName=ProviderChains','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-99','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:25',99,'EXECUTED','7:022f05c174ab68c1d20fd88a909de3d6','createTable tableName=ProviderChains_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-100','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:25',100,'EXECUTED','7:b8370d4bc99e1ac1df22482b841919c8','createTable tableName=Provinces','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-101','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:25',101,'EXECUTED','7:ba6072cb6eb7b1c3331140254b6cd787','createTable tableName=ReactionComponents','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-102','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:25',102,'EXECUTED','7:2348f7ea22933ff882e6b5038c978286','createTable tableName=Refs','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-103','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:25',103,'EXECUTED','7:73f8cab109351e3e2ca2e7c1d0826b6e','createTable tableName=Regions','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-104','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:25',104,'EXECUTED','7:0f0cd6989532e4488889f2ab239f77ea','createTable tableName=Regions_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-105','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:25',105,'EXECUTED','7:2a8b0162556e1c691b33a626da3641dc','createTable tableName=Revision','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-106','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:25',106,'EXECUTED','7:5a92a9dd4a8a5e76f2fd4d6a116223dc','createTable tableName=SampleAttach','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-107','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:25',107,'EXECUTED','7:2d90d067dddede94fad7ae536655ad19','createTable tableName=Samples','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-108','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:25',108,'EXECUTED','7:28edfa6137d2ce0d3d9f8b6e2e687690','createTable tableName=Samples_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-109','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:25',109,'EXECUTED','7:2abc01fc53c840dc9a4fd5601f85d5b3','createTable tableName=SeqBatchs','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-110','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:25',110,'EXECUTED','7:683abf41b5753b63500a1c26a9c3ed35','createTable tableName=SeqBatchs_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-111','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:25',111,'EXECUTED','7:607495d280941dd2ac74f1cbfb0c1dee','createTable tableName=SeqMethods','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-112','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:25',112,'EXECUTED','7:7c8097bba7214e1b5da4c6e8c0d150fc','createTable tableName=SeqProjects','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-113','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:25',113,'EXECUTED','7:d958e6dd7bb008525ee0e4289c873608','createTable tableName=SeqProjectsProjects','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-114','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:26',114,'EXECUTED','7:249075f1b8c42c1087e78636127cc6d2','createTable tableName=SeqProjectsSequences','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-115','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:26',115,'EXECUTED','7:f8156d0735b274129307356d94481316','createTable tableName=SeqReactions','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-116','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:26',116,'EXECUTED','7:496e94051e85d3b589d7d6da264e5026','createTable tableName=SeqReactions_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-117','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:26',117,'EXECUTED','7:294a68dbdf5b4673f39fd443d2bc019e','createTable tableName=SeqSources','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-118','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:26',118,'EXECUTED','7:849e99134985e80e8072e17664c1fc30','createTable tableName=SeqSources_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-119','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:26',119,'EXECUTED','7:b46596c58572d6f3a578555024bebe71','createTable tableName=SeqSubmissionConfigs','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-120','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:26',120,'EXECUTED','7:e3a11835ca98d3b63f7bb82e2049c002','createTable tableName=SeqSubmissionConfigs_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-121','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:26',121,'EXECUTED','7:81f2a95e2caf95cdb6c993646f3854b8','createTable tableName=SeqSubmissions','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-122','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:26',122,'EXECUTED','7:db7f991edb7ad53a5372b7d0503912b5','createTable tableName=SeqSubmissions_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-123','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:26',123,'EXECUTED','7:8032ceeb17a990283d39f2f609be5cb2','createTable tableName=SequenceData','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-124','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:26',124,'EXECUTED','7:33fd47ffb6b8d81437e6e85b1b000cf2','createTable tableName=Sequences','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-125','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:26',125,'EXECUTED','7:a65779191da070149bbb4d0222001df5','createTable tableName=Sequences_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-126','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:26',126,'EXECUTED','7:39854f3e58efe92009a265d3c73bd270','createTable tableName=SpecimenAttach','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-127','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:26',127,'EXECUTED','7:916f7aef9f4c92affcb8591baecbe397','createTable tableName=SpecimenBatchJobs','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-128','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:26',128,'EXECUTED','7:3f7435d82f0dbec5c8e2ea91f4de88a8','createTable tableName=SpecimenReplicates','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-129','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:26',129,'EXECUTED','7:3bc5cab062a75ecd229a323c4bce7340','createTable tableName=SpecimenReplicates_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-130','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:26',130,'EXECUTED','7:9af61fda01e21e7a2799030934e54e8c','createTable tableName=Specimens','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-131','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:26',131,'EXECUTED','7:d7f827369fc73163930705e8310c3bc0','createTable tableName=Specimens_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-132','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:26',132,'EXECUTED','7:40a0fe09accf178d616c89c90791aae1','createTable tableName=Spots','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-133','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:26',133,'EXECUTED','7:924ac4e9ee12d5470a039160eb81f369','createTable tableName=SpreadSheetColumns','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-134','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:26',134,'EXECUTED','7:aff401dd0877a2fab855c633744ded77','createTable tableName=SpreadSheetTemplates','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-135','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:26',135,'EXECUTED','7:230d01f6cde7a444b9821ac81a726be3','createTable tableName=Storages','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-136','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:26',136,'EXECUTED','7:ab959e6ac30822225bb541344b264942','createTable tableName=SubmissionFacilitys','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-137','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:26',137,'EXECUTED','7:dff44150652b679641786e8bead578b0','createTable tableName=SubmissionFacilitys_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-138','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:26',138,'EXECUTED','7:810df2ea594b8c1257431a20c897024e','createTable tableName=TagFragment','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-139','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:26',139,'EXECUTED','7:69463db016688305e98fe4b2b1e688f8','createTable tableName=TagMixedSpecimen','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-140','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:27',140,'EXECUTED','7:58adbf7ec62ad0afd470b3554569e47b','createTable tableName=TagSample','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-141','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:27',141,'EXECUTED','7:a47dc989fb7ec3d9f9dc40280e128e04','createTable tableName=TagSequence','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-142','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:27',142,'EXECUTED','7:4e16b29077dac84b6e2863fa9334da32','createTable tableName=TagSpecimen','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-143','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:27',143,'EXECUTED','7:193b70579cd70c0caae43da81b8b1430','createTable tableName=TaskArguments','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-144','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:27',144,'EXECUTED','7:a606a872533df01d4e108b72d6d844b0','createTable tableName=Tasks','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-145','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:27',145,'EXECUTED','7:d9dc34d2ed5341dbd61ff79c4b6e1f8d','createTable tableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-146','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:27',146,'EXECUTED','7:96992dedc5769656ea0c96eaff42000a','createTable tableName=Taxa_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-147','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:27',147,'EXECUTED','7:4b03d68549b41eee2be4b9c7293a9b02','createTable tableName=TaxonInfo','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-148','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:27',148,'EXECUTED','7:4bb00eda9775bf36b7ca7076ba2dce99','createTable tableName=TaxonLink','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-149','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:27',149,'EXECUTED','7:0b6657b6092df3ee7e1aef79e06a4c15','createTable tableName=TaxonRank','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-150','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:27',150,'EXECUTED','7:77137af0cf96c628f127b6a1457b1168','createTable tableName=TaxonRank_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-151','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:27',151,'EXECUTED','7:4f6445045a0500dae8c99be57a1aec76','createTable tableName=Taxonomys','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-152','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:27',152,'EXECUTED','7:c623648343b5c97980e4b785b00cf9d1','createTable tableName=Taxonomys_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-153','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:27',153,'EXECUTED','7:810d440c6fdd36c13f2d7b25764257d8','createTable tableName=UnitSections','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-154','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:27',154,'EXECUTED','7:af7b1b86c74cd91457f42401ec7f2acc','createTable tableName=UsageKeys','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-155','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:27',155,'EXECUTED','7:ebd26338b4e5b196fe23100454521528','createTable tableName=ValidationFields','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-156','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:27',156,'EXECUTED','7:be69d40e8ffd7bb839a1db26bdc11901','createTable tableName=ValidationRules','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-157','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:27',157,'EXECUTED','7:3692bfe0804bd8f1f9816683a584c001','createTable tableName=Vectors','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-158','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:27',158,'EXECUTED','7:a42892559255767d0591cc240fc526e9','addUniqueConstraint constraintName=UK_1aqcmkjwtipu7d9j70hud3j0i, tableName=Samples','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-159','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:27',159,'EXECUTED','7:7789cb9d8452eb5aa98286bde70fad03','addUniqueConstraint constraintName=UK_2lncrb3eeq94xa1jbpu6pvo46, tableName=ValidationRules','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-160','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:27',160,'EXECUTED','7:6ed1f6d842231119f92168499a4634b1','addUniqueConstraint constraintName=UK_4vdjkm1n5topaxbj6fe1o5vs4, tableName=SeqSubmissionConfigs','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-161','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:27',161,'EXECUTED','7:e22cad0855a3fcb213c962b2ccfd8b1c','addUniqueConstraint constraintName=UK_50e95w5itu8crcsj5xjsc0ljp, tableName=UnitSections','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-162','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:27',162,'EXECUTED','7:e96b0745dd04f91d48a0bfe02f8aa370','addUniqueConstraint constraintName=UK_6dqe9e661sij0cvomp30hjd66, tableName=SeqSubmissions','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-163','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:27',163,'EXECUTED','7:52b77b52b9e3f5726d6b80f9bebb43ee','addUniqueConstraint constraintName=UK_7pw7de7lhx3e8i1c68trdv2co, tableName=SeqBatchs','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-164','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:27',164,'EXECUTED','7:0811648f04e9f7c3d8d0373125723502','addUniqueConstraint constraintName=UK_7sa4mdiir7g4x2bcydhd5r9w2, tableName=PcrProfiles','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-165','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:27',165,'EXECUTED','7:e7ee6275c63fcecd61b0b312d433fd43','addUniqueConstraint constraintName=UK_9rlls40vfmcvrg63wc6e9fig, tableName=Protocols','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-166','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:27',166,'EXECUTED','7:47533d8d0e167b17045b1fc0f7752bb5','addUniqueConstraint constraintName=UK_9y5yb24tcp3iunfpr4mc68uyv, tableName=SeqReactions','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-167','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:27',167,'EXECUTED','7:308125822bf46b542de65364eb0229fb','addUniqueConstraint constraintName=UK_dltslxx4u78lx3eoye0rgfiqu, tableName=PcrBatchs','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-168','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:28',168,'EXECUTED','7:f9cbfa9511b8213ea7e2a06f5d80e0a2','addUniqueConstraint constraintName=UK_duh2h6r8djyl9i4qael9wfu9w, tableName=PcrPrimers','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-169','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:28',169,'EXECUTED','7:073805dc12ef87ba44467ca9f82d028d','addUniqueConstraint constraintName=UK_dyejdil5b8y2kps0hqh3thhun, tableName=Regions','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-170','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:28',170,'EXECUTED','7:747937c912619ff8e64e772ace0607bc','addUniqueConstraint constraintName=UK_fevk2xo6g0perb22rbxe79gmf, tableName=Products','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-171','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:28',171,'EXECUTED','7:4f7c57a24a596abef5ad1530ae47aa59','addUniqueConstraint constraintName=UK_ftabvest74ag91ge26690247a, tableName=Locations','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-172','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:28',172,'EXECUTED','7:88308d84a82c9bbea093e15b38f3ec58','addUniqueConstraint constraintName=UK_gv40siuct8dlu5rb1y6wlaro1, tableName=Specimens','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-173','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:28',173,'EXECUTED','7:e1613a7a6ffe3cf8a2c64603d7e0c330','addUniqueConstraint constraintName=UK_h88xanisv3f9ubo9h4x65nxhd, tableName=ProjectTags','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-174','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:28',174,'EXECUTED','7:c1f766229d4a0528c04c2f4ea2355554','addUniqueConstraint constraintName=UK_ij5h5jfwxkt0ppev6h0ra5cqo, tableName=ContainerTypes','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-175','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:28',175,'EXECUTED','7:459a09f29227fffb773e1d0e9923e49c','addUniqueConstraint constraintName=UK_kx2r3f1xk5ath9pj7nth70tm6, tableName=MixedSpecimens','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-176','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:28',176,'EXECUTED','7:faa44a2cc32c93bfbd42bf4b78b2901a','addUniqueConstraint constraintName=UK_o3e4b4vehe7by1roa0k42w0ft, tableName=SpecimenReplicates','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-177','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:28',177,'EXECUTED','7:0da61fae330a403c33940d3956e4f111','addUniqueConstraint constraintName=UK_r6twnrc5jjmfcou6ga115bs9n, tableName=PcrReactions','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-178','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:28',178,'EXECUTED','7:7320a63278332dab12b59b31ced66547','addUniqueConstraint constraintName=UK_rllpdna6qkanrondp46qn6a41, tableName=Containers','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-179','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:28',179,'EXECUTED','7:8019cf4e6d54b6fe4aff0b896335104d','addUniqueConstraint constraintName=UK_ska14t8hsm48ydpdbdn2mky27, tableName=BiologicalCollections','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-180','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:28',180,'EXECUTED','7:5397d5f50b6e0c63d90ce08a5e75d029','addUniqueConstraint constraintName=UK_t3mag85pskyujqwuuiu3hvvy1, tableName=Alleles','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-181','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:28',181,'EXECUTED','7:4b84eb3a0339e83863d005c5e226a176','createIndex indexName=FK_15ccibevnv1sc0ntlmbn7oxdt, tableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-182','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:28',182,'EXECUTED','7:63143554fe73a6f03bcad26c9e28070e','createIndex indexName=FK_16rjw3tn0pbitl26qtce8a0iq, tableName=Identifications','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-183','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:28',183,'EXECUTED','7:39e503d963021d6fe673e0b5b15ca625','createIndex indexName=FK_190on7fv02cyhhqqbtynwmcfb, tableName=PcrBatchs','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-184','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:28',184,'EXECUTED','7:a8860e835762961e7501df93312d43e8','createIndex indexName=FK_1a4aoax0d4hbnk3xyjl4qi9vv, tableName=ReactionComponents','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-185','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:28',185,'EXECUTED','7:c83f929e25ae7f43f73500970aac9d6c','createIndex indexName=FK_1f2xpfvvbo9of6eauolhvqp7u, tableName=Taxa_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-186','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:28',186,'EXECUTED','7:2f4115754849914b19dc38ba717cef12','createIndex indexName=FK_1jp1erfwf28iroh9l6liq791v, tableName=ProviderChains','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-187','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:28',187,'EXECUTED','7:966177171c5d2dd9f550eff8c65950ee','createIndex indexName=FK_1tm6uj8qa05skj1arvj1tc5na, tableName=Regions_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-188','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:28',188,'EXECUTED','7:9d0161ea9a0db54f507f67b9da939f2b','createIndex indexName=FK_1v78ota9iutr1glkyp57pmstn, tableName=BlastResults','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-189','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:28',189,'EXECUTED','7:4beafc0d1e2d4c3d5d66476b2e8bb23c','createIndex indexName=FK_1xl6pvmp5w185eq4b0aal9mft, tableName=SeqSources','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-190','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:28',190,'EXECUTED','7:472a1517d77b86d3b412b160d34e5856','createIndex indexName=FK_1xm6fatpxmudxlvx20wg8n5h5, tableName=CollectionInfos_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-191','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:28',191,'EXECUTED','7:43372359fef7d8619de91cc32cca621d','createIndex indexName=FK_1xw4rqu4nlbrgr7tfhix7ufr1, tableName=Protocols','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-192','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:28',192,'EXECUTED','7:3305407b599733df37954fbef570ab55','createIndex indexName=FK_29af0jdceosu00gp08484a2f1, tableName=TagSequence','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-193','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:28',193,'EXECUTED','7:1bbbb4d00aa74438305301bad48fc89c','createIndex indexName=FK_2pb4jtciyg4rdbffl5l5bmktd, tableName=SeqSources','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-194','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:28',194,'EXECUTED','7:adbee4f079fca9ee51a8051019e346a2','createIndex indexName=FK_2qk33ir4t157gly8xhlolo5n0, tableName=TagMixedSpecimen','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-195','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:28',195,'EXECUTED','7:1dbb37f2dc588d2a97f20ba4a44f89ed','createIndex indexName=FK_2rtb4sk2nb8xh2jxmsky5xdga, tableName=Tasks','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-196','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:28',196,'EXECUTED','7:b6686a56a60349fd66fe723a7f32648a','createIndex indexName=FK_2uf57ss4mb8chcq4jlq5tmtwv, tableName=HybProjectsProjects','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-197','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:29',197,'EXECUTED','7:bcb45a46be96cb11e84624a310953cea','createIndex indexName=FK_3080at25w8nm4v0d9yweie2ms, tableName=SeqSources','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-198','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:29',198,'EXECUTED','7:0235f3c0ab88ef757b3c07978f5bf3a4','createIndex indexName=FK_34433uytluhaf06rdf46u3ava, tableName=BlastResults','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-199','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:29',199,'EXECUTED','7:4a1eadcc9aaa81e36c90ac8013f5f809','createIndex indexName=FK_34xfk4n49v3rpj0tucmnbm02i, tableName=Sequences','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-200','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:29',200,'EXECUTED','7:711f5df9799535c64cb68196c28ac865','createIndex indexName=FK_3cwj5t84yd9qrhe8q0q9lc95k, tableName=Genotypes','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-201','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:29',201,'EXECUTED','7:d877307702012521586cc8abad94ece1','createIndex indexName=FK_3eu58lcf41l1fb5b83yomu44n, tableName=BiologicalCollections','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-202','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:29',202,'EXECUTED','7:594ec992fbb0d89da2732d2987f91d5b','createIndex indexName=FK_3gp7w8nmhjrync27b1vmjm1d3, tableName=ImportPermitEvents_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-203','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:29',203,'EXECUTED','7:c58afa874eeffc4fe11030566f88b99f','createIndex indexName=FK_3mvttib8prndkuvcuts418msh, tableName=LexiconUsage','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-204','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:29',204,'EXECUTED','7:e8fb43ba6f3b797882f0873ab7c9ef71','createIndex indexName=FK_3u8ticbp842dnauunqgwcwyqd, tableName=Sequences','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-205','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:29',205,'EXECUTED','7:d84fc5ebad0e6b3120e84002ad1bae33','createIndex indexName=FK_3vj6jcwsuwtkcm2xfppshnjdf, tableName=TaxonInfo','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-206','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:29',206,'EXECUTED','7:db9db07a2a36567dc862fdd7577a78de','createIndex indexName=FK_40glvko9wlbdh4axsvon037mg, tableName=ProjectsProject','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-207','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:29',207,'EXECUTED','7:680eb6542795225f6d0d87651de11557','createIndex indexName=FK_4anag2k5y8odmss8vru2hprag, tableName=PcrPrimers','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-208','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:29',208,'EXECUTED','7:75fe0bbe83dd83f37fb74ba302398c62','createIndex indexName=FK_4c30viwryqtx91qdsp81emqa, tableName=PcrBatchs','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-209','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:29',209,'EXECUTED','7:b179b8090612e36ce0cf75f1a1a9e9f1','createIndex indexName=FK_4ctc19khf6aaty1sxd3ao6xch, tableName=TaxonLink','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-210','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:29',210,'EXECUTED','7:fc0adc4eecea435ad63c12d60697b87b','createIndex indexName=FK_4dgb4gh2p3fmlalbj4qrolvkm, tableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-211','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:29',211,'EXECUTED','7:ea5367509e45afe1c253de50977b0024','createIndex indexName=FK_4hmy3nk8ec60v0ahr5fpr7vny, tableName=Containers','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-212','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:29',212,'EXECUTED','7:db341550c1f368cf12eef5ab8308e8ad','createIndex indexName=FK_4hn0og6pmo69k02rt88nfidff, tableName=SpreadSheetColumns','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-213','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:29',213,'EXECUTED','7:10ccfff9e6df4f09fcdd5b12b1ea9de7','createIndex indexName=FK_4p35ltc0esje5dqk6bijs1j8b, tableName=LoanForm','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-214','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:29',214,'EXECUTED','7:6d730e463369c3f3733606a2065aa7ac','createIndex indexName=FK_4qvccfx8g3psr818ndnsit51d, tableName=Refs','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-215','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:29',215,'EXECUTED','7:6b0cb4b821c3bc061e6f0982fbb354bf','createIndex indexName=FK_4s912n70sf0mdyj3fcskcmnia, tableName=PcrReactions','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-216','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:29',216,'EXECUTED','7:cc7e849019eb3ce3e1f556aa91035ff4','createIndex indexName=FK_4sbel4md60bhymihq22boplmq, tableName=MixedSpecimens','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-217','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:29',217,'EXECUTED','7:599b566f764c5d73281e3881af9e29ab','createIndex indexName=FK_4t7cg90s9ltmig4lkj5onx4qb, tableName=SeqSources','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-218','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:29',218,'EXECUTED','7:0fd3f5300894ce0021d8b2cf34ba9cba','createIndex indexName=FK_4ytymn0oh44qtb1qlhxde27oe, tableName=Locations','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-219','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:29',219,'EXECUTED','7:9b757e91ae01b09406af089de1f5e22d','createIndex indexName=FK_5251so8coqx5l8rxh8yb4kwoq, tableName=Genotypes_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-220','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:29',220,'EXECUTED','7:cad456aa94708589ca422cd7ce5c9dac','createIndex indexName=FK_5ehbgji2j0gjaihyvdrk3yp6o, tableName=SeqSources','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-221','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:29',221,'EXECUTED','7:0d0b7e57f934150ef41dc979d6e9c09f','createIndex indexName=FK_5k68p5d2j1dn1i1kp0cbi9m0f, tableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-222','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:29',222,'EXECUTED','7:bc975d159cb847bde598699ca697db60','createIndex indexName=FK_5ox5bp4jaw3po3u184kff1sul, tableName=PcrBatchs','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-223','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:29',223,'EXECUTED','7:250b6589cf53e3f76f502ae8a6e2c0a7','createIndex indexName=FK_5w10nvvxa5nfdr6vghqx8wic, tableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-224','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:29',224,'EXECUTED','7:ef1b1f41bd3ad6899e005b24c79ad7a5','createIndex indexName=FK_5xrpd7j1ifhcveugmvivsy9j4, tableName=PcrBatchs','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-225','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:30',225,'EXECUTED','7:7c581846634aa7373eb46da55479f561','createIndex indexName=FK_60m2opdbdh0oovy8ojgwg2kf3, tableName=FungalInfos_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-226','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:30',226,'EXECUTED','7:19d70f1ff8e43c5e118649dffca8aa4c','createIndex indexName=FK_68fxul2h3cddufu0vpwj2ig36, tableName=TaxonInfo','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-227','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:30',227,'EXECUTED','7:5edfc0185f5f147cd0aa598387c14c9e','createIndex indexName=FK_68me2pv0wxtbibrt30wwtr1dr, tableName=Samples','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-228','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:30',228,'EXECUTED','7:270aab8e112d29a6c3697becb91ec5a4','createIndex indexName=FK_690ir8h4t5713e5g8bpjxuqbv, tableName=Fragments','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-229','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:30',229,'EXECUTED','7:60e205db0fe57d0d64abbcb4645ff283','createIndex indexName=FK_6a987nbi5u3n7ak73yy9dntnq, tableName=SeqSources','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-230','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:30',230,'EXECUTED','7:a5141ce4957937f75578bfc745aecf5d','createIndex indexName=FK_6ei8vksayjvut57t365guvbgm, tableName=Annotations','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-231','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:30',231,'EXECUTED','7:ef3ce9ace2e070a187ade97c5ee31f35','createIndex indexName=FK_6mhas0jkiqqwt9wqgd2tyuhwf, tableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-232','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:30',232,'EXECUTED','7:9493b6b6f301c7c7eddf85662851ccad','createIndex indexName=FK_6v2oc6eppswssh1e5sqe9bnrk, tableName=Genotypes','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-233','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:30',233,'EXECUTED','7:977c8539f23f63ba6d690557994fc3bd','createIndex indexName=FK_72w0hbbiv2tho9lcoe2n8oa21, tableName=ClusterSeqs','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-234','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:30',234,'EXECUTED','7:8fb3b9becba7306418e811cd7d7f0aab','createIndex indexName=FK_752c8t4y20n7b76oe23bw7ynw, tableName=Sequences','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-235','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:30',235,'EXECUTED','7:863a38f546a089795542087d6018fb90','createIndex indexName=FK_793tgch4wtwhchwf0r7pd7bey, tableName=Annotations','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-236','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:30',236,'EXECUTED','7:24d2d6c79f1375cc731fe8f922b518ab','createIndex indexName=FK_7bjcosxo8x3vxchhcya79skrj, tableName=Specimens','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-237','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:30',237,'EXECUTED','7:14e59e41f50e769d892f68ca763fbfac','createIndex indexName=FK_7bu545r1h1nac1rqdehvyhhwo, tableName=SeqReactions','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-238','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:30',238,'EXECUTED','7:de457d7636c2e72b014ef7546e8e0386','createIndex indexName=FK_7epky6tflweq2d2d3ly5w4ga9, tableName=SeqSubmissions','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-239','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:30',239,'EXECUTED','7:d8e4b18326b3e7ae1dfaf060594d1933','createIndex indexName=FK_7frxhwqxndu6ggu0pf8m33e1d, tableName=PcrPrimers_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-240','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:30',240,'EXECUTED','7:e4df120cb433cb6372a23418e2edc230','createIndex indexName=FK_7kanmm9rrhdfnmdx641s6f68j, tableName=Fragments','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-241','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:30',241,'EXECUTED','7:bcbf31166d6ac7a57f8f38086a597ce9','createIndex indexName=FK_7ni5bxxry15ocko3jkdtblh0l, tableName=LabelTemplates','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-242','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:30',242,'EXECUTED','7:21a2c092bd1023af404487833b8cd08b','createIndex indexName=FK_7qbopoys5i020a1u0wtksh9al, tableName=PeopleGroups','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-243','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:30',243,'EXECUTED','7:1e6f34af918e5c0c7706073d7cc0f3a9','createIndex indexName=FK_7x2v74i9c0j03hn520v736u82, tableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-244','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:30',244,'EXECUTED','7:8d4c238eb93f578bc7399441093efbde','createIndex indexName=FK_7yaw7x60h21dyp9dsvco0tu6c, tableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-245','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:30',245,'EXECUTED','7:08f64c0458b50239f47a9ea548634d8f','createIndex indexName=FK_841om21hek51soq7fc05fgvij, tableName=SeqSources','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-246','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:30',246,'EXECUTED','7:f83ce9551fb8515857a123d5b358097c','createIndex indexName=FK_873ojhy1tfgyvqcvlhlaq1v0w, tableName=LibrariesProjects','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-247','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:30',247,'EXECUTED','7:8009dd881abc769cc31e9dc46aaa996b','createIndex indexName=FK_8b01ws3lovo12oxco33193f2n, tableName=Containers','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-248','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:30',248,'EXECUTED','7:349afd0ca7b69bf2b8000865abf201d5','createIndex indexName=FK_8g4x7w1q441tcqmjqjrepp9df, tableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-249','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:30',249,'EXECUTED','7:930d73e7f4dbb76fb9b9b84568ad9d90','createIndex indexName=FK_8hienxmj6umhwwdwtdia6mo00, tableName=LoanAttach','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-250','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:30',250,'EXECUTED','7:40c33712cdffcd912c94bd8931afcfb5','createIndex indexName=FK_8inqadrodpjw8h6jun9r19u20, tableName=PcrProfiles','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-251','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:30',251,'EXECUTED','7:1831f5fdfa91273885f398718be43863','createIndex indexName=FK_8k21fscowx43bsg9stcjm6lne, tableName=SeqSources','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-252','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:30',252,'EXECUTED','7:cd3b9ea2b29c3bf116f76310030547c7','createIndex indexName=FK_8op37369nil7onkhfvwsjx8qg, tableName=ImportPermitAttach','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-253','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:30',253,'EXECUTED','7:002aecef2c08ce864f073e7df84ea260','createIndex indexName=FK_8t3csx2jn8t4wvjfyx0o87wsv, tableName=ImportPermits','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-254','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:31',254,'EXECUTED','7:3c16bdf964ea9f9e52f951d91fd4aae2','createIndex indexName=FK_8vifg5efr3p08day12ari3ywb, tableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-255','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:31',255,'EXECUTED','7:1cde58cd4ba1c41d5fad7b3e64e6cf05','createIndex indexName=FK_8wcdhmuhu5wu1597flwnaiopr, tableName=SeqProjectsProjects','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-256','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:31',256,'EXECUTED','7:58373c3439eeac80ec8670c6fa2e2885','createIndex indexName=FK_8xjjo8revddjgtew69fi2d4qo, tableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-257','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:31',257,'EXECUTED','7:7459c6a543e7f63926daf65bca013aa0','createIndex indexName=FK_947m1h8wbrjbe7webovc5ohhd, tableName=PcrReactions','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-258','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:31',258,'EXECUTED','7:e898f35c98eee20914688141112285b4','createIndex indexName=FK_94np4iqalsmisrmtv3i0ce51c, tableName=MixedSpecimens','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-259','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:31',259,'EXECUTED','7:d57762f4ca0183e929ea237bc8bfe8df','createIndex indexName=FK_97cbm6ka2tewfdj53avcpek7m, tableName=SeqReactions_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-260','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:31',260,'EXECUTED','7:f07dd187a2c06387b134330360a8a114','createIndex indexName=FK_9bdt7x1mdttes489fiu6ca0vc, tableName=Libraries','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-261','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:31',261,'EXECUTED','7:2306b135a9e495f5ec11bed64259421d','createIndex indexName=FK_9gvxtgp71ikmbcxtth821ovhk, tableName=Specimens','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-262','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:31',262,'EXECUTED','7:9f2d7ed3876b25955ecb256d3d733694','createIndex indexName=FK_9vmjpfkow8tsrpvkj1tls7l6c, tableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-263','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:31',263,'EXECUTED','7:fdcd74563ef191020eb9aa3edc6f30bd','createIndex indexName=FK_9vnuhsjbibxrndfjavof2oek3, tableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-264','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:31',264,'EXECUTED','7:f0a8b3d8bc217f5cf2dd37d29d124d42','createIndex indexName=FK_9wmtct7d3ouyoo3vjrhfa1nml, tableName=SeqSubmissions','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-265','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:31',265,'EXECUTED','7:2b963ba68014ae32aab715a7376fcb4c','createIndex indexName=FK_9yt5xppi0c6phhbb9a0uo0klr, tableName=ImportPermits_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-266','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:31',266,'EXECUTED','7:e0f7d242a2b70fd84d1c2d3f9432dbeb','createIndex indexName=FK_a4kc877d1qdvhe6ickb5t5t8y, tableName=SeqSources','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-267','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:31',267,'EXECUTED','7:7ee4f1eb78efb7f6bdf1a86b6a162c97','createIndex indexName=FK_a4ruos4y5lde9c6vpbfedu1x8, tableName=LoanAct','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-268','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:31',268,'EXECUTED','7:e37a67f21a5c875d00a0d0608ac365e8','createIndex indexName=FK_a52vr69j4yhujfvingbvgwti7, tableName=Addresses_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-269','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:31',269,'EXECUTED','7:3fe2ba975e5c5db36c3e28cdec6c6ae0','createIndex indexName=FK_a5jdmsuglwns7mfoklg41dko7, tableName=Specimens','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-270','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:31',270,'EXECUTED','7:7c2ff7e48aa8bb25893b30ff046b57f6','createIndex indexName=FK_a6yywjr2k3p8liflvfcqvijhk, tableName=MixedSpecimens','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-271','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:31',271,'EXECUTED','7:ea0b7ed308dac8436166b4c42104d916','createIndex indexName=FK_a9gk29p8sof5bnti457xfkh87, tableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-272','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:31',272,'EXECUTED','7:107955cce4e6dc7d74ba32a0de3ae03b','createIndex indexName=FK_abmjpyg0a3fjx803jsvuohy8j, tableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-273','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:31',273,'EXECUTED','7:739e246bbe9174c74dc1e2925ab7c9ba','createIndex indexName=FK_afqlk7jwweqdv5evifnx1ugkm, tableName=Regions','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-274','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:31',274,'EXECUTED','7:2aa60efc88cd7952a66ccda43354c4bb','createIndex indexName=FK_agn2dbwsghp1adwacwp995vsu, tableName=Genotypes','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-275','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:31',275,'EXECUTED','7:0d834b95894c4bc822a89b2f50b7143c','createIndex indexName=FK_amncx0v5qk0t1rc2hdc80c4np, tableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-276','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:31',276,'EXECUTED','7:02d38815697dfd57cb0bef519a14bda9','createIndex indexName=FK_amshi66em4jphq5t3nempuqb9, tableName=Locations','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-277','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:31',277,'EXECUTED','7:afd3f140afc7d1f0ad8926a33123483e','createIndex indexName=FK_an50pyveilyolmvmt3dms960t, tableName=SeqSources','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-278','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:31',278,'EXECUTED','7:b0b4da47a5eccf963f0ae8ac9a9dfd41','createIndex indexName=FK_aoqmedewpccv2ml2lgoec0c06, tableName=PcrReactions','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-279','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:31',279,'EXECUTED','7:f04d284fcdd2c42858fd1e02c2d3df1e','createIndex indexName=FK_ap7h52t09ifgna8eb18rewjdw, tableName=LoanForm','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-280','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:31',280,'EXECUTED','7:f4d6abc6d088e45914449b2321ce6157','createIndex indexName=FK_argt4d0rarc85d2x82523b2cf, tableName=MixedSpecimens_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-281','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:31',281,'EXECUTED','7:e9b210b9ef7c55915458fdd1ae348a13','createIndex indexName=FK_b4hyi1s7df54l89yxk8txbxd3, tableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-282','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:31',282,'EXECUTED','7:99ddb08430b74c57bc0676eb36fcfe03','createIndex indexName=FK_b4jkqt4yxxuuwre2sum1lys12, tableName=Features','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-283','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:32',283,'EXECUTED','7:2067e7a2088e618a5e549d618f10bf2e','createIndex indexName=FK_beprcfum14hti2f25qcyaxfwc, tableName=Accounts','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-284','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:32',284,'EXECUTED','7:f3b689dd87eefc0580f5aa1b19cd926f','createIndex indexName=FK_bg9ucdvgtvkvoxjj9n1drmc61, tableName=BlastProjects','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-285','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:32',285,'EXECUTED','7:13c6e258288ad85e399fd272965724f0','createIndex indexName=FK_bh11kemtx4pu5snt7ohpp001, tableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-286','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:32',286,'EXECUTED','7:43c448b0a7d13493ef88eddab59d87a0','createIndex indexName=FK_bhu3d918y3o4r7loipn3ynn1m, tableName=ClusterCons','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-287','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:32',287,'EXECUTED','7:919eb24c4abea0a68e1228ebfa5c87f0','createIndex indexName=FK_btqnax4uj78wdq9hc58g2s3ey, tableName=Fragments','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-288','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:32',288,'EXECUTED','7:b2812a3f59723206c010409a8520be16','createIndex indexName=FK_buxmypgdwcfgy8gprhfo1k9a4, tableName=PeopleGroups','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-289','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:32',289,'EXECUTED','7:5433bacd5dcb4b32230ff72d4d556ba1','createIndex indexName=FK_bva1xtoa70un4afj9pihokk84, tableName=MixsSpecification_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-290','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:32',290,'EXECUTED','7:57e3b4856f455a94c46658474389ee4d','createIndex indexName=FK_bw8gdw7kno52jatkm23yr7urg, tableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-291','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:32',291,'EXECUTED','7:c72cc1b9fab1f62a7c203be4b1a81638','createIndex indexName=FK_bwa6s2770ef5adnwm1k214yh7, tableName=SpreadSheetTemplates','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-292','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:32',292,'EXECUTED','7:3c29760dc49ff2e28449ed218752d192','createIndex indexName=FK_c15u3yal2u3bmnp96dcycn522, tableName=Clones','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-293','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:32',293,'EXECUTED','7:c7fbdca2fd16368b5241461d96513f7f','createIndex indexName=FK_c3c6aipgssi2std58qr8hltxa, tableName=Fragments_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-294','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:32',294,'EXECUTED','7:7409709cd7cdd97d4f0997a175b0ab12','createIndex indexName=FK_c4fget0ufn0xy30sfpve8h4ty, tableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-295','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:32',295,'EXECUTED','7:59f01907b9fea766f3366167c2210771','createIndex indexName=FK_c4u5jdc3fu4776plhw40lwqh9, tableName=Features','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-296','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:32',296,'EXECUTED','7:fff05776983dad9aa2e21003a5eb5e64','createIndex indexName=FK_c5x1738wdf7q5e7hxgq4o78e, tableName=MixedSpecimenAttach','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-297','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:32',297,'EXECUTED','7:e26240747cef6256c7db70be56d086ef','createIndex indexName=FK_cacot4sqn736h54rx371yu6w6, tableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-298','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:32',298,'EXECUTED','7:0d75e6be745fad4fdcff87d5910f841e','createIndex indexName=FK_chdo5fadxi2yf42ww78sy89xa, tableName=Samples','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-299','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:32',299,'EXECUTED','7:6a20194786f7c9a9fe1544dc57dc5676','createIndex indexName=FK_clmijec1ll51e1cw4y06pa1lj, tableName=Products','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-300','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:32',300,'EXECUTED','7:c02092f8290602c54fee701608650599','createIndex indexName=FK_cuflk23ug0204f8gddp5ihwym, tableName=Spots','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-301','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:32',301,'EXECUTED','7:b5fcbb9be7071afe89dcd7edd0dc412f','createIndex indexName=FK_cvux8wn8y5p76osk93xs676h3, tableName=LoanForm','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-302','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:32',302,'EXECUTED','7:45fbc0b0d3e345aacd388dadea5ba53e','createIndex indexName=FK_d3h9i3xcoa7d9norwjrft38ob, tableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-303','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:32',303,'EXECUTED','7:1abff499ad11f6c008fa782d1d645307','createIndex indexName=FK_d5ldlywy1pp43lba8ciyyx1us, tableName=PcrPrimers','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-304','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:32',304,'EXECUTED','7:0475507dbdb45f2a24363d6cc85b117d','createIndex indexName=FK_datf6vhkjqkdew6ajt992er74, tableName=SeqSubmissions_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-305','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:32',305,'EXECUTED','7:141cd5ecb3c866b545c9b2f4e58d73de','createIndex indexName=FK_dee1xlolk34uhwqtc2i45nc0v, tableName=Annotations','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-306','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:32',306,'EXECUTED','7:f13a5a73b18f3a222d3812be603e4d33','createIndex indexName=FK_df6kifjhg2ci1s074w5cho48g, tableName=LabelTemplates','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-307','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:32',307,'EXECUTED','7:bcc359ca7b1db89fc1befbebe1d5d878','createIndex indexName=FK_dftsxppl9qolmnbp96t2vyf4s, tableName=PcrProfiles_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-308','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:32',308,'EXECUTED','7:200eaac913b46fb883ea5cfa8b907a64','createIndex indexName=FK_dh5l0va08wgkf4t4rydt1qboc, tableName=AccountsGroups','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-309','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:32',309,'EXECUTED','7:57cfb0e9ac0a8d0f2797c51f6a71a3b4','createIndex indexName=FK_di98ww0jwy6rja4tadd2baqrl, tableName=Printers','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-310','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:32',310,'EXECUTED','7:d2862de3f6e9974e61ac374253b43d30','createIndex indexName=FK_djmx4xysiut1o4y0p87bgcp95, tableName=PcrBatchs_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-311','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:32',311,'EXECUTED','7:ad2342b8ba9f4f64b8a33ffa1447329e','createIndex indexName=FK_dr0ralul51gdqvut0cmn0aaa6, tableName=TaxonRank_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-312','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:33',312,'EXECUTED','7:443890ca32c1b4c29683c0bc625ed750','createIndex indexName=FK_dsjxu448lo4iqpswif2ututtv, tableName=ClusterSeqs','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-313','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:33',313,'EXECUTED','7:45e4cb21d86972e37887db21291fc2c1','createIndex indexName=FK_dvb2lxtiyhu9q1l9r9mdpnadw, tableName=SeqSources','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-314','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:33',314,'EXECUTED','7:0aa7aaa1ee0382113d9a764ca2474b52','createIndex indexName=FK_dwgkd6m4f6owt7vsof66jt54g, tableName=Annotations','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-315','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:33',315,'EXECUTED','7:76fdf857aae515708646bd4a66ce4ca0','createIndex indexName=FK_dxy68kqa1bjydnyckv4coh8hr, tableName=AccountUsage','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-316','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:33',316,'EXECUTED','7:9cca5c8b0b7faf32d8606f869ccb5e2c','createIndex indexName=FK_e4661f4v6pobq6g9hun21acvq, tableName=BlastProjects','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-317','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:33',317,'EXECUTED','7:fa77307bc0ba24416918aa0afe3f1dd3','createIndex indexName=FK_e5emcecbalr3q8lwtky433qjm, tableName=PcrReactions_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-318','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:33',318,'EXECUTED','7:a64e1554110ee3264e2958a76b7214d6','createIndex indexName=FK_e7wdawkkl8giwgn4uwrqv8897, tableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-319','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:33',319,'EXECUTED','7:e20802bb1616c0b4b667868678857f3c','createIndex indexName=FK_ebs36c3v9l1trpqs5obdfxmt4, tableName=HybProjectsProjects','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-320','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:33',320,'EXECUTED','7:163734cc598d25c39cefb9317a80eb55','createIndex indexName=FK_ec5p689miax2o0lk3sfqjdjey, tableName=AccountProfilePrinters','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-321','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:33',321,'EXECUTED','7:ad97f1564c4028f4a156e4a24cd85f85','createIndex indexName=FK_ehc393q8ngsuhjk6y6juhfs16, tableName=SeqBatchs','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-322','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:33',322,'EXECUTED','7:cfc4eaf76dd2c8b04eb18ec62061e26c','createIndex indexName=FK_ejljb80rovoht26aa8iqka6gf, tableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-323','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:33',323,'EXECUTED','7:9f9a6c50f2a9fdb2c95f76a2ee6b5fcc','createIndex indexName=FK_eom5gcyan5jrsd0luivtalhui, tableName=ClusterProjects','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-324','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:33',324,'EXECUTED','7:185ca4255194c8447ccc512210b40a63','createIndex indexName=FK_epcn4bq7utejkjuyofy2rxvcq, tableName=SpecimenReplicates','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-325','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:33',325,'EXECUTED','7:c3ddcdafe0f831ab64e61ca563bdfd2d','createIndex indexName=FK_est6u6oyjig1qej4vvsqpylk5, tableName=AccountPreferences','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-326','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:33',326,'EXECUTED','7:7f2ae70628319cf8d8ffcef8c01dbdbc','createIndex indexName=FK_euetuttl64lssjvt1j7rihl72, tableName=SpecimenAttach','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-327','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:33',327,'EXECUTED','7:0f4ebd6f40fc5f41e7873ae5692b0bc3','createIndex indexName=FK_eyjixa0qguc5yxufrwscomh4x, tableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-328','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:33',328,'EXECUTED','7:bdf7b2ee96c39a0af86fe3a3b9e761cd','createIndex indexName=FK_f1ko8oiulps3jmtxrq9f87mmj, tableName=Hosts_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-329','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:33',329,'EXECUTED','7:eab90a2f48023b78794f2ed3ae3570d7','createIndex indexName=FK_fe5snpi3d9mdpo5jh6vvbu5m7, tableName=SeqSources','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-330','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:33',330,'EXECUTED','7:97f0d10efc0c1de4d15d0e4e6cdb2f8f','createIndex indexName=FK_fjyb34dplfbvwvhsaym7x1cxi, tableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-331','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:33',331,'EXECUTED','7:404d71403bed73718e6da2ae55accf1f','createIndex indexName=FK_fkisljs3fflmp59td40rdh9py, tableName=LibrariesProjects','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-332','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:33',332,'EXECUTED','7:27ebe5c0d623b9f47478f3bba267d29b','createIndex indexName=FK_fmo1wa3swpawahjntu632s4dm, tableName=PeopleAddresses','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-333','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:33',333,'EXECUTED','7:94d7080f350c61074b2dc2e977a2caeb','createIndex indexName=FK_focrnu2ify77abyh6uxpwlkfx, tableName=LoanForm','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-334','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:33',334,'EXECUTED','7:6d0072b9c636100e18f6553ff724e4a1','createIndex indexName=FK_fsq05c8gi6u8h98gfpfb10k2j, tableName=TaxonInfo','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-335','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:33',335,'EXECUTED','7:ac78fd38284df1a820317b7449d6dfb2','createIndex indexName=FK_fu1nicmbjrsh47siaw44o5emt, tableName=SeqSubmissionConfigs','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-336','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:33',336,'EXECUTED','7:80bd216b0eda21c5af07cc09f4fe695c','createIndex indexName=FK_fxs96q5cde8k7q3x19eodhpuv, tableName=SeqSubmissionConfigs_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-337','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:33',337,'EXECUTED','7:3a927d2f01f1dc4b195302780aa1513c','createIndex indexName=FK_g48fynsesdt18nq3qoyjaxrbe, tableName=BlastHsps','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-338','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:33',338,'EXECUTED','7:dc29cb1a47f9ea63e38d7d5be24bed3c','createIndex indexName=FK_g4ipod035t585hvin5lhry1em, tableName=Specimens','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-339','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:33',339,'EXECUTED','7:fb5fd5d7ec987d9bd2238a8791553d6b','createIndex indexName=FK_g4pmqjoloyf5fhafvv73hjcn1, tableName=Specimens','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-340','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:34',340,'EXECUTED','7:cd6b52e1a30cdf055ba49d104df40590','createIndex indexName=FK_g9ndujio1cprdfv1vxr25h6r4, tableName=PcrProfiles','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-341','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:34',341,'EXECUTED','7:0fb7f1e393e665211fffe67073097acc','createIndex indexName=FK_gbiqv9ercno7hkdmqp9svtbk5, tableName=BiologicalCollections','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-342','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:34',342,'EXECUTED','7:bfa1a38566926722ca506ea236d3c9c9','createIndex indexName=FK_gcnjlac5jn8tln0ug2qkftf9b, tableName=Fragments','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-343','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:34',343,'EXECUTED','7:680d409e363c477322ef802169bc2d2f','createIndex indexName=FK_gkeyalwa6s2trxx01k4b8pbr9, tableName=Sequences','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-344','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:34',344,'EXECUTED','7:ee27ebba990ec227abf63c666580340a','createIndex indexName=FK_gnj2gppl4gftqldmlj4btgxgg, tableName=Protocols_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-345','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:34',345,'EXECUTED','7:944ab70e713c0337a77d2bb868c894df','createIndex indexName=FK_goum9a5y0kseu9dl94pdk6io9, tableName=SubmissionFacilitys_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-346','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:34',346,'EXECUTED','7:b1d59b045d57338396f1596e7f343089','createIndex indexName=FK_gr1q9bfsft2mpfsc83gyi62s1, tableName=SeqProjectsSequences','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-347','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:34',347,'EXECUTED','7:ed3afbeb1f1d89d518bb0fd0a4ab0788','createIndex indexName=FK_gs4a2pja8lggk6611pag4f04h, tableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-348','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:34',348,'EXECUTED','7:e113f32233431ffd098a71c05f517c97','createIndex indexName=FK_gu9ytkxs4x70fx0w53bw4lscx, tableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-349','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:34',349,'EXECUTED','7:f9ece5b0606d4d23e539a47f1f230697','createIndex indexName=FK_hfcc8fl3ycrmkykbhk5e093da, tableName=Sequences','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-350','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:34',350,'EXECUTED','7:5d2dd2916ee23bae02efc5bdb037deb6','createIndex indexName=FK_hx82cmlm9a33gc2jnm1lhmc0o, tableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-351','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:34',351,'EXECUTED','7:2b3a4a9413ed7675e40e03caffe7a73c','createIndex indexName=FK_hxxl23rrnb8u65nr8myhg0899, tableName=PcrReactions','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-352','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:34',352,'EXECUTED','7:341f09b17849356f296d07045c8131e7','createIndex indexName=FK_i0qacll44p0uklvkejag31tf3, tableName=Hosts','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-353','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:34',353,'EXECUTED','7:e2fadd727ca839862f022b2a2d65a006','createIndex indexName=FK_i1hvqhm5h2qb9xbijcvcjkksn, tableName=PcrBatchAttach','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-354','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:34',354,'EXECUTED','7:ed3979f10cb3bbdcac26f9440e4ec871','createIndex indexName=FK_i3wj6ko1vkec6254r8l6laddr, tableName=AccountProfilePrinters','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-355','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:34',355,'EXECUTED','7:282b414ad8fd9ce20332c0a6d9589c5e','createIndex indexName=FK_i4c0p2tldq4js6l2lpyjr1eyn, tableName=Sequences','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-356','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:34',356,'EXECUTED','7:a1ef120c5a20d129c43ae4be74fa7f5c','createIndex indexName=FK_i5819kpc7x3sxes3meew98m7n, tableName=Features_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-357','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:34',357,'EXECUTED','7:a8bc1e7a7c463e4c755a9fa48479b395','createIndex indexName=FK_i84pu0014li6cglfesarm767j, tableName=ProjectTags_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-358','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:34',358,'EXECUTED','7:a6995804abf415c1ad09a4e0aad930dd','createIndex indexName=FK_ifp950llqpju3mpdy9gllrvjb, tableName=SeqSources_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-359','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:34',359,'EXECUTED','7:41001cb3dcf08d08769188dc06c4c7db','createIndex indexName=FK_ih7ql24i0hufcjjnh22rv0xfb, tableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-360','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:34',360,'EXECUTED','7:31bbec32312c4863841d3a6f3d1d9d34','createIndex indexName=FK_is4e1n5v2h6ynpek902c5h7bu, tableName=Fragments','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-361','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:34',361,'EXECUTED','7:17628a44844377be93e806b13de644b9','createIndex indexName=FK_iyhmua5d43idxmrqwa6mt1mmx, tableName=PcrBatchs','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-362','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:34',362,'EXECUTED','7:8f6c0fc72c0df56c195fc87d58c73333','createIndex indexName=FK_j2o9mp4t113b0nuulwkidj9kh, tableName=Lexicon','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-363','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:34',363,'EXECUTED','7:8a4bd7fb24b85e00f5fdd6c860b4721d','createIndex indexName=FK_j44wkjwhacarb897v73r23pk5, tableName=TagSpecimen','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-364','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:34',364,'EXECUTED','7:52a38b2e51a2119a59c9e941333ed270','createIndex indexName=FK_j7w8lp16p2plapfkw12sxn561, tableName=PcrPrimers','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-365','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:34',365,'EXECUTED','7:892000165abad5af28fc484f96d99d36','createIndex indexName=FK_jg81alaokneidyb0v3knwmj3u, tableName=PcrReactions','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-366','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:34',366,'EXECUTED','7:0f77fa2655684c7b1f06c9b40a41f46b','createIndex indexName=FK_jhw6u82ksauethycw3p0nuadr, tableName=ContainerTypes','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-367','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:34',367,'EXECUTED','7:22e352572a85ecc952b2a387e21bd155','createIndex indexName=FK_jma7et3xaob4668lptl2wswup, tableName=Storages','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-368','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:35',368,'EXECUTED','7:876a2d9794401baccb4546e7189e994c','createIndex indexName=FK_joe4105wh55sxa2b2olue5am5, tableName=Specimens','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-369','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:35',369,'EXECUTED','7:77e7d7223b84e7c303820a3d515e0caf','createIndex indexName=FK_jsofbufrsm6m5h8qisfhkv9or, tableName=Fragments','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-370','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:35',370,'EXECUTED','7:e6eb3b6f482dd065b67b4ac6f4a9ef1d','createIndex indexName=FK_jt00wmbuf1wewbs6lxhhvrnhl, tableName=GoHits','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-371','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:35',371,'EXECUTED','7:541b844ab3bb1dd6394fc25424773c21','createIndex indexName=FK_jyuf5lfeq8hhd2g6uwnv002uk, tableName=SeqProjectsProjects','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-372','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:35',372,'EXECUTED','7:8902181aeee1325718be244bb5c03079','createIndex indexName=FK_k7l4tnbth2y7o68pirvugiewk, tableName=Genotypes','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-373','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:35',373,'EXECUTED','7:8bb1044db7e0568af1ddbe4855122060','createIndex indexName=FK_klgh9npei7xn60sbiv941cn5e, tableName=Hosts','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-374','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:35',374,'EXECUTED','7:132cfc908b64cd3d25c4c19ad63637d1','createIndex indexName=FK_kn41lnvoh0wd5wo2otg013lnw, tableName=ImportPermitEvents','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-375','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:35',375,'EXECUTED','7:f45d57bc5b6f779909a10e99c9241095','createIndex indexName=FK_knhujokmet0ew9isorewoouim, tableName=PcrBatchs','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-376','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:35',376,'EXECUTED','7:fd59151c3a11f891c8fb227ac3f579f8','createIndex indexName=FK_ksm66fxg7l7qyaxf1vsg0bfl2, tableName=LoanForm','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-377','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:35',377,'EXECUTED','7:ff8bd01310715de5549aa91bbf209435','createIndex indexName=FK_ktbmo6iq16f81gdradu70qkeo, tableName=Samples','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-378','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:35',378,'EXECUTED','7:8dce8cf52939066f7f113f7a19cc584a','createIndex indexName=FK_kvp7jk41aby9lisqxyxjlly6n, tableName=PcrReactions','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-379','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:35',379,'EXECUTED','7:a45fe93ecef0d1948e6b6808918aacd8','createIndex indexName=FK_l3qknci5nmdeqx7h6o3smaswa, tableName=ProviderChains','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-380','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:35',380,'EXECUTED','7:b3ed9d3b69b8715d83c4ebf57072b120','createIndex indexName=FK_l6te4yfcdu08mg24xawd3btcl, tableName=ValidationFields','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-381','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:35',381,'EXECUTED','7:391747cb2cd1c3fe11b5b9c6fb4fc3a1','createIndex indexName=FK_ld8v5qix5ku6tjehe3mg3cgqs, tableName=SeqReactions','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-382','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:35',382,'EXECUTED','7:326b8e54d02068108867a344155306d9','createIndex indexName=FK_le59c65oq61w3jtrk9b9tfo14, tableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-383','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:35',383,'EXECUTED','7:e47d5b1451536f444882e3fe3feec971','createIndex indexName=FK_lfjgcky9edg98resn1vadih2h, tableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-384','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:35',384,'EXECUTED','7:cad563a12367166fd0a7f0cafb253def','createIndex indexName=FK_libscfvci046fww5lgwxqauh5, tableName=PcrPrimers','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-385','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:35',385,'EXECUTED','7:e130be447d486ebf554094290be40a05','createIndex indexName=FK_lobmdymx6yfsxg526yp1xjt2y, tableName=LexiconUsage','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-386','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:35',386,'EXECUTED','7:ede7b73471bdf5077b3a2f11da9b2a78','createIndex indexName=FK_lomh51bwssbvqxf99lccbl1o9, tableName=SeqSources','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-387','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:35',387,'EXECUTED','7:0044ce2f82b7d719fce85004841baf4f','createIndex indexName=FK_lpenr1wqnlgis1koqqqw22kom, tableName=Tasks','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-388','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:35',388,'EXECUTED','7:ebbadf3fac0623dfa0b28d14882c3949','createIndex indexName=FK_lv3j7p9s03uyan9fcm2mcjl36, tableName=Specimens_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-389','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:35',389,'EXECUTED','7:484407d321d21c4dbc0ddc50a1c1d62a','createIndex indexName=FK_lwuk6hh8xifok37n2yry6owi2, tableName=EmailAddrs','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-390','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:35',390,'EXECUTED','7:36756505b3fc51b009feb89a0a44e4b8','createIndex indexName=FK_lx56ewrr853p17h0qt2qdu3r3, tableName=Addresses','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-391','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:35',391,'EXECUTED','7:19adfe234c2bb641dff12d63414df72f','createIndex indexName=FK_m5g45w4ca6g0p3ldqjaol1s7h, tableName=Sequences_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-392','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:35',392,'EXECUTED','7:45423e24beef7c02e7226685739936a0','createIndex indexName=FK_m81rb3pfdiq14tabkpj3j9jyn, tableName=SeqBatchs','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-393','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:35',393,'EXECUTED','7:a66a7559091a3509043d2b983f688685','createIndex indexName=FK_m9ly95txnk442e90at8oe0qh3, tableName=SeqSources','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-394','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:35',394,'EXECUTED','7:92f8be1bbc6b4914f85c56e9be589600','createIndex indexName=FK_maxvacfxyxysc7lmrlf1npkto, tableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-395','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:35',395,'EXECUTED','7:eddb6445783d6264367940997d64b693','createIndex indexName=FK_mb8o3irwgug7doc3a2hfuos99, tableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-396','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:35',396,'EXECUTED','7:4566aacbd318d82ef50fa6b1ef630194','createIndex indexName=FK_mbq67ya7vpqircwp8at9286hk, tableName=TagSample','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-397','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:36',397,'EXECUTED','7:8486c4d0e20bba758f2052cb09bc3924','createIndex indexName=FK_mfvlp5u1havi9ud5sjy5wnqud, tableName=LoanForm','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-398','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:36',398,'EXECUTED','7:a9c7a0d5611afbf5547d3aeeed76b6d7','createIndex indexName=FK_mn2mclv3mcu6a5jjorxgewlta, tableName=AccountProfiles','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-399','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:36',399,'EXECUTED','7:7c843d395760501c44643ab3b85b854a','createIndex indexName=FK_mqehuefgg1n7lejxjaurysses, tableName=GoProjects','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-400','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:36',400,'EXECUTED','7:5f4206138f378f5ce1a238ad73a5abed','createIndex indexName=FK_mqt6y55s7tmnvab0suukcp22v, tableName=Hybridizations','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-401','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:36',401,'EXECUTED','7:0937fefdf26ecdf7dbacb9a434a049b8','createIndex indexName=FK_mr2al2qrjhtfdjurqp4rlai3a, tableName=MixedSpecimens','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-402','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:36',402,'EXECUTED','7:27d188e344dbda32104a6bc60ae0ca1a','createIndex indexName=FK_mvxonmas5vjv82wb2nym1na41, tableName=Identifications','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-403','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:36',403,'EXECUTED','7:d530d7196f4dc09461a0ff110db84f50','createIndex indexName=FK_n24pcn7qawqpqsrnqk5blmoyp, tableName=LoanAct','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-404','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:36',404,'EXECUTED','7:a11a9860ed55a33cb1b9c42197af8e9e','createIndex indexName=FK_n4b3g85fdqd5j407l6n3pmy3b, tableName=Fragments','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-405','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:36',405,'EXECUTED','7:5af1c0835d7eb2c9fa6c5edd611f1044','createIndex indexName=FK_n5tu2s6wqeql3yi5nfnj0g2mb, tableName=SeqBatchs','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-406','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:36',406,'EXECUTED','7:066705424d57f25e7980f96a7758d6be','createIndex indexName=FK_n7jjay7ughu5qrc2sbuots3sk, tableName=Products_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-407','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:36',407,'EXECUTED','7:4c4d8c3b93bc53a2699f34c4e4ba63c3','createIndex indexName=FK_nabkyxwrsp4lhr4uihk8idcru, tableName=Identifications','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-408','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:36',408,'EXECUTED','7:8a2d628622728f4cdff7f0b7a2eb608c','createIndex indexName=FK_nf0fq2j176ync5qmfirg3fker, tableName=Samples','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-409','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:36',409,'EXECUTED','7:80d29f64bdd0d93907bd9dbf6f8a865f','createIndex indexName=FK_nfv5dwm6h44wnc721jf51uigy, tableName=Fragments','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-410','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:36',410,'EXECUTED','7:1d3fa26501d8cb37cc2bca45d55bec57','createIndex indexName=FK_nil4cfpn0c7m8slqnk4owktsg, tableName=ProviderChains','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-411','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:36',411,'EXECUTED','7:d11289d9ed14fde97eb64789037202cb','createIndex indexName=FK_nk19pirk3oy63udfhcjhg7m29, tableName=PcrReactions','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-412','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:36',412,'EXECUTED','7:0d5acd94355539f90526a45b2a83242c','createIndex indexName=FK_nokubna3i7h503rat5xynpm84, tableName=Samples_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-413','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:36',413,'EXECUTED','7:ba07347f975d99d3926a054d1387c671','createIndex indexName=FK_nvdn4ircr41s61ctno51viekd, tableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-414','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:36',414,'EXECUTED','7:ab59d7868daa20de5f67eca49e143c3d','createIndex indexName=FK_nyf42lnk7bl6lvvutnqm8u4vy, tableName=Hybridizations','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-415','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:36',415,'EXECUTED','7:4800210bff541f8cf97f75d0a5048976','createIndex indexName=FK_o3k28i5e35d32g1i4o6sbo35m, tableName=AccountsGroups','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-416','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:36',416,'EXECUTED','7:7df44b27fdaf6629eaf0de47a10f2cbf','createIndex indexName=FK_odo8t97tysglk8nho27ejg69d, tableName=BiologicalCollections_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-417','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:36',417,'EXECUTED','7:1e81c7f8441b6f3c64cacc7c4ff5df8e','createIndex indexName=FK_ohpl1sdb8hm46b8l9g34sd0cf, tableName=SeqProjectsSequences','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-418','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:36',418,'EXECUTED','7:46e8395096afb9efe0ac5cd3d5510ae5','createIndex indexName=FK_ojv4mufjy28wjte762tthjlsa, tableName=SeqSources','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-419','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:36',419,'EXECUTED','7:117176dd123ec5fcebf3dc8311c5c0e5','createIndex indexName=FK_ok08fa4vh19nl7hqardtce2vh, tableName=LoanForm','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-420','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:36',420,'EXECUTED','7:ea21d29356627ba45806af36813fbae2','createIndex indexName=FK_opbodkrj8ctv9tyjol5g5xwwu, tableName=AccountUsage','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-421','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:36',421,'EXECUTED','7:ec6fd424107e1ebcc888c40eda11208d','createIndex indexName=FK_orsl48c73rikurwvh0bw0asnn, tableName=SeqReactions','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-422','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:36',422,'EXECUTED','7:a54d112e08a2a9e0c3f918fb91d75ba0','createIndex indexName=FK_osm6gva5bo26w7obj7sl0k5f3, tableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-423','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:36',423,'EXECUTED','7:af570d622861719a51daef00ed1ddadf','createIndex indexName=FK_owenubne8jbacxg0mwdliutp5, tableName=Locations','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-424','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:36',424,'EXECUTED','7:1a4e44c135ad892f5e435071761b2744','createIndex indexName=FK_oydcu32elckh89l3sqk5sidbk, tableName=Samples','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-425','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:36',425,'EXECUTED','7:cf7e4ce7e4a47c6d4152a4f89a2b99fa','createIndex indexName=FK_p2if06fynkj3xjn86klpe2rhq, tableName=Locations','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-426','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:37',426,'EXECUTED','7:ff68a0b3dd4c1a1a6319efc1c54b8b32','createIndex indexName=FK_p8kjq5lejdkrrh9fb1y8kboxo, tableName=Taxonomys_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-427','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:37',427,'EXECUTED','7:a021b5214e252a73e088f0c87d2f5fb9','createIndex indexName=FK_p9o0sc50cparbgwdhviasv27e, tableName=FeatureLocations_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-428','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:37',428,'EXECUTED','7:2eb71e3d7a8e702a4fbfcb3929c7276b','createIndex indexName=FK_pank91epn0f86n0n5wk1x410v, tableName=SpecimenReplicates_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-429','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:37',429,'EXECUTED','7:ee42ea8d13a481c44aa89d858aa526ea','createIndex indexName=FK_pgeq6y89t7machd9auk56xfxv, tableName=Locations','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-430','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:37',430,'EXECUTED','7:2f0e44235bfcec640dcb6b96beb2c7f5','createIndex indexName=FK_phqvhw9un9ed5rsp6nysmu151, tableName=ProjectTags','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-431','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:37',431,'EXECUTED','7:bcf9aa7d99cad2b5ce57d2149450e93f','createIndex indexName=FK_plfcpl8v5sp8kkvt6pb0fvrha, tableName=Sequences','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-432','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:37',432,'EXECUTED','7:5ed167933e5fc5b2a8befdc7b169b023','createIndex indexName=FK_pm69olc1lwa2gvrw78vduhusl, tableName=SpecimenReplicates','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-433','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:37',433,'EXECUTED','7:29d0862d472b5076900702b47ff82acd','createIndex indexName=FK_pmnlt8vntd8p1c8gprjyib8as, tableName=Spots','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-434','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:37',434,'EXECUTED','7:98395183f0500342197e9130eb6c197f','createIndex indexName=FK_podnyp77yrdamkchlpeslqla9, tableName=TaskArguments','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-435','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:37',435,'EXECUTED','7:d4fd1ece1dc7e2fcda3114b391cc0014','createIndex indexName=FK_pqbwa1ysc7so8uh8y3bruvfkj, tableName=Specimens','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-436','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:37',436,'EXECUTED','7:a7ef31f33ce3ba8a29f9a41aeda43381','createIndex indexName=FK_q0hkqo8y5053o592ghgx06rb9, tableName=Specimens','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-437','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:37',437,'EXECUTED','7:a6de67dce901b31db6920115530a15f6','createIndex indexName=FK_q48k8qlwetvmy5anf4yo9l8go, tableName=AccountProfilePrinters','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-438','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:37',438,'EXECUTED','7:1fcdc2b966d3b03d48feb142eda29704','createIndex indexName=FK_q9hx6uro42m6jguo0ubywc73b, tableName=Identifications_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-439','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:37',439,'EXECUTED','7:e57200275b85d1d62febc89cc5ae148b','createIndex indexName=FK_qb9ji50w6mbt5tgj801fn2yd0, tableName=SampleAttach','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-440','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:37',440,'EXECUTED','7:f701502a7bb9edaa733488492ca151b7','createIndex indexName=FK_qblg3frh0iswo7u3w6faghpr, tableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-441','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:37',441,'EXECUTED','7:41d54bb23ead268331efe6c2eceaef63','createIndex indexName=FK_qfj9ewnq35gytcvg9iqxvri7j, tableName=Specimens','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-442','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:37',442,'EXECUTED','7:172c4f57e1b8bd5c6ecb11a16023fc21','createIndex indexName=FK_qi2p2jj9tvuiyxgns6e7s7s7p, tableName=SeqSources','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-443','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:37',443,'EXECUTED','7:4a60f5b1a4fecab9bf2931f0d874d045','createIndex indexName=FK_qjhdmqlauh995txjxbyqlvt0p, tableName=SeqSources','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-444','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:37',444,'EXECUTED','7:977129ca3406a254228646c8a20677e5','createIndex indexName=FK_qps6ai7tcwe35281n22f5qgac, tableName=Features','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-445','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:37',445,'EXECUTED','7:5ff33f59b38920d3fb36de73e713434c','createIndex indexName=FK_qrjwbqax7ro6uos8jllr4noyi, tableName=Containers','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-446','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:37',446,'EXECUTED','7:8f8b29e7554e9c7d45e47f802d1abba1','createIndex indexName=FK_qsywx3kn4haf7fb0fal1ko4sd, tableName=PcrBatchs','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-447','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:37',447,'EXECUTED','7:eac5519dd48200a249e13814a884027e','createIndex indexName=FK_qtmk2q6w736xfc24hj9xbp4bw, tableName=BiologicalCollections','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-448','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:37',448,'EXECUTED','7:ae6fb95bce4952e77735c66c33dd19a7','createIndex indexName=FK_r2lpq0l0tylb3ee4xdjgi1ue7, tableName=SpecimenReplicates','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-449','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:37',449,'EXECUTED','7:aa63a3647cba41596f03d651ca277317','createIndex indexName=FK_r6bjqv7jmvqu5j2kbf017wvwv, tableName=Events','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-450','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:37',450,'EXECUTED','7:22ab3d11efba335a325673d639f9adbc','createIndex indexName=FK_rjc8t80j6yf06x4spmlq53mmi, tableName=SeqReactions','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-451','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:37',451,'EXECUTED','7:f73721c3539e893d9704eabc4bc1ec2c','createIndex indexName=FK_rn5embtsuc9p9bbs027gun5px, tableName=Genotypes','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-452','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:37',452,'EXECUTED','7:ea3ccdfcfd399387a4988e3aba755306','createIndex indexName=FK_rpbwh1f9k66r13ma96vy1wmvq, tableName=Genotypes','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-453','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:37',453,'EXECUTED','7:0fbdc7872822771b11d4ccb553783c61','createIndex indexName=FK_rsyctg2p1bxfnhguxpr3xrm47, tableName=Projects','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-454','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:38',454,'EXECUTED','7:3fb42573de68fb3763e1c67877926f61','createIndex indexName=FK_s238mngbvqv10t8lwkgqb81xc, tableName=CollectionInfos','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-455','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:38',455,'EXECUTED','7:bc698a6d6f04e2eb1b5096c0ae382481','createIndex indexName=FK_s2joblkkv71yib8kce8uxvlt7, tableName=PcrReactions','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-456','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:38',456,'EXECUTED','7:c71c503bcd4f182253ca20ed49e1f376','createIndex indexName=FK_s7391xm6gpdaivq4k87wt2g8h, tableName=SpreadSheetColumns','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-457','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:38',457,'EXECUTED','7:6ee282c1493511e805e2d2b8a33f5a0b','createIndex indexName=FK_sdfpg9um9vmjk132spagwfp3q, tableName=Identifications','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-458','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:38',458,'EXECUTED','7:0ce06feeca6feaad79e50fe6b91b2d44','createIndex indexName=FK_sii753dw6tfwj8lc4iokho2q, tableName=Containers','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-459','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:38',459,'EXECUTED','7:29cf3d919a62ce20282745f56250289d','createIndex indexName=FK_sirj0wrt2yk94lvw1mrlw2qc4, tableName=SeqBatchs','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-460','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:38',460,'EXECUTED','7:d8800a6e10db268bc5b7e8294350d04d','createIndex indexName=FK_sj0ixihlctmheexvesghvvhbh, tableName=Provinces','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-461','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:38',461,'EXECUTED','7:5b6ffcb2995f47591f8e5035d0c932b8','createIndex indexName=FK_sn9a64qvbnm650bmmfj23v3p9, tableName=Addresses','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-462','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:38',462,'EXECUTED','7:9cfd8a6520caef36797b26436f64d2c9','createIndex indexName=FK_sq1n8okqvy44oofqqvkhxqf13, tableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-463','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:38',463,'EXECUTED','7:52e580fe226bcc1eb411bbef71827964','createIndex indexName=FK_suc9oypbv4aigggkmbc16q14f, tableName=Alleles_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-464','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:38',464,'EXECUTED','7:2624bf78b04cf9ee92e77b64f3935b2c','createIndex indexName=FK_susn9fe31sdoambvi1nlx436n, tableName=ProtocolAttach','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-465','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:38',465,'EXECUTED','7:1d4c1dcc3e8967d74cef41dbdecfc5f0','createIndex indexName=FK_svifa8l2op31413apv1d2unq4, tableName=ClusterProjects','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-466','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:38',466,'EXECUTED','7:097255c18849ca12977eff6ebcc06afc','createIndex indexName=FK_swn4iqbmyw7uoe1m7hq6fnyst, tableName=Locations','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-467','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:38',467,'EXECUTED','7:fd2e1468d5e9fc6f98b3a622701c0397','createIndex indexName=FK_swtwrw5un870fjrefj2xtbnp4, tableName=TagFragment','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-468','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:38',468,'EXECUTED','7:88fd6afa643f5188d0d9c2d40c634f7f','createIndex indexName=FK_syge507bmxa59tfo3sun3s8le, tableName=ProviderChains_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-469','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:38',469,'EXECUTED','7:4f3f141f709f37c2a1437c926fa6ff24','createIndex indexName=FK_t2eqlq7cjhc7a8jp5ulrypmgc, tableName=SeqBatchs_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-470','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:38',470,'EXECUTED','7:d048318eea3ba506e37dff4a02fa5372','createIndex indexName=FK_t2mrruiddat2byt9i5coq185o, tableName=PeopleAddresses','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-471','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:38',471,'EXECUTED','7:02fa249d43258e558c550f4cf85ef5b1','createIndex indexName=FK_t6cd9ar6svjw54k8x9hk5rfoa, tableName=Locations','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-472','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:38',472,'EXECUTED','7:5e92c5db48a4706fc2ddfa579bb65b18','createIndex indexName=FK_teecm7ke2c04iprfxcfds7ump, tableName=BlastHits','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-473','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:38',473,'EXECUTED','7:ca815c2eeab93eb254cea362f6d7343e','createIndex indexName=FK_thvqsq3ko7r52yfedudeab4vr, tableName=FeatureLocations','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-474','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:38',474,'EXECUTED','7:5e3925e7b3c2ffadf97b77e61a4922fa','createIndex indexName=FK_tkxk7kxmhav5jejmldunlthm2, tableName=PcrBatchs','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-475','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:38',475,'EXECUTED','7:ee0fd807275d95e4c11674b0704d3417','createIndex indexName=FK_trgcxt8qjd6e6jwrkfgpf7t63, tableName=Annotations','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-476','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:38',476,'EXECUTED','7:cc8383ff1aadfd5782aba0e4c8bbea8d','createIndex indexName=FK_xh4m3hf4s2jrh7b9k6hcfuu7, tableName=Clones','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-477','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:38',477,'EXECUTED','7:f1247448faf0235d472ca01c1bf2fdb7','createIndex indexName=collectionInfo_city_idx, tableName=CollectionInfos','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-478','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:38',478,'EXECUTED','7:841aa1966cef6d658d1aceec9fec95b3','createIndex indexName=fragment_name_idx, tableName=Fragments','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-479','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:38',479,'EXECUTED','7:844d61b976b40a70a9a049dba1509f02','createIndex indexName=mixedSpecimen_substrateType_idx, tableName=MixedSpecimens','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-480','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:38',480,'EXECUTED','7:c67dafe8b569d78950264307f77b48a4','createIndex indexName=sequences_fileName_idx, tableName=Sequences','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-481','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:38',481,'EXECUTED','7:4ffda8dd6a63b806b9ae85e4cd1e2f08','createIndex indexName=sequences_mixedSpecimen_result_idx, tableName=Sequences','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-482','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:38',482,'EXECUTED','7:13b49a8637a1676155c0513eb7adc103','createIndex indexName=sequences_name_idx, tableName=Sequences','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-483','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:39',483,'EXECUTED','7:9ce9dfdfb928c15fadda234583a81c15','addForeignKeyConstraint baseTableName=Taxa, constraintName=FK_15ccibevnv1sc0ntlmbn7oxdt, referencedTableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-484','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:39',484,'EXECUTED','7:2ceb2da2f2b1a0e602acd2acfbdfbcad','addForeignKeyConstraint baseTableName=Identifications, constraintName=FK_16rjw3tn0pbitl26qtce8a0iq, referencedTableName=Sequences','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-485','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:39',485,'EXECUTED','7:7af7c69fccc2bf133ea804d7d52e7047','addForeignKeyConstraint baseTableName=PcrBatchs, constraintName=FK_190on7fv02cyhhqqbtynwmcfb, referencedTableName=Groups','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-486','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:39',486,'EXECUTED','7:342983066b3f83599049344ca7702b6c','addForeignKeyConstraint baseTableName=ReactionComponents, constraintName=FK_1a4aoax0d4hbnk3xyjl4qi9vv, referencedTableName=Protocols','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-487','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:39',487,'EXECUTED','7:6e54b52bd1f6c113d6f10e4c3fc902ba','addForeignKeyConstraint baseTableName=Taxa_AUD, constraintName=FK_1f2xpfvvbo9of6eauolhvqp7u, referencedTableName=Revision','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-488','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:39',488,'EXECUTED','7:f5e914d63f5415c772034cf22b14ad7d','addForeignKeyConstraint baseTableName=ProviderChains, constraintName=FK_1jp1erfwf28iroh9l6liq791v, referencedTableName=People','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-489','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:39',489,'EXECUTED','7:df4439399276846233e7a1e11635a1fc','addForeignKeyConstraint baseTableName=TagSample, constraintName=FK_1sjim4vyu289iagm2oe7me121, referencedTableName=ProjectTags','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-490','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:39',490,'EXECUTED','7:27f7ef6ae1e77780442c975a9ca823d7','addForeignKeyConstraint baseTableName=Regions_AUD, constraintName=FK_1tm6uj8qa05skj1arvj1tc5na, referencedTableName=Revision','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-491','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:39',491,'EXECUTED','7:1a9adfe2b0e3efbbd54d8a6f699106d2','addForeignKeyConstraint baseTableName=BlastResults, constraintName=FK_1v78ota9iutr1glkyp57pmstn, referencedTableName=Sequences','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-492','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:40',492,'EXECUTED','7:211d63341f8be5d0ea8fdc5b34342549','addForeignKeyConstraint baseTableName=SeqSources, constraintName=FK_1xl6pvmp5w185eq4b0aal9mft, referencedTableName=SeqReactions','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-493','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:40',493,'EXECUTED','7:ef7559ec773bd9b3b82f9911010e8afd','addForeignKeyConstraint baseTableName=CollectionInfos_AUD, constraintName=FK_1xm6fatpxmudxlvx20wg8n5h5, referencedTableName=Revision','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-494','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:40',494,'EXECUTED','7:044b1db36fe516b676f968418ee8a48b','addForeignKeyConstraint baseTableName=Protocols, constraintName=FK_1xw4rqu4nlbrgr7tfhix7ufr1, referencedTableName=Products','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-495','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:40',495,'EXECUTED','7:b6d8958b706c2b43ee09444430dc7230','addForeignKeyConstraint baseTableName=TagSequence, constraintName=FK_29af0jdceosu00gp08484a2f1, referencedTableName=Sequences','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-496','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:40',496,'EXECUTED','7:aced3b2ab239a2b4b965869fa780cb0a','addForeignKeyConstraint baseTableName=SeqSources, constraintName=FK_2pb4jtciyg4rdbffl5l5bmktd, referencedTableName=PcrPrimers','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-497','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:40',497,'EXECUTED','7:18121aae917123f0536cdeaf2c7476c9','addForeignKeyConstraint baseTableName=TagMixedSpecimen, constraintName=FK_2qk33ir4t157gly8xhlolo5n0, referencedTableName=MixedSpecimens','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-498','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:40',498,'EXECUTED','7:cd8de8ce72f74495812a8e7c2ba5b0a2','addForeignKeyConstraint baseTableName=Tasks, constraintName=FK_2rtb4sk2nb8xh2jxmsky5xdga, referencedTableName=Accounts','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-499','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:40',499,'EXECUTED','7:280027eacba27e0e15efe3f6627af429','addForeignKeyConstraint baseTableName=HybProjectsProjects, constraintName=FK_2uf57ss4mb8chcq4jlq5tmtwv, referencedTableName=HybProjects','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-500','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:40',500,'EXECUTED','7:bdcb9516a2fe354265f8dd0b9ad544cf','addForeignKeyConstraint baseTableName=Sequences, constraintName=FK_2urfmger9sr5kwyn20brwdhd9, referencedTableName=MixedSpecimens','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-501','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:40',501,'EXECUTED','7:9a0f32c27a8e3dc101adb96cbbae0497','addForeignKeyConstraint baseTableName=SeqSources, constraintName=FK_3080at25w8nm4v0d9yweie2ms, referencedTableName=Samples','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-502','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:41',502,'EXECUTED','7:12cf49dc968b34c27a3b10129d6a8fb2','addForeignKeyConstraint baseTableName=BlastResults, constraintName=FK_34433uytluhaf06rdf46u3ava, referencedTableName=BlastProjects','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-503','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:41',503,'EXECUTED','7:a77c74c28184f3a1fdb2e785406ddf67','addForeignKeyConstraint baseTableName=Sequences, constraintName=FK_34xfk4n49v3rpj0tucmnbm02i, referencedTableName=Vectors','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-504','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:41',504,'EXECUTED','7:9b731b11bb8e6ef2f0c7da43b963a512','addForeignKeyConstraint baseTableName=SpecimenReplicates, constraintName=FK_3aes8cn2mdyh6s51clncxgwst, referencedTableName=Specimens','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-505','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:41',505,'EXECUTED','7:4d5295da218d0c1db6eadec6e6003d0d','addForeignKeyConstraint baseTableName=MixedSpecimens, constraintName=FK_3bnrsjvog8w18jw1y2eh5hdo0, referencedTableName=MixsSpecification','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-506','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:41',506,'EXECUTED','7:597a1e17090ebe2df2b58b8d39ec3188','addForeignKeyConstraint baseTableName=Genotypes, constraintName=FK_3cwj5t84yd9qrhe8q0q9lc95k, referencedTableName=Specimens','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-507','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:41',507,'EXECUTED','7:a589a95dcee6787609a44fa6fbbef957','addForeignKeyConstraint baseTableName=BiologicalCollections, constraintName=FK_3eu58lcf41l1fb5b83yomu44n, referencedTableName=People','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-508','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:41',508,'EXECUTED','7:f3eb9af66f066d3dfb0b7fa0f66039b8','addForeignKeyConstraint baseTableName=ImportPermitEvents_AUD, constraintName=FK_3gp7w8nmhjrync27b1vmjm1d3, referencedTableName=Revision','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-509','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:41',509,'EXECUTED','7:d062cae15a7fc28d92d45e3793fc978f','addForeignKeyConstraint baseTableName=LexiconUsage, constraintName=FK_3mvttib8prndkuvcuts418msh, referencedTableName=UsageKeys','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-510','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:41',510,'EXECUTED','7:5575eb072d78b91cb1139bd6648f0138','addForeignKeyConstraint baseTableName=Sequences, constraintName=FK_3u8ticbp842dnauunqgwcwyqd, referencedTableName=Clones','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-511','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:41',511,'EXECUTED','7:1362c1e816312d1cc84a1c131560d214','addForeignKeyConstraint baseTableName=TaxonInfo, constraintName=FK_3vj6jcwsuwtkcm2xfppshnjdf, referencedTableName=Lexicon','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-512','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:42',512,'EXECUTED','7:78b8423ca8bffb0d515294c0e2edfe9f','addForeignKeyConstraint baseTableName=ProjectsProject, constraintName=FK_40glvko9wlbdh4axsvon037mg, referencedTableName=Projects','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-513','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:42',513,'EXECUTED','7:f0992d5af54c559ea59fb75f5b51bdc1','addForeignKeyConstraint baseTableName=PcrPrimers, constraintName=FK_4anag2k5y8odmss8vru2hprag, referencedTableName=People','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-514','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:42',514,'EXECUTED','7:3a93bbb1055f5db9919be0f6e604d66b','addForeignKeyConstraint baseTableName=PcrBatchs, constraintName=FK_4c30viwryqtx91qdsp81emqa, referencedTableName=Regions','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-515','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:42',515,'EXECUTED','7:dc885406b7441b83266dde0f379813c8','addForeignKeyConstraint baseTableName=TaxonLink, constraintName=FK_4ctc19khf6aaty1sxd3ao6xch, referencedTableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-516','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:42',516,'EXECUTED','7:85d3ede633d057b91121c423de94a91b','addForeignKeyConstraint baseTableName=Taxa, constraintName=FK_4dgb4gh2p3fmlalbj4qrolvkm, referencedTableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-517','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:42',517,'EXECUTED','7:9489acf729acb9c506d6fa88f771472a','addForeignKeyConstraint baseTableName=Containers, constraintName=FK_4hmy3nk8ec60v0ahr5fpr7vny, referencedTableName=UnitSections','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-518','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:42',518,'EXECUTED','7:21ed4082332ffb54ba49e4bc0a549b72','addForeignKeyConstraint baseTableName=SpreadSheetColumns, constraintName=FK_4hn0og6pmo69k02rt88nfidff, referencedTableName=SpreadSheetTemplates','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-519','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:42',519,'EXECUTED','7:e7bb11c95fca23d2fa3df3907b472c0b','addForeignKeyConstraint baseTableName=LoanForm, constraintName=FK_4p35ltc0esje5dqk6bijs1j8b, referencedTableName=People','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-520','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:42',520,'EXECUTED','7:28b492849c7cc68b9e20bbe8d7714b0f','addForeignKeyConstraint baseTableName=Refs, constraintName=FK_4qvccfx8g3psr818ndnsit51d, referencedTableName=Accounts','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-521','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:43',521,'EXECUTED','7:08bc4bac5d14c30d291be0a7fa5bb47e','addForeignKeyConstraint baseTableName=PcrReactions, constraintName=FK_4s912n70sf0mdyj3fcskcmnia, referencedTableName=PcrReactions','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-522','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:43',522,'EXECUTED','7:01e34b7983d98be6e5242b4a21340b28','addForeignKeyConstraint baseTableName=MixedSpecimens, constraintName=FK_4sbel4md60bhymihq22boplmq, referencedTableName=Groups','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-523','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:43',523,'EXECUTED','7:3ddef77b521cdef820b960c285d05b92','addForeignKeyConstraint baseTableName=SeqSources, constraintName=FK_4t7cg90s9ltmig4lkj5onx4qb, referencedTableName=Groups','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-524','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:43',524,'EXECUTED','7:7f071d1b476da616feaecf5dd15b443d','addForeignKeyConstraint baseTableName=Locations, constraintName=FK_4ytymn0oh44qtb1qlhxde27oe, referencedTableName=Fragments','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-525','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:43',525,'EXECUTED','7:34cc64b47676af6d20f7202959079e11','addForeignKeyConstraint baseTableName=Genotypes_AUD, constraintName=FK_5251so8coqx5l8rxh8yb4kwoq, referencedTableName=Revision','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-526','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:43',526,'EXECUTED','7:4b478d0370ffbbc96776aa663820361c','addForeignKeyConstraint baseTableName=SeqSources, constraintName=FK_5ehbgji2j0gjaihyvdrk3yp6o, referencedTableName=MixedSpecimens','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-527','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:43',527,'EXECUTED','7:412388b7fedd226e3543a0ca2f40400f','addForeignKeyConstraint baseTableName=Taxa, constraintName=FK_5k68p5d2j1dn1i1kp0cbi9m0f, referencedTableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-528','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:43',528,'EXECUTED','7:1cbc0836c4e1d063bb865c562c2e4892','addForeignKeyConstraint baseTableName=PcrBatchs, constraintName=FK_5ox5bp4jaw3po3u184kff1sul, referencedTableName=PcrBatchs','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-529','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:44',529,'EXECUTED','7:a30c9c8e3fc197b79a8eb81652d5a538','addForeignKeyConstraint baseTableName=Taxa, constraintName=FK_5w10nvvxa5nfdr6vghqx8wic, referencedTableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-530','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:44',530,'EXECUTED','7:9f495b91fe91519aa84dd09f0ec75070','addForeignKeyConstraint baseTableName=PcrBatchs, constraintName=FK_5xrpd7j1ifhcveugmvivsy9j4, referencedTableName=PcrPrimers','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-531','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:44',531,'EXECUTED','7:0a457c103aa58eceeacbc70f0f3d049a','addForeignKeyConstraint baseTableName=FungalInfos_AUD, constraintName=FK_60m2opdbdh0oovy8ojgwg2kf3, referencedTableName=Revision','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-532','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:44',532,'EXECUTED','7:0cbb5f92a0772dbdad0c792123ddb995','addForeignKeyConstraint baseTableName=TagFragment, constraintName=FK_643autsd7naoi3ym5n1cmyqyy, referencedTableName=ProjectTags','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-533','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:44',533,'EXECUTED','7:e5b1470cf94af13d6f150d319a09e02b','addForeignKeyConstraint baseTableName=TaxonInfo, constraintName=FK_68fxul2h3cddufu0vpwj2ig36, referencedTableName=Refs','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-534','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:44',534,'EXECUTED','7:488bebe21597e1282dcd5ef043e3637a','addForeignKeyConstraint baseTableName=Samples, constraintName=FK_68me2pv0wxtbibrt30wwtr1dr, referencedTableName=Protocols','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-535','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:44',535,'EXECUTED','7:22cd2425171a39d1fd2fff188423f864','addForeignKeyConstraint baseTableName=Fragments, constraintName=FK_690ir8h4t5713e5g8bpjxuqbv, referencedTableName=Groups','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-536','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:44',536,'EXECUTED','7:5ea3a3a9ada7a8a521876f2ef772484c','addForeignKeyConstraint baseTableName=SeqSources, constraintName=FK_6a987nbi5u3n7ak73yy9dntnq, referencedTableName=PcrReactions','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-537','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:45',537,'EXECUTED','7:643d5947a5c86bd3f687cdde926af1cd','addForeignKeyConstraint baseTableName=Annotations, constraintName=FK_6ei8vksayjvut57t365guvbgm, referencedTableName=AnnotationTypes','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-538','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:45',538,'EXECUTED','7:70a8eebc341e90a57a1c8c3af9732ce5','addForeignKeyConstraint baseTableName=Taxa, constraintName=FK_6mhas0jkiqqwt9wqgd2tyuhwf, referencedTableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-539','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:45',539,'EXECUTED','7:b5f36a79f39c8abbb6072e1dd8e23c99','addForeignKeyConstraint baseTableName=Genotypes, constraintName=FK_6v2oc6eppswssh1e5sqe9bnrk, referencedTableName=SeqReactions','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-540','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:45',540,'EXECUTED','7:9f3cae449e8910a5dc8ca7f9aed0ab4a','addForeignKeyConstraint baseTableName=ClusterSeqs, constraintName=FK_72w0hbbiv2tho9lcoe2n8oa21, referencedTableName=Sequences','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-541','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:45',541,'EXECUTED','7:3263b207f2763e01cf3704741e915142','addForeignKeyConstraint baseTableName=Sequences, constraintName=FK_752c8t4y20n7b76oe23bw7ynw, referencedTableName=SeqBatchs','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-542','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:45',542,'EXECUTED','7:e8928edd6aa9297cab0249676dab8030','addForeignKeyConstraint baseTableName=Annotations, constraintName=FK_793tgch4wtwhchwf0r7pd7bey, referencedTableName=Spots','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-543','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:45',543,'EXECUTED','7:418321ec9376e5a3952dd40e2f98729d','addForeignKeyConstraint baseTableName=Specimens, constraintName=FK_7bjcosxo8x3vxchhcya79skrj, referencedTableName=FungalInfos','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-544','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:45',544,'EXECUTED','7:e6eaec54ea782055529ea6c585b93a6c','addForeignKeyConstraint baseTableName=SeqReactions, constraintName=FK_7bu545r1h1nac1rqdehvyhhwo, referencedTableName=Groups','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-545','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:45',545,'EXECUTED','7:447730451205695a2c3c0185d39c4b6b','addForeignKeyConstraint baseTableName=SeqSubmissions, constraintName=FK_7epky6tflweq2d2d3ly5w4ga9, referencedTableName=SeqSubmissionConfigs','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-546','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:46',546,'EXECUTED','7:22d1b3ee575d19fb86513f0a2096876f','addForeignKeyConstraint baseTableName=PcrPrimers_AUD, constraintName=FK_7frxhwqxndu6ggu0pf8m33e1d, referencedTableName=Revision','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-547','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:46',547,'EXECUTED','7:e42a3a265758b59efb1a452cddd5efe0','addForeignKeyConstraint baseTableName=Fragments, constraintName=FK_7kanmm9rrhdfnmdx641s6f68j, referencedTableName=Specimens','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-548','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:46',548,'EXECUTED','7:755994c28a14876463824618fb104896','addForeignKeyConstraint baseTableName=LabelTemplates, constraintName=FK_7ni5bxxry15ocko3jkdtblh0l, referencedTableName=BarcodeableMaps','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-549','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:46',549,'EXECUTED','7:00bef55f70354302074459fe8a76778c','addForeignKeyConstraint baseTableName=PeopleGroups, constraintName=FK_7qbopoys5i020a1u0wtksh9al, referencedTableName=Groups','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-550','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:46',550,'EXECUTED','7:e4d555f4568f75ac072b248952da1c9d','addForeignKeyConstraint baseTableName=Taxa, constraintName=FK_7x2v74i9c0j03hn520v736u82, referencedTableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-551','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:46',551,'EXECUTED','7:2a3501be7798c200928e922dfb988ce5','addForeignKeyConstraint baseTableName=Taxa, constraintName=FK_7yaw7x60h21dyp9dsvco0tu6c, referencedTableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-552','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:46',552,'EXECUTED','7:a075c75fff220721ad5df372c8dcffa4','addForeignKeyConstraint baseTableName=SeqSources, constraintName=FK_841om21hek51soq7fc05fgvij, referencedTableName=BiologicalCollections','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-553','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:47',553,'EXECUTED','7:ad504c1096be7be5327a1585a823da27','addForeignKeyConstraint baseTableName=LibrariesProjects, constraintName=FK_873ojhy1tfgyvqcvlhlaq1v0w, referencedTableName=Libraries','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-554','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:47',554,'EXECUTED','7:010cd9b6f35607611b711ec21ec55b11','addForeignKeyConstraint baseTableName=Containers, constraintName=FK_8b01ws3lovo12oxco33193f2n, referencedTableName=Groups','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-555','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:47',555,'EXECUTED','7:ca847d3663907a6256343876dbd3e91b','addForeignKeyConstraint baseTableName=Taxa, constraintName=FK_8g4x7w1q441tcqmjqjrepp9df, referencedTableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-556','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:47',556,'EXECUTED','7:bb62a01ed858a76e6679c123c5390aa1','addForeignKeyConstraint baseTableName=LoanAttach, constraintName=FK_8hienxmj6umhwwdwtdia6mo00, referencedTableName=LoanForm','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-557','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:47',557,'EXECUTED','7:b5cc8330bfe3a85f087068f626849d8c','addForeignKeyConstraint baseTableName=PcrProfiles, constraintName=FK_8inqadrodpjw8h6jun9r19u20, referencedTableName=Regions','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-558','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:47',558,'EXECUTED','7:e20f9556ec5ff36f752cfe424c3f36b6','addForeignKeyConstraint baseTableName=SeqSources, constraintName=FK_8k21fscowx43bsg9stcjm6lne, referencedTableName=Specimens','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-559','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:47',559,'EXECUTED','7:dc6c4f0448ccb0a4d0ea200b13fbb38d','addForeignKeyConstraint baseTableName=ImportPermitAttach, constraintName=FK_8op37369nil7onkhfvwsjx8qg, referencedTableName=ImportPermits','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-560','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:47',560,'EXECUTED','7:49647179aa676238798e4c641324c31a','addForeignKeyConstraint baseTableName=ImportPermits, constraintName=FK_8t3csx2jn8t4wvjfyx0o87wsv, referencedTableName=Groups','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-561','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:47',561,'EXECUTED','7:e59ccb0f33a53d2331de8808b7e8c5cd','addForeignKeyConstraint baseTableName=Protocols, constraintName=FK_8uvt9ggw52gw8ec687h28civr, referencedTableName=Groups','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-562','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:48',562,'EXECUTED','7:3ea38bdbde374b6378f4eb2b0639caf1','addForeignKeyConstraint baseTableName=Taxa, constraintName=FK_8vifg5efr3p08day12ari3ywb, referencedTableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-563','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:48',563,'EXECUTED','7:9dbf5b987b72c0f2932eb12428d024fa','addForeignKeyConstraint baseTableName=SeqProjectsProjects, constraintName=FK_8wcdhmuhu5wu1597flwnaiopr, referencedTableName=SeqProjects','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-564','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:48',564,'EXECUTED','7:200dfcb8bf3b834f98d092e3410f2aed','addForeignKeyConstraint baseTableName=Taxa, constraintName=FK_8xjjo8revddjgtew69fi2d4qo, referencedTableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-565','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:48',565,'EXECUTED','7:d122b70eabb3eca1fbefeab929ebbbda','addForeignKeyConstraint baseTableName=PcrReactions, constraintName=FK_947m1h8wbrjbe7webovc5ohhd, referencedTableName=PcrPrimers','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-566','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:48',566,'EXECUTED','7:6ec09de12c954c86fc2d832cb65d9348','addForeignKeyConstraint baseTableName=MixedSpecimens, constraintName=FK_94np4iqalsmisrmtv3i0ce51c, referencedTableName=ImportPermits','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-567','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:48',567,'EXECUTED','7:3cfc4753b93b1b400ac8ea796971f8f7','addForeignKeyConstraint baseTableName=SeqReactions_AUD, constraintName=FK_97cbm6ka2tewfdj53avcpek7m, referencedTableName=Revision','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-568','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:48',568,'EXECUTED','7:abdca24348d989d21034c9b2f3af0753','addForeignKeyConstraint baseTableName=Libraries, constraintName=FK_9bdt7x1mdttes489fiu6ca0vc, referencedTableName=Samples','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-569','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:49',569,'EXECUTED','7:ab9345f0fdc666b76194f64846a17890','addForeignKeyConstraint baseTableName=Specimens, constraintName=FK_9gvxtgp71ikmbcxtth821ovhk, referencedTableName=MixedSpecimens','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-570','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:49',570,'EXECUTED','7:6c01a611b8436497131523989550a606','addForeignKeyConstraint baseTableName=Taxa, constraintName=FK_9vmjpfkow8tsrpvkj1tls7l6c, referencedTableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-571','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:49',571,'EXECUTED','7:2c44447749a217102ea8de9da7007335','addForeignKeyConstraint baseTableName=Taxa, constraintName=FK_9vnuhsjbibxrndfjavof2oek3, referencedTableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-572','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:49',572,'EXECUTED','7:91144d453c5761495618da014a20e5b9','addForeignKeyConstraint baseTableName=SeqSubmissions, constraintName=FK_9wmtct7d3ouyoo3vjrhfa1nml, referencedTableName=Groups','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-573','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:49',573,'EXECUTED','7:2520d76d3f3b028162977e39a3df1a35','addForeignKeyConstraint baseTableName=ImportPermits_AUD, constraintName=FK_9yt5xppi0c6phhbb9a0uo0klr, referencedTableName=Revision','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-574','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:49',574,'EXECUTED','7:82819a6a273d2bd3f4203fdf7213b43c','addForeignKeyConstraint baseTableName=SeqSources, constraintName=FK_a4kc877d1qdvhe6ickb5t5t8y, referencedTableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-575','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:49',575,'EXECUTED','7:3545f6e3b882aa129524a75006e9a40a','addForeignKeyConstraint baseTableName=LoanAct, constraintName=FK_a4ruos4y5lde9c6vpbfedu1x8, referencedTableName=LoanForm','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-576','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:49',576,'EXECUTED','7:7ead344a617b00db121c7e547ae05c70','addForeignKeyConstraint baseTableName=Addresses_AUD, constraintName=FK_a52vr69j4yhujfvingbvgwti7, referencedTableName=Revision','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-577','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:50',577,'EXECUTED','7:5fae87049000002d17a62c3a36e7c7b5','addForeignKeyConstraint baseTableName=Specimens, constraintName=FK_a5jdmsuglwns7mfoklg41dko7, referencedTableName=ImportPermits','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-578','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:50',578,'EXECUTED','7:37aa0da0db45e875157e29fce3c693ea','addForeignKeyConstraint baseTableName=MixedSpecimens, constraintName=FK_a6yywjr2k3p8liflvfcqvijhk, referencedTableName=CollectionInfos','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-579','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:50',579,'EXECUTED','7:aecec3981b5d38151051be964d882f46','addForeignKeyConstraint baseTableName=Taxa, constraintName=FK_a9gk29p8sof5bnti457xfkh87, referencedTableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-580','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:50',580,'EXECUTED','7:babbaeaacec52c3bd15347f20f771ce2','addForeignKeyConstraint baseTableName=Taxa, constraintName=FK_abmjpyg0a3fjx803jsvuohy8j, referencedTableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-581','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:50',581,'EXECUTED','7:a2bd0ec40b6b8526a58adae3ea859788','addForeignKeyConstraint baseTableName=Regions, constraintName=FK_afqlk7jwweqdv5evifnx1ugkm, referencedTableName=Groups','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-582','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:50',582,'EXECUTED','7:d62cb35d744dc64551d756d0896d4c86','addForeignKeyConstraint baseTableName=Genotypes, constraintName=FK_agn2dbwsghp1adwacwp995vsu, referencedTableName=Samples','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-583','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:51',583,'EXECUTED','7:68a45b1a038ca9488488411ff197c0ac','addForeignKeyConstraint baseTableName=Taxa, constraintName=FK_amncx0v5qk0t1rc2hdc80c4np, referencedTableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-584','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:51',584,'EXECUTED','7:1e9b715bf5589abc38a43e02ca665404','addForeignKeyConstraint baseTableName=Locations, constraintName=FK_amshi66em4jphq5t3nempuqb9, referencedTableName=MixedSpecimens','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-585','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:51',585,'EXECUTED','7:b2fdf951914ac4194247951fd9c6c3f7','addForeignKeyConstraint baseTableName=SeqSources, constraintName=FK_an50pyveilyolmvmt3dms960t, referencedTableName=PcrBatchs','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-586','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:51',586,'EXECUTED','7:2833b4756b833dcabcc4e2eda3018106','addForeignKeyConstraint baseTableName=PcrReactions, constraintName=FK_aoqmedewpccv2ml2lgoec0c06, referencedTableName=Samples','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-587','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:51',587,'EXECUTED','7:6589a8670334b2740ad82302d82d3264','addForeignKeyConstraint baseTableName=LoanForm, constraintName=FK_ap7h52t09ifgna8eb18rewjdw, referencedTableName=Addresses','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-588','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:51',588,'EXECUTED','7:ce53ea304d2750d90fe37587b8a73333','addForeignKeyConstraint baseTableName=MixedSpecimens_AUD, constraintName=FK_argt4d0rarc85d2x82523b2cf, referencedTableName=Revision','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-589','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:51',589,'EXECUTED','7:91709a120d727405ba5079c9008e4081','addForeignKeyConstraint baseTableName=Taxa, constraintName=FK_b4hyi1s7df54l89yxk8txbxd3, referencedTableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-590','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:51',590,'EXECUTED','7:93fc5ecf12a9dd1029daf4e41177eaf4','addForeignKeyConstraint baseTableName=Features, constraintName=FK_b4jkqt4yxxuuwre2sum1lys12, referencedTableName=Features','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-591','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:51',591,'EXECUTED','7:a0c8c27e86314f6784fcd32e0b87d21f','addForeignKeyConstraint baseTableName=Accounts, constraintName=FK_beprcfum14hti2f25qcyaxfwc, referencedTableName=People','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-592','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:51',592,'EXECUTED','7:605a45048ff05adbc12759d6173b3690','addForeignKeyConstraint baseTableName=BlastProjects, constraintName=FK_bg9ucdvgtvkvoxjj9n1drmc61, referencedTableName=Datasets','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-593','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:52',593,'EXECUTED','7:3be124ce89389e921711c346e4dd296b','addForeignKeyConstraint baseTableName=Taxa, constraintName=FK_bh11kemtx4pu5snt7ohpp001, referencedTableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-594','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:52',594,'EXECUTED','7:aaa0eee4eefeb462e5d39dd3a7f0cbc2','addForeignKeyConstraint baseTableName=ClusterCons, constraintName=FK_bhu3d918y3o4r7loipn3ynn1m, referencedTableName=ClusterProjects','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-595','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:52',595,'EXECUTED','7:db20fc8e66700bfb3524a30d3d0c2390','addForeignKeyConstraint baseTableName=Fragments, constraintName=FK_btqnax4uj78wdq9hc58g2s3ey, referencedTableName=PcrBatchs','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-596','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:52',596,'EXECUTED','7:0fd6b8a9c9084574c34dae097558ad0b','addForeignKeyConstraint baseTableName=PeopleGroups, constraintName=FK_buxmypgdwcfgy8gprhfo1k9a4, referencedTableName=People','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-597','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:52',597,'EXECUTED','7:2746855e807a51712db458de8e533365','addForeignKeyConstraint baseTableName=MixsSpecification_AUD, constraintName=FK_bva1xtoa70un4afj9pihokk84, referencedTableName=Revision','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-598','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:52',598,'EXECUTED','7:b9508abcad1e509274cd36f35ae6e864','addForeignKeyConstraint baseTableName=Taxa, constraintName=FK_bw8gdw7kno52jatkm23yr7urg, referencedTableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-599','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:52',599,'EXECUTED','7:5fe48f6a2686a2d64144962813ac9274','addForeignKeyConstraint baseTableName=SpreadSheetTemplates, constraintName=FK_bwa6s2770ef5adnwm1k214yh7, referencedTableName=AccountProfiles','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-600','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:52',600,'EXECUTED','7:d3658da892552de13f6a64a722a19b40','addForeignKeyConstraint baseTableName=Clones, constraintName=FK_c15u3yal2u3bmnp96dcycn522, referencedTableName=Libraries','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-601','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:53',601,'EXECUTED','7:5dfb2dbdbe5133744047533ec6cee289','addForeignKeyConstraint baseTableName=Fragments_AUD, constraintName=FK_c3c6aipgssi2std58qr8hltxa, referencedTableName=Revision','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-602','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:53',602,'EXECUTED','7:0505a12a185c1b777a96c652d34b8025','addForeignKeyConstraint baseTableName=Taxa, constraintName=FK_c4fget0ufn0xy30sfpve8h4ty, referencedTableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-603','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:53',603,'EXECUTED','7:1b02f78d9310640069ef998f6a646468','addForeignKeyConstraint baseTableName=Features, constraintName=FK_c4u5jdc3fu4776plhw40lwqh9, referencedTableName=Sequences','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-604','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:53',604,'EXECUTED','7:7c587d43d95788aa4dbfcc7a6519fa5c','addForeignKeyConstraint baseTableName=MixedSpecimenAttach, constraintName=FK_c5x1738wdf7q5e7hxgq4o78e, referencedTableName=MixedSpecimens','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-605','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:53',605,'EXECUTED','7:85a23ad05a43a011d691ab02b9bbedc4','addForeignKeyConstraint baseTableName=Taxa, constraintName=FK_cacot4sqn736h54rx371yu6w6, referencedTableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-606','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:53',606,'EXECUTED','7:04a4fda79e194fd58cd82c3178a08ff8','addForeignKeyConstraint baseTableName=Samples, constraintName=FK_chdo5fadxi2yf42ww78sy89xa, referencedTableName=Products','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-607','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:53',607,'EXECUTED','7:04e6059cb56157fb8b9393aca745a101','addForeignKeyConstraint baseTableName=Specimens, constraintName=FK_chm46hvjsj7r9jk2t9js4gf5o, referencedTableName=MixsSpecification','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-608','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:53',608,'EXECUTED','7:1f0b12a34a4a0cd334099eb89708df1d','addForeignKeyConstraint baseTableName=Products, constraintName=FK_clmijec1ll51e1cw4y06pa1lj, referencedTableName=Groups','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-609','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:54',609,'EXECUTED','7:e0035be8c59208c56efb4d7902979d34','addForeignKeyConstraint baseTableName=Spots, constraintName=FK_cuflk23ug0204f8gddp5ihwym, referencedTableName=Hybridizations','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-610','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:54',610,'EXECUTED','7:00c3e3bc6bcce27d5f3bb4974b4f6f8b','addForeignKeyConstraint baseTableName=LoanForm, constraintName=FK_cvux8wn8y5p76osk93xs676h3, referencedTableName=People','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-611','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:54',611,'EXECUTED','7:ad60b74635b987b1508abdd8a74e249e','addForeignKeyConstraint baseTableName=Taxa, constraintName=FK_d3h9i3xcoa7d9norwjrft38ob, referencedTableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-612','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:54',612,'EXECUTED','7:8aac09d08de80f5b4bd7d6a355d4b43d','addForeignKeyConstraint baseTableName=PcrPrimers, constraintName=FK_d5ldlywy1pp43lba8ciyyx1us, referencedTableName=Regions','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-613','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:54',613,'EXECUTED','7:0340547a053e8e19f99867792cfde23a','addForeignKeyConstraint baseTableName=SeqSubmissions_AUD, constraintName=FK_datf6vhkjqkdew6ajt992er74, referencedTableName=Revision','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-614','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:54',614,'EXECUTED','7:878de6dece91bbae74f7d0774df1118e','addForeignKeyConstraint baseTableName=Annotations, constraintName=FK_dee1xlolk34uhwqtc2i45nc0v, referencedTableName=AnnotationGroups','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-615','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:54',615,'EXECUTED','7:d2dbad87c984494eb1fd5934b04596a7','addForeignKeyConstraint baseTableName=LabelTemplates, constraintName=FK_df6kifjhg2ci1s074w5cho48g, referencedTableName=LabelFormats','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-616','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:54',616,'EXECUTED','7:e30e6628347fd0c083071830d329711e','addForeignKeyConstraint baseTableName=TagSpecimen, constraintName=FK_dfesxqm81ixf0nlhludtrdsqs, referencedTableName=ProjectTags','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-617','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:54',617,'EXECUTED','7:c453ef90de946d9cf330eaa167a4784e','addForeignKeyConstraint baseTableName=PcrProfiles_AUD, constraintName=FK_dftsxppl9qolmnbp96t2vyf4s, referencedTableName=Revision','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-618','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:55',618,'EXECUTED','7:5d7a3ce61b224808e355dedaed9930d4','addForeignKeyConstraint baseTableName=TagSequence, constraintName=FK_dfy3l4v77lgwyqgf54diobg8t, referencedTableName=ProjectTags','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-619','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:55',619,'EXECUTED','7:810ec64f710d7ece8a181e5b76a4015a','addForeignKeyConstraint baseTableName=AccountsGroups, constraintName=FK_dh5l0va08wgkf4t4rydt1qboc, referencedTableName=Accounts','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-620','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:55',620,'EXECUTED','7:62cebb96e401bc0dc845186014f11a0f','addForeignKeyConstraint baseTableName=Printers, constraintName=FK_di98ww0jwy6rja4tadd2baqrl, referencedTableName=LabelFormats','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-621','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:55',621,'EXECUTED','7:13929225e7012123c567a678ed7b2a78','addForeignKeyConstraint baseTableName=PcrBatchs_AUD, constraintName=FK_djmx4xysiut1o4y0p87bgcp95, referencedTableName=Revision','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-622','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:55',622,'EXECUTED','7:25aaa8c26615310d9af8689e3b887c0e','addForeignKeyConstraint baseTableName=TaxonRank_AUD, constraintName=FK_dr0ralul51gdqvut0cmn0aaa6, referencedTableName=Revision','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-623','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:55',623,'EXECUTED','7:689a239bb433de9381112a9be65ce900','addForeignKeyConstraint baseTableName=ClusterSeqs, constraintName=FK_dsjxu448lo4iqpswif2ututtv, referencedTableName=ClusterCons','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-624','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:55',624,'EXECUTED','7:f3f99f510135e70a2dc13dd9d24804b9','addForeignKeyConstraint baseTableName=SeqSources, constraintName=FK_dvb2lxtiyhu9q1l9r9mdpnadw, referencedTableName=PcrPrimers','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-625','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:55',625,'EXECUTED','7:ce822fa082c7377512345ad19aa3da1f','addForeignKeyConstraint baseTableName=Annotations, constraintName=FK_dwgkd6m4f6owt7vsof66jt54g, referencedTableName=Annotations','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-626','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:55',626,'EXECUTED','7:749bdfee79781a6fce624dec90c55079','addForeignKeyConstraint baseTableName=AccountUsage, constraintName=FK_dxy68kqa1bjydnyckv4coh8hr, referencedTableName=UsageKeys','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-627','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:55',627,'EXECUTED','7:3cee8f6a7b1d4dc37bf04d77bb7ea3a0','addForeignKeyConstraint baseTableName=BlastProjects, constraintName=FK_e4661f4v6pobq6g9hun21acvq, referencedTableName=Projects','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-628','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:55',628,'EXECUTED','7:06fcfe33b154435575412815c12606ca','addForeignKeyConstraint baseTableName=PcrReactions_AUD, constraintName=FK_e5emcecbalr3q8lwtky433qjm, referencedTableName=Revision','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-629','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:56',629,'EXECUTED','7:504cac1a73a21d98b2797f0b5e3315c7','addForeignKeyConstraint baseTableName=Taxa, constraintName=FK_e7wdawkkl8giwgn4uwrqv8897, referencedTableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-630','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:56',630,'EXECUTED','7:3b11570736991dd498b27c5cd955c477','addForeignKeyConstraint baseTableName=HybProjectsProjects, constraintName=FK_ebs36c3v9l1trpqs5obdfxmt4, referencedTableName=Projects','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-631','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:56',631,'EXECUTED','7:20f6cb1ed68237e84cfe80b097e71a2f','addForeignKeyConstraint baseTableName=AccountProfilePrinters, constraintName=FK_ec5p689miax2o0lk3sfqjdjey, referencedTableName=Printers','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-632','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:56',632,'EXECUTED','7:276b61e3b572c6afc73cd77eaedc3523','addForeignKeyConstraint baseTableName=SeqBatchs, constraintName=FK_ehc393q8ngsuhjk6y6juhfs16, referencedTableName=Protocols','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-633','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:56',633,'EXECUTED','7:b92f4e7df8846aec037aa4b2aafe6202','addForeignKeyConstraint baseTableName=Taxa, constraintName=FK_ejljb80rovoht26aa8iqka6gf, referencedTableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-634','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:56',634,'EXECUTED','7:28c977d99ec23b24dbf4dde65e3f848f','addForeignKeyConstraint baseTableName=ClusterProjects, constraintName=FK_eom5gcyan5jrsd0luivtalhui, referencedTableName=Groups','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-635','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:56',635,'EXECUTED','7:df775a4bd47e371cc669a03367bd00f4','addForeignKeyConstraint baseTableName=SpecimenReplicates, constraintName=FK_epcn4bq7utejkjuyofy2rxvcq, referencedTableName=Protocols','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-636','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:56',636,'EXECUTED','7:3b9a4a4de1423faf0e0106ac063e9f70','addForeignKeyConstraint baseTableName=AccountPreferences, constraintName=FK_est6u6oyjig1qej4vvsqpylk5, referencedTableName=Accounts','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-637','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:56',637,'EXECUTED','7:3c6283dea5ecf612141b5b232da456be','addForeignKeyConstraint baseTableName=SpecimenAttach, constraintName=FK_euetuttl64lssjvt1j7rihl72, referencedTableName=Specimens','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-638','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:57',638,'EXECUTED','7:e65350fde1d8b10195c704c37ae8b6a0','addForeignKeyConstraint baseTableName=Taxa, constraintName=FK_eyjixa0qguc5yxufrwscomh4x, referencedTableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-639','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:57',639,'EXECUTED','7:c635b8be9c55bc5b3bee9db73922c84f','addForeignKeyConstraint baseTableName=Hosts_AUD, constraintName=FK_f1ko8oiulps3jmtxrq9f87mmj, referencedTableName=Revision','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-640','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:57',640,'EXECUTED','7:a823886483523f74d60daa871b21b0e6','addForeignKeyConstraint baseTableName=SeqSources, constraintName=FK_fe5snpi3d9mdpo5jh6vvbu5m7, referencedTableName=CollectionInfos','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-641','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:57',641,'EXECUTED','7:61e93171071182e363ba9c0d0770cae2','addForeignKeyConstraint baseTableName=Taxa, constraintName=FK_fjyb34dplfbvwvhsaym7x1cxi, referencedTableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-642','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:57',642,'EXECUTED','7:7e8ea96fb17cf1e7e2cbbe6002153a6d','addForeignKeyConstraint baseTableName=LibrariesProjects, constraintName=FK_fkisljs3fflmp59td40rdh9py, referencedTableName=Projects','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-643','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:57',643,'EXECUTED','7:a59d9d48048741c7b2b42ca6033ea985','addForeignKeyConstraint baseTableName=PeopleAddresses, constraintName=FK_fmo1wa3swpawahjntu632s4dm, referencedTableName=People','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-644','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:57',644,'EXECUTED','7:c2232abe78f0c236cdf5b8cd1d3c64aa','addForeignKeyConstraint baseTableName=LoanForm, constraintName=FK_focrnu2ify77abyh6uxpwlkfx, referencedTableName=BiologicalCollections','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-645','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:58',645,'EXECUTED','7:f9f15511dfa814c46467dfce7edaf161','addForeignKeyConstraint baseTableName=TaxonInfo, constraintName=FK_fsq05c8gi6u8h98gfpfb10k2j, referencedTableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-646','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:58',646,'EXECUTED','7:20e366b6e6df6c430a36fffc6aebde4c','addForeignKeyConstraint baseTableName=SeqSubmissionConfigs, constraintName=FK_fu1nicmbjrsh47siaw44o5emt, referencedTableName=SubmissionFacilitys','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-647','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:58',647,'EXECUTED','7:8003a3f1d9fe9ce53ccd50f0227129c8','addForeignKeyConstraint baseTableName=SeqSubmissionConfigs_AUD, constraintName=FK_fxs96q5cde8k7q3x19eodhpuv, referencedTableName=Revision','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-648','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:58',648,'EXECUTED','7:ebd5debcd78932477c25f74c52eb10e2','addForeignKeyConstraint baseTableName=BlastHsps, constraintName=FK_g48fynsesdt18nq3qoyjaxrbe, referencedTableName=BlastHits','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-649','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:58',649,'EXECUTED','7:f53c5c43d4df76c9daf614d8223edadd','addForeignKeyConstraint baseTableName=Specimens, constraintName=FK_g4ipod035t585hvin5lhry1em, referencedTableName=Groups','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-650','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:58',650,'EXECUTED','7:72565173c74116da2343f012e638a5ce','addForeignKeyConstraint baseTableName=Specimens, constraintName=FK_g4pmqjoloyf5fhafvv73hjcn1, referencedTableName=BiologicalCollections','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-651','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:58',651,'EXECUTED','7:d9741918439ff0feeadf215f393fe8ed','addForeignKeyConstraint baseTableName=PcrProfiles, constraintName=FK_g9ndujio1cprdfv1vxr25h6r4, referencedTableName=Groups','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-652','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:58',652,'EXECUTED','7:8eed6e3f032816b51240731986ca45f9','addForeignKeyConstraint baseTableName=BiologicalCollections, constraintName=FK_gbiqv9ercno7hkdmqp9svtbk5, referencedTableName=Groups','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-653','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:58',653,'EXECUTED','7:f0b00702c9d5638c6fe8b6d650115278','addForeignKeyConstraint baseTableName=Fragments, constraintName=FK_gcnjlac5jn8tln0ug2qkftf9b, referencedTableName=SeqReactions','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-654','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:58',654,'EXECUTED','7:d4f726b886af74aee91bf4e628422ca1','addForeignKeyConstraint baseTableName=Sequences, constraintName=FK_gkeyalwa6s2trxx01k4b8pbr9, referencedTableName=SeqMethods','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-655','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:59',655,'EXECUTED','7:75f44ef7714b893d43c465326220d748','addForeignKeyConstraint baseTableName=Protocols_AUD, constraintName=FK_gnj2gppl4gftqldmlj4btgxgg, referencedTableName=Revision','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-656','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:59',656,'EXECUTED','7:fba255d0d2d7cd94ebb2276eead10da7','addForeignKeyConstraint baseTableName=SubmissionFacilitys_AUD, constraintName=FK_goum9a5y0kseu9dl94pdk6io9, referencedTableName=Revision','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-657','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:59',657,'EXECUTED','7:b71f9812348a89f75ad3a7ae6b0350a5','addForeignKeyConstraint baseTableName=SeqProjectsSequences, constraintName=FK_gr1q9bfsft2mpfsc83gyi62s1, referencedTableName=SeqProjects','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-658','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:59',658,'EXECUTED','7:5fb60094f42f21e36c8fe96602888551','addForeignKeyConstraint baseTableName=Taxa, constraintName=FK_gs4a2pja8lggk6611pag4f04h, referencedTableName=TaxonRank','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-659','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:59',659,'EXECUTED','7:3f4102ecbdbdddbc52c665dbb385ed63','addForeignKeyConstraint baseTableName=Taxa, constraintName=FK_gu9ytkxs4x70fx0w53bw4lscx, referencedTableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-660','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:59',660,'EXECUTED','7:0f9450d6cc7477363a1496a1128969bd','addForeignKeyConstraint baseTableName=Sequences, constraintName=FK_hfcc8fl3ycrmkykbhk5e093da, referencedTableName=PcrReactions','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-661','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:59',661,'EXECUTED','7:69dcc9bba369f02e9ad1014bcc923375','addForeignKeyConstraint baseTableName=Locations, constraintName=FK_hqjcgefol6i4h3bx8mxyarxyl, referencedTableName=Containers','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-662','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:07:59',662,'EXECUTED','7:e2580c61c9180e5f5ae035d6eb6c3ee5','addForeignKeyConstraint baseTableName=ClusterCons_AUD, constraintName=FK_hx2169dofldjeoofyapn2i8sc, referencedTableName=Sequences_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-663','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:00',663,'EXECUTED','7:f86b9439ed7cf61f89b74037f90da051','addForeignKeyConstraint baseTableName=Taxa, constraintName=FK_hx82cmlm9a33gc2jnm1lhmc0o, referencedTableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-664','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:00',664,'EXECUTED','7:3dd6ad75ba846c16b76785e3d8bbb5bb','addForeignKeyConstraint baseTableName=PcrReactions, constraintName=FK_hxxl23rrnb8u65nr8myhg0899, referencedTableName=PcrPrimers','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-665','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:00',665,'EXECUTED','7:7e5ec5d0e683564985e1facb878b1f48','addForeignKeyConstraint baseTableName=Hosts, constraintName=FK_i0qacll44p0uklvkejag31tf3, referencedTableName=Taxonomys','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-666','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:00',666,'EXECUTED','7:c648486b5b87d35ec87799572c5af40a','addForeignKeyConstraint baseTableName=PcrBatchAttach, constraintName=FK_i1hvqhm5h2qb9xbijcvcjkksn, referencedTableName=PcrBatchs','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-667','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:00',667,'EXECUTED','7:a59a87c92fd5ba92a0dd48c85004976f','addForeignKeyConstraint baseTableName=AccountProfilePrinters, constraintName=FK_i3wj6ko1vkec6254r8l6laddr, referencedTableName=LabelTemplates','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-668','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:00',668,'EXECUTED','7:74cf34d26c672c5392fb628995aaaaa2','addForeignKeyConstraint baseTableName=Sequences, constraintName=FK_i4c0p2tldq4js6l2lpyjr1eyn, referencedTableName=GoHits','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-669','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:00',669,'EXECUTED','7:f72c80e58942f5a9b15c6426705638f5','addForeignKeyConstraint baseTableName=Features_AUD, constraintName=FK_i5819kpc7x3sxes3meew98m7n, referencedTableName=Revision','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-670','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:00',670,'EXECUTED','7:f11e22dfcd7f1a5b6791e26b881e7ce6','addForeignKeyConstraint baseTableName=ProjectTags_AUD, constraintName=FK_i84pu0014li6cglfesarm767j, referencedTableName=Revision','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-671','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:00',671,'EXECUTED','7:0e1ca34b86a0547a0a636c431e43e9db','addForeignKeyConstraint baseTableName=UnitSections, constraintName=FK_ic4tij5ely5myq7wlqhnhghm5, referencedTableName=Storages','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-672','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:01',672,'EXECUTED','7:dcef9ef9e944dab67ea3c607f6c5bd7a','addForeignKeyConstraint baseTableName=SeqSources_AUD, constraintName=FK_ifp950llqpju3mpdy9gllrvjb, referencedTableName=Revision','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-673','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:01',673,'EXECUTED','7:0bb3de03724665e6cf12e73cc5ca0aa6','addForeignKeyConstraint baseTableName=Taxa, constraintName=FK_ih7ql24i0hufcjjnh22rv0xfb, referencedTableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-674','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:01',674,'EXECUTED','7:5d29c1c4aa726e2528f78174e25a3abb','addForeignKeyConstraint baseTableName=Alleles, constraintName=FK_imr3iov7t4b7c2fgtednxil3s, referencedTableName=Genotypes','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-675','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:01',675,'EXECUTED','7:5a217ee8739e19800d04542e5c008f9a','addForeignKeyConstraint baseTableName=Fragments, constraintName=FK_is4e1n5v2h6ynpek902c5h7bu, referencedTableName=PcrReactions','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-676','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:01',676,'EXECUTED','7:1ef6facb721b4ee45130628f373b162a','addForeignKeyConstraint baseTableName=PcrBatchs, constraintName=FK_iyhmua5d43idxmrqwa6mt1mmx, referencedTableName=PcrProfiles','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-677','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:01',677,'EXECUTED','7:ba3be75aee166ffe8d2a6a60d71d9d6d','addForeignKeyConstraint baseTableName=Lexicon, constraintName=FK_j2o9mp4t113b0nuulwkidj9kh, referencedTableName=UsageKeys','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-678','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:01',678,'EXECUTED','7:dc9cee20c105ee63068bc48322afb326','addForeignKeyConstraint baseTableName=TagSpecimen, constraintName=FK_j44wkjwhacarb897v73r23pk5, referencedTableName=Specimens','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-679','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:01',679,'EXECUTED','7:353f1b42fcc800900007e611f999d37a','addForeignKeyConstraint baseTableName=PcrPrimers, constraintName=FK_j7w8lp16p2plapfkw12sxn561, referencedTableName=People','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-680','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:01',680,'EXECUTED','7:f44947036cac9f9cbe6b819d81040d47','addForeignKeyConstraint baseTableName=PcrReactions, constraintName=FK_jg81alaokneidyb0v3knwmj3u, referencedTableName=Groups','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-681','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:02',681,'EXECUTED','7:18f0cb8682915a2f4421f4bb8b1cd02a','addForeignKeyConstraint baseTableName=ContainerTypes, constraintName=FK_jhw6u82ksauethycw3p0nuadr, referencedTableName=Groups','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-682','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:02',682,'EXECUTED','7:ed65673124b474d49bfc6691a8ad36fd','addForeignKeyConstraint baseTableName=Storages, constraintName=FK_jma7et3xaob4668lptl2wswup, referencedTableName=Groups','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-683','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:02',683,'EXECUTED','7:ecf1a1744460a981824062f8d636c073','addForeignKeyConstraint baseTableName=Specimens, constraintName=FK_joe4105wh55sxa2b2olue5am5, referencedTableName=ProviderChains','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-684','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:02',684,'EXECUTED','7:97dee2fe5a5e4238b200f729defa4121','addForeignKeyConstraint baseTableName=Fragments, constraintName=FK_jsofbufrsm6m5h8qisfhkv9or, referencedTableName=Samples','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-685','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:02',685,'EXECUTED','7:f7a12400b88288d3ae1d7cab0627f75a','addForeignKeyConstraint baseTableName=GoHits, constraintName=FK_jt00wmbuf1wewbs6lxhhvrnhl, referencedTableName=GoProjects','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-686','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:02',686,'EXECUTED','7:862cda9399c4f32716899a18e5edec1f','addForeignKeyConstraint baseTableName=SeqProjectsProjects, constraintName=FK_jyuf5lfeq8hhd2g6uwnv002uk, referencedTableName=Projects','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-687','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:02',687,'EXECUTED','7:50059aa5f7ca93ebc51b048ca7f4ee81','addForeignKeyConstraint baseTableName=Genotypes, constraintName=FK_k7l4tnbth2y7o68pirvugiewk, referencedTableName=Fragments','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-688','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:02',688,'EXECUTED','7:05c084ada2d8cd21e101f92bd2161f5c','addForeignKeyConstraint baseTableName=Hosts, constraintName=FK_klgh9npei7xn60sbiv941cn5e, referencedTableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-689','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:02',689,'EXECUTED','7:0d62d99e219eb440835c02f863208d09','addForeignKeyConstraint baseTableName=ImportPermitEvents, constraintName=FK_kn41lnvoh0wd5wo2otg013lnw, referencedTableName=ImportPermits','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-690','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:02',690,'EXECUTED','7:e2e17c522ffd2a49c9e9e8015d8f57b6','addForeignKeyConstraint baseTableName=PcrBatchs, constraintName=FK_knhujokmet0ew9isorewoouim, referencedTableName=SeqSubmissions','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-691','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:03',691,'EXECUTED','7:2513ccf62639e896b5b8be134e8f1fad','addForeignKeyConstraint baseTableName=LoanForm, constraintName=FK_ksm66fxg7l7qyaxf1vsg0bfl2, referencedTableName=People','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-692','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:03',692,'EXECUTED','7:8d00bfdcd338105374b9ebd6bd93e925','addForeignKeyConstraint baseTableName=Samples, constraintName=FK_ktbmo6iq16f81gdradu70qkeo, referencedTableName=SpecimenReplicates','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-693','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:03',693,'EXECUTED','7:22352d802402bea756c3393cac72b47c','addForeignKeyConstraint baseTableName=PcrReactions, constraintName=FK_kvp7jk41aby9lisqxyxjlly6n, referencedTableName=PcrPrimers','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-694','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:03',694,'EXECUTED','7:2d4cf0224cf9430e191504ba1ab88198','addForeignKeyConstraint baseTableName=ProviderChains, constraintName=FK_l3qknci5nmdeqx7h6o3smaswa, referencedTableName=ProviderChains','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-695','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:03',695,'EXECUTED','7:61aca41c765442361f499f2fcb7a518d','addForeignKeyConstraint baseTableName=ValidationFields, constraintName=FK_l6te4yfcdu08mg24xawd3btcl, referencedTableName=ValidationRules','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-696','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:03',696,'EXECUTED','7:f32566a6cce64a4f4a78b0af978bd744','addForeignKeyConstraint baseTableName=SeqReactions, constraintName=FK_ld8v5qix5ku6tjehe3mg3cgqs, referencedTableName=PcrPrimers','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-697','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:03',697,'EXECUTED','7:c930d23e3001b0ea9d94fb5b8e28617c','addForeignKeyConstraint baseTableName=Taxa, constraintName=FK_le59c65oq61w3jtrk9b9tfo14, referencedTableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-698','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:03',698,'EXECUTED','7:12bb4bbc2e7af53177bd3135bf5ce723','addForeignKeyConstraint baseTableName=Taxa, constraintName=FK_lfjgcky9edg98resn1vadih2h, referencedTableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-699','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:04',699,'EXECUTED','7:b1964ac66d48e76358e5b97584dffe12','addForeignKeyConstraint baseTableName=PcrPrimers, constraintName=FK_libscfvci046fww5lgwxqauh5, referencedTableName=Groups','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-700','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:04',700,'EXECUTED','7:845181f4f45de16824f32208b98f1f4e','addForeignKeyConstraint baseTableName=LexiconUsage, constraintName=FK_lobmdymx6yfsxg526yp1xjt2y, referencedTableName=Lexicon','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-701','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:04',701,'EXECUTED','7:ae159c71cea2ac857db3df19f45edd4e','addForeignKeyConstraint baseTableName=SeqSources, constraintName=FK_lomh51bwssbvqxf99lccbl1o9, referencedTableName=ClusterSeqs','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-702','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:04',702,'EXECUTED','7:3ec6afe9380f27ccc89dc77bce34f6b0','addForeignKeyConstraint baseTableName=Tasks, constraintName=FK_lpenr1wqnlgis1koqqqw22kom, referencedTableName=FileSystemWatcherEntry','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-703','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:04',703,'EXECUTED','7:102787b5d6585985cdfd4b8589f6a962','addForeignKeyConstraint baseTableName=ValidationRules, constraintName=FK_lpyvw0afwddt8tb61weqjfyw2, referencedTableName=ProjectTags','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-704','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:04',704,'EXECUTED','7:466e5173f6ed3483d799f06e9e0c981f','addForeignKeyConstraint baseTableName=Specimens_AUD, constraintName=FK_lv3j7p9s03uyan9fcm2mcjl36, referencedTableName=Revision','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-705','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:04',705,'EXECUTED','7:83857e3ea7f30febfadf68637f9e3545','addForeignKeyConstraint baseTableName=EmailAddrs, constraintName=FK_lwuk6hh8xifok37n2yry6owi2, referencedTableName=People','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-706','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:04',706,'EXECUTED','7:ce78134536c07fe39db6631805e00810','addForeignKeyConstraint baseTableName=Addresses, constraintName=FK_lx56ewrr853p17h0qt2qdu3r3, referencedTableName=Provinces','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-707','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:04',707,'EXECUTED','7:0add380572af4a40d86bf26a4b2c5e75','addForeignKeyConstraint baseTableName=Sequences_AUD, constraintName=FK_m5g45w4ca6g0p3ldqjaol1s7h, referencedTableName=Revision','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-708','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:04',708,'EXECUTED','7:6684dc9e6fd45bf414c81107328b21b6','addForeignKeyConstraint baseTableName=SeqBatchs, constraintName=FK_m81rb3pfdiq14tabkpj3j9jyn, referencedTableName=Groups','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-709','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:05',709,'EXECUTED','7:da1a22b3bfc4a0afd0788b09d15e4e1f','addForeignKeyConstraint baseTableName=SeqSources, constraintName=FK_m9ly95txnk442e90at8oe0qh3, referencedTableName=SeqBatchs','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-710','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:05',710,'EXECUTED','7:8d61d8454a952aeeda95c56716178c0e','addForeignKeyConstraint baseTableName=Taxa, constraintName=FK_maxvacfxyxysc7lmrlf1npkto, referencedTableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-711','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:05',711,'EXECUTED','7:293ab38d0a0f3690bd1452ae53d52493','addForeignKeyConstraint baseTableName=ClusterCons, constraintName=FK_mb8baxn860mb530wmepcct0bj, referencedTableName=Sequences','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-712','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:05',712,'EXECUTED','7:c2f2e582a365fd4b16daeed2c4880b6f','addForeignKeyConstraint baseTableName=Taxa, constraintName=FK_mb8o3irwgug7doc3a2hfuos99, referencedTableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-713','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:05',713,'EXECUTED','7:212f80d2bda598db3682e32ef57a8a60','addForeignKeyConstraint baseTableName=TagSample, constraintName=FK_mbq67ya7vpqircwp8at9286hk, referencedTableName=Samples','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-714','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:05',714,'EXECUTED','7:1a0f82b8f92da9a7380bfba42d952d61','addForeignKeyConstraint baseTableName=LoanForm, constraintName=FK_mfvlp5u1havi9ud5sjy5wnqud, referencedTableName=Groups','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-715','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:05',715,'EXECUTED','7:a8dc79419bc449fbb48beccd4f52c279','addForeignKeyConstraint baseTableName=AccountProfiles, constraintName=FK_mn2mclv3mcu6a5jjorxgewlta, referencedTableName=Accounts','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-716','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:05',716,'EXECUTED','7:8ac4e6f4995bb33e941270b3070bf579','addForeignKeyConstraint baseTableName=GoProjects, constraintName=FK_mqehuefgg1n7lejxjaurysses, referencedTableName=Projects','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-717','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:06',717,'EXECUTED','7:be183c2f5769092efc01be62f597ee07','addForeignKeyConstraint baseTableName=Hybridizations, constraintName=FK_mqt6y55s7tmnvab0suukcp22v, referencedTableName=HybProjects','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-718','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:06',718,'EXECUTED','7:d594f9ee845cd5e3fb653f4697e54b5b','addForeignKeyConstraint baseTableName=MixedSpecimens, constraintName=FK_mr2al2qrjhtfdjurqp4rlai3a, referencedTableName=BiologicalCollections','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-719','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:06',719,'EXECUTED','7:fade7b62a9017f409d8ca27623208964','addForeignKeyConstraint baseTableName=Identifications, constraintName=FK_mvxonmas5vjv82wb2nym1na41, referencedTableName=Taxonomys','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-720','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:06',720,'EXECUTED','7:733612d3791ca9749b232d8f2762acac','addForeignKeyConstraint baseTableName=LoanAct, constraintName=FK_n24pcn7qawqpqsrnqk5blmoyp, referencedTableName=People','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-721','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:06',721,'EXECUTED','7:4d93b5961c3fe8bafd6b5de6bbce63cd','addForeignKeyConstraint baseTableName=Fragments, constraintName=FK_n4b3g85fdqd5j407l6n3pmy3b, referencedTableName=SeqBatchs','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-722','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:06',722,'EXECUTED','7:052026e2d3f495fc5650a647dc079941','addForeignKeyConstraint baseTableName=SeqBatchs, constraintName=FK_n5tu2s6wqeql3yi5nfnj0g2mb, referencedTableName=Regions','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-723','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:06',723,'EXECUTED','7:7a71a47ba3c9c9f252aa689e977e65e8','addForeignKeyConstraint baseTableName=Products_AUD, constraintName=FK_n7jjay7ughu5qrc2sbuots3sk, referencedTableName=Revision','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-724','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:06',724,'EXECUTED','7:9fceb45599c8671a4ffc472cdab2f73c','addForeignKeyConstraint baseTableName=Identifications, constraintName=FK_nabkyxwrsp4lhr4uihk8idcru, referencedTableName=Specimens','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-725','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:06',725,'EXECUTED','7:9c55db6784679851ed5d355771285eac','addForeignKeyConstraint baseTableName=Samples, constraintName=FK_nf0fq2j176ync5qmfirg3fker, referencedTableName=MixedSpecimens','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-726','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:06',726,'EXECUTED','7:6ae46ac684d00b43be4877da7e33cdf2','addForeignKeyConstraint baseTableName=Fragments, constraintName=FK_nfv5dwm6h44wnc721jf51uigy, referencedTableName=Regions','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-727','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:07',727,'EXECUTED','7:e4e7d8dd0ee51cbe36d9653d42f97151','addForeignKeyConstraint baseTableName=ProviderChains, constraintName=FK_nil4cfpn0c7m8slqnk4owktsg, referencedTableName=People','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-728','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:07',728,'EXECUTED','7:892e303e271c9191856263031b40e77a','addForeignKeyConstraint baseTableName=PcrReactions, constraintName=FK_nk19pirk3oy63udfhcjhg7m29, referencedTableName=Regions','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-729','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:07',729,'EXECUTED','7:40d2f295d84b412c3974175be6fef4e7','addForeignKeyConstraint baseTableName=Samples_AUD, constraintName=FK_nokubna3i7h503rat5xynpm84, referencedTableName=Revision','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-730','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:07',730,'EXECUTED','7:06aa93262a0b5989a45069b976c11dad','addForeignKeyConstraint baseTableName=Taxa, constraintName=FK_nvdn4ircr41s61ctno51viekd, referencedTableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-731','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:07',731,'EXECUTED','7:b0e819a8ab67cdf3ba8ba9e93b1b6440','addForeignKeyConstraint baseTableName=Hybridizations, constraintName=FK_nyf42lnk7bl6lvvutnqm8u4vy, referencedTableName=ArrayTypes','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-732','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:07',732,'EXECUTED','7:7a3bd33eff6b59cb2d72eeb4e5931ab7','addForeignKeyConstraint baseTableName=AccountsGroups, constraintName=FK_o3k28i5e35d32g1i4o6sbo35m, referencedTableName=Groups','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-733','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:07',733,'EXECUTED','7:5197dd74153a6f8f862be04339b9c833','addForeignKeyConstraint baseTableName=TagMixedSpecimen, constraintName=FK_occi02fr0coj9twv04gnbmi94, referencedTableName=ProjectTags','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-734','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:07',734,'EXECUTED','7:f7b4d5ffc503c546b74e39c2c74ae8ad','addForeignKeyConstraint baseTableName=SeqSubmissions, constraintName=FK_ocii5r25l17vhxo09v7i8yev7, referencedTableName=SeqBatchs','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-735','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:07',735,'EXECUTED','7:68fd520031183522d12be74c66c4b6d0','addForeignKeyConstraint baseTableName=BiologicalCollections_AUD, constraintName=FK_odo8t97tysglk8nho27ejg69d, referencedTableName=Revision','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-736','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:07',736,'EXECUTED','7:af4dd4cac74339c3238b61b3505fe1e9','addForeignKeyConstraint baseTableName=SeqProjectsSequences, constraintName=FK_ohpl1sdb8hm46b8l9g34sd0cf, referencedTableName=Sequences','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-737','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:08',737,'EXECUTED','7:7da88033a5ad7c0840f11e1d77eaf661','addForeignKeyConstraint baseTableName=SeqSources, constraintName=FK_ojv4mufjy28wjte762tthjlsa, referencedTableName=PcrPrimers','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-738','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:08',738,'EXECUTED','7:6669672b4758bb548ca01fc6520d082e','addForeignKeyConstraint baseTableName=LoanForm, constraintName=FK_ok08fa4vh19nl7hqardtce2vh, referencedTableName=People','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-739','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:08',739,'EXECUTED','7:294ddd7133b7f0c6ad85ecfd3c7a16a1','addForeignKeyConstraint baseTableName=AccountUsage, constraintName=FK_opbodkrj8ctv9tyjol5g5xwwu, referencedTableName=Accounts','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-740','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:08',740,'EXECUTED','7:cc92d1c11e70e0bfe3c451e7d7034512','addForeignKeyConstraint baseTableName=SeqReactions, constraintName=FK_orsl48c73rikurwvh0bw0asnn, referencedTableName=PcrReactions','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-741','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:08',741,'EXECUTED','7:761c61488202ee926d11bab6c7eaeecb','addForeignKeyConstraint baseTableName=Taxa, constraintName=FK_osm6gva5bo26w7obj7sl0k5f3, referencedTableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-742','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:08',742,'EXECUTED','7:195ab2c6ef214311f69b7aef62ce72b6','addForeignKeyConstraint baseTableName=Locations, constraintName=FK_owenubne8jbacxg0mwdliutp5, referencedTableName=PcrPrimers','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-743','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:08',743,'EXECUTED','7:08a753bc696a996fa1b8312bde0f3e75','addForeignKeyConstraint baseTableName=Samples, constraintName=FK_oydcu32elckh89l3sqk5sidbk, referencedTableName=Groups','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-744','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:08',744,'EXECUTED','7:87025c9faf48ca7a416d5703abdac215','addForeignKeyConstraint baseTableName=Locations, constraintName=FK_p2if06fynkj3xjn86klpe2rhq, referencedTableName=SpecimenReplicates','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-745','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:09',745,'EXECUTED','7:429d6a8a35ac1fa49f197811f9e53525','addForeignKeyConstraint baseTableName=Taxonomys_AUD, constraintName=FK_p8kjq5lejdkrrh9fb1y8kboxo, referencedTableName=Revision','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-746','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:09',746,'EXECUTED','7:f9f6e990ce54d3f7890e555f9fdab57d','addForeignKeyConstraint baseTableName=FeatureLocations_AUD, constraintName=FK_p9o0sc50cparbgwdhviasv27e, referencedTableName=Revision','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-747','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:09',747,'EXECUTED','7:bfd3724e0d89b4d37d4a5687cba4235c','addForeignKeyConstraint baseTableName=SpecimenReplicates_AUD, constraintName=FK_pank91epn0f86n0n5wk1x410v, referencedTableName=Revision','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-748','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:09',748,'EXECUTED','7:dc4c9da98389476c1109f026cb6c75f6','addForeignKeyConstraint baseTableName=Locations, constraintName=FK_pgeq6y89t7machd9auk56xfxv, referencedTableName=Samples','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-749','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:09',749,'EXECUTED','7:055961744bd62fbf6ed77a713db982f2','addForeignKeyConstraint baseTableName=ProjectTags, constraintName=FK_phqvhw9un9ed5rsp6nysmu151, referencedTableName=Groups','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-750','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:09',750,'EXECUTED','7:69745a16da2c0c1097f43e84b7bf9d82','addForeignKeyConstraint baseTableName=Sequences, constraintName=FK_plfcpl8v5sp8kkvt6pb0fvrha, referencedTableName=PcrPrimers','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-751','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:09',751,'EXECUTED','7:66241fbaf4c1dfd3bf48d6454d76cdf5','addForeignKeyConstraint baseTableName=SpecimenReplicates, constraintName=FK_pm69olc1lwa2gvrw78vduhusl, referencedTableName=SpecimenReplicates','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-752','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:09',752,'EXECUTED','7:f84ddf9333f52ec9d0c2af0a74fc1132','addForeignKeyConstraint baseTableName=Spots, constraintName=FK_pmnlt8vntd8p1c8gprjyib8as, referencedTableName=Clones','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-753','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:09',753,'EXECUTED','7:abbce54aa8da67d393cc683437d93261','addForeignKeyConstraint baseTableName=TaskArguments, constraintName=FK_podnyp77yrdamkchlpeslqla9, referencedTableName=Tasks','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-754','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:09',754,'EXECUTED','7:912fea7bf3251dd28bfdba26ba3b3361','addForeignKeyConstraint baseTableName=Specimens, constraintName=FK_pqbwa1ysc7so8uh8y3bruvfkj, referencedTableName=Hosts','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-755','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:09',755,'EXECUTED','7:87232ce4df38cd9157eec3c7e48433cb','addForeignKeyConstraint baseTableName=Specimens, constraintName=FK_q0hkqo8y5053o592ghgx06rb9, referencedTableName=CollectionInfos','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-756','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:10',756,'EXECUTED','7:319e5e2437fe972ec3903d20568f34c5','addForeignKeyConstraint baseTableName=AccountProfilePrinters, constraintName=FK_q48k8qlwetvmy5anf4yo9l8go, referencedTableName=AccountProfiles','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-757','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:10',757,'EXECUTED','7:6d58df5f66da05a3abba150af09ce2ef','addForeignKeyConstraint baseTableName=Identifications_AUD, constraintName=FK_q9hx6uro42m6jguo0ubywc73b, referencedTableName=Revision','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-758','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:10',758,'EXECUTED','7:1b0bdb311b0f06610d3ea8e569564f62','addForeignKeyConstraint baseTableName=SampleAttach, constraintName=FK_qb9ji50w6mbt5tgj801fn2yd0, referencedTableName=Samples','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-759','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:10',759,'EXECUTED','7:e6f1d846220c7c817ce8f7daab324bd6','addForeignKeyConstraint baseTableName=Taxa, constraintName=FK_qblg3frh0iswo7u3w6faghpr, referencedTableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-760','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:10',760,'EXECUTED','7:6a6453c52fcfc61f132fe0eb98122f95','addForeignKeyConstraint baseTableName=Specimens, constraintName=FK_qfj9ewnq35gytcvg9iqxvri7j, referencedTableName=Identifications','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-761','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:10',761,'EXECUTED','7:e1444e6c426a3726745554798af3a713','addForeignKeyConstraint baseTableName=SeqSources, constraintName=FK_qi2p2jj9tvuiyxgns6e7s7s7p, referencedTableName=ClusterCons','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-762','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:10',762,'EXECUTED','7:2d8dbe6d1d69427b10b5345212c8ec3d','addForeignKeyConstraint baseTableName=SeqSources, constraintName=FK_qjhdmqlauh995txjxbyqlvt0p, referencedTableName=Identifications','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-763','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:10',763,'EXECUTED','7:4a6d85ec91f3b52f66b34cb008ba96c4','addForeignKeyConstraint baseTableName=Features, constraintName=FK_qps6ai7tcwe35281n22f5qgac, referencedTableName=Regions','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-764','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:11',764,'EXECUTED','7:36aee7181c868ad3d6ff839311857f35','addForeignKeyConstraint baseTableName=Containers, constraintName=FK_qrjwbqax7ro6uos8jllr4noyi, referencedTableName=Storages','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-765','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:11',765,'EXECUTED','7:11ddc6e0c701b9b300b83747bfc0ca0f','addForeignKeyConstraint baseTableName=PcrBatchs, constraintName=FK_qsywx3kn4haf7fb0fal1ko4sd, referencedTableName=PcrPrimers','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-766','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:11',766,'EXECUTED','7:9c4931ef071ebc86bec71de6958c81cb','addForeignKeyConstraint baseTableName=BiologicalCollections, constraintName=FK_qtmk2q6w736xfc24hj9xbp4bw, referencedTableName=Addresses','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-767','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:11',767,'EXECUTED','7:1db5c751f907a35856ec9d28373a4b7e','addForeignKeyConstraint baseTableName=SpecimenReplicates, constraintName=FK_r2lpq0l0tylb3ee4xdjgi1ue7, referencedTableName=Groups','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-768','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:11',768,'EXECUTED','7:924d5139fac59c093335d3803fcd3426','addForeignKeyConstraint baseTableName=Events, constraintName=FK_r6bjqv7jmvqu5j2kbf017wvwv, referencedTableName=Tasks','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-769','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:11',769,'EXECUTED','7:82d8528c695b70b40f9599f5d8f581b1','addForeignKeyConstraint baseTableName=SeqReactions, constraintName=FK_rjc8t80j6yf06x4spmlq53mmi, referencedTableName=SeqBatchs','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-770','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:11',770,'EXECUTED','7:0c1459b0ff87db02b80fe2f124b35d7e','addForeignKeyConstraint baseTableName=Genotypes, constraintName=FK_rn5embtsuc9p9bbs027gun5px, referencedTableName=PcrReactions','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-771','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:11',771,'EXECUTED','7:66d02facfbb874c6805810864c3abec1','addForeignKeyConstraint baseTableName=Genotypes, constraintName=FK_rpbwh1f9k66r13ma96vy1wmvq, referencedTableName=Groups','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-772','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:11',772,'EXECUTED','7:e42a63a9cefffe1d6c090b52e85bd37e','addForeignKeyConstraint baseTableName=Projects, constraintName=FK_rsyctg2p1bxfnhguxpr3xrm47, referencedTableName=Groups','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-773','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:11',773,'EXECUTED','7:a9a75289724de99442d113dbd788760c','addForeignKeyConstraint baseTableName=CollectionInfos, constraintName=FK_s238mngbvqv10t8lwkgqb81xc, referencedTableName=Protocols','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-774','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:12',774,'EXECUTED','7:3f231e332c527ce02b8084a520f05bfe','addForeignKeyConstraint baseTableName=PcrReactions, constraintName=FK_s2joblkkv71yib8kce8uxvlt7, referencedTableName=PcrBatchs','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-775','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:12',775,'EXECUTED','7:fef24baf31eb715fb819590e1544b09c','addForeignKeyConstraint baseTableName=SpreadSheetColumns, constraintName=FK_s7391xm6gpdaivq4k87wt2g8h, referencedTableName=SeqSubmissionConfigs','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-776','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:12',776,'EXECUTED','7:c740ec0e651ac45f33cbbede19cdc128','addForeignKeyConstraint baseTableName=Identifications, constraintName=FK_sdfpg9um9vmjk132spagwfp3q, referencedTableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-777','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:12',777,'EXECUTED','7:b9a06def5b6462c62e9aae3684d7f0dc','addForeignKeyConstraint baseTableName=Containers, constraintName=FK_sii753dw6tfwj8lc4iokho2q, referencedTableName=ContainerTypes','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-778','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:12',778,'EXECUTED','7:07c2a1de71498904b89e784b7da24599','addForeignKeyConstraint baseTableName=SeqBatchs, constraintName=FK_sirj0wrt2yk94lvw1mrlw2qc4, referencedTableName=PcrProfiles','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-779','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:12',779,'EXECUTED','7:86e03c80c7a1535fb11f96caca349d1d','addForeignKeyConstraint baseTableName=Provinces, constraintName=FK_sj0ixihlctmheexvesghvvhbh, referencedTableName=Countries','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-780','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:12',780,'EXECUTED','7:597616e568769836a4af21ee512f871e','addForeignKeyConstraint baseTableName=Addresses, constraintName=FK_sn9a64qvbnm650bmmfj23v3p9, referencedTableName=Countries','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-781','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:12',781,'EXECUTED','7:392eb41a041e8bc58367bb37fad80f46','addForeignKeyConstraint baseTableName=Taxa, constraintName=FK_sq1n8okqvy44oofqqvkhxqf13, referencedTableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-782','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:12',782,'EXECUTED','7:66e7e9fd574cd1654904319807a06c28','addForeignKeyConstraint baseTableName=Alleles_AUD, constraintName=FK_suc9oypbv4aigggkmbc16q14f, referencedTableName=Revision','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-783','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:12',783,'EXECUTED','7:4c315f47be4bd976d8a60823a4ffd799','addForeignKeyConstraint baseTableName=ProtocolAttach, constraintName=FK_susn9fe31sdoambvi1nlx436n, referencedTableName=Protocols','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-784','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:13',784,'EXECUTED','7:936ccde687183e9ca7763078fed982f2','addForeignKeyConstraint baseTableName=ClusterProjects, constraintName=FK_svifa8l2op31413apv1d2unq4, referencedTableName=Projects','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-785','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:13',785,'EXECUTED','7:cfd3bacf9c9699aa29866c062f61d424','addForeignKeyConstraint baseTableName=Locations, constraintName=FK_swn4iqbmyw7uoe1m7hq6fnyst, referencedTableName=Sequences','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-786','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:13',786,'EXECUTED','7:b82f236f2336d401289f1c87bc3ad8d9','addForeignKeyConstraint baseTableName=TagFragment, constraintName=FK_swtwrw5un870fjrefj2xtbnp4, referencedTableName=Fragments','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-787','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:13',787,'EXECUTED','7:410028034df41b76d4099dd127addf59','addForeignKeyConstraint baseTableName=ProviderChains_AUD, constraintName=FK_syge507bmxa59tfo3sun3s8le, referencedTableName=Revision','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-788','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:13',788,'EXECUTED','7:52645bd88792dc531889ac8a9f93f841','addForeignKeyConstraint baseTableName=SeqBatchs_AUD, constraintName=FK_t2eqlq7cjhc7a8jp5ulrypmgc, referencedTableName=Revision','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-789','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:13',789,'EXECUTED','7:951cc323c3985cd823d072f2c5a55e2b','addForeignKeyConstraint baseTableName=PeopleAddresses, constraintName=FK_t2mrruiddat2byt9i5coq185o, referencedTableName=Addresses','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-790','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:13',790,'EXECUTED','7:94b7fd2866ff4ae65ca527e98d0eaf14','addForeignKeyConstraint baseTableName=Locations, constraintName=FK_t6cd9ar6svjw54k8x9hk5rfoa, referencedTableName=Clones','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-791','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:13',791,'EXECUTED','7:1511cad3514554b0472497b8659c7938','addForeignKeyConstraint baseTableName=BlastHits, constraintName=FK_teecm7ke2c04iprfxcfds7ump, referencedTableName=BlastResults','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-792','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:13',792,'EXECUTED','7:a9dfe95c6f96dbe526645f174fe60a39','addForeignKeyConstraint baseTableName=FeatureLocations, constraintName=FK_thvqsq3ko7r52yfedudeab4vr, referencedTableName=Features','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-793','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:13',793,'EXECUTED','7:c61fc781e459c3ecd447f97e385faba1','addForeignKeyConstraint baseTableName=ProjectsProject, constraintName=FK_tjbd851lfl437pmvjt76rbc57, referencedTableName=Projects','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-794','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:13',794,'EXECUTED','7:6c52713630164b7fd28ca6f7ecac2567','addForeignKeyConstraint baseTableName=PcrBatchs, constraintName=FK_tkxk7kxmhav5jejmldunlthm2, referencedTableName=Protocols','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-795','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:13',795,'EXECUTED','7:0bafba388d5564d5f16b519dd869823e','addForeignKeyConstraint baseTableName=Annotations, constraintName=FK_trgcxt8qjd6e6jwrkfgpf7t63, referencedTableName=Sequences','',NULL,'3.5.4',NULL,NULL,'1798441437'),('1534191846802-796','mat (generated)','db/changelog/db.changelog-init.xml','2019-03-05 16:08:14',796,'EXECUTED','7:30f08b7a23f184741bebc318d850c755','addForeignKeyConstraint baseTableName=Clones, constraintName=FK_xh4m3hf4s2jrh7b9k6hcfuu7, referencedTableName=Vectors','',NULL,'3.5.4',NULL,NULL,'1798441437'),('Support_13739-insert-initial-data','poffm','db/changelog/migrations/db.changelog-Support_13739_Enable_liquibase_for_seqdb.xml','2019-03-05 16:08:14',797,'EXECUTED','7:1cee0e4c1609effab23548cee4f193d3','insert tableName=BarcodeableMaps; insert tableName=BarcodeableMaps; insert tableName=BarcodeableMaps; insert tableName=BarcodeableMaps; insert tableName=BarcodeableMaps; insert tableName=BarcodeableMaps; insert tableName=BarcodeableMaps; insert ta...','',NULL,'3.5.4',NULL,NULL,'1798441437'),('Feature_8532_Track_pooled_PCR_primers','poffm','db/changelog/migrations/db.changelog-Feature_8532_Track_pooled_PCR_primers.xml','2019-03-05 16:08:14',798,'EXECUTED','7:ebab59f77f180a54f28c2ffb32b605ae','addColumn tableName=PcrPrimers; addForeignKeyConstraint baseTableName=PcrPrimers, constraintName=FK_gkgdsum1o21h1sdtib9nwecd5, referencedTableName=PcrPrimers; addColumn tableName=PcrPrimers_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('Bug_12458_Proxy_Error_When_Linking_Taxonomic_Records','poffm','db/changelog/migrations/db.changelog-Bug_12458_Proxy_Error_When_Linking_Taxonomic_Records.xml','2019-03-05 16:08:14',799,'EXECUTED','7:338c2e20068a219cb9ee6b1cd2b2b822','addColumn tableName=BiologicalCollections; addColumn tableName=BiologicalCollections_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('Feature_10972_Add_Growth_Media_to_Sample_table','elkayssin','db/changelog/migrations/db.changelog-Feature_10972_Add_Growth_Media_to_Sample_table.xml','2019-03-05 16:08:14',800,'EXECUTED','7:bc97acc526e2b6f3ac62f46856b53446','addColumn tableName=Samples; addColumn tableName=Samples_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('Support_13844_Remove_Vector_Clone_and _Spot_classes_Drop_Locations_CloneID_Option1','zhous','db/changelog/migrations/db.changelog-Support_13844_Remove_Vector_Clone_and_Spot_classes.xml','2019-03-05 16:08:15',801,'EXECUTED','7:6b83d249b89987598b96e3d8450d2701','dropForeignKeyConstraint baseTableName=Locations, constraintName=FK_t6cd9ar6svjw54k8x9hk5rfoa; dropColumn columnName=CloneID, tableName=Locations','',NULL,'3.5.4',NULL,NULL,'1798441437'),('Support_13844_Remove_Vector_Clone_and _Spot_classes_Drop_Location_CloneID_Option2','zhous','db/changelog/migrations/db.changelog-Support_13844_Remove_Vector_Clone_and_Spot_classes.xml','2019-03-05 16:08:15',802,'MARK_RAN','7:c63264ef328b965a5586b627c07a922c','dropForeignKeyConstraint baseTableName=Locations, constraintName=FK3016773E78D39268; dropColumn columnName=CloneID, tableName=Locations','',NULL,'3.5.4',NULL,NULL,'1798441437'),('Support_13844_Remove_Vector_Clone_and _Spot_classes_Drop_Sequences_CloneID_Option1','zhous','db/changelog/migrations/db.changelog-Support_13844_Remove_Vector_Clone_and_Spot_classes.xml','2019-03-05 16:08:15',803,'EXECUTED','7:37bdd7a17d1a78082d237384ae33a017','dropForeignKeyConstraint baseTableName=Sequences, constraintName=FK_3u8ticbp842dnauunqgwcwyqd; dropColumn columnName=CloneID, tableName=Sequences','',NULL,'3.5.4',NULL,NULL,'1798441437'),('Support_13844_Remove_Vector_Clone_and _Spot_classes_Drop_Sequences_CloneID_Option2','zhous','db/changelog/migrations/db.changelog-Support_13844_Remove_Vector_Clone_and_Spot_classes.xml','2019-03-05 16:08:15',804,'MARK_RAN','7:b9ce3364bfb29efcd8f3c247c61b7a35','dropForeignKeyConstraint baseTableName=Sequences, constraintName=FK3510A0B278D39268; dropColumn columnName=CloneID, tableName=Sequences','',NULL,'3.5.4',NULL,NULL,'1798441437'),('Support_13844_Remove_Vector_Clone_and _Spot_classes_Drop_Sequences_VectorID_Option1','zhous','db/changelog/migrations/db.changelog-Support_13844_Remove_Vector_Clone_and_Spot_classes.xml','2019-03-05 16:08:16',805,'EXECUTED','7:48a9ae582e50bdc89963154dbe0d90f7','dropForeignKeyConstraint baseTableName=Sequences, constraintName=FK_34xfk4n49v3rpj0tucmnbm02i; dropColumn columnName=VectorID, tableName=Sequences','',NULL,'3.5.4',NULL,NULL,'1798441437'),('Support_13844_Remove_Vector_Clone_and _Spot_classes_Drop_Sequences_VectorID_Option2','zhous','db/changelog/migrations/db.changelog-Support_13844_Remove_Vector_Clone_and_Spot_classes.xml','2019-03-05 16:08:16',806,'MARK_RAN','7:e8e488d20ca887e24c38328d4e493bd4','dropForeignKeyConstraint baseTableName=Sequences, constraintName=FK3510A0B2F0EC976E; dropColumn columnName=VectorID, tableName=Sequences','',NULL,'3.5.4',NULL,NULL,'1798441437'),('Support_13844_Remove_Vector_Clone_and _Spot_classes_Drop_Spots_CloneID_Option1','zhous','db/changelog/migrations/db.changelog-Support_13844_Remove_Vector_Clone_and_Spot_classes.xml','2019-03-05 16:08:16',807,'EXECUTED','7:a7a762be3b9b70968f0a1b02d3ff34bf','dropForeignKeyConstraint baseTableName=Spots, constraintName=FK_pmnlt8vntd8p1c8gprjyib8as','',NULL,'3.5.4',NULL,NULL,'1798441437'),('Support_13844_Remove_Vector_Clone_and _Spot_classes-Spots_CloneID_Option2','zhous','db/changelog/migrations/db.changelog-Support_13844_Remove_Vector_Clone_and_Spot_classes.xml','2019-03-05 16:08:16',808,'MARK_RAN','7:86dfc4dd30f2159149ee08a4d6fc4e4a','dropForeignKeyConstraint baseTableName=Spots, constraintName=FK4C6379178D39268','',NULL,'3.5.4',NULL,NULL,'1798441437'),('Support_13844_Remove_Vector_Clone_and _Spot_classes-Annotations-Spot_Option1','zhous','db/changelog/migrations/db.changelog-Support_13844_Remove_Vector_Clone_and_Spot_classes.xml','2019-03-05 16:08:16',809,'EXECUTED','7:fc11a40e19158e8cad632768ea3678c1','dropForeignKeyConstraint baseTableName=Annotations, constraintName=FK_793tgch4wtwhchwf0r7pd7bey; dropColumn columnName=SpotID, tableName=Annotations','',NULL,'3.5.4',NULL,NULL,'1798441437'),('Support_13844_Remove_Vector_Clone_and _Spot_classes-Annotations-Spot_Option2','zhous','db/changelog/migrations/db.changelog-Support_13844_Remove_Vector_Clone_and_Spot_classes.xml','2019-03-05 16:08:17',810,'MARK_RAN','7:083b3215076debb2791b9c1c1ab32015','dropForeignKeyConstraint baseTableName=Annotations, constraintName=FK2A1723045941926C; dropColumn columnName=SpotID, tableName=Annotations','',NULL,'3.5.4',NULL,NULL,'1798441437'),('Support_13844_Remove_Vector_Clone_and _Spot_classes_Drop_Tables_Clones,_Vectors and_Spots','zhous','db/changelog/migrations/db.changelog-Support_13844_Remove_Vector_Clone_and_Spot_classes.xml','2019-03-05 16:08:17',811,'EXECUTED','7:44bee9b5933967eddeeeb524aa95a78a','dropTable tableName=Clones; dropTable tableName=Vectors; dropTable tableName=Spots','',NULL,'3.5.4',NULL,NULL,'1798441437'),('Bug_14427_Thermocycler_Profile_Details_Application_field_too_many_characters','poffm','db/changelog/migrations/db.changelog-Bug_14427_Thermocycler_Profile_Details_Application_field_too_many_characters.xml','2019-03-05 16:08:17',812,'EXECUTED','7:6ec3b72be543b1ea966eb839b8106724','modifyDataType columnName=Application, tableName=PcrProfiles; modifyDataType columnName=Application, tableName=PcrProfiles_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('Support_14833_Remove_Annotation_Entities','ganx','db/changelog/migrations/db.changelog-Support_14833_Remove_Annotation_AnnotationType_AnnotationGroup_Entities.xml','2019-03-05 16:08:17',813,'EXECUTED','7:c61b958a6630d91da7999259b6d0be8b','dropTable tableName=Annotations; dropTable tableName=AnnotationGroups; dropTable tableName=AnnotationTypes','',NULL,'3.5.4',NULL,NULL,'1798441437'),('Support_14818_Discrepancies_between_Liquibase_script_and_PROD_db_schema_1','elkayssin','db/changelog/migrations/db.changelog-Support_14818_Discrepancies_between_Liquibase_script_and_PROD_db_schema.xml','2019-03-05 16:08:17',814,'EXECUTED','7:142f6b2f28c241791fc11eb5f5b11a3e','addColumn tableName=CollectionInfos; addColumn tableName=CollectionInfos; addColumn tableName=CollectionInfos_AUD; addColumn tableName=CollectionInfos_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('Support_14818_Discrepancies_between_Liquibase_script_and_PROD_db_schema_2','elkayssin','db/changelog/migrations/db.changelog-Support_14818_Discrepancies_between_Liquibase_script_and_PROD_db_schema.xml','2019-03-05 16:08:17',815,'EXECUTED','7:ed730f9dec4f61b8ef271f3212256956','addColumn tableName=ProjectTags_AUD; addColumn tableName=ProjectTags_AUD; addColumn tableName=ProjectTags_AUD; addColumn tableName=ProjectTags_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('Support_14818_Discrepancies_between_Liquibase_script_and_PROD_db_schema_2.5','elkayssin','db/changelog/migrations/db.changelog-Support_14818_Discrepancies_between_Liquibase_script_and_PROD_db_schema.xml','2019-03-05 16:08:17',816,'MARK_RAN','7:fbbe8a74b0d3462ca1729c747086a571','dropColumn columnName=TagType, tableName=ProjectTags_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('Support_14818_Discrepancies_between_Liquibase_script_and_PROD_db_schema_3','elkayssin','db/changelog/migrations/db.changelog-Support_14818_Discrepancies_between_Liquibase_script_and_PROD_db_schema.xml','2019-03-05 16:08:17',817,'EXECUTED','7:a923b610f5f8536c2a51695bf9a2611f','addColumn tableName=Regions_AUD; addColumn tableName=Regions_AUD; addColumn tableName=Regions_AUD; addColumn tableName=Regions_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('Support_14818_Discrepancies_between_Liquibase_script_and_PROD_db_schema_4','elkayssin','db/changelog/migrations/db.changelog-Support_14818_Discrepancies_between_Liquibase_script_and_PROD_db_schema.xml','2019-03-05 16:08:17',818,'MARK_RAN','7:dca3ff67c3cdd1ccfa8ddd56f0665562','dropColumn columnName=SpecimenID, tableName=Samples_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('Support_14818_Discrepancies_between_Liquibase_script_and_PROD_db_schema_4.5','elkayssin','db/changelog/migrations/db.changelog-Support_14818_Discrepancies_between_Liquibase_script_and_PROD_db_schema.xml','2019-03-05 16:08:17',819,'MARK_RAN','7:c96e595562c98e201311c38fc34b4c18','dropForeignKeyConstraint baseTableName=Samples, constraintName=FK_cs25lgdf3it0yx9ks1r8jb79n; dropColumn columnName=SpecimenID, tableName=Samples','',NULL,'3.5.4',NULL,NULL,'1798441437'),('Support_14818_Discrepancies_between_Liquibase_script_and_PROD_db_schema_5','elkayssin','db/changelog/migrations/db.changelog-Support_14818_Discrepancies_between_Liquibase_script_and_PROD_db_schema.xml','2019-03-05 16:08:18',820,'EXECUTED','7:db85511ef28f578d6ac467f40aa22827','addColumn tableName=SeqBatchs; addColumn tableName=SeqBatchs; addColumn tableName=SeqBatchs','',NULL,'3.5.4',NULL,NULL,'1798441437'),('Support_14818_Discrepancies_between_Liquibase_script_and_PROD_db_schema_6','elkayssin','db/changelog/migrations/db.changelog-Support_14818_Discrepancies_between_Liquibase_script_and_PROD_db_schema.xml','2019-03-05 16:08:18',821,'EXECUTED','7:e7b385f85410cc6303d82065ec90f13a','addColumn tableName=SeqSources; addColumn tableName=SeqSources_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('Support_14818_Discrepancies_between_Liquibase_script_and_PROD_db_schema_7','elkayssin','db/changelog/migrations/db.changelog-Support_14818_Discrepancies_between_Liquibase_script_and_PROD_db_schema.xml','2019-03-05 16:08:18',822,'EXECUTED','7:05d348219a5e8bc6dd5e3ee6a310e725','addColumn tableName=SeqSubmissions_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('Support_14818_Discrepancies_between_Liquibase_script_and_PROD_db_schema_8','elkayssin','db/changelog/migrations/db.changelog-Support_14818_Discrepancies_between_Liquibase_script_and_PROD_db_schema.xml','2019-03-05 16:08:18',823,'EXECUTED','7:b50473f04466d91eb219285268edd622','addColumn tableName=Sequences; addColumn tableName=Sequences_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('Support_14818_Discrepancies_between_Liquibase_script_and_PROD_db_schema_9','elkayssin','db/changelog/migrations/db.changelog-Support_14818_Discrepancies_between_Liquibase_script_and_PROD_db_schema.xml','2019-03-05 16:08:18',824,'EXECUTED','7:c33f638c9547e6993e960c850cde7d01','addColumn tableName=Taxa','',NULL,'3.5.4',NULL,NULL,'1798441437'),('Support_14818_Discrepancies_between_Liquibase_script_and_PROD_db_schema_10','elkayssin','db/changelog/migrations/db.changelog-Support_14818_Discrepancies_between_Liquibase_script_and_PROD_db_schema.xml','2019-03-05 16:08:18',825,'EXECUTED','7:23872e0106c9ce81000454bded12e221','renameColumn newColumnName=_End, oldColumnName=End, tableName=FeatureLocations; renameColumn newColumnName=_End, oldColumnName=End, tableName=FeatureLocations_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('Support_14818_Discrepancies_between_Liquibase_script_and_PROD_db_schema_11','elkayssin','db/changelog/migrations/db.changelog-Support_14818_Discrepancies_between_Liquibase_script_and_PROD_db_schema.xml','2019-03-05 16:08:18',826,'EXECUTED','7:2fa47635fa0dcbfdc2482b7b895acf68','modifyDataType columnName=Genus, tableName=Taxonomys; modifyDataType columnName=Genus, tableName=Taxonomys_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('Support_14818_Discrepancies_between_Liquibase_script_and_PROD_db_schema_12','elkayssin','db/changelog/migrations/db.changelog-Support_14818_Discrepancies_between_Liquibase_script_and_PROD_db_schema.xml','2019-03-05 16:08:19',827,'EXECUTED','7:b96739a2fe8adf7c9e9624bed1265300','modifyDataType columnName=Name, tableName=Regions; modifyDataType columnName=Name, tableName=Regions_AUD; modifyDataType columnName=Name, tableName=ProjectTags; modifyDataType columnName=Name, tableName=ProjectTags_AUD','',NULL,'3.5.4',NULL,NULL,'1798441437'),('Support_14818_Discrepancies_between_Liquibase_script_and_PROD_db_schema_13','elkayssin','db/changelog/migrations/db.changelog-Support_14818_Discrepancies_between_Liquibase_script_and_PROD_db_schema.xml','2019-03-05 16:08:19',828,'MARK_RAN','7:33485be8fd3b71d0f4bfa1988781cfe1','dropUniqueConstraint constraintName=regions_name_key, tableName=Regions','',NULL,'3.5.4',NULL,NULL,'1798441437'),('Support_14818_Discrepancies_between_Liquibase_script_and_PROD_db_schema_14','elkayssin','db/changelog/migrations/db.changelog-Support_14818_Discrepancies_between_Liquibase_script_and_PROD_db_schema.xml','2019-03-05 16:08:19',829,'MARK_RAN','7:a17e2e4eea6615f16b31005505db0ba9','dropUniqueConstraint constraintName=uk_fevk2xo6g0perb22rbxe79gmf, tableName=Products; addUniqueConstraint constraintName=product_unique_constraint, tableName=Products','',NULL,'3.5.4',NULL,NULL,'1798441437');
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1,'\0',NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Datasets`
--

DROP TABLE IF EXISTS `Datasets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Datasets` (
  `DatasetID` int(11) NOT NULL AUTO_INCREMENT,
  `DatasetType` varchar(20) NOT NULL,
  `Description` longtext,
  `Directory` varchar(255) DEFAULT NULL,
  `Filename` varchar(50) DEFAULT NULL,
  `FilterProgramFile` varchar(255) DEFAULT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `Name` varchar(50) NOT NULL,
  `Query` varchar(255) DEFAULT NULL,
  `URL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DatasetID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Datasets`
--

LOCK TABLES `Datasets` WRITE;
/*!40000 ALTER TABLE `Datasets` DISABLE KEYS */;
/*!40000 ALTER TABLE `Datasets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EmailAddrs`
--

DROP TABLE IF EXISTS `EmailAddrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EmailAddrs` (
  `EmailID` int(11) NOT NULL AUTO_INCREMENT,
  `EmailAddr` varchar(60) NOT NULL,
  `EmailType` varchar(20) NOT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `PrimaryEmail` bit(1) NOT NULL,
  `PeopleID` int(11) DEFAULT NULL,
  PRIMARY KEY (`EmailID`),
  KEY `FK_lwuk6hh8xifok37n2yry6owi2` (`PeopleID`),
  CONSTRAINT `FK_lwuk6hh8xifok37n2yry6owi2` FOREIGN KEY (`PeopleID`) REFERENCES `People` (`PeopleID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmailAddrs`
--

LOCK TABLES `EmailAddrs` WRITE;
/*!40000 ALTER TABLE `EmailAddrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `EmailAddrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Events`
--

DROP TABLE IF EXISTS `Events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Events` (
  `EventID` int(11) NOT NULL AUTO_INCREMENT,
  `argument` varchar(255) DEFAULT NULL,
  `Entity` varchar(255) NOT NULL,
  `Filter` varchar(255) DEFAULT NULL,
  `Operation` varchar(255) NOT NULL,
  `TaskID` int(11) NOT NULL,
  PRIMARY KEY (`EventID`),
  KEY `FK_r6bjqv7jmvqu5j2kbf017wvwv` (`TaskID`),
  CONSTRAINT `FK_r6bjqv7jmvqu5j2kbf017wvwv` FOREIGN KEY (`TaskID`) REFERENCES `Tasks` (`TaskID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Events`
--

LOCK TABLES `Events` WRITE;
/*!40000 ALTER TABLE `Events` DISABLE KEYS */;
/*!40000 ALTER TABLE `Events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FeatureLocations`
--

DROP TABLE IF EXISTS `FeatureLocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FeatureLocations` (
  `FeatureLocationID` int(11) NOT NULL AUTO_INCREMENT,
  `_End` int(11) DEFAULT NULL,
  `FeatureSequence` longtext,
  `Frame` int(11) NOT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `Start` int(11) NOT NULL,
  `Strand` int(11) NOT NULL,
  `FeatureID` int(11) DEFAULT NULL,
  PRIMARY KEY (`FeatureLocationID`),
  KEY `FK_thvqsq3ko7r52yfedudeab4vr` (`FeatureID`),
  CONSTRAINT `FK_thvqsq3ko7r52yfedudeab4vr` FOREIGN KEY (`FeatureID`) REFERENCES `Features` (`FeatureID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FeatureLocations`
--

LOCK TABLES `FeatureLocations` WRITE;
/*!40000 ALTER TABLE `FeatureLocations` DISABLE KEYS */;
/*!40000 ALTER TABLE `FeatureLocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FeatureLocations_AUD`
--

DROP TABLE IF EXISTS `FeatureLocations_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FeatureLocations_AUD` (
  `FeatureLocationID` int(11) NOT NULL,
  `REV` int(11) NOT NULL,
  `REVTYPE` tinyint(3) DEFAULT NULL,
  `_End` int(11) DEFAULT NULL,
  `FeatureSequence` longtext,
  `Frame` int(11) DEFAULT NULL,
  `Start` int(11) DEFAULT NULL,
  `Strand` int(11) DEFAULT NULL,
  `FeatureID` int(11) DEFAULT NULL,
  PRIMARY KEY (`FeatureLocationID`,`REV`),
  KEY `FK_p9o0sc50cparbgwdhviasv27e` (`REV`),
  CONSTRAINT `FK_p9o0sc50cparbgwdhviasv27e` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FeatureLocations_AUD`
--

LOCK TABLES `FeatureLocations_AUD` WRITE;
/*!40000 ALTER TABLE `FeatureLocations_AUD` DISABLE KEYS */;
/*!40000 ALTER TABLE `FeatureLocations_AUD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Features`
--

DROP TABLE IF EXISTS `Features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Features` (
  `FeatureID` int(11) NOT NULL AUTO_INCREMENT,
  `DateCreated` datetime(6) NOT NULL,
  `Description` longtext,
  `FeatureDefault` bit(1) NOT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `Name` varchar(255) NOT NULL,
  `Link2FeatureID` int(11) DEFAULT NULL,
  `RegionID` int(11) DEFAULT NULL,
  `SequenceID` int(11) DEFAULT NULL,
  PRIMARY KEY (`FeatureID`),
  KEY `FK_b4jkqt4yxxuuwre2sum1lys12` (`Link2FeatureID`),
  KEY `FK_c4u5jdc3fu4776plhw40lwqh9` (`SequenceID`),
  KEY `FK_qps6ai7tcwe35281n22f5qgac` (`RegionID`),
  CONSTRAINT `FK_b4jkqt4yxxuuwre2sum1lys12` FOREIGN KEY (`Link2FeatureID`) REFERENCES `Features` (`FeatureID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_c4u5jdc3fu4776plhw40lwqh9` FOREIGN KEY (`SequenceID`) REFERENCES `Sequences` (`SequenceID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_qps6ai7tcwe35281n22f5qgac` FOREIGN KEY (`RegionID`) REFERENCES `Regions` (`TagID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Features`
--

LOCK TABLES `Features` WRITE;
/*!40000 ALTER TABLE `Features` DISABLE KEYS */;
/*!40000 ALTER TABLE `Features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Features_AUD`
--

DROP TABLE IF EXISTS `Features_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Features_AUD` (
  `FeatureID` int(11) NOT NULL,
  `REV` int(11) NOT NULL,
  `REVTYPE` tinyint(3) DEFAULT NULL,
  `DateCreated` datetime(6) DEFAULT NULL,
  `Description` longtext,
  `FeatureDefault` bit(1) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Link2FeatureID` int(11) DEFAULT NULL,
  `RegionID` int(11) DEFAULT NULL,
  `SequenceID` int(11) DEFAULT NULL,
  PRIMARY KEY (`FeatureID`,`REV`),
  KEY `FK_i5819kpc7x3sxes3meew98m7n` (`REV`),
  CONSTRAINT `FK_i5819kpc7x3sxes3meew98m7n` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Features_AUD`
--

LOCK TABLES `Features_AUD` WRITE;
/*!40000 ALTER TABLE `Features_AUD` DISABLE KEYS */;
/*!40000 ALTER TABLE `Features_AUD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FileSystemWatcherEntry`
--

DROP TABLE IF EXISTS `FileSystemWatcherEntry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FileSystemWatcherEntry` (
  `FileSystemWatcherEntryID` int(11) NOT NULL AUTO_INCREMENT,
  `AutoLink` bit(1) NOT NULL,
  `AutoLinkingRegex` varchar(255) DEFAULT NULL,
  `EntityType` varchar(255) NOT NULL,
  `FieldToLink` varchar(255) DEFAULT NULL,
  `FileNameFilter` varchar(255) DEFAULT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `Path` varchar(255) NOT NULL,
  `Recursive` bit(1) NOT NULL,
  PRIMARY KEY (`FileSystemWatcherEntryID`),
  UNIQUE KEY `Path` (`Path`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FileSystemWatcherEntry`
--

LOCK TABLES `FileSystemWatcherEntry` WRITE;
/*!40000 ALTER TABLE `FileSystemWatcherEntry` DISABLE KEYS */;
/*!40000 ALTER TABLE `FileSystemWatcherEntry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fragments`
--

DROP TABLE IF EXISTS `Fragments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Fragments` (
  `FragmentID` int(11) NOT NULL AUTO_INCREMENT,
  `CreationDate` datetime(6) DEFAULT NULL,
  `FileDir` varchar(255) DEFAULT NULL,
  `FileName` varchar(255) DEFAULT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `Name` varchar(255) NOT NULL,
  `Note` varchar(1024) DEFAULT NULL,
  `Result` varchar(50) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  `PcrBatchID` int(11) DEFAULT NULL,
  `PcrReactionID` int(11) DEFAULT NULL,
  `RegionID` int(11) DEFAULT NULL,
  `SampleID` int(11) DEFAULT NULL,
  `SeqBatchID` int(11) DEFAULT NULL,
  `SeqReactionID` int(11) DEFAULT NULL,
  `SpecimenID` int(11) DEFAULT NULL,
  PRIMARY KEY (`FragmentID`),
  KEY `FK_690ir8h4t5713e5g8bpjxuqbv` (`GroupID`),
  KEY `FK_7kanmm9rrhdfnmdx641s6f68j` (`SpecimenID`),
  KEY `FK_btqnax4uj78wdq9hc58g2s3ey` (`PcrBatchID`),
  KEY `FK_gcnjlac5jn8tln0ug2qkftf9b` (`SeqReactionID`),
  KEY `FK_is4e1n5v2h6ynpek902c5h7bu` (`PcrReactionID`),
  KEY `FK_jsofbufrsm6m5h8qisfhkv9or` (`SampleID`),
  KEY `FK_n4b3g85fdqd5j407l6n3pmy3b` (`SeqBatchID`),
  KEY `FK_nfv5dwm6h44wnc721jf51uigy` (`RegionID`),
  KEY `fragment_name_idx` (`Name`),
  CONSTRAINT `FK_690ir8h4t5713e5g8bpjxuqbv` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_7kanmm9rrhdfnmdx641s6f68j` FOREIGN KEY (`SpecimenID`) REFERENCES `Specimens` (`SpecimenID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_btqnax4uj78wdq9hc58g2s3ey` FOREIGN KEY (`PcrBatchID`) REFERENCES `PcrBatchs` (`PCRBatchID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_gcnjlac5jn8tln0ug2qkftf9b` FOREIGN KEY (`SeqReactionID`) REFERENCES `SeqReactions` (`SeqReactionID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_is4e1n5v2h6ynpek902c5h7bu` FOREIGN KEY (`PcrReactionID`) REFERENCES `PcrReactions` (`PcrReactionID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_jsofbufrsm6m5h8qisfhkv9or` FOREIGN KEY (`SampleID`) REFERENCES `Samples` (`SampleID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_n4b3g85fdqd5j407l6n3pmy3b` FOREIGN KEY (`SeqBatchID`) REFERENCES `SeqBatchs` (`SeqBatchID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_nfv5dwm6h44wnc721jf51uigy` FOREIGN KEY (`RegionID`) REFERENCES `Regions` (`TagID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fragments`
--

LOCK TABLES `Fragments` WRITE;
/*!40000 ALTER TABLE `Fragments` DISABLE KEYS */;
/*!40000 ALTER TABLE `Fragments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fragments_AUD`
--

DROP TABLE IF EXISTS `Fragments_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Fragments_AUD` (
  `FragmentID` int(11) NOT NULL,
  `REV` int(11) NOT NULL,
  `REVTYPE` tinyint(3) DEFAULT NULL,
  `CreationDate` datetime(6) DEFAULT NULL,
  `FileDir` varchar(255) DEFAULT NULL,
  `FileName` varchar(255) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Note` varchar(1024) DEFAULT NULL,
  `Result` varchar(50) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  `PcrBatchID` int(11) DEFAULT NULL,
  `PcrReactionID` int(11) DEFAULT NULL,
  `RegionID` int(11) DEFAULT NULL,
  `SampleID` int(11) DEFAULT NULL,
  `SeqBatchID` int(11) DEFAULT NULL,
  `SeqReactionID` int(11) DEFAULT NULL,
  `SpecimenID` int(11) DEFAULT NULL,
  PRIMARY KEY (`FragmentID`,`REV`),
  KEY `FK_c3c6aipgssi2std58qr8hltxa` (`REV`),
  CONSTRAINT `FK_c3c6aipgssi2std58qr8hltxa` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fragments_AUD`
--

LOCK TABLES `Fragments_AUD` WRITE;
/*!40000 ALTER TABLE `Fragments_AUD` DISABLE KEYS */;
/*!40000 ALTER TABLE `Fragments_AUD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FungalInfos`
--

DROP TABLE IF EXISTS `FungalInfos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FungalInfos` (
  `FungalInfoID` int(11) NOT NULL AUTO_INCREMENT,
  `CCFCNumber` varchar(50) DEFAULT NULL,
  `DAOMGroup` varchar(50) DEFAULT NULL,
  `DAOMNumber` varchar(50) DEFAULT NULL,
  `Culture` bit(1) DEFAULT NULL,
  `CultureType` varchar(50) DEFAULT NULL,
  `IsolateNumber` varchar(50) DEFAULT NULL,
  `IsolatedBy` varchar(50) DEFAULT NULL,
  `IsolationDate` date DEFAULT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `Notes` varchar(1024) DEFAULT NULL,
  `ReceivedFrom` varchar(255) DEFAULT NULL,
  `SavedAs` varchar(50) DEFAULT NULL,
  `ToCCFC` date DEFAULT NULL,
  `ToDAOM` date DEFAULT NULL,
  PRIMARY KEY (`FungalInfoID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FungalInfos`
--

LOCK TABLES `FungalInfos` WRITE;
/*!40000 ALTER TABLE `FungalInfos` DISABLE KEYS */;
/*!40000 ALTER TABLE `FungalInfos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FungalInfos_AUD`
--

DROP TABLE IF EXISTS `FungalInfos_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FungalInfos_AUD` (
  `FungalInfoID` int(11) NOT NULL,
  `REV` int(11) NOT NULL,
  `REVTYPE` tinyint(3) DEFAULT NULL,
  `CCFCNumber` varchar(50) DEFAULT NULL,
  `DAOMGroup` varchar(50) DEFAULT NULL,
  `DAOMNumber` varchar(50) DEFAULT NULL,
  `Culture` bit(1) DEFAULT NULL,
  `CultureType` varchar(50) DEFAULT NULL,
  `IsolateNumber` varchar(50) DEFAULT NULL,
  `IsolatedBy` varchar(50) DEFAULT NULL,
  `IsolationDate` date DEFAULT NULL,
  `Notes` varchar(1024) DEFAULT NULL,
  `ReceivedFrom` varchar(255) DEFAULT NULL,
  `SavedAs` varchar(50) DEFAULT NULL,
  `ToCCFC` date DEFAULT NULL,
  `ToDAOM` date DEFAULT NULL,
  PRIMARY KEY (`FungalInfoID`,`REV`),
  KEY `FK_60m2opdbdh0oovy8ojgwg2kf3` (`REV`),
  CONSTRAINT `FK_60m2opdbdh0oovy8ojgwg2kf3` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FungalInfos_AUD`
--

LOCK TABLES `FungalInfos_AUD` WRITE;
/*!40000 ALTER TABLE `FungalInfos_AUD` DISABLE KEYS */;
/*!40000 ALTER TABLE `FungalInfos_AUD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Genotypes`
--

DROP TABLE IF EXISTS `Genotypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Genotypes` (
  `GenotypeID` int(11) NOT NULL AUTO_INCREMENT,
  `AnalysisProgram` varchar(50) DEFAULT NULL,
  `Dye` varchar(50) DEFAULT NULL,
  `FragmentFileName` varchar(100) NOT NULL,
  `GeneMapperProjectName` varchar(50) DEFAULT NULL,
  `MachineName` varchar(50) DEFAULT NULL,
  `Marker` varchar(50) DEFAULT NULL,
  `Polymer` varchar(50) DEFAULT NULL,
  `ProjectFileName` varchar(100) NOT NULL,
  `SizeStandard` varchar(50) DEFAULT NULL,
  `FragmentID` int(11) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  `PcrReactionID` int(11) DEFAULT NULL,
  `SampleID` int(11) DEFAULT NULL,
  `SeqReactionID` int(11) DEFAULT NULL,
  `SpecimenID` int(11) DEFAULT NULL,
  PRIMARY KEY (`GenotypeID`),
  KEY `FK_3cwj5t84yd9qrhe8q0q9lc95k` (`SpecimenID`),
  KEY `FK_6v2oc6eppswssh1e5sqe9bnrk` (`SeqReactionID`),
  KEY `FK_agn2dbwsghp1adwacwp995vsu` (`SampleID`),
  KEY `FK_k7l4tnbth2y7o68pirvugiewk` (`FragmentID`),
  KEY `FK_rn5embtsuc9p9bbs027gun5px` (`PcrReactionID`),
  KEY `FK_rpbwh1f9k66r13ma96vy1wmvq` (`GroupID`),
  CONSTRAINT `FK_3cwj5t84yd9qrhe8q0q9lc95k` FOREIGN KEY (`SpecimenID`) REFERENCES `Specimens` (`SpecimenID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_6v2oc6eppswssh1e5sqe9bnrk` FOREIGN KEY (`SeqReactionID`) REFERENCES `SeqReactions` (`SeqReactionID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_agn2dbwsghp1adwacwp995vsu` FOREIGN KEY (`SampleID`) REFERENCES `Samples` (`SampleID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_k7l4tnbth2y7o68pirvugiewk` FOREIGN KEY (`FragmentID`) REFERENCES `Fragments` (`FragmentID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_rn5embtsuc9p9bbs027gun5px` FOREIGN KEY (`PcrReactionID`) REFERENCES `PcrReactions` (`PcrReactionID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_rpbwh1f9k66r13ma96vy1wmvq` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Genotypes`
--

LOCK TABLES `Genotypes` WRITE;
/*!40000 ALTER TABLE `Genotypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Genotypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Genotypes_AUD`
--

DROP TABLE IF EXISTS `Genotypes_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Genotypes_AUD` (
  `GenotypeID` int(11) NOT NULL,
  `REV` int(11) NOT NULL,
  `REVTYPE` tinyint(3) DEFAULT NULL,
  `AnalysisProgram` varchar(50) DEFAULT NULL,
  `Dye` varchar(50) DEFAULT NULL,
  `FragmentFileName` varchar(100) DEFAULT NULL,
  `GeneMapperProjectName` varchar(50) DEFAULT NULL,
  `MachineName` varchar(50) DEFAULT NULL,
  `Marker` varchar(50) DEFAULT NULL,
  `Polymer` varchar(50) DEFAULT NULL,
  `ProjectFileName` varchar(100) DEFAULT NULL,
  `SizeStandard` varchar(50) DEFAULT NULL,
  `FragmentID` int(11) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  `PcrReactionID` int(11) DEFAULT NULL,
  `SampleID` int(11) DEFAULT NULL,
  `SeqReactionID` int(11) DEFAULT NULL,
  `SpecimenID` int(11) DEFAULT NULL,
  PRIMARY KEY (`GenotypeID`,`REV`),
  KEY `FK_5251so8coqx5l8rxh8yb4kwoq` (`REV`),
  CONSTRAINT `FK_5251so8coqx5l8rxh8yb4kwoq` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Genotypes_AUD`
--

LOCK TABLES `Genotypes_AUD` WRITE;
/*!40000 ALTER TABLE `Genotypes_AUD` DISABLE KEYS */;
/*!40000 ALTER TABLE `Genotypes_AUD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GoHits`
--

DROP TABLE IF EXISTS `GoHits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GoHits` (
  `GoHitID` int(11) NOT NULL AUTO_INCREMENT,
  `GoBiologicalProc` bit(1) NOT NULL,
  `GoCellularComp` bit(1) NOT NULL,
  `GoDefinition` longtext,
  `GoHitNumber` varchar(20) NOT NULL,
  `GoMolecularFunc` bit(1) NOT NULL,
  `GoTerm` longtext,
  `LastModified` datetime(6) DEFAULT NULL,
  `GoProjectID` int(11) DEFAULT NULL,
  PRIMARY KEY (`GoHitID`),
  KEY `FK_jt00wmbuf1wewbs6lxhhvrnhl` (`GoProjectID`),
  CONSTRAINT `FK_jt00wmbuf1wewbs6lxhhvrnhl` FOREIGN KEY (`GoProjectID`) REFERENCES `GoProjects` (`GoProjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GoHits`
--

LOCK TABLES `GoHits` WRITE;
/*!40000 ALTER TABLE `GoHits` DISABLE KEYS */;
/*!40000 ALTER TABLE `GoHits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GoProjects`
--

DROP TABLE IF EXISTS `GoProjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GoProjects` (
  `GoProjectID` int(11) NOT NULL AUTO_INCREMENT,
  `DateCreated` datetime(6) NOT NULL,
  `Description` longtext,
  `LastModified` datetime(6) DEFAULT NULL,
  `ProjectName` varchar(50) NOT NULL,
  `ProjectID` int(11) DEFAULT NULL,
  PRIMARY KEY (`GoProjectID`),
  UNIQUE KEY `ProjectName` (`ProjectName`),
  KEY `FK_mqehuefgg1n7lejxjaurysses` (`ProjectID`),
  CONSTRAINT `FK_mqehuefgg1n7lejxjaurysses` FOREIGN KEY (`ProjectID`) REFERENCES `Projects` (`ProjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GoProjects`
--

LOCK TABLES `GoProjects` WRITE;
/*!40000 ALTER TABLE `GoProjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `GoProjects` ENABLE KEYS */;
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

--
-- Table structure for table `Hosts`
--

DROP TABLE IF EXISTS `Hosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Hosts` (
  `HostID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(512) DEFAULT NULL,
  `Habitat` varchar(512) DEFAULT NULL,
  `HostETC` varchar(225) DEFAULT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `Part` varchar(50) DEFAULT NULL,
  `TaxonID` int(11) DEFAULT NULL,
  `TaxonomyID` int(11) DEFAULT NULL,
  PRIMARY KEY (`HostID`),
  KEY `FK_i0qacll44p0uklvkejag31tf3` (`TaxonomyID`),
  KEY `FK_klgh9npei7xn60sbiv941cn5e` (`TaxonID`),
  CONSTRAINT `FK_i0qacll44p0uklvkejag31tf3` FOREIGN KEY (`TaxonomyID`) REFERENCES `Taxonomys` (`TaxonomyID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_klgh9npei7xn60sbiv941cn5e` FOREIGN KEY (`TaxonID`) REFERENCES `Taxa` (`TaxonID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hosts`
--

LOCK TABLES `Hosts` WRITE;
/*!40000 ALTER TABLE `Hosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `Hosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hosts_AUD`
--

DROP TABLE IF EXISTS `Hosts_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Hosts_AUD` (
  `HostID` int(11) NOT NULL,
  `REV` int(11) NOT NULL,
  `REVTYPE` tinyint(3) DEFAULT NULL,
  `Description` varchar(512) DEFAULT NULL,
  `Habitat` varchar(512) DEFAULT NULL,
  `HostETC` varchar(225) DEFAULT NULL,
  `Part` varchar(50) DEFAULT NULL,
  `TaxonID` int(11) DEFAULT NULL,
  `TaxonomyID` int(11) DEFAULT NULL,
  PRIMARY KEY (`HostID`,`REV`),
  KEY `FK_f1ko8oiulps3jmtxrq9f87mmj` (`REV`),
  CONSTRAINT `FK_f1ko8oiulps3jmtxrq9f87mmj` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hosts_AUD`
--

LOCK TABLES `Hosts_AUD` WRITE;
/*!40000 ALTER TABLE `Hosts_AUD` DISABLE KEYS */;
/*!40000 ALTER TABLE `Hosts_AUD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HybProjects`
--

DROP TABLE IF EXISTS `HybProjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HybProjects` (
  `HyProjectID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` longtext,
  `LastModified` datetime(6) DEFAULT NULL,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`HyProjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HybProjects`
--

LOCK TABLES `HybProjects` WRITE;
/*!40000 ALTER TABLE `HybProjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `HybProjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HybProjectsProjects`
--

DROP TABLE IF EXISTS `HybProjectsProjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HybProjectsProjects` (
  `HybProjectsProjectID` int(11) NOT NULL AUTO_INCREMENT,
  `HyProjectID` int(11) DEFAULT NULL,
  `ProjectID` int(11) DEFAULT NULL,
  PRIMARY KEY (`HybProjectsProjectID`),
  KEY `FK_2uf57ss4mb8chcq4jlq5tmtwv` (`HyProjectID`),
  KEY `FK_ebs36c3v9l1trpqs5obdfxmt4` (`ProjectID`),
  CONSTRAINT `FK_2uf57ss4mb8chcq4jlq5tmtwv` FOREIGN KEY (`HyProjectID`) REFERENCES `HybProjects` (`HyProjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ebs36c3v9l1trpqs5obdfxmt4` FOREIGN KEY (`ProjectID`) REFERENCES `Projects` (`ProjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HybProjectsProjects`
--

LOCK TABLES `HybProjectsProjects` WRITE;
/*!40000 ALTER TABLE `HybProjectsProjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `HybProjectsProjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hybridizations`
--

DROP TABLE IF EXISTS `Hybridizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Hybridizations` (
  `HybridizationID` int(11) NOT NULL AUTO_INCREMENT,
  `Date` datetime(6) NOT NULL,
  `Description` longtext,
  `Duplicate` bit(1) NOT NULL,
  `ExpositionTime` time NOT NULL,
  `ImageDir` varchar(255) DEFAULT NULL,
  `ImageFileName` varchar(50) DEFAULT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `ArrayTypeID` int(11) DEFAULT NULL,
  `HyProjectID` int(11) DEFAULT NULL,
  PRIMARY KEY (`HybridizationID`),
  KEY `FK_mqt6y55s7tmnvab0suukcp22v` (`HyProjectID`),
  KEY `FK_nyf42lnk7bl6lvvutnqm8u4vy` (`ArrayTypeID`),
  CONSTRAINT `FK_mqt6y55s7tmnvab0suukcp22v` FOREIGN KEY (`HyProjectID`) REFERENCES `HybProjects` (`HyProjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_nyf42lnk7bl6lvvutnqm8u4vy` FOREIGN KEY (`ArrayTypeID`) REFERENCES `ArrayTypes` (`ArrayTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hybridizations`
--

LOCK TABLES `Hybridizations` WRITE;
/*!40000 ALTER TABLE `Hybridizations` DISABLE KEYS */;
/*!40000 ALTER TABLE `Hybridizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INT_CHANNEL_MESSAGE`
--

DROP TABLE IF EXISTS `INT_CHANNEL_MESSAGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INT_CHANNEL_MESSAGE` (
  `MESSAGE_ID` char(36) NOT NULL,
  `GROUP_KEY` char(36) NOT NULL,
  `CREATED_DATE` bigint(20) NOT NULL,
  `MESSAGE_PRIORITY` bigint(20) DEFAULT NULL,
  `MESSAGE_SEQUENCE` bigint(20) NOT NULL AUTO_INCREMENT,
  `MESSAGE_BYTES` blob,
  `REGION` varchar(100) NOT NULL,
  PRIMARY KEY (`GROUP_KEY`,`MESSAGE_ID`,`REGION`),
  UNIQUE KEY `MESSAGE_SEQUENCE` (`MESSAGE_SEQUENCE`),
  KEY `INT_CHANNEL_MSG_DATE_IDX` (`CREATED_DATE`,`MESSAGE_SEQUENCE`),
  KEY `INT_CHANNEL_MSG_PRIORITY_IDX` (`MESSAGE_PRIORITY`,`CREATED_DATE`,`MESSAGE_SEQUENCE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INT_CHANNEL_MESSAGE`
--

LOCK TABLES `INT_CHANNEL_MESSAGE` WRITE;
/*!40000 ALTER TABLE `INT_CHANNEL_MESSAGE` DISABLE KEYS */;
/*!40000 ALTER TABLE `INT_CHANNEL_MESSAGE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INT_GROUP_TO_MESSAGE`
--

DROP TABLE IF EXISTS `INT_GROUP_TO_MESSAGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INT_GROUP_TO_MESSAGE` (
  `GROUP_KEY` char(36) NOT NULL DEFAULT '',
  `MESSAGE_ID` char(36) NOT NULL DEFAULT '',
  `REGION` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`GROUP_KEY`,`MESSAGE_ID`,`REGION`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INT_GROUP_TO_MESSAGE`
--

LOCK TABLES `INT_GROUP_TO_MESSAGE` WRITE;
/*!40000 ALTER TABLE `INT_GROUP_TO_MESSAGE` DISABLE KEYS */;
/*!40000 ALTER TABLE `INT_GROUP_TO_MESSAGE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INT_LOCK`
--

DROP TABLE IF EXISTS `INT_LOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INT_LOCK` (
  `LOCK_KEY` char(36) NOT NULL DEFAULT '',
  `REGION` varchar(100) NOT NULL DEFAULT '',
  `CLIENT_ID` char(36) DEFAULT NULL,
  `CREATED_DATE` datetime(6) NOT NULL,
  PRIMARY KEY (`LOCK_KEY`,`REGION`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INT_LOCK`
--

LOCK TABLES `INT_LOCK` WRITE;
/*!40000 ALTER TABLE `INT_LOCK` DISABLE KEYS */;
/*!40000 ALTER TABLE `INT_LOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INT_MESSAGE`
--

DROP TABLE IF EXISTS `INT_MESSAGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INT_MESSAGE` (
  `MESSAGE_ID` char(36) NOT NULL DEFAULT '',
  `REGION` varchar(100) NOT NULL DEFAULT '',
  `CREATED_DATE` datetime(6) NOT NULL,
  `MESSAGE_BYTES` blob,
  PRIMARY KEY (`MESSAGE_ID`,`REGION`),
  KEY `INT_MESSAGE_IX1` (`CREATED_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INT_MESSAGE`
--

LOCK TABLES `INT_MESSAGE` WRITE;
/*!40000 ALTER TABLE `INT_MESSAGE` DISABLE KEYS */;
/*!40000 ALTER TABLE `INT_MESSAGE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INT_MESSAGE_GROUP`
--

DROP TABLE IF EXISTS `INT_MESSAGE_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INT_MESSAGE_GROUP` (
  `GROUP_KEY` char(36) NOT NULL DEFAULT '',
  `REGION` varchar(100) NOT NULL DEFAULT '',
  `MARKED` bigint(20) DEFAULT NULL,
  `COMPLETE` bigint(20) DEFAULT NULL,
  `LAST_RELEASED_SEQUENCE` bigint(20) DEFAULT NULL,
  `CREATED_DATE` datetime(6) NOT NULL,
  `UPDATED_DATE` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`GROUP_KEY`,`REGION`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INT_MESSAGE_GROUP`
--

LOCK TABLES `INT_MESSAGE_GROUP` WRITE;
/*!40000 ALTER TABLE `INT_MESSAGE_GROUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `INT_MESSAGE_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INT_METADATA_STORE`
--

DROP TABLE IF EXISTS `INT_METADATA_STORE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INT_METADATA_STORE` (
  `METADATA_KEY` varchar(255) NOT NULL,
  `METADATA_VALUE` varchar(4000) DEFAULT NULL,
  `REGION` varchar(100) NOT NULL,
  PRIMARY KEY (`METADATA_KEY`,`REGION`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INT_METADATA_STORE`
--

LOCK TABLES `INT_METADATA_STORE` WRITE;
/*!40000 ALTER TABLE `INT_METADATA_STORE` DISABLE KEYS */;
/*!40000 ALTER TABLE `INT_METADATA_STORE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Identifications`
--

DROP TABLE IF EXISTS `Identifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Identifications` (
  `IdentificationID` int(11) NOT NULL AUTO_INCREMENT,
  `Accepted` bit(1) NOT NULL,
  `Day` varchar(10) DEFAULT NULL,
  `Error` varchar(50) DEFAULT NULL,
  `EvidenceNotes` varchar(1024) DEFAULT NULL,
  `IdentifiedBy` varchar(200) DEFAULT NULL,
  `IdentifierEmail` varchar(200) DEFAULT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `LifeCycle` varchar(20) DEFAULT NULL,
  `Month` varchar(10) DEFAULT NULL,
  `NCBITaxonID` varchar(12) DEFAULT NULL,
  `Representative` bit(1) DEFAULT NULL,
  `Result` varchar(50) DEFAULT NULL,
  `Year` varchar(10) DEFAULT NULL,
  `SequenceID` int(11) DEFAULT NULL,
  `SpecimenID` int(11) DEFAULT NULL,
  `TaxonID` int(11) DEFAULT NULL,
  `TaxonomyID` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdentificationID`),
  KEY `FK_16rjw3tn0pbitl26qtce8a0iq` (`SequenceID`),
  KEY `FK_mvxonmas5vjv82wb2nym1na41` (`TaxonomyID`),
  KEY `FK_nabkyxwrsp4lhr4uihk8idcru` (`SpecimenID`),
  KEY `FK_sdfpg9um9vmjk132spagwfp3q` (`TaxonID`),
  CONSTRAINT `FK_16rjw3tn0pbitl26qtce8a0iq` FOREIGN KEY (`SequenceID`) REFERENCES `Sequences` (`SequenceID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_mvxonmas5vjv82wb2nym1na41` FOREIGN KEY (`TaxonomyID`) REFERENCES `Taxonomys` (`TaxonomyID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_nabkyxwrsp4lhr4uihk8idcru` FOREIGN KEY (`SpecimenID`) REFERENCES `Specimens` (`SpecimenID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_sdfpg9um9vmjk132spagwfp3q` FOREIGN KEY (`TaxonID`) REFERENCES `Taxa` (`TaxonID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Identifications`
--

LOCK TABLES `Identifications` WRITE;
/*!40000 ALTER TABLE `Identifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `Identifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Identifications_AUD`
--

DROP TABLE IF EXISTS `Identifications_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Identifications_AUD` (
  `IdentificationID` int(11) NOT NULL,
  `REV` int(11) NOT NULL,
  `REVTYPE` tinyint(3) DEFAULT NULL,
  `Accepted` bit(1) DEFAULT NULL,
  `Day` varchar(10) DEFAULT NULL,
  `Error` varchar(50) DEFAULT NULL,
  `EvidenceNotes` varchar(1024) DEFAULT NULL,
  `IdentifiedBy` varchar(200) DEFAULT NULL,
  `IdentifierEmail` varchar(200) DEFAULT NULL,
  `LifeCycle` varchar(20) DEFAULT NULL,
  `Month` varchar(10) DEFAULT NULL,
  `NCBITaxonID` varchar(12) DEFAULT NULL,
  `Representative` bit(1) DEFAULT NULL,
  `Result` varchar(50) DEFAULT NULL,
  `Year` varchar(10) DEFAULT NULL,
  `SequenceID` int(11) DEFAULT NULL,
  `SpecimenID` int(11) DEFAULT NULL,
  `TaxonID` int(11) DEFAULT NULL,
  `TaxonomyID` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdentificationID`,`REV`),
  KEY `FK_q9hx6uro42m6jguo0ubywc73b` (`REV`),
  CONSTRAINT `FK_q9hx6uro42m6jguo0ubywc73b` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Identifications_AUD`
--

LOCK TABLES `Identifications_AUD` WRITE;
/*!40000 ALTER TABLE `Identifications_AUD` DISABLE KEYS */;
/*!40000 ALTER TABLE `Identifications_AUD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ImportPermitAttach`
--

DROP TABLE IF EXISTS `ImportPermitAttach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ImportPermitAttach` (
  `ImportPermitAttachId` int(11) NOT NULL AUTO_INCREMENT,
  `DateEntered` date NOT NULL,
  `FileExtension` varchar(255) DEFAULT NULL,
  `FileName` varchar(255) NOT NULL,
  `FileTitle` varchar(255) DEFAULT NULL,
  `Height` int(11) DEFAULT NULL,
  `Location` varchar(255) NOT NULL,
  `Notes` varchar(1024) DEFAULT NULL,
  `Width` int(11) DEFAULT NULL,
  `ImportPermitId` int(11) NOT NULL,
  PRIMARY KEY (`ImportPermitAttachId`),
  KEY `FK_8op37369nil7onkhfvwsjx8qg` (`ImportPermitId`),
  CONSTRAINT `FK_8op37369nil7onkhfvwsjx8qg` FOREIGN KEY (`ImportPermitId`) REFERENCES `ImportPermits` (`ImportPermitID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ImportPermitAttach`
--

LOCK TABLES `ImportPermitAttach` WRITE;
/*!40000 ALTER TABLE `ImportPermitAttach` DISABLE KEYS */;
/*!40000 ALTER TABLE `ImportPermitAttach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ImportPermitEvents`
--

DROP TABLE IF EXISTS `ImportPermitEvents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ImportPermitEvents` (
  `ImportPermitEventID` int(11) NOT NULL AUTO_INCREMENT,
  `ImportationDate` date DEFAULT NULL,
  `ImportedBy` varchar(200) DEFAULT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `NumberOfSamples` varchar(50) DEFAULT NULL,
  `ImportPermitID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ImportPermitEventID`),
  KEY `FK_kn41lnvoh0wd5wo2otg013lnw` (`ImportPermitID`),
  CONSTRAINT `FK_kn41lnvoh0wd5wo2otg013lnw` FOREIGN KEY (`ImportPermitID`) REFERENCES `ImportPermits` (`ImportPermitID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ImportPermitEvents`
--

LOCK TABLES `ImportPermitEvents` WRITE;
/*!40000 ALTER TABLE `ImportPermitEvents` DISABLE KEYS */;
/*!40000 ALTER TABLE `ImportPermitEvents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ImportPermitEvents_AUD`
--

DROP TABLE IF EXISTS `ImportPermitEvents_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ImportPermitEvents_AUD` (
  `ImportPermitEventID` int(11) NOT NULL,
  `REV` int(11) NOT NULL,
  `REVTYPE` tinyint(3) DEFAULT NULL,
  `ImportationDate` date DEFAULT NULL,
  `ImportedBy` varchar(200) DEFAULT NULL,
  `NumberOfSamples` varchar(50) DEFAULT NULL,
  `ImportPermitID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ImportPermitEventID`,`REV`),
  KEY `FK_3gp7w8nmhjrync27b1vmjm1d3` (`REV`),
  CONSTRAINT `FK_3gp7w8nmhjrync27b1vmjm1d3` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ImportPermitEvents_AUD`
--

LOCK TABLES `ImportPermitEvents_AUD` WRITE;
/*!40000 ALTER TABLE `ImportPermitEvents_AUD` DISABLE KEYS */;
/*!40000 ALTER TABLE `ImportPermitEvents_AUD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ImportPermits`
--

DROP TABLE IF EXISTS `ImportPermits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ImportPermits` (
  `ImportPermitID` int(11) NOT NULL AUTO_INCREMENT,
  `CFIAPermitNumber` varchar(50) NOT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ImportPermitID`),
  UNIQUE KEY `CFIAPermitNumber` (`CFIAPermitNumber`),
  KEY `FK_8t3csx2jn8t4wvjfyx0o87wsv` (`GroupID`),
  CONSTRAINT `FK_8t3csx2jn8t4wvjfyx0o87wsv` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ImportPermits`
--

LOCK TABLES `ImportPermits` WRITE;
/*!40000 ALTER TABLE `ImportPermits` DISABLE KEYS */;
/*!40000 ALTER TABLE `ImportPermits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ImportPermits_AUD`
--

DROP TABLE IF EXISTS `ImportPermits_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ImportPermits_AUD` (
  `ImportPermitID` int(11) NOT NULL,
  `REV` int(11) NOT NULL,
  `REVTYPE` tinyint(3) DEFAULT NULL,
  `CFIAPermitNumber` varchar(50) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ImportPermitID`,`REV`),
  KEY `FK_9yt5xppi0c6phhbb9a0uo0klr` (`REV`),
  CONSTRAINT `FK_9yt5xppi0c6phhbb9a0uo0klr` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ImportPermits_AUD`
--

LOCK TABLES `ImportPermits_AUD` WRITE;
/*!40000 ALTER TABLE `ImportPermits_AUD` DISABLE KEYS */;
/*!40000 ALTER TABLE `ImportPermits_AUD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LabelFormats`
--

DROP TABLE IF EXISTS `LabelFormats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LabelFormats` (
  `LabelFormatID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(255) NOT NULL,
  `LabelFormatName` varchar(50) NOT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `RibbonType` varchar(50) NOT NULL,
  PRIMARY KEY (`LabelFormatID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LabelFormats`
--

LOCK TABLES `LabelFormats` WRITE;
/*!40000 ALTER TABLE `LabelFormats` DISABLE KEYS */;
INSERT INTO `LabelFormats` VALUES (1,'Tube + Cap Label','THT-142','2013-03-19 00:00:00.000000','R60XX'),(2,'This is a THT-163 Label','THT-163','2013-03-19 00:00:00.000000','R43XX'),(3,'A sheet of paper','8.5x11','2013-03-19 00:00:00.000000','Laser');
/*!40000 ALTER TABLE `LabelFormats` ENABLE KEYS */;
UNLOCK TABLES;

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
  CONSTRAINT `FK_7ni5bxxry15ocko3jkdtblh0l` FOREIGN KEY (`BarcodeableMapID`) REFERENCES `BarcodeableMaps` (`BarcodeableMapID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_df6kifjhg2ci1s074w5cho48g` FOREIGN KEY (`LabelFormatID`) REFERENCES `LabelFormats` (`LabelFormatID`) ON DELETE NO ACTION ON UPDATE NO ACTION
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

--
-- Table structure for table `Lexicon`
--

DROP TABLE IF EXISTS `Lexicon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Lexicon` (
  `LexiconID` int(11) NOT NULL AUTO_INCREMENT,
  `LastModified` datetime(6) DEFAULT NULL,
  `LastModifiedBy` varchar(80) NOT NULL,
  `LexStr` varchar(500) NOT NULL,
  `LanguageID` int(11) NOT NULL,
  PRIMARY KEY (`LexiconID`),
  KEY `FK_j2o9mp4t113b0nuulwkidj9kh` (`LanguageID`),
  CONSTRAINT `FK_j2o9mp4t113b0nuulwkidj9kh` FOREIGN KEY (`LanguageID`) REFERENCES `UsageKeys` (`UsageKeysID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Lexicon`
--

LOCK TABLES `Lexicon` WRITE;
/*!40000 ALTER TABLE `Lexicon` DISABLE KEYS */;
/*!40000 ALTER TABLE `Lexicon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LexiconUsage`
--

DROP TABLE IF EXISTS `LexiconUsage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LexiconUsage` (
  `LexiconUsageID` int(11) NOT NULL AUTO_INCREMENT,
  `LastModified` datetime(6) DEFAULT NULL,
  `LexiconID` int(11) DEFAULT NULL,
  `UsageID` int(11) DEFAULT NULL,
  PRIMARY KEY (`LexiconUsageID`),
  KEY `FK_3mvttib8prndkuvcuts418msh` (`UsageID`),
  KEY `FK_lobmdymx6yfsxg526yp1xjt2y` (`LexiconID`),
  CONSTRAINT `FK_3mvttib8prndkuvcuts418msh` FOREIGN KEY (`UsageID`) REFERENCES `UsageKeys` (`UsageKeysID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_lobmdymx6yfsxg526yp1xjt2y` FOREIGN KEY (`LexiconID`) REFERENCES `Lexicon` (`LexiconID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LexiconUsage`
--

LOCK TABLES `LexiconUsage` WRITE;
/*!40000 ALTER TABLE `LexiconUsage` DISABLE KEYS */;
/*!40000 ALTER TABLE `LexiconUsage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Libraries`
--

DROP TABLE IF EXISTS `Libraries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Libraries` (
  `LibraryID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` longtext,
  `LastModified` datetime(6) DEFAULT NULL,
  `Name` varchar(50) NOT NULL,
  `SampleID` int(11) DEFAULT NULL,
  PRIMARY KEY (`LibraryID`),
  UNIQUE KEY `Name` (`Name`),
  KEY `FK_9bdt7x1mdttes489fiu6ca0vc` (`SampleID`),
  CONSTRAINT `FK_9bdt7x1mdttes489fiu6ca0vc` FOREIGN KEY (`SampleID`) REFERENCES `Samples` (`SampleID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Libraries`
--

LOCK TABLES `Libraries` WRITE;
/*!40000 ALTER TABLE `Libraries` DISABLE KEYS */;
/*!40000 ALTER TABLE `Libraries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LibrariesProjects`
--

DROP TABLE IF EXISTS `LibrariesProjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LibrariesProjects` (
  `LibrariesProjectsID` int(11) NOT NULL AUTO_INCREMENT,
  `LibraryID` int(11) DEFAULT NULL,
  `ProjectID` int(11) DEFAULT NULL,
  PRIMARY KEY (`LibrariesProjectsID`),
  KEY `FK_873ojhy1tfgyvqcvlhlaq1v0w` (`LibraryID`),
  KEY `FK_fkisljs3fflmp59td40rdh9py` (`ProjectID`),
  CONSTRAINT `FK_873ojhy1tfgyvqcvlhlaq1v0w` FOREIGN KEY (`LibraryID`) REFERENCES `Libraries` (`LibraryID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_fkisljs3fflmp59td40rdh9py` FOREIGN KEY (`ProjectID`) REFERENCES `Projects` (`ProjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LibrariesProjects`
--

LOCK TABLES `LibrariesProjects` WRITE;
/*!40000 ALTER TABLE `LibrariesProjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `LibrariesProjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LoanAct`
--

DROP TABLE IF EXISTS `LoanAct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LoanAct` (
  `LoanActId` int(11) NOT NULL AUTO_INCREMENT,
  `ActContent` varchar(512) DEFAULT NULL,
  `ActType` varchar(255) DEFAULT NULL,
  `DateEntered` date DEFAULT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `CareOf` int(11) DEFAULT NULL,
  `LoanFormId` int(11) NOT NULL,
  PRIMARY KEY (`LoanActId`),
  KEY `FK_a4ruos4y5lde9c6vpbfedu1x8` (`LoanFormId`),
  KEY `FK_n24pcn7qawqpqsrnqk5blmoyp` (`CareOf`),
  CONSTRAINT `FK_a4ruos4y5lde9c6vpbfedu1x8` FOREIGN KEY (`LoanFormId`) REFERENCES `LoanForm` (`LoanFormID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_n24pcn7qawqpqsrnqk5blmoyp` FOREIGN KEY (`CareOf`) REFERENCES `People` (`PeopleID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LoanAct`
--

LOCK TABLES `LoanAct` WRITE;
/*!40000 ALTER TABLE `LoanAct` DISABLE KEYS */;
/*!40000 ALTER TABLE `LoanAct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LoanAttach`
--

DROP TABLE IF EXISTS `LoanAttach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LoanAttach` (
  `LoanAttachId` int(11) NOT NULL AUTO_INCREMENT,
  `DateEntered` date NOT NULL,
  `FileExtension` varchar(255) DEFAULT NULL,
  `FileName` varchar(255) NOT NULL,
  `FileTitle` varchar(255) DEFAULT NULL,
  `Height` int(11) DEFAULT NULL,
  `Location` varchar(255) NOT NULL,
  `Width` int(11) DEFAULT NULL,
  `LoanFormId` int(11) NOT NULL,
  PRIMARY KEY (`LoanAttachId`),
  KEY `FK_8hienxmj6umhwwdwtdia6mo00` (`LoanFormId`),
  CONSTRAINT `FK_8hienxmj6umhwwdwtdia6mo00` FOREIGN KEY (`LoanFormId`) REFERENCES `LoanForm` (`LoanFormID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LoanAttach`
--

LOCK TABLES `LoanAttach` WRITE;
/*!40000 ALTER TABLE `LoanAttach` DISABLE KEYS */;
/*!40000 ALTER TABLE `LoanAttach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LoanForm`
--

DROP TABLE IF EXISTS `LoanForm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LoanForm` (
  `LoanFormID` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(100) DEFAULT NULL,
  `FileClosedOn` date DEFAULT NULL,
  `InvoiceId` varchar(20) NOT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `LoanRemarks` varchar(512) DEFAULT NULL,
  `MaterialSent` varchar(10000) DEFAULT NULL,
  `NumberOfParcels` int(11) DEFAULT NULL,
  `Phone` varchar(100) DEFAULT NULL,
  `ReturnDate` date DEFAULT NULL,
  `ShippedDate` date DEFAULT NULL,
  `ShippingMethod` varchar(100) DEFAULT NULL,
  `Address` int(11) DEFAULT NULL,
  `ApprovedBy` int(11) DEFAULT NULL,
  `Borrower` int(11) DEFAULT NULL,
  `CareOf` int(11) DEFAULT NULL,
  `CollectionCode` int(11) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  `InitiatedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`LoanFormID`),
  UNIQUE KEY `InvoiceId` (`InvoiceId`),
  KEY `FK_4p35ltc0esje5dqk6bijs1j8b` (`CareOf`),
  KEY `FK_ap7h52t09ifgna8eb18rewjdw` (`Address`),
  KEY `FK_cvux8wn8y5p76osk93xs676h3` (`Borrower`),
  KEY `FK_focrnu2ify77abyh6uxpwlkfx` (`CollectionCode`),
  KEY `FK_ksm66fxg7l7qyaxf1vsg0bfl2` (`ApprovedBy`),
  KEY `FK_mfvlp5u1havi9ud5sjy5wnqud` (`GroupID`),
  KEY `FK_ok08fa4vh19nl7hqardtce2vh` (`InitiatedBy`),
  CONSTRAINT `FK_4p35ltc0esje5dqk6bijs1j8b` FOREIGN KEY (`CareOf`) REFERENCES `People` (`PeopleID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ap7h52t09ifgna8eb18rewjdw` FOREIGN KEY (`Address`) REFERENCES `Addresses` (`AddressID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_cvux8wn8y5p76osk93xs676h3` FOREIGN KEY (`Borrower`) REFERENCES `People` (`PeopleID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_focrnu2ify77abyh6uxpwlkfx` FOREIGN KEY (`CollectionCode`) REFERENCES `BiologicalCollections` (`BiologicalCollectionID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ksm66fxg7l7qyaxf1vsg0bfl2` FOREIGN KEY (`ApprovedBy`) REFERENCES `People` (`PeopleID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_mfvlp5u1havi9ud5sjy5wnqud` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ok08fa4vh19nl7hqardtce2vh` FOREIGN KEY (`InitiatedBy`) REFERENCES `People` (`PeopleID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LoanForm`
--

LOCK TABLES `LoanForm` WRITE;
/*!40000 ALTER TABLE `LoanForm` DISABLE KEYS */;
/*!40000 ALTER TABLE `LoanForm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Locations`
--

DROP TABLE IF EXISTS `Locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Locations` (
  `LocationID` int(11) NOT NULL AUTO_INCREMENT,
  `DateMoved` datetime(6) DEFAULT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `WellColumn` int(11) DEFAULT NULL,
  `WellRow` varchar(2) DEFAULT NULL,
  `ContainerID` int(11) NOT NULL,
  `FragmentID` int(11) DEFAULT NULL,
  `MixedSpecimenID` int(11) DEFAULT NULL,
  `PcrPrimerID` int(11) DEFAULT NULL,
  `SampleID` int(11) DEFAULT NULL,
  `SequenceID` int(11) DEFAULT NULL,
  `SpecimenReplicateID` int(11) DEFAULT NULL,
  PRIMARY KEY (`LocationID`),
  UNIQUE KEY `UK_ftabvest74ag91ge26690247a` (`ContainerID`,`WellColumn`,`WellRow`),
  KEY `FK_4ytymn0oh44qtb1qlhxde27oe` (`FragmentID`),
  KEY `FK_amshi66em4jphq5t3nempuqb9` (`MixedSpecimenID`),
  KEY `FK_owenubne8jbacxg0mwdliutp5` (`PcrPrimerID`),
  KEY `FK_p2if06fynkj3xjn86klpe2rhq` (`SpecimenReplicateID`),
  KEY `FK_pgeq6y89t7machd9auk56xfxv` (`SampleID`),
  KEY `FK_swn4iqbmyw7uoe1m7hq6fnyst` (`SequenceID`),
  CONSTRAINT `FK_4ytymn0oh44qtb1qlhxde27oe` FOREIGN KEY (`FragmentID`) REFERENCES `Fragments` (`FragmentID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_amshi66em4jphq5t3nempuqb9` FOREIGN KEY (`MixedSpecimenID`) REFERENCES `MixedSpecimens` (`MixedSpecimenID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_hqjcgefol6i4h3bx8mxyarxyl` FOREIGN KEY (`ContainerID`) REFERENCES `Containers` (`ContainerID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_owenubne8jbacxg0mwdliutp5` FOREIGN KEY (`PcrPrimerID`) REFERENCES `PcrPrimers` (`PCRPrimerID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_p2if06fynkj3xjn86klpe2rhq` FOREIGN KEY (`SpecimenReplicateID`) REFERENCES `SpecimenReplicates` (`SpecimenReplicateID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_pgeq6y89t7machd9auk56xfxv` FOREIGN KEY (`SampleID`) REFERENCES `Samples` (`SampleID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_swn4iqbmyw7uoe1m7hq6fnyst` FOREIGN KEY (`SequenceID`) REFERENCES `Sequences` (`SequenceID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Locations`
--

LOCK TABLES `Locations` WRITE;
/*!40000 ALTER TABLE `Locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `Locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MixedSpecimenAttach`
--

DROP TABLE IF EXISTS `MixedSpecimenAttach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MixedSpecimenAttach` (
  `MixedSpecimenAttachId` int(11) NOT NULL AUTO_INCREMENT,
  `DateEntered` date NOT NULL,
  `FileExtension` varchar(255) DEFAULT NULL,
  `FileName` varchar(255) NOT NULL,
  `FileTitle` varchar(255) DEFAULT NULL,
  `Height` int(11) DEFAULT NULL,
  `Location` varchar(255) NOT NULL,
  `Notes` varchar(1024) DEFAULT NULL,
  `Width` int(11) DEFAULT NULL,
  `MixedSpecimenId` int(11) NOT NULL,
  PRIMARY KEY (`MixedSpecimenAttachId`),
  KEY `FK_c5x1738wdf7q5e7hxgq4o78e` (`MixedSpecimenId`),
  CONSTRAINT `FK_c5x1738wdf7q5e7hxgq4o78e` FOREIGN KEY (`MixedSpecimenId`) REFERENCES `MixedSpecimens` (`MixedSpecimenID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MixedSpecimenAttach`
--

LOCK TABLES `MixedSpecimenAttach` WRITE;
/*!40000 ALTER TABLE `MixedSpecimenAttach` DISABLE KEYS */;
/*!40000 ALTER TABLE `MixedSpecimenAttach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MixedSpecimens`
--

DROP TABLE IF EXISTS `MixedSpecimens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MixedSpecimens` (
  `MixedSpecimenID` int(11) NOT NULL AUTO_INCREMENT,
  `AssociatedPlants` varchar(200) DEFAULT NULL,
  `CabinRefOrTestSite` varchar(50) DEFAULT NULL,
  `CabinSiteCode` varchar(50) DEFAULT NULL,
  `CabinStudy` varchar(50) DEFAULT NULL,
  `ExperimentalReplicate` varchar(5) DEFAULT NULL,
  `FungiIsolated` varchar(50) DEFAULT NULL,
  `LabAnalysisReport` varchar(50) DEFAULT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `MixedSpecimenNumber` varchar(50) NOT NULL,
  `Notes` varchar(1024) DEFAULT NULL,
  `NumberOfSubsamples` int(11) DEFAULT NULL,
  `OtherIDs` varchar(200) DEFAULT NULL,
  `ReplicateInfo` varchar(200) DEFAULT NULL,
  `SampleDestroyed` date DEFAULT NULL,
  `SampleReceiptDate` date DEFAULT NULL,
  `SpikeMaterial` varchar(100) DEFAULT NULL,
  `SubstrateSize` int(11) DEFAULT NULL,
  `SubstrateType` varchar(200) DEFAULT NULL,
  `Treatment` varchar(100) DEFAULT NULL,
  `WaterQualitySampleId` varchar(50) DEFAULT NULL,
  `WaterQualitySiteId` varchar(50) DEFAULT NULL,
  `WaterSamplingTime` varchar(50) DEFAULT NULL,
  `BiologicalCollectionID` int(11) NOT NULL,
  `CollectionInfoID` int(11) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  `ImportPermitID` int(11) DEFAULT NULL,
  `MixsSpecificationID` int(11) DEFAULT NULL,
  PRIMARY KEY (`MixedSpecimenID`),
  UNIQUE KEY `UK_kx2r3f1xk5ath9pj7nth70tm6` (`MixedSpecimenNumber`,`BiologicalCollectionID`),
  UNIQUE KEY `MixsSpecificationID` (`MixsSpecificationID`),
  KEY `FK_4sbel4md60bhymihq22boplmq` (`GroupID`),
  KEY `FK_94np4iqalsmisrmtv3i0ce51c` (`ImportPermitID`),
  KEY `FK_a6yywjr2k3p8liflvfcqvijhk` (`CollectionInfoID`),
  KEY `FK_mr2al2qrjhtfdjurqp4rlai3a` (`BiologicalCollectionID`),
  KEY `mixedSpecimen_substrateType_idx` (`SubstrateType`),
  CONSTRAINT `FK_3bnrsjvog8w18jw1y2eh5hdo0` FOREIGN KEY (`MixsSpecificationID`) REFERENCES `MixsSpecification` (`MixsSpecificationID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_4sbel4md60bhymihq22boplmq` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_94np4iqalsmisrmtv3i0ce51c` FOREIGN KEY (`ImportPermitID`) REFERENCES `ImportPermits` (`ImportPermitID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_a6yywjr2k3p8liflvfcqvijhk` FOREIGN KEY (`CollectionInfoID`) REFERENCES `CollectionInfos` (`CollectionInfoID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_mr2al2qrjhtfdjurqp4rlai3a` FOREIGN KEY (`BiologicalCollectionID`) REFERENCES `BiologicalCollections` (`BiologicalCollectionID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MixedSpecimens`
--

LOCK TABLES `MixedSpecimens` WRITE;
/*!40000 ALTER TABLE `MixedSpecimens` DISABLE KEYS */;
/*!40000 ALTER TABLE `MixedSpecimens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MixedSpecimens_AUD`
--

DROP TABLE IF EXISTS `MixedSpecimens_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MixedSpecimens_AUD` (
  `MixedSpecimenID` int(11) NOT NULL,
  `REV` int(11) NOT NULL,
  `REVTYPE` tinyint(3) DEFAULT NULL,
  `AssociatedPlants` varchar(200) DEFAULT NULL,
  `CabinRefOrTestSite` varchar(50) DEFAULT NULL,
  `CabinSiteCode` varchar(50) DEFAULT NULL,
  `CabinStudy` varchar(50) DEFAULT NULL,
  `ExperimentalReplicate` varchar(5) DEFAULT NULL,
  `FungiIsolated` varchar(50) DEFAULT NULL,
  `LabAnalysisReport` varchar(50) DEFAULT NULL,
  `MixedSpecimenNumber` varchar(50) DEFAULT NULL,
  `Notes` varchar(1024) DEFAULT NULL,
  `NumberOfSubsamples` int(11) DEFAULT NULL,
  `OtherIDs` varchar(200) DEFAULT NULL,
  `ReplicateInfo` varchar(200) DEFAULT NULL,
  `SampleDestroyed` date DEFAULT NULL,
  `SampleReceiptDate` date DEFAULT NULL,
  `SpikeMaterial` varchar(100) DEFAULT NULL,
  `SubstrateSize` int(11) DEFAULT NULL,
  `SubstrateType` varchar(200) DEFAULT NULL,
  `Treatment` varchar(100) DEFAULT NULL,
  `WaterQualitySampleId` varchar(50) DEFAULT NULL,
  `WaterQualitySiteId` varchar(50) DEFAULT NULL,
  `WaterSamplingTime` varchar(50) DEFAULT NULL,
  `BiologicalCollectionID` int(11) DEFAULT NULL,
  `CollectionInfoID` int(11) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  `ImportPermitID` int(11) DEFAULT NULL,
  `MixsSpecificationID` int(11) DEFAULT NULL,
  PRIMARY KEY (`MixedSpecimenID`,`REV`),
  KEY `FK_argt4d0rarc85d2x82523b2cf` (`REV`),
  CONSTRAINT `FK_argt4d0rarc85d2x82523b2cf` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MixedSpecimens_AUD`
--

LOCK TABLES `MixedSpecimens_AUD` WRITE;
/*!40000 ALTER TABLE `MixedSpecimens_AUD` DISABLE KEYS */;
/*!40000 ALTER TABLE `MixedSpecimens_AUD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MixsSpecification`
--

DROP TABLE IF EXISTS `MixsSpecification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MixsSpecification` (
  `MixsSpecificationID` int(11) NOT NULL AUTO_INCREMENT,
  `AbsAirHumidity` varchar(50) DEFAULT NULL,
  `AgrochemAddition` varchar(50) DEFAULT NULL,
  `AirTemp` varchar(50) DEFAULT NULL,
  `AirTempRegm` varchar(50) DEFAULT NULL,
  `AlSat` varchar(50) DEFAULT NULL,
  `AlSatMeth` varchar(50) DEFAULT NULL,
  `Alkalinity` varchar(50) DEFAULT NULL,
  `AlkylDiethers` varchar(50) DEFAULT NULL,
  `AminopeptAct` varchar(50) DEFAULT NULL,
  `Ammonium` varchar(50) DEFAULT NULL,
  `AmnioticFluidColor` varchar(50) DEFAULT NULL,
  `AnnualSeasonPrecpt` varchar(100) DEFAULT NULL,
  `AnnualSeasonTemp` varchar(100) DEFAULT NULL,
  `AntibioticRegm` varchar(50) DEFAULT NULL,
  `AtmosphericData` varchar(50) DEFAULT NULL,
  `BacProd` varchar(50) DEFAULT NULL,
  `BacResp` varchar(50) DEFAULT NULL,
  `BacteriaCarbProd` varchar(50) DEFAULT NULL,
  `BankfullWettedDepth` varchar(10) DEFAULT NULL,
  `BankfullWidth` varchar(10) DEFAULT NULL,
  `BarometricPress` varchar(50) DEFAULT NULL,
  `BiochemOxygenDem` varchar(50) DEFAULT NULL,
  `Biomass` varchar(50) DEFAULT NULL,
  `Biome` varchar(50) DEFAULT NULL,
  `BioticRelationship` varchar(50) DEFAULT NULL,
  `BirthControl` varchar(50) DEFAULT NULL,
  `Bishomohopanol` varchar(50) DEFAULT NULL,
  `BloodBloodDisord` varchar(50) DEFAULT NULL,
  `Bromide` varchar(50) DEFAULT NULL,
  `BuildOccupType` varchar(50) DEFAULT NULL,
  `BuildingSetting` varchar(50) DEFAULT NULL,
  `Calcium` varchar(50) DEFAULT NULL,
  `CanopyCoverage` varchar(10) DEFAULT NULL,
  `CarbDioxide` varchar(50) DEFAULT NULL,
  `CarbMonoxide` varchar(50) DEFAULT NULL,
  `CarbNitroRatio` varchar(50) DEFAULT NULL,
  `ChemAdministration` varchar(50) DEFAULT NULL,
  `ChemMutagen` varchar(50) DEFAULT NULL,
  `ChemOxygenDem` varchar(50) DEFAULT NULL,
  `Chloride` varchar(50) DEFAULT NULL,
  `Chlorophyll` varchar(50) DEFAULT NULL,
  `ClimateEnvironment` varchar(50) DEFAULT NULL,
  `Conduc` varchar(50) DEFAULT NULL,
  `CropRotation` varchar(50) DEFAULT NULL,
  `CurLandUse` varchar(100) DEFAULT NULL,
  `CurVegetation` varchar(50) DEFAULT NULL,
  `CurVegetationMeth` varchar(50) DEFAULT NULL,
  `Density` varchar(50) DEFAULT NULL,
  `DermatologyDisord` varchar(50) DEFAULT NULL,
  `DewPoint` varchar(50) DEFAULT NULL,
  `DietLastSixMonth` varchar(50) DEFAULT NULL,
  `DietherLipids` varchar(50) DEFAULT NULL,
  `DissCarbDioxide` varchar(50) DEFAULT NULL,
  `DissHydrogen` varchar(50) DEFAULT NULL,
  `DissInorgCarb` varchar(50) DEFAULT NULL,
  `DissInorgNitro` varchar(50) DEFAULT NULL,
  `DissInorgPhosp` varchar(50) DEFAULT NULL,
  `DissOrgCarb` varchar(50) DEFAULT NULL,
  `DissOrgNitro` varchar(50) DEFAULT NULL,
  `DissOxygen` varchar(50) DEFAULT NULL,
  `DominantHand` varchar(50) DEFAULT NULL,
  `DominantLandUse` varchar(100) DEFAULT NULL,
  `DominantStreamsideVegetation` varchar(100) DEFAULT NULL,
  `Douche` datetime(6) DEFAULT NULL,
  `DownPar` varchar(50) DEFAULT NULL,
  `DrainageClass` varchar(50) DEFAULT NULL,
  `DrugUsage` varchar(50) DEFAULT NULL,
  `EColi` varchar(50) DEFAULT NULL,
  `EfficiencyPercent` varchar(50) DEFAULT NULL,
  `Emulsions` varchar(50) DEFAULT NULL,
  `EncodedTraits` varchar(50) DEFAULT NULL,
  `EnvPackage` varchar(50) DEFAULT NULL,
  `EstimatedSize` varchar(50) DEFAULT NULL,
  `ExperimentalFactor` varchar(50) DEFAULT NULL,
  `ExtrachromElements` varchar(50) DEFAULT NULL,
  `ExtremeEvent` datetime(6) DEFAULT NULL,
  `ExtremeSalinity` varchar(100) DEFAULT NULL,
  `FaoClass` varchar(50) DEFAULT NULL,
  `Feature` varchar(50) DEFAULT NULL,
  `FertilizerRegm` varchar(50) DEFAULT NULL,
  `FilterType` varchar(50) DEFAULT NULL,
  `Fire` datetime(6) DEFAULT NULL,
  `FishKillEventInfo` varchar(100) DEFAULT NULL,
  `Flooding` datetime(6) DEFAULT NULL,
  `Fluor` varchar(50) DEFAULT NULL,
  `FoetalHealthStat` varchar(50) DEFAULT NULL,
  `FungicideRegm` varchar(50) DEFAULT NULL,
  `GaseousEnvironment` varchar(50) DEFAULT NULL,
  `GaseousSubstances` varchar(50) DEFAULT NULL,
  `GastrointestDisord` varchar(50) DEFAULT NULL,
  `GestationState` varchar(50) DEFAULT NULL,
  `GlucosidaseAct` varchar(50) DEFAULT NULL,
  `Gravidity` varchar(50) DEFAULT NULL,
  `Gravity` varchar(50) DEFAULT NULL,
  `GrowthHormoneRegm` varchar(50) DEFAULT NULL,
  `GrowthMed` varchar(50) DEFAULT NULL,
  `GynecologicDisord` varchar(50) DEFAULT NULL,
  `HealthDiseaseStat` varchar(50) DEFAULT NULL,
  `HeatCoolType` varchar(50) DEFAULT NULL,
  `HeavyMetals` varchar(50) DEFAULT NULL,
  `HeavyMetalsMeth` varchar(50) DEFAULT NULL,
  `HerbicideRegm` varchar(50) DEFAULT NULL,
  `Horizon` varchar(50) DEFAULT NULL,
  `HorizonMeth` varchar(50) DEFAULT NULL,
  `HostAge` varchar(50) DEFAULT NULL,
  `HostBloodPressDiast` varchar(50) DEFAULT NULL,
  `HostBloodPressSyst` varchar(50) DEFAULT NULL,
  `HostBodyHabitat` varchar(50) DEFAULT NULL,
  `HostBodyMassIndex` varchar(50) DEFAULT NULL,
  `HostBodyProduct` varchar(50) DEFAULT NULL,
  `HostBodySite` varchar(50) DEFAULT NULL,
  `HostBodyTemp` varchar(50) DEFAULT NULL,
  `HostColor` varchar(50) DEFAULT NULL,
  `HostCommonName` varchar(50) DEFAULT NULL,
  `HostDiet` varchar(50) DEFAULT NULL,
  `HostDiseaseStat` varchar(50) DEFAULT NULL,
  `HostDryMass` varchar(50) DEFAULT NULL,
  `HostFamilyRelationship` varchar(50) DEFAULT NULL,
  `HostGenotype` varchar(50) DEFAULT NULL,
  `HostGrowthCond` varchar(50) DEFAULT NULL,
  `HostHeight` varchar(50) DEFAULT NULL,
  `HostHivStat` varchar(50) DEFAULT NULL,
  `HostInfraSpecificName` varchar(50) DEFAULT NULL,
  `HostInfraSpecificRank` varchar(50) DEFAULT NULL,
  `HostLastMeal` varchar(50) DEFAULT NULL,
  `HostLength` varchar(50) DEFAULT NULL,
  `HostLifeStage` varchar(50) DEFAULT NULL,
  `HostOccupation` int(11) DEFAULT NULL,
  `HostPhenotype` varchar(50) DEFAULT NULL,
  `HostPulse` varchar(50) DEFAULT NULL,
  `HostSex` varchar(50) DEFAULT NULL,
  `HostShape` varchar(50) DEFAULT NULL,
  `HostSubjectId` varchar(50) DEFAULT NULL,
  `HostSubstrate` varchar(50) DEFAULT NULL,
  `HostTaxid` int(11) DEFAULT NULL,
  `HostTotMass` varchar(50) DEFAULT NULL,
  `HostWetMass` varchar(50) DEFAULT NULL,
  `Hrt` datetime(6) DEFAULT NULL,
  `Humidity` varchar(50) DEFAULT NULL,
  `HumidityRegm` varchar(50) DEFAULT NULL,
  `Hysterectomy` bit(1) DEFAULT NULL,
  `IhmcEthnicity` varchar(50) DEFAULT NULL,
  `IhmcMedicationCode` int(11) DEFAULT NULL,
  `IndoorSpace` varchar(50) DEFAULT NULL,
  `IndoorSurf` varchar(50) DEFAULT NULL,
  `IndustEffPercent` varchar(50) DEFAULT NULL,
  `InorgParticles` varchar(50) DEFAULT NULL,
  `InvestigationType` varchar(20) DEFAULT NULL,
  `IsolGrowthCondt` varchar(50) DEFAULT NULL,
  `KidneyDisord` varchar(50) DEFAULT NULL,
  `LightIntensity` varchar(50) DEFAULT NULL,
  `LightType` varchar(50) DEFAULT NULL,
  `LinkAdditAnalys` varchar(50) DEFAULT NULL,
  `LinkClassInfo` varchar(250) DEFAULT NULL,
  `LinkClimateInfo` varchar(250) DEFAULT NULL,
  `LiverDisord` varchar(50) DEFAULT NULL,
  `LocalClass` varchar(50) DEFAULT NULL,
  `LocalClassMeth` varchar(50) DEFAULT NULL,
  `MacrophyteCoverage` varchar(10) DEFAULT NULL,
  `Magnesium` varchar(50) DEFAULT NULL,
  `Material` varchar(50) DEFAULT NULL,
  `MaternalHealthStat` varchar(50) DEFAULT NULL,
  `MeanFrictVel` varchar(50) DEFAULT NULL,
  `MeanPeakFrictVel` varchar(50) DEFAULT NULL,
  `MechanicalDamage` varchar(50) DEFAULT NULL,
  `MedicHistPerform` bit(1) DEFAULT NULL,
  `Menarche` datetime(6) DEFAULT NULL,
  `Menopause` datetime(6) DEFAULT NULL,
  `Methane` varchar(50) DEFAULT NULL,
  `MicrobialBiomass` varchar(50) DEFAULT NULL,
  `MicrobialBiomassMeth` varchar(50) DEFAULT NULL,
  `MineralNutrRegm` varchar(50) DEFAULT NULL,
  `MiscParam` varchar(50) DEFAULT NULL,
  `nAlkanes` varchar(50) DEFAULT NULL,
  `Nitrate` varchar(50) DEFAULT NULL,
  `Nitrite` varchar(50) DEFAULT NULL,
  `Nitro` varchar(50) DEFAULT NULL,
  `NonMineralNutrRegm` varchar(50) DEFAULT NULL,
  `NoseMouthTeethThroatDisord` varchar(50) DEFAULT NULL,
  `NoseThroatDisord` varchar(50) DEFAULT NULL,
  `NumReplicons` int(11) DEFAULT NULL,
  `OccupSamp` int(11) DEFAULT NULL,
  `OccupantDensSamp` float DEFAULT NULL,
  `OrgCarb` varchar(50) DEFAULT NULL,
  `OrgMatter` varchar(50) DEFAULT NULL,
  `OrgNitro` varchar(50) DEFAULT NULL,
  `OrgParticles` varchar(50) DEFAULT NULL,
  `OrganismCount` varchar(50) DEFAULT NULL,
  `OxyStatSamp` varchar(50) DEFAULT NULL,
  `Oxygen` varchar(50) DEFAULT NULL,
  `PartOrgCarb` varchar(50) DEFAULT NULL,
  `PartOrgNitro` varchar(50) DEFAULT NULL,
  `ParticleClass` varchar(50) DEFAULT NULL,
  `Pathogenicity` varchar(50) DEFAULT NULL,
  `PeriphytonCoverage` varchar(100) DEFAULT NULL,
  `Perturbation` varchar(50) DEFAULT NULL,
  `PesticideRegm` varchar(50) DEFAULT NULL,
  `PetFarmAnimal` varchar(50) DEFAULT NULL,
  `PetroleumHydrocarb` varchar(50) DEFAULT NULL,
  `Ph` float DEFAULT NULL,
  `PhMeth` varchar(50) DEFAULT NULL,
  `PhRegm` varchar(50) DEFAULT NULL,
  `Phaeopigments` varchar(50) DEFAULT NULL,
  `Phosphate` varchar(50) DEFAULT NULL,
  `PhosplipidFattAcid` varchar(50) DEFAULT NULL,
  `PhotonFlux` varchar(50) DEFAULT NULL,
  `PlantBodySite` varchar(50) DEFAULT NULL,
  `PlantProduct` varchar(50) DEFAULT NULL,
  `Ploidy` varchar(50) DEFAULT NULL,
  `Pollutants` varchar(50) DEFAULT NULL,
  `PoolDnaExtracts` varchar(50) DEFAULT NULL,
  `Porosity` varchar(50) DEFAULT NULL,
  `Potassium` varchar(50) DEFAULT NULL,
  `PreTreatment` varchar(50) DEFAULT NULL,
  `Pregnancy` datetime(6) DEFAULT NULL,
  `Pressure` varchar(50) DEFAULT NULL,
  `PreviousLandUse` varchar(50) DEFAULT NULL,
  `PreviousLandUseMeth` varchar(50) DEFAULT NULL,
  `PrimaryProd` varchar(50) DEFAULT NULL,
  `PrimaryTreatment` varchar(50) DEFAULT NULL,
  `ProfilePosition` varchar(50) DEFAULT NULL,
  `Propagation` varchar(50) DEFAULT NULL,
  `PulmonaryDisord` varchar(50) DEFAULT NULL,
  `RadiationRegm` varchar(50) DEFAULT NULL,
  `RainfallRegm` varchar(50) DEFAULT NULL,
  `ReactorType` varchar(50) DEFAULT NULL,
  `RedoxPotential` varchar(50) DEFAULT NULL,
  `RefBiomaterial` varchar(50) DEFAULT NULL,
  `RelAirHumidity` varchar(50) DEFAULT NULL,
  `RelToOxygen` varchar(50) DEFAULT NULL,
  `RespPartMatter` varchar(50) DEFAULT NULL,
  `Salinity` varchar(50) DEFAULT NULL,
  `SalinityMeth` varchar(50) DEFAULT NULL,
  `SalmonInStream` varchar(10) DEFAULT NULL,
  `SalmonReturnStatus` varchar(15) DEFAULT NULL,
  `SaltRegm` varchar(50) DEFAULT NULL,
  `SampMatProcess` varchar(50) DEFAULT NULL,
  `SampSalinity` varchar(50) DEFAULT NULL,
  `SampSortMeth` varchar(50) DEFAULT NULL,
  `SampStoreDur` varchar(50) DEFAULT NULL,
  `SampStoreLoc` varchar(50) DEFAULT NULL,
  `SampStoreTemp` varchar(50) DEFAULT NULL,
  `SampVolWeDnaExt` varchar(50) DEFAULT NULL,
  `SampleReach` varchar(10) DEFAULT NULL,
  `SeasonEnvironment` varchar(50) DEFAULT NULL,
  `SecondaryTreatment` varchar(50) DEFAULT NULL,
  `SedimentType` varchar(50) DEFAULT NULL,
  `SewageType` varchar(50) DEFAULT NULL,
  `SexualAct` varchar(50) DEFAULT NULL,
  `Sieving` varchar(50) DEFAULT NULL,
  `Silicate` varchar(50) DEFAULT NULL,
  `SlopeAspect` varchar(50) DEFAULT NULL,
  `SlopeGradient` varchar(50) DEFAULT NULL,
  `SludgeRetentTime` varchar(50) DEFAULT NULL,
  `Smoker` bit(1) DEFAULT NULL,
  `Sodium` varchar(50) DEFAULT NULL,
  `SoilType` varchar(50) DEFAULT NULL,
  `SoilTypeMeth` varchar(50) DEFAULT NULL,
  `SolarIrradiance` varchar(50) DEFAULT NULL,
  `SolubleInorgMat` varchar(50) DEFAULT NULL,
  `SolubleOrgMat` varchar(50) DEFAULT NULL,
  `SolubleReactPhosp` varchar(50) DEFAULT NULL,
  `SpaceTypState` varchar(50) DEFAULT NULL,
  `SpecialDiet` varchar(50) DEFAULT NULL,
  `SpecificHost` varchar(50) DEFAULT NULL,
  `StandingWaterRegm` varchar(50) DEFAULT NULL,
  `StoreCond` varchar(50) DEFAULT NULL,
  `StreamsideVegetation` varchar(100) DEFAULT NULL,
  `StudyCompltStat` varchar(50) DEFAULT NULL,
  `SubspecfGenLin` varchar(50) DEFAULT NULL,
  `SubstructureType` varchar(50) DEFAULT NULL,
  `Sulfate` varchar(50) DEFAULT NULL,
  `Sulfide` varchar(50) DEFAULT NULL,
  `SurfAirCont` varchar(50) DEFAULT NULL,
  `SurfHumidity` varchar(50) DEFAULT NULL,
  `SurfMaterial` varchar(50) DEFAULT NULL,
  `SurfMoisture` varchar(50) DEFAULT NULL,
  `SurfMoisturePh` float DEFAULT NULL,
  `SurfTemp` varchar(50) DEFAULT NULL,
  `SuspendPartMatter` varchar(50) DEFAULT NULL,
  `SuspendSolids` varchar(50) DEFAULT NULL,
  `Temp` varchar(50) DEFAULT NULL,
  `TertiaryTreatment` varchar(50) DEFAULT NULL,
  `Texture` varchar(50) DEFAULT NULL,
  `TextureMeth` varchar(50) DEFAULT NULL,
  `TidalStage` varchar(50) DEFAULT NULL,
  `Tillage` varchar(50) DEFAULT NULL,
  `TimeLastToothbrush` datetime(6) DEFAULT NULL,
  `TimeSinceLastWash` datetime(6) DEFAULT NULL,
  `TissCultGrowthMed` varchar(50) DEFAULT NULL,
  `TotCarb` varchar(50) DEFAULT NULL,
  `TotDepthWaterCol` varchar(50) DEFAULT NULL,
  `TotDissNitro` varchar(50) DEFAULT NULL,
  `TotDissPhosp` varchar(50) DEFAULT NULL,
  `TotInorgNitro` varchar(50) DEFAULT NULL,
  `TotNMeth` varchar(50) DEFAULT NULL,
  `TotNitro` varchar(50) DEFAULT NULL,
  `TotOrgCMeth` varchar(50) DEFAULT NULL,
  `TotOrgCarb` varchar(50) DEFAULT NULL,
  `TotPartCarb` varchar(50) DEFAULT NULL,
  `TotPhosp` varchar(50) DEFAULT NULL,
  `TotPhosphate` varchar(50) DEFAULT NULL,
  `TotSuspendedSolids` varchar(50) DEFAULT NULL,
  `TravelOutSixMonth` varchar(50) DEFAULT NULL,
  `TrophicLevel` varchar(50) DEFAULT NULL,
  `Turbidity` varchar(50) DEFAULT NULL,
  `TwinSibling` bit(1) DEFAULT NULL,
  `TypOccupantDens` float DEFAULT NULL,
  `UrineCollectMeth` varchar(50) DEFAULT NULL,
  `UrogenitDisord` varchar(50) DEFAULT NULL,
  `UrogenitTractDisor` varchar(50) DEFAULT NULL,
  `VentilationRate` varchar(50) DEFAULT NULL,
  `VentilationType` varchar(50) DEFAULT NULL,
  `VolatileOrgComp` varchar(50) DEFAULT NULL,
  `WastewaterType` varchar(50) DEFAULT NULL,
  `WaterContent` varchar(50) DEFAULT NULL,
  `WaterContentSoilMeth` varchar(50) DEFAULT NULL,
  `WaterCurrent` varchar(50) DEFAULT NULL,
  `WaterTempRegm` varchar(50) DEFAULT NULL,
  `WateringRegm` varchar(50) DEFAULT NULL,
  `WeightLoss3Month` varchar(50) DEFAULT NULL,
  `WettedStreamWidth` varchar(10) DEFAULT NULL,
  `WindDirection` varchar(50) DEFAULT NULL,
  `WindSpeed` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`MixsSpecificationID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MixsSpecification`
--

LOCK TABLES `MixsSpecification` WRITE;
/*!40000 ALTER TABLE `MixsSpecification` DISABLE KEYS */;
/*!40000 ALTER TABLE `MixsSpecification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MixsSpecification_AUD`
--

DROP TABLE IF EXISTS `MixsSpecification_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MixsSpecification_AUD` (
  `MixsSpecificationID` int(11) NOT NULL,
  `REV` int(11) NOT NULL,
  `REVTYPE` tinyint(3) DEFAULT NULL,
  `AbsAirHumidity` varchar(50) DEFAULT NULL,
  `AgrochemAddition` varchar(50) DEFAULT NULL,
  `AirTemp` varchar(50) DEFAULT NULL,
  `AirTempRegm` varchar(50) DEFAULT NULL,
  `AlSat` varchar(50) DEFAULT NULL,
  `AlSatMeth` varchar(50) DEFAULT NULL,
  `Alkalinity` varchar(50) DEFAULT NULL,
  `AlkylDiethers` varchar(50) DEFAULT NULL,
  `AminopeptAct` varchar(50) DEFAULT NULL,
  `Ammonium` varchar(50) DEFAULT NULL,
  `AmnioticFluidColor` varchar(50) DEFAULT NULL,
  `AnnualSeasonPrecpt` varchar(100) DEFAULT NULL,
  `AnnualSeasonTemp` varchar(100) DEFAULT NULL,
  `AntibioticRegm` varchar(50) DEFAULT NULL,
  `AtmosphericData` varchar(50) DEFAULT NULL,
  `BacProd` varchar(50) DEFAULT NULL,
  `BacResp` varchar(50) DEFAULT NULL,
  `BacteriaCarbProd` varchar(50) DEFAULT NULL,
  `BankfullWettedDepth` varchar(10) DEFAULT NULL,
  `BankfullWidth` varchar(10) DEFAULT NULL,
  `BarometricPress` varchar(50) DEFAULT NULL,
  `BiochemOxygenDem` varchar(50) DEFAULT NULL,
  `Biomass` varchar(50) DEFAULT NULL,
  `Biome` varchar(50) DEFAULT NULL,
  `BioticRelationship` varchar(50) DEFAULT NULL,
  `BirthControl` varchar(50) DEFAULT NULL,
  `Bishomohopanol` varchar(50) DEFAULT NULL,
  `BloodBloodDisord` varchar(50) DEFAULT NULL,
  `Bromide` varchar(50) DEFAULT NULL,
  `BuildOccupType` varchar(50) DEFAULT NULL,
  `BuildingSetting` varchar(50) DEFAULT NULL,
  `Calcium` varchar(50) DEFAULT NULL,
  `CanopyCoverage` varchar(10) DEFAULT NULL,
  `CarbDioxide` varchar(50) DEFAULT NULL,
  `CarbMonoxide` varchar(50) DEFAULT NULL,
  `CarbNitroRatio` varchar(50) DEFAULT NULL,
  `ChemAdministration` varchar(50) DEFAULT NULL,
  `ChemMutagen` varchar(50) DEFAULT NULL,
  `ChemOxygenDem` varchar(50) DEFAULT NULL,
  `Chloride` varchar(50) DEFAULT NULL,
  `Chlorophyll` varchar(50) DEFAULT NULL,
  `ClimateEnvironment` varchar(50) DEFAULT NULL,
  `Conduc` varchar(50) DEFAULT NULL,
  `CropRotation` varchar(50) DEFAULT NULL,
  `CurLandUse` varchar(100) DEFAULT NULL,
  `CurVegetation` varchar(50) DEFAULT NULL,
  `CurVegetationMeth` varchar(50) DEFAULT NULL,
  `Density` varchar(50) DEFAULT NULL,
  `DermatologyDisord` varchar(50) DEFAULT NULL,
  `DewPoint` varchar(50) DEFAULT NULL,
  `DietLastSixMonth` varchar(50) DEFAULT NULL,
  `DietherLipids` varchar(50) DEFAULT NULL,
  `DissCarbDioxide` varchar(50) DEFAULT NULL,
  `DissHydrogen` varchar(50) DEFAULT NULL,
  `DissInorgCarb` varchar(50) DEFAULT NULL,
  `DissInorgNitro` varchar(50) DEFAULT NULL,
  `DissInorgPhosp` varchar(50) DEFAULT NULL,
  `DissOrgCarb` varchar(50) DEFAULT NULL,
  `DissOrgNitro` varchar(50) DEFAULT NULL,
  `DissOxygen` varchar(50) DEFAULT NULL,
  `DominantHand` varchar(50) DEFAULT NULL,
  `DominantLandUse` varchar(100) DEFAULT NULL,
  `DominantStreamsideVegetation` varchar(100) DEFAULT NULL,
  `Douche` datetime(6) DEFAULT NULL,
  `DownPar` varchar(50) DEFAULT NULL,
  `DrainageClass` varchar(50) DEFAULT NULL,
  `DrugUsage` varchar(50) DEFAULT NULL,
  `EColi` varchar(50) DEFAULT NULL,
  `EfficiencyPercent` varchar(50) DEFAULT NULL,
  `Emulsions` varchar(50) DEFAULT NULL,
  `EncodedTraits` varchar(50) DEFAULT NULL,
  `EnvPackage` varchar(50) DEFAULT NULL,
  `EstimatedSize` varchar(50) DEFAULT NULL,
  `ExperimentalFactor` varchar(50) DEFAULT NULL,
  `ExtrachromElements` varchar(50) DEFAULT NULL,
  `ExtremeEvent` datetime(6) DEFAULT NULL,
  `ExtremeSalinity` varchar(100) DEFAULT NULL,
  `FaoClass` varchar(50) DEFAULT NULL,
  `Feature` varchar(50) DEFAULT NULL,
  `FertilizerRegm` varchar(50) DEFAULT NULL,
  `FilterType` varchar(50) DEFAULT NULL,
  `Fire` datetime(6) DEFAULT NULL,
  `FishKillEventInfo` varchar(100) DEFAULT NULL,
  `Flooding` datetime(6) DEFAULT NULL,
  `Fluor` varchar(50) DEFAULT NULL,
  `FoetalHealthStat` varchar(50) DEFAULT NULL,
  `FungicideRegm` varchar(50) DEFAULT NULL,
  `GaseousEnvironment` varchar(50) DEFAULT NULL,
  `GaseousSubstances` varchar(50) DEFAULT NULL,
  `GastrointestDisord` varchar(50) DEFAULT NULL,
  `GestationState` varchar(50) DEFAULT NULL,
  `GlucosidaseAct` varchar(50) DEFAULT NULL,
  `Gravidity` varchar(50) DEFAULT NULL,
  `Gravity` varchar(50) DEFAULT NULL,
  `GrowthHormoneRegm` varchar(50) DEFAULT NULL,
  `GrowthMed` varchar(50) DEFAULT NULL,
  `GynecologicDisord` varchar(50) DEFAULT NULL,
  `HealthDiseaseStat` varchar(50) DEFAULT NULL,
  `HeatCoolType` varchar(50) DEFAULT NULL,
  `HeavyMetals` varchar(50) DEFAULT NULL,
  `HeavyMetalsMeth` varchar(50) DEFAULT NULL,
  `HerbicideRegm` varchar(50) DEFAULT NULL,
  `Horizon` varchar(50) DEFAULT NULL,
  `HorizonMeth` varchar(50) DEFAULT NULL,
  `HostAge` varchar(50) DEFAULT NULL,
  `HostBloodPressDiast` varchar(50) DEFAULT NULL,
  `HostBloodPressSyst` varchar(50) DEFAULT NULL,
  `HostBodyHabitat` varchar(50) DEFAULT NULL,
  `HostBodyMassIndex` varchar(50) DEFAULT NULL,
  `HostBodyProduct` varchar(50) DEFAULT NULL,
  `HostBodySite` varchar(50) DEFAULT NULL,
  `HostBodyTemp` varchar(50) DEFAULT NULL,
  `HostColor` varchar(50) DEFAULT NULL,
  `HostCommonName` varchar(50) DEFAULT NULL,
  `HostDiet` varchar(50) DEFAULT NULL,
  `HostDiseaseStat` varchar(50) DEFAULT NULL,
  `HostDryMass` varchar(50) DEFAULT NULL,
  `HostFamilyRelationship` varchar(50) DEFAULT NULL,
  `HostGenotype` varchar(50) DEFAULT NULL,
  `HostGrowthCond` varchar(50) DEFAULT NULL,
  `HostHeight` varchar(50) DEFAULT NULL,
  `HostHivStat` varchar(50) DEFAULT NULL,
  `HostInfraSpecificName` varchar(50) DEFAULT NULL,
  `HostInfraSpecificRank` varchar(50) DEFAULT NULL,
  `HostLastMeal` varchar(50) DEFAULT NULL,
  `HostLength` varchar(50) DEFAULT NULL,
  `HostLifeStage` varchar(50) DEFAULT NULL,
  `HostOccupation` int(11) DEFAULT NULL,
  `HostPhenotype` varchar(50) DEFAULT NULL,
  `HostPulse` varchar(50) DEFAULT NULL,
  `HostSex` varchar(50) DEFAULT NULL,
  `HostShape` varchar(50) DEFAULT NULL,
  `HostSubjectId` varchar(50) DEFAULT NULL,
  `HostSubstrate` varchar(50) DEFAULT NULL,
  `HostTaxid` int(11) DEFAULT NULL,
  `HostTotMass` varchar(50) DEFAULT NULL,
  `HostWetMass` varchar(50) DEFAULT NULL,
  `Hrt` datetime(6) DEFAULT NULL,
  `Humidity` varchar(50) DEFAULT NULL,
  `HumidityRegm` varchar(50) DEFAULT NULL,
  `Hysterectomy` bit(1) DEFAULT NULL,
  `IhmcEthnicity` varchar(50) DEFAULT NULL,
  `IhmcMedicationCode` int(11) DEFAULT NULL,
  `IndoorSpace` varchar(50) DEFAULT NULL,
  `IndoorSurf` varchar(50) DEFAULT NULL,
  `IndustEffPercent` varchar(50) DEFAULT NULL,
  `InorgParticles` varchar(50) DEFAULT NULL,
  `InvestigationType` varchar(20) DEFAULT NULL,
  `IsolGrowthCondt` varchar(50) DEFAULT NULL,
  `KidneyDisord` varchar(50) DEFAULT NULL,
  `LightIntensity` varchar(50) DEFAULT NULL,
  `LightType` varchar(50) DEFAULT NULL,
  `LinkAdditAnalys` varchar(50) DEFAULT NULL,
  `LinkClassInfo` varchar(250) DEFAULT NULL,
  `LinkClimateInfo` varchar(250) DEFAULT NULL,
  `LiverDisord` varchar(50) DEFAULT NULL,
  `LocalClass` varchar(50) DEFAULT NULL,
  `LocalClassMeth` varchar(50) DEFAULT NULL,
  `MacrophyteCoverage` varchar(10) DEFAULT NULL,
  `Magnesium` varchar(50) DEFAULT NULL,
  `Material` varchar(50) DEFAULT NULL,
  `MaternalHealthStat` varchar(50) DEFAULT NULL,
  `MeanFrictVel` varchar(50) DEFAULT NULL,
  `MeanPeakFrictVel` varchar(50) DEFAULT NULL,
  `MechanicalDamage` varchar(50) DEFAULT NULL,
  `MedicHistPerform` bit(1) DEFAULT NULL,
  `Menarche` datetime(6) DEFAULT NULL,
  `Menopause` datetime(6) DEFAULT NULL,
  `Methane` varchar(50) DEFAULT NULL,
  `MicrobialBiomass` varchar(50) DEFAULT NULL,
  `MicrobialBiomassMeth` varchar(50) DEFAULT NULL,
  `MineralNutrRegm` varchar(50) DEFAULT NULL,
  `MiscParam` varchar(50) DEFAULT NULL,
  `nAlkanes` varchar(50) DEFAULT NULL,
  `Nitrate` varchar(50) DEFAULT NULL,
  `Nitrite` varchar(50) DEFAULT NULL,
  `Nitro` varchar(50) DEFAULT NULL,
  `NonMineralNutrRegm` varchar(50) DEFAULT NULL,
  `NoseMouthTeethThroatDisord` varchar(50) DEFAULT NULL,
  `NoseThroatDisord` varchar(50) DEFAULT NULL,
  `NumReplicons` int(11) DEFAULT NULL,
  `OccupSamp` int(11) DEFAULT NULL,
  `OccupantDensSamp` float DEFAULT NULL,
  `OrgCarb` varchar(50) DEFAULT NULL,
  `OrgMatter` varchar(50) DEFAULT NULL,
  `OrgNitro` varchar(50) DEFAULT NULL,
  `OrgParticles` varchar(50) DEFAULT NULL,
  `OrganismCount` varchar(50) DEFAULT NULL,
  `OxyStatSamp` varchar(50) DEFAULT NULL,
  `Oxygen` varchar(50) DEFAULT NULL,
  `PartOrgCarb` varchar(50) DEFAULT NULL,
  `PartOrgNitro` varchar(50) DEFAULT NULL,
  `ParticleClass` varchar(50) DEFAULT NULL,
  `Pathogenicity` varchar(50) DEFAULT NULL,
  `PeriphytonCoverage` varchar(100) DEFAULT NULL,
  `Perturbation` varchar(50) DEFAULT NULL,
  `PesticideRegm` varchar(50) DEFAULT NULL,
  `PetFarmAnimal` varchar(50) DEFAULT NULL,
  `PetroleumHydrocarb` varchar(50) DEFAULT NULL,
  `Ph` float DEFAULT NULL,
  `PhMeth` varchar(50) DEFAULT NULL,
  `PhRegm` varchar(50) DEFAULT NULL,
  `Phaeopigments` varchar(50) DEFAULT NULL,
  `Phosphate` varchar(50) DEFAULT NULL,
  `PhosplipidFattAcid` varchar(50) DEFAULT NULL,
  `PhotonFlux` varchar(50) DEFAULT NULL,
  `PlantBodySite` varchar(50) DEFAULT NULL,
  `PlantProduct` varchar(50) DEFAULT NULL,
  `Ploidy` varchar(50) DEFAULT NULL,
  `Pollutants` varchar(50) DEFAULT NULL,
  `PoolDnaExtracts` varchar(50) DEFAULT NULL,
  `Porosity` varchar(50) DEFAULT NULL,
  `Potassium` varchar(50) DEFAULT NULL,
  `PreTreatment` varchar(50) DEFAULT NULL,
  `Pregnancy` datetime(6) DEFAULT NULL,
  `Pressure` varchar(50) DEFAULT NULL,
  `PreviousLandUse` varchar(50) DEFAULT NULL,
  `PreviousLandUseMeth` varchar(50) DEFAULT NULL,
  `PrimaryProd` varchar(50) DEFAULT NULL,
  `PrimaryTreatment` varchar(50) DEFAULT NULL,
  `ProfilePosition` varchar(50) DEFAULT NULL,
  `Propagation` varchar(50) DEFAULT NULL,
  `PulmonaryDisord` varchar(50) DEFAULT NULL,
  `RadiationRegm` varchar(50) DEFAULT NULL,
  `RainfallRegm` varchar(50) DEFAULT NULL,
  `ReactorType` varchar(50) DEFAULT NULL,
  `RedoxPotential` varchar(50) DEFAULT NULL,
  `RefBiomaterial` varchar(50) DEFAULT NULL,
  `RelAirHumidity` varchar(50) DEFAULT NULL,
  `RelToOxygen` varchar(50) DEFAULT NULL,
  `RespPartMatter` varchar(50) DEFAULT NULL,
  `Salinity` varchar(50) DEFAULT NULL,
  `SalinityMeth` varchar(50) DEFAULT NULL,
  `SalmonInStream` varchar(10) DEFAULT NULL,
  `SalmonReturnStatus` varchar(15) DEFAULT NULL,
  `SaltRegm` varchar(50) DEFAULT NULL,
  `SampMatProcess` varchar(50) DEFAULT NULL,
  `SampSalinity` varchar(50) DEFAULT NULL,
  `SampSortMeth` varchar(50) DEFAULT NULL,
  `SampStoreDur` varchar(50) DEFAULT NULL,
  `SampStoreLoc` varchar(50) DEFAULT NULL,
  `SampStoreTemp` varchar(50) DEFAULT NULL,
  `SampVolWeDnaExt` varchar(50) DEFAULT NULL,
  `SampleReach` varchar(10) DEFAULT NULL,
  `SeasonEnvironment` varchar(50) DEFAULT NULL,
  `SecondaryTreatment` varchar(50) DEFAULT NULL,
  `SedimentType` varchar(50) DEFAULT NULL,
  `SewageType` varchar(50) DEFAULT NULL,
  `SexualAct` varchar(50) DEFAULT NULL,
  `Sieving` varchar(50) DEFAULT NULL,
  `Silicate` varchar(50) DEFAULT NULL,
  `SlopeAspect` varchar(50) DEFAULT NULL,
  `SlopeGradient` varchar(50) DEFAULT NULL,
  `SludgeRetentTime` varchar(50) DEFAULT NULL,
  `Smoker` bit(1) DEFAULT NULL,
  `Sodium` varchar(50) DEFAULT NULL,
  `SoilType` varchar(50) DEFAULT NULL,
  `SoilTypeMeth` varchar(50) DEFAULT NULL,
  `SolarIrradiance` varchar(50) DEFAULT NULL,
  `SolubleInorgMat` varchar(50) DEFAULT NULL,
  `SolubleOrgMat` varchar(50) DEFAULT NULL,
  `SolubleReactPhosp` varchar(50) DEFAULT NULL,
  `SpaceTypState` varchar(50) DEFAULT NULL,
  `SpecialDiet` varchar(50) DEFAULT NULL,
  `SpecificHost` varchar(50) DEFAULT NULL,
  `StandingWaterRegm` varchar(50) DEFAULT NULL,
  `StoreCond` varchar(50) DEFAULT NULL,
  `StreamsideVegetation` varchar(100) DEFAULT NULL,
  `StudyCompltStat` varchar(50) DEFAULT NULL,
  `SubspecfGenLin` varchar(50) DEFAULT NULL,
  `SubstructureType` varchar(50) DEFAULT NULL,
  `Sulfate` varchar(50) DEFAULT NULL,
  `Sulfide` varchar(50) DEFAULT NULL,
  `SurfAirCont` varchar(50) DEFAULT NULL,
  `SurfHumidity` varchar(50) DEFAULT NULL,
  `SurfMaterial` varchar(50) DEFAULT NULL,
  `SurfMoisture` varchar(50) DEFAULT NULL,
  `SurfMoisturePh` float DEFAULT NULL,
  `SurfTemp` varchar(50) DEFAULT NULL,
  `SuspendPartMatter` varchar(50) DEFAULT NULL,
  `SuspendSolids` varchar(50) DEFAULT NULL,
  `Temp` varchar(50) DEFAULT NULL,
  `TertiaryTreatment` varchar(50) DEFAULT NULL,
  `Texture` varchar(50) DEFAULT NULL,
  `TextureMeth` varchar(50) DEFAULT NULL,
  `TidalStage` varchar(50) DEFAULT NULL,
  `Tillage` varchar(50) DEFAULT NULL,
  `TimeLastToothbrush` datetime(6) DEFAULT NULL,
  `TimeSinceLastWash` datetime(6) DEFAULT NULL,
  `TissCultGrowthMed` varchar(50) DEFAULT NULL,
  `TotCarb` varchar(50) DEFAULT NULL,
  `TotDepthWaterCol` varchar(50) DEFAULT NULL,
  `TotDissNitro` varchar(50) DEFAULT NULL,
  `TotDissPhosp` varchar(50) DEFAULT NULL,
  `TotInorgNitro` varchar(50) DEFAULT NULL,
  `TotNMeth` varchar(50) DEFAULT NULL,
  `TotNitro` varchar(50) DEFAULT NULL,
  `TotOrgCMeth` varchar(50) DEFAULT NULL,
  `TotOrgCarb` varchar(50) DEFAULT NULL,
  `TotPartCarb` varchar(50) DEFAULT NULL,
  `TotPhosp` varchar(50) DEFAULT NULL,
  `TotPhosphate` varchar(50) DEFAULT NULL,
  `TotSuspendedSolids` varchar(50) DEFAULT NULL,
  `TravelOutSixMonth` varchar(50) DEFAULT NULL,
  `TrophicLevel` varchar(50) DEFAULT NULL,
  `Turbidity` varchar(50) DEFAULT NULL,
  `TwinSibling` bit(1) DEFAULT NULL,
  `TypOccupantDens` float DEFAULT NULL,
  `UrineCollectMeth` varchar(50) DEFAULT NULL,
  `UrogenitDisord` varchar(50) DEFAULT NULL,
  `UrogenitTractDisor` varchar(50) DEFAULT NULL,
  `VentilationRate` varchar(50) DEFAULT NULL,
  `VentilationType` varchar(50) DEFAULT NULL,
  `VolatileOrgComp` varchar(50) DEFAULT NULL,
  `WastewaterType` varchar(50) DEFAULT NULL,
  `WaterContent` varchar(50) DEFAULT NULL,
  `WaterContentSoilMeth` varchar(50) DEFAULT NULL,
  `WaterCurrent` varchar(50) DEFAULT NULL,
  `WaterTempRegm` varchar(50) DEFAULT NULL,
  `WateringRegm` varchar(50) DEFAULT NULL,
  `WeightLoss3Month` varchar(50) DEFAULT NULL,
  `WettedStreamWidth` varchar(10) DEFAULT NULL,
  `WindDirection` varchar(50) DEFAULT NULL,
  `WindSpeed` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`MixsSpecificationID`,`REV`),
  KEY `FK_bva1xtoa70un4afj9pihokk84` (`REV`),
  CONSTRAINT `FK_bva1xtoa70un4afj9pihokk84` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MixsSpecification_AUD`
--

LOCK TABLES `MixsSpecification_AUD` WRITE;
/*!40000 ALTER TABLE `MixsSpecification_AUD` DISABLE KEYS */;
/*!40000 ALTER TABLE `MixsSpecification_AUD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PcrBatchAttach`
--

DROP TABLE IF EXISTS `PcrBatchAttach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PcrBatchAttach` (
  `PcrBatchAttachId` int(11) NOT NULL AUTO_INCREMENT,
  `DateEntered` date NOT NULL,
  `FileExtension` varchar(255) DEFAULT NULL,
  `FileName` varchar(255) NOT NULL,
  `FileTitle` varchar(255) DEFAULT NULL,
  `Height` int(11) DEFAULT NULL,
  `Location` varchar(255) NOT NULL,
  `Notes` varchar(1024) DEFAULT NULL,
  `Width` int(11) DEFAULT NULL,
  `PcrBatchId` int(11) NOT NULL,
  PRIMARY KEY (`PcrBatchAttachId`),
  KEY `FK_i1hvqhm5h2qb9xbijcvcjkksn` (`PcrBatchId`),
  CONSTRAINT `FK_i1hvqhm5h2qb9xbijcvcjkksn` FOREIGN KEY (`PcrBatchId`) REFERENCES `PcrBatchs` (`PCRBatchID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PcrBatchAttach`
--

LOCK TABLES `PcrBatchAttach` WRITE;
/*!40000 ALTER TABLE `PcrBatchAttach` DISABLE KEYS */;
/*!40000 ALTER TABLE `PcrBatchAttach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PcrBatchs`
--

DROP TABLE IF EXISTS `PcrBatchs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PcrBatchs` (
  `PCRBatchID` int(11) NOT NULL AUTO_INCREMENT,
  `CleanUpDate` date DEFAULT NULL,
  `CleanUpMethod` varchar(100) DEFAULT NULL,
  `CleanUpPlateId` varchar(50) DEFAULT NULL,
  `DnaDilution` varchar(50) DEFAULT NULL,
  `Experimenter` varchar(50) DEFAULT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `Name` varchar(50) NOT NULL,
  `NormalizationMethod` varchar(100) DEFAULT NULL,
  `NormalizationPlateId` varchar(50) DEFAULT NULL,
  `NormalizedConcentration` varchar(20) DEFAULT NULL,
  `Notes` longtext,
  `Objective` varchar(200) DEFAULT NULL,
  `PcrPoolingNumber` varchar(50) DEFAULT NULL,
  `PlateSize` varchar(255) NOT NULL,
  `Polymerase` varchar(50) DEFAULT NULL,
  `Pooled` bit(1) DEFAULT NULL,
  `PositiveControl` varchar(50) DEFAULT NULL,
  `Project` varchar(50) DEFAULT NULL,
  `Purification` varchar(50) DEFAULT NULL,
  `QuantificationMethod` varchar(100) DEFAULT NULL,
  `ReactionDate` date DEFAULT NULL,
  `ReactionVolume` varchar(50) DEFAULT NULL,
  `Reference` varchar(200) DEFAULT NULL,
  `Result` longtext,
  `Thermocycler` varchar(50) DEFAULT NULL,
  `Type` varchar(255) NOT NULL,
  `GroupID` int(11) DEFAULT NULL,
  `PCRProfileID` int(11) DEFAULT NULL,
  `PrimerForwardID` int(11) DEFAULT NULL,
  `PrimerReverseID` int(11) DEFAULT NULL,
  `ProtocolID` int(11) DEFAULT NULL,
  `RegionID` int(11) DEFAULT NULL,
  `Round2BatchID` int(11) DEFAULT NULL,
  `SeqSubmissionID` int(11) DEFAULT NULL,
  PRIMARY KEY (`PCRBatchID`),
  UNIQUE KEY `UK_dltslxx4u78lx3eoye0rgfiqu` (`Name`,`GroupID`),
  KEY `FK_190on7fv02cyhhqqbtynwmcfb` (`GroupID`),
  KEY `FK_4c30viwryqtx91qdsp81emqa` (`RegionID`),
  KEY `FK_5ox5bp4jaw3po3u184kff1sul` (`Round2BatchID`),
  KEY `FK_5xrpd7j1ifhcveugmvivsy9j4` (`PrimerForwardID`),
  KEY `FK_iyhmua5d43idxmrqwa6mt1mmx` (`PCRProfileID`),
  KEY `FK_knhujokmet0ew9isorewoouim` (`SeqSubmissionID`),
  KEY `FK_qsywx3kn4haf7fb0fal1ko4sd` (`PrimerReverseID`),
  KEY `FK_tkxk7kxmhav5jejmldunlthm2` (`ProtocolID`),
  CONSTRAINT `FK_190on7fv02cyhhqqbtynwmcfb` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_4c30viwryqtx91qdsp81emqa` FOREIGN KEY (`RegionID`) REFERENCES `Regions` (`TagID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_5ox5bp4jaw3po3u184kff1sul` FOREIGN KEY (`Round2BatchID`) REFERENCES `PcrBatchs` (`PCRBatchID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_5xrpd7j1ifhcveugmvivsy9j4` FOREIGN KEY (`PrimerForwardID`) REFERENCES `PcrPrimers` (`PCRPrimerID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_iyhmua5d43idxmrqwa6mt1mmx` FOREIGN KEY (`PCRProfileID`) REFERENCES `PcrProfiles` (`PCRProfileID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_knhujokmet0ew9isorewoouim` FOREIGN KEY (`SeqSubmissionID`) REFERENCES `SeqSubmissions` (`SeqSubmissionID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_qsywx3kn4haf7fb0fal1ko4sd` FOREIGN KEY (`PrimerReverseID`) REFERENCES `PcrPrimers` (`PCRPrimerID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tkxk7kxmhav5jejmldunlthm2` FOREIGN KEY (`ProtocolID`) REFERENCES `Protocols` (`ProtocolID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PcrBatchs`
--

LOCK TABLES `PcrBatchs` WRITE;
/*!40000 ALTER TABLE `PcrBatchs` DISABLE KEYS */;
/*!40000 ALTER TABLE `PcrBatchs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PcrBatchs_AUD`
--

DROP TABLE IF EXISTS `PcrBatchs_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PcrBatchs_AUD` (
  `PCRBatchID` int(11) NOT NULL,
  `REV` int(11) NOT NULL,
  `REVTYPE` tinyint(3) DEFAULT NULL,
  `CleanUpDate` date DEFAULT NULL,
  `CleanUpMethod` varchar(100) DEFAULT NULL,
  `CleanUpPlateId` varchar(50) DEFAULT NULL,
  `DnaDilution` varchar(50) DEFAULT NULL,
  `Experimenter` varchar(50) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `NormalizationMethod` varchar(100) DEFAULT NULL,
  `NormalizationPlateId` varchar(50) DEFAULT NULL,
  `NormalizedConcentration` varchar(20) DEFAULT NULL,
  `Notes` longtext,
  `Objective` varchar(200) DEFAULT NULL,
  `PcrPoolingNumber` varchar(50) DEFAULT NULL,
  `PlateSize` varchar(255) DEFAULT NULL,
  `Polymerase` varchar(50) DEFAULT NULL,
  `Pooled` bit(1) DEFAULT NULL,
  `PositiveControl` varchar(50) DEFAULT NULL,
  `Project` varchar(50) DEFAULT NULL,
  `Purification` varchar(50) DEFAULT NULL,
  `QuantificationMethod` varchar(100) DEFAULT NULL,
  `ReactionDate` date DEFAULT NULL,
  `ReactionVolume` varchar(50) DEFAULT NULL,
  `Reference` varchar(200) DEFAULT NULL,
  `Result` longtext,
  `Thermocycler` varchar(50) DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  `PCRProfileID` int(11) DEFAULT NULL,
  `PrimerForwardID` int(11) DEFAULT NULL,
  `PrimerReverseID` int(11) DEFAULT NULL,
  `ProtocolID` int(11) DEFAULT NULL,
  `RegionID` int(11) DEFAULT NULL,
  `Round2BatchID` int(11) DEFAULT NULL,
  `SeqSubmissionID` int(11) DEFAULT NULL,
  PRIMARY KEY (`PCRBatchID`,`REV`),
  KEY `FK_djmx4xysiut1o4y0p87bgcp95` (`REV`),
  CONSTRAINT `FK_djmx4xysiut1o4y0p87bgcp95` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PcrBatchs_AUD`
--

LOCK TABLES `PcrBatchs_AUD` WRITE;
/*!40000 ALTER TABLE `PcrBatchs_AUD` DISABLE KEYS */;
/*!40000 ALTER TABLE `PcrBatchs_AUD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PcrPrimers`
--

DROP TABLE IF EXISTS `PcrPrimers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PcrPrimers` (
  `PCRPrimerID` int(11) NOT NULL AUTO_INCREMENT,
  `Application` varchar(200) DEFAULT NULL,
  `DateDestroyed` date DEFAULT NULL,
  `DateOrdered` date DEFAULT NULL,
  `DesignDate` date DEFAULT NULL,
  `DesignedBy` varchar(50) DEFAULT NULL,
  `Direction` varchar(1) DEFAULT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `LitReference` varchar(512) DEFAULT NULL,
  `LotNumber` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Note` varchar(1024) DEFAULT NULL,
  `Position` varchar(10) DEFAULT NULL,
  `Purification` varchar(50) DEFAULT NULL,
  `Reference` longtext,
  `ReferenceSeqDir` varchar(255) DEFAULT NULL,
  `ReferenceSeqFile` varchar(50) DEFAULT NULL,
  `RestrictionSite` longtext,
  `Seq` varchar(255) NOT NULL DEFAULT '',
  `SequenceLength` varchar(50) DEFAULT NULL,
  `StockConcentration` varchar(10) DEFAULT NULL,
  `Storage` varchar(50) DEFAULT NULL,
  `Supplier` varchar(50) DEFAULT NULL,
  `TargetSpecies` varchar(50) DEFAULT NULL,
  `TmCalculated` varchar(11) DEFAULT NULL,
  `TmPE` int(11) DEFAULT NULL,
  `Type` varchar(255) NOT NULL,
  `URLLink` longtext,
  `Used4Cloning` bit(1) DEFAULT NULL,
  `Used4Genotyping` bit(1) DEFAULT NULL,
  `Used4NestedPCR` bit(1) DEFAULT NULL,
  `Used4QRTPCR` bit(1) DEFAULT NULL,
  `Used4Sequencing` bit(1) DEFAULT NULL,
  `Used4StdPCR` bit(1) DEFAULT NULL,
  `Version` int(11) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  `DesignedByID` int(11) DEFAULT NULL,
  `PCRCieContactID` int(11) DEFAULT NULL,
  `RegionID` int(11) DEFAULT NULL,
  `PooledPrimerID` int(11) DEFAULT NULL,
  PRIMARY KEY (`PCRPrimerID`),
  UNIQUE KEY `UK_duh2h6r8djyl9i4qael9wfu9w` (`Name`,`LotNumber`,`GroupID`),
  KEY `FK_4anag2k5y8odmss8vru2hprag` (`DesignedByID`),
  KEY `FK_d5ldlywy1pp43lba8ciyyx1us` (`RegionID`),
  KEY `FK_j7w8lp16p2plapfkw12sxn561` (`PCRCieContactID`),
  KEY `FK_libscfvci046fww5lgwxqauh5` (`GroupID`),
  KEY `FK_gkgdsum1o21h1sdtib9nwecd5` (`PooledPrimerID`),
  CONSTRAINT `FK_4anag2k5y8odmss8vru2hprag` FOREIGN KEY (`DesignedByID`) REFERENCES `People` (`PeopleID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_d5ldlywy1pp43lba8ciyyx1us` FOREIGN KEY (`RegionID`) REFERENCES `Regions` (`TagID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_gkgdsum1o21h1sdtib9nwecd5` FOREIGN KEY (`PooledPrimerID`) REFERENCES `PcrPrimers` (`PCRPrimerID`),
  CONSTRAINT `FK_j7w8lp16p2plapfkw12sxn561` FOREIGN KEY (`PCRCieContactID`) REFERENCES `People` (`PeopleID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_libscfvci046fww5lgwxqauh5` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PcrPrimers`
--

LOCK TABLES `PcrPrimers` WRITE;
/*!40000 ALTER TABLE `PcrPrimers` DISABLE KEYS */;
/*!40000 ALTER TABLE `PcrPrimers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PcrPrimers_AUD`
--

DROP TABLE IF EXISTS `PcrPrimers_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PcrPrimers_AUD` (
  `PCRPrimerID` int(11) NOT NULL,
  `REV` int(11) NOT NULL,
  `REVTYPE` tinyint(3) DEFAULT NULL,
  `Application` varchar(200) DEFAULT NULL,
  `DateDestroyed` date DEFAULT NULL,
  `DateOrdered` date DEFAULT NULL,
  `DesignDate` date DEFAULT NULL,
  `DesignedBy` varchar(50) DEFAULT NULL,
  `Direction` varchar(1) DEFAULT NULL,
  `LitReference` varchar(512) DEFAULT NULL,
  `LotNumber` int(11) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Note` varchar(1024) DEFAULT NULL,
  `Position` varchar(10) DEFAULT NULL,
  `Purification` varchar(50) DEFAULT NULL,
  `Reference` longtext,
  `ReferenceSeqDir` varchar(255) DEFAULT NULL,
  `ReferenceSeqFile` varchar(50) DEFAULT NULL,
  `RestrictionSite` longtext,
  `Seq` varchar(255) DEFAULT '',
  `SequenceLength` varchar(50) DEFAULT NULL,
  `StockConcentration` varchar(10) DEFAULT NULL,
  `Storage` varchar(50) DEFAULT NULL,
  `Supplier` varchar(50) DEFAULT NULL,
  `TargetSpecies` varchar(50) DEFAULT NULL,
  `TmCalculated` varchar(11) DEFAULT NULL,
  `TmPE` int(11) DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `URLLink` longtext,
  `Used4Cloning` bit(1) DEFAULT NULL,
  `Used4Genotyping` bit(1) DEFAULT NULL,
  `Used4NestedPCR` bit(1) DEFAULT NULL,
  `Used4QRTPCR` bit(1) DEFAULT NULL,
  `Used4Sequencing` bit(1) DEFAULT NULL,
  `Used4StdPCR` bit(1) DEFAULT NULL,
  `Version` int(11) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  `DesignedByID` int(11) DEFAULT NULL,
  `PCRCieContactID` int(11) DEFAULT NULL,
  `RegionID` int(11) DEFAULT NULL,
  `PooledPrimerID` int(11) DEFAULT NULL,
  PRIMARY KEY (`PCRPrimerID`,`REV`),
  KEY `FK_7frxhwqxndu6ggu0pf8m33e1d` (`REV`),
  CONSTRAINT `FK_7frxhwqxndu6ggu0pf8m33e1d` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PcrPrimers_AUD`
--

LOCK TABLES `PcrPrimers_AUD` WRITE;
/*!40000 ALTER TABLE `PcrPrimers_AUD` DISABLE KEYS */;
/*!40000 ALTER TABLE `PcrPrimers_AUD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PcrProfiles`
--

DROP TABLE IF EXISTS `PcrProfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PcrProfiles` (
  `PCRProfileID` int(11) NOT NULL AUTO_INCREMENT,
  `Application` varchar(1024) DEFAULT NULL,
  `Cycles` varchar(50) DEFAULT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `Name` varchar(50) NOT NULL,
  `Step1` varchar(50) DEFAULT NULL,
  `Step10` varchar(50) DEFAULT NULL,
  `Step11` varchar(50) DEFAULT NULL,
  `Step12` varchar(50) DEFAULT NULL,
  `Step13` varchar(50) DEFAULT NULL,
  `Step14` varchar(50) DEFAULT NULL,
  `Step15` varchar(50) DEFAULT NULL,
  `Step2` varchar(50) DEFAULT NULL,
  `Step3` varchar(50) DEFAULT NULL,
  `Step4` varchar(50) DEFAULT NULL,
  `Step5` varchar(50) DEFAULT NULL,
  `Step6` varchar(50) DEFAULT NULL,
  `Step7` varchar(50) DEFAULT NULL,
  `Step8` varchar(50) DEFAULT NULL,
  `Step9` varchar(50) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  `RegionID` int(11) DEFAULT NULL,
  PRIMARY KEY (`PCRProfileID`),
  UNIQUE KEY `UK_7sa4mdiir7g4x2bcydhd5r9w2` (`Name`,`GroupID`),
  KEY `FK_8inqadrodpjw8h6jun9r19u20` (`RegionID`),
  KEY `FK_g9ndujio1cprdfv1vxr25h6r4` (`GroupID`),
  CONSTRAINT `FK_8inqadrodpjw8h6jun9r19u20` FOREIGN KEY (`RegionID`) REFERENCES `Regions` (`TagID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_g9ndujio1cprdfv1vxr25h6r4` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PcrProfiles`
--

LOCK TABLES `PcrProfiles` WRITE;
/*!40000 ALTER TABLE `PcrProfiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `PcrProfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PcrProfiles_AUD`
--

DROP TABLE IF EXISTS `PcrProfiles_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PcrProfiles_AUD` (
  `PCRProfileID` int(11) NOT NULL,
  `REV` int(11) NOT NULL,
  `REVTYPE` tinyint(3) DEFAULT NULL,
  `Application` varchar(1024) DEFAULT NULL,
  `Cycles` varchar(50) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Step1` varchar(50) DEFAULT NULL,
  `Step10` varchar(50) DEFAULT NULL,
  `Step11` varchar(50) DEFAULT NULL,
  `Step12` varchar(50) DEFAULT NULL,
  `Step13` varchar(50) DEFAULT NULL,
  `Step14` varchar(50) DEFAULT NULL,
  `Step15` varchar(50) DEFAULT NULL,
  `Step2` varchar(50) DEFAULT NULL,
  `Step3` varchar(50) DEFAULT NULL,
  `Step4` varchar(50) DEFAULT NULL,
  `Step5` varchar(50) DEFAULT NULL,
  `Step6` varchar(50) DEFAULT NULL,
  `Step7` varchar(50) DEFAULT NULL,
  `Step8` varchar(50) DEFAULT NULL,
  `Step9` varchar(50) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  `RegionID` int(11) DEFAULT NULL,
  PRIMARY KEY (`PCRProfileID`,`REV`),
  KEY `FK_dftsxppl9qolmnbp96t2vyf4s` (`REV`),
  CONSTRAINT `FK_dftsxppl9qolmnbp96t2vyf4s` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PcrProfiles_AUD`
--

LOCK TABLES `PcrProfiles_AUD` WRITE;
/*!40000 ALTER TABLE `PcrProfiles_AUD` DISABLE KEYS */;
/*!40000 ALTER TABLE `PcrProfiles_AUD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PcrReactions`
--

DROP TABLE IF EXISTS `PcrReactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PcrReactions` (
  `PcrReactionID` int(11) NOT NULL AUTO_INCREMENT,
  `CleanUpPlateCoordinates` varchar(5) DEFAULT NULL,
  `FinalConcentration` varchar(50) DEFAULT NULL,
  `FinalQuality` varchar(50) DEFAULT NULL,
  `ImageDir` varchar(255) DEFAULT NULL,
  `ImageName` varchar(50) DEFAULT NULL,
  `IndexSet` varchar(50) DEFAULT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `LocEnd` int(11) DEFAULT NULL,
  `LocStart` int(11) DEFAULT NULL,
  `NormalizationCoordinates` varchar(5) DEFAULT NULL,
  `Note` longtext,
  `PcrName` varchar(50) DEFAULT NULL,
  `Result` longtext,
  `Target` varchar(50) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  `MID` int(11) DEFAULT NULL,
  `PCRBatchID` int(11) NOT NULL,
  `PrimerForwardID` int(11) DEFAULT NULL,
  `PrimerReverseID` int(11) DEFAULT NULL,
  `RegionID` int(11) DEFAULT NULL,
  `Round1ReactionID` int(11) DEFAULT NULL,
  `SampleID` int(11) DEFAULT NULL,
  PRIMARY KEY (`PcrReactionID`),
  UNIQUE KEY `UK_r6twnrc5jjmfcou6ga115bs9n` (`PcrName`,`PCRBatchID`,`GroupID`),
  KEY `FK_4s912n70sf0mdyj3fcskcmnia` (`Round1ReactionID`),
  KEY `FK_947m1h8wbrjbe7webovc5ohhd` (`MID`),
  KEY `FK_aoqmedewpccv2ml2lgoec0c06` (`SampleID`),
  KEY `FK_hxxl23rrnb8u65nr8myhg0899` (`PrimerReverseID`),
  KEY `FK_jg81alaokneidyb0v3knwmj3u` (`GroupID`),
  KEY `FK_kvp7jk41aby9lisqxyxjlly6n` (`PrimerForwardID`),
  KEY `FK_nk19pirk3oy63udfhcjhg7m29` (`RegionID`),
  KEY `FK_s2joblkkv71yib8kce8uxvlt7` (`PCRBatchID`),
  CONSTRAINT `FK_4s912n70sf0mdyj3fcskcmnia` FOREIGN KEY (`Round1ReactionID`) REFERENCES `PcrReactions` (`PcrReactionID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_947m1h8wbrjbe7webovc5ohhd` FOREIGN KEY (`MID`) REFERENCES `PcrPrimers` (`PCRPrimerID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_aoqmedewpccv2ml2lgoec0c06` FOREIGN KEY (`SampleID`) REFERENCES `Samples` (`SampleID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_hxxl23rrnb8u65nr8myhg0899` FOREIGN KEY (`PrimerReverseID`) REFERENCES `PcrPrimers` (`PCRPrimerID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_jg81alaokneidyb0v3knwmj3u` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_kvp7jk41aby9lisqxyxjlly6n` FOREIGN KEY (`PrimerForwardID`) REFERENCES `PcrPrimers` (`PCRPrimerID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_nk19pirk3oy63udfhcjhg7m29` FOREIGN KEY (`RegionID`) REFERENCES `Regions` (`TagID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_s2joblkkv71yib8kce8uxvlt7` FOREIGN KEY (`PCRBatchID`) REFERENCES `PcrBatchs` (`PCRBatchID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PcrReactions`
--

LOCK TABLES `PcrReactions` WRITE;
/*!40000 ALTER TABLE `PcrReactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `PcrReactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PcrReactions_AUD`
--

DROP TABLE IF EXISTS `PcrReactions_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PcrReactions_AUD` (
  `PcrReactionID` int(11) NOT NULL,
  `REV` int(11) NOT NULL,
  `REVTYPE` tinyint(3) DEFAULT NULL,
  `CleanUpPlateCoordinates` varchar(5) DEFAULT NULL,
  `FinalConcentration` varchar(50) DEFAULT NULL,
  `FinalQuality` varchar(50) DEFAULT NULL,
  `ImageDir` varchar(255) DEFAULT NULL,
  `ImageName` varchar(50) DEFAULT NULL,
  `IndexSet` varchar(50) DEFAULT NULL,
  `LocEnd` int(11) DEFAULT NULL,
  `LocStart` int(11) DEFAULT NULL,
  `NormalizationCoordinates` varchar(5) DEFAULT NULL,
  `Note` longtext,
  `PcrName` varchar(50) DEFAULT NULL,
  `Result` longtext,
  `Target` varchar(50) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  `MID` int(11) DEFAULT NULL,
  `PCRBatchID` int(11) DEFAULT NULL,
  `PrimerForwardID` int(11) DEFAULT NULL,
  `PrimerReverseID` int(11) DEFAULT NULL,
  `RegionID` int(11) DEFAULT NULL,
  `Round1ReactionID` int(11) DEFAULT NULL,
  `SampleID` int(11) DEFAULT NULL,
  PRIMARY KEY (`PcrReactionID`,`REV`),
  KEY `FK_e5emcecbalr3q8lwtky433qjm` (`REV`),
  CONSTRAINT `FK_e5emcecbalr3q8lwtky433qjm` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PcrReactions_AUD`
--

LOCK TABLES `PcrReactions_AUD` WRITE;
/*!40000 ALTER TABLE `PcrReactions_AUD` DISABLE KEYS */;
/*!40000 ALTER TABLE `PcrReactions_AUD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `People`
--

DROP TABLE IF EXISTS `People`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `People` (
  `PeopleID` int(11) NOT NULL AUTO_INCREMENT,
  `LastModified` datetime(6) DEFAULT NULL,
  `NameFamily` varchar(50) NOT NULL,
  `NameGiven` varchar(50) DEFAULT NULL,
  `NameMiddle` varchar(50) DEFAULT NULL,
  `NamePrefix` varchar(50) DEFAULT NULL,
  `NameSuffix` varchar(50) DEFAULT NULL,
  `Note` longtext,
  PRIMARY KEY (`PeopleID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `People`
--

LOCK TABLES `People` WRITE;
/*!40000 ALTER TABLE `People` DISABLE KEYS */;
INSERT INTO `People` VALUES (1,'2007-04-03 00:00:00.000000','Raible','Matt','','','',''),(2,'2007-04-03 00:00:00.000000','Johnson','Bob','','','',''),(3,'2018-04-10 09:11:36.030000','Erlingsson','Ingimar','','','',''),(4,'2018-04-10 11:12:54.262000','Gyllenstrand','Niclas','','','',''),(5,'2018-04-11 09:01:37.588000','Kllman','Thomas','','','',''),(6,'2018-10-24 13:12:26.411000','S','Daniela','','','','');
/*!40000 ALTER TABLE `People` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PeopleAddresses`
--

DROP TABLE IF EXISTS `PeopleAddresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PeopleAddresses` (
  `PeopleAddressID` int(11) NOT NULL AUTO_INCREMENT,
  `AddrType` varchar(20) NOT NULL,
  `PrimaryAddr` bit(1) NOT NULL,
  `TelCell` varchar(40) DEFAULT NULL,
  `TelFax` varchar(40) DEFAULT NULL,
  `TelPager` varchar(40) DEFAULT NULL,
  `TelVoice1` varchar(40) DEFAULT NULL,
  `TelVoice2` varchar(40) DEFAULT NULL,
  `AddressID` int(11) DEFAULT NULL,
  `PeopleID` int(11) DEFAULT NULL,
  PRIMARY KEY (`PeopleAddressID`),
  KEY `FK_fmo1wa3swpawahjntu632s4dm` (`PeopleID`),
  KEY `FK_t2mrruiddat2byt9i5coq185o` (`AddressID`),
  CONSTRAINT `FK_fmo1wa3swpawahjntu632s4dm` FOREIGN KEY (`PeopleID`) REFERENCES `People` (`PeopleID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_t2mrruiddat2byt9i5coq185o` FOREIGN KEY (`AddressID`) REFERENCES `Addresses` (`AddressID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PeopleAddresses`
--

LOCK TABLES `PeopleAddresses` WRITE;
/*!40000 ALTER TABLE `PeopleAddresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `PeopleAddresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PeopleGroups`
--

DROP TABLE IF EXISTS `PeopleGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PeopleGroups` (
  `PeopleGroupID` int(11) NOT NULL AUTO_INCREMENT,
  `LastModified` datetime(6) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  `PeopleID` int(11) DEFAULT NULL,
  PRIMARY KEY (`PeopleGroupID`),
  KEY `FK_7qbopoys5i020a1u0wtksh9al` (`GroupID`),
  KEY `FK_buxmypgdwcfgy8gprhfo1k9a4` (`PeopleID`),
  CONSTRAINT `FK_7qbopoys5i020a1u0wtksh9al` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_buxmypgdwcfgy8gprhfo1k9a4` FOREIGN KEY (`PeopleID`) REFERENCES `People` (`PeopleID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PeopleGroups`
--

LOCK TABLES `PeopleGroups` WRITE;
/*!40000 ALTER TABLE `PeopleGroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `PeopleGroups` ENABLE KEYS */;
UNLOCK TABLES;

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
  UNIQUE KEY `Alias` (`Alias`),
  KEY `FK_di98ww0jwy6rja4tadd2baqrl` (`LabelFormatID`),
  CONSTRAINT `FK_di98ww0jwy6rja4tadd2baqrl` FOREIGN KEY (`LabelFormatID`) REFERENCES `LabelFormats` (`LabelFormatID`) ON DELETE NO ACTION ON UPDATE NO ACTION
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

--
-- Table structure for table `Products`
--

DROP TABLE IF EXISTS `Products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Products` (
  `ProductID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(200) DEFAULT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `Name` varchar(50) NOT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `UPC` varchar(50) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  UNIQUE KEY `UK_fevk2xo6g0perb22rbxe79gmf` (`Name`,`GroupID`),
  KEY `FK_clmijec1ll51e1cw4y06pa1lj` (`GroupID`),
  CONSTRAINT `FK_clmijec1ll51e1cw4y06pa1lj` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Products`
--

LOCK TABLES `Products` WRITE;
/*!40000 ALTER TABLE `Products` DISABLE KEYS */;
/*!40000 ALTER TABLE `Products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Products_AUD`
--

DROP TABLE IF EXISTS `Products_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Products_AUD` (
  `ProductID` int(11) NOT NULL,
  `REV` int(11) NOT NULL,
  `REVTYPE` tinyint(3) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `UPC` varchar(50) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ProductID`,`REV`),
  KEY `FK_n7jjay7ughu5qrc2sbuots3sk` (`REV`),
  CONSTRAINT `FK_n7jjay7ughu5qrc2sbuots3sk` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Products_AUD`
--

LOCK TABLES `Products_AUD` WRITE;
/*!40000 ALTER TABLE `Products_AUD` DISABLE KEYS */;
/*!40000 ALTER TABLE `Products_AUD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProjectTags`
--

DROP TABLE IF EXISTS `ProjectTags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProjectTags` (
  `TagID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` longtext,
  `LastModified` datetime(6) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `DurationFrom` date DEFAULT NULL,
  `DurationUntil` date DEFAULT NULL,
  `FundingSource` varchar(30) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `Title` varchar(200) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  PRIMARY KEY (`TagID`),
  UNIQUE KEY `Name` (`Name`),
  UNIQUE KEY `UK_h88xanisv3f9ubo9h4x65nxhd` (`Name`,`GroupID`),
  KEY `FK_phqvhw9un9ed5rsp6nysmu151` (`GroupID`),
  CONSTRAINT `FK_phqvhw9un9ed5rsp6nysmu151` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProjectTags`
--

LOCK TABLES `ProjectTags` WRITE;
/*!40000 ALTER TABLE `ProjectTags` DISABLE KEYS */;
INSERT INTO `ProjectTags` VALUES (1,NULL,'2017-09-26 12:50:41.749000',1,'root',2,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ProjectTags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProjectTags_AUD`
--

DROP TABLE IF EXISTS `ProjectTags_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProjectTags_AUD` (
  `TagID` int(11) NOT NULL,
  `REV` int(11) NOT NULL,
  `REVTYPE` tinyint(3) DEFAULT NULL,
  `DurationFrom` date DEFAULT NULL,
  `DurationUntil` date DEFAULT NULL,
  `FundingSource` varchar(30) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `Title` varchar(200) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  `Description` text,
  `Name` varchar(50) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  PRIMARY KEY (`TagID`,`REV`),
  KEY `FK_i84pu0014li6cglfesarm767j` (`REV`),
  CONSTRAINT `FK_i84pu0014li6cglfesarm767j` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProjectTags_AUD`
--

LOCK TABLES `ProjectTags_AUD` WRITE;
/*!40000 ALTER TABLE `ProjectTags_AUD` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProjectTags_AUD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Projects`
--

DROP TABLE IF EXISTS `Projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Projects` (
  `ProjectID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` longtext,
  `LastModified` datetime(6) DEFAULT NULL,
  `Name` varchar(50) NOT NULL,
  `GroupID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ProjectID`),
  UNIQUE KEY `Name` (`Name`),
  KEY `FK_rsyctg2p1bxfnhguxpr3xrm47` (`GroupID`),
  CONSTRAINT `FK_rsyctg2p1bxfnhguxpr3xrm47` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Projects`
--

LOCK TABLES `Projects` WRITE;
/*!40000 ALTER TABLE `Projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `Projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProjectsProject`
--

DROP TABLE IF EXISTS `ProjectsProject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProjectsProject` (
  `ProjectsProjectID` int(11) NOT NULL AUTO_INCREMENT,
  `ChildID` int(11) NOT NULL,
  `ParentID` int(11) NOT NULL,
  PRIMARY KEY (`ProjectsProjectID`),
  UNIQUE KEY `ChildID` (`ChildID`),
  KEY `FK_40glvko9wlbdh4axsvon037mg` (`ParentID`),
  CONSTRAINT `FK_40glvko9wlbdh4axsvon037mg` FOREIGN KEY (`ParentID`) REFERENCES `Projects` (`ProjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tjbd851lfl437pmvjt76rbc57` FOREIGN KEY (`ChildID`) REFERENCES `Projects` (`ProjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProjectsProject`
--

LOCK TABLES `ProjectsProject` WRITE;
/*!40000 ALTER TABLE `ProjectsProject` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProjectsProject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProtocolAttach`
--

DROP TABLE IF EXISTS `ProtocolAttach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProtocolAttach` (
  `ProtocolAttachId` int(11) NOT NULL AUTO_INCREMENT,
  `DateEntered` date NOT NULL,
  `FileExtension` varchar(255) DEFAULT NULL,
  `FileName` varchar(255) NOT NULL,
  `FileTitle` varchar(255) DEFAULT NULL,
  `Height` int(11) DEFAULT NULL,
  `Location` varchar(255) NOT NULL,
  `Notes` varchar(1024) DEFAULT NULL,
  `Width` int(11) DEFAULT NULL,
  `ProtocolID` int(11) NOT NULL,
  PRIMARY KEY (`ProtocolAttachId`),
  KEY `FK_susn9fe31sdoambvi1nlx436n` (`ProtocolID`),
  CONSTRAINT `FK_susn9fe31sdoambvi1nlx436n` FOREIGN KEY (`ProtocolID`) REFERENCES `Protocols` (`ProtocolID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProtocolAttach`
--

LOCK TABLES `ProtocolAttach` WRITE;
/*!40000 ALTER TABLE `ProtocolAttach` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProtocolAttach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Protocols`
--

DROP TABLE IF EXISTS `Protocols`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Protocols` (
  `ProtocolID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(200) DEFAULT NULL,
  `Equipment` varchar(50) DEFAULT NULL,
  `ForwardPrimerConcentration` varchar(50) DEFAULT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `Name` varchar(50) NOT NULL,
  `Notes` varchar(200) DEFAULT NULL,
  `ReactionMixVolume` varchar(50) DEFAULT NULL,
  `ReactionMixVolumePerTube` varchar(50) DEFAULT NULL,
  `Reference` varchar(100) DEFAULT NULL,
  `ReversePrimerConcentration` varchar(50) DEFAULT NULL,
  `Steps` varchar(1000) DEFAULT NULL,
  `Type` varchar(255) NOT NULL,
  `Version` varchar(5) DEFAULT NULL,
  `GroupID` int(11) NOT NULL,
  `ProductID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ProtocolID`),
  UNIQUE KEY `UK_9rlls40vfmcvrg63wc6e9fig` (`GroupID`,`Name`,`Type`),
  KEY `FK_1xw4rqu4nlbrgr7tfhix7ufr1` (`ProductID`),
  CONSTRAINT `FK_1xw4rqu4nlbrgr7tfhix7ufr1` FOREIGN KEY (`ProductID`) REFERENCES `Products` (`ProductID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_8uvt9ggw52gw8ec687h28civr` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Protocols`
--

LOCK TABLES `Protocols` WRITE;
/*!40000 ALTER TABLE `Protocols` DISABLE KEYS */;
/*!40000 ALTER TABLE `Protocols` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Protocols_AUD`
--

DROP TABLE IF EXISTS `Protocols_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Protocols_AUD` (
  `ProtocolID` int(11) NOT NULL,
  `REV` int(11) NOT NULL,
  `REVTYPE` tinyint(3) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `Equipment` varchar(50) DEFAULT NULL,
  `ForwardPrimerConcentration` varchar(50) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Notes` varchar(200) DEFAULT NULL,
  `ReactionMixVolume` varchar(50) DEFAULT NULL,
  `ReactionMixVolumePerTube` varchar(50) DEFAULT NULL,
  `Reference` varchar(100) DEFAULT NULL,
  `ReversePrimerConcentration` varchar(50) DEFAULT NULL,
  `Steps` varchar(1000) DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `Version` varchar(5) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  `ProductID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ProtocolID`,`REV`),
  KEY `FK_gnj2gppl4gftqldmlj4btgxgg` (`REV`),
  CONSTRAINT `FK_gnj2gppl4gftqldmlj4btgxgg` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Protocols_AUD`
--

LOCK TABLES `Protocols_AUD` WRITE;
/*!40000 ALTER TABLE `Protocols_AUD` DISABLE KEYS */;
/*!40000 ALTER TABLE `Protocols_AUD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProviderChains`
--

DROP TABLE IF EXISTS `ProviderChains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProviderChains` (
  `ProviderChainID` int(11) NOT NULL AUTO_INCREMENT,
  `DateReceived` datetime(6) DEFAULT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `SpecimenIdent` varchar(50) DEFAULT NULL,
  `SpecimenNumber` int(11) DEFAULT NULL,
  `ProviderID` int(11) DEFAULT NULL,
  `ReceivedByID` int(11) DEFAULT NULL,
  `ParentProviderChainID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ProviderChainID`),
  KEY `FK_1jp1erfwf28iroh9l6liq791v` (`ProviderID`),
  KEY `FK_l3qknci5nmdeqx7h6o3smaswa` (`ParentProviderChainID`),
  KEY `FK_nil4cfpn0c7m8slqnk4owktsg` (`ReceivedByID`),
  CONSTRAINT `FK_1jp1erfwf28iroh9l6liq791v` FOREIGN KEY (`ProviderID`) REFERENCES `People` (`PeopleID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_l3qknci5nmdeqx7h6o3smaswa` FOREIGN KEY (`ParentProviderChainID`) REFERENCES `ProviderChains` (`ProviderChainID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_nil4cfpn0c7m8slqnk4owktsg` FOREIGN KEY (`ReceivedByID`) REFERENCES `People` (`PeopleID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProviderChains`
--

LOCK TABLES `ProviderChains` WRITE;
/*!40000 ALTER TABLE `ProviderChains` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProviderChains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProviderChains_AUD`
--

DROP TABLE IF EXISTS `ProviderChains_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProviderChains_AUD` (
  `ProviderChainID` int(11) NOT NULL,
  `REV` int(11) NOT NULL,
  `REVTYPE` tinyint(3) DEFAULT NULL,
  `DateReceived` datetime(6) DEFAULT NULL,
  `SpecimenIdent` varchar(50) DEFAULT NULL,
  `SpecimenNumber` int(11) DEFAULT NULL,
  `ProviderID` int(11) DEFAULT NULL,
  `ReceivedByID` int(11) DEFAULT NULL,
  `ParentProviderChainID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ProviderChainID`,`REV`),
  KEY `FK_syge507bmxa59tfo3sun3s8le` (`REV`),
  CONSTRAINT `FK_syge507bmxa59tfo3sun3s8le` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProviderChains_AUD`
--

LOCK TABLES `ProviderChains_AUD` WRITE;
/*!40000 ALTER TABLE `ProviderChains_AUD` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProviderChains_AUD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Provinces`
--

DROP TABLE IF EXISTS `Provinces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Provinces` (
  `ProvinceId` int(11) NOT NULL AUTO_INCREMENT,
  `Abbreviation` varchar(512) DEFAULT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `Name` varchar(512) NOT NULL,
  `Note` varchar(512) DEFAULT NULL,
  `CountryId` int(11) DEFAULT NULL,
  PRIMARY KEY (`ProvinceId`),
  KEY `FK_sj0ixihlctmheexvesghvvhbh` (`CountryId`),
  CONSTRAINT `FK_sj0ixihlctmheexvesghvvhbh` FOREIGN KEY (`CountryId`) REFERENCES `Countries` (`CountryId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Provinces`
--

LOCK TABLES `Provinces` WRITE;
/*!40000 ALTER TABLE `Provinces` DISABLE KEYS */;
/*!40000 ALTER TABLE `Provinces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReactionComponents`
--

DROP TABLE IF EXISTS `ReactionComponents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReactionComponents` (
  `ReactionComponentID` int(11) NOT NULL AUTO_INCREMENT,
  `Concentration` varchar(50) DEFAULT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Quantity` varchar(50) DEFAULT NULL,
  `ProtocolID` int(11) NOT NULL,
  PRIMARY KEY (`ReactionComponentID`),
  KEY `FK_1a4aoax0d4hbnk3xyjl4qi9vv` (`ProtocolID`),
  CONSTRAINT `FK_1a4aoax0d4hbnk3xyjl4qi9vv` FOREIGN KEY (`ProtocolID`) REFERENCES `Protocols` (`ProtocolID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReactionComponents`
--

LOCK TABLES `ReactionComponents` WRITE;
/*!40000 ALTER TABLE `ReactionComponents` DISABLE KEYS */;
/*!40000 ALTER TABLE `ReactionComponents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Refs`
--

DROP TABLE IF EXISTS `Refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Refs` (
  `ReferenceID` int(11) NOT NULL AUTO_INCREMENT,
  `AttachFile` varchar(100) DEFAULT NULL,
  `Author` varchar(500) DEFAULT NULL,
  `Date` varchar(100) DEFAULT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `OrigId` varchar(100) DEFAULT NULL,
  `Source` varchar(500) DEFAULT NULL,
  `Title` varchar(500) DEFAULT NULL,
  `Year` int(11) DEFAULT NULL,
  `AccountID` int(11) NOT NULL,
  PRIMARY KEY (`ReferenceID`),
  KEY `FK_4qvccfx8g3psr818ndnsit51d` (`AccountID`),
  CONSTRAINT `FK_4qvccfx8g3psr818ndnsit51d` FOREIGN KEY (`AccountID`) REFERENCES `Accounts` (`AccountID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Refs`
--

LOCK TABLES `Refs` WRITE;
/*!40000 ALTER TABLE `Refs` DISABLE KEYS */;
/*!40000 ALTER TABLE `Refs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Regions`
--

DROP TABLE IF EXISTS `Regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Regions` (
  `TagID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` longtext,
  `LastModified` datetime(6) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `Aliases` varchar(255) DEFAULT NULL,
  `ApplicableOrganisims` varchar(255) DEFAULT NULL,
  `Symbol` varchar(50) NOT NULL,
  `GroupID` int(11) DEFAULT NULL,
  PRIMARY KEY (`TagID`),
  UNIQUE KEY `Name` (`Name`),
  UNIQUE KEY `UK_dyejdil5b8y2kps0hqh3thhun` (`Name`,`GroupID`),
  KEY `FK_afqlk7jwweqdv5evifnx1ugkm` (`GroupID`),
  CONSTRAINT `FK_afqlk7jwweqdv5evifnx1ugkm` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Regions`
--

LOCK TABLES `Regions` WRITE;
/*!40000 ALTER TABLE `Regions` DISABLE KEYS */;
INSERT INTO `Regions` VALUES (1,'System root node that every region inherits from. Should not be displayed in the UI.','2017-06-09 00:00:00.000000',1,'root',2,NULL,NULL,'root',NULL);
/*!40000 ALTER TABLE `Regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Regions_AUD`
--

DROP TABLE IF EXISTS `Regions_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Regions_AUD` (
  `TagID` int(11) NOT NULL,
  `REV` int(11) NOT NULL,
  `REVTYPE` tinyint(3) DEFAULT NULL,
  `Aliases` varchar(255) DEFAULT NULL,
  `ApplicableOrganisims` varchar(255) DEFAULT NULL,
  `Symbol` varchar(50) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  `Description` text,
  `Name` varchar(50) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  PRIMARY KEY (`TagID`,`REV`),
  KEY `FK_1tm6uj8qa05skj1arvj1tc5na` (`REV`),
  CONSTRAINT `FK_1tm6uj8qa05skj1arvj1tc5na` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Regions_AUD`
--

LOCK TABLES `Regions_AUD` WRITE;
/*!40000 ALTER TABLE `Regions_AUD` DISABLE KEYS */;
/*!40000 ALTER TABLE `Regions_AUD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Revision`
--

DROP TABLE IF EXISTS `Revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Revision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` bigint(20) NOT NULL,
  `userName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Revision`
--

LOCK TABLES `Revision` WRITE;
/*!40000 ALTER TABLE `Revision` DISABLE KEYS */;
/*!40000 ALTER TABLE `Revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SampleAttach`
--

DROP TABLE IF EXISTS `SampleAttach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SampleAttach` (
  `SampleAttachId` int(11) NOT NULL AUTO_INCREMENT,
  `DateEntered` date NOT NULL,
  `FileExtension` varchar(255) DEFAULT NULL,
  `FileName` varchar(255) NOT NULL,
  `FileTitle` varchar(255) DEFAULT NULL,
  `Height` int(11) DEFAULT NULL,
  `Location` varchar(255) NOT NULL,
  `Notes` varchar(1024) DEFAULT NULL,
  `Width` int(11) DEFAULT NULL,
  `SampleId` int(11) NOT NULL,
  PRIMARY KEY (`SampleAttachId`),
  KEY `FK_qb9ji50w6mbt5tgj801fn2yd0` (`SampleId`),
  CONSTRAINT `FK_qb9ji50w6mbt5tgj801fn2yd0` FOREIGN KEY (`SampleId`) REFERENCES `Samples` (`SampleID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SampleAttach`
--

LOCK TABLES `SampleAttach` WRITE;
/*!40000 ALTER TABLE `SampleAttach` DISABLE KEYS */;
/*!40000 ALTER TABLE `SampleAttach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Samples`
--

DROP TABLE IF EXISTS `Samples`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Samples` (
  `SampleID` int(11) NOT NULL AUTO_INCREMENT,
  `Date` date DEFAULT NULL,
  `DnaConcentration` varchar(50) DEFAULT NULL,
  `DnaConcentrationNotes` varchar(200) DEFAULT NULL,
  `DnaConcentrationPerStartMaterial` varchar(50) DEFAULT NULL,
  `DnaNotes` longtext,
  `Experimenter` varchar(50) DEFAULT NULL,
  `ExtractionBatch` varchar(100) DEFAULT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `LysisBufferVolume` double DEFAULT NULL,
  `Name` varchar(50) NOT NULL,
  `Notes` longtext,
  `NuclAcidExt` varchar(50) DEFAULT NULL,
  `PelletSize` double DEFAULT NULL,
  `ProteinaseKVolume` double DEFAULT NULL,
  `QuantificationMethod` varchar(100) DEFAULT NULL,
  `QubitDNAConcentration` double DEFAULT NULL,
  `Ratio260_230` double DEFAULT NULL,
  `Ratio260_280` double DEFAULT NULL,
  `Source` varchar(200) DEFAULT NULL,
  `Treatment` longtext,
  `TubeId` varchar(50) DEFAULT NULL,
  `UnusableDna` bit(1) DEFAULT NULL,
  `Version` varchar(50) NOT NULL DEFAULT '',
  `VersionDescription` varchar(512) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `MixedSpecimenID` int(11) DEFAULT NULL,
  `ProtocolID` int(11) DEFAULT NULL,
  `SpecimenReplicateID` int(11) DEFAULT NULL,
  `GrowthMedia` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`SampleID`),
  UNIQUE KEY `UK_1aqcmkjwtipu7d9j70hud3j0i` (`Name`,`Version`,`GroupID`),
  KEY `FK_68me2pv0wxtbibrt30wwtr1dr` (`ProtocolID`),
  KEY `FK_chdo5fadxi2yf42ww78sy89xa` (`ProductID`),
  KEY `FK_ktbmo6iq16f81gdradu70qkeo` (`SpecimenReplicateID`),
  KEY `FK_nf0fq2j176ync5qmfirg3fker` (`MixedSpecimenID`),
  KEY `FK_oydcu32elckh89l3sqk5sidbk` (`GroupID`),
  CONSTRAINT `FK_68me2pv0wxtbibrt30wwtr1dr` FOREIGN KEY (`ProtocolID`) REFERENCES `Protocols` (`ProtocolID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_chdo5fadxi2yf42ww78sy89xa` FOREIGN KEY (`ProductID`) REFERENCES `Products` (`ProductID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ktbmo6iq16f81gdradu70qkeo` FOREIGN KEY (`SpecimenReplicateID`) REFERENCES `SpecimenReplicates` (`SpecimenReplicateID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_nf0fq2j176ync5qmfirg3fker` FOREIGN KEY (`MixedSpecimenID`) REFERENCES `MixedSpecimens` (`MixedSpecimenID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_oydcu32elckh89l3sqk5sidbk` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Samples`
--

LOCK TABLES `Samples` WRITE;
/*!40000 ALTER TABLE `Samples` DISABLE KEYS */;
/*!40000 ALTER TABLE `Samples` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Samples_AUD`
--

DROP TABLE IF EXISTS `Samples_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Samples_AUD` (
  `SampleID` int(11) NOT NULL,
  `REV` int(11) NOT NULL,
  `REVTYPE` tinyint(3) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `DnaConcentration` varchar(50) DEFAULT NULL,
  `DnaConcentrationNotes` varchar(200) DEFAULT NULL,
  `DnaConcentrationPerStartMaterial` varchar(50) DEFAULT NULL,
  `DnaNotes` longtext,
  `Experimenter` varchar(50) DEFAULT NULL,
  `ExtractionBatch` varchar(100) DEFAULT NULL,
  `LysisBufferVolume` double DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Notes` longtext,
  `NuclAcidExt` varchar(50) DEFAULT NULL,
  `PelletSize` double DEFAULT NULL,
  `ProteinaseKVolume` double DEFAULT NULL,
  `QuantificationMethod` varchar(100) DEFAULT NULL,
  `QubitDNAConcentration` double DEFAULT NULL,
  `Ratio260_230` double DEFAULT NULL,
  `Ratio260_280` double DEFAULT NULL,
  `Source` varchar(200) DEFAULT NULL,
  `Treatment` longtext,
  `TubeId` varchar(50) DEFAULT NULL,
  `UnusableDna` bit(1) DEFAULT NULL,
  `Version` varchar(50) DEFAULT '',
  `VersionDescription` varchar(512) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `MixedSpecimenID` int(11) DEFAULT NULL,
  `ProtocolID` int(11) DEFAULT NULL,
  `SpecimenReplicateID` int(11) DEFAULT NULL,
  `GrowthMedia` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`SampleID`,`REV`),
  KEY `FK_nokubna3i7h503rat5xynpm84` (`REV`),
  CONSTRAINT `FK_nokubna3i7h503rat5xynpm84` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Samples_AUD`
--

LOCK TABLES `Samples_AUD` WRITE;
/*!40000 ALTER TABLE `Samples_AUD` DISABLE KEYS */;
/*!40000 ALTER TABLE `Samples_AUD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SeqBatchs`
--

DROP TABLE IF EXISTS `SeqBatchs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SeqBatchs` (
  `SeqBatchID` int(11) NOT NULL AUTO_INCREMENT,
  `Date` date DEFAULT NULL,
  `Experimenter` varchar(50) DEFAULT NULL,
  `FragmentType` varchar(50) DEFAULT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `Name` varchar(50) NOT NULL,
  `Notes` varchar(1024) DEFAULT NULL,
  `Objective` varchar(255) DEFAULT NULL,
  `Reference` varchar(512) DEFAULT NULL,
  `SequenceCount` varchar(50) DEFAULT NULL,
  `Thermocycler` varchar(50) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  `PCRProfileID` int(11) DEFAULT NULL,
  `ProtocolID` int(11) DEFAULT NULL,
  `RegionID` int(11) DEFAULT NULL,
  `AmpliconSize` varchar(50) DEFAULT NULL,
  `DnaConcentration` varchar(50) DEFAULT NULL,
  `PrimerConcentration` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`SeqBatchID`),
  UNIQUE KEY `UK_7pw7de7lhx3e8i1c68trdv2co` (`Name`,`GroupID`),
  KEY `FK_ehc393q8ngsuhjk6y6juhfs16` (`ProtocolID`),
  KEY `FK_m81rb3pfdiq14tabkpj3j9jyn` (`GroupID`),
  KEY `FK_n5tu2s6wqeql3yi5nfnj0g2mb` (`RegionID`),
  KEY `FK_sirj0wrt2yk94lvw1mrlw2qc4` (`PCRProfileID`),
  CONSTRAINT `FK_ehc393q8ngsuhjk6y6juhfs16` FOREIGN KEY (`ProtocolID`) REFERENCES `Protocols` (`ProtocolID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_m81rb3pfdiq14tabkpj3j9jyn` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_n5tu2s6wqeql3yi5nfnj0g2mb` FOREIGN KEY (`RegionID`) REFERENCES `Regions` (`TagID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_sirj0wrt2yk94lvw1mrlw2qc4` FOREIGN KEY (`PCRProfileID`) REFERENCES `PcrProfiles` (`PCRProfileID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SeqBatchs`
--

LOCK TABLES `SeqBatchs` WRITE;
/*!40000 ALTER TABLE `SeqBatchs` DISABLE KEYS */;
/*!40000 ALTER TABLE `SeqBatchs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SeqBatchs_AUD`
--

DROP TABLE IF EXISTS `SeqBatchs_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SeqBatchs_AUD` (
  `SeqBatchID` int(11) NOT NULL,
  `REV` int(11) NOT NULL,
  `REVTYPE` tinyint(3) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Experimenter` varchar(50) DEFAULT NULL,
  `FragmentType` varchar(50) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Notes` varchar(1024) DEFAULT NULL,
  `Objective` varchar(255) DEFAULT NULL,
  `Reference` varchar(512) DEFAULT NULL,
  `SequenceCount` varchar(50) DEFAULT NULL,
  `Thermocycler` varchar(50) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  `PCRProfileID` int(11) DEFAULT NULL,
  `ProtocolID` int(11) DEFAULT NULL,
  `RegionID` int(11) DEFAULT NULL,
  PRIMARY KEY (`SeqBatchID`,`REV`),
  KEY `FK_t2eqlq7cjhc7a8jp5ulrypmgc` (`REV`),
  CONSTRAINT `FK_t2eqlq7cjhc7a8jp5ulrypmgc` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SeqBatchs_AUD`
--

LOCK TABLES `SeqBatchs_AUD` WRITE;
/*!40000 ALTER TABLE `SeqBatchs_AUD` DISABLE KEYS */;
/*!40000 ALTER TABLE `SeqBatchs_AUD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SeqMethods`
--

DROP TABLE IF EXISTS `SeqMethods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SeqMethods` (
  `SeqMethodID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` longtext,
  `LastModified` datetime(6) DEFAULT NULL,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`SeqMethodID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SeqMethods`
--

LOCK TABLES `SeqMethods` WRITE;
/*!40000 ALTER TABLE `SeqMethods` DISABLE KEYS */;
/*!40000 ALTER TABLE `SeqMethods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SeqProjects`
--

DROP TABLE IF EXISTS `SeqProjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SeqProjects` (
  `SeqProjectID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` longtext,
  `LastModified` datetime(6) DEFAULT NULL,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`SeqProjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SeqProjects`
--

LOCK TABLES `SeqProjects` WRITE;
/*!40000 ALTER TABLE `SeqProjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `SeqProjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SeqProjectsProjects`
--

DROP TABLE IF EXISTS `SeqProjectsProjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SeqProjectsProjects` (
  `SeqProjectsProjectID` int(11) NOT NULL AUTO_INCREMENT,
  `ProjectID` int(11) DEFAULT NULL,
  `SeqProjectID` int(11) DEFAULT NULL,
  PRIMARY KEY (`SeqProjectsProjectID`),
  KEY `FK_8wcdhmuhu5wu1597flwnaiopr` (`SeqProjectID`),
  KEY `FK_jyuf5lfeq8hhd2g6uwnv002uk` (`ProjectID`),
  CONSTRAINT `FK_8wcdhmuhu5wu1597flwnaiopr` FOREIGN KEY (`SeqProjectID`) REFERENCES `SeqProjects` (`SeqProjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_jyuf5lfeq8hhd2g6uwnv002uk` FOREIGN KEY (`ProjectID`) REFERENCES `Projects` (`ProjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SeqProjectsProjects`
--

LOCK TABLES `SeqProjectsProjects` WRITE;
/*!40000 ALTER TABLE `SeqProjectsProjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `SeqProjectsProjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SeqProjectsSequences`
--

DROP TABLE IF EXISTS `SeqProjectsSequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SeqProjectsSequences` (
  `SeqProjectsSequenceID` int(11) NOT NULL AUTO_INCREMENT,
  `SeqProjectID` int(11) NOT NULL,
  `SequenceID` int(11) NOT NULL,
  PRIMARY KEY (`SeqProjectsSequenceID`),
  KEY `FK_gr1q9bfsft2mpfsc83gyi62s1` (`SeqProjectID`),
  KEY `FK_ohpl1sdb8hm46b8l9g34sd0cf` (`SequenceID`),
  CONSTRAINT `FK_gr1q9bfsft2mpfsc83gyi62s1` FOREIGN KEY (`SeqProjectID`) REFERENCES `SeqProjects` (`SeqProjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ohpl1sdb8hm46b8l9g34sd0cf` FOREIGN KEY (`SequenceID`) REFERENCES `Sequences` (`SequenceID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SeqProjectsSequences`
--

LOCK TABLES `SeqProjectsSequences` WRITE;
/*!40000 ALTER TABLE `SeqProjectsSequences` DISABLE KEYS */;
/*!40000 ALTER TABLE `SeqProjectsSequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SeqReactions`
--

DROP TABLE IF EXISTS `SeqReactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SeqReactions` (
  `SeqReactionID` int(11) NOT NULL AUTO_INCREMENT,
  `AmpliconSize` varchar(50) DEFAULT NULL,
  `DNAConcentration` varchar(50) DEFAULT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `Notes` varchar(1024) DEFAULT NULL,
  `PrimerConcentration` varchar(50) DEFAULT NULL,
  `SeqCode` varchar(255) NOT NULL,
  `WellCoordinates` varchar(255) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  `PcrReactionID` int(11) DEFAULT NULL,
  `SeqBatchID` int(11) DEFAULT NULL,
  `SeqPrimerID` int(11) DEFAULT NULL,
  PRIMARY KEY (`SeqReactionID`),
  UNIQUE KEY `UK_9y5yb24tcp3iunfpr4mc68uyv` (`WellCoordinates`,`SeqBatchID`,`GroupID`),
  KEY `FK_7bu545r1h1nac1rqdehvyhhwo` (`GroupID`),
  KEY `FK_ld8v5qix5ku6tjehe3mg3cgqs` (`SeqPrimerID`),
  KEY `FK_orsl48c73rikurwvh0bw0asnn` (`PcrReactionID`),
  KEY `FK_rjc8t80j6yf06x4spmlq53mmi` (`SeqBatchID`),
  CONSTRAINT `FK_7bu545r1h1nac1rqdehvyhhwo` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ld8v5qix5ku6tjehe3mg3cgqs` FOREIGN KEY (`SeqPrimerID`) REFERENCES `PcrPrimers` (`PCRPrimerID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_orsl48c73rikurwvh0bw0asnn` FOREIGN KEY (`PcrReactionID`) REFERENCES `PcrReactions` (`PcrReactionID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_rjc8t80j6yf06x4spmlq53mmi` FOREIGN KEY (`SeqBatchID`) REFERENCES `SeqBatchs` (`SeqBatchID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SeqReactions`
--

LOCK TABLES `SeqReactions` WRITE;
/*!40000 ALTER TABLE `SeqReactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `SeqReactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SeqReactions_AUD`
--

DROP TABLE IF EXISTS `SeqReactions_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SeqReactions_AUD` (
  `SeqReactionID` int(11) NOT NULL,
  `REV` int(11) NOT NULL,
  `REVTYPE` tinyint(3) DEFAULT NULL,
  `AmpliconSize` varchar(50) DEFAULT NULL,
  `DNAConcentration` varchar(50) DEFAULT NULL,
  `Notes` varchar(1024) DEFAULT NULL,
  `PrimerConcentration` varchar(50) DEFAULT NULL,
  `SeqCode` varchar(255) DEFAULT NULL,
  `WellCoordinates` varchar(255) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  `PcrReactionID` int(11) DEFAULT NULL,
  `SeqBatchID` int(11) DEFAULT NULL,
  `SeqPrimerID` int(11) DEFAULT NULL,
  PRIMARY KEY (`SeqReactionID`,`REV`),
  KEY `FK_97cbm6ka2tewfdj53avcpek7m` (`REV`),
  CONSTRAINT `FK_97cbm6ka2tewfdj53avcpek7m` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SeqReactions_AUD`
--

LOCK TABLES `SeqReactions_AUD` WRITE;
/*!40000 ALTER TABLE `SeqReactions_AUD` DISABLE KEYS */;
/*!40000 ALTER TABLE `SeqReactions_AUD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SeqSources`
--

DROP TABLE IF EXISTS `SeqSources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SeqSources` (
  `SequenceID` int(11) NOT NULL,
  `BiologicalCollectionID` int(11) DEFAULT NULL,
  `ClusterConsID` int(11) DEFAULT NULL,
  `ClusterSeqID` int(11) DEFAULT NULL,
  `CollectionInfoID` int(11) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  `IdentificationID` int(11) DEFAULT NULL,
  `MidID` int(11) DEFAULT NULL,
  `MixedSpecimenID` int(11) DEFAULT NULL,
  `PcrBatchID` int(11) DEFAULT NULL,
  `PcrReactionID` int(11) DEFAULT NULL,
  `PrimerForwardID` int(11) DEFAULT NULL,
  `PrimerReverseID` int(11) DEFAULT NULL,
  `SampleID` int(11) DEFAULT NULL,
  `SeqBatchID` int(11) DEFAULT NULL,
  `SeqReactionID` int(11) DEFAULT NULL,
  `SpecimenID` int(11) DEFAULT NULL,
  `TaxonID` int(11) DEFAULT NULL,
  `RegionID` int(11) DEFAULT NULL,
  PRIMARY KEY (`SequenceID`),
  KEY `FK_1xl6pvmp5w185eq4b0aal9mft` (`SeqReactionID`),
  KEY `FK_2pb4jtciyg4rdbffl5l5bmktd` (`PrimerReverseID`),
  KEY `FK_3080at25w8nm4v0d9yweie2ms` (`SampleID`),
  KEY `FK_4t7cg90s9ltmig4lkj5onx4qb` (`GroupID`),
  KEY `FK_5ehbgji2j0gjaihyvdrk3yp6o` (`MixedSpecimenID`),
  KEY `FK_6a987nbi5u3n7ak73yy9dntnq` (`PcrReactionID`),
  KEY `FK_841om21hek51soq7fc05fgvij` (`BiologicalCollectionID`),
  KEY `FK_8k21fscowx43bsg9stcjm6lne` (`SpecimenID`),
  KEY `FK_a4kc877d1qdvhe6ickb5t5t8y` (`TaxonID`),
  KEY `FK_an50pyveilyolmvmt3dms960t` (`PcrBatchID`),
  KEY `FK_dvb2lxtiyhu9q1l9r9mdpnadw` (`MidID`),
  KEY `FK_fe5snpi3d9mdpo5jh6vvbu5m7` (`CollectionInfoID`),
  KEY `FK_lomh51bwssbvqxf99lccbl1o9` (`ClusterSeqID`),
  KEY `FK_m9ly95txnk442e90at8oe0qh3` (`SeqBatchID`),
  KEY `FK_ojv4mufjy28wjte762tthjlsa` (`PrimerForwardID`),
  KEY `FK_qi2p2jj9tvuiyxgns6e7s7s7p` (`ClusterConsID`),
  KEY `FK_qjhdmqlauh995txjxbyqlvt0p` (`IdentificationID`),
  CONSTRAINT `FK_1xl6pvmp5w185eq4b0aal9mft` FOREIGN KEY (`SeqReactionID`) REFERENCES `SeqReactions` (`SeqReactionID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_2pb4jtciyg4rdbffl5l5bmktd` FOREIGN KEY (`PrimerReverseID`) REFERENCES `PcrPrimers` (`PCRPrimerID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_3080at25w8nm4v0d9yweie2ms` FOREIGN KEY (`SampleID`) REFERENCES `Samples` (`SampleID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_4t7cg90s9ltmig4lkj5onx4qb` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_5ehbgji2j0gjaihyvdrk3yp6o` FOREIGN KEY (`MixedSpecimenID`) REFERENCES `MixedSpecimens` (`MixedSpecimenID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_6a987nbi5u3n7ak73yy9dntnq` FOREIGN KEY (`PcrReactionID`) REFERENCES `PcrReactions` (`PcrReactionID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_841om21hek51soq7fc05fgvij` FOREIGN KEY (`BiologicalCollectionID`) REFERENCES `BiologicalCollections` (`BiologicalCollectionID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_8k21fscowx43bsg9stcjm6lne` FOREIGN KEY (`SpecimenID`) REFERENCES `Specimens` (`SpecimenID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_a4kc877d1qdvhe6ickb5t5t8y` FOREIGN KEY (`TaxonID`) REFERENCES `Taxa` (`TaxonID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_an50pyveilyolmvmt3dms960t` FOREIGN KEY (`PcrBatchID`) REFERENCES `PcrBatchs` (`PCRBatchID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_dvb2lxtiyhu9q1l9r9mdpnadw` FOREIGN KEY (`MidID`) REFERENCES `PcrPrimers` (`PCRPrimerID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_fe5snpi3d9mdpo5jh6vvbu5m7` FOREIGN KEY (`CollectionInfoID`) REFERENCES `CollectionInfos` (`CollectionInfoID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_lomh51bwssbvqxf99lccbl1o9` FOREIGN KEY (`ClusterSeqID`) REFERENCES `ClusterSeqs` (`ClusterSeqID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_m9ly95txnk442e90at8oe0qh3` FOREIGN KEY (`SeqBatchID`) REFERENCES `SeqBatchs` (`SeqBatchID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ojv4mufjy28wjte762tthjlsa` FOREIGN KEY (`PrimerForwardID`) REFERENCES `PcrPrimers` (`PCRPrimerID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_qi2p2jj9tvuiyxgns6e7s7s7p` FOREIGN KEY (`ClusterConsID`) REFERENCES `ClusterCons` (`ClusterConsID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_qjhdmqlauh995txjxbyqlvt0p` FOREIGN KEY (`IdentificationID`) REFERENCES `Identifications` (`IdentificationID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SeqSources`
--

LOCK TABLES `SeqSources` WRITE;
/*!40000 ALTER TABLE `SeqSources` DISABLE KEYS */;
/*!40000 ALTER TABLE `SeqSources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SeqSources_AUD`
--

DROP TABLE IF EXISTS `SeqSources_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SeqSources_AUD` (
  `SequenceID` int(11) NOT NULL,
  `REV` int(11) NOT NULL,
  `REVTYPE` tinyint(3) DEFAULT NULL,
  `BiologicalCollectionID` int(11) DEFAULT NULL,
  `ClusterConsID` int(11) DEFAULT NULL,
  `ClusterSeqID` int(11) DEFAULT NULL,
  `CollectionInfoID` int(11) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  `IdentificationID` int(11) DEFAULT NULL,
  `MidID` int(11) DEFAULT NULL,
  `MixedSpecimenID` int(11) DEFAULT NULL,
  `PcrBatchID` int(11) DEFAULT NULL,
  `PcrReactionID` int(11) DEFAULT NULL,
  `PrimerForwardID` int(11) DEFAULT NULL,
  `PrimerReverseID` int(11) DEFAULT NULL,
  `SampleID` int(11) DEFAULT NULL,
  `SeqBatchID` int(11) DEFAULT NULL,
  `SeqReactionID` int(11) DEFAULT NULL,
  `SpecimenID` int(11) DEFAULT NULL,
  `TaxonID` int(11) DEFAULT NULL,
  `RegionID` int(11) DEFAULT NULL,
  PRIMARY KEY (`SequenceID`,`REV`),
  KEY `FK_ifp950llqpju3mpdy9gllrvjb` (`REV`),
  CONSTRAINT `FK_ifp950llqpju3mpdy9gllrvjb` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SeqSources_AUD`
--

LOCK TABLES `SeqSources_AUD` WRITE;
/*!40000 ALTER TABLE `SeqSources_AUD` DISABLE KEYS */;
/*!40000 ALTER TABLE `SeqSources_AUD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SeqSubmissionConfigs`
--

DROP TABLE IF EXISTS `SeqSubmissionConfigs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SeqSubmissionConfigs` (
  `SeqSubmissionConfigID` int(11) NOT NULL AUTO_INCREMENT,
  `BatchType` varchar(255) DEFAULT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `Name` varchar(100) NOT NULL,
  `Notes` varchar(255) DEFAULT NULL,
  `SeqCodeColumn` varchar(50) DEFAULT NULL,
  `SpreadSheetTemplateFileName` varchar(100) DEFAULT NULL,
  `StartingRow` int(11) DEFAULT NULL,
  `WWW` varchar(100) DEFAULT NULL,
  `SubmissionFacilityID` int(11) DEFAULT NULL,
  PRIMARY KEY (`SeqSubmissionConfigID`),
  UNIQUE KEY `UK_4vdjkm1n5topaxbj6fe1o5vs4` (`Name`,`SubmissionFacilityID`),
  KEY `FK_fu1nicmbjrsh47siaw44o5emt` (`SubmissionFacilityID`),
  CONSTRAINT `FK_fu1nicmbjrsh47siaw44o5emt` FOREIGN KEY (`SubmissionFacilityID`) REFERENCES `SubmissionFacilitys` (`SubmissionFacilityID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SeqSubmissionConfigs`
--

LOCK TABLES `SeqSubmissionConfigs` WRITE;
/*!40000 ALTER TABLE `SeqSubmissionConfigs` DISABLE KEYS */;
/*!40000 ALTER TABLE `SeqSubmissionConfigs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SeqSubmissionConfigs_AUD`
--

DROP TABLE IF EXISTS `SeqSubmissionConfigs_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SeqSubmissionConfigs_AUD` (
  `SeqSubmissionConfigID` int(11) NOT NULL,
  `REV` int(11) NOT NULL,
  `REVTYPE` tinyint(3) DEFAULT NULL,
  `BatchType` varchar(255) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Notes` varchar(255) DEFAULT NULL,
  `SeqCodeColumn` varchar(50) DEFAULT NULL,
  `SpreadSheetTemplateFileName` varchar(100) DEFAULT NULL,
  `StartingRow` int(11) DEFAULT NULL,
  `WWW` varchar(100) DEFAULT NULL,
  `SubmissionFacilityID` int(11) DEFAULT NULL,
  PRIMARY KEY (`SeqSubmissionConfigID`,`REV`),
  KEY `FK_fxs96q5cde8k7q3x19eodhpuv` (`REV`),
  CONSTRAINT `FK_fxs96q5cde8k7q3x19eodhpuv` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SeqSubmissionConfigs_AUD`
--

LOCK TABLES `SeqSubmissionConfigs_AUD` WRITE;
/*!40000 ALTER TABLE `SeqSubmissionConfigs_AUD` DISABLE KEYS */;
/*!40000 ALTER TABLE `SeqSubmissionConfigs_AUD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SeqSubmissions`
--

DROP TABLE IF EXISTS `SeqSubmissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SeqSubmissions` (
  `SeqSubmissionID` int(11) NOT NULL AUTO_INCREMENT,
  `Date` date DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `Name` varchar(100) NOT NULL,
  `PBIContractNumber` varchar(15) DEFAULT NULL,
  `PBIDeliverData` varchar(50) DEFAULT NULL,
  `PBIInternalOrderNumber` varchar(15) DEFAULT NULL,
  `PBIRoomNumber` varchar(15) DEFAULT NULL,
  `PBISequencedBy` varchar(100) DEFAULT NULL,
  `PBISequencedDate` date DEFAULT NULL,
  `RequiredSubmissionBy` varchar(10) DEFAULT NULL,
  `ScientistAuthorized` varchar(100) DEFAULT NULL,
  `SubmittedBy` varchar(100) DEFAULT NULL,
  `SubmittingInstitute` varchar(50) DEFAULT NULL,
  `Telephone` varchar(50) DEFAULT NULL,
  `GroupID` int(11) NOT NULL,
  `SeqBatchID` int(11) DEFAULT NULL,
  `SeqSubmissionConfigID` int(11) DEFAULT NULL,
  PRIMARY KEY (`SeqSubmissionID`),
  UNIQUE KEY `UK_6dqe9e661sij0cvomp30hjd66` (`Name`,`GroupID`),
  UNIQUE KEY `SeqBatchID` (`SeqBatchID`),
  KEY `FK_7epky6tflweq2d2d3ly5w4ga9` (`SeqSubmissionConfigID`),
  KEY `FK_9wmtct7d3ouyoo3vjrhfa1nml` (`GroupID`),
  CONSTRAINT `FK_7epky6tflweq2d2d3ly5w4ga9` FOREIGN KEY (`SeqSubmissionConfigID`) REFERENCES `SeqSubmissionConfigs` (`SeqSubmissionConfigID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_9wmtct7d3ouyoo3vjrhfa1nml` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ocii5r25l17vhxo09v7i8yev7` FOREIGN KEY (`SeqBatchID`) REFERENCES `SeqBatchs` (`SeqBatchID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SeqSubmissions`
--

LOCK TABLES `SeqSubmissions` WRITE;
/*!40000 ALTER TABLE `SeqSubmissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `SeqSubmissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SeqSubmissions_AUD`
--

DROP TABLE IF EXISTS `SeqSubmissions_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SeqSubmissions_AUD` (
  `SeqSubmissionID` int(11) NOT NULL,
  `REV` int(11) NOT NULL,
  `REVTYPE` tinyint(3) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `PBIContractNumber` varchar(15) DEFAULT NULL,
  `PBIDeliverData` varchar(50) DEFAULT NULL,
  `PBIInternalOrderNumber` varchar(15) DEFAULT NULL,
  `PBIRoomNumber` varchar(15) DEFAULT NULL,
  `PBISequencedBy` varchar(100) DEFAULT NULL,
  `PBISequencedDate` date DEFAULT NULL,
  `RequiredSubmissionBy` varchar(10) DEFAULT NULL,
  `ScientistAuthorized` varchar(100) DEFAULT NULL,
  `SubmittedBy` varchar(100) DEFAULT NULL,
  `SubmittingInstitute` varchar(50) DEFAULT NULL,
  `Telephone` varchar(50) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  `SeqBatchID` int(11) DEFAULT NULL,
  `SeqSubmissionConfigID` int(11) DEFAULT NULL,
  `SubmissionFacility` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`SeqSubmissionID`,`REV`),
  KEY `FK_datf6vhkjqkdew6ajt992er74` (`REV`),
  CONSTRAINT `FK_datf6vhkjqkdew6ajt992er74` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SeqSubmissions_AUD`
--

LOCK TABLES `SeqSubmissions_AUD` WRITE;
/*!40000 ALTER TABLE `SeqSubmissions_AUD` DISABLE KEYS */;
/*!40000 ALTER TABLE `SeqSubmissions_AUD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SequenceData`
--

DROP TABLE IF EXISTS `SequenceData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SequenceData` (
  `SequenceID` int(11) NOT NULL AUTO_INCREMENT,
  `Quality` longtext,
  `Seq` longtext NOT NULL,
  PRIMARY KEY (`SequenceID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SequenceData`
--

LOCK TABLES `SequenceData` WRITE;
/*!40000 ALTER TABLE `SequenceData` DISABLE KEYS */;
/*!40000 ALTER TABLE `SequenceData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sequences`
--

DROP TABLE IF EXISTS `Sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sequences` (
  `SequenceID` int(11) NOT NULL,
  `Accession` varchar(10) DEFAULT NULL,
  `CreationDate` datetime(6) DEFAULT NULL,
  `Direction` smallint(6) DEFAULT NULL,
  `FileDir` varchar(255) DEFAULT NULL,
  `FileName` varchar(255) DEFAULT NULL,
  `GenBankAccession` varchar(25) DEFAULT NULL,
  `GenBankGI` varchar(25) DEFAULT NULL,
  `GenBankVersion` varchar(25) DEFAULT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `Name` varchar(255) NOT NULL,
  `Note` varchar(1024) DEFAULT NULL,
  `ReadNum` int(11) NOT NULL,
  `Result` varchar(50) DEFAULT NULL,
  `SeqMeth` varchar(50) DEFAULT NULL,
  `SeqQualityCheck` varchar(50) DEFAULT NULL,
  `SeqType` varchar(1) NOT NULL,
  `SubmittedToInsdc` bit(1) DEFAULT NULL,
  `SubmittedToInsdcDate` date DEFAULT NULL,
  `GoHitID` int(11) DEFAULT NULL,
  `MixedSpecimenID` int(11) DEFAULT NULL,
  `PcrReactionID` int(11) DEFAULT NULL,
  `SeqBatchID` int(11) DEFAULT NULL,
  `SeqMethodID` int(11) DEFAULT NULL,
  `SeqPrimerID` int(11) DEFAULT NULL,
  `BiologicalCollectionID` int(11) DEFAULT NULL,
  PRIMARY KEY (`SequenceID`),
  UNIQUE KEY `GenBankVersion` (`GenBankVersion`),
  UNIQUE KEY `GenBankGI` (`GenBankGI`),
  KEY `FK_752c8t4y20n7b76oe23bw7ynw` (`SeqBatchID`),
  KEY `FK_gkeyalwa6s2trxx01k4b8pbr9` (`SeqMethodID`),
  KEY `FK_hfcc8fl3ycrmkykbhk5e093da` (`PcrReactionID`),
  KEY `FK_i4c0p2tldq4js6l2lpyjr1eyn` (`GoHitID`),
  KEY `FK_plfcpl8v5sp8kkvt6pb0fvrha` (`SeqPrimerID`),
  KEY `sequences_fileName_idx` (`FileName`),
  KEY `sequences_mixedSpecimen_result_idx` (`MixedSpecimenID`,`Result`),
  KEY `sequences_name_idx` (`Name`),
  CONSTRAINT `FK_2urfmger9sr5kwyn20brwdhd9` FOREIGN KEY (`MixedSpecimenID`) REFERENCES `MixedSpecimens` (`MixedSpecimenID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_752c8t4y20n7b76oe23bw7ynw` FOREIGN KEY (`SeqBatchID`) REFERENCES `SeqBatchs` (`SeqBatchID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_gkeyalwa6s2trxx01k4b8pbr9` FOREIGN KEY (`SeqMethodID`) REFERENCES `SeqMethods` (`SeqMethodID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_hfcc8fl3ycrmkykbhk5e093da` FOREIGN KEY (`PcrReactionID`) REFERENCES `PcrReactions` (`PcrReactionID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_i4c0p2tldq4js6l2lpyjr1eyn` FOREIGN KEY (`GoHitID`) REFERENCES `GoHits` (`GoHitID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_plfcpl8v5sp8kkvt6pb0fvrha` FOREIGN KEY (`SeqPrimerID`) REFERENCES `PcrPrimers` (`PCRPrimerID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sequences`
--

LOCK TABLES `Sequences` WRITE;
/*!40000 ALTER TABLE `Sequences` DISABLE KEYS */;
/*!40000 ALTER TABLE `Sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sequences_AUD`
--

DROP TABLE IF EXISTS `Sequences_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sequences_AUD` (
  `SequenceID` int(11) NOT NULL,
  `REV` int(11) NOT NULL,
  `REVTYPE` tinyint(3) DEFAULT NULL,
  `Accession` varchar(10) DEFAULT NULL,
  `CreationDate` datetime(6) DEFAULT NULL,
  `Direction` smallint(6) DEFAULT NULL,
  `FileDir` varchar(255) DEFAULT NULL,
  `FileName` varchar(255) DEFAULT NULL,
  `GenBankAccession` varchar(25) DEFAULT NULL,
  `GenBankGI` varchar(25) DEFAULT NULL,
  `GenBankVersion` varchar(25) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Note` varchar(1024) DEFAULT NULL,
  `ReadNum` int(11) DEFAULT NULL,
  `Result` varchar(50) DEFAULT NULL,
  `SeqMeth` varchar(50) DEFAULT NULL,
  `SeqQualityCheck` varchar(50) DEFAULT NULL,
  `SeqType` varchar(1) DEFAULT NULL,
  `SubmittedToInsdc` bit(1) DEFAULT NULL,
  `SubmittedToInsdcDate` date DEFAULT NULL,
  `CloneID` int(11) DEFAULT NULL,
  `GoHitID` int(11) DEFAULT NULL,
  `MixedSpecimenID` int(11) DEFAULT NULL,
  `PcrReactionID` int(11) DEFAULT NULL,
  `SeqBatchID` int(11) DEFAULT NULL,
  `SeqMethodID` int(11) DEFAULT NULL,
  `SeqPrimerID` int(11) DEFAULT NULL,
  `VectorID` int(11) DEFAULT NULL,
  `IdentificationID` int(11) DEFAULT NULL,
  PRIMARY KEY (`SequenceID`,`REV`),
  KEY `FK_m5g45w4ca6g0p3ldqjaol1s7h` (`REV`),
  CONSTRAINT `FK_m5g45w4ca6g0p3ldqjaol1s7h` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sequences_AUD`
--

LOCK TABLES `Sequences_AUD` WRITE;
/*!40000 ALTER TABLE `Sequences_AUD` DISABLE KEYS */;
/*!40000 ALTER TABLE `Sequences_AUD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SpecimenAttach`
--

DROP TABLE IF EXISTS `SpecimenAttach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SpecimenAttach` (
  `SpecimenAttachId` int(11) NOT NULL AUTO_INCREMENT,
  `DateEntered` date NOT NULL,
  `FileExtension` varchar(255) DEFAULT NULL,
  `FileName` varchar(255) NOT NULL,
  `FileTitle` varchar(255) DEFAULT NULL,
  `Height` int(11) DEFAULT NULL,
  `Location` varchar(255) NOT NULL,
  `Notes` varchar(1024) DEFAULT NULL,
  `Width` int(11) DEFAULT NULL,
  `SpecimenId` int(11) NOT NULL,
  PRIMARY KEY (`SpecimenAttachId`),
  KEY `FK_euetuttl64lssjvt1j7rihl72` (`SpecimenId`),
  CONSTRAINT `FK_euetuttl64lssjvt1j7rihl72` FOREIGN KEY (`SpecimenId`) REFERENCES `Specimens` (`SpecimenID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SpecimenAttach`
--

LOCK TABLES `SpecimenAttach` WRITE;
/*!40000 ALTER TABLE `SpecimenAttach` DISABLE KEYS */;
/*!40000 ALTER TABLE `SpecimenAttach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SpecimenBatchJobs`
--

DROP TABLE IF EXISTS `SpecimenBatchJobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SpecimenBatchJobs` (
  `SpecimenBatchJobId` int(11) NOT NULL AUTO_INCREMENT,
  `BiologicalCollectionID` int(11) NOT NULL,
  `CurrentState` varchar(100) DEFAULT NULL,
  `CurrentStep` int(11) DEFAULT NULL,
  `Finished` bit(1) NOT NULL,
  `MaxSteps` int(11) DEFAULT NULL,
  `Name` varchar(50) NOT NULL,
  `RangeMax` int(11) NOT NULL,
  `RangeMin` int(11) NOT NULL,
  `TimeFinished` datetime(6) DEFAULT NULL,
  `TimeStarted` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`SpecimenBatchJobId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SpecimenBatchJobs`
--

LOCK TABLES `SpecimenBatchJobs` WRITE;
/*!40000 ALTER TABLE `SpecimenBatchJobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `SpecimenBatchJobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SpecimenReplicates`
--

DROP TABLE IF EXISTS `SpecimenReplicates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SpecimenReplicates` (
  `SpecimenReplicateID` int(11) NOT NULL AUTO_INCREMENT,
  `Contents` varchar(100) DEFAULT NULL,
  `DateDestroyed` date DEFAULT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Notes` varchar(1024) DEFAULT NULL,
  `RevivalDate` date DEFAULT NULL,
  `SampSize` varchar(50) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `State` varchar(100) DEFAULT NULL,
  `StorageMedium` varchar(100) DEFAULT NULL,
  `Version` varchar(50) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  `ParentID` int(11) DEFAULT NULL,
  `ProtocolID` int(11) DEFAULT NULL,
  `SpecimenID` int(11) NOT NULL,
  PRIMARY KEY (`SpecimenReplicateID`),
  UNIQUE KEY `UK_o3e4b4vehe7by1roa0k42w0ft` (`SpecimenID`,`Version`),
  KEY `FK_epcn4bq7utejkjuyofy2rxvcq` (`ProtocolID`),
  KEY `FK_pm69olc1lwa2gvrw78vduhusl` (`ParentID`),
  KEY `FK_r2lpq0l0tylb3ee4xdjgi1ue7` (`GroupID`),
  CONSTRAINT `FK_3aes8cn2mdyh6s51clncxgwst` FOREIGN KEY (`SpecimenID`) REFERENCES `Specimens` (`SpecimenID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_epcn4bq7utejkjuyofy2rxvcq` FOREIGN KEY (`ProtocolID`) REFERENCES `Protocols` (`ProtocolID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_pm69olc1lwa2gvrw78vduhusl` FOREIGN KEY (`ParentID`) REFERENCES `SpecimenReplicates` (`SpecimenReplicateID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_r2lpq0l0tylb3ee4xdjgi1ue7` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SpecimenReplicates`
--

LOCK TABLES `SpecimenReplicates` WRITE;
/*!40000 ALTER TABLE `SpecimenReplicates` DISABLE KEYS */;
/*!40000 ALTER TABLE `SpecimenReplicates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SpecimenReplicates_AUD`
--

DROP TABLE IF EXISTS `SpecimenReplicates_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SpecimenReplicates_AUD` (
  `SpecimenReplicateID` int(11) NOT NULL,
  `REV` int(11) NOT NULL,
  `REVTYPE` tinyint(3) DEFAULT NULL,
  `Contents` varchar(100) DEFAULT NULL,
  `DateDestroyed` date DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Notes` varchar(1024) DEFAULT NULL,
  `RevivalDate` date DEFAULT NULL,
  `SampSize` varchar(50) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `State` varchar(100) DEFAULT NULL,
  `StorageMedium` varchar(100) DEFAULT NULL,
  `Version` varchar(50) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  `ParentID` int(11) DEFAULT NULL,
  `ProtocolID` int(11) DEFAULT NULL,
  `SpecimenID` int(11) DEFAULT NULL,
  PRIMARY KEY (`SpecimenReplicateID`,`REV`),
  KEY `FK_pank91epn0f86n0n5wk1x410v` (`REV`),
  CONSTRAINT `FK_pank91epn0f86n0n5wk1x410v` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SpecimenReplicates_AUD`
--

LOCK TABLES `SpecimenReplicates_AUD` WRITE;
/*!40000 ALTER TABLE `SpecimenReplicates_AUD` DISABLE KEYS */;
/*!40000 ALTER TABLE `SpecimenReplicates_AUD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Specimens`
--

DROP TABLE IF EXISTS `Specimens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Specimens` (
  `SpecimenID` int(11) NOT NULL AUTO_INCREMENT,
  `PPCLevel` varchar(20) DEFAULT NULL,
  `AnimalRGLevel` varchar(6) DEFAULT NULL,
  `AnnotatedBy` varchar(200) DEFAULT NULL,
  `AssociatedSequenceTargetsSameRegion` bit(1) DEFAULT NULL,
  `AssociatedSequences` varchar(250) DEFAULT NULL,
  `CatalogNumber` varchar(100) DEFAULT NULL,
  `CellType` varchar(50) DEFAULT NULL,
  `CollectionCode` varchar(100) DEFAULT NULL,
  `DateReceived` date DEFAULT NULL,
  `Description` longtext,
  `ExtraInfo` varchar(50) DEFAULT NULL,
  `FieldIdentifier` varchar(100) DEFAULT NULL,
  `HumanRGLevel` varchar(6) DEFAULT NULL,
  `InstitutionCode` varchar(200) DEFAULT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `LifeStage` varchar(20) DEFAULT NULL,
  `Notes` varchar(1024) DEFAULT NULL,
  `Number` int(11) NOT NULL,
  `NumberString` varchar(11) NOT NULL,
  `OtherIDs` varchar(200) DEFAULT NULL,
  `Owner` varchar(50) DEFAULT NULL,
  `ProcessId` varchar(50) DEFAULT NULL,
  `ProjectName` varchar(50) DEFAULT NULL,
  `Restricted` bit(1) DEFAULT NULL,
  `RestrictedNotes` varchar(1024) DEFAULT NULL,
  `Sex` varchar(10) DEFAULT NULL,
  `SubId` varchar(10) NOT NULL DEFAULT '',
  `Tissue` varchar(50) DEFAULT NULL,
  `Voucher` varchar(50) DEFAULT NULL,
  `BiologicalCollectionID` int(11) NOT NULL,
  `CollectionInfoID` int(11) DEFAULT NULL,
  `FungalInfoID` int(11) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  `HostID` int(11) DEFAULT NULL,
  `IdentificationID` int(11) DEFAULT NULL,
  `ImportPermitID` int(11) DEFAULT NULL,
  `MixedSpecimenID` int(11) DEFAULT NULL,
  `MixsSpecificationID` int(11) DEFAULT NULL,
  `ProviderChainID` int(11) DEFAULT NULL,
  PRIMARY KEY (`SpecimenID`),
  UNIQUE KEY `MixsSpecificationID` (`MixsSpecificationID`),
  UNIQUE KEY `UK_gv40siuct8dlu5rb1y6wlaro1` (`Number`,`BiologicalCollectionID`,`SubId`,`GroupID`),
  KEY `FK_7bjcosxo8x3vxchhcya79skrj` (`FungalInfoID`),
  KEY `FK_9gvxtgp71ikmbcxtth821ovhk` (`MixedSpecimenID`),
  KEY `FK_a5jdmsuglwns7mfoklg41dko7` (`ImportPermitID`),
  KEY `FK_g4ipod035t585hvin5lhry1em` (`GroupID`),
  KEY `FK_g4pmqjoloyf5fhafvv73hjcn1` (`BiologicalCollectionID`),
  KEY `FK_joe4105wh55sxa2b2olue5am5` (`ProviderChainID`),
  KEY `FK_pqbwa1ysc7so8uh8y3bruvfkj` (`HostID`),
  KEY `FK_q0hkqo8y5053o592ghgx06rb9` (`CollectionInfoID`),
  KEY `FK_qfj9ewnq35gytcvg9iqxvri7j` (`IdentificationID`),
  CONSTRAINT `FK_7bjcosxo8x3vxchhcya79skrj` FOREIGN KEY (`FungalInfoID`) REFERENCES `FungalInfos` (`FungalInfoID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_9gvxtgp71ikmbcxtth821ovhk` FOREIGN KEY (`MixedSpecimenID`) REFERENCES `MixedSpecimens` (`MixedSpecimenID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_a5jdmsuglwns7mfoklg41dko7` FOREIGN KEY (`ImportPermitID`) REFERENCES `ImportPermits` (`ImportPermitID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_chm46hvjsj7r9jk2t9js4gf5o` FOREIGN KEY (`MixsSpecificationID`) REFERENCES `MixsSpecification` (`MixsSpecificationID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_g4ipod035t585hvin5lhry1em` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_g4pmqjoloyf5fhafvv73hjcn1` FOREIGN KEY (`BiologicalCollectionID`) REFERENCES `BiologicalCollections` (`BiologicalCollectionID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_joe4105wh55sxa2b2olue5am5` FOREIGN KEY (`ProviderChainID`) REFERENCES `ProviderChains` (`ProviderChainID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_pqbwa1ysc7so8uh8y3bruvfkj` FOREIGN KEY (`HostID`) REFERENCES `Hosts` (`HostID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_q0hkqo8y5053o592ghgx06rb9` FOREIGN KEY (`CollectionInfoID`) REFERENCES `CollectionInfos` (`CollectionInfoID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_qfj9ewnq35gytcvg9iqxvri7j` FOREIGN KEY (`IdentificationID`) REFERENCES `Identifications` (`IdentificationID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Specimens`
--

LOCK TABLES `Specimens` WRITE;
/*!40000 ALTER TABLE `Specimens` DISABLE KEYS */;
/*!40000 ALTER TABLE `Specimens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Specimens_AUD`
--

DROP TABLE IF EXISTS `Specimens_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Specimens_AUD` (
  `SpecimenID` int(11) NOT NULL,
  `REV` int(11) NOT NULL,
  `REVTYPE` tinyint(3) DEFAULT NULL,
  `PPCLevel` varchar(20) DEFAULT NULL,
  `AnimalRGLevel` varchar(6) DEFAULT NULL,
  `AnnotatedBy` varchar(200) DEFAULT NULL,
  `AssociatedSequenceTargetsSameRegion` bit(1) DEFAULT NULL,
  `AssociatedSequences` varchar(250) DEFAULT NULL,
  `CatalogNumber` varchar(100) DEFAULT NULL,
  `CellType` varchar(50) DEFAULT NULL,
  `CollectionCode` varchar(100) DEFAULT NULL,
  `DateReceived` date DEFAULT NULL,
  `Description` longtext,
  `ExtraInfo` varchar(50) DEFAULT NULL,
  `FieldIdentifier` varchar(100) DEFAULT NULL,
  `HumanRGLevel` varchar(6) DEFAULT NULL,
  `InstitutionCode` varchar(200) DEFAULT NULL,
  `LifeStage` varchar(20) DEFAULT NULL,
  `Notes` varchar(1024) DEFAULT NULL,
  `Number` int(11) DEFAULT NULL,
  `NumberString` varchar(11) DEFAULT NULL,
  `OtherIDs` varchar(200) DEFAULT NULL,
  `Owner` varchar(50) DEFAULT NULL,
  `ProcessId` varchar(50) DEFAULT NULL,
  `ProjectName` varchar(50) DEFAULT NULL,
  `Restricted` bit(1) DEFAULT NULL,
  `RestrictedNotes` varchar(1024) DEFAULT NULL,
  `Sex` varchar(10) DEFAULT NULL,
  `SubId` varchar(10) DEFAULT '',
  `Tissue` varchar(50) DEFAULT NULL,
  `Voucher` varchar(50) DEFAULT NULL,
  `BiologicalCollectionID` int(11) DEFAULT NULL,
  `CollectionInfoID` int(11) DEFAULT NULL,
  `FungalInfoID` int(11) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  `HostID` int(11) DEFAULT NULL,
  `IdentificationID` int(11) DEFAULT NULL,
  `ImportPermitID` int(11) DEFAULT NULL,
  `MixedSpecimenID` int(11) DEFAULT NULL,
  `MixsSpecificationID` int(11) DEFAULT NULL,
  `ProviderChainID` int(11) DEFAULT NULL,
  PRIMARY KEY (`SpecimenID`,`REV`),
  KEY `FK_lv3j7p9s03uyan9fcm2mcjl36` (`REV`),
  CONSTRAINT `FK_lv3j7p9s03uyan9fcm2mcjl36` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Specimens_AUD`
--

LOCK TABLES `Specimens_AUD` WRITE;
/*!40000 ALTER TABLE `Specimens_AUD` DISABLE KEYS */;
/*!40000 ALTER TABLE `Specimens_AUD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SpreadSheetColumns`
--

DROP TABLE IF EXISTS `SpreadSheetColumns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SpreadSheetColumns` (
  `SpreadSheetColumnID` int(11) NOT NULL AUTO_INCREMENT,
  `ColumnIndex` varchar(50) NOT NULL,
  `Field` longtext NOT NULL,
  `SeqSubmissionConfigID` int(11) DEFAULT NULL,
  `SpreadSheetTemplateID` int(11) DEFAULT NULL,
  PRIMARY KEY (`SpreadSheetColumnID`),
  KEY `FK_4hn0og6pmo69k02rt88nfidff` (`SpreadSheetTemplateID`),
  KEY `FK_s7391xm6gpdaivq4k87wt2g8h` (`SeqSubmissionConfigID`),
  CONSTRAINT `FK_4hn0og6pmo69k02rt88nfidff` FOREIGN KEY (`SpreadSheetTemplateID`) REFERENCES `SpreadSheetTemplates` (`SpreadSheetTemplateID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_s7391xm6gpdaivq4k87wt2g8h` FOREIGN KEY (`SeqSubmissionConfigID`) REFERENCES `SeqSubmissionConfigs` (`SeqSubmissionConfigID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SpreadSheetColumns`
--

LOCK TABLES `SpreadSheetColumns` WRITE;
/*!40000 ALTER TABLE `SpreadSheetColumns` DISABLE KEYS */;
/*!40000 ALTER TABLE `SpreadSheetColumns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SpreadSheetTemplates`
--

DROP TABLE IF EXISTS `SpreadSheetTemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SpreadSheetTemplates` (
  `SpreadSheetTemplateID` int(11) NOT NULL AUTO_INCREMENT,
  `Importer` varchar(32) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `AccountProfileID` int(11) NOT NULL,
  PRIMARY KEY (`SpreadSheetTemplateID`),
  KEY `FK_bwa6s2770ef5adnwm1k214yh7` (`AccountProfileID`),
  CONSTRAINT `FK_bwa6s2770ef5adnwm1k214yh7` FOREIGN KEY (`AccountProfileID`) REFERENCES `AccountProfiles` (`AccountProfileID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SpreadSheetTemplates`
--

LOCK TABLES `SpreadSheetTemplates` WRITE;
/*!40000 ALTER TABLE `SpreadSheetTemplates` DISABLE KEYS */;
/*!40000 ALTER TABLE `SpreadSheetTemplates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Storages`
--

DROP TABLE IF EXISTS `Storages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Storages` (
  `StorageID` int(11) NOT NULL AUTO_INCREMENT,
  `CompartmentType` varchar(50) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `Name` varchar(50) NOT NULL,
  `NumberOfShelves` int(11) DEFAULT NULL,
  `RoomNumber` varchar(50) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  PRIMARY KEY (`StorageID`),
  UNIQUE KEY `Name` (`Name`),
  KEY `FK_jma7et3xaob4668lptl2wswup` (`GroupID`),
  CONSTRAINT `FK_jma7et3xaob4668lptl2wswup` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Storages`
--

LOCK TABLES `Storages` WRITE;
/*!40000 ALTER TABLE `Storages` DISABLE KEYS */;
/*!40000 ALTER TABLE `Storages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SubmissionFacilitys`
--

DROP TABLE IF EXISTS `SubmissionFacilitys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SubmissionFacilitys` (
  `SubmissionFacilityID` int(11) NOT NULL AUTO_INCREMENT,
  `Contact` varchar(1024) DEFAULT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `Name` varchar(255) NOT NULL,
  `Notes` varchar(1024) DEFAULT NULL,
  `ShippingDetails` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`SubmissionFacilityID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SubmissionFacilitys`
--

LOCK TABLES `SubmissionFacilitys` WRITE;
/*!40000 ALTER TABLE `SubmissionFacilitys` DISABLE KEYS */;
/*!40000 ALTER TABLE `SubmissionFacilitys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SubmissionFacilitys_AUD`
--

DROP TABLE IF EXISTS `SubmissionFacilitys_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SubmissionFacilitys_AUD` (
  `SubmissionFacilityID` int(11) NOT NULL,
  `REV` int(11) NOT NULL,
  `REVTYPE` tinyint(3) DEFAULT NULL,
  `Contact` varchar(1024) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Notes` varchar(1024) DEFAULT NULL,
  `ShippingDetails` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`SubmissionFacilityID`,`REV`),
  KEY `FK_goum9a5y0kseu9dl94pdk6io9` (`REV`),
  CONSTRAINT `FK_goum9a5y0kseu9dl94pdk6io9` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SubmissionFacilitys_AUD`
--

LOCK TABLES `SubmissionFacilitys_AUD` WRITE;
/*!40000 ALTER TABLE `SubmissionFacilitys_AUD` DISABLE KEYS */;
/*!40000 ALTER TABLE `SubmissionFacilitys_AUD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TagFragment`
--

DROP TABLE IF EXISTS `TagFragment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TagFragment` (
  `TagID` int(11) NOT NULL,
  `FragmentID` int(11) NOT NULL,
  PRIMARY KEY (`TagID`,`FragmentID`),
  KEY `FK_swtwrw5un870fjrefj2xtbnp4` (`FragmentID`),
  CONSTRAINT `FK_643autsd7naoi3ym5n1cmyqyy` FOREIGN KEY (`TagID`) REFERENCES `ProjectTags` (`TagID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_swtwrw5un870fjrefj2xtbnp4` FOREIGN KEY (`FragmentID`) REFERENCES `Fragments` (`FragmentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TagFragment`
--

LOCK TABLES `TagFragment` WRITE;
/*!40000 ALTER TABLE `TagFragment` DISABLE KEYS */;
/*!40000 ALTER TABLE `TagFragment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TagMixedSpecimen`
--

DROP TABLE IF EXISTS `TagMixedSpecimen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TagMixedSpecimen` (
  `TagID` int(11) NOT NULL,
  `MixedSpecimenID` int(11) NOT NULL,
  PRIMARY KEY (`TagID`,`MixedSpecimenID`),
  KEY `FK_2qk33ir4t157gly8xhlolo5n0` (`MixedSpecimenID`),
  CONSTRAINT `FK_2qk33ir4t157gly8xhlolo5n0` FOREIGN KEY (`MixedSpecimenID`) REFERENCES `MixedSpecimens` (`MixedSpecimenID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_occi02fr0coj9twv04gnbmi94` FOREIGN KEY (`TagID`) REFERENCES `ProjectTags` (`TagID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TagMixedSpecimen`
--

LOCK TABLES `TagMixedSpecimen` WRITE;
/*!40000 ALTER TABLE `TagMixedSpecimen` DISABLE KEYS */;
/*!40000 ALTER TABLE `TagMixedSpecimen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TagSample`
--

DROP TABLE IF EXISTS `TagSample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TagSample` (
  `TagID` int(11) NOT NULL,
  `SampleID` int(11) NOT NULL,
  PRIMARY KEY (`TagID`,`SampleID`),
  KEY `FK_mbq67ya7vpqircwp8at9286hk` (`SampleID`),
  CONSTRAINT `FK_1sjim4vyu289iagm2oe7me121` FOREIGN KEY (`TagID`) REFERENCES `ProjectTags` (`TagID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_mbq67ya7vpqircwp8at9286hk` FOREIGN KEY (`SampleID`) REFERENCES `Samples` (`SampleID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TagSample`
--

LOCK TABLES `TagSample` WRITE;
/*!40000 ALTER TABLE `TagSample` DISABLE KEYS */;
/*!40000 ALTER TABLE `TagSample` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TagSequence`
--

DROP TABLE IF EXISTS `TagSequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TagSequence` (
  `TagID` int(11) NOT NULL,
  `SequenceID` int(11) NOT NULL,
  PRIMARY KEY (`TagID`,`SequenceID`),
  KEY `FK_29af0jdceosu00gp08484a2f1` (`SequenceID`),
  CONSTRAINT `FK_29af0jdceosu00gp08484a2f1` FOREIGN KEY (`SequenceID`) REFERENCES `Sequences` (`SequenceID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_dfy3l4v77lgwyqgf54diobg8t` FOREIGN KEY (`TagID`) REFERENCES `ProjectTags` (`TagID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TagSequence`
--

LOCK TABLES `TagSequence` WRITE;
/*!40000 ALTER TABLE `TagSequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `TagSequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TagSpecimen`
--

DROP TABLE IF EXISTS `TagSpecimen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TagSpecimen` (
  `TagID` int(11) NOT NULL,
  `SpecimenID` int(11) NOT NULL,
  PRIMARY KEY (`TagID`,`SpecimenID`),
  KEY `FK_j44wkjwhacarb897v73r23pk5` (`SpecimenID`),
  CONSTRAINT `FK_dfesxqm81ixf0nlhludtrdsqs` FOREIGN KEY (`TagID`) REFERENCES `ProjectTags` (`TagID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_j44wkjwhacarb897v73r23pk5` FOREIGN KEY (`SpecimenID`) REFERENCES `Specimens` (`SpecimenID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TagSpecimen`
--

LOCK TABLES `TagSpecimen` WRITE;
/*!40000 ALTER TABLE `TagSpecimen` DISABLE KEYS */;
/*!40000 ALTER TABLE `TagSpecimen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TaskArguments`
--

DROP TABLE IF EXISTS `TaskArguments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TaskArguments` (
  `TaskID` int(11) NOT NULL,
  `Argument` varchar(255) DEFAULT NULL,
  KEY `FK_podnyp77yrdamkchlpeslqla9` (`TaskID`),
  CONSTRAINT `FK_podnyp77yrdamkchlpeslqla9` FOREIGN KEY (`TaskID`) REFERENCES `Tasks` (`TaskID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TaskArguments`
--

LOCK TABLES `TaskArguments` WRITE;
/*!40000 ALTER TABLE `TaskArguments` DISABLE KEYS */;
/*!40000 ALTER TABLE `TaskArguments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tasks`
--

DROP TABLE IF EXISTS `Tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tasks` (
  `TaskID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(255) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `TimeInterval` int(11) DEFAULT NULL,
  `TimeUnit` varchar(255) DEFAULT NULL,
  `Type` varchar(255) NOT NULL,
  `AccountID` int(11) NOT NULL,
  `FileSystemWatcherEntryID` int(11) DEFAULT NULL,
  PRIMARY KEY (`TaskID`),
  KEY `FK_2rtb4sk2nb8xh2jxmsky5xdga` (`AccountID`),
  KEY `FK_lpenr1wqnlgis1koqqqw22kom` (`FileSystemWatcherEntryID`),
  CONSTRAINT `FK_2rtb4sk2nb8xh2jxmsky5xdga` FOREIGN KEY (`AccountID`) REFERENCES `Accounts` (`AccountID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_lpenr1wqnlgis1koqqqw22kom` FOREIGN KEY (`FileSystemWatcherEntryID`) REFERENCES `FileSystemWatcherEntry` (`FileSystemWatcherEntryID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tasks`
--

LOCK TABLES `Tasks` WRITE;
/*!40000 ALTER TABLE `Tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Taxa`
--

DROP TABLE IF EXISTS `Taxa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Taxa` (
  `TaxonID` int(11) NOT NULL AUTO_INCREMENT,
  `Author` varchar(100) DEFAULT NULL,
  `AuthorYear` int(11) DEFAULT NULL,
  `GenderEnding` varchar(10) DEFAULT NULL,
  `Identity` varchar(200) DEFAULT NULL,
  `Keywords` varchar(512) DEFAULT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `LastModifiedBy` varchar(512) DEFAULT NULL,
  `Name` varchar(100) NOT NULL,
  `OrigName` varchar(100) DEFAULT NULL,
  `SubAuthor` varchar(100) DEFAULT NULL,
  `SubAuthorYear` int(11) DEFAULT NULL,
  `OrigComb` int(11) DEFAULT NULL,
  `Parent` int(11) DEFAULT NULL,
  `Preferred` int(11) DEFAULT NULL,
  `RClass` int(11) DEFAULT NULL,
  `RFamily` int(11) DEFAULT NULL,
  `RForma` int(11) DEFAULT NULL,
  `RFormaSpecialis` int(11) DEFAULT NULL,
  `RGenus` int(11) DEFAULT NULL,
  `RInfraclass` int(11) DEFAULT NULL,
  `RInfraorder` int(11) DEFAULT NULL,
  `RKingdom` int(11) DEFAULT NULL,
  `RNoRank` int(11) DEFAULT NULL,
  `ROrder` int(11) DEFAULT NULL,
  `RParvorder` int(11) DEFAULT NULL,
  `RPhylum` int(11) DEFAULT NULL,
  `RSection` int(11) DEFAULT NULL,
  `RSeries` int(11) DEFAULT NULL,
  `RSpecies` int(11) DEFAULT NULL,
  `RSpeciesGroup` int(11) DEFAULT NULL,
  `RSpeciesSubgroup` int(11) DEFAULT NULL,
  `RSubclass` int(11) DEFAULT NULL,
  `RSubfamily` int(11) DEFAULT NULL,
  `RSubgenus` int(11) DEFAULT NULL,
  `RSubkingdom` int(11) DEFAULT NULL,
  `RSuborder` int(11) DEFAULT NULL,
  `RSubphylum` int(11) DEFAULT NULL,
  `RSubspecies` int(11) DEFAULT NULL,
  `RSubtribe` int(11) DEFAULT NULL,
  `RSuperclass` int(11) DEFAULT NULL,
  `RSuperfamily` int(11) DEFAULT NULL,
  `RSuperkingdom` int(11) DEFAULT NULL,
  `RSuperorder` int(11) DEFAULT NULL,
  `RSuperphylum` int(11) DEFAULT NULL,
  `RTribe` int(11) DEFAULT NULL,
  `RVariety` int(11) DEFAULT NULL,
  `TaxonomicRank` int(11) DEFAULT NULL,
  `SameAs` int(11) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`TaxonID`),
  KEY `FK_15ccibevnv1sc0ntlmbn7oxdt` (`ROrder`),
  KEY `FK_4dgb4gh2p3fmlalbj4qrolvkm` (`RParvorder`),
  KEY `FK_5k68p5d2j1dn1i1kp0cbi9m0f` (`RSpecies`),
  KEY `FK_5w10nvvxa5nfdr6vghqx8wic` (`RSeries`),
  KEY `FK_6mhas0jkiqqwt9wqgd2tyuhwf` (`RForma`),
  KEY `FK_7x2v74i9c0j03hn520v736u82` (`RSection`),
  KEY `FK_7yaw7x60h21dyp9dsvco0tu6c` (`RSpeciesSubgroup`),
  KEY `FK_8g4x7w1q441tcqmjqjrepp9df` (`RFamily`),
  KEY `FK_8vifg5efr3p08day12ari3ywb` (`RSubgenus`),
  KEY `FK_8xjjo8revddjgtew69fi2d4qo` (`OrigComb`),
  KEY `FK_9vmjpfkow8tsrpvkj1tls7l6c` (`RSubfamily`),
  KEY `FK_9vnuhsjbibxrndfjavof2oek3` (`RTribe`),
  KEY `FK_a9gk29p8sof5bnti457xfkh87` (`RClass`),
  KEY `FK_abmjpyg0a3fjx803jsvuohy8j` (`RKingdom`),
  KEY `FK_amncx0v5qk0t1rc2hdc80c4np` (`RSubphylum`),
  KEY `FK_b4hyi1s7df54l89yxk8txbxd3` (`RSuperphylum`),
  KEY `FK_bh11kemtx4pu5snt7ohpp001` (`Parent`),
  KEY `FK_bw8gdw7kno52jatkm23yr7urg` (`SameAs`),
  KEY `FK_c4fget0ufn0xy30sfpve8h4ty` (`RSuperkingdom`),
  KEY `FK_cacot4sqn736h54rx371yu6w6` (`RInfraorder`),
  KEY `FK_d3h9i3xcoa7d9norwjrft38ob` (`RVariety`),
  KEY `FK_e7wdawkkl8giwgn4uwrqv8897` (`RNoRank`),
  KEY `FK_ejljb80rovoht26aa8iqka6gf` (`RSubtribe`),
  KEY `FK_eyjixa0qguc5yxufrwscomh4x` (`RSuperfamily`),
  KEY `FK_fjyb34dplfbvwvhsaym7x1cxi` (`RSubspecies`),
  KEY `FK_gs4a2pja8lggk6611pag4f04h` (`TaxonomicRank`),
  KEY `FK_gu9ytkxs4x70fx0w53bw4lscx` (`RSuperclass`),
  KEY `FK_hx82cmlm9a33gc2jnm1lhmc0o` (`RSubclass`),
  KEY `FK_ih7ql24i0hufcjjnh22rv0xfb` (`RSubkingdom`),
  KEY `FK_le59c65oq61w3jtrk9b9tfo14` (`RGenus`),
  KEY `FK_lfjgcky9edg98resn1vadih2h` (`RSuborder`),
  KEY `FK_maxvacfxyxysc7lmrlf1npkto` (`RSuperorder`),
  KEY `FK_mb8o3irwgug7doc3a2hfuos99` (`RSpeciesGroup`),
  KEY `FK_nvdn4ircr41s61ctno51viekd` (`RFormaSpecialis`),
  KEY `FK_osm6gva5bo26w7obj7sl0k5f3` (`RPhylum`),
  KEY `FK_qblg3frh0iswo7u3w6faghpr` (`RInfraclass`),
  KEY `FK_sq1n8okqvy44oofqqvkhxqf13` (`Preferred`),
  CONSTRAINT `FK_15ccibevnv1sc0ntlmbn7oxdt` FOREIGN KEY (`ROrder`) REFERENCES `Taxa` (`TaxonID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_4dgb4gh2p3fmlalbj4qrolvkm` FOREIGN KEY (`RParvorder`) REFERENCES `Taxa` (`TaxonID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_5k68p5d2j1dn1i1kp0cbi9m0f` FOREIGN KEY (`RSpecies`) REFERENCES `Taxa` (`TaxonID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_5w10nvvxa5nfdr6vghqx8wic` FOREIGN KEY (`RSeries`) REFERENCES `Taxa` (`TaxonID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_6mhas0jkiqqwt9wqgd2tyuhwf` FOREIGN KEY (`RForma`) REFERENCES `Taxa` (`TaxonID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_7x2v74i9c0j03hn520v736u82` FOREIGN KEY (`RSection`) REFERENCES `Taxa` (`TaxonID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_7yaw7x60h21dyp9dsvco0tu6c` FOREIGN KEY (`RSpeciesSubgroup`) REFERENCES `Taxa` (`TaxonID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_8g4x7w1q441tcqmjqjrepp9df` FOREIGN KEY (`RFamily`) REFERENCES `Taxa` (`TaxonID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_8vifg5efr3p08day12ari3ywb` FOREIGN KEY (`RSubgenus`) REFERENCES `Taxa` (`TaxonID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_8xjjo8revddjgtew69fi2d4qo` FOREIGN KEY (`OrigComb`) REFERENCES `Taxa` (`TaxonID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_9vmjpfkow8tsrpvkj1tls7l6c` FOREIGN KEY (`RSubfamily`) REFERENCES `Taxa` (`TaxonID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_9vnuhsjbibxrndfjavof2oek3` FOREIGN KEY (`RTribe`) REFERENCES `Taxa` (`TaxonID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_a9gk29p8sof5bnti457xfkh87` FOREIGN KEY (`RClass`) REFERENCES `Taxa` (`TaxonID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_abmjpyg0a3fjx803jsvuohy8j` FOREIGN KEY (`RKingdom`) REFERENCES `Taxa` (`TaxonID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_amncx0v5qk0t1rc2hdc80c4np` FOREIGN KEY (`RSubphylum`) REFERENCES `Taxa` (`TaxonID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_b4hyi1s7df54l89yxk8txbxd3` FOREIGN KEY (`RSuperphylum`) REFERENCES `Taxa` (`TaxonID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_bh11kemtx4pu5snt7ohpp001` FOREIGN KEY (`Parent`) REFERENCES `Taxa` (`TaxonID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_bw8gdw7kno52jatkm23yr7urg` FOREIGN KEY (`SameAs`) REFERENCES `Taxa` (`TaxonID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_c4fget0ufn0xy30sfpve8h4ty` FOREIGN KEY (`RSuperkingdom`) REFERENCES `Taxa` (`TaxonID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_cacot4sqn736h54rx371yu6w6` FOREIGN KEY (`RInfraorder`) REFERENCES `Taxa` (`TaxonID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_d3h9i3xcoa7d9norwjrft38ob` FOREIGN KEY (`RVariety`) REFERENCES `Taxa` (`TaxonID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_e7wdawkkl8giwgn4uwrqv8897` FOREIGN KEY (`RNoRank`) REFERENCES `Taxa` (`TaxonID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ejljb80rovoht26aa8iqka6gf` FOREIGN KEY (`RSubtribe`) REFERENCES `Taxa` (`TaxonID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_eyjixa0qguc5yxufrwscomh4x` FOREIGN KEY (`RSuperfamily`) REFERENCES `Taxa` (`TaxonID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_fjyb34dplfbvwvhsaym7x1cxi` FOREIGN KEY (`RSubspecies`) REFERENCES `Taxa` (`TaxonID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_gs4a2pja8lggk6611pag4f04h` FOREIGN KEY (`TaxonomicRank`) REFERENCES `TaxonRank` (`TaxonRankID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_gu9ytkxs4x70fx0w53bw4lscx` FOREIGN KEY (`RSuperclass`) REFERENCES `Taxa` (`TaxonID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_hx82cmlm9a33gc2jnm1lhmc0o` FOREIGN KEY (`RSubclass`) REFERENCES `Taxa` (`TaxonID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ih7ql24i0hufcjjnh22rv0xfb` FOREIGN KEY (`RSubkingdom`) REFERENCES `Taxa` (`TaxonID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_le59c65oq61w3jtrk9b9tfo14` FOREIGN KEY (`RGenus`) REFERENCES `Taxa` (`TaxonID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_lfjgcky9edg98resn1vadih2h` FOREIGN KEY (`RSuborder`) REFERENCES `Taxa` (`TaxonID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_maxvacfxyxysc7lmrlf1npkto` FOREIGN KEY (`RSuperorder`) REFERENCES `Taxa` (`TaxonID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_mb8o3irwgug7doc3a2hfuos99` FOREIGN KEY (`RSpeciesGroup`) REFERENCES `Taxa` (`TaxonID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_nvdn4ircr41s61ctno51viekd` FOREIGN KEY (`RFormaSpecialis`) REFERENCES `Taxa` (`TaxonID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_osm6gva5bo26w7obj7sl0k5f3` FOREIGN KEY (`RPhylum`) REFERENCES `Taxa` (`TaxonID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_qblg3frh0iswo7u3w6faghpr` FOREIGN KEY (`RInfraclass`) REFERENCES `Taxa` (`TaxonID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_sq1n8okqvy44oofqqvkhxqf13` FOREIGN KEY (`Preferred`) REFERENCES `Taxa` (`TaxonID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Taxa`
--

LOCK TABLES `Taxa` WRITE;
/*!40000 ALTER TABLE `Taxa` DISABLE KEYS */;
/*!40000 ALTER TABLE `Taxa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Taxa_AUD`
--

DROP TABLE IF EXISTS `Taxa_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Taxa_AUD` (
  `TaxonID` int(11) NOT NULL,
  `REV` int(11) NOT NULL,
  `REVTYPE` tinyint(3) DEFAULT NULL,
  `Author` varchar(100) DEFAULT NULL,
  `AuthorYear` int(11) DEFAULT NULL,
  `GenderEnding` varchar(10) DEFAULT NULL,
  `Identity` varchar(200) DEFAULT NULL,
  `Keywords` varchar(512) DEFAULT NULL,
  `LastModifiedBy` varchar(512) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `OrigName` varchar(100) DEFAULT NULL,
  `SubAuthor` varchar(100) DEFAULT NULL,
  `SubAuthorYear` int(11) DEFAULT NULL,
  `OrigComb` int(11) DEFAULT NULL,
  `Parent` int(11) DEFAULT NULL,
  `Preferred` int(11) DEFAULT NULL,
  `RClass` int(11) DEFAULT NULL,
  `RFamily` int(11) DEFAULT NULL,
  `RForma` int(11) DEFAULT NULL,
  `RFormaSpecialis` int(11) DEFAULT NULL,
  `RGenus` int(11) DEFAULT NULL,
  `RInfraclass` int(11) DEFAULT NULL,
  `RInfraorder` int(11) DEFAULT NULL,
  `RKingdom` int(11) DEFAULT NULL,
  `RNoRank` int(11) DEFAULT NULL,
  `ROrder` int(11) DEFAULT NULL,
  `RParvorder` int(11) DEFAULT NULL,
  `RPhylum` int(11) DEFAULT NULL,
  `RSection` int(11) DEFAULT NULL,
  `RSeries` int(11) DEFAULT NULL,
  `RSpecies` int(11) DEFAULT NULL,
  `RSpeciesGroup` int(11) DEFAULT NULL,
  `RSpeciesSubgroup` int(11) DEFAULT NULL,
  `RSubclass` int(11) DEFAULT NULL,
  `RSubfamily` int(11) DEFAULT NULL,
  `RSubgenus` int(11) DEFAULT NULL,
  `RSubkingdom` int(11) DEFAULT NULL,
  `RSuborder` int(11) DEFAULT NULL,
  `RSubphylum` int(11) DEFAULT NULL,
  `RSubspecies` int(11) DEFAULT NULL,
  `RSubtribe` int(11) DEFAULT NULL,
  `RSuperclass` int(11) DEFAULT NULL,
  `RSuperfamily` int(11) DEFAULT NULL,
  `RSuperkingdom` int(11) DEFAULT NULL,
  `RSuperorder` int(11) DEFAULT NULL,
  `RSuperphylum` int(11) DEFAULT NULL,
  `RTribe` int(11) DEFAULT NULL,
  `RVariety` int(11) DEFAULT NULL,
  `TaxonomicRank` int(11) DEFAULT NULL,
  `SameAs` int(11) DEFAULT NULL,
  PRIMARY KEY (`TaxonID`,`REV`),
  KEY `FK_1f2xpfvvbo9of6eauolhvqp7u` (`REV`),
  CONSTRAINT `FK_1f2xpfvvbo9of6eauolhvqp7u` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Taxa_AUD`
--

LOCK TABLES `Taxa_AUD` WRITE;
/*!40000 ALTER TABLE `Taxa_AUD` DISABLE KEYS */;
/*!40000 ALTER TABLE `Taxa_AUD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TaxonInfo`
--

DROP TABLE IF EXISTS `TaxonInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TaxonInfo` (
  `TaxonInfoID` int(11) NOT NULL AUTO_INCREMENT,
  `Content` varchar(500) DEFAULT NULL,
  `ContentType` varchar(100) DEFAULT NULL,
  `Info` varchar(500) DEFAULT NULL,
  `InfoType` varchar(100) DEFAULT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `lastModifiedBy` varchar(255) DEFAULT NULL,
  `Page` varchar(100) DEFAULT NULL,
  `Published` bit(1) DEFAULT NULL,
  `Field` int(11) DEFAULT NULL,
  `ReferenceID` int(11) DEFAULT NULL,
  `TaxonId` int(11) NOT NULL,
  PRIMARY KEY (`TaxonInfoID`),
  KEY `FK_3vj6jcwsuwtkcm2xfppshnjdf` (`Field`),
  KEY `FK_68fxul2h3cddufu0vpwj2ig36` (`ReferenceID`),
  KEY `FK_fsq05c8gi6u8h98gfpfb10k2j` (`TaxonId`),
  CONSTRAINT `FK_3vj6jcwsuwtkcm2xfppshnjdf` FOREIGN KEY (`Field`) REFERENCES `Lexicon` (`LexiconID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_68fxul2h3cddufu0vpwj2ig36` FOREIGN KEY (`ReferenceID`) REFERENCES `Refs` (`ReferenceID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_fsq05c8gi6u8h98gfpfb10k2j` FOREIGN KEY (`TaxonId`) REFERENCES `Taxa` (`TaxonID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TaxonInfo`
--

LOCK TABLES `TaxonInfo` WRITE;
/*!40000 ALTER TABLE `TaxonInfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `TaxonInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TaxonLink`
--

DROP TABLE IF EXISTS `TaxonLink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TaxonLink` (
  `TaxonLinkID` int(11) NOT NULL AUTO_INCREMENT,
  `LastModified` datetime(6) DEFAULT NULL,
  `Source` varchar(20) DEFAULT NULL,
  `SourceId` varchar(20) NOT NULL,
  `SourceLink` varchar(500) DEFAULT NULL,
  `TaxonID` int(11) NOT NULL,
  PRIMARY KEY (`TaxonLinkID`),
  KEY `FK_4ctc19khf6aaty1sxd3ao6xch` (`TaxonID`),
  CONSTRAINT `FK_4ctc19khf6aaty1sxd3ao6xch` FOREIGN KEY (`TaxonID`) REFERENCES `Taxa` (`TaxonID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TaxonLink`
--

LOCK TABLES `TaxonLink` WRITE;
/*!40000 ALTER TABLE `TaxonLink` DISABLE KEYS */;
/*!40000 ALTER TABLE `TaxonLink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TaxonRank`
--

DROP TABLE IF EXISTS `TaxonRank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TaxonRank` (
  `TaxonRankID` int(11) NOT NULL AUTO_INCREMENT,
  `LastModified` datetime(6) DEFAULT NULL,
  `Name` varchar(60) DEFAULT NULL,
  `Note` varchar(512) DEFAULT NULL,
  `RankLevel` int(11) DEFAULT NULL,
  PRIMARY KEY (`TaxonRankID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TaxonRank`
--

LOCK TABLES `TaxonRank` WRITE;
/*!40000 ALTER TABLE `TaxonRank` DISABLE KEYS */;
INSERT INTO `TaxonRank` VALUES (1,'2013-03-19 00:00:00.000000','Superkingdom',NULL,10),(2,'2013-03-19 00:00:00.000000','Kingdom',NULL,20),(3,'2013-03-19 00:00:00.000000','Subkingdom',NULL,30),(4,'2013-03-19 00:00:00.000000','Superphylum',NULL,35),(5,'2013-03-19 00:00:00.000000','Phylum',NULL,40),(6,'2013-03-19 00:00:00.000000','Subphylum',NULL,45),(7,'2013-03-19 00:00:00.000000','Superclass',NULL,50),(8,'2013-03-19 00:00:00.000000','Class',NULL,60),(9,'2013-03-19 00:00:00.000000','Subclass',NULL,70),(10,'2013-03-19 00:00:00.000000','Infraclass',NULL,75),(11,'2013-03-19 00:00:00.000000','Superorder',NULL,77),(12,'2013-03-19 00:00:00.000000','Order',NULL,80),(13,'2013-03-19 00:00:00.000000','Suborder',NULL,85),(14,'2013-03-19 00:00:00.000000','Infraorder',NULL,90),(15,'2013-03-19 00:00:00.000000','Parvorder',NULL,91),(16,'2013-03-19 00:00:00.000000','Superfamily',NULL,95),(17,'2013-03-19 00:00:00.000000','Family',NULL,100),(18,'2013-03-19 00:00:00.000000','Subfamily',NULL,105),(19,'2013-03-19 00:00:00.000000','Tribe',NULL,120),(20,'2013-03-19 00:00:00.000000','Subtribe',NULL,125),(21,'2013-03-19 00:00:00.000000','Genus',NULL,140),(22,'2013-03-19 00:00:00.000000','Subgenus',NULL,145),(23,'2013-03-19 00:00:00.000000','Species',NULL,150),(24,'2013-03-19 00:00:00.000000','Subspecies',NULL,152),(25,'2013-03-19 00:00:00.000000','SpeciesGroup',NULL,155),(26,'2013-03-19 00:00:00.000000','SpeciesSubgroup',NULL,157),(27,'2013-03-19 00:00:00.000000','Varietas',NULL,160),(28,'2013-03-19 00:00:00.000000','Forma',NULL,170),(29,'2013-03-19 00:00:00.000000','NoRank',NULL,1);
/*!40000 ALTER TABLE `TaxonRank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TaxonRank_AUD`
--

DROP TABLE IF EXISTS `TaxonRank_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TaxonRank_AUD` (
  `TaxonRankID` int(11) NOT NULL,
  `REV` int(11) NOT NULL,
  `REVTYPE` tinyint(3) DEFAULT NULL,
  `Name` varchar(60) DEFAULT NULL,
  `Note` varchar(512) DEFAULT NULL,
  `RankLevel` int(11) DEFAULT NULL,
  PRIMARY KEY (`TaxonRankID`,`REV`),
  KEY `FK_dr0ralul51gdqvut0cmn0aaa6` (`REV`),
  CONSTRAINT `FK_dr0ralul51gdqvut0cmn0aaa6` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TaxonRank_AUD`
--

LOCK TABLES `TaxonRank_AUD` WRITE;
/*!40000 ALTER TABLE `TaxonRank_AUD` DISABLE KEYS */;
/*!40000 ALTER TABLE `TaxonRank_AUD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Taxonomys`
--

DROP TABLE IF EXISTS `Taxonomys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Taxonomys` (
  `TaxonomyID` int(11) NOT NULL AUTO_INCREMENT,
  `Authors` varchar(200) DEFAULT NULL,
  `CommonName` varchar(512) DEFAULT NULL,
  `Division` varchar(50) DEFAULT NULL,
  `Family` varchar(50) DEFAULT NULL,
  `Genus` varchar(200) DEFAULT NULL,
  `Kingdom` varchar(50) DEFAULT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `Notes` varchar(1024) DEFAULT NULL,
  `Phylum` varchar(50) DEFAULT NULL,
  `Species` varchar(50) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `Strain` varchar(50) DEFAULT NULL,
  `Subgenera` varchar(200) DEFAULT NULL,
  `Superfamily` varchar(50) DEFAULT NULL,
  `Synonym` varchar(50) DEFAULT NULL,
  `TaxanomicClass` varchar(50) DEFAULT NULL,
  `TaxanomicGroup` varchar(50) DEFAULT NULL,
  `TaxanomicOrder` varchar(50) DEFAULT NULL,
  `TypeSpecimen` varchar(50) DEFAULT NULL,
  `Variety` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`TaxonomyID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Taxonomys`
--

LOCK TABLES `Taxonomys` WRITE;
/*!40000 ALTER TABLE `Taxonomys` DISABLE KEYS */;
/*!40000 ALTER TABLE `Taxonomys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Taxonomys_AUD`
--

DROP TABLE IF EXISTS `Taxonomys_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Taxonomys_AUD` (
  `TaxonomyID` int(11) NOT NULL,
  `REV` int(11) NOT NULL,
  `REVTYPE` tinyint(3) DEFAULT NULL,
  `Authors` varchar(200) DEFAULT NULL,
  `CommonName` varchar(512) DEFAULT NULL,
  `Division` varchar(50) DEFAULT NULL,
  `Family` varchar(50) DEFAULT NULL,
  `Genus` varchar(200) DEFAULT NULL,
  `Kingdom` varchar(50) DEFAULT NULL,
  `Notes` varchar(1024) DEFAULT NULL,
  `Phylum` varchar(50) DEFAULT NULL,
  `Species` varchar(50) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `Strain` varchar(50) DEFAULT NULL,
  `Subgenera` varchar(200) DEFAULT NULL,
  `Superfamily` varchar(50) DEFAULT NULL,
  `Synonym` varchar(50) DEFAULT NULL,
  `TaxanomicClass` varchar(50) DEFAULT NULL,
  `TaxanomicGroup` varchar(50) DEFAULT NULL,
  `TaxanomicOrder` varchar(50) DEFAULT NULL,
  `TypeSpecimen` varchar(50) DEFAULT NULL,
  `Variety` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`TaxonomyID`,`REV`),
  KEY `FK_p8kjq5lejdkrrh9fb1y8kboxo` (`REV`),
  CONSTRAINT `FK_p8kjq5lejdkrrh9fb1y8kboxo` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Taxonomys_AUD`
--

LOCK TABLES `Taxonomys_AUD` WRITE;
/*!40000 ALTER TABLE `Taxonomys_AUD` DISABLE KEYS */;
/*!40000 ALTER TABLE `Taxonomys_AUD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UnitSections`
--

DROP TABLE IF EXISTS `UnitSections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UnitSections` (
  `UnitSectionID` int(11) NOT NULL AUTO_INCREMENT,
  `Compartment` varchar(50) DEFAULT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `RackNumber` int(11) DEFAULT NULL,
  `ShelfNumber` int(11) DEFAULT NULL,
  `StorageID` int(11) NOT NULL,
  PRIMARY KEY (`UnitSectionID`),
  UNIQUE KEY `UK_50e95w5itu8crcsj5xjsc0ljp` (`StorageID`,`Compartment`,`ShelfNumber`,`RackNumber`),
  CONSTRAINT `FK_ic4tij5ely5myq7wlqhnhghm5` FOREIGN KEY (`StorageID`) REFERENCES `Storages` (`StorageID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UnitSections`
--

LOCK TABLES `UnitSections` WRITE;
/*!40000 ALTER TABLE `UnitSections` DISABLE KEYS */;
/*!40000 ALTER TABLE `UnitSections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UsageKeys`
--

DROP TABLE IF EXISTS `UsageKeys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UsageKeys` (
  `UsageKeysID` int(11) NOT NULL AUTO_INCREMENT,
  `LastModified` datetime(6) DEFAULT NULL,
  `LastModifiedBy` varchar(80) NOT NULL,
  `UsageStr` varchar(100) NOT NULL,
  PRIMARY KEY (`UsageKeysID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UsageKeys`
--

LOCK TABLES `UsageKeys` WRITE;
/*!40000 ALTER TABLE `UsageKeys` DISABLE KEYS */;
/*!40000 ALTER TABLE `UsageKeys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ValidationFields`
--

DROP TABLE IF EXISTS `ValidationFields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ValidationFields` (
  `FieldName` varchar(100) NOT NULL,
  `Pattern` varchar(255) DEFAULT NULL,
  `Requirment` varchar(255) NOT NULL,
  `ValidationRuleID` int(11) NOT NULL,
  PRIMARY KEY (`FieldName`,`ValidationRuleID`),
  KEY `FK_l6te4yfcdu08mg24xawd3btcl` (`ValidationRuleID`),
  CONSTRAINT `FK_l6te4yfcdu08mg24xawd3btcl` FOREIGN KEY (`ValidationRuleID`) REFERENCES `ValidationRules` (`ValidationRuleID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ValidationFields`
--

LOCK TABLES `ValidationFields` WRITE;
/*!40000 ALTER TABLE `ValidationFields` DISABLE KEYS */;
/*!40000 ALTER TABLE `ValidationFields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ValidationRules`
--

DROP TABLE IF EXISTS `ValidationRules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ValidationRules` (
  `ValidationRuleID` int(11) NOT NULL AUTO_INCREMENT,
  `Entity` varchar(255) NOT NULL,
  `TagID` int(11) NOT NULL,
  PRIMARY KEY (`ValidationRuleID`),
  UNIQUE KEY `UK_2lncrb3eeq94xa1jbpu6pvo46` (`TagID`,`Entity`),
  CONSTRAINT `FK_lpyvw0afwddt8tb61weqjfyw2` FOREIGN KEY (`TagID`) REFERENCES `ProjectTags` (`TagID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ValidationRules`
--

LOCK TABLES `ValidationRules` WRITE;
/*!40000 ALTER TABLE `ValidationRules` DISABLE KEYS */;
/*!40000 ALTER TABLE `ValidationRules` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-11 11:13:06
