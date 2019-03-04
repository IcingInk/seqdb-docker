-- MySQL dump 10.13  Distrib 5.6.29, for osx10.8 (x86_64)
--
-- Host: localhost    Database: seqdbweb_TRUNK
-- ------------------------------------------------------
-- Server version	5.6.29

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
  CONSTRAINT `FK_est6u6oyjig1qej4vvsqpylk5` FOREIGN KEY (`AccountID`) REFERENCES `Accounts` (`AccountID`)
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
  CONSTRAINT `FK_mn2mclv3mcu6a5jjorxgewlta` FOREIGN KEY (`AccountID`) REFERENCES `Accounts` (`AccountID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AccountProfiles`
--

LOCK TABLES `AccountProfiles` WRITE;
/*!40000 ALTER TABLE `AccountProfiles` DISABLE KEYS */;
INSERT INTO `AccountProfiles` VALUES (1,'2013-03-19 00:00:00.000000',1),(2,'2013-03-19 00:00:00.000000',2);
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
  KEY `FK_opbodkrj8ctv9tyjol5g5xwwu` (`AccountID`),
  KEY `FK_dxy68kqa1bjydnyckv4coh8hr` (`UsageID`),
  CONSTRAINT `FK_dxy68kqa1bjydnyckv4coh8hr` FOREIGN KEY (`UsageID`) REFERENCES `UsageKeys` (`UsageKeysID`),
  CONSTRAINT `FK_opbodkrj8ctv9tyjol5g5xwwu` FOREIGN KEY (`AccountID`) REFERENCES `Accounts` (`AccountID`)
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Accounts`
--

LOCK TABLES `Accounts` WRITE;
/*!40000 ALTER TABLE `Accounts` DISABLE KEYS */;
INSERT INTO `Accounts` VALUES (1,NULL,'Admin','$2a$10$2AdGg40oWZdmL288StGGhO88VPXGOv6K548k8DbfRhza1rrkbnuci','Active','Admin','adminkey',NULL,NULL,'2007-04-03 00:00:00.000000',NULL,1),(2,NULL,'User','$2a$10$xWykm3LUauNxthMDhfXGfeeYFVsvVaN5uJk8C.1oTVV77ea0.nT4a','Active','User','userkey',NULL,NULL,'2007-04-03 00:00:00.000000',NULL,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=269 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AccountsGroups`
--

LOCK TABLES `AccountsGroups` WRITE;
/*!40000 ALTER TABLE `AccountsGroups` DISABLE KEYS */;
INSERT INTO `AccountsGroups` VALUES (265,'\0','2013-03-19 00:00:00.000000','1111',1,1),(266,'','2013-03-19 00:00:00.000000','1111',2,2),(267,'\0','2013-03-19 00:00:00.000000','1111',1,3),(268,'\0','2013-03-19 00:00:00.000000','1111',2,3);
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
  KEY `FK_sn9a64qvbnm650bmmfj23v3p9` (`Country`),
  KEY `FK_lx56ewrr853p17h0qt2qdu3r3` (`StateProvince`),
  CONSTRAINT `FK_lx56ewrr853p17h0qt2qdu3r3` FOREIGN KEY (`StateProvince`) REFERENCES `Provinces` (`ProvinceId`),
  CONSTRAINT `FK_sn9a64qvbnm650bmmfj23v3p9` FOREIGN KEY (`Country`) REFERENCES `Countries` (`CountryId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Addresses`
--

LOCK TABLES `Addresses` WRITE;
/*!40000 ALTER TABLE `Addresses` DISABLE KEYS */;
INSERT INTO `Addresses` VALUES (1,'aaa','2013-03-19 00:00:00.000000','aaa','AAFC','Entomology','K1A0C6','960 Carling',1,1);
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
  `REVTYPE` tinyint(4) DEFAULT NULL,
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
  CONSTRAINT `FK_a52vr69j4yhujfvingbvgwti7` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`)
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
  CONSTRAINT `FK_imr3iov7t4b7c2fgtednxil3s` FOREIGN KEY (`GenotypeID`) REFERENCES `Genotypes` (`GenotypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Alleles`
--

LOCK TABLES `Alleles` WRITE;
/*!40000 ALTER TABLE `Alleles` DISABLE KEYS */;
INSERT INTO `Alleles` VALUES (1,'AB01 - 01',1,'1.232',1,1),(2,'AB01 - 02',2,'2.2323',2,1),(3,'CD45 - 01',1,'6.2323',6,2),(4,'CD45 - 02',2,'5.2323',5,2);
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
  `REVTYPE` tinyint(4) DEFAULT NULL,
  `Locus` varchar(255) DEFAULT NULL,
  `Number` int(11) DEFAULT NULL,
  `Size` varchar(255) DEFAULT NULL,
  `Value` int(11) DEFAULT NULL,
  `GenotypeID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`,`REV`),
  KEY `FK_suc9oypbv4aigggkmbc16q14f` (`REV`),
  CONSTRAINT `FK_suc9oypbv4aigggkmbc16q14f` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`)
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
-- Table structure for table `AnnotationGroups`
--

DROP TABLE IF EXISTS `AnnotationGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AnnotationGroups` (
  `AnnotationGroupID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` longtext,
  `LastModified` datetime(6) DEFAULT NULL,
  `Name` varchar(10) NOT NULL,
  PRIMARY KEY (`AnnotationGroupID`),
  UNIQUE KEY `UK_56t6u1kb88q0jsyobqor1199n` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AnnotationGroups`
--

LOCK TABLES `AnnotationGroups` WRITE;
/*!40000 ALTER TABLE `AnnotationGroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `AnnotationGroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AnnotationTypes`
--

DROP TABLE IF EXISTS `AnnotationTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AnnotationTypes` (
  `AnnotationTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` longtext,
  `LastModified` datetime(6) DEFAULT NULL,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`AnnotationTypeID`),
  UNIQUE KEY `UK_rxjw64b6ou832rldylrcqdeod` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AnnotationTypes`
--

LOCK TABLES `AnnotationTypes` WRITE;
/*!40000 ALTER TABLE `AnnotationTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `AnnotationTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Annotations`
--

DROP TABLE IF EXISTS `Annotations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Annotations` (
  `AnnotationID` int(11) NOT NULL AUTO_INCREMENT,
  `AnnotationDefault` bit(1) NOT NULL,
  `DateCreated` datetime NOT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `Value` varchar(50) NOT NULL,
  `Link2AnnotationID` int(11) DEFAULT NULL,
  `AnnotationGroupID` int(11) DEFAULT NULL,
  `AnnotationTypeID` int(11) DEFAULT NULL,
  `SequenceID` int(11) DEFAULT NULL,
  `SpotID` int(11) DEFAULT NULL,
  PRIMARY KEY (`AnnotationID`),
  KEY `FK_dwgkd6m4f6owt7vsof66jt54g` (`Link2AnnotationID`),
  KEY `FK_dee1xlolk34uhwqtc2i45nc0v` (`AnnotationGroupID`),
  KEY `FK_6ei8vksayjvut57t365guvbgm` (`AnnotationTypeID`),
  KEY `FK_trgcxt8qjd6e6jwrkfgpf7t63` (`SequenceID`),
  KEY `FK_793tgch4wtwhchwf0r7pd7bey` (`SpotID`),
  CONSTRAINT `FK_6ei8vksayjvut57t365guvbgm` FOREIGN KEY (`AnnotationTypeID`) REFERENCES `AnnotationTypes` (`AnnotationTypeID`),
  CONSTRAINT `FK_793tgch4wtwhchwf0r7pd7bey` FOREIGN KEY (`SpotID`) REFERENCES `Spots` (`SpotID`),
  CONSTRAINT `FK_dee1xlolk34uhwqtc2i45nc0v` FOREIGN KEY (`AnnotationGroupID`) REFERENCES `AnnotationGroups` (`AnnotationGroupID`),
  CONSTRAINT `FK_dwgkd6m4f6owt7vsof66jt54g` FOREIGN KEY (`Link2AnnotationID`) REFERENCES `Annotations` (`AnnotationID`),
  CONSTRAINT `FK_trgcxt8qjd6e6jwrkfgpf7t63` FOREIGN KEY (`SequenceID`) REFERENCES `Sequences` (`SequenceID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Annotations`
--

LOCK TABLES `Annotations` WRITE;
/*!40000 ALTER TABLE `Annotations` DISABLE KEYS */;
/*!40000 ALTER TABLE `Annotations` ENABLE KEYS */;
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
  UNIQUE KEY `UK_btil3ei5i1mc85ejn3ygb15h0` (`Name`)
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
  UNIQUE KEY `UK_6fkvgcgl8mjl7edxbrh17d3y5` (`BarcodeableEntity`)
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
  PRIMARY KEY (`BiologicalCollectionID`),
  UNIQUE KEY `UK_ska14t8hsm48ydpdbdn2mky27` (`Name`,`GroupID`),
  KEY `FK_qtmk2q6w736xfc24hj9xbp4bw` (`Address`),
  KEY `FK_3eu58lcf41l1fb5b83yomu44n` (`Contact`),
  KEY `FK_gbiqv9ercno7hkdmqp9svtbk5` (`GroupID`),
  CONSTRAINT `FK_3eu58lcf41l1fb5b83yomu44n` FOREIGN KEY (`Contact`) REFERENCES `People` (`PeopleID`),
  CONSTRAINT `FK_gbiqv9ercno7hkdmqp9svtbk5` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`),
  CONSTRAINT `FK_qtmk2q6w736xfc24hj9xbp4bw` FOREIGN KEY (`Address`) REFERENCES `Addresses` (`AddressID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BiologicalCollections`
--

LOCK TABLES `BiologicalCollections` WRITE;
/*!40000 ALTER TABLE `BiologicalCollections` DISABLE KEYS */;
INSERT INTO `BiologicalCollections` VALUES (1,NULL,'Collection for Dr. Keith Siefert',NULL,'2013-03-19 00:00:00.000000','Keith Siefert','KAS','www.google.com',1,1,1),(2,NULL,'Collection for Dr. Andre Levesque',NULL,'2013-03-19 00:00:00.000000','Andre Levesque','LEV','www.google.com',1,1,1),(3,NULL,'Collection for Dr. Sarah Hambleton',NULL,'2013-03-19 00:00:00.000000','Sarah Hambleton','RS','www.google.com',1,1,1),(4,NULL,'Test collection ',NULL,'2013-03-19 00:00:00.000000','Test collection','XYZ','www.google.com',1,1,2),(5,NULL,'JB Test collection ',NULL,'2013-03-19 00:00:00.000000','JB Test Collection','JB','www.google.com',1,1,1),(6,NULL,'BK Test collection ',NULL,'2013-03-19 00:00:00.000000','BK Test collection','BK','www.google.com',1,1,1);
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
  `REVTYPE` tinyint(4) DEFAULT NULL,
  `DatePublished` date DEFAULT NULL,
  `Description` longtext,
  `Language` varchar(20) DEFAULT NULL,
  `LongName` varchar(512) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `WWW` varchar(100) DEFAULT NULL,
  `Address` int(11) DEFAULT NULL,
  `Contact` int(11) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  PRIMARY KEY (`BiologicalCollectionID`,`REV`),
  KEY `FK_odo8t97tysglk8nho27ejg69d` (`REV`),
  CONSTRAINT `FK_odo8t97tysglk8nho27ejg69d` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`)
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
  CONSTRAINT `FK_teecm7ke2c04iprfxcfds7ump` FOREIGN KEY (`BlastResultID`) REFERENCES `BlastResults` (`BlastResultID`)
) ENGINE=InnoDB AUTO_INCREMENT=20113 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BlastHits`
--

LOCK TABLES `BlastHits` WRITE;
/*!40000 ALTER TABLE `BlastHits` DISABLE KEYS */;
INSERT INTO `BlastHits` VALUES (20111,'A20111',31,'A Hit',30,'\0',30,'A Hit',30,1,1,30,0.001,1,'2007-04-03 00:00:00.000000',2,2011),(20112,'A20112',31,'Another Hit',30,'\0',30,'Another Hit',30,1,1,30,0.001,1,'2007-04-03 00:00:00.000000',1,2011);
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
  CONSTRAINT `FK_g48fynsesdt18nq3qoyjaxrbe` FOREIGN KEY (`BlastHitID`) REFERENCES `BlastHits` (`BlastHitID`)
) ENGINE=InnoDB AUTO_INCREMENT=201113 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BlastHsps`
--

LOCK TABLES `BlastHsps` WRITE;
/*!40000 ALTER TABLE `BlastHsps` DISABLE KEYS */;
INSERT INTO `BlastHsps` VALUES (201111,0,0,0,0,0,'0','0',NULL,0,NULL,NULL,NULL,'0',NULL,'0',0,'0',0,0,0,NULL,0,0,0,0,'0',NULL,0,0,0,'2007-04-03 00:00:00.000000',20111),(201112,0,0,0,0,0,'0','0',NULL,0,NULL,NULL,NULL,'0',NULL,'0',0,'0',0,0,0,NULL,0,0,0,0,'0',NULL,0,0,0,'2007-04-03 00:00:00.000000',20111);
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
  `DateCreated` datetime NOT NULL,
  `Description` longtext,
  `LastModified` datetime(6) DEFAULT NULL,
  `Name` varchar(255) NOT NULL,
  `Program` varchar(50) NOT NULL,
  `QueryDate` date NOT NULL,
  `QueryString` varchar(255) NOT NULL,
  `DatasetID` int(11) DEFAULT NULL,
  `ProjectID` int(11) DEFAULT NULL,
  PRIMARY KEY (`BlastProjectID`),
  UNIQUE KEY `UK_m0m2x42ehv4wiwthl4c9cdjr1` (`Name`),
  KEY `FK_bg9ucdvgtvkvoxjj9n1drmc61` (`DatasetID`),
  KEY `FK_e4661f4v6pobq6g9hun21acvq` (`ProjectID`),
  CONSTRAINT `FK_bg9ucdvgtvkvoxjj9n1drmc61` FOREIGN KEY (`DatasetID`) REFERENCES `Datasets` (`DatasetID`),
  CONSTRAINT `FK_e4661f4v6pobq6g9hun21acvq` FOREIGN KEY (`ProjectID`) REFERENCES `Projects` (`ProjectID`)
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BlastProjects`
--

LOCK TABLES `BlastProjects` WRITE;
/*!40000 ALTER TABLE `BlastProjects` DISABLE KEYS */;
INSERT INTO `BlastProjects` VALUES (201,'2007-04-03 00:00:00','Some Sequence','2007-04-03 00:00:00.000000','Some BLAST','nt','2007-04-03','AAAAAAAAAAAAAAAAA',1,1),(202,'2007-04-03 00:00:00','Some other sequence','2007-04-03 00:00:00.000000','Some Other Blast','nr','2007-04-03','AAAAAAAAAAAAAAAAAAA',1,2);
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
  KEY `FK_34433uytluhaf06rdf46u3ava` (`BlastProjectID`),
  KEY `FK_1v78ota9iutr1glkyp57pmstn` (`SequenceID`),
  CONSTRAINT `FK_1v78ota9iutr1glkyp57pmstn` FOREIGN KEY (`SequenceID`) REFERENCES `Sequences` (`SequenceID`),
  CONSTRAINT `FK_34433uytluhaf06rdf46u3ava` FOREIGN KEY (`BlastProjectID`) REFERENCES `BlastProjects` (`BlastProjectID`)
) ENGINE=InnoDB AUTO_INCREMENT=2013 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BlastResults`
--

LOCK TABLES `BlastResults` WRITE;
/*!40000 ALTER TABLE `BlastResults` DISABLE KEYS */;
INSERT INTO `BlastResults` VALUES (2011,'2007-04-03 00:00:00.000000','','',201,1),(2012,'2007-04-03 00:00:00.000000','','',201,2);
/*!40000 ALTER TABLE `BlastResults` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Clones`
--

DROP TABLE IF EXISTS `Clones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Clones` (
  `CloneID` int(11) NOT NULL AUTO_INCREMENT,
  `LastModified` datetime(6) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `LibraryID` int(11) DEFAULT NULL,
  `VectorID` int(11) DEFAULT NULL,
  PRIMARY KEY (`CloneID`),
  UNIQUE KEY `UK_hv3etynois34sh0wcp5rm7e2e` (`Name`),
  KEY `FK_c15u3yal2u3bmnp96dcycn522` (`LibraryID`),
  KEY `FK_xh4m3hf4s2jrh7b9k6hcfuu7` (`VectorID`),
  CONSTRAINT `FK_c15u3yal2u3bmnp96dcycn522` FOREIGN KEY (`LibraryID`) REFERENCES `Libraries` (`LibraryID`),
  CONSTRAINT `FK_xh4m3hf4s2jrh7b9k6hcfuu7` FOREIGN KEY (`VectorID`) REFERENCES `Vectors` (`VectorID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clones`
--

LOCK TABLES `Clones` WRITE;
/*!40000 ALTER TABLE `Clones` DISABLE KEYS */;
/*!40000 ALTER TABLE `Clones` ENABLE KEYS */;
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
  CONSTRAINT `FK_bhu3d918y3o4r7loipn3ynn1m` FOREIGN KEY (`ClusterProjectID`) REFERENCES `ClusterProjects` (`ClusterProjectID`),
  CONSTRAINT `FK_mb8baxn860mb530wmepcct0bj` FOREIGN KEY (`ClusterConsID`) REFERENCES `Sequences` (`SequenceID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ClusterCons`
--

LOCK TABLES `ClusterCons` WRITE;
/*!40000 ALTER TABLE `ClusterCons` DISABLE KEYS */;
INSERT INTO `ClusterCons` VALUES (3,101),(4,101);
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
  CONSTRAINT `FK_hx2169dofldjeoofyapn2i8sc` FOREIGN KEY (`ClusterConsID`, `REV`) REFERENCES `Sequences_AUD` (`SequenceID`, `REV`)
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
  `DateCreated` datetime NOT NULL,
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
  UNIQUE KEY `UK_5c6fv17koo5x6jy2sls38ko5n` (`Name`),
  KEY `FK_eom5gcyan5jrsd0luivtalhui` (`GroupID`),
  KEY `FK_svifa8l2op31413apv1d2unq4` (`ProjectID`),
  CONSTRAINT `FK_eom5gcyan5jrsd0luivtalhui` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`),
  CONSTRAINT `FK_svifa8l2op31413apv1d2unq4` FOREIGN KEY (`ProjectID`) REFERENCES `Projects` (`ProjectID`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ClusterProjects`
--

LOCK TABLES `ClusterProjects` WRITE;
/*!40000 ALTER TABLE `ClusterProjects` DISABLE KEYS */;
INSERT INTO `ClusterProjects` VALUES (101,NULL,NULL,NULL,NULL,'2007-04-03 00:00:00','It\'s an imaginary cluster project',NULL,'2007-04-03 00:00:00.000000','Test Cluster Project 1',NULL,'Nothing',NULL,1,1),(102,NULL,NULL,NULL,NULL,'2007-04-03 00:00:00','It\'s another imaginary cluster project',NULL,'2007-04-03 00:00:00.000000','Test Cluster Project 2',NULL,'Still Nothing',NULL,2,2);
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
  KEY `FK_dsjxu448lo4iqpswif2ututtv` (`ClusterCons`),
  KEY `FK_72w0hbbiv2tho9lcoe2n8oa21` (`SequenceID`),
  CONSTRAINT `FK_72w0hbbiv2tho9lcoe2n8oa21` FOREIGN KEY (`SequenceID`) REFERENCES `Sequences` (`SequenceID`),
  CONSTRAINT `FK_dsjxu448lo4iqpswif2ututtv` FOREIGN KEY (`ClusterCons`) REFERENCES `ClusterCons` (`ClusterConsID`)
) ENGINE=InnoDB AUTO_INCREMENT=10113 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ClusterSeqs`
--

LOCK TABLES `ClusterSeqs` WRITE;
/*!40000 ALTER TABLE `ClusterSeqs` DISABLE KEYS */;
INSERT INTO `ClusterSeqs` VALUES (10111,12,0,'2007-04-03 00:00:00.000000','Test Cluster Seq 1','TACGATCAGCTACGATC',0,1,3,1),(10112,12,0,'2007-04-03 00:00:00.000000','Test Cluster Seq 2','TACGATCAGCTACGATC',0,2,4,2);
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
  `DecimalLatitude` varchar(100) DEFAULT NULL,
  `DecimalLongitude` varchar(100) DEFAULT NULL,
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
  PRIMARY KEY (`CollectionInfoID`),
  KEY `collectionInfo_city_idx` (`City`),
  KEY `FK_s238mngbvqv10t8lwkgqb81xc` (`ProtocolID`),
  CONSTRAINT `FK_s238mngbvqv10t8lwkgqb81xc` FOREIGN KEY (`ProtocolID`) REFERENCES `Protocols` (`ProtocolID`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CollectionInfos`
--

LOCK TABLES `CollectionInfos` WRITE;
/*!40000 ALTER TABLE `CollectionInfos` DISABLE KEYS */;
INSERT INTO `CollectionInfos` VALUES (1,NULL,NULL,'Ottawa','Paul Thompson','','North America','ZSystem','321 07 52N 526 05 63E','Canada','10','AlphaBetaCoordinateSystem','2.718281828','3.14159265359','',NULL,'AAFC Awareness Effort','5600 feet above sea level',NULL,NULL,NULL,'Mornings','','Some Guy','2012-12-21','gps source',NULL,'2013-03-19 00:00:00.000000','20W','30N','11',NULL,'frozen','Ontario','','','Ottawa-Carleton',NULL,NULL,'2006-11-10','2006-11-09','sector 200','CEF',NULL,NULL,'','2006',1),(2,NULL,NULL,'Germany','Gean Grey','','Europe','ZSystem','321 07 52N 526 05 63E','UK','10','AlphaBetaCoordinateSystem','2.718281828','3.14159265359','',NULL,'AAFC Awareness Effort','200 feet above sea level',NULL,NULL,NULL,'','','Some Guy','2012-12-21','gps source',NULL,'2013-03-19 00:00:00.000000','40W','60N','11',NULL,'','England','','','eton',NULL,NULL,'2009-11-10','2009-11-09','sector 7G','GEH',NULL,NULL,'','2009',1),(3,NULL,NULL,'Humberg','Rogue','','Europe','ZSystem','321 07 52N 526 05 63E','UK','10','AlphaBetaCoordinateSystem','2.718281828','3.14159265359','',NULL,'AAFC Awareness Effort','200 feet above sea level',NULL,NULL,NULL,'','','Some Guy','2012-12-21','gps source',NULL,'2013-03-19 00:00:00.000000','40W','60N','11',NULL,'','Africa','','','aRegion',NULL,NULL,'2009-11-10','2009-11-09','sector 7G','7G',NULL,NULL,'','2009',1),(4,NULL,NULL,'4Humberg','Rogue4','','Europe','ZSystem','321 07 52N 526 05 63E','UK4','10','AlphaBetaCoordinateSystem','2.718281828','3.14159265359','',NULL,'AAFC Awareness Effort','4 feet above sea level',NULL,NULL,NULL,'','','Some Guy','2012-12-21','4gps source',NULL,'2013-03-19 00:00:00.000000','44W','4N','11',NULL,'','Africa4','','','4Region',NULL,NULL,'2009-11-10','2009-11-09','sector 4','4G',NULL,NULL,'','2004',1),(5,NULL,NULL,'Edmonton','Rogue','dCollectorType','North America','ZSystem','321 07 52N 526 05 63E','Canada','10','AlphaBetaCoordinateSystem','2.718281828','3.14159265359','',NULL,'AAFC Awareness Effort','5 feet above sea level',NULL,NULL,NULL,'','5','Some Guy','2012-12-21','5gps source',NULL,'2013-03-19 00:00:00.000000','40W','60N','11',NULL,'','Alberta','0.5','50','Edmonton Region 1',NULL,NULL,'2007-05-15','2007-05-05','sector 7G','7G',NULL,NULL,'dWeek','2009',1),(6,NULL,NULL,'Vancover','Rogue','','North America','ZSystem','321 07 52N 526 05 63E','Canada','10','AlphaBetaCoordinateSystem','2.718281828','3.14159265359','2M',NULL,'AAFC Awareness Effort','6 feet above sea level',NULL,NULL,NULL,'','','Some Guy','2012-12-21','6gps source',NULL,'2013-03-19 00:00:00.000000','40W','60N','11',NULL,'','Vancover','','','dRegion',NULL,NULL,'2009-11-10','2009-11-09','sector 7G','8G',NULL,NULL,'','2009',1),(7,NULL,NULL,'Congo','Rogue','aCollectorType','Africa','ZSystem','321 07 52N 526 05 63E','Africa','10','AlphaBetaCoordinateSystem','2.718281828','3.14159265359','',NULL,'AAFC Awareness Effort','7 feet above sea level',NULL,NULL,NULL,'','1','Some Guy','2012-12-21','7gps source',NULL,'2013-03-19 00:00:00.000000','40W','60N','11',NULL,'','Africa','0.1','10','eRegion',NULL,NULL,'2007-01-15','2007-01-05','sector 7G','1G',NULL,NULL,'aWeek','2009',1),(8,NULL,NULL,'London','Rogue','bCollectorType','Europe','ZSystem','321 07 52N 526 05 63E','England','10','AlphaBetaCoordinateSystem','2.718281828','3.14159265359','',NULL,'AAFC Awareness Effort','8 feet above sea level',NULL,NULL,NULL,'','2','Some Guy','2012-12-21','8gps source',NULL,'2013-03-19 00:00:00.000000','40W','60N','11',NULL,'','London','0.2','20','aRegion',NULL,NULL,'2007-02-15','2007-02-05','sector 7G','7G',NULL,NULL,'bWeek','2009',1),(12,NULL,NULL,'Hum','Rando','cCollectorType','South America','SwarmHiveMindSystem','905 820 64N 751 05 141E','UK','10','OmegaZetaImperialCoordinateSystem','1.61803398875','e^(i*3.14)','',NULL,'Zergling Awareness Effort','12 feet above sea level',NULL,NULL,NULL,'','3','SS4 Goku','2050-01-01','12gps source',NULL,'2013-03-19 00:00:00.000000','50W','80N','11',NULL,'','Bolivia','0.3','30','12aRegion',NULL,NULL,'2007-03-15','2007-03-05','sector 7G','7G',NULL,NULL,'cWeek','2009',1),(13,NULL,NULL,'Hum','Rando','cCollectorType','South America','SwarmHiveMindSystem','905 820 64N 751 05 141E','UK','10','OmegaZetaImperialCoordinateSystem','1.61803398875','e^(i*3.14)','',NULL,'Zergling Awareness Effort','13 feet above sea level',NULL,NULL,NULL,'','3','SS4 Goku','2050-01-01','13gps source',NULL,'2013-03-19 00:00:00.000000','50W','80N','11',NULL,'','Bolivia','0.3','30','13aRegion',NULL,NULL,'2007-03-15','2007-03-05','sector 7G','7G',NULL,NULL,'cWeek','2009',1),(14,NULL,NULL,'Hum','Rando','cCollectorType','South America','SwarmHiveMindSystem','905 820 64N 751 05 141E','UK','10','OmegaZetaImperialCoordinateSystem','1.61803398875','e^(i*3.14)','',NULL,'Zergling Awareness Effort','14 feet above sea level',NULL,NULL,NULL,'','3','SS4 Goku','2050-01-01','14gps source',NULL,'2013-03-19 00:00:00.000000','50W','80N','11',NULL,'','Bolivia','0.3','30','12aRegion',NULL,NULL,'2007-03-15','2007-03-05','sector 7G','7G',NULL,NULL,'cWeek','2009',1);
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
  `REVTYPE` tinyint(4) DEFAULT NULL,
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
  `DecimalLatitude` varchar(100) DEFAULT NULL,
  `DecimalLongitude` varchar(100) DEFAULT NULL,
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
  PRIMARY KEY (`CollectionInfoID`,`REV`),
  KEY `FK_1xm6fatpxmudxlvx20wg8n5h5` (`REV`),
  CONSTRAINT `FK_1xm6fatpxmudxlvx20wg8n5h5` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`)
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
  CONSTRAINT `FK_jhw6u82ksauethycw3p0nuadr` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ContainerTypes`
--

LOCK TABLES `ContainerTypes` WRITE;
/*!40000 ALTER TABLE `ContainerTypes` DISABLE KEYS */;
INSERT INTO `ContainerTypes` VALUES (1,'Plate','2013-03-19 00:00:00.000000','96 Well 12x8 Plate',12,8,96,1),(2,'Test Tube Rack','2013-03-19 00:00:00.000000','25 Cell 5x5 Test Tube Rack',5,5,25,3),(3,'Primer Box','2013-03-19 00:00:00.000000','15x50 Primer Box',15,50,750,3);
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
  KEY `FK_sii753dw6tfwj8lc4iokho2q` (`ContainerTypeID`),
  KEY `FK_8b01ws3lovo12oxco33193f2n` (`GroupID`),
  KEY `FK_qrjwbqax7ro6uos8jllr4noyi` (`StorageID`),
  KEY `FK_4hmy3nk8ec60v0ahr5fpr7vny` (`UnitSectionID`),
  CONSTRAINT `FK_4hmy3nk8ec60v0ahr5fpr7vny` FOREIGN KEY (`UnitSectionID`) REFERENCES `UnitSections` (`UnitSectionID`),
  CONSTRAINT `FK_8b01ws3lovo12oxco33193f2n` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`),
  CONSTRAINT `FK_qrjwbqax7ro6uos8jllr4noyi` FOREIGN KEY (`StorageID`) REFERENCES `Storages` (`StorageID`),
  CONSTRAINT `FK_sii753dw6tfwj8lc4iokho2q` FOREIGN KEY (`ContainerTypeID`) REFERENCES `ContainerTypes` (`ContainerTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Containers`
--

LOCK TABLES `Containers` WRITE;
/*!40000 ALTER TABLE `Containers` DISABLE KEYS */;
INSERT INTO `Containers` VALUES (1,'1','','2013-03-19 00:00:00.000000',1,1,1,1),(2,'2','','2013-03-19 00:00:00.000000',1,1,1,2),(3,'3','','2013-03-19 00:00:00.000000',2,1,1,3),(4,'4','','2013-03-19 00:00:00.000000',2,3,1,4),(5,'5','','2013-03-19 00:00:00.000000',1,3,2,5),(6,'6','','2013-03-19 00:00:00.000000',3,3,2,5),(7,'Test Barcoding Container','','2013-03-19 00:00:00.000000',1,1,1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Countries`
--

LOCK TABLES `Countries` WRITE;
/*!40000 ALTER TABLE `Countries` DISABLE KEYS */;
INSERT INTO `Countries` VALUES (1,'SW','2013-03-19 00:00:00.000000','Somewhere','');
/*!40000 ALTER TABLE `Countries` ENABLE KEYS */;
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
  UNIQUE KEY `UK_nemceqssvsiayn95cwo2n4l3k` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Datasets`
--

LOCK TABLES `Datasets` WRITE;
/*!40000 ALTER TABLE `Datasets` DISABLE KEYS */;
INSERT INTO `Datasets` VALUES (1,'Nucleotide','','','','','2007-04-03 00:00:00.000000','Some dataset','',''),(2,'Nucleotide','','','','','2007-04-03 00:00:00.000000','Some other dataset','','');
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
  CONSTRAINT `FK_lwuk6hh8xifok37n2yry6owi2` FOREIGN KEY (`PeopleID`) REFERENCES `People` (`PeopleID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
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
  CONSTRAINT `FK_r6bjqv7jmvqu5j2kbf017wvwv` FOREIGN KEY (`TaskID`) REFERENCES `Tasks` (`TaskID`)
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
  `End` int(11) NOT NULL,
  `FeatureSequence` longtext,
  `Frame` int(11) NOT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `Start` int(11) NOT NULL,
  `Strand` int(11) NOT NULL,
  `FeatureID` int(11) DEFAULT NULL,
  PRIMARY KEY (`FeatureLocationID`),
  KEY `FK_thvqsq3ko7r52yfedudeab4vr` (`FeatureID`),
  CONSTRAINT `FK_thvqsq3ko7r52yfedudeab4vr` FOREIGN KEY (`FeatureID`) REFERENCES `Features` (`FeatureID`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FeatureLocations`
--

LOCK TABLES `FeatureLocations` WRITE;
/*!40000 ALTER TABLE `FeatureLocations` DISABLE KEYS */;
INSERT INTO `FeatureLocations` VALUES (67,5,'GA',1,'2013-03-19 00:00:00.000000',3,1,10);
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
  `REVTYPE` tinyint(4) DEFAULT NULL,
  `End` int(11) DEFAULT NULL,
  `FeatureSequence` longtext,
  `Frame` int(11) DEFAULT NULL,
  `Start` int(11) DEFAULT NULL,
  `Strand` int(11) DEFAULT NULL,
  `FeatureID` int(11) DEFAULT NULL,
  PRIMARY KEY (`FeatureLocationID`,`REV`),
  KEY `FK_p9o0sc50cparbgwdhviasv27e` (`REV`),
  CONSTRAINT `FK_p9o0sc50cparbgwdhviasv27e` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`)
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
  `DateCreated` datetime NOT NULL,
  `Description` longtext,
  `FeatureDefault` bit(1) NOT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `Name` varchar(255) NOT NULL,
  `Link2FeatureID` int(11) DEFAULT NULL,
  `RegionID` int(11) DEFAULT NULL,
  `SequenceID` int(11) DEFAULT NULL,
  PRIMARY KEY (`FeatureID`),
  KEY `FK_b4jkqt4yxxuuwre2sum1lys12` (`Link2FeatureID`),
  KEY `FK_qps6ai7tcwe35281n22f5qgac` (`RegionID`),
  KEY `FK_c4u5jdc3fu4776plhw40lwqh9` (`SequenceID`),
  CONSTRAINT `FK_b4jkqt4yxxuuwre2sum1lys12` FOREIGN KEY (`Link2FeatureID`) REFERENCES `Features` (`FeatureID`),
  CONSTRAINT `FK_c4u5jdc3fu4776plhw40lwqh9` FOREIGN KEY (`SequenceID`) REFERENCES `Sequences` (`SequenceID`),
  CONSTRAINT `FK_qps6ai7tcwe35281n22f5qgac` FOREIGN KEY (`RegionID`) REFERENCES `Regions` (`TagID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Features`
--

LOCK TABLES `Features` WRITE;
/*!40000 ALTER TABLE `Features` DISABLE KEYS */;
INSERT INTO `Features` VALUES (10,'2007-04-03 00:00:00','Test Feature of type Test Feature Type','\0','2013-03-19 00:00:00.000000','Test Feature',NULL,2,1);
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
  `REVTYPE` tinyint(4) DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `Description` longtext,
  `FeatureDefault` bit(1) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Link2FeatureID` int(11) DEFAULT NULL,
  `RegionID` int(11) DEFAULT NULL,
  `SequenceID` int(11) DEFAULT NULL,
  PRIMARY KEY (`FeatureID`,`REV`),
  KEY `FK_i5819kpc7x3sxes3meew98m7n` (`REV`),
  CONSTRAINT `FK_i5819kpc7x3sxes3meew98m7n` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`)
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
  UNIQUE KEY `UK_fbuc77csbl7qcicve29l7d04a` (`Path`)
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
  KEY `fragment_name_idx` (`Name`),
  KEY `FK_690ir8h4t5713e5g8bpjxuqbv` (`GroupID`),
  KEY `FK_btqnax4uj78wdq9hc58g2s3ey` (`PcrBatchID`),
  KEY `FK_is4e1n5v2h6ynpek902c5h7bu` (`PcrReactionID`),
  KEY `FK_nfv5dwm6h44wnc721jf51uigy` (`RegionID`),
  KEY `FK_jsofbufrsm6m5h8qisfhkv9or` (`SampleID`),
  KEY `FK_n4b3g85fdqd5j407l6n3pmy3b` (`SeqBatchID`),
  KEY `FK_gcnjlac5jn8tln0ug2qkftf9b` (`SeqReactionID`),
  KEY `FK_7kanmm9rrhdfnmdx641s6f68j` (`SpecimenID`),
  CONSTRAINT `FK_690ir8h4t5713e5g8bpjxuqbv` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`),
  CONSTRAINT `FK_7kanmm9rrhdfnmdx641s6f68j` FOREIGN KEY (`SpecimenID`) REFERENCES `Specimens` (`SpecimenID`),
  CONSTRAINT `FK_btqnax4uj78wdq9hc58g2s3ey` FOREIGN KEY (`PcrBatchID`) REFERENCES `PcrBatchs` (`PCRBatchID`),
  CONSTRAINT `FK_gcnjlac5jn8tln0ug2qkftf9b` FOREIGN KEY (`SeqReactionID`) REFERENCES `SeqReactions` (`SeqReactionID`),
  CONSTRAINT `FK_is4e1n5v2h6ynpek902c5h7bu` FOREIGN KEY (`PcrReactionID`) REFERENCES `PcrReactions` (`PcrReactionID`),
  CONSTRAINT `FK_jsofbufrsm6m5h8qisfhkv9or` FOREIGN KEY (`SampleID`) REFERENCES `Samples` (`SampleID`),
  CONSTRAINT `FK_n4b3g85fdqd5j407l6n3pmy3b` FOREIGN KEY (`SeqBatchID`) REFERENCES `SeqBatchs` (`SeqBatchID`),
  CONSTRAINT `FK_nfv5dwm6h44wnc721jf51uigy` FOREIGN KEY (`RegionID`) REFERENCES `Regions` (`TagID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fragments`
--

LOCK TABLES `Fragments` WRITE;
/*!40000 ALTER TABLE `Fragments` DISABLE KEYS */;
INSERT INTO `Fragments` VALUES (1,'2015-01-09 00:00:00.000000','/Users/fragments/run1','frag1.fsa','2015-02-09 00:00:00.000000','frag1','sequence is faint','faint',2,NULL,1,NULL,1,1,NULL,1),(2,'2015-01-09 00:00:00.000000','/Users/fragments/run2','frag2.fsa','2015-02-09 00:00:00.000000','frag002','sequence is faint','good',2,NULL,1,NULL,2,1,NULL,2);
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
  `REVTYPE` tinyint(4) DEFAULT NULL,
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
  CONSTRAINT `FK_c3c6aipgssi2std58qr8hltxa` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FungalInfos`
--

LOCK TABLES `FungalInfos` WRITE;
/*!40000 ALTER TABLE `FungalInfos` DISABLE KEYS */;
INSERT INTO `FungalInfos` VALUES (1,'CCFC23','Dunno','DAOM2323',NULL,'Water','KAS 1','Keith Seifert','2007-01-05','2013-03-19 00:00:00.000000',NULL,'bob1','Culture','2007-01-05','2007-01-05'),(2,'CCFC2','Dunno2','DAOM2323',NULL,'Water2','KAS 2','Keith Seifert','2002-01-05','2013-03-19 00:00:00.000000',NULL,'bob2','Culture2','2004-01-02','2004-02-05'),(3,'CCFC3','Dunno','DAOM233',NULL,'Water3','KAS 3','Keith3 Seifert','2003-01-05','2013-03-19 00:00:00.000000',NULL,'bob3','Culture3','2007-01-03','2007-03-05'),(4,'CCFC4','soil4','DAOM24',NULL,'Water4','KAS 4','Keith4 Seifert','2004-01-05','2013-03-19 00:00:00.000000',NULL,'bob4','Culture4','2007-04-05','2007-01-05'),(5,'CCFC5','soil5','DAOM25',NULL,'Water5','KAS 5','Keith4 Seifert','2005-01-05','2013-03-19 00:00:00.000000',NULL,'bob5','Culture5','2007-05-05','2007-01-05'),(12,'CCFC12','soil12','DAOM212',NULL,'Water12','KAS 12','Keith4 Seifert','2004-05-12','2013-03-19 00:00:00.000000',NULL,'bob12','Culture12','2005-05-12','2005-01-05'),(13,'CCFC13','soil12','DAOM213',NULL,'Water13','XYZ 13','Mat Poff','2004-05-12','2013-03-19 00:00:00.000000',NULL,'bob13','Culture13','2005-05-13','2005-01-05'),(14,'CCFC14','soil14','DAOM214',NULL,'Water14','XYZ 14','Mat Poff','2004-05-14','2013-03-19 00:00:00.000000',NULL,'bob14','Culture14','2005-05-14','2005-01-05');
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
  `REVTYPE` tinyint(4) DEFAULT NULL,
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
  CONSTRAINT `FK_60m2opdbdh0oovy8ojgwg2kf3` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`)
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
  KEY `FK_k7l4tnbth2y7o68pirvugiewk` (`FragmentID`),
  KEY `FK_rpbwh1f9k66r13ma96vy1wmvq` (`GroupID`),
  KEY `FK_rn5embtsuc9p9bbs027gun5px` (`PcrReactionID`),
  KEY `FK_agn2dbwsghp1adwacwp995vsu` (`SampleID`),
  KEY `FK_6v2oc6eppswssh1e5sqe9bnrk` (`SeqReactionID`),
  KEY `FK_3cwj5t84yd9qrhe8q0q9lc95k` (`SpecimenID`),
  CONSTRAINT `FK_3cwj5t84yd9qrhe8q0q9lc95k` FOREIGN KEY (`SpecimenID`) REFERENCES `Specimens` (`SpecimenID`),
  CONSTRAINT `FK_6v2oc6eppswssh1e5sqe9bnrk` FOREIGN KEY (`SeqReactionID`) REFERENCES `SeqReactions` (`SeqReactionID`),
  CONSTRAINT `FK_agn2dbwsghp1adwacwp995vsu` FOREIGN KEY (`SampleID`) REFERENCES `Samples` (`SampleID`),
  CONSTRAINT `FK_k7l4tnbth2y7o68pirvugiewk` FOREIGN KEY (`FragmentID`) REFERENCES `Fragments` (`FragmentID`),
  CONSTRAINT `FK_rn5embtsuc9p9bbs027gun5px` FOREIGN KEY (`PcrReactionID`) REFERENCES `PcrReactions` (`PcrReactionID`),
  CONSTRAINT `FK_rpbwh1f9k66r13ma96vy1wmvq` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Genotypes`
--

LOCK TABLES `Genotypes` WRITE;
/*!40000 ALTER TABLE `Genotypes` DISABLE KEYS */;
INSERT INTO `Genotypes` VALUES (1,NULL,'dye1','frag1.fsa','Project 1',NULL,'COI',NULL,'Project 1.csv',NULL,1,1,NULL,NULL,NULL,1),(2,NULL,'dye2','frag2.fsa','Project 2',NULL,'ITS',NULL,'Project 2.csv',NULL,1,1,NULL,NULL,NULL,2),(3,NULL,'dye2','frag_002_A10_Frag#132_SH_ME_PT12_73_SSR_RSA2168_154','Project 3',NULL,'ITS',NULL,'Project 3.csv',NULL,1,2,4,1,4,2),(4,NULL,'dye2','frag2.fsa','Project 4',NULL,'ITS',NULL,'Project 4.csv',NULL,1,2,4,1,4,2),(5,NULL,'dye2','frag2.fsa','Project 5',NULL,'ITS',NULL,'Project 5.csv',NULL,1,2,NULL,NULL,NULL,2),(6,NULL,'dye2','frag2.fsa','Project 6',NULL,'ITS',NULL,'Project 6.csv',NULL,1,2,NULL,NULL,NULL,2);
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
  `REVTYPE` tinyint(4) DEFAULT NULL,
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
  CONSTRAINT `FK_5251so8coqx5l8rxh8yb4kwoq` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`)
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
-- Table structure for table `Genotypes_Alleles`
--

DROP TABLE IF EXISTS `Genotypes_Alleles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Genotypes_Alleles` (
  `Genotypes_GenotypeID` int(11) NOT NULL,
  `alleles_ID` int(11) NOT NULL,
  PRIMARY KEY (`Genotypes_GenotypeID`,`alleles_ID`),
  UNIQUE KEY `UK_p9aeysdiexcu7dr041maq74bd` (`alleles_ID`),
  CONSTRAINT `FK_jsstmpg0ykv0ka19vwsjh86ap` FOREIGN KEY (`Genotypes_GenotypeID`) REFERENCES `Genotypes` (`GenotypeID`),
  CONSTRAINT `FK_p9aeysdiexcu7dr041maq74bd` FOREIGN KEY (`alleles_ID`) REFERENCES `Alleles` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Genotypes_Alleles`
--

LOCK TABLES `Genotypes_Alleles` WRITE;
/*!40000 ALTER TABLE `Genotypes_Alleles` DISABLE KEYS */;
/*!40000 ALTER TABLE `Genotypes_Alleles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Genotypes_Alleles_AUD`
--

DROP TABLE IF EXISTS `Genotypes_Alleles_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Genotypes_Alleles_AUD` (
  `REV` int(11) NOT NULL,
  `Genotypes_GenotypeID` int(11) NOT NULL,
  `alleles_ID` int(11) NOT NULL,
  `REVTYPE` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`REV`,`Genotypes_GenotypeID`,`alleles_ID`),
  CONSTRAINT `FK_9544thckmnk9s5b7pnnhebp6l` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Genotypes_Alleles_AUD`
--

LOCK TABLES `Genotypes_Alleles_AUD` WRITE;
/*!40000 ALTER TABLE `Genotypes_Alleles_AUD` DISABLE KEYS */;
/*!40000 ALTER TABLE `Genotypes_Alleles_AUD` ENABLE KEYS */;
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
  CONSTRAINT `FK_jt00wmbuf1wewbs6lxhhvrnhl` FOREIGN KEY (`GoProjectID`) REFERENCES `GoProjects` (`GoProjectID`)
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
  `DateCreated` datetime NOT NULL,
  `Description` longtext,
  `LastModified` datetime(6) DEFAULT NULL,
  `ProjectName` varchar(50) NOT NULL,
  `ProjectID` int(11) DEFAULT NULL,
  PRIMARY KEY (`GoProjectID`),
  UNIQUE KEY `UK_9id627ihsxoaojj0d5pxkyp5d` (`ProjectName`),
  KEY `FK_mqehuefgg1n7lejxjaurysses` (`ProjectID`),
  CONSTRAINT `FK_mqehuefgg1n7lejxjaurysses` FOREIGN KEY (`ProjectID`) REFERENCES `Projects` (`ProjectID`)
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Groups`
--

LOCK TABLES `Groups` WRITE;
/*!40000 ALTER TABLE `Groups` DISABLE KEYS */;
INSERT INTO `Groups` VALUES (1,'0000',NULL,'Admin Group','2013-03-19 00:00:00.000000'),(2,'0000',NULL,'User Group','2013-03-19 00:00:00.000000'),(3,'0000',NULL,'TEST Group','2013-03-19 00:00:00.000000'),(4,'0000',NULL,'CNC Loan Diptera','2013-03-19 00:00:00.000000'),(5,'0000',NULL,'CNC Loan General','2013-03-19 00:00:00.000000'),(6,'0000',NULL,'CNC Loan Staff','2013-03-19 00:00:00.000000'),(7,'0000',NULL,'CNC Loan Client','2013-03-19 00:00:00.000000'),(8,'1000',NULL,'Public','2016-06-15 00:00:00.000000');
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
  KEY `FK_klgh9npei7xn60sbiv941cn5e` (`TaxonID`),
  KEY `FK_i0qacll44p0uklvkejag31tf3` (`TaxonomyID`),
  CONSTRAINT `FK_i0qacll44p0uklvkejag31tf3` FOREIGN KEY (`TaxonomyID`) REFERENCES `Taxonomys` (`TaxonomyID`),
  CONSTRAINT `FK_klgh9npei7xn60sbiv941cn5e` FOREIGN KEY (`TaxonID`) REFERENCES `Taxa` (`TaxonID`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hosts`
--

LOCK TABLES `Hosts` WRITE;
/*!40000 ALTER TABLE `Hosts` DISABLE KEYS */;
INSERT INTO `Hosts` VALUES (1,'description 1','habitat 1','host etc 1','2013-03-19 00:00:00.000000','part 1',NULL,5),(2,'description 2','habitat 2','host etc 2','2013-03-19 00:00:00.000000','part 2',NULL,6),(3,'description 3','habitat 3','host etc 3','2013-03-19 00:00:00.000000','part 3',NULL,7),(4,'description 4','habitat 4','host etc 4','2013-03-19 00:00:00.000000','part 4',NULL,5),(5,'description 5','habitat 5','host etc 5','2013-03-19 00:00:00.000000','part 5',NULL,5),(12,'description 12','habitat 12','host etc 12','2013-03-19 00:00:00.000000','part 12',NULL,8),(13,'description 13','habitat 13','host etc 13','2013-03-19 00:00:00.000000','part 13',NULL,8),(14,'description 14','habitat 14','host etc 14','2013-03-19 00:00:00.000000','part 14',NULL,8);
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
  `REVTYPE` tinyint(4) DEFAULT NULL,
  `Description` varchar(512) DEFAULT NULL,
  `Habitat` varchar(512) DEFAULT NULL,
  `HostETC` varchar(225) DEFAULT NULL,
  `Part` varchar(50) DEFAULT NULL,
  `TaxonID` int(11) DEFAULT NULL,
  `TaxonomyID` int(11) DEFAULT NULL,
  PRIMARY KEY (`HostID`,`REV`),
  KEY `FK_f1ko8oiulps3jmtxrq9f87mmj` (`REV`),
  CONSTRAINT `FK_f1ko8oiulps3jmtxrq9f87mmj` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`)
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
  CONSTRAINT `FK_2uf57ss4mb8chcq4jlq5tmtwv` FOREIGN KEY (`HyProjectID`) REFERENCES `HybProjects` (`HyProjectID`),
  CONSTRAINT `FK_ebs36c3v9l1trpqs5obdfxmt4` FOREIGN KEY (`ProjectID`) REFERENCES `Projects` (`ProjectID`)
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
  `Date` datetime NOT NULL,
  `Description` longtext,
  `Duplicate` bit(1) NOT NULL,
  `ExpositionTime` time NOT NULL,
  `ImageDir` varchar(255) DEFAULT NULL,
  `ImageFileName` varchar(50) DEFAULT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `ArrayTypeID` int(11) DEFAULT NULL,
  `HyProjectID` int(11) DEFAULT NULL,
  PRIMARY KEY (`HybridizationID`),
  KEY `FK_nyf42lnk7bl6lvvutnqm8u4vy` (`ArrayTypeID`),
  KEY `FK_mqt6y55s7tmnvab0suukcp22v` (`HyProjectID`),
  CONSTRAINT `FK_mqt6y55s7tmnvab0suukcp22v` FOREIGN KEY (`HyProjectID`) REFERENCES `HybProjects` (`HyProjectID`),
  CONSTRAINT `FK_nyf42lnk7bl6lvvutnqm8u4vy` FOREIGN KEY (`ArrayTypeID`) REFERENCES `ArrayTypes` (`ArrayTypeID`)
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
-- Table structure for table `INT_GROUP_TO_MESSAGE`
--

DROP TABLE IF EXISTS `INT_GROUP_TO_MESSAGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INT_GROUP_TO_MESSAGE` (
  `GROUP_KEY` char(36) NOT NULL,
  `MESSAGE_ID` char(36) NOT NULL,
  PRIMARY KEY (`GROUP_KEY`,`MESSAGE_ID`)
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
-- Table structure for table `INT_MESSAGE`
--

DROP TABLE IF EXISTS `INT_MESSAGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INT_MESSAGE` (
  `MESSAGE_ID` char(36) NOT NULL,
  `REGION` varchar(100) DEFAULT NULL,
  `CREATED_DATE` datetime(6) NOT NULL,
  `MESSAGE_BYTES` blob,
  PRIMARY KEY (`MESSAGE_ID`),
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
  `GROUP_KEY` char(36) NOT NULL,
  `REGION` varchar(100) DEFAULT NULL,
  `MARKED` bigint(20) DEFAULT NULL,
  `COMPLETE` bigint(20) DEFAULT NULL,
  `LAST_RELEASED_SEQUENCE` bigint(20) DEFAULT NULL,
  `CREATED_DATE` datetime(6) NOT NULL,
  `UPDATED_DATE` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`GROUP_KEY`)
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
  KEY `FK_nabkyxwrsp4lhr4uihk8idcru` (`SpecimenID`),
  KEY `FK_sdfpg9um9vmjk132spagwfp3q` (`TaxonID`),
  KEY `FK_mvxonmas5vjv82wb2nym1na41` (`TaxonomyID`),
  CONSTRAINT `FK_16rjw3tn0pbitl26qtce8a0iq` FOREIGN KEY (`SequenceID`) REFERENCES `Sequences` (`SequenceID`),
  CONSTRAINT `FK_mvxonmas5vjv82wb2nym1na41` FOREIGN KEY (`TaxonomyID`) REFERENCES `Taxonomys` (`TaxonomyID`),
  CONSTRAINT `FK_nabkyxwrsp4lhr4uihk8idcru` FOREIGN KEY (`SpecimenID`) REFERENCES `Specimens` (`SpecimenID`),
  CONSTRAINT `FK_sdfpg9um9vmjk132spagwfp3q` FOREIGN KEY (`TaxonID`) REFERENCES `Taxa` (`TaxonID`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Identifications`
--

LOCK TABLES `Identifications` WRITE;
/*!40000 ALTER TABLE `Identifications` DISABLE KEYS */;
INSERT INTO `Identifications` VALUES (1,'','10','an error',NULL,'Tom Jones','aEmail@email.com','2013-03-19 00:00:00.000000','','11',NULL,'','Errored','2007',NULL,1,NULL,1),(2,'','10','test error',NULL,'Tommy','aEmail@email.com','2013-03-19 00:00:00.000000','','11',NULL,'\0','Errored','2002',NULL,2,NULL,2),(3,'','10','',NULL,'Tom ','a3Email@email.com','2013-03-19 00:00:00.000000','','11',NULL,'','Grouped:Identified','2003',NULL,3,NULL,3),(4,'','10','',NULL,'Jones','a4Email@email.com','2013-03-19 00:00:00.000000','','11',NULL,'','Grouped:Identified','2004',NULL,4,NULL,4),(5,'','10','',NULL,'Smith','a5Email@email.com','2013-03-19 00:00:00.000000','','11',NULL,'\0','Grouped:Identified','2005',NULL,5,NULL,5),(12,'','10','12error',NULL,'Smith','a12Email@email.com','2013-03-19 00:00:00.000000','','11',NULL,'','Errored','2012',NULL,12,NULL,12),(13,'','10','12error',NULL,'Smith','a12Email@email.com','2013-03-19 00:00:00.000000','','11',NULL,'','Errored','2012',NULL,13,NULL,13),(14,'','10','12error',NULL,'Smith','a12Email@email.com','2013-03-19 00:00:00.000000','','11',NULL,'','Errored','2012',NULL,14,NULL,14),(100,'','10','100error',NULL,'Smith','a100Email@email.com','2013-03-19 00:00:00.000000','','11',NULL,'','Errored','2012',1,100,NULL,100);
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
  `REVTYPE` tinyint(4) DEFAULT NULL,
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
  CONSTRAINT `FK_q9hx6uro42m6jguo0ubywc73b` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`)
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
  `Notes` varchar(1024) DEFAULT NULL,
  `Width` int(11) DEFAULT NULL,
  `ImportPermitId` int(11) NOT NULL,
  PRIMARY KEY (`ImportPermitAttachId`),
  KEY `FK_8op37369nil7onkhfvwsjx8qg` (`ImportPermitId`),
  CONSTRAINT `FK_8op37369nil7onkhfvwsjx8qg` FOREIGN KEY (`ImportPermitId`) REFERENCES `ImportPermits` (`ImportPermitID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
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
  CONSTRAINT `FK_kn41lnvoh0wd5wo2otg013lnw` FOREIGN KEY (`ImportPermitID`) REFERENCES `ImportPermits` (`ImportPermitID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ImportPermitEvents`
--

LOCK TABLES `ImportPermitEvents` WRITE;
/*!40000 ALTER TABLE `ImportPermitEvents` DISABLE KEYS */;
INSERT INTO `ImportPermitEvents` VALUES (1,'2007-01-05','Bob','2013-03-19 00:00:00.000000','7+',1),(2,'2003-04-05','Jean','2013-03-19 00:00:00.000000','12',2),(3,'2007-01-05','Xavier','2013-03-19 00:00:00.000000','1',3),(4,'2007-01-05','Logan','2013-03-19 00:00:00.000000','12000',4),(5,'2008-01-05','John','2013-03-19 00:00:00.000000','120',5),(6,'2005-01-05','Peter','2013-03-19 00:00:00.000000','4',6),(7,'2003-01-05','Ron','2013-03-19 00:00:00.000000','1',1),(8,'2003-01-05','Greg','2013-03-19 00:00:00.000000','2',3);
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
  `REVTYPE` tinyint(4) DEFAULT NULL,
  `ImportationDate` date DEFAULT NULL,
  `ImportedBy` varchar(200) DEFAULT NULL,
  `NumberOfSamples` varchar(50) DEFAULT NULL,
  `ImportPermitID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ImportPermitEventID`,`REV`),
  KEY `FK_3gp7w8nmhjrync27b1vmjm1d3` (`REV`),
  CONSTRAINT `FK_3gp7w8nmhjrync27b1vmjm1d3` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ImportPermitEvents_AUD`
--

LOCK TABLES `ImportPermitEvents_AUD` WRITE;
/*!40000 ALTER TABLE `ImportPermitEvents_AUD` DISABLE KEYS */;
INSERT INTO `ImportPermitEvents_AUD` VALUES (9,3,0,NULL,NULL,NULL,36),(9,4,2,NULL,NULL,NULL,NULL);
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
  UNIQUE KEY `UK_l2q8blrlithu5ngexk2at256h` (`CFIAPermitNumber`),
  KEY `FK_8t3csx2jn8t4wvjfyx0o87wsv` (`GroupID`),
  CONSTRAINT `FK_8t3csx2jn8t4wvjfyx0o87wsv` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ImportPermits`
--

LOCK TABLES `ImportPermits` WRITE;
/*!40000 ALTER TABLE `ImportPermits` DISABLE KEYS */;
INSERT INTO `ImportPermits` VALUES (1,'T-100','China','2013-03-19 00:00:00.000000',1),(2,'T-200','Africa','2013-03-19 00:00:00.000000',1),(3,'T-300','Japan','2013-03-19 00:00:00.000000',3),(4,'T-400','India','2013-03-19 00:00:00.000000',3),(5,'T-1000','UK','2013-03-19 00:00:00.000000',3),(6,'T-3000','America','2013-03-19 00:00:00.000000',3),(12,'T-112','Bolivia','2013-03-19 00:00:00.000000',1),(13,'T-113','Bolivia','2013-03-19 00:00:00.000000',1),(14,'T-114','Bolivia','2013-03-19 00:00:00.000000',1);
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
  `REVTYPE` tinyint(4) DEFAULT NULL,
  `CFIAPermitNumber` varchar(50) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ImportPermitID`,`REV`),
  KEY `FK_9yt5xppi0c6phhbb9a0uo0klr` (`REV`),
  CONSTRAINT `FK_9yt5xppi0c6phhbb9a0uo0klr` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ImportPermits_AUD`
--

LOCK TABLES `ImportPermits_AUD` WRITE;
/*!40000 ALTER TABLE `ImportPermits_AUD` DISABLE KEYS */;
INSERT INTO `ImportPermits_AUD` VALUES (3,1,1,'T-Update','Country Update',2),(36,2,0,'T-Test','Canada',2),(36,3,1,'T-Test','Canada',2),(36,4,2,NULL,NULL,NULL);
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
  CONSTRAINT `FK_j2o9mp4t113b0nuulwkidj9kh` FOREIGN KEY (`LanguageID`) REFERENCES `UsageKeys` (`UsageKeysID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Lexicon`
--

LOCK TABLES `Lexicon` WRITE;
/*!40000 ALTER TABLE `Lexicon` DISABLE KEYS */;
INSERT INTO `Lexicon` VALUES (1,'2013-03-19 00:00:00.000000','John','taxonomy',1),(2,'2013-03-19 00:00:00.000000','John','biology',1),(3,'2013-03-19 00:00:00.000000','John','distribution',1),(4,'2013-03-19 00:00:00.000000','John','morphology',1);
/*!40000 ALTER TABLE `Lexicon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LexiconGroups`
--

DROP TABLE IF EXISTS `LexiconGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LexiconGroups` (
  `LexiconGroupID` int(11) NOT NULL AUTO_INCREMENT,
  `LastModified` datetime(6) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  `LexiconID` int(11) DEFAULT NULL,
  PRIMARY KEY (`LexiconGroupID`),
  KEY `FK_7wr7n039uaxxytw4qwac0401p` (`GroupID`),
  KEY `FK_3ak1ms9na75m4spxnkp9hkn4g` (`LexiconID`),
  CONSTRAINT `FK_3ak1ms9na75m4spxnkp9hkn4g` FOREIGN KEY (`LexiconID`) REFERENCES `Lexicon` (`LexiconID`),
  CONSTRAINT `FK_7wr7n039uaxxytw4qwac0401p` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LexiconGroups`
--

LOCK TABLES `LexiconGroups` WRITE;
/*!40000 ALTER TABLE `LexiconGroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `LexiconGroups` ENABLE KEYS */;
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
  KEY `FK_lobmdymx6yfsxg526yp1xjt2y` (`LexiconID`),
  KEY `FK_3mvttib8prndkuvcuts418msh` (`UsageID`),
  CONSTRAINT `FK_3mvttib8prndkuvcuts418msh` FOREIGN KEY (`UsageID`) REFERENCES `UsageKeys` (`UsageKeysID`),
  CONSTRAINT `FK_lobmdymx6yfsxg526yp1xjt2y` FOREIGN KEY (`LexiconID`) REFERENCES `Lexicon` (`LexiconID`)
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
  UNIQUE KEY `UK_i7jye0mnqo3vd3vsgj4j55ocu` (`Name`),
  KEY `FK_9bdt7x1mdttes489fiu6ca0vc` (`SampleID`),
  CONSTRAINT `FK_9bdt7x1mdttes489fiu6ca0vc` FOREIGN KEY (`SampleID`) REFERENCES `Samples` (`SampleID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Libraries`
--

LOCK TABLES `Libraries` WRITE;
/*!40000 ALTER TABLE `Libraries` DISABLE KEYS */;
INSERT INTO `Libraries` VALUES (1,'Genomic Library','2013-03-19 00:00:00.000000','Library 1',2);
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
  CONSTRAINT `FK_873ojhy1tfgyvqcvlhlaq1v0w` FOREIGN KEY (`LibraryID`) REFERENCES `Libraries` (`LibraryID`),
  CONSTRAINT `FK_fkisljs3fflmp59td40rdh9py` FOREIGN KEY (`ProjectID`) REFERENCES `Projects` (`ProjectID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LibrariesProjects`
--

LOCK TABLES `LibrariesProjects` WRITE;
/*!40000 ALTER TABLE `LibrariesProjects` DISABLE KEYS */;
INSERT INTO `LibrariesProjects` VALUES (1,1,1);
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
  KEY `FK_n24pcn7qawqpqsrnqk5blmoyp` (`CareOf`),
  KEY `FK_a4ruos4y5lde9c6vpbfedu1x8` (`LoanFormId`),
  CONSTRAINT `FK_a4ruos4y5lde9c6vpbfedu1x8` FOREIGN KEY (`LoanFormId`) REFERENCES `LoanForm` (`LoanFormID`),
  CONSTRAINT `FK_n24pcn7qawqpqsrnqk5blmoyp` FOREIGN KEY (`CareOf`) REFERENCES `People` (`PeopleID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LoanAct`
--

LOCK TABLES `LoanAct` WRITE;
/*!40000 ALTER TABLE `LoanAct` DISABLE KEYS */;
INSERT INTO `LoanAct` VALUES (1,'aaa','Acknowledged','2011-10-21','2013-03-19 00:00:00.000000',1,1);
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
  `Width` int(11) DEFAULT NULL,
  `LoanFormId` int(11) NOT NULL,
  PRIMARY KEY (`LoanAttachId`),
  KEY `FK_8hienxmj6umhwwdwtdia6mo00` (`LoanFormId`),
  CONSTRAINT `FK_8hienxmj6umhwwdwtdia6mo00` FOREIGN KEY (`LoanFormId`) REFERENCES `LoanForm` (`LoanFormID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LoanAttach`
--

LOCK TABLES `LoanAttach` WRITE;
/*!40000 ALTER TABLE `LoanAttach` DISABLE KEYS */;
INSERT INTO `LoanAttach` VALUES (1,'2011-10-21','pdf','AT1-1.pdf','Loan invoice',0,0,1);
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
  UNIQUE KEY `UK_r2o9pn5gdr6mxwl692sw1tav` (`InvoiceId`),
  KEY `FK_ap7h52t09ifgna8eb18rewjdw` (`Address`),
  KEY `FK_ksm66fxg7l7qyaxf1vsg0bfl2` (`ApprovedBy`),
  KEY `FK_cvux8wn8y5p76osk93xs676h3` (`Borrower`),
  KEY `FK_4p35ltc0esje5dqk6bijs1j8b` (`CareOf`),
  KEY `FK_focrnu2ify77abyh6uxpwlkfx` (`CollectionCode`),
  KEY `FK_mfvlp5u1havi9ud5sjy5wnqud` (`GroupID`),
  KEY `FK_ok08fa4vh19nl7hqardtce2vh` (`InitiatedBy`),
  CONSTRAINT `FK_4p35ltc0esje5dqk6bijs1j8b` FOREIGN KEY (`CareOf`) REFERENCES `People` (`PeopleID`),
  CONSTRAINT `FK_ap7h52t09ifgna8eb18rewjdw` FOREIGN KEY (`Address`) REFERENCES `Addresses` (`AddressID`),
  CONSTRAINT `FK_cvux8wn8y5p76osk93xs676h3` FOREIGN KEY (`Borrower`) REFERENCES `People` (`PeopleID`),
  CONSTRAINT `FK_focrnu2ify77abyh6uxpwlkfx` FOREIGN KEY (`CollectionCode`) REFERENCES `BiologicalCollections` (`BiologicalCollectionID`),
  CONSTRAINT `FK_ksm66fxg7l7qyaxf1vsg0bfl2` FOREIGN KEY (`ApprovedBy`) REFERENCES `People` (`PeopleID`),
  CONSTRAINT `FK_mfvlp5u1havi9ud5sjy5wnqud` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`),
  CONSTRAINT `FK_ok08fa4vh19nl7hqardtce2vh` FOREIGN KEY (`InitiatedBy`) REFERENCES `People` (`PeopleID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LoanForm`
--

LOCK TABLES `LoanForm` WRITE;
/*!40000 ALTER TABLE `LoanForm` DISABLE KEYS */;
INSERT INTO `LoanForm` VALUES (1,'aaa',NULL,'X-11-001','2013-03-19 00:00:00.000000','aaa','1 ichneumon',1,'911','2012-10-21','2011-10-21','Airmail',1,1,1,1,1,4,1);
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
  `DateMoved` datetime DEFAULT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `WellColumn` int(11) DEFAULT NULL,
  `WellRow` varchar(2) DEFAULT NULL,
  `CloneID` int(11) DEFAULT NULL,
  `ContainerID` int(11) NOT NULL,
  `FragmentID` int(11) DEFAULT NULL,
  `MixedSpecimenID` int(11) DEFAULT NULL,
  `PcrPrimerID` int(11) DEFAULT NULL,
  `SampleID` int(11) DEFAULT NULL,
  `SequenceID` int(11) DEFAULT NULL,
  `SpecimenReplicateID` int(11) DEFAULT NULL,
  PRIMARY KEY (`LocationID`),
  UNIQUE KEY `UK_ftabvest74ag91ge26690247a` (`ContainerID`,`WellColumn`,`WellRow`),
  KEY `FK_t6cd9ar6svjw54k8x9hk5rfoa` (`CloneID`),
  KEY `FK_4ytymn0oh44qtb1qlhxde27oe` (`FragmentID`),
  KEY `FK_amshi66em4jphq5t3nempuqb9` (`MixedSpecimenID`),
  KEY `FK_owenubne8jbacxg0mwdliutp5` (`PcrPrimerID`),
  KEY `FK_pgeq6y89t7machd9auk56xfxv` (`SampleID`),
  KEY `FK_swn4iqbmyw7uoe1m7hq6fnyst` (`SequenceID`),
  KEY `FK_p2if06fynkj3xjn86klpe2rhq` (`SpecimenReplicateID`),
  CONSTRAINT `FK_4ytymn0oh44qtb1qlhxde27oe` FOREIGN KEY (`FragmentID`) REFERENCES `Fragments` (`FragmentID`),
  CONSTRAINT `FK_amshi66em4jphq5t3nempuqb9` FOREIGN KEY (`MixedSpecimenID`) REFERENCES `MixedSpecimens` (`MixedSpecimenID`),
  CONSTRAINT `FK_hqjcgefol6i4h3bx8mxyarxyl` FOREIGN KEY (`ContainerID`) REFERENCES `Containers` (`ContainerID`),
  CONSTRAINT `FK_owenubne8jbacxg0mwdliutp5` FOREIGN KEY (`PcrPrimerID`) REFERENCES `PcrPrimers` (`PCRPrimerID`),
  CONSTRAINT `FK_p2if06fynkj3xjn86klpe2rhq` FOREIGN KEY (`SpecimenReplicateID`) REFERENCES `SpecimenReplicates` (`SpecimenReplicateID`),
  CONSTRAINT `FK_pgeq6y89t7machd9auk56xfxv` FOREIGN KEY (`SampleID`) REFERENCES `Samples` (`SampleID`),
  CONSTRAINT `FK_swn4iqbmyw7uoe1m7hq6fnyst` FOREIGN KEY (`SequenceID`) REFERENCES `Sequences` (`SequenceID`),
  CONSTRAINT `FK_t6cd9ar6svjw54k8x9hk5rfoa` FOREIGN KEY (`CloneID`) REFERENCES `Clones` (`CloneID`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Locations`
--

LOCK TABLES `Locations` WRITE;
/*!40000 ALTER TABLE `Locations` DISABLE KEYS */;
INSERT INTO `Locations` VALUES (12,'2006-05-03 00:00:00','2013-03-19 00:00:00.000000',1,'C',NULL,1,NULL,NULL,NULL,NULL,1,NULL),(13,'2007-05-03 00:00:00','2013-03-19 00:00:00.000000',2,'A',NULL,5,NULL,NULL,NULL,NULL,2,NULL),(14,'2004-05-03 00:00:00','2013-03-19 00:00:00.000000',1,'A',NULL,2,NULL,NULL,NULL,NULL,NULL,NULL),(15,'2005-05-03 00:00:00','2013-03-19 00:00:00.000000',2,'B',NULL,2,NULL,NULL,NULL,NULL,NULL,NULL),(16,'2006-05-03 00:00:00','2013-03-19 00:00:00.000000',3,'C',NULL,3,NULL,NULL,NULL,NULL,NULL,NULL),(17,'2007-05-03 00:00:00','2013-03-19 00:00:00.000000',4,'D',NULL,3,NULL,NULL,NULL,NULL,NULL,NULL),(18,'2007-05-03 00:00:00','2013-03-19 00:00:00.000000',4,'A',NULL,6,NULL,NULL,NULL,NULL,NULL,NULL),(19,'2007-05-03 00:00:00','2013-03-19 00:00:00.000000',3,'B',NULL,6,NULL,NULL,NULL,NULL,NULL,NULL),(20,'2007-05-03 00:00:00','2013-03-19 00:00:00.000000',2,'C',NULL,6,NULL,NULL,NULL,NULL,NULL,NULL),(21,'2007-05-03 00:00:00','2013-03-19 00:00:00.000000',1,'D',NULL,6,NULL,NULL,NULL,NULL,NULL,NULL),(22,'2007-05-03 00:00:00','2013-03-19 00:00:00.000000',4,'E',NULL,4,NULL,NULL,NULL,NULL,NULL,NULL),(23,'2007-05-03 00:00:00','2013-03-19 00:00:00.000000',1,'C',NULL,4,NULL,NULL,NULL,NULL,NULL,NULL),(24,'2007-05-03 00:00:00','2013-03-19 00:00:00.000000',3,'C',NULL,5,NULL,NULL,NULL,NULL,NULL,NULL),(25,'2007-05-03 00:00:00','2013-03-19 00:00:00.000000',5,'D',NULL,5,NULL,NULL,NULL,NULL,NULL,NULL);
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
  `Notes` varchar(1024) DEFAULT NULL,
  `Width` int(11) DEFAULT NULL,
  `MixedSpecimenId` int(11) NOT NULL,
  PRIMARY KEY (`MixedSpecimenAttachId`),
  KEY `FK_c5x1738wdf7q5e7hxgq4o78e` (`MixedSpecimenId`),
  CONSTRAINT `FK_c5x1738wdf7q5e7hxgq4o78e` FOREIGN KEY (`MixedSpecimenId`) REFERENCES `MixedSpecimens` (`MixedSpecimenID`)
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
  UNIQUE KEY `UK_3bnrsjvog8w18jw1y2eh5hdo0` (`MixsSpecificationID`),
  KEY `mixedSpecimen_substrateType_idx` (`SubstrateType`),
  KEY `FK_mr2al2qrjhtfdjurqp4rlai3a` (`BiologicalCollectionID`),
  KEY `FK_a6yywjr2k3p8liflvfcqvijhk` (`CollectionInfoID`),
  KEY `FK_4sbel4md60bhymihq22boplmq` (`GroupID`),
  KEY `FK_94np4iqalsmisrmtv3i0ce51c` (`ImportPermitID`),
  CONSTRAINT `FK_3bnrsjvog8w18jw1y2eh5hdo0` FOREIGN KEY (`MixsSpecificationID`) REFERENCES `MixsSpecification` (`MixsSpecificationID`),
  CONSTRAINT `FK_4sbel4md60bhymihq22boplmq` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`),
  CONSTRAINT `FK_94np4iqalsmisrmtv3i0ce51c` FOREIGN KEY (`ImportPermitID`) REFERENCES `ImportPermits` (`ImportPermitID`),
  CONSTRAINT `FK_a6yywjr2k3p8liflvfcqvijhk` FOREIGN KEY (`CollectionInfoID`) REFERENCES `CollectionInfos` (`CollectionInfoID`),
  CONSTRAINT `FK_mr2al2qrjhtfdjurqp4rlai3a` FOREIGN KEY (`BiologicalCollectionID`) REFERENCES `BiologicalCollections` (`BiologicalCollectionID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MixedSpecimens`
--

LOCK TABLES `MixedSpecimens` WRITE;
/*!40000 ALTER TABLE `MixedSpecimens` DISABLE KEYS */;
INSERT INTO `MixedSpecimens` VALUES (1,'some Plantes',NULL,NULL,NULL,NULL,'some Fungi',NULL,'2013-03-19 00:00:00.000000','2000','here are some notes',NULL,'otherId_1',NULL,'2007-01-05',NULL,NULL,NULL,'someSoil','test Treatment',NULL,NULL,NULL,1,7,1,5,7),(2,'some Plantes',NULL,NULL,NULL,NULL,'some Fungi',NULL,'2013-03-19 00:00:00.000000','2002','here are some notes',NULL,'otherId_2',NULL,'2007-01-05',NULL,NULL,NULL,'Soil Sample','test Treatment',NULL,NULL,NULL,1,6,3,4,8),(3,'some Plantes',NULL,NULL,NULL,NULL,'some Fungi3',NULL,'2013-03-19 00:00:00.000000','2003','here are some notes',NULL,'otherId_3',NULL,'2007-01-05',NULL,NULL,NULL,'Air Sample','test Treatment',NULL,NULL,NULL,5,5,1,6,9),(4,'n/a',NULL,NULL,NULL,NULL,'some Fungi4',NULL,'2013-03-19 00:00:00.000000','2004','here are some notes',NULL,'otherId_4',NULL,'2007-01-05',NULL,NULL,NULL,'Air Sample','test Treatment',NULL,NULL,NULL,5,5,1,2,10),(5,'n/a',NULL,NULL,NULL,NULL,'some Fungi5',NULL,'2013-03-19 00:00:00.000000','2005','here are some notes',NULL,'otherId_5',NULL,'2007-01-05',NULL,NULL,NULL,'Air Sample','test Treatment',NULL,NULL,NULL,5,5,1,2,11),(6,'n/a',NULL,NULL,NULL,NULL,'some Fungi6',NULL,'2013-03-19 00:00:00.000000','2006','here are some notes',NULL,'otherId_6',NULL,'2007-01-05',NULL,NULL,NULL,'Rain Sample','test Treatment',NULL,NULL,NULL,6,6,1,2,6),(12,'12some Plantes',NULL,NULL,NULL,NULL,'12some Fungi',NULL,'2013-03-19 00:00:00.000000','2012','12here are some notes',NULL,'otherId_12',NULL,'2005-12-12',NULL,NULL,NULL,'12someSoil','test Treatment',NULL,NULL,NULL,3,8,3,2,12),(13,'13some Plantes',NULL,NULL,NULL,NULL,'13some Fungi',NULL,'2013-03-19 00:00:00.000000','2013','13here are some notes',NULL,'otherId_13',NULL,'2005-12-13',NULL,NULL,NULL,'13someSoil','test Treatment',NULL,NULL,NULL,3,8,3,2,13),(14,'14some Plantes',NULL,NULL,NULL,NULL,'14some Fungi',NULL,'2013-03-19 00:00:00.000000','2014','14here are some notes',NULL,'otherId_14',NULL,'2005-12-14',NULL,NULL,NULL,'14someSoil','test Treatment',NULL,NULL,NULL,3,8,3,2,14);
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
  `REVTYPE` tinyint(4) DEFAULT NULL,
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
  CONSTRAINT `FK_argt4d0rarc85d2x82523b2cf` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MixsSpecification`
--

LOCK TABLES `MixsSpecification` WRITE;
/*!40000 ALTER TABLE `MixsSpecification` DISABLE KEYS */;
INSERT INTO `MixsSpecification` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
  `REVTYPE` tinyint(4) DEFAULT NULL,
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
  CONSTRAINT `FK_bva1xtoa70un4afj9pihokk84` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`)
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
  `Notes` varchar(1024) DEFAULT NULL,
  `Width` int(11) DEFAULT NULL,
  `PcrBatchId` int(11) NOT NULL,
  PRIMARY KEY (`PcrBatchAttachId`),
  KEY `FK_i1hvqhm5h2qb9xbijcvcjkksn` (`PcrBatchId`),
  CONSTRAINT `FK_i1hvqhm5h2qb9xbijcvcjkksn` FOREIGN KEY (`PcrBatchId`) REFERENCES `PcrBatchs` (`PCRBatchID`)
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
  KEY `FK_iyhmua5d43idxmrqwa6mt1mmx` (`PCRProfileID`),
  KEY `FK_5xrpd7j1ifhcveugmvivsy9j4` (`PrimerForwardID`),
  KEY `FK_qsywx3kn4haf7fb0fal1ko4sd` (`PrimerReverseID`),
  KEY `FK_tkxk7kxmhav5jejmldunlthm2` (`ProtocolID`),
  KEY `FK_4c30viwryqtx91qdsp81emqa` (`RegionID`),
  KEY `FK_5ox5bp4jaw3po3u184kff1sul` (`Round2BatchID`),
  KEY `FK_knhujokmet0ew9isorewoouim` (`SeqSubmissionID`),
  CONSTRAINT `FK_190on7fv02cyhhqqbtynwmcfb` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`),
  CONSTRAINT `FK_4c30viwryqtx91qdsp81emqa` FOREIGN KEY (`RegionID`) REFERENCES `Regions` (`TagID`),
  CONSTRAINT `FK_5ox5bp4jaw3po3u184kff1sul` FOREIGN KEY (`Round2BatchID`) REFERENCES `PcrBatchs` (`PCRBatchID`),
  CONSTRAINT `FK_5xrpd7j1ifhcveugmvivsy9j4` FOREIGN KEY (`PrimerForwardID`) REFERENCES `PcrPrimers` (`PCRPrimerID`),
  CONSTRAINT `FK_iyhmua5d43idxmrqwa6mt1mmx` FOREIGN KEY (`PCRProfileID`) REFERENCES `PcrProfiles` (`PCRProfileID`),
  CONSTRAINT `FK_knhujokmet0ew9isorewoouim` FOREIGN KEY (`SeqSubmissionID`) REFERENCES `SeqSubmissions` (`SeqSubmissionID`),
  CONSTRAINT `FK_qsywx3kn4haf7fb0fal1ko4sd` FOREIGN KEY (`PrimerReverseID`) REFERENCES `PcrPrimers` (`PCRPrimerID`),
  CONSTRAINT `FK_tkxk7kxmhav5jejmldunlthm2` FOREIGN KEY (`ProtocolID`) REFERENCES `Protocols` (`ProtocolID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PcrBatchs`
--

LOCK TABLES `PcrBatchs` WRITE;
/*!40000 ALTER TABLE `PcrBatchs` DISABLE KEYS */;
INSERT INTO `PcrBatchs` VALUES (1,NULL,NULL,NULL,'aDilution','Gregg Robideau','2013-03-19 00:00:00.000000','GR_PCR_001',NULL,NULL,NULL,'PCR Batch notes 1','aObjective','4','aTaq','\0','aControl',NULL,'aPurification',NULL,'2010-01-04','10','aReference','aResult','aThermocycler','SANGER',1,1,2,1,4,2,NULL,2),(2,NULL,NULL,NULL,'bDilution','Tara Rintoul','2013-03-19 00:00:00.000000','TR_PCR_001',NULL,NULL,NULL,'PCR Batch notes 1','bObjective','4','bTaq','','bControl',NULL,'bPurification',NULL,'2010-01-05','15','bReference','bResult','bThermocycler','SANGER',1,2,4,3,4,3,NULL,2),(3,NULL,NULL,NULL,'cDilution','Mat Poff','2013-03-19 00:00:00.000000','MP_PCR_001',NULL,NULL,NULL,'PCR Batch notes 1','cObjective','4','cTaq','','cControl',NULL,'cPurification',NULL,'2010-01-05','15','cReference','cResult','cThermocycler','NGS',2,2,4,3,4,3,5,NULL),(4,NULL,NULL,NULL,'dDilution','Mat Poff','2013-03-19 00:00:00.000000','MP_PCR_002',NULL,NULL,NULL,'PCR Batch notes 1','dObjective','4','dTaq','','dControl',NULL,'dPurification',NULL,'2010-01-05','15','dReference','dResult','dThermocycler','NGS',2,2,4,3,4,3,6,NULL),(5,NULL,NULL,NULL,'cDilution','Mat Poff','2013-03-19 00:00:00.000000','MP_PCR_001_r2',NULL,NULL,NULL,'PCR Batch notes 1','cObjective','4','cTaq','','cControl',NULL,'cPurification',NULL,'2010-01-05','15','cReference','cResult','cThermocycler','ROUND2',2,2,4,3,4,3,NULL,NULL),(6,NULL,NULL,NULL,'dDilution','Mat Poff','2013-03-19 00:00:00.000000','MP_PCR_002_r2',NULL,NULL,NULL,'PCR Batch notes 1','dObjective','4','dTaq','','dControl',NULL,'dPurification',NULL,'2010-01-05','15','dReference','dResult','dThermocycler','ROUND2',2,2,4,3,4,3,NULL,NULL);
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
  `REVTYPE` tinyint(4) DEFAULT NULL,
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
  CONSTRAINT `FK_djmx4xysiut1o4y0p87bgcp95` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`)
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
  `Seq` longtext NOT NULL,
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
  PRIMARY KEY (`PCRPrimerID`),
  UNIQUE KEY `UK_duh2h6r8djyl9i4qael9wfu9w` (`Name`,`LotNumber`,`GroupID`),
  KEY `FK_libscfvci046fww5lgwxqauh5` (`GroupID`),
  KEY `FK_4anag2k5y8odmss8vru2hprag` (`DesignedByID`),
  KEY `FK_j7w8lp16p2plapfkw12sxn561` (`PCRCieContactID`),
  KEY `FK_d5ldlywy1pp43lba8ciyyx1us` (`RegionID`),
  CONSTRAINT `FK_4anag2k5y8odmss8vru2hprag` FOREIGN KEY (`DesignedByID`) REFERENCES `People` (`PeopleID`),
  CONSTRAINT `FK_d5ldlywy1pp43lba8ciyyx1us` FOREIGN KEY (`RegionID`) REFERENCES `Regions` (`TagID`),
  CONSTRAINT `FK_j7w8lp16p2plapfkw12sxn561` FOREIGN KEY (`PCRCieContactID`) REFERENCES `People` (`PeopleID`),
  CONSTRAINT `FK_libscfvci046fww5lgwxqauh5` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PcrPrimers`
--

LOCK TABLES `PcrPrimers` WRITE;
/*!40000 ALTER TABLE `PcrPrimers` DISABLE KEYS */;
INSERT INTO `PcrPrimers` VALUES (1,NULL,NULL,NULL,'Bob Jones','R','2013-03-19 00:00:00.000000','Wikipedia',1,'ITS1','ITS4 primer hybridizes at the 5\' end of the 28S gene region.',NULL,'none',NULL,NULL,NULL,'600','ACTACGATCAGCATCGATG','19','10',NULL,NULL,NULL,'55',NULL,'PRIMER',NULL,'','\0','\0','\0','','',NULL,8,NULL,NULL,2),(2,NULL,NULL,NULL,'Tom Smith','F','2013-03-19 00:00:00.000000','Wikipedia',1,'ITS2','ITS5 primer hybridizes towards the 5\' end of the 18S gene region.',NULL,'none',NULL,NULL,NULL,'150','CATCGCTACGATCAGCTCG','19','12',NULL,NULL,NULL,'55',NULL,'PRIMER',NULL,'','\0','\0','\0','','',NULL,8,NULL,NULL,2),(3,NULL,NULL,NULL,'Bob Jones','R','2013-03-19 00:00:00.000000','Wikipedia',1,'Fm83','Oomycete COI',NULL,'none',NULL,NULL,NULL,'600','CTCCAATAAAAAATAACCAAAAATG','25','13',NULL,NULL,NULL,'55',NULL,'PRIMER',NULL,'','\0','\0','\0','','',NULL,8,NULL,NULL,3),(4,NULL,NULL,NULL,'Bob Jones','F','2013-03-19 00:00:00.000000','Wikipedia',1,'Oom-COI-Lev-up','Oomycete COI',NULL,'none',NULL,NULL,NULL,'150','CYTCHGGRTGWCCRAAAAACCAAA','24','14',NULL,NULL,NULL,'55',NULL,'PRIMER',NULL,'','\0','\0','\0','','',NULL,8,NULL,NULL,3),(5,NULL,NULL,NULL,'Bob Jones','F','2013-03-19 00:00:00.000000','Wikipedia',1,'MID44_ITS55','Fusion Primer',NULL,'HPLC',NULL,NULL,NULL,'150','AGCACTGTAGGGAAGTAAAAGTCGTAACAAGG','24','15',NULL,NULL,NULL,'55',NULL,'MID',NULL,'','\0','\0','\0','','',NULL,8,NULL,NULL,2);
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
  `REVTYPE` tinyint(4) DEFAULT NULL,
  `Application` varchar(200) DEFAULT NULL,
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
  `Seq` longtext,
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
  PRIMARY KEY (`PCRPrimerID`,`REV`),
  KEY `FK_7frxhwqxndu6ggu0pf8m33e1d` (`REV`),
  CONSTRAINT `FK_7frxhwqxndu6ggu0pf8m33e1d` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`)
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
  `Application` varchar(50) DEFAULT NULL,
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
  KEY `FK_g9ndujio1cprdfv1vxr25h6r4` (`GroupID`),
  KEY `FK_8inqadrodpjw8h6jun9r19u20` (`RegionID`),
  CONSTRAINT `FK_8inqadrodpjw8h6jun9r19u20` FOREIGN KEY (`RegionID`) REFERENCES `Regions` (`TagID`),
  CONSTRAINT `FK_g9ndujio1cprdfv1vxr25h6r4` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PcrProfiles`
--

LOCK TABLES `PcrProfiles` WRITE;
/*!40000 ALTER TABLE `PcrProfiles` DISABLE KEYS */;
INSERT INTO `PcrProfiles` VALUES (1,'PCR of ITS Region','10','2013-03-19 00:00:00.000000','ITS','95 for 3\'',NULL,NULL,NULL,NULL,NULL,NULL,'95 for 1\'','60 for 2\'','72 for 1\'','55 for 1\'',NULL,NULL,NULL,NULL,8,2),(2,'PCR of COI Region','20','2013-03-19 00:00:00.000000','COI','85 for 3\'',NULL,NULL,NULL,NULL,NULL,NULL,'75 for 1\'','70 for 2\'','72 for 1\'','55 for 1\'',NULL,NULL,NULL,NULL,8,3),(3,'PCR of ACA Region','30','2013-03-19 00:00:00.000000','ACA','85 for 3\'',NULL,NULL,NULL,NULL,NULL,NULL,'97 for 1\'','66 for 2\'','72 for 1\'','55 for 1\'',NULL,NULL,NULL,NULL,8,4);
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
  `REVTYPE` tinyint(4) DEFAULT NULL,
  `Application` varchar(50) DEFAULT NULL,
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
  CONSTRAINT `FK_dftsxppl9qolmnbp96t2vyf4s` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`)
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
  KEY `FK_jg81alaokneidyb0v3knwmj3u` (`GroupID`),
  KEY `FK_947m1h8wbrjbe7webovc5ohhd` (`MID`),
  KEY `FK_s2joblkkv71yib8kce8uxvlt7` (`PCRBatchID`),
  KEY `FK_kvp7jk41aby9lisqxyxjlly6n` (`PrimerForwardID`),
  KEY `FK_hxxl23rrnb8u65nr8myhg0899` (`PrimerReverseID`),
  KEY `FK_nk19pirk3oy63udfhcjhg7m29` (`RegionID`),
  KEY `FK_4s912n70sf0mdyj3fcskcmnia` (`Round1ReactionID`),
  KEY `FK_aoqmedewpccv2ml2lgoec0c06` (`SampleID`),
  CONSTRAINT `FK_4s912n70sf0mdyj3fcskcmnia` FOREIGN KEY (`Round1ReactionID`) REFERENCES `PcrReactions` (`PcrReactionID`),
  CONSTRAINT `FK_947m1h8wbrjbe7webovc5ohhd` FOREIGN KEY (`MID`) REFERENCES `PcrPrimers` (`PCRPrimerID`),
  CONSTRAINT `FK_aoqmedewpccv2ml2lgoec0c06` FOREIGN KEY (`SampleID`) REFERENCES `Samples` (`SampleID`),
  CONSTRAINT `FK_hxxl23rrnb8u65nr8myhg0899` FOREIGN KEY (`PrimerReverseID`) REFERENCES `PcrPrimers` (`PCRPrimerID`),
  CONSTRAINT `FK_jg81alaokneidyb0v3knwmj3u` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`),
  CONSTRAINT `FK_kvp7jk41aby9lisqxyxjlly6n` FOREIGN KEY (`PrimerForwardID`) REFERENCES `PcrPrimers` (`PCRPrimerID`),
  CONSTRAINT `FK_nk19pirk3oy63udfhcjhg7m29` FOREIGN KEY (`RegionID`) REFERENCES `Regions` (`TagID`),
  CONSTRAINT `FK_s2joblkkv71yib8kce8uxvlt7` FOREIGN KEY (`PCRBatchID`) REFERENCES `PcrBatchs` (`PCRBatchID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PcrReactions`
--

LOCK TABLES `PcrReactions` WRITE;
/*!40000 ALTER TABLE `PcrReactions` DISABLE KEYS */;
INSERT INTO `PcrReactions` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,'2013-03-19 00:00:00.000000',NULL,NULL,NULL,'PCR Reaction notes 1','A01','Good Band','Target1',1,5,1,1,2,2,NULL,1),(2,NULL,NULL,NULL,NULL,NULL,NULL,'2013-03-19 00:00:00.000000',NULL,NULL,NULL,'PCR Reaction notes 2','B01','Weak Band','Target2',1,NULL,1,3,3,4,NULL,2),(3,NULL,NULL,NULL,NULL,NULL,NULL,'2013-03-19 00:00:00.000000',NULL,NULL,NULL,'PCR Reaction notes 3','C01','No Band','Target1',1,5,1,1,2,2,NULL,3),(4,NULL,NULL,NULL,NULL,NULL,NULL,'2013-03-19 00:00:00.000000',NULL,NULL,NULL,'PCR Reaction notes 4','A01','Multiple Bands','Target2',1,NULL,2,3,3,4,NULL,4),(5,NULL,NULL,NULL,NULL,NULL,NULL,'2013-03-19 00:00:00.000000',NULL,NULL,NULL,'PCR Reaction notes 5','B01','Multiple Bands','Target2',2,NULL,3,4,3,2,NULL,4),(6,NULL,NULL,NULL,NULL,NULL,NULL,'2013-03-19 00:00:00.000000',NULL,NULL,NULL,'PCR Reaction notes 5','C01','Multiple Bands','Target2',2,NULL,3,4,3,2,NULL,4);
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
  `REVTYPE` tinyint(4) DEFAULT NULL,
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
  CONSTRAINT `FK_e5emcecbalr3q8lwtky433qjm` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `People`
--

LOCK TABLES `People` WRITE;
/*!40000 ALTER TABLE `People` DISABLE KEYS */;
INSERT INTO `People` VALUES (1,'2007-04-03 00:00:00.000000','Raible','Matt','','','',''),(2,'2007-04-03 00:00:00.000000','Johnson','Bob','','','','');
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
  KEY `FK_t2mrruiddat2byt9i5coq185o` (`AddressID`),
  KEY `FK_fmo1wa3swpawahjntu632s4dm` (`PeopleID`),
  CONSTRAINT `FK_fmo1wa3swpawahjntu632s4dm` FOREIGN KEY (`PeopleID`) REFERENCES `People` (`PeopleID`),
  CONSTRAINT `FK_t2mrruiddat2byt9i5coq185o` FOREIGN KEY (`AddressID`) REFERENCES `Addresses` (`AddressID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
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
  CONSTRAINT `FK_7qbopoys5i020a1u0wtksh9al` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`),
  CONSTRAINT `FK_buxmypgdwcfgy8gprhfo1k9a4` FOREIGN KEY (`PeopleID`) REFERENCES `People` (`PeopleID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PeopleGroups`
--

LOCK TABLES `PeopleGroups` WRITE;
/*!40000 ALTER TABLE `PeopleGroups` DISABLE KEYS */;
INSERT INTO `PeopleGroups` VALUES (1,'2013-03-19 00:00:00.000000',6,1),(2,'2013-03-19 00:00:00.000000',7,1);
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
  CONSTRAINT `FK_clmijec1ll51e1cw4y06pa1lj` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Products`
--

LOCK TABLES `Products` WRITE;
/*!40000 ALTER TABLE `Products` DISABLE KEYS */;
INSERT INTO `Products` VALUES (1,'Kit used to create a sample','2013-03-19 00:00:00.000000','Kit 242','Kit','068274000218',1),(2,'It\'s a cardboard box. What more do you need to know?','2013-03-19 00:00:00.000000','Bob\'s Goods\' Cardboard Box','A Cardboard Box','069000061015',1);
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
  `REVTYPE` tinyint(4) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `UPC` varchar(50) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ProductID`,`REV`),
  KEY `FK_n7jjay7ughu5qrc2sbuots3sk` (`REV`),
  CONSTRAINT `FK_n7jjay7ughu5qrc2sbuots3sk` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`)
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
  `Name` varchar(30) NOT NULL,
  `rgt` int(11) DEFAULT NULL,
  `DurationFrom` date DEFAULT NULL,
  `DurationUntil` date DEFAULT NULL,
  `FundingSource` varchar(30) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `Title` varchar(200) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  PRIMARY KEY (`TagID`),
  UNIQUE KEY `UK_9x0k5m3mp5ms3pgxp4sp6dotw` (`Name`),
  UNIQUE KEY `UK_h88xanisv3f9ubo9h4x65nxhd` (`Name`,`GroupID`),
  KEY `FK_phqvhw9un9ed5rsp6nysmu151` (`GroupID`),
  CONSTRAINT `FK_phqvhw9un9ed5rsp6nysmu151` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProjectTags`
--

LOCK TABLES `ProjectTags` WRITE;
/*!40000 ALTER TABLE `ProjectTags` DISABLE KEYS */;
INSERT INTO `ProjectTags` VALUES (1,'System root node that every project inherits from. Should not be displayed in the UI.','2013-03-19 00:00:00.000000',1,'root',16,NULL,NULL,NULL,NULL,NULL,1),(2,'Metagenomic pipeline project.','2013-03-19 00:00:00.000000',2,'SAGES',11,'2010-04-01','2014-04-01','A-Base','Open','Whatever SAGES stands for',1),(3,'Description of Sarah\'s project 1','2013-03-19 00:00:00.000000',3,'Sarah1',8,'2010-04-01','2014-04-01','A-Base','Open','Sarah\'s project 1',3),(4,'Description of Sarah\'s project for her tech 1','2013-03-19 00:00:00.000000',4,'S.tech1',5,'2010-04-01','2014-04-01','A-Base','Open','Sarah\'s project for her tech 1',3),(5,'Description of Sarah\'s project for her tech 2','2013-03-19 00:00:00.000000',6,'S.tech2',7,'2010-04-01','2014-04-01','A-Base','Open','Sarah\'s project for her tech 2',3),(6,'Description of Andre\'s project','2013-03-19 00:00:00.000000',9,'Andre1',10,'2010-04-01','2014-04-01','A-Base','Open','Andre\'s project',1),(7,'Quarantine Invasive Species project.','2013-03-19 00:00:00.000000',12,'GRDI',15,'2010-04-01','2014-04-01','A-Base','Open','Whatever GRDI stands for',1),(8,'Description of Sarah\'s project 2','2013-03-19 00:00:00.000000',13,'Sarah2',14,'2010-04-01','2014-04-01','A-Base','Open','Sarah\'s project 2',3);
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
  `REVTYPE` tinyint(4) DEFAULT NULL,
  `DurationFrom` date DEFAULT NULL,
  `DurationUntil` date DEFAULT NULL,
  `FundingSource` varchar(30) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `Title` varchar(200) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  PRIMARY KEY (`TagID`,`REV`),
  KEY `FK_i84pu0014li6cglfesarm767j` (`REV`),
  CONSTRAINT `FK_i84pu0014li6cglfesarm767j` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`)
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
  UNIQUE KEY `UK_6sxa05kpc3ujngpsvmaqdw9pt` (`Name`),
  KEY `FK_rsyctg2p1bxfnhguxpr3xrm47` (`GroupID`),
  CONSTRAINT `FK_rsyctg2p1bxfnhguxpr3xrm47` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Projects`
--

LOCK TABLES `Projects` WRITE;
/*!40000 ALTER TABLE `Projects` DISABLE KEYS */;
INSERT INTO `Projects` VALUES (1,NULL,'2007-04-03 00:00:00.000000','Test Project',1),(2,NULL,'2007-04-03 00:00:00.000000','Another Project',1),(3,NULL,'2007-04-03 00:00:00.000000','A sub Project',1);
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
  UNIQUE KEY `UK_tjbd851lfl437pmvjt76rbc57` (`ChildID`),
  KEY `FK_40glvko9wlbdh4axsvon037mg` (`ParentID`),
  CONSTRAINT `FK_40glvko9wlbdh4axsvon037mg` FOREIGN KEY (`ParentID`) REFERENCES `Projects` (`ProjectID`),
  CONSTRAINT `FK_tjbd851lfl437pmvjt76rbc57` FOREIGN KEY (`ChildID`) REFERENCES `Projects` (`ProjectID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProjectsProject`
--

LOCK TABLES `ProjectsProject` WRITE;
/*!40000 ALTER TABLE `ProjectsProject` DISABLE KEYS */;
INSERT INTO `ProjectsProject` VALUES (1,3,1);
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
  `Notes` varchar(1024) DEFAULT NULL,
  `Width` int(11) DEFAULT NULL,
  `ProtocolID` int(11) NOT NULL,
  PRIMARY KEY (`ProtocolAttachId`),
  KEY `FK_susn9fe31sdoambvi1nlx436n` (`ProtocolID`),
  CONSTRAINT `FK_susn9fe31sdoambvi1nlx436n` FOREIGN KEY (`ProtocolID`) REFERENCES `Protocols` (`ProtocolID`)
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
  CONSTRAINT `FK_1xw4rqu4nlbrgr7tfhix7ufr1` FOREIGN KEY (`ProductID`) REFERENCES `Products` (`ProductID`),
  CONSTRAINT `FK_8uvt9ggw52gw8ec687h28civr` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Protocols`
--

LOCK TABLES `Protocols` WRITE;
/*!40000 ALTER TABLE `Protocols` DISABLE KEYS */;
INSERT INTO `Protocols` VALUES (1,NULL,NULL,'','2017-01-01 00:00:00.000000','Specimen collection protocol',NULL,'','',NULL,'',NULL,'COLLECTION_EVENT',NULL,1,NULL),(2,NULL,NULL,'','2017-01-01 00:00:00.000000','specimen preparation protocol',NULL,'','',NULL,'',NULL,'SPECIMEN_PREPARATION',NULL,1,NULL),(3,NULL,NULL,'','2017-01-01 00:00:00.000000','DNA extraction protocol',NULL,'','',NULL,'',NULL,'DNA_EXTRACTION',NULL,1,NULL),(4,NULL,NULL,'','2017-01-01 00:00:00.000000','PCR protocol',NULL,'','',NULL,'',NULL,'PCR_REACTION',NULL,1,NULL),(5,NULL,NULL,'','2017-01-01 00:00:00.000000','Sequence reaction protocol',NULL,'','',NULL,'',NULL,'SEQ_REACTION',NULL,1,NULL),(6,NULL,NULL,'','2017-01-01 00:00:00.000000','Environmental specimen collection protocol',NULL,'','',NULL,'',NULL,'COLLECTION_EVENT',NULL,1,NULL),(7,NULL,NULL,'','2017-01-01 00:00:00.000000','Sequencing using PCR templates and 20mM primers',NULL,'','',NULL,'',NULL,'SEQ_REACTION',NULL,1,NULL),(8,NULL,NULL,'','2017-01-17 00:00:00.000000','PCR Standardized for Sequencing (10ul), +BSA ',NULL,'10','9',NULL,'',NULL,'PCR_REACTION',NULL,1,NULL),(9,NULL,NULL,'20 uM','2017-01-01 00:00:00.000000','PCR without purification before sequencing, revise',NULL,'10','9',NULL,'20 uM',NULL,'PCR_REACTION',NULL,1,NULL),(10,NULL,NULL,'20 uM','2017-01-01 00:00:00.000000','PCR requiring purification before sequencing, revi',NULL,'10','9',NULL,'20 uM',NULL,'PCR_REACTION',NULL,1,NULL),(11,NULL,NULL,'3.2 uM','2017-01-01 00:00:00.000000','BDT v3.1 Sequencing Protocol. Revised July 2005 ND',NULL,'','',NULL,'',NULL,'SEQ_REACTION',NULL,1,NULL);
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
  `REVTYPE` tinyint(4) DEFAULT NULL,
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
  CONSTRAINT `FK_gnj2gppl4gftqldmlj4btgxgg` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`)
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
  `DateReceived` datetime DEFAULT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `SpecimenIdent` varchar(50) DEFAULT NULL,
  `SpecimenNumber` int(11) DEFAULT NULL,
  `ProviderID` int(11) DEFAULT NULL,
  `ReceivedByID` int(11) DEFAULT NULL,
  `ParentProviderChainID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ProviderChainID`),
  KEY `FK_1jp1erfwf28iroh9l6liq791v` (`ProviderID`),
  KEY `FK_nil4cfpn0c7m8slqnk4owktsg` (`ReceivedByID`),
  KEY `FK_l3qknci5nmdeqx7h6o3smaswa` (`ParentProviderChainID`),
  CONSTRAINT `FK_1jp1erfwf28iroh9l6liq791v` FOREIGN KEY (`ProviderID`) REFERENCES `People` (`PeopleID`),
  CONSTRAINT `FK_l3qknci5nmdeqx7h6o3smaswa` FOREIGN KEY (`ParentProviderChainID`) REFERENCES `ProviderChains` (`ProviderChainID`),
  CONSTRAINT `FK_nil4cfpn0c7m8slqnk4owktsg` FOREIGN KEY (`ReceivedByID`) REFERENCES `People` (`PeopleID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProviderChains`
--

LOCK TABLES `ProviderChains` WRITE;
/*!40000 ALTER TABLE `ProviderChains` DISABLE KEYS */;
INSERT INTO `ProviderChains` VALUES (1,NULL,'2007-04-03 00:00:00.000000',NULL,NULL,1,2,NULL),(2,NULL,'2007-04-03 00:00:00.000000',NULL,NULL,1,2,NULL),(3,NULL,'2007-04-03 00:00:00.000000',NULL,NULL,1,2,NULL),(4,NULL,'2007-04-03 00:00:00.000000',NULL,NULL,1,2,NULL),(5,NULL,'2007-04-03 00:00:00.000000',NULL,NULL,1,2,NULL),(12,NULL,'2007-04-03 00:00:00.000000',NULL,NULL,1,2,NULL),(13,NULL,'2007-04-03 00:00:00.000000',NULL,NULL,1,2,NULL),(14,NULL,'2007-04-03 00:00:00.000000',NULL,NULL,1,2,NULL);
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
  `REVTYPE` tinyint(4) DEFAULT NULL,
  `DateReceived` datetime DEFAULT NULL,
  `SpecimenIdent` varchar(50) DEFAULT NULL,
  `SpecimenNumber` int(11) DEFAULT NULL,
  `ProviderID` int(11) DEFAULT NULL,
  `ReceivedByID` int(11) DEFAULT NULL,
  `ParentProviderChainID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ProviderChainID`,`REV`),
  KEY `FK_syge507bmxa59tfo3sun3s8le` (`REV`),
  CONSTRAINT `FK_syge507bmxa59tfo3sun3s8le` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`)
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
  CONSTRAINT `FK_sj0ixihlctmheexvesghvvhbh` FOREIGN KEY (`CountryId`) REFERENCES `Countries` (`CountryId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Provinces`
--

LOCK TABLES `Provinces` WRITE;
/*!40000 ALTER TABLE `Provinces` DISABLE KEYS */;
INSERT INTO `Provinces` VALUES (1,'AW','2013-03-19 00:00:00.000000','Anywhere','aaa',1);
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
  CONSTRAINT `FK_1a4aoax0d4hbnk3xyjl4qi9vv` FOREIGN KEY (`ProtocolID`) REFERENCES `Protocols` (`ProtocolID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReactionComponents`
--

LOCK TABLES `ReactionComponents` WRITE;
/*!40000 ALTER TABLE `ReactionComponents` DISABLE KEYS */;
INSERT INTO `ReactionComponents` VALUES (1,'20mM','2017-01-01 00:00:00.000000','REVERSE_PRIMER','0.04',8),(2,'20mM','2017-01-01 00:00:00.000000','FORWARD_PRIMER','0.04',8),(3,'10x','2017-01-01 00:00:00.000000','(10X) Tit Buffer','1.0',8),(4,'2mM','2017-01-01 00:00:00.000000','2mM dNTPs','0.5',8),(5,'50x','2017-01-01 00:00:00.000000','(50X) Titan Taq','0.1',8),(6,'20mg/mL','2017-01-01 00:00:00.000000','BSA 20mg/mL','0.5',8),(7,'1:8','2017-01-01 00:00:00.000000','Seq Mix','8.5',7),(8,'','2017-01-01 00:00:00.000000','H2O','0.42',7),(9,'20mM','2017-01-01 00:00:00.000000','Primer','0.08',7),(10,'20 uM','2017-01-01 00:00:00.000000','REVERSE_PRIMER','0.04',9),(11,'20 uM','2017-01-01 00:00:00.000000','FORWARD_PRIMER','0.04',9),(12,'10X','2017-01-01 00:00:00.000000','10X Titanium Taq buffer','1.00',9),(13,'2 mM','2017-01-01 00:00:00.000000','2 mM dNTPs','0.5',9),(14,'','2017-01-01 00:00:00.000000','Sterile HPLC H2O','7.32',9),(15,'1 ng/ul','2017-01-01 00:00:00.000000','Titanium Taw Polymerase','0.1',9),(16,'','2017-01-01 00:00:00.000000','REVERSE_PRIMER','0.25',10),(17,'','2017-01-01 00:00:00.000000','FORWARD_PRIMER','0.25',10),(18,'10X','2017-01-01 00:00:00.000000','10X TitaniumTM Taq buffer','1.00',10),(19,'2 mM','2017-01-01 00:00:00.000000','2 mM dNTPs','1.00',10),(20,'','2017-01-01 00:00:00.000000','Sterile HPLC H2O','6.30',10),(21,'','2017-01-01 00:00:00.000000','Titanium Taq Polymerase','0.2',10),(22,'','2017-01-01 00:00:00.000000','Seq Mix','8.5',11),(23,'3.2 uM','2017-01-01 00:00:00.000000','Primer','0.5',11);
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
  CONSTRAINT `FK_4qvccfx8g3psr818ndnsit51d` FOREIGN KEY (`AccountID`) REFERENCES `Accounts` (`AccountID`)
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
  `Name` varchar(30) NOT NULL,
  `rgt` int(11) DEFAULT NULL,
  `Aliases` varchar(255) DEFAULT NULL,
  `ApplicableOrganisims` varchar(255) DEFAULT NULL,
  `Symbol` varchar(50) NOT NULL,
  `GroupID` int(11) DEFAULT NULL,
  PRIMARY KEY (`TagID`),
  UNIQUE KEY `UK_s7k0km863cn8h4dvj8d43hrr6` (`Name`),
  UNIQUE KEY `UK_dyejdil5b8y2kps0hqh3thhun` (`Name`,`GroupID`),
  KEY `FK_afqlk7jwweqdv5evifnx1ugkm` (`GroupID`),
  CONSTRAINT `FK_afqlk7jwweqdv5evifnx1ugkm` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Regions`
--

LOCK TABLES `Regions` WRITE;
/*!40000 ALTER TABLE `Regions` DISABLE KEYS */;
INSERT INTO `Regions` VALUES (1,'System root node that every region inherits from. Should not be displayed in the UI.','2013-03-19 00:00:00.000000',1,'root',8,NULL,NULL,'root',1),(2,'ITS Region Amplification','2013-03-19 00:00:00.000000',2,'Internal Transcribed Spacer',3,NULL,NULL,'ITS',8),(3,'COI Region Amplificiation','2013-03-19 00:00:00.000000',4,'Cytochrome c oxidase subunit I',5,NULL,NULL,'COI',8),(4,'ACA Region Amplificiation','2013-03-19 00:00:00.000000',6,'ACA',7,NULL,NULL,'ACA',8);
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
  `REVTYPE` tinyint(4) DEFAULT NULL,
  `Aliases` varchar(255) DEFAULT NULL,
  `ApplicableOrganisims` varchar(255) DEFAULT NULL,
  `Symbol` varchar(50) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  PRIMARY KEY (`TagID`,`REV`),
  KEY `FK_1tm6uj8qa05skj1arvj1tc5na` (`REV`),
  CONSTRAINT `FK_1tm6uj8qa05skj1arvj1tc5na` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Regions_AUD`
--

LOCK TABLES `Regions_AUD` WRITE;
/*!40000 ALTER TABLE `Regions_AUD` DISABLE KEYS */;
INSERT INTO `Regions_AUD` VALUES (26,5,0,NULL,NULL,'TRN',2);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Revision`
--

LOCK TABLES `Revision` WRITE;
/*!40000 ALTER TABLE `Revision` DISABLE KEYS */;
INSERT INTO `Revision` VALUES (1,1513780597970,'Test User'),(2,1513780599353,'Test User'),(3,1513780599360,'Test User'),(4,1513780599393,'Test User'),(5,1513780614049,'Automated System');
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
  `Notes` varchar(1024) DEFAULT NULL,
  `Width` int(11) DEFAULT NULL,
  `SampleId` int(11) NOT NULL,
  PRIMARY KEY (`SampleAttachId`),
  KEY `FK_qb9ji50w6mbt5tgj801fn2yd0` (`SampleId`),
  CONSTRAINT `FK_qb9ji50w6mbt5tgj801fn2yd0` FOREIGN KEY (`SampleId`) REFERENCES `Samples` (`SampleID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
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
  `SpecimenID` int(11) DEFAULT NULL,
  PRIMARY KEY (`SampleID`),
  UNIQUE KEY `UK_1aqcmkjwtipu7d9j70hud3j0i` (`Name`,`Version`,`GroupID`),
  KEY `FK_oydcu32elckh89l3sqk5sidbk` (`GroupID`),
  KEY `FK_chdo5fadxi2yf42ww78sy89xa` (`ProductID`),
  KEY `FK_nf0fq2j176ync5qmfirg3fker` (`MixedSpecimenID`),
  KEY `FK_68me2pv0wxtbibrt30wwtr1dr` (`ProtocolID`),
  KEY `FK_cs25lgdf3it0yx9ks1r8jb79n` (`SpecimenID`),
  CONSTRAINT `FK_68me2pv0wxtbibrt30wwtr1dr` FOREIGN KEY (`ProtocolID`) REFERENCES `Protocols` (`ProtocolID`),
  CONSTRAINT `FK_chdo5fadxi2yf42ww78sy89xa` FOREIGN KEY (`ProductID`) REFERENCES `Products` (`ProductID`),
  CONSTRAINT `FK_cs25lgdf3it0yx9ks1r8jb79n` FOREIGN KEY (`SpecimenID`) REFERENCES `Specimens` (`SpecimenID`),
  CONSTRAINT `FK_nf0fq2j176ync5qmfirg3fker` FOREIGN KEY (`MixedSpecimenID`) REFERENCES `MixedSpecimens` (`MixedSpecimenID`),
  CONSTRAINT `FK_oydcu32elckh89l3sqk5sidbk` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Samples`
--

LOCK TABLES `Samples` WRITE;
/*!40000 ALTER TABLE `Samples` DISABLE KEYS */;
INSERT INTO `Samples` VALUES (1,'2010-01-02','10','concentration notes 1',NULL,'DNA notes 1','aExperimenter','batch 1','2013-03-19 00:00:00.000000',NULL,'KAS1','DNA Extract Sample notes 1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'aSource',NULL,NULL,NULL,'A','First Extraction',1,1,NULL,3,1),(2,'2010-01-03','10','concentration notes 2',NULL,'DNA notes 2','bExperimenter','batch 2','2013-03-19 00:00:00.000000',NULL,'KAS2','DNA Extract Sample notes 2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'bSource',NULL,NULL,NULL,'A','First Extraction',1,1,NULL,3,2),(3,'2010-01-04','10','concentration notes 3',NULL,'DNA notes 3','cExperimenter','batch 3','2013-03-19 00:00:00.000000',NULL,'KAS3','DNA Extract Sample notes 3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'cSource',NULL,NULL,NULL,'A','First Extraction',1,1,NULL,3,3),(4,'2010-01-04','20','concentration notes 4',NULL,'DNA notes 3','dExperimenter','batch 4','2013-03-19 00:00:00.000000',NULL,'KAS1','DNA Extract Sample notes 4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'dSource',NULL,NULL,NULL,'B','Second Extraction',1,1,NULL,3,1),(5,'2010-01-02','40','concentration notes 4',NULL,'DNA notes 4','anotherExperimenter','batch 4','2013-03-19 00:00:00.000000',NULL,'KAS4','DNA Extract Sample notes 4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'aSource',NULL,NULL,NULL,'A','First Extraction',1,1,1,3,NULL),(6,'2010-01-02','40','concentration notes 5',NULL,'DNA notes 5','secondExperimenter','batch 5','2013-03-19 00:00:00.000000',NULL,'KAS5','DNA Extract Sample notes 5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'aSource',NULL,NULL,NULL,'A','First Extraction',1,1,2,3,NULL),(7,'2010-01-02','40','concentration notes 5',NULL,'DNA notes 5','secondExperimenter','batch 5','2013-03-19 00:00:00.000000',NULL,'UserGroupSample','DNA Extract Sample notes 5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'aSource',NULL,NULL,NULL,'A','First Extraction',2,1,2,3,NULL);
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
  `REVTYPE` tinyint(4) DEFAULT NULL,
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
  `SpecimenID` int(11) DEFAULT NULL,
  PRIMARY KEY (`SampleID`,`REV`),
  KEY `FK_nokubna3i7h503rat5xynpm84` (`REV`),
  CONSTRAINT `FK_nokubna3i7h503rat5xynpm84` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`)
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
  PRIMARY KEY (`SeqBatchID`),
  UNIQUE KEY `UK_7pw7de7lhx3e8i1c68trdv2co` (`Name`,`GroupID`),
  KEY `FK_m81rb3pfdiq14tabkpj3j9jyn` (`GroupID`),
  KEY `FK_sirj0wrt2yk94lvw1mrlw2qc4` (`PCRProfileID`),
  KEY `FK_ehc393q8ngsuhjk6y6juhfs16` (`ProtocolID`),
  KEY `FK_n5tu2s6wqeql3yi5nfnj0g2mb` (`RegionID`),
  CONSTRAINT `FK_ehc393q8ngsuhjk6y6juhfs16` FOREIGN KEY (`ProtocolID`) REFERENCES `Protocols` (`ProtocolID`),
  CONSTRAINT `FK_m81rb3pfdiq14tabkpj3j9jyn` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`),
  CONSTRAINT `FK_n5tu2s6wqeql3yi5nfnj0g2mb` FOREIGN KEY (`RegionID`) REFERENCES `Regions` (`TagID`),
  CONSTRAINT `FK_sirj0wrt2yk94lvw1mrlw2qc4` FOREIGN KEY (`PCRProfileID`) REFERENCES `PcrProfiles` (`PCRProfileID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SeqBatchs`
--

LOCK TABLES `SeqBatchs` WRITE;
/*!40000 ALTER TABLE `SeqBatchs` DISABLE KEYS */;
INSERT INTO `SeqBatchs` VALUES (1,'2010-01-04','Gregg Robideau',NULL,'2013-03-19 00:00:00.000000','SEQ_GXR_A01','SEQ Batch notes 1','aObjective','aReference','2','aThermocycler',1,1,5,2),(2,'2010-01-04','Tara Rintoul',NULL,'2013-03-19 00:00:00.000000','SEQ_TXR_A01','SEQ Batch notes 2','bObjective','bReference','2','bThermocycler',1,2,5,2),(3,'2010-01-04','Mat Poff',NULL,'2013-03-19 00:00:00.000000','SEQ_MXR_A01','SEQ Batch notes 2','cObjective','cReference','2','cThermocycler',2,2,5,2);
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
  `REVTYPE` tinyint(4) DEFAULT NULL,
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
  CONSTRAINT `FK_t2eqlq7cjhc7a8jp5ulrypmgc` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`)
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
  UNIQUE KEY `UK_iakoyyeeqmi5ra3o4dyqcb4tl` (`Name`)
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SeqProjects`
--

LOCK TABLES `SeqProjects` WRITE;
/*!40000 ALTER TABLE `SeqProjects` DISABLE KEYS */;
INSERT INTO `SeqProjects` VALUES (1,'test description','2007-04-03 00:00:00.000000','Test Sequence Project'),(2,'testing description 2','2007-04-03 00:00:00.000000','TSeqProject');
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
  KEY `FK_jyuf5lfeq8hhd2g6uwnv002uk` (`ProjectID`),
  KEY `FK_8wcdhmuhu5wu1597flwnaiopr` (`SeqProjectID`),
  CONSTRAINT `FK_8wcdhmuhu5wu1597flwnaiopr` FOREIGN KEY (`SeqProjectID`) REFERENCES `SeqProjects` (`SeqProjectID`),
  CONSTRAINT `FK_jyuf5lfeq8hhd2g6uwnv002uk` FOREIGN KEY (`ProjectID`) REFERENCES `Projects` (`ProjectID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SeqProjectsProjects`
--

LOCK TABLES `SeqProjectsProjects` WRITE;
/*!40000 ALTER TABLE `SeqProjectsProjects` DISABLE KEYS */;
INSERT INTO `SeqProjectsProjects` VALUES (1,1,1);
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
  CONSTRAINT `FK_gr1q9bfsft2mpfsc83gyi62s1` FOREIGN KEY (`SeqProjectID`) REFERENCES `SeqProjects` (`SeqProjectID`),
  CONSTRAINT `FK_ohpl1sdb8hm46b8l9g34sd0cf` FOREIGN KEY (`SequenceID`) REFERENCES `Sequences` (`SequenceID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SeqProjectsSequences`
--

LOCK TABLES `SeqProjectsSequences` WRITE;
/*!40000 ALTER TABLE `SeqProjectsSequences` DISABLE KEYS */;
INSERT INTO `SeqProjectsSequences` VALUES (1,1,1),(2,1,2),(3,2,2);
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
  KEY `FK_orsl48c73rikurwvh0bw0asnn` (`PcrReactionID`),
  KEY `FK_rjc8t80j6yf06x4spmlq53mmi` (`SeqBatchID`),
  KEY `FK_ld8v5qix5ku6tjehe3mg3cgqs` (`SeqPrimerID`),
  CONSTRAINT `FK_7bu545r1h1nac1rqdehvyhhwo` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`),
  CONSTRAINT `FK_ld8v5qix5ku6tjehe3mg3cgqs` FOREIGN KEY (`SeqPrimerID`) REFERENCES `PcrPrimers` (`PCRPrimerID`),
  CONSTRAINT `FK_orsl48c73rikurwvh0bw0asnn` FOREIGN KEY (`PcrReactionID`) REFERENCES `PcrReactions` (`PcrReactionID`),
  CONSTRAINT `FK_rjc8t80j6yf06x4spmlq53mmi` FOREIGN KEY (`SeqBatchID`) REFERENCES `SeqBatchs` (`SeqBatchID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SeqReactions`
--

LOCK TABLES `SeqReactions` WRITE;
/*!40000 ALTER TABLE `SeqReactions` DISABLE KEYS */;
INSERT INTO `SeqReactions` VALUES (1,'9000','9000','2013-03-19 00:00:00.000000','SEQ Reaction notes 1','9000','AAFC_KAS_GR_001_KAS1A_ITS1','A1',1,1,1,2),(2,'9000','9000','2013-03-19 00:00:00.000000','SEQ Reaction notes 2','9000','AAFC_KAS_GR_001_KAS1A_ITS2','A2',1,1,1,2),(3,'9000','9000','2013-03-19 00:00:00.000000','SEQ Reaction notes 2','9000','CL_SB_A01_1_SEQ_KAS1A_ITS_ITS1','A1',1,1,2,1),(4,'9000','9000','2013-03-19 00:00:00.000000','SEQ Reaction notes 2','9000','CL_SB_A01_2_SEQ_KAS1A_ITS_ITS2','A2',1,1,2,2),(5,'9000','9000','2013-03-19 00:00:00.000000','User Group SEQ Reaction notes','9000','UserGroupSeqReaction','A1',2,1,2,2);
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
  `REVTYPE` tinyint(4) DEFAULT NULL,
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
  CONSTRAINT `FK_97cbm6ka2tewfdj53avcpek7m` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`)
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
  PRIMARY KEY (`SequenceID`),
  KEY `FK_841om21hek51soq7fc05fgvij` (`BiologicalCollectionID`),
  KEY `FK_qi2p2jj9tvuiyxgns6e7s7s7p` (`ClusterConsID`),
  KEY `FK_lomh51bwssbvqxf99lccbl1o9` (`ClusterSeqID`),
  KEY `FK_fe5snpi3d9mdpo5jh6vvbu5m7` (`CollectionInfoID`),
  KEY `FK_4t7cg90s9ltmig4lkj5onx4qb` (`GroupID`),
  KEY `FK_qjhdmqlauh995txjxbyqlvt0p` (`IdentificationID`),
  KEY `FK_dvb2lxtiyhu9q1l9r9mdpnadw` (`MidID`),
  KEY `FK_5ehbgji2j0gjaihyvdrk3yp6o` (`MixedSpecimenID`),
  KEY `FK_an50pyveilyolmvmt3dms960t` (`PcrBatchID`),
  KEY `FK_6a987nbi5u3n7ak73yy9dntnq` (`PcrReactionID`),
  KEY `FK_ojv4mufjy28wjte762tthjlsa` (`PrimerForwardID`),
  KEY `FK_2pb4jtciyg4rdbffl5l5bmktd` (`PrimerReverseID`),
  KEY `FK_3080at25w8nm4v0d9yweie2ms` (`SampleID`),
  KEY `FK_m9ly95txnk442e90at8oe0qh3` (`SeqBatchID`),
  KEY `FK_1xl6pvmp5w185eq4b0aal9mft` (`SeqReactionID`),
  KEY `FK_8k21fscowx43bsg9stcjm6lne` (`SpecimenID`),
  KEY `FK_a4kc877d1qdvhe6ickb5t5t8y` (`TaxonID`),
  CONSTRAINT `FK_1xl6pvmp5w185eq4b0aal9mft` FOREIGN KEY (`SeqReactionID`) REFERENCES `SeqReactions` (`SeqReactionID`),
  CONSTRAINT `FK_2pb4jtciyg4rdbffl5l5bmktd` FOREIGN KEY (`PrimerReverseID`) REFERENCES `PcrPrimers` (`PCRPrimerID`),
  CONSTRAINT `FK_3080at25w8nm4v0d9yweie2ms` FOREIGN KEY (`SampleID`) REFERENCES `Samples` (`SampleID`),
  CONSTRAINT `FK_4t7cg90s9ltmig4lkj5onx4qb` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`),
  CONSTRAINT `FK_5ehbgji2j0gjaihyvdrk3yp6o` FOREIGN KEY (`MixedSpecimenID`) REFERENCES `MixedSpecimens` (`MixedSpecimenID`),
  CONSTRAINT `FK_6a987nbi5u3n7ak73yy9dntnq` FOREIGN KEY (`PcrReactionID`) REFERENCES `PcrReactions` (`PcrReactionID`),
  CONSTRAINT `FK_841om21hek51soq7fc05fgvij` FOREIGN KEY (`BiologicalCollectionID`) REFERENCES `BiologicalCollections` (`BiologicalCollectionID`),
  CONSTRAINT `FK_8k21fscowx43bsg9stcjm6lne` FOREIGN KEY (`SpecimenID`) REFERENCES `Specimens` (`SpecimenID`),
  CONSTRAINT `FK_a4kc877d1qdvhe6ickb5t5t8y` FOREIGN KEY (`TaxonID`) REFERENCES `Taxa` (`TaxonID`),
  CONSTRAINT `FK_an50pyveilyolmvmt3dms960t` FOREIGN KEY (`PcrBatchID`) REFERENCES `PcrBatchs` (`PCRBatchID`),
  CONSTRAINT `FK_dvb2lxtiyhu9q1l9r9mdpnadw` FOREIGN KEY (`MidID`) REFERENCES `PcrPrimers` (`PCRPrimerID`),
  CONSTRAINT `FK_fe5snpi3d9mdpo5jh6vvbu5m7` FOREIGN KEY (`CollectionInfoID`) REFERENCES `CollectionInfos` (`CollectionInfoID`),
  CONSTRAINT `FK_lomh51bwssbvqxf99lccbl1o9` FOREIGN KEY (`ClusterSeqID`) REFERENCES `ClusterSeqs` (`ClusterSeqID`),
  CONSTRAINT `FK_m9ly95txnk442e90at8oe0qh3` FOREIGN KEY (`SeqBatchID`) REFERENCES `SeqBatchs` (`SeqBatchID`),
  CONSTRAINT `FK_ojv4mufjy28wjte762tthjlsa` FOREIGN KEY (`PrimerForwardID`) REFERENCES `PcrPrimers` (`PCRPrimerID`),
  CONSTRAINT `FK_qi2p2jj9tvuiyxgns6e7s7s7p` FOREIGN KEY (`ClusterConsID`) REFERENCES `ClusterCons` (`ClusterConsID`),
  CONSTRAINT `FK_qjhdmqlauh995txjxbyqlvt0p` FOREIGN KEY (`IdentificationID`) REFERENCES `Identifications` (`IdentificationID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SeqSources`
--

LOCK TABLES `SeqSources` WRITE;
/*!40000 ALTER TABLE `SeqSources` DISABLE KEYS */;
INSERT INTO `SeqSources` VALUES (1,1,NULL,NULL,7,NULL,100,1,1,1,1,1,2,1,1,NULL,1,NULL),(2,1,NULL,NULL,6,NULL,NULL,2,2,2,2,3,4,2,1,NULL,2,NULL),(3,1,3,NULL,7,NULL,NULL,1,1,1,1,1,2,1,1,NULL,1,NULL),(4,1,4,NULL,6,NULL,NULL,2,2,2,2,3,4,2,1,NULL,2,NULL);
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
  `REVTYPE` tinyint(4) DEFAULT NULL,
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
  PRIMARY KEY (`SequenceID`,`REV`),
  KEY `FK_ifp950llqpju3mpdy9gllrvjb` (`REV`),
  CONSTRAINT `FK_ifp950llqpju3mpdy9gllrvjb` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`)
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
  CONSTRAINT `FK_fu1nicmbjrsh47siaw44o5emt` FOREIGN KEY (`SubmissionFacilityID`) REFERENCES `SubmissionFacilitys` (`SubmissionFacilityID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SeqSubmissionConfigs`
--

LOCK TABLES `SeqSubmissionConfigs` WRITE;
/*!40000 ALTER TABLE `SeqSubmissionConfigs` DISABLE KEYS */;
INSERT INTO `SeqSubmissionConfigs` VALUES (1,'SANGER','2017-06-23 00:00:00.000000','Sanger config 1','Notes 1',NULL,'template1.xlsx',25,NULL,1),(2,'NGS','2017-06-23 00:00:00.000000','NGS config 1','Notes 2',NULL,'template2.xlsx',25,NULL,2);
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
  `REVTYPE` tinyint(4) DEFAULT NULL,
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
  CONSTRAINT `FK_fxs96q5cde8k7q3x19eodhpuv` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`)
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
  UNIQUE KEY `UK_ocii5r25l17vhxo09v7i8yev7` (`SeqBatchID`),
  KEY `FK_9wmtct7d3ouyoo3vjrhfa1nml` (`GroupID`),
  KEY `FK_7epky6tflweq2d2d3ly5w4ga9` (`SeqSubmissionConfigID`),
  CONSTRAINT `FK_7epky6tflweq2d2d3ly5w4ga9` FOREIGN KEY (`SeqSubmissionConfigID`) REFERENCES `SeqSubmissionConfigs` (`SeqSubmissionConfigID`),
  CONSTRAINT `FK_9wmtct7d3ouyoo3vjrhfa1nml` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`),
  CONSTRAINT `FK_ocii5r25l17vhxo09v7i8yev7` FOREIGN KEY (`SeqBatchID`) REFERENCES `SeqBatchs` (`SeqBatchID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SeqSubmissions`
--

LOCK TABLES `SeqSubmissions` WRITE;
/*!40000 ALTER TABLE `SeqSubmissions` DISABLE KEYS */;
INSERT INTO `SeqSubmissions` VALUES (1,NULL,'','2013-03-19 00:00:00.000000','SEQ_GXR_A01_PBI',NULL,'FTP',NULL,NULL,'PBI Sequencing Facility',NULL,'','','GXR',NULL,'',2,1,1),(2,NULL,'Satpal.Bilkhu@agr.gc.ca','2013-03-19 00:00:00.000000','SEQ_TXR_A01_MMTL',NULL,'',NULL,NULL,'MMTL Sequencing Facility',NULL,'SB','Tom Brady','TR',NULL,'1234',2,NULL,2);
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
  `REVTYPE` tinyint(4) DEFAULT NULL,
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
  PRIMARY KEY (`SeqSubmissionID`,`REV`),
  KEY `FK_datf6vhkjqkdew6ajt992er74` (`REV`),
  CONSTRAINT `FK_datf6vhkjqkdew6ajt992er74` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SequenceData`
--

LOCK TABLES `SequenceData` WRITE;
/*!40000 ALTER TABLE `SequenceData` DISABLE KEYS */;
INSERT INTO `SequenceData` VALUES (1,'20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20','TACGATCAGCTACGATC'),(2,'20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20','TACGATCAGCTACGATC'),(3,'20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20','TACGATCAGCTACGATC'),(4,'20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20','TACGATCAGCTACGATC');
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
  `CloneID` int(11) DEFAULT NULL,
  `GoHitID` int(11) DEFAULT NULL,
  `MixedSpecimenID` int(11) DEFAULT NULL,
  `PcrReactionID` int(11) DEFAULT NULL,
  `SeqBatchID` int(11) DEFAULT NULL,
  `SeqMethodID` int(11) DEFAULT NULL,
  `SeqPrimerID` int(11) DEFAULT NULL,
  `VectorID` int(11) DEFAULT NULL,
  PRIMARY KEY (`SequenceID`),
  UNIQUE KEY `UK_c7ieibmckjmihi4hha3u5kh3i` (`GenBankGI`),
  UNIQUE KEY `UK_s65rv8c2er0t50boyii51fpma` (`GenBankVersion`),
  KEY `sequences_name_idx` (`Name`),
  KEY `sequences_fileName_idx` (`FileName`),
  KEY `sequences_mixedSpecimen_result_idx` (`MixedSpecimenID`,`Result`),
  KEY `FK_3u8ticbp842dnauunqgwcwyqd` (`CloneID`),
  KEY `FK_i4c0p2tldq4js6l2lpyjr1eyn` (`GoHitID`),
  KEY `FK_hfcc8fl3ycrmkykbhk5e093da` (`PcrReactionID`),
  KEY `FK_752c8t4y20n7b76oe23bw7ynw` (`SeqBatchID`),
  KEY `FK_gkeyalwa6s2trxx01k4b8pbr9` (`SeqMethodID`),
  KEY `FK_plfcpl8v5sp8kkvt6pb0fvrha` (`SeqPrimerID`),
  KEY `FK_34xfk4n49v3rpj0tucmnbm02i` (`VectorID`),
  CONSTRAINT `FK_2urfmger9sr5kwyn20brwdhd9` FOREIGN KEY (`MixedSpecimenID`) REFERENCES `MixedSpecimens` (`MixedSpecimenID`),
  CONSTRAINT `FK_34xfk4n49v3rpj0tucmnbm02i` FOREIGN KEY (`VectorID`) REFERENCES `Vectors` (`VectorID`),
  CONSTRAINT `FK_3u8ticbp842dnauunqgwcwyqd` FOREIGN KEY (`CloneID`) REFERENCES `Clones` (`CloneID`),
  CONSTRAINT `FK_752c8t4y20n7b76oe23bw7ynw` FOREIGN KEY (`SeqBatchID`) REFERENCES `SeqBatchs` (`SeqBatchID`),
  CONSTRAINT `FK_gkeyalwa6s2trxx01k4b8pbr9` FOREIGN KEY (`SeqMethodID`) REFERENCES `SeqMethods` (`SeqMethodID`),
  CONSTRAINT `FK_hfcc8fl3ycrmkykbhk5e093da` FOREIGN KEY (`PcrReactionID`) REFERENCES `PcrReactions` (`PcrReactionID`),
  CONSTRAINT `FK_i4c0p2tldq4js6l2lpyjr1eyn` FOREIGN KEY (`GoHitID`) REFERENCES `GoHits` (`GoHitID`),
  CONSTRAINT `FK_plfcpl8v5sp8kkvt6pb0fvrha` FOREIGN KEY (`SeqPrimerID`) REFERENCES `PcrPrimers` (`PCRPrimerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sequences`
--

LOCK TABLES `Sequences` WRITE;
/*!40000 ALTER TABLE `Sequences` DISABLE KEYS */;
INSERT INTO `Sequences` VALUES (1,'','2015-01-09 00:00:00.000000',NULL,'/Users/chris/sequences/run1','seq1.ab1','AY000001','6100','AY000001.1','2015-02-09 00:00:00.000000','seq1','sequence is faint',0,'faint',NULL,NULL,'N',NULL,NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL),(2,'','2015-01-09 00:00:00.000000',NULL,'','','AY200','6200','AY200.1','2015-02-10 00:00:00.000000','seq2','sequence looks good',0,'good',NULL,NULL,'N',NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL),(3,'','2015-01-09 00:00:00.000000',NULL,'','','AY300','6300','AY300.1','2015-02-12 00:00:00.000000','seq3','sequence looks good',0,'good',NULL,NULL,'N',NULL,NULL,NULL,NULL,NULL,3,1,NULL,NULL,NULL),(4,'','2015-01-09 00:00:00.000000',NULL,'','','AY400','6400','AY400.1','2015-02-14 00:00:00.000000','seq4','',0,'good',NULL,NULL,'N',NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL);
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
  `REVTYPE` tinyint(4) DEFAULT NULL,
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
  PRIMARY KEY (`SequenceID`,`REV`),
  KEY `FK_m5g45w4ca6g0p3ldqjaol1s7h` (`REV`),
  CONSTRAINT `FK_m5g45w4ca6g0p3ldqjaol1s7h` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`)
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
  `Notes` varchar(1024) DEFAULT NULL,
  `Width` int(11) DEFAULT NULL,
  `SpecimenId` int(11) NOT NULL,
  PRIMARY KEY (`SpecimenAttachId`),
  KEY `FK_euetuttl64lssjvt1j7rihl72` (`SpecimenId`),
  CONSTRAINT `FK_euetuttl64lssjvt1j7rihl72` FOREIGN KEY (`SpecimenId`) REFERENCES `Specimens` (`SpecimenID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
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
  `TimeFinished` datetime DEFAULT NULL,
  `TimeStarted` datetime DEFAULT NULL,
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
  `ParentID` int(11) DEFAULT NULL,
  `ProtocolID` int(11) DEFAULT NULL,
  `SpecimenID` int(11) NOT NULL,
  PRIMARY KEY (`SpecimenReplicateID`),
  UNIQUE KEY `UK_o3e4b4vehe7by1roa0k42w0ft` (`SpecimenID`,`Version`),
  KEY `FK_pm69olc1lwa2gvrw78vduhusl` (`ParentID`),
  KEY `FK_epcn4bq7utejkjuyofy2rxvcq` (`ProtocolID`),
  CONSTRAINT `FK_3aes8cn2mdyh6s51clncxgwst` FOREIGN KEY (`SpecimenID`) REFERENCES `Specimens` (`SpecimenID`),
  CONSTRAINT `FK_epcn4bq7utejkjuyofy2rxvcq` FOREIGN KEY (`ProtocolID`) REFERENCES `Protocols` (`ProtocolID`),
  CONSTRAINT `FK_pm69olc1lwa2gvrw78vduhusl` FOREIGN KEY (`ParentID`) REFERENCES `SpecimenReplicates` (`SpecimenReplicateID`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SpecimenReplicates`
--

LOCK TABLES `SpecimenReplicates` WRITE;
/*!40000 ALTER TABLE `SpecimenReplicates` DISABLE KEYS */;
INSERT INTO `SpecimenReplicates` VALUES (1,'Culture','2012-06-07','2013-03-19 00:00:00.000000','KAS1','Specimen successfully replicated','2012-06-07',NULL,'2011-06-07','','Water','A',NULL,2,1),(2,'Culture',NULL,'2013-03-19 00:00:00.000000','KAS1','Replicate successfully replicated','2013-06-07',NULL,'2012-06-07','','Water','B',NULL,2,1);
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
  `REVTYPE` tinyint(4) DEFAULT NULL,
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
  `ParentID` int(11) DEFAULT NULL,
  `ProtocolID` int(11) DEFAULT NULL,
  `SpecimenID` int(11) DEFAULT NULL,
  PRIMARY KEY (`SpecimenReplicateID`,`REV`),
  KEY `FK_pank91epn0f86n0n5wk1x410v` (`REV`),
  CONSTRAINT `FK_pank91epn0f86n0n5wk1x410v` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`)
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
  UNIQUE KEY `UK_gv40siuct8dlu5rb1y6wlaro1` (`Number`,`BiologicalCollectionID`,`SubId`,`GroupID`),
  UNIQUE KEY `UK_chm46hvjsj7r9jk2t9js4gf5o` (`MixsSpecificationID`),
  KEY `FK_g4pmqjoloyf5fhafvv73hjcn1` (`BiologicalCollectionID`),
  KEY `FK_q0hkqo8y5053o592ghgx06rb9` (`CollectionInfoID`),
  KEY `FK_7bjcosxo8x3vxchhcya79skrj` (`FungalInfoID`),
  KEY `FK_g4ipod035t585hvin5lhry1em` (`GroupID`),
  KEY `FK_pqbwa1ysc7so8uh8y3bruvfkj` (`HostID`),
  KEY `FK_qfj9ewnq35gytcvg9iqxvri7j` (`IdentificationID`),
  KEY `FK_a5jdmsuglwns7mfoklg41dko7` (`ImportPermitID`),
  KEY `FK_9gvxtgp71ikmbcxtth821ovhk` (`MixedSpecimenID`),
  KEY `FK_joe4105wh55sxa2b2olue5am5` (`ProviderChainID`),
  CONSTRAINT `FK_7bjcosxo8x3vxchhcya79skrj` FOREIGN KEY (`FungalInfoID`) REFERENCES `FungalInfos` (`FungalInfoID`),
  CONSTRAINT `FK_9gvxtgp71ikmbcxtth821ovhk` FOREIGN KEY (`MixedSpecimenID`) REFERENCES `MixedSpecimens` (`MixedSpecimenID`),
  CONSTRAINT `FK_a5jdmsuglwns7mfoklg41dko7` FOREIGN KEY (`ImportPermitID`) REFERENCES `ImportPermits` (`ImportPermitID`),
  CONSTRAINT `FK_chm46hvjsj7r9jk2t9js4gf5o` FOREIGN KEY (`MixsSpecificationID`) REFERENCES `MixsSpecification` (`MixsSpecificationID`),
  CONSTRAINT `FK_g4ipod035t585hvin5lhry1em` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`),
  CONSTRAINT `FK_g4pmqjoloyf5fhafvv73hjcn1` FOREIGN KEY (`BiologicalCollectionID`) REFERENCES `BiologicalCollections` (`BiologicalCollectionID`),
  CONSTRAINT `FK_joe4105wh55sxa2b2olue5am5` FOREIGN KEY (`ProviderChainID`) REFERENCES `ProviderChains` (`ProviderChainID`),
  CONSTRAINT `FK_pqbwa1ysc7so8uh8y3bruvfkj` FOREIGN KEY (`HostID`) REFERENCES `Hosts` (`HostID`),
  CONSTRAINT `FK_q0hkqo8y5053o592ghgx06rb9` FOREIGN KEY (`CollectionInfoID`) REFERENCES `CollectionInfos` (`CollectionInfoID`),
  CONSTRAINT `FK_qfj9ewnq35gytcvg9iqxvri7j` FOREIGN KEY (`IdentificationID`) REFERENCES `Identifications` (`IdentificationID`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Specimens`
--

LOCK TABLES `Specimens` WRITE;
/*!40000 ALTER TABLE `Specimens` DISABLE KEYS */;
INSERT INTO `Specimens` VALUES (1,NULL,NULL,'Person 1',NULL,NULL,'12345','mold cell type','DAOM','2007-01-05','Old Mold','extra info ','67890',NULL,'AAFC','2013-03-19 00:00:00.000000','Mature','mold notes',1,'1','aOtherId','Carleton','Process Id 1','Project Name 1',NULL,NULL,'Asexual','1','mold tiess','a mold voucher',1,1,1,1,1,1,1,1,1,1),(2,NULL,NULL,'Person 2',NULL,NULL,'12345','cell type','','2008-02-15','This species is semi-rare','extra info 2','67890',NULL,'','2013-03-19 00:00:00.000000','','these are some notes',2,'2','bOtherId','','Process Id 2','Project Name 2',NULL,NULL,'','2','this is a tissue','another voucher',1,2,2,3,2,2,2,2,2,2),(3,NULL,NULL,'Person 3',NULL,NULL,'12345','cell type','','2009-01-01','This species is very rare!','extra info ','67890',NULL,'','2013-03-19 00:00:00.000000','','these are some notes',3,'3','cOtherId','','Process Id 3','Project Name 3',NULL,NULL,'','3','this is a 3rd tissue','a voucher',1,3,3,1,3,3,3,3,3,3),(4,NULL,NULL,'Person 4',NULL,NULL,'12345','cell type','','2006-01-05','This species is very rare!','extra info ','67890',NULL,'','2013-03-19 00:00:00.000000','','these are some notes',4,'4','dOtherId','','Process Id 4','Project Name 4',NULL,NULL,'','4','this is a tissue','a voucher',1,4,4,1,4,4,4,4,4,4),(5,NULL,NULL,'Person 5',NULL,NULL,'12345','04cell type','','2005-12-04','04This species is very rare!','04extra info ','67890',NULL,'','2013-03-19 00:00:00.000000','','04These are some notes',5,'5','eOtherId','','Process Id 5','Project Name 5',NULL,NULL,'','5','04This is a tissue','04a voucher',1,5,5,1,5,5,5,5,5,5),(12,NULL,NULL,'Person 12',NULL,NULL,'12345','12cell type','','2005-12-12','12This species is very rare!','12extra info ','67890',NULL,'','2013-03-19 00:00:00.000000','','12These are some notes',12,'12','12aOtherId','','Process Id 12','Project Name 12',NULL,NULL,'','12','12This is a tissue','12a voucher',1,12,12,1,12,12,12,12,6,12),(13,NULL,NULL,'Person 13',NULL,NULL,'12345','13cell type','','2005-12-12','13This species is very rare!','13extra info ','67890',NULL,'','2013-03-19 00:00:00.000000','','13These are some notes',13,'13','13aOtherId','','Process Id 12','Project Name 13',NULL,NULL,'','13','13This is a tissue','13a voucher',4,13,13,2,13,13,13,13,13,13),(14,NULL,NULL,'Person 14',NULL,NULL,'12345','14cell type','','2005-12-12','14This species is very rare!','14extra info ','67890',NULL,'','2013-03-19 00:00:00.000000','','14These are some notes',14,'14','14aOtherId','','Process Id 12','Project Name 14',NULL,NULL,'','14','14This is a tissue','14a voucher',4,14,14,2,14,14,14,14,14,14);
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
  `REVTYPE` tinyint(4) DEFAULT NULL,
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
  CONSTRAINT `FK_lv3j7p9s03uyan9fcm2mcjl36` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`)
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
-- Table structure for table `Spots`
--

DROP TABLE IF EXISTS `Spots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Spots` (
  `SpotID` int(11) NOT NULL AUTO_INCREMENT,
  `Background` double NOT NULL,
  `LastModified` datetime(6) DEFAULT NULL,
  `NormVol` double NOT NULL,
  `Present` bit(1) NOT NULL,
  `Quality` varchar(5) DEFAULT NULL,
  `SpotColumn` int(11) NOT NULL,
  `SpotRow` varchar(1) NOT NULL,
  `VolBkgnd` double NOT NULL,
  `Volume` double NOT NULL,
  `CloneID` int(11) DEFAULT NULL,
  `HybridizationID` int(11) DEFAULT NULL,
  PRIMARY KEY (`SpotID`),
  KEY `FK_pmnlt8vntd8p1c8gprjyib8as` (`CloneID`),
  KEY `FK_cuflk23ug0204f8gddp5ihwym` (`HybridizationID`),
  CONSTRAINT `FK_cuflk23ug0204f8gddp5ihwym` FOREIGN KEY (`HybridizationID`) REFERENCES `Hybridizations` (`HybridizationID`),
  CONSTRAINT `FK_pmnlt8vntd8p1c8gprjyib8as` FOREIGN KEY (`CloneID`) REFERENCES `Clones` (`CloneID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Spots`
--

LOCK TABLES `Spots` WRITE;
/*!40000 ALTER TABLE `Spots` DISABLE KEYS */;
/*!40000 ALTER TABLE `Spots` ENABLE KEYS */;
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
  KEY `FK_s7391xm6gpdaivq4k87wt2g8h` (`SeqSubmissionConfigID`),
  KEY `FK_4hn0og6pmo69k02rt88nfidff` (`SpreadSheetTemplateID`),
  CONSTRAINT `FK_4hn0og6pmo69k02rt88nfidff` FOREIGN KEY (`SpreadSheetTemplateID`) REFERENCES `SpreadSheetTemplates` (`SpreadSheetTemplateID`),
  CONSTRAINT `FK_s7391xm6gpdaivq4k87wt2g8h` FOREIGN KEY (`SeqSubmissionConfigID`) REFERENCES `SeqSubmissionConfigs` (`SeqSubmissionConfigID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SpreadSheetColumns`
--

LOCK TABLES `SpreadSheetColumns` WRITE;
/*!40000 ALTER TABLE `SpreadSheetColumns` DISABLE KEYS */;
INSERT INTO `SpreadSheetColumns` VALUES (1,'B','sample.specimen.number',2,NULL),(2,'C','region.name',2,NULL),(3,'D','sample.specimen.collectionCode',2,NULL),(4,'E','pcrBatch.indexSet',2,NULL),(5,'F','sample.tubeId',2,NULL),(6,'G','primerForward.name',2,NULL),(7,'H','primerReverse.name',2,NULL);
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
  CONSTRAINT `FK_bwa6s2770ef5adnwm1k214yh7` FOREIGN KEY (`AccountProfileID`) REFERENCES `AccountProfiles` (`AccountProfileID`)
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
  UNIQUE KEY `UK_rfxhmrf2nokgc4svgxj8jm2fa` (`Name`),
  KEY `FK_jma7et3xaob4668lptl2wswup` (`GroupID`),
  CONSTRAINT `FK_jma7et3xaob4668lptl2wswup` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Storages`
--

LOCK TABLES `Storages` WRITE;
/*!40000 ALTER TABLE `Storages` DISABLE KEYS */;
INSERT INTO `Storages` VALUES (1,'Upper/Lower','description 1','2013-03-19 00:00:00.000000','name 1',2,'2000',1),(2,'Upper/Lower','description 2','2013-03-19 00:00:00.000000','name 2',3,'3000',1),(3,'Upper/Mid/Lower','description 3','2013-03-19 00:00:00.000000','name 3',4,'4000',1),(4,'Upper/Mid/Lower','description 4','2013-03-19 00:00:00.000000','name 4',5,'5000',3);
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
  UNIQUE KEY `UK_junyw2tx3grj5atqekn689wp3` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SubmissionFacilitys`
--

LOCK TABLES `SubmissionFacilitys` WRITE;
/*!40000 ALTER TABLE `SubmissionFacilitys` DISABLE KEYS */;
INSERT INTO `SubmissionFacilitys` VALUES (1,'PBI Contact Info','2017-06-23 00:00:00.000000','PBI','PBI notes','PBI Shipping Details'),(2,'MTL Contact Info','2017-06-23 00:00:00.000000','MTL','MTL Notes','MTL Shipping Details');
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
  `REVTYPE` tinyint(4) DEFAULT NULL,
  `Contact` varchar(1024) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Notes` varchar(1024) DEFAULT NULL,
  `ShippingDetails` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`SubmissionFacilityID`,`REV`),
  KEY `FK_goum9a5y0kseu9dl94pdk6io9` (`REV`),
  CONSTRAINT `FK_goum9a5y0kseu9dl94pdk6io9` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`)
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
  CONSTRAINT `FK_643autsd7naoi3ym5n1cmyqyy` FOREIGN KEY (`TagID`) REFERENCES `ProjectTags` (`TagID`),
  CONSTRAINT `FK_swtwrw5un870fjrefj2xtbnp4` FOREIGN KEY (`FragmentID`) REFERENCES `Fragments` (`FragmentID`)
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
  CONSTRAINT `FK_2qk33ir4t157gly8xhlolo5n0` FOREIGN KEY (`MixedSpecimenID`) REFERENCES `MixedSpecimens` (`MixedSpecimenID`),
  CONSTRAINT `FK_occi02fr0coj9twv04gnbmi94` FOREIGN KEY (`TagID`) REFERENCES `ProjectTags` (`TagID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TagMixedSpecimen`
--

LOCK TABLES `TagMixedSpecimen` WRITE;
/*!40000 ALTER TABLE `TagMixedSpecimen` DISABLE KEYS */;
INSERT INTO `TagMixedSpecimen` VALUES (8,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,12);
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
  CONSTRAINT `FK_1sjim4vyu289iagm2oe7me121` FOREIGN KEY (`TagID`) REFERENCES `ProjectTags` (`TagID`),
  CONSTRAINT `FK_mbq67ya7vpqircwp8at9286hk` FOREIGN KEY (`SampleID`) REFERENCES `Samples` (`SampleID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TagSample`
--

LOCK TABLES `TagSample` WRITE;
/*!40000 ALTER TABLE `TagSample` DISABLE KEYS */;
INSERT INTO `TagSample` VALUES (8,1),(2,2),(3,3),(4,4),(5,5),(6,6);
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
  CONSTRAINT `FK_29af0jdceosu00gp08484a2f1` FOREIGN KEY (`SequenceID`) REFERENCES `Sequences` (`SequenceID`),
  CONSTRAINT `FK_dfy3l4v77lgwyqgf54diobg8t` FOREIGN KEY (`TagID`) REFERENCES `ProjectTags` (`TagID`)
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
  CONSTRAINT `FK_dfesxqm81ixf0nlhludtrdsqs` FOREIGN KEY (`TagID`) REFERENCES `ProjectTags` (`TagID`),
  CONSTRAINT `FK_j44wkjwhacarb897v73r23pk5` FOREIGN KEY (`SpecimenID`) REFERENCES `Specimens` (`SpecimenID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TagSpecimen`
--

LOCK TABLES `TagSpecimen` WRITE;
/*!40000 ALTER TABLE `TagSpecimen` DISABLE KEYS */;
INSERT INTO `TagSpecimen` VALUES (8,1),(2,2),(3,3),(4,4),(5,5),(6,12);
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
  CONSTRAINT `FK_podnyp77yrdamkchlpeslqla9` FOREIGN KEY (`TaskID`) REFERENCES `Tasks` (`TaskID`)
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
  `Type` varchar(255) NOT NULL,
  `AccountID` int(11) NOT NULL,
  PRIMARY KEY (`TaskID`),
  KEY `FK_2rtb4sk2nb8xh2jxmsky5xdga` (`AccountID`),
  CONSTRAINT `FK_2rtb4sk2nb8xh2jxmsky5xdga` FOREIGN KEY (`AccountID`) REFERENCES `Accounts` (`AccountID`)
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
  PRIMARY KEY (`TaxonID`),
  KEY `FK_8xjjo8revddjgtew69fi2d4qo` (`OrigComb`),
  KEY `FK_bh11kemtx4pu5snt7ohpp001` (`Parent`),
  KEY `FK_sq1n8okqvy44oofqqvkhxqf13` (`Preferred`),
  KEY `FK_a9gk29p8sof5bnti457xfkh87` (`RClass`),
  KEY `FK_8g4x7w1q441tcqmjqjrepp9df` (`RFamily`),
  KEY `FK_6mhas0jkiqqwt9wqgd2tyuhwf` (`RForma`),
  KEY `FK_nvdn4ircr41s61ctno51viekd` (`RFormaSpecialis`),
  KEY `FK_le59c65oq61w3jtrk9b9tfo14` (`RGenus`),
  KEY `FK_qblg3frh0iswo7u3w6faghpr` (`RInfraclass`),
  KEY `FK_cacot4sqn736h54rx371yu6w6` (`RInfraorder`),
  KEY `FK_abmjpyg0a3fjx803jsvuohy8j` (`RKingdom`),
  KEY `FK_e7wdawkkl8giwgn4uwrqv8897` (`RNoRank`),
  KEY `FK_15ccibevnv1sc0ntlmbn7oxdt` (`ROrder`),
  KEY `FK_4dgb4gh2p3fmlalbj4qrolvkm` (`RParvorder`),
  KEY `FK_osm6gva5bo26w7obj7sl0k5f3` (`RPhylum`),
  KEY `FK_7x2v74i9c0j03hn520v736u82` (`RSection`),
  KEY `FK_5w10nvvxa5nfdr6vghqx8wic` (`RSeries`),
  KEY `FK_5k68p5d2j1dn1i1kp0cbi9m0f` (`RSpecies`),
  KEY `FK_mb8o3irwgug7doc3a2hfuos99` (`RSpeciesGroup`),
  KEY `FK_7yaw7x60h21dyp9dsvco0tu6c` (`RSpeciesSubgroup`),
  KEY `FK_hx82cmlm9a33gc2jnm1lhmc0o` (`RSubclass`),
  KEY `FK_9vmjpfkow8tsrpvkj1tls7l6c` (`RSubfamily`),
  KEY `FK_8vifg5efr3p08day12ari3ywb` (`RSubgenus`),
  KEY `FK_ih7ql24i0hufcjjnh22rv0xfb` (`RSubkingdom`),
  KEY `FK_lfjgcky9edg98resn1vadih2h` (`RSuborder`),
  KEY `FK_amncx0v5qk0t1rc2hdc80c4np` (`RSubphylum`),
  KEY `FK_fjyb34dplfbvwvhsaym7x1cxi` (`RSubspecies`),
  KEY `FK_ejljb80rovoht26aa8iqka6gf` (`RSubtribe`),
  KEY `FK_gu9ytkxs4x70fx0w53bw4lscx` (`RSuperclass`),
  KEY `FK_eyjixa0qguc5yxufrwscomh4x` (`RSuperfamily`),
  KEY `FK_c4fget0ufn0xy30sfpve8h4ty` (`RSuperkingdom`),
  KEY `FK_maxvacfxyxysc7lmrlf1npkto` (`RSuperorder`),
  KEY `FK_b4hyi1s7df54l89yxk8txbxd3` (`RSuperphylum`),
  KEY `FK_9vnuhsjbibxrndfjavof2oek3` (`RTribe`),
  KEY `FK_d3h9i3xcoa7d9norwjrft38ob` (`RVariety`),
  KEY `FK_gs4a2pja8lggk6611pag4f04h` (`TaxonomicRank`),
  KEY `FK_bw8gdw7kno52jatkm23yr7urg` (`SameAs`),
  CONSTRAINT `FK_15ccibevnv1sc0ntlmbn7oxdt` FOREIGN KEY (`ROrder`) REFERENCES `Taxa` (`TaxonID`),
  CONSTRAINT `FK_4dgb4gh2p3fmlalbj4qrolvkm` FOREIGN KEY (`RParvorder`) REFERENCES `Taxa` (`TaxonID`),
  CONSTRAINT `FK_5k68p5d2j1dn1i1kp0cbi9m0f` FOREIGN KEY (`RSpecies`) REFERENCES `Taxa` (`TaxonID`),
  CONSTRAINT `FK_5w10nvvxa5nfdr6vghqx8wic` FOREIGN KEY (`RSeries`) REFERENCES `Taxa` (`TaxonID`),
  CONSTRAINT `FK_6mhas0jkiqqwt9wqgd2tyuhwf` FOREIGN KEY (`RForma`) REFERENCES `Taxa` (`TaxonID`),
  CONSTRAINT `FK_7x2v74i9c0j03hn520v736u82` FOREIGN KEY (`RSection`) REFERENCES `Taxa` (`TaxonID`),
  CONSTRAINT `FK_7yaw7x60h21dyp9dsvco0tu6c` FOREIGN KEY (`RSpeciesSubgroup`) REFERENCES `Taxa` (`TaxonID`),
  CONSTRAINT `FK_8g4x7w1q441tcqmjqjrepp9df` FOREIGN KEY (`RFamily`) REFERENCES `Taxa` (`TaxonID`),
  CONSTRAINT `FK_8vifg5efr3p08day12ari3ywb` FOREIGN KEY (`RSubgenus`) REFERENCES `Taxa` (`TaxonID`),
  CONSTRAINT `FK_8xjjo8revddjgtew69fi2d4qo` FOREIGN KEY (`OrigComb`) REFERENCES `Taxa` (`TaxonID`),
  CONSTRAINT `FK_9vmjpfkow8tsrpvkj1tls7l6c` FOREIGN KEY (`RSubfamily`) REFERENCES `Taxa` (`TaxonID`),
  CONSTRAINT `FK_9vnuhsjbibxrndfjavof2oek3` FOREIGN KEY (`RTribe`) REFERENCES `Taxa` (`TaxonID`),
  CONSTRAINT `FK_a9gk29p8sof5bnti457xfkh87` FOREIGN KEY (`RClass`) REFERENCES `Taxa` (`TaxonID`),
  CONSTRAINT `FK_abmjpyg0a3fjx803jsvuohy8j` FOREIGN KEY (`RKingdom`) REFERENCES `Taxa` (`TaxonID`),
  CONSTRAINT `FK_amncx0v5qk0t1rc2hdc80c4np` FOREIGN KEY (`RSubphylum`) REFERENCES `Taxa` (`TaxonID`),
  CONSTRAINT `FK_b4hyi1s7df54l89yxk8txbxd3` FOREIGN KEY (`RSuperphylum`) REFERENCES `Taxa` (`TaxonID`),
  CONSTRAINT `FK_bh11kemtx4pu5snt7ohpp001` FOREIGN KEY (`Parent`) REFERENCES `Taxa` (`TaxonID`),
  CONSTRAINT `FK_bw8gdw7kno52jatkm23yr7urg` FOREIGN KEY (`SameAs`) REFERENCES `Taxa` (`TaxonID`),
  CONSTRAINT `FK_c4fget0ufn0xy30sfpve8h4ty` FOREIGN KEY (`RSuperkingdom`) REFERENCES `Taxa` (`TaxonID`),
  CONSTRAINT `FK_cacot4sqn736h54rx371yu6w6` FOREIGN KEY (`RInfraorder`) REFERENCES `Taxa` (`TaxonID`),
  CONSTRAINT `FK_d3h9i3xcoa7d9norwjrft38ob` FOREIGN KEY (`RVariety`) REFERENCES `Taxa` (`TaxonID`),
  CONSTRAINT `FK_e7wdawkkl8giwgn4uwrqv8897` FOREIGN KEY (`RNoRank`) REFERENCES `Taxa` (`TaxonID`),
  CONSTRAINT `FK_ejljb80rovoht26aa8iqka6gf` FOREIGN KEY (`RSubtribe`) REFERENCES `Taxa` (`TaxonID`),
  CONSTRAINT `FK_eyjixa0qguc5yxufrwscomh4x` FOREIGN KEY (`RSuperfamily`) REFERENCES `Taxa` (`TaxonID`),
  CONSTRAINT `FK_fjyb34dplfbvwvhsaym7x1cxi` FOREIGN KEY (`RSubspecies`) REFERENCES `Taxa` (`TaxonID`),
  CONSTRAINT `FK_gs4a2pja8lggk6611pag4f04h` FOREIGN KEY (`TaxonomicRank`) REFERENCES `TaxonRank` (`TaxonRankID`),
  CONSTRAINT `FK_gu9ytkxs4x70fx0w53bw4lscx` FOREIGN KEY (`RSuperclass`) REFERENCES `Taxa` (`TaxonID`),
  CONSTRAINT `FK_hx82cmlm9a33gc2jnm1lhmc0o` FOREIGN KEY (`RSubclass`) REFERENCES `Taxa` (`TaxonID`),
  CONSTRAINT `FK_ih7ql24i0hufcjjnh22rv0xfb` FOREIGN KEY (`RSubkingdom`) REFERENCES `Taxa` (`TaxonID`),
  CONSTRAINT `FK_le59c65oq61w3jtrk9b9tfo14` FOREIGN KEY (`RGenus`) REFERENCES `Taxa` (`TaxonID`),
  CONSTRAINT `FK_lfjgcky9edg98resn1vadih2h` FOREIGN KEY (`RSuborder`) REFERENCES `Taxa` (`TaxonID`),
  CONSTRAINT `FK_maxvacfxyxysc7lmrlf1npkto` FOREIGN KEY (`RSuperorder`) REFERENCES `Taxa` (`TaxonID`),
  CONSTRAINT `FK_mb8o3irwgug7doc3a2hfuos99` FOREIGN KEY (`RSpeciesGroup`) REFERENCES `Taxa` (`TaxonID`),
  CONSTRAINT `FK_nvdn4ircr41s61ctno51viekd` FOREIGN KEY (`RFormaSpecialis`) REFERENCES `Taxa` (`TaxonID`),
  CONSTRAINT `FK_osm6gva5bo26w7obj7sl0k5f3` FOREIGN KEY (`RPhylum`) REFERENCES `Taxa` (`TaxonID`),
  CONSTRAINT `FK_qblg3frh0iswo7u3w6faghpr` FOREIGN KEY (`RInfraclass`) REFERENCES `Taxa` (`TaxonID`),
  CONSTRAINT `FK_sq1n8okqvy44oofqqvkhxqf13` FOREIGN KEY (`Preferred`) REFERENCES `Taxa` (`TaxonID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Taxa`
--

LOCK TABLES `Taxa` WRITE;
/*!40000 ALTER TABLE `Taxa` DISABLE KEYS */;
INSERT INTO `Taxa` VALUES (1,'author',0,NULL,'All author 0[superkingdom]',NULL,'2013-03-19 00:00:00.000000','Bob','All','All',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(2,'author',0,NULL,'Virus author 0[kingdom]',NULL,'2013-03-19 00:00:00.000000','Bob','Virus','Virus',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL),(3,'Haeckel',1894,NULL,'Bacteria Haeckel 1894[kingdom]',NULL,'2013-03-19 00:00:00.000000','Bob','Bacteria','Bacteria',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL),(4,'Haeckel',1866,NULL,'Protista Haeckel 1866[kingdom]',NULL,'2013-03-19 00:00:00.000000','Bob','Protista','Protista',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL),(5,'Linnaeus',1753,NULL,'Fungi Linnaeus 1753[kingdom]',NULL,'2013-03-19 00:00:00.000000','Bob','Fungi','Fungi',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL),(6,'Haeckel',1866,NULL,'Plantae Haeckel 1866[kingdom]',NULL,'2013-03-19 00:00:00.000000','Bob','Plantae','Plantae',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL),(7,'Linnaeus',1758,NULL,'Animalia Linnaeus 1758[kingdom]',NULL,'2013-03-19 00:00:00.000000','Bob','Animalia','Animalia',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL);
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
  `REVTYPE` tinyint(4) DEFAULT NULL,
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
  CONSTRAINT `FK_1f2xpfvvbo9of6eauolhvqp7u` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`)
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
  CONSTRAINT `FK_3vj6jcwsuwtkcm2xfppshnjdf` FOREIGN KEY (`Field`) REFERENCES `Lexicon` (`LexiconID`),
  CONSTRAINT `FK_68fxul2h3cddufu0vpwj2ig36` FOREIGN KEY (`ReferenceID`) REFERENCES `Refs` (`ReferenceID`),
  CONSTRAINT `FK_fsq05c8gi6u8h98gfpfb10k2j` FOREIGN KEY (`TaxonId`) REFERENCES `Taxa` (`TaxonID`)
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
  CONSTRAINT `FK_4ctc19khf6aaty1sxd3ao6xch` FOREIGN KEY (`TaxonID`) REFERENCES `Taxa` (`TaxonID`)
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
  `REVTYPE` tinyint(4) DEFAULT NULL,
  `Name` varchar(60) DEFAULT NULL,
  `Note` varchar(512) DEFAULT NULL,
  `RankLevel` int(11) DEFAULT NULL,
  PRIMARY KEY (`TaxonRankID`,`REV`),
  KEY `FK_dr0ralul51gdqvut0cmn0aaa6` (`REV`),
  CONSTRAINT `FK_dr0ralul51gdqvut0cmn0aaa6` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`)
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
  `Genus` varchar(50) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Taxonomys`
--

LOCK TABLES `Taxonomys` WRITE;
/*!40000 ALTER TABLE `Taxonomys` DISABLE KEYS */;
INSERT INTO `Taxonomys` VALUES (1,'aAuthor',NULL,'aDivision','aFamily','aGenus','aKingdom','2013-03-19 00:00:00.000000','aNotes','aPhylum','aSpecie','','aStrain','aSubgenera','aSuperFamily','aSynonym','aClass','aGroup','aOrder','aType','aVariety'),(2,'bAuthor',NULL,'bDivision','bFamily','bGenus','bKingdom','2013-03-19 00:00:00.000000','bNotes','bPhylum','bSpecie','','bStrain','bSubgenera','bSuperFamily','bSynonym','bClass','bGroup','bOrder','bType','bVariety'),(3,'3bAuthor',NULL,'3bDivision','3bFamily','3bGenus','3bKingdom','2013-03-19 00:00:00.000000','3bNotes','3bPhylum','3bSpecie','','3bStrain','3bSubgenera','3bSuperFamily','3bSynonym','3bClass','3bGroup','3bOrder','3bType','3bVariety'),(4,'4bAuthor',NULL,'4bDivision','4bFamily','4bGenus','4bKingdom','2013-03-19 00:00:00.000000','4bNotes','4bPhylum','4bSpecie','','4bStrain','4bSubgenera','4bSuperFamily','4bSynonym','4bClass','4bGroup','4bOrder','4bType','4bVariety'),(5,'10bAuthor',NULL,'10bDivision','10bFamily','10bGenus','10bKingdom','2013-03-19 00:00:00.000000','10bNotes','10bPhylum','10bSpecie','','10bStrain','10bSubgenera','10bSuperFamily','10bSynonym','10bClass','10bGroup','10bOrder','10bType','10bVariety'),(6,'20bAuthor',NULL,'20bDivision','20bFamily','20bGenus','20bKingdom','2013-03-19 00:00:00.000000','20bNotes','20bPhylum','20bSpecie','','20bStrain','20bSubgenera','20bSuperFamily','20bSynonym','20bClass','20bGroup','20bOrder','20bType','20bVariety'),(7,'30bAuthor',NULL,'30bDivision','30bFamily','30bGenus','30bKingdom','2013-03-19 00:00:00.000000','30bNotes','30bPhylum','30bSpecie','','30bStrain','30bSubgenera','30bSuperFamily','30bSynonym','30bClass','30bGroup','30bOrder','30bType','30bVariety'),(8,'40bAuthor',NULL,'40bDivision','40bFamily','40bGenus','40bKingdom','2013-03-19 00:00:00.000000','40bNotes','40bPhylum','40bSpecie','','40bStrain','40bSubgenera','40bSuperFamily','40bSynonym','40bClass','40bGroup','40bOrder','40bType','40bVariety'),(12,'12bAuthor',NULL,'12bDivision','12bFamily','12bGenus','12bKingdom','2013-03-19 00:00:00.000000','12bNotes','12bPhylum','12bSpecie','','12bStrain','12bSubgenera','12bSuperFamily','12bSynonym','12bClass','12bGroup','12bOrder','12bType','12bVariety'),(13,'13bAuthor',NULL,'13bDivision','13bFamily','13bGenus','13bKingdom','2013-03-19 00:00:00.000000','13bNotes','13bPhylum','13bSpecie','','13bStrain','13bSubgenera','13bSuperFamily','13bSynonym','13bClass','13bGroup','13bOrder','13bType','13bVariety'),(14,'14bAuthor',NULL,'14bDivision','14bFamily','14bGenus','14bKingdom','2013-03-19 00:00:00.000000','14bNotes','14bPhylum','14bSpecie','','14bStrain','14bSubgenera','14bSuperFamily','14bSynonym','14bClass','14bGroup','14bOrder','14bType','14bVariety'),(20,'20bAuthor',NULL,'20bDivision','20bFamily','20Genus','20Kingdom','2013-03-19 00:00:00.000000','20bNotes','20Phylum','20Species','','20bStrain','20bSubgenera','20bSuperFamily','20bSynonym','20bClass','20bGroup','20bOrder','20bType','20bVariety'),(21,'21bAuthor',NULL,'21bDivision','21bFamily','21Genus','21Kingdom','2013-03-19 00:00:00.000000','21bNotes','21Phylum','21Species','','21bStrain','21bSubgenera','21bSuperFamily','21bSynonym','21bClass','21bGroup','21bOrder','21bType','21bVariety'),(31,'31bAuthor',NULL,'31bDivision','31bFamily','31Genus','31Kingdom','2013-03-19 00:00:00.000000','31bNotes','31Phylum','31Species','','31bStrain','31bSubgenera','31bSuperFamily','31bSynonym','31bClass','31bGroup','31bOrder','31bType','31bVariety'),(32,'32bAuthor',NULL,'32bDivision','32bFamily','32Genus','32Kingdom','2013-03-19 00:00:00.000000','32bNotes','32Phylum','32Species','','32bStrain','32bSubgenera','32bSuperFamily','32bSynonym','32bClass','32bGroup','32bOrder','32bType','32bVariety'),(33,'33bAuthor',NULL,'33bDivision','33bFamily','33Genus','33Kingdom','2013-03-19 00:00:00.000000','33bNotes','33Phylum','33Species','','33bStrain','33bSubgenera','33bSuperFamily','33bSynonym','33bClass','33bGroup','33bOrder','33bType','33bVariety'),(34,'34bAuthor',NULL,'34bDivision','34bFamily','34Genus','34Kingdom','2013-03-19 00:00:00.000000','34bNotes','34Phylum','34Species','','34bStrain','34bSubgenera','34bSuperFamily','34bSynonym','34bClass','34bGroup','34bOrder','34bType','34bVariety'),(35,'35bAuthor',NULL,'35bDivision','35bFamily','35Genus','35Kingdom','2013-03-19 00:00:00.000000','35bNotes','35Phylum','35Species','','35bStrain','35bSubgenera','35bSuperFamily','35bSynonym','35bClass','35bGroup','35bOrder','35bType','35bVariety'),(36,'36bAuthor',NULL,'36bDivision','36bFamily','36Genus','36Kingdom','2013-03-19 00:00:00.000000','36bNotes','36Phylum','36Species','','36bStrain','36bSubgenera','36bSuperFamily','36bSynonym','36bClass','36bGroup','36bOrder','36bType','36bVariety'),(37,'37bAuthor',NULL,'37bDivision','37bFamily','37Genus','37Kingdom','2013-03-19 00:00:00.000000','37bNotes','37Phylum','37Species','','37bStrain','37bSubgenera','37bSuperFamily','37bSynonym','37bClass','37bGroup','37bOrder','37bType','37bVariety'),(38,'38bAuthor',NULL,'38bDivision','38bFamily','38Genus','38Kingdom','2013-03-19 00:00:00.000000','38bNotes','38Phylum','38Species','','38bStrain','38bSubgenera','38bSuperFamily','38bSynonym','38bClass','38bGroup','38bOrder','38bType','38bVariety'),(100,'100bAuthor',NULL,'100bDivision','100bFamily','100Genus','100Kingdom','2013-03-19 00:00:00.000000','100bNotes','100Phylum','100Species','','100bStrain','100bSubgenera','100bSuperFamily','100bSynonym','100bClass','100bGroup','100bOrder','100bType','100bVariety');
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
  `REVTYPE` tinyint(4) DEFAULT NULL,
  `Authors` varchar(200) DEFAULT NULL,
  `CommonName` varchar(512) DEFAULT NULL,
  `Division` varchar(50) DEFAULT NULL,
  `Family` varchar(50) DEFAULT NULL,
  `Genus` varchar(50) DEFAULT NULL,
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
  CONSTRAINT `FK_p8kjq5lejdkrrh9fb1y8kboxo` FOREIGN KEY (`REV`) REFERENCES `Revision` (`id`)
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
  CONSTRAINT `FK_ic4tij5ely5myq7wlqhnhghm5` FOREIGN KEY (`StorageID`) REFERENCES `Storages` (`StorageID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UnitSections`
--

LOCK TABLES `UnitSections` WRITE;
/*!40000 ALTER TABLE `UnitSections` DISABLE KEYS */;
INSERT INTO `UnitSections` VALUES (1,'Upper','2013-03-19 00:00:00.000000',1,1,1),(2,'Upper','2013-03-19 00:00:00.000000',2,1,1),(3,'Lower','2013-03-19 00:00:00.000000',1,3,1),(4,'Lower','2013-03-19 00:00:00.000000',4,4,1),(5,'Upper','2013-03-19 00:00:00.000000',1,1,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UsageKeys`
--

LOCK TABLES `UsageKeys` WRITE;
/*!40000 ALTER TABLE `UsageKeys` DISABLE KEYS */;
INSERT INTO `UsageKeys` VALUES (1,'2013-03-19 00:00:00.000000','Henry','language~English');
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
  CONSTRAINT `FK_l6te4yfcdu08mg24xawd3btcl` FOREIGN KEY (`ValidationRuleID`) REFERENCES `ValidationRules` (`ValidationRuleID`)
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
  CONSTRAINT `FK_lpyvw0afwddt8tb61weqjfyw2` FOREIGN KEY (`TagID`) REFERENCES `ProjectTags` (`TagID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ValidationRules`
--

LOCK TABLES `ValidationRules` WRITE;
/*!40000 ALTER TABLE `ValidationRules` DISABLE KEYS */;
/*!40000 ALTER TABLE `ValidationRules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vectors`
--

DROP TABLE IF EXISTS `Vectors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vectors` (
  `VectorID` int(11) NOT NULL AUTO_INCREMENT,
  `LastModified` datetime(6) DEFAULT NULL,
  `Name` varchar(50) NOT NULL,
  `Seq` longtext NOT NULL,
  `Seq_3` longtext NOT NULL,
  `Seq_5` longtext NOT NULL,
  PRIMARY KEY (`VectorID`),
  UNIQUE KEY `UK_6c0vyoxsn6ctbk4mo3w570amy` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vectors`
--

LOCK TABLES `Vectors` WRITE;
/*!40000 ALTER TABLE `Vectors` DISABLE KEYS */;
/*!40000 ALTER TABLE `Vectors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_user`
--

DROP TABLE IF EXISTS `app_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_expired` bit(1) NOT NULL,
  `account_locked` bit(1) NOT NULL,
  `address` varchar(150) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postal_code` varchar(15) DEFAULT NULL,
  `province` varchar(100) DEFAULT NULL,
  `credentials_expired` bit(1) NOT NULL,
  `email` varchar(255) NOT NULL,
  `account_enabled` bit(1) DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `password_hint` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_1j9d9a06i600gd43uu3km82jw` (`email`),
  UNIQUE KEY `UK_3k4cplvh82srueuttfkwnylq0` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_user`
--

LOCK TABLES `app_user` WRITE;
/*!40000 ALTER TABLE `app_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(64) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Administrator role (can edit Users)','admin'),(2,'Default role for all Users','user');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FK_it77eq964jhfqtu54081ebtio` (`role_id`),
  CONSTRAINT `FK_apcc8lxk2xnug8377fatvbn04` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`id`),
  CONSTRAINT `FK_it77eq964jhfqtu54081ebtio` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-20  9:37:21
