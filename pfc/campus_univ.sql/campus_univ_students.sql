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
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `field` varchar(255) NOT NULL,
  `birth_date` datetime NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` int NOT NULL,
  `matricule_bac` varchar(255) NOT NULL,
  `cle_secrete` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_25985d58c714a4a427ced57507` (`email`),
  UNIQUE KEY `IDX_2c519609f7743049906086b89d` (`phone_number`),
  UNIQUE KEY `IDX_2ff1d35585913909f8de5b0929` (`matricule_bac`),
  UNIQUE KEY `IDX_899d81c1f9da5f528c6aa6e2ac` (`cle_secrete`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Claudina','Kissee','computer science','2001-11-11 01:00:00','Savina@gmail.com',37262,'36172','f55ec353','2022-05-04 13:01:54.027009','2022-05-04 13:01:54.027009'),(2,'Wally','Dorelia','computer science','2001-07-09 00:00:00','Sherline@gmail.com',54738,'11678','47c4cc90','2022-05-04 13:01:54.043235','2022-05-04 13:01:54.043235'),(3,'Bonnee','Maddalena','computer science','2001-09-11 00:00:00','Diena@gmail.com',34177,'23072','c5f66ca3','2022-05-04 13:01:54.044826','2022-05-04 13:01:54.044826'),(4,'Jesselyn','Elna','computer science','2001-07-19 00:00:00','Florrie@gmail.com',44033,'24938','b4d9e94f','2022-05-04 13:01:54.046473','2022-05-04 13:01:54.046473'),(5,'Ronny','Eilis','computer science','2001-06-14 00:00:00','Tootsie@gmail.com',29508,'31177','fa767679','2022-05-04 13:01:54.048015','2022-05-04 13:01:54.048015'),(6,'Kip','Jacquelyn','computer science','2001-05-14 00:00:00','Fifi@gmail.com',20538,'41042','e75acc5f','2022-05-04 13:01:54.049427','2022-05-04 13:01:54.049427'),(7,'Tabbatha','Shaylah','computer science','2001-06-10 00:00:00','Kary@gmail.com',26543,'24851','f07d19ec','2022-05-04 13:01:54.050794','2022-05-04 13:01:54.050794'),(8,'Jaclyn','Angele','computer science','2001-11-19 01:00:00','Flore@gmail.com',38974,'35127','e5bb9d45','2022-05-04 13:01:54.052125','2022-05-04 13:01:54.052125'),(9,'Corabella','Stella','computer science','2001-01-19 00:00:00','Godiva@gmail.com',22142,'13515','d07fda74','2022-05-04 13:01:54.054004','2022-05-04 13:01:54.054004'),(10,'Hedvig','Sandye','computer science','2001-01-12 00:00:00','Tommy@gmail.com',52740,'30851','c41b27c9','2022-05-04 13:01:54.059545','2022-05-04 13:01:54.059545'),(11,'Jackquelin','Madeline','computer science','2001-06-03 00:00:00','Constancia@gmail.com',11155,'50642','2595bcfb','2022-05-04 13:01:54.230523','2022-05-04 13:01:54.230523'),(12,'Brynna','Johnath','computer science','2001-09-22 00:00:00','Gabriela@gmail.com',32185,'51763','2cc78b06','2022-05-04 13:01:54.343736','2022-05-04 13:01:54.343736'),(13,'Matelda','Cinderella','computer science','2001-03-26 00:00:00','Sibby@gmail.com',55275,'22162','502894a0','2022-05-04 13:01:54.348836','2022-05-04 13:01:54.348836'),(14,'Sunny','Lorene','computer science','2001-11-20 01:00:00','Ashley@gmail.com',53376,'25317','0dc31bec','2022-05-04 13:01:54.352502','2022-05-04 13:01:54.352502'),(15,'Sissie','Happy','computer science','2001-08-07 00:00:00','Rosemary@gmail.com',17632,'33079','7074242f','2022-05-04 13:01:54.355467','2022-05-04 13:01:54.355467'),(16,'Linet','Charis','computer science','2001-11-26 01:00:00','Zondra@gmail.com',25018,'37066','31037947','2022-05-04 13:01:54.357951','2022-05-04 13:01:54.357951'),(17,'Vinita','Brande','computer science','2001-03-19 00:00:00','Emilie@gmail.com',42879,'10506','8b0385f3','2022-05-04 13:01:54.361090','2022-05-04 13:01:54.361090'),(18,'Courtenay','Sisely','computer science','2001-11-03 00:00:00','Ray@gmail.com',47418,'34806','f4ae5e8e','2022-05-04 13:01:54.363925','2022-05-04 13:01:54.363925'),(19,'Annabal','Beverie','computer science','2001-07-11 00:00:00','Abigael@gmail.com',46676,'25368','626c5727','2022-05-04 13:01:54.365376','2022-05-04 13:01:54.365376'),(20,'Marian','Guinevere','computer science','2001-01-28 00:00:00','Edin@gmail.com',57113,'40954','da37d690','2022-05-04 13:01:54.377781','2022-05-04 13:01:54.377781'),(21,'Lois','Adora','computer science','2001-03-07 00:00:00','Karmen@gmail.com',33317,'55910','e9c571d5','2022-05-04 13:01:54.397601','2022-05-04 13:01:54.397601'),(22,'Arielle','Bethina','computer science','2001-04-11 00:00:00','Lyndsey@gmail.com',43969,'35165','76f9612d','2022-05-04 13:01:54.571607','2022-05-04 13:01:54.571607'),(23,'Margalit','Dulci','computer science','2001-08-22 00:00:00','Adore@gmail.com',57742,'39602','65ac3baf','2022-05-04 13:01:54.663964','2022-05-04 13:01:54.663964'),(24,'Barbie','Jan','computer science','2001-08-19 00:00:00','Jacinthe@gmail.com',43578,'41962','e537525a','2022-05-04 13:01:54.667678','2022-05-04 13:01:54.667678'),(25,'Reena','Marla','computer science','2001-01-07 00:00:00','Bonita@gmail.com',43534,'24925','ac70c86e','2022-05-04 13:01:54.671084','2022-05-04 13:01:54.671084'),(26,'Kristyn','Madelin','computer science','2001-09-18 00:00:00','Tiena@gmail.com',35505,'48157','e0fab433','2022-05-04 13:01:54.673968','2022-05-04 13:01:54.673968'),(27,'Dione','Darlleen','computer science','2001-09-11 00:00:00','Charmion@gmail.com',23121,'44312','90ec49a3','2022-05-04 13:01:54.676864','2022-05-04 13:01:54.676864'),(28,'Lib','Berry','computer science','2001-02-06 00:00:00','Gwendolin@gmail.com',52466,'56076','836183db','2022-05-04 13:01:54.679703','2022-05-04 13:01:54.679703'),(29,'Sheilah','Sabina','computer science','2001-10-16 01:00:00','Starlin@gmail.com',45544,'31861','afc10190','2022-05-04 13:01:54.682591','2022-05-04 13:01:54.682591'),(30,'Vicki','Fiona','computer science','2001-06-23 00:00:00','Merlina@gmail.com',31134,'24212','9c7a29bd','2022-05-04 13:01:54.685321','2022-05-04 13:01:54.685321'),(31,'Seka','Eden','computer science','2001-05-20 00:00:00','Allis@gmail.com',28391,'47258','68d2baad','2022-05-04 13:01:54.693979','2022-05-04 13:01:54.693979'),(32,'Ysabel','Constantine','computer science','2001-01-27 00:00:00','Lotty@gmail.com',30442,'20779','6c5b858a','2022-05-04 13:01:54.853407','2022-05-04 13:01:54.853407'),(33,'Enrika','Daffy','computer science','2001-05-04 00:00:00','Carolyn@gmail.com',15265,'36678','944d855f','2022-05-04 13:01:54.970999','2022-05-04 13:01:54.970999'),(34,'Anjela','Oneida','computer science','2001-04-21 00:00:00','Siusan@gmail.com',12709,'15257','12c3acea','2022-05-04 13:01:54.974088','2022-05-04 13:01:54.974088'),(35,'Billy','Bobbye','computer science','2001-06-12 00:00:00','Willa@gmail.com',42440,'38205','0aeb9432','2022-05-04 13:01:54.978116','2022-05-04 13:01:54.978116'),(36,'Frances','Emmalyn','computer science','2001-09-21 00:00:00','Nanette@gmail.com',45485,'12525','8a710aca','2022-05-04 13:01:54.981049','2022-05-04 13:01:54.981049'),(37,'Sophi','Karalee','computer science','2001-10-22 01:00:00','Chiquia@gmail.com',25761,'58566','f7070148','2022-05-04 13:01:54.984158','2022-05-04 13:01:54.984158'),(38,'Annie','Denna','computer science','2001-05-03 00:00:00','Dion@gmail.com',51545,'30710','eee00491','2022-05-04 13:01:54.987214','2022-05-04 13:01:54.987214'),(39,'Jobey','Rodina','computer science','2001-09-11 00:00:00','Elena@gmail.com',13369,'35773','e6f05da5','2022-05-04 13:01:54.990620','2022-05-04 13:01:54.990620'),(40,'Carmelina','Trula','computer science','2001-12-19 01:00:00','Carolina@gmail.com',34784,'30459','5a44fce6','2022-05-04 13:01:54.991915','2022-05-04 13:01:54.991915'),(41,'Gertrudis','Gwenora','computer science','2001-11-15 01:00:00','Tandy@gmail.com',51760,'43339','fdb46950','2022-05-04 13:01:54.993405','2022-05-04 13:01:54.993405'),(42,'Kristin','Nita','computer science','2001-03-25 00:00:00','Debor@gmail.com',55644,'37887','31c5e344','2022-05-04 13:01:55.012418','2022-05-04 13:01:55.012418'),(43,'Betsey','Patsy','computer science','2001-12-03 00:00:00','Myrta@gmail.com',47778,'32615','6bece174','2022-05-04 13:01:55.149647','2022-05-04 13:01:55.149647'),(44,'Helaine','Elmira','computer science','2001-08-04 00:00:00','Ara@gmail.com',14272,'14100','4f00a822','2022-05-04 13:01:55.207611','2022-05-04 13:01:55.207611'),(45,'Stefa','Blair','computer science','2001-10-23 01:00:00','Abigale@gmail.com',56107,'58727','37c1ae6e','2022-05-04 13:01:55.212541','2022-05-04 13:01:55.212541'),(46,'Karel','Tiffi','computer science','2001-12-07 00:00:00','Truda@gmail.com',52613,'25974','99dc6b49','2022-05-04 13:01:55.216105','2022-05-04 13:01:55.216105'),(47,'Christyna','Anica','computer science','2001-06-25 00:00:00','Ursuline@gmail.com',22922,'51134','a709e85c','2022-05-04 13:01:55.218778','2022-05-04 13:01:55.218778'),(48,'Adria','Linnea','computer science','2001-12-19 01:00:00','Renelle@gmail.com',28599,'48347','89614381','2022-05-04 13:01:55.220708','2022-05-04 13:01:55.220708'),(49,'Sheri','Darell','computer science','2001-02-10 00:00:00','Alena@gmail.com',31962,'59147','186bf474','2022-05-04 13:01:55.226017','2022-05-04 13:01:55.226017'),(50,'Malinde','Gail','computer science','2001-05-03 00:00:00','Lenore@gmail.com',14378,'29814','45b306d3','2022-05-04 13:01:55.237242','2022-05-04 13:01:55.237242');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
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
