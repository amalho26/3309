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
-- Table structure for table `criminal`
--

DROP TABLE IF EXISTS `criminal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `criminal` (
  `gangName` varchar(200) DEFAULT NULL,
  `criminalSocialInsuranceNumber` int NOT NULL,
  `criminalHistory` tinyint NOT NULL,
  PRIMARY KEY (`criminalSocialInsuranceNumber`),
  UNIQUE KEY `criminalSocialInsuranceNumber_UNIQUE` (`criminalSocialInsuranceNumber`),
  KEY `criminalSocialInsuranceNumber_idx` (`criminalSocialInsuranceNumber`),
  CONSTRAINT `criminalSocialInsuranceNumber` FOREIGN KEY (`criminalSocialInsuranceNumber`) REFERENCES `people` (`socialInsuranceNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `criminal`
--

LOCK TABLES `criminal` WRITE;
/*!40000 ALTER TABLE `criminal` DISABLE KEYS */;
INSERT INTO `criminal` VALUES ('Aztecas - Mexican street gang. Identified by their turquoise color.',329535483,1),('0',332474353,1),('0',334494989,0),('Midtown Gangsters - North Korean crime syndicate.',337843056,0),('0',338890061,0),('Italian Mafia - Three Liberty City crime families.',340739824,1),('0',343307599,0),('Trailer Park Mafia - American street gang.',346151223,1),('0',346440665,0),('Bikers (Reappear in 1986) - American outlaw motorcycle club.',347266897,1),('Costa Rican Gang - Costa Rican drug smugglers.',347599814,0),('Patrol Investigation Group (Reappear in 1986) - American security firm.',350462737,0),('0',351294584,0),('Leone Family (Reappear in 2000, 2001) - Italian crime family.',353640605,0),('0',355496006,1),('0',358573193,1),('0',360137929,1),('0',360249593,0),('0',363434474,0),('0',365598030,0),('0',367101895,1),('0',369367359,0),('0',372223162,1),('0',372578192,0),('0',372901498,1),('Car Jacking Gangs - Small American street gang',376924936,0),('Leaf Link Golfers (Reappear in 1986) - American country club members.',383970517,0),('0',386689192,0),('Forelli Family (Reappear in 2001) - Italian crime family.',386952001,1),('0',387130416,1),('Counterfeit Syndicate - All-female currency counterfeiters.',392796140,0),('0',396713744,1),('Cliffford Mercenaries - Paramilitary led by the Cliffford artificial intelligence.',397618438,0),('White Stallionz - American outlaw motorcycle club.',401698352,1),('0',402581078,1),('Vagos - Mexican street gang. Identified by their yellow color.',402904528,1),('0',405487332,1),('0',407954769,0),('0',408729720,1),('Loco Syndicate - Collective criminal outfit.',409709720,1),('0',411724636,0),('0',412799579,1),('0',414543543,0),('0',415373336,0),('0',416654854,1),('Skinheads - American street gang.',417005959,0),('0',418494403,1),('0',426482775,0),('0',428454631,0),('Trevor Philips Enterprises - American crime syndicate.',429175379,1),('0',443591344,1),('0',447759118,0),('0',449451881,0),('Da Nang Boys - Vietnamese street gang.',451429552,0),('Vance Family - Dominican crime family.',453179081,0),('0',454212790,0),('0',458555933,0),('0',460486162,1),('0',463601433,0),('0',464992729,1),('0',466875302,0),('Mendez Cartel - Bolivian drug cartel.',469731361,0),('0',470912100,0),('0',471326337,1),('0',475283743,0),('0',476018843,1),('Bloods',476210809,0),('0',478177839,1),('0',479371313,1),('0',479638530,0),('0',480681976,1),('0',484230289,0),('0',484561297,0),('0',491418221,1),('Mexican Arms Dealers - Mexican gun runners.',495460336,0),('0',497983841,1),('0',501141625,1),('C.R.A.S.H. - Police anti-gang unit.',504236335,1),('0',504542609,1),('Ballas - African-American street gang. Identified by their purple color.',504589516,1),('Families - African-American street gang. Identified by their green color.',507955340,1),('0',513369137,0),('0',513594718,0),('0',515907725,1),('0',520150741,0),('0',520837512,0),('0',524639796,0),('0',531520511,1),('Duggan Crime Family - Texan Crime Family.',531591432,0),('Motorcycle Clubs - Outlaw motorcycle clubs composed of players.',533345015,0),('Shoppers - North Point Mall criminals (in game states list them as a gang)',533637409,0),('Luca\'s Crew - Small American street gang.',534939737,1),('0',539625116,1),('0',543042093,1),('0',544564811,1),('0',549879309,1),('0',550168729,1),('0',554006772,1),('0',561812232,1),('0',563240005,0),('Diablos (Reappear in 2000, 2001) - Puerto Rican street gang.',564111758,1),('Butterfly Children - Mentioned Vietnamese street gang.',567503543,0),('0',571747866,1),('0',571812460,0),('0',575262290,0),('Russian Mafia - Russian crime syndicate.',579819449,0),('Sicilian Mafia - Sicilian crime family.',584405128,0),('Korean Mob - North Korean crime syndicate.',589054719,1),('0',590850154,0),('0',591844702,0),('0',601363380,0),('0',602032181,1),('European Gang - European bank robbers.',603238516,1),('Cholos - Mexican street gang.',605461867,0),('0',605963539,0),('0',606003241,0),('0',606939676,1),('0',609186856,1),('0',610010575,0),('0',610202068,1),('0',610216489,1),('0',611729000,0),('0',612253704,1),('0',615167718,1),('Uptown Yardies (Reappear in 2000, 2001) - Jamaican street gang.',616159997,0),('0',617732320,1),('0',619673541,0),('The Lost MC: Alderney Chapter - American outlaw motorcycle club.',626095295,0),('0',626610166,0),('0',628695241,1),('0',632097324,1),('Shining Razors - Mentioned Vietnamese street gang.',633708702,1),('Jaoming Family - Chinese crime family.',633761895,1),('0',635539029,1),('Army (Reappear in 1986, 1992, 1998, 2000, 2001) - American military forces.',636057379,1),('Yakuza (Reappear in 2000, 2001) - Japanese crime syndicate.',638725211,1),('0',644249150,1),('0',647672127,0),('0',649393987,1),('0',650167486,1),('Mafia',650385806,0),('0',652082792,1),('0',652900052,0),('0',656326731,1),('Rifa - Mexican street gang. Identified by their blue color.',656775723,1),('0',659098010,0),('0',660264964,0),('0',661627231,0),('0',663836993,0),('cartel',664402551,0),('0',664854068,0),('0',665251604,1),('0',669369294,0),('0',670286250,1),('0',670366773,1),('0',672998781,1),('0',678883436,0),('0',678931915,1),('0',680235579,0),('Triads (Reappear in 2000, 2001) - Chinese crime syndicate.',680983306,0),('0',682161848,0),('0',683567665,0),('0',683774232,1),('0',689070631,0),('0',689815602,0),('Sharks (Reappear in 1986) - Multi-racial street gang.',690014082,0),('0',695176204,1),('Triads - Chinese crime syndicate.',697393517,1),('0',697432204,0),('0',699141402,0),('0',703225150,1),('Gonzalez\' Crew - Colombian drug cartel.',705210308,0),('0',706226517,1),('0',709818885,1),('0',711229745,1),('0',713071901,0),('0',715755579,1),('Hells Angels',718306667,0),('Pegorino Family - Italian crime family.',721004573,1),('Southside Hoods (Reappear in 2001) - African-American street gang.',722335907,0),('Crips',722432958,1),('0',723748801,1),('0',727624486,0),('0',730439198,0),('0',730571567,1),('0',731813175,1),('0',733473901,1),('0',733856308,1),('0',737189042,0),('0',737330658,0),('0',743245997,1),('0',746910307,0),('0',750133829,0),('0',750404617,1),('0',753454469,0),('O\'Neil Brothers - American street gang.',756409705,0),('0',757029395,0),('0',758253488,1),('0',768905971,0),('0',769110714,1),('0',777433061,1),('0',778612654,0),('0',787720840,0),('Avenging Angels - Vigilante group.',792224278,1),('0',792570311,1),('0',793535701,0),('0',796328836,0),('Bogdan\'s Crew - Rogue Russian Military Unit.',797311127,0),('0',800321739,1),('0',804280046,1),('0',805941353,1),('0',807241250,1),('0',808486486,0),('Ming Family - Chinese crime family.',813581799,0),('Irish American Killers - Irish-American street gang.',815685728,0),('0',816257584,0),('Cubans (Reappear in 1986) - Cuban street gang.',816561263,1),('Colombian Cartel (Reappear in 2000, 2001) - Colombian drug cartel.',819161146,0),('0',819277873,1),('0',822327771,1),('0',829204718,1),('Vercetti Gang - American crime syndicate.',829514490,0),('0',832000029,0),('The Tongs - Mentioned Chinese crime family.',833532166,0),('0',841754087,1),('0',848860168,0),('0',850263714,1),('0',850957018,1),('0',852816815,0),('0',858410587,1),('Diaz\' Gang (Reappear in 1986) - Colombian drug cartel.',866138454,1),('Wonsu Nodong - North Korean assassins.',867654674,1),('0',867944604,1),('0',873990938,1),('0',876486741,1),('Haitians - Haitian street gang.',881039994,1),('Lee Family - Chinese crime family.',881587608,0),('0',882181799,0),('Survivalists - Redneck Farmers',883191173,0),('0',883667461,0),('0',888410500,1),('0',888519056,0),('0',888792968,0),('Sindacco Family - Italian crime family.',888820314,0),('The Professionals - American crime syndicate.',888953408,1),('0',892084976,1),('0',892921554,0),('0',893628515,1),('0',896331509,1),('Hitmen (Reappear in 1992, 1998) - Contract killers',896466646,0);
/*!40000 ALTER TABLE `criminal` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-07 17:40:02
