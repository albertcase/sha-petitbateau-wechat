DROP TABLE IF EXISTS `wechat_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `media_id` varchar(255) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `material_media_id` (`media_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

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
  CONSTRAINT `news_media_id` FOREIGN KEY (`media_id`) REFERENCES `wechat_material` (`media_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
