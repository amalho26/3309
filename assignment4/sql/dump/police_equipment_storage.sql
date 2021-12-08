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
-- Table structure for table `equipment_storage`
--

DROP TABLE IF EXISTS `equipment_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment_storage` (
  `storageNo` int NOT NULL,
  `totalNoOfEquipment` int DEFAULT NULL,
  `lockerNo` int NOT NULL,
  PRIMARY KEY (`storageNo`),
  UNIQUE KEY `storageNo_UNIQUE` (`storageNo`),
  KEY `idx_equipment_storage_storageNo` (`storageNo`),
  CONSTRAINT `storageNum` FOREIGN KEY (`storageNo`) REFERENCES `storage` (`storageNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment_storage`
--

LOCK TABLES `equipment_storage` WRITE;
/*!40000 ALTER TABLE `equipment_storage` DISABLE KEYS */;
INSERT INTO `equipment_storage` VALUES (2,492,35),(5,438,90),(8,502,54),(11,508,3),(14,500,58),(17,443,6),(20,519,36),(23,552,6),(26,463,87),(29,430,14),(32,585,59),(35,562,18),(38,446,90),(41,599,26),(44,561,80),(47,434,72),(50,427,54),(53,494,67),(56,541,97),(59,449,42),(62,474,43),(65,468,67),(68,535,32),(71,444,11),(74,401,31);
/*!40000 ALTER TABLE `equipment_storage` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-07 17:39:57
