CREATE DATABASE  IF NOT EXISTS `db_ecomm` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `db_ecomm`;
-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: db_ecomm
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_category`
--

DROP TABLE IF EXISTS `tbl_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_category` (
  `CategoryID` varchar(10) NOT NULL,
  `CategoryName` varchar(50) NOT NULL,
  `CategoryDescription` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_category`
--

LOCK TABLES `tbl_category` WRITE;
/*!40000 ALTER TABLE `tbl_category` DISABLE KEYS */;
INSERT INTO `tbl_category` VALUES ('1','Oil','Cooking Oil'),('2','Cream','Beauty Cream'),('3','Soap','Multi purpose'),('4','Shampoo','Multipurpose');
/*!40000 ALTER TABLE `tbl_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_customerorders`
--

DROP TABLE IF EXISTS `tbl_customerorders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_customerorders` (
  `OrderID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` varchar(25) NOT NULL,
  `DatePlaced` timestamp NULL DEFAULT NULL,
  `OrderStatusCode` varchar(5) NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `UserID` (`UserID`),
  KEY `OrderStatusCode` (`OrderStatusCode`),
  CONSTRAINT `tbl_customerorders_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `tbl_useraccount` (`username`),
  CONSTRAINT `tbl_customerorders_ibfk_2` FOREIGN KEY (`OrderStatusCode`) REFERENCES `tbl_orderstatus` (`orderstatuscode`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_customerorders`
--

LOCK TABLES `tbl_customerorders` WRITE;
/*!40000 ALTER TABLE `tbl_customerorders` DISABLE KEYS */;
INSERT INTO `tbl_customerorders` VALUES (1,'sarthak','2018-12-11 19:46:16','P'),(2,'goelsarthak','2018-12-13 00:27:17','P'),(3,'abc6','2018-12-13 03:39:08','P'),(5,'abc7','2018-12-13 03:51:55','P'),(6,'abc7','2018-12-13 04:05:26','P'),(7,'abc8','2018-12-13 04:08:36','P'),(8,'abc9','2018-12-13 04:12:17','Pr'),(9,'abc10','2018-12-13 04:28:26','Pr'),(10,'abc12','2018-12-13 05:02:09','Pr'),(11,'admin','2018-12-13 05:39:49','Pr'),(12,'sys','2018-12-13 05:46:07','Pr'),(13,'sys1','2018-12-13 06:57:57','Pr'),(14,'sys1','2018-12-13 07:01:53','Pr'),(15,'sys1','2018-12-13 08:56:21','P'),(16,'sys1','2018-12-13 09:02:05','Pr'),(17,'sys1','2018-12-13 09:05:00','C'),(18,'SarthakGoel','2018-12-13 09:55:08','Pr');
/*!40000 ALTER TABLE `tbl_customerorders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_orderitems`
--

DROP TABLE IF EXISTS `tbl_orderitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_orderitems` (
  `OrderID` int(11) NOT NULL,
  `ProductID` varchar(10) NOT NULL,
  `OrderItemQuantity` int(11) NOT NULL,
  `OrderedProductPrice` int(11) NOT NULL,
  PRIMARY KEY (`OrderID`,`ProductID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `tbl_orderitems_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `tbl_product` (`productid`),
  CONSTRAINT `tbl_orderitems_ibfk_2` FOREIGN KEY (`OrderID`) REFERENCES `tbl_customerorders` (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_orderitems`
--

LOCK TABLES `tbl_orderitems` WRITE;
/*!40000 ALTER TABLE `tbl_orderitems` DISABLE KEYS */;
INSERT INTO `tbl_orderitems` VALUES (1,'P111',2,180),(1,'P113',4,280),(1,'P123',3,300),(8,'P111',1,90),(9,'P111',1,90),(10,'P111',1,90),(10,'P113',1,70),(11,'P111',1,90),(12,'P111',1,90),(13,'P111',1,90),(14,'P111',1,90),(16,'P111',1,90),(16,'P123',2,200),(17,'P111',1,90),(17,'P113',2,140),(17,'P123',1,100),(18,'P111',1,90),(18,'P113',2,140),(18,'P123',3,300);
/*!40000 ALTER TABLE `tbl_orderitems` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tg_UpdateProductQunatity` AFTER INSERT ON `tbl_orderitems` FOR EACH ROW Begin
	Update tbl_Product As P Set p.ProductQuantity = p.ProductQuantity - New.OrderItemQuantity where p.ProductId = New.ProductID;
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tg_generateBill` AFTER INSERT ON `tbl_orderitems` FOR EACH ROW Begin
	Delete from tbl_Payment where OrderId = New.OrderID;
	Insert into tbl_Payment(OrderId,Payment_Amt,PaymentDate) Values(New.OrderId, (Select SUM(OrderedProductPrice) As TotalPrice from tbl_OrderItems where OrderId = new.OrderID ),Now());
	Update tbl_CustomerOrders Set OrderStatusCode = "C" where OrderID = New.OrderID;
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbl_orderstatus`
--

DROP TABLE IF EXISTS `tbl_orderstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_orderstatus` (
  `OrderStatusCode` varchar(5) NOT NULL,
  `OrderStatusDescription` varchar(20) NOT NULL,
  PRIMARY KEY (`OrderStatusCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_orderstatus`
--

LOCK TABLES `tbl_orderstatus` WRITE;
/*!40000 ALTER TABLE `tbl_orderstatus` DISABLE KEYS */;
INSERT INTO `tbl_orderstatus` VALUES ('C','Completed'),('P','OrderCreated'),('Pr','Processing');
/*!40000 ALTER TABLE `tbl_orderstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_payment`
--

DROP TABLE IF EXISTS `tbl_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_payment` (
  `OrderID` int(10) DEFAULT NULL,
  `Payment_Amt` int(20) NOT NULL,
  `PaymentDate` timestamp NULL DEFAULT NULL,
  `PaymentID` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`PaymentID`),
  KEY `OrderID` (`OrderID`),
  CONSTRAINT `tbl_payment_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `tbl_customerorders` (`orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_payment`
--

LOCK TABLES `tbl_payment` WRITE;
/*!40000 ALTER TABLE `tbl_payment` DISABLE KEYS */;
INSERT INTO `tbl_payment` VALUES (1,760,'2018-12-11 20:04:39',1),(16,490,'2018-12-13 09:02:15',3),(17,470,'2018-12-13 09:05:50',6),(18,530,'2018-12-13 09:56:33',9);
/*!40000 ALTER TABLE `tbl_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_product`
--

DROP TABLE IF EXISTS `tbl_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_product` (
  `ProductID` varchar(10) NOT NULL,
  `ProductName` varchar(30) NOT NULL,
  `ProductPrice` int(11) NOT NULL,
  `ProductQuantity` int(11) NOT NULL,
  `ProductDesc` varchar(50) DEFAULT NULL,
  `CategoryID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `CategoryID` (`CategoryID`),
  CONSTRAINT `tbl_product_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `tbl_category` (`categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_product`
--

LOCK TABLES `tbl_product` WRITE;
/*!40000 ALTER TABLE `tbl_product` DISABLE KEYS */;
INSERT INTO `tbl_product` VALUES ('P111','Best Cream',90,43,'Best','2'),('P113','Best Soap',70,30,'Best N Best','3'),('P123','Best Oil',100,36,'Premium','1');
/*!40000 ALTER TABLE `tbl_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_supplierproduct`
--

DROP TABLE IF EXISTS `tbl_supplierproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_supplierproduct` (
  `SupplierID` varchar(10) DEFAULT NULL,
  `ProductID` varchar(10) DEFAULT NULL,
  `SuppliedQuantity` int(11) NOT NULL,
  `Comments` varchar(50) DEFAULT NULL,
  `DateSupplied` timestamp NULL DEFAULT NULL,
  KEY `SupplierID` (`SupplierID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `tbl_supplierproduct_ibfk_1` FOREIGN KEY (`SupplierID`) REFERENCES `tbl_useraccount` (`username`),
  CONSTRAINT `tbl_supplierproduct_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `tbl_product` (`productid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_supplierproduct`
--

LOCK TABLES `tbl_supplierproduct` WRITE;
/*!40000 ALTER TABLE `tbl_supplierproduct` DISABLE KEYS */;
INSERT INTO `tbl_supplierproduct` VALUES ('prakash','P111',5,'Supplied Cream','2018-12-11 18:30:24'),('prakash','P111',5,NULL,'2018-12-11 18:43:40'),('prakash','P111',5,NULL,'2018-12-11 19:31:42'),('prakash','P111',10,NULL,'2018-12-13 00:54:14');
/*!40000 ALTER TABLE `tbl_supplierproduct` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tg_supplierUpdateProductQunatity` AFTER INSERT ON `tbl_supplierproduct` FOR EACH ROW Begin
	Update tbl_Product As P Set p.ProductQuantity = p.ProductQuantity + New.SuppliedQuantity where p.ProductId = New.ProductID;
End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbl_useraccount`
--

DROP TABLE IF EXISTS `tbl_useraccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_useraccount` (
  `userName` varchar(25) NOT NULL,
  `userpwd` varchar(15) NOT NULL,
  `RoleID` int(11) NOT NULL,
  PRIMARY KEY (`userName`),
  KEY `fk_RoleID_idx` (`RoleID`),
  CONSTRAINT `fk_RoleID` FOREIGN KEY (`RoleID`) REFERENCES `tbl_userrole` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_useraccount`
--

LOCK TABLES `tbl_useraccount` WRITE;
/*!40000 ALTER TABLE `tbl_useraccount` DISABLE KEYS */;
INSERT INTO `tbl_useraccount` VALUES ('abc','abc',1),('abc1','abc1',1),('abc10','abc10',1),('abc11','abc11',1),('abc12','abc12',1),('abc13','abc13',1),('abc2','abc2',1),('abc3','abc3',1),('abc4','abc4',1),('abc5','abc5',1),('abc6','abc6',1),('abc7','abc7',1),('abc8','abc8',1),('abc9','abc9',1),('admin','admin',3),('admin1','admin1',3),('admin2','admin2',3),('ankit','ankit',1),('goelsarthak','goelsarthak',1),('parth','parth',1),('prakash','prakash',1),('sarthak','sarthak',1),('SarthakGoel','SarthakGoel',1),('sup','sup',2),('Supplier','Supplier',2),('sys','sys',3),('sys1','sys1',3),('sysadmin','sysadmin',3),('vasu','vasu',1);
/*!40000 ALTER TABLE `tbl_useraccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_useraddress`
--

DROP TABLE IF EXISTS `tbl_useraddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_useraddress` (
  `UserID` varchar(25) NOT NULL,
  `AddressLine1` varchar(60) NOT NULL,
  `AddressLine2` varchar(60) DEFAULT NULL,
  `City` varchar(30) NOT NULL,
  `State` varchar(30) NOT NULL,
  `Country` varchar(30) NOT NULL,
  `AddressType` enum('HOME','OFFICE','OTHER') DEFAULT 'HOME',
  `AddressId` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`AddressId`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `tbl_useraddress_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `tbl_useraccount` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_useraddress`
--

LOCK TABLES `tbl_useraddress` WRITE;
/*!40000 ALTER TABLE `tbl_useraddress` DISABLE KEYS */;
INSERT INTO `tbl_useraddress` VALUES ('goelsarthak','Boylston',NULL,'Boston','MA','US','HOME',1),('ankit','Germain',NULL,'Boston','MA','US','HOME',2);
/*!40000 ALTER TABLE `tbl_useraddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_userinfo`
--

DROP TABLE IF EXISTS `tbl_userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_userinfo` (
  `userID` varchar(25) NOT NULL,
  `userFN` varchar(20) NOT NULL,
  `userMN` varchar(20) DEFAULT NULL,
  `userLN` varchar(20) NOT NULL,
  `emailID` varchar(30) NOT NULL,
  `dOB` date NOT NULL,
  KEY `userID` (`userID`),
  CONSTRAINT `tbl_userinfo_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `tbl_useraccount` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_userinfo`
--

LOCK TABLES `tbl_userinfo` WRITE;
/*!40000 ALTER TABLE `tbl_userinfo` DISABLE KEYS */;
INSERT INTO `tbl_userinfo` VALUES ('goelsarthak','Sarthak',NULL,'Goel','goel@gmail.com','1993-02-07'),('ankit','Ankit',NULL,'Jain','jain@gmail.com','1993-02-07');
/*!40000 ALTER TABLE `tbl_userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_userphone`
--

DROP TABLE IF EXISTS `tbl_userphone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_userphone` (
  `userID` varchar(25) NOT NULL,
  `PhoneNumber` varchar(10) DEFAULT NULL,
  `PhoneType` varchar(20) NOT NULL,
  `phoneID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`phoneID`),
  UNIQUE KEY `PhoneNumber` (`PhoneNumber`),
  KEY `userID` (`userID`),
  CONSTRAINT `tbl_userphone_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `tbl_useraccount` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_userphone`
--

LOCK TABLES `tbl_userphone` WRITE;
/*!40000 ALTER TABLE `tbl_userphone` DISABLE KEYS */;
INSERT INTO `tbl_userphone` VALUES ('goelsarthak','123456789','Home',1),('goelsarthak','2113456789','Office',2),('ankit','568956789','Home',3);
/*!40000 ALTER TABLE `tbl_userphone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_userrole`
--

DROP TABLE IF EXISTS `tbl_userrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_userrole` (
  `RoleId` int(11) NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(25) NOT NULL,
  PRIMARY KEY (`RoleId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_userrole`
--

LOCK TABLES `tbl_userrole` WRITE;
/*!40000 ALTER TABLE `tbl_userrole` DISABLE KEYS */;
INSERT INTO `tbl_userrole` VALUES (1,'Customer'),(2,'Supplier'),(3,'Customer'),(4,'Supplier'),(5,'Admin');
/*!40000 ALTER TABLE `tbl_userrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_adminorderhistory`
--

DROP TABLE IF EXISTS `vw_adminorderhistory`;
/*!50001 DROP VIEW IF EXISTS `vw_adminorderhistory`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `vw_adminorderhistory` AS SELECT 
 1 AS `UserID`,
 1 AS `OrderID`,
 1 AS `DatePlaced`,
 1 AS `OrderStatusCode`,
 1 AS `ProductID`,
 1 AS `OrderItemQuantity`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_bestseller`
--

DROP TABLE IF EXISTS `vw_bestseller`;
/*!50001 DROP VIEW IF EXISTS `vw_bestseller`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `vw_bestseller` AS SELECT 
 1 AS `SupplierID`,
 1 AS `ProductID`,
 1 AS `ProductSupplied`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_mostorderedproducts`
--

DROP TABLE IF EXISTS `vw_mostorderedproducts`;
/*!50001 DROP VIEW IF EXISTS `vw_mostorderedproducts`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `vw_mostorderedproducts` AS SELECT 
 1 AS `ProductID`,
 1 AS `TotalItems`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'db_ecomm'
--

--
-- Dumping routines for database 'db_ecomm'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_createOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_createOrder`(In user_nm varchar(25), Out cOrderId int)
BEGIN
	Set @un := user_nm;
    Insert into tbl_CustomerOrders(UserID,DatePlaced,OrderStatusCode) values(@un,NOW(),'P');
    Select OrderID into cOrderId from tbl_customerorders where UserID = @un Order by DatePlaced desc limit 1; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_createUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_createUser`(IN user_nm CHAR(20), IN user_ps CHAR(20), IN RoleId int)
BEGIN
	SET @host_name := 'localhost';
	SET @user_name := user_nm;
	SET @pass := user_ps;
	SET @db_nm:='db_EComm';
    Set @Role_Id := RoleId;
	
    Insert into tbl_UserAccount values(@user_name,@pass, @Role_Id);
    
	SET @sql := CONCAT("CREATE USER ", QUOTE(@user_name), "@", QUOTE(@host_name), " IDENTIFIED BY ", QUOTE(@pass));
	PREPARE stmt FROM @sql;
	EXECUTE stmt;
    
    IF @Role_Id = 1 THEN
		SET @tblName := 'tbl_Product';
        Set @proc := 'sp_getOrderHistory';
        Set @proc1 := 'sp_createOrder';
        Set @proc2 := 'sp_placeOrder';
        SET @proc3 :='sp_viewBillInfo';
        
		SET @GRANT_PERMISSIONS = CONCAT("GRANT ALL  ON ", @db_nm, ".", @tblName," TO ", QUOTE(@user_name), "@",QUOTE(@host_name));
		PREPARE statement FROM @GRANT_PERMISSIONS;
		EXECUTE statement;
        SET @GRANT_PERMISSIONS = CONCAT("GRANT EXECUTE ON PROCEDURE ", @db_nm, ".", @proc," TO ", QUOTE(@user_name), "@",QUOTE(@host_name));
		PREPARE state FROM @GRANT_PERMISSIONS;
		EXECUTE state;
        SET @GRANT_PERMISSIONS = CONCAT("GRANT EXECUTE ON PROCEDURE ", @db_nm, ".", @proc1," TO ", QUOTE(@user_name), "@",QUOTE(@host_name));
		PREPARE state1 FROM @GRANT_PERMISSIONS;
		EXECUTE state1;
        SET @GRANT_PERMISSIONS = CONCAT("GRANT EXECUTE ON PROCEDURE ", @db_nm, ".", @proc2," TO ", QUOTE(@user_name), "@",QUOTE(@host_name));
		PREPARE state2 FROM @GRANT_PERMISSIONS;
		EXECUTE state2;
        SET @GRANT_PERMISSIONS = CONCAT("GRANT EXECUTE ON PROCEDURE ", @db_nm, ".", @proc3," TO ", QUOTE(@user_name), "@",QUOTE(@host_name));
		PREPARE state3 FROM @GRANT_PERMISSIONS;
		EXECUTE state3;
	ElseIf (@Role_Id = 2) THEN
		Set @proc = 'sp_supplyProducts';
        Set @proc1 = 'sp_SupplierHistory ';
        SET @GRANT_PERMISSIONS = CONCAT("GRANT EXECUTE ON PROCEDURE ", @db_nm, ".", @proc," TO ", QUOTE(@user_name), "@",QUOTE(@host_name));
		PREPARE statement FROM @GRANT_PERMISSIONS;
		EXECUTE statement;
        SET @GRANT_PERMISSIONS = CONCAT("GRANT EXECUTE ON PROCEDURE ", @db_nm, ".", @proc1," TO ", QUOTE(@user_name), "@",QUOTE(@host_name));
		PREPARE statement1 FROM @GRANT_PERMISSIONS;
		EXECUTE statement1;
	Else
		SET @GRANT_PERMISSIONS = CONCAT("GRANT ALL  ON ", @db_nm, ".* TO ", QUOTE(@user_name), "@",QUOTE(@host_name));
		PREPARE statement FROM @GRANT_PERMISSIONS;
		EXECUTE statement;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getOrderHistory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getOrderHistory`(In username varchar(30))
BEGIN
	Set @un := username;
	Select co.OrderID, co.DatePlaced, co.OrderStatusCode ,oi.ProductID, oi.OrderItemQuantity
	from tbl_CustomerOrders As co
	INNER JOIN
	tbl_OrderItems As oi
	On co.OrderID = oi.OrderID
	where co.UserID = @un;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getSupplierHistory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getSupplierHistory`(In username varchar(30))
BEGIN
	Set @un := username;
	Select co.OrderID, co.DatePlaced, co.OrderStatusCode ,oi.ProductID, oi.OrderItemQuantity
	from tbl_CustomerOrders As co
	INNER JOIN
	tbl_OrderItems As oi
	On co.OrderID = oi.OrderID
	where co.UserID = @un;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_placeOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_placeOrder`(In order_id int, In ProdID varchar(10),In Quantity int)
BEGIN
	Select @Quant := ProductQuantity from tbl_Product where ProductId = ProdID;
    IF (Quantity < @Quant AND order_id IS NOT NULL) THEN
	Start Transaction;
        Select @Price := ProductPrice from tbl_Product where ProductId = Prodid;
        Insert into tbl_OrderItems values(order_id,ProdID,Quantity,(Quantity*@Price));
        Update tbl_customerorders set OrderStatusCode = "Pr" where OrderId = order_id;
	COMMIT;
    END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_SupplierHistory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_SupplierHistory`(In username varchar(30))
BEGIN
	Set @un := username;
	Select s.DateSupplied, p.ProductName ,s.SuppliedQuantity
	from tbl_SupplierProduct As s
	INNER JOIN
	tbl_Product As p
	On s.ProductId = p.ProductId
	where s.SupplierID = @un;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_supplyProducts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_supplyProducts`(In user_nm varchar(25), In pid varchar(20), In Quantity int)
BEGIN
	Set @un := user_nm;
    Set @quan := Quantity;
    Set @P_ID := pid; 
    IF(pid IS NOT NULL AND Quantity IS NOT NULL) THEN
		Insert into tbl_SupplierProduct(SupplierID, ProductID, SuppliedQuantity,DateSupplied)
        values
        (@un,@P_ID,@quan,Now());
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_viewBillInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_viewBillInfo`(In username varchar(30))
BEGIN
    Select co.OrderId, oi.ProductID, (Select ProductName from tbl_Product As P where P.ProductID = oi.ProductID) as ProductName, oi.OrderItemQuantity, co.DatePlaced, 
    (Select (OrderItemQuantity * ProductPrice) from tbl_Product As p where p.ProductID = oi.ProductID) As Total
    from tbl_CustomerOrders as co 
    INNER JOIN 
    tbl_OrderItems As oi On 
    co.OrderId = oi.OrderID 
    where co.UserID = username;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_adminorderhistory`
--

/*!50001 DROP VIEW IF EXISTS `vw_adminorderhistory`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sysadmin`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_adminorderhistory` AS select `co`.`UserID` AS `UserID`,`co`.`OrderID` AS `OrderID`,`co`.`DatePlaced` AS `DatePlaced`,`co`.`OrderStatusCode` AS `OrderStatusCode`,`oi`.`ProductID` AS `ProductID`,`oi`.`OrderItemQuantity` AS `OrderItemQuantity` from (`tbl_customerorders` `co` join `tbl_orderitems` `oi` on((`co`.`OrderID` = `oi`.`OrderID`))) where `co`.`UserID` in (select `tbl_useraccount`.`userName` from `tbl_useraccount`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_bestseller`
--

/*!50001 DROP VIEW IF EXISTS `vw_bestseller`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sysadmin`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_bestseller` AS select `tbl_supplierproduct`.`SupplierID` AS `SupplierID`,`tbl_supplierproduct`.`ProductID` AS `ProductID`,sum(`tbl_supplierproduct`.`SuppliedQuantity`) AS `ProductSupplied` from `tbl_supplierproduct` group by `tbl_supplierproduct`.`SupplierID`,`tbl_supplierproduct`.`ProductID` with rollup order by `ProductSupplied` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_mostorderedproducts`
--

/*!50001 DROP VIEW IF EXISTS `vw_mostorderedproducts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sysadmin`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_mostorderedproducts` AS select `tbl_orderitems`.`ProductID` AS `ProductID`,sum(`tbl_orderitems`.`OrderItemQuantity`) AS `TotalItems` from `tbl_orderitems` group by `tbl_orderitems`.`ProductID` order by `TotalItems` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-13  6:26:30
