-- MySQL dump 10.13  Distrib 5.5.29, for osx10.8 (i386)
--
-- Host: localhost    Database: kulayan
-- ------------------------------------------------------
-- Server version	5.5.29

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
-- Table structure for table `admin_tools_dashboard_preferences`
--

DROP TABLE IF EXISTS `admin_tools_dashboard_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_tools_dashboard_preferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `data` longtext NOT NULL,
  `dashboard_id` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_tools_dashboard_prefer_dashboard_id_374bce90a8a4eefc_uniq` (`dashboard_id`,`user_id`),
  KEY `admin_tools_dashboard_preferences_6340c63c` (`user_id`),
  CONSTRAINT `user_id_refs_id_2faedda1f8487376` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_tools_dashboard_preferences`
--

LOCK TABLES `admin_tools_dashboard_preferences` WRITE;
/*!40000 ALTER TABLE `admin_tools_dashboard_preferences` DISABLE KEYS */;
INSERT INTO `admin_tools_dashboard_preferences` VALUES (1,1,'{\"positions\":{},\"columns\":{},\"disabled\":{},\"collapsed\":{\"module_4\":false}}','dashboard'),(2,1,'{}','website-dashboard');
/*!40000 ALTER TABLE `admin_tools_dashboard_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_tools_menu_bookmark`
--

DROP TABLE IF EXISTS `admin_tools_menu_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_tools_menu_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_tools_menu_bookmark_6340c63c` (`user_id`),
  CONSTRAINT `user_id_refs_id_6af2836063b2844f` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_tools_menu_bookmark`
--

LOCK TABLES `admin_tools_menu_bookmark` WRITE;
/*!40000 ALTER TABLE `admin_tools_menu_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_tools_menu_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `permission_id_refs_id_6ba0f519` (`permission_id`),
  CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add log entry',7,'add_logentry'),(20,'Can change log entry',7,'change_logentry'),(21,'Can delete log entry',7,'delete_logentry'),(22,'Can add migration history',8,'add_migrationhistory'),(23,'Can change migration history',8,'change_migrationhistory'),(24,'Can delete migration history',8,'delete_migrationhistory'),(25,'Can add category',9,'add_category'),(26,'Can change category',9,'change_category'),(27,'Can delete category',9,'delete_category'),(28,'Can add sub category',10,'add_subcategory'),(29,'Can change sub category',10,'change_subcategory'),(30,'Can delete sub category',10,'delete_subcategory'),(31,'Can add product image',11,'add_productimage'),(32,'Can change product image',11,'change_productimage'),(33,'Can delete product image',11,'delete_productimage'),(34,'Can add thumbnail',12,'add_thumbnail'),(35,'Can change thumbnail',12,'change_thumbnail'),(36,'Can delete thumbnail',12,'delete_thumbnail'),(37,'Can add color',13,'add_color'),(38,'Can change color',13,'change_color'),(39,'Can delete color',13,'delete_color'),(40,'Can add product',14,'add_product'),(41,'Can change product',14,'change_product'),(42,'Can delete product',14,'delete_product'),(43,'Can add stock item',15,'add_stockitem'),(44,'Can change stock item',15,'change_stockitem'),(45,'Can delete stock item',15,'delete_stockitem'),(46,'Can add cart',16,'add_cart'),(47,'Can change cart',16,'change_cart'),(48,'Can delete cart',16,'delete_cart'),(49,'Can add cart item',17,'add_cartitem'),(50,'Can change cart item',17,'change_cartitem'),(51,'Can delete cart item',17,'delete_cartitem'),(52,'Can add promo',18,'add_promo'),(53,'Can change promo',18,'change_promo'),(54,'Can delete promo',18,'delete_promo'),(55,'Can add order',19,'add_order'),(56,'Can change order',19,'change_order'),(57,'Can delete order',19,'delete_order'),(58,'Can add order item',20,'add_orderitem'),(59,'Can change order item',20,'change_orderitem'),(60,'Can delete order item',20,'delete_orderitem'),(61,'Can add sales tax',21,'add_salestax'),(62,'Can change sales tax',21,'change_salestax'),(63,'Can delete sales tax',21,'delete_salestax'),(64,'Can add user profile',22,'add_userprofile'),(65,'Can change user profile',22,'change_userprofile'),(66,'Can delete user profile',22,'delete_userprofile'),(67,'Can add bookmark',23,'add_bookmark'),(68,'Can change bookmark',23,'change_bookmark'),(69,'Can delete bookmark',23,'delete_bookmark'),(70,'Can add dashboard preferences',24,'add_dashboardpreferences'),(71,'Can change dashboard preferences',24,'change_dashboardpreferences'),(72,'Can delete dashboard preferences',24,'delete_dashboardpreferences');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$10000$lewGI9iB8DoK$RJ2vEy7g13EOEvsIBgwv0OHSHdpOkvvDfEX7vQ75OTA=','2014-02-17 05:58:30',1,'caleb','','','',1,1,'2013-08-27 04:57:54'),(4,'','2013-10-19 19:29:19',0,'','','','',0,1,'2013-10-19 19:29:19'),(10,'','2013-11-10 22:56:11',0,'f53642918d','','','',0,1,'2013-11-10 22:56:11'),(11,'','2013-11-15 07:14:53',0,'e502794e38','','','',0,1,'2013-11-15 07:14:53'),(12,'','2013-12-10 06:47:45',0,'e17ec1dcaa','','','',0,1,'2013-12-10 06:47:45'),(13,'','2013-12-14 19:29:08',0,'c395b03e2c','','','',0,1,'2013-12-14 19:29:08'),(14,'','2014-01-02 23:00:38',0,'d4f2552cbe','','','',0,1,'2014-01-02 23:00:38'),(15,'','2014-01-24 03:06:55',0,'cbbf6990d3','','','',0,1,'2014-01-24 03:06:55'),(16,'','2014-01-25 23:56:49',0,'0d83a9d472','','','',0,1,'2014-01-25 23:56:49'),(17,'','2014-02-16 19:47:32',0,'36f7495e05','','','',0,1,'2014-02-16 19:47:32');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `group_id_refs_id_274b862c` (`group_id`),
  CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `permission_id_refs_id_35d9ac25` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `content_type_id_refs_id_93d2d1f8` (`content_type_id`),
  KEY `user_id_refs_id_c0d12874` (`user_id`),
  CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c0d12874` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2013-09-03 04:05:55',1,9,'1','Dresses',1,''),(2,'2013-09-03 04:05:57',1,9,'2','Skirts',1,''),(3,'2013-09-03 04:06:10',1,9,'3','Tops & Tees',1,''),(4,'2013-09-03 04:06:17',1,9,'4','Outerwear',1,''),(5,'2013-09-03 04:06:25',1,9,'5','Jewelry',1,''),(6,'2013-09-03 04:18:29',1,13,'1','Gold',1,''),(7,'2013-09-03 04:20:44',1,14,'1','Gold Champagne Sequin Bolero',1,''),(8,'2013-09-03 04:21:57',1,14,'1','Gold Champagne Sequin Bolero',2,'Added thumbnail \"Thumbnail object\". Changed image and order for product image \"ProductImage object\". Changed image and order for product image \"ProductImage object\". Changed image and order for product image \"ProductImage object\". Changed image and order for product image \"ProductImage object\". Changed image and order for product image \"ProductImage object\".'),(9,'2013-09-03 04:22:51',1,13,'1','Gold',2,'Changed code.'),(10,'2013-11-10 22:28:35',1,10,'1','Cocktail Dress',1,''),(11,'2013-11-10 22:32:45',1,14,'2','Another Product',1,''),(12,'2013-11-10 22:33:53',1,14,'3','Product 3',1,''),(13,'2013-11-10 22:34:39',1,13,'2','Pink',1,''),(14,'2013-11-10 22:34:43',1,14,'4','Product 4',1,''),(15,'2013-11-10 22:35:52',1,14,'5','Product 5',1,''),(16,'2013-11-25 04:00:53',1,14,'156','Woven Navy Pencil Skirt, Striped Fabric, Exposed G',3,''),(17,'2013-11-25 04:00:53',1,14,'155','Layered Ruffle Pencil Skirt, Modern Cowgirl Wester',3,''),(18,'2013-11-25 04:00:53',1,14,'154','Flared Cotton Skirt, Womens Market Skirt Blue Red ',3,''),(19,'2013-11-25 04:00:53',1,14,'153','SMALL, Sample Sale, Wholesale Bulk Listing, 11 Pie',3,''),(20,'2013-11-25 04:00:53',1,14,'152','Ecofriendly Womens Wrap, Bamboo Jersey Yoga Wrap, ',3,''),(21,'2013-11-25 04:00:53',1,14,'151','White Cowl Neck Blouse, Modal Ecofriendly, Organic',3,''),(22,'2013-11-25 04:00:53',1,14,'150','Aztec Maxi Dress Navy Orange Geometric Print Flare',3,''),(23,'2013-11-25 04:00:53',1,14,'149','Beaded Layered Long Opera Necklace Bright Rainbow ',3,''),(24,'2013-11-25 04:00:53',1,14,'148','Emerald Green Lace Dress with Black Jersey Lining ',3,''),(25,'2013-11-25 04:00:53',1,14,'147','Geometric Maxi Dress, Striped, Chevron Halter Jers',3,''),(26,'2013-11-25 04:00:53',1,14,'146','MEDIUM, Sample Sale, Wholesale Bulk Listing, 7 Dif',3,''),(27,'2013-11-25 04:00:53',1,14,'145','RESERVED',3,''),(28,'2013-11-25 04:00:53',1,14,'144','Navy Lace Dress, Womens Date Night, Blue Dark Plum',3,''),(29,'2013-11-25 04:00:53',1,14,'143','LARGE - Sample Sale, Wholesale Bulk Lot Listing in',3,''),(30,'2013-11-25 04:00:53',1,14,'142','Red Cotton Skirt, Flared Womens Skirt Aline French',3,''),(31,'2013-11-25 04:00:53',1,14,'141','Sweater Wrap, Eco Friendly Bamboo Jersey Yoga Wrap',3,''),(32,'2013-11-25 04:00:53',1,14,'140','Womens Ruffled Blazer, Fitted Cotton Jacket, Blue ',3,''),(33,'2013-11-25 04:00:53',1,14,'139','Hoodie Wrap, EcoFriendly Fabric, Womens Sweater Wr',3,''),(34,'2013-11-25 04:00:53',1,14,'138','XS XSMALL 14 Pieces Different Pieces, Sample Sale ',3,''),(35,'2013-11-25 04:00:53',1,14,'137','White Eyelet Lace Dress with EcoFriendly Modal Jer',3,''),(36,'2013-11-25 04:00:53',1,14,'136','Modal EcoFriendly Organic Gray Cowl Neck Womens Bl',3,''),(37,'2013-11-25 04:00:53',1,14,'135','Southern Bridesmaid Dress, Cotton Pleated Origami ',3,''),(38,'2013-11-25 04:00:53',1,14,'134','Striped Maxi Dress Black Gray Jersey,  Womens Halt',3,''),(39,'2013-11-25 04:00:53',1,14,'133','Organic Tshirt Dress in Bamboo Cotton Jersey Knit ',3,''),(40,'2013-11-25 04:00:53',1,14,'132','Fitted Cotton Blazer, Womens Ruffled Jacket High C',3,''),(41,'2013-11-25 04:00:53',1,14,'131','Rainbow Womens Pencil Mini Skirt, Woven Cotton, So',3,''),(42,'2013-11-25 04:00:53',1,14,'130','2 Womens Cowl Neck Blouse, Organic, EcoFriendly Wo',3,''),(43,'2013-11-25 04:00:53',1,14,'129','Organic Womens Clothing, Tshirt Dress in Cotton Ba',3,''),(44,'2013-11-25 04:00:53',1,14,'128','Navy Blue Cowl Neck, Womens Blouse, Eco Friendly J',3,''),(45,'2013-11-25 04:00:53',1,14,'127','EcoFriendly Womens Black Hoodie With Asymmetric Zi',3,''),(46,'2013-11-25 04:00:53',1,14,'126','Fitted Ruffled Jacket Blazer High Collar Navy Blue',3,''),(47,'2013-11-25 04:00:53',1,14,'125','Organic Cowl Neck, Womens Blouse Eco Friendly Moda',3,''),(48,'2013-11-25 04:00:53',1,14,'124','Wrap Dress, Womens Dress, Stretch ITY Jersey, Purp',3,''),(49,'2013-11-25 04:00:53',1,14,'123','Gray Eyelet Dress, Womens Day Sun Dress, Eco Frien',3,''),(50,'2013-11-25 04:00:53',1,14,'122','Fleece Leggings in Black EcoFriendly Bamboo Fleece',3,''),(51,'2013-11-25 04:00:53',1,14,'121','Gold Champagne Sequin Bolero Shrug Formal Wedding ',3,''),(52,'2013-11-25 04:00:53',1,14,'120','Gold Champagne Sequin Bolero Shrug Formal Wedding ',3,''),(53,'2013-11-25 04:00:53',1,14,'119','Gold Champagne Sequin Bolero Shrug Formal Wedding ',3,''),(54,'2013-11-25 04:00:53',1,14,'118','Gold Champagne Sequin Bolero Shrug Formal Wedding ',3,''),(55,'2013-11-25 04:00:53',1,14,'117','Woven Navy Pencil Skirt, Striped Fabric, Exposed G',3,''),(56,'2013-11-25 04:00:53',1,14,'116','Layered Ruffle Pencil Skirt, Modern Cowgirl Wester',3,''),(57,'2013-11-25 04:00:53',1,14,'115','Flared Cotton Skirt, Womens Market Skirt Blue Red ',3,''),(58,'2013-11-25 04:00:53',1,14,'114','SMALL, Sample Sale, Wholesale Bulk Listing, 11 Pie',3,''),(59,'2013-11-25 04:00:53',1,14,'113','Ecofriendly Womens Wrap, Bamboo Jersey Yoga Wrap, ',3,''),(60,'2013-11-25 04:00:53',1,14,'112','White Cowl Neck Blouse, Modal Ecofriendly, Organic',3,''),(61,'2013-11-25 04:00:53',1,14,'111','Aztec Maxi Dress Navy Orange Geometric Print Flare',3,''),(62,'2013-11-25 04:00:53',1,14,'110','Beaded Layered Long Opera Necklace Bright Rainbow ',3,''),(63,'2013-11-25 04:00:53',1,14,'109','Emerald Green Lace Dress with Black Jersey Lining ',3,''),(64,'2013-11-25 04:00:53',1,14,'108','Geometric Maxi Dress, Striped, Chevron Halter Jers',3,''),(65,'2013-11-25 04:00:53',1,14,'107','MEDIUM, Sample Sale, Wholesale Bulk Listing, 7 Dif',3,''),(66,'2013-11-25 04:00:53',1,14,'106','RESERVED',3,''),(67,'2013-11-25 04:00:53',1,14,'105','Navy Lace Dress, Womens Date Night, Blue Dark Plum',3,''),(68,'2013-11-25 04:00:53',1,14,'104','LARGE - Sample Sale, Wholesale Bulk Lot Listing in',3,''),(69,'2013-11-25 04:00:53',1,14,'103','Red Cotton Skirt, Flared Womens Skirt Aline French',3,''),(70,'2013-11-25 04:00:53',1,14,'102','Sweater Wrap, Eco Friendly Bamboo Jersey Yoga Wrap',3,''),(71,'2013-11-25 04:00:53',1,14,'101','Womens Ruffled Blazer, Fitted Cotton Jacket, Blue ',3,''),(72,'2013-11-25 04:00:53',1,14,'100','Hoodie Wrap, EcoFriendly Fabric, Womens Sweater Wr',3,''),(73,'2013-11-25 04:00:53',1,14,'99','XS XSMALL 14 Pieces Different Pieces, Sample Sale ',3,''),(74,'2013-11-25 04:00:53',1,14,'98','White Eyelet Lace Dress with EcoFriendly Modal Jer',3,''),(75,'2013-11-25 04:00:53',1,14,'97','Modal EcoFriendly Organic Gray Cowl Neck Womens Bl',3,''),(76,'2013-11-25 04:00:53',1,14,'96','Southern Bridesmaid Dress, Cotton Pleated Origami ',3,''),(77,'2013-11-25 04:00:53',1,14,'95','Striped Maxi Dress Black Gray Jersey,  Womens Halt',3,''),(78,'2013-11-25 04:00:53',1,14,'94','Organic Tshirt Dress in Bamboo Cotton Jersey Knit ',3,''),(79,'2013-11-25 04:00:53',1,14,'93','Fitted Cotton Blazer, Womens Ruffled Jacket High C',3,''),(80,'2013-11-25 04:00:53',1,14,'92','Rainbow Womens Pencil Mini Skirt, Woven Cotton, So',3,''),(81,'2013-11-25 04:00:53',1,14,'91','2 Womens Cowl Neck Blouse, Organic, EcoFriendly Wo',3,''),(82,'2013-11-25 04:00:53',1,14,'90','Organic Womens Clothing, Tshirt Dress in Cotton Ba',3,''),(83,'2013-11-25 04:00:53',1,14,'89','Navy Blue Cowl Neck, Womens Blouse, Eco Friendly J',3,''),(84,'2013-11-25 04:00:53',1,14,'88','EcoFriendly Womens Black Hoodie With Asymmetric Zi',3,''),(85,'2013-11-25 04:00:53',1,14,'87','Fitted Ruffled Jacket Blazer High Collar Navy Blue',3,''),(86,'2013-11-25 04:00:53',1,14,'86','Organic Cowl Neck, Womens Blouse Eco Friendly Moda',3,''),(87,'2013-11-25 04:00:53',1,14,'85','Wrap Dress, Womens Dress, Stretch ITY Jersey, Purp',3,''),(88,'2013-11-25 04:00:53',1,14,'84','Gray Eyelet Dress, Womens Day Sun Dress, Eco Frien',3,''),(89,'2013-11-25 04:00:53',1,14,'83','Fleece Leggings in Black EcoFriendly Bamboo Fleece',3,''),(90,'2013-11-25 04:00:53',1,14,'82','Gold Champagne Sequin Bolero Shrug Formal Wedding ',3,''),(91,'2013-11-25 04:00:53',1,14,'81','Woven Navy Pencil Skirt, Striped Fabric, Exposed G',3,''),(92,'2013-11-25 04:00:53',1,14,'80','Layered Ruffle Pencil Skirt, Modern Cowgirl Wester',3,''),(93,'2013-11-25 04:00:53',1,14,'79','Flared Cotton Skirt, Womens Market Skirt Blue Red ',3,''),(94,'2013-11-25 04:00:53',1,14,'78','SMALL, Sample Sale, Wholesale Bulk Listing, 11 Pie',3,''),(95,'2013-11-25 04:00:53',1,14,'77','Ecofriendly Womens Wrap, Bamboo Jersey Yoga Wrap, ',3,''),(96,'2013-11-25 04:00:53',1,14,'76','White Cowl Neck Blouse, Modal Ecofriendly, Organic',3,''),(97,'2013-11-25 04:00:53',1,14,'75','Aztec Maxi Dress Navy Orange Geometric Print Flare',3,''),(98,'2013-11-25 04:00:53',1,14,'74','Beaded Layered Long Opera Necklace Bright Rainbow ',3,''),(99,'2013-11-25 04:00:53',1,14,'73','Emerald Green Lace Dress with Black Jersey Lining ',3,''),(100,'2013-11-25 04:00:53',1,14,'72','Geometric Maxi Dress, Striped, Chevron Halter Jers',3,''),(101,'2013-11-25 04:00:53',1,14,'71','MEDIUM, Sample Sale, Wholesale Bulk Listing, 7 Dif',3,''),(102,'2013-11-25 04:00:53',1,14,'70','RESERVED',3,''),(103,'2013-11-25 04:00:53',1,14,'69','Navy Lace Dress, Womens Date Night, Blue Dark Plum',3,''),(104,'2013-11-25 04:00:53',1,14,'68','LARGE - Sample Sale, Wholesale Bulk Lot Listing in',3,''),(105,'2013-11-25 04:00:53',1,14,'67','Red Cotton Skirt, Flared Womens Skirt Aline French',3,''),(106,'2013-11-25 04:00:53',1,14,'66','Sweater Wrap, Eco Friendly Bamboo Jersey Yoga Wrap',3,''),(107,'2013-11-25 04:00:53',1,14,'65','Womens Ruffled Blazer, Fitted Cotton Jacket, Blue ',3,''),(108,'2013-11-25 04:00:53',1,14,'64','Hoodie Wrap, EcoFriendly Fabric, Womens Sweater Wr',3,''),(109,'2013-11-25 04:00:53',1,14,'63','XS XSMALL 14 Pieces Different Pieces, Sample Sale ',3,''),(110,'2013-11-25 04:00:53',1,14,'62','White Eyelet Lace Dress with EcoFriendly Modal Jer',3,''),(111,'2013-11-25 04:00:53',1,14,'61','Modal EcoFriendly Organic Gray Cowl Neck Womens Bl',3,''),(112,'2013-11-25 04:00:53',1,14,'60','Southern Bridesmaid Dress, Cotton Pleated Origami ',3,''),(113,'2013-11-25 04:00:53',1,14,'59','Striped Maxi Dress Black Gray Jersey,  Womens Halt',3,''),(114,'2013-11-25 04:00:53',1,14,'58','Organic Tshirt Dress in Bamboo Cotton Jersey Knit ',3,''),(115,'2013-11-25 04:00:53',1,14,'57','Fitted Cotton Blazer, Womens Ruffled Jacket High C',3,''),(116,'2013-11-25 04:00:53',1,14,'56','Rainbow Womens Pencil Mini Skirt, Woven Cotton, So',3,''),(117,'2013-11-25 04:00:53',1,14,'55','2 Womens Cowl Neck Blouse, Organic, EcoFriendly Wo',3,''),(118,'2013-11-25 04:00:53',1,14,'54','Organic Womens Clothing, Tshirt Dress in Cotton Ba',3,''),(119,'2013-11-25 04:00:53',1,14,'53','Navy Blue Cowl Neck, Womens Blouse, Eco Friendly J',3,''),(120,'2013-11-25 04:00:53',1,14,'52','EcoFriendly Womens Black Hoodie With Asymmetric Zi',3,''),(121,'2013-11-25 04:00:53',1,14,'51','Fitted Ruffled Jacket Blazer High Collar Navy Blue',3,''),(122,'2013-11-25 04:00:53',1,14,'50','Organic Cowl Neck, Womens Blouse Eco Friendly Moda',3,''),(123,'2013-11-25 04:00:53',1,14,'49','Wrap Dress, Womens Dress, Stretch ITY Jersey, Purp',3,''),(124,'2013-11-25 04:00:53',1,14,'48','Gray Eyelet Dress, Womens Day Sun Dress, Eco Frien',3,''),(125,'2013-11-25 04:00:53',1,14,'47','Fleece Leggings in Black EcoFriendly Bamboo Fleece',3,''),(126,'2013-11-25 04:00:53',1,14,'46','Gold Champagne Sequin Bolero Shrug Formal Wedding ',3,''),(127,'2013-11-25 04:00:53',1,14,'45','Woven Navy Pencil Skirt, Striped Fabric, Exposed G',3,''),(128,'2013-11-25 04:00:53',1,14,'44','Layered Ruffle Pencil Skirt, Modern Cowgirl Wester',3,''),(129,'2013-11-25 04:00:53',1,14,'43','Flared Cotton Skirt, Womens Market Skirt Blue Red ',3,''),(130,'2013-11-25 04:00:53',1,14,'42','SMALL, Sample Sale, Wholesale Bulk Listing, 11 Pie',3,''),(131,'2013-11-25 04:00:53',1,14,'41','Ecofriendly Womens Wrap, Bamboo Jersey Yoga Wrap, ',3,''),(132,'2013-11-25 04:00:53',1,14,'40','White Cowl Neck Blouse, Modal Ecofriendly, Organic',3,''),(133,'2013-11-25 04:00:53',1,14,'39','Aztec Maxi Dress Navy Orange Geometric Print Flare',3,''),(134,'2013-11-25 04:00:53',1,14,'38','Beaded Layered Long Opera Necklace Bright Rainbow ',3,''),(135,'2013-11-25 04:00:53',1,14,'37','Emerald Green Lace Dress with Black Jersey Lining ',3,''),(136,'2013-11-25 04:00:53',1,14,'36','Geometric Maxi Dress, Striped, Chevron Halter Jers',3,''),(137,'2013-11-25 04:00:53',1,14,'35','MEDIUM, Sample Sale, Wholesale Bulk Listing, 7 Dif',3,''),(138,'2013-11-25 04:00:53',1,14,'34','RESERVED',3,''),(139,'2013-11-25 04:00:53',1,14,'33','Navy Lace Dress, Womens Date Night, Blue Dark Plum',3,''),(140,'2013-11-25 04:00:53',1,14,'32','LARGE - Sample Sale, Wholesale Bulk Lot Listing in',3,''),(141,'2013-11-25 04:00:53',1,14,'31','Red Cotton Skirt, Flared Womens Skirt Aline French',3,''),(142,'2013-11-25 04:00:53',1,14,'30','Sweater Wrap, Eco Friendly Bamboo Jersey Yoga Wrap',3,''),(143,'2013-11-25 04:00:53',1,14,'29','Womens Ruffled Blazer, Fitted Cotton Jacket, Blue ',3,''),(144,'2013-11-25 04:00:53',1,14,'28','Hoodie Wrap, EcoFriendly Fabric, Womens Sweater Wr',3,''),(145,'2013-11-25 04:00:53',1,14,'27','XS XSMALL 14 Pieces Different Pieces, Sample Sale ',3,''),(146,'2013-11-25 04:00:53',1,14,'26','White Eyelet Lace Dress with EcoFriendly Modal Jer',3,''),(147,'2013-11-25 04:00:53',1,14,'25','Modal EcoFriendly Organic Gray Cowl Neck Womens Bl',3,''),(148,'2013-11-25 04:00:53',1,14,'24','Southern Bridesmaid Dress, Cotton Pleated Origami ',3,''),(149,'2013-11-25 04:00:53',1,14,'23','Striped Maxi Dress Black Gray Jersey,  Womens Halt',3,''),(150,'2013-11-25 04:00:53',1,14,'22','Organic Tshirt Dress in Bamboo Cotton Jersey Knit ',3,''),(151,'2013-11-25 04:00:53',1,14,'21','Fitted Cotton Blazer, Womens Ruffled Jacket High C',3,''),(152,'2013-11-25 04:00:53',1,14,'20','Rainbow Womens Pencil Mini Skirt, Woven Cotton, So',3,''),(153,'2013-11-25 04:00:53',1,14,'19','2 Womens Cowl Neck Blouse, Organic, EcoFriendly Wo',3,''),(154,'2013-11-25 04:00:53',1,14,'18','Organic Womens Clothing, Tshirt Dress in Cotton Ba',3,''),(155,'2013-11-25 04:00:53',1,14,'17','Navy Blue Cowl Neck, Womens Blouse, Eco Friendly J',3,''),(156,'2013-11-25 04:00:53',1,14,'16','EcoFriendly Womens Black Hoodie With Asymmetric Zi',3,''),(157,'2013-11-25 04:00:53',1,14,'15','Fitted Ruffled Jacket Blazer High Collar Navy Blue',3,''),(158,'2013-11-25 04:00:53',1,14,'14','Organic Cowl Neck, Womens Blouse Eco Friendly Moda',3,''),(159,'2013-11-25 04:00:53',1,14,'13','Wrap Dress, Womens Dress, Stretch ITY Jersey, Purp',3,''),(160,'2013-11-25 04:00:53',1,14,'12','Gray Eyelet Dress, Womens Day Sun Dress, Eco Frien',3,''),(161,'2013-11-25 04:00:53',1,14,'11','Fleece Leggings in Black EcoFriendly Bamboo Fleece',3,''),(162,'2013-11-25 04:00:53',1,14,'10','Gold Champagne Sequin Bolero Shrug Formal Wedding ',3,''),(163,'2013-11-25 04:00:53',1,14,'8','Gray Eyelet Dress, Womens Day Sun Dress, Eco Friendly Modal, Criss Cross X Back, Lace, Long Knee Length, Also White - TRACY',3,''),(164,'2013-11-25 04:00:53',1,14,'7','Fleece Leggings in Black EcoFriendly Bamboo Fleece Jersey, Thick and Warm Perfect for Fall and Winter - KATYA',3,''),(165,'2013-11-25 04:00:53',1,14,'6','Gold Champagne Sequin Bolero Shrug Formal Wedding or Bridal Party - Classic and Simple - EcoFriendly - SALLY',3,''),(166,'2013-11-25 04:00:53',1,14,'5','Product 5',3,''),(167,'2013-11-25 04:00:53',1,14,'4','Product 4',3,''),(168,'2013-11-25 04:00:53',1,14,'3','Product 3',3,''),(169,'2013-11-25 04:00:53',1,14,'2','Another Product',3,''),(170,'2013-11-25 04:00:53',1,14,'1','Gold Champagne Sequin Bolero',3,''),(171,'2013-11-25 04:03:30',1,14,'192','Woven Navy Pencil Skirt, Striped Fabric, Exposed G',3,''),(172,'2013-11-25 04:03:30',1,14,'191','Layered Ruffle Pencil Skirt, Modern Cowgirl Wester',3,''),(173,'2013-11-25 04:03:30',1,14,'190','Flared Cotton Skirt, Womens Market Skirt Blue Red ',3,''),(174,'2013-11-25 04:03:30',1,14,'189','SMALL, Sample Sale, Wholesale Bulk Listing, 11 Pie',3,''),(175,'2013-11-25 04:03:30',1,14,'188','Ecofriendly Womens Wrap, Bamboo Jersey Yoga Wrap, ',3,''),(176,'2013-11-25 04:03:30',1,14,'187','White Cowl Neck Blouse, Modal Ecofriendly, Organic',3,''),(177,'2013-11-25 04:03:30',1,14,'186','Aztec Maxi Dress Navy Orange Geometric Print Flare',3,''),(178,'2013-11-25 04:03:30',1,14,'185','Beaded Layered Long Opera Necklace Bright Rainbow ',3,''),(179,'2013-11-25 04:03:30',1,14,'184','Emerald Green Lace Dress with Black Jersey Lining ',3,''),(180,'2013-11-25 04:03:30',1,14,'183','Geometric Maxi Dress, Striped, Chevron Halter Jers',3,''),(181,'2013-11-25 04:03:30',1,14,'182','MEDIUM, Sample Sale, Wholesale Bulk Listing, 7 Dif',3,''),(182,'2013-11-25 04:03:30',1,14,'181','RESERVED',3,''),(183,'2013-11-25 04:03:30',1,14,'180','Navy Lace Dress, Womens Date Night, Blue Dark Plum',3,''),(184,'2013-11-25 04:03:30',1,14,'179','LARGE - Sample Sale, Wholesale Bulk Lot Listing in',3,''),(185,'2013-11-25 04:03:30',1,14,'178','Red Cotton Skirt, Flared Womens Skirt Aline French',3,''),(186,'2013-11-25 04:03:30',1,14,'177','Sweater Wrap, Eco Friendly Bamboo Jersey Yoga Wrap',3,''),(187,'2013-11-25 04:03:30',1,14,'176','Womens Ruffled Blazer, Fitted Cotton Jacket, Blue ',3,''),(188,'2013-11-25 04:03:30',1,14,'175','Hoodie Wrap, EcoFriendly Fabric, Womens Sweater Wr',3,''),(189,'2013-11-25 04:03:30',1,14,'174','XS XSMALL 14 Pieces Different Pieces, Sample Sale ',3,''),(190,'2013-11-25 04:03:30',1,14,'173','White Eyelet Lace Dress with EcoFriendly Modal Jer',3,''),(191,'2013-11-25 04:03:30',1,14,'172','Modal EcoFriendly Organic Gray Cowl Neck Womens Bl',3,''),(192,'2013-11-25 04:03:30',1,14,'171','Southern Bridesmaid Dress, Cotton Pleated Origami ',3,''),(193,'2013-11-25 04:03:30',1,14,'170','Striped Maxi Dress Black Gray Jersey,  Womens Halt',3,''),(194,'2013-11-25 04:03:30',1,14,'169','Organic Tshirt Dress in Bamboo Cotton Jersey Knit ',3,''),(195,'2013-11-25 04:03:30',1,14,'168','Fitted Cotton Blazer, Womens Ruffled Jacket High C',3,''),(196,'2013-11-25 04:03:30',1,14,'167','Rainbow Womens Pencil Mini Skirt, Woven Cotton, So',3,''),(197,'2013-11-25 04:03:30',1,14,'166','2 Womens Cowl Neck Blouse, Organic, EcoFriendly Wo',3,''),(198,'2013-11-25 04:03:30',1,14,'165','Organic Womens Clothing, Tshirt Dress in Cotton Ba',3,''),(199,'2013-11-25 04:03:30',1,14,'164','Navy Blue Cowl Neck, Womens Blouse, Eco Friendly J',3,''),(200,'2013-11-25 04:03:30',1,14,'163','EcoFriendly Womens Black Hoodie With Asymmetric Zi',3,''),(201,'2013-11-25 04:03:30',1,14,'162','Fitted Ruffled Jacket Blazer High Collar Navy Blue',3,''),(202,'2013-11-25 04:03:30',1,14,'161','Organic Cowl Neck, Womens Blouse Eco Friendly Moda',3,''),(203,'2013-11-25 04:03:30',1,14,'160','Wrap Dress, Womens Dress, Stretch ITY Jersey, Purp',3,''),(204,'2013-11-25 04:03:30',1,14,'159','Gray Eyelet Dress, Womens Day Sun Dress, Eco Frien',3,''),(205,'2013-11-25 04:03:30',1,14,'158','Fleece Leggings in Black EcoFriendly Bamboo Fleece',3,''),(206,'2013-11-25 04:03:30',1,14,'157','Gold Champagne Sequin Bolero Shrug Formal Wedding ',3,''),(207,'2013-11-29 21:08:58',1,14,'228','Woven Navy Pencil Skirt, Striped Fabric, Exposed G',2,'Changed sku, story and details. Added stock item \"StockItem object\". Added stock item \"StockItem object\".'),(208,'2013-12-10 23:28:05',1,13,'3','Lavender',1,''),(209,'2013-12-10 23:28:29',1,13,'4','Royal Blue',1,''),(210,'2013-12-10 23:28:57',1,14,'195','Gray Eyelet Dress, Womens Day Sun Dress, Eco Frien',2,'Changed sku, story and details. Added stock item \"StockItem object\". Added stock item \"StockItem object\". Added stock item \"StockItem object\".'),(211,'2013-12-14 19:29:01',1,14,'198','Fitted Ruffled Jacket Blazer High Collar Navy Blue',2,'Changed sku, story and details. Added stock item \"StockItem object\". Added stock item \"StockItem object\". Added stock item \"StockItem object\". Added stock item \"StockItem object\". Added stock item \"StockItem object\".'),(212,'2014-02-17 05:58:52',1,14,'283','Navy Blue Cowl Neck, Womens Blouse, Eco Friendly Jersey, Bamboo Organic Cotton, Classic Comfortable, Also in White Grey Modal - ',3,'');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'site','sites','site'),(7,'log entry','admin','logentry'),(8,'migration history','south','migrationhistory'),(9,'category','website','category'),(10,'sub category','website','subcategory'),(11,'product image','website','productimage'),(12,'thumbnail','website','thumbnail'),(13,'color','website','color'),(14,'product','website','product'),(15,'stock item','website','stockitem'),(16,'cart','website','cart'),(17,'cart item','website','cartitem'),(18,'promo','website','promo'),(19,'order','website','order'),(20,'order item','website','orderitem'),(21,'sales tax','website','salestax'),(22,'user profile','website','userprofile'),(23,'bookmark','menu','bookmark'),(24,'dashboard preferences','dashboard','dashboardpreferences');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('bz58p179bmob2p7bprn0yht3c1grbwog','Y2U4ODkwNzM3NWZmMGEzNWRkYjljZjExODQ2ZTI5M2E3ZjJkYWE1MzqAAn1xAShVDV9hdXRoX3VzZXJfaWSKAQFVEl9hdXRoX3VzZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmR1Lg==','2014-02-08 23:56:50'),('gyb1t4fdb12pjbizp58edq49d1wd35qn','ZjJhOWZmMTliOWNjZjY5YWIyMDhiNjU3NWIyNzNmYjE3YWYxZWMzMTqAAn1xAShVCV9tZXNzYWdlc11xAmNkamFuZ28uY29udHJpYi5tZXNzYWdlcy5zdG9yYWdlLmJhc2UKTWVzc2FnZQpxAymBcQR9cQUoVQpleHRyYV90YWdzcQZYAAAAAFUHbWVzc2FnZXEHWFoAAABUaGUgcHJvZHVjdCAiR3JheSBFeWVsZXQgRHJlc3MsIFdvbWVucyBEYXkgU3VuIERyZXNzLCBFY28gRnJpZW4iIHdhcyBjaGFuZ2VkIHN1Y2Nlc3NmdWxseS5VBWxldmVscQhLFHViYVUSX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZFUNX2F1dGhfdXNlcl9pZIoBAXUu','2013-12-24 23:28:57'),('j5a5dc3dv628ybwiqroq3tlq59uynr8a','YjMxZWRjY2UwOWI0ZjZkYThiMjE1NDMwNGMxMzA1ZDY1ZTMyYTExMjqAAn1xAS4=','2013-11-13 03:30:01'),('rxsbjygxmswchsjq2yiqd3v3o7dcu24l','Njg3ZmQ3OGQzOGUwZThmMDJiMzJjNzAxNjkxMjFmNTVkN2EyM2NmMzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==','2013-10-16 05:51:52'),('vbt72w5mi7mi8mgz9v01yb9o3onv237j','NzRhZDZjZTZiM2Q3MTZlYzllZjdkNjg2NzYwOTU0Y2JkNTliN2YzMzqAAn1xAShVCV9tZXNzYWdlc11xAmNkamFuZ28uY29udHJpYi5tZXNzYWdlcy5zdG9yYWdlLmJhc2UKTWVzc2FnZQpxAymBcQR9cQUoVQpleHRyYV90YWdzcQZYAAAAAFUHbWVzc2FnZXEHWKgAAABUaGUgcHJvZHVjdCAiTmF2eSBCbHVlIENvd2wgTmVjaywgV29tZW5zIEJsb3VzZSwgRWNvIEZyaWVuZGx5IEplcnNleSwgQmFtYm9vIE9yZ2FuaWMgQ290dG9uLCBDbGFzc2ljIENvbWZvcnRhYmxlLCBBbHNvIGluIFdoaXRlIEdyZXkgTW9kYWwgLSAiIHdhcyBkZWxldGVkIHN1Y2Nlc3NmdWxseS5VBWxldmVscQhLFHViYVUNX2F1dGhfdXNlcl9pZIoBAVUSX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHUu','2014-03-03 05:58:59'),('wlaht6swpvcar3p4xfjwi7jfp0mb6mm6','ZGNlYTI4MWJlOTZlOWU4YzI1ZDlhNjRhZmMxYTkyYTAzNWYzZGMwYzqAAn1xAShVDV9hdXRoX3VzZXJfaWSKAQFVEl9hdXRoX3VzZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmRVCV9tZXNzYWdlc11xAmNkamFuZ28uY29udHJpYi5tZXNzYWdlcy5zdG9yYWdlLmJhc2UKTWVzc2FnZQpxAymBcQR9cQUoVQpleHRyYV90YWdzcQZYAAAAAFUHbWVzc2FnZXEHWFoAAABUaGUgcHJvZHVjdCAiRml0dGVkIFJ1ZmZsZWQgSmFja2V0IEJsYXplciBIaWdoIENvbGxhciBOYXZ5IEJsdWUiIHdhcyBjaGFuZ2VkIHN1Y2Nlc3NmdWxseS5VBWxldmVscQhLFHViYXUu','2014-01-02 05:03:15'),('yk5x8ubjp1ugo9t3x6u86z98ttxyy2bm','Y2U4ODkwNzM3NWZmMGEzNWRkYjljZjExODQ2ZTI5M2E3ZjJkYWE1MzqAAn1xAShVDV9hdXRoX3VzZXJfaWSKAQFVEl9hdXRoX3VzZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmR1Lg==','2014-01-22 05:53:39'),('zgq6tp5bvos3r3pn7sti1q8bcrss5ne3','ZjI0MDE3OGUzYjg0Zjc5ZmI4Y2E4ZjEyOGQ1YzI3ZmNmODkxMjdkYTqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmRVDV9hdXRoX3VzZXJfaWSKAQFVCV9tZXNzYWdlc11xAihjZGphbmdvLmNvbnRyaWIubWVzc2FnZXMuc3RvcmFnZS5iYXNlCk1lc3NhZ2UKcQMpgXEEfXEFKFUKZXh0cmFfdGFnc3EGWAAAAABVB21lc3NhZ2VxB1hSAAAAVGhlIGNhdGVnb3J5ICJEcmVzc2VzIiB3YXMgYWRkZWQgc3VjY2Vzc2Z1bGx5LiBZb3UgbWF5IGFkZCBhbm90aGVyIGNhdGVnb3J5IGJlbG93LlUFbGV2ZWxxCEsUdWJoAymBcQl9cQooaAZYAAAAAGgHWFEAAABUaGUgY2F0ZWdvcnkgIlNraXJ0cyIgd2FzIGFkZGVkIHN1Y2Nlc3NmdWxseS4gWW91IG1heSBhZGQgYW5vdGhlciBjYXRlZ29yeSBiZWxvdy5oCEsUdWJoAymBcQt9cQwoaAZYAAAAAGgHWFYAAABUaGUgY2F0ZWdvcnkgIlRvcHMgJiBUZWVzIiB3YXMgYWRkZWQgc3VjY2Vzc2Z1bGx5LiBZb3UgbWF5IGFkZCBhbm90aGVyIGNhdGVnb3J5IGJlbG93LmgISxR1YmgDKYFxDX1xDihoBlgAAAAAaAdYMAAAAFRoZSBjYXRlZ29yeSAiT3V0ZXJ3ZWFyIiB3YXMgYWRkZWQgc3VjY2Vzc2Z1bGx5LmgISxR1YmgDKYFxD31xEChoBlgAAAAAaAdYLgAAAFRoZSBjYXRlZ29yeSAiSmV3ZWxyeSIgd2FzIGFkZGVkIHN1Y2Nlc3NmdWxseS5oCEsUdWJoAymBcRF9cRIoaAZYAAAAAGgHWEIAAABUaGUgcHJvZHVjdCAiR29sZCBDaGFtcGFnbmUgU2VxdWluIEJvbGVybyIgd2FzIGFkZGVkIHN1Y2Nlc3NmdWxseS5oCEsUdWJoAymBcRN9cRQoaAZYAAAAAGgHWEQAAABUaGUgcHJvZHVjdCAiR29sZCBDaGFtcGFnbmUgU2VxdWluIEJvbGVybyIgd2FzIGNoYW5nZWQgc3VjY2Vzc2Z1bGx5LmgISxR1YmgDKYFxFX1xFihoBlgAAAAAaAdYKgAAAFRoZSBjb2xvciAiR29sZCIgd2FzIGNoYW5nZWQgc3VjY2Vzc2Z1bGx5LmgISxR1YmV1Lg==','2013-09-17 04:22:51');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'kulayan.com','Kulayan');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `south_migrationhistory`
--

DROP TABLE IF EXISTS `south_migrationhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `south_migrationhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) NOT NULL,
  `migration` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `south_migrationhistory`
--

LOCK TABLES `south_migrationhistory` WRITE;
/*!40000 ALTER TABLE `south_migrationhistory` DISABLE KEYS */;
INSERT INTO `south_migrationhistory` VALUES (1,'website','0001_initial','2013-09-25 06:15:45'),(2,'website','0002_auto__add_field_cart_cart_date__add_field_cart_active','2013-09-25 06:16:30'),(3,'website','0003_auto__add_field_userprofile_session','2013-10-19 19:00:41'),(4,'website','0004_auto__chg_field_productimage_height','2013-11-10 22:32:36'),(5,'website','0005_auto__chg_field_productimage_width','2013-11-10 22:32:36');
/*!40000 ALTER TABLE `south_migrationhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_cart`
--

DROP TABLE IF EXISTS `website_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `cart_date` datetime NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `user_id_refs_id_c5d08f1e` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_cart`
--

LOCK TABLES `website_cart` WRITE;
/*!40000 ALTER TABLE `website_cart` DISABLE KEYS */;
INSERT INTO `website_cart` VALUES (1,1,'2013-10-02 05:12:09',1),(3,4,'2013-10-19 19:29:19',1),(4,10,'2013-11-10 22:56:11',1),(5,11,'2013-11-15 07:14:53',1),(6,12,'2013-12-10 06:47:45',1),(7,13,'2013-12-14 19:29:08',1),(8,14,'2014-01-02 23:00:38',1),(9,15,'2014-01-24 03:06:55',1),(10,16,'2014-01-25 23:56:49',1),(11,17,'2014-02-16 19:47:32',1);
/*!40000 ALTER TABLE `website_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_cartitem`
--

DROP TABLE IF EXISTS `website_cartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website_cartitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_item_id` int(11) NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `price_per` decimal(8,2) NOT NULL,
  `cart_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `website_cartitem_4746e90e` (`stock_item_id`),
  KEY `website_cartitem_8a7b7230` (`cart_id`),
  CONSTRAINT `cart_id_refs_id_1911bb59` FOREIGN KEY (`cart_id`) REFERENCES `website_cart` (`id`),
  CONSTRAINT `stock_item_id_refs_id_ff407f21` FOREIGN KEY (`stock_item_id`) REFERENCES `website_stockitem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_cartitem`
--

LOCK TABLES `website_cartitem` WRITE;
/*!40000 ALTER TABLE `website_cartitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `website_cartitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_category`
--

DROP TABLE IF EXISTS `website_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `slug` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_category`
--

LOCK TABLES `website_category` WRITE;
/*!40000 ALTER TABLE `website_category` DISABLE KEYS */;
INSERT INTO `website_category` VALUES (1,'Dresses','dresses'),(2,'Skirts','skirts'),(3,'Tops & Tees','tops-tees'),(4,'Outerwear','outerwear'),(5,'Jewelry','jewelry');
/*!40000 ALTER TABLE `website_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_color`
--

DROP TABLE IF EXISTS `website_color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website_color` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `code` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_color`
--

LOCK TABLES `website_color` WRITE;
/*!40000 ALTER TABLE `website_color` DISABLE KEYS */;
INSERT INTO `website_color` VALUES (1,'Gold','#d8bb70'),(2,'Pink','pink'),(3,'Lavender','#3D3D66'),(4,'Royal Blue','#0000CC');
/*!40000 ALTER TABLE `website_color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_order`
--

DROP TABLE IF EXISTS `website_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `order_date` datetime NOT NULL,
  `order_number` varchar(32) NOT NULL,
  `status` smallint(5) unsigned NOT NULL,
  `salestax` decimal(8,2) DEFAULT NULL,
  `promo_id` int(11) DEFAULT NULL,
  `discount` decimal(8,2) DEFAULT NULL,
  `total_price` decimal(8,2) DEFAULT NULL,
  `instructions` longtext NOT NULL,
  `shipping_name` varchar(64) NOT NULL,
  `shipping_address` varchar(128) NOT NULL,
  `shipping_city` varchar(64) NOT NULL,
  `shipping_state` varchar(20) NOT NULL,
  `shipping_country` varchar(32) NOT NULL,
  `shipping_postal_code` varchar(16) NOT NULL,
  `shipping_phone` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_number` (`order_number`),
  KEY `website_order_6340c63c` (`user_id`),
  KEY `website_order_f773f6c6` (`promo_id`),
  CONSTRAINT `promo_id_refs_id_520c369a` FOREIGN KEY (`promo_id`) REFERENCES `website_promo` (`id`),
  CONSTRAINT `user_id_refs_id_c7c3a61f` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_order`
--

LOCK TABLES `website_order` WRITE;
/*!40000 ALTER TABLE `website_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `website_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_orderitem`
--

DROP TABLE IF EXISTS `website_orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website_orderitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `status` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `website_orderitem_68d25c7a` (`order_id`),
  KEY `website_orderitem_7f1b40ad` (`product_id`),
  CONSTRAINT `order_id_refs_id_af80d2be` FOREIGN KEY (`order_id`) REFERENCES `website_order` (`id`),
  CONSTRAINT `product_id_refs_id_5382a3d2` FOREIGN KEY (`product_id`) REFERENCES `website_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_orderitem`
--

LOCK TABLES `website_orderitem` WRITE;
/*!40000 ALTER TABLE `website_orderitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `website_orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_product`
--

DROP TABLE IF EXISTS `website_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `sku` varchar(32) NOT NULL,
  `story` longtext NOT NULL,
  `details` longtext NOT NULL,
  `publish_date` date NOT NULL,
  `price` int(11) NOT NULL,
  `sale_type` smallint(5) unsigned DEFAULT NULL,
  `sale_value` int(11) DEFAULT NULL,
  `sale_end_date` date DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `sub_category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `website_product_6f33f001` (`category_id`),
  KEY `website_product_90d8cf7c` (`sub_category_id`),
  CONSTRAINT `category_id_refs_id_d1eab092` FOREIGN KEY (`category_id`) REFERENCES `website_category` (`id`),
  CONSTRAINT `sub_category_id_refs_id_aed32bfc` FOREIGN KEY (`sub_category_id`) REFERENCES `website_subcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=331 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_product`
--

LOCK TABLES `website_product` WRITE;
/*!40000 ALTER TABLE `website_product` DISABLE KEYS */;
INSERT INTO `website_product` VALUES (284,'Gold Champagne Sequin Bolero Shrug Formal Wedding or Bridal Party, Holiday - Classic and Simple - EcoFriendly - SALLY','','Shop Policies: \nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav \n\nThe Sally is chic, classic and simple. It features gold sequins on a lined cropped shrug with a curved front. The sleeves are angled for a more modern look. The perfect addition to any holiday or special occasion outfit! It is lined in a white jersey fabric for added comfort. \n\nLast photo by www.luminaireimages.com/\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\nSIZING\n\nBust; Waist; Hip\nXS ----- 32, 26, 34\nS ----- 34, 28, 36\nM ----- 36, 30, 38\nL ----- 38, 32, 40 \nXL ----- 40, 34, 42\n\nMany of my items include spandex and can therefore accommodate slightly larger or smaller body measurements. Please use these body measurements as a general outline :)\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\n������ MAILING LIST ������ \nConvo us your email address to receive occasional newsletters with exclusive discounts!\n\nPOLICIES PAGE\nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav\n\nBROWSE THE REST OF OUR SHOP HERE:\nhttps://www.etsy.com/shop/Kulayan?ref=si_shop','','2014-02-16',80,NULL,NULL,NULL,1,NULL),(285,'Modal EcoFriendly Organic Gray Cowl Neck Womens Blouse, Soft Eco Friendly Jersey Classic Womens Blouse, Navy Gray White - SARA','','Shop Policies: \nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav \n\nThe Sara cowl neck blouse is a must have staple! So easy to throw on, with the easy and comfort of a Tshirt but with upgraded style. My versions of the cowl necks are made with ecofriendly and organic fabrics!\n\nGray + White blouses are made with a super soft featherweight modal jersey. \nNavy and Dark Gray (organic) are made with a bamboo spandex blend. \nRed is made with modal organic cotton spandex blend. \n\nGray: XS, S or L\nWhite: XS, S or XL\nNavy: XS, S, M, L or XL\nRed: XS, S, M, L or XL\nDark Gray (W/ Purple Undertone): L\n\nInterested in more than 1 color? Buy 2 pieces at a discount here:\nhttps://www.etsy.com/listing/163756815/womens-cowl-neck-blouse-ecofriendly?ref=shop_home_active\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\nSIZING\n\nBust (NOT Bra Size); Waist; Hip\nXS ----- 32, 26, 34\nS ----- 34, 28, 36\nM ----- 36, 30, 38\nL ----- 38, 32, 40 \nXL ----- 40, 34, 42\n\nMany of my items include spandex and can therefore accommodate slightly larger or smaller body measurements. Please use these body measurements as a general outline :)\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\n������ MAILING LIST ������ \nConvo us your email address to receive occasional newsletters with exclusive discounts!\n\nPOLICIES PAGE\nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav\n\nBROWSE THE REST OF OUR SHOP HERE:\nhttps://www.etsy.com/shop/Kulayan?ref=si_shop','','2014-02-16',50,NULL,NULL,NULL,1,NULL),(286,'Womens Fleece Lined Leggings, Stretch Black Pants, Thick and Warm, EcoFriendly Bamboo Fleece - KATYA','','Shop Policies: \nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav \n\nKatya leggings are an everyday classic design made with ecofriendly bamboo spandex fleece leggings for extra warmth. These are about 2.5 times thicker than your standard leggings. These are easy to fit and can stretch to accommodate longer legs. Great for daily use, yoga, or under ski pants for winter sports!\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\nSIZING\n\nBust (Not Bra Size); Waist; Hip\nXS ----- 32, 26, 34\nS ----- 34, 28, 36\nM ----- 36, 30, 38\nL ----- 38, 32, 40 \nXL ----- 40, 34, 42\n\nMany of my items include spandex and can therefore accommodate slightly larger or smaller body measurements. Please use these body measurements as a general outline :)\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\n������ MAILING LIST ������ \nConvo us your email address to receive occasional newsletters with exclusive discounts!\n\nPOLICIES PAGE\nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav\n\nBROWSE THE REST OF OUR SHOP HERE:\nhttps://www.etsy.com/shop/Kulayan?ref=si_shop','','2014-02-16',70,NULL,NULL,NULL,1,NULL),(287,'Gray Eyelet Dress, Womens Day Sun Dress, Eco Friendly Modal, Criss Cross X Back, Lace, Long Knee Length, Also White - TRACY','','Shop Policies: \nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav \n\nThe Tracy dress is made with a cotton eyelet lace and lined in an eco friendly modal jersey (the softest you\'ll ever feel!), this dress is simply a must have classic! The front is cut in a body flattering fit and flare, while the criss cross back provides a little Summer sass! This is a pull on dress with an elastic back and side seam pockets.\n\n* Please note that the Gray version is made to be knee length. It is about 1 1/2 inches longer than the white version. The Model in the photos is 5\'4\'\' *\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\nSIZING\n\nBust; Waist; Hip\nXS ----- 32, 26, 34\nS ----- 34, 28, 36\nM ----- 36, 30, 38\nL ----- 38, 32, 40 \nXL ----- 40, 34, 42\n\nMany of my items include spandex and can therefore accommodate slightly larger or smaller body measurements. Please use these body measurements as a general outline :)\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\n������ MAILING LIST ������ \nConvo us your email address to receive occasional newsletters with exclusive discounts!\n\nPOLICIES PAGE\nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav\n\nBROWSE THE REST OF OUR SHOP HERE:\nhttps://www.etsy.com/shop/Kulayan?ref=si_shop','','2014-02-16',120,NULL,NULL,NULL,1,NULL),(288,'Organic Blouse Button Up Back Hot Pink Fuschia Purple Bright Color Block, Neon, Organic Cotton, Modal Jersey  - CHLOE','','Shop Policies: \nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav \n\nThe Chloe blouse features a casual color block pattern, with stylish faux shell gold rimmed buttons at the back. Easy to throw on, comfortable and classic, this will be your go to Tee for Summer! Wear with pride - These blouses are made with an eco friendly jersey!\n\nPink fabric: 67% bamboo, 27% organic cotton and 6% spandex \nAll other colors: 47% modal, 47% organic cotton and 6 %spandex \n\nInterested in more than 1 color? Buy 2 pieces at a discount here:\nhttps://www.etsy.com/listing/170707958/2-womens-colorblock-tshirts-organic\n\n��� These blouses are not recommended for customers with long torsos ��� \n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\nSIZING\n\nBust (NOT Bra Size); Waist; Hip\nXS ----- 32, 26, 34\nS ----- 34, 28, 36\nM ----- 36, 30, 38\nL ----- 38, 32, 40 \nXL ----- 40, 34, 42\n\nMany of my items include spandex and can therefore accommodate slightly larger or smaller body measurements. Please use these body measurements as a general outline :)\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\n������ MAILING LIST ������ \nConvo me your email address to receive occasional newsletters with exclusive discounts!\n\nPOLICIES PAGE\nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav\n\nBROWSE THE REST OF OUR SHOP HERE:\nhttps://www.etsy.com/shop/Kulayan?ref=si_shop','','2014-02-16',50,NULL,NULL,NULL,1,NULL),(289,'Organic Cowl Neck, Womens Blouse Eco Friendly Modal Bamboo Cotton Jersey, Dark Gray, Navy, White - SARA','','Shop Policies: \nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav \n\nThe Sara cowl neck blouse is a must have staple! So easy to throw on, with the easy and comfort of a Tshirt but with upgraded style. My versions of the cowl necks are made with ecofriendly and organic fabrics!\n\nGray + White blouses are made with a super soft featherweight modal jersey. \nNavy and Dark Gray (organic) are made with a bamboo spandex blend. \nRed is made with modal organic cotton spandex blend. \n\nGray: XS, S or L\nWhite: XS, S or XL\nNavy: XS, S, M, L or XL\nRed: XS, S, M, L or XL\nDark Gray (W/ Purple Undertone): L\n\nInterested in more than 1 color? Buy 2 pieces at a discount here:\nhttps://www.etsy.com/listing/163756815/womens-cowl-neck-blouse-ecofriendly?ref=shop_home_active\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\nSIZING\n\nBust (NOT Bra Size); Waist; Hip\nXS ----- 32, 26, 34\nS ----- 34, 28, 36\nM ----- 36, 30, 38\nL ----- 38, 32, 40 \nXL ----- 40, 34, 42\n\nMany of my items include spandex and can therefore accommodate slightly larger or smaller body measurements. Please use these body measurements as a general outline :)\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\n������ MAILING LIST ������ \nConvo us your email address to receive occasional newsletters with exclusive discounts!\n\nPOLICIES PAGE\nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav\n\nBROWSE THE REST OF OUR SHOP HERE:\nhttps://www.etsy.com/shop/Kulayan?ref=si_shop','','2014-02-16',50,NULL,NULL,NULL,1,NULL),(290,'Organic Womens Blouse, Modal Bamboo Jersey, Colorblock Teal Navy, Button Up Back, Classic Tshirt - CHLOE','','Shop Policies: \nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav \n\nThe Chloe blouse features a casual color block pattern, with stylish faux shell gold rimmed buttons at the back. Easy to throw on, comfortable and classic, this will be your go to Tee for Summer! Wear with pride - These blouses are made with an eco friendly jersey!\n\nPink fabric: 67% bamboo, 27% organic cotton and 6% spandex \nAll other colors: 47% modal, 47% organic cotton and 6 %spandex \n\nInterested in more than 1 color? Buy 2 pieces at a discount here:\nhttps://www.etsy.com/listing/170707958/2-womens-colorblock-tshirts-organic\n\n��� These blouses are not recommended for customers with long torsos ���\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\nSIZING\n\nBust (NOT Bra Size); Waist; Hip\nXS ----- 32, 26, 34\nS ----- 34, 28, 36\nM ----- 36, 30, 38\nL ----- 38, 32, 40 \nXL ----- 40, 34, 42\n\nMany of my items include spandex and can therefore accommodate slightly larger or smaller body measurements. Please use these body measurements as a general outline :)\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\n������ MAILING LIST ������ \nConvo me your email address to receive occasional newsletters with exclusive discounts!\n\nPOLICIES PAGE\nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav\n\nBROWSE THE REST OF OUR SHOP HERE:\nhttps://www.etsy.com/shop/Kulayan?ref=si_shop','','2014-02-16',50,NULL,NULL,NULL,1,NULL),(291,'Navy Blue Cowl Neck, Womens Blouse, Eco Friendly Jersey, Bamboo Organic Cotton, Classic Comfortable, Also in White Grey Modal - ','','Shop Policies: \nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav \n\nThe Sara cowl neck blouse is a must have staple! So easy to throw on, with the easy and comfort of a Tshirt but with upgraded style. My versions of the cowl necks are made with ecofriendly and organic fabrics!\n\nGray + White blouses are made with a super soft featherweight modal jersey. \nNavy and Dark Gray (organic) are made with a bamboo spandex blend. \nRed is made with modal organic cotton spandex blend. \n\nGray: XS, S or L\nWhite: XS, S or XL\nNavy: XS, S, M, L or XL\nRed: XS, S, M, L or XL\nDark Gray (W/ Purple Undertone): L\n\nInterested in more than 1 color? Buy 2 pieces at a discount here:\nhttps://www.etsy.com/listing/163756815/womens-cowl-neck-blouse-ecofriendly?ref=shop_home_active\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\nSIZING\n\nBust (NOT Bra Size); Waist; Hip\nXS ----- 32, 26, 34\nS ----- 34, 28, 36\nM ----- 36, 30, 38\nL ----- 38, 32, 40 \nXL ----- 40, 34, 42\n\nMany of my items include spandex and can therefore accommodate slightly larger or smaller body measurements. Please use these body measurements as a general outline :)\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\n������ MAILING LIST ������ \nConvo us your email address to receive occasional newsletters with exclusive discounts!\n\nPOLICIES PAGE\nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav\n\nBROWSE THE REST OF OUR SHOP HERE:\nhttps://www.etsy.com/shop/Kulayan?ref=si_shop','','2014-02-16',50,NULL,NULL,NULL,1,NULL),(292,'EcoFriendly Womens Black Hoodie With Asymmetric Zipper in Bamboo Sweatshirt Fleece, Rocker Style - HANNAH','','Shop Policies: \nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav \n\nA little added style to a classic little black sweater, the Hannah hoodie features an asymmetrical metal zip and an oversized hood. Understated style at its best!\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\nSIZING\n\nBust (Not Bra Size); Waist; Hip\nXS ----- 32, 26, 34\nS ----- 34, 28, 36\nM ----- 36, 30, 38\nL ----- 38, 32, 40 \nXL ----- 40, 34, 42\n\nMany of my items include spandex and can therefore accommodate slightly larger or smaller body measurements. Please use these body measurements as a general outline :)\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\n������ MAILING LIST ������ \nConvo us your email address to receive occasional newsletters with exclusive discounts!\n\nPOLICIES PAGE\nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav\n\nBROWSE THE REST OF OUR SHOP HERE:\nhttps://www.etsy.com/shop/Kulayan?ref=si_shop','','2014-02-16',110,NULL,NULL,NULL,1,NULL),(293,'Gold Champagne Sequin Bolero Shrug Formal Wedding or Bridal Party, Holiday - Classic and Simple - EcoFriendly - SALLY','','Shop Policies: \nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav \n\nThe Sally is chic, classic and simple. It features gold sequins on a lined cropped shrug with a curved front. The sleeves are angled for a more modern look. The perfect addition to any holiday or special occasion outfit! It is lined in a white jersey fabric for added comfort. \n\nLast photo by www.luminaireimages.com/\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\nSIZING\n\nBust; Waist; Hip\nXS ----- 32, 26, 34\nS ----- 34, 28, 36\nM ----- 36, 30, 38\nL ----- 38, 32, 40 \nXL ----- 40, 34, 42\n\nMany of my items include spandex and can therefore accommodate slightly larger or smaller body measurements. Please use these body measurements as a general outline :)\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\n������ MAILING LIST ������ \nConvo us your email address to receive occasional newsletters with exclusive discounts!\n\nPOLICIES PAGE\nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav\n\nBROWSE THE REST OF OUR SHOP HERE:\nhttps://www.etsy.com/shop/Kulayan?ref=si_shop','','2014-02-16',80,NULL,NULL,NULL,1,NULL),(294,'Hoodie Wrap, EcoFriendly Fabric, Womens Sweater Wrap, Japanese Print and Bamboo Eco Friendly Jersey - KANA','','Shop Policies: \nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav \n\nAfter multiple requests, I\'ve brought back the original pattern and style without any of the side ties. This sweater wrap is super easy and comfortable to throw on and looks good loose, or tied behind the back. It is made with an ecofriendly bamboo cotton jersey.\n\nFloral: S, M or XL\nIndigo: M, L or XL\nSakura: XS, S, L or XL\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\nSIZING\n\nBust (NOT bra size); Waist; Hip\nXS ----- 32, 26, 34\nS ----- 34, 28, 36\nM ----- 36, 30, 38\nL ----- 38, 32, 40 \nXL ----- 40, 34, 42\n\nMany of my items include spandex and can therefore accommodate slightly larger or smaller body measurements. Please use these body measurements as a general outline :)\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\n������ MAILING LIST ������ \nConvo us your email address to receive occasional newsletters with exclusive discounts!\n\nPOLICIES PAGE\nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav\n\nBROWSE THE REST OF OUR SHOP HERE:\nhttps://www.etsy.com/shop/Kulayan?ref=si_shop','','2014-02-16',80,NULL,NULL,NULL,1,NULL),(295,'Organic Womens Clothing, Blouse, Tshirt, Teal Green, Navy Blue, Button Up Classic Chic Womens Top - CHLOE','','Shop Policies: \nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav \n\nThe Chloe blouse features a casual color block pattern, with stylish faux shell gold rimmed buttons at the back. Easy to throw on, comfortable and classic, this will be your go to Tee for Summer! Wear with pride - These blouses are made with an eco friendly jersey!\n\nPink fabric: 67% bamboo, 27% organic cotton and 6% spandex \nAll other colors: 47% modal, 47% organic cotton and 6 %spandex \n\nInterested in more than 1 color? Buy 2 pieces at a discount here:\nhttps://www.etsy.com/listing/170707958/2-womens-colorblock-tshirts-organic\n\n��� These blouses are not recommended for customers  with long torsos ��� \n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\nSIZING\n\nBust (NOT Bra Size); Waist; Hip\nXS ----- 32, 26, 34\nS ----- 34, 28, 36\nM ----- 36, 30, 38\nL ----- 38, 32, 40 \nXL ----- 40, 34, 42\n\nMany of my items include spandex and can therefore accommodate slightly larger or smaller body measurements. Please use these body measurements as a general outline :)\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\n������ MAILING LIST ������ \nConvo me your email address to receive occasional newsletters with exclusive discounts!\n\nPOLICIES PAGE\nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav\n\nBROWSE THE REST OF OUR SHOP HERE:\nhttps://www.etsy.com/shop/Kulayan?ref=si_shop','','2014-02-16',50,NULL,NULL,NULL,1,NULL),(296,'2 Womens Colorblock Tshirts, Organic Ecofriendy Tees, Button Up Tshirt, Navy, Teal, Red Neon Pink, 2 Pieces at Discount - CHLOE','','Shop Policies: \nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav \n\nThe Chloe blouse features a casual color block pattern, with stylish faux shell gold rimmed buttons at the back. Easy to throw on, comfortable and classic, this will be your go to Tee for Summer! Wear with pride - These blouses are made with an eco friendly jersey!\n\nPink fabric: 67% bamboo, 27% organic cotton and 6% spandex \nAll other colors: 47% modal, 47% organic cotton and 6 %spandex \n\n��� These blouses are not recommended for customers with longer torsos ���\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\nSIZING\n\nBust (Not Bra Size); Waist; Hip\nXS ----- 32, 26, 34\nS ----- 34, 28, 36\nM ----- 36, 30, 38\nL ----- 38, 32, 40 \nXL ----- 40, 34, 42\n\nMany of my items include spandex and can therefore accommodate slightly larger or smaller body measurements. Please use these body measurements as a general outline :)\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\n������ MAILING LIST ������ \nConvo us your email address to receive occasional newsletters with exclusive discounts!\n\nPOLICIES PAGE\nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav\n\nBROWSE THE REST OF OUR SHOP HERE:\nhttps://www.etsy.com/shop/Kulayan?ref=si_shop','','2014-02-16',100,NULL,NULL,NULL,1,NULL),(297,'SALE - Rainbow Womens Pencil Mini Skirt, Woven Cotton, Southwestern Style Print, Also in Navy Blue Red Stripe Print - ROSA','','Shop Policies: \nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav \n\nOriginally $60, now on Sale for $35 \n��� Selling the last of my stock! This design will not be reproduced! ���\n\nThe Rosa pencil skirt is made with a gorgeous medium weight textured woven fabric. It features an exposed gold zipper and is fully lined in cotton voile. This skirt is a great transition piece into Fall and back into Spring for next year!\n\nBlue Colorway is only available in size M\nRainbow Colorway is available in XS, S, L or XL\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\nSIZING\n\nBust; Waist; Hip\nXS ----- 32, 26, 34\nS ----- 34, 28, 36\nM ----- 36, 30, 38\nL ----- 38, 32, 40 \nXL ----- 40, 34, 42\n\nMany of my items include spandex and can therefore accommodate slightly larger or smaller body measurements. Please use these body measurements as a general outline :)\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\n������ MAILING LIST ������ \nConvo us your email address to receive occasional newsletters with exclusive discounts!\n\nPOLICIES PAGE\nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav\n\nBROWSE THE REST OF OUR SHOP HERE:\nhttps://www.etsy.com/shop/Kulayan?ref=si_shop','','2014-02-16',35,NULL,NULL,NULL,1,NULL),(298,'2 Womens Cowl Neck Blouse, Organic, EcoFriendly Womens Clothing, Bamboo Clothing, 2 Pieces at Discount Sale - SARA','','Shop Policies: \nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav \n\nThis listing is for 2 cowl neck blouses in any 2 colors. Please note your color choices in the \"Notes to Seller\" when checking out!\n\nThe Sara cowl neck blouse is a must have staple! So easy to throw on, with the easy and comfort of a Tshirt but with upgraded style. My versions of the cowl necks are made with ecofriendly and organic fabrics!\n\nGray + White blouses are made with a super soft featherweight modal jersey. \nNavy and Dark Gray (organic) are made with a bamboo spandex blend. \nRed is made with modal organic cotton spandex blend. \n\nGray: XS, S or L\nWhite: XS, S or XL\nNavy: XS, S, M, L or XL\nRed: XS, S, M, L or XL\nDark Gray (W/ Purple Undertone): L\n\nInterested in more than 1 color? Buy 2 pieces at a discount here:\nhttps://www.etsy.com/listing/163756815/womens-cowl-neck-blouse-ecofriendly?ref=shop_home_active\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\nSIZING\n\nBust (NOT Bra Size); Waist; Hip\nXS ----- 32, 26, 34\nS ----- 34, 28, 36\nM ----- 36, 30, 38\nL ----- 38, 32, 40 \nXL ----- 40, 34, 42\n\nMany of my items include spandex and can therefore accommodate slightly larger or smaller body measurements. Please use these body measurements as a general outline :)\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\n������ MAILING LIST ������ \nConvo us your email address to receive occasional newsletters with exclusive discounts!\n\nPOLICIES PAGE\nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav\n\nBROWSE THE REST OF OUR SHOP HERE:\nhttps://www.etsy.com/shop/Kulayan?ref=si_shop','','2014-02-16',80,NULL,NULL,NULL,1,NULL),(299,'SALE - Red Cotton Skirt, Flared Womens Skirt Aline French Nautical Skirt with Shirring Blue, Knee Length - JULIETTE','','Shop Policies: \nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav \n\nOriginally $50, now on Sale for $30 \n��� Selling the last of my stock! This design will not be reproduced! ���\n\nThe Juliette is a staple cotton skirt. Made with 100% cotton, it features an elastic waist and 2 side seam pockets. Wear it to the Farmers Market or to a brunch date out with the girls!\n\nRed is available in XS\nBlue is available in S\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\nSIZING\n\nBust; Waist; Hip\nXS ----- 32, 26, 34\nS ----- 34, 28, 36\nM ----- 36, 30, 38\nL ----- 38, 32, 40 \nXL ----- 40, 34, 42\n\nMany of my items include spandex and can therefore accommodate slightly larger or smaller body measurements. Please use these body measurements as a general outline :)\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\n������ MAILING LIST ������ \nConvo us your email address to receive occasional newsletters with exclusive discounts!\n\nPOLICIES PAGE\nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav\n\nBROWSE THE REST OF OUR SHOP HERE:\nhttps://www.etsy.com/shop/Kulayan?ref=si_shop','','2014-02-16',30,NULL,NULL,NULL,1,NULL),(300,'White Eyelet Lace Dress with EcoFriendly Modal Jersey Lining, Open Back Womens Summer Sundress - TRACY','','Shop Policies: \nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav \n\nThe Tracy dress is made with a white cotton eyelet lace and lined in an eco friendly modal jersey (the softest you\'ll ever feel!), this dress is simply a must have classic! The front is cut in a body flattering fit and flare, while the criss cross back provides a little Summer sass! This is a pull on dress with elastic back for easy comfort and fit.\n\n* Please note that the Gray version is made to be knee length. It is about 1 1/2 inches longer than the white version. The Model in the photos is 5\'4\'\' *\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\nSIZING\n\nBust; Waist; Hip\nXS ----- 32, 26, 34\nS ----- 34, 28, 36\nM ----- 36, 30, 38\nL ----- 38, 32, 40 \nXL ----- 40, 34, 42\n\nMany of my items include spandex and can therefore accommodate slightly larger or smaller body measurements. Please use these body measurements as a general outline :)\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\n������ MAILING LIST ������ \nConvo us your email address to receive occasional newsletters with exclusive discounts!\n\nPOLICIES PAGE\nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav\n\nBROWSE THE REST OF OUR SHOP HERE:\nhttps://www.etsy.com/shop/Kulayan?ref=si_shop','','2014-02-16',120,NULL,NULL,NULL,1,NULL),(301,'Red Navy Nautical Womens Organic Clothing, Colorblock Tshirt Blouse, Button Up Back, Cap Sleeves, Ecofriendly Jersey - CHLOE','','Shop Policies: \nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav \n\nThe Chloe blouse features a casual color block pattern, with stylish faux shell gold rimmed buttons at the back. Easy to throw on, comfortable and classic, this will be your go to Tee for Summer! Wear with pride - These blouses are made with an eco friendly jersey!\n\nPink fabric: 67% bamboo, 27% organic cotton and 6% spandex \nAll other colors: 47% modal, 47% organic cotton and 6 %spandex \n\n��� These blouses are not recommended for those with long torsos, or customers who like their blouses long ��� \n\nInterested in more than 1 color? Buy 2 pieces at a discount here:\nhttps://www.etsy.com/listing/170707958/2-womens-colorblock-tshirts-organic\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\nSIZING\n\nBust (NOT Bra Size); Waist; Hip\nXS ----- 32, 26, 34\nS ----- 34, 28, 36\nM ----- 36, 30, 38\nL ----- 38, 32, 40 \nXL ----- 40, 34, 42\n\nMany of my items include spandex and can therefore accommodate slightly larger or smaller body measurements. Please use these body measurements as a general outline :)\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\n������ MAILING LIST ������ \nConvo me your email address to receive occasional newsletters with exclusive discounts!\n\nPOLICIES PAGE\nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav\n\nBROWSE THE REST OF OUR SHOP HERE:\nhttps://www.etsy.com/shop/Kulayan?ref=si_shop','','2014-02-16',50,NULL,NULL,NULL,1,NULL),(302,'White Womens Cowl Neck Blouse, Modal Eco Friendly Jersey, Featherweight Semi Sheer Lightweight, Classic Design - SARA','','Shop Policies: \nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav \n\nThe Sara cowl neck blouse is a must have staple! So easy to throw on, with the easy and comfort of a Tshirt but with upgraded style. My versions of the cowl necks are made with ecofriendly and organic fabrics!\n\nGray + White blouses are made with a super soft featherweight modal jersey. \nNavy and Dark Gray (organic) are made with a bamboo spandex blend. \nRed is made with modal organic cotton spandex blend. \n\nGray: XS, S, M or L\nWhite: XS, S, M or XL\nNavy: XS, S, M, L or XL\nRed: XS, S, M, L or XL\nDark Gray (W/ Purple Undertone): L\n\nInterested in more than 1 color? Buy 2 pieces at a discount here:\nhttps://www.etsy.com/listing/163756815/womens-cowl-neck-blouse-ecofriendly?ref=shop_home_active\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\nSIZING\n\nBust (NOT Bra Size); Waist; Hip\nXS ----- 32, 26, 34\nS ----- 34, 28, 36\nM ----- 36, 30, 38\nL ----- 38, 32, 40 \nXL ----- 40, 34, 42\n\nMany of my items include spandex and can therefore accommodate slightly larger or smaller body measurements. Please use these body measurements as a general outline :)\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\n������ MAILING LIST ������ \nConvo us your email address to receive occasional newsletters with exclusive discounts!\n\nPOLICIES PAGE\nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav\n\nBROWSE THE REST OF OUR SHOP HERE:\nhttps://www.etsy.com/shop/Kulayan?ref=si_shop','','2014-02-16',50,NULL,NULL,NULL,1,NULL),(303,'SALE - Geometric Maxi Dress, Striped, Chevron Halter Jersey Summer Dress, Womens Clothing, Long Floor Length, Casual Blue and Gr','','Shop Policies: \nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav \n\nOriginally $90, now on Sale for $65\n��� Selling the last of my stock! This design will not be reproduced! ���\n\nThe Becky is an easy Summer staple! Made with a comfortable cotton jersey blend, this dress is easy to throw on for a casual composed look. It features shirring at the under bust to provides a more airy, relaxed and comfortable look (no clingy, tummy hugging here!). There is an adjustable halter tie at the back neck. \n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\nSIZING\n\nBust; Waist; Hip\nXS ----- 32, 26, 34\nS ----- 34, 28, 36\nM ----- 36, 30, 38\nL ----- 38, 32, 40 \nXL ----- 40, 34, 42\n\nMany of my items include spandex and can therefore accommodate slightly larger or smaller body measurements. Please use these body measurements as a general outline :)\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\n������ MAILING LIST ������ \nConvo us your email address to receive occasional newsletters with exclusive discounts!\n\nPOLICIES PAGE\nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav\n\nBROWSE THE REST OF OUR SHOP HERE:\nhttps://www.etsy.com/shop/Kulayan?ref=si_shop','','2014-02-16',65,NULL,NULL,NULL,1,NULL),(304,'9 Piece NEW Sample Sale - XS XSMALL - Best of the Best - Maxi Dresses, Aztec, Floral, Blouses, Yoga Wraps - Bulk / Wholesale Lis','','Shop Policies: \nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav \n\n��� Best of the Bulk! ���\n\nThis SAMPLE SALE listing contains all my CURRENT TOP SELLERS in size XSMALL\nPlease note that these are all sample pieces.\n\nOriginal value is: $780, Yours for: $345\nThis\'ll go fast! \n\n--- ALL ITEMS INCLUDED --\n\n1) Josie Aztec Maxi Dress in Bamboo Jersey and Satin (Orig. $125)\n2) Josie Floral Maxi Dress in Modal Jersey and Satin (Orig. $125)\n3) Tracy White Eyelet Dress in Modal Jersey and Cotton (Orig. $120)\n4) Katya Bamboo Fleece Leggings (Orig. $70)\n5) Sara Light Grey Modal Cowl Neck (Orig. $50)\n6) Sara White Modal Cowl Neck (Orig. $50)\n7) Juliette Red Cotton Market Skirt (Orig. $50)\n8) Kana Hoodie in Blue Bamboo Jersey (Orig. $80)\n9) Hannah Hoodie in Bamboo Fleece (Orig. $110)\n\n���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\nSIZING\n\nBust (NOT Bra Size); Waist; Hip\nXS ----- 32, 26, 34\nS ----- 34, 28, 36\nM ----- 36, 30, 38\nL ----- 38, 32, 40 \nXL ----- 40, 34, 42\n\nMany of my items include spandex and can therefore accommodate slightly larger or smaller body measurements. Please use these body measurements as a general outline :)\n\n���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\n������ MAILING LIST ������ \nConvo us your email address to receive occasional newsletters with exclusive discounts!\n\nPOLICIES PAGE\nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav\n\nBROWSE THE REST OF OUR SHOP HERE:\nhttps://www.etsy.com/shop/Kulayan?ref=si_shop','','2014-02-16',345,NULL,NULL,NULL,1,NULL),(305,'SALE - XS Fitted Ruffled Jacket Blazer High Collar Navy Blue Green Black Cotton, Ruffled Front small - JASMINE','','Shop Policies: \nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav \n\nOriginally $150, now on Sale for $100\n��� Selling the last of my stock! This design will not be reproduced! ���\n\nThe Jasmine is constructed with dozens of pattern pieces, and is completely lined! Wear it on casual days or as a more formal blazer for work. I\'ve used only the best fabrics for this piece with a lining made of soft cotton voile. It\'s the perfect Jacket for Fall and Spring!\n\nBlack is available in XS\nBlue is available in XS & S\nGreen is available in XS \nBeige is available in Small\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\nSIZING\n\nBust (Not Bra Size); Waist; Hip\nXS ----- 32, 26, 34\nS ----- 34, 28, 36\nM ----- 36, 30, 38\nL ----- 38, 32, 40 \nXL ----- 40, 34, 42\n\nMany of my items include spandex and can therefore accommodate slightly larger or smaller body measurements. Please use these body measurements as a general outline :)\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\nSIZING\nBust; Waist; Hip\nXS ----- 32, 26, 34\nS ----- 34, 28, 36\nM ----- 36, 30, 38\nL ----- 38, 32, 40 \nXL ----- 40, 34, 42\n\n\n������ MAILING LIST ������ \nConvo us your email address to receive occasional newsletters with exclusive discounts!\n\nPOLICIES PAGE\nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav\n\nBROWSE THE REST OF OUR SHOP HERE:\nhttps://www.etsy.com/shop/Kulayan?ref=si_shop','','2014-02-16',100,NULL,NULL,NULL,1,NULL),(306,'Womens Yoga Wrap Top, Hoodie, Bamboo Jersey, Womens EcoFriendly Clothing, Sweater Wrap - KANA','','Shop Policies: \nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav \n\nAfter multiple requests, I\'ve brought back the original pattern and style without any of the side ties. This sweater wrap is super easy and comfortable to throw on and looks good loose, or tied behind the back. It is made with an ecofriendly bamboo cotton jersey.\n\nFloral: S, M or XL\nIndigo: M, L or XL\nSakura: XS, S, L or XL\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\nSIZING\n\nBust (NOT bra size); Waist; Hip\nXS ----- 32, 26, 34\nS ----- 34, 28, 36\nM ----- 36, 30, 38\nL ----- 38, 32, 40 \nXL ----- 40, 34, 42\n\nMany of my items include spandex and can therefore accommodate slightly larger or smaller body measurements. Please use these body measurements as a general outline :)\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\n������ MAILING LIST ������ \nConvo us your email address to receive occasional newsletters with exclusive discounts!\n\nPOLICIES PAGE\nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav\n\nBROWSE THE REST OF OUR SHOP HERE:\nhttps://www.etsy.com/shop/Kulayan?ref=si_shop','','2014-02-16',80,NULL,NULL,NULL,1,NULL),(307,'SALE - Womens Ruffled Blazer, Fitted Cotton Jacket, Blue Green Black, Ruffles with Buttons and Pockets, xsmall small - JASMINE','','Shop Policies: \nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav \n\nOriginally $150, now on Sale for $100\n��� Selling the last of my stock! This design will not be reproduced! ���\n\nThe Jasmine is constructed with dozens of pattern pieces, and is completely lined! Wear it on casual days or as a more formal blazer for work. I\'ve used only the best fabrics for this piece with a lining made of soft cotton voile. It\'s the perfect Jacket for Fall and Spring!\n\nBlack is available in XS\nBlue is available in XS & Small\nGreen is available in XS \nBeige is available in Small\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\nSIZING\n\nBust (Not Bra Size); Waist; Hip\nXS ----- 32, 26, 34\nS ----- 34, 28, 36\nM ----- 36, 30, 38\nL ----- 38, 32, 40 \nXL ----- 40, 34, 42\n\nMany of my items include spandex and can therefore accommodate slightly larger or smaller body measurements. Please use these body measurements as a general outline :)\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\n������ MAILING LIST ������ \nConvo us your email address to receive occasional newsletters with exclusive discounts!\n\nPOLICIES PAGE\nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav\n\nBROWSE THE REST OF OUR SHOP HERE:\nhttps://www.etsy.com/shop/Kulayan?ref=si_shop','','2014-02-16',100,NULL,NULL,NULL,1,NULL),(308,'Ecofriendly Womens Wrap, Bamboo Jersey Yoga Wrap, Cotton Hood Hoodie, Womens Sweater Cardigan, Japanese Floral Print - KANA','','Shop Policies: \nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav \n\nAfter multiple requests, I\'ve brought back the original pattern and style without any of the side ties. This sweater wrap is super easy and comfortable to throw on and looks good loose, or tied behind the back. It is made with an ecofriendly bamboo cotton jersey and paired with 100% cotton for the pocket trim and hood. \n\nFloral: S, M or XL\nIndigo: M, L or XL\nSakura: XS, S, L or XL\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\nSIZING\n\nBust (NOT Bra Size); Waist; Hip\nXS ----- 32, 26, 34\nS ----- 34, 28, 36\nM ----- 36, 30, 38\nL ----- 38, 32, 40 \nXL ----- 40, 34, 42\n\nMany of my items include spandex and can therefore accommodate slightly larger or smaller body measurements. Please use these body measurements as a general outline :)\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\n������ MAILING LIST ������ \nConvo us your email address to receive occasional newsletters with exclusive discounts!\n\nPOLICIES PAGE\nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav\n\nBROWSE THE REST OF OUR SHOP HERE:\nhttps://www.etsy.com/shop/Kulayan?ref=si_shop','','2014-02-16',80,NULL,NULL,NULL,1,NULL),(309,'Sweater Wrap, Eco Friendly Bamboo Jersey Yoga Wrap Hoodie, Womens Sweater Cardigan, Japanese Floral Print - KANA','','Shop Policies: \nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav \n\nAfter multiple requests, I\'ve brought back the original pattern and style without any of the side ties. This sweater wrap is super easy and comfortable to throw on and looks good loose, or tied behind the back. It is made with an ecofriendly bamboo cotton jersey and paired with a 100% cotton print for the hood and trim.\n\nFloral: S, M or XL\nIndigo: M, L or XL\nSakura: XS, S, L or XL\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\nSIZING\n\nBust (NOT bra size); Waist; Hip\nXS ----- 32, 26, 34\nS ----- 34, 28, 36\nM ----- 36, 30, 38\nL ----- 38, 32, 40 \nXL ----- 40, 34, 42\n\nMany of my items include spandex and can therefore accommodate slightly larger or smaller body measurements. Please use these body measurements as a general outline :)\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\n������ MAILING LIST ������ \nConvo us your email address to receive occasional newsletters with exclusive discounts!\n\nPOLICIES PAGE\nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav\n\nBROWSE THE REST OF OUR SHOP HERE:\nhttps://www.etsy.com/shop/Kulayan?ref=si_shop','','2014-02-16',80,NULL,NULL,NULL,1,NULL),(310,'Organic Womens Clothing, Tshirt Dress in Cotton Bamboo Jersey Knit with Japanese Floral Print Belt Wrap, Pink - MARINA','','Shop Policies: \nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav \n\nMade with soft bamboo cotton jersey, the Marina is perfect for a casual day at the dock, or a comfortable option to constricting and ordinary work outfits. Flattering for all body types, this dress features a pleated bust, elasticized back waist and combination print for the shoulder trim and belt. \n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\nSIZING\n\nBust; Waist; Hip\nXS ----- 32, 26, 34\nS ----- 34, 28, 36\nM ----- 36, 30, 38\nL ----- 38, 32, 40 \nXL ----- 40, 34, 42\n\nMany of my items include spandex and can therefore accommodate slightly larger or smaller body measurements. Please use these body measurements as a general outline :)\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\n������ MAILING LIST ������ \nConvo us your email address to receive occasional newsletters with exclusive discounts!\n\nPOLICIES PAGE\nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav\n\nBROWSE THE REST OF OUR SHOP HERE:\nhttps://www.etsy.com/shop/Kulayan?ref=si_shop','','2014-02-16',90,NULL,NULL,NULL,1,NULL),(311,'Womens Color Block Tshirt with Button Up Back, Neon Purple Pink Cap Sleeve Blouse, Organic Eco Friendly Clothing - CHLOE','','Shop Policies: \nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav \n\nThe Chloe blouse features a casual color block pattern, with stylish faux shell gold rimmed buttons at the back. Easy to throw on, comfortable and classic, this will be your go to Tee for Summer! Wear with pride - These blouses are made with an eco friendly jersey!\n\nPink fabric: 67% bamboo, 27% organic cotton and 6% spandex \nAll other colors: 47% modal, 47% organic cotton and 6 %spandex \n\nInterested in more than 1 color? Buy 2 pieces at a discount here:\nhttps://www.etsy.com/listing/170707958/2-womens-colorblock-tshirts-organic\n\n��� These blouses are not recommended for customers with long torsos ��� \n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\nSIZING\n\nBust (NOT Bra Size); Waist; Hip\nXS ----- 32, 26, 34\nS ----- 34, 28, 36\nM ----- 36, 30, 38\nL ----- 38, 32, 40 \nXL ----- 40, 34, 42\n\nMany of my items include spandex and can therefore accommodate slightly larger or smaller body measurements. Please use these body measurements as a general outline :)\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\n������ MAILING LIST ������ \nConvo me your email address to receive occasional newsletters with exclusive discounts!\n\nPOLICIES PAGE\nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav\n\nBROWSE THE REST OF OUR SHOP HERE:\nhttps://www.etsy.com/shop/Kulayan?ref=si_shop','','2014-02-16',50,NULL,NULL,NULL,1,NULL),(312,'Organic Cotton Womens Eco Friendly Blouse, Cowl Neck Blouse, Tshirt, Womens EcoFriendly Clothing, Red, Gray - SARA','','Shop Policies: \nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav \n\nThe Sara cowl neck blouse is a must have staple! So easy to throw on, with the easy and comfort of a Tshirt but with upgraded style. My versions of the cowl necks are made with ecofriendly and organic fabrics!\n\nGray + White blouses are made with a super soft featherweight modal jersey. \nNavy and Dark Gray (organic) are made with a bamboo spandex blend. \nRed is made with modal organic cotton spandex blend. \n\nGray: XS, S or L\nWhite: XS, S or XL\nNavy: XS, S, M, L or XL\nRed: XS, S, M, L or XL\nDark Gray (W/ Purple Undertone): L\n\nInterested in more than 1 color? Buy 2 pieces at a discount here:\nhttps://www.etsy.com/listing/163756815/womens-cowl-neck-blouse-ecofriendly?ref=shop_home_active\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\nSIZING\n\nBust (NOT Bra Size); Waist; Hip\nXS ----- 32, 26, 34\nS ----- 34, 28, 36\nM ----- 36, 30, 38\nL ----- 38, 32, 40 \nXL ----- 40, 34, 42\n\nMany of my items include spandex and can therefore accommodate slightly larger or smaller body measurements. Please use these body measurements as a general outline :)\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\n������ MAILING LIST ������ \nConvo us your email address to receive occasional newsletters with exclusive discounts!\n\nPOLICIES PAGE\nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav\n\nBROWSE THE REST OF OUR SHOP HERE:\nhttps://www.etsy.com/shop/Kulayan?ref=si_shop','','2014-02-16',50,NULL,NULL,NULL,1,NULL),(313,'SALE - Striped Maxi Dress Black Gray Jersey,  Womens Halter Summer Dress Stripe Geometric Angled - BECKY','','Shop Policies: \nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav \n\nOriginally $90, now on Sale for $65\n��� Selling the last of my stock! This design will not be reproduced! ���\n\nThe Becky is an easy Summer staple! Made with a comfortable cotton jersey blend, this dress is easy to throw on for a casual composed look. It features shirring at the under bust to provides a more airy, relaxed and comfortable look (no clingy, tummy hugging here!). There is an adjustable halter tie at the back neck. \n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\nSIZING\n\nBust; Waist; Hip\nXS ----- 32, 26, 34\nS ----- 34, 28, 36\nM ----- 36, 30, 38\nL ----- 38, 32, 40 \nXL ----- 40, 34, 42\n\nMany of my items include spandex and can therefore accommodate slightly larger or smaller body measurements. Please use these body measurements as a general outline :)\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\n������ MAILING LIST ������ \nConvo us your email address to receive occasional newsletters with exclusive discounts!\n\nPOLICIES PAGE\nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav\n\nBROWSE THE REST OF OUR SHOP HERE:\nhttps://www.etsy.com/shop/Kulayan?ref=si_shop','','2014-02-16',65,NULL,NULL,NULL,1,NULL),(314,'Wrap Dress, Womens Dress, Stretch ITY Jersey, Purple Raspberry Bright Plaid Print with Black, Geometric, Vneck Dress - KELLY','','Shop Policies: \nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav \n\nA DVF inspired bold wrap dress that will flatter all body types. Perfect to take from work to evening, this dress is sure to become a wardrobe staple! This is made with a lightweight, super soft feeling ITY stretch jersey with a plum berry and black geometric print. This is a limited edition piece!\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\nSIZING\n\nBust; Waist; Hip\nXS ----- 32, 26, 34\nS ----- 34, 28, 36\nM ----- 36, 30, 38\nL ----- 38, 32, 40 \nXL ----- 40, 34, 42\n\nMany of my items include spandex and can therefore accommodate slightly larger or smaller body measurements. Please use these body measurements as a general outline :)\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\n������ MAILING LIST ������ \nConvo us your email address to receive occasional newsletters with exclusive discounts!\n\nPOLICIES PAGE\nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav\n\nBROWSE THE REST OF OUR SHOP HERE:\nhttps://www.etsy.com/shop/Kulayan?ref=si_shop','','2014-02-16',95,NULL,NULL,NULL,1,NULL),(315,'Knotted Womens Tunic Dress, Basketweave Fabric Manipulation, Origami Pleating, Eco Friendly Organic Modal Jersey, Steel Blue - C','','Shop Policies: \nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav\n\nParis is calling! The Coco is a tres chic tunic that looks great belted on hot Summer days, or layered for the chillier months! It is made with an organic eco friendly jersey that is 47% modal, 47% organic cotton and 6% spandex. It features a hand knotted open geometric back and a knotted front. This tunic is best worn belted.  \n\n*Belt pictured is not included in purchase*\n\nSteel Blue: XS, S, M or L\nRed: XS, S, M, L or XL\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\nSIZING\n\nBust (NOT Bra Size); Waist; Hip\nXS ----- 32, 26, 35\nS ----- 34, 28, 37\nM ----- 36, 30, 39\nL ----- 38, 32, 41\nXL ----- 40, 34, 43\n\nMany of my items include spandex and can therefore accommodate slightly larger or smaller body measurements. Please use these body measurements as a general outline :)\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\n������ MAILING LIST ������ \nConvo me your email address to receive occasional newsletters with exclusive discounts!\n\nPOLICIES PAGE\nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav\n\nBROWSE THE REST OF OUR SHOP HERE:\nhttps://www.etsy.com/shop/Kulayan?ref=si_shop','','2014-02-16',95,NULL,NULL,NULL,1,NULL),(316,'SALE - Fitted Cotton Blazer, Womens Ruffled Jacket, XS small High Collar Hunter Green Navy Black - JASMINE','','Shop Policies: \nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav \n\nOriginally $150, now on Sale for $100\n��� Selling the last of my stock! This design will not be reproduced! ���\n\nThe Jasmine is constructed with dozens of pattern pieces, and is completely lined! Wear it on casual days or as a more formal blazer for work. I\'ve used only the best fabrics for this piece with a lining made of soft cotton voile. It\'s the perfect Jacket for Fall and Spring!\n\nBlack is available in XS\nBlue is available in XS & Small\nGreen is available in XS \nBeige is available in Small\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\nSIZING\n\nBust (Not Bra Size); Waist; Hip\nXS ----- 32, 26, 34\nS ----- 34, 28, 36\nM ----- 36, 30, 38\nL ----- 38, 32, 40 \nXL ----- 40, 34, 42\n\nMany of my items include spandex and can therefore accommodate slightly larger or smaller body measurements. Please use these body measurements as a general outline :)\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\n������ MAILING LIST ������ \nConvo us your email address to receive occasional newsletters with exclusive discounts!\n\nPOLICIES PAGE\nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav\n\nBROWSE THE REST OF OUR SHOP HERE:\nhttps://www.etsy.com/shop/Kulayan?ref=si_shop','','2014-02-16',100,NULL,NULL,NULL,1,NULL),(317,'SALE - Southern Bridesmaid Dress, Cotton Pleated Origami Collar, Semi Formal Dress in Ocean Blue - CELIA','','Shop Policies: \nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav \n\nOriginally $150, now on Sale for $40\n��� Selling the last of my stock! This design will not be reproduced! ���\n\nThe Celia is a beautiful dress for formal occasions like weddings and graduations! It is made in 100% cotton and features a side zipper, belt and pleated neckline. \n\nOnly available in S, M or L\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\nSIZING\n\nBust; Waist; Hip\nXS ----- 32, 26, 34\nS ----- 34, 28, 36\nM ----- 36, 30, 38\nL ----- 38, 32, 40 \nXL ----- 40, 34, 42\n\nMany of my items include spandex and can therefore accommodate slightly larger or smaller body measurements. Please use these body measurements as a general outline :)\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\n������ MAILING LIST ������ \nConvo us your email address to receive occasional newsletters with exclusive discounts!\n\nPOLICIES PAGE\nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav\n\nBROWSE THE REST OF OUR SHOP HERE:\nhttps://www.etsy.com/shop/Kulayan?ref=si_shop','','2014-02-16',40,NULL,NULL,NULL,1,NULL),(318,'Fleece Leggings in Black EcoFriendly Bamboo Fleece Jersey, Thick and Warm Perfect for Fall and Winter - KATYA','','Shop Policies: \nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav \n\nKatya leggings are an everyday classic design made with ecofriendly bamboo spandex fleece leggings for extra warmth. These are about 2.5 times thicker than your standard leggings. These are easy to fit and can stretch to accommodate longer legs. Great for daily use, yoga, or under ski pants for winter sports!\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\nSIZING\n\nBust (Not Bra Size); Waist; Hip\nXS ----- 32, 26, 34\nS ----- 34, 28, 36\nM ----- 36, 30, 38\nL ----- 38, 32, 40 \nXL ----- 40, 34, 42\n\nMany of my items include spandex and can therefore accommodate slightly larger or smaller body measurements. Please use these body measurements as a general outline :)\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\n������ MAILING LIST ������ \nConvo us your email address to receive occasional newsletters with exclusive discounts!\n\nPOLICIES PAGE\nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav\n\nBROWSE THE REST OF OUR SHOP HERE:\nhttps://www.etsy.com/shop/Kulayan?ref=si_shop','','2014-02-16',70,NULL,NULL,NULL,1,NULL),(319,'Womens Tunic, Organic Cotton Modal Summer Dress, Hand Knotted Back, Pattern, Geometric, Steel Blue Gray and Red - COCO','','Shop Policies: \nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav\n\nParis is calling! The Coco is a tres chic tunic that looks great belted on hot Summer days, or layered for the chillier months! It is made with an organic eco friendly jersey that is 47% modal, 47% organic cotton and 6% spandex. It features a hand knotted open geometric back and a knotted front. This tunic is best worn belted.  \n\n*Belt pictured is not included in purchase*\n\nSteel Blue: XS, S, M or L\nRed: XS, S, M, L or XL\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\nSIZING\n\nBust (NOT Bra Size); Waist; Hip\nXS ----- 32, 26, 35\nS ----- 34, 28, 37\nM ----- 36, 30, 39\nL ----- 38, 32, 41\nXL ----- 40, 34, 43\n\nMany of my items include spandex and can therefore accommodate slightly larger or smaller body measurements. Please use these body measurements as a general outline :)\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\n������ MAILING LIST ������ \nConvo me your email address to receive occasional newsletters with exclusive discounts!\n\nPOLICIES PAGE\nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav\n\nBROWSE THE REST OF OUR SHOP HERE:\nhttps://www.etsy.com/shop/Kulayan?ref=si_shop','','2014-02-16',95,NULL,NULL,NULL,1,NULL),(320,'SALE - Emerald Green Lace Dress with Black Jersey Lining Vneck Tight Fitted Pencil Skirt - ELIZA - Small or Large','','Shop Policies: \nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav \n\n��� Selling the last of my stock! This design will not be reproduced! ���\n\nThis is a classic and demure dress with just a hint of attitude. The Eliza lace dress is made with a stretch green floral lace lined with a comfortable black jersey. It features a vneck front and back, and sheer sleeves. \n\nGreen is available in S or L\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\nSIZING\n\nBust (NOT Bra Size); Waist; Hip\nXS ----- 32, 26, 34\nS ----- 34, 28, 36\nM ----- 36, 30, 38\nL ----- 38, 32, 40 \nXL ----- 40, 34, 42\n\nMany of my items include spandex and can therefore accommodate slightly larger or smaller body measurements. Please use these body measurements as a general outline :)\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\n������ MAILING LIST ������ \nConvo us your email address to receive occasional newsletters with exclusive discounts!\n\nPOLICIES PAGE\nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav\n\nBROWSE THE REST OF OUR SHOP HERE:\nhttps://www.etsy.com/shop/Kulayan?ref=si_shop','','2014-02-16',40,NULL,NULL,NULL,1,NULL),(321,'SMALL, Sample Sale, Wholesale Bulk Listing, 11 Pieces Included, Dresses, Tops, Skirts, Organic Jersey, Chiffon Lace, Hoodie Wrap','','Shop Policies: \nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav \n\n��� Wholesale Bulk Lot in Size Small ���\n\nThis listing includes all 11 pieces listed below.\n\n--- ITEMS INCLUDED --\n\n1) Emma Black Lace Chiffon Top\n2) Emma Black Lace Chiffon Dress\n3) Sara Organic Cotton Bamboo Black Cowl Neck Blouse\n4) Josie Denim Blue Sweater Dress with Black Lace Inserts\n5) Kelly ITY Black Graffiti Print Wrap Dress\n6) Juliette Blue Cotton Market Flared Skirt\n7 & 8) Lisa Tank Tops with Lace Overlay - Purple & Pink\n9) Dawn Black Layered Jersey Skirt\n10) Marina Blue/Purple Combination Pleated Bust Jersey Dress\n11) Kana Hoodie Wrap in Organic Blue Jersey\n\n\nPlease note that the colors in the pictures are not indicative of what you will receive - please see descriptions above for colorways. \n\n���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\nSIZING\n\nBust (NOT Bra Size); Waist; Hip\nXS ----- 32, 26, 34\nS ----- 34, 28, 36\nM ----- 36, 30, 38\nL ----- 38, 32, 40 \nXL ----- 40, 34, 42\n\nMany of my items include spandex and can therefore accommodate slightly larger or smaller body measurements. Please use these body measurements as a general outline :)\n\n���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\n������ MAILING LIST ������ \nConvo us your email address to receive occasional newsletters with exclusive discounts!\n\nPOLICIES PAGE\nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav\n\nBROWSE THE REST OF OUR SHOP HERE:\nhttps://www.etsy.com/shop/Kulayan?ref=si_shop','','2014-02-16',175,NULL,NULL,NULL,1,NULL),(322,'SALE - Navy Lace Dress, Womens Date Night, Blue Dark Plum Purple Sheer Belted Cocktail Dress, Pencil Cut Skirt - ELIZA - xs xsma','','Shop Policies: \nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav \n\nOriginally $110, now on Sale for $40\n��� Selling the last of my stock! This design will not be reproduced! ���\n\nThis dress is made with navy lace and is lined in a purple stretch fabric. There are no buttons or zippers to deal with here - just an easy pull on dress! It also comes with a jersey belt tie to cinch in the waist.\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\nSIZING\n\nBust (NOT Bra Size); Waist; Hip\nXS ----- 32, 26, 34\nS ----- 34, 28, 36\nM ----- 36, 30, 38\nL ----- 38, 32, 40 \nXL ----- 40, 34, 42\n\nMany of my items include spandex and can therefore accommodate slightly larger or smaller body measurements. Please use these body measurements as a general outline :)\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\n������ MAILING LIST ������ \nConvo us your email address to receive occasional newsletters with exclusive discounts!\n\nPOLICIES PAGE\nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav\n\nBROWSE THE REST OF OUR SHOP HERE:\nhttps://www.etsy.com/shop/Kulayan?ref=si_shop','','2014-02-16',40,NULL,NULL,NULL,1,NULL),(323,'MEDIUM, Sample Sale, Wholesale Bulk Listing, 5 Different Items, Dresses, Wrap Dress, Halter Dress, Organic Cowl Neck Blouse','','Shop Policies: \nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav \n\n��� Bulk Sample Sale Listing in Size MEDIUM ���\n\nThis listing includes all 5 pieces listed below\n\n--- ITEMS INCLUDED --\n\n1) Becky Cotton Striped Cotton Halter Maxi Dress in Blue\n2) Marina Tshirt Dress in Pink Organic Jersey\n3) Kelly Jewel Tone Tulip Wrap Dress Lined in Organic Jersey\n4) Rosa Cotton Woven Skirt in Rainbow Colorway\n5) Dawn Black Layered Jersey Skirt\n6) Sara Cowl Neck Organic Blouse in Teal Blue\n\n���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\nSIZING\nBust (NOT Bra Size); Waist; Hip\nXS ----- 32, 26, 34\nS ----- 34, 28, 36\nM ----- 36, 30, 38\nL ----- 38, 32, 40 \nXL ----- 40, 34, 42\n\nMany of my items include spandex and can therefore accommodate slightly larger or smaller body measurements. Please use these body measurements as a general outline :)\n\n���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\n\n������ MAILING LIST ������ \nConvo us your email address to receive occasional newsletters with exclusive discounts!\n\nPOLICIES PAGE\nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav\n\nBROWSE THE REST OF OUR SHOP HERE:\nhttps://www.etsy.com/shop/Kulayan?ref=si_shop','','2014-02-16',180,NULL,NULL,NULL,1,NULL),(324,'SALE - Layered Ruffle Pencil Skirt, Modern Cowgirl Western Country Skirt Black Cotton, Only size Small - DAWN','','Shop Policies: \nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav \n\nOriginally $75, now on Sale for $35\n��� Selling the last of my stock! This design will not be reproduced! ���\n\nThe Dawn is such a fun and easy skirt. It is designed to sit on your natural waist and is made with layers of hand cut cotton blend jersey. This is a great transition piece for Summer into Fall and Winter into Spring - Use this skirt all year long!\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\nSIZING\n\nBust; Waist; Hip\nXS ----- 32, 26, 34\nS ----- 34, 28, 36\nM ----- 36, 30, 38\nL ----- 38, 32, 40 \nXL ----- 40, 34, 42\n\nMany of my items include spandex and can therefore accommodate slightly larger or smaller body measurements. Please use these body measurements as a general outline :)\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\n������ MAILING LIST ������ \nConvo us your email address to receive occasional newsletters with exclusive discounts!\n\nPOLICIES PAGE\nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav\n\nBROWSE THE REST OF OUR SHOP HERE:\nhttps://www.etsy.com/shop/Kulayan?ref=si_shop','','2014-02-16',35,NULL,NULL,NULL,1,NULL),(325,'Organic Tshirt Dress in Bamboo Cotton Jersey Knit Floral Print Womens Wrap Dress, Also in Navy - MARINA','','Shop Policies: \nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav \n\nMade with soft bamboo cotton jersey, the Marina is perfect for a casual day at the dock, or a comfortable option to constricting and ordinary work outfits. Flattering for all body types, this dress features a pleated bust, elasticized back waist and combination print for the shoulder trim and belt. \n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\nSIZING\n\nBust; Waist; Hip\nXS ----- 32, 26, 34\nS ----- 34, 28, 36\nM ----- 36, 30, 38\nL ----- 38, 32, 40 \nXL ----- 40, 34, 42\n\nMany of my items include spandex and can therefore accommodate slightly larger or smaller body measurements. Please use these body measurements as a general outline :)\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\n������ MAILING LIST ������ \nConvo us your email address to receive occasional newsletters with exclusive discounts!\n\nPOLICIES PAGE\nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav\n\nBROWSE THE REST OF OUR SHOP HERE:\nhttps://www.etsy.com/shop/Kulayan?ref=si_shop','','2014-02-16',90,NULL,NULL,NULL,1,NULL),(326,'XS XSMALL 14 Pieces Different Pieces, Sample Sale Listing, Clearance, Sale, Organic, Dresses, Tops, Sweater','','Shop Policies: \nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav \n\n��� Bulk Sample Sale Listing in Size XSMALL ���\n\nThis listing includes all 14 pieces listed below\n\n--- ITEMS INCLUDED --\n\n1) Marina Denim Blue Jersey Dress with Purple/Blue Print\n2) Rosa Rainbow Cotton Woven Skirt\n\n3) Dawn Black Layered Pencil Skirt --> No longer included, will be replaced with Sara Cowl Neck in Organic Bamboo Cotton Jersey in Teal Color \n\n4) Kana Hoodie in Purple\n5) Kelly Wrap Dress in Jewel Tones, Lined in Organic Jersey\n6) Sara Cowl Neck in Black Organic Jersey\n7) Kelly Black/White Print Wrap Dress\n8) Juliette Cotton Market Skirt in Yellow\n9) Eliza Blue/Purple Lace Dress\n10) Josie Black/White Striped Lace Top\n11) Juliette Cotton Market Skirt in Blue\n12) Josie Sweater Dress in Beige Knit\n13) Odette Sweetheart Neckline Retro Print Dress\n14) Sandra Polka Dot Sundress in Blue\n\n���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\nSIZING\n\nBust; Waist; Hip\nXS ----- 32, 26, 34\nS ----- 34, 28, 36\nM ----- 36, 30, 38\nL ----- 38, 32, 40 \nXL ----- 40, 34, 42\n\nMany of my items include spandex and can therefore accommodate slightly larger or smaller body measurements. Please use these body measurements as a general outline :)\n\n���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\n������ MAILING LIST ������ \nConvo us your email address to receive occasional newsletters with exclusive discounts!\n\nPOLICIES PAGE\nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav\n\nBROWSE THE REST OF OUR SHOP HERE:\nhttps://www.etsy.com/shop/Kulayan?ref=si_shop','','2014-02-16',250,NULL,NULL,NULL,1,NULL),(327,'SALE - Beaded Layered Long Opera Necklace Bright Rainbow Colors Solid Statement Necklace Summer, All Colors Available','','Shop Policies: \nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav \n \n��� Originally $60, now $45 ���\n\nThis is a stunning beaded necklace that is sure to spice up a casual outfit, or complete that date night outfit! With a slight shine, this piece is super eye catching and unique! Wear it as is, or roll up the back of the necklace to create a necktie effect. Use 2 colors for a more of statement!\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\n������ MAILING LIST ������ \nConvo us your email address to receive occasional newsletters with exclusive discounts!\n\nPOLICIES PAGE\nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav\n\nBROWSE THE REST OF OUR SHOP HERE:\nhttps://www.etsy.com/shop/Kulayan?ref=si_shop','','2014-02-16',45,NULL,NULL,NULL,1,NULL),(328,'LARGE - Sample Sale, Wholesale Bulk Lot Listing in size LARGE - Dresses, Tops, Skirts, Jackets, 9 Pieces Included','','Shop Policies: \nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav \n\n��� Bulk Sample Sale Listing in Size LARGE ���\n\nThis listing includes all 9 pieces listed below\n\n--- ITEMS INCLUDED --\n\n1) Marina Tshirt Dress in Denim Blue with Blue/Purple Cotton Floral Trim\n2) Josie Sweater Dress in Light Denim Blue with Black Lace Inserts\n3) Becky Blue Jersey Halter Maxi Dress \n4) Lisa Lace Tank Top in Pink\n5) Lisa Lace Tank Top in Purple\n6) Eliza Green Lace Dress Lined in Black Jersey\n7) Juliette Cotton Market Skirt in Yellow\n8) Juliette Cotton Market Skirt in Red\n9) Kelly Black/White Graffiti Print Wrap Dress\n\n���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\nSIZING\n\nBust; Waist; Hip\nXS ----- 32, 26, 34\nS ----- 34, 28, 36\nM ----- 36, 30, 38\nL ----- 38, 32, 40 \nXL ----- 40, 34, 42\n\nMany of my items include spandex and can therefore accommodate slightly larger or smaller body measurements. Please use these body measurements as a general outline :)\n\n���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\n������ MAILING LIST ������ \nConvo us your email address to receive occasional newsletters with exclusive discounts!\n\nPOLICIES PAGE\nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav\n\nBROWSE THE REST OF OUR SHOP HERE:\nhttps://www.etsy.com/shop/Kulayan?ref=si_shop','','2014-02-16',175,NULL,NULL,NULL,1,NULL),(329,'SALE - Flared Cotton Skirt, Womens Market Skirt Blue Red Full Aline Knee Length Pockets - JULIETTE','','Shop Policies: \nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav \n\nOriginally $50, now $30  \n��� Selling the last of my stock! This design will not be reproduced! ���\n\nThe Juliette is a staple cotton skirt. Made with 100% cotton, it features an elastic waist and 2 side seam pockets. Wear it to the Farmers Market or to a brunch date out with the girls!\n\nRed is available in XS\nBlue is available in S\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\nSIZING\n\nBust; Waist; Hip\nXS ----- 32, 26, 34\nS ----- 34, 28, 36\nM ----- 36, 30, 38\nL ----- 38, 32, 40 \nXL ----- 40, 34, 42\n\nMany of my items include spandex and can therefore accommodate slightly larger or smaller body measurements. Please use these body measurements as a general outline :)\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\n������ MAILING LIST ������ \nConvo us your email address to receive occasional newsletters with exclusive discounts!\n\nPOLICIES PAGE\nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav\n\nBROWSE THE REST OF OUR SHOP HERE:\nhttps://www.etsy.com/shop/Kulayan?ref=si_shop','','2014-02-16',30,NULL,NULL,NULL,1,NULL),(330,'SALE - Woven Navy Pencil Skirt, Striped Fabric, Exposed Gold Zipper, Fall Look, Red Print, Rainbow Summer Style Also - ROSA','','Shop Policies: \nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav \n\nOriginally $60, now on Sale for $35 \n��� Selling the last of my stock! This design will not be reproduced! ���\n\nThe Rosa pencil skirt is made with a gorgeous medium weight textured woven fabric. It features an exposed gold zipper and is fully lined in cotton voile. This skirt is a great transition piece into Fall and back into Spring for next year!\n\nBlue Colorway is only available in size M  \nRainbow Colorway is available in XS, S, L or XL\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\nSIZING\n\nBust (NOT Bra Size); Waist; Hip\nXS ----- 32, 26, 34\nS ----- 34, 28, 36\nM ----- 36, 30, 38\nL ----- 38, 32, 40 \nXL ----- 40, 34, 42\n\nMany of my items include spandex and can therefore accommodate slightly larger or smaller body measurements. Please use these body measurements as a general outline :)\n\n������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\n\n������ MAILING LIST ������ \nConvo us your email address to receive occasional newsletters with exclusive discounts!\n\nPOLICIES PAGE\nhttps://www.etsy.com/shop/Kulayan/policy?ref=shopinfo_policies_leftnav\n\nBROWSE THE REST OF OUR SHOP HERE:\nhttps://www.etsy.com/shop/Kulayan?ref=si_shop','','2014-02-16',35,NULL,NULL,NULL,1,NULL);
/*!40000 ALTER TABLE `website_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_productimage`
--

DROP TABLE IF EXISTS `website_productimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website_productimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `order` smallint(5) unsigned NOT NULL,
  `height` int(10) unsigned,
  `width` int(10) unsigned,
  PRIMARY KEY (`id`),
  KEY `website_productimage_7f1b40ad` (`product_id`),
  CONSTRAINT `product_id_refs_id_88136a6f` FOREIGN KEY (`product_id`) REFERENCES `website_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=453 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_productimage`
--

LOCK TABLES `website_productimage` WRITE;
/*!40000 ALTER TABLE `website_productimage` DISABLE KEYS */;
INSERT INTO `website_productimage` VALUES (359,'images/products/il_fullxfull.532608371_46jy_2.jpg',284,0,684,477),(360,'images/products/il_fullxfull.532524002_6sdp_2.jpg',284,0,1500,998),(361,'images/products/il_fullxfull.493131207_8os7_5.jpg',285,0,1500,1418),(362,'images/products/il_fullxfull.492703714_t977_7.jpg',285,0,1374,1500),(363,'images/products/il_fullxfull.544873007_g7x6_2.jpg',286,0,1500,1061),(364,'images/products/il_fullxfull.492594034_oa9r_6.jpg',286,0,1500,1291),(365,'images/products/il_fullxfull.516872426_ldfm_5.jpg',287,0,1500,1470),(366,'images/products/il_fullxfull.516932409_6ulj_3.jpg',287,0,1500,1305),(367,'images/products/il_fullxfull.531183066_dr0u_2.jpg',288,0,1393,1500),(368,'images/products/il_fullxfull.531251855_dd6c_5.jpg',288,0,1500,1221),(369,'images/products/il_fullxfull.516601224_be3y_5.jpg',289,0,1363,1273),(370,'images/products/il_fullxfull.516667367_ldwc_3.jpg',289,0,1500,1309),(371,'images/products/il_fullxfull.531269037_tgdv_2.jpg',290,0,1500,1099),(372,'images/products/il_fullxfull.531251855_dd6c_6.jpg',290,0,1500,1221),(373,'images/products/il_fullxfull.493307085_e2mi_4.jpg',291,0,1223,1181),(374,'images/products/il_fullxfull.493251582_7gbu_2.jpg',291,0,1306,1500),(375,'images/products/il_fullxfull.492650663_ib8v_4.jpg',292,0,1319,1345),(376,'images/products/il_fullxfull.492650615_q2ai_2.jpg',292,0,1296,1295),(377,'images/products/il_fullxfull.492272281_si4v_5.jpg',293,0,1429,1500),(378,'images/products/il_fullxfull.492215598_cgim_4.jpg',293,0,1460,1500),(379,'images/products/il_fullxfull.503478820_eal7_5.jpg',294,0,1354,1489),(380,'images/products/il_fullxfull.503479526_nq8h_2.jpg',294,0,1500,1460),(381,'images/products/il_fullxfull.544787930_1ggi_2.jpg',295,0,1320,1500),(382,'images/products/il_fullxfull.544879459_b5ib_2.jpg',295,0,1492,1500),(383,'images/products/il_fullxfull.531272437_2ywx_1.jpg',296,0,540,720),(384,'images/products/il_fullxfull.531272703_2x41_1.jpg',296,0,1393,1500),(385,'images/products/il_fullxfull.392931312_kkyv_4.jpg',297,0,1191,1106),(386,'images/products/il_fullxfull.392927561_mh6g_2.jpg',297,0,1500,1300),(387,'images/products/il_fullxfull.516596444_5r07_4.jpg',298,0,540,720),(388,'images/products/il_fullxfull.492703714_t977_8.jpg',298,0,1374,1500),(389,'images/products/il_fullxfull.393108386_6ni3_4.jpg',299,0,1500,1226),(390,'images/products/il_fullxfull.396424038_icyx_2.jpg',299,0,540,720),(391,'images/products/il_fullxfull.493717762_i79g_5.jpg',300,0,1500,1472),(392,'images/products/il_fullxfull.493717802_r8h4_3.jpg',300,0,1500,1328),(393,'images/products/il_fullxfull.531251855_dd6c_7.jpg',301,0,1500,1221),(394,'images/products/il_fullxfull.531274259_h8zd_1.jpg',301,0,1500,1341),(395,'images/products/il_fullxfull.492757767_jh49_5.jpg',302,0,1157,1500),(396,'images/products/il_fullxfull.492703714_t977_9.jpg',302,0,1374,1500),(397,'images/products/il_fullxfull.516937211_dqov_4.jpg',303,0,1500,1317),(398,'images/products/il_fullxfull.516937183_mb0m_2.jpg',303,0,1500,1313),(399,'images/products/il_fullxfull.550902768_o7eu_1.jpg',304,0,540,720),(400,'images/products/il_fullxfull.550990751_ab9j_1.jpg',304,0,581,570),(401,'images/products/il_fullxfull.392773499_a5uv_6.jpg',305,0,1500,1358),(402,'images/products/il_fullxfull.392773673_9wh0_3.jpg',305,0,1500,1460),(403,'images/products/il_fullxfull.544874735_j8db_1.jpg',306,0,1500,1001),(404,'images/products/il_fullxfull.503478820_eal7_6.jpg',306,0,1354,1489),(405,'images/products/il_fullxfull.439400869_gs8z_5.jpg',307,0,1500,1125),(406,'images/products/il_fullxfull.392773499_a5uv_7.jpg',307,0,1500,1358),(407,'images/products/il_fullxfull.493692354_5jcm_4.jpg',308,0,1333,1305),(408,'images/products/il_fullxfull.492589400_khlc_2.jpg',308,0,1354,1489),(409,'images/products/il_fullxfull.493747719_kv24_4.jpg',309,0,1313,1489),(410,'images/products/il_fullxfull.492591998_t6b2_2.jpg',309,0,540,720),(411,'images/products/il_fullxfull.493755990_ak1s_5.jpg',310,0,1500,1246),(412,'images/products/il_fullxfull.493811475_c4nf_3.jpg',310,0,1500,1199),(413,'images/products/il_fullxfull.544879459_b5ib_3.jpg',311,0,1492,1500),(414,'images/products/il_fullxfull.544787930_1ggi_3.jpg',311,0,1320,1500),(415,'images/products/il_fullxfull.544871867_5met_1.jpg',312,0,1500,1001),(416,'images/products/il_fullxfull.544870309_g4wt_1.jpg',312,0,1500,1001),(417,'images/products/il_fullxfull.493777129_rkmp_4.jpg',313,0,1500,1110),(418,'images/products/il_fullxfull.493777111_23tb_3.jpg',313,0,1500,939),(419,'images/products/il_fullxfull.516605306_i4mb_4.jpg',314,0,1500,1469),(420,'images/products/il_fullxfull.516681603_n0eh_2.jpg',314,0,1500,1446),(421,'images/products/il_fullxfull.544785186_lziv_1.jpg',315,0,1500,1001),(422,'images/products/il_fullxfull.544875923_h3hv_1.jpg',315,0,1500,1125),(423,'images/products/il_fullxfull.392775113_2o4g_4.jpg',316,0,1500,1460),(424,'images/products/il_fullxfull.392775159_hjqu_2.jpg',316,0,1500,1404),(425,'images/products/il_fullxfull.392898347_m91c_4.jpg',317,0,1487,1500),(426,'images/products/il_fullxfull.392898365_jg8q_2.jpg',317,0,1500,1149),(427,'images/products/il_fullxfull.492594034_oa9r_7.jpg',318,0,1500,1291),(428,'images/products/il_fullxfull.492647025_926t_2.jpg',318,0,1500,1423),(429,'images/products/il_fullxfull.544876643_7f8m_1.jpg',319,0,1500,1157),(430,'images/products/il_fullxfull.532320362_m646_1.jpg',319,0,1500,1236),(431,'images/products/il_fullxfull.392789523_dxco_4.jpg',320,0,1435,1500),(432,'images/products/il_fullxfull.392792902_m87q_2.jpg',320,0,1462,1500),(433,'images/products/il_fullxfull.464599347_pgyq_4.jpg',321,0,540,720),(434,'images/products/il_fullxfull.464599385_rfck_2.jpg',321,0,540,720),(435,'images/products/il_fullxfull.393122972_6a17_4.jpg',322,0,1500,1174),(436,'images/products/il_fullxfull.393122372_prap_2.jpg',322,0,1500,1292),(437,'images/products/il_fullxfull.514637376_4xsm_4.jpg',323,0,540,720),(438,'images/products/il_fullxfull.514637408_64yh_2.jpg',323,0,540,720),(439,'images/products/il_fullxfull.392943213_6d9n_4.jpg',324,0,1500,1000),(440,'images/products/il_fullxfull.392946862_r5pe_2.jpg',324,0,1500,1053),(441,'images/products/il_fullxfull.493755964_puor_5.jpg',325,0,1500,1304),(442,'images/products/il_fullxfull.493811471_8bzi_3.jpg',325,0,1500,1223),(443,'images/products/il_fullxfull.493379707_ksku_4.jpg',326,0,540,720),(444,'images/products/il_fullxfull.493379723_2klw_2.jpg',326,0,540,720),(445,'images/products/il_fullxfull.419046241_hzg7_4.jpg',327,0,540,720),(446,'images/products/il_fullxfull.419037070_rb2f_2.jpg',327,0,540,720),(447,'images/products/il_fullxfull.514648266_mfpd_4.jpg',328,0,540,720),(448,'images/products/il_fullxfull.514712349_fwvp_2.jpg',328,0,540,720),(449,'images/products/il_fullxfull.396424262_m9dk_4.jpg',329,0,540,720),(450,'images/products/il_fullxfull.393109424_mhqq_2.jpg',329,0,1500,1226),(451,'images/products/il_fullxfull.392928770_jz0u_4.jpg',330,0,1500,1172),(452,'images/products/il_fullxfull.392925089_m7at_2.jpg',330,0,1500,1438);
/*!40000 ALTER TABLE `website_productimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_promo`
--

DROP TABLE IF EXISTS `website_promo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website_promo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `percent_off` double DEFAULT NULL,
  `flat_discount` double DEFAULT NULL,
  `available` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_promo`
--

LOCK TABLES `website_promo` WRITE;
/*!40000 ALTER TABLE `website_promo` DISABLE KEYS */;
/*!40000 ALTER TABLE `website_promo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_salestax`
--

DROP TABLE IF EXISTS `website_salestax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website_salestax` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(128) NOT NULL,
  `county` varchar(128) NOT NULL,
  `ltr` decimal(4,2) NOT NULL,
  `gtr` decimal(4,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_salestax`
--

LOCK TABLES `website_salestax` WRITE;
/*!40000 ALTER TABLE `website_salestax` DISABLE KEYS */;
/*!40000 ALTER TABLE `website_salestax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_stockitem`
--

DROP TABLE IF EXISTS `website_stockitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website_stockitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `size` smallint(5) unsigned NOT NULL,
  `stock` int(10) unsigned NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_id` (`product_id`,`size`),
  KEY `website_stockitem_7f1b40ad` (`product_id`),
  CONSTRAINT `product_id_refs_id_9869392e` FOREIGN KEY (`product_id`) REFERENCES `website_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_stockitem`
--

LOCK TABLES `website_stockitem` WRITE;
/*!40000 ALTER TABLE `website_stockitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `website_stockitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_stockitem_colors`
--

DROP TABLE IF EXISTS `website_stockitem_colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website_stockitem_colors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stockitem_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stockitem_id` (`stockitem_id`,`color_id`),
  KEY `website_stockitem_colors_a29067ae` (`stockitem_id`),
  KEY `website_stockitem_colors_b21da6ed` (`color_id`),
  CONSTRAINT `color_id_refs_id_ae3bb0c4` FOREIGN KEY (`color_id`) REFERENCES `website_color` (`id`),
  CONSTRAINT `stockitem_id_refs_id_2d894247` FOREIGN KEY (`stockitem_id`) REFERENCES `website_stockitem` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_stockitem_colors`
--

LOCK TABLES `website_stockitem_colors` WRITE;
/*!40000 ALTER TABLE `website_stockitem_colors` DISABLE KEYS */;
/*!40000 ALTER TABLE `website_stockitem_colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_subcategory`
--

DROP TABLE IF EXISTS `website_subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website_subcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `website_subcategory_6f33f001` (`category_id`),
  CONSTRAINT `category_id_refs_id_0dfb7905` FOREIGN KEY (`category_id`) REFERENCES `website_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_subcategory`
--

LOCK TABLES `website_subcategory` WRITE;
/*!40000 ALTER TABLE `website_subcategory` DISABLE KEYS */;
INSERT INTO `website_subcategory` VALUES (1,'Cocktail Dress',1);
/*!40000 ALTER TABLE `website_subcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_thumbnail`
--

DROP TABLE IF EXISTS `website_thumbnail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website_thumbnail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `website_thumbnail_7f1b40ad` (`product_id`),
  CONSTRAINT `product_id_refs_id_30427b8f` FOREIGN KEY (`product_id`) REFERENCES `website_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_thumbnail`
--

LOCK TABLES `website_thumbnail` WRITE;
/*!40000 ALTER TABLE `website_thumbnail` DISABLE KEYS */;
/*!40000 ALTER TABLE `website_thumbnail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_userprofile`
--

DROP TABLE IF EXISTS `website_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `optin` tinyint(1) NOT NULL,
  `shipping_address` varchar(128) DEFAULT NULL,
  `shipping_city` varchar(64) DEFAULT NULL,
  `shipping_state` varchar(20) DEFAULT NULL,
  `shipping_country` varchar(32) DEFAULT NULL,
  `shipping_postal_code` varchar(16) DEFAULT NULL,
  `shipping_phone` varchar(20) DEFAULT NULL,
  `ref_id` int(11) DEFAULT NULL,
  `ref_key` varchar(6) DEFAULT NULL,
  `promo_code_id` int(11) DEFAULT NULL,
  `referral_count` int(10) unsigned NOT NULL,
  `session` varchar(128),
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `website_userprofile_501d92a0` (`ref_id`),
  KEY `website_userprofile_a42950ba` (`promo_code_id`),
  CONSTRAINT `promo_code_id_refs_id_f714b53e` FOREIGN KEY (`promo_code_id`) REFERENCES `website_promo` (`id`),
  CONSTRAINT `ref_id_refs_id_44af8115` FOREIGN KEY (`ref_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `user_id_refs_id_44af8115` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_userprofile`
--

LOCK TABLES `website_userprofile` WRITE;
/*!40000 ALTER TABLE `website_userprofile` DISABLE KEYS */;
INSERT INTO `website_userprofile` VALUES (2,4,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'6DBKMI',NULL,0,'zo88mlpt55876fw0rf8vfixg29q9prvr'),(3,10,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Z3RY9E',NULL,0,'rz1rytnqrnqwiys29a2to4385ygd360h'),(4,11,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MSHVJ5',NULL,0,'gyb1t4fdb12pjbizp58edq49d1wd35qn'),(5,12,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'5QYBIK',NULL,0,'5gglmcdyfuiyfph6bei47qapt1tmky2s'),(6,13,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TQFC82',NULL,0,'wlaht6swpvcar3p4xfjwi7jfp0mb6mm6'),(7,14,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'T7YZAC',NULL,0,'yk5x8ubjp1ugo9t3x6u86z98ttxyy2bm'),(8,15,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'BYJY1N',NULL,0,'fqxhzh02abqfblx04cata28lre3397c2'),(9,16,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'G268O0',NULL,0,'bz58p179bmob2p7bprn0yht3c1grbwog'),(10,17,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NORWVV',NULL,0,'cra4z43n8ffqg9uwn7dmz30pqjbvlv10');
/*!40000 ALTER TABLE `website_userprofile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-02-16 22:04:33
