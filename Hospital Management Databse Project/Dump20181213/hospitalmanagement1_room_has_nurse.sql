-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: hospitalmanagement1
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `room_has_nurse`
--

DROP TABLE IF EXISTS `room_has_nurse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `room_has_nurse` (
  `Room_idRoom` int(11) NOT NULL,
  `Nurse_NurseID` int(11) NOT NULL,
  PRIMARY KEY (`Room_idRoom`,`Nurse_NurseID`),
  KEY `fk_Room_has_Nurse_Nurse1_idx` (`Nurse_NurseID`),
  KEY `fk_Room_has_Nurse_Room1_idx` (`Room_idRoom`),
  CONSTRAINT `fk_Room_has_Nurse_Nurse1` FOREIGN KEY (`Nurse_NurseID`) REFERENCES `nurse` (`nurseid`),
  CONSTRAINT `fk_Room_has_Nurse_Room1` FOREIGN KEY (`Room_idRoom`) REFERENCES `room` (`idroom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_has_nurse`
--

LOCK TABLES `room_has_nurse` WRITE;
/*!40000 ALTER TABLE `room_has_nurse` DISABLE KEYS */;
INSERT INTO `room_has_nurse` VALUES (1401,401),(1404,401),(1402,402),(1403,403),(1405,404),(1406,405);
/*!40000 ALTER TABLE `room_has_nurse` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-13  3:13:19
