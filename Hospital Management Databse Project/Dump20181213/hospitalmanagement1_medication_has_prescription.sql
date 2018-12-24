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
-- Table structure for table `medication_has_prescription`
--

DROP TABLE IF EXISTS `medication_has_prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `medication_has_prescription` (
  `Medication_idMedication` int(11) NOT NULL,
  `Prescription_Prescriptionid` int(11) NOT NULL,
  `Prescription_Doctors_Doctor_id` int(11) NOT NULL,
  `Prescription_Patients_idPatients` int(11) NOT NULL,
  PRIMARY KEY (`Medication_idMedication`,`Prescription_Prescriptionid`,`Prescription_Doctors_Doctor_id`,`Prescription_Patients_idPatients`),
  KEY `fk_Medication_has_Prescription_Prescription1_idx` (`Prescription_Prescriptionid`,`Prescription_Doctors_Doctor_id`,`Prescription_Patients_idPatients`),
  KEY `fk_Medication_has_Prescription_Medication1_idx` (`Medication_idMedication`),
  CONSTRAINT `fk_Medication_has_Prescription_Medication1` FOREIGN KEY (`Medication_idMedication`) REFERENCES `medication` (`idmedication`),
  CONSTRAINT `fk_Medication_has_Prescription_Prescription1` FOREIGN KEY (`Prescription_Prescriptionid`, `Prescription_Doctors_Doctor_id`, `Prescription_Patients_idPatients`) REFERENCES `prescription` (`prescriptionid`, `doctors_doctor_id`, `patients_idpatients`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medication_has_prescription`
--

LOCK TABLES `medication_has_prescription` WRITE;
/*!40000 ALTER TABLE `medication_has_prescription` DISABLE KEYS */;
INSERT INTO `medication_has_prescription` VALUES (1101,1001,201,1),(1102,1002,202,2),(1103,1003,201,3),(1104,1004,203,4),(1105,1005,204,5);
/*!40000 ALTER TABLE `medication_has_prescription` ENABLE KEYS */;
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
