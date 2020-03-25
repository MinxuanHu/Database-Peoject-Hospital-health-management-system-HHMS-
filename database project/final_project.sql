-- MySQL dump 10.13  Distrib 8.0.13, for macos10.14 (x86_64)
--
-- Host: 127.0.0.1    Database: project_final
-- ------------------------------------------------------
-- Server version	8.0.13

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
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bill` (
  `billId` int(11) NOT NULL,
  `billDate` varchar(45) DEFAULT NULL,
  `patientId` int(11) DEFAULT NULL,
  `TestFee` int(11) DEFAULT NULL,
  `injectionId` int(11) DEFAULT NULL,
  `diagnosisId` int(11) DEFAULT NULL,
  `medicineId` int(11) DEFAULT NULL,
  PRIMARY KEY (`billId`),
  KEY `fk_bill_patient` (`patientId`),
  KEY `fk_bill_injection` (`injectionId`),
  KEY `fk_bill_dia` (`diagnosisId`),
  KEY `fk_bill_med` (`medicineId`),
  CONSTRAINT `fk_bill_dia` FOREIGN KEY (`diagnosisId`) REFERENCES `diagnosis` (`diagnosisid`),
  CONSTRAINT `fk_bill_injection` FOREIGN KEY (`injectionId`) REFERENCES `injection` (`injectionid`),
  CONSTRAINT `fk_bill_med` FOREIGN KEY (`medicineId`) REFERENCES `medicine` (`medicineid`),
  CONSTRAINT `fk_bill_patient` FOREIGN KEY (`patientId`) REFERENCES `patient` (`patientid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (1,'2016-12-12',1,100,1,1,1),(2,'2015-09-09',2,100,2,3,2),(3,'2015-01-13',3,100,3,2,3),(4,'2015-11-07',4,100,4,5,4),(5,'2015-12-02',5,100,5,4,5);
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bloodtest`
--

DROP TABLE IF EXISTS `bloodtest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bloodtest` (
  `bloodtestId` int(11) NOT NULL,
  `bloodtestDate` varchar(45) DEFAULT NULL,
  `HIV` varchar(45) DEFAULT NULL,
  `ESR` varchar(45) DEFAULT NULL,
  `prescriptionId` int(11) DEFAULT NULL,
  PRIMARY KEY (`bloodtestId`),
  KEY `fk_blood_presc` (`prescriptionId`),
  CONSTRAINT `fk_blood_presc` FOREIGN KEY (`prescriptionId`) REFERENCES `prescription` (`prescriptionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bloodtest`
--

LOCK TABLES `bloodtest` WRITE;
/*!40000 ALTER TABLE `bloodtest` DISABLE KEYS */;
INSERT INTO `bloodtest` VALUES (1,'2013-04-05','negative','positiver',1),(2,'2013-04-05','possitive','positive',2),(3,'2014-05-06','positive','negative',3),(4,'2013-06-25','negative','negative',4),(5,'2013-05-05','negative','positive',5);
/*!40000 ALTER TABLE `bloodtest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colonoscopytest`
--

DROP TABLE IF EXISTS `colonoscopytest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `colonoscopytest` (
  `colonoscopytestId` int(11) NOT NULL,
  `colonoscopytestDate` varchar(45) DEFAULT NULL,
  `ANAL` int(11) DEFAULT NULL,
  `ECTUM` int(11) DEFAULT NULL,
  `prescriptionId` int(11) DEFAULT NULL,
  PRIMARY KEY (`colonoscopytestId`),
  KEY `fk_c_presc` (`prescriptionId`),
  CONSTRAINT `fk_c_presc` FOREIGN KEY (`prescriptionId`) REFERENCES `prescription` (`prescriptionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colonoscopytest`
--

LOCK TABLES `colonoscopytest` WRITE;
/*!40000 ALTER TABLE `colonoscopytest` DISABLE KEYS */;
INSERT INTO `colonoscopytest` VALUES (1,'2012-06-05',3,4,1),(2,'2014-12-12',4,6,2),(3,'2016-01-18',7,4,3),(4,'2014-06-25',8,4,4),(5,'2013-05-05',7,2,5);
/*!40000 ALTER TABLE `colonoscopytest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnosis`
--

DROP TABLE IF EXISTS `diagnosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `diagnosis` (
  `diagnosisId` int(11) NOT NULL,
  `diagnosisFinal` varchar(45) DEFAULT NULL,
  `bloodtestId` int(11) DEFAULT NULL,
  `urinetestId` int(11) DEFAULT NULL,
  `x_raytestId` int(11) DEFAULT NULL,
  `gastroscopytestId` int(11) DEFAULT NULL,
  `colonoscopytestId` int(11) DEFAULT NULL,
  `sonographytestId` int(11) DEFAULT NULL,
  `dietadviceId` int(11) DEFAULT NULL,
  `diagnosisFee` int(11) DEFAULT NULL,
  PRIMARY KEY (`diagnosisId`),
  KEY `fk_d_blood` (`bloodtestId`),
  KEY `fk_d_x` (`x_raytestId`),
  KEY `fk_d_c` (`colonoscopytestId`),
  KEY `fk_d_s` (`sonographytestId`),
  KEY `fk_d_g` (`gastroscopytestId`),
  KEY `fk_d_u` (`urinetestId`),
  KEY `fk_d_diet` (`dietadviceId`),
  CONSTRAINT `fk_d_blood` FOREIGN KEY (`bloodtestId`) REFERENCES `bloodtest` (`bloodtestid`),
  CONSTRAINT `fk_d_c` FOREIGN KEY (`colonoscopytestId`) REFERENCES `colonoscopytest` (`colonoscopytestid`),
  CONSTRAINT `fk_d_diet` FOREIGN KEY (`dietadviceId`) REFERENCES `dietadvice` (`dietadviceid`),
  CONSTRAINT `fk_d_g` FOREIGN KEY (`gastroscopytestId`) REFERENCES `gastroscopytest` (`gastroscopytestid`),
  CONSTRAINT `fk_d_s` FOREIGN KEY (`sonographytestId`) REFERENCES `sonographytest` (`sonographytestid`),
  CONSTRAINT `fk_d_u` FOREIGN KEY (`urinetestId`) REFERENCES `urinetest` (`urinetestid`),
  CONSTRAINT `fk_d_x` FOREIGN KEY (`x_raytestId`) REFERENCES `x_raytest` (`x_raytestid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnosis`
--

LOCK TABLES `diagnosis` WRITE;
/*!40000 ALTER TABLE `diagnosis` DISABLE KEYS */;
INSERT INTO `diagnosis` VALUES (1,'some cure',1,1,1,1,1,1,1,100),(2,'more cure',2,4,3,2,2,2,3,300),(3,'2some cure',3,5,2,3,3,3,2,200),(4,'some cure',5,2,4,4,4,4,4,340),(5,'more cure',4,3,5,5,5,5,5,100);
/*!40000 ALTER TABLE `diagnosis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dietadvice`
--

DROP TABLE IF EXISTS `dietadvice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dietadvice` (
  `dietadviceId` int(11) NOT NULL,
  `dietadviceContent` varchar(45) DEFAULT NULL,
  `prescriptionId` int(11) DEFAULT NULL,
  PRIMARY KEY (`dietadviceId`),
  KEY `fk_prescription_diet` (`prescriptionId`),
  CONSTRAINT `fk_prescription_diet` FOREIGN KEY (`prescriptionId`) REFERENCES `prescription` (`prescriptionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dietadvice`
--

LOCK TABLES `dietadvice` WRITE;
/*!40000 ALTER TABLE `dietadvice` DISABLE KEYS */;
INSERT INTO `dietadvice` VALUES (1,'more seafood',1),(2,'more vegetable',2),(3,'more meat',3),(4,'less seafood',4),(5,'less meat',5);
/*!40000 ALTER TABLE `dietadvice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `doctor` (
  `doctorId` int(11) NOT NULL,
  `doctorName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`doctorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,'rr'),(2,'gg'),(3,'fg'),(4,'dd'),(5,'fr');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gastroscopytest`
--

DROP TABLE IF EXISTS `gastroscopytest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gastroscopytest` (
  `gastroscopytestId` int(11) NOT NULL,
  `gastroscopytestDate` varchar(45) DEFAULT NULL,
  `CORPUS` varchar(45) DEFAULT NULL,
  `FUNDWS` varchar(45) DEFAULT NULL,
  `prescriptionId` int(11) DEFAULT NULL,
  PRIMARY KEY (`gastroscopytestId`),
  KEY `fk_g_presc` (`prescriptionId`),
  CONSTRAINT `fk_g_presc` FOREIGN KEY (`prescriptionId`) REFERENCES `prescription` (`prescriptionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gastroscopytest`
--

LOCK TABLES `gastroscopytest` WRITE;
/*!40000 ALTER TABLE `gastroscopytest` DISABLE KEYS */;
INSERT INTO `gastroscopytest` VALUES (1,'2012-06-05','2','4',1),(2,'2013-12-12','3','6',2),(3,'2016-06-18','7','5',3),(4,'2014-06-25','8','4',4),(5,'2013-07-05','7','2',5);
/*!40000 ALTER TABLE `gastroscopytest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `injection`
--

DROP TABLE IF EXISTS `injection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `injection` (
  `injectionId` int(11) NOT NULL,
  `injectionDate` varchar(45) DEFAULT NULL,
  `prescriptionId` int(11) DEFAULT NULL,
  `injectionFee` int(11) DEFAULT NULL,
  PRIMARY KEY (`injectionId`),
  KEY `fk_prescription_inje` (`prescriptionId`),
  CONSTRAINT `fk_prescription_inje` FOREIGN KEY (`prescriptionId`) REFERENCES `prescription` (`prescriptionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `injection`
--

LOCK TABLES `injection` WRITE;
/*!40000 ALTER TABLE `injection` DISABLE KEYS */;
INSERT INTO `injection` VALUES (1,'2015-12-12',1,20),(2,'2015-09-09',2,20),(3,'2016-08-08',3,30),(4,'2015-11-07',4,20),(5,'2015-12-02',5,30);
/*!40000 ALTER TABLE `injection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicine`
--

DROP TABLE IF EXISTS `medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `medicine` (
  `medicineId` int(11) NOT NULL,
  `medicineName` varchar(45) DEFAULT NULL,
  `prescriptionId` int(11) DEFAULT NULL,
  `medicineFee` int(11) DEFAULT NULL,
  PRIMARY KEY (`medicineId`),
  KEY `fk_prescription_medi` (`prescriptionId`),
  CONSTRAINT `fk_prescription_medi` FOREIGN KEY (`prescriptionId`) REFERENCES `prescription` (`prescriptionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine`
--

LOCK TABLES `medicine` WRITE;
/*!40000 ALTER TABLE `medicine` DISABLE KEYS */;
INSERT INTO `medicine` VALUES (1,'fre',1,200),(2,'gtr',2,40),(3,'bhu',3,50),(4,'lkkm',4,100),(5,'lppi',5,130);
/*!40000 ALTER TABLE `medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `patient` (
  `patientId` int(11) NOT NULL,
  `patientName` varchar(45) DEFAULT NULL,
  `patientAge` int(11) DEFAULT NULL,
  `patientGender` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`patientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'w',22,'f'),(2,'e',23,'m'),(3,'r',44,'f'),(4,'t',12,'m'),(5,'g',18,'f');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_staffnurse`
--

DROP TABLE IF EXISTS `patient_staffnurse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `patient_staffnurse` (
  `patient_staffnursed` int(11) NOT NULL,
  `patientId` int(11) DEFAULT NULL,
  `staffId` int(11) DEFAULT NULL,
  PRIMARY KEY (`patient_staffnursed`),
  KEY `fk_staff_` (`staffId`),
  KEY `fk_patient` (`patientId`),
  CONSTRAINT `fk_patient` FOREIGN KEY (`patientId`) REFERENCES `patient` (`patientid`),
  CONSTRAINT `fk_staff_` FOREIGN KEY (`staffId`) REFERENCES `staff_nurse` (`staff_nurseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_staffnurse`
--

LOCK TABLES `patient_staffnurse` WRITE;
/*!40000 ALTER TABLE `patient_staffnurse` DISABLE KEYS */;
INSERT INTO `patient_staffnurse` VALUES (1,1,1),(2,2,3),(3,3,2),(4,4,4),(5,5,5);
/*!40000 ALTER TABLE `patient_staffnurse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `prescription` (
  `prescriptionId` int(11) NOT NULL,
  `doctorId` int(11) DEFAULT NULL,
  `patientId` int(11) DEFAULT NULL,
  PRIMARY KEY (`prescriptionId`),
  KEY `fk_prescription_pat` (`patientId`),
  KEY `fk_prescription_doc` (`doctorId`),
  CONSTRAINT `fk_prescription_doc` FOREIGN KEY (`doctorId`) REFERENCES `doctor` (`doctorid`),
  CONSTRAINT `fk_prescription_pat` FOREIGN KEY (`patientId`) REFERENCES `patient` (`patientid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
INSERT INTO `prescription` VALUES (1,2,2),(2,1,1),(3,4,4),(4,5,1),(5,1,5);
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sonographytest`
--

DROP TABLE IF EXISTS `sonographytest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sonographytest` (
  `sonographytestId` int(11) NOT NULL,
  `sonographytestDate` varchar(45) DEFAULT NULL,
  `PV` int(11) DEFAULT NULL,
  `L_SIZE` int(11) DEFAULT NULL,
  `prescriptionId` int(11) DEFAULT NULL,
  PRIMARY KEY (`sonographytestId`),
  KEY `fk_s_presc` (`prescriptionId`),
  CONSTRAINT `fk_s_presc` FOREIGN KEY (`prescriptionId`) REFERENCES `prescription` (`prescriptionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sonographytest`
--

LOCK TABLES `sonographytest` WRITE;
/*!40000 ALTER TABLE `sonographytest` DISABLE KEYS */;
INSERT INTO `sonographytest` VALUES (1,'2012-11-05',7,4,1),(2,'2013-10-12',4,6,2),(3,'2016-11-18',7,4,3),(4,'2014-06-25',6,4,4),(5,'2013-04-05',7,2,5);
/*!40000 ALTER TABLE `sonographytest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_Info`
--

DROP TABLE IF EXISTS `staff_Info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `staff_Info` (
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `fullname` varchar(45) DEFAULT NULL,
  `staffId` int(11) DEFAULT NULL,
  PRIMARY KEY (`firstname`),
  KEY `fk_staff_info` (`staffId`),
  CONSTRAINT `fk_staff_info` FOREIGN KEY (`staffId`) REFERENCES `staff_nurse` (`staff_nurseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_Info`
--

LOCK TABLES `staff_Info` WRITE;
/*!40000 ALTER TABLE `staff_Info` DISABLE KEYS */;
INSERT INTO `staff_Info` VALUES ('hhh','rrr','hhhrrr',1);
/*!40000 ALTER TABLE `staff_Info` ENABLE KEYS */;
UNLOCK TABLES;
--
-- WARNING: old server version. The following dump may be incomplete.
--
DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `ahead_insert` BEFORE INSERT ON `staff_Info` FOR EACH ROW BEGIN 
set new.fullname=concat(new.firstname,'',new.lastname);
END */;;
DELIMITER ;
--
-- WARNING: old server version. The following dump may be incomplete.
--
DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `ahead_update` BEFORE UPDATE ON `staff_Info` FOR EACH ROW BEGIN 
set new.fullname=concat(new.firstname,'',new.lastname);
END */;;
DELIMITER ;

--
-- Table structure for table `staff_nurse`
--

DROP TABLE IF EXISTS `staff_nurse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `staff_nurse` (
  `staff_nurseId` int(11) NOT NULL,
  PRIMARY KEY (`staff_nurseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_nurse`
--

LOCK TABLES `staff_nurse` WRITE;
/*!40000 ALTER TABLE `staff_nurse` DISABLE KEYS */;
INSERT INTO `staff_nurse` VALUES (1),(2),(3),(4),(5);
/*!40000 ALTER TABLE `staff_nurse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `urinetest`
--

DROP TABLE IF EXISTS `urinetest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `urinetest` (
  `urinetestId` int(11) NOT NULL,
  `urinetestDate` varchar(45) DEFAULT NULL,
  `SUGAR` varchar(45) DEFAULT NULL,
  `ALBUM` varchar(45) DEFAULT NULL,
  `prescriptionId` int(11) DEFAULT NULL,
  PRIMARY KEY (`urinetestId`),
  KEY `fk_u_presc` (`prescriptionId`),
  CONSTRAINT `fk_u_presc` FOREIGN KEY (`prescriptionId`) REFERENCES `prescription` (`prescriptionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `urinetest`
--

LOCK TABLES `urinetest` WRITE;
/*!40000 ALTER TABLE `urinetest` DISABLE KEYS */;
INSERT INTO `urinetest` VALUES (1,'2013-06-05','regular','high',1),(2,'2013-12-05','high','low',2),(3,'2016-01-06','regulaer','regular',3),(4,'2014-06-25','high','regular',4),(5,'2014-05-05','low','regular',5);
/*!40000 ALTER TABLE `urinetest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view1`
--

DROP TABLE IF EXISTS `view1`;
/*!50001 DROP VIEW IF EXISTS `view1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `view1` AS SELECT 
 1 AS `patientId`,
 1 AS `patientName`,
 1 AS `patientAge`,
 1 AS `totalAge`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view2`
--

DROP TABLE IF EXISTS `view2`;
/*!50001 DROP VIEW IF EXISTS `view2`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `view2` AS SELECT 
 1 AS `patientName`,
 1 AS `injectionDate`,
 1 AS `injectionFee`,
 1 AS `billId`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view3`
--

DROP TABLE IF EXISTS `view3`;
/*!50001 DROP VIEW IF EXISTS `view3`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `view3` AS SELECT 
 1 AS `doctorId`,
 1 AS `DoctorName`,
 1 AS `DietAdviceContent`,
 1 AS `patientId`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `x_raytest`
--

DROP TABLE IF EXISTS `x_raytest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `x_raytest` (
  `x_raytestId` int(11) NOT NULL,
  `x_raytestDate` varchar(45) DEFAULT NULL,
  `x_raytestName` varchar(45) DEFAULT NULL,
  `prescriptionId` int(11) DEFAULT NULL,
  PRIMARY KEY (`x_raytestId`),
  KEY `fk_x_presc` (`prescriptionId`),
  CONSTRAINT `fk_x_presc` FOREIGN KEY (`prescriptionId`) REFERENCES `prescription` (`prescriptionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `x_raytest`
--

LOCK TABLES `x_raytest` WRITE;
/*!40000 ALTER TABLE `x_raytest` DISABLE KEYS */;
INSERT INTO `x_raytest` VALUES (1,'2013-04-05','www',1),(2,'2013-04-05','eee',2),(3,'2014-05-06','ttt',3),(4,'2013-06-25','mmm',4),(5,'2013-05-05','ttt',5);
/*!40000 ALTER TABLE `x_raytest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'project_final'
--

--
-- Dumping routines for database 'project_final'
--
/*!50003 DROP PROCEDURE IF EXISTS `patient_bill_dietadvice_medicine_result` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `patient_bill_dietadvice_medicine_result`(IN patient1 int, in  patient2 int)
BEGIN
declare FirstPatient int;    
declare SecondPatient  int;
set FirstPatient = patient1;    
set SecondPatient = patient2;	

select prescription.patientId,patient.patientAge,patient.patientGender,
bill.medicineId,medicine.medicineFee,medicine.medicineName,
prescription.prescriptionId,DietAdvice.DietAdviceContent
from patient inner join bill inner join medicine inner join dietAdvice inner join prescription
on bill.patientId=patient.patientId
and bill.medicineId=medicine.medicineId
and prescription.prescriptionId=patient.patientId
and prescription.prescriptionId=DietAdvice.prescriptionId
and patient.patientId in (FirstPatient,SecondPatient); 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `patient_bloodtest_urinetest_result` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `patient_bloodtest_urinetest_result`(IN patient1 int, in  patient2 int)
BEGIN
declare FirstPatient int;    
declare SecondPatient  int;
set FirstPatient = patient1;    
set SecondPatient = patient2;	

select prescription.patientId,patient.patientAge,patient.patientGender,
bloodtest.bloodtestId,bloodtest.bloodtestDate,bloodtest.HIV,bloodtest.ESR,
urinetest.urinetestid,urinetest.urinetestDate,urinetest.Sugar,urinetest.Album

from patient inner join prescription inner join bloodtest inner join urinetest
on patient.patientId=prescription.patientId
and prescription.prescriptionId=bloodtest.prescriptionId
and prescription.prescriptionId=urinetest.prescriptionId
and patient.patientId in (FirstPatient,SecondPatient); 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `patient_injectionDate_yearConstraint` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `patient_injectionDate_yearConstraint`(IN year1 int, in year2 int,in year3 int)
BEGIN
declare FirstYear int;    
declare SecondYear int; 
declare thirdYear int; 
set FirstYear = year1;    
set SecondYear = year2;	
set ThirdYear = year3;	
select patient.patientId,patient.patientName, patient.patientGender,injection.injectionId,injection.injectionFee,injection.injectionDate,bill.billId
from patient inner join injection inner join bill
on bill.injectionId=injection.injectionId and patient.patientId=bill.patientId
and year(injection.injectionDate) not in (FirstYear,SecondYear,ThirdYear);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `view1`
--

/*!50001 DROP VIEW IF EXISTS `view1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view1` AS select `patient`.`patientId` AS `patientId`,`patient`.`patientName` AS `patientName`,`patient`.`patientAge` AS `patientAge`,(select count(`patient`.`patientAge`) from `patient`) AS `totalAge` from (`patient` join `staff_nurse` on(((`patient`.`patientId` = `staff_nurse`.`staff_nurseId`) and (`staff_nurse`.`staff_nurseId` < 4)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view2`
--

/*!50001 DROP VIEW IF EXISTS `view2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view2` AS select `patient`.`patientName` AS `patientName`,`injection`.`injectionDate` AS `injectionDate`,`injection`.`injectionFee` AS `injectionFee`,`bill`.`billId` AS `billId` from ((`patient` join `bill`) join `injection` on(((`injection`.`injectionId` = `bill`.`injectionId`) and (`bill`.`patientId` = `patient`.`patientId`) and year(`injection`.`injectionDate`) in (select `bill`.`billDate` from `bill`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view3`
--

/*!50001 DROP VIEW IF EXISTS `view3`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view3` AS select `prescription`.`doctorId` AS `doctorId`,`doctor`.`doctorName` AS `DoctorName`,`dietadvice`.`dietadviceContent` AS `DietAdviceContent`,`prescription`.`patientId` AS `patientId` from ((`doctor` join `dietadvice`) join `prescription`) where exists(select 1 from `prescription` where ((`prescription`.`patientId` > 1) and exists(select 1 from `dietadvice` where ((`dietadvice`.`prescriptionId` = `prescription`.`prescriptionId`) and (`dietadvice`.`dietadviceContent` < 5))))) */;
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

-- Dump completed on 2018-12-13  7:38:59
