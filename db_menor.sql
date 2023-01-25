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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_category`
--

LOCK TABLES `tbl_category` WRITE;
/*!40000 ALTER TABLE `tbl_category` DISABLE KEYS */;
INSERT INTO `tbl_category` VALUES (1,'Quail',0,'2022-09-12 17:00:48',NULL),(2,'Egg',0,'2022-09-12 17:00:48',NULL),(3,'Vitamins',0,'2022-09-12 17:00:48',NULL),(7,'Feeds',0,'2022-09-12 22:30:50',NULL),(8,'test23',0,'2023-01-16 13:33:28',NULL);
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
INSERT INTO `tbl_inventory` VALUES (1,1,2462),(2,2,1445),(3,3,996),(4,4,977),(5,5,330),(6,6,123),(7,7,100),(8,8,100),(9,9,94),(10,10,101),(11,11,100),(12,12,100),(13,13,0),(14,14,499),(15,15,500),(16,16,500);
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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_inventory_history`
--

LOCK TABLES `tbl_inventory_history` WRITE;
/*!40000 ALTER TABLE `tbl_inventory_history` DISABLE KEYS */;
INSERT INTO `tbl_inventory_history` VALUES (6,1,1013,2,2,'2022-06-26 20:23:58'),(7,1,1015,3,2,'2022-06-26 20:24:04'),(8,1,1018,23,2,'2022-06-26 20:24:05'),(9,1,1041,23,2,'2022-06-26 20:34:27'),(10,1,1064,500,2,'2022-06-26 20:43:00'),(11,1,1564,23,7,'2022-06-26 20:47:08'),(12,1,1587,20,7,'2022-06-26 20:47:10'),(13,2,1000,500,2,'2022-06-26 21:26:54'),(14,6,100,23,2,'2022-07-30 17:14:05'),(15,1,1607,3,2,'2022-07-31 23:49:30'),(16,1,1610,3,2,'2022-07-31 23:49:34'),(17,2,1500,1,2,'2022-07-31 23:54:01'),(18,1,1613,-5,2,'2022-08-04 22:49:30'),(19,4,1000,1,2,'2022-08-06 16:12:38'),(20,5,100,230,2,'2022-08-06 16:12:51'),(21,1,1608,50,2,'2022-09-11 15:57:13'),(22,10,100,1,2,'2022-09-11 15:57:22'),(23,1,1658,800,2,'2022-09-11 16:46:22'),(24,1,2458,23,2,'2022-09-11 16:48:18'),(25,1,2479,-2,8,'2022-09-16 22:29:11'),(26,1,2477,2,2,'2022-10-06 17:33:15'),(27,1,2479,1,2,'2022-10-06 17:33:23'),(28,3,1000,-1,8,'2022-10-06 18:01:25'),(29,2,1501,-14,8,'2022-10-06 18:01:29'),(30,2,1487,-14,8,'2022-10-06 18:02:31'),(31,3,999,-1,8,'2022-10-06 18:02:31'),(32,2,1473,-14,8,'2022-10-06 18:03:05'),(33,3,998,-1,8,'2022-10-06 18:03:05'),(34,1,2480,-1,8,'2022-10-06 18:13:23'),(35,1,2479,-1,8,'2022-10-06 18:13:51'),(36,2,1459,-1,8,'2022-10-06 18:13:51'),(37,1,2478,-1,8,'2022-10-06 18:24:25'),(38,15,0,500,2,'2022-10-07 23:21:23'),(39,14,0,500,2,'2022-10-07 23:21:34'),(40,16,0,500,2,'2022-10-07 23:24:33'),(41,1,2477,1,17,'2022-10-20 16:44:03'),(42,2,1458,-1,14,'2022-11-02 14:14:29'),(43,2,1457,-1,8,'2022-11-25 19:36:34'),(44,2,1456,-1,8,'2022-11-25 19:37:02'),(45,1,2478,1,2,'2023-01-16 14:20:42'),(46,2,1455,-1,14,'2023-01-16 14:37:29'),(47,2,1454,-3,8,'2023-01-16 14:37:59'),(48,3,997,-1,8,'2023-01-16 14:37:59'),(49,4,1001,-1,8,'2023-01-16 14:37:59'),(50,2,1451,-4,15,'2023-01-16 15:29:31'),(51,1,2479,-1,15,'2023-01-16 15:30:11'),(52,2,1447,-1,15,'2023-01-16 15:35:46'),(53,1,2478,-1,15,'2023-01-16 15:36:34'),(54,1,2477,-1,15,'2023-01-16 15:45:22'),(55,2,1446,-1,15,'2023-01-16 15:45:22'),(56,1,2476,-1,15,'2023-01-16 15:47:08'),(57,1,2475,-1,15,'2023-01-16 15:59:43'),(58,14,500,-1,15,'2023-01-20 17:15:05'),(59,1,2474,-12,15,'2023-01-20 17:15:39'),(60,4,1000,-23,15,'2023-01-20 17:18:29');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_invoice`
--

LOCK TABLES `tbl_invoice` WRITE;
/*!40000 ALTER TABLE `tbl_invoice` DISABLE KEYS */;
INSERT INTO `tbl_invoice` VALUES (1,'1665157742',14,1,'2022-10-07 23:49:02',2,NULL,NULL,NULL,NULL),(2,'1665242387',14,2,'2022-10-08 23:19:47',2,NULL,NULL,'233','208'),(3,'1666254302',8,1,'2022-10-20 16:25:02',2,NULL,NULL,'50','9'),(4,'1667370786',8,2,'2022-11-02 14:33:06',2,NULL,NULL,'90','65'),(5,'1667370824',8,2,'2022-11-02 14:33:44',2,NULL,NULL,'26','1'),(6,'1672974543',8,1,'2023-01-06 11:09:03',2,NULL,NULL,NULL,NULL),(7,'1673351716',15,1,'2023-01-10 19:55:16',2,NULL,NULL,NULL,NULL),(8,'1673688835',14,1,'2023-01-14 17:33:55',2,NULL,NULL,NULL,NULL),(9,'1673689804',14,1,'2023-01-14 17:50:04',2,NULL,NULL,NULL,NULL),(10,'1673854202',15,1,'2023-01-16 15:30:02',2,NULL,NULL,NULL,NULL),(11,'1673854532',15,1,'2023-01-16 15:35:32',2,NULL,NULL,NULL,NULL),(12,'1673854621',15,1,'2023-01-16 15:37:01',2,NULL,NULL,NULL,NULL),(13,'1673854683',15,1,'2023-01-16 15:38:03',2,NULL,NULL,NULL,NULL),(14,'1673854948',15,1,'2023-01-16 15:42:28',2,NULL,NULL,NULL,NULL),(15,'1673855973',15,1,'2023-01-16 15:59:33',2,NULL,NULL,NULL,NULL),(16,'1674205532',15,1,'2023-01-20 17:05:32',2,NULL,NULL,NULL,NULL),(17,'1674206301',15,1,'2023-01-20 17:18:21',2,NULL,NULL,NULL,NULL),(18,'1674299741',15,1,'2023-01-21 19:15:41',2,NULL,NULL,NULL,NULL),(19,'1674300024',15,1,'2023-01-21 19:20:24',2,NULL,NULL,NULL,NULL),(20,'1674300176',15,1,'2023-01-21 19:22:56',2,NULL,NULL,NULL,NULL),(21,'1674300232',15,1,'2023-01-21 19:23:52',2,NULL,NULL,NULL,NULL),(22,'1674301011',15,1,'2023-01-21 19:36:51',2,NULL,NULL,NULL,NULL),(23,'1674301086',15,1,'2023-01-21 19:38:06',2,NULL,NULL,NULL,NULL),(24,'1674558756',15,1,'2023-01-24 19:12:36',3,NULL,NULL,NULL,NULL),(25,'1674559121',15,1,'2023-01-24 19:18:41',7,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_invoice_status_history`
--

LOCK TABLES `tbl_invoice_status_history` WRITE;
/*!40000 ALTER TABLE `tbl_invoice_status_history` DISABLE KEYS */;
INSERT INTO `tbl_invoice_status_history` VALUES (1,2,3,2,'2022-11-02 14:14:29'),(2,2,3,2,'2022-11-25 19:36:34'),(3,2,3,2,'2022-11-25 19:37:02'),(4,8,6,14,'2023-01-14 17:43:04'),(5,2,3,2,'2023-01-16 14:37:29'),(6,6,3,2,'2023-01-16 14:37:59'),(7,6,3,2,'2023-01-16 14:37:59'),(8,4,3,2,'2023-01-16 14:37:59'),(9,7,3,2,'2023-01-16 15:29:31'),(10,10,3,2,'2023-01-16 15:30:11'),(11,11,3,2,'2023-01-16 15:35:46'),(12,1,3,2,'2023-01-16 15:36:34'),(13,12,3,2,'2023-01-16 15:45:22'),(14,2,3,2,'2023-01-16 15:45:22'),(15,1,3,2,'2023-01-16 15:47:08'),(16,1,3,2,'2023-01-16 15:59:43'),(17,16,3,2,'2023-01-20 17:15:05'),(18,1,3,2,'2023-01-20 17:15:39'),(19,7,3,2,'2023-01-20 17:18:29'),(20,17,3,0,'2023-01-21 19:14:40'),(21,18,3,0,'2023-01-21 19:15:53'),(22,19,3,2,'2023-01-21 19:20:39'),(23,20,3,2,'2023-01-21 19:23:32'),(24,0,3,2,'2023-01-21 19:32:19'),(25,1674300232,3,2,'2023-01-21 19:35:52'),(26,21,3,2,'2023-01-21 19:36:38'),(27,22,3,2,'2023-01-21 19:36:56'),(28,22,3,2,'2023-01-21 19:37:48'),(29,23,3,2,'2023-01-21 19:40:03'),(30,23,2,2,'2023-01-21 19:42:43'),(31,24,3,2,'2023-01-24 19:13:09'),(32,25,3,2,'2023-01-24 19:18:52'),(33,25,3,2,'2023-01-24 19:24:50'),(34,25,3,2,'2023-01-24 19:27:18'),(35,25,3,2,'2023-01-24 19:27:46'),(36,25,3,2,'2023-01-24 19:28:33'),(37,25,3,2,'2023-01-24 19:29:40'),(38,25,3,2,'2023-01-24 19:30:21'),(39,25,3,2,'2023-01-24 19:31:05'),(40,25,3,2,'2023-01-24 19:33:04'),(41,25,3,2,'2023-01-24 19:44:39'),(42,25,3,2,'2023-01-24 19:45:01'),(43,25,3,2,'2023-01-24 19:49:05'),(44,25,7,2,'2023-01-24 19:53:03');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_product`
--

LOCK TABLES `tbl_product` WRITE;
/*!40000 ALTER TABLE `tbl_product` DISABLE KEYS */;
INSERT INTO `tbl_product` VALUES (1,1,'Male quails','Kals','image_20230116070048.jpeg',12.00,'2022-06-11 14:31:01',NULL,0),(2,1,'Female quail','Laying Eggs','female_quail.png',25.00,'2022-06-11 14:31:01',NULL,0),(3,2,'Quail Egg','Egg','quail_egg.jpg',1.15,'2022-06-12 21:41:20',NULL,0),(4,1,'Female quail','8 - 12 Months Kal','Quail8months.png',15.00,'2022-06-20 13:56:04',NULL,0),(5,1,'test','test','default.png',100.00,'2022-06-26 17:58:28',2,1),(6,1,'test','test','default.png',100.00,'2022-06-26 17:58:48',2,1),(7,1,'test','test','default.png',100.00,'2022-06-26 17:59:26',2,1),(8,1,'test','test','default.png',100.00,'2022-06-26 18:01:25',2,1),(9,1,'1232','test','image_20220626124207.jpeg',100.00,'2022-06-26 18:07:13',2,1),(10,1,'test','test','image_20220626121905.jpeg',123.00,'2022-06-26 18:19:05',2,1),(11,1,'123','test','image_20220626122042.jpeg',123.00,'2022-06-26 18:20:43',2,1),(12,1,'test','test','image_20220626122100.jpeg',123.00,'2022-06-26 18:21:00',2,1),(13,1,'123','test','default.png',231.00,'2022-09-11 17:09:10',2,1),(14,3,'Coturnix Quail','Vitamin & Electrolytes','image_20221007174034.jpeg',200.00,'2022-10-07 23:17:40',2,0),(15,7,'Premium Quail Layer','Feeds','image_20221007171919.jpeg',499.00,'2022-10-07 23:19:19',2,1),(16,7,'Premium Quail Layer','Feeds','image_20221007174043.jpeg',499.00,'2022-10-07 23:23:28',2,0),(17,2,'a','a','default.png',100.00,'2023-01-16 14:08:52',NULL,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_status_history`
--

LOCK TABLES `tbl_status_history` WRITE;
/*!40000 ALTER TABLE `tbl_status_history` DISABLE KEYS */;
INSERT INTO `tbl_status_history` VALUES (1,1,1,14,'2022-10-07 23:49:00'),(2,1,2,14,'2022-10-07 23:49:02'),(3,2,1,14,'2022-10-08 23:19:44'),(4,2,2,14,'2022-10-08 23:19:47'),(5,3,1,8,'2022-10-20 16:24:58'),(6,4,1,8,'2022-10-20 16:24:59'),(7,5,1,8,'2022-10-20 16:24:59'),(8,3,2,8,'2022-10-20 16:25:02'),(9,4,2,8,'2022-10-20 16:25:02'),(10,5,2,8,'2022-10-20 16:25:02'),(11,2,3,2,'2022-11-02 14:14:29'),(12,6,1,8,'2022-11-02 14:32:56'),(13,6,2,8,'2022-11-02 14:33:06'),(14,7,1,8,'2022-11-02 14:33:42'),(15,7,2,8,'2022-11-02 14:33:44'),(16,7,3,2,'2022-11-25 19:36:34'),(17,6,3,2,'2022-11-25 19:37:02'),(18,8,1,8,'2022-12-07 19:53:34'),(19,9,1,8,'2022-12-07 19:53:35'),(20,10,1,8,'2022-12-07 19:54:03'),(21,11,1,8,'2023-01-06 11:02:47'),(22,12,1,8,'2023-01-06 11:03:09'),(23,13,1,8,'2023-01-06 11:03:12'),(24,11,2,8,'2023-01-06 11:09:03'),(25,12,2,8,'2023-01-06 11:09:03'),(26,13,2,8,'2023-01-06 11:09:03'),(27,14,1,8,'2023-01-06 11:46:56'),(28,15,1,8,'2023-01-06 11:46:59'),(29,16,1,15,'2023-01-06 12:16:43'),(30,17,1,15,'2023-01-06 12:16:45'),(31,18,1,15,'2023-01-06 12:16:47'),(32,19,1,14,'2023-01-14 17:33:43'),(33,20,1,14,'2023-01-14 17:33:45'),(34,20,5,14,'2023-01-14 17:35:26'),(35,19,5,14,'2023-01-14 17:43:04'),(36,21,1,14,'2023-01-14 17:44:29'),(37,22,1,14,'2023-01-14 17:47:41'),(38,3,6,2,'2023-01-16 14:27:03'),(39,4,6,2,'2023-01-16 14:27:03'),(40,5,6,2,'2023-01-16 14:27:03'),(41,22,3,2,'2023-01-16 14:37:29'),(42,11,3,2,'2023-01-16 14:37:59'),(43,12,3,2,'2023-01-16 14:37:59'),(44,13,3,2,'2023-01-16 14:37:59'),(45,16,3,2,'2023-01-16 15:29:31'),(46,23,1,15,'2023-01-16 15:29:52'),(47,24,1,15,'2023-01-16 15:29:56'),(48,23,3,2,'2023-01-16 15:30:11'),(49,24,6,2,'2023-01-16 15:31:00'),(50,25,1,15,'2023-01-16 15:35:09'),(51,26,1,15,'2023-01-16 15:35:13'),(52,26,3,2,'2023-01-16 15:35:46'),(53,25,3,2,'2023-01-16 15:36:34'),(54,27,1,15,'2023-01-16 15:36:49'),(55,28,1,15,'2023-01-16 15:36:54'),(56,29,1,15,'2023-01-16 15:37:57'),(57,30,1,15,'2023-01-16 15:42:11'),(58,31,1,15,'2023-01-16 15:42:15'),(59,30,2,15,'2023-01-16 15:42:28'),(60,31,2,15,'2023-01-16 15:42:28'),(61,27,3,2,'2023-01-16 15:45:22'),(62,28,3,2,'2023-01-16 15:45:22'),(63,29,3,2,'2023-01-16 15:47:08'),(64,30,6,2,'2023-01-16 15:47:16'),(65,31,6,2,'2023-01-16 15:47:16'),(66,32,1,15,'2023-01-16 15:59:28'),(67,32,2,15,'2023-01-16 15:59:33'),(68,32,3,2,'2023-01-16 15:59:43'),(69,33,1,15,'2023-01-20 17:05:03'),(70,34,1,15,'2023-01-20 17:05:28'),(71,33,2,15,'2023-01-20 17:05:32'),(72,34,2,15,'2023-01-20 17:05:32'),(73,34,3,2,'2023-01-20 17:15:05'),(74,33,3,2,'2023-01-20 17:15:39'),(75,35,1,15,'2023-01-20 17:18:14'),(76,36,1,15,'2023-01-20 17:18:16'),(77,35,2,15,'2023-01-20 17:18:21'),(78,36,2,15,'2023-01-20 17:18:21'),(79,17,3,2,'2023-01-20 17:18:29'),(80,37,1,15,'2023-01-21 19:15:30'),(81,38,1,15,'2023-01-21 19:15:32'),(82,37,2,15,'2023-01-21 19:15:41'),(83,38,2,15,'2023-01-21 19:15:41'),(84,39,1,15,'2023-01-21 19:20:18'),(85,40,1,15,'2023-01-21 19:20:21'),(86,39,2,15,'2023-01-21 19:20:24'),(87,40,2,15,'2023-01-21 19:20:24'),(88,39,3,2,'2023-01-21 19:20:39'),(89,40,3,2,'2023-01-21 19:20:39'),(90,41,1,15,'2023-01-21 19:22:44'),(91,42,1,15,'2023-01-21 19:22:46'),(92,43,1,15,'2023-01-21 19:22:49'),(93,41,2,15,'2023-01-21 19:22:56'),(94,42,2,15,'2023-01-21 19:22:56'),(95,43,2,15,'2023-01-21 19:22:56'),(96,41,3,2,'2023-01-21 19:23:32'),(97,42,3,2,'2023-01-21 19:23:32'),(98,43,3,2,'2023-01-21 19:23:32'),(99,44,1,15,'2023-01-21 19:23:44'),(100,45,1,15,'2023-01-21 19:23:47'),(101,46,1,15,'2023-01-21 19:23:49'),(102,44,2,15,'2023-01-21 19:23:52'),(103,45,2,15,'2023-01-21 19:23:52'),(104,46,2,15,'2023-01-21 19:23:52'),(105,46,3,2,'2023-01-21 19:32:19'),(106,45,3,2,'2023-01-21 19:35:52'),(107,44,3,2,'2023-01-21 19:36:38'),(108,47,1,15,'2023-01-21 19:36:46'),(109,48,1,15,'2023-01-21 19:36:48'),(110,47,2,15,'2023-01-21 19:36:51'),(111,48,2,15,'2023-01-21 19:36:51'),(112,48,3,2,'2023-01-21 19:36:56'),(113,47,3,2,'2023-01-21 19:37:48'),(114,49,1,15,'2023-01-21 19:37:57'),(115,50,1,15,'2023-01-21 19:38:00'),(116,51,1,15,'2023-01-21 19:38:02'),(117,49,2,15,'2023-01-21 19:38:06'),(118,50,2,15,'2023-01-21 19:38:06'),(119,51,2,15,'2023-01-21 19:38:06'),(120,51,3,2,'2023-01-21 19:40:03'),(121,50,3,2,'2023-01-21 19:42:43'),(122,52,1,15,'2023-01-24 19:12:28'),(123,53,1,15,'2023-01-24 19:12:30'),(124,52,2,15,'2023-01-24 19:12:36'),(125,53,2,15,'2023-01-24 19:12:36'),(126,52,3,2,'2023-01-24 19:13:09'),(127,53,3,2,'2023-01-24 19:13:09'),(128,54,1,15,'2023-01-24 19:15:11'),(129,55,1,15,'2023-01-24 19:15:14'),(130,54,2,15,'2023-01-24 19:18:41'),(131,55,2,15,'2023-01-24 19:18:41'),(132,54,6,2,'2023-01-24 19:18:52'),(133,55,6,2,'2023-01-24 19:18:52'),(134,54,6,2,'2023-01-24 19:27:18'),(135,55,6,2,'2023-01-24 19:27:18'),(136,54,6,2,'2023-01-24 19:27:46'),(137,55,6,2,'2023-01-24 19:27:46'),(138,54,6,2,'2023-01-24 19:28:33'),(139,55,6,2,'2023-01-24 19:28:33'),(140,54,6,2,'2023-01-24 19:29:40'),(141,55,6,2,'2023-01-24 19:29:40'),(142,54,6,2,'2023-01-24 19:30:21'),(143,55,6,2,'2023-01-24 19:30:21'),(144,54,6,2,'2023-01-24 19:31:05'),(145,55,6,2,'2023-01-24 19:31:05'),(146,54,6,2,'2023-01-24 19:33:04'),(147,55,6,2,'2023-01-24 19:33:04'),(148,54,6,2,'2023-01-24 19:44:39'),(149,55,6,2,'2023-01-24 19:44:39'),(150,54,6,2,'2023-01-24 19:45:01'),(151,55,6,2,'2023-01-24 19:45:01'),(152,54,6,2,'2023-01-24 19:49:05'),(153,55,6,2,'2023-01-24 19:49:05'),(154,54,6,2,'2023-01-24 19:53:03'),(155,55,6,2,'2023-01-24 19:53:03');
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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_transactions`
--

LOCK TABLES `tbl_transactions` WRITE;
/*!40000 ALTER TABLE `tbl_transactions` DISABLE KEYS */;
INSERT INTO `tbl_transactions` VALUES (1,1,180.00,12,1,14,NULL,2,'2022-10-07 23:48:59',0,'2022-10-07 23:48:59'),(2,2,25.00,1,2,14,2,3,'2022-10-08 23:19:44',0,'2022-11-02 07:14:29'),(3,3,15.00,1,1,8,2,6,'2022-10-20 16:24:58',0,'2023-01-16 07:27:03'),(4,3,25.00,1,2,8,2,6,'2022-10-20 16:24:59',0,'2023-01-16 07:27:03'),(5,3,1.15,1,3,8,2,6,'2022-10-20 16:24:59',0,'2023-01-16 07:27:03'),(6,4,25.00,1,2,8,2,3,'2022-11-02 14:32:56',0,'2022-11-25 12:37:02'),(7,5,25.00,1,2,8,2,3,'2022-11-02 14:33:42',0,'2022-11-25 12:36:34'),(8,NULL,30.00,2,1,8,NULL,1,'2022-12-07 19:53:34',1,'2022-12-07 12:54:04'),(9,NULL,75.00,3,2,8,NULL,1,'2022-12-07 19:53:35',1,'2022-12-07 12:54:06'),(10,NULL,30.00,2,4,8,NULL,1,'2022-12-07 19:54:03',1,'2022-12-07 12:54:05'),(11,6,75.00,3,2,8,2,3,'2023-01-06 11:02:47',0,'2023-01-16 07:37:59'),(12,6,1.00,1,3,8,2,3,'2023-01-06 11:03:09',0,'2023-01-16 07:37:59'),(13,6,15.00,1,4,8,2,3,'2023-01-06 11:03:12',0,'2023-01-16 07:37:59'),(14,NULL,300.00,12,2,8,NULL,1,'2023-01-06 11:46:56',0,'2023-01-06 11:46:56'),(15,NULL,3.00,3,3,8,NULL,1,'2023-01-06 11:46:59',1,'2023-01-06 11:46:59'),(16,7,100.00,4,2,15,2,3,'2023-01-06 12:16:43',0,'2023-01-16 08:29:31'),(17,7,345.00,23,4,15,2,3,'2023-01-06 12:16:45',0,'2023-01-20 10:18:29'),(18,7,15.00,1,1,15,NULL,2,'2023-01-06 12:16:47',0,'2023-01-06 12:16:47'),(19,8,15.00,1,1,14,NULL,5,'2023-01-14 17:33:43',0,'2023-01-14 10:43:04'),(20,8,25.00,1,2,14,NULL,5,'2023-01-14 17:33:45',0,'2023-01-14 10:35:26'),(21,NULL,15.00,1,1,14,NULL,1,'2023-01-14 17:44:29',1,'2023-01-14 17:44:29'),(22,9,25.00,1,2,14,2,3,'2023-01-14 17:47:41',0,'2023-01-16 07:37:29'),(23,10,12.00,1,1,15,2,3,'2023-01-16 15:29:52',0,'2023-01-16 08:30:11'),(24,10,25.00,1,2,15,2,6,'2023-01-16 15:29:56',0,'2023-01-16 08:31:00'),(25,11,12.00,1,1,15,2,3,'2023-01-16 15:35:09',0,'2023-01-16 08:36:34'),(26,11,25.00,1,2,15,2,3,'2023-01-16 15:35:13',0,'2023-01-16 08:35:45'),(27,12,12.00,1,1,15,2,3,'2023-01-16 15:36:49',0,'2023-01-16 08:45:22'),(28,12,25.00,1,2,15,2,3,'2023-01-16 15:36:54',0,'2023-01-16 08:45:22'),(29,13,12.00,1,1,15,2,3,'2023-01-16 15:37:57',0,'2023-01-16 08:47:08'),(30,14,1.00,1,3,15,2,6,'2023-01-16 15:42:11',0,'2023-01-16 08:47:16'),(31,14,15.00,1,4,15,2,6,'2023-01-16 15:42:15',0,'2023-01-16 08:47:16'),(32,15,12.00,1,1,15,2,3,'2023-01-16 15:59:28',0,'2023-01-16 08:59:43'),(33,17,144.00,12,1,15,2,3,'2023-01-20 17:05:03',0,'2023-01-20 10:15:39'),(34,17,200.00,1,14,15,2,3,'2023-01-20 17:05:28',0,'2023-01-20 10:15:05'),(35,17,25.00,1,2,15,NULL,2,'2023-01-20 17:18:14',0,'2023-01-20 17:18:14'),(36,17,15.00,1,4,15,NULL,2,'2023-01-20 17:18:16',0,'2023-01-20 17:18:16'),(37,18,12.00,1,1,15,NULL,2,'2023-01-21 19:15:30',0,'2023-01-21 19:15:30'),(38,18,25.00,1,2,15,NULL,2,'2023-01-21 19:15:32',0,'2023-01-21 19:15:32'),(39,19,12.00,1,1,15,NULL,3,'2023-01-21 19:20:18',0,'2023-01-21 19:20:18'),(40,19,25.00,1,2,15,NULL,3,'2023-01-21 19:20:21',0,'2023-01-21 19:20:21'),(41,20,12.00,1,1,15,2,3,'2023-01-21 19:22:44',0,'2023-01-21 19:22:44'),(42,20,25.00,1,2,15,2,3,'2023-01-21 19:22:46',0,'2023-01-21 19:22:46'),(43,20,1.00,1,3,15,2,3,'2023-01-21 19:22:49',0,'2023-01-21 19:22:49'),(44,21,12.00,1,1,15,2,3,'2023-01-21 19:23:44',0,'2023-01-21 19:23:44'),(45,21,25.00,1,2,15,2,3,'2023-01-21 19:23:47',0,'2023-01-21 19:23:47'),(46,21,1.00,1,3,15,2,3,'2023-01-21 19:23:49',0,'2023-01-21 19:23:49'),(47,22,12.00,1,1,15,2,3,'2023-01-21 19:36:46',0,'2023-01-21 19:36:46'),(48,22,25.00,1,2,15,2,3,'2023-01-21 19:36:48',0,'2023-01-21 19:36:48'),(49,23,12.00,1,1,15,NULL,2,'2023-01-21 19:37:57',0,'2023-01-21 19:37:57'),(50,23,25.00,1,2,15,2,3,'2023-01-21 19:38:00',0,'2023-01-21 19:38:00'),(51,23,15.00,1,4,15,2,3,'2023-01-21 19:38:02',0,'2023-01-21 19:38:02'),(52,24,12.00,1,1,15,2,3,'2023-01-24 19:12:28',0,'2023-01-24 19:12:28'),(53,24,25.00,1,2,15,2,3,'2023-01-24 19:12:30',0,'2023-01-24 19:12:30'),(54,25,12.00,1,1,15,2,6,'2023-01-24 19:15:11',0,'2023-01-24 19:15:11'),(55,25,1.00,1,3,15,2,6,'2023-01-24 19:15:14',0,'2023-01-24 19:15:14');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_users`
--

LOCK TABLES `tbl_users` WRITE;
/*!40000 ALTER TABLE `tbl_users` DISABLE KEYS */;
INSERT INTO `tbl_users` VALUES (2,'admin','$2y$10$oAudgvpauxhyTxyhDOvo7.Geu/ddVWPU/TIq690SwRXOySZa81Iry','cjarasa@gmail.com',1,'2022-06-12 02:42:14',0),(7,'Salesclerk','$2y$10$Y3ksPARb0uYJFuetdyGuaeRa.jOpIR.8KAxNlVvij4ZQNaZ1KmVm6','cashier@gmail.com',2,'2022-06-12 10:10:09',0),(8,'customer_new','$2y$10$oAudgvpauxhyTxyhDOvo7.Geu/ddVWPU/TIq690SwRXOySZa81Iry','customer@gmail.com',3,'2022-06-12 10:23:27',0),(9,'carrier','$2y$10$Y3ksPARb0uYJFuetdyGuaeRa.jOpIR.8KAxNlVvij4ZQNaZ1KmVm6','carrier@gmail.com',4,'2022-06-15 22:14:36',0),(10,'admin2','$2y$10$/wkSAVsPPi.ooWYWZodyoeio4Xs9gPjEZCm4MMdG.LDlRGAEOxN82','admin2@gmail.com',1,'2022-06-18 19:38:27',1),(11,'customer2','$2y$10$oAudgvpauxhyTxyhDOvo7.Geu/ddVWPU/TIq690SwRXOySZa81Iry','customer2@gmail.com',3,'2022-06-20 14:36:28',1),(12,'arasa1234','$2y$10$sEYi97dPYqYy0IOAij8vQ.wfZS0y5/8kI6jR0pLZjSqPnp6wZW/.G','testlords@gmail.com',1,'2022-08-06 16:11:57',1),(13,'cjarasa@gmail.com','$2y$10$bi1p.UAHwe3BLFmsvu3q2eHBPRH7nwtYaCyFlIXpg2J2Dl68weOwK','cjarasa@gmail.com',3,'2022-09-12 16:30:13',1),(14,'ace','$2y$10$oAudgvpauxhyTxyhDOvo7.Geu/ddVWPU/TIq690SwRXOySZa81Iry','ace@gmail.com',3,'2022-10-07 22:16:22',0),(15,'customer','$2y$10$oAudgvpauxhyTxyhDOvo7.Geu/ddVWPU/TIq690SwRXOySZa81Iry','customer@gmail.com',3,'2022-10-07 23:35:20',1),(16,'admin1','$2y$10$cIv49/hzXeEXmMoHp4iP.ez.TBSmI9I7MYO5znWWiiDtA8J9s5mTe','admin1@gmail.com',5,'2022-10-12 17:18:49',1),(17,'test','$2y$10$3TxN8Pd4DQ6x/9QU4oLd0u4NoQD7Qqtvr5ffMmCptf.IMHj7x8aLS','jimenez.carlo.llabor@gmail.com',5,'2022-10-20 16:31:15',0),(18,'test','$2y$10$qC1LSxIr.gmtBqi9J8uNiunPcfpaAkv0QIeDPKz5G9bPsSHpd7fk6',NULL,3,'2022-11-16 17:02:06',0),(19,'user3','$2y$10$mptz5FcZ73m.fcsBE.Iu7e55PNBej456qMPdHSR8FOjx0Uw1Wq5BW',NULL,3,'2023-01-14 14:14:38',0),(20,'test232232','$2y$10$Prop1MzEQnBesQruFUG8BuYzMNwHfweDH43eDNPw3wXquuKgSsKLS',NULL,3,'2023-01-20 16:54:57',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_users_info`
--

LOCK TABLES `tbl_users_info` WRITE;
/*!40000 ALTER TABLE `tbl_users_info` DISABLE KEYS */;
INSERT INTO `tbl_users_info` VALUES (2,'Carlos','arasa','poblaction sur bayambang pangasinan2',2147483647,1,NULL,NULL,NULL),(7,'Sales Clerk','Cashier','poblaction sur bayambang pangasinan',2147483647,1,NULL,NULL,NULL),(8,'customer 123','customer 123','poblaction sur bayambang pangasinan',2147483647,1,NULL,NULL,NULL),(9,'Carrier','Carrier','poblaction sur bayambang pangasinan',2147483647,1,NULL,NULL,NULL),(10,'admin2','admin2','poblaction sur bayambang pangasinan',2147483647,1,NULL,NULL,NULL),(11,'Carlos','arasa','poblaction sur bayambang pangasinan',2147483647,1,NULL,NULL,NULL),(12,'Typhoon','arasa ','poblaction sur bayambang pangasinan',2147483647,1,NULL,NULL,NULL),(13,'carlos','arasa','test',2147483647,1,NULL,NULL,NULL),(14,'ace','acer','bababab',2147483647,2,'province','city','barangay'),(15,'customer','customer','bayambang pangasinan',2147483647,1,NULL,NULL,NULL),(16,'admin1','admin1','bautista pangasinan',2147483647,1,NULL,NULL,NULL),(17,'test','Typhoon','b',2147483647,1,NULL,NULL,NULL),(18,'test','Typhoon','b',2147483647,1,NULL,NULL,NULL),(19,'customer 3','customer 3',NULL,2147483647,1,'pangasinan','bayambang','test'),(20,'customer 3','customer 3',NULL,2147483647,1,'pangasinan','AGNO','test');
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

-- Dump completed on 2023-01-25 13:41:38
