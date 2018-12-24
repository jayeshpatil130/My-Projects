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
-- Temporary view structure for view `bill_report1`
--

DROP TABLE IF EXISTS `bill_report1`;
/*!50001 DROP VIEW IF EXISTS `bill_report1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `bill_report1` AS SELECT 
 1 AS `idPatients`,
 1 AS `Name`,
 1 AS `Gender`,
 1 AS `Age`,
 1 AS `Phone_no`,
 1 AS `iDBill`,
 1 AS `Cost`,
 1 AS `Status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `due_bill`
--

DROP TABLE IF EXISTS `due_bill`;
/*!50001 DROP VIEW IF EXISTS `due_bill`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `due_bill` AS SELECT 
 1 AS `iDBill`,
 1 AS `Patients_idPatients`,
 1 AS `DueAmount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `patient_roomallocated`
--

DROP TABLE IF EXISTS `patient_roomallocated`;
/*!50001 DROP VIEW IF EXISTS `patient_roomallocated`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `patient_roomallocated` AS SELECT 
 1 AS `idPatients`,
 1 AS `Name`,
 1 AS `Gender`,
 1 AS `Age`,
 1 AS `Phone_no`,
 1 AS `idRoom`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `all_inpatient`
--

DROP TABLE IF EXISTS `all_inpatient`;
/*!50001 DROP VIEW IF EXISTS `all_inpatient`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `all_inpatient` AS SELECT 
 1 AS `idPatients`,
 1 AS `Name`,
 1 AS `Gender`,
 1 AS `Age`,
 1 AS `Phone_no`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `bill_report`
--

DROP TABLE IF EXISTS `bill_report`;
/*!50001 DROP VIEW IF EXISTS `bill_report`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `bill_report` AS SELECT 
 1 AS `idPatients`,
 1 AS `Name`,
 1 AS `Gender`,
 1 AS `Age`,
 1 AS `Phone_no`,
 1 AS `iDBill`,
 1 AS `Cost`,
 1 AS `Status`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `bill_report1`
--

/*!50001 DROP VIEW IF EXISTS `bill_report1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bill_report1` AS select `patients`.`idPatients` AS `idPatients`,`patients`.`Name` AS `Name`,`patients`.`Gender` AS `Gender`,`patients`.`Age` AS `Age`,`patients`.`Phone_no` AS `Phone_no`,`bill`.`idBill` AS `iDBill`,`bill`.`Cost` AS `Cost`,`bill`.`Status` AS `Status` from (`patients` join `bill` on((`patients`.`idPatients` = `bill`.`Patients_idPatients`))) where (`bill`.`Status` = 'Paid') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `due_bill`
--

/*!50001 DROP VIEW IF EXISTS `due_bill`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `due_bill` AS select `bill`.`idBill` AS `iDBill`,`bill`.`Patients_idPatients` AS `Patients_idPatients`,`bill`.`Cost` AS `DueAmount` from `bill` where (`bill`.`Status` = 'pending') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `patient_roomallocated`
--

/*!50001 DROP VIEW IF EXISTS `patient_roomallocated`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `patient_roomallocated` AS select `patients`.`idPatients` AS `idPatients`,`patients`.`Name` AS `Name`,`patients`.`Gender` AS `Gender`,`patients`.`Age` AS `Age`,`patients`.`Phone_no` AS `Phone_no`,`room`.`idRoom` AS `idRoom` from (`patients` join `room` on((`patients`.`idPatients` = `room`.`Patients_idPatients`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `all_inpatient`
--

/*!50001 DROP VIEW IF EXISTS `all_inpatient`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `all_inpatient` AS select `patients`.`idPatients` AS `idPatients`,`patients`.`Name` AS `Name`,`patients`.`Gender` AS `Gender`,`patients`.`Age` AS `Age`,`patients`.`Phone_no` AS `Phone_no` from `patients` where (`patients`.`Type` = 'InPatient') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `bill_report`
--

/*!50001 DROP VIEW IF EXISTS `bill_report`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bill_report` AS select `patients`.`idPatients` AS `idPatients`,`patients`.`Name` AS `Name`,`patients`.`Gender` AS `Gender`,`patients`.`Age` AS `Age`,`patients`.`Phone_no` AS `Phone_no`,`bill`.`idBill` AS `iDBill`,`bill`.`Cost` AS `Cost`,`bill`.`Status` AS `Status` from (`patients` join `bill` on((`patients`.`idPatients` = `bill`.`Patients_idPatients`))) where (`bill`.`Status` = 'Pending') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'hospitalmanagement1'
--

--
-- Dumping routines for database 'hospitalmanagement1'
--
/*!50003 DROP PROCEDURE IF EXISTS `GetDoctor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDoctor`()
BEGIN

Select employee.idEmployee,employee.Name,doctors.Doctor_id,Speciality.Speciality_Type from doctors 
Inner join employee on
doctors.Employee_idEmployee = employee.idEmployee
Inner join Speciality on doctors.Speciality_idSpeciality = Speciality.idSpeciality;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Total Revenue` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Total Revenue`()
BEGIN
declare total_revenue int;
set total_revenue = ( Select Sum(Cost) from Bill);
select total_revenue = total_revenue;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Total_Revenue` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Total_Revenue`()
BEGIN
declare total_revenue int;
set total_revenue = ( Select Sum(Cost) from Bill);
select total_revenue = total_revenue;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Total_Revenue1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Total_Revenue1`()
BEGIN

declare total_revenue int;
set total_revenue = ( Select Sum(Cost) from Bill);
select total_revenue = sum(Bill.Cost);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Total_Revenue2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Total_Revenue2`()
BEGIN

declare total_revenue int;
set total_revenue = ( Select Sum(Cost) from Bill);
select total_revenue as total_revenue ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-13  3:13:22
