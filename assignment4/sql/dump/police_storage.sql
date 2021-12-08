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
-- Table structure for table `storage`
--

DROP TABLE IF EXISTS `storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storage` (
  `storageNo` int NOT NULL,
  `storageSize` varchar(100) DEFAULT NULL,
  `stationNo` int NOT NULL,
  PRIMARY KEY (`storageNo`),
  KEY `idx_storage_storageNo` (`storageNo`),
  KEY `idx_storage_stationNo` (`stationNo`),
  CONSTRAINT `stationNumber` FOREIGN KEY (`stationNo`) REFERENCES `station` (`stationNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storage`
--

LOCK TABLES `storage` WRITE;
/*!40000 ALTER TABLE `storage` DISABLE KEYS */;
INSERT INTO `storage` VALUES (1,'15963',13),(2,'14503',25),(3,'19611',12),(4,'3311',21),(5,'18621',4),(6,'19761',17),(7,'5089',6),(8,'13388',12),(9,'9805',14),(10,'7716',24),(11,'11513',20),(12,'4636',23),(13,'7205',8),(14,'4424',1),(15,'14700',11),(16,'5314',25),(17,'15402',20),(18,'11193',1),(19,'15418',19),(20,'4270',11),(21,'15100',5),(22,'16243',25),(23,'9886',15),(24,'18822',12),(25,'18595',8),(26,'11002',16),(27,'10912',17),(28,'19428',2),(29,'8973',18),(30,'9266',8),(31,'18038',14),(32,'16169',3),(33,'10814',14),(34,'11933',19),(35,'6405',4),(36,'13579',18),(37,'3727',16),(38,'8321',21),(39,'3864',9),(40,'16400',16),(41,'4374',24),(42,'17338',11),(43,'8020',23),(44,'14326',22),(45,'18235',13),(46,'19659',7),(47,'6993',2),(48,'11048',15),(49,'17101',5),(50,'7465',9),(51,'6128',7),(52,'2568',10),(53,'11718',10),(54,'3623',10),(55,'3493',17),(56,'16856',18),(57,'12700',21),(58,'13564',6),(59,'17645',2),(60,'4601',24),(61,'19250',4),(62,'11418',6),(63,'15814',5),(64,'12908',7),(65,'7069',9),(66,'12131',23),(67,'7118',1),(68,'14667',3),(69,'3648',22),(70,'11569',19),(71,'16554',13),(72,'3273',20),(73,'10064',15),(74,'18906',3),(75,'9303',22);
/*!40000 ALTER TABLE `storage` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-07 17:40:01
