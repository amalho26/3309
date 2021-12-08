-- MySQL dump 10.13  Distrib 8.0.27, for macos11 (x86_64)
--
-- Host: localhost    Database: police
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `gangreport`
--

DROP TABLE IF EXISTS `gangreport`;
/*!50001 DROP VIEW IF EXISTS `gangreport`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `gangreport` AS SELECT 
 1 AS `Active gangs`,
 1 AS `city`,
 1 AS `number of incidents`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `criminalwitnessstatements`
--

DROP TABLE IF EXISTS `criminalwitnessstatements`;
/*!50001 DROP VIEW IF EXISTS `criminalwitnessstatements`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `criminalwitnessstatements` AS SELECT 
 1 AS `witnessOccurences`,
 1 AS `first name`,
 1 AS `Last name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `officerview`
--

DROP TABLE IF EXISTS `officerview`;
/*!50001 DROP VIEW IF EXISTS `officerview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `officerview` AS SELECT 
 1 AS `evidenceType`,
 1 AS `date`,
 1 AS `time`,
 1 AS `noOfEvidenceCollected`,
 1 AS `description`,
 1 AS `logType`,
 1 AS `officerSIN`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `gangreport`
--

/*!50001 DROP VIEW IF EXISTS `gangreport`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `gangreport` AS select `c`.`gangName` AS `Active gangs`,`r`.`city` AS `city`,count(`c`.`gangName`) AS `number of incidents` from ((`criminal` `c` join `report` `r`) join `crime_incident` `ci`) where ((`r`.`city` = 'TORONTO') and (`c`.`criminalSocialInsuranceNumber` = `ci`.`criminalSocialInsuranceNumber`) and (`r`.`caseID` = `ci`.`caseID`) and (`c`.`gangName` <> '0')) group by `c`.`gangName`,`ci`.`caseID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `criminalwitnessstatements`
--

/*!50001 DROP VIEW IF EXISTS `criminalwitnessstatements`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `criminalwitnessstatements` AS select count(`w`.`socialInsuranceNumber`) AS `witnessOccurences`,`p`.`fName` AS `first name`,`p`.`lName` AS `Last name` from ((`witness_statement` `w` join `people` `p`) join `criminal` `c`) where ((`p`.`fName` = 'Lindsy') and (`p`.`lName` = 'Elintune') and (`c`.`criminalSocialInsuranceNumber` = `p`.`socialInsuranceNumber`) and (`w`.`socialInsuranceNumber` = `c`.`criminalSocialInsuranceNumber`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `officerview`
--

/*!50001 DROP VIEW IF EXISTS `officerview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `officerview` AS select `evidence_log`.`evidenceType` AS `evidenceType`,`evidence_log`.`date` AS `date`,`evidence_log`.`time` AS `time`,`evidence_log`.`noOfEvidenceCollected` AS `noOfEvidenceCollected`,`evidence_log`.`description` AS `description`,`evidence_log`.`logType` AS `logType`,`evidence_log`.`officerSIN` AS `officerSIN` from `evidence_log` where (`evidence_log`.`officerSIN` = 341624401) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-07 17:40:05
