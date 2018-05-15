-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: learning_management_solution
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `batches`
--

DROP TABLE IF EXISTS `batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batches`
--

LOCK TABLES `batches` WRITE;
/*!40000 ALTER TABLE `batches` DISABLE KEYS */;
INSERT INTO `batches` VALUES (1,'2018 Summer','2018-05-15 09:04:22','2018-05-15 09:04:22'),(2,'2018 Fall','2018-05-15 09:04:22','2018-05-15 09:04:22');
/*!40000 ALTER TABLE `batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coursebatch`
--

DROP TABLE IF EXISTS `coursebatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coursebatch` (
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `courseId` int(11) NOT NULL,
  `batchId` int(11) NOT NULL,
  PRIMARY KEY (`courseId`,`batchId`),
  KEY `batchId` (`batchId`),
  CONSTRAINT `coursebatch_ibfk_1` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `coursebatch_ibfk_2` FOREIGN KEY (`batchId`) REFERENCES `batches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coursebatch`
--

LOCK TABLES `coursebatch` WRITE;
/*!40000 ALTER TABLE `coursebatch` DISABLE KEYS */;
INSERT INTO `coursebatch` VALUES ('2018-05-15 09:04:22','2018-05-15 09:04:22',2,1);
/*!40000 ALTER TABLE `coursebatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'Science','2018-05-15 08:11:10','2018-05-15 08:11:10'),(2,'Music','2018-05-15 08:11:52','2018-05-15 08:11:52');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lectures`
--

DROP TABLE IF EXISTS `lectures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lectures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `batchId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `batchId` (`batchId`),
  CONSTRAINT `lectures_ibfk_1` FOREIGN KEY (`batchId`) REFERENCES `batches` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lectures`
--

LOCK TABLES `lectures` WRITE;
/*!40000 ALTER TABLE `lectures` DISABLE KEYS */;
INSERT INTO `lectures` VALUES (1,'L1','2018-05-14 13:40:14','2018-05-14 13:40:14',1),(2,'L2','2018-05-14 13:40:14','2018-05-14 13:40:14',1),(3,'L3','2018-05-14 13:40:14','2018-05-14 13:40:14',1),(4,'L4','2018-05-14 13:40:14','2018-05-14 13:40:14',1),(5,'L5','2018-05-14 13:40:14','2018-05-14 13:40:14',1),(6,'L6','2018-05-15 14:28:10','2018-05-15 14:28:10',1);
/*!40000 ALTER TABLE `lectures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentbatch`
--

DROP TABLE IF EXISTS `studentbatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentbatch` (
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `studentId` int(11) NOT NULL,
  `batchId` int(11) NOT NULL,
  PRIMARY KEY (`studentId`,`batchId`),
  KEY `batchId` (`batchId`),
  CONSTRAINT `studentbatch_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `studentbatch_ibfk_2` FOREIGN KEY (`batchId`) REFERENCES `batches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentbatch`
--

LOCK TABLES `studentbatch` WRITE;
/*!40000 ALTER TABLE `studentbatch` DISABLE KEYS */;
INSERT INTO `studentbatch` VALUES ('2018-05-14 12:17:40','2018-05-14 12:17:40',1,2),('2018-05-14 12:17:40','2018-05-14 12:17:40',2,1),('2018-05-14 12:17:40','2018-05-14 12:17:40',2,2),('2018-05-14 12:17:40','2018-05-14 12:17:40',4,1),('2018-05-14 12:17:40','2018-05-14 12:17:40',4,2),('2018-05-14 12:17:40','2018-05-14 12:17:40',5,2),('2018-05-14 12:17:40','2018-05-14 12:17:40',6,1);
/*!40000 ALTER TABLE `studentbatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Kate','2018-05-14 11:54:48','2018-05-14 11:54:48'),(2,'John','2018-05-14 11:55:24','2018-05-14 11:55:24'),(3,'Sam','2018-05-14 11:55:30','2018-05-14 11:55:30'),(4,'Nancy','2018-05-14 11:55:36','2018-05-14 11:55:36'),(5,'Aron','2018-05-14 11:55:59','2018-05-14 11:55:59'),(6,'Agatha','2018-05-14 11:56:03','2018-05-14 11:56:03');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,'Physics','2018-05-15 10:49:44','2018-05-15 10:49:44'),(2,'Chemistry','2018-05-15 10:50:05','2018-05-15 10:50:05'),(3,'Biology','2018-05-15 10:50:12','2018-05-15 10:50:12');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `subjectId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subjectId` (`subjectId`),
  CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`subjectId`) REFERENCES `subjects` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (1,'Tom','2018-05-14 10:39:48','2018-05-14 10:39:48',1),(2,'Dick','2018-05-14 10:40:25','2018-05-14 10:40:25',3),(3,'Harry','2018-05-14 10:40:48','2018-05-14 10:40:48',2),(4,'Jane','2018-05-14 10:40:53','2018-05-14 10:40:53',2),(5,'Marry','2018-05-14 10:40:57','2018-05-14 10:40:57',2),(6,'Trudy','2018-05-14 10:41:11','2018-05-14 10:41:11',1);
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-15 20:03:08
