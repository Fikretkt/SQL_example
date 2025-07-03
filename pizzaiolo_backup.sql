/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.13-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: pizzaiolo
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
-- Table structure for table `Pizza_Zutaten`
--

DROP TABLE IF EXISTS `Pizza_Zutaten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pizza_Zutaten` (
  `id_Pizza` int(11) NOT NULL,
  `id_Zutat` int(11) NOT NULL,
  PRIMARY KEY (`id_Zutat`,`id_Pizza`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pizza_Zutaten`
--

LOCK TABLES `Pizza_Zutaten` WRITE;
/*!40000 ALTER TABLE `Pizza_Zutaten` DISABLE KEYS */;
INSERT INTO `Pizza_Zutaten` VALUES
(1,1),
(2,1),
(3,1),
(4,1),
(5,1),
(6,1),
(7,1),
(8,1),
(9,1),
(10,1),
(11,1),
(1,2),
(5,2),
(1,3),
(5,3),
(2,4),
(8,4),
(2,5),
(3,6),
(9,6),
(4,7),
(5,8),
(8,8),
(6,9),
(6,10),
(7,11),
(9,11),
(11,11),
(8,12),
(8,13),
(10,14),
(11,15);
/*!40000 ALTER TABLE `Pizza_Zutaten` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pizzaiolo`
--

DROP TABLE IF EXISTS `Pizzaiolo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pizzaiolo` (
  `id_Pizzaiolo` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Alt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_Pizzaiolo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pizzaiolo`
--

LOCK TABLES `Pizzaiolo` WRITE;
/*!40000 ALTER TABLE `Pizzaiolo` DISABLE KEYS */;
INSERT INTO `Pizzaiolo` VALUES
(1,'Antonio',20),
(2,'Enrico',24),
(3,'Renato',26),
(4,'Romano',34),
(5,'Gregorio',36);
/*!40000 ALTER TABLE `Pizzaiolo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Zutaten`
--

DROP TABLE IF EXISTS `Zutaten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Zutaten` (
  `id_Zutat` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Vegetarisch` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_Zutat`),
  CONSTRAINT `fk_id_Zutat` FOREIGN KEY (`id_Zutat`) REFERENCES `Pizza_Zutaten` (`id_Zutat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Zutaten`
--

LOCK TABLES `Zutaten` WRITE;
/*!40000 ALTER TABLE `Zutaten` DISABLE KEYS */;
INSERT INTO `Zutaten` VALUES
(1,'Tomatensoße',1),
(2,'Mozzarella',1),
(3,'Basilikum',1),
(4,'Knoblauch',1),
(5,'Oregano',1),
(6,'Champignons',1),
(7,'Spinat',1),
(8,'frische Tomaten',1),
(9,'scharfe Salami',0),
(10,'Chili',1),
(11,'gekochter Schinken',0),
(12,'Garnelen',0),
(13,'Petersilie',1),
(14,'Salami',0),
(15,'Ananas',1);
/*!40000 ALTER TABLE `Zutaten` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizza`
--

DROP TABLE IF EXISTS `pizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizza` (
  `id_Pizza` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Preis` decimal(5,2) DEFAULT NULL,
  `id_Pizzaiolo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_Pizza`),
  KEY `fk_id_Pizzaiolo` (`id_Pizzaiolo`),
  CONSTRAINT `fk_id_Pizzaiolo` FOREIGN KEY (`id_Pizzaiolo`) REFERENCES `Pizzaiolo` (`id_Pizzaiolo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizza`
--

LOCK TABLES `pizza` WRITE;
/*!40000 ALTER TABLE `pizza` DISABLE KEYS */;
INSERT INTO `pizza` VALUES
(1,'Margherita',8.99,2),
(2,'Marinara',9.99,5),
(3,'Funghi',10.49,3),
(4,'Spinaci',8.99,2),
(5,'Caprese',11.49,4),
(6,'Diavola',10.09,3),
(7,'Prosciutto',15.01,4),
(8,'Gamberetti',14.29,5),
(9,'Prosciutto e funghi',15.99,2),
(10,'Salami',14.39,1),
(11,'Hawaii',12.99,1);
/*!40000 ALTER TABLE `pizza` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-03 14:08:32
