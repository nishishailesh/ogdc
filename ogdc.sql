-- MySQL dump 10.16  Distrib 10.1.23-MariaDB, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: ogdc
-- ------------------------------------------------------
-- Server version	10.1.23-MariaDB-9+deb9u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `01_Obstetric_History`
--

DROP TABLE IF EXISTS `01_Obstetric_History`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `01_Obstetric_History` (
  `Reg_No` varchar(50) COLLATE utf8_bin NOT NULL,
  `LMP` date NOT NULL,
  `EDD` date NOT NULL,
  `Parity` int(11) NOT NULL,
  `Abortion` int(11) NOT NULL,
  `Living_Children` int(11) NOT NULL,
  `Previous_LSCS` enum('no','yes') COLLATE utf8_bin NOT NULL DEFAULT 'no',
  `Other_Previous_Complications` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`Reg_No`),
  CONSTRAINT `01_Obstetric_History_ibfk_1` FOREIGN KEY (`Reg_No`) REFERENCES `Client_Detail` (`Reg_No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `02_Admission_Details`
--

DROP TABLE IF EXISTS `02_Admission_Details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `02_Admission_Details` (
  `Reg_No` varchar(50) COLLATE utf8_bin NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `direct_in_labor` enum('yes','no') COLLATE utf8_bin NOT NULL,
  `Gestational_age_wks` int(11) DEFAULT NULL,
  `Systolic_BP` int(11) DEFAULT NULL,
  `Diastolic_BP` int(11) DEFAULT NULL,
  `Temperature_F` decimal(4,1) DEFAULT NULL,
  `Proteinuria` enum('Nil','+','++','+++','++++') COLLATE utf8_bin NOT NULL,
  `Hb(gm%)` int(11) DEFAULT NULL,
  `Blood_Group(ABO)` enum('','A','B','O') COLLATE utf8_bin NOT NULL,
  `Blood_Group(Rh)` enum('','Rh -ve','Rh +ve') COLLATE utf8_bin NOT NULL,
  `HIV` enum('','negative','positive') COLLATE utf8_bin NOT NULL,
  `Syphilis` enum('','negative','positive') COLLATE utf8_bin NOT NULL,
  `Malaria` enum('','no','yes') COLLATE utf8_bin NOT NULL,
  `Hepatitis B` enum('','no','yes') COLLATE utf8_bin NOT NULL,
  `Hepatitis C` enum('','no','yes') COLLATE utf8_bin NOT NULL,
  `Referred_from` varchar(20) COLLATE utf8_bin NOT NULL,
  `High_Risk` enum('','no','yes') COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`Reg_No`),
  CONSTRAINT `02_Admission_Details_ibfk_1` FOREIGN KEY (`Reg_No`) REFERENCES `Client_Detail` (`Reg_No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Client_Detail`
--

DROP TABLE IF EXISTS `Client_Detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Client_Detail` (
  `Reg_No` varchar(50) COLLATE utf8_bin NOT NULL,
  `Year_SN` bigint(20) NOT NULL,
  `Month_SN` int(11) NOT NULL,
  `Date_of_Reg` date NOT NULL,
  `MCTS_No` int(11) NOT NULL,
  `Name` varchar(50) COLLATE utf8_bin NOT NULL,
  `Husband_Name` varchar(50) COLLATE utf8_bin NOT NULL,
  `Father_Name` varchar(50) COLLATE utf8_bin NOT NULL,
  `DOB` date NOT NULL,
  `Age` int(11) NOT NULL,
  `Address` varchar(100) COLLATE utf8_bin NOT NULL,
  `Mobile` bigint(20) NOT NULL,
  `BPL_MBS` int(11) NOT NULL,
  `Aadhar` bigint(20) NOT NULL,
  `Bank_Name` varchar(50) COLLATE utf8_bin NOT NULL,
  `Bank_Account_Number` bigint(20) NOT NULL,
  `ASHA_Name` varchar(50) COLLATE utf8_bin NOT NULL,
  `ASHA_Mobile` bigint(20) NOT NULL,
  `_photo` mediumblob NOT NULL,
  `_photo_name` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`Reg_No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(11) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `epassword` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `expirydate` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-28 23:48:45
