-- MariaDB dump 10.19  Distrib 10.4.22-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: db_menor
-- ------------------------------------------------------
-- Server version	10.4.22-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_access`
--

DROP TABLE IF EXISTS `tbl_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_access`
--

LOCK TABLES `tbl_access` WRITE;
/*!40000 ALTER TABLE `tbl_access` DISABLE KEYS */;
INSERT INTO `tbl_access` VALUES (1,'Super Admin'),(2,'sales clerk'),(3,'customer'),(4,'inventory clerk'),(5,'Admin');
/*!40000 ALTER TABLE `tbl_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_category`
--

DROP TABLE IF EXISTS `tbl_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0,
  `date_created` datetime DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_category`
--

LOCK TABLES `tbl_category` WRITE;
/*!40000 ALTER TABLE `tbl_category` DISABLE KEYS */;
INSERT INTO `tbl_category` VALUES (1,'Quail',0,'2022-09-12 17:00:48',NULL),(2,'Egg',0,'2022-09-12 17:00:48',NULL),(3,'Vitamins',0,'2022-09-12 17:00:48',NULL),(7,'Feeds',0,'2022-09-12 22:30:50',NULL),(8,'test23',1,'2023-01-16 13:33:28',NULL),(9,'cage',0,'2023-02-15 21:14:48',NULL);
/*!40000 ALTER TABLE `tbl_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_gender`
--

DROP TABLE IF EXISTS `tbl_gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_gender` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gender` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_gender`
--

LOCK TABLES `tbl_gender` WRITE;
/*!40000 ALTER TABLE `tbl_gender` DISABLE KEYS */;
INSERT INTO `tbl_gender` VALUES (1,'male'),(2,'female');
/*!40000 ALTER TABLE `tbl_gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_inventory`
--

DROP TABLE IF EXISTS `tbl_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_inventory`
--

LOCK TABLES `tbl_inventory` WRITE;
/*!40000 ALTER TABLE `tbl_inventory` DISABLE KEYS */;
INSERT INTO `tbl_inventory` VALUES (1,1,0),(2,2,0),(3,3,0),(4,4,0),(5,5,0),(6,6,0),(7,7,0),(8,8,0),(9,9,0),(10,10,0),(11,11,0),(12,12,0),(13,13,0),(14,14,0),(15,15,0),(16,16,0),(17,18,0),(18,19,0),(19,23,0),(20,24,0),(21,25,0),(22,26,0),(23,27,0);
/*!40000 ALTER TABLE `tbl_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_inventory_history`
--

DROP TABLE IF EXISTS `tbl_inventory_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_inventory_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `original_qty` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_inventory_history`
--

LOCK TABLES `tbl_inventory_history` WRITE;
/*!40000 ALTER TABLE `tbl_inventory_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_inventory_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_invoice`
--

DROP TABLE IF EXISTS `tbl_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice` varchar(45) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `paid_status_id` int(10) unsigned DEFAULT 1,
  `date_created` datetime DEFAULT current_timestamp(),
  `status_id` int(11) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `contact_no` varchar(45) DEFAULT NULL,
  `amount` varchar(45) DEFAULT NULL,
  `change` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_invoice`
--

LOCK TABLES `tbl_invoice` WRITE;
/*!40000 ALTER TABLE `tbl_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_invoice_status`
--

DROP TABLE IF EXISTS `tbl_invoice_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_invoice_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_invoice_status`
--

LOCK TABLES `tbl_invoice_status` WRITE;
/*!40000 ALTER TABLE `tbl_invoice_status` DISABLE KEYS */;
INSERT INTO `tbl_invoice_status` VALUES (1,'PENDING'),(2,'PARTIAL APPROVED'),(3,'APPROVED'),(4,'DELIVERED'),(5,'RECEIVED'),(6,'CANCELLED'),(7,'REJECTED');
/*!40000 ALTER TABLE `tbl_invoice_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_invoice_status_history`
--

DROP TABLE IF EXISTS `tbl_invoice_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_invoice_status_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_invoice_status_history`
--

LOCK TABLES `tbl_invoice_status_history` WRITE;
/*!40000 ALTER TABLE `tbl_invoice_status_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_invoice_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_paid_status`
--

DROP TABLE IF EXISTS `tbl_paid_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_paid_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `created_date` datetime DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT current_timestamp(),
  `deleted_flag` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_paid_status`
--

LOCK TABLES `tbl_paid_status` WRITE;
/*!40000 ALTER TABLE `tbl_paid_status` DISABLE KEYS */;
INSERT INTO `tbl_paid_status` VALUES (1,'UNPAID','2022-11-02 14:17:27','2022-11-02 14:17:27',0),(2,'PAID','2022-11-02 14:17:27','2022-11-02 14:17:27',0);
/*!40000 ALTER TABLE `tbl_paid_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_product`
--

DROP TABLE IF EXISTS `tbl_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` decimal(5,2) DEFAULT 0.00,
  `date_created` datetime DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0,
  `expiration_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_product`
--

LOCK TABLES `tbl_product` WRITE;
/*!40000 ALTER TABLE `tbl_product` DISABLE KEYS */;
INSERT INTO `tbl_product` VALUES (1,1,'Male quails','Kals','image_20230126120519.jpeg',12.00,'2022-06-11 14:31:01',NULL,0,NULL),(2,1,'Female quail','Laying Eggs','female_quail.png',25.00,'2022-06-11 14:31:01',NULL,0,NULL),(3,2,'Quail Egg','Egg','quail_egg.jpg',1.15,'2022-06-12 21:41:20',NULL,0,NULL),(4,1,'Female quail','8 - 12 Months Kal','Quail8months.png',15.00,'2022-06-20 13:56:04',NULL,0,NULL),(5,1,'test','test','default.png',100.00,'2022-06-26 17:58:28',2,1,NULL),(6,1,'test','test','default.png',100.00,'2022-06-26 17:58:48',2,1,NULL),(7,1,'test','test','default.png',100.00,'2022-06-26 17:59:26',2,1,NULL),(8,1,'test','test','default.png',100.00,'2022-06-26 18:01:25',2,1,NULL),(9,1,'1232','test','image_20220626124207.jpeg',100.00,'2022-06-26 18:07:13',2,1,NULL),(10,1,'test','test','image_20220626121905.jpeg',123.00,'2022-06-26 18:19:05',2,1,NULL),(11,1,'123','test','image_20220626122042.jpeg',123.00,'2022-06-26 18:20:43',2,1,NULL),(12,1,'test','test','image_20220626122100.jpeg',123.00,'2022-06-26 18:21:00',2,1,NULL),(13,1,'123','test','default.png',231.00,'2022-09-11 17:09:10',2,1,NULL),(14,3,'Coturnix Quail','Vitamin & Electrolytes','image_20230126120636.jpeg',200.00,'2022-10-07 23:17:40',2,0,NULL),(16,7,'Premium Quail Layer','Feeds','image_20230131092314.jpeg',999.99,'2022-10-07 23:23:28',2,0,NULL),(17,2,'a','a','default.png',100.00,'2023-01-16 14:08:52',NULL,1,NULL),(18,2,'pepsi','','default.png',59.00,'2023-02-06 10:58:13',NULL,1,NULL),(19,2,'red bull','','default.png',299.00,'2023-02-06 10:58:25',NULL,1,NULL),(20,2,'testestestset','test','default.png',999.99,'2023-02-15 20:25:53',NULL,1,'0000-00-00'),(21,2,'testsetest','test','default.png',999.99,'2023-02-15 20:26:30',NULL,1,'2023-04-01'),(22,2,'Quail Egg','test','default.png',999.99,'2023-02-15 20:28:30',NULL,1,'2023-01-01'),(23,1,'testsetsete','test','default.png',999.99,'2023-02-15 20:30:04',NULL,1,'2023-01-01'),(24,2,'testsetsete','test','default.png',999.99,'2023-02-15 20:31:46',NULL,1,'2023-01-01'),(25,2,'testsetsete','test','default.png',23.00,'2023-02-15 20:32:16',NULL,1,'2023-01-04'),(26,9,'cage','qweqwewqwq','image_20230215141547.jpeg',150.00,'2023-02-15 21:15:47',NULL,1,'2024-02-15'),(27,9,'Trainer','teesdt','default.png',999.99,'2023-02-16 23:15:18',NULL,1,'2023-01-01');
/*!40000 ALTER TABLE `tbl_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_status`
--

DROP TABLE IF EXISTS `tbl_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_status`
--

LOCK TABLES `tbl_status` WRITE;
/*!40000 ALTER TABLE `tbl_status` DISABLE KEYS */;
INSERT INTO `tbl_status` VALUES (1,'draft'),(2,'order placed'),(3,'approved'),(4,'order shipped'),(5,'cancelled'),(6,'rejected'),(7,'received'),(8,'delivered');
/*!40000 ALTER TABLE `tbl_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_status_history`
--

DROP TABLE IF EXISTS `tbl_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_status_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_status_history`
--

LOCK TABLES `tbl_status_history` WRITE;
/*!40000 ALTER TABLE `tbl_status_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_transactions`
--

DROP TABLE IF EXISTS `tbl_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) DEFAULT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT 1,
  `date_created` datetime DEFAULT current_timestamp(),
  `is_deleted` int(11) DEFAULT 0,
  `date_updated` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_transactions`
--

LOCK TABLES `tbl_transactions` WRITE;
/*!40000 ALTER TABLE `tbl_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_users`
--

DROP TABLE IF EXISTS `tbl_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(150) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `access_id` int(11) DEFAULT 3,
  `date_created` datetime DEFAULT current_timestamp(),
  `is_deleted` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_users`
--

LOCK TABLES `tbl_users` WRITE;
/*!40000 ALTER TABLE `tbl_users` DISABLE KEYS */;
INSERT INTO `tbl_users` VALUES (2,'admin','$2y$10$oAudgvpauxhyTxyhDOvo7.Geu/ddVWPU/TIq690SwRXOySZa81Iry','cjarasa@gmail.com',1,'2022-06-12 02:42:14',0),(7,'Salesclerk','$2y$10$Y3ksPARb0uYJFuetdyGuaeRa.jOpIR.8KAxNlVvij4ZQNaZ1KmVm6','cashier@gmail.com',2,'2022-06-12 10:10:09',1),(9,'carrier','$2y$10$Y3ksPARb0uYJFuetdyGuaeRa.jOpIR.8KAxNlVvij4ZQNaZ1KmVm6','carrier@gmail.com',4,'2022-06-15 22:14:36',1),(10,'admin2','$2y$10$/wkSAVsPPi.ooWYWZodyoeio4Xs9gPjEZCm4MMdG.LDlRGAEOxN82','admin2@gmail.com',1,'2022-06-18 19:38:27',1),(11,'customer2','$2y$10$oAudgvpauxhyTxyhDOvo7.Geu/ddVWPU/TIq690SwRXOySZa81Iry','customer2@gmail.com',3,'2022-06-20 14:36:28',1),(12,'arasa1234','$2y$10$sEYi97dPYqYy0IOAij8vQ.wfZS0y5/8kI6jR0pLZjSqPnp6wZW/.G','testlords@gmail.com',1,'2022-08-06 16:11:57',1),(13,'cjarasa@gmail.com','$2y$10$bi1p.UAHwe3BLFmsvu3q2eHBPRH7nwtYaCyFlIXpg2J2Dl68weOwK','cjarasa@gmail.com',3,'2022-09-12 16:30:13',1),(14,'ace','$2y$10$oAudgvpauxhyTxyhDOvo7.Geu/ddVWPU/TIq690SwRXOySZa81Iry','ace@gmail.com',3,'2022-10-07 22:16:22',1),(21,'ace2','$2y$10$ww5FzutknJMdT.LqriTQfOzBR1xFYWj1MY5UahTFy30.t.lrnpKQq',NULL,5,'2023-02-16 23:03:15',1),(22,'ace3','$2y$10$8vavpKNOenVSyJPmFQG9bOxUHIR3Hzbbsrfwf.87W84qdnqiWJ7sm',NULL,5,'2023-02-16 23:03:35',1),(23,'ace','$2y$10$CXW45.fBNMF2rPh0Amc/huUa8XQAEejH9Rs1tf4VIgrR3urpJHvfC',NULL,3,'2023-02-17 00:29:47',0);
/*!40000 ALTER TABLE `tbl_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_users_info`
--

DROP TABLE IF EXISTS `tbl_users_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_users_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `contact_no` int(11) DEFAULT NULL,
  `gender_id` int(11) DEFAULT NULL,
  `province` text DEFAULT NULL,
  `city` text DEFAULT NULL,
  `barangay` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_users_info`
--

LOCK TABLES `tbl_users_info` WRITE;
/*!40000 ALTER TABLE `tbl_users_info` DISABLE KEYS */;
INSERT INTO `tbl_users_info` VALUES (2,'Carlos','arasa','poblaction sur bayambang pangasinan2',2147483647,1,NULL,NULL,NULL),(7,'Sales Clerk','Cashier','poblaction sur bayambang pangasinan',2147483647,1,NULL,NULL,NULL),(9,'Carrier','Carrier','poblaction sur bayambang pangasinan',2147483647,1,NULL,NULL,NULL),(10,'admin2','admin2','poblaction sur bayambang pangasinan',2147483647,1,NULL,NULL,NULL),(11,'Carlos','arasa','poblaction sur bayambang pangasinan',2147483647,1,NULL,NULL,NULL),(12,'Typhoon','arasa ','poblaction sur bayambang pangasinan',2147483647,1,NULL,NULL,NULL),(13,'carlos','arasa','test',2147483647,1,NULL,NULL,NULL),(14,'ace','acer','bababab',2147483647,2,'province','city','barangay'),(21,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tbl_users_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-17  0:31:45
