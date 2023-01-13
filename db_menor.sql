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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_category`
--

LOCK TABLES `tbl_category` WRITE;
/*!40000 ALTER TABLE `tbl_category` DISABLE KEYS */;
INSERT INTO `tbl_category` VALUES (1,'Quail',0,'2022-09-12 17:00:48',NULL),(2,'Egg',0,'2022-09-12 17:00:48',NULL),(3,'Vitamins',0,'2022-09-12 17:00:48',NULL),(7,'Feeds',0,'2022-09-12 22:30:50',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_inventory`
--

LOCK TABLES `tbl_inventory` WRITE;
/*!40000 ALTER TABLE `tbl_inventory` DISABLE KEYS */;
INSERT INTO `tbl_inventory` VALUES (1,1,2478),(2,2,1455),(3,3,997),(4,4,1001),(5,5,330),(6,6,123),(7,7,100),(8,8,100),(9,9,94),(10,10,101),(11,11,100),(12,12,100),(13,13,0),(14,14,500),(15,15,500),(16,16,500);
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_inventory_history`
--

LOCK TABLES `tbl_inventory_history` WRITE;
/*!40000 ALTER TABLE `tbl_inventory_history` DISABLE KEYS */;
INSERT INTO `tbl_inventory_history` VALUES (6,1,1013,2,2,'2022-06-26 20:23:58'),(7,1,1015,3,2,'2022-06-26 20:24:04'),(8,1,1018,23,2,'2022-06-26 20:24:05'),(9,1,1041,23,2,'2022-06-26 20:34:27'),(10,1,1064,500,2,'2022-06-26 20:43:00'),(11,1,1564,23,7,'2022-06-26 20:47:08'),(12,1,1587,20,7,'2022-06-26 20:47:10'),(13,2,1000,500,2,'2022-06-26 21:26:54'),(14,6,100,23,2,'2022-07-30 17:14:05'),(15,1,1607,3,2,'2022-07-31 23:49:30'),(16,1,1610,3,2,'2022-07-31 23:49:34'),(17,2,1500,1,2,'2022-07-31 23:54:01'),(18,1,1613,-5,2,'2022-08-04 22:49:30'),(19,4,1000,1,2,'2022-08-06 16:12:38'),(20,5,100,230,2,'2022-08-06 16:12:51'),(21,1,1608,50,2,'2022-09-11 15:57:13'),(22,10,100,1,2,'2022-09-11 15:57:22'),(23,1,1658,800,2,'2022-09-11 16:46:22'),(24,1,2458,23,2,'2022-09-11 16:48:18'),(25,1,2479,-2,8,'2022-09-16 22:29:11'),(26,1,2477,2,2,'2022-10-06 17:33:15'),(27,1,2479,1,2,'2022-10-06 17:33:23'),(28,3,1000,-1,8,'2022-10-06 18:01:25'),(29,2,1501,-14,8,'2022-10-06 18:01:29'),(30,2,1487,-14,8,'2022-10-06 18:02:31'),(31,3,999,-1,8,'2022-10-06 18:02:31'),(32,2,1473,-14,8,'2022-10-06 18:03:05'),(33,3,998,-1,8,'2022-10-06 18:03:05'),(34,1,2480,-1,8,'2022-10-06 18:13:23'),(35,1,2479,-1,8,'2022-10-06 18:13:51'),(36,2,1459,-1,8,'2022-10-06 18:13:51'),(37,1,2478,-1,8,'2022-10-06 18:24:25'),(38,15,0,500,2,'2022-10-07 23:21:23'),(39,14,0,500,2,'2022-10-07 23:21:34'),(40,16,0,500,2,'2022-10-07 23:24:33'),(41,1,2477,1,17,'2022-10-20 16:44:03'),(42,2,1458,-1,14,'2022-11-02 14:14:29'),(43,2,1457,-1,8,'2022-11-25 19:36:34'),(44,2,1456,-1,8,'2022-11-25 19:37:02');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_invoice`
--

LOCK TABLES `tbl_invoice` WRITE;
/*!40000 ALTER TABLE `tbl_invoice` DISABLE KEYS */;
INSERT INTO `tbl_invoice` VALUES (1,'1665157742',14,1,'2022-10-07 23:49:02',NULL,NULL,NULL,NULL,NULL),(2,'1665242387',14,2,'2022-10-08 23:19:47',3,NULL,NULL,'233','208'),(3,'1666254302',8,1,'2022-10-20 16:25:02',1,NULL,NULL,'50','9'),(4,'1667370786',8,2,'2022-11-02 14:33:06',3,NULL,NULL,'90','65'),(5,'1667370824',8,2,'2022-11-02 14:33:44',3,NULL,NULL,'26','1'),(6,'1672974543',8,1,'2023-01-06 11:09:03',1,NULL,NULL,NULL,NULL),(7,'1673351716',15,1,'2023-01-10 19:55:16',1,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_invoice_status_history`
--

LOCK TABLES `tbl_invoice_status_history` WRITE;
/*!40000 ALTER TABLE `tbl_invoice_status_history` DISABLE KEYS */;
INSERT INTO `tbl_invoice_status_history` VALUES (1,2,3,2,'2022-11-02 14:14:29'),(2,2,3,2,'2022-11-25 19:36:34'),(3,2,3,2,'2022-11-25 19:37:02');
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
  `image` varchar(45) DEFAULT NULL,
  `price` decimal(5,2) DEFAULT 0.00,
  `date_created` datetime DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_product`
--

LOCK TABLES `tbl_product` WRITE;
/*!40000 ALTER TABLE `tbl_product` DISABLE KEYS */;
INSERT INTO `tbl_product` VALUES (1,1,'Male quail','Kal','image_20221007172703.jpeg',15.00,'2022-06-11 14:31:01',NULL,0),(2,1,'Female quail','Laying Eggs','female_quail.png',25.00,'2022-06-11 14:31:01',NULL,0),(3,2,'Quail Egg','Egg','quail_egg.jpg',1.15,'2022-06-12 21:41:20',NULL,0),(4,1,'Female quail','8 - 12 Months Kal','Quail8months.png',15.00,'2022-06-20 13:56:04',NULL,0),(5,1,'test','test','default.png',100.00,'2022-06-26 17:58:28',2,1),(6,1,'test','test','default.png',100.00,'2022-06-26 17:58:48',2,1),(7,1,'test','test','default.png',100.00,'2022-06-26 17:59:26',2,1),(8,1,'test','test','default.png',100.00,'2022-06-26 18:01:25',2,1),(9,1,'1232','test','image_20220626124207.jpeg',100.00,'2022-06-26 18:07:13',2,1),(10,1,'test','test','image_20220626121905.jpeg',123.00,'2022-06-26 18:19:05',2,1),(11,1,'123','test','image_20220626122042.jpeg',123.00,'2022-06-26 18:20:43',2,1),(12,1,'test','test','image_20220626122100.jpeg',123.00,'2022-06-26 18:21:00',2,1),(13,1,'123','test','default.png',231.00,'2022-09-11 17:09:10',2,1),(14,3,'Coturnix Quail','Vitamin & Electrolytes','image_20221007174034.jpeg',200.00,'2022-10-07 23:17:40',2,0),(15,7,'Premium Quail Layer','Feeds','image_20221007171919.jpeg',499.00,'2022-10-07 23:19:19',2,1),(16,7,'Premium Quail Layer','Feeds','image_20221007174043.jpeg',499.00,'2022-10-07 23:23:28',2,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_status_history`
--

LOCK TABLES `tbl_status_history` WRITE;
/*!40000 ALTER TABLE `tbl_status_history` DISABLE KEYS */;
INSERT INTO `tbl_status_history` VALUES (1,1,1,14,'2022-10-07 23:49:00'),(2,1,2,14,'2022-10-07 23:49:02'),(3,2,1,14,'2022-10-08 23:19:44'),(4,2,2,14,'2022-10-08 23:19:47'),(5,3,1,8,'2022-10-20 16:24:58'),(6,4,1,8,'2022-10-20 16:24:59'),(7,5,1,8,'2022-10-20 16:24:59'),(8,3,2,8,'2022-10-20 16:25:02'),(9,4,2,8,'2022-10-20 16:25:02'),(10,5,2,8,'2022-10-20 16:25:02'),(11,2,3,2,'2022-11-02 14:14:29'),(12,6,1,8,'2022-11-02 14:32:56'),(13,6,2,8,'2022-11-02 14:33:06'),(14,7,1,8,'2022-11-02 14:33:42'),(15,7,2,8,'2022-11-02 14:33:44'),(16,7,3,2,'2022-11-25 19:36:34'),(17,6,3,2,'2022-11-25 19:37:02'),(18,8,1,8,'2022-12-07 19:53:34'),(19,9,1,8,'2022-12-07 19:53:35'),(20,10,1,8,'2022-12-07 19:54:03'),(21,11,1,8,'2023-01-06 11:02:47'),(22,12,1,8,'2023-01-06 11:03:09'),(23,13,1,8,'2023-01-06 11:03:12'),(24,11,2,8,'2023-01-06 11:09:03'),(25,12,2,8,'2023-01-06 11:09:03'),(26,13,2,8,'2023-01-06 11:09:03'),(27,14,1,8,'2023-01-06 11:46:56'),(28,15,1,8,'2023-01-06 11:46:59'),(29,16,1,15,'2023-01-06 12:16:43'),(30,17,1,15,'2023-01-06 12:16:45'),(31,18,1,15,'2023-01-06 12:16:47');
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_transactions`
--

LOCK TABLES `tbl_transactions` WRITE;
/*!40000 ALTER TABLE `tbl_transactions` DISABLE KEYS */;
INSERT INTO `tbl_transactions` VALUES (1,1,180.00,12,1,14,NULL,2,'2022-10-07 23:48:59',0,'2022-10-07 23:48:59'),(2,2,25.00,1,2,14,2,3,'2022-10-08 23:19:44',0,'2022-11-02 07:14:29'),(3,3,15.00,1,1,8,NULL,2,'2022-10-20 16:24:58',0,'2022-10-20 16:24:58'),(4,3,25.00,1,2,8,NULL,2,'2022-10-20 16:24:59',0,'2022-10-20 16:24:59'),(5,3,1.15,1,3,8,NULL,2,'2022-10-20 16:24:59',0,'2022-10-20 16:24:59'),(6,4,25.00,1,2,8,2,3,'2022-11-02 14:32:56',0,'2022-11-25 12:37:02'),(7,5,25.00,1,2,8,2,3,'2022-11-02 14:33:42',0,'2022-11-25 12:36:34'),(8,NULL,30.00,2,1,8,NULL,1,'2022-12-07 19:53:34',1,'2022-12-07 12:54:04'),(9,NULL,75.00,3,2,8,NULL,1,'2022-12-07 19:53:35',1,'2022-12-07 12:54:06'),(10,NULL,30.00,2,4,8,NULL,1,'2022-12-07 19:54:03',1,'2022-12-07 12:54:05'),(11,6,75.00,3,2,8,NULL,2,'2023-01-06 11:02:47',0,'2023-01-06 04:02:49'),(12,6,1.00,1,3,8,NULL,2,'2023-01-06 11:03:09',0,'2023-01-06 11:03:09'),(13,6,15.00,1,4,8,NULL,2,'2023-01-06 11:03:12',0,'2023-01-06 11:03:12'),(14,NULL,300.00,12,2,8,NULL,1,'2023-01-06 11:46:56',0,'2023-01-06 11:46:56'),(15,NULL,3.00,3,3,8,NULL,1,'2023-01-06 11:46:59',1,'2023-01-06 11:46:59'),(16,7,100.00,4,2,15,NULL,2,'2023-01-06 12:16:43',0,'2023-01-10 12:53:57'),(17,7,345.00,23,4,15,NULL,2,'2023-01-06 12:16:45',0,'2023-01-06 12:16:45'),(18,7,15.00,1,1,15,NULL,2,'2023-01-06 12:16:47',0,'2023-01-06 12:16:47');
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_users`
--

LOCK TABLES `tbl_users` WRITE;
/*!40000 ALTER TABLE `tbl_users` DISABLE KEYS */;
INSERT INTO `tbl_users` VALUES (2,'admin','$2y$10$oAudgvpauxhyTxyhDOvo7.Geu/ddVWPU/TIq690SwRXOySZa81Iry','cjarasa@gmail.com',1,'2022-06-12 02:42:14',0),(7,'Salesclerk','$2y$10$Y3ksPARb0uYJFuetdyGuaeRa.jOpIR.8KAxNlVvij4ZQNaZ1KmVm6','cashier@gmail.com',2,'2022-06-12 10:10:09',0),(8,'customer_new','$2y$10$oAudgvpauxhyTxyhDOvo7.Geu/ddVWPU/TIq690SwRXOySZa81Iry','customer@gmail.com',3,'2022-06-12 10:23:27',0),(9,'carrier','$2y$10$Y3ksPARb0uYJFuetdyGuaeRa.jOpIR.8KAxNlVvij4ZQNaZ1KmVm6','carrier@gmail.com',4,'2022-06-15 22:14:36',0),(10,'admin2','$2y$10$/wkSAVsPPi.ooWYWZodyoeio4Xs9gPjEZCm4MMdG.LDlRGAEOxN82','admin2@gmail.com',1,'2022-06-18 19:38:27',1),(11,'customer2','$2y$10$oAudgvpauxhyTxyhDOvo7.Geu/ddVWPU/TIq690SwRXOySZa81Iry','customer2@gmail.com',3,'2022-06-20 14:36:28',1),(12,'arasa1234','$2y$10$sEYi97dPYqYy0IOAij8vQ.wfZS0y5/8kI6jR0pLZjSqPnp6wZW/.G','testlords@gmail.com',1,'2022-08-06 16:11:57',1),(13,'cjarasa@gmail.com','$2y$10$bi1p.UAHwe3BLFmsvu3q2eHBPRH7nwtYaCyFlIXpg2J2Dl68weOwK','cjarasa@gmail.com',3,'2022-09-12 16:30:13',1),(14,'ace','$2y$10$LKNeHFTMH6nQCcdXoUVWteQIUTviz9M4JgYKGYhlXRZGRi2GYRV..','ace@gmail.com',3,'2022-10-07 22:16:22',0),(15,'customer','$2y$10$oAudgvpauxhyTxyhDOvo7.Geu/ddVWPU/TIq690SwRXOySZa81Iry','customer@gmail.com',3,'2022-10-07 23:35:20',1),(16,'admin1','$2y$10$cIv49/hzXeEXmMoHp4iP.ez.TBSmI9I7MYO5znWWiiDtA8J9s5mTe','admin1@gmail.com',5,'2022-10-12 17:18:49',1),(17,'test','$2y$10$3TxN8Pd4DQ6x/9QU4oLd0u4NoQD7Qqtvr5ffMmCptf.IMHj7x8aLS','jimenez.carlo.llabor@gmail.com',5,'2022-10-20 16:31:15',0),(18,'test','$2y$10$qC1LSxIr.gmtBqi9J8uNiunPcfpaAkv0QIeDPKz5G9bPsSHpd7fk6',NULL,3,'2022-11-16 17:02:06',0);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_users_info`
--

LOCK TABLES `tbl_users_info` WRITE;
/*!40000 ALTER TABLE `tbl_users_info` DISABLE KEYS */;
INSERT INTO `tbl_users_info` VALUES (2,'Carlos','arasa','poblaction sur bayambang pangasinan2',2147483647,1),(7,'Sales Clerk','Cashier','poblaction sur bayambang pangasinan',2147483647,1),(8,'customer 123','customer 123','poblaction sur bayambang pangasinan',2147483647,1),(9,'Carrier','Carrier','poblaction sur bayambang pangasinan',2147483647,1),(10,'admin2','admin2','poblaction sur bayambang pangasinan',2147483647,1),(11,'Carlos','arasa','poblaction sur bayambang pangasinan',2147483647,1),(12,'Typhoon','arasa ','poblaction sur bayambang pangasinan',2147483647,1),(13,'carlos','arasa','test',2147483647,1),(14,'ace','acer','bababab',2147483647,1),(15,'customer','customer','bayambang pangasinan',2147483647,1),(16,'admin1','admin1','bautista pangasinan',2147483647,1),(17,'test','Typhoon','b',2147483647,1),(18,'test','Typhoon','b',2147483647,1);
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

-- Dump completed on 2023-01-13 14:58:14
