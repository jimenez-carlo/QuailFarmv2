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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_category`
--

LOCK TABLES `tbl_category` WRITE;
/*!40000 ALTER TABLE `tbl_category` DISABLE KEYS */;
INSERT INTO `tbl_category` VALUES (1,'Quail',0,'2022-09-12 17:00:48',NULL),(2,'Egg',0,'2022-09-12 17:00:48',NULL),(3,'Vitamins',0,'2022-09-12 17:00:48',NULL),(7,'Feeds',0,'2022-09-12 22:30:50',NULL),(9,'cage',1,'2023-02-15 21:14:48',NULL),(10,'drinks',1,'2023-02-17 06:57:48',NULL),(11,'hopya',1,'2023-02-17 08:52:32',NULL),(12,'keke',0,'2023-02-18 17:43:27',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_inventory`
--

LOCK TABLES `tbl_inventory` WRITE;
/*!40000 ALTER TABLE `tbl_inventory` DISABLE KEYS */;
INSERT INTO `tbl_inventory` VALUES (1,1,800),(2,2,800),(3,3,780),(4,4,1000),(5,5,0),(6,6,0),(7,7,0),(8,8,0),(9,9,0),(10,10,0),(11,11,0),(12,12,0),(13,13,0),(14,14,1000),(15,15,-10),(16,16,1500),(17,18,0),(18,19,0),(19,23,0),(20,24,0),(21,25,0),(22,26,0),(23,27,0),(24,28,1000),(25,29,1000),(26,30,1000),(27,31,800);
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
INSERT INTO `tbl_inventory_history` VALUES (1,2,0,1000,2,'2023-02-16 20:05:02'),(2,1,0,10000,2,'2023-02-16 20:05:10'),(3,2,1000,9000,2,'2023-02-16 20:05:23'),(4,4,0,1000,2,'2023-02-16 20:05:46'),(5,14,0,1000,2,'2023-02-16 20:05:50'),(6,16,0,1000,2,'2023-02-16 20:05:53'),(7,3,0,1000,2,'2023-02-16 20:05:57'),(8,2,10000,-9000,2,'2023-02-16 20:06:50'),(9,1,10000,-9000,2,'2023-02-16 20:06:51'),(10,1,1000,-100,2,'2023-02-16 20:10:44'),(11,28,0,1000,2,'2023-02-16 20:21:32'),(12,29,0,1000,30,'2023-02-17 07:06:36'),(13,30,0,1000,30,'2023-02-17 07:06:48'),(14,2,1000,-5,30,'2023-02-17 07:15:34'),(15,1,900,-5,30,'2023-02-17 07:15:39'),(16,3,1000,-10,38,'2023-02-17 07:51:08'),(17,3,980,-10,38,'2023-02-17 08:27:08'),(18,3,970,-10,38,'2023-02-17 08:30:51'),(19,3,960,-10,30,'2023-02-17 08:32:19'),(20,14,1000,-1,30,'2023-02-17 08:34:07'),(21,14,999,-1,30,'2023-02-17 08:35:35'),(22,1,895,-5,30,'2023-02-17 08:37:07'),(23,2,995,-100,30,'2023-02-17 08:56:31'),(24,1,890,-100,30,'2023-02-17 08:56:31'),(25,3,950,-100,30,'2023-02-17 08:56:31'),(26,3,850,-100,30,'2023-02-17 08:57:29'),(27,2,895,-100,30,'2023-02-17 08:57:29'),(28,1,790,-100,30,'2023-02-17 08:57:29'),(29,16,1000,-100,30,'2023-02-18 15:58:06'),(30,16,0,1500,30,'2023-02-18 17:00:45'),(31,3,750,-10,30,'2023-02-18 17:01:07'),(32,16,1500,-10,30,'2023-02-18 17:01:07'),(33,31,0,1000,30,'2023-02-18 17:45:16'),(34,31,1000,-200,30,'2023-02-18 17:48:42'),(35,3,740,-10,30,'2023-02-18 17:50:49'),(36,1,690,110,30,'2023-02-18 18:20:50'),(37,2,795,5,30,'2023-02-18 18:20:58'),(38,3,730,70,30,'2023-02-18 18:21:03'),(39,14,998,2,30,'2023-02-18 18:21:07'),(40,16,1490,10,30,'2023-02-18 18:21:12'),(41,3,800,-5,30,'2023-02-18 18:49:43'),(42,3,795,-5,30,'2023-02-18 18:49:49'),(43,3,790,-5,30,'2023-02-18 18:49:53'),(44,3,785,-5,30,'2023-02-18 18:49:57');
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_invoice`
--

LOCK TABLES `tbl_invoice` WRITE;
/*!40000 ALTER TABLE `tbl_invoice` DISABLE KEYS */;
INSERT INTO `tbl_invoice` VALUES (3,'1676607238',29,2,'2023-02-17 07:13:58',3,NULL,NULL,NULL,NULL),(4,'1676608103',30,2,'2023-02-17 07:28:23',3,NULL,NULL,NULL,NULL),(5,'1676610430',38,1,'2023-02-17 08:07:10',1,NULL,NULL,NULL,NULL),(6,'1676610997',38,1,'2023-02-17 08:16:37',1,NULL,NULL,NULL,NULL),(7,'1676611155',38,1,'2023-02-17 08:19:15',1,NULL,NULL,NULL,NULL),(8,'1676611223',38,1,'2023-02-17 08:20:23',1,NULL,NULL,NULL,NULL),(10,'1676611438',38,1,'2023-02-17 08:23:58',1,NULL,NULL,NULL,NULL),(11,'1676611570',38,2,'2023-02-17 08:26:10',3,NULL,NULL,NULL,NULL),(12,'1676611693',38,1,'2023-02-17 08:28:13',3,NULL,NULL,NULL,NULL),(13,'1676611833',38,2,'2023-02-17 08:30:33',3,NULL,NULL,NULL,NULL),(14,'1676611926',30,1,'2023-02-17 08:32:06',3,NULL,NULL,NULL,NULL),(15,'1676612036',30,1,'2023-02-17 08:33:56',3,NULL,NULL,NULL,NULL),(16,'1676612123',30,2,'2023-02-17 08:35:23',3,NULL,NULL,NULL,NULL),(17,'1676612205',30,2,'2023-02-17 08:36:45',3,NULL,NULL,NULL,NULL),(18,'1676613345',29,2,'2023-02-17 08:55:45',3,NULL,NULL,NULL,NULL),(19,'1676613440',30,1,'2023-02-17 08:57:20',3,NULL,NULL,NULL,NULL),(20,'1676707073',30,1,'2023-02-18 15:57:53',3,NULL,NULL,NULL,NULL),(21,'1676710851',29,2,'2023-02-18 17:00:51',3,NULL,NULL,NULL,NULL),(22,'1676713689',30,2,'2023-02-18 17:48:09',3,NULL,NULL,NULL,NULL),(23,'1676715744',29,1,'2023-02-18 18:22:24',1,NULL,NULL,NULL,NULL),(24,'1676717078',29,2,'2023-02-18 18:44:38',3,NULL,NULL,NULL,NULL),(25,'1676717097',33,2,'2023-02-18 18:44:57',3,NULL,NULL,NULL,NULL),(26,'1676717119',40,2,'2023-02-18 18:45:19',3,NULL,NULL,NULL,NULL),(27,'1676717378',41,2,'2023-02-18 18:49:38',3,NULL,NULL,NULL,NULL),(28,'1676721500',29,1,'2023-02-18 19:58:20',6,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_invoice_status_history`
--

LOCK TABLES `tbl_invoice_status_history` WRITE;
/*!40000 ALTER TABLE `tbl_invoice_status_history` DISABLE KEYS */;
INSERT INTO `tbl_invoice_status_history` VALUES (1,1,2,2,'2023-02-16 20:06:50'),(2,1,3,2,'2023-02-16 20:06:51'),(3,2,3,2,'2023-02-16 20:10:44'),(4,3,7,30,'2023-02-17 07:15:28'),(5,3,3,30,'2023-02-17 07:15:34'),(6,3,3,30,'2023-02-17 07:15:39'),(7,4,2,38,'2023-02-17 07:51:08'),(8,4,3,38,'2023-02-17 07:54:25'),(9,11,3,38,'2023-02-17 08:27:08'),(10,13,3,38,'2023-02-17 08:30:51'),(11,14,3,30,'2023-02-17 08:32:19'),(12,15,3,30,'2023-02-17 08:34:07'),(13,16,3,30,'2023-02-17 08:35:35'),(14,17,3,30,'2023-02-17 08:37:07'),(15,18,3,30,'2023-02-17 08:56:31'),(16,19,3,30,'2023-02-17 08:57:29'),(17,20,3,30,'2023-02-18 15:58:06'),(18,21,3,30,'2023-02-18 17:01:07'),(19,22,3,30,'2023-02-18 17:48:42'),(20,12,3,30,'2023-02-18 17:50:49'),(21,27,3,30,'2023-02-18 18:49:43'),(22,26,3,30,'2023-02-18 18:49:49'),(23,25,3,30,'2023-02-18 18:49:53'),(24,24,3,30,'2023-02-18 18:49:57'),(25,28,6,29,'2023-02-18 19:58:24');
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_product`
--

LOCK TABLES `tbl_product` WRITE;
/*!40000 ALTER TABLE `tbl_product` DISABLE KEYS */;
INSERT INTO `tbl_product` VALUES (1,1,'Male quails','Kals','image_20230126120519.jpeg',12.00,'2022-06-11 14:31:01',NULL,0,NULL),(2,1,'Female quail','Laying Eggs','female_quail.png',25.00,'2022-06-11 14:31:01',NULL,0,NULL),(3,2,'Quail Egg','Egg','quail_egg.jpg',1.15,'2022-06-12 21:41:20',NULL,0,NULL),(4,1,'Female quail','8 - 12 Months Kal','Quail8months.png',15.00,'2022-06-20 13:56:04',NULL,0,NULL),(5,1,'test','test','default.png',100.00,'2022-06-26 17:58:28',2,1,NULL),(6,1,'test','test','default.png',100.00,'2022-06-26 17:58:48',2,1,NULL),(7,1,'test','test','default.png',100.00,'2022-06-26 17:59:26',2,1,NULL),(8,1,'test','test','default.png',100.00,'2022-06-26 18:01:25',2,1,NULL),(9,1,'1232','test','image_20220626124207.jpeg',100.00,'2022-06-26 18:07:13',2,1,NULL),(10,1,'test','test','image_20220626121905.jpeg',123.00,'2022-06-26 18:19:05',2,1,NULL),(11,1,'123','test','image_20220626122042.jpeg',123.00,'2022-06-26 18:20:43',2,1,NULL),(12,1,'test','test','image_20220626122100.jpeg',123.00,'2022-06-26 18:21:00',2,1,NULL),(13,1,'123','test','default.png',231.00,'2022-09-11 17:09:10',2,1,NULL),(14,3,'Coturnix Quail','Vitamin & Electrolytes','image_20230216182116.jpeg',200.00,'2022-10-07 23:17:40',2,0,'2026-02-16'),(16,7,'Premium Quail Layer','Feeds','image_20230216182100.jpeg',999.99,'2022-10-07 23:23:28',2,0,'2026-02-16'),(17,2,'a','a','default.png',100.00,'2023-01-16 14:08:52',NULL,1,NULL),(18,2,'pepsi','','default.png',59.00,'2023-02-06 10:58:13',NULL,1,NULL),(19,2,'red bull','','default.png',299.00,'2023-02-06 10:58:25',NULL,1,NULL),(20,2,'testestestset','test','default.png',999.99,'2023-02-15 20:25:53',NULL,1,'0000-00-00'),(21,2,'testsetest','test','default.png',999.99,'2023-02-15 20:26:30',NULL,1,'2023-04-01'),(22,2,'Quail Egg','test','default.png',999.99,'2023-02-15 20:28:30',NULL,1,'2023-01-01'),(23,1,'testsetsete','test','default.png',999.99,'2023-02-15 20:30:04',NULL,1,'2023-01-01'),(24,2,'testsetsete','test','default.png',999.99,'2023-02-15 20:31:46',NULL,1,'2023-01-01'),(25,2,'testsetsete','test','default.png',23.00,'2023-02-15 20:32:16',NULL,1,'2023-01-04'),(26,9,'cage','qweqwewqwq','image_20230215141547.jpeg',150.00,'2023-02-15 21:15:47',NULL,1,'2024-02-15'),(27,9,'Trainer','teesdt','default.png',999.99,'2023-02-16 23:15:18',NULL,1,'2023-01-01'),(28,9,'Cage','Quail Cage','image_20230216182013.jpeg',250.00,'2023-02-16 20:20:13',NULL,1,'2025-02-16'),(29,10,'popcola','softdrinks','image_20230217045956.jpeg',25.00,'2023-02-17 06:59:56',NULL,1,'2024-02-17'),(30,10,'popcola','asdas','image_20230217050202.jpeg',25.00,'2023-02-17 07:02:02',NULL,1,'2025-02-17'),(31,12,'Tinapay','pepe','image_20230218104431.jpeg',20.00,'2023-02-18 17:44:31',NULL,0,'2024-02-02');
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
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_status_history`
--

LOCK TABLES `tbl_status_history` WRITE;
/*!40000 ALTER TABLE `tbl_status_history` DISABLE KEYS */;
INSERT INTO `tbl_status_history` VALUES (1,1,1,14,'2023-02-16 20:06:23'),(2,2,1,14,'2023-02-16 20:06:27'),(3,1,2,14,'2023-02-16 20:06:33'),(4,2,2,14,'2023-02-16 20:06:33'),(5,2,3,2,'2023-02-16 20:06:50'),(6,1,3,2,'2023-02-16 20:06:51'),(7,3,1,2,'2023-02-16 20:10:27'),(8,3,2,2,'2023-02-16 20:10:37'),(9,3,3,2,'2023-02-16 20:10:44'),(10,4,1,29,'2023-02-17 07:11:04'),(11,5,1,29,'2023-02-17 07:11:10'),(12,6,1,29,'2023-02-17 07:11:33'),(13,7,1,29,'2023-02-17 07:11:38'),(14,4,2,29,'2023-02-17 07:13:58'),(15,5,2,29,'2023-02-17 07:13:58'),(16,7,2,29,'2023-02-17 07:13:58'),(17,7,6,30,'2023-02-17 07:15:28'),(18,5,3,30,'2023-02-17 07:15:34'),(19,4,3,30,'2023-02-17 07:15:39'),(20,8,1,30,'2023-02-17 07:23:28'),(21,9,1,30,'2023-02-17 07:23:36'),(22,10,1,30,'2023-02-17 07:23:51'),(23,8,2,30,'2023-02-17 07:28:23'),(24,9,2,30,'2023-02-17 07:28:23'),(25,9,3,38,'2023-02-17 07:51:08'),(26,8,6,38,'2023-02-17 07:54:25'),(27,11,1,38,'2023-02-17 08:07:04'),(28,11,2,38,'2023-02-17 08:07:10'),(29,12,1,38,'2023-02-17 08:16:27'),(30,12,2,38,'2023-02-17 08:16:37'),(31,13,1,38,'2023-02-17 08:19:02'),(32,13,2,38,'2023-02-17 08:19:15'),(33,14,1,38,'2023-02-17 08:20:11'),(34,14,2,38,'2023-02-17 08:20:23'),(35,15,1,38,'2023-02-17 08:23:02'),(36,15,2,38,'2023-02-17 08:23:58'),(37,16,1,38,'2023-02-17 08:25:58'),(38,16,2,38,'2023-02-17 08:26:10'),(39,16,3,38,'2023-02-17 08:27:08'),(40,17,1,38,'2023-02-17 08:28:02'),(41,17,2,38,'2023-02-17 08:28:13'),(42,18,1,38,'2023-02-17 08:30:20'),(43,18,2,38,'2023-02-17 08:30:33'),(44,18,3,38,'2023-02-17 08:30:51'),(45,19,1,30,'2023-02-17 08:31:55'),(46,19,2,30,'2023-02-17 08:32:06'),(47,19,3,30,'2023-02-17 08:32:19'),(48,20,1,30,'2023-02-17 08:33:38'),(49,20,2,30,'2023-02-17 08:33:56'),(50,20,3,30,'2023-02-17 08:34:07'),(51,21,1,30,'2023-02-17 08:35:13'),(52,21,2,30,'2023-02-17 08:35:23'),(53,21,3,30,'2023-02-17 08:35:35'),(54,22,1,30,'2023-02-17 08:36:35'),(55,22,2,30,'2023-02-17 08:36:46'),(56,22,3,30,'2023-02-17 08:37:07'),(57,23,1,29,'2023-02-17 08:55:24'),(58,24,1,29,'2023-02-17 08:55:30'),(59,25,1,29,'2023-02-17 08:55:36'),(60,23,2,29,'2023-02-17 08:55:45'),(61,24,2,29,'2023-02-17 08:55:45'),(62,25,2,29,'2023-02-17 08:55:45'),(63,26,1,30,'2023-02-17 08:56:06'),(64,27,1,30,'2023-02-17 08:56:12'),(65,28,1,30,'2023-02-17 08:56:18'),(66,23,3,30,'2023-02-17 08:56:31'),(67,24,3,30,'2023-02-17 08:56:31'),(68,25,3,30,'2023-02-17 08:56:31'),(69,26,2,30,'2023-02-17 08:57:20'),(70,27,2,30,'2023-02-17 08:57:20'),(71,28,2,30,'2023-02-17 08:57:20'),(72,26,3,30,'2023-02-17 08:57:29'),(73,27,3,30,'2023-02-17 08:57:29'),(74,28,3,30,'2023-02-17 08:57:29'),(75,29,1,2,'2023-02-18 15:15:52'),(76,30,1,2,'2023-02-18 15:16:25'),(77,31,1,2,'2023-02-18 15:24:04'),(78,32,1,2,'2023-02-18 15:24:21'),(79,33,1,30,'2023-02-18 15:55:58'),(80,34,1,30,'2023-02-18 15:56:01'),(81,35,1,30,'2023-02-18 15:57:38'),(82,35,2,30,'2023-02-18 15:57:53'),(83,35,3,30,'2023-02-18 15:58:06'),(84,36,1,29,'2023-02-18 16:23:14'),(85,37,1,29,'2023-02-18 16:25:21'),(86,36,2,29,'2023-02-18 17:00:51'),(87,37,2,29,'2023-02-18 17:00:51'),(88,36,3,30,'2023-02-18 17:01:07'),(89,37,3,30,'2023-02-18 17:01:07'),(90,38,1,30,'2023-02-18 17:46:26'),(91,39,1,30,'2023-02-18 17:47:01'),(92,38,2,30,'2023-02-18 17:48:09'),(93,38,3,30,'2023-02-18 17:48:42'),(94,17,3,30,'2023-02-18 17:50:49'),(95,40,1,29,'2023-02-18 18:21:33'),(96,41,1,29,'2023-02-18 18:21:36'),(97,42,1,29,'2023-02-18 18:21:38'),(98,43,1,29,'2023-02-18 18:21:41'),(99,44,1,29,'2023-02-18 18:21:44'),(100,45,1,29,'2023-02-18 18:21:47'),(101,46,1,29,'2023-02-18 18:21:49'),(102,40,2,29,'2023-02-18 18:22:24'),(103,41,2,29,'2023-02-18 18:22:24'),(104,42,2,29,'2023-02-18 18:22:24'),(105,43,2,29,'2023-02-18 18:22:24'),(106,44,2,29,'2023-02-18 18:22:24'),(107,45,2,29,'2023-02-18 18:22:24'),(108,46,2,29,'2023-02-18 18:22:24'),(109,46,5,29,'2023-02-18 18:22:30'),(110,47,1,29,'2023-02-18 18:44:34'),(111,47,2,29,'2023-02-18 18:44:38'),(112,48,1,33,'2023-02-18 18:44:52'),(113,48,2,33,'2023-02-18 18:44:57'),(114,49,1,40,'2023-02-18 18:45:16'),(115,49,2,40,'2023-02-18 18:45:19'),(116,50,1,41,'2023-02-18 18:49:35'),(117,50,2,41,'2023-02-18 18:49:38'),(118,50,3,30,'2023-02-18 18:49:43'),(119,49,3,30,'2023-02-18 18:49:49'),(120,48,3,30,'2023-02-18 18:49:53'),(121,47,3,30,'2023-02-18 18:49:57'),(122,45,5,29,'2023-02-18 19:57:21'),(123,44,5,29,'2023-02-18 19:57:55'),(124,40,5,29,'2023-02-18 19:57:59'),(125,51,1,29,'2023-02-18 19:58:08'),(126,52,1,29,'2023-02-18 19:58:10'),(127,51,2,29,'2023-02-18 19:58:20'),(128,52,2,29,'2023-02-18 19:58:20'),(129,52,5,29,'2023-02-18 19:58:23'),(130,51,5,29,'2023-02-18 19:58:24'),(131,53,1,30,'2023-02-18 19:59:12');
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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_transactions`
--

LOCK TABLES `tbl_transactions` WRITE;
/*!40000 ALTER TABLE `tbl_transactions` DISABLE KEYS */;
INSERT INTO `tbl_transactions` VALUES (4,3,60.00,5,1,29,30,3,'2023-02-17 07:11:04',0,'2023-02-17 07:11:04'),(5,3,125.00,5,2,29,30,3,'2023-02-17 07:11:10',0,'2023-02-17 07:11:10'),(7,3,1200.00,6,14,29,30,6,'2023-02-17 07:11:38',0,'2023-02-17 07:11:38'),(8,4,60.00,5,1,30,38,6,'2023-02-17 07:23:28',0,'2023-02-17 07:23:28'),(9,4,10.00,10,3,30,38,3,'2023-02-17 07:23:36',0,'2023-02-17 07:23:36'),(11,5,10.00,10,3,38,NULL,2,'2023-02-17 08:07:04',0,'2023-02-17 08:07:04'),(12,6,10.00,10,3,38,NULL,2,'2023-02-17 08:16:27',0,'2023-02-17 08:16:27'),(13,7,10.00,10,3,38,NULL,2,'2023-02-17 08:19:02',0,'2023-02-17 08:19:02'),(14,8,10.00,10,3,38,NULL,2,'2023-02-17 08:20:11',0,'2023-02-17 08:20:11'),(15,10,10.00,10,3,38,NULL,2,'2023-02-17 08:23:02',0,'2023-02-17 08:23:02'),(16,11,10.00,10,3,38,38,3,'2023-02-17 08:25:58',0,'2023-02-17 08:25:58'),(17,12,10.00,10,3,38,30,3,'2023-02-17 08:28:02',0,'2023-02-17 08:28:02'),(18,13,10.00,10,3,38,38,3,'2023-02-17 08:30:20',0,'2023-02-17 08:30:20'),(19,14,10.00,10,3,30,30,3,'2023-02-17 08:31:55',0,'2023-02-17 08:31:55'),(20,15,200.00,1,14,30,30,3,'2023-02-17 08:33:38',0,'2023-02-17 08:33:38'),(21,16,200.00,1,14,30,30,3,'2023-02-17 08:35:13',0,'2023-02-17 08:35:13'),(22,17,60.00,5,1,30,30,3,'2023-02-17 08:36:35',0,'2023-02-17 08:36:35'),(23,18,2500.00,100,2,29,30,3,'2023-02-17 08:55:24',0,'2023-02-17 08:55:24'),(24,18,1200.00,100,1,29,30,3,'2023-02-17 08:55:30',0,'2023-02-17 08:55:30'),(25,18,100.00,100,3,29,30,3,'2023-02-17 08:55:36',0,'2023-02-17 08:55:36'),(26,19,100.00,100,3,30,30,3,'2023-02-17 08:56:06',0,'2023-02-17 08:56:06'),(27,19,2500.00,100,2,30,30,3,'2023-02-17 08:56:12',0,'2023-02-17 08:56:12'),(28,19,1200.00,100,1,30,30,3,'2023-02-17 08:56:18',0,'2023-02-17 08:56:18'),(35,20,99999.00,100,16,30,30,3,'2023-02-18 15:57:38',0,'2023-02-18 15:57:38'),(36,21,11.50,10,3,29,30,3,'2023-02-18 16:23:14',0,'2023-02-18 16:23:14'),(37,21,9999.90,10,16,29,30,3,'2023-02-18 16:25:21',0,'2023-02-18 16:25:21'),(38,22,4000.00,200,31,30,30,3,'2023-02-18 17:46:26',0,'2023-02-18 17:46:26'),(39,NULL,2160.00,180,1,30,NULL,1,'2023-02-18 17:47:01',1,'2023-02-18 10:47:51'),(40,23,120.00,10,1,29,NULL,5,'2023-02-18 18:21:33',0,'2023-02-18 12:57:59'),(41,23,250.00,10,2,29,NULL,2,'2023-02-18 18:21:36',0,'2023-02-18 18:21:36'),(42,23,11.50,10,3,29,NULL,2,'2023-02-18 18:21:38',0,'2023-02-18 18:21:38'),(43,23,150.00,10,4,29,NULL,2,'2023-02-18 18:21:41',0,'2023-02-18 18:21:41'),(44,23,2000.00,10,14,29,NULL,5,'2023-02-18 18:21:44',0,'2023-02-18 12:57:55'),(45,23,9999.90,10,16,29,NULL,5,'2023-02-18 18:21:47',0,'2023-02-18 12:57:21'),(46,23,400.00,20,31,29,NULL,5,'2023-02-18 18:21:49',0,'2023-02-18 11:22:30'),(47,24,5.75,5,3,29,30,3,'2023-02-18 18:44:34',0,'2023-02-18 18:44:34'),(48,25,5.75,5,3,33,30,3,'2023-02-18 18:44:52',0,'2023-02-18 18:44:52'),(49,26,5.75,5,3,40,30,3,'2023-02-18 18:45:16',0,'2023-02-18 18:45:16'),(50,27,5.75,5,3,41,30,3,'2023-02-18 18:49:35',0,'2023-02-18 18:49:35'),(51,28,11.50,10,3,29,NULL,5,'2023-02-18 19:58:08',0,'2023-02-18 12:58:24'),(52,28,250.00,10,2,29,NULL,5,'2023-02-18 19:58:10',0,'2023-02-18 12:58:23'),(53,NULL,60.00,5,1,30,NULL,1,'2023-02-18 19:59:12',0,'2023-02-18 19:59:12');
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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_users`
--

LOCK TABLES `tbl_users` WRITE;
/*!40000 ALTER TABLE `tbl_users` DISABLE KEYS */;
INSERT INTO `tbl_users` VALUES (29,'SAMPLE#1','$2y$10$wIFlpGifHH/TwX6/alh/U.l6vqCNwD9nYG7r3CBeM2lp90jwJs35u',NULL,3,'2023-02-17 05:03:00',0),(30,'admin','$2y$10$g6bQC84NYsBGcBb0Hm7RQOyRLGVfa47upEOAmQ/GYAtJLtQW3g08a',NULL,1,'2023-02-17 05:06:19',0),(32,'Salesclerk','$2y$10$VIFdwpd5O.g3p3bVI18GbeK6WB4V/2td07V/I5m/QgukWJLRiritK',NULL,2,'2023-02-17 05:23:45',0),(33,'SAMPLE#2','$2y$10$3M2YdqySr6FakP7N9HVmAOwiRIxbxFrpiJicVRquY0QGHk6EbrwfK',NULL,3,'2023-02-17 05:24:20',0),(34,'test1233','$2y$10$EJlJ4XAfqRc2TQuBoqDpxOh5FXyjGFZt/kiDbxV/V9DtwucT9mLyq',NULL,5,'2023-02-17 05:28:05',1),(35,'kim','$2y$10$rt2nlfsKNVX1Vg630tP0sunveUWkUAiJVtKOGsGbkE40JlEZobkUi',NULL,1,'2023-02-17 06:49:41',0),(36,'shadji','$2y$10$vanzqjun8dNaWU7GwQHoPu8hQGvZkv2PuQCdlSMNs6X/aMhsMCCbG',NULL,5,'2023-02-17 06:51:28',1),(37,'shadi','$2y$10$OYw3FyAvkLxdd/9R99sihuutvjzrINk9YohQEDEWd9tFoxwuovzTq',NULL,5,'2023-02-17 06:51:59',0),(38,'klerk','$2y$10$/PHrF40cajNB6176kjdzJOIV7tCQPq0bPLibzcbl.l8V9eVRxVlbq',NULL,4,'2023-02-17 07:40:23',1),(39,'kuka','$2y$10$rZkNupZ7.1Tni//t/syX6ehUrAXtsPjjiO7qH0.G39YMTzrMO51Hu',NULL,4,'2023-02-18 16:55:13',0),(40,'SAMPLE#3','$2y$10$.symsYaln2ydGAlPuYNqVe8YA3TCLAN7Ye1.KcpGCCJos4exbnEau',NULL,3,'2023-02-18 18:43:51',0),(41,'SAMPLE#4','$2y$10$FMp5RiTBuAbMD7u4myAo.uTjGBcW4zz5vTYTB4HNUAvGecuTyriom',NULL,5,'2023-02-18 18:44:08',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_users_info`
--

LOCK TABLES `tbl_users_info` WRITE;
/*!40000 ALTER TABLE `tbl_users_info` DISABLE KEYS */;
INSERT INTO `tbl_users_info` VALUES (29,'SAMPLE#1','SAMPLE#1','nibaliw sur bautista pangasinan',2147483647,1,'pangasinan','bayambang','del pilar'),(30,'Admin','Admin','nibaliw sur bautista pangasinan',912345678,1,NULL,NULL,NULL),(32,'Queen','Tagulao',NULL,2147483647,2,'Pangasinan','Bayambang','bongato'),(33,'SAMPLE#2','SAMPLE#2',NULL,2147483647,1,'Pangasinan','Bayambang','Del pilar'),(34,'jmmm','Bayambang',NULL,2147483647,1,'Pangasinan','Bayambang','Del pilar'),(35,'kim','nanlabi',NULL,2147483647,1,'Pangasinan','Bayambang','Del pilar'),(36,'shadji','shadji',NULL,2147483647,1,'Pangasinan','Bayambang','nibaliw'),(37,'cj','Arasa',NULL,2147483647,1,'Pangasinan','Bayambang','Del pilar'),(38,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,'kuka','kuka',NULL,2147483647,1,'babbaba','babababa','babababa'),(40,'SAMPLE#3','SAMPLE#3',NULL,NULL,NULL,NULL,NULL,NULL),(41,'SAMPLE#4','SAMPLE#4',NULL,NULL,NULL,NULL,NULL,NULL);
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

-- Dump completed on 2023-02-18 20:03:24
