-- MySQL dump 10.13  Distrib 8.0.25, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: campus_univ
-- ------------------------------------------------------
-- Server version	8.0.27-0ubuntu0.20.04.1

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
-- Table structure for table `point_of_interest`
--

DROP TABLE IF EXISTS `point_of_interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `point_of_interest` (
  `information` varchar(255) NOT NULL,
  `details` varchar(255) NOT NULL,
  `added_on` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `id` int NOT NULL AUTO_INCREMENT,
  `longitude` double NOT NULL,
  `latitude` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_8539595391f365d345582634f7` (`information`)
) ENGINE=InnoDB AUTO_INCREMENT=431 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `point_of_interest`
--

LOCK TABLES `point_of_interest` WRITE;
/*!40000 ALTER TABLE `point_of_interest` DISABLE KEYS */;
INSERT INTO `point_of_interest` VALUES ('Sanitaire 1','no details','2022-03-26 12:09:28.850835','2022-03-26 12:09:28.850835',420,-0.631121,35.660681),('Bibliothèque : Faculté des sciences exactes','no details','2022-03-26 12:09:31.621964','2022-03-26 12:09:31.621964',421,-0.6300375240752701,35.66268953183995),('Restaurant','no details','2022-03-26 12:09:31.737462','2022-03-26 12:09:31.737462',422,-0.628728,35.660766),('Département Pharmacie','no details','2022-03-26 12:09:31.831030','2022-03-26 12:09:31.831030',423,-0.628217,35.66146),('Tele-Education & Distance Learning Service','no details','2022-03-26 12:09:31.860289','2022-03-26 12:09:31.860289',424,-0.6302628296370492,35.66170888739954),('Service tranport universitaires','no details','2022-03-26 12:09:31.877407','2022-03-26 12:09:31.877407',425,-0.6287003456757697,35.66147591536219),('Faculté des sciences sociales','no details','2022-03-26 12:09:31.877871','2022-03-26 12:09:31.877871',426,-0.62746,35.662885),('bibliothèque des sciences sociales','no details','2022-03-26 12:09:31.877829','2022-03-26 12:09:31.877829',427,-0.6277124542158524,35.662674365525284),('Faculté des sciences exactes & appliquées','no details','2022-03-26 12:09:31.877899','2022-03-26 12:09:31.877899',428,-0.6280327295261077,35.662454467759495),('Parking - Salles des TD','no details','2022-03-26 12:09:31.960411','2022-03-26 12:09:31.960411',429,-0.628581,35.66265),('Salles des TD - Faculté des sciences','no details','2022-03-26 12:09:31.960395','2022-03-26 12:09:31.960395',430,-0.628925,35.662655);
/*!40000 ALTER TABLE `point_of_interest` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-04 18:40:10
