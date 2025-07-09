/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.13-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: sqlakademie
-- ------------------------------------------------------
-- Server version	10.11.13-MariaDB-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `belegungen`
--

DROP TABLE IF EXISTS `belegungen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `belegungen` (
  `belegung_id` int(11) NOT NULL AUTO_INCREMENT,
  `schüler_id` int(11) DEFAULT NULL,
  `fach_id` int(11) DEFAULT NULL,
  `note` int(11) DEFAULT NULL,
  PRIMARY KEY (`belegung_id`),
  KEY `schüler_id` (`schüler_id`),
  KEY `fach_id` (`fach_id`),
  CONSTRAINT `belegungen_ibfk_1` FOREIGN KEY (`schüler_id`) REFERENCES `schüler` (`schüler_id`),
  CONSTRAINT `belegungen_ibfk_2` FOREIGN KEY (`fach_id`) REFERENCES `faecher` (`fach_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `belegungen`
--

LOCK TABLES `belegungen` WRITE;
/*!40000 ALTER TABLE `belegungen` DISABLE KEYS */;
INSERT INTO `belegungen` VALUES
(1,1,1,NULL),
(2,2,2,NULL),
(3,3,3,NULL),
(4,4,1,NULL),
(15,1,1,2),
(16,1,2,1),
(17,2,2,3),
(18,2,NULL,NULL),
(19,3,3,2),
(20,4,1,1),
(21,5,1,4),
(22,6,3,NULL),
(23,7,2,2),
(24,NULL,1,5);
/*!40000 ALTER TABLE `belegungen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faecher`
--

DROP TABLE IF EXISTS `faecher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `faecher` (
  `fach_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`fach_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faecher`
--

LOCK TABLES `faecher` WRITE;
/*!40000 ALTER TABLE `faecher` DISABLE KEYS */;
INSERT INTO `faecher` VALUES
(1,'Mathematik'),
(2,'Biologie'),
(3,'Englisch'),
(4,'Geschichte');
/*!40000 ALTER TABLE `faecher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lehrer`
--

DROP TABLE IF EXISTS `lehrer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lehrer` (
  `lehrer_id` int(11) NOT NULL AUTO_INCREMENT,
  `vorname` varchar(50) DEFAULT NULL,
  `nachname` varchar(50) DEFAULT NULL,
  `hauptfach` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`lehrer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lehrer`
--

LOCK TABLES `lehrer` WRITE;
/*!40000 ALTER TABLE `lehrer` DISABLE KEYS */;
INSERT INTO `lehrer` VALUES
(1,'Peter','Schmidt','Mathematik'),
(2,'Clara','Meier','Biologie'),
(3,'Laura','Fischer','Englisch'),
(4,'Thomas','Wagner',NULL),
(5,'Sophie','Becker','Geschichte');
/*!40000 ALTER TABLE `lehrer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schüler`
--

DROP TABLE IF EXISTS `schüler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `schüler` (
  `schüler_id` int(11) NOT NULL AUTO_INCREMENT,
  `vorname` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `geburtsdatum` date DEFAULT NULL,
  `klasse` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`schüler_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schüler`
--

LOCK TABLES `schüler` WRITE;
/*!40000 ALTER TABLE `schüler` DISABLE KEYS */;
INSERT INTO `schüler` VALUES
(1,'Anna','Müller','2007-04-12','10A'),
(2,'Lukas','Schneider','2006-07-19','11B'),
(3,'Mia','Schulz','2008-11-25','9C'),
(4,'Tom','Weber','2007-01-30','10A'),
(5,'Sarah','Klein',NULL,'11B'),
(6,'Max','Braun','2006-05-14','10A'),
(7,'Emma','Hoffmann','2007-08-22',NULL);
/*!40000 ALTER TABLE `schüler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unterricht`
--

DROP TABLE IF EXISTS `unterricht`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `unterricht` (
  `unterricht_id` int(11) NOT NULL AUTO_INCREMENT,
  `lehrer_id` int(11) DEFAULT NULL,
  `fach_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`unterricht_id`),
  KEY `lehrer_id` (`lehrer_id`),
  KEY `fach_id` (`fach_id`),
  CONSTRAINT `unterricht_ibfk_1` FOREIGN KEY (`lehrer_id`) REFERENCES `lehrer` (`lehrer_id`),
  CONSTRAINT `unterricht_ibfk_2` FOREIGN KEY (`fach_id`) REFERENCES `faecher` (`fach_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unterricht`
--

LOCK TABLES `unterricht` WRITE;
/*!40000 ALTER TABLE `unterricht` DISABLE KEYS */;
INSERT INTO `unterricht` VALUES
(1,1,1),
(2,2,2),
(3,3,3),
(4,4,4),
(5,1,4),
(6,3,NULL),
(7,4,4),
(8,1,4),
(9,3,NULL);
/*!40000 ALTER TABLE `unterricht` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-09 14:54:45
