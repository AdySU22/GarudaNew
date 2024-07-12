-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: umn
-- ------------------------------------------------------
-- Server version	9.0.0

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
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token` (
  `user_id` varchar(100) NOT NULL,
  `token` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES ('29035979-aecc-40e9-a9ed-e78242ea0d32','69687d08-476b-4661-9f4d-d18ccd4341c6'),('29035979-aecc-40e9-a9ed-e78242ea0d32','a2d9044d-cbe3-4148-8487-fa2e9979c976'),('e86a3ca5-1f2b-47ed-8602-181db0e8f89c','691d8443-3d74-4dd6-ba51-f480918ad080'),('29035979-aecc-40e9-a9ed-e78242ea0d32','25c03379-2e26-42d4-99ce-80e40d1a4bec'),('29035979-aecc-40e9-a9ed-e78242ea0d32','54cb51a7-31b4-43e3-b6ed-c097a9d087c9'),('29035979-aecc-40e9-a9ed-e78242ea0d32','bae146ac-256b-4467-ac5f-925fa8fc12bc'),('29035979-aecc-40e9-a9ed-e78242ea0d32','82111e7d-ede9-4eec-b37a-fc0d9eda88b9'),('29035979-aecc-40e9-a9ed-e78242ea0d32','5b6c0116-d9a8-4274-a532-92f415439063'),('e86a3ca5-1f2b-47ed-8602-181db0e8f89c','de06864f-3bb6-402b-8e02-80f95ea3d65e'),('29035979-aecc-40e9-a9ed-e78242ea0d32','f63c866d-32e5-4cb4-8c08-43ba53cf3993'),('e86a3ca5-1f2b-47ed-8602-181db0e8f89c','c0702c1e-0b9d-4140-923a-b48a328d1be1'),('e86a3ca5-1f2b-47ed-8602-181db0e8f89c','dec87655-21e2-4dbb-8496-172e91036674'),('e86a3ca5-1f2b-47ed-8602-181db0e8f89c','1b789015-383e-489a-b139-becebd7883f5');
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `id` varchar(100) NOT NULL,
  `amount` int NOT NULL,
  `time` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `venue_id` varchar(100) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES ('87494b68-33a2-4df1-a4d0-4c22f823a575',200000,'06:00','12-02-2024','1','2db28a9f-6ad8-4363-8991-7d46db073de2');
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telp` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('29035979-aecc-40e9-a9ed-e78242ea0d32','zdn','zdn@mail.com','12345678','$2b$12$ciG8wHijqMLhEwVC.28avumiKqMOjcWHxe0Bz5NBbfdZKknLDlwUa','client'),('2db28a9f-6ad8-4363-8991-7d46db073de2','Erwin Yonata','erwinwingyonata@gmail.com','081231503021','$2b$12$1Zynu2a34JYGZG.nvNh.devNIy2JIhYmuPejmzZqFFZj/nvpp31HW','client'),('e86a3ca5-1f2b-47ed-8602-181db0e8f89c','zidan','zidan@mail.com','1234567890','$2b$12$yG.899GFn0bzpZ1u/BQdy.myFbEcvtxcUZR0zwHdJ.BHQSIx5/kqy','client');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venue`
--

DROP TABLE IF EXISTS `venue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `location` varchar(100) NOT NULL,
  `capacity` int NOT NULL,
  `price` int NOT NULL,
  `open_day` varchar(1000) NOT NULL,
  `open_time` varchar(100) NOT NULL,
  `close_time` varchar(100) NOT NULL,
  `period` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venue`
--

LOCK TABLES `venue` WRITE;
/*!40000 ALTER TABLE `venue` DISABLE KEYS */;
INSERT INTO `venue` VALUES (1,'Lapangan Basket Outdoor 3','Outdoor basketball field is an outdoor basketball field that located near TVRI tower and beside beach volleyball field.','Gelora Bung Karno',1500,200000,'Monday, Tuesday, Wednesday','06:00','16:00',2),(2,'Stadion Utama','Latihan Sepak Bola didalam Stadion Utama GBK','Senayan City',50,300000,'Wednesday, Thursday, Friday','12:00','16:00',2),(3,'Lapangan Hoki 1','Hockey field 1 (near beach volley field) is an international standard area of 6.755,8 square meters with 208 FOP lamp lighting. This hockey field is international standard, coated with synthetic carpet and equipped with other supporting facilities, such as playerâ€™s changing rooms, office spaces, toilets, and mosque, management room, and CCTV Control Room. Gelora Bung Karno Hockey Field has been certified by the International Hockey Federation (FIH).','Kalibata City',818,400000,'Friday, Saturday, Sunday','14:00','16:00',2),(4,'Lapangan Basket Outdoor 4','Outdoor basketball field is an outdoor basketball field that located near TVRI tower and beside beach volleyball field. The size of this field is already using international standard which is 28 meters long and 15 meters wide. This field is also equipped with toilet.','Pantai Indah Kapuk',900,500000,'Saturday, Sunday','11:00','14:00',1),(5,'Jogging Track','Jogging Track didalam Stadion Utama GBK','Cawang City',400,250000,'Monday, Wednesday, Thursday','10:00','18:00',2);
/*!40000 ALTER TABLE `venue` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-13  4:36:32
