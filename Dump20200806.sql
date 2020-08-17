-- MySQL dump 10.13  Distrib 8.0.21, for macos10.15 (x86_64)
--
-- Host: 3.135.221.153    Database: doctor
-- ------------------------------------------------------
-- Server version	5.7.31-0ubuntu0.18.04.1

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
-- Table structure for table `Affiliated_With`
--

DROP TABLE IF EXISTS `Affiliated_With`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Affiliated_With` (
  `Physician` int(11) NOT NULL,
  `Department` int(11) NOT NULL,
  `PrimaryAffiliation` tinyint(1) NOT NULL,
  PRIMARY KEY (`Physician`,`Department`),
  KEY `fk_Affiliated_With_Department_DepartmentID` (`Department`),
  CONSTRAINT `fk_Affiliated_With_Department_DepartmentID` FOREIGN KEY (`Department`) REFERENCES `Department` (`DepartmentID`),
  CONSTRAINT `fk_Affiliated_With_Physician_EmployeeID` FOREIGN KEY (`Physician`) REFERENCES `Physician` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Affiliated_With`
--

LOCK TABLES `Affiliated_With` WRITE;
/*!40000 ALTER TABLE `Affiliated_With` DISABLE KEYS */;
INSERT INTO `Affiliated_With` VALUES (1,1,1),(2,1,1),(3,1,0),(3,2,1),(4,1,1),(5,1,1),(6,2,1),(7,1,0),(7,2,1),(8,1,1),(9,3,1);
/*!40000 ALTER TABLE `Affiliated_With` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Appointment`
--

DROP TABLE IF EXISTS `Appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Appointment` (
  `AppointmentID` int(11) NOT NULL,
  `Patient` int(11) NOT NULL,
  `PrepNurse` int(11) DEFAULT NULL,
  `Physician` int(11) NOT NULL,
  `Start` datetime NOT NULL,
  `End` datetime NOT NULL,
  `ExaminationRoom` text NOT NULL,
  PRIMARY KEY (`AppointmentID`),
  KEY `fk_Appointment_Patient_SSN` (`Patient`),
  KEY `fk_Appointment_Nurse_EmployeeID` (`PrepNurse`),
  KEY `fk_Appointment_Physician_EmployeeID` (`Physician`),
  CONSTRAINT `fk_Appointment_Nurse_EmployeeID` FOREIGN KEY (`PrepNurse`) REFERENCES `Nurse` (`EmployeeID`),
  CONSTRAINT `fk_Appointment_Patient_SSN` FOREIGN KEY (`Patient`) REFERENCES `Patient` (`SSN`),
  CONSTRAINT `fk_Appointment_Physician_EmployeeID` FOREIGN KEY (`Physician`) REFERENCES `Physician` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Appointment`
--

LOCK TABLES `Appointment` WRITE;
/*!40000 ALTER TABLE `Appointment` DISABLE KEYS */;
INSERT INTO `Appointment` VALUES (13216584,100000001,101,1,'2008-04-24 10:00:00','2008-04-24 11:00:00','A'),(26548913,100000002,101,2,'2008-04-24 10:00:00','2008-04-24 11:00:00','B'),(36549879,100000001,102,1,'2008-04-25 10:00:00','2008-04-25 11:00:00','A'),(46846589,100000004,103,4,'2008-04-25 10:00:00','2008-04-25 11:00:00','B'),(59871321,100000004,NULL,4,'2008-04-26 10:00:00','2008-04-26 11:00:00','C'),(69879231,100000003,103,2,'2008-04-26 11:00:00','2008-04-26 12:00:00','C'),(76983231,100000001,NULL,3,'2008-04-26 12:00:00','2008-04-26 13:00:00','C'),(86213939,100000004,102,9,'2008-04-27 10:00:00','2008-04-21 11:00:00','A'),(93216548,100000002,101,2,'2008-04-27 10:00:00','2008-04-27 11:00:00','B');
/*!40000 ALTER TABLE `Appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Block`
--

DROP TABLE IF EXISTS `Block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Block` (
  `BlockFloor` int(11) NOT NULL,
  `BlockCode` int(11) NOT NULL,
  PRIMARY KEY (`BlockFloor`,`BlockCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Block`
--

LOCK TABLES `Block` WRITE;
/*!40000 ALTER TABLE `Block` DISABLE KEYS */;
INSERT INTO `Block` VALUES (1,1),(1,2),(1,3),(2,1),(2,2),(2,3),(3,1),(3,2),(3,3),(4,1),(4,2),(4,3);
/*!40000 ALTER TABLE `Block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Department`
--

DROP TABLE IF EXISTS `Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Department` (
  `DepartmentID` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Head` int(11) NOT NULL,
  PRIMARY KEY (`DepartmentID`),
  KEY `fk_Department_Physician_EmployeeID` (`Head`),
  CONSTRAINT `fk_Department_Physician_EmployeeID` FOREIGN KEY (`Head`) REFERENCES `Physician` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Department`
--

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department` DISABLE KEYS */;
INSERT INTO `Department` VALUES (1,'General Medicine',4),(2,'Surgery',7),(3,'Psychiatry',9);
/*!40000 ALTER TABLE `Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Medication`
--

DROP TABLE IF EXISTS `Medication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Medication` (
  `Code` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Brand` varchar(30) NOT NULL,
  `Description` varchar(30) NOT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Medication`
--

LOCK TABLES `Medication` WRITE;
/*!40000 ALTER TABLE `Medication` DISABLE KEYS */;
INSERT INTO `Medication` VALUES (1,'Procrastin-X','X','N/A'),(2,'Thesisin','Foo Labs','N/A'),(3,'Awakin','Bar Laboratories','N/A'),(4,'Crescavitin','Baz Industries','N/A'),(5,'Melioraurin','Snafu Pharmaceuticals','N/A');
/*!40000 ALTER TABLE `Medication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Nurse`
--

DROP TABLE IF EXISTS `Nurse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Nurse` (
  `EmployeeID` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Position` varchar(30) NOT NULL,
  `Registered` tinyint(1) NOT NULL,
  `SSN` int(11) NOT NULL,
  PRIMARY KEY (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Nurse`
--

LOCK TABLES `Nurse` WRITE;
/*!40000 ALTER TABLE `Nurse` DISABLE KEYS */;
INSERT INTO `Nurse` VALUES (101,'Carla Espinosa','Head Nurse',1,111111110),(102,'Laverne Roberts','Nurse',1,222222220),(103,'Paul Flowers','Nurse',0,333333330);
/*!40000 ALTER TABLE `Nurse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `On_Call`
--

DROP TABLE IF EXISTS `On_Call`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `On_Call` (
  `Nurse` int(11) NOT NULL,
  `BlockFloor` int(11) NOT NULL,
  `BlockCode` int(11) NOT NULL,
  `OnCallStart` datetime NOT NULL,
  `OnCallEnd` datetime NOT NULL,
  PRIMARY KEY (`Nurse`,`BlockFloor`,`BlockCode`,`OnCallStart`,`OnCallEnd`),
  KEY `fk_OnCall_Block_Floor` (`BlockFloor`,`BlockCode`),
  CONSTRAINT `fk_OnCall_Block_Floor` FOREIGN KEY (`BlockFloor`, `BlockCode`) REFERENCES `Block` (`BlockFloor`, `BlockCode`),
  CONSTRAINT `fk_OnCall_Nurse_EmployeeID` FOREIGN KEY (`Nurse`) REFERENCES `Nurse` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `On_Call`
--

LOCK TABLES `On_Call` WRITE;
/*!40000 ALTER TABLE `On_Call` DISABLE KEYS */;
INSERT INTO `On_Call` VALUES (101,1,1,'2008-11-04 11:00:00','2008-11-04 19:00:00'),(103,1,1,'2008-11-04 19:00:00','2008-11-05 03:00:00'),(101,1,2,'2008-11-04 11:00:00','2008-11-04 19:00:00'),(103,1,2,'2008-11-04 19:00:00','2008-11-05 03:00:00'),(102,1,3,'2008-11-04 11:00:00','2008-11-04 19:00:00'),(103,1,3,'2008-11-04 19:00:00','2008-11-05 03:00:00');
/*!40000 ALTER TABLE `On_Call` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patient`
--

DROP TABLE IF EXISTS `Patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Patient` (
  `SSN` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Address` varchar(30) NOT NULL,
  `Phone` varchar(30) NOT NULL,
  `InsuranceID` int(11) NOT NULL,
  `PCP` int(11) NOT NULL,
  PRIMARY KEY (`SSN`),
  KEY `fk_Patient_Physician_EmployeeID` (`PCP`),
  CONSTRAINT `fk_Patient_Physician_EmployeeID` FOREIGN KEY (`PCP`) REFERENCES `Physician` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patient`
--

LOCK TABLES `Patient` WRITE;
/*!40000 ALTER TABLE `Patient` DISABLE KEYS */;
INSERT INTO `Patient` VALUES (100000001,'John Smith','42 Foobar Lane','555-0256',68476213,1),(100000002,'Grace Ritchie','37 Snafu Drive','555-0512',36546321,2),(100000003,'Random J. Patient','101 Omgbbq Street','555-1204',65465421,2),(100000004,'Dennis Doe','1100 Foobaz Avenue','555-2048',68421879,3);
/*!40000 ALTER TABLE `Patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Physician`
--

DROP TABLE IF EXISTS `Physician`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Physician` (
  `EmployeeID` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Position` varchar(30) NOT NULL,
  `SSN` int(11) NOT NULL,
  PRIMARY KEY (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Physician`
--

LOCK TABLES `Physician` WRITE;
/*!40000 ALTER TABLE `Physician` DISABLE KEYS */;
INSERT INTO `Physician` VALUES (1,'John Dorian','Staff Internist',111111111),(2,'Elliot Reid','Attending Physician',222222222),(3,'Christopher Turk','Surgical Attending Physician',333333333),(4,'Percival Cox','Senior Attending Physician',444444444),(5,'Bob Kelso','Head Chief of Medicine',555555555),(6,'Todd Quinlan','Surgical Attending Physician',666666666),(7,'John Wen','Surgical Attending Physician',777777777),(8,'Keith Dudemeister','MD Resident',888888888),(9,'Molly Clock','Attending Psychiatrist',999999999);
/*!40000 ALTER TABLE `Physician` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Prescribes`
--

DROP TABLE IF EXISTS `Prescribes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Prescribes` (
  `Physician` int(11) NOT NULL,
  `Patient` int(11) NOT NULL,
  `Medication` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `Appointment` int(11) DEFAULT NULL,
  `Dose` varchar(30) NOT NULL,
  PRIMARY KEY (`Physician`,`Patient`,`Medication`,`Date`),
  KEY `fk_Prescribes_Patient_SSN` (`Patient`),
  KEY `fk_Prescribes_Medication_Code` (`Medication`),
  KEY `fk_Prescribes_Appointment_AppointmentID` (`Appointment`),
  CONSTRAINT `fk_Prescribes_Appointment_AppointmentID` FOREIGN KEY (`Appointment`) REFERENCES `Appointment` (`AppointmentID`),
  CONSTRAINT `fk_Prescribes_Medication_Code` FOREIGN KEY (`Medication`) REFERENCES `Medication` (`Code`),
  CONSTRAINT `fk_Prescribes_Patient_SSN` FOREIGN KEY (`Patient`) REFERENCES `Patient` (`SSN`),
  CONSTRAINT `fk_Prescribes_Physician_EmployeeID` FOREIGN KEY (`Physician`) REFERENCES `Physician` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prescribes`
--

LOCK TABLES `Prescribes` WRITE;
/*!40000 ALTER TABLE `Prescribes` DISABLE KEYS */;
INSERT INTO `Prescribes` VALUES (1,100000001,1,'2008-04-24 10:47:00',13216584,'5'),(9,100000004,2,'2008-04-27 10:53:00',86213939,'10'),(9,100000004,2,'2008-04-30 16:53:00',NULL,'5');
/*!40000 ALTER TABLE `Prescribes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Procedures`
--

DROP TABLE IF EXISTS `Procedures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Procedures` (
  `Code` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Cost` double NOT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Procedures`
--

LOCK TABLES `Procedures` WRITE;
/*!40000 ALTER TABLE `Procedures` DISABLE KEYS */;
INSERT INTO `Procedures` VALUES (1,'Reverse Rhinopodoplasty',1500),(2,'Obtuse Pyloric Recombobulation',3750),(3,'Folded Demiophtalmectomy',4500),(4,'Complete Walletectomy',10000),(5,'Obfuscated Dermogastrotomy',4899),(6,'Reversible Pancreomyoplasty',5600),(7,'Follicular Demiectomy',25);
/*!40000 ALTER TABLE `Procedures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Room`
--

DROP TABLE IF EXISTS `Room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Room` (
  `RoomNumber` int(11) NOT NULL,
  `RoomType` varchar(30) NOT NULL,
  `BlockFloor` int(11) NOT NULL,
  `BlockCode` int(11) NOT NULL,
  `Unavailable` tinyint(1) NOT NULL,
  PRIMARY KEY (`RoomNumber`),
  KEY `fk_Room_Block_PK` (`BlockFloor`,`BlockCode`),
  CONSTRAINT `fk_Room_Block_PK` FOREIGN KEY (`BlockFloor`, `BlockCode`) REFERENCES `Block` (`BlockFloor`, `BlockCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Room`
--

LOCK TABLES `Room` WRITE;
/*!40000 ALTER TABLE `Room` DISABLE KEYS */;
INSERT INTO `Room` VALUES (101,'Single',1,1,0),(102,'Single',1,1,0),(103,'Single',1,1,0),(111,'Single',1,2,0),(112,'Single',1,2,1),(113,'Single',1,2,0),(121,'Single',1,3,0),(122,'Single',1,3,0),(123,'Single',1,3,0),(201,'Single',2,1,1),(202,'Single',2,1,0),(203,'Single',2,1,0),(211,'Single',2,2,0),(212,'Single',2,2,0),(213,'Single',2,2,1),(221,'Single',2,3,0),(222,'Single',2,3,0),(223,'Single',2,3,0),(301,'Single',3,1,0),(302,'Single',3,1,1),(303,'Single',3,1,0),(311,'Single',3,2,0),(312,'Single',3,2,0),(313,'Single',3,2,0),(321,'Single',3,3,1),(322,'Single',3,3,0),(323,'Single',3,3,0),(401,'Single',4,1,0),(402,'Single',4,1,1),(403,'Single',4,1,0),(411,'Single',4,2,0),(412,'Single',4,2,0),(413,'Single',4,2,0),(421,'Single',4,3,1),(422,'Single',4,3,0),(423,'Single',4,3,0);
/*!40000 ALTER TABLE `Room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Stay`
--

DROP TABLE IF EXISTS `Stay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Stay` (
  `StayID` int(11) NOT NULL,
  `Patient` int(11) NOT NULL,
  `Room` int(11) NOT NULL,
  `StayStart` datetime NOT NULL,
  `StayEnd` datetime NOT NULL,
  PRIMARY KEY (`StayID`),
  KEY `fk_Stay_Patient_SSN` (`Patient`),
  KEY `fk_Stay_Room_Number` (`Room`),
  CONSTRAINT `fk_Stay_Patient_SSN` FOREIGN KEY (`Patient`) REFERENCES `Patient` (`SSN`),
  CONSTRAINT `fk_Stay_Room_Number` FOREIGN KEY (`Room`) REFERENCES `Room` (`RoomNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Stay`
--

LOCK TABLES `Stay` WRITE;
/*!40000 ALTER TABLE `Stay` DISABLE KEYS */;
INSERT INTO `Stay` VALUES (3215,100000001,111,'2008-05-01 00:00:00','2008-05-04 00:00:00'),(3216,100000003,123,'2008-05-03 00:00:00','2008-05-14 00:00:00'),(3217,100000004,112,'2008-05-02 00:00:00','2008-05-03 00:00:00');
/*!40000 ALTER TABLE `Stay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Trained_In`
--

DROP TABLE IF EXISTS `Trained_In`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Trained_In` (
  `Physician` int(11) NOT NULL,
  `Treatment` int(11) NOT NULL,
  `CertificationDate` datetime NOT NULL,
  `CertificationExpires` datetime NOT NULL,
  PRIMARY KEY (`Physician`,`Treatment`),
  KEY `fk_Trained_In_Procedures_Code` (`Treatment`),
  CONSTRAINT `fk_Trained_In_Physician_EmployeeID` FOREIGN KEY (`Physician`) REFERENCES `Physician` (`EmployeeID`),
  CONSTRAINT `fk_Trained_In_Procedures_Code` FOREIGN KEY (`Treatment`) REFERENCES `Procedures` (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Trained_In`
--

LOCK TABLES `Trained_In` WRITE;
/*!40000 ALTER TABLE `Trained_In` DISABLE KEYS */;
INSERT INTO `Trained_In` VALUES (3,1,'2008-01-01 00:00:00','2008-12-31 00:00:00'),(3,2,'2008-01-01 00:00:00','2008-12-31 00:00:00'),(3,5,'2008-01-01 00:00:00','2008-12-31 00:00:00'),(3,6,'2008-01-01 00:00:00','2008-12-31 00:00:00'),(3,7,'2008-01-01 00:00:00','2008-12-31 00:00:00'),(6,2,'2008-01-01 00:00:00','2008-12-31 00:00:00'),(6,5,'2007-01-01 00:00:00','2007-12-31 00:00:00'),(6,6,'2008-01-01 00:00:00','2008-12-31 00:00:00'),(7,1,'2008-01-01 00:00:00','2008-12-31 00:00:00'),(7,2,'2008-01-01 00:00:00','2008-12-31 00:00:00'),(7,3,'2008-01-01 00:00:00','2008-12-31 00:00:00'),(7,4,'2008-01-01 00:00:00','2008-12-31 00:00:00'),(7,5,'2008-01-01 00:00:00','2008-12-31 00:00:00'),(7,6,'2008-01-01 00:00:00','2008-12-31 00:00:00'),(7,7,'2008-01-01 00:00:00','2008-12-31 00:00:00');
/*!40000 ALTER TABLE `Trained_In` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Undergoes`
--

DROP TABLE IF EXISTS `Undergoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Undergoes` (
  `Patient` int(11) NOT NULL,
  `Procedures` int(11) NOT NULL,
  `Stay` int(11) NOT NULL,
  `DateUndergoes` datetime NOT NULL,
  `Physician` int(11) NOT NULL,
  `AssistingNurse` int(11) DEFAULT NULL,
  PRIMARY KEY (`Patient`,`Procedures`,`Stay`,`DateUndergoes`),
  KEY `fk_Undergoes_Procedures_Code` (`Procedures`),
  KEY `fk_Undergoes_Stay_StayID` (`Stay`),
  KEY `fk_Undergoes_Physician_EmployeeID` (`Physician`),
  KEY `fk_Undergoes_Nurse_EmployeeID` (`AssistingNurse`),
  CONSTRAINT `fk_Undergoes_Nurse_EmployeeID` FOREIGN KEY (`AssistingNurse`) REFERENCES `Nurse` (`EmployeeID`),
  CONSTRAINT `fk_Undergoes_Patient_SSN` FOREIGN KEY (`Patient`) REFERENCES `Patient` (`SSN`),
  CONSTRAINT `fk_Undergoes_Physician_EmployeeID` FOREIGN KEY (`Physician`) REFERENCES `Physician` (`EmployeeID`),
  CONSTRAINT `fk_Undergoes_Procedures_Code` FOREIGN KEY (`Procedures`) REFERENCES `Procedures` (`Code`),
  CONSTRAINT `fk_Undergoes_Stay_StayID` FOREIGN KEY (`Stay`) REFERENCES `Stay` (`StayID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Undergoes`
--

LOCK TABLES `Undergoes` WRITE;
/*!40000 ALTER TABLE `Undergoes` DISABLE KEYS */;
INSERT INTO `Undergoes` VALUES (100000001,2,3215,'2008-05-03 00:00:00',7,101),(100000001,6,3215,'2008-05-02 00:00:00',3,101),(100000001,7,3217,'2008-05-10 00:00:00',7,101),(100000004,1,3217,'2008-05-07 00:00:00',3,102),(100000004,4,3217,'2008-05-13 00:00:00',3,103),(100000004,5,3217,'2008-05-09 00:00:00',6,NULL);
/*!40000 ALTER TABLE `Undergoes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-06 12:58:27
