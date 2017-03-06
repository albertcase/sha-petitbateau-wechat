-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: localhost    Database: bateau_wechat
-- ------------------------------------------------------
-- Server version	5.7.17-0ubuntu0.16.04.1

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
-- Table structure for table `adp_article`
--

DROP TABLE IF EXISTS `adp_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adp_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pageid` varchar(50) NOT NULL,
  `pagename` varchar(50) NOT NULL,
  `pagetitle` varchar(50) NOT NULL,
  `content` longtext NOT NULL,
  `submiter` varchar(50) NOT NULL,
  `edittime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pageid` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adp_article`
--

LOCK TABLES `adp_article` WRITE;
/*!40000 ALTER TABLE `adp_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `adp_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analyse_shortvideo`
--

DROP TABLE IF EXISTS `analyse_shortvideo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analyse_shortvideo` (
  `analyseid` int(11) NOT NULL,
  `MediaId` varchar(255) NOT NULL,
  `ThumbMediaId` varchar(255) NOT NULL,
  KEY `shortvideo_analyseid` (`analyseid`),
  CONSTRAINT `shortvideo_analyseid` FOREIGN KEY (`analyseid`) REFERENCES `request_analyse` (`analyseid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analyse_shortvideo`
--

LOCK TABLES `analyse_shortvideo` WRITE;
/*!40000 ALTER TABLE `analyse_shortvideo` DISABLE KEYS */;
/*!40000 ALTER TABLE `analyse_shortvideo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_path`
--

DROP TABLE IF EXISTS `file_path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_path` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(500) NOT NULL,
  `path` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_path`
--

LOCK TABLES `file_path` WRITE;
/*!40000 ALTER TABLE `file_path` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_path` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_analyse`
--

DROP TABLE IF EXISTS `request_analyse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_analyse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ToUserName` varchar(50) NOT NULL,
  `FromUserName` varchar(50) NOT NULL,
  `MsgType` varchar(50) NOT NULL,
  `analyseid` int(11) NOT NULL,
  `CreateTime` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `request_analyse` (`analyseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_analyse`
--

LOCK TABLES `request_analyse` WRITE;
/*!40000 ALTER TABLE `request_analyse` DISABLE KEYS */;
/*!40000 ALTER TABLE `request_analyse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_event`
--

DROP TABLE IF EXISTS `request_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_event` (
  `analyseid` int(11) NOT NULL,
  `Event` varchar(255) NOT NULL,
  `EventKey` varchar(255) NOT NULL,
  `Ticket` varchar(255) NOT NULL,
  KEY `event_analyseid` (`analyseid`),
  CONSTRAINT `event_analyseid` FOREIGN KEY (`analyseid`) REFERENCES `request_analyse` (`analyseid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_event`
--

LOCK TABLES `request_event` WRITE;
/*!40000 ALTER TABLE `request_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `request_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_image`
--

DROP TABLE IF EXISTS `request_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_image` (
  `analyseid` int(11) NOT NULL,
  `PicUrl` varchar(255) NOT NULL,
  `MediaId` varchar(255) NOT NULL,
  KEY `image_analyseid` (`analyseid`),
  CONSTRAINT `image_analyseid` FOREIGN KEY (`analyseid`) REFERENCES `request_analyse` (`analyseid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_image`
--

LOCK TABLES `request_image` WRITE;
/*!40000 ALTER TABLE `request_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `request_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_link`
--

DROP TABLE IF EXISTS `request_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_link` (
  `analyseid` int(11) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Url` varchar(255) NOT NULL,
  KEY `link_analyseid` (`analyseid`),
  CONSTRAINT `link_analyseid` FOREIGN KEY (`analyseid`) REFERENCES `request_analyse` (`analyseid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_link`
--

LOCK TABLES `request_link` WRITE;
/*!40000 ALTER TABLE `request_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `request_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_location`
--

DROP TABLE IF EXISTS `request_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_location` (
  `analyseid` int(11) NOT NULL,
  `Location_X` varchar(255) NOT NULL,
  `Location_Y` varchar(255) NOT NULL,
  `Scale` varchar(255) NOT NULL,
  `Label` varchar(255) NOT NULL,
  KEY `location_analyseid` (`analyseid`),
  CONSTRAINT `location_analyseid` FOREIGN KEY (`analyseid`) REFERENCES `request_analyse` (`analyseid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_location`
--

LOCK TABLES `request_location` WRITE;
/*!40000 ALTER TABLE `request_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `request_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_text`
--

DROP TABLE IF EXISTS `request_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_text` (
  `analyseid` int(11) NOT NULL,
  `Content` blob NOT NULL,
  KEY `text_analyseid` (`analyseid`),
  CONSTRAINT `text_analyseid` FOREIGN KEY (`analyseid`) REFERENCES `request_analyse` (`analyseid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_text`
--

LOCK TABLES `request_text` WRITE;
/*!40000 ALTER TABLE `request_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `request_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_video`
--

DROP TABLE IF EXISTS `request_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_video` (
  `analyseid` int(11) NOT NULL,
  `MediaId` varchar(255) NOT NULL,
  `ThumbMediaId` varchar(255) NOT NULL,
  KEY `video_analyseid` (`analyseid`),
  CONSTRAINT `video_analyseid` FOREIGN KEY (`analyseid`) REFERENCES `request_analyse` (`analyseid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_video`
--

LOCK TABLES `request_video` WRITE;
/*!40000 ALTER TABLE `request_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `request_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_voice`
--

DROP TABLE IF EXISTS `request_voice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_voice` (
  `analyseid` int(11) NOT NULL,
  `MediaId` varchar(255) NOT NULL,
  `Format` varchar(255) NOT NULL,
  KEY `voice_analyseid` (`analyseid`),
  CONSTRAINT `voice_analyseid` FOREIGN KEY (`analyseid`) REFERENCES `request_analyse` (`analyseid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_voice`
--

LOCK TABLES `request_voice` WRITE;
/*!40000 ALTER TABLE `request_voice` DISABLE KEYS */;
/*!40000 ALTER TABLE `request_voice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storename` varchar(100) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `lat` varchar(30) DEFAULT NULL,
  `lng` varchar(30) DEFAULT NULL,
  `openhours` varchar(50) NOT NULL,
  `brandtype` varchar(50) NOT NULL,
  `storelog` varchar(250) NOT NULL,
  `storemap` varchar(250) NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores`
--

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temp_event_log`
--

DROP TABLE IF EXISTS `temp_event_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_event_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(30) NOT NULL,
  `texts` varchar(100) NOT NULL,
  `event` varchar(800) NOT NULL,
  `templog` varchar(800) NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temp_event_log`
--

LOCK TABLES `temp_event_log` WRITE;
/*!40000 ALTER TABLE `temp_event_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `temp_event_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_premission`
--

DROP TABLE IF EXISTS `user_premission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_premission` (
  `uid` int(11) NOT NULL,
  `premission` varchar(50) NOT NULL,
  KEY `wechat_admin_id` (`uid`),
  CONSTRAINT `wechat_admin_id` FOREIGN KEY (`uid`) REFERENCES `wechat_admin` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_premission`
--

LOCK TABLES `user_premission` WRITE;
/*!40000 ALTER TABLE `user_premission` DISABLE KEYS */;
INSERT INTO `user_premission` VALUES (1,'user_usercontrol');
/*!40000 ALTER TABLE `user_premission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_admin`
--

DROP TABLE IF EXISTS `wechat_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `latestTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_admin`
--

LOCK TABLES `wechat_admin` WRITE;
/*!40000 ALTER TABLE `wechat_admin` DISABLE KEYS */;
INSERT INTO `wechat_admin` VALUES (1,'admin','9f1afee1b1e64871f1dc70174d014933','2017-03-06 06:08:50','2016-05-13 09:25:01');
/*!40000 ALTER TABLE `wechat_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_events`
--

DROP TABLE IF EXISTS `wechat_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menuId` varchar(50) NOT NULL,
  `getMsgType` varchar(50) NOT NULL,
  `getContent` blob NOT NULL,
  `getEvent` varchar(100) NOT NULL,
  `getEventKey` varchar(255) NOT NULL,
  `getTicket` varchar(255) NOT NULL,
  `MsgType` varchar(50) NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_events`
--

LOCK TABLES `wechat_events` WRITE;
/*!40000 ALTER TABLE `wechat_events` DISABLE KEYS */;
INSERT INTO `wechat_events` VALUES (1,'2','event','','click','e1488450663331','','news','2017-03-02 10:31:03'),(2,'3','event','','click','e1488450674979','','news','2017-03-02 10:31:14'),(3,'4','event','','click','e1488450684478','','news','2017-03-02 10:31:24'),(4,'5','event','','click','e1488450696359','','news','2017-03-02 10:31:36'),(5,'8','event','','click','e1488450818742','','news','2017-03-02 10:33:38'),(6,'9','event','','click','e1488450853716','','news','2017-03-02 10:34:13'),(7,'10','event','','click','e1488450865933','','news','2017-03-02 10:34:25'),(8,'6','event','','click','e1488452738881','','news','2017-03-02 11:05:38'),(9,'13','event','','click','e1488452962441','','news','2017-03-02 11:09:22'),(10,'14','event','','click','e1488452981873','','news','2017-03-02 11:09:41');
/*!40000 ALTER TABLE `wechat_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_feedbacks`
--

DROP TABLE IF EXISTS `wechat_feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_feedbacks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menuId` varchar(50) NOT NULL,
  `MsgType` varchar(50) NOT NULL,
  `MsgData` blob NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_feedbacks`
--

LOCK TABLES `wechat_feedbacks` WRITE;
/*!40000 ALTER TABLE `wechat_feedbacks` DISABLE KEYS */;
INSERT INTO `wechat_feedbacks` VALUES (1,'qrcode58b6984565c11','news','{\"Articles\":[{\"Title\":\"\",\"Description\":\"\",\"Url\":\"\"}]}','2017-03-01 09:45:41'),(2,'2','news','{\"Articles\":[]}','2017-03-02 10:31:03'),(3,'3','news','{\"Articles\":[]}','2017-03-02 10:31:14'),(4,'4','news','{\"Articles\":[]}','2017-03-02 10:31:24'),(5,'5','news','{\"Articles\":[]}','2017-03-02 10:31:36'),(6,'8','news','{\"Articles\":[]}','2017-03-02 10:33:38'),(7,'9','news','{\"Articles\":[]}','2017-03-02 10:34:13'),(8,'10','news','{\"Articles\":[]}','2017-03-02 10:34:25'),(9,'6','news','{\"Articles\":[{\"Title\":\"\",\"Description\":\"\",\"Url\":\"\"}]}','2017-03-02 11:05:38'),(10,'13','news','{\"Articles\":[{\"Title\":\"\",\"Description\":\"\",\"Url\":\"\"}]}','2017-03-02 11:09:22'),(11,'14','news','{\"Articles\":[]}','2017-03-02 11:09:41');
/*!40000 ALTER TABLE `wechat_feedbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_getmsglog`
--

DROP TABLE IF EXISTS `wechat_getmsglog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_getmsglog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(50) NOT NULL,
  `msgType` varchar(50) NOT NULL,
  `msgXml` blob NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_getmsglog`
--

LOCK TABLES `wechat_getmsglog` WRITE;
/*!40000 ALTER TABLE `wechat_getmsglog` DISABLE KEYS */;
INSERT INTO `wechat_getmsglog` VALUES (1,'orqHxw2-qsVwD4YYWtxE1Bhte2-Y','event','<xml><ToUserName><![CDATA[gh_c194fb2f67ca]]></ToUserName>\n<FromUserName><![CDATA[orqHxw2-qsVwD4YYWtxE1Bhte2-Y]]></FromUserName>\n<CreateTime>1487494979</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[unsubscribe]]></Event>\n<EventKey><![CDATA[]]></EventKey>\n</xml>','2017-02-19 09:02:59'),(2,'orqHxw-bEy2kwfXuAcoIMPPUtMnw','event','<xml><ToUserName><![CDATA[gh_c194fb2f67ca]]></ToUserName>\n<FromUserName><![CDATA[orqHxw-bEy2kwfXuAcoIMPPUtMnw]]></FromUserName>\n<CreateTime>1487591889</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[subscribe]]></Event>\n<EventKey><![CDATA[]]></EventKey>\n</xml>','2017-02-20 11:58:09'),(3,'orqHxw-bEy2kwfXuAcoIMPPUtMnw','text','<xml><ToUserName><![CDATA[gh_c194fb2f67ca]]></ToUserName>\n<FromUserName><![CDATA[orqHxw-bEy2kwfXuAcoIMPPUtMnw]]></FromUserName>\n<CreateTime>1487591904</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[Hi]]></Content>\n<MsgId>6389158577947513193</MsgId>\n</xml>','2017-02-20 11:58:25'),(4,'orqHxw7R49PQA6WJiTgUKLlojhl8','event','<xml><ToUserName><![CDATA[gh_c194fb2f67ca]]></ToUserName>\n<FromUserName><![CDATA[orqHxw7R49PQA6WJiTgUKLlojhl8]]></FromUserName>\n<CreateTime>1487657682</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[subscribe]]></Event>\n<EventKey><![CDATA[]]></EventKey>\n</xml>','2017-02-21 06:14:42'),(5,'orqHxw8yymqzk13q9aUSJqOFR2Fg','event','<xml><ToUserName><![CDATA[gh_c194fb2f67ca]]></ToUserName>\n<FromUserName><![CDATA[orqHxw8yymqzk13q9aUSJqOFR2Fg]]></FromUserName>\n<CreateTime>1487667800</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[subscribe]]></Event>\n<EventKey><![CDATA[]]></EventKey>\n</xml>','2017-02-21 09:03:20'),(6,'orqHxw8yymqzk13q9aUSJqOFR2Fg','event','<xml><ToUserName><![CDATA[gh_c194fb2f67ca]]></ToUserName>\n<FromUserName><![CDATA[orqHxw8yymqzk13q9aUSJqOFR2Fg]]></FromUserName>\n<CreateTime>1487667810</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[unsubscribe]]></Event>\n<EventKey><![CDATA[]]></EventKey>\n</xml>','2017-02-21 09:03:30'),(7,'orqHxw8ycNS60Xhftj7YOogGq1Zo','event','<xml><ToUserName><![CDATA[gh_c194fb2f67ca]]></ToUserName>\n<FromUserName><![CDATA[orqHxw8ycNS60Xhftj7YOogGq1Zo]]></FromUserName>\n<CreateTime>1487683737</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[subscribe]]></Event>\n<EventKey><![CDATA[]]></EventKey>\n</xml>','2017-02-21 13:28:57'),(8,'orqHxw-RbPC4Twj50y-HW_JRrYuc','event','<xml><ToUserName><![CDATA[gh_c194fb2f67ca]]></ToUserName>\n<FromUserName><![CDATA[orqHxw-RbPC4Twj50y-HW_JRrYuc]]></FromUserName>\n<CreateTime>1487905526</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[subscribe]]></Event>\n<EventKey><![CDATA[]]></EventKey>\n</xml>','2017-02-24 03:05:26'),(9,'orqHxw_HHmbt3gqTp57UFZT3uwJc','event','<xml><ToUserName><![CDATA[gh_c194fb2f67ca]]></ToUserName>\n<FromUserName><![CDATA[orqHxw_HHmbt3gqTp57UFZT3uwJc]]></FromUserName>\n<CreateTime>1487921597</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[unsubscribe]]></Event>\n<EventKey><![CDATA[]]></EventKey>\n</xml>','2017-02-24 07:33:17'),(10,'orqHxw6dlOR9tHryKB68XzqdajJA','event','<xml><ToUserName><![CDATA[gh_c194fb2f67ca]]></ToUserName>\n<FromUserName><![CDATA[orqHxw6dlOR9tHryKB68XzqdajJA]]></FromUserName>\n<CreateTime>1487962968</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[subscribe]]></Event>\n<EventKey><![CDATA[]]></EventKey>\n</xml>','2017-02-24 19:02:49'),(11,'orqHxw0C0ymRvBIv_5QfrHvlcN_4','event','<xml><ToUserName><![CDATA[gh_c194fb2f67ca]]></ToUserName>\n<FromUserName><![CDATA[orqHxw0C0ymRvBIv_5QfrHvlcN_4]]></FromUserName>\n<CreateTime>1488266475</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[subscribe]]></Event>\n<EventKey><![CDATA[]]></EventKey>\n</xml>','2017-02-28 07:21:15'),(12,'orqHxw0C0ymRvBIv_5QfrHvlcN_4','event','<xml><ToUserName><![CDATA[gh_c194fb2f67ca]]></ToUserName>\n<FromUserName><![CDATA[orqHxw0C0ymRvBIv_5QfrHvlcN_4]]></FromUserName>\n<CreateTime>1488266488</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[unsubscribe]]></Event>\n<EventKey><![CDATA[]]></EventKey>\n</xml>','2017-02-28 07:21:28'),(13,'orqHxw_c3gKEezWkCWW8pwt7Lgxk','event','<xml><ToUserName><![CDATA[gh_c194fb2f67ca]]></ToUserName>\n<FromUserName><![CDATA[orqHxw_c3gKEezWkCWW8pwt7Lgxk]]></FromUserName>\n<CreateTime>1488278696</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[unsubscribe]]></Event>\n<EventKey><![CDATA[]]></EventKey>\n</xml>','2017-02-28 10:44:56'),(14,'orqHxw8hHBmldw7HxTz4sVjdEqW8','event','<xml><ToUserName><![CDATA[gh_c194fb2f67ca]]></ToUserName>\n<FromUserName><![CDATA[orqHxw8hHBmldw7HxTz4sVjdEqW8]]></FromUserName>\n<CreateTime>1488332622</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[subscribe]]></Event>\n<EventKey><![CDATA[]]></EventKey>\n</xml>','2017-03-01 01:43:42'),(15,'orqHxw8hHBmldw7HxTz4sVjdEqW8','event','<xml><ToUserName><![CDATA[gh_c194fb2f67ca]]></ToUserName>\n<FromUserName><![CDATA[orqHxw8hHBmldw7HxTz4sVjdEqW8]]></FromUserName>\n<CreateTime>1488361585</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[SCAN]]></Event>\n<EventKey><![CDATA[1]]></EventKey>\n<Ticket><![CDATA[gQFw8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMnU5U0VzS3hmTjMxMDAwMHcwM0MAAgRxl7ZYAwQAAAAA]]></Ticket>\n</xml>','2017-03-01 09:46:25'),(16,'orqHxw-RbPC4Twj50y-HW_JRrYuc','event','<xml><ToUserName><![CDATA[gh_c194fb2f67ca]]></ToUserName>\n<FromUserName><![CDATA[orqHxw-RbPC4Twj50y-HW_JRrYuc]]></FromUserName>\n<CreateTime>1488427144</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[SCAN]]></Event>\n<EventKey><![CDATA[1]]></EventKey>\n<Ticket><![CDATA[gQFw8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMnU5U0VzS3hmTjMxMDAwMHcwM0MAAgRxl7ZYAwQAAAAA]]></Ticket>\n</xml>','2017-03-02 03:59:04'),(17,'orqHxw-RbPC4Twj50y-HW_JRrYuc','event','<xml><ToUserName><![CDATA[gh_c194fb2f67ca]]></ToUserName>\n<FromUserName><![CDATA[orqHxw-RbPC4Twj50y-HW_JRrYuc]]></FromUserName>\n<CreateTime>1488427159</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[SCAN]]></Event>\n<EventKey><![CDATA[1]]></EventKey>\n<Ticket><![CDATA[gQFw8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMnU5U0VzS3hmTjMxMDAwMHcwM0MAAgRxl7ZYAwQAAAAA]]></Ticket>\n</xml>','2017-03-02 03:59:19'),(18,'orqHxw8hHBmldw7HxTz4sVjdEqW8','event','<xml><ToUserName><![CDATA[gh_c194fb2f67ca]]></ToUserName>\n<FromUserName><![CDATA[orqHxw8hHBmldw7HxTz4sVjdEqW8]]></FromUserName>\n<CreateTime>1488428073</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[SCAN]]></Event>\n<EventKey><![CDATA[1]]></EventKey>\n<Ticket><![CDATA[gQFw8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMnU5U0VzS3hmTjMxMDAwMHcwM0MAAgRxl7ZYAwQAAAAA]]></Ticket>\n</xml>','2017-03-02 04:14:33'),(19,'orqHxw-UzvKJ9RqkHErOYcNRv1Lc','event','<xml><ToUserName><![CDATA[gh_c194fb2f67ca]]></ToUserName>\n<FromUserName><![CDATA[orqHxw-UzvKJ9RqkHErOYcNRv1Lc]]></FromUserName>\n<CreateTime>1488440689</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[subscribe]]></Event>\n<EventKey><![CDATA[]]></EventKey>\n</xml>','2017-03-02 07:44:49'),(20,'orqHxw-UzvKJ9RqkHErOYcNRv1Lc','event','<xml><ToUserName><![CDATA[gh_c194fb2f67ca]]></ToUserName>\n<FromUserName><![CDATA[orqHxw-UzvKJ9RqkHErOYcNRv1Lc]]></FromUserName>\n<CreateTime>1488442696</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[SCAN]]></Event>\n<EventKey><![CDATA[1]]></EventKey>\n<Ticket><![CDATA[gQFw8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMnU5U0VzS3hmTjMxMDAwMHcwM0MAAgRxl7ZYAwQAAAAA]]></Ticket>\n</xml>','2017-03-02 08:18:16'),(21,'orqHxw8hHBmldw7HxTz4sVjdEqW8','event','<xml><ToUserName><![CDATA[gh_c194fb2f67ca]]></ToUserName>\n<FromUserName><![CDATA[orqHxw8hHBmldw7HxTz4sVjdEqW8]]></FromUserName>\n<CreateTime>1488452756</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[e1488452738881]]></EventKey>\n</xml>','2017-03-02 11:05:56'),(22,'orqHxw8hHBmldw7HxTz4sVjdEqW8','event','<xml><ToUserName><![CDATA[gh_c194fb2f67ca]]></ToUserName>\n<FromUserName><![CDATA[orqHxw8hHBmldw7HxTz4sVjdEqW8]]></FromUserName>\n<CreateTime>1488452760</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[e1488452738881]]></EventKey>\n</xml>','2017-03-02 11:06:00'),(23,'orqHxw5cdEuKl_J1CypAAWdTwsO0','event','<xml><ToUserName><![CDATA[gh_c194fb2f67ca]]></ToUserName>\n<FromUserName><![CDATA[orqHxw5cdEuKl_J1CypAAWdTwsO0]]></FromUserName>\n<CreateTime>1488505506</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[subscribe]]></Event>\n<EventKey><![CDATA[]]></EventKey>\n</xml>','2017-03-03 01:45:06'),(24,'orqHxw5cdEuKl_J1CypAAWdTwsO0','event','<xml><ToUserName><![CDATA[gh_c194fb2f67ca]]></ToUserName>\n<FromUserName><![CDATA[orqHxw5cdEuKl_J1CypAAWdTwsO0]]></FromUserName>\n<CreateTime>1488505538</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[e1488450696359]]></EventKey>\n</xml>','2017-03-03 01:45:38'),(25,'orqHxw5cdEuKl_J1CypAAWdTwsO0','event','<xml><ToUserName><![CDATA[gh_c194fb2f67ca]]></ToUserName>\n<FromUserName><![CDATA[orqHxw5cdEuKl_J1CypAAWdTwsO0]]></FromUserName>\n<CreateTime>1488505552</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[e1488450696359]]></EventKey>\n</xml>','2017-03-03 01:45:52'),(26,'orqHxw5cdEuKl_J1CypAAWdTwsO0','event','<xml><ToUserName><![CDATA[gh_c194fb2f67ca]]></ToUserName>\n<FromUserName><![CDATA[orqHxw5cdEuKl_J1CypAAWdTwsO0]]></FromUserName>\n<CreateTime>1488538319</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[unsubscribe]]></Event>\n<EventKey><![CDATA[]]></EventKey>\n</xml>','2017-03-03 10:51:59'),(27,'orqHxw6Zgdpiogxsq9PAuvnfB5aE','event','<xml><ToUserName><![CDATA[gh_c194fb2f67ca]]></ToUserName>\n<FromUserName><![CDATA[orqHxw6Zgdpiogxsq9PAuvnfB5aE]]></FromUserName>\n<CreateTime>1488547590</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[subscribe]]></Event>\n<EventKey><![CDATA[]]></EventKey>\n</xml>','2017-03-03 13:26:30'),(28,'orqHxw6Zgdpiogxsq9PAuvnfB5aE','event','<xml><ToUserName><![CDATA[gh_c194fb2f67ca]]></ToUserName>\n<FromUserName><![CDATA[orqHxw6Zgdpiogxsq9PAuvnfB5aE]]></FromUserName>\n<CreateTime>1488547597</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[e1488450684478]]></EventKey>\n</xml>','2017-03-03 13:26:37'),(29,'orqHxw6Zgdpiogxsq9PAuvnfB5aE','event','<xml><ToUserName><![CDATA[gh_c194fb2f67ca]]></ToUserName>\n<FromUserName><![CDATA[orqHxw6Zgdpiogxsq9PAuvnfB5aE]]></FromUserName>\n<CreateTime>1488547606</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[e1488450853716]]></EventKey>\n</xml>','2017-03-03 13:26:46'),(30,'orqHxw6Zgdpiogxsq9PAuvnfB5aE','event','<xml><ToUserName><![CDATA[gh_c194fb2f67ca]]></ToUserName>\n<FromUserName><![CDATA[orqHxw6Zgdpiogxsq9PAuvnfB5aE]]></FromUserName>\n<CreateTime>1488547613</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[e1488450818742]]></EventKey>\n</xml>','2017-03-03 13:26:54'),(31,'orqHxw6Zgdpiogxsq9PAuvnfB5aE','event','<xml><ToUserName><![CDATA[gh_c194fb2f67ca]]></ToUserName>\n<FromUserName><![CDATA[orqHxw6Zgdpiogxsq9PAuvnfB5aE]]></FromUserName>\n<CreateTime>1488547636</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[e1488450696359]]></EventKey>\n</xml>','2017-03-03 13:27:16');
/*!40000 ALTER TABLE `wechat_getmsglog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_jssdk`
--

DROP TABLE IF EXISTS `wechat_jssdk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_jssdk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `domain` varchar(50) NOT NULL,
  `editorid` int(11) NOT NULL,
  `jsfilename` varchar(50) NOT NULL,
  `jscontent` longtext NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `wechat_jssdk_eid` (`editorid`),
  CONSTRAINT `wechat_jssdk_id` FOREIGN KEY (`editorid`) REFERENCES `wechat_admin` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_jssdk`
--

LOCK TABLES `wechat_jssdk` WRITE;
/*!40000 ALTER TABLE `wechat_jssdk` DISABLE KEYS */;
/*!40000 ALTER TABLE `wechat_jssdk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_keyword_tag`
--

DROP TABLE IF EXISTS `wechat_keyword_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_keyword_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menuId` varchar(50) NOT NULL,
  `Tagname` varchar(50) NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_keyword_tag`
--

LOCK TABLES `wechat_keyword_tag` WRITE;
/*!40000 ALTER TABLE `wechat_keyword_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `wechat_keyword_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_material`
--

DROP TABLE IF EXISTS `wechat_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `media_id` varchar(255) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `material_media_id` (`media_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_material`
--

LOCK TABLES `wechat_material` WRITE;
/*!40000 ALTER TABLE `wechat_material` DISABLE KEYS */;
INSERT INTO `wechat_material` VALUES (1,'EFtmm30ObSF3Hc0BMyJZx9--XPP6DkWd3ntVbQ5HG9s',1488445274),(2,'EFtmm30ObSF3Hc0BMyJZx-DezuJ1N0qojUQiQzP7EUs',1488444770),(3,'EFtmm30ObSF3Hc0BMyJZx4b2hGcRr73-u_KM5lV9wis',1488428029);
/*!40000 ALTER TABLE `wechat_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_material_news`
--

DROP TABLE IF EXISTS `wechat_material_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_material_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `media_id` varchar(255) DEFAULT NULL,
  `title` blob NOT NULL,
  `thumb_media_id` varchar(255) DEFAULT NULL,
  `show_cover_pic` varchar(400) DEFAULT NULL,
  `author` varchar(400) DEFAULT NULL,
  `digest` blob NOT NULL,
  `url` varchar(400) DEFAULT NULL,
  `content_source_url` varchar(400) DEFAULT NULL,
  `thumb_url` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `news_media_id` (`media_id`),
  CONSTRAINT `news_media_id` FOREIGN KEY (`media_id`) REFERENCES `wechat_material` (`media_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_material_news`
--

LOCK TABLES `wechat_material_news` WRITE;
/*!40000 ALTER TABLE `wechat_material_news` DISABLE KEYS */;
INSERT INTO `wechat_material_news` VALUES (1,'EFtmm30ObSF3Hc0BMyJZx9--XPP6DkWd3ntVbQ5HG9s','柔软的梦丨欣赏Petit Bateau 2017 春夏婴幼儿系列','EFtmm30ObSF3Hc0BMyJZx2jFp7cByRHDNB5h0i0nMpY','0','','可爱的婴幼儿时装 沉浸Petit Bateau的温柔呵护','http://mp.weixin.qq.com/s?__biz=MzI4NzM5MjY4Ng==&mid=100000036&idx=1&sn=1b3d9c09bc166530a9ed05c59df3b8ee&chksm=6bcf17e55cb89ef3b3410c67b77cc73b7cf96afcd23e3f3ae120fa241b2a45fa4f6adb9482d2#rd','','http://mmbiz.qpic.cn/mmbiz_jpg/UN5sLfibvkRUMrnbPAqxprGRX4CDVxBETdVq0Jywic5tKXVfHuP8ZfXlwLibE3EOhjaddx4k7CTqtzxXB3qqAASvw/0?wx_fmt=jpeg'),(2,'EFtmm30ObSF3Hc0BMyJZx-DezuJ1N0qojUQiQzP7EUs','随性与创意的童年丨欣赏Petit Bateau 2017 春夏男童时装系列','EFtmm30ObSF3Hc0BMyJZx771KhZn0bQc947RAozlLx4','0','','呵护每一个昼夜时分','http://mp.weixin.qq.com/s?__biz=MzI4NzM5MjY4Ng==&mid=100000021&idx=1&sn=97a68e8c6f882300c304122f234b6c17&chksm=6bcf17d45cb89ec23b5d7d1c35c0e91a707084a086fb152c959ed498dfb1b859e5b0b9a85ed2#rd','','http://mmbiz.qpic.cn/mmbiz_jpg/UN5sLfibvkRUMrnbPAqxprGRX4CDVxBET74xSI0o1RFqIxBVJFaQ9JVRnX3mzuFsKkYO0DjoCiacdqZiczVETN5Dw/0'),(3,'EFtmm30ObSF3Hc0BMyJZx4b2hGcRr73-u_KM5lV9wis','走进小帆船明星产品','EFtmm30ObSF3Hc0BMyJZx6gxcxVYxqyX2wA58qH4GEg','0','','小帆船明星产品，给孩子一个轻松舒适的童年','http://mp.weixin.qq.com/s?__biz=MzI4NzM5MjY4Ng==&mid=100000010&idx=1&sn=e05d9c7abf4569af32a51014b5258346&chksm=6bcf17cb5cb89eddb69c257391bc504ac09eaef718844c7f459209aaf480075d55085218dfe7#rd','','http://mmbiz.qpic.cn/mmbiz_jpg/UN5sLfibvkRUMrnbPAqxprGRX4CDVxBETN6GRL9jCtmbXOGfgQ9frdsuNTX7BEOXkWemyPlxb9Cqq5XhialMEFtg/0?wx_fmt=jpeg');
/*!40000 ALTER TABLE `wechat_material_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_menu`
--

DROP TABLE IF EXISTS `wechat_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menuName` blob NOT NULL,
  `eventtype` varchar(50) NOT NULL,
  `eventKey` varchar(50) DEFAULT NULL,
  `eventUrl` varchar(255) DEFAULT NULL,
  `eventmedia_id` varchar(255) DEFAULT NULL,
  `width` enum('1','2','3','4','5') DEFAULT '1',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_menu`
--

LOCK TABLES `wechat_menu` WRITE;
/*!40000 ALTER TABLE `wechat_menu` DISABLE KEYS */;
INSERT INTO `wechat_menu` VALUES (1,'发现PB','',NULL,NULL,NULL,'1','2017-03-02 10:29:41'),(2,'品牌故事','click','e1488450663331',NULL,NULL,'1','2017-03-02 10:31:03'),(3,'造型手册','click','e1488450674979',NULL,NULL,'2','2017-03-02 10:31:14'),(4,'明星产品','click','e1488450684478',NULL,NULL,'3','2017-03-02 10:31:24'),(5,'最新资讯','click','e1488450696359',NULL,NULL,'4','2017-03-02 10:31:36'),(6,'玩趣DIY','click','e1488452738881','','','2','2017-03-02 10:32:23'),(7,'了解更多','','','','','3','2017-03-02 10:32:50'),(8,'网上商店','click','e1488450818742',NULL,NULL,'1','2017-03-02 10:33:38'),(9,'查找店铺','click','e1488450853716',NULL,NULL,'2','2017-03-02 10:34:13'),(10,'加入会员','click','e1488450865933',NULL,NULL,'3','2017-03-02 10:34:25'),(13,'手工灯笼','click','e1488452962441',NULL,NULL,'1','2017-03-02 11:09:22'),(14,'立体爱心','click','e1488452981873',NULL,NULL,'2','2017-03-02 11:09:41');
/*!40000 ALTER TABLE `wechat_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_menu_hierarchy`
--

DROP TABLE IF EXISTS `wechat_menu_hierarchy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_menu_hierarchy` (
  `tid` int(11) NOT NULL,
  `parent` int(11) DEFAULT '0',
  KEY `wechat_menu_id` (`tid`),
  CONSTRAINT `wechat_menu_id` FOREIGN KEY (`tid`) REFERENCES `wechat_menu` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_menu_hierarchy`
--

LOCK TABLES `wechat_menu_hierarchy` WRITE;
/*!40000 ALTER TABLE `wechat_menu_hierarchy` DISABLE KEYS */;
INSERT INTO `wechat_menu_hierarchy` VALUES (1,0),(2,1),(3,1),(4,1),(5,1),(6,0),(7,0),(8,7),(9,7),(10,7),(13,6),(14,6);
/*!40000 ALTER TABLE `wechat_menu_hierarchy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_oauth`
--

DROP TABLE IF EXISTS `wechat_oauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_oauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `redirect_url` varchar(250) NOT NULL,
  `callback_url` varchar(250) NOT NULL,
  `scope` varchar(50) NOT NULL,
  `oauthfile` varchar(50) NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_oauth`
--

LOCK TABLES `wechat_oauth` WRITE;
/*!40000 ALTER TABLE `wechat_oauth` DISABLE KEYS */;
/*!40000 ALTER TABLE `wechat_oauth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_qrcode`
--

DROP TABLE IF EXISTS `wechat_qrcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_qrcode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qrName` varchar(200) NOT NULL,
  `qrSceneid` int(11) DEFAULT NULL,
  `qrScenestr` varchar(200) DEFAULT NULL,
  `qrTicket` varchar(255) NOT NULL,
  `qrExpire` int(11) DEFAULT NULL,
  `qrSubscribe` int(11) DEFAULT '0',
  `qrScan` int(11) DEFAULT '0',
  `qrUrl` varchar(255) DEFAULT NULL,
  `feedbackid` varchar(200) DEFAULT NULL,
  `qrtype` enum('1','2') DEFAULT '1' COMMENT '1.永久,2.临时',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `qrTicket` (`qrTicket`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_qrcode`
--

LOCK TABLES `wechat_qrcode` WRITE;
/*!40000 ALTER TABLE `wechat_qrcode` DISABLE KEYS */;
INSERT INTO `wechat_qrcode` VALUES (2,'FOR Kidea',1,NULL,'gQFw8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMnU5U0VzS3hmTjMxMDAwMHcwM0MAAgRxl7ZYAwQAAAAA',NULL,0,5,'http://weixin.qq.com/q/022u9SEsKxfN310000w03C','qrcode58b6984565c11','1','2017-03-01 09:45:41');
/*!40000 ALTER TABLE `wechat_qrcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_users`
--

DROP TABLE IF EXISTS `wechat_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(50) NOT NULL,
  `nickname` blob NOT NULL,
  `headimgurl` varchar(255) NOT NULL,
  `sex` enum('0','1','2') DEFAULT '0' COMMENT '0 null,1 male,2 female',
  `country` varchar(60) DEFAULT NULL,
  `province` varchar(60) DEFAULT NULL,
  `city` varchar(60) DEFAULT NULL,
  `status` enum('1','2') DEFAULT '1' COMMENT '1 subscript,2 unsubscript',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `openid` (`openid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_users`
--

LOCK TABLES `wechat_users` WRITE;
/*!40000 ALTER TABLE `wechat_users` DISABLE KEYS */;
INSERT INTO `wechat_users` VALUES (1,'orqHxw2-qsVwD4YYWtxE1Bhte2-Y','','','0',NULL,NULL,NULL,'2','2017-02-19 09:02:59'),(2,'orqHxw-bEy2kwfXuAcoIMPPUtMnw','','','0',NULL,NULL,NULL,'1','2017-02-20 11:58:09'),(3,'orqHxw7R49PQA6WJiTgUKLlojhl8','','','0',NULL,NULL,NULL,'1','2017-02-21 06:14:42'),(4,'orqHxw8yymqzk13q9aUSJqOFR2Fg','','','0',NULL,NULL,NULL,'2','2017-02-21 09:03:20'),(5,'orqHxw8ycNS60Xhftj7YOogGq1Zo','','','0',NULL,NULL,NULL,'1','2017-02-21 13:28:57'),(6,'orqHxw-RbPC4Twj50y-HW_JRrYuc','','','0',NULL,NULL,NULL,'1','2017-02-24 03:05:26'),(7,'orqHxw_HHmbt3gqTp57UFZT3uwJc','','','0',NULL,NULL,NULL,'2','2017-02-24 07:33:17'),(8,'orqHxw6dlOR9tHryKB68XzqdajJA','','','0',NULL,NULL,NULL,'1','2017-02-24 19:02:49'),(9,'orqHxw0C0ymRvBIv_5QfrHvlcN_4','','','0',NULL,NULL,NULL,'2','2017-02-28 07:21:15'),(10,'orqHxw_c3gKEezWkCWW8pwt7Lgxk','','','0',NULL,NULL,NULL,'2','2017-02-28 10:44:56'),(11,'orqHxw8hHBmldw7HxTz4sVjdEqW8','','','0',NULL,NULL,NULL,'1','2017-03-01 01:43:42'),(12,'orqHxw-UzvKJ9RqkHErOYcNRv1Lc','','','0',NULL,NULL,NULL,'1','2017-03-02 07:44:49'),(13,'orqHxw5cdEuKl_J1CypAAWdTwsO0','','','0',NULL,NULL,NULL,'2','2017-03-03 01:45:06'),(14,'orqHxw6Zgdpiogxsq9PAuvnfB5aE','','','0',NULL,NULL,NULL,'1','2017-03-03 13:26:30');
/*!40000 ALTER TABLE `wechat_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-06  7:53:48
