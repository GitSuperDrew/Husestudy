-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: husestudy
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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `kid` int(11) NOT NULL AUTO_INCREMENT,
  `kname` varchar(255) NOT NULL,
  `kpassword` varchar(25) NOT NULL,
  PRIMARY KEY (`kid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','admin'),(2,'drew','drew');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `college`
--

DROP TABLE IF EXISTS `college`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `college` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college`
--

LOCK TABLES `college` WRITE;
/*!40000 ALTER TABLE `college` DISABLE KEYS */;
INSERT INTO `college` VALUES (1,'理学院'),(2,'马克思主义学院'),(3,'经济与管理学院'),(4,'人文与社会科学学院(教师教育学院)'),(5,'体育学院'),(6,'外国语学院'),(7,'传媒学院'),(8,'电子与信息工程学院'),(9,'土木与环境工程学院'),(10,'化学与生物工程学院'),(11,'音乐与舞蹈学院'),(12,'美术与艺术设计学院'),(13,'国学院');
/*!40000 ALTER TABLE `college` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_info`
--

DROP TABLE IF EXISTS `contact_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_info` (
  `infoId` int(11) NOT NULL AUTO_INCREMENT,
  `addr` varchar(255) DEFAULT '湖南省永州市零陵区',
  `address` varchar(255) DEFAULT '湖南省永州市零陵县杨梓塘130号',
  `school` varchar(255) DEFAULT '湖南科技学院',
  `email` varchar(50) DEFAULT '12345678901@139.com',
  `emailwebsite` varchar(100) DEFAULT 'http://mail.10086.cn',
  `phone` varchar(20) DEFAULT '12345678901',
  `whour` varchar(100) DEFAULT 'Monday-Friday：09:00 - 18:00',
  `weekend` varchar(100) DEFAULT 'Saturday-Sunday：10:00 - 15:00',
  PRIMARY KEY (`infoId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_info`
--

LOCK TABLES `contact_info` WRITE;
/*!40000 ALTER TABLE `contact_info` DISABLE KEYS */;
INSERT INTO `contact_info` VALUES (1,'湖南省永州市零陵区','湖南省永州市零陵县杨梓塘130号','湖南科技学院','12345678910@139.com','http://mail.10086.cn','12345678900','Monday-Friday：09:00 - 18:00','Saturday-Sunday：10:00 - 15:00');
/*!40000 ALTER TABLE `contact_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discuss`
--

DROP TABLE IF EXISTS `discuss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discuss` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `dcontent` text,
  `ddate` datetime DEFAULT NULL,
  `good` mediumtext,
  `bad` mediumtext,
  `wid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`did`),
  KEY `wid` (`wid`),
  KEY `uid` (`uid`),
  CONSTRAINT `discuss_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  CONSTRAINT `discuss_ibfk_2` FOREIGN KEY (`wid`) REFERENCES `works` (`wid`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discuss`
--

LOCK TABLES `discuss` WRITE;
/*!40000 ALTER TABLE `discuss` DISABLE KEYS */;
INSERT INTO `discuss` VALUES (1,'very good homework','2018-03-26 19:21:24','666','233',1,10),(3,'ALL time for you.','2018-03-26 19:22:45','999','332',1,10),(4,'good,严格遵守规定','2018-04-05 17:27:19','1200','100',29,10),(5,'希望每个同学都认真看看！','2018-04-05 17:30:44','153','7',24,10),(6,'三好学生，必须的。','2018-04-05 17:32:54','138','10',21,12),(7,'xinxixnxixnixnxinxixnixnixn','2018-04-08 14:28:20','0','0',1,10),(8,'adsfsfsd','2018-04-08 16:29:11','0','0',4,10),(9,'adsfsfsd','2018-04-08 16:35:39','2','1',9,10),(10,'debug!','2018-04-08 17:07:18','0','0',10,10),(12,'bug is good thing.yes','2018-04-16 00:40:31','10','9',23,10),(13,'作品的信息，总算出来了！','2018-04-08 19:22:47','12','236',17,10),(14,'1.刷新discucssArea.jsp.\r\n1.刷新discucssArea.jsp.\r\n1.刷新discucssArea.jsp.','2018-04-16 00:54:20','12','25',19,10),(15,'2.刷新discussArea.jsp[good]','2018-04-16 00:54:21','10','10',19,10),(16,'3.刷新discussArea.js[HAHAH]','2018-04-16 00:54:43','10','15',19,10),(17,'java是最流行的编程语言。hello worlds.','2018-04-16 00:54:43','10','125',19,10),(18,'java的高级特性是每个初学者都必须了解知道的。HELLO WORLD!','2018-04-16 00:54:43','125','253',17,10),(19,'马克思主义学院，听起来就高大尚呀！','2018-04-13 23:29:00','1','0',22,12),(20,'马克思主义学院到底学习些什么呀？','2018-04-13 23:30:03','62','0',22,12),(21,'马克思学院，专业是不是就只有一个吗？','2018-04-13 23:43:49','61','1',22,12),(22,'马克思学院的学生是不是在入党上面会有优势啊？','2018-04-13 23:44:53','62','1',22,12),(23,'金融工程目前就业情况很是乐观哟！欢迎报考金融工程专业welcome！','2018-04-13 23:56:21','0','0',23,13),(24,'金融工程的课程有哪些？','2018-04-13 23:58:04','0','0',23,13),(25,'大家尽情发言，畅所欲言！欢迎报考金融工程。','2018-04-13 23:59:02','0','0',23,13),(26,'学习法学专业的学生都很理性的！','2018-04-14 00:34:51','0','0',25,14),(27,'希望可以进入法学专业学习！','2018-04-14 00:57:48','2','1',25,14),(28,'希望可以进入法学专业学习！','2018-04-14 01:00:14','2','0',25,14),(29,'大家好，初学法学，多多指教！','2018-04-14 01:17:21','1','0',25,14),(30,'自古英雄出少年','2018-04-14 01:23:19','1','0',25,14),(31,'冒个泡，法学专业的。','2018-04-14 01:36:18','1','1',25,14),(32,'我来介绍下瑜伽的起源吧！瑜伽起源于印度，距今有五千多年的历史文化被人们称为“世界的瑰宝”。瑜伽发源印度北部的喜马拉雅山麓地带，古印度瑜伽修行者在大自然中修炼身心时，无意中发现各种动物与植物天生具有治疗、放松、睡眠、或保持清醒的方法，患病时能不经任何治疗而自然痊愈。于是古印度瑜伽修行者根据动物的姿势观察、模仿并亲自体验，创立出一系列有益身心的锻炼系统，也就是体位法。这些姿势历经了五千多年的锤炼，瑜伽教给人们的治愈法，让世世代代的人从中获益。','2018-04-14 13:11:08','0','0',26,15),(33,'瑜伽有什么益处呢？下面我们来看看：瑜伽能消除烦恼——减压养心，释放身心，全身舒畅，心绪平静，冷静思考,达到修心养性的目的;瑜伽能提高免疫力——增加血液循环，修复受损组织，使身体组织得到充分的营养;瑜伽能集中注意力——是学生及压力人群提高学习及工作效率的最佳休息法、锻炼法；瑜伽能让你跳出心灵的限制，从而更好地回归角色，并坦然迎接生活中的一切挑战。','2018-04-14 13:12:59','0','0',26,15),(34,'练习瑜伽的主义事项：① 暖身很重要。不要一开始就做高难度的动作，以免造成运动伤害。最好先做一些瑜伽暖身动作，循序渐进，避免身体受到惊吓；② 练习时，一定要保持室内相对安静，空气一定要流通。不要在太软的床上练习，准备一个瑜伽垫子，然后穿着睡衣，光脚练习。③ 练习瑜伽不一定非要照猫画虎，完全按照光盘的动作完成，练习者能够记得多少动作就做多少，动作的顺序也不是一成不变的，应该随心所欲，只要保持呼吸的平稳和心态的平和就可以。④ 练习瑜伽时，每个动作一定都要保持3至5次呼吸，练习瑜伽后应该感觉心情的愉悦而不是身体酸累，甚至痛苦。⑤ 练习瑜伽千万不要勉强，瑜伽不一定每天都要做，只有在你心情好、身体感觉好、时间空闲时做瑜伽，才会事半功倍。','2018-04-14 13:16:52','0','0',26,15),(35,'瑜伽禁忌：① 情绪波动不易联系瑜伽。② 骨质疏松症者，练习要小心。③ 眼压过高、高度近视眼，不建议头下脚上的倒立动作。前弯或倒立，会增加眼压，因此原本就有眼压过高、高度近视的人，不建议练习瑜伽。④  身体状况不佳、大病初愈、骨折初期不宜练习瑜伽。瑜伽需要身体状况良好的情况下，才能达到锻炼身体机能及肌群的功效，如果身体状况不好，肌肉、关节、韧带无法发挥力量，练习瑜伽的时候，就很容易受伤。⑤  癫痫、大脑皮质受损。瑜伽许多动作会牵扯伸展到颈部，而如果有癫痫或是大脑皮质受损者，前弯后仰按摩颈部的伸展，就可能诱发癫痫发作。⑥ 有血液凝固疾病 血液凝固病者，避免练习瑜伽。瑜伽的动作需要摆位、肢体伸展扭转，过程中可能导致末梢血流减少，更容易导致血液凝固严重，引发心脏血管疾病。','2018-04-14 13:24:46','1','0',26,15),(36,'瑜伽---放松身心的好方式你说呢？','2018-04-14 13:27:22','1','0',26,15),(37,'专业术语：① 前倾式坐姿② 弯曲时坐姿③ 站姿④ 放松的姿势⑤ 平衡的姿势','2018-04-14 13:31:01','1','0',26,15),(38,'早上跑步对身体有害吗？','2018-04-14 16:41:31','0','0',28,15),(39,'握拍的方式与运动员的成绩有关系吗?','2018-04-14 16:47:13','0','0',29,15),(40,'补充：一、培养学习英语的兴趣 爱因斯坦曾经说过：“兴趣和爱好是最好的老师”。浓厚的学习兴趣，可以使人集中力量，深入思考。如果让你去做一件你毫无兴趣的事，你根本无法做好，任何事如此，英语学习也不例外。 有的同学说：“我天生就对英语没兴趣。”此言差矣。须知，有些兴趣并非与生俱来，而是后天培养的。为什么不试着通过你感兴趣的东西去靠拢你无兴趣的英语学习呢？例如，有人喜欢音乐，有英文歌曲；有人喜欢看录像带，有中文字幕的录相片……千万别把英语只理解成枯燥的单词、语法，千万别把英语学习当成一种负担。 培养学习英语的兴趣，这是学好英语的第一步。 二、单词记忆的几种方法 英语单词是整个英语学习的基础，如何掌握好每个单词的发音和书写是摆在我们面前的一个重大问题。以前我记忆单词没有什么好方法，只会死记硬背，不但记得不熟，而且记住的还容易忘记，效果自然不好。后来，多次请教老师，寻找课外资料，在不断的实践中，记忆单词的能力有了很大的提高，还总结了几种记忆单词的方法： 1.由音及形法。 即弄清这个单词中的字母或字母组合的发音,根据读音写出相应的字母及字母组合.这样既可以使我们准确发音,又能较容易地记住单词拼写. 2.分类法。把学过的单词按其属性分门别类串在一起记。例如季节：spring 、summer 、autumn 、winter学科：English、maths、physics history、 Chinese……颜色：red、yellow 、white 、black、 green…… 3.联想法。利用词与词之间类似之处进行对比，利用词与词之间的差异进行分析辨认。这不仅能加深我们对新词的印象，还同时巩固了旧词。例如： 近形近音plane-plant-plan-planet 同义词big--large、tall--hight、perhaps--maybe 反义词heavy--light、left--right、return--borrow 词的搭配look at--look for--look up--look after 单词，犹如万仗大厦的基石，学好单词，在英语学习过程中又迈出了一大步。','2018-04-14 21:57:34','0','0',32,16),(41,'软件工程就业前景：【就业去向】　　本专业毕业生的主要就业去向是珠江三角洲、长江三角洲的软件公司、企事业单位，全国各地高校、研究所、国防等部门从事软件设计、开发、应用与研究工作','2018-04-15 11:59:40','0','0',35,18),(42,'此专业的毕业生获得以下几方面的能力：1．具有较扎实的自然科学基础，较好的人文社会科学基础和外语语言综合能力2．掌握工程力学、流体力学、岩土力学、工程地质学和工程制图的基本理论与基本知识3．掌握建筑材料、结构计算、构件设计、地基处理、给水排水工程和计算机应用方面的基本知识、原理、方法与技能，初步具有从事土建结构工程的设计与研究工作的能力4．掌握建筑机械、电工学、工程测量、施工技术与施工组织、工程监测、工程概预算以及工程招标等方面的基本知识、基本技能，初步具有从事工程施工、管理和研究工作的能力5．熟悉各类土木工程的建设方针、政策和法规6．了解土木工程各主干学科的理论前沿和发展动态7．掌握文献检索和资料查询的基本方法，具有一定的科学研究和实际工作能力。','2018-04-15 15:30:12','0','0',39,19),(43,'生物技术相近的专业：生物科学，生物技术，生物信息学生物信息技术，生物科学与生物技术，动植物检疫，植物生物技术，动物生物技术，生物工程，生物安全....','2018-04-15 16:16:17','0','0',39,20),(44,'生物技术的主要课程：有机化学、生物化学、化工原理、生化工程、微生物学、细胞生物学、遗传学、生物化学、分子生物学、基因工程、细胞工程、微生物工程、生化工程、生物工程下游技术、发酵工程设备等。','2018-04-15 16:16:59','0','0',39,20),(45,'说说素描的分类：一、素描从目的和功能上说；一般可分为创作素描和习作素描两大类。二、写生素描在表现内容上分为静物、动物、风景、人像及人体素描等。三、素描从绘画传统的角度说，素描又可分为中国写意传统的素描和西方写实传统的素描两种。四、素描从作画时间概念上说，素描可分为长期素描、速写、默写等。五、 素描从使用工具上分为铅笔、炭笔、钢笔、毛笔、水墨、粉笔、纸笔或两种工具穿插使用的素描。','2018-04-15 17:24:42','0','0',43,22),(46,'\"三号学生\"----\"三好学生\"；goodman','2018-04-16 00:33:36','21','23',17,10),(47,'hello','2018-04-16 00:29:09','0','0',17,10),(48,'very good!--nihao','2018-04-16 00:06:48','15','15',17,10),(49,'不错，不错，想你学习！给个联系方式呗？','2018-04-16 00:03:39','240','256',17,10),(50,'能不能分享下源码？','2018-04-16 11:03:39','36','25',17,10),(51,'好好学习，天天向上。','2018-04-16 00:56:10','258','369',19,10),(52,'努力学习，就有成果。','2018-04-16 12:39:38','12','154',19,10),(53,'遵守纪律就是一个好学生的基本思想道德素质。','2018-04-16 11:35:17','25','0',15,10),(54,'测试：你说为什么这个数据点击update就是删除呢？2121','2018-04-16 01:22:50','252','360',12,10),(55,'hello world! hello your world!\r\nhello world! hello your world!\r\nhello world! hello you world!\r\nhello world! \r\nhello your world!\r\nhello world! hello your world!','2018-04-16 01:18:22','18','9',24,10),(56,'HI,HELLOhelelelle','2018-04-16 01:17:20','5','3',24,10),(57,'good student?是这样翻译的吧！','2018-04-16 13:54:21','0','0',33,10),(58,'Great Learner!','2018-04-16 13:54:46','12','25',31,10),(59,'非常强的视觉冲击呀！','2018-04-18 23:15:40','0','0',44,22),(60,'我就很想了解一下，金融工程的就业前景....','2018-04-18 23:17:07','1','1',23,22),(61,'目前正在学习javaWeb开发的相关技术。','2018-04-24 22:49:35','28','15',24,10),(62,'好学生！','2018-04-24 22:56:52','22','20',21,10),(63,'湘科院的规章制度是每个湘科院学生都必须要了解的！','2018-05-27 15:45:26','1','0',15,12),(64,'图片好看！','2018-06-10 17:21:40','0','0',34,10);
/*!40000 ALTER TABLE `discuss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `git`
--

DROP TABLE IF EXISTS `git`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `git` (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `gdate` datetime DEFAULT NULL,
  `wid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`gid`),
  KEY `wid` (`wid`),
  KEY `uid` (`uid`),
  CONSTRAINT `git_ibfk_1` FOREIGN KEY (`wid`) REFERENCES `works` (`wid`),
  CONSTRAINT `git_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `git`
--

LOCK TABLES `git` WRITE;
/*!40000 ALTER TABLE `git` DISABLE KEYS */;
INSERT INTO `git` VALUES (2,'2018-03-26 21:31:23',1,10),(3,'2018-03-26 21:31:40',10,10),(5,'2018-04-26 09:56:02',24,10),(6,'2018-04-26 10:11:05',15,10),(7,'2018-04-26 10:14:06',34,10),(8,'2018-04-28 00:02:34',26,10),(9,'2018-05-27 13:38:30',22,10);
/*!40000 ALTER TABLE `git` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `husefile`
--

DROP TABLE IF EXISTS `husefile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `husefile` (
  `file_id` varchar(32) NOT NULL,
  `file_name` varchar(100) NOT NULL,
  `file_addr` varchar(150) NOT NULL,
  `file_date` datetime DEFAULT '2018-01-01 20:20:20',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`file_id`),
  KEY `uid` (`uid`),
  CONSTRAINT `husefile_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `husefile`
--

LOCK TABLES `husefile` WRITE;
/*!40000 ALTER TABLE `husefile` DISABLE KEYS */;
INSERT INTO `husefile` VALUES ('109876542612345678','file','file/file.txt','2018-05-02 19:20:20','2018-05-03 13:41:00',1),('109876543212345678','file','file/file.txt','2018-01-01 20:20:20','2018-05-03 13:39:03',1),('123456789987654321','file','file/file.txt','2018-01-01 20:20:20','2018-05-03 13:35:01',1),('4028ba81638fa6570163913540c90000','sqlworkbench.sql','husefile/sqlworkbench.sql','2018-05-24 16:12:56','2018-05-24 16:12:56',10);
/*!40000 ALTER TABLE `husefile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `major`
--

DROP TABLE IF EXISTS `major`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `major` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `mname` varchar(255) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `muid` int(11) DEFAULT NULL,
  PRIMARY KEY (`mid`),
  KEY `cid` (`cid`),
  KEY `FK62DB5B98A70213` (`muid`),
  CONSTRAINT `FK62DB5B98A70213` FOREIGN KEY (`muid`) REFERENCES `major_user` (`muid`),
  CONSTRAINT `major_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `college` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `major`
--

LOCK TABLES `major` WRITE;
/*!40000 ALTER TABLE `major` DISABLE KEYS */;
INSERT INTO `major` VALUES (1,'信息与计算科学',1,NULL),(2,'数学与应用数学',1,NULL),(3,'物理学',1,NULL),(4,'思想政治教育专业',2,NULL),(5,'国际经济与贸易',3,NULL),(6,'市场营销',3,NULL),(7,'旅游管理',3,NULL),(8,'金融工程',3,NULL),(9,'统计学',3,NULL),(10,'财务管理',3,NULL),(11,'汉语言文学专业',4,NULL),(12,'法学专业',4,NULL),(13,'体育教育本科专业',5,NULL),(14,'日语',6,NULL),(15,'英语',6,NULL),(16,'商务英语',6,NULL),(17,'广告',7,NULL),(18,'广播电视学',7,NULL),(19,'广播电视编导',7,NULL),(20,'数字媒体技术',7,NULL),(21,'电子科学与技术',8,NULL),(22,'电子信息工程',8,NULL),(23,'通信工程',8,NULL),(24,'计算机科学与技术',8,NULL),(25,'软件工程',8,NULL),(26,'教育技术学',8,NULL),(27,'机械设计制造及其自动化',8,NULL),(28,'工程管理',9,NULL),(29,'土木工程',9,NULL),(30,'测绘工程',9,NULL),(31,'化学(师范)',10,NULL),(32,'材料化学',10,NULL),(33,'生物工程',10,NULL),(34,'生物技术',10,NULL),(35,'食品质量与安全',10,NULL),(36,'制药工程',10,NULL),(37,'音乐学',11,NULL),(38,'舞蹈学',11,NULL),(39,'环境艺术设计',12,NULL),(40,'视觉传达设计',12,NULL),(41,'产品造型设计',12,NULL),(42,'美术学',12,NULL),(43,'1',NULL,NULL),(44,'美术学',NULL,NULL),(45,'计算机科学与技术',NULL,NULL),(46,'财务管理',NULL,NULL),(48,'商贸学院',NULL,NULL);
/*!40000 ALTER TABLE `major` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `major_user`
--

DROP TABLE IF EXISTS `major_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `major_user` (
  `muid` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`muid`),
  KEY `mid` (`mid`),
  KEY `uid` (`uid`),
  KEY `FKEC3D9A919ABCBE74` (`uid`),
  CONSTRAINT `FKEC3D9A919ABCBE74` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  CONSTRAINT `major_user_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `major` (`mid`),
  CONSTRAINT `major_user_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `major` (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `major_user`
--

LOCK TABLES `major_user` WRITE;
/*!40000 ALTER TABLE `major_user` DISABLE KEYS */;
INSERT INTO `major_user` VALUES (1,NULL,7),(2,10,19),(3,2,2),(4,12,17),(5,3,10),(6,13,15),(7,23,14),(8,4,13),(9,14,12),(10,5,10),(11,11,4),(12,NULL,10),(13,4,12),(14,8,13),(15,12,14),(16,13,15),(17,15,16),(18,18,17),(19,23,18),(20,29,19),(21,34,20),(22,37,21),(23,42,22),(24,NULL,1),(25,42,1);
/*!40000 ALTER TABLE `major_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motto`
--

DROP TABLE IF EXISTS `motto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `motto` (
  `motto_id` int(11) NOT NULL AUTO_INCREMENT,
  `motto_author` varchar(25) DEFAULT 'Golgi',
  `motto_content` varchar(255) DEFAULT 'The more extensive knowledge,the more perfect the human',
  `motto_message` varchar(255) DEFAULT '"The more extensive knowledge,the more perfect the human".---Golgi',
  `motto_time` datetime DEFAULT '2018-08-08 20:20:20',
  PRIMARY KEY (`motto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motto`
--

LOCK TABLES `motto` WRITE;
/*!40000 ALTER TABLE `motto` DISABLE KEYS */;
INSERT INTO `motto` VALUES (1,'Golgi','The more extensive knowledge,the more perfect the human','\"The more extensive knowledge,the more perfect the human\".---Golgi','2018-08-08 20:20:20'),(2,'Golgi','The more extensive knowledge,the more perfect the human','\"The more extensive knowledge,the more perfect the human\".---Golgi','2018-04-11 14:18:28'),(3,'Maugham','Reading for pleasure','\"Reading for pleasure\".---Maugham','2018-04-11 14:27:24'),(4,'Choate','Only books are immortal','\"Only books are immortal\".---Choate','2018-04-11 14:30:28'),(5,'Bo Wei','Books to cultivate their sentiment','\"Books to cultivate their sentiment\".---Bo Wei','2018-04-11 14:30:28'),(6,'Xu Teli','Do not read books','\"Do not read books\".---Xu Teli','2018-04-11 14:30:28'),(7,'Lenin','Books are a great force','\"Books are a great force\".---Lenin','2018-04-11 14:32:57'),(8,'Thoreau','Books - the treasure of the world','\"Books - the treasure of the world\".---Thoreau','2018-04-11 14:32:57'),(9,'Digest','You are not more expensive to read','\"You are not more expensive to read\".---Digest','2018-04-11 14:32:57'),(10,'Hugo','Books are the tools of the soul','\"Books are the tools of the soul\".---Hugo','2018-04-11 14:32:57'),(11,'Swift','Books are the children of thought','\"Books are the children of thought\".---Swift','2018-04-11 14:36:29'),(12,'Golgi','Books are the ladder of human progress','\"Books are the ladder of human progress\".---Golgi','2018-04-11 14:36:30'),(13,'Carlile','The book lying the souls of the past','\"The book lying the souls of the past\".---Carlile','2018-04-11 14:36:30'),(14,'Voltaire','Reading makes people see and think clearly','\"Reading makes people see and think clearly\".---Voltaire','2018-04-11 14:36:30'),(15,'cute','Books are the only things that never die','\"Books are the only things that never die\".---cute','2018-04-11 14:36:30'),(16,'Socrates','The unexamined life is not worth living','\"The unexamined life is not worth living\".---Socrates','2018-04-11 14:43:46'),(17,'R.M.Nixon','Our destiny offers not the cup of despair, but the chalice of opportunity. So let us seize it, not in fear, but in gladness','\"Our destiny offers not the cup of despair, but the chalice of opportunity. So let us seize it, not in fear, but in gladness\".---R.M.Nixon','2018-04-11 14:43:46'),(18,'John Ruskin','Living without an aim is like sailing without a compass','\"Living without an aim is like sailing without a compass\".---John Ruskin','2018-04-11 14:43:47'),(19,'J.H.Newman','Fear not that the life shall come to an end, but rather fear that it shall never have a beginning','\"Fear not that the life shall come to an end, but rather fear that it shall never have a beginning\".---J.H.Newman','2018-04-11 14:43:47'),(20,'Julius Erving','Gods determine what you‘re going to be','\"Gods determine what you‘re going to be\".---Julius Erving','2018-04-11 19:49:35'),(21,'Robert Louis Stevenson','An aim in life is the only fortune worth finding','\"An aim in life is the only fortune worth finding\".---Robert Louis Stevenson','2018-04-11 21:14:10'),(22,'Charles Chaplin','You have to believe in yourself. That‘s the secret of success','\"You have to believe in yourself. That‘s the secret of success\".---Charles Chaplin','2018-04-11 21:25:10'),(23,'Thomas Carlyle','Cease to struggle and you cease to live','\"Cease to struggle and you cease to live\".---Thomas Carlyle',NULL),(24,'Socrates','Other men live to eat, while I eat to live','\"Other men live to eat, while I eat to live\".---Socrates','2018-04-11 22:21:12'),(25,'Benjamin Franklin','Energy and persistence conquer all things','\"Energy and persistence conquer all things\".---Benjamin Franklin',NULL),(26,'Thomas Addison','A strong man will struggle with the storms of fate','\"A strong man will struggle with the storms of fate\".---Thomas Addison','2018-04-11 22:25:40');
/*!40000 ALTER TABLE `motto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reply` (
  `reply_id` varchar(40) NOT NULL,
  `reply_content` varchar(200) DEFAULT NULL,
  `reply_time` datetime DEFAULT NULL,
  `wid` int(11) DEFAULT NULL,
  `did` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`reply_id`),
  KEY `reply_ibfk_2` (`wid`),
  KEY `reply_ibfk_1` (`did`),
  KEY `reply_ibfk_3` (`uid`),
  CONSTRAINT `reply_ibfk_1` FOREIGN KEY (`did`) REFERENCES `discuss` (`did`),
  CONSTRAINT `reply_ibfk_2` FOREIGN KEY (`wid`) REFERENCES `works` (`wid`),
  CONSTRAINT `reply_ibfk_3` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
INSERT INTO `reply` VALUES ('01234567890123456789012345678900','Good','2018-05-27 17:56:58',24,61,10),('01234567890123456789014545678900','Goodgood','2018-05-28 11:00:00',21,62,10);
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sendmsg`
--

DROP TABLE IF EXISTS `sendmsg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sendmsg` (
  `sendmsg_id` int(11) NOT NULL AUTO_INCREMENT,
  `sendmsg_name` varchar(255) DEFAULT NULL,
  `sendmsg_email` varchar(255) DEFAULT NULL,
  `sendmsg_message` varchar(255) DEFAULT NULL,
  `sendmsg_sdate` datetime DEFAULT NULL,
  PRIMARY KEY (`sendmsg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sendmsg`
--

LOCK TABLES `sendmsg` WRITE;
/*!40000 ALTER TABLE `sendmsg` DISABLE KEYS */;
INSERT INTO `sendmsg` VALUES (1,'Drew','aaa@shop.com','我想问问有没有学习建议类的功能某块？','2018-04-03 11:55:17'),(2,'Drew','bbb@shop.com','我是湘科院的学生，非常希望加入你们。','2018-04-06 21:27:19'),(3,'John','aaa@shop.com','我是来自学的，希望能够学到点东西。','2018-04-06 21:55:11'),(4,'TingWG','18797730132@qq.com','5201314368','2018-04-06 21:57:16'),(5,'HUI','123@shop','Hello very good!','2018-04-06 22:24:18'),(6,'IUH','7867676767','yuyuyu','2018-04-06 22:28:53'),(7,'ENG','dsfsdfsdfdf','dfsdfdfs','2018-04-06 22:31:20'),(8,'HJUI','18797730132@139.com','希望改善下网页的加载速度；优化用户体验。','2018-04-08 00:05:05');
/*!40000 ALTER TABLE `sendmsg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `job` set('学生','老师') DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `state` int(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `mid` int(11) DEFAULT NULL,
  `muid` int(11) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`),
  KEY `FK36EBCB9CC5C288` (`mid`),
  KEY `FK36EBCB8A70213` (`muid`),
  CONSTRAINT `FK36EBCB8A70213` FOREIGN KEY (`muid`) REFERENCES `major_user` (`muid`),
  CONSTRAINT `FK36EBCB9CC5C288` FOREIGN KEY (`mid`) REFERENCES `major` (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'one','111','one','老师','18797730132','18797730132@qq.com',1,NULL,3,1),(2,'two','111','two','学生','18797730132','18797730132@qq.com',1,NULL,5,NULL),(3,'three','three','three','学生','18797730132','18797730132@139.com',1,NULL,10,1),(4,'张三','111','张三','老师','18797730132','18797730132@qq.com',1,NULL,9,NULL),(5,'李四','111','李四','学生','18797730132','18797730132@qq.com',1,NULL,8,NULL),(6,'student','student','student','学生','18797730132','18797730132@qq.com',1,NULL,7,NULL),(7,'student1','student','student','老师','13608451606','13608451606@136.com',1,NULL,2,1),(8,'teacher','teacher','teacher','老师','18797730132','18797730132@qq.com',1,NULL,6,NULL),(9,'John','111','John','学生','18797730132','18797730132@139.com',1,NULL,5,NULL),(10,'aaa','111','aaa','学生','18797730132','aaa@shop.com',1,NULL,1,12),(12,'bbb','bbb','bbb','学生','18797730132','bbb@shop.com',1,NULL,4,13),(13,'aaa2','aaa2','aaa2','学生','18797730132','aaa@shop.com',1,NULL,8,14),(14,'rwjy','rwjy','rwjy','学生','18797730132','aaa@shop.com',1,NULL,12,15),(15,'ty','ty','ty','学生','18797730132','aaa@shop.com',1,NULL,13,16),(16,'wgy','wgy','wgy','学生','18797730132','aaa@shop.com',1,NULL,15,17),(17,'cm','cm','cm','学生','18797730132','aaa@shop.com',1,NULL,18,18),(18,'dx','dx','dx','学生','18797730132','aaa@shop.com',1,NULL,23,19),(19,'tm','tm','tm','学生','18797730132','aaa@shop.com',1,NULL,29,20),(20,'hs','hs','hs','学生','18797730132','aaa@shop.com',1,NULL,34,21),(21,'yw','yw','yw','学生','18797730132','aaa@shop.com',1,NULL,37,22),(22,'my','my','my','学生','18797730132','aaa@shop.com',1,NULL,42,23);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `works`
--

DROP TABLE IF EXISTS `works`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `works` (
  `wid` int(11) NOT NULL AUTO_INCREMENT,
  `wname` varchar(255) NOT NULL,
  `wcontent` text,
  `wimage` varchar(255) DEFAULT NULL,
  `wvedio` varchar(255) DEFAULT NULL,
  `wdate` datetime DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`wid`),
  KEY `uid` (`uid`),
  CONSTRAINT `works_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works`
--

LOCK TABLES `works` WRITE;
/*!40000 ALTER TABLE `works` DISABLE KEYS */;
INSERT INTO `works` VALUES (1,'java学习','java的高级特性:封装，继承，多态...','works/blogpost1.jpg','vedio/video.jpg','2018-03-25 21:51:28',10),(4,'java学习','java的高级特性：封装，继承，多态。。。','works/blogpost1.jpg','vedio/video.jpg','2018-04-04 19:28:39',10),(9,'php','<p>nihao</p>\r\n','works/blogpost1.jpg','vedio/video.jpg','2018-04-04 00:00:00',10),(10,'PYTHON','<p>hello world!</p>\r\n','works/blogpost1.jpg','vedio/video.jpg','2018-04-04 00:00:00',2),(11,'java学习','java的高级特性：封装，继承，多态。。。','works/blogpost1.jpg','vedio/video.jpg','2018-04-04 21:05:52',10),(12,'12','<p>1212</p>\r\n','works/blogpost1.jpg','vedio/video.jpg','2018-04-05 08:44:20',2),(13,'1','<p>11111</p>\r\n','works/blogpost1.jpg','vedio/video.jpg','2018-04-05 08:54:17',2),(15,'湘科院大学生自学交流平台(简章1)','上网管理制度 为维护正常工作秩序，保障计算机网络安全，特制定本规章制度: 一、禁止利用计算机网络从事国家法律法规明令禁止的一切活动。 二、禁止查看和下载国家法律法规明令禁止传播的一切信息。对网络传播的各类新闻要注意甄别，未经正式报道的禁止去公共场合谈论。 三、未经单位领导批准，禁止上网发布与单位相关的一切信息。 四、工作人员使用的计算机实行责任人制度，不得将计算机交由外人使用。 五、工作时间内所有工作人员禁止打游戏、聊天、看录像和听音乐，且前台工作人员工作时间内禁止上网。 六、市劳动就业管理处将不定期进行检查，发现违反上述规定，将及时通报给相关单位领导，按相关规定进行处罚。 七、所有工作人员应加强网络知识的学习，增强信息安全保密意识，无法识别的信息不要下载，无法确定安全的操作，慎重进行，以防被病毒、&ldquo;黑客&rdquo;入侵或对单位和自身造成不良影响及危害。 八、本制度解释权归市劳动就业管理处；本制度中&ldquo;上网&rdquo;是指访问国际互联网，非内部局域网。 九、本制度自印发之日起执行.','works/dancers.jpg','vedio/video.jpg','2018-04-24 21:07:12',10),(17,'JavaScript验证码演示','HTML,CSS,JS\r\n复习\r\n						                    \r\n						                    \r\n						                    \r\n						                    \r\n						                    \r\n						                   ','works/JSvalidationActive.png','vedio/video.jpg','2018-04-13 17:12:43',10),(18,'JavaScript验证码演示','javascript验证需要前提知识准备：\r\nHTML，css，JavaScript \r\n						                    \r\n						                   ','works/JSvalidationActive.png','vedio/video.jpg','2018-04-13 15:21:51',10),(19,'javascript','javascript','works/JSvalidationActive.png','vedio/video.jpg','2018-04-13 21:29:43',10),(20,'HEl','Hello World!                   ','works/blogpost1.jpg','vedio/video.jpg','2018-04-13 21:43:05',10),(21,'GOOD','<p>三好学生</p>\r\n','works/dancerSingleWoman.PNG','vedio/video.jpg','2018-04-24 17:33:59',10),(22,'思想政治教育','马克思主义学院','works/blogpost1.jpg','vedio/video.jpg','2018-04-13 23:27:55',12),(23,'金融工程','金融工程的就业方向有哪些？知道的同学请在下方留言：Thanks,亲们！','works/blogpost1.jpg','vedio/video.jpg','2018-04-13 23:48:35',13),(24,'信息专业','信息与计算科学专业有什么就业前景呀？','works/barnetwork.jpg','vedio/video.jpg','2018-04-24 21:08:46',10),(25,'法学专业','法学专业是不是就是以后会从事律师的工作？\r\n欢迎大家讨论！','works/blogpost1.jpg','vedio/video.jpg','2018-04-14 00:32:30',14),(26,'瑜伽','瑜伽（英文：Yoga，印地语：योग）是一个汉语词汇，最早是从印度梵语“yug”或“yuj”而来，其含意为“一致”、“结合”或“和谐”。瑜伽源于古印度，是古印度六大哲学派别中的一系，探寻“梵我合一”的道理与方法。而现代人所称的瑜伽则是主要是一系列的修身养心方法。\r\n大约在公元前300年，印度的大圣哲瑜伽之祖帕坦伽利（英文：Patanjali，印地语：पतंजलि）创作了《瑜伽经》，印度瑜伽在其基础上才真正成形，瑜伽行法被正式订为完整的八支体系。瑜伽是一个通过提升意识，帮助人类充分发挥潜能的体系。\r\n瑜伽姿势运用古老而易于掌握的技巧，改善人们生理、心理、情感和精神方面的能力，是一种达到身体、心灵与精神和谐统一的运动方式，包括调身的体位法、调息的呼吸法、调心的冥想法等，以达至身心的合一。\r\n瑜伽是一项有着5000年历史的关于身体、心理以及精神的练习，起源于印度，其目的是改善您的身体和心性。2014年12月11日，联大宣布6月21日为国际瑜伽日，2015年举办了首届6.21国际瑜伽日。\r\n瑜伽分为两大类:一个是古典瑜伽，一个是现代瑜伽，现在还包括了正位瑜伽。','works/youja.jpg','vedio/video.jpg','2018-04-14 13:09:08',15),(27,'射箭运动','射箭，即箭术（Archery），助弓的弹力将箭射出，在一定的距离内比赛准确性的体育运动项目，为射箭运动。远在1万年前的中石器时代，人类就发明了弓箭来狩猎捕鱼，之后弓箭又是用于战争的武器之一，现弓箭作为人们喜欢的体育运动项目存在下来。射箭的渊源可追溯到大约公元前5万年，曾经在古代的非洲、欧洲、亚洲等地区流行。中国早在旧石器时代晚期就发明了弓箭，弓箭一直是人们狩猎和军队打仗的重要武器。现代射箭运动于14世纪起源于英国，它由武士的军事需要演变成娱乐运动。16世纪出现了三种射箭的运动形式：第一种是对靶射箭，第二种是地靶射箭，第三种是漫游射箭。三项重要的世界射箭锦标赛是：世界室外射箭锦标赛，世界室内射箭锦标赛以及世界野外射箭锦标赛。 \r\n观众的观赛行为像一把双刃剑，只有正确地使用它才能让观众成为整个精彩射箭比赛中不可或缺的组成部分。不文明的观赛行为，不合时宜的鼓掌加油都可能影响射箭运动员技术的稳定发挥。因此，观众在观看比赛时应做文明观众，严格遵守以下要求：\r\n（1) 到指定的观众席位就座。由于射箭比赛存在着一定的危险性，所以一定要按照赛场的要求到指定的地点就座，不要到禁区，以免发生危险。\r\n（2）严禁在比赛场地内大声喧哗、打闹、争斗和吸烟。手机要关机或设置在振动、静音状态。在运动员发箭时一定要保持赛场安静，以免影响运动员的注意力。\r\n（3）不要吝啬鼓掌。在运动员射出一支精准的好箭后，观众应报以热烈的掌声；即使射出的不是好箭，也应鼓掌予以鼓励，而不要嘘声四起，鼓倒掌。\r\n（4）对运动员的支持要适时。应该知道在适当的时候对运动员予以支持，爆发掌声，当运动员正在瞄准，将要发射时，千万不要突然爆发声响，这是观赏射箭比赛时特别要注意的。\r\n（5）爱护公共设施，保持场内清洁。不要随地乱扔纸屑、果皮和空瓶罐等。 \r\n						                   ','works/shut.png','vedio/video.jpg','2018-04-14 16:54:02',15),(28,'跑步','跑步的定义是指陆生动物使用足部移动。它在运动上的定义是一种步伐，双脚不会同一时间踫到地面。它亦可以是一种有氧的运动或厌氧的运动。 \r\n						                    \r\n						                   ','works/runer.jpg','vedio/video.jpg','2018-04-14 16:39:45',15),(29,'乒乓球握拍方法','直拍：\r\n（1）快攻型握拍法。拍前食指第二指节和拇指第一节在拍的前面呈钳型，两指间在距离1～2cm，拍柄贴住虎口，另外三指自然弯曲贴于球拍后的1/3上端。\r\n（2）弧圈型握拍法。弧圈型握拍法与快攻型握拍法基本相同，其区别是：拇指和食指形成一个小环状，其他三指在拍背面自然重叠，由中指的第一指关节顶于拍柄的延长线上。\r\n横拍：\r\n横拍握拍法如同握手一样。中指、无名指、小指自然弯曲握住拍柄，大拇指在球拍正面靠近中指，食指自然伸直，斜放于球拍背面。正手攻球时，食指稍向上移动，反手攻球时，拇指稍向上移动。','works/pingpang.jpg','vedio/video.jpg','2018-04-14 16:46:14',15),(30,'music tools','中国乐器:（1） 吹奏乐器：如笙、芦笙、排笙、葫芦丝、笛、管子、巴乌、埙、唢呐、箫，等。 （2） 弹拨乐器：如琵琶、筝、扬琴、七弦琴(古琴)、热瓦普、冬不拉、阮、柳琴、三弦、月琴、弹布尔，等。 （3） 打击乐器：如堂鼓(大鼓)、碰铃、缸鼓、定音缸鼓、铜鼓、大锣小锣、小鼓、排鼓、达卜(手鼓)、大钹，等。 （4） 拉弦乐器：如二胡、板胡、革胡、马头琴、艾捷克、京胡、中胡、高胡，等。 西洋乐器包括:弦乐器,木管乐器,铜管乐器,键盘乐器,打击乐器 \r\n						                    \r\n						                    \r\n						                    \r\n						                    \r\n						                    \r\n						                    \r\n						                   ','works/music01.jpg','vedio/video.jpg','2018-04-14 20:37:28',21),(31,'英语学习','坚持“多说”、“多听”、“多读”、“多写”，那么你的英语成绩肯定会很出色。\r\n一、多“说”。 \r\n自己多创造机会与英语教师多讲英语，见了同学，尤其是和好朋友在一起时尽量用英语去问候，谈心情……这时候你需随身携带一个英汉互译小词典，遇到生词时查一下这些生词，也不用刻意去记，用的多了，这个单词自然而然就会记住。千万别把学英语当成负担，始终把它当成一件有趣的事情去做。 \r\n或许你有机会碰上外国人，你应大胆地上去跟他打招呼，和他谈天气、谈风景、谈学校……只是别问及他的年纪，婚史等私人问题。尽量用一些你学过的词汇，句子去和他谈天说地。不久你会发现与老外聊天要比你与中国人谈英语容易的多。因为他和你交谈时会用许多简单词汇，而且不太看重说法，你只要发音准确，准能顺利地交流下去。只是你必须要有信心，敢于表达自己的思想。 \r\n如果没有合适的伙伴也没关系，你可以拿过一本书或其它什么东西做假想对象，对它谈你一天的所见所闻，谈你的快乐，你的悲伤等等，长此坚持下去你的口语肯定会有较大的提高。 \r\n二、多“听” \r\n寻找一切可以听英语的机会。别人用英语交谈时，你应该大胆地去参与，多听听各种各样人的发音，男女老少，节奏快的慢的你都应该接触到，如果这样的机会少的话，你可以选择你不知内容的文章去听，这将会对你帮助很大，而你去听学过的课文的磁带，那将会对你的语言语调的学习有很大的帮助。 \r\n三、多“读”。 \r\n“读”可以分为两种。一种是“默读”。每天给予一定时间的练习将会对你提高阅读速度有很大的好处，读的内容可以是你的课本，但最好是一些有趣的小读物，因为现在的英语高考越来越重视阅读量和阅读速度。每道题的得分都与你的理解程度有很大关系，所以经过高中三年阅读的训练后，你必定会在高考中胜券在握。 另一种是“朗读”这是学语言必不可少的一种学习途径。 \r\n四、多“写” \r\n有的同学总是抱怨时间紧，根本没时间写作文。其实“写”的形式很多，不一定就写作文才提高写作能力。比如写下你一天中发生的一些重要的事情，或当天学了某一个词组，你可以创设一个语境恰如其份地用上这个词。这样即可帮你记住这个词的用法，又可以锻炼你的写作能力\r\n学习英语不用花大块的时间，10分钟的散步可以练\"说\",吃完饭后可以读一会儿英语小说，睡前听几分钟英语，可以使你得到更好地休息……只要你每天抽出一些时间来练英语，你的英语成绩肯定会很快提高的。\r\n方法二：\r\n常有人问：学英语有什么诀窍？说老实话，要想掌握一种语言，在缺乏必要的语言环境的条件下，实在没有什么捷径可走。 \r\n概括起来，只有四个字：下苦功夫。我这绝对不是随便说说漂亮话而已。 凭我这几年学习英语的体会，只有日积月累，通过量变，才有可能实现质的飞跃。记得曾经有一段时间，在下了一番苦功夫之后，我仍感到自己的英语水平提高的太慢，于是就故意放松了几天。谁知等到再从新开始学习时，才明显的感觉到自己退步了许多。从那以后，我就给自己制定了这样一条座右铭：“拳不离手，曲不离口”，持之以恒。学好英语，兴趣很重要。正如爱因斯坦所说“兴趣是最好的老师”。学习英语的兴趣大大激发了我的求知欲。有人说，英语水平高是将来找到理想的工作甚至出国的资本。 这固然不错，但除此之外，我更觉得，英语是一扇窗口，他向我们展示的是一片广阔的天地，一派新奇的景象。当我能够用英语同外国朋友交流，了解国外的社会、历史、科学和文化，并取得第一手资料时，我才真正的领悟了掌握一种语言的妙处。 \r\n学好英语，一套科学的学习方法是必不可少的。由于个人实际情况不同，生搬硬套是行不通的。 但我相信：只要仔细体会，逐渐摸索，人人都可以创造出一套有特色并且行之有效的学习方法。在这里，我想同大家谈谈我在学习英语过程中的一些体会，以供参考。 尽管在中学时我的英语基础不错，但刚跨入大学校门的时候，我还是深深地感到了自己的差距。 要具备一定的听、说、读、写能力，首先要掌握五千到八千词汇。而作为一个高中毕业生，我当时的词汇量真是少得可怜。于是，我决定把迅速扩大词汇量作为主要突破口。 有的同学喜欢背大部头的词汇手册，而我觉得这样做，既枯燥，又不利于灵活运用。我于是就把着眼点放到了阅读上，词汇与阅读齐头并进，产生了事半功倍的效果。 为了迅速扩大词汇量我从一开始就选择一些当时对我们来说难度偏大的阅读材料。上千字的文章，通常会有二、三十个生词。这些文章涉及的范围很广，包括了多个领域的词汇。 \r\n我通常采取“两遍阅读法”，即第一遍着重训练阅读能力，第二遍着重扩大词汇量并培养语感。起初进行阅读训练时，我参考了《Active Readers》这本书。 首先从提高阅读速度入手。集中精力阅读一篇长度适中的文章，记下起止时间，并计算单位时间的阅读量。迫使自己进行快速阅读，便成了我的习惯。 在第一遍阅读过程中，我将重点放在训练速度，掌握文章大意及基本结构上，并找出问题，以便进一步阅读时着重解决。 第二遍阅读的重点有两个：一是扩大词汇量。具体做法是：把文章再过一遍，查出生单词，记到小笔记本上，有时间就拿出来背。 背单词，我从不利用整时间。当学习别的内容效率较低的时候，对我来说，背单词最合适。每次背的时间不一定很长，贵在多次反复。 当时我使用的是英汉词典，因为我觉得英文解释不便于记忆。而在扩大词汇量的初期阶段了解词的释意最为重要。就这样，随着阅读量的增加，面的扩宽，我的词汇量也就突飞猛进了。 只是到了后来准备TOEFL、GRE等考试时，我才开始背词汇手册，并使用英文解释，以了解词的确切含义及使用的语言环境。 \r\n第二遍阅读的第二个重点在于培养语感。仔细地体会精彩的语言，留意词的使用以及搭配，对某些段落我常出声朗读，甚至背诵下来。 这样做，有利于加强语感；为写作打基础。通过这种两遍阅读法，所读内容在我头脑中留下的印象一般都很深刻，而且也提高了阅读材料的利用率。 我十分重视阅读材料的选择。不单从兴趣出发，相反，有意识地读一些自己不甚了解、甚至不大感兴趣的科普、历史、哲学等方面的文章。另外，针对不同的训练目的，我还选取了内容难度不同的阅读材料。 例如，进行快速阅读时，可以选择生词量较小、篇幅较短的文章；而重点在扩大词汇量、拓宽视野的阅读训练，就选择英美报刊杂志。此外，我还注重循序渐进，根据不同阶段自己英语水平的变化选择相应的阅读材料。 在听、说、读、写四个方面，我从“读”中受益无穷。通过有意识的大量阅读、一方面扩大了词汇量，另一方面培养了语感。而这两方面我认为是掌握一种语言的两大支柱。 至于听、说、写三个环节，我其实并没有经过什么特殊的训练。读的东西多了，词汇量足够大，语感足够强，只要多加练习，这三方面的能力也就自然而然的提高了。 \r\n在听、说方面，英文广播以及原版电影都是极好的传播媒介。另外，利用一切可能的机会同外国朋友交谈，并着力模仿，都颇有成效。至于写作，在阅读量还不足的初始阶段，我并不急于自己动笔写，而是学习、模仿一些经典篇章。 《新概念英语》第三册，还有精读课本中的一些精彩篇章，我都背过，并常利用早晨的时间大声朗读，或者收听广播。这样一来，耳朵里听到、眼睛里看到了地道的英语，久而久之，自己也就学会说、学会写了。 有人问我：怎样才能在各种英语测试中取得高分。实际上，我并没有什么专门的应试对策。在听、说，读、写能力逐步提高的基础上，只要稍微做一些模拟试题，了解各种测试特点，成绩就自然不会坏。 我认为，与其到考试前夕，搞题海战术，倒还不如踏踏实实、一点一滴的积累。 在我看来，学好英语的“诀窍”无非是苦干加巧干。因为我深信：功到自然成。','works/3Danimal.gif',NULL,'2018-04-14 21:52:43',16),(32,'如何培养自己学习英语的兴趣呢？','1 实时在线，让孩子主动掌握学习的节奏；\r\n2 全球外教，给孩子专业的英语教育；\r\n3 因材施教，每个孩子都有自己专属的课程\r\n4全程掌握，家长随时了解孩子的学习效果','works/wgy.jpg',NULL,'2018-04-14 21:54:22',16),(33,'AnimalsDancer','<p><strong>动物世界的舞者...</strong><br />\r\n&nbsp;</p>\r\n','works/3Danimal.gif',NULL,'2018-04-14 23:19:25',16),(34,'广播电视学专业','<p>广播电视学专业学的是什么专业！<br />\r\n&nbsp;</p>\r\n','works/blogpost1.jpg',NULL,'2018-04-15 00:05:47',17),(35,'电子与信息工程学院','<p>学院现设有电子科学与技术、电子信息工程、通信工程、计算机科学与技术、软件工程、教育技术学、机械设计制造及其自动化七个本科专业。</p>\r\n','works/computer.jpg',NULL,'2018-04-15 11:56:06',18),(36,'信息工程','<p><strong>电子信息工程的毕业生的知识和能力：</strong></p>\r\n\r\n<p>1．能够较系统地掌握本专业领域宽广的技术基础理论知识，适应电子和信息工程方面广泛的工作范围</p>\r\n\r\n<p>2．掌握电子电路的基本理论和实验技术，具备分析和设计电子设备的基本能力；</p>\r\n\r\n<p>3．掌握信息获取、处理的基本理论和应用的一般方法，具有设计、集成、应用及计算机模拟信息系统的基本能力；</p>\r\n\r\n<p>4．了解信息产业的基本方针、政策和法规，了解企业管理的基本知识；</p>\r\n\r\n<p>5．了解电子设备和信息系统的理论前沿，具有研究、开发新系统、新技术的初步能力；</p>\r\n\r\n<p>6．掌握文献检索、资料查询的基本方法，具有一定的科学研究和实际工作能力。</p>\r\n','works/barnetwork.jpg',NULL,'2018-04-15 14:33:48',18),(37,'电子信息工程的主干学科：','<p>一、主干学科：</p>\r\n\r\n<p>① 电子科学技术；</p>\r\n\r\n<p>② 信息与通信工程；</p>\r\n\r\n<p>③ 计算机科学与技术。</p>\r\n\r\n<p>二、主要课程：</p>\r\n\r\n<p>① 电路理论系列课程；</p>\r\n\r\n<p>② 计算机技术系列课程；</p>\r\n\r\n<p>③ 信息理论与编码；</p>\r\n\r\n<p>④ 信号与系统；</p>\r\n\r\n<p>⑤ 数字信号处理；</p>\r\n\r\n<p>⑥ 电磁场理论；</p>\r\n\r\n<p>⑦ 自动控制原理、感测技术等</p>\r\n','works/phonenet.jpg',NULL,'2018-04-15 14:36:33',18),(38,'土木工程专业','<p><strong>专业特色：</strong></p>\r\n\r\n<p>该专业以培养优秀&ldquo;复合型&rdquo;工程技术人才为目标，着力为国内外名校的更高层次教育和国家的基本建设输送优秀毕业生。该专业现有：工程结构、土木工程材料、土工、工程测量等4个专业实验室，具有结构工程硕士点，建筑与土木工程领域工程硕士招生资格。在专业培养中，强调扎实的理论基础和宽广的知识面，重点培养学生的动手能力和创新意识。培养的毕业生已在国家的建设领域发挥着积极作用，其中部分学生已成长为设计院院长，企业总工程师，部门经理或技术骨干；部分学生进入国内外著名高校深造：</p>\r\n\r\n<p><strong>知识技能：</strong></p>\r\n\r\n<p>1.空间想象力。建筑本身功能决定它立体的东西，通过平面的点线能想象到它在实际空间的实际形态是一个最基本的要求。</p>\r\n\r\n<p>2.力学学习、应用能力。没有良好的力学基础是不可能学好土木工程这个专业的。</p>\r\n\r\n<p>3.认真、细致的作风。任何一门学科都是严谨的，土木工程也一样。无论将来做设计、施工还是监理，你的&ldquo;作品&rdquo;（建筑物）都关系到人民的生命和财产安全，所以必须认真、细致。</p>\r\n\r\n<p>4.较强的动手能力。这里的动手能力是指发现问题、解决问题的能力。土木工程就是实践，它重在落实与操作，在生产过程中会遇到各种各样的问题、困难，这就要求有扎实的理论知识和丰富的实践经验来处理、解决问题。</p>\r\n\r\n<p>5.吃苦耐劳的精神。建筑行业本身就是一个辛苦的代名词，从事这个行业就一定要有吃苦耐劳的精神。</p>\r\n\r\n<p><strong>实践范围：</strong></p>\r\n\r\n<p>包括工程制图、认识实习、测量实习、工程地质实习、专业实习或生产实习、结构课程设计、毕业设计或毕业论文等，一般安排40周左右。</p>\r\n','works/tm.jpg',NULL,'2018-04-15 15:51:23',19),(39,'生物技术的就业方向','<p>毕业生的就业范围包括化工、石油、冶金、能源、轻工、医药、环保等部门的厂矿企业、科研机构、教学单位等。</p>\r\n','works/lab.png',NULL,'2018-04-15 16:14:44',20),(40,'孔雀舞蹈','<p>孔雀舞，是我国傣族民间舞中最负盛名的传统表演性舞蹈，流布于云南省德宏傣族景颇族自治州的瑞丽、潞西及西双版纳、孟定、孟达、景谷、沧源等傣族聚居区，其中以云南西部瑞丽市的孔雀舞（傣语为&quot;嘎洛勇&quot;）最具代表性。相传一千多年前傣族领袖召麻栗杰数模仿孔雀的优美姿态而学舞，后经历代民间艺人加工成型，流传下来，形成孔雀舞。</p>\r\n','works/blogpost1.jpg',NULL,'2018-04-15 17:12:30',21),(41,'舞蹈','<p>舞蹈是一种表演艺术，使用身体来完成各种优雅或高难度的动作，一般有音乐伴奏，以有节奏的动作为主要表现手段的艺术形式。它一般借助音乐，也借助其他的道具。舞蹈本身有多元的社会意义及作用，包括运动、社交/求偶、祭祀、礼仪等。在人类文明起源前，舞蹈在仪式，礼仪，庆典和娱乐方面都十分重要。中国在五千年以前就已经出现了舞蹈，它产生于奴隶社会，发展到秦汉之际已形成一定特色。</p>\r\n','works/latin.png',NULL,'2018-04-15 16:35:45',21),(42,'美术设计','<p>美术设计是一种构想或计划，以及把这种构想或计划通过一定的审美观念和表现手法使其视觉化、形象化的创作过程。</p>\r\n','works/freeYouMind.png',NULL,'2018-04-15 17:19:30',22),(43,'素描','<p>素描是绘画的基础，绘画的骨骼；也是最节制、最需要理智来协助的艺术。初学绘画的人一定要先学素描，素描画得好的人，油画自然画得好。素描的起源，普通都是以文艺复兴开始，事实上希腊的瓶绘、雕塑都有良好的素描基础。初期的素描是视为绘画的底稿，例如作壁画先要有构想的草稿，然后有素描的底稿，同时也要有手、脸部分精密素描图。作壁画习惯上是不看模特儿写生的，完全要靠事先准备的习作素描和画家的记忆。近代素描，已脱离了原来的底稿和及作的地位，可以成为艺术品来欣赏。画素描的态度不只培养描写力，同时也培养造型的能力，最后仅仅是素描也可视为作品来欣赏。相反的单看油画作品就可知道作者在素描上的造诣如何。因此，素描是绘画的基础，也是绘画的骨骼，是初学画的人无论如何要先认真学素描。素描在严格的解释上，只有单色的黑与白，但如加上淡彩或颜色，仍可认作素描。</p>\r\n\r\n<p>君友会美术文献依素描的表现方法分成：</p>\r\n\r\n<p>一、以描画材料来看可分成木炭素描、铅笔素描、炭精素描、钢笔素描、银笔素描、毛笔素描等。</p>\r\n\r\n<p>二、以所画的题材可分成石膏像素描，风景素描，静物素描、人体素描、幻想素描。</p>\r\n\r\n<p>三、依素描的目的又可分成作为构想的素描、用作画稿的素描、速写、作品、习作。</p>\r\n','works/sumiao.png','vedio/video.jpg','2018-04-15 17:23:20',22),(44,'视觉冲击','<p>视觉冲击就是运用视觉艺术，使你的视觉感官受到深刻影响，能给你留下深刻印象。他的表现手法可以通过造型、颜色等展现出来，直达视觉感官。</p>\r\n','works/moonbar.PNG',NULL,'2018-04-15 18:10:43',22),(45,'平面设计','<p><strong>平面设计（graphic design）</strong>，也称为视觉传达设计，是以&ldquo;视觉&rdquo;作为沟通和表现的方式，透过多种方式来创造和结合符号、图片和文字，借此作出用来传达想法或讯息的视觉表现。平面设计师可能会利用字体排印、视觉艺术、版面（page layout）、电脑软件等方面的专业技巧，来达成创作计划的目的。平面设计通常可指制作（设计）时的过程，以及最后完成的作品。</p>\r\n\r\n<p>平面设计的<strong><em>常见用途</em></strong>包括标识（商标和品牌）、出版物（杂志，报纸和书籍）、平面广告，海报，广告牌，网站图形元素、标志和产品包装。例如，产品包装可能包括的商标或其他的艺术作品、编排文本和纯粹的设计元素，如风格统一的图像，形状，大小和颜色。组合是平面设计的最重要的特性之一，尤其是当产品使用预先存在的材料或多种元素融合。</p>\r\n','works/pingmian.png',NULL,'2018-04-15 18:13:00',22),(46,'信息与计算科学','<p>信息，计算，编程<br />\r\n&nbsp;</p>\r\n','works/jobnet.jpg','vedio/video.jpg','2018-04-24 21:03:50',10);
/*!40000 ALTER TABLE `works` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-07 15:51:52
