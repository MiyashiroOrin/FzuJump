-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: fzujump
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `code` int NOT NULL COMMENT '编号',
  `permissionName` varchar(32) DEFAULT NULL COMMENT '权限名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,1,'用户管理'),(2,2,'角色管理'),(3,3,'成绩管理'),(4,4,'日志管理');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `rolename` varchar(32) NOT NULL COMMENT '角色名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'组长'),(2,'全栈工程师'),(3,'后端工程师'),(4,'前端工程师'),(5,'测试人员'),(6,'摄影师'),(7,'用户');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permission`
--

DROP TABLE IF EXISTS `role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_permission` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `roleId` int NOT NULL COMMENT '角色id',
  `permissionId` int NOT NULL COMMENT '权限id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permission`
--

LOCK TABLES `role_permission` WRITE;
/*!40000 ALTER TABLE `role_permission` DISABLE KEYS */;
INSERT INTO `role_permission` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,2,1),(6,3,1),(7,4,4),(8,5,1),(9,6,3),(10,7,4);
/*!40000 ALTER TABLE `role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score`
--

DROP TABLE IF EXISTS `score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `score` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `userName` varchar(15) DEFAULT NULL COMMENT '用户名称',
  `userRole` bigint DEFAULT NULL COMMENT '用户角色（取自角色表-角色id）',
  `JumpFrequency` bigint DEFAULT NULL COMMENT '跳跃次数',
  `ItemNumber` bigint DEFAULT NULL COMMENT '道具数',
  `modifyDate` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=123457 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score`
--

LOCK TABLES `score` WRITE;
/*!40000 ALTER TABLE `score` DISABLE KEYS */;
INSERT INTO `score` VALUES (1,'赵郑豪',1,25,27,NULL),(2,'张晓彤',5,35,31,NULL),(3,'李志取',3,29,30,NULL),(4,'苏小林',2,34,28,NULL),(5,'陈雨昕',3,27,30,NULL),(6,'余绍弘',3,36,39,NULL),(7,'陈俊宏',2,27,21,NULL),(8,'李雨晴',4,29,34,NULL),(9,'黄宁',4,38,31,NULL),(10,'林嗣',6,24,20,NULL),(11,'连道鑫',7,40,34,NULL),(12,'林卢希',7,27,30,NULL);
/*!40000 ALTER TABLE `score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `usercode` varchar(32) DEFAULT NULL COMMENT '用户账号',
  `username` varchar(32) NOT NULL COMMENT '用户姓名',
  `password` varchar(64) NOT NULL DEFAULT '123456' COMMENT '用户密码',
  `roleId` int NOT NULL COMMENT '角色id',
  `headPic` varchar(255) DEFAULT NULL COMMENT '头像描述',
  `state` int DEFAULT '0' COMMENT '是否离职0：未离职1：已离职',
  `tel` varchar(11) DEFAULT NULL COMMENT '电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `address` varchar(200) DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'032002414','李志取','$2a$10$ldDVP5nvNViT09iafdz3p.AA8W/RKIusoeO6noI/y6Gajj0bCS5lC',3,'1',0,'18359597989','2207750450@qq.com',NULL),(2,'032002439','张晓彤','$2a$10$ldDVP5nvNViT09iafdz3p.AA8W/RKIusoeO6noI/y6Gajj0bCS5lC',5,NULL,0,NULL,NULL,NULL),(3,'032002440','赵郑豪','$2a$10$ldDVP5nvNViT09iafdz3p.AA8W/RKIusoeO6noI/y6Gajj0bCS5lC',1,NULL,0,NULL,NULL,NULL),(4,'032002431','苏小林','$2a$10$ldDVP5nvNViT09iafdz3p.AA8W/RKIusoeO6noI/y6Gajj0bCS5lC',2,NULL,0,NULL,NULL,NULL),(5,'032002402','陈雨昕','$2a$10$ldDVP5nvNViT09iafdz3p.AA8W/RKIusoeO6noI/y6Gajj0bCS5lC',3,NULL,0,NULL,NULL,NULL),(6,'032002413','李雨晴','$2a$10$ldDVP5nvNViT09iafdz3p.AA8W/RKIusoeO6noI/y6Gajj0bCS5lC',4,NULL,0,NULL,NULL,NULL),(7,'032002418','林嗣','$2a$10$ldDVP5nvNViT09iafdz3p.AA8W/RKIusoeO6noI/y6Gajj0bCS5lC',5,NULL,0,NULL,NULL,NULL),(8,'032002106','陈俊宏','$2a$10$ldDVP5nvNViT09iafdz3p.AA8W/RKIusoeO6noI/y6Gajj0bCS5lC',2,NULL,0,NULL,NULL,NULL),(9,'032002118','黄宁','$2a$10$ldDVP5nvNViT09iafdz3p.AA8W/RKIusoeO6noI/y6Gajj0bCS5lC',4,NULL,0,NULL,NULL,NULL),(10,'032002336','余绍弘','$2a$10$ldDVP5nvNViT09iafdz3p.AA8W/RKIusoeO6noI/y6Gajj0bCS5lC',3,NULL,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-16 19:19:30
