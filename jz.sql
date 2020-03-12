-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: jz
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.16.04.1

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
-- Current Database: `jz`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `jz` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `jz`;

--
-- Table structure for table `Account`
--

DROP TABLE IF EXISTS `Account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Account` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) DEFAULT NULL,
  `passWord` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `sex` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `power` varchar(10) DEFAULT NULL,
  `gold` int(10) DEFAULT '0',
  `lastIp` varchar(255) DEFAULT NULL,
  `lastTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Account`
--

LOCK TABLES `Account` WRITE;
/*!40000 ALTER TABLE `Account` DISABLE KEYS */;
INSERT INTO `Account` VALUES (3,'admin','123456','杨先生','男','13471255855',NULL,'0',999999999,'192.168.81.218','2018-04-25 14:18:53'),(4,'test1','123456','黄先生12','男','13471255855','12','3',1000000999,'192.168.81.218','2018-04-25 14:09:41'),(5,'test12','231','李先生','男','13471255855',NULL,'3',999999999,'192.168.81.218','2018-04-25 14:45:19'),(6,'test13','231','李先生','男','13471255855',NULL,'3',999999999,NULL,'2018-04-16 20:57:03'),(7,'test14','231','李先生','男','13471255855',NULL,'3',999999999,NULL,'2018-04-16 20:57:22'),(8,'test22','123456','杨城','男','13471255856','111','3',0,'192.168.81.218','2018-04-25 14:59:19');
/*!40000 ALTER TABLE `Account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Evaluate`
--

DROP TABLE IF EXISTS `Evaluate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Evaluate` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `uID` int(10) DEFAULT NULL,
  `sID` int(10) DEFAULT NULL,
  `dID` int(10) DEFAULT NULL,
  `isCompany` int(2) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Evaluate`
--

LOCK TABLES `Evaluate` WRITE;
/*!40000 ALTER TABLE `Evaluate` DISABLE KEYS */;
INSERT INTO `Evaluate` VALUES (3,5,2,3,0,'2018-04-13 19:35:12','还不错哟'),(4,5,2,3,0,'2018-04-13 19:36:17','还不错'),(5,5,1,3,1,'2018-04-13 19:55:04','还不错');
/*!40000 ALTER TABLE `Evaluate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JzOrder`
--

DROP TABLE IF EXISTS `JzOrder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JzOrder` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `oID` varchar(100) DEFAULT NULL,
  `xiadanID` int(10) DEFAULT NULL,
  `jiedanID` int(10) DEFAULT NULL,
  `serverID` int(10) DEFAULT NULL,
  `isCompany` tinyint(1) DEFAULT NULL,
  `serverType` text,
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `gold` int(10) DEFAULT NULL,
  `state` int(2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JzOrder`
--

LOCK TABLES `JzOrder` WRITE;
/*!40000 ALTER TABLE `JzOrder` DISABLE KEYS */;
INSERT INTO `JzOrder` VALUES (3,'DD1523444322296',4,5,2,0,'家庭保姆','2018-04-11 00:00:00','2018-04-11 23:59:59','2018-04-20 18:58:42',15000,7),(4,'DD1523445018781',4,5,1,1,'家庭保姆','2018-04-11 00:00:00','2018-04-11 23:59:59','2018-04-21 19:10:19',15000,7),(5,'DD1523444322296',4,5,2,0,'家庭保姆','2018-04-11 00:00:00','2018-04-11 23:59:59','2018-04-22 18:58:42',50000,7),(6,'DD1523445018781',4,5,1,1,'家庭保姆','2018-04-11 00:00:00','2018-04-11 23:59:59','2018-04-23 19:10:19',30000,7),(7,'DD1523444322296',4,5,2,0,'家庭保姆','2018-04-11 00:00:00','2018-04-11 23:59:59','2018-04-24 18:58:42',40000,7),(8,'DD1523445018781',4,5,1,1,'家庭保姆','2018-04-11 00:00:00','2018-04-11 23:59:59','2018-04-25 19:10:19',60000,7),(9,'DD1523444322296',4,5,2,0,'家庭保姆','2018-04-11 00:00:00','2018-04-11 23:59:59','2018-04-26 18:58:42',15000,7),(10,'DD1523445018781',4,5,1,1,'家庭保姆','2018-04-11 00:00:00','2018-04-11 23:59:59','2018-04-26 19:10:19',15000,7),(11,'DD1523444322296',4,5,2,0,'家庭保姆','2018-04-11 00:00:00','2018-04-11 23:59:59','2018-04-26 18:58:42',15000,7),(12,'DD1523445018781',4,5,1,1,'家庭保姆','2018-04-11 00:00:00','2018-04-11 23:59:59','2018-04-11 19:10:19',150000,1),(15,'DD1524625252255',4,5,3,0,'家庭保姆','2018-04-26 00:00:00','2018-04-26 23:59:59','2018-04-25 11:00:52',150,0),(16,'DD1524625276964',4,5,1,1,'家庭保姆','2018-04-25 00:00:00','2018-04-25 23:59:59','2018-04-25 11:01:17',150,0),(17,'DD1524628457436',4,5,3,0,'家庭保姆','2018-04-27 00:00:00','2018-04-27 23:59:59','2018-04-25 11:54:17',150,0),(18,'DD1524628496155',4,5,1,1,'家庭保姆','2018-04-17 00:00:00','2018-04-25 23:59:59','2018-04-25 11:54:56',1350,0);
/*!40000 ALTER TABLE `JzOrder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JzType`
--

DROP TABLE IF EXISTS `JzType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JzType` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `jzInfo` text,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JzType`
--

LOCK TABLES `JzType` WRITE;
/*!40000 ALTER TABLE `JzType` DISABLE KEYS */;
INSERT INTO `JzType` VALUES (1,'家庭钟点','111111111111111','2018-03-18 21:26:21'),(2,'钟点工','2222222222222222222222','2018-03-18 21:26:34');
/*!40000 ALTER TABLE `JzType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Life`
--

DROP TABLE IF EXISTS `Life`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Life` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `title` text,
  `content` text,
  `author` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Life`
--

LOCK TABLES `Life` WRITE;
/*!40000 ALTER TABLE `Life` DISABLE KEYS */;
INSERT INTO `Life` VALUES (1,'111','<p>111</p>\r\n\r\n<h1>111</h1>\r\n\r\n<p>1</p>\r\n\r\n<h1>111</h1>\r\n','1111','2018-03-21 22:58:46');
/*!40000 ALTER TABLE `Life` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Message`
--

DROP TABLE IF EXISTS `Message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Message` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `uID` int(10) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `content` text,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Message`
--

LOCK TABLES `Message` WRITE;
/*!40000 ALTER TABLE `Message` DISABLE KEYS */;
INSERT INTO `Message` VALUES (1,3,'杨先生','服务还不错','2018-03-25 20:30:08'),(2,3,'杨先生','1111','2018-03-25 20:48:28'),(3,3,'杨先生','2222222222','2018-03-25 21:13:23');
/*!40000 ALTER TABLE `Message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `News`
--

DROP TABLE IF EXISTS `News`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `News` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `title` text,
  `content` text,
  `author` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `News`
--

LOCK TABLES `News` WRITE;
/*!40000 ALTER TABLE `News` DISABLE KEYS */;
INSERT INTO `News` VALUES (2,'习近平发表讲话','<p>&nbsp; &nbsp; &nbsp; &nbsp; 原标题：中共中央国务院举行春节团拜会 习近平发表重要讲话 李克强主持 张德江俞正声张高丽栗战书汪洋王沪宁赵乐际韩正出席</p>\r\n\r\n<p>新华社北京2月14日电（记者吴晶朱基钗）中共中央、国务院14日上午在人民大会堂举行2018年春节团拜会。中共中央总书记、国家主席、中央军委主席习近平发表重要讲话，代表党中央、国务院，向全国各族人民，向香港特别行政区同胞、澳门特别行政区同胞、台湾同胞和海外侨胞拜年。</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;党和国家领导人李克强、张德江、俞正声、张高丽、栗战书、汪洋、王沪宁、赵乐际、韩正等出席团拜会，李克强主持。</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;人民大会堂宴会厅灯火辉煌、暖意融融，各界人士2000多人欢聚一堂、共迎新春，欢声笑语间洋溢着喜庆祥和的节日气氛。</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; 上午10时，在欢快的乐曲声中，习近平等党和国家领导人步入大厅，全场响起热烈掌声。</p>\r\n','YC','2018-03-21 21:42:33'),(3,'111','<p>111</p>\r\n','111','2018-03-21 21:44:45'),(4,'11','<p>11</p>\r\n','11','2018-03-21 21:46:16'),(5,'11','<p>11</p>\r\n','11','2018-03-21 21:49:37'),(6,'11','<p>11</p>\r\n','11','2018-03-21 21:52:44'),(7,'11','<p>11</p>\r\n','11','2018-03-21 21:53:02'),(9,'qwq','<p>wqwq</p>\r\n','wqw','2018-03-21 21:56:03'),(11,'1111','<p>11111</p>\r\n','111','2018-03-21 22:49:45'),(12,'3333333333','<p><br />\r\n<strong>3fdsfjsd&nbsp;fjdsklfj\\</strong></p>\r\n\r\n<h1>dslfkjslf4fdsjkf</h1>\r\n\r\n<p>fjdsklfj</p>\r\n','3333333','2018-03-21 22:52:31');
/*!40000 ALTER TABLE `News` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Recruit`
--

DROP TABLE IF EXISTS `Recruit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Recruit` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `title` text,
  `content` text,
  `author` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Recruit`
--

LOCK TABLES `Recruit` WRITE;
/*!40000 ALTER TABLE `Recruit` DISABLE KEYS */;
INSERT INTO `Recruit` VALUES (1,'2112','<p>232132</p>\r\n\r\n<h1>321</h1>\r\n\r\n<h1>312</h1>\r\n\r\n<p>3</p>\r\n\r\n<p>213</p>\r\n\r\n<p>21</p>\r\n','212','2018-03-21 22:53:41');
/*!40000 ALTER TABLE `Recruit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ServiceCompany`
--

DROP TABLE IF EXISTS `ServiceCompany`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ServiceCompany` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `uID` int(10) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `serverType` text,
  `serviceCity` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `introduce` text,
  `image` varchar(255) DEFAULT NULL,
  `grade` double(6,2) DEFAULT '0.00',
  `gradePeople` int(10) DEFAULT '0',
  `state` int(2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ServiceCompany`
--

LOCK TABLES `ServiceCompany` WRITE;
/*!40000 ALTER TABLE `ServiceCompany` DISABLE KEYS */;
INSERT INTO `ServiceCompany` VALUES (1,5,'立即家政','13471255856','[{serverType:\"家庭保姆\",gold:150},{serverType:\"临时工\",gold:150}]','桂林','桂林七星二巷','我们很厉害',NULL,100.00,1,1),(2,8,'AA家政','13471255856','[{serverType:\"家庭保姆\",gold:150},{serverType:\"临时工\",gold:150}]','桂林','桂林七星二巷','我们很厉害','1524639584430.jpg',100.00,1,3),(3,6,'厉害家政','13471255856','[{serverType:\"家庭保姆\",gold:150},{serverType:\"临时工\",gold:150}]','桂林','桂林七星二巷','我们很厉害','',100.00,1,1),(4,7,'哈哈家政','13471255856','[{serverType:\"家庭保姆\",gold:150},{serverType:\"临时工\",gold:150}]','桂林','桂林七星二巷','我们很厉害','',100.00,1,1);
/*!40000 ALTER TABLE `ServiceCompany` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ServicePeople`
--

DROP TABLE IF EXISTS `ServicePeople`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ServicePeople` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `uID` int(10) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `age` int(5) DEFAULT NULL,
  `idCard` varchar(30) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `serverType` text,
  `workAblity` text,
  `workExperience` text,
  `serviceCity` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `education` varchar(50) DEFAULT NULL,
  `introduce` text,
  `image` varchar(255) DEFAULT NULL,
  `grade` double(6,2) DEFAULT '0.00',
  `gradePeople` int(10) DEFAULT '0',
  `state` int(2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ServicePeople`
--

LOCK TABLES `ServicePeople` WRITE;
/*!40000 ALTER TABLE `ServicePeople` DISABLE KEYS */;
INSERT INTO `ServicePeople` VALUES (2,6,'李先生','男',18,'450222199502041236','13471255856','[{serverType:\"家庭保姆\",gold:150},{serverType:\"钟点工\",gold:150}]','工作能力很强','44','桂林','桂林市七星二巷','本科','我是个很好的保姆',NULL,0.00,0,1),(3,5,'李先生','男',18,'450222199502041236','13471255856','[{serverType:\"家庭保姆\",gold:150},{serverType:\"临时工\",gold:150}]','工作能力很强','44','桂林','桂林市七星二巷','本科','我是个很好的保姆',NULL,96.50,4,1),(5,4,'11','男',111,'111','11','[{\"serverType\":\"家庭保姆\",\"gold\":\"1\"},{\"serverType\":\"保姆\",\"gold\":\"1\"}]','11','1','1','1','1','1','1522503073792.jpg',0.00,0,1);
/*!40000 ALTER TABLE `ServicePeople` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SubMessage`
--

DROP TABLE IF EXISTS `SubMessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SubMessage` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `fID` int(10) DEFAULT NULL,
  `uID` int(10) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `content` text,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SubMessage`
--

LOCK TABLES `SubMessage` WRITE;
/*!40000 ALTER TABLE `SubMessage` DISABLE KEYS */;
INSERT INTO `SubMessage` VALUES (1,1,3,'黄先生','服务真的好','2018-03-25 20:30:42'),(2,1,3,'杨先生','11111','2018-03-25 21:04:46'),(3,1,3,'杨先生','22222','2018-03-25 21:06:51'),(4,1,3,'杨先生','3333','2018-03-25 21:11:56'),(5,1,4,'黄先生12','hahah ','2018-04-25 12:30:06');
/*!40000 ALTER TABLE `SubMessage` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-25 15:10:32
