-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: localhost    Database: hbnb_dev_db
-- ------------------------------------------------------
-- Server version	8.0.28-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `amenities`
--

DROP TABLE IF EXISTS `amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amenities` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amenities`
--

LOCK TABLES `amenities` WRITE;
/*!40000 ALTER TABLE `amenities` DISABLE KEYS */;
INSERT INTO `amenities` VALUES ('464b3b8a-daca-49d2-a8d9-c0be1f189ab6','2023-07-22 12:53:05','2023-07-22 12:53:05','Cable'),('a39ad71c-088d-4091-ac33-57123d2653df','2023-07-22 12:53:05','2023-07-22 12:53:05','Oven'),('f3a074f6-95d3-4d6a-a870-79090c608bed','2023-07-22 12:53:05','2023-07-22 12:53:05','Wifi');
/*!40000 ALTER TABLE `amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(128) NOT NULL,
  `state_id` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `state_id` (`state_id`),
  CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES ('0087e79d-6305-43bb-9d83-a3e57e3514c4','2023-07-22 14:08:51','2023-07-22 14:08:51','Portland','b5073f68-4c00-4a8d-a6d8-66ec520d5678'),('013edb75-150f-4efc-ae15-4211f6db9944','2023-07-22 14:03:52','2023-07-22 14:03:52','Jackson','2ee75cee-3101-426b-8361-da08eca7154d'),('06fd8241-913a-4a63-84b7-c685f42b2646','2023-07-22 13:17:18','2023-07-22 13:17:18','Fremont','fde1c9ee-4b6f-4317-ad93-feb1fd0a13ca'),('087af196-5967-4d03-8657-8c2188db000f','2023-07-22 13:18:13','2023-07-22 13:18:13','Sonoma','fde1c9ee-4b6f-4317-ad93-feb1fd0a13ca'),('08e29510-cbfb-41e8-9390-adef54644da3','2023-07-22 12:41:18','2023-07-22 12:41:18','San Jose','fde1c9ee-4b6f-4317-ad93-feb1fd0a13ca'),('0c507715-f74d-46de-a140-2b527b1cfedc','2023-07-22 13:07:13','2023-07-22 13:07:13','Akron','21d36b8f-804c-455c-b9db-7fbb255044f0'),('0dc873b1-528b-46a6-825c-e4ffdc703e80','2023-07-22 14:08:18','2023-07-22 14:08:18','Eugene','b5073f68-4c00-4a8d-a6d8-66ec520d5678'),('114436fe-dc44-4a6e-b5c9-07802520e177','2023-07-22 13:56:33','2023-07-22 13:56:33','Lafayette','a98481e2-45ea-43a6-a208-55a96e4955d0'),('181a4be1-168a-45ba-8f53-a6b0bd07537b','2023-07-22 13:44:51','2023-07-22 13:44:51','Kailua','8e77d473-3295-4808-b854-b99abfd13a9b'),('1b1ac66e-4e58-443b-8fad-ef11597f8098','2023-07-22 14:06:16','2023-07-22 14:06:16','Tupelo','2ee75cee-3101-426b-8361-da08eca7154d'),('29237119-691f-45b8-bb98-dec97fb541a8','2023-07-22 14:01:44','2023-07-22 14:01:44','SaintPaul','4f934bd3-1f88-43f5-9531-0ac63fc63733'),('41a8b7c0-abc6-4a01-9820-6a0c1a906490','2023-07-22 13:40:09','2023-07-22 13:40:09','Orlando','d5672d6a-0319-49d7-9622-19d7694b6134'),('43641152-7efe-4cdd-8f2b-002278fba965','2023-07-22 13:11:09','2023-07-22 13:11:09','Kearny','f4806661-7fe9-441e-9fed-2d2dc680f587'),('4d50a424-2cee-43ed-8411-613152c93331','2023-07-22 13:37:43','2023-07-22 13:37:43','Denver','fc8ae6c6-132d-474f-9dd7-6f86b6ac59ec'),('4f40ce1b-8fde-412a-a758-5001992ea0b4','2023-07-22 13:08:43','2023-07-22 13:08:43','Fairfield','21d36b8f-804c-455c-b9db-7fbb255044f0'),('4f5ea580-54c8-4977-b1ea-b82e17c8586f','2023-07-22 13:59:14','2023-07-22 13:59:14','NewOrleans','a98481e2-45ea-43a6-a208-55a96e4955d0'),('591190ee-31a4-45cb-9cce-3bc9608da933','2023-07-22 13:11:35','2023-07-22 13:11:35','Tempe','f4806661-7fe9-441e-9fed-2d2dc680f587'),('5aa5fb24-785f-4943-b438-f4a62ffc80ad','2023-07-22 14:05:19','2023-07-22 14:05:19','Meridian','2ee75cee-3101-426b-8361-da08eca7154d'),('5da10649-f97e-46f4-ba01-b215f23392c3','2023-07-22 13:17:41','2023-07-22 13:17:41','Napa','fde1c9ee-4b6f-4317-ad93-feb1fd0a13ca'),('62417853-0c6a-4003-8f30-fea94ba9ba8c','2023-07-22 13:07:43','2023-07-22 13:07:43','Babbie','21d36b8f-804c-455c-b9db-7fbb255044f0'),('70d8864f-de66-4dd1-9b4a-9563dbe0f6a9','2023-07-22 13:50:45','2023-07-22 13:50:45','Joliet','ebab8a12-b1f5-4b52-9710-ef31da0b5a3c'),('743cd8d4-1771-41ef-912a-f7501cccb14f','2023-07-22 13:50:08','2023-07-22 13:50:08','Chicago','ebab8a12-b1f5-4b52-9710-ef31da0b5a3c'),('7a7b060e-2993-47a7-9a18-c838b7f1498a','2023-07-22 13:47:53','2023-07-22 13:47:53','Pearlcity','8e77d473-3295-4808-b854-b99abfd13a9b'),('7cd63394-c989-4061-991c-591acd11e231','2023-07-22 13:10:27','2023-07-22 13:10:27','Douglas','f4806661-7fe9-441e-9fed-2d2dc680f587'),('7f12f7bc-cf1c-4152-b207-1ea4192689b1','2023-07-22 13:52:05','2023-07-22 13:52:05','Peoria','ebab8a12-b1f5-4b52-9710-ef31da0b5a3c'),('8a34dceb-8530-46b5-9852-a392eb8b5208','2023-07-22 12:53:05','2023-07-22 12:53:05','San Francisco','a60e0cc0-c5c8-42c5-bc23-6b39d5ee3eac'),('8ea0efd5-b31b-4219-a745-869a7d56fe0f','2023-07-22 13:52:36','2023-07-22 13:52:36','Urbana','ebab8a12-b1f5-4b52-9710-ef31da0b5a3c'),('9f5e62de-48e6-4182-87ec-9ccb2b476d4a','2023-07-22 13:51:16','2023-07-22 13:51:16','Naperville','ebab8a12-b1f5-4b52-9710-ef31da0b5a3c'),('a47b5697-bada-498a-b6cd-7554529674e5','2023-07-22 13:44:25','2023-07-22 13:44:25','Honolulu','8e77d473-3295-4808-b854-b99abfd13a9b'),('a8a29e1f-2b13-4126-a119-2d01d6823e25','2023-07-22 13:46:38','2023-07-22 13:46:38','Kailua','8e77d473-3295-4808-b854-b99abfd13a9b'),('cd9161f8-ecc3-4843-9d23-ecd8fcee24e8','2023-07-22 13:39:43','2023-07-22 13:39:43','Miami','d5672d6a-0319-49d7-9622-19d7694b6134'),('d3ce9583-b5d5-4a06-8774-8db5fb4da989','2023-07-22 13:08:10','2023-07-22 13:08:10','Calera','21d36b8f-804c-455c-b9db-7fbb255044f0'),('efcbf987-25e1-4200-b248-efdf3b7e1fc3','2023-07-22 12:39:40','2023-07-22 12:39:40','San Francisco','fde1c9ee-4b6f-4317-ad93-feb1fd0a13ca'),('fd7313ac-5194-4af7-bc8f-5a3a1def5a01','2023-07-22 13:55:52','2023-07-22 13:55:52','Batonrogue','a98481e2-45ea-43a6-a208-55a96e4955d0');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `place_amenity`
--

DROP TABLE IF EXISTS `place_amenity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `place_amenity` (
  `place_id` varchar(60) NOT NULL,
  `amenity_id` varchar(60) NOT NULL,
  PRIMARY KEY (`place_id`,`amenity_id`),
  KEY `amenity_id` (`amenity_id`),
  CONSTRAINT `place_amenity_ibfk_1` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`),
  CONSTRAINT `place_amenity_ibfk_2` FOREIGN KEY (`amenity_id`) REFERENCES `amenities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place_amenity`
--

LOCK TABLES `place_amenity` WRITE;
/*!40000 ALTER TABLE `place_amenity` DISABLE KEYS */;
INSERT INTO `place_amenity` VALUES ('0f23581b-d20b-4fb9-9e89-9fd562ce7731','464b3b8a-daca-49d2-a8d9-c0be1f189ab6'),('e4eba92d-27c4-4f6e-8eb8-8cc1d6ad5334','464b3b8a-daca-49d2-a8d9-c0be1f189ab6'),('e4eba92d-27c4-4f6e-8eb8-8cc1d6ad5334','a39ad71c-088d-4091-ac33-57123d2653df'),('0f23581b-d20b-4fb9-9e89-9fd562ce7731','f3a074f6-95d3-4d6a-a870-79090c608bed'),('e4eba92d-27c4-4f6e-8eb8-8cc1d6ad5334','f3a074f6-95d3-4d6a-a870-79090c608bed');
/*!40000 ALTER TABLE `place_amenity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `places`
--

DROP TABLE IF EXISTS `places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `places` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `city_id` varchar(60) NOT NULL,
  `user_id` varchar(60) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `number_rooms` int NOT NULL,
  `number_bathrooms` int NOT NULL,
  `max_guest` int NOT NULL,
  `price_by_night` int NOT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `city_id` (`city_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `places_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  CONSTRAINT `places_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places`
--

LOCK TABLES `places` WRITE;
/*!40000 ALTER TABLE `places` DISABLE KEYS */;
INSERT INTO `places` VALUES ('0f23581b-d20b-4fb9-9e89-9fd562ce7731','2023-07-22 12:53:05','2023-07-22 12:53:05','8a34dceb-8530-46b5-9852-a392eb8b5208','2207ab6b-c35f-4658-9e9c-fbdbfc7d7c6b','House 1',NULL,0,0,0,0,NULL,NULL),('42fbc3cc-3859-4408-b8de-f02e4ce3ebfb','2023-07-22 12:48:01','2023-07-22 12:48:01','efcbf987-25e1-4200-b248-efdf3b7e1fc3','e287f9b5-bbbe-4dfd-86bf-143bd0ebc94b','Lovely place',NULL,3,1,6,120,37.774,-122.431),('e4eba92d-27c4-4f6e-8eb8-8cc1d6ad5334','2023-07-22 12:53:05','2023-07-22 12:53:05','8a34dceb-8530-46b5-9852-a392eb8b5208','2207ab6b-c35f-4658-9e9c-fbdbfc7d7c6b','House 2',NULL,0,0,0,0,NULL,NULL);
/*!40000 ALTER TABLE `places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `place_id` varchar(60) NOT NULL,
  `user_id` varchar(60) NOT NULL,
  `text` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `place_id` (`place_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES ('585801c4-57c2-4486-a562-52c507c8532f','2023-07-22 12:51:11','2023-07-22 12:51:11','42fbc3cc-3859-4408-b8de-f02e4ce3ebfb','e287f9b5-bbbe-4dfd-86bf-143bd0ebc94b','Amazing place, huge kitchen');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES ('21d36b8f-804c-455c-b9db-7fbb255044f0','2023-07-22 13:02:19','2023-07-22 13:02:19','Alabama'),('2ee75cee-3101-426b-8361-da08eca7154d','2023-07-22 14:02:33','2023-07-22 14:02:33','Mississippi'),('421a55f1-7d82-45d9-b54c-a76916479545','2017-03-25 19:42:40','2017-03-25 19:42:40','Alabama'),('4f934bd3-1f88-43f5-9531-0ac63fc63733','2023-07-22 13:59:58','2023-07-22 13:59:58','Minnesota'),('86014697-d1aa-4ed9-8e11-e143c6a54351','2023-07-22 13:42:19','2023-07-22 13:42:19','Georgia'),('8e77d473-3295-4808-b854-b99abfd13a9b','2023-07-22 13:42:47','2023-07-22 13:42:47','Hawaii'),('a60e0cc0-c5c8-42c5-bc23-6b39d5ee3eac','2023-07-22 12:53:05','2023-07-22 12:53:05','California'),('a98481e2-45ea-43a6-a208-55a96e4955d0','2023-07-22 13:54:01','2023-07-22 13:54:01','Louisiana'),('b5073f68-4c00-4a8d-a6d8-66ec520d5678','2023-07-22 14:07:07','2023-07-22 14:07:07','Oregon'),('d5672d6a-0319-49d7-9622-19d7694b6134','2023-07-22 13:38:43','2023-07-22 13:38:43','Florida'),('e4904277-4042-4611-bb38-7362e0291141','2023-07-22 13:53:24','2023-07-22 13:53:24','Indiana'),('ebab8a12-b1f5-4b52-9710-ef31da0b5a3c','2023-07-22 13:48:42','2023-07-22 13:48:42','Illinois'),('f4806661-7fe9-441e-9fed-2d2dc680f587','2023-07-22 13:09:21','2023-07-22 13:09:21','Arizona'),('fc8ae6c6-132d-474f-9dd7-6f86b6ac59ec','2023-07-22 13:26:31','2023-07-22 13:26:31','Colorado'),('fde1c9ee-4b6f-4317-ad93-feb1fd0a13ca','2023-07-22 12:37:28','2023-07-22 12:37:28','California');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `first_name` varchar(128) DEFAULT NULL,
  `last_name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('2207ab6b-c35f-4658-9e9c-fbdbfc7d7c6b','2023-07-22 12:53:05','2023-07-22 12:53:05','john@snow.com','johnpwd',NULL,NULL),('35babf70-cb2b-41c8-9dcf-5b190fa32542','2023-07-22 12:49:22','2023-07-22 12:49:22','bob@hbtn.io','bobpwd','Bob','Dylan'),('e287f9b5-bbbe-4dfd-86bf-143bd0ebc94b','2023-07-22 12:42:24','2023-07-22 12:42:24','gui@hbtn.io','guipwd','Guillaume','Snow');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-22 14:45:28
