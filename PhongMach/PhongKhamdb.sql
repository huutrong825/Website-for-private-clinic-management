-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: phongkhamdb
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `benh`
--

DROP TABLE IF EXISTS `benh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `benh` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tenBenh` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `benh`
--

LOCK TABLES `benh` WRITE;
/*!40000 ALTER TABLE `benh` DISABLE KEYS */;
INSERT INTO `benh` VALUES (1,'Bệnh thần kinh'),(2,'Bệnh hô hấp'),(3,'Bệnh da liễu'),(4,'Bệnh tim mạch'),(5,'Bệnh tai mũi họng');
/*!40000 ALTER TABLE `benh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `benhnhan`
--

DROP TABLE IF EXISTS `benhnhan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `benhnhan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maBN` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sex` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ngaySinh` date DEFAULT NULL,
  `diaChi` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `canNang` float DEFAULT NULL,
  `chieuCao` float DEFAULT NULL,
  `huyetAp` float DEFAULT NULL,
  `ngaykham` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `benhnhan`
--

LOCK TABLES `benhnhan` WRITE;
/*!40000 ALTER TABLE `benhnhan` DISABLE KEYS */;
INSERT INTO `benhnhan` VALUES (2,'BN0002','Nguyễn Thiện Thuật','Nam','1993-01-13','Hồ Chí Minh','661-20-965',55,168,120,'2020-12-11'),(3,'BN0001','Trần Mạnh','Nam','1999-01-01','Lâm Đồng','2557876728',49,150,123,'2020-12-13');
/*!40000 ALTER TABLE `benhnhan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chitiet_donthuoc`
--

DROP TABLE IF EXISTS `chitiet_donthuoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chitiet_donthuoc` (
  `donthuoc_id` int NOT NULL,
  `thuoc_id` int NOT NULL,
  `soluong` int DEFAULT NULL,
  `donvi` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cachdung` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dongia` float DEFAULT NULL,
  PRIMARY KEY (`donthuoc_id`,`thuoc_id`),
  KEY `thuoc_id` (`thuoc_id`),
  CONSTRAINT `chitiet_donthuoc_ibfk_1` FOREIGN KEY (`donthuoc_id`) REFERENCES `donthuoc` (`id`),
  CONSTRAINT `chitiet_donthuoc_ibfk_2` FOREIGN KEY (`thuoc_id`) REFERENCES `thuoc` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitiet_donthuoc`
--

LOCK TABLES `chitiet_donthuoc` WRITE;
/*!40000 ALTER TABLE `chitiet_donthuoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `chitiet_donthuoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doanh_thu`
--

DROP TABLE IF EXISTS `doanh_thu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doanh_thu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ngay` date DEFAULT NULL,
  `countBN` int DEFAULT NULL,
  `doanhThu` float DEFAULT NULL,
  `ti_le` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doanh_thu`
--

LOCK TABLES `doanh_thu` WRITE;
/*!40000 ALTER TABLE `doanh_thu` DISABLE KEYS */;
/*!40000 ALTER TABLE `doanh_thu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donthuoc`
--

DROP TABLE IF EXISTS `donthuoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donthuoc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maDon` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `soluong` int DEFAULT NULL,
  `donVi` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cachdung` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `benhnhan_id` int NOT NULL,
  `hoadon_id` int DEFAULT NULL,
  `nhanvien_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `benhnhan_id` (`benhnhan_id`),
  KEY `hoadon_id` (`hoadon_id`),
  KEY `nhanvien_id` (`nhanvien_id`),
  CONSTRAINT `donthuoc_ibfk_1` FOREIGN KEY (`benhnhan_id`) REFERENCES `benhnhan` (`id`),
  CONSTRAINT `donthuoc_ibfk_2` FOREIGN KEY (`hoadon_id`) REFERENCES `hoadon` (`id`),
  CONSTRAINT `donthuoc_ibfk_3` FOREIGN KEY (`nhanvien_id`) REFERENCES `nhan_vien` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donthuoc`
--

LOCK TABLES `donthuoc` WRITE;
/*!40000 ALTER TABLE `donthuoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `donthuoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_bn`
--

DROP TABLE IF EXISTS `ds_bn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ds_bn` (
  `benhnhan_id` int NOT NULL AUTO_INCREMENT,
  `chandoan` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dieutri` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`benhnhan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_bn`
--

LOCK TABLES `ds_bn` WRITE;
/*!40000 ALTER TABLE `ds_bn` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_bn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoadon`
--

DROP TABLE IF EXISTS `hoadon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoadon` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maHD` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ngaylap` date DEFAULT NULL,
  `tienKham` float DEFAULT NULL,
  `phieukham_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `phieukham_id` (`phieukham_id`),
  CONSTRAINT `hoadon_ibfk_1` FOREIGN KEY (`phieukham_id`) REFERENCES `phieukham` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoadon`
--

LOCK TABLES `hoadon` WRITE;
/*!40000 ALTER TABLE `hoadon` DISABLE KEYS */;
/*!40000 ALTER TABLE `hoadon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loai_thuoc`
--

DROP TABLE IF EXISTS `loai_thuoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loai_thuoc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `loai` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `benh_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `benh_id` (`benh_id`),
  CONSTRAINT `loai_thuoc_ibfk_1` FOREIGN KEY (`benh_id`) REFERENCES `benh` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loai_thuoc`
--

LOCK TABLES `loai_thuoc` WRITE;
/*!40000 ALTER TABLE `loai_thuoc` DISABLE KEYS */;
INSERT INTO `loai_thuoc` VALUES (1,'Thuốc tim mạch',4),(2,'Thuốc da liễu',3),(3,'Thuốc tai mũi họng',5),(4,'Thuốc ho long đờm',2),(5,'Thuốc rối loạn tiền đình',1),(6,'Thuốc thần kinh, động kinh',1);
/*!40000 ALTER TABLE `loai_thuoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nhan_vien`
--

DROP TABLE IF EXISTS `nhan_vien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhan_vien` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sex` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ngaySinh` date DEFAULT NULL,
  `diaChi` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nghiepVu` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chuyenMon` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `User_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `User_id` (`User_id`),
  CONSTRAINT `nhan_vien_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhan_vien`
--

LOCK TABLES `nhan_vien` WRITE;
/*!40000 ALTER TABLE `nhan_vien` DISABLE KEYS */;
INSERT INTO `nhan_vien` VALUES (1,'Nguyễn Văn Nam','Nam','1968-01-03','Hồ Chí Minh',NULL,'Bác sĩ',NULL,NULL),(2,'Trần Thanh Tâm','Nữ','1966-04-13','Long An',NULL,'Bác sĩ',NULL,NULL);
/*!40000 ALTER TABLE `nhan_vien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phieukham`
--

DROP TABLE IF EXISTS `phieukham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phieukham` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maPK` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stt` int DEFAULT NULL,
  `ngayKham` date DEFAULT NULL,
  `trieuChung` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chanDoan` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `benhnhan_id` int NOT NULL,
  `nhanvien_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `benhnhan_id` (`benhnhan_id`),
  KEY `nhanvien_id` (`nhanvien_id`),
  CONSTRAINT `phieukham_ibfk_1` FOREIGN KEY (`benhnhan_id`) REFERENCES `benhnhan` (`id`),
  CONSTRAINT `phieukham_ibfk_2` FOREIGN KEY (`nhanvien_id`) REFERENCES `nhan_vien` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieukham`
--

LOCK TABLES `phieukham` WRITE;
/*!40000 ALTER TABLE `phieukham` DISABLE KEYS */;
INSERT INTO `phieukham` VALUES (2,'PK02',1004,'2020-12-11','đau nửa đầu trái','Thiếu máu lên não',2,1);
/*!40000 ALTER TABLE `phieukham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `su_dung_thuoc`
--

DROP TABLE IF EXISTS `su_dung_thuoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `su_dung_thuoc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `thuoc` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `donVi` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `so_luong` int DEFAULT NULL,
  `so_lan_dung` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `su_dung_thuoc`
--

LOCK TABLES `su_dung_thuoc` WRITE;
/*!40000 ALTER TABLE `su_dung_thuoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `su_dung_thuoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thuoc`
--

DROP TABLE IF EXISTS `thuoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thuoc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tenThuoc` varchar(70) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `donGia` float DEFAULT NULL,
  `soLuong` int DEFAULT NULL,
  `donViTinh` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loaiThuoc_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `loaiThuoc_id` (`loaiThuoc_id`),
  CONSTRAINT `thuoc_ibfk_1` FOREIGN KEY (`loaiThuoc_id`) REFERENCES `loai_thuoc` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thuoc`
--

LOCK TABLES `thuoc` WRITE;
/*!40000 ALTER TABLE `thuoc` DISABLE KEYS */;
INSERT INTO `thuoc` VALUES (1,'Enalapril Stada 10mg',1000,1500,'Viên',1),(2,'Bisoloc 2.5mg',1500,2000,'Viên',1),(3,'Thuốc cao huyết áp Coveram',12100,400,'Viên',1),(4,'Thuốc trợ tim Cortonyl OPC',17000,200,'Hộp',1),(5,'Trị nhiễm trùng, nấm da Maica',7000,150,'Chai',2),(6,'Dermofar 10g',7000,100,'Tuýp',2),(7,'Trị ngứa da Phenergan',13000,120,'Tuýp',2),(8,'Dung dịch rơ miệng Denicol',14000,100,'Chai',2),(9,'Cồn trị đau răng, viêm nướu',18000,200,'Chai',3),(10,'Viên ngậm Strepsils Cool',29000,150,'Hộp',3),(11,'Thuốc A.T Betahisin',700,3000,'Viên',5),(12,'Thuốc Timmark',2500,3500,'Viên',5),(13,'Thuốc Cinnarizin Vidipha',200,450,'Viên',5),(14,'Thuốc Sunsizopin',2500,600,'Viên',6);
/*!40000 ALTER TABLE `thuoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userRole` enum('USER','ADMIN') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  CONSTRAINT `user_chk_1` CHECK ((`active` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Nguyễn Văn Nam',1,'namem','81dc9bdb52d04dc20036dbd8313ed055','sweet.love.nt20@gmail.com',NULL,'USER'),(2,'đặng thị hồng nhung',1,'nhung123','6512bd43d9caa6e02c990b0a82652dca','hongnhung98.dang@gmail.com',NULL,'USER');
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

-- Dump completed on 2020-12-16 17:48:08
