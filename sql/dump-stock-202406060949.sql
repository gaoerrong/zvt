-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: localhost    Database: stock
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '数据库自增id',
  `source` varchar(512) DEFAULT NULL COMMENT '新闻来源',
  `href` varchar(2048) NOT NULL COMMENT '新闻链接',
  `title` varchar(512) NOT NULL COMMENT '新闻标题',
  `create_date` datetime DEFAULT NULL COMMENT '新闻创建时间',
  `feature` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '扩展属性',
  `type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`),
  UNIQUE KEY `news_UN_title_create_date` (`title`,`create_date`),
  KEY `news_create_date_IDX` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=760443 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stock_index`
--

DROP TABLE IF EXISTS `stock_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_index` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `index_name` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '指标英文名称',
  `index_cn_name` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '指标中文名称',
  `gmt_create` datetime NOT NULL COMMENT '指标创建时间',
  `description` varchar(4096) DEFAULT NULL COMMENT '指标详细描述',
  `index_id` varchar(1024) NOT NULL COMMENT '指标id',
  `group_id` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '指标分类id',
  `group_name` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '指标分类英文名称',
  `group_cn_name` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '指标分类中文名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stock_index_UN` (`index_name`),
  KEY `stock_index_group_id_IDX` (`group_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32994 DEFAULT CHARSET=utf8mb3 COMMENT='股票指标表，存储有哪些指标';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stock_index_category`
--

DROP TABLE IF EXISTS `stock_index_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_index_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime NOT NULL COMMENT '指标创建时间',
  `description` varchar(4096) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '指标详细描述',
  `country` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '国家',
  `first_category_id` varchar(100) DEFAULT NULL COMMENT '一级指标id',
  `first_category_cn_name` varchar(256) DEFAULT NULL COMMENT '一级指标中文名称',
  `second_category_id` varchar(100) DEFAULT NULL COMMENT '二级指标id',
  `second_category_cn_name` varchar(1024) DEFAULT NULL COMMENT '二级指标中文名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stock_index_category_UN` (`first_category_id`,`second_category_id`),
  KEY `stock_index_category_country_IDX` (`country`) USING BTREE,
  KEY `stock_index_category_first_category_id_IDX` (`first_category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=802 DEFAULT CHARSET=utf8mb3 COMMENT='股票指标表，存储有哪些指标';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stock_index_data`
--

DROP TABLE IF EXISTS `stock_index_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_index_data` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `index_create_date` datetime DEFAULT NULL COMMENT '指标时间',
  `index_value` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '指标值',
  `index_name` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '指标英文名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stock_index_data_UN` (`index_create_date`,`index_name`),
  KEY `stock_index_data_index_name_IDX` (`index_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=44957811 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'stock'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-06  9:49:13
