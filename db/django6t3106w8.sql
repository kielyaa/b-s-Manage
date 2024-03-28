-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: django6t3106w8
-- ------------------------------------------------------
-- Server version	5.7.31

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
-- Current Database: `django6t3106w8`
--

/*!40000 DROP DATABASE IF EXISTS `django6t3106w8`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `django6t3106w8` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `django6t3106w8`;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  `url` varchar(500) DEFAULT NULL COMMENT 'url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='配置文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'picture1','upload/picture1.jpg',NULL),(2,'picture2','upload/picture2.jpg',NULL),(3,'picture3','upload/picture3.jpg',NULL);
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fupinxinxi`
--

DROP TABLE IF EXISTS `fupinxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fupinxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `xingming` varchar(200) NOT NULL COMMENT '姓名',
  `xingbie` varchar(200) NOT NULL COMMENT '性别',
  `touxiang` longtext COMMENT '头像',
  `sheng` varchar(200) NOT NULL COMMENT '乡镇',
  `jiatingzhuzhi` varchar(200) NOT NULL COMMENT '家庭住址',
  `chengyuanshuliang` int(11) DEFAULT NULL COMMENT '成员数量',
  `yuannianshouru` double DEFAULT NULL COMMENT '原年收入',
  `yuankezhipeishouru` double DEFAULT NULL COMMENT '原可支配收入',
  `xiannianshouru` double DEFAULT NULL COMMENT '现年收入',
  `xiankezhipeishouru` double DEFAULT NULL COMMENT '现可支配收入',
  `kezhipeizhanbi` double DEFAULT NULL COMMENT '可支配占比',
  `pinkundengji` varchar(200) NOT NULL COMMENT '贫困等级',
  `fupinzhengce` varchar(200) NOT NULL COMMENT '帮扶政策',
  `fupinneirong` longtext COMMENT '帮扶内容',
  `fupinjieguo` varchar(200) NOT NULL COMMENT '帮扶结果',
  `dengjiriqi` date DEFAULT NULL COMMENT '登记日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='帮扶信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fupinxinxi`
--

LOCK TABLES `fupinxinxi` WRITE;
/*!40000 ALTER TABLE `fupinxinxi` DISABLE KEYS */;
INSERT INTO `fupinxinxi` VALUES (31,'2024-02-26 14:04:03','姓名1','男','upload/fupinxinxi_touxiang1.jpg,upload/fupinxinxi_touxiang2.jpg,upload/fupinxinxi_touxiang3.jpg','乡镇1','家庭住址1',1,1,1,1,1,1,'绝对贫困','帮扶政策1','帮扶内容1','已脱贫','2024-02-26'),(32,'2024-02-26 14:04:03','姓名2','男','upload/fupinxinxi_touxiang2.jpg,upload/fupinxinxi_touxiang3.jpg,upload/fupinxinxi_touxiang4.jpg','乡镇2','家庭住址2',2,2,2,2,2,2,'绝对贫困','帮扶政策2','帮扶内容2','已脱贫','2024-02-26'),(33,'2024-02-26 14:04:03','姓名3','男','upload/fupinxinxi_touxiang3.jpg,upload/fupinxinxi_touxiang4.jpg,upload/fupinxinxi_touxiang5.jpg','乡镇3','家庭住址3',3,3,3,3,3,3,'绝对贫困','帮扶政策3','帮扶内容3','已脱贫','2024-02-26'),(34,'2024-02-26 14:04:03','姓名4','男','upload/fupinxinxi_touxiang4.jpg,upload/fupinxinxi_touxiang5.jpg,upload/fupinxinxi_touxiang6.jpg','乡镇4','家庭住址4',4,4,4,4,4,4,'绝对贫困','帮扶政策4','帮扶内容4','已脱贫','2024-02-26'),(35,'2024-02-26 14:04:03','姓名5','男','upload/fupinxinxi_touxiang5.jpg,upload/fupinxinxi_touxiang6.jpg,upload/fupinxinxi_touxiang7.jpg','乡镇5','家庭住址5',5,5,5,5,5,5,'绝对贫困','帮扶政策5','帮扶内容5','已脱贫','2024-02-26'),(36,'2024-02-26 14:04:03','姓名6','男','upload/fupinxinxi_touxiang6.jpg,upload/fupinxinxi_touxiang7.jpg,upload/fupinxinxi_touxiang8.jpg','乡镇6','家庭住址6',6,6,6,6,6,6,'绝对贫困','帮扶政策6','帮扶内容6','已脱贫','2024-02-26'),(37,'2024-02-26 14:04:03','姓名7','男','upload/fupinxinxi_touxiang7.jpg,upload/fupinxinxi_touxiang8.jpg,upload/fupinxinxi_touxiang9.jpg','乡镇7','家庭住址7',7,7,7,7,7,7,'绝对贫困','帮扶政策7','帮扶内容7','已脱贫','2024-02-26'),(38,'2024-02-26 14:04:03','姓名8','男','upload/fupinxinxi_touxiang8.jpg,upload/fupinxinxi_touxiang9.jpg,upload/fupinxinxi_touxiang10.jpg','乡镇8','家庭住址8',8,8,8,8,8,8,'绝对贫困','帮扶政策8','帮扶内容8','已脱贫','2024-02-26');
/*!40000 ALTER TABLE `fupinxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fupinzhengce`
--

DROP TABLE IF EXISTS `fupinzhengce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fupinzhengce` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `fupinzhengce` varchar(200) NOT NULL COMMENT '帮扶政策',
  `shiyongduixiang` varchar(200) DEFAULT NULL COMMENT '适用对象',
  `zhengceneirong` longtext NOT NULL COMMENT '政策内容',
  `banburiqi` date DEFAULT NULL COMMENT '颁布日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='帮扶政策';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fupinzhengce`
--

LOCK TABLES `fupinzhengce` WRITE;
/*!40000 ALTER TABLE `fupinzhengce` DISABLE KEYS */;
INSERT INTO `fupinzhengce` VALUES (21,'2024-02-26 14:04:03','帮扶政策1','适用对象1','政策内容1','2024-02-26'),(22,'2024-02-26 14:04:03','帮扶政策2','适用对象2','政策内容2','2024-02-26'),(23,'2024-02-26 14:04:03','帮扶政策3','适用对象3','政策内容3','2024-02-26'),(24,'2024-02-26 14:04:03','帮扶政策4','适用对象4','政策内容4','2024-02-26'),(25,'2024-02-26 14:04:03','帮扶政策5','适用对象5','政策内容5','2024-02-26'),(26,'2024-02-26 14:04:03','帮扶政策6','适用对象6','政策内容6','2024-02-26'),(27,'2024-02-26 14:04:03','帮扶政策7','适用对象7','政策内容7','2024-02-26'),(28,'2024-02-26 14:04:03','帮扶政策8','适用对象8','政策内容8','2024-02-26');
/*!40000 ALTER TABLE `fupinzhengce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sheng`
--

DROP TABLE IF EXISTS `sheng`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sheng` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `sheng` varchar(200) NOT NULL COMMENT '乡镇',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='乡镇';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sheng`
--

LOCK TABLES `sheng` WRITE;
/*!40000 ALTER TABLE `sheng` DISABLE KEYS */;
INSERT INTO `sheng` VALUES (11,'2024-02-26 14:04:03','乡镇1'),(12,'2024-02-26 14:04:03','乡镇2'),(13,'2024-02-26 14:04:03','乡镇3'),(14,'2024-02-26 14:04:03','乡镇4'),(15,'2024-02-26 14:04:03','乡镇5'),(16,'2024-02-26 14:04:03','乡镇6'),(17,'2024-02-26 14:04:03','乡镇7'),(18,'2024-02-26 14:04:03','乡镇8');
/*!40000 ALTER TABLE `sheng` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systemintro`
--

DROP TABLE IF EXISTS `systemintro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemintro` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `subtitle` varchar(200) DEFAULT NULL COMMENT '副标题',
  `content` longtext NOT NULL COMMENT '内容',
  `picture1` longtext COMMENT '图片1',
  `picture2` longtext COMMENT '图片2',
  `picture3` longtext COMMENT '图片3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统简介';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemintro`
--

LOCK TABLES `systemintro` WRITE;
/*!40000 ALTER TABLE `systemintro` DISABLE KEYS */;
INSERT INTO `systemintro` VALUES (1,'2024-02-26 14:04:03','系统简介','SYSTEM INTRODUCTION','在平静的海平面上，每个人都可以成为领航员。但如果只有阳光而没有阴影，只有欢乐而没有痛苦，那就不是完整的人生。就拿最幸福的人来说吧——他的幸福是一团纠结的纱线。痛苦和幸福轮番而至，让我们悲喜交集，甚至死亡都让人生更加可爱。人在生命的严肃时刻，在悲伤与丧亲的阴影下，才最接近真实的自我。在生活和事业的各个方面，才智的功能远不如性格，头脑的功能远不如心性，天分远不如自制力、毅力与教养。我始终认为内心开始过严肃生活的人，他外在的生活会开始变得更为俭朴。在一个奢侈浪费的年代，但愿我能让世人了解：人类真正的需求是多么的稀少。不重蹈覆辙才是真正的醒悟。比别人优秀并无任何高贵之处，真正的高贵在于超越从前的自我。','upload/systemintro_picture1.jpg','upload/systemintro_picture2.jpg','upload/systemintro_picture3.jpg');
/*!40000 ALTER TABLE `systemintro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `image` varchar(200) DEFAULT NULL COMMENT '头像',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin','upload/image1.jpg','管理员','2024-02-26 14:04:03');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-11 19:20:01
