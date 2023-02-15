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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_inventory`
--

LOCK TABLES `tbl_inventory` WRITE;
/*!40000 ALTER TABLE `tbl_inventory` DISABLE KEYS */;
INSERT INTO `tbl_inventory` VALUES (1,1,0),(2,2,997),(3,3,999),(4,4,1000),(5,5,1000),(6,6,1000),(7,7,1000),(8,8,1000),(9,9,1000),(10,10,1000),(11,11,1000),(12,12,1000),(13,13,1000),(14,14,1000),(15,15,1000),(16,16,1000),(17,18,0),(18,19,0),(19,23,0),(20,24,0),(21,25,3),(22,26,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_inventory_history`
--

LOCK TABLES `tbl_inventory_history` WRITE;
/*!40000 ALTER TABLE `tbl_inventory_history` DISABLE KEYS */;
INSERT INTO `tbl_inventory_history` VALUES (1,1,0,1000,7,'2023-01-26 19:17:56'),(2,2,0,1000,7,'2023-01-26 19:18:02'),(3,3,0,1000,7,'2023-01-26 19:18:07'),(4,4,0,1000,7,'2023-01-26 19:18:12'),(5,14,0,1000,7,'2023-01-26 19:18:16'),(6,16,0,1000,7,'2023-01-26 19:18:21'),(8,1,1000,-1,2,'2023-02-03 15:37:01'),(9,2,1000,-3,2,'2023-02-03 15:37:01'),(10,1,1000,-1,2,'2023-02-03 15:39:01'),(11,2,1000,-1,2,'2023-02-03 15:39:01'),(12,1,0,1,2,'2023-02-03 16:25:56'),(13,1,1,-1,2,'2023-02-03 16:26:19'),(14,19,0,200,2,'2023-02-06 10:59:23'),(15,19,0,50,2,'2023-02-06 10:59:44'),(16,25,0,2,2,'2023-02-15 20:32:30'),(17,25,0,1,2,'2023-02-15 20:39:41'),(18,25,0,2,2,'2023-02-15 20:41:05'),(19,25,0,2,2,'2023-02-15 20:41:19'),(20,25,0,2,2,'2023-02-15 20:43:27'),(21,25,2,2,2,'2023-02-15 20:43:44'),(22,24,0,5,2,'2023-02-15 20:44:07'),(23,2,999,-1,2,'2023-02-15 20:49:52'),(24,24,5,-5,2,'2023-02-15 20:49:52'),(25,25,4,-1,2,'2023-02-15 21:09:58'),(26,26,0,1000,2,'2023-02-15 21:16:13'),(27,26,1000,-1000,2,'2023-02-15 21:17:05'),(28,3,1000,-1,2,'2023-02-15 21:17:22'),(29,2,998,-1,2,'2023-02-15 21:47:59');
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_invoice`
--

LOCK TABLES `tbl_invoice` WRITE;
/*!40000 ALTER TABLE `tbl_invoice` DISABLE KEYS */;
INSERT INTO `tbl_invoice` VALUES (1,'1675150369',14,1,'2023-01-31 15:32:49',3,NULL,NULL,NULL,NULL),(2,'1675407986',14,1,'2023-02-03 15:06:26',3,NULL,NULL,NULL,NULL),(3,'1675409462',14,1,'2023-02-03 15:31:02',3,NULL,NULL,NULL,NULL),(4,'1675409934',14,1,'2023-02-03 15:38:54',3,NULL,NULL,NULL,NULL),(5,'1675412770',14,1,'2023-02-03 16:26:10',3,NULL,NULL,NULL,NULL),(6,'1675599768',14,2,'2023-02-05 20:22:48',3,NULL,NULL,NULL,NULL),(7,'1675600144',14,2,'2023-02-05 20:29:04',3,NULL,NULL,NULL,NULL),(8,'1676465372',14,2,'2023-02-15 20:49:32',3,NULL,NULL,NULL,NULL),(9,'1676465473',14,2,'2023-02-15 20:51:13',1,NULL,NULL,NULL,NULL),(10,'1676466562',14,2,'2023-02-15 21:09:22',3,NULL,NULL,NULL,NULL),(11,'1676467010',14,2,'2023-02-15 21:16:50',3,NULL,NULL,NULL,NULL),(12,'1676468799',2,1,'2023-02-15 21:46:39',1,NULL,NULL,NULL,NULL),(13,'1676468840',2,2,'2023-02-15 21:47:20',3,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_invoice_status_history`
--

LOCK TABLES `tbl_invoice_status_history` WRITE;
/*!40000 ALTER TABLE `tbl_invoice_status_history` DISABLE KEYS */;
INSERT INTO `tbl_invoice_status_history` VALUES (1,1,2,2,'2023-01-31 15:44:59'),(2,2,3,2,'2023-02-03 15:06:45'),(3,1,3,2,'2023-02-03 15:06:48'),(4,3,3,2,'2023-02-03 15:37:01'),(5,4,3,2,'2023-02-03 15:39:01'),(6,5,3,2,'2023-02-03 16:26:19'),(7,6,3,2,'2023-02-05 20:26:29'),(8,7,2,2,'2023-02-05 20:29:17'),(9,7,3,2,'2023-02-05 20:29:22'),(10,8,3,2,'2023-02-15 20:49:52'),(11,10,2,2,'2023-02-15 21:09:58'),(12,11,3,2,'2023-02-15 21:17:05'),(13,10,3,2,'2023-02-15 21:17:22'),(14,13,3,2,'2023-02-15 21:47:59');
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_product`
--

LOCK TABLES `tbl_product` WRITE;
/*!40000 ALTER TABLE `tbl_product` DISABLE KEYS */;
INSERT INTO `tbl_product` VALUES (1,1,'Male quails','Kals','image_20230126120519.jpeg',12.00,'2022-06-11 14:31:01',NULL,0,NULL),(2,1,'Female quail','Laying Eggs','female_quail.png',25.00,'2022-06-11 14:31:01',NULL,0,NULL),(3,2,'Quail Egg','Egg','quail_egg.jpg',1.15,'2022-06-12 21:41:20',NULL,0,NULL),(4,1,'Female quail','8 - 12 Months Kal','Quail8months.png',15.00,'2022-06-20 13:56:04',NULL,0,NULL),(5,1,'test','test','default.png',100.00,'2022-06-26 17:58:28',2,1,NULL),(6,1,'test','test','default.png',100.00,'2022-06-26 17:58:48',2,1,NULL),(7,1,'test','test','default.png',100.00,'2022-06-26 17:59:26',2,1,NULL),(8,1,'test','test','default.png',100.00,'2022-06-26 18:01:25',2,1,NULL),(9,1,'1232','test','image_20220626124207.jpeg',100.00,'2022-06-26 18:07:13',2,1,NULL),(10,1,'test','test','image_20220626121905.jpeg',123.00,'2022-06-26 18:19:05',2,1,NULL),(11,1,'123','test','image_20220626122042.jpeg',123.00,'2022-06-26 18:20:43',2,1,NULL),(12,1,'test','test','image_20220626122100.jpeg',123.00,'2022-06-26 18:21:00',2,1,NULL),(13,1,'123','test','default.png',231.00,'2022-09-11 17:09:10',2,1,NULL),(14,3,'Coturnix Quail','Vitamin & Electrolytes','image_20230126120636.jpeg',200.00,'2022-10-07 23:17:40',2,0,NULL),(16,7,'Premium Quail Layer','Feeds','image_20230131092314.jpeg',999.99,'2022-10-07 23:23:28',2,0,NULL),(17,2,'a','a','default.png',100.00,'2023-01-16 14:08:52',NULL,1,NULL),(18,2,'pepsi','','default.png',59.00,'2023-02-06 10:58:13',NULL,1,NULL),(19,2,'red bull','','default.png',299.00,'2023-02-06 10:58:25',NULL,1,NULL),(20,2,'testestestset','test','default.png',999.99,'2023-02-15 20:25:53',NULL,1,'0000-00-00'),(21,2,'testsetest','test','default.png',999.99,'2023-02-15 20:26:30',NULL,1,'2023-04-01'),(22,2,'Quail Egg','test','default.png',999.99,'2023-02-15 20:28:30',NULL,1,'2023-01-01'),(23,1,'testsetsete','test','default.png',999.99,'2023-02-15 20:30:04',NULL,1,'2023-01-01'),(24,2,'testsetsete','test','default.png',999.99,'2023-02-15 20:31:46',NULL,1,'2023-01-01'),(25,2,'testsetsete','test','default.png',23.00,'2023-02-15 20:32:16',NULL,1,'2023-01-04'),(26,9,'cage','qweqwewqwq','image_20230215141547.jpeg',150.00,'2023-02-15 21:15:47',NULL,0,'2024-02-15');
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
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_status_history`
--

LOCK TABLES `tbl_status_history` WRITE;
/*!40000 ALTER TABLE `tbl_status_history` DISABLE KEYS */;
INSERT INTO `tbl_status_history` VALUES (1,1,1,14,'2022-10-07 23:49:00'),(2,1,2,14,'2022-10-07 23:49:02'),(3,2,1,14,'2022-10-08 23:19:44'),(4,2,2,14,'2022-10-08 23:19:47'),(5,3,1,8,'2022-10-20 16:24:58'),(6,4,1,8,'2022-10-20 16:24:59'),(7,5,1,8,'2022-10-20 16:24:59'),(8,3,2,8,'2022-10-20 16:25:02'),(9,4,2,8,'2022-10-20 16:25:02'),(10,5,2,8,'2022-10-20 16:25:02'),(11,2,3,2,'2022-11-02 14:14:29'),(12,6,1,8,'2022-11-02 14:32:56'),(13,6,2,8,'2022-11-02 14:33:06'),(14,7,1,8,'2022-11-02 14:33:42'),(15,7,2,8,'2022-11-02 14:33:44'),(16,7,3,2,'2022-11-25 19:36:34'),(17,6,3,2,'2022-11-25 19:37:02'),(18,8,1,8,'2022-12-07 19:53:34'),(19,9,1,8,'2022-12-07 19:53:35'),(20,10,1,8,'2022-12-07 19:54:03'),(21,11,1,8,'2023-01-06 11:02:47'),(22,12,1,8,'2023-01-06 11:03:09'),(23,13,1,8,'2023-01-06 11:03:12'),(24,11,2,8,'2023-01-06 11:09:03'),(25,12,2,8,'2023-01-06 11:09:03'),(26,13,2,8,'2023-01-06 11:09:03'),(27,14,1,8,'2023-01-06 11:46:56'),(28,15,1,8,'2023-01-06 11:46:59'),(29,16,1,15,'2023-01-06 12:16:43'),(30,17,1,15,'2023-01-06 12:16:45'),(31,18,1,15,'2023-01-06 12:16:47'),(32,19,1,14,'2023-01-14 17:33:43'),(33,20,1,14,'2023-01-14 17:33:45'),(34,20,5,14,'2023-01-14 17:35:26'),(35,19,5,14,'2023-01-14 17:43:04'),(36,21,1,14,'2023-01-14 17:44:29'),(37,22,1,14,'2023-01-14 17:47:41'),(38,3,6,2,'2023-01-16 14:27:03'),(39,4,6,2,'2023-01-16 14:27:03'),(40,5,6,2,'2023-01-16 14:27:03'),(41,22,3,2,'2023-01-16 14:37:29'),(42,11,3,2,'2023-01-16 14:37:59'),(43,12,3,2,'2023-01-16 14:37:59'),(44,13,3,2,'2023-01-16 14:37:59'),(45,16,3,2,'2023-01-16 15:29:31'),(46,23,1,15,'2023-01-16 15:29:52'),(47,24,1,15,'2023-01-16 15:29:56'),(48,23,3,2,'2023-01-16 15:30:11'),(49,24,6,2,'2023-01-16 15:31:00'),(50,25,1,15,'2023-01-16 15:35:09'),(51,26,1,15,'2023-01-16 15:35:13'),(52,26,3,2,'2023-01-16 15:35:46'),(53,25,3,2,'2023-01-16 15:36:34'),(54,27,1,15,'2023-01-16 15:36:49'),(55,28,1,15,'2023-01-16 15:36:54'),(56,29,1,15,'2023-01-16 15:37:57'),(57,30,1,15,'2023-01-16 15:42:11'),(58,31,1,15,'2023-01-16 15:42:15'),(59,30,2,15,'2023-01-16 15:42:28'),(60,31,2,15,'2023-01-16 15:42:28'),(61,27,3,2,'2023-01-16 15:45:22'),(62,28,3,2,'2023-01-16 15:45:22'),(63,29,3,2,'2023-01-16 15:47:08'),(64,30,6,2,'2023-01-16 15:47:16'),(65,31,6,2,'2023-01-16 15:47:16'),(66,32,1,15,'2023-01-16 15:59:28'),(67,32,2,15,'2023-01-16 15:59:33'),(68,32,3,2,'2023-01-16 15:59:43'),(69,33,1,15,'2023-01-20 17:05:03'),(70,34,1,15,'2023-01-20 17:05:28'),(71,33,2,15,'2023-01-20 17:05:32'),(72,34,2,15,'2023-01-20 17:05:32'),(73,34,3,2,'2023-01-20 17:15:05'),(74,33,3,2,'2023-01-20 17:15:39'),(75,35,1,15,'2023-01-20 17:18:14'),(76,36,1,15,'2023-01-20 17:18:16'),(77,35,2,15,'2023-01-20 17:18:21'),(78,36,2,15,'2023-01-20 17:18:21'),(79,17,3,2,'2023-01-20 17:18:29'),(80,37,1,15,'2023-01-21 19:15:30'),(81,38,1,15,'2023-01-21 19:15:32'),(82,37,2,15,'2023-01-21 19:15:41'),(83,38,2,15,'2023-01-21 19:15:41'),(84,39,1,15,'2023-01-21 19:20:18'),(85,40,1,15,'2023-01-21 19:20:21'),(86,39,2,15,'2023-01-21 19:20:24'),(87,40,2,15,'2023-01-21 19:20:24'),(88,39,3,2,'2023-01-21 19:20:39'),(89,40,3,2,'2023-01-21 19:20:39'),(90,41,1,15,'2023-01-21 19:22:44'),(91,42,1,15,'2023-01-21 19:22:46'),(92,43,1,15,'2023-01-21 19:22:49'),(93,41,2,15,'2023-01-21 19:22:56'),(94,42,2,15,'2023-01-21 19:22:56'),(95,43,2,15,'2023-01-21 19:22:56'),(96,41,3,2,'2023-01-21 19:23:32'),(97,42,3,2,'2023-01-21 19:23:32'),(98,43,3,2,'2023-01-21 19:23:32'),(99,44,1,15,'2023-01-21 19:23:44'),(100,45,1,15,'2023-01-21 19:23:47'),(101,46,1,15,'2023-01-21 19:23:49'),(102,44,2,15,'2023-01-21 19:23:52'),(103,45,2,15,'2023-01-21 19:23:52'),(104,46,2,15,'2023-01-21 19:23:52'),(105,46,3,2,'2023-01-21 19:32:19'),(106,45,3,2,'2023-01-21 19:35:52'),(107,44,3,2,'2023-01-21 19:36:38'),(108,47,1,15,'2023-01-21 19:36:46'),(109,48,1,15,'2023-01-21 19:36:48'),(110,47,2,15,'2023-01-21 19:36:51'),(111,48,2,15,'2023-01-21 19:36:51'),(112,48,3,2,'2023-01-21 19:36:56'),(113,47,3,2,'2023-01-21 19:37:48'),(114,49,1,15,'2023-01-21 19:37:57'),(115,50,1,15,'2023-01-21 19:38:00'),(116,51,1,15,'2023-01-21 19:38:02'),(117,49,2,15,'2023-01-21 19:38:06'),(118,50,2,15,'2023-01-21 19:38:06'),(119,51,2,15,'2023-01-21 19:38:06'),(120,51,3,2,'2023-01-21 19:40:03'),(121,50,3,2,'2023-01-21 19:42:43'),(122,52,1,15,'2023-01-24 19:12:28'),(123,53,1,15,'2023-01-24 19:12:30'),(124,52,2,15,'2023-01-24 19:12:36'),(125,53,2,15,'2023-01-24 19:12:36'),(126,52,3,2,'2023-01-24 19:13:09'),(127,53,3,2,'2023-01-24 19:13:09'),(128,54,1,15,'2023-01-24 19:15:11'),(129,55,1,15,'2023-01-24 19:15:14'),(130,54,2,15,'2023-01-24 19:18:41'),(131,55,2,15,'2023-01-24 19:18:41'),(132,54,6,2,'2023-01-24 19:18:52'),(133,55,6,2,'2023-01-24 19:18:52'),(134,54,6,2,'2023-01-24 19:27:18'),(135,55,6,2,'2023-01-24 19:27:18'),(136,54,6,2,'2023-01-24 19:27:46'),(137,55,6,2,'2023-01-24 19:27:46'),(138,54,6,2,'2023-01-24 19:28:33'),(139,55,6,2,'2023-01-24 19:28:33'),(140,54,6,2,'2023-01-24 19:29:40'),(141,55,6,2,'2023-01-24 19:29:40'),(142,54,6,2,'2023-01-24 19:30:21'),(143,55,6,2,'2023-01-24 19:30:21'),(144,54,6,2,'2023-01-24 19:31:05'),(145,55,6,2,'2023-01-24 19:31:05'),(146,54,6,2,'2023-01-24 19:33:04'),(147,55,6,2,'2023-01-24 19:33:04'),(148,54,6,2,'2023-01-24 19:44:39'),(149,55,6,2,'2023-01-24 19:44:39'),(150,54,6,2,'2023-01-24 19:45:01'),(151,55,6,2,'2023-01-24 19:45:01'),(152,54,6,2,'2023-01-24 19:49:05'),(153,55,6,2,'2023-01-24 19:49:05'),(154,54,6,2,'2023-01-24 19:53:03'),(155,55,6,2,'2023-01-24 19:53:03'),(156,56,1,15,'2023-01-25 19:22:25'),(157,57,1,15,'2023-01-25 19:22:27'),(158,56,2,15,'2023-01-25 19:22:31'),(159,57,2,15,'2023-01-25 19:22:31'),(160,56,6,2,'2023-01-25 19:22:56'),(161,57,6,2,'2023-01-25 19:22:56'),(162,49,3,2,'2023-01-26 18:53:10'),(163,58,1,15,'2023-01-26 18:55:15'),(164,59,1,15,'2023-01-26 18:55:18'),(165,58,2,15,'2023-01-26 18:55:21'),(166,59,2,15,'2023-01-26 18:55:21'),(167,58,3,2,'2023-01-26 18:55:29'),(168,59,3,2,'2023-01-26 18:55:29'),(169,1,1,14,'2023-01-31 15:32:44'),(170,2,1,14,'2023-01-31 15:32:46'),(171,1,2,14,'2023-01-31 15:32:49'),(172,2,2,14,'2023-01-31 15:32:49'),(173,2,3,2,'2023-01-31 15:44:59'),(174,3,1,14,'2023-02-03 15:06:22'),(175,3,2,14,'2023-02-03 15:06:26'),(176,3,3,2,'2023-02-03 15:06:45'),(177,1,3,2,'2023-02-03 15:06:48'),(178,4,1,14,'2023-02-03 15:30:53'),(179,5,1,14,'2023-02-03 15:30:58'),(180,4,2,14,'2023-02-03 15:31:02'),(181,5,2,14,'2023-02-03 15:31:02'),(182,4,3,2,'2023-02-03 15:37:01'),(183,5,3,2,'2023-02-03 15:37:01'),(184,6,1,14,'2023-02-03 15:38:43'),(185,7,1,14,'2023-02-03 15:38:45'),(186,6,2,14,'2023-02-03 15:38:54'),(187,7,2,14,'2023-02-03 15:38:54'),(188,6,3,2,'2023-02-03 15:39:01'),(189,7,3,2,'2023-02-03 15:39:01'),(190,8,1,14,'2023-02-03 16:26:07'),(191,8,2,14,'2023-02-03 16:26:10'),(192,8,3,2,'2023-02-03 16:26:19'),(193,9,1,14,'2023-02-05 20:22:45'),(194,9,2,14,'2023-02-05 20:22:48'),(195,10,1,14,'2023-02-05 20:23:16'),(196,9,3,2,'2023-02-05 20:26:29'),(197,11,1,14,'2023-02-05 20:28:57'),(198,12,1,14,'2023-02-05 20:28:59'),(199,11,2,14,'2023-02-05 20:29:04'),(200,12,2,14,'2023-02-05 20:29:04'),(201,12,3,2,'2023-02-05 20:29:17'),(202,11,6,2,'2023-02-05 20:29:22'),(203,13,1,14,'2023-02-05 20:44:06'),(204,14,1,14,'2023-02-15 20:47:32'),(205,13,2,14,'2023-02-15 20:49:32'),(206,14,2,14,'2023-02-15 20:49:32'),(207,13,3,2,'2023-02-15 20:49:52'),(208,14,3,2,'2023-02-15 20:49:52'),(209,15,1,14,'2023-02-15 20:51:07'),(210,16,1,14,'2023-02-15 20:51:09'),(211,15,2,14,'2023-02-15 20:51:13'),(212,16,2,14,'2023-02-15 20:51:13'),(213,17,1,14,'2023-02-15 21:09:15'),(214,18,1,14,'2023-02-15 21:09:17'),(215,17,2,14,'2023-02-15 21:09:22'),(216,18,2,14,'2023-02-15 21:09:22'),(217,18,3,2,'2023-02-15 21:09:58'),(218,19,1,14,'2023-02-15 21:16:45'),(219,19,2,14,'2023-02-15 21:16:50'),(220,19,3,2,'2023-02-15 21:17:05'),(221,17,3,2,'2023-02-15 21:17:22'),(222,20,1,2,'2023-02-15 21:45:51'),(223,20,2,2,'2023-02-15 21:46:39'),(224,21,1,2,'2023-02-15 21:47:15'),(225,21,2,2,'2023-02-15 21:47:20'),(226,21,3,2,'2023-02-15 21:47:59'),(227,22,1,2,'2023-02-15 21:50:30');
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_transactions`
--

LOCK TABLES `tbl_transactions` WRITE;
/*!40000 ALTER TABLE `tbl_transactions` DISABLE KEYS */;
INSERT INTO `tbl_transactions` VALUES (1,1,12.00,1,1,14,2,3,'2023-01-31 15:32:44',0,'2023-01-31 15:32:44'),(2,1,25.00,1,2,14,2,3,'2023-01-31 15:32:46',0,'2023-01-31 15:32:46'),(3,2,999.00,1,16,14,2,3,'2023-02-03 15:06:22',0,'2023-02-03 15:06:22'),(4,3,12.00,1,1,14,2,3,'2023-02-03 15:30:53',0,'2023-02-03 15:30:53'),(5,3,75.00,3,2,14,2,3,'2023-02-03 15:30:58',0,'2023-02-03 15:30:58'),(6,4,12.00,1,1,14,2,3,'2023-02-03 15:38:43',0,'2023-02-03 15:38:43'),(7,4,25.00,1,2,14,2,3,'2023-02-03 15:38:45',0,'2023-02-03 15:38:45'),(8,5,12.00,1,1,14,2,3,'2023-02-03 16:26:07',0,'2023-02-03 16:26:07'),(9,6,25.00,1,2,14,2,3,'2023-02-05 20:22:45',0,'2023-02-05 20:22:45'),(10,NULL,20.00,20,3,14,NULL,1,'2023-02-05 20:23:16',1,'2023-02-05 20:23:16'),(11,7,25.00,1,2,14,2,6,'2023-02-05 20:28:57',0,'2023-02-05 20:28:57'),(12,7,1.00,1,3,14,2,3,'2023-02-05 20:28:59',0,'2023-02-05 20:28:59'),(13,8,25.00,1,2,14,2,3,'2023-02-05 20:44:06',0,'2023-02-05 20:44:06'),(14,8,4995.00,5,24,14,2,3,'2023-02-15 20:47:32',0,'2023-02-15 20:47:32'),(15,9,25.00,1,2,14,NULL,2,'2023-02-15 20:51:07',0,'2023-02-15 20:51:07'),(16,9,1.00,1,3,14,NULL,2,'2023-02-15 20:51:09',0,'2023-02-15 20:51:09'),(17,10,1.00,1,3,14,2,3,'2023-02-15 21:09:15',0,'2023-02-15 21:09:15'),(18,10,23.00,1,25,14,2,3,'2023-02-15 21:09:17',0,'2023-02-15 21:09:17'),(19,11,150000.00,1000,26,14,2,3,'2023-02-15 21:16:45',0,'2023-02-15 21:16:45'),(20,12,50.00,2,2,2,NULL,2,'2023-02-15 21:45:51',0,'2023-02-15 14:46:22'),(21,13,25.00,1,2,2,2,3,'2023-02-15 21:47:15',0,'2023-02-15 21:47:15'),(22,NULL,25.00,1,2,2,NULL,1,'2023-02-15 21:50:30',0,'2023-02-15 21:50:30');
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
INSERT INTO `tbl_users` VALUES (2,'admin','$2y$10$oAudgvpauxhyTxyhDOvo7.Geu/ddVWPU/TIq690SwRXOySZa81Iry','cjarasa@gmail.com',1,'2022-06-12 02:42:14',0),(7,'Salesclerk','$2y$10$Y3ksPARb0uYJFuetdyGuaeRa.jOpIR.8KAxNlVvij4ZQNaZ1KmVm6','cashier@gmail.com',2,'2022-06-12 10:10:09',0),(9,'carrier','$2y$10$Y3ksPARb0uYJFuetdyGuaeRa.jOpIR.8KAxNlVvij4ZQNaZ1KmVm6','carrier@gmail.com',4,'2022-06-15 22:14:36',0),(10,'admin2','$2y$10$/wkSAVsPPi.ooWYWZodyoeio4Xs9gPjEZCm4MMdG.LDlRGAEOxN82','admin2@gmail.com',1,'2022-06-18 19:38:27',1),(11,'customer2','$2y$10$oAudgvpauxhyTxyhDOvo7.Geu/ddVWPU/TIq690SwRXOySZa81Iry','customer2@gmail.com',3,'2022-06-20 14:36:28',1),(12,'arasa1234','$2y$10$sEYi97dPYqYy0IOAij8vQ.wfZS0y5/8kI6jR0pLZjSqPnp6wZW/.G','testlords@gmail.com',1,'2022-08-06 16:11:57',1),(13,'cjarasa@gmail.com','$2y$10$bi1p.UAHwe3BLFmsvu3q2eHBPRH7nwtYaCyFlIXpg2J2Dl68weOwK','cjarasa@gmail.com',3,'2022-09-12 16:30:13',1),(14,'ace','$2y$10$oAudgvpauxhyTxyhDOvo7.Geu/ddVWPU/TIq690SwRXOySZa81Iry','ace@gmail.com',3,'2022-10-07 22:16:22',0);
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
INSERT INTO `tbl_users_info` VALUES (2,'Carlos','arasa','poblaction sur bayambang pangasinan2',2147483647,1,NULL,NULL,NULL),(7,'Sales Clerk','Cashier','poblaction sur bayambang pangasinan',2147483647,1,NULL,NULL,NULL),(9,'Carrier','Carrier','poblaction sur bayambang pangasinan',2147483647,1,NULL,NULL,NULL),(10,'admin2','admin2','poblaction sur bayambang pangasinan',2147483647,1,NULL,NULL,NULL),(11,'Carlos','arasa','poblaction sur bayambang pangasinan',2147483647,1,NULL,NULL,NULL),(12,'Typhoon','arasa ','poblaction sur bayambang pangasinan',2147483647,1,NULL,NULL,NULL),(13,'carlos','arasa','test',2147483647,1,NULL,NULL,NULL),(14,'ace','acer','bababab',2147483647,2,'province','city','barangay');
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

-- Dump completed on 2023-02-15 21:52:17
