-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: events
-- ------------------------------------------------------
-- Server version	5.5.41-0ubuntu0.14.04.1

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
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrator` (
  `id_administrator` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `id_administrator_level` int(11) NOT NULL,
  PRIMARY KEY (`id_administrator`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES (3,'Gustavo Pchek','ghpk88@gmail.com','e10adc3949ba59abbe56e057f20f883e',1);
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrator_level`
--

DROP TABLE IF EXISTS `administrator_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrator_level` (
  `id_administrator_level` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `permissions` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_administrator_level`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator_level`
--

LOCK TABLES `administrator_level` WRITE;
/*!40000 ALTER TABLE `administrator_level` DISABLE KEYS */;
INSERT INTO `administrator_level` VALUES (1,'Administrador Geral','{\"Admin\\\\HomeController\":[\"index\"],\"Admin\\\\LoginController\":[\"index\",\"logout\",\"login\"],\"Admin\\\\EventsTypeController\":[\"_list\",\"_new\",\"_edit\",\"remove\",\"create\",\"update\"],\"Admin\\\\EventsController\":[\"_list\",\"selectionList\",\"_new\",\"_edit\",\"remove\",\"attendance\",\"create\",\"update\",\"checkAttendance\"],\"Admin\\\\NewsController\":[\"_list\",\"_new\",\"_edit\",\"remove\",\"create\",\"update\"],\"Admin\\\\MediaController\":[\"_list\",\"_new\",\"_newMultiple\",\"_edit\",\"remove\",\"createPhotos\",\"createVideo\",\"update\"],\"Admin\\\\EnrollmentController\":[\"_list\",\"remove\",\"_new\",\"show\",\"payment\",\"cancelPayment\"],\"Admin\\\\CertificatesController\":[\"_list\",\"remove\",\"_new\",\"show\",\"enrollments\",\"create\"],\"Admin\\\\AdministratorController\":[\"_list\",\"_new\",\"edit\",\"remove\",\"save\",\"update\"],\"Admin\\\\AdministratorLevelController\":[\"_list\",\"_new\",\"edit\",\"remove\",\"create\",\"update\"],\"Admin\\\\ParticipantController\":[\"_list\",\"_new\",\"edit\",\"remove\",\"save\",\"update\"],\"Admin\\\\CityController\":[\"_list\",\"_new\",\"edit\"],\"Admin\\\\SettingsController\":[\"general\",\"maintenance\",\"theme\",\"banners\",\"email\",\"developer\",\"update\"],\"Admin\\\\PaymentTypeController\":[\"_list\",\"_new\",\"edit\",\"remove\",\"create\",\"update\"],\"Admin\\\\ReportsController\":[\"_new\",\"generate\"],\"Admin\\\\SponsorsController\":[\"_list\",\"_new\",\"edit\",\"remove\",\"create\",\"update\"],\"Admin\\\\MessageController\":[\"_new\",\"_list\"]}'),(2,'Gerente','{\"Admin\\\\HomeController\":[\"index\"],\"Admin\\\\LoginController\":[\"index\",\"logout\",\"login\"],\"Admin\\\\EventsController\":[\"_list\",\"selectionList\",\"_new\",\"edit\",\"remove\",\"attendance\",\"create\",\"update\",\"checkAttendance\"],\"Admin\\\\NewsController\":[\"_list\",\"_new\",\"_edit\",\"remove\",\"create\",\"update\"],\"Admin\\\\MediaController\":[\"_list\",\"_new\",\"_newMultiple\",\"_edit\",\"remove\",\"createPhotos\",\"createVideo\",\"update\"],\"Admin\\\\EnrollmentController\":[\"_list\",\"remove\",\"_new\",\"show\",\"payment\",\"cancelPayment\"],\"Admin\\\\CertificatesController\":[\"_list\",\"remove\",\"_new\",\"show\",\"enrollments\",\"create\"],\"Admin\\\\ParticipantController\":[\"_list\",\"_new\",\"edit\",\"remove\",\"save\",\"update\"],\"Admin\\\\ReportsController\":[\"generate\"],\"Admin\\\\SponsorsController\":[\"_list\",\"_new\",\"edit\",\"remove\",\"create\",\"update\"]}');
/*!40000 ALTER TABLE `administrator_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificate`
--

DROP TABLE IF EXISTS `certificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificate` (
  `id_certificate` int(11) NOT NULL AUTO_INCREMENT,
  `id_enrollment` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  PRIMARY KEY (`id_certificate`),
  KEY `fk_certificate_enrollment1` (`id_enrollment`),
  CONSTRAINT `fk_certificate_enrollment1` FOREIGN KEY (`id_enrollment`) REFERENCES `enrollment` (`id_enrollment`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificate`
--

LOCK TABLES `certificate` WRITE;
/*!40000 ALTER TABLE `certificate` DISABLE KEYS */;
INSERT INTO `certificate` VALUES (5,1,'e-5497486a71aea'),(6,11,'e-55a553ab0e453');
/*!40000 ALTER TABLE `certificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `id_city` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `id_state` int(11) NOT NULL,
  PRIMARY KEY (`id_city`),
  KEY `fk_city_state` (`id_state`),
  CONSTRAINT `fk_city_state` FOREIGN KEY (`id_state`) REFERENCES `state` (`id_state`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Guarapuava',1);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cost_event`
--

DROP TABLE IF EXISTS `cost_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cost_event` (
  `id_cost_event` int(11) NOT NULL AUTO_INCREMENT,
  `id_event` int(11) NOT NULL COMMENT '	',
  `date_max` date NOT NULL,
  `cost` float NOT NULL,
  PRIMARY KEY (`id_cost_event`),
  KEY `fk_cost_event_event` (`id_event`),
  CONSTRAINT `fk_cost_event_event` FOREIGN KEY (`id_event`) REFERENCES `event` (`id_event`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cost_event`
--

LOCK TABLES `cost_event` WRITE;
/*!40000 ALTER TABLE `cost_event` DISABLE KEYS */;
INSERT INTO `cost_event` VALUES (1,11,'2014-08-20',15),(2,11,'2014-09-19',20),(4,13,'2014-09-19',5),(5,14,'2014-09-19',5),(6,18,'2014-09-17',15),(7,18,'2014-09-13',20),(8,18,'2014-09-15',25),(9,18,'2014-09-17',30),(10,18,'2014-09-18',35),(11,18,'2014-09-27',40),(12,19,'2014-12-15',15),(14,23,'2015-03-20',20),(15,24,'2015-03-20',10),(16,25,'2015-03-20',10),(17,26,'2015-03-20',10),(18,28,'2015-05-27',15),(19,29,'2015-06-08',20),(20,29,'2015-06-14',25),(27,30,'2015-07-01',15),(31,32,'2015-06-30',10);
/*!40000 ALTER TABLE `cost_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollment`
--

DROP TABLE IF EXISTS `enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrollment` (
  `id_enrollment` int(11) NOT NULL AUTO_INCREMENT,
  `id_participant` int(11) NOT NULL,
  `id_event` int(11) DEFAULT NULL,
  `date_enrollment` datetime NOT NULL,
  `date_payment` datetime DEFAULT NULL,
  `id_payment_type` int(11) DEFAULT NULL,
  `cost` float NOT NULL,
  `bonus` tinyint(1) NOT NULL,
  `uri_payment` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attendance` tinyint(1) NOT NULL,
  `rating` tinyint(4) DEFAULT '0',
  `id_enrollment_status` int(11) DEFAULT NULL,
  `additional_info` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_enrollment`),
  KEY `fk_enrollment_participant` (`id_participant`),
  KEY `fk_enrollment_event` (`id_event`),
  KEY `fk_enrollment_payment_type` (`id_payment_type`),
  KEY `fk_enrollment_enrollment_status1_idx` (`id_enrollment_status`),
  CONSTRAINT `fk_enrollment_enrollment_status1` FOREIGN KEY (`id_enrollment_status`) REFERENCES `enrollment_status` (`id_enrollment_status`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_enrollment_participant` FOREIGN KEY (`id_participant`) REFERENCES `participant` (`id_participant`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_enrollment_payment_type` FOREIGN KEY (`id_payment_type`) REFERENCES `payment_type` (`id_payment_type`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment`
--

LOCK TABLES `enrollment` WRITE;
/*!40000 ALTER TABLE `enrollment` DISABLE KEYS */;
INSERT INTO `enrollment` VALUES (1,4,19,'2014-12-03 20:20:08','2014-12-03 20:20:30',NULL,15,0,NULL,1,5,2,NULL),(4,6,19,'2014-12-08 15:14:49',NULL,NULL,15,0,NULL,1,3,1,NULL),(5,4,20,'2015-01-08 22:31:36',NULL,NULL,0,0,NULL,0,0,1,NULL),(6,4,23,'2015-02-25 12:46:14',NULL,1,20,0,NULL,0,0,3,NULL),(11,4,25,'2015-03-01 21:13:20',NULL,1,0,1,NULL,0,0,4,NULL),(12,4,29,'2015-06-07 15:53:03',NULL,NULL,20,0,NULL,0,0,1,NULL),(17,4,31,'2015-07-14 02:15:33',NULL,NULL,0,0,NULL,0,0,2,''),(27,4,32,'2015-07-29 08:31:40',NULL,NULL,0,0,NULL,0,0,2,NULL);
/*!40000 ALTER TABLE `enrollment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_rating` AFTER UPDATE ON `enrollment` FOR EACH ROW BEGIN
	IF (NEW.rating <> OLD.rating) THEN
		BEGIN
			DECLARE ratings INT;

			SELECT rating INTO ratings FROM event WHERE id_event = OLD.id_event;

			SET ratings = ratings - OLD.rating + NEW.rating;

			IF (NEW.rating = 0 AND OLD.rating > 0) THEN
				UPDATE event SET rating = ratings, evaluations = evaluations - 1 WHERE id_event = OLD.id_event;
			ELSEIF(NEW.rating > 0 AND OLD.rating = 0) THEN
				UPDATE event SET rating = ratings, evaluations = IFNULL(evaluations, 0) + 1 WHERE id_event = OLD.id_event;
			ELSE
				UPDATE event SET rating = ratings WHERE id_event = OLD.id_event;
			END IF;

		END;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `enrollment_status`
--

DROP TABLE IF EXISTS `enrollment_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrollment_status` (
  `id_enrollment_status` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_enrollment_status`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment_status`
--

LOCK TABLES `enrollment_status` WRITE;
/*!40000 ALTER TABLE `enrollment_status` DISABLE KEYS */;
INSERT INTO `enrollment_status` VALUES (1,'pending','Pendente','A inscrição aguarda pagamento ou autorização. Sua vaga está reservada temporariamente.'),(2,'confirmed','Confirmada','A inscrição foi confirmada. Sua vaga está garantida.'),(3,'cancelled','Cancelada','A inscrição foi cancelada.'),(4,'suspended','Suspensa','A inscrição foi suspensa,. Entre em contato com o organizador do evento. Sua vaga está reservada temporariamente. ');
/*!40000 ALTER TABLE `enrollment_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `id_event` int(11) NOT NULL AUTO_INCREMENT,
  `id_parent_event` int(11) DEFAULT NULL,
  `id_event_type` int(11) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `details` longtext COLLATE utf8_unicode_ci NOT NULL,
  `teacher` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `spaces` int(11) NOT NULL,
  `start_date_enrollment` datetime NOT NULL,
  `end_date_enrollment` datetime NOT NULL,
  `views` int(11) NOT NULL,
  `logo` blob,
  `send_participant_data` tinyint(1) NOT NULL,
  `rating` float DEFAULT '0',
  `evaluations` int(11) DEFAULT '0',
  `free` tinyint(1) NOT NULL DEFAULT '0',
  `no_enrollment` tinyint(1) NOT NULL DEFAULT '0',
  `auto_confirm_enrollment` tinyint(1) NOT NULL DEFAULT '0',
  `base_price` float DEFAULT NULL,
  PRIMARY KEY (`id_event`),
  KEY `fk_event_event` (`id_parent_event`),
  KEY `fk_event_event_type` (`id_event_type`),
  CONSTRAINT `fk_event_event` FOREIGN KEY (`id_parent_event`) REFERENCES `event` (`id_event`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_event_type` FOREIGN KEY (`id_event_type`) REFERENCES `event_type` (`id_event_type`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (11,NULL,1,1,'Semana Acadêmica TSI 2014','semana-academica-tsi-2014','<p>descricao teste 1</p>','ministrante 1','UTFPR - Câmpus Guarapuava','Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR - Brasil','2014-09-22 19:00:00','2014-09-26 22:00:00',150,'2014-07-23 00:00:00','2014-09-19 23:55:00',19,'����\0JFIF\0\0\0d\0d\0\0��\0Ducky\0\0\0\0\0(\0\0��\0Adobe\0d�\0\0\0��\0�\0			\n$$\'\'$$53335;;;;;;;;;;\r\r\r%\Z\Z% ## ((%%((22022;;;;;;;;;;��\0^\"\0��\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0!1AQa��\"2qBR#����b�Cr��3$�Sc���4D�ⓣd%\0\0\0\0\0\0\0!1AQa���\"2q��BRbr3�#����\0\0\0?\0�T!B\0B�� !B\0B�� !B���. ���S^�E�0���~O\0���V����N�[#C�܀�B\0B�� !B\0B \"	\0M\0�J��y�K�w��.rr���K�v /��S��n������8+\0�!\0!@B�\0�!\0!@B�\0�!\0!@H�$���$�cqs�h\0�%\0�{��֌K��)�|��-K�ӛ�3\"�����f�.y�]v{�LV���t0m�U&F�n���m�h��\0��oi�`��R��\Z�����L�E�wYٿ�Vݶ�	|�j����p�6��n����=wYZI#-�X�E�B�o���k��Y<����\0�Vi�8���-���n#����zF�،#�R�����ɣ5d�i�*E�`�!\0!@B��xm�|��K��ƍkF$�Ps�Ɨ<����p\0,��9X��-5�P�`^Ö��.�\0Cj�n��L�l���!9���a�#���HǪ��J���\r*�WZۼ]��P�z\\;�T��s{}}|�I��{���ud #k�x�;K���}�2D�wn��Ъ�5����H�;b�i�<���G�>�9HÃ_���PɰѦv�,<�)��c�=ElB�VM�x���B�}ş�9����L�%�~�qYf�d�!B��\0�!\0!@B�\0�!\0!@B���h�5č�&b缆�zI@J��x������\\��ց�J�k?3�q��b7Ӝ�z\0�=f�������˙���ٌwGZ��W���ӭɃJ��O�I�����Y���\\��.�9�\r��cG�1���-.��{��}�;���2��g�Y�P����~.�\0���.��݌t�=K�����9Z�W\0,��~�ۧK�c����@y&�v��j؏�$��诅�AS�	g2�=��t�Tv�WH^��N%.e; s������6�V�����A֯c��`�l�R�<�_b�ދ�읣��^}�iZ�&o�7V�Xv�ſ�FKda��z\n�4��P��!\0!@G4�A��8��{�Z1$��{�~`�\0{�6��4{wT1�#nݎ����޷1�mSV��Ǧ���6KQ��hŞ���N��FgG�2�R\\�t%(�.rt�s$���y\"K�cS���wt;���q�#֦Ӵ�˺2�Y��{�O��6ڎs<��Rb:��^�C@\r\0�����a���ຏ4�+(���˔]�\\L%V0T�3���I^ڂ88-Ps�\0�Mv\0���O��ٷ�հpѶ���M۔�s�/8^u���D��x�q�Tf��u!�i�<�\0QnDs���摺^�ox\\�-nEiG���ի��s\\�����JCpG��t�6��Iu�5�/2�B*MkGf�Y��SцĨBɠB�� !B\0B���\0���[(]qw3 ��)$pkGYY.}��o�q��I�iC,��֒���C�nbׄ:�2]�c�f��u�eGEUHT��_5mZ�k��:�s�����Ŭ�}75�0k��z���[\0;�`��Vv:u��2Z�#��>�WXIP�g=��eb�[�\Zw����r�	pA@N\0.}B�+W��F3�q�|˩eh����GLFṽ{UI\'\r��RM$ҺYNiK�O������\\*ر��*{x�\Zِzǽ)�GwR�9C��S�)s!]$Θ��b��U�j�ӭ��F4��w��+�5d�+��l�y��_�~�q����f�\'�ym�:c?�^[\\\\*�\n�U���Mi�?�c���\'&hd�EJ��5�i�\\*S�M�\0�!\0�y�?�m��\0�қ�:�q�`ǟ�\0z��ҽAG41�ᕢH�ik��A\naF��x4F��yV�x˨+p;����ʻ_џ�z���.j�7��ma�M��t����X��s\\6W���OF~�<b���vۄ�בqh�ћy��\\��ym%����,x�*�p\0.�{\r�<���k����J�BN�������y����>�5��-i˛ڍر�h�MD��\Z%�����5�<Z֜�\\���h�G-��rj����ѓ��^�и�\nQq�\Z[I��.=-\rvSձ~�MzWl�S���IUS�{Oli6��wBA�*ٰB�� !B\0BU\0,_��� 66%���7�6��]�>�R��\0?��v��ȶ]^f�������>�X.R��K���y�l��#d�.����}}^}�M�I�n?���i$w�r�縚��W�{<\r��ѻ\n�����5�JҴd�s�<Q�4!(V:��f�K=\\%�nr���>�cVy�|�����;`T����T����\Z�ь\\t,}�5�Wud$Z�}Vb��4�.\0��\\���U�������,c��c����4��ɞg�Y�I=I��6�\01�ϲݝ�P�J0������9z6��i�I�X�A��$�Ƶt[�� v�� -��n�o�7�e*�����ʭW<�s.d���~Ϫ��\0�\0OB�\n��,��6탽�a���js�d��7���-p�(Q���|f���5�ӻ����?bЯ6�.��9�$��yR��7�]Ձ^�;a1P�(PB���P���g�is闠�S�ǉ����\r���C��C�����>���>F�v�4�2�oB�7���-����ۄ�⤳�$�*IUK)����\0�>\n7�#\"�<��������j��s����O���o�����������R�$c�P�Ed���?(9R�p���{���-.�ʜ���%��!�V�e3�����odu*ds8�\Z;U\\J� B\0B�� !%PV;���ߖ�͝�lڼ��3kai�I>�����ߖ����lڼͬq�4���`��^a��\rֿx�[V{��/{�{�?~>��ܱ˗\Z�ӵ�d�X�y��\Z�w����Z�FP\0\0`�u֡�i��]J�h�(�\r�b�ڧ�jV=&\n��������`������f�F�|Oy\r��ƭ�#K����}0���[]�ڼ��S�5i�]�%��V��4`��3��\\�/\"�ڷ7k��,��,��\0���e81=k���w��=���L1C���w��\n\\\\jMO��a0G�W\r��v)�=ṣؘФhTȭ\nF��\nV�\0ФkPХcP������)b��H�c4{sOHL���oL}X�����Q��Gr͏�78`B�hX�R����e!�w�]���͡e�LP�CB{B�3\\�A�����Od�OQW���q�[�Y�)��@�u��=�w0Io(�r��à�F�w\'/s)��4���&\'Gv�\0��\\�2g��%R��!%�\0��TN�k�.� 8�`�nM���uykg��V���h:�oQ�a�6�N���xf�e��6���L��1���\0��T}��gg�#RNi�h��(��\'!B\0B���\0���|��Smj[6�3kGO�I�\r���ϖܳjm��fզo���#�$���7wwW�R]�H�&qt�8ԒP����^ɨ�.�9���Y�q�8%Y������}2&�۴ea\0�)��<�i������C ����.�تL�.����9��)I�\')�����vs�ڥ�;v\'\0���G0�c����#B��RB�� \n��G�/(`���\01�����܅��NJ�\'B�2��S�ܱ9Z�,q��\rcK�v�����[޼���̏פ�W֖֍�M��=gj�j9ՋxZN���[=��u��6���fl�oP���vq��}g˺u��������~�`\np+�{�joa�������z6�^\'�X��{M��&������֫�ձ��eջ�~�6�t�GD�G0��.�+��ָ$�v���c9����$�3�{F���Qq��R��STP���)�+����+�Ak��1Ҵ]E����|g�+x=�/�y��&	�6�}\n�uo��~SH.��v	���Q��ФhLj��d��|��O����+�p>v�M	��p�Y�i8�s����G��5S��5���4R=ո���ƭ���}��>d�N�p�y���V�����Nε���!<B�A\\���e��K}} ��!Rv�Nƴoq;�څ��n�ٛ\r�/y�v���,��8�\\՚TLG���bb���U6�/.��e���,�p�N�=i�6�ð,��7�^�&#4u��MV3�x��Doq}r��>��W����SR:�q�����y$���1�c�GI5���s+�ơ�ǡ�[i7Q�Ks8�q��+��ٓc`����f#�?��v��H j ��d,�����C��g/ܿɓO��=��T�tG�هR�4�t$	T(!@BB�O�y�ۖ�~ޓ�ӷ�A�0ԓ��޵R�O�HZC	��`�w�7\\��������S晜A��3H��F�eԷW�R^_�e��٤{�\\IJƱ�N��2�Nhvn��BA]��$	�T�m;����cc˺���Ɍ���{�h,yN�\Z:�θ;%x��5�%>)}0�>��kC����~�`������7J㹠�{e�w�Q�o7����i�#�����h����s�Ҫ�mo~)w�\\��q����8��-2΅�y����ٱX�	���7nܺ��JS{��{cnT�TWA )^*3�;��0�l;a=�5�@S�L �Х2�[�Y�t���Jp�U�)Hik�Z�B:�I������y���G���vۃۗC3/�(Xd���ʫ�לj�F��vޠ������Qt�������c5�J*�9䶅�W��~���X�U>�pe��N�����\r|��J猜I>�z�A�6�\n��21����p\"�����J�u�$��&�9\Z*=�e��\'�h�X�Xj�\\s�������7X�Y�uo\0��\r��{��\\դ��|��\\ђSG��K^��\\O��R�~`kj-��}��;���o.p�C��7�(\\�U�*c�&]Y�z����ׇ���֭��2����I\"�Y4rj����e-���xE\\��kF�w�\\�������P\r���\'�`x�c�\0U���z�<��M�����mMh��P��e0�^+ib�v�[�襉Ů��s4д�zݸ9�Ef��3��\\�Kq�=��l�}������`V�:����4����v��8m��`i���e��k�F������S�[�L��#��l�aH��p���f��3�j�ҭٙ�e��U�ϣ��~�fu��#2[�~�5zh+i�p��[Q���&�8ݗ��v=�f��5Ayfm&?�ZPc��|\'�b��/�t�R��9At��1�Y)�=��k��]Q���;I�}�Z=h�~Ū����0�K��� �e ;���.kGd�ĨB��B�� ��\09�2�n�ї�����.�]�]�hR >h��������3�8�Xݴ8mMz�̮L��nu�>:�۷��ь�7�&����B�BРԘ�d�(���0w�$�+Se�i�@|<-��;���/���q#d����{ms���9Z~��\\>o��ήrvg�X$�:fv�_��\n(%z��kz�8)����gM���\np*3-()���e��0�T�����z[�&��h��\\�v7�o#8,�I!�\ZJ�8#n$f=*p�۸/�,}N��J���g����{�����P^Ʒ����W�����ߣlԌ�6��D�:lk�v.�+���ʮ�G/[m�����e-Wn�.p�G�$�2w<l�\\JA\Z�>��<Gq�$�8-���|u�s��\r\'M��3��2�mva��}��CԾ��q�2Q�����!�*)ݒ촞��=��MI�,.]�\'�-P^\\��Mo�\0*�\n��|���ͦ��`(.^ؤ�D�,�B�?1y?�״�U��m��7�\0����o���GP�����]�ՄR�}���_�Z��|��cNC��ˎş��e���Zv4z�R4o�ռ�k4�\r�/��4v�Q��Ws&ic�s2��ahT��k\0.ph�Mҙ\'1�6�It�Fֲ�?�U����I{]o�rR�FM���{U�:F��Xޏ�F�ސ��\\]j�6�% Ep�%�83��G\Z�N���|ǥ�v�Hf�Վg\0�C�k���w�\\�6�29͂R� i-˕�Ҙž���$�����erV����k]��{�T�R���*�� !��O�<�����Z{)c;�����q�S��W�(nmຂKk�	!���1�H�\n�@|����T�M�J���_U�ף����Zn\\��\"�����������JХ�P�nV�.��V����r�\0�=�U/�F9ϼ`�N;�=_HW�_����b��fOz���ؽ���m�n{���\n`)A^v��<�SJ\n�Z�\n��C-0�7����s�(����z7�C���|g��\'(C����L���.\rwL�V�d�u�8}Yϸ�����n넔����Jڒi�� ���GE#K^�Z����BUjy�G��n�\0�JC.i�����N���{�j7#�5��G\Z�nn/g�v�L�!�C�I��Uݩ�5ѽѻ4�B᪰{�&ٷd�����}O���G�,|���mF�%������iN�\0v���5i����g�(�÷�j��4�\Z,�i�d,\r<A5B\\���٧�y��{B�M�͖������W�,�3H�,���T�6����W��m�\ZY#���?,���R��҈u�j�t�\Zʴ���a�^�!+�g�6+Ӫm>�4��I��̭�N�Ӝڦ�uĶ6�c�f0�,~P�7s�^;x.��F��h���l\n�ޗb�ux�P��H�Ò�B�)�� �ݏ��c�d̯!�[�66�,��*�f��0]�9��)ڕD�T�\0�B�\0�!\0!@V������at0v1H<Lx�/����&�[��C��>4�+���nTf�c���5`Lٝ�LN=;�U��\Z<~\'9�a-sMAA[�_���8�J�$h��t�1�7�7���%�i��0 �+���KI�+1�o�8/6�F����q��{�V�X��1�r�k��5���h扲�j�\n�%W�%�TiѦ~�5$�uMU5�x)AL-V(\Z$�sj�\0�pQ�K�C��0`	C�uKU��j|�J��89U#.$������JfxB���Ymg������K��9���l�������\\=!z�e��m#��}����mt�v��*�zw}9?�=����[��\Z^(LFe�er�f��� �(�\'R�̗2��,\'����ݎS��7c&�������Xen^��iث���W�m��ʡ̀���n~ji�-�w�����ג|�nnc��ū����^��,ʁB��P�ih)���T�\r����Q�t�8�s˚s�m��?�6zM[Q��N��Z[�f�\n��4��.�\r8+FFѳ���M\n���4o��Ľ��ˍIi�bx|�*\0��B\0B�� !B��ar�p�r������7����z�\0н��9�Pp �^S�|�tkϊ�o�\0_p����a���̑S�^�i<��r�A��YF�i������}&sI��n��\\�k��N�+�.����r�m��<�}?Oqp\np)��p�v��\0o�z�-�����X��cꖩ�J\n�P��j��Z�BP}R�2��P�$̐���­\"����T�8�Ĕ<Ә����O���y}��W�Ufe����zs���]�߀f���\n��^~�Y˵����jq�ʪ�_w����wZ�N/M�U�ѷ��mnǷ�Nк�#KF���7qiث3.�i��c��\Z�.�z��ڽ��vo>P�6�~�\0fݣ�?��/.�8��j����z�̳*!\n\0H���`��4;A<��q)�ih��M&淣�܀~��Yi����wd���f�Gm!���p-w�\Z֤Ks�\0o�?�	�1�]ߺD��c��I��-��\'� ��T{[-�[Ěf*���/����,!q¤>_��I�K��M.����R^���N.�%U鮕���sOrj}�*��~w��C��9�{UƗx�g�4�8����jѓi$�d7Q\n�׼�=f��Ű�X剒�s1�i��*qѶF��ڴ� ��S��d8�{�j����a�E��� !B\0B�� �cmi%��s�0����J+�z\\��u,WU10g�_m�:w���y.��b�sfi�6Sо��V��m!�r.�:��ofA��a_=�X�X^Mew��Hø�[��\"TuF����j��Π���3�Z�y���M�]��R���i�ҽ\"���#���AQ�����a��g��sˡ�?G���������[�у@�>��TN{X3=����i\\7<â�TKv��kXs�ƯmNn����UOD�*�J?��iT����>i��[�,�l&�i��U�>�o���(�M^��A�/L9f�\'\n�7O�<�5�h��_���E=女K�&� 6�p�[����L�kZr��W��y��\\N�j~���$�\0eԺ\"���,��~Km�N��]s��oP\'38n������������e�3��,�ֱEW��(��̥s�}�<��7�P�Wy���zz���v�ѴW��*��U�n�772�]��4�ع(�4��$��v��m�-�=**�g�w�O�9K��Q.eae����\0G��J=���phl~Q��tpٴ�Y��X��>f?2|S:)#\r�^�c�D`�GT=,���|�����K���2�-���?�ǐ}\n�\'�7T���{�\r��ķ�zR��4m/I��鶱�F�W�!J��Oڣ\0�!S̜�a˺s�ob{�@�3���m~��xn��Z���K���� ,dq��/���q��+�9��,��K����ⷚ���:8�Ҵ�}7]�K׭Ǟ�daq9�\Zl-x�Vn\\�������e�x��U\Z�W�W�i����g����a��?z��|�3����Co�y�n8vUi`��8����\0���r�櫞�%X�J�w�����=��B>f����i���:��s���y�M�b�j6�iR�\r˻����4�!n����N$�nt��{��p_yf�6�=�oVМ�Yyj�7;w����Զ<O���\n���!9#Y��?O��� s��ݻ���U��`�Ӯ��:vN�iF�)�G7��^_������{��8X|M[)���G|F������\n�~���zXJ�,\Z!B\0B�� !\"P���V�w$\rj���{+�ڷ�ƌf����7wb��%P,�A��յ(��5!�z�����gs�����ؚ0�G~�ˎ�y�6��?˂7��iq�mT�c%I%%��X�Qu�q{Ӡ�]�N���|��.q?Z�_��\'6�PæL֟ZQ��\0�B��Ns���[Z���`�$��T\r���L\rJ��|��#���\'��lMlC�����ˮL��n���=k�:J��_�T���7����^�\'�+{M��m2���sl�W�6�Zu�2Y��nѱ�F֏����@x����j�����m��~s�r�X���m�jrIŐ03��/�\0uzG�8��@f,~V�e��t��\\H�W�ZZߡh,�M\Z��l�m���q��PS��|���E�%΀�(󄹂D&fKT��T�@)Ϝ��r�^Z0\rNվ���c=>�ա圻����������;F���M7��m.3�<n�h�p�h7YA��6���wQ��l�:�xz8/�s~^�Kֶ��o�˹�-�8�K��h�ݕ��q]-��\0���]����������ʢ��v����\r�+�gO����S��h�����4�A�\ZI���:���`�\r{���9Z��k�=��݉b<k�ޢ��W��o���L�c��YA�h��Y���cf�ewu���<�[�/t�eq�пa���\0��j#�r+��w<}�7��fB@�}���\0�!\0!@	�@IT����JK�K��q(��M♍�)W��9�h �TP�kj��1�����0v6�\\�s�WLx��yQ9�RF~��p8�\'H��r�܎)>(qUn��Dn^������GL.�l�(qp��*��9L׹`&O���Z�;��땤�\ZJ�989BҞ��j�	�\0�MJP\r����G#C�x-{*Nx�/��<�5)�e���L���	k���k6�CN��.I�&�&��,�����Ӹ؛��ү�/��ha�!{��03���f���\\��6\'hJ���\0	v�&\r�cCGcW@��SB��3�m�B����P��BP�*\0B�� !���E!4�%Q		��rԅ�W11�]e��4�Q�`b	� �+]L6�\n��		RP�6�	��pWBC\n�\0\rМ �VЏ��J����)\n�	��9����\nx�\ns�5#X�J�#\rN\rR�����%�Z 	h�\0�	�6�� #0��I���BB�`DtS������-��J�� !B\0B�!�!�!\0�\'u@ԝ�!\0w�B	�K�Bq/u@ԨBpFBpB�T!B\0B�� !B\0B���',0,0,0,0,0,0,NULL),(13,11,2,1,'Minicurso sobre Linux','minicurso-sobre-linux','<p>Minicurso sobre Linux</p>','ministrante 01','UTFPR - Câmpus Guarapuava','Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR - Brasil','2014-09-23 19:00:00','2014-09-23 21:00:00',25,'2014-07-23 00:00:00','2014-09-19 23:55:00',8,NULL,0,0,0,0,0,0,NULL),(14,NULL,3,1,'Palestra: O Mercado de Trabalho e o Profissional de TI','palestra-o-mercado-de-trabalho-e-o-profissional-de-ti','<p>palestra 1</p>','ministrante 01','UTFPR - Câmpus Guarapuava','Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR - Brasil','2014-09-24 19:00:00','2014-09-24 21:00:00',100,'2014-07-23 00:00:00','2014-09-19 23:55:00',8,NULL,0,0,0,0,0,0,NULL),(15,NULL,6,1,'III Mostra de Talentos UTFPR Guarapuava','iii-mostra-de-talentos-utfpr-guarapuava','<p>OBS.: Inscri&ccedil;&atilde;o necess&aacute;ria apenas para quem ser apresentar&aacute;.<br /><br />Enviar um e-mail para <a href=\"mailto:gadir-gp@utfpr.edu.br\">gadir-gp@utfpr.edu.br</a> com os seguintes dados:</p>\r\n<ul>\r\n<li>C&oacute;digo da inscri&ccedil;&atilde;o (gerado ap&oacute;s a finaliza&ccedil;&atilde;o)</li>\r\n<li>Nome completo e turma dos integrantes</li>\r\n<li>Nome da m&uacute;sica/apresenta&ccedil;&atilde;o</li>\r\n<li>Tempo aproximado da apresenta&ccedil;&atilde;o</li>\r\n</ul>\r\n<p>Ap&oacute;s a an&aacute;lise da equipe organizadora sua inscri&ccedil;&atilde;o ser&aacute; confirmada ou cancelada.</p>','nenhum','UTFPR - Câmpus Guarapuava','Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR - Brasil','2014-04-14 19:00:00','2014-04-14 22:00:00',15,'2014-04-01 00:00:00','2014-04-12 23:55:00',20,NULL,0,0,0,0,0,0,NULL),(16,NULL,6,1,'Lançamento do site de eventos da UTFPR Guarapuava','','<p>aaa</p>','nenhum','UTFPR - Câmpus Guarapuava - Avenida Professora Laura Pacheco Bastos, 800 - Bairr','','2014-07-23 19:25:00','2014-07-23 22:30:00',50,'2014-07-23 18:00:00','2014-07-23 18:01:00',3,NULL,0,0,0,0,0,0,NULL),(17,NULL,6,1,'Inauguração do Campus Guarapuava','inauguracao-do-campus-guarapuava','<p>aaa</p>','Nenhum','UTFPR - Câmpus Guarapuava','Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR - Brasil','2014-05-23 10:00:00','2014-05-23 11:30:00',80,'2014-05-23 10:00:00','2014-05-23 10:01:00',2,NULL,0,0,0,0,0,0,NULL),(18,NULL,6,1,'Churrasco da Semana Acadêmica de TSI','churrasco-da-semana-academica-de-tsi','<p>churrasco tsi</p>','Ministrante 1','Acre/Unicentro','R. Francisco de Assis, 304 - Boqueirão, Guarapuava - PR','2014-09-26 19:00:00','2014-09-26 23:00:00',150,'2014-07-23 00:00:00','2014-09-19 23:55:00',26,NULL,0,0,0,0,0,0,NULL),(19,NULL,6,1,'Palestra teste 3','palestra-teste-3','<p><span style=\"color: #000080;\"><strong>Palestra teste 2</strong></span></p>\r\n<p>&nbsp;</p>\r\n<p>Conte&uacute;do:</p>\r\n<ul>\r\n<li>Conte&uacute;do 1</li>\r\n<li>Conte&uacute;do 2</li>\r\n<li>Conte&uacute;do 3</li>\r\n</ul>','Palestrante 02','UTFPR - Campus Guarapuava','Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR - Brasil','2014-12-07 14:00:00','2014-12-07 17:00:00',49,'2014-12-07 00:00:00','2014-12-07 10:00:00',215,'����\0JFIF\0\0\0\0\0\0��\0C\0\n	\n\r\r\r\r\Z��\0C\r��\0\0��\"\0��\0\0\0\0\0\0\0\0\0\0\0	\n��\0�\0\0\0}\0!1AQa\"q2���#B��R��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������\0\0\0\0\0\0\0\0	\n��\0�\0\0w\0!1AQaq\"2�B����	#3R�br�\n$4�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������\0\0\0?\0�[�\0��S�\0����cU\Z���\0�ϩ�\0����1��fl*����֟�o�L���_�\r��Y~����O��\0&}�������L�^��*�(��7���\0�8�����S{�xo��\0&q��\0�m���:Lks����֊�P��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(����\0�R_���\0���|��\n�\0ɩ/��n�\0�J�^�ld�\n(����(��(��(��(��(��(��(��]o�F}O����\0эTj���\0#>��\0_s�ƪ5�����ֿZe��3�\0�-�6��e���_�?������?���S�3=z�(�3\n(��\n����L���\0���Lu�Uῶ��ǋ�\0ݶ�\0Ҙ�1��ʓ֊Z*\rM?\r�+�x�GОv�u�{#2���U�p�8����\0��\Z/�]S�\0Q�u����,>�\0�����_�c��T�v>*�\0�xh��UuO�E�\0���\0�����*��\0�����dO3?0?h�ٚ��O�4]b����j7�jc�� ��~�U�}+�j��\0���/�����\0��?j^�zz�O�|Z�٤�\n�V�J��\'syBVO.&��$���k���?co�<�\n�\0���%����_��\r�����\0�����?��\Z/�]S�\0Q�u��/�m/l���І���\\�=+����?�)w�\0M~o�x���1�05(JN�5�\'���$���\Z�i\\��w���\0EWT�\0�T_�]��\r�����\0��������c����������R������/��\Z_z:?�ʿ��}ǈ�\0ü4_�*���\n��\0���\0�xh��UuO�E�\0�׷mk���\0����c�������\0�\0@����������\0�xh��UuO�E�\0���\0�����*��\0��n���?�)w�\0M�Z��.�\0���\"�������\0W*�\0���#�\0�����*��\0�����\0�U�?�U�\0^�����R����?����\n]�\0��G�E��K�A��U�\0���<G���\0�U�?�U�\0G�;�E�\0����/�.���kX�\0�����4mk���\0������/��ރ�\\��\0?�t?~�|�\\<k�O�F/%��T�,-�1��RG�^�\\�\0�.\'��Ks4��dq��\'�t��W��a������T������):5eM���(���1\n(��\n(��\n(��\n(��\n(��\n(��\n(��?u���?����\0F5Q��������}��\0�\Z��f¯�Z�i���\0�ϼ�\0`��\0�ڿ%�~����g�\0�\0�Z�\0�mN$���(���(��\0+�l�3��\0�m�\0�1׹W����g/�\0v��\0Jc�Ʒ?*OZ(=h�5:O���X|#�\0a��)��h�Oƿ>�a����,?��:��?\Z��1h������K��\0ai�A�����\0���/�����\0��?j��+�?co�<�\n�\0���%�����6�\0����q��\0�Y)\r�~��D�\0�����\0�W]��O��\0��\0�o��qU������X�\0�1>�&�\0s����QEih�5ƹ|����*y�ɜc v����0������ǚr�.�R�i��n��W_�\0\n�V�\0��?Ϳ�W����Y�m����6}�\0@��?������\0��rW_�\0\n�V�\0��?Ϳ�W����Y�m��������\00����\0��rW_�\0\n�V�\0��?Ϳ�W����Y�m��������\00����\0��rW_�\0\n�V�\0��?Ϳ�W����Y�m��������\00����\0��t~�\0�>?���\0κJ���>��-�Ĉ��)�r}�Z���k\rW\r�a�V��E5٤|6:q�����aEW�r�Q@Q@Q@Q@Q@Q@Q@��������}��\0�\Z���o�F}O����\0эTk3aW~����g�\0�\0�Z�\0�m_����ֿZe��3�\0�-�6�fz�QVfQE\0ῶ��ǋ�\0ݶ�\0Ҙ�ܫ�l�3��\0�m�\0�1�c[��\'��T\Z�\'���,>�\0�����_�c��_��?��G�Ö�S~ю��TH��QEQ�?�P��%��\0���� ���~��B?��?����\0�_��sH������g������^^����xW����\0�,���?C�\"����s�+����\'���7�b���W��JO����y�����l+��{�\0#$�\0���%�J�߇��2O�\0^��\0BZ������2�_�J���?���K�3�?�{��Z����cop\r���ɹ�\'�(���_���\0�\0����.��\0�Uۃ�N����V�W�U�b���J�ӟ���\0�\0����.��\0�Q�\0\r���|�!�\0����|�E����7��\0�������\0���w�o�\0�?�_�=_1�E���s������C�\0��\0��?��7�\0ϟ�?�]/�\0����d~�~��G�g�=��<S�j2^�[�����lo��K1�=��G�3�?	�/��!-�Z����u��>�#��s\\��=�\0&�c�\0a;��T�\0n��5d�\0�ݧ򒫡O��\0�~<�\0��\0��\0�V?��?�~<�\0��\0��\0�V?���ƴ�o���SK��SW�*i��\\�jN`�p	�&�����\0\r���?��\0��\0���*������-7���m0�\0Ix��g�$��~.���\0�uB���/�\"iu/	��h���Ӧ�ŔQvG�zg���b�A���	�	�c�{v?���ʾ��C�e�=���[���xK\\��p��K[�=&�OEp3�k�+�qG�bqG�E|��[~�?���úO��tح���ngv�b]e\n0r01I�|x���>\Zx��5��͗��)V\'��J��*ø&���\n�\0%k�����\0G���%-l�3������\0��\0c�\0��������\0��\0c�\0���ksJ�_���<_�~��;B�Ŏ�4�F�R2=3P]��_��?��\0��\0�+�U*��_Aɾ��{0�u�?�%�;�w�	n��!�i�u�y���Ѯ��z�������@o��	_��\r�����ҽO���P�P�����4�������q��l���k�=GK�4{߱��m�q��7�</��XU(�T~�xw�z�|5k�\rj����v�ຶ}���Ѓ�<\Zԯ���3�m��������W_�Kk�do��v!c�_Np��\'��C�N�mX�E��\0�g��\0��o��F�k�3���7��j�Pj*����֟�o�L���_�\r��Y~����/�*������<�~�+��N$��*(���(��\0+�l�3��\0�m�\0�1׹W�~��?�Ǌwy�g�&�*Lks������T\Z�\'���,>�\0�����_�c��_��?��G�Ö�S~ю��TH��QEQ�?�P��%��\0���� ���~��B?��?����\0�_��sH������g������^^����xW����\0�,���?C�\"����s�+����\'���7�b���W��JO����y�����l+��{�\0#$�\0���%�J�߇��2O�\0^��\0BZ������2�_�J�������������\0������ۃ�N����V�W�U�`π[v�\Z�=�O�>�]𯀵�_L����ѳ)��GB�\"�P?b_�4\r��������pn����ο�x��\0��\0��������\0�:�\0�U��E>Ry��O�g_���J<O�\0���\0�Q�\0�����G��\0����{��P�<\'�D�|�3��~+�/4}I5�\Z���V�*p	����\0n��5d�\0�ݧ򒾚��n��5d�\0�ݧ�ؕ���_c�\0�=����2��\0GI_W��\0�O_�)>7�\0�e�����ni-��}h�U�.~�����Y��V�����};�:D{$������I\0�PY_�FA�͠A\0��y�b�6��M����\rkU�Rҧ���$C\Z �f��V5S�\08���OV��<A?��j�_�!E�Q[��Ld���l�\0���\0�Y�n�?�����)u�O�vp����V�Y��M}	�\0�\0�������\0��`�|}_������m����?�!_�U�m�\rɦ��\0�Z��\0BGp���X�я�U�����>�����x�H���T\"9YG�nǤ�?T`pr=9���iᛟ�F�|#y �}&�k&�o���l�{�����i��w�k�YXZD��\\��R$Q���+��O�\"�����8u]N{��������v���p9b̊]	�*Gb:W�\'ýbo�#�r���mnec��%-��_�����g�C�FIc��5�O�M_\r�/���P%���kI\0��D�ߨ4D&~6x���Ƶj�\r�q�+�YU�46���3�$�QSX�h��J|����ʒ�W���E����%��A�I��vN3�̞j�\0㲊�ï��`/ç���_�f\n5H�Q�V=e�m�G�B��\0\0>����c��(���(��\0+����\\�O��m4�0	�Mf�z�j��\n��_Q��W����uߌ\ZG��gC��V��i�3����j��ߵ\'���eQPju���㏃-�e�^��\\!?����ҿ$�f=M���=�&���H�l1����[Fp3֪$LZ(�����(G���\0�\0�Z_�k���@���K��\0ai�A��ڇ��v\n�����O3¿����\0Id��x�����<+�\0\\o��JC{��\0?��������Wk��?�?��\01\\U+���\0%\'�?�LO�ɿ����\06��=�\0����?��%]o���\'�\0�s�\0�-s�?��p���y���OC��ۃ�N����V�W�U�o���\0\'kw�\0`�?���*��g�-��Pb_�4\r����������Pb_�4\r��������qOc�z(���(��\0+�_۷�MY?�7i������_۷�MY?�7i����\Z��ѯo���:�_�Q�꺦�{���i\r�%�����wu��ҼB��V�}��^�5�}�!�\0\nϿ�\0��i�]3�m�I����DUϸXɯ��h$���vO*=S�\'��ߍz�_�O\r��l��{�#lc{̏��=2pMy],@�(��8	�O�+�>��_~%�����q�_�\ZK�F\"�J����f\'�6�С�u�\0���+�|d��%�\r\'�Ѵp����E�z�B�}%j�\0�B?�x7�����_r����s�K�R�Zi�I�9y��;����|5�\0�\0�������\0��U��N����g���#�c��¾�lmtř�sXG3os�;�g�y5w��#�[Ǟ_�C�:���4����\n]Na�>�%3��\0�h,�˥�\0��&��hi�j���x��l��kμO�⟃,\Z��?�A�Z\'߹�ԼK�tܣ�5�ӻ#���_�?m>��?jz����\0c,\"���Lh�=����1a��*���7�@�&}��Kf�~G�1�)#Ԍ�\r~��&��>	Zi�*������&��iX�;0�>���z��6�࿲��\0�x���?�I������ů��\Z�ʜ�@zƌ�H\n3�?I*+kkk+8�--ⷂ%	Q DE\0\0��*Z��f��Ο����h�\0\Z����E��d ���� �y��S��5�m~�|�Q��:���F��x���~w(�Oe`Jf�j���t��\'W���;Il�meh.-�]��p���R�qz�[�$�<�-3�\ZѶ��ۅ������Ԍ�;�k&�E�_�6�[�G�\"մ���`E]KIg����(���ЏB�N�į��^� �|5�^�:��wVr��}FGP{��k�	���kH�|M�h~$�nHk9�{���\0JD8�?G���O�=�ρ����u��\0Ef����5�9-<7��G}�k��>�\'��Ӻ+>������_<\r-����x��6\Zf���	V%<��M~P�ZΧ�/�������7������G9c�\0��0)u�oX��q�k��ާ�ܶ���2�!�c��\n�R��J�ED�u_���@�줽ԯ�[{kh�ZGc�?�=�\'�!�]~���Ǟ#��s�>�l4�W#�4�<�}T�����>|3��I�cH�]�$�!���>�r���\0L�?�U���7vQE1�\0�B?��?����\0�_����\0�\0�_��\0�K�\0�\r~~�=�#�W�~���y��\0�7��K%x={��m�\0\'��_��{�\0��R�����\0����\0��*�_����\0a�\0\\�����_��(1>��\0�b}�M��O�����������\0׹�\0Ж�*�~�\0��?�{��	k���\0�{��\0����*z���v��\n��\0�Z�r��n�;[��Y�\0�-_9W��>l����\0ɠh�\0��}�\0�\r_������\0ɠh�\0��}�\0�\rN;�{C�EfaEP_2�ݿ�j��\0a�O�%}5_2�ݿ�j��\0a�O�%\'����}Q����8���<a�/\\��O���u�D�W�=	\0¾W���\0����R|o�\0`�_�%J��[\\�\0�?|�\0�W�?���b��o��W��\n!��̈�\01^�EY��]+��Хh�Ѵ�\Z��(H�UA��(��>?��V��\0`y�\0�x��z���\0���Z�o����\0��ب�|}_�����M�����\0Ѕ~eW��5�\0&�o�\0ak��T�r�����4R\"�0*�� ��_�����k૖���M4A�\\�T��\\%��x�\0��98#�����ZƑ���\r括YE{a{[�[�2�#2��5M\\��~\"W�~Ο�.��[�Q��M=��e�\Z~Ky9������\Z����{P�/�v�Ò��i\0�i7��\0-�����\0}�߁�!^_Q�������Xk:5�����wew��G)\"0ʰ>�\Z�_\r~��f�3�K�\0k�Y[�夶�n����_rէs6����C�+��4K��\r���O��V!#�FOE�`�����	��Cմ�SA��t}oN�ӵW1�iu�H�ve<��T���o�/��\0����?�H�aԭϓu��H�\0e������`/XI-�������V�V_�N=��\n7ԅ�h�$|qEz��?f�~\Z��P�i�Ή�]:1x��b,J��\'�1�j^���uFG洊��EO����7Y���+J��-�&��]r��Ao��!?��5����>:��T[��Ų?��Ԃ٠���ҽ����u,W�ak���5���iH�2�\n���֝�t|��h\Z׉�Ck�xwK���+��\r��e���t���H�\0f?ق����o�~�{�+����u�3�Nz3����_\r�|=�O��xz)$P����ۛ���+rG�����\"�QE2B�(����K��\0ai�A����9���x��߁|9��M������u��-¡�� �^{Wȿ��ߴ\'�\n�_� �\0\Z���^��W�~���y��\0�7��K%O�\0]�BЭ��\0���V���f_�_�iM��,�l-t�8�i��b�����S��0��mY|D�\0�����\0�W^��-S�����cFK��$z�5�\0W���?���\0�7q��x��Z�\Zr�j�E����#��e\nxHFsI��wg=]o���\'�\0�s�\0�-S�\0�+�?����ƺ�{U�u�n/��8���\r�A���8?�sL6s��[\r8�KV��Zuv+2��煜c4�]����p����\0�*��\0Aj�ʾ���?g/���\0hK��;ö��[�[��I$��6����\0�2����N��\0����\0_���Տ��ؗ�MG�\0����(j�������\0�:��\0��\0�U}��0x�\r�gM70���U���Y!�u�y���RG �#���=��(� (��\0+�_۷�MY?�7i�����Ŀj��*���!|/��kk�Hjv�[.g����=�a�&5��I_c�\0�=��������:J���bo�����\0�m�Wѿ�\'�_��<g�}K���j0A��Y�d����0�H�5c�Z(���(��\0+���\n�\0%k�����\0G�����k��_>/x�\0Ú��l4��k:[y���`!�P�\0z�w��*;���m�\rɦ��\0�Z��\0B��17���h�5��+��{�ϊ>��¾/���R]B�ॼ�e��\n�ÿ���=��(� �_��՟Ə�:*,Q�Y��.��.p>��8�O�{W�����隕�������ʻ^)ᕇ� ������\0jO�K\\����o�4���ҼV�iq:۬���I�k�S�R�Qg��V��h�垳���ge2\\[�Dp�H�*��E~�����|d�;a�qjQ�\0�j���\\��?��2�c_�|}�\0�6��\0�X�\0½��l�#�A��������I�IE��o����W����Ғ*Vg��^%�������ޟt�d��uqk\"��Ƀ�9 ���x��w1��o�\ZU��\r-��2/����������=坍��ows��-BYQ�)Dkn�C��x��v����\0�O�t}I��Vk\rR�O�N7��{ʹ>���X���Ş�������os�ڋ��e�E{{s�K \'*����7I��u�M���z^�v���5���H��1�T�`A\r���:w�/>\"���cN�N�-�\Z�7W��6�7��\"J�$���⺘�o��?>6]�}��5�H��O����ޤ2��E�c�G�/�4��jx�A��Ν-�|����4�\"I��\0�$U􏊟����?�\ZԦ���;MJ)Z8���������4�7�u#�h�6���_�~9��g�Η��ȚI�Rq�, \\�1�r���x���>�M�C�\0��C?�a�nK��*��w�s�P(��z���w�V��çi<)yy3��\rZ�F=�l�}]�?�_\0�*�����2��9�Fa�P���g\n�8�~������_�������~\n�|I�X�~ $M5�N�oB�<�_�W������\Z��+�\rw�ƣ�_��閖z�\0�|an�Kx�<#A1P�� �\'$�0\\v>���>�m&9��1Xm�hk��\0M;wby����ċ���ɵ���#�T�����\0j�$�\nmݝ������k����x[����&��?�����D����rK&������	|9��\0cϊ���tMI�ֵ�K��c�T�Y�|c����c�[W���W��];O�M��]J\"�%�f�EW������Eƹ�E�E�Ԟ�E��q��3�i��5�w�|qs�~̿�x�=j���{]S�Q�Z�sv�u�-c��|�\0�MS�<a������i����H���-��v��=�x�R���fx�7�<Y�5��<m��f�T�[�jO �ڬN=ꖥ�w�^���iZ��oX_[Hb���T�9\"q�YKdj��⯇�\'��|��4�+M���\r��l)��2D>� Ԍn�z��G��9�Mk���y�-�O�\Z�Q���Y<e�,lb��\r��sE���k�_?���)MsNm��W���_��Xϙ�gn�w�+��������[_���y�X��=Zi�\n�rI \0=kwF� o��:6��誆�!���� v��4#��:W��\r����q|[�>�>�ao��g�b�l�\"ţ]�C�F9�kߌ�	t�B��P���;K�y\Z)��U�7RC+�Aկ�x����ſ���h�n�r����WiS����9����\0<3�gU��u�|&�-�54y�a�tx%T�0��A�-^�6��k?���\0MҦ�����$j�Bs(Y��m$\0@�!TzQp���Ǿ	>\n�\0��x�E>�U����@2gh9 c=N*�߈��2��Z���T*�9gUk�ۻl@������|��K�?a�3|WҾ<)/���5�KF\"�客�����Bq��A\\ݦ��\r��	~��I�x�G�5^/��mX[�����\0g�`���oÿ	k0�\'�Ǉ�{��)m}2z�r�<V�׈�Ӗ�[ӭΧ ��Kr���#!b������c���=��[�F��#K�uO��K�u�5��I`�N#R_�����灏-�5�ľ� �<�h�����igbsb���� ��.;~�,P[��H��\Z�wr\0P9$��W�x���y��\0xwI�t\'M6a\r���Cq>��$�d�jN��9�8����\0P���_�[K�c��Ԭ��ym���y��$t����E�o�ׅ>�Y�m��g������FDI�F`ANdB��9�2y丒>��O�� ��0�v�������/�tʆ9#ޭM�	[�~�]�ĺBiw����?&�G8EG��\08���ca��|����Ҽ]�:�8t�#Y�4�a�)\"iAT���?�yΧ�xz��z��<=��\ZG�]:���-T�1	��9��S<_����\\v>��?�?x*��x�C���\0S�y\r �2H�~��5=4��jt�\0\'�k��������9�+揅�\'��W�C�r����iZ��k���.�\ZHm����	>�drH�ְ~(x����\0b�\'�/����_��bm���d��-xcF��h�W���.+Xh���Mc������ϟ*��e�\'� ᔐpA�d���7�|#�&��\Zh\Z-ܑ��\rF�8��\0�eHϱ��?e/h�7�_\Z�$ѭ�{=	e\Z�`�,䴜[�ԙ6J�\0s���P|XҼE��ߺu��<-�?^��k?g�ʂ��\n�x$�B�\\,}	7��6���?�Ŧ^I$Vׯ�B!��諭��\0�N�����S��\rKM��\0������[ۈ5(�-���`�PO\0����O��A��F_��_�W�2h��0�C\0���;s���?��\'�c?�o��8ѧ�O�@|���Uϝ��#n3��p��g��\"xŷ�c�\Z�Y�E,��~��\0:����ި�_�h��Ɨ�|G����)�uHc�\'U��A���_xO�z?��w�ZF��x�_�PB�l)���@p�\\c9�S�X���5���&𯄾k0��ْI<c�*6�@�b0َ��\\v>��~)�4��lnu_�j�Bug%ƣkq8!-�\\�Vփ�ox�L:��u�3Y�\r��i�Ip��!#>���=#�\'���s�h>�v���ໝ�%�i���qP����8��	x�J�W��oWJѯ��.����E�\\���������>e�������_kz������w���^�kp�=���Ƞ�O��Si�拫�^�iZ����{��Y\Z�P3�@��lv85�w�/��;����˘|C�3��O�Eƭ��k�L��$o\"�~\\Ǒ۞�İ��O㉒D�>4��?吡0h�}[WҴ�W��];O�]��]J\"�%�2�x$u�o|E��/����6���t�Y���B)�\n:����޸/ڨ���|~A4G�tJ�o�~������t�+L�!�`���R�-�}�0@�1�����H�S��<��,�[�=D�������q�!X��+�����������i�I�8t�OFV}E|��OA�g��,�g����i:��\"�,��G�ē5���	�\\�8�V��\"���i�i����e���ŋ\"����bqۓE�Ǭ^�Z�]��hڏ�_Y�0Ja���T�9#q�YY���޵�\r�oJ�S����vSȰ�syr�G#�%UY��	ھ(��|_㯎��~�W�b�ķͬkWq��s�`�P��w��r+7▟bo�#��Wz��a��\n�ۮt]:{�mVhv[n��a�n���q����>(�߄���<Q�i�5��![�B�`���������?x���/���1�u��]�E�_�p��J�{��^5���ğ�o��Ŵ� �񮛣��߂�%�>bm�HWdd<WI��N���\0n!/�|9�?�:�����6�Y�q�?�ڨ�zcp=@��qX��_xv��i��:=nxM�Zk\\ ��1��ǝ�~S�;Js��@��Q�fMj�5� 7I�4�\'x� �#��g�<�E�\"\rG⎫�A�Yx�mcM�DO�I�9�m0J�p��f��s�Mzw�{����Ӽk�������i(���n�t�I�1��w���\r���꺆�a�j�W�Zt�� �]�#pI\09S�p{W=�\'�u�[�kc\r���6�è�s,�G�#Ɵ�A9\n�K	 W˟\r�4�zo�?h�Z\\rF�Z��Ɵo0Û�mV8�#�{�?g\rM�k���zx�_��i�K��٫�q��|fP7���|�\\,s��N��[�՚7���X��b��\"U�W8������J�{��v�g���m�����6��$��¿dQ�\0aF;\n(�7�8/i�|?�=�6љ�LR%a1.Kq�>�{�ŕ��\0�M�� �8�4���U;�\0�����E�X�����w��ck�݀H�\r�A����}����Aφu@p���(���kc�5}?O��\0�X��=���E��I\Z<Jʌ&epFO\"�k�����D�[�Goj7��wW��Mp�����$�E6�]CIҴ��ٲ��L����x��EB֠�P$�qԚ���������P��.�e�f2A=�H����T�\Z(�Ə��K[U��<@�mk��3y�v/�W�q^a�����7���h�~Fg���F��8�E��9?��C�g��y6�a%ݭ��{��C$$�J1^	W�|o���\0�����ϬLY����E�����xUO�{�J�F��\0`Z�|+�d�X�bE��t��؈�\'�Uv#���ě;5���Ҷ���� ���ɯ�?h�;O?�?�5Salo�--V��ľl����8=������4�&��	�l��]�\"���y�p*���d_;�|������J��cd�\0�/�k׳������0\\/�u�I8��hGΟ�f���~Қ��m�/��ۚ8UM�8����{=+�?km\'J��	�=2����p ��H�g��O�.�;�i�m���k�>���}6�	�WI��2��=�r_�摤���z��,���Y���\n���G����QE}N����t�y<3���ZũLL^�����⼞	�tz���鿱��h��O�I�S��H���y<�����)�C���t�6/x?P�O�K���\\�,J$�0�팲��Z-+L���>\n��鶖����{h\"�Q &!���(����n������Wt� ���J#(Q�����\\d�*����\0���O7��_3hݏ��ϥS�?n[x&�|�A�.�ʗPv��:g�xW��[V�/�3m	F�mC)A�>�ފ*^�-�@���=o��ڄ�=�����m���烱�����_�6v����Xw6�9c�e�G&�(�>���\0������#��Um� y��}+���eg�7�� K[�K�0巡�\"�s�rsE��=����>[I$H��c,,�	�ć��<����m���4\'���}Zᙶ��S�EH\"}��\Z��\0�{O�#�|1d\n2��j���C�f��{�M��Iwkj������	<����(���-�[���4�o���-��Xn�bX��#�VK�\r��0a�0s�}���MӴ��^�Ҭ-lmR�\"�[D�\"���*�I$��(�n\'�<��\\0����G!H�U@�|�����\0�~/�h���OyB��/�ԁ�Ҋ)��x��l����3�m X��}`�09I	|x�������+�����\"��.�ڐm��0���ӹ������]���ce�\0	���������X�s�����\\��g⇁�1����>9/��A�E�ﴭ2oĖ1i֑ڿ��?|\n�n%<�0y�����#���wf47�,�xe��|������>���',1,8,2,0,0,0,NULL),(20,NULL,6,1,'Palestra teste 4','palestrateste4','<ul style=\"list-style-type: disc;\">\r\n<li>Lista n&atilde;o ordenada item 1</li>\r\n<li>Lista n&atilde;o ordenada item 2</li>\r\n<li>Lista n&atilde;o ordenada item 3</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<ol style=\"list-style-type: lower-roman;\">\r\n<li>Lista ordenada item 1</li>\r\n<li>Lista ordenada item 2</li>\r\n<li>Lista ordenada item 3</li>\r\n<li>Lista ordenada item 4</li>\r\n</ol>\r\n<p>&nbsp;</p>\r\n<p><img src=\"http://redesuldenoticias.com.br/fotos/36396.jpg\" alt=\"imagem 1\" width=\"640\" height=\"301\" /></p>','ministrante 1','UTFPR - Campus Guarapuava','UTFPR Guarapuava','2015-01-12 15:00:00','2015-01-12 15:00:00',38,'2015-01-08 21:40:00','2015-01-09 14:00:00',12,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0\0�\0\0\0�=�\0\0\0�PLTE#������������������ \0\0\0���@��\r\"\0���\0\03;D���INU\0\n���\0\0?��\0\0C��<y�QW])3f����.[{7n�#1���&5\'Mh/^x|�/@!?V\"+$G`��ᠣ����kot)/63F���^ci���MRX?EM������cio!(0���08A%	\n�)M�\0\0�IDATx��{{�<��Ѣ(GQ��B�V<�����ջ����w?u����^�\\WKBH��JVV�� � � � � � � � � � � � � � � � � � �_������Ϳ����*R�M���{�o`�j�����h#�?��g���x�yԬ� �_�����p��<У����l*��4�����o���T[�-�Sjy\n��%���T���\"���x_.�.)�Z�Ź�X�-�\\\Z�NS������H��|W��X!/��m뤤��F��yJ��mx�g`s���R�S}��1]���U�0�S��n��g]��O���f	?#f?�d�8)�������0�������s��<-�,f�V�bu�%�傥�ż�2kP�f�vg���V�������W�����Xj�&�l��,�P�w�D����n��Tw�`�z3������L�OP���k܂�Kp\'Z�%�&,hV���g��\"5W\\����������T�E�\\�\\؉�~\'��^Qm;b]�.B�WEU�Sk���	sz�$|�c�=��Ss�о��<Ӭv\r4g9�}qK�*�`���/�=��Μ��t�������6�}c��h��Kk�G�`X����G|�b�+o�$����ك\n�k���M�}��JP3%����	<�ᅊ;�e�9�nd���\Z��&8ݧ��uf[���樣�ч����<�V����D�@>����f�v3�j���՞�W���Dj������[�(��e�cfwi9�d|�\"�){�������.��5�3�\"��F�u��[�W՛��?v\"J�E$}�c��^�7�Vc�w��� Ŏ�e�\'��\'��8Q��Q���$�%<�����2q�!Or!|�`�ig��`%j�eV�曥m[��j�1\0����V�ʹ�?��j��3�U؊�a/%y���F�z��aɠ��\Z�=v��/���\\ļ׾��cV���h���������lV��,���X|���ވ�;�\Z���Ås0q�ڂ��(�ɵ�q�eE���[+�����J���DU�@>N�V�r������z��Ð�c�6y?œ}�++k�T�?����P�BE��>P�U�z�\\�a;�lz(�ܖΈO��ft+(zÃ�.N�����Q͜��X��o\rm��mO�\rx3Oo�:��?܇O���9��.���BZJ5F5Qk���i�Y^Zo&��ɞ�%��u�ƾ�7�O\"�v#�4�wz�+�n��xvk���˂I����\n��ԓ�Y�J_&oγV9o�4�!v�	3o0d��-?Qt�_���7j˶�Ya����g���q(�Z2�59�~��%��#�q8)���.����O��4N\Z�R���a����/<���⭵�[lݧ�q�`�J���#\'89eRƸ�Jބ%�(�ǣ�&���ע�5��w�eƗY�ur>���\Z�(�q�!�BY�������;h�57��j�/�j=���2�<�:c)صlp�輲/�/���V3V����GYo|���,}����&o��T�iܠ	�%����شβ����f���FJ-&��peQ��/}��z�.B(kt����4v5̀xI���|C���Z6��\n<���wwm�D,~YC����̏��B[Eq��%�$�� ����I�����l!�v+������r|9m\\�>�^ j8Z��,!�����A��Ŧ��J�6WƾΫ\n_����]��8�W����ZΚ��J�^Y��\ZB�@�n��<=z�Z_\"K�+�����.g���������\r/L_ �g��t�?{�O2�~�0���~���WY{�ɶ�{QF�\0G�\'�zkp��@�Ȟ�u�r��#|J�=f.Ks�\Z����qԙ��������f�\0�e\'��r܂���@�`/~ˬ�Cn��gW�=8�wT;��}��K�Ϗ�,^\r�W��3�,L�`|����ḿ�=��+U���V�w��c���I}j@\0�r�UiimG|��ߺt�\\^ ,�$_��B)�U�����FU�-��D�k��a�k<�~��ًŹ+�t�2>Ln�߼s���!�u;H v/�db;vI�`�i\'���7>�-�`�pϑc����nn��-�޴Ǿ�H���m�ȉ%z����������F�0���؎���6����:t�<��Վ;x��a�{���עseq��mt�ߦ��s�K��<���MQ5�(W;�ٷ�C^a�z7;��%XB�/�ʔ*bW�}��0.oV����Ǒ�\"t/s\'�p\r�\'�Seև�����I@���_�q��z�DUf�a�E�9�ݽ�����Ye�M�*�����BQ����>5�P/� �8������m�w��%�G�j�	�%68~�&�$�m�<����$�u������3kK\\2-NT���Iq*�c=��7����yB�B����8NcY��0N�+i��83o�c��)(M����������2x=�\Zݽ��q3%�SM9�c�<�0��,p����H��Bf��fy�b��d\0ۉ�)�%�qU@8w�c�s4z���Ѯso��(�D�;S;�8c7H\'Nd���Qb���8Q��8���@�\'J2Q\n%,��17r�P	73��#Ս�����>7/w����R;L�4K7V��kGQ��~L�vD��F��Z^�0�nz�_��Y��6�Hd9Yg��\r�^s��.�\'�����qC��&A�{�$u�f����I��u�\"	� +$=��ȝ$�$P�kfvE���n�2�~�:a���S2Y�;���$���؅�����f�i�nvt�q�Fem���&A\nC��@CO��ܠ��{>�?�?����}��`���/�X�}9�S��:�z���xT%5��߇H@�%��|���U��w]�/��ٓ���:(R//��N��� � � � � � � � � � � � � � � � � ����C�䓢.\0\0\0\0IEND�B`�',0,0,0,0,0,0,NULL),(21,NULL,6,1,'Semana de Palestras teste','semanadepalestrasteste','','Organizador 1','Unicentro Guarapuava','Unicentro Guarapuava','2015-01-12 10:00:00','2015-01-16 17:00:00',100,'2015-01-09 10:00:00','2015-01-12 09:45:00',359,NULL,0,0,0,0,0,0,NULL),(23,NULL,1,1,'Semana Acadêmica teste','semanaacademicateste2','','Professor 01','UTFPR - Campus Guarapuava','Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR - Brasil','2015-03-23 19:00:00','2015-03-27 22:00:00',81,'2015-02-19 12:00:00','2015-03-20 23:59:00',28,NULL,0,0,0,0,0,0,NULL),(24,23,3,1,'Palestra 001','palestra001','<p>Palestra teste 001<br /><br />Conte&uacute;do<br /><br /><br /></p>\r\n<ul style=\"list-style-type: disc;\">\r\n<li>Item 1</li>\r\n<li>Item 2</li>\r\n<li>Item 3</li>\r\n<li>Item 4</li>\r\n</ul>','Ministrante 001','UTFPR - Campus Guarapuava','Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR - Brasil','2015-03-23 20:00:00','2015-03-23 22:00:00',80,'2015-02-19 12:00:00','2015-03-20 23:59:00',1,NULL,0,0,0,0,0,0,NULL),(25,23,2,1,'Minicurso 001','minicurso-001','','Professor 001','UTFPR - Campus Guarapuava','Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR - Brasil','2015-03-24 19:00:00','2015-03-24 21:00:00',25,'2015-02-19 12:00:00','2015-03-20 23:59:00',13,NULL,0,0,0,0,0,0,NULL),(26,23,2,1,'Minicurso 002','minicurso002','','ministrante 01','UTFPR - Campus Guarapuava','Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR - Brasil','2015-05-25 19:00:00','2015-05-25 21:00:00',34,'2015-02-19 00:00:00','2015-03-20 23:59:00',4,NULL,0,0,0,0,0,0,NULL),(27,NULL,6,1,'Apresentação teste 01','apresentacao-teste-01','<p>Apresenta&ccedil;&atilde;o teste 01:<br /><br />aaa</p>\r\n<ul>\r\n<li>item1</li>\r\n<li>item2</li>\r\n<li>item3</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<ol style=\"list-style-type: lower-alpha;\">\r\n<li>item2</li>\r\n<li>item4</li>\r\n<li>item6</li>\r\n</ol>','Ministrante 01','UTFPR - Campus Guarapuava','Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR - Brasil','2015-05-04 19:00:00','2015-05-04 21:00:00',30,'2015-04-19 23:55:00','2015-05-01 23:00:00',8,'����\0Adobe\0d\0\0\0\0\0���ICC_PROFILE\0	\0�pADBE\0\0prtrCMYKLab �\0\0\Z\0\0)\05acspAPPL\0\0\0\0ADBE\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0�-ADBE\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ndesc\0\0\0�\0\0\0tcprt\0\0p\0\0\0+wtpt\0\0�\0\0\0A2B0\0\0�\0\0�A2B2\0\0�\0\0�A2B1\0\0��\0\0�B2A0\0E�\08�B2A1\0~t\08�B2A2\0�(\08�gamt\0��\0\0��desc\0\0\0\0\0\0\0\ZU.S. Web Coated (SWOP) v2\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0text\0\0\0\0Copyright 2000 Adobe Systems, Inc.\0\0XYZ \0\0\0\0\0\0�Z\0\0�g\0\0�0mft2\0\0\0\0	\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0$�i�\n6��\r�1^���2Wy�\Z���%Y �!�\"�#�%#&D\'f(�)�*�+�-.(/H0i1�2�3�4�5�7859Q:m;�<�=�>�?�AB)CBD\\EuF�G�H�I�J�LM,NCOYPoQ�R�S�T�U�V�X\rY#Z:[Q\\f]x^�_�`�a�b�c�d�fgh#i3jBkRl^mgnqozp�q�r�s�t�u�v�w�x�y�z�{�|�}�~�ˀɁǂŃ����������������������{�p�d�X�L�@�3�&�������֜ȝ��������|�j�W�E�3� �����תū������}�k�Y�G�6�$��\0��ڷȸ������~�k�Y�G�5�\"���������ŵƣǑ�~�l�Y�D�.������оѧҐ�y�a�I�1��\0����ڲۘ�}�b�G�,��������{�W�3�������q�H�������v�U�3��������s�I��������a�)�����\\����Z��\0\0��,���\n\r������\Z������ �!�\"�#�$�%�&�\'�(�)�*�+�,�-�.�/�0�1�2�3�4�5678�9�:;~<|=|>|?}@A�B�C�D�E�F�G�H�I�J�K�L�M�N�O�P�Q�R�S�T�U�V�W�X�Y�Z�[�\\�]�^�_�`�a�c\0dee�f�g�h�i�j�k�l�m�n�o�p�q�r�s�t�u�v�w�x�y�z�{�|z}o~dX�M�A�5�)������ۈʉ��������q�`�N�=�,��\n����ٖɗ��������m�Z�H�6�%������ؤʥ�������������w�o�g�`�Z�T�O�L�I�F�E�D�E�F�H�J�N�R�W�]�c�j�r�{ĄŊƐǖȝɥʭ˶̿����������������*�7�D�Q�^�k�yކߔ���������������������� �,�8�C�N�Y�c�j�n�o�l�d�V�D�/���\0\0�h�	2\nRer\rxzzzyuph^RE7)\Z4=@?:4 ,!#\"#$$�%�&�\'�(�)�*�+�,�-�.�/|0p1d2Y3M4A566+7!89:\0:�;�<�=�>�?�@�A�B�C�D�E�F�G�H�I�J�K�L�M�N�O�P�Q�R�S�T�U�V�W�X�Y�Z�[�\\�]�^�_�`�a�b�c�d�e�f�g�h�i�j�k�l�m�n�o�p�q�r�s�t�u�v�w�x�y�z�{�||}v~oi�a�Z�Q�H�>�5�+�!��������؎͏Ð��������������x�p�j�c�^�Y�U�R�P�O�O�P�R�U�Y�_�f�n�x�����������̰߱�	� �8�Q�l�����»��!�C�e��ª������9�^ɂʦ������2�T�tҔӲ�������6�L�a�t݇ޘߧ���������������������o�X�\\�[�V�L�=�*����������b�/�����f����M���q��\0\0��	T�	�\n���\r�p_L7!	������}\ZtfUA, \0 �!�\"�#�$�%z&d\'N(9)%**�+�,�-�.�/�0�1y2g3U4D526\"788�9�:�;�<�=�>�?�@}AoBbCUDIE<F0G#HII�J�K�L�M�N�O�P�Q�R�S�TzUmV_WQXCY5Z&[\\	\\�]�^�_�`�a�b�c�dxeffTgBh0ijj�k�l�m�n�o�p�qlrVs@t)uu�v�w�x�y�z�{n|V}>~%\r�ہ����r�W�;� ���ϊ����}�b�G�-����ޒē����x�`�G�/����Ԝ��������q�_�O�?�0�\"��������۬խЮ˯ǰı²����µŶȷ͸ӹۺ������ �0�@�R�f�zƏǦȾ������*�G�cЀџҿ����\'�L�sٛ�����\Z�F�s�����M����6����+����1����M����Z�����:�{�����\0�\0�\0��T�?�~ò��~i��~L}��~cbA�~�Da�d�����~t�y�~W����~O��>~\\���/~���|�~���`���C\0��x������}%��H}�1�X}%�z��}K���}��\r{N}׋<_�~7��A�~��-ψ��|����|��ǲ|+��E|[���s|���z}��^�}w�O@�}��-\Z�~ċ��	{G�u��{D�z�{]�Ĭ�{��f�{�Zx�|[��]�|ϕM?�}R��<}Ǝ���z��]�Yz��Hħz����|z�=��{L�Nw�{���\\�|=��>�|��v|ېI�8z/�r�\rz�;�bz\'�s�Mzd�6��zɬqv�{D�[�{��0>|;�|���y�����y��a�Iy��?y�a��zY��vzݮ�[{^��=c{Ф�I{R��*y�߄��yf���Uy`��Vy���y���uKz��Zi{��<�{z�%�zȎ���~+�~�\0}��͇}W���0}3�\Z��}HtЄ�}�Zk��}�=���~���z��ɇ���\0���}�����!�~����Єd�*s}��Y���<9������w����p���S�w�u�����������u�VrU���W��؈|;,�뇔��{���R�s��Ѳ��������;����:�8����q)�P�CV���:4�.��8�����Ȅ���2������񡂡?�U�����p����V�u��9S��������c��b�փ����R�����.�ՁN��n��	��U��38���8���A�/����ͬ�������δz��6�߆�ө�n1����T\\�e��7݀t�XT����)�$̯̕�6�;���e�C��ʷˆ	�i��mw�3��Sƀ�V7M�\n�\\��l�G�N��ػ�ځ��N�ā�a�5�t��N��zl�ߴ�S<��H6���*���<�a|��k�z|C�V��|�Ǎ\Z|����|Ik���|�Ru��}26��\'~2����F�-����B���*���o������������j�����Q^���@5z�I�`����ٳ�\0�$ĝ�\"����c�ߘ���&�U����ij���|PJ�ˇv4v�y���V���G����.�2�{������������萾hS�掼O[���3���(����J��ьx�&�$�Ԟs�҉h�\n~�2��gK�>�-N}�o��2ن��\rN�%��է��������\0���>�w���֣A}⇤�\\fX����M��ݘ�2,������K��Ԑ�3�����g���°����[��}\n�0�e��6��M�_��1���?���1ӣ���Ǿ���I��^�����I|B�̯d��ܪwL���e1$���:�������r�W������]�\r��1���S{��z�|di����L\r���g0��\\��U��������{[���G{!����{	�ޔ`{&y�E{xbi�e{�Jr��|�/c�5}~\n~���:����f�#���������M�Kx+�C��a|�u��I~����.y�W��	ώ���әߎ���%�¡唘����[��w!�^�T`����^H��*��-�����	5�G��Ȩ�瘎��=�Π����4���r��v����_�ҍRG��f��,ދ̋������|�,���ƕ����{������Ҙ�t�ٕ�^��1��F�ő�,;�\'��<�!���_���������Y�l�~�J���J��t�S�#]����\'FA�4��+����;ۊL�P�f�&��ɔ��ޝ������ը�s@�夏]�0�E�����+:�������\ZĒ���x�����ɑ����r��r����U\\}�ڨ�E>�\\�A*ى���J�����n�y�g���؜(�V���N�#��q��6��\\���DՊ\Z�B*|�i�����˽?��zz��hzM�џzE��zrn��8z�Y,��{dBS��|\n\'��|�������⃔�*�Z����\n�Ђ`���>mۘ:��Xc��A�����\'4��uh�������¨�h��$��n�k��)l�]�\'W���f@����&��8�[/���Թ|��������z���Y�9�_�N�3k�����V��4�1@�4�9%��w����������U�h�\n��3�����?V����k�ؔ.Uٓ|�??R�~��%n���Vӎ������ȩ�5�U��.��k~���j9�V�\"U\"�똬>Ð�?%�\'���Ȃ}�ˡW���m���l����}ʗ���i���RT�����>O�l�T$�������\Z�i������Ɲ��a�ʚ=�\\},�?��i����T�-�\r=���$e�0��y���Y�q���,�<�-��A��_|���?h��@�S���G=��ҩ�$���le��L���y�)��y����y�w��y�dG��zPO��sz�:��{� )��|q\0\0��ʬί(���h�䁙�~�ڀ�v���cc����&OS��#9t��L����\0\0���\0�߮=�.����������\Zv1�0��b䞼� N�����8ՙ,�K.���F\0\0�p�\0��j�癪�7���̥0��uP�h��b���QM��88A�j��ʗ׋�\0\0�x�\0�A�ʜ��ڨ��󤔗tu�ϔ�aM�K��MB�=�(7����ku��a\0������,�̘/���1�H����sʠ5��`����\\L����k7M�\n��(�_�X\0�Ā�⫹����}���£r��s@���C`)�6�OLA��;6����}�Ȕ@\0(���B�a�t���{�C�\r��rȟH��_��֧�K�ť�6��#��̕O�&\03���\"����^���ļ��֢��qrb����_c����K��u�6{�ݤ���	�\r\0<� �(����yt�յ�y:}Ѱ�y2ld��ygZ8�dy�F冷zj1��{�r{�\0\0�(�\0�������B��}b��\rk��Y��drFl���1l�����;��\0\0�n�\0���ˉՍ��ވI|ϯ\Z��kU����Y�z�4E�Ƅ�0�������\0\0�ˀ\0�h�������|\Z�R��j��ΌcX}���-EY���W0���,\\���\0\0�>�\0�շF�i�b�a��{{���4j�$�W��]D�?�50>�R�*>�6��\0\0�Ā\0�;����ٱџ�z����i�����Wy�Z��D}���p/�����\'�g��\0\0�^�\0�ȶ6���p�D��z����i/��W%�Ԟ�D9��I/Ĝ�\'����\0\0�\n�\0�J�״��\"�ԯ�zW���h�y�1VߣK��C�����/����1���\0\0�ŀ\0�ٵ���˰t��z����h����V��ﭠCߟ8��/��/�)����\0\0���\0���cy���x�r�|x�a��ix�Pq��yS>�sy�)���zjf�Y{\0\0�C�\0�7ċ�恶���q¹�JaJ�m~�P\r��~�=��_~�)]�f2��ÀD\0\0���\0��Ò���G��\'q^����`۳u��O����Y=R�Z�)#�J�N��O��\0\0���\0��©�k��#�_p鷼��`k���&O:���%=\0�j��(��H��ڧ�\0\0���\0�,��O���[��p���t`����N�֐&<è��i(ץc����\0\0�^�\0���P�b�B���7pM�@�s_ϱ	�,N��&�q<��Е�(¤���+���\0\0�8�\0�f�ը���*��p����_��o��N����<}�:��(����nN��\0\0��\0�&�Q��̺���o����_����Nw�	�\Z<o����(��S��l�D�\0\0���\0�Կ����-��o��-_��Q��N{�p�\\<�� ��(ܢț�����H\0\0��\0��Пx�u��Yx�f��ox[W��x}F���x�5�yX ��wy���{E\0\0���\0�bϟ�nu��~gfpÌ~�Vν�~DFq�t~)4ٳ�~P ���~�g���\0\0��\0�J΅��uo�|�AfC��V����!F?�K��4�����!�����(��\0\0�/�\0�F�|�u_�l�f �r�gVv���\ZF$�(�H4��f��!,�I��	]���U\0\0�E�\0�9̘��uX�x�f�p��Vj���IF!��$4İU��!Z� �{	̬B��\0\0�X�\0��Ԟ!uPŤ�\Zf(����V�����F8�/�K4�]�J!���@\n4���\0\0�h�\0���,��uJ��9f7�̟;V����F\\�n��5����!ͫ2��\n���%\0\0�u�\0��ʚ��uE�T�vfJ�(�V¸=��F��¢�5=����\"\n���\n�O�_\0\0���\0�����uE�Ű�fd����V򷣪fF²%��5��V�2\"e�ۗAG����\0\0���\0�{Fy���{�y���{�yѪ}|Xz�p|�z�w�};{\\�}�{�?�~x|\\�}�\\y����:z���qz���z��N�{���vy|�d[�|��\n>�}g��u~_���jx&�t�hx��Q��y7�Q��ẙ���zi�%u7{��Z�{���=v|k���|��v��՟w��Ӿ x\Z�Ѧx��\r�Ryo��s�z\'�kYuzیM<l{����{�����v���\0v��l��w-�o��wכ���x��Fr�yZ�,Xgz�9;uz���dzW��uK�Rҙuծ\"�)vl�(�5w�~��wڠ\"q�x��Wlyk�f:�z��Vyg���Pt���mu=����uβ��vz�d��wC�,p�x�NV�x؞�9�yf�*rx��&�WtL��yt���uR�\0�u��v��vİho�w���U�xd�93x���x���t�)ϸty��:t��1�Eu��ȇ�v\\��o/w8��UFx\0�-8�xw�M%w��D��.w��3��x;��.x�����y�Z��y�n��]zKU`�O{9&��{�߄�|���������)���݁ŁM�߁y�̆#�C�tm��)�@T�0�7�,x� ��ބ�J���N��޳Q���/�g�Q�ÄԀ2��l��.��S�@��6瀍��<���s��*��Ǥŕձ�v�:��F�ԃ|<��kXH��Rd�$5����+�u���`=���$~؟�2~��k��~i�$�/~a�j:~~�hQ~���5!~�J@e�P�\r~�����~ �$��}ե��K}����}���i2}˚P8}��4^~2�_{~�����}����}�����}>�1�<}� �#}�oha}?�\'O|}g��3�}��f\r�}É\\�}��Y��}���|ȸזP|���D|��mg�|˨�N�|���3,}�X\rS}(��d}5��<|���0|n�ƕ�|4��~�|8��f�|e��NT|���2�|��L�|������Qv�����w���w~�~��x	}1��x�f��yzM��(zI28�%{1։$|y�<��Ǽ|���>�ډcΒh�U~|�nWd���QL��\\15�\Z�쇋�Z�⊩��!�_�����+�7�/�0�\rz�X�cⅩ�FK��&��0D�!�D�$���~���u���I��&�%�ڏ͆.��y��l�bǄ̋vJ��Q�/n�F�Y\nk�솷�&���ڸW�l���ΆN�����]��x����a��I�����.��~��	҃ᆤ���\0�h�/���j�������h����w���o`ӃX�^H����.�Е\r	Q�\0�L���r��7�1�N������u� �\Zv��f��`�ҟGHU�X�u-{�8�I�F��,����m�źg�߄��ދ�����uނ��_g�f��Gǁ��-���p�����ȑ���=�ͅt�ؠ/�I�z��K�hu5���\0^Ղ��GJ����,��^�&J�5�����u��Y��v�\r��v���w6r��w�]��x�E��ry�+�Nz����|����},�S�P~˛�S~~���~Sr	��~O\\��~mD΋o~�*\'�C~�,�l����W�ح�4�����6�u��x��p����[(���/C񊁃�)c�M����\n�&�o�A����(�����7���ȍp��o��fZ0���C���(��e��_�׃��G�g���ϐN�����a�������nً(�AY@��RBS���(����\r�Ѓj�<�����ŏ�������������Jm����QXm�@��A��<��\'|��;Ȇ�<�[�9����%�_���5�,���~�4m,���Wƈ���A����\'�U����<����ϻ�6���\0���ʱ���^ly���0W(�W��@��@��&��֚$`�����\Z�|ź���m��[�x�R�`����k�7�NV����@-���&H����;�/�ݲàztáH��uN�<��u�|h�=v�h���wSS��x2=��Ey#g�Iy�J�Y|����`}�}�k}��|��}c{��$}Qg��}fS$��}�<ۑ@}�\"��3~T,��ݰ��F��y�\\�􍏘���z�� �3g�݃�RP��1<�S��\"�5�;�o�����S�1�h�m�`�n����y��0�3f����Q~���;n�x�9!��J��\0��@���՜p���v����r�┧x��e�se1���P��3��:ʎ���!�m�/\0�=����̣����ъ��8��w�����dc�}�WO����=:8��� �����\0֊c���2�M����o���蕷��w%�:�~c����fOn�\n��9j� U���\0ȉ�������j�P�\r��H�Q�uv��ΩVc ����N控�J9Y�\0�[ ����\0����������ӗ��o���\0�Vu��x��b��9��Nz�L�]8����e��>�v\0����z�	��t9����t����|uOq�Eu�^s�Jv�J���w�5W��xk@�kx�\0\0���0��|���|��$�p|spv�4|p]ڜ9|�J\"��|�4���}-\ZИ5}�\0\0�l�\0�s�����?�䄅�l�f��o��1��]�<��Iy���D4,���+\Zm���\0\0�`�\0�����/�c�����}����n۝D��\\U�Y��H˗Ň�3��чx\Z�\Z�8\0\0�w�\0��Ԗ搗�5����n����[�����H,����3&��/ȕ-��\0\0���\0�:�\"�ޏ���~���5mV�ڗ�Z��ڕ�G��9��2��;����V��\0\0��\0������g��g~w���lțF��Zn�N�[G*����2b���P���\0\0�|�\0��C�4�桤�}��#�lH�ڦzY��ࣔF��L�2�.�t&��\0\0��\0�����ގ}�T�!}��в�kך��zY�����Fl��B1Βء������\0\0���\0��sĆ}��t7v���t�e��ulTg�+v1A��w,��w�n�w�\0\0�~�\0�U�\"|���{�v4��{�e���{�S��{�A8��|\Z,���|iT��|�\0\0�Ā\0�ճ�,���Ã4u����ed�����So��@����[,/���g?�?�	\0\0�!�\0�N��S��ϊ�t����`dY���?R֢�h@=���+Ҝ���+���\0\0���\0���S���T��ptY�ܐ�c����RJ�@��?Ȟ��+��ی����\0\0��\0�*�����ˬf�KsԨ8��c/�A��QΠ���?f�Y��+@����6\0\0���\0���%���`�բKsh���Jbƣ���Qn���?���z+�F��	��2\0\0�^�\0�S�ŮE��l�xs&�,��bx���Q�m��>Μ=��*ڙʜ��]�1\0\0��\0���z�l�ʫ�rզЮ�b*���|Pܟ	�s>��Ԧ�*��d����0\0\0��\0�v��sQy��s�jٶCt+[\'��t�J���u�8��vF$R�+v�\nX�w\0\0��\0��{.y��z�j��<z�Z���z�JO�nz�8_��{C$4��{�\n��.|b\0\0���\0�޽��yb����j^�&�.Z�����I��L�t8\Z���l$����\nߦ��&\0\0�k�\0���犘y���i�\"��Z,����I��A�-7Ϧ���#�[���Q\0\0�)�\0�>�\n�`x���bi��A��Y����3I?�N�7�����#ףV�>J����\0\0��\0�߻b�SxP�g��i5����Yu�ߓ�H����U7]�ӑ�#âk��t����\0\0�\0���ޢ_x	�ڟdh��Y9�>�kH§��79�,��#����������\0\0���\0�M�b��wյZ�hưk��Y���eH��^��7���\n#���������\0\0�{�\0�\r��>w����9h���X��#��H����97���# `�-��\0\0�a�\0{n�1r�m�Ŷs7_X�s�Ps��t\'@���t�/E�!ud��uko�Mw�\0\0�$�\0{h�@z�m���z_^�ky�Pp�Iy�@���z\r/R��zVG�1z_�/|F\0\0�\"�\0{r���m�Þ��_G�=�PN��@}�:m/P�Gw}�����I�u\0\0�!�\0{p��m}�s��_��gP%�ԅ�@^��/J����������n\0\0��\0{[��eme�p��^����P��@O�ߊ�/P�܊�߫Ћ0��$��\0\0��\0{9�%��mT����^����P�Ց�@O���/a�ґ������\0\0��\0{ń�umG�ꜳ^��`�GP\n��f@[�%�]/y�\0�yK���!;�΄7\0\0��\0z���0m?�[��^����,P�a�@g�u�Y/��V��x���@���j\0\0��\0z�ĝ�>m>�᫓_	�8�[P*�̦3@��פ�/����E��1�gȥF��\0\0��\0�vps�wKs�xt̢*x�u��$y�v�qczw�W�{Ox�;/|1y��}!y��t�~h�ku�~��v|}��we}ʈ�xK}�p.y3}�V[z}�:z�~ {T}��1r���̚t�d�_u\n��Fv\n���~w�n�x�BU>x��y8�yĂ��yՂ�iq��8��r�����s��l��tюL�u�vm�v���T*w�!7�x����x�����pu���2q��/�r���+sŖՄ�t��l|v�iS#w��7w����wq�?�lo��\r��p�����qˣ��r�z�wt��kXu5�3R.vA�6Bv���v��K�Nn뷌��p�[��q�1��r0�<�rs]��jrt��LQZu��u5�v%�%�u����onm���o����p����q��#��rɫ�i�s���P�u	�{4�u���ju�l��n���Do)���p!���q\'�6��rO��h�s��}P\nt��I4ct��(�t���q���rʬ�sϗ5tрuVu�h��v�P1�x4��YyX��y<Ԍ}Q|��}s|z��}�||��}�|�S}�|�g�~7|�O~�}43�}rA�H}��\0{҇P�|�B�A|3�D��|q�o}�|���f�}�&N}v��2�}�%\rL~ҁ��nz���ez����z��0�\r{@�i|�{���ex|�rM	|v�!1�|އx}�����yr���y���-y�A��z?��{fz��d[{\"��L{���0�{��|w��γx��Һ�xԤ��y�q�ryj��zJy֙�cVzS��K>z̓�0!{��){���ͮw�ӹ�x*�N��xe���lx��TyZy,�4b�y��qJ�z!�K/�z\\�r\n�zˇ6��ws���w����wܳ5��x\'��x�x��	a�y\'��I�y��k.�y��N\nBz-���Uw�>�JwQ�#�_ww����w���w�x$�/a x��{ITy\'��.}yA�o	�y����~�p����3q����rrڌ��s�v��Gu`\\��v5H���wU-ń�xR܆Oy`�F��z��ꅻz�s�{��u{Wu���{�_[��|	G��h|i,؃�|�/��}u�������\\�1�_���r�ك,��t����T^Q�k��FǂD��+����n��9�­�Ǐ*�1����ɂ|���q�\0�|sB���6]5�k�EՁJ�+,�x�~���(�T���a�؂\r���u�z���)��Qr���-\\5���TE\0�h��*x���	���}�0�����@���W���d��8�Eq�Z[Q���DD���)���D��=�D�I�7�ˀ��N�d��K� ��[p=D��Z���C�~��\")Q~��B�?����θڬ�&�2����`�N��os~��NY�~���C~w�p(�~^���~��ܾ�x����Ӿc��$����~��5n�~@�IYE~ �sB�~�0(y}�^�~&���\\�Wo��5��p�!�r���s.lˋ�tTW���u�@��v�&��;w�*�$y��X��yS�C�Gy����y����z?k֊_z�V��f{$@\n��{�%���{�ۈ�}i�I������]�����~׊S�ij̉7�U��J��?6����$��΀������,�M���ԋˋ>���j��}��*��i����T·>��>k���\r$P����Y�ف���K�I�˔8���o�-|��:�7h��1�kS߆a��=�����#��ċ�%�ʁs�������	�Y������{��y��gʆq�[S���1<�����#,��!���V�5����q������\rz��ٟ�g�՜{Rj����<u�J�>\"��0��Ճ\'�=���r�\'�@����	����z�V��fQ�P��QƄ���;��Ο_\"a���?����)� �\Z�������n�;��y]���e����QD���;�d�1!��\"���������o���spA���<qiu��<r�b��hs�N���t�8ԏ�u����v�\0\0�r{E�ʙ�x\'�җ=x��וx�t�\ryGa�;y�MЏ�zP8��z��5{\0\0��~���W�;�і	�ʅ�ۀes��a��M���7c���w���\0\0�r�\0���6�@���ƒǈ\rr��͇`��AL9����6��~���݅f\0\0�;�\0��.�q�Γ쑣�ˑЏ�q��܎3_F���K~���}6*������Њ�\0\0�0�\0�4�o�Ɣ\r�/�Q�\n���q$�\Z��^w�Z�hJʋߑ�5��Ő�#��\0\0�O�\0���ڦ.�R����J�z��ph����]ɌÚSJ6�F�?5%���ъ,��\0\0���\0��i�����1�����Foǎ��]-�D��I��ϟd4����������\0\0���\0������H��[�#����o8����\\��ةRI7�`�H4R�0��7��g\0\0���\0�R��n��<��o�{Y��p�j{�8q�X���sEn��t?0r�eu(��Mu(\0\0� ~i����w.����w�zÝ�w�i�x^W���x�Dݖ�yz/�*y����y�\0\0�\0�\0������}^z\n��\ri��~�WF�z~�D;�f~�/b�~�T�x\0\0��\0�J�e�J�\r�c�Dy���ShN�م�V��s��C��d�j.ޒ��+�>��\0\0�(�\0�~�|�݈C�|�BxG����gt���XUѕ��\ZB��{�5.l���ʓ�@\0\0�l�\0�ן��������zw��ߕWfɗ/�SU/����B{���@.�\'����F\0\0�΀\0�F�����(��w�D�\rf9���tT���AA�����-��m��a�8��\0\0�K�\0�Ξ��������Nv��Ҥ�e����T���QA����-X���9����\0\0���\0�u�b���;�k�)v\"�x�FeA����S��*�A/��:-�}�v���\0\0���\0���4n\0~W�{oo]�p/_y��qKN���rh<A�7sw\'͝�t$\r/��s�\0\0��\0�,�9vA~�zv�o\0��v�_\Z��wlN+��w�;��x�\'���x�\r:��x�\0\0�ŀ\0���\r~]}s�X}�n|��}�^��i}�M��V}�;y��}�\'3�W}�\r?�6~;\0\0�!�\0�0��g|Ϩ:�wmä���]�M��M�C��;\0���6&��5�-\r?���\0\0���\0������|4�M�\rm����]A�b��L��L��:�����&��1��\r?�\\�=\0\0�\Z�\0��A��{�����l����\\����9L	����:2�ݎ�&[�?�[\rB�\'��\0\0�\0�\0����� {@����l&�d�F\\H���K��ޖ\\9�.��&6�^��\rJ���\0\0�\0�\0�K�4��{����k���[��b�#KJ�9�99�����%�˙r\rJ�9��\0\0�\0�\0��谂z��3�*k�����[�����J��Ť�9N���%ȖQ��\rC����\0\0�\0�\0r��mlq��nic���oqT���p�D��`q�3��rx���r���?sm\0\0�\0�\03�uPqǴ�u�c���u�T���vbDv�	v�2�&wuĥ0w� �!x�\0\0�\0�\0~���|�qo��|�cE�g|^T3�h|TD*��|k2���|����|�r�6}�\0\0�\0�\0~�����q�q��bƮ=��Sʪ8�fCɦ��2r������b�����\0\0�\0�\0~L���8p��r��b[�>��SU�7��Ct����21������4�+����\0\0�\0�\0}���pO���@b�q��S�b�&C%���1�������#��!����\0\0�\0�\0}��i��p���aƫɗ�R�����B����1Ҡޔz~�.��N�x��\0\0�\0�\0}j���oد��Pa��=��R����B��\\�p1��J��f�|��y�v�\0\0�\0�\0}6���GoЯ+�Va����]Rd����B�����1�����v�ɔ���Ņ(\0\0�\0�\0r��Hl�e���m�X�9n�Iӷ�o�:u�p�)S�4q-���p�\0\0�)t{\0\0�\0�\0r��wtpeÿ�t�X:�t�I�u@:��vu�)��v!��u�\0��x�\0\0�\0�\0r��:{�e��r{EX&��z�Iֵ$z�:��{)���{8n��{\0���}.\0\0�\0�\0r����e��&��W�j�BI��Ҁ�:f����)�������0��!����\0\0�\0�\0rv�Ҋe_���W��E��Iu����:Q�s�Q)��G�I�����U�\0\0�\0�\0rQ���heJ���W��N�TIg���\":A�l�^)��!��\'�X����P\0\0�\0�\0r0�P��e?�b��W���\nIc�ϓ�:?����)��8�`�-�!G����\0\0�\0�\0r�Ӡ`e=�̞\ZW��՛�Id��:::�ҙ�)��}�y��M�:�����\0\0�\0�\0q��v�6eC�P��W��C�(Ik�w�k:E�)�Q)ЧʜE����R����\0\0�\0�\0ٵq�l��r�n7��to���uIq-��vkr�j�w�tRx�u�6zy�v�zyv�׷oWw��pp�xG�IrAx��Ks�y4�tt�y�i�vzQP�w4z�5hx!{>�x�z���m����o�g��p���r\0�I�s^��h�t���O�u�J4lv���wA\"�k�J��m�����o��:p��u~�r�1gWsv�N�t���3�ur���u�0�zj��o�;l@�̩Tm֔?��o^��}Rp⏔f%r^��M�s���2�tG�tԆ��&i�����k8�#�lϝ��an\\�Q|o�*e\nqh�?L�r���1�s?��\res��h��Ի�jg����k��+�Im���{o��d&p��3Lq��1:rZ��s���Gh��i˶�kS�Ð^l֫�z/nj��cWo��mKpqC��0�q���gry�bιg��`��ia�}�ajںc��lM�`ymmڮ�b�oh��J�p��P0\Zp��q��%�Zy�k��}zdmK��z�n�{hptyU{�q�b�||sJ�}t�/�}�v9dv7��w�v<�Wx�v䢤y-w���y�x\"xBz]x�a�z�yzI�{�z\Z.�|Iz�\nk}�z��ev*�䴮v怇�w��,�sxC�v�x��`�y��H�zZs.z�@	�|3~���t��z�uk�3�xv\'��v��u�w���__xx��G�y-��-0y��4	z�w�[s]���t*���t�ى�u���tev���^Hwf�-F�x ��,lxr���y̅��$r[�°bs,�ל�s�ވht���sJu��3]Kvt��Fw4��+�wk�z\"x݅��+q��~�fra�̛�s#���hs�3r]tϜ�\\}u��vEjvi��+,v��W�x�@�np��M��qǱٚ�r��1��sD��q�t&�M[�u��D�uɝ�*�uǚ#xwv�\r��p��6�q^��Rr	����r��p�s��+[t��D;u;�**u#��;v���n��j��1�8lx���n*�y��o�o���qMZp��r�C���tG)��uS<��v��L��t����u����evV�O�Kwn�Bw�Yp�Px�B��xyZ(.��y�Ȃzҹ~ͧ�~�~���~�~��$~�~�m�~�~�Xy~�~�A�\'~�\'n�~|b��~���}��զ\\}���}|����}��l�}��LWa}̄�@�}���&�~D��	H�Զm|Y��|P�8��|P��|]��kw|��-Vh|���?�|�%�}��~/���U{b���{^����{^�~u{n��jy{��<U�{ϑ?F|	�u%h|�\0~}A�\\�uz��I�\rz��&��z���}�z���i�zԚuT�{��>�{>��$�{*� I|}�9��z���Xz�Ə�y���|�z��h�z1��T\Zzy��>z���$zj�R{݂�\\y�� ��y����Vy���|y���h9y���S�y�A=�z\Z�|$y͘_�{^��؋�iڜ���k����~mpy���ofi��p�Q�br$;� s�!���tN\0\0��w$��se���tU��u2x��?veq��v�Q�w�;��xx ��jx�\0\0��{���j|ۚՇ{|��ن�}w���}!dq�4}FP)��}u:Q�r}� U��}�\0\0��~��ц��Z��������>�\0v����Scy���O\\�y�I9��8��ƃ���\0\0�o�\0���Ïۘ���������\"ub�g��bo�֊dNk�u�J8�2�n2�f�{\0\0�.�\0���י~�����~���0�\\to���3a���0M����x8E�E�R��X��\0\0� �\0���2�ȃE�����v��s���`ā7�&M\0�͕�7ǀv��Q�l�W\0\0�\0�\0�J����#��������&r�&��`���VLS�9��77ߛ����D\0\0�\0�\0��-�\Z���`�3�^�|��r<����_|���K���z6�X�y�\r�\0\0�\0�\0���iN�ԓ&k#�yl�n̐nj\\���o�I��qt3֍r����r�\0\0�z��쓔rZ���sM�\'t3m���u[čXu�HU�Ev�3(��w���\0w�\0\0��~��{N��b{}~!��{�m\0�X{�Z��\r|G��|_2~�c|�~�||l\0\0�Z�\0����+�����|��~�5l	���Y��ւXFΉӂ	1�0�����\0\0�\0�\0�&���,�\0��{��^��k����Y-����F����1Y��P��ƇX\0\0�\0�\0�R���Q�?���{7�~��j5���X^�ՏFEm�ԍ�0ˇ)�MI���\0\0�\0�\0������Z�0zy�͚�iz�^�=W��!�\nDՇ�[0^�W�������\0\0�\0�\0��h�̉��إ�y܊D��h܈ɟ�W���D@���I/慽�)���a\0\0�\0�\0����V���{��yV�ܫ9hN�R��V����CՆ��/��8�k�H�(\0\0�\0�\0�؞�ĥלLj�sߚl4cė�m�R��oI?씆p�+J��q�l��q/\0\0�\0}А@��qc�H�rQs<��s:c&��t\"Q�u?e�*u�*Ӓuvz8��u�\0\0�\0�\0���!yفu��zr}�mzMb`�Sz�Q=�jz�>ˑ�{@*Y�{q�/{%\0\0�\0�\0�Ϛ̂=���n��q��-�ya���&P{�7��>*����)ޏ ґ���\0\0�\0�\0�\0����ƗY��p����`����O֑�=����z)w���>���{\0\0�\0�\0�U�ƓG�x��p�<�@`\n���O3�3�`=%���j)\"���]�����\0\0�\0�\0�Ƙ��~��ϙ�o�����_z�`��N��u��<����(όؒ�i���k\0\0�\0�\0�U����~\"�R�Co\0���^��͜�N�ܚ�<&�O��(k�8�\ZK���W\0\0�\0�\0��=��}Ô���n�����^��V��M��[�Q;όƠ�(���!���7\0\0�\0�\0���h7v<��i�h�kxX�xl�H��nr6��5o�\"^��pZX��p \0\0�\0�\0���pguޤ�qGg���r,X��\'sH0��s�6g��t�\"+�Gu��tu1\0\0�\0�\0����xhu?��x�g\"��x�W��y=G��Ty�6\0�gy�!��z��gz�\0\0�\0�\0�\0�B�Pt��:�\0f_�N�WN���G�i5��)_!��uX����\0\0�\0�\0�d�%�Gs�$�xe��<��V��y��F����\\5��!Z�B���߃�\0\0�\0�\0�أK�_sh�N�e.�a��V����F���4Ȗ��!+�$�b̔`��\0\0�\0�\0�m����r�����d����U��ړME��Q��4w�<�[!�����\0\0�\0�\0����rß��d~��mUQ�,�8EP����4���a Ɠo��\0�\0\0�\0�\0ѡ��\\r}����d.���2T�����E�\r�-3ٓ��| ��ؖ\n�;�\0\0�\0�\0v���gi��8i\\���j�N��l>���m\\-=��nk���nl���p\0\0�\0�\0vZ��oRiʯ(p\\W��p�M��Tq�>p�^r�-:�Isj㣧sF��7ua\0\0�\0�\0v�|v�i`��w\\�Gw`M���w�>(��x--��x���xT^��zX\0\0�\0�\0u��~]h�}~[w��}�M4��}�=Ǣ�}�,Рj}��Z}����~�\0\0�\0�\0uD���h�X�.[�τ�L��m��=r�d��,��2�kٞ����;��\0\0�\0�\0t���h(�u�rZ���XL_�y�X=�h��,_��hҝ���#���\0\0�\0�\0t��e�=g����Zn�#�CL����<ԟ���,0�;�ڜ��YV�j�B\0\0�\0�\0t]�םg��-�;Z2���VKآ��<��억+뜓�v��Ɛ���S�d\0\0�\0�\0t.�~�g����Z.����K��]��<{�)��+뛾��њ������|\0\0�\0�\0j2�f�]λ@hP㷖ipC#�j�4*��k�#�>l�!�Hk�\0\0�s�\0\0�\0�\0i�=n2]Ϻ9n�P��Bo�CE�wpn4[�.q1#s�Jq����p�\0\0��x)\0\0�\0�\0iͼ�ud]���u�Pմ�u�C&��v4Q��v|#���v���v&\0\0��|\"\0\0�\0�\0i��r|k]a�f|P��]{�B�w{�4-�{�#���{�g��{�\0\0�h�\0\0�\0�\0iz�1�]5�#��PV��KB��+��4����#�������0��\0\0�l�\0\0\0�\0�\0iN�<��]���PD�\0��B��\r�3�����#��:��槫��\0\0���\0\0\0�\0�\0i)���]�G��P?���B���l3񨛍�#��2�E\"�Y��\0\0�߀\0\0\0�\0�\0i\r��Y]����PD�Y�UB��M�3�ǔ�#��^��?�Y��\0\0�H�\0\0\0�\0�\0h�����]#��IPQ���|B����%3��n#����\"V���\0\0���\0\0\0�\0�\0�PlmfD��n0hu��o�j���qcl�{r�n�dUtOp}Llu�rP1�v�s�\r�x1s��\\i�qT�Xk�rg�mm�sw��ogt�y�qu�c>r�v�Kas�w�0�t�xU�vtw�Ɉg�|`��i�|\\��k�|_�&m�|}x�oV|�bp�|�JYro}/�s+}!t�|�ǻe�P��h\n�P�j�`��k�w*m̓�`�o��/ITq��.�q���vs����dF�4�)f|�T��h��~�j���u�ln�_�nC��H`oA.p+�\n�rx�R��c\0�!��e?�p�8gU����iS�\nt�kG��^�m!�3G�n��)-in��\nhq��	öa����d@���*fU����hT�ks�jR�]�l3��F�m��T,�m˒�\np�����a<�	�\rc�ĜSe��L��g���r�i���\\�km�F$l��,Ol٘\\	�p���j`�����b��盲d����%f�Nrhکs\\]j¥>E�l7�>+�l\0��	mp�_��t�e`�u�g��lvqiwZk�rxBm�\\Zy,o�ESzq�+z�s�}s}�Fr=o��sfq;�Zturp��uvs�qvst�[jwqu�Dvx]v�*8yw��{[x��p.zk�>qrz���r�z��?s�{Bo�t�{�ZDu�{�Csv�|2)XwN|?zy�|l�)n]�ʨ�o��3�1p샖��r��nxsO��Y\'tx�B�un��(�u��.x��1��lя)�\'n2�Ô�o|�P�lp���mFq���X\Zs4�RA�t-�;\'�tD�y�wd�l�xk�����l��m��nM�#�Co���l0pِ�W)r��@�s�\'>r��Vgvރ���j����l�$��mT�In���kGo��V`q.�V@>r�8&�qޒ#\'wJ�|��i߮��>kL���l���~vmϣjwo\"�aU�pn�7?�q]��&Ip���w��Y�Vib�$��jɴ��#k���}�m/�>i�nz��Uoţg?p��\r%�p���w�=�p|�d��M}g�}TiW|�}�kgh�}�meTD~VoS>~�q$\0�r&��gt�Sz�n��3{\'p��{zqh{u{�r�g�|:s�SS|�u=8},v#C}�v���xq�x�x���yMy��y�y�zKz&z\0f�z�zvRf{z�<p{�{L\"�|{T}~+|W��w�g�sw��%�7x��x�x��re�y\'�&QZy���;�z:��!�zd�VK}���fu��@� v*�@��v��%w�w?�\0d�wׇ�Pfx}��:�x��+!Ix�� ~�êOti�2�	u�x��u���v�v#��c�v���O�wc�7:wߋ� �w���\0�~U���psx�/�%t����t��u�u5�eb�uڕ�N�v���9�v�( Qvs��\0�~�����r��9�ssb��+s裬t�tr�9bu�N+uǚx8�v,��uz��\0�~����\\rD�X��rⰊ��s[�btZsר8astv��M�u\"��8|u���wt��F\0�~рy���d���f�����h�r?�Gj�_��l�K��n�6�� pHe�ap�\0\0�Lv�����m����Eo	����pmq5��q�^ÂksK�Zt;5��}u8ȃouf\0\0�\0z�����vՑf��w��]�;x+p�x�]���yUJ8��y�5��zO7��z,\0\0�\0~:�f��%�3݀\"���oy�\\�d�I�f�4x~�\Z��W\0\0�\0�\0�;~��}�$~}��~P��m�~+�[�~�JH�~2��3�~B�\r\Z9~Y�\0\0�\0�\0�D}���$}e��~\n}:�l�}�wZ�}��G�}��3}$���|��f\0\0�\0�\0�}|��g�Y|��i}=|W�.l&|4��Z4|.��G4|8�\n2�|+�&q{ǎ�\0\0�\0�\0��{���{ܣU|�{��kkw{y�rY�{q��F�{���2{m�� zĐ�\0\0�\0�\0�}{���9{b�n{�{!��j�z�<X�zҢFz�\Z1�zƝ��y�\0\0�\0�\0�яc���e�w��yh g���j\'V��lC=�*m�.v�)oGȌ�o\0\0�\0z@��-lz�+��m�w��ohfˉ�p�UY�%rB���s?-߈}tb�}s�\0\0�\0}��1�_uG��Mvv�Hv�eԈdwpT}��x\ZAׇx�-I��y�x�\0\0�\0�\0�,��}����~$t��~5d��~;S��.~GA.��~U,˅v~T���~\0\0�\0�\0�0�L�̃�S�Ws��k��c����R��ل�@��\\�,[� ��w�胆\0\0�\0�\0�W�;���T�J��sC�`�wc\"���\'R$�̊�?�D�\0+҂����g�:\0\0�\0�\0���b�����x�r����9bg���FQm��?U�e�B+o�����\0\0�\0�\0� �����	�ٟ�q��â���PՂ7�Z>�����*��:�F����\0\0�\0�\0���E�����e�Wqc�b�Ea?�b�!PX����>V�\n�e*����5q�E��\0\0�\0�\0�|��czi��eYlD��gx\\�dirLI�kM:6� l�%ّ8n<��mt\0\0�\0}F�Ֆ�k�yϕmk��ing\\E��o�K��{q9���r\'%x�vr�.�rE\0\0�\0�\0� �Hs�xt�jґ�ud[{�QvK��v�9.��wt%��w���w}\0\0�\0�\0�H��|w���|Li̐]|sZ���|�JK��|�8���|�$��X|���}\0\0�\0�\0�o�]�Yw*���h����Yƍ��1I��A��8�Q��$8���g\n���\0\0�\0�\0���G��vr����h?���Y����I�.��7��%�[#���k\nىg�\0\0�\0�\0�&�t�Du�ݓ�g��;�bX�����Hk�M�h7�B��#�����\nƈ�I\0\0�\0�\0���֝�uv�B�g:����X����Gꉓ�\Z6����k#4��\n���>\0\0�\0�\0�Z�d��u�Τ[fˌ��W��g�/G����R6<��p\"�9��\n��F�(\0\0�\0�\0z���bpn�&d�`���f�R ��h�BX�jN0��k����l?ߘ�l�\0\0�\0�y��Aj{m���k�`4�mAQ��]n�B��o�0��Jp�f��q �q�\0\0�\0�\0yk��rXl�Bs!_���s�Q!��t�A���uh0D��u�6�u�R��wM\0\0�\0�\0xĞzl2��za^͙xz�P|�Xz�@앁{/Ӕ<{O��g{1t��|L\0\0�\0�\0x����k��r��^�5�vOȖ�-@h�4��/d�������������\0\0�\0�\0w�����j��s�8]��0�uO:�	��?�\"�/����������v�&\0\0�\0�\0w�ݑ�j�����]�X��N��+�H?m�@�N.Đʌ���e��Ǎ)�;\0\0�\0�\0v��E��jK���\\ݕ���Ns�a�?�e��.c����0���=Ռ�E\0\0�\0�\0vk�֢+j���{\\��\'�\\N�̜D>Ґě.\'�K���͒F؋R�F\0\0�\0�\0n�9a�b�]c�U:��e�Gi�;gW8M�h�\'6�j*�i�\0\0��nb\0\0�\0�\0m��i?a��j�T��Fk�G@��m*87�`nS\'?�1oq�-n�\0\0�-si\0\0�\0�\0m��p�a9��qsT���r7Fޢs7ퟹs�\'�rt.��s�\0\0��x0\0\0�\0�\0l���x`��xSS��,x�Fj�zx�7��3yA&ݜ�yl��2x�\0\0�0|c\0\0�\0�\0l(��l`8��PS���+E�&71��~�&��p~����~�\0\0��\0\0\0�\0�\0k�����_٣��wS%�ǅ�E���P6؛���&o�(������\0\0�ƀ\0\0\0�\0�\0kd���}_��ҍ�Rߟ猲E:���6����&;�%�J�����\0\0�ۀ\0\0\0�\0�\0k$��_T�&��R��3��D�_�Y6@����%�a�������\0\0�\'�\0\0\0�\0�\0j𤡝�_V����R�����D؛��V63���%��j�������\0���\0\0�\0�\0a��|`�U��|bRI���d<a��e�-���g%��Dg�\\��gk\0\0�Xr�\0\0�\0�\0a0��g�UǴOiI��j8<o�kf-嫟ld�\nl��	li\0\0�wn\0\0�\0�\0`�n�Uw��o�I]�rpE<C�Qq-֩�q��q�	\\��q�\0\0��{�\0\0�\0�\0`��du�U%�\ZvH���va<��v�-�� w�2w	��zw8\0\0��\0\0�\0�\0`h��|�T鯬|�H��]|�;��4|�-���|���|�	ꥈ}\0\0���\0\0\0�\0�\0`.�ڃ�TǮ���H��$�*;����-o�H��%���\n\'�̂9\0\0��\0\0\0�\0�\0_����T����}H����;���-]�1��+�މ \ne�J��\0\0�3�\0\0\0�\0�\0_ٰW�FT��ˑ~H��H�v;�����-K�A�e�쎼\n|��\0\0���\0\0\0�\0�\0_��ݙ�T��,��H�����;��4��-R�m�-3��N\n��\"�&\0\0�\0�\0\0\0�\0�\0�g_��i9b���k>e`�\"m$g�sin�ji]�p�l�F�rEo,�s&p�\nv*q� d%jѭKf�l���h�n,��j�o�rFl�q`\\�n�r�E�pItS+�p�u]	mthuk�Ia�u���d vN�f}v�sh�w�p�j�x\\[�l�yD�npy�+n�z\n�r�z-�w_K�]��a���Cdlȃ�f��o�iiZRkMC�l�)*Bl�~�vq�~���]U�� `�ܕ�b����ie��nRgb��Y5i���B�k9��)�k�\ZrY�?�q[�����^����pa-���1c���m-f��X<h7�B\Zi㊠(�i~���r�>�\\Zy�c��]V���j_����1bp��l=dޕ1Wjg\Z��Aqh���(`h��|sY���Y��\\b�|��^���_av�knc眙V�f,��@�gɗ\'\'�f�\"Ds���\nXԵ��~[��?�^D��~�`��!j�c�Ve`�~@Mf�\'neș_t�̳7n�_G��pOb1�q�d�~hr�gwj�t?i�U�u�lM?�v�nw&wZo�2{	q��l,i��{m�k��\0oPmP}kp�n�i�r p�Usxr2>�t�s�%Wutx�yruɰ1i�s���k~tߎ{m u�{�n�v�hzp0w`S�q�x.=�r�x�$�r�y&�y�zF��g�~�&if~-��k!~.z�l�~)g8ni~0R�o�~;=q~<#�p�~[zS~+�e��G��g����lii��y.k ��flхQ�nl�g<Ko���#0o�S&z�����d�}��f���Ag��Yxi���ekz�\ZP�m��;�n:��\"�m]��z����bܜ���d�r�Kf˗�wh���d%j\\�5P6k��&:�m��\"/k���{7��#a���c��鈄e٠�vVg��bc`ij�aO�k��:nl!�!�j����{j�֩�aE��FcT�[��e\"�Mu�fܥEb�h���N�jJ��9�kJ��!Oi����{��ť�w^Özw�a��4x\\dtt�yf�a�y�igNz�k�8�{fm��|;n�\0\0�\0r`�xtyh��ZuTj��v%lis�v�n\'`�w�o�M\"x�ql7�yfr�(y�sQ\0\0�\0w�6rrP�ssn��tttrht�uf_�u�vSLFv�w67w�w��w�x\0\0�\0{��o�{���q|O�Xr|�qs|�^�t%|�K<u}65u�}6�uw}\0\0�\0~��ln&���8oZ�;�pu��o�q��]�r���JUs��5|tM��js��o\0\0�\0�\0�Pl��V� m�>�o��n�p,��\\�qE�UI�rL�64�r�c�qˈK\0\0�\0�\0�mk���<lȗGm�?m�o�\'[�p.�4H�q7��4YqŎq�p]�X\0\0�\0�\0��j��ӎ�k�W~Xm��m5n��[6oB�+H0pR�3�pԕ:o5�z\0\0�\0�\0�Ti񬗎k=�r}�lT��l�m_�kZ�n}�MG�o��3Vo��x\Z�nG�\0\0�\0�\0�P�^Z�IpaF{xc�j�',0,0,0,0,0,0,NULL),(28,NULL,6,0,'Seminário 01','seminario01','<p>Semin&aacute;rio 01</p>','Professor 01','UTFPR - Campus Guarapuava','Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR - Brasil','2015-05-28 19:00:00','2015-05-28 21:00:00',30,'2015-05-23 12:30:00','2015-05-27 23:55:00',0,NULL,1,0,0,0,0,0,NULL),(29,NULL,6,1,'Palestra teste 05','palestrateste05','<ul>\r\n<li>pauta 1</li>\r\n<li>2</li>\r\n<li>3</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p>Teste01</p>','ministrante 01','UTFPR - Campus Guarapuava','Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR - Brasil','2015-06-15 19:00:00','2015-06-15 21:00:00',50,'2015-06-07 15:00:00','2015-06-14 23:59:00',32,NULL,0,0,0,0,0,0,NULL),(30,NULL,2,0,'Minicurso teste','minicursoteste','','Ministrante 1','UTFPR Guarapuava','Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR - Brasil','2015-07-03 20:00:00','2015-07-03 21:00:00',20,'2015-07-01 15:00:00','2015-07-02 23:55:00',0,NULL,0,0,0,0,0,0,NULL),(31,NULL,3,1,'Palestra teste 10','palestra-teste-10','<p>descricao</p>','Ministrante 1','UTFPR Guarapuava','Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR - Brasil','2015-07-19 17:00:00','2015-07-19 19:00:00',25,'2015-07-12 01:40:00','2015-07-18 23:55:00',10,NULL,1,0,0,1,0,1,NULL),(32,NULL,2,1,'Minicurso teste 86','minicurso-teste-85','','Ministrante 1','UTFPR Guarapuava','Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR - Brasil','2015-08-08 15:00:00','2015-08-08 17:00:00',30,'2015-07-29 08:00:00','2015-08-07 19:00:00',7,'����\0JFIF\0\0\0\0\0\0��\0*\0��ICC_PROFILE\0\0\0lcms\0\0mntrRGB XYZ �\0\0\0\0)\09acspAPPL\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0�-lcms\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ndesc\0\0\0�\0\0\0^cprt\0\0\\\0\0\0wtpt\0\0h\0\0\0bkpt\0\0|\0\0\0rXYZ\0\0�\0\0\0gXYZ\0\0�\0\0\0bXYZ\0\0�\0\0\0rTRC\0\0�\0\0\0@gTRC\0\0�\0\0\0@bTRC\0\0�\0\0\0@desc\0\0\0\0\0\0\0c2\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0text\0\0\0\0FB\0\0XYZ \0\0\0\0\0\0��\0\0\0\0\0�-XYZ \0\0\0\0\0\0\0\03\0\0�XYZ \0\0\0\0\0\0o�\0\08�\0\0�XYZ \0\0\0\0\0\0b�\0\0��\0\0�XYZ \0\0\0\0\0\0$�\0\0�\0\0��curv\0\0\0\0\0\0\0\Z\0\0\0��c�k�?Q4!�)�2;�FQw]�kpz���|�i�}���0����\0C\0		\n\n	\r\r\"##!  %*5-%\'2(  .?/279<<<$-BFA:F5;<9��\0C\n\n\n9& &99999999999999999999999999999999999999999999999999��\0��\0\"\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0[�\n�^(��^)=�])�UI�,}��VL��G��\ZWkʈ����|K�\Z�x����}B\0\0\0\0\0\0\0\0\0\0\0\0/�r$���\0�8��	p�IqO�o�Q��F}M=�O=eԸ��4�c?7o�MO����PMk1B\"@\0\0\0\0\0\0\0\0\0\0\0/��9��X{x�?<ֳt|�Y�4s�Mَ�\Z�S;>bқ��\r���\r�l����OuW�Í�\Z\0\0\0\0\0\0\0\0\0\0\0\0/�r$���\"J\"�\\�y>t����6�}喿���|���mC--��5�����naӞ��Իe����[��mYrk@+ \0\0\0\0\0\0\0\0\0\0\0�5�P-��P-��P-��P-��P-��ȸв���r$9c�x黲��P\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0e�E�U�VԒ���:�Vo���U�h\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�Ⱥ���Ҹ�R���c���҈e�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\02�\"��	3�KE�9t΀a�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0]ί\Z�Q�rE�*��8��j���I��қ;:{q#�P\0\0\0\0\0\0\0\0\0\0\0\0\0\0�yOw���1�+�)Ot��o9$�Q��5�&W�����e�8����t�ڀ\0\0\0\0\0\0\0\0\0\0\0\0\0\0/���?&ҹl���.Ƶű�Cv�[(/ �n6=�/�/$1�)��	%��ж����ڀ\0\0\0\0\0\0\0\0\0\0\0\0\0\"���Jko��;R,|��8�괭x��h6붞�n���^[�����؋j֓($�f�j�G��\\}|���\0\0\0\0\0\0\0\0\0\0\0\0\0\0�]i�Y�s}XW�5{�G�����1<���/&�r�5\'Z5��(�\"%�QY؛G�\n�\0\0\0\0\0\0\0\0\0\0\0\0\0E���e���Z=�:]o��mx���R����!\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0����Zg�	�UV~-S��+m�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0znk���G��,��r��\\U!��\\�l	\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��:���D�\\��,u�௪u�S���~���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0.���ѥ��][|umO�f}���I���a[\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0];}h�~c���qqe�p�Ŧ��y�m�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�Tu@�Tu@��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0-\0\0\0\0\0\0\012P !4\"$03#B����\0\0\0�\0��\"�k�Lr���-1�Lr���-1�Lr�����rێ[1�A<Tp��f=m�-1�n9i�Zc���9i�Zc�U��rg��%�f�⍵DD����Ţ٪pE��#x�Ƀ���9>-���PZ(�T��;N�/��0�O��i�&q/\0.�Yi���:��K���U�5>��� \'��`�ెĥ�O������U\Z��\0���@��!��Pv�\"g��%�f��\'Qe��9}���Qꏧ�[Ax�Ƀ���9>q�ޓT�%)~�4E�I�������Qƍ\\{��8��q+��\"����\Z�\Z���t����a4@z�\Z�k�k�ka�ӆk�k�j7[>㉑;2\'��3���࠷4̭.eis+K�Z\\���V�2����̭.eis+K�Z\\���V�2����̭.eis+K�ZM���HF;l�]\'t�5UK�[�7\\��\n�?�k�oo�n�o�oGH���������-����c����,�rߛ�����|�u��o���\0���囮_�~\r�_��t���/���/�c�yf��πu�����,Yȥ�N��Zc���9m�&��f=<x�[q�Lr�7��O�2�����¥7�OQe�E_HHu��l=��tB(z�ݎ��B�E�v�QuM�d�ᰍq�c#�O�f]#�|wo��\n��I0����r���&\'7�G�|�i`�\Z-4M���c�|H��_v��\\���A�Y-�_K?YX�\0Y7��Yp���;j��?���#aR��J\0ܺzCIH�f�W��dpI� e�L���\'fe�H������pk�\0��UQ���zK905���α���X,�1��AM���#2��o�Ԯ};u�~����%���P���ݍ�Ӵ��ֆ�4��9&\"D��;7�r)����H�k�����;m8�Z�K+ӫ̭.eis+K�Z\\���V�2����̭.eis+K�Z\\��,�����W�u�\r�����k�}Fz!Ǳvqc�9�h����<�:�M����\rP���me`��+�����&�䛈�.�s��3�m�;���V��oyU{����^��������U%����5j0H�e��\Z�W���^ҡ��n��\0:�\Z�TC�[��)��:ϫyf���ttT�$X�\n�v��!oRT{|�uɷ�@�`���ҳ�5�\\���tzyf�|w�0���Ձ�2l����=�G��7[O��ΘY�2�V�UG��7\\�m�J�3{�լ�m�܉�҇g�n�A\'��FZʴ�;���\Z�������̭.eis+K�Z\\���V�d,��\0�o��\0$\0\0\0\0\0\0\0\0\0!@1Ap Q`��\0?�Z�Ls�Ƀ�&^�9�<\r�F����$s\"K��D���v��#c�����$���o�-�x��\"1�,#��숢J���u�2��ݿ��{3�F)�d���n��n˶}Y1��Y���l�m��e2M��3�ZO\'#*��N�DtG�Q�Vr�N��B�ȷ,�\n�\08��aʷdI�\"��+d}n3ŒXGJd}n3\'Vu���\0&\0\0\0\0\0\0\0\0\0\0!1@\"2p #AQ`��\0?�W��b�,&�4l�4h���&��F<٨KS�\'�~X��0K�ș�F.��)Y���l�=&���2��c�%lFޥ��r�ܒ�{p�S�A�3w��d��T̞ر�\'�fE믈�q1Ó7�F�c5|ѠH�F4f��6�c%Q!��$����͍Y�}GFY�D%�9T섔�\Z.#�gw�K�#����c��#F�7Y����VAR!����c�)Ѻ,�JW�q�,Q�l{#D��#(�~�,Ԉ-r%����ʉ(�).�\0(�\0��\04\0\0\0\0\0\0\012!P�� qs0AB4CQa�#\"@b�����\0\0\0?�\0��RE��]��8ک��N6�q�S���mT�j�U8ک��N6�q�S���mW��}mT�j�U8ک��N6�q�S���mT�j�U8گ�	����A��A\n������\"���D�S)�>�쯦$�����_��bY�z��B�P�m�`�P�qW�����S}r\'�_LIuE���P�����\\[�f2Dko�u�[� y���2��bO�D�+�.���y\r��q,��bި�1��&;SX;���*��h�:*J��v�A�RU\'EI�P��RtT�RtT��P�NL8��a2��bO�D[\r���V6�X�chU��V6�X�chU��V6�X�chU��V6�X�chU��V6�X�chU��V6���p�At���\'s8�Ol��;���9�N�	���9�N憭=����f+Ol��;����9�N�j���n�����\0&W�+�ݍ�q�S���mT�j�U8ک��N6�q�S��1.�����9c�O������y�W�ʴv�V\0�P���㋀A�\n���?ʴv�V�S�.�����\0�yF#�*��;ʴv�T\0�P���&�Ԁ���J�sIc���9S�O���<��p\rA�x�>+�h휤2�fo�u����\"�M�M��r��]L9uQfQ@&C�K����*N��*J��\\�:*J��J��J��E���9@e2��n.�D��+H��D�\0��B�m\n��*�ЫB�m\n��*�ЫB�m\n��*�ЫB-/u#(}��×T\\�qW��\'���Y��-ħ?�C�j\0�P�ۋ��ׇŊ�a��DŪ��ԍ>���O�����<�q��Js�$:f͂� ?�|��S�_)�/����~��?e��|80~�g����c_�N6�q�_[U��_[U��Q>Ž�\'��A^!.�U��m���P�I^�{N%h��\"U��7_���9�N���(�����r�\0�h��\"�SW1^x�;g7	�4�K���r��:*N��x#��qX�chU��V6�X�chU��������\0%�\0��\0+\0\0\0\0\0\0\0\0\0!1Q��� APa���q��0�����\0\0\0?!���[X)m�2=[#ղ=[#ղ=[#ղ=[#ղ=[#ղ\'�dzG�dzVB�E��Y\r,�J����l�B��,�V��l�V��l�V�en�u�Jp�|���%�7o� kd� �,]�)�oQ\n�ce��Z��B�?^E�~��W��\Z ��p�%�x�FI�X���`�=�3f[�C�C�-N(H6!�x���)��<#+�\\�(���l����Ci!E�\"ʊ?Cj���\rA�xbHa��^\\���u綱�@�l�pJp�|���%	�7o��x$�Y��b�-vH��Kb[*�B�?^E�~��W��;J~ ���I9�f�4	��f@��ueE��lKpJp�|���%fi�cXB�x�\n��\r��f@D\r�{�	��lcHJ����)�\\ue�d����TajZi��\r���46����\ZC`hl\r\r���46����\ZC`hl\r\r���46��m�tz�ɩ�m<#�����q�l8!�-��f�s��q�l�I��(��s��q�n����M�����8m�Һ\Z�ϛ�ǀM7-!��iw>o����K��8�l��kw>o�ꆄ��ϖ%9d!z��Ocղ=[#Բ=K#вJ�\Z�Y�e��Y	Wa���,[\rlE��.F�s吢��ڪ� ���^��!=�65�#��\\i�>V�吆�b[���ጫ�m\Z��X��\"�*�TvFX���3O��QG�myE+F^!����4�\rnW�=�n)le�����|�)�!&ķ�Lǔh�����XS�E=Y��R@�\n�h7�K�W��G�mAi�Ġ�䈑��R�(�8��U�l�K�ŀ�r9b%(EcG��,�#���\"��k��4\"����q12N\0��LTbe|DD���BF����N���@	_�)r�O�6���#��`DM�p�L�?�㞌�)�QV�l��G����9-�D�l�.�NI��1Jc%��\n�\r\r���46����\ZC`hl\r\r���56�����&�S�(r��`v%r�\"���	j��QY�o�sRS�B]�oC�DuTP�[qg�<�8��O\Z�Y���Ͱ\"��ʚ�R��[���q+�N��Q��w�[��Z����Hׁ��5&�����i�M/�r+QN��J+��ɐ�e��Y\ne>�GW����du�Y	��t�/�o����b�X���9p�A����֟7󇏠E���SC��U�J`�/5{�7��\"Q�\"�diU��!`��|��شҴ���VD�U�)��T$�4{�7�@C�14�W8�Ft;�7��\n2�Ԭ\n5��V@66����p�Q�	e�r����,=�wW�]7N|�W\ZC`hl\r\r���46�	���K�\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0*�=�{�a�:�\n\0\0\0\0\0\0\0\0\0\0\0\0\0��8���#@\0\0\0\0\0\0\0\0\0\0\0\0�\0��3���y�h\0\0\0\0\0\0\0\0\0\0\0\0Pþ��o�-��-J\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�f�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0G��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�ʀ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0:{F\"�n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0K������\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�Ŗs��_/\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0}�nq+��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0xI�<���\0\0\0\0\0\0\0\0\0\0\0\0\0\0�<F�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�{��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 �Og\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�qh\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\"�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0\0\0\0\0\0\0!1@A Qp`��\0?�V�����.Z\Z�Ĉ��0�\\_�|��\r��[-������\\;lXI��>�#��B�����<�3ѱt�����ii��lgM�,~˚*�g����~�ۄcBW.H�շ�$��e6�c[�c��p��~�ޟ*�kG#\r�� ��|A@<�R@�仰���5l����qa�H��}�.�\'Uu{�u.\"�W���u�h��G��\0\0\0\0\0\0\0\0\0!1@Ap `��\0?�Ng��or}	P<�d���8��wg\"٩��8���Yܴ��*C�,s�[,����F��5�߮-�����-��2l ��=��:����K[�x=���dz��ck݇V��~p�\"� ��.o�����9]�m\0G�_7*�m����l^o�n����-F�Y��P-��VRRc�lΒ���A��d��\rrŰ$�&q��c��n�gi0\'ш��f;JGad�����\0,\0\0\0\0\0\0!1APQa��� q����0�@�����\0\0\0?�\0P�����I*Ɵ�СB�\n(ѡ4�R�u��`-0�<D[�;$k���\n(Vŉ�hho�b\0��\0�	�ÿ޹���TýL]Ar�/\r`�h��ܴF%�3������\\}w�м��Ǯ�!IM_I�KO\n��%�l\\�\"a;1b8[\0]�q�*$��e1(N��H`.��������xN��\0C����;�럩�;�dp��튭8��&8g+���v��0�\\>�?r�1j��h>���^o�c�^�$���jQ\r����s��6vD%��F����M�30��G�%��e�8u��1�0	�\\`p��]��s��,��\0��>�|/�l��Z�\\��a�\Z�	�v��\'��p�߯B�x>��%5} ����$�l0��ff�`�Q�T04Bh����(b#!b0��,6.\r~��q��t$������r��\"_�@7�`uꢿ�4!Ыh�o��tg�/�@���\0*�D��ґ������Q�>*\\���T���&	�(bk ��g�~��\0�}�k�-�ק^�z��ק^�z��ׯ,��̨�p-��o4DIz��(\\���UO�׫�g�u���0&�g�ɕDxjԊӫ��|�飘�!���:�/l������n�L+���>g�A�Go���i�X��3�#�>>�[>α��>g�K���`v�]]/l�������g����{t	^���\'M��\0��p�B������gƋ$����X��!%�pq1%^�v�0��M���\\�=7�Kj�Q\\�)H��d�L,�O8��Q����LA,��)8�\0�`$й7���\\�I�@��9��T�g(εU��&د��@�C�J�II(�����Ck�)y�!�M�E�ڢ*%5�����V��XL�QvC	gb:��Ǧ��S~�\\�cE�X�~ ���8�\0�a��.�\0[��2蘫���eO��lk�\Z\Z�6�\\MhI��L��XE�K*�1���X��m ����M�=7��z���ۖ,Hl{�<k��������)��*�0�9!�vntA\r\\��9s4\npy�8�.���\0+A�9w��Lߴ��?*�!�	�1���_>SXڀ�V0B�*�ᇍ\r�VVewq���W$�N�!�Ҧ]�I�c�~������9t���xq�!�\\K��*�4-�*�����#We������~�1>|7��?n�l�ؤ���xT0t��\0+Q�9w��CC�Ga�32�\"��� Č傩]ʓ�=��f\\~�N�y��ӯ^����1QE%��H�C��\r�/hUWs��e�C���+�Q|��#@�X_&`:��\0V0�r��������6��fr�HZڅCq���F2Q/��~�~��xC��x0ð�/�@���d�ܽ.)#T�%N/��L�ugBR��[�7��\"y���\0��J��Dwlɴ�*��\0�V�G�)�;������3D�=��\"Y�ul�� )ݜG~b��/W�ʇ��`o�����1YP�`[�h��\r�����p�*EW�x���S��k�(m����*��p��-\\��r���:�`b�A��%*��+�,�%*��K`�e!����>a���	QN\r�n��X��d�\\���]A4�j����(�*�]�-�mܷ2����2��-Ri������rO�����2�������ln*���ֽz��ך��E�[_�_��',0,0,0,0,0,0,15.5);
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_bonus`
--

DROP TABLE IF EXISTS `event_bonus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_bonus` (
  `id_event_bonus` int(11) NOT NULL AUTO_INCREMENT,
  `id_event_type` int(11) NOT NULL,
  `id_event` int(11) NOT NULL,
  `quantity` smallint(6) NOT NULL,
  PRIMARY KEY (`id_event_bonus`),
  UNIQUE KEY `id_event_id_event_type_UQ` (`id_event`,`id_event_type`),
  KEY `fk_event_bonus_event_type1_idx` (`id_event_type`),
  KEY `fk_event_bonus_event1_idx` (`id_event`),
  CONSTRAINT `fk_event_bonus_event1` FOREIGN KEY (`id_event`) REFERENCES `event` (`id_event`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_bonus_event_type1` FOREIGN KEY (`id_event_type`) REFERENCES `event_type` (`id_event_type`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_bonus`
--

LOCK TABLES `event_bonus` WRITE;
/*!40000 ALTER TABLE `event_bonus` DISABLE KEYS */;
INSERT INTO `event_bonus` VALUES (4,2,21,2),(5,3,21,1),(6,4,21,3),(9,2,23,1),(10,3,23,2),(25,1,32,0),(26,2,32,0),(27,3,32,1),(28,4,32,0),(29,6,32,0);
/*!40000 ALTER TABLE `event_bonus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_organizer`
--

DROP TABLE IF EXISTS `event_organizer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_organizer` (
  `id_event_organizer` int(11) NOT NULL AUTO_INCREMENT,
  `id_event` int(11) NOT NULL,
  `id_administrator` int(11) NOT NULL,
  PRIMARY KEY (`id_event_organizer`),
  KEY `fk_event_organizer_event` (`id_event`),
  KEY `fk_event_organizer_administrator` (`id_administrator`),
  CONSTRAINT `fk_event_organizer_administrator` FOREIGN KEY (`id_administrator`) REFERENCES `administrator` (`id_administrator`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_organizer_event` FOREIGN KEY (`id_event`) REFERENCES `event` (`id_event`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_organizer`
--

LOCK TABLES `event_organizer` WRITE;
/*!40000 ALTER TABLE `event_organizer` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_organizer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_type`
--

DROP TABLE IF EXISTS `event_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_type` (
  `id_event_type` int(11) NOT NULL AUTO_INCREMENT,
  `event_type` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `teacher_type` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_event_type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_type`
--

LOCK TABLES `event_type` WRITE;
/*!40000 ALTER TABLE `event_type` DISABLE KEYS */;
INSERT INTO `event_type` VALUES (1,'Semana Acadêmica','Coordenador','semana_academica'),(2,'Minicurso','Professor','minicurso'),(3,'Palestra','Palestrante','palestra'),(4,'Sem Inscrição','','sem_inscricao'),(6,'Outro','Organizador','outro');
/*!40000 ALTER TABLE `event_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id_media` int(11) NOT NULL AUTO_INCREMENT,
  `media_type` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `id_event` int(11) DEFAULT NULL,
  `label` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_media`),
  KEY `fk_media_event` (`id_event`),
  CONSTRAINT `fk_media_event` FOREIGN KEY (`id_event`) REFERENCES `event` (`id_event`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (12,'p',11,'Logo Semana Acadêmica TSI','/pi2_integrador/media/image/event/event11_image1.jpg'),(13,'p',13,'Logo minicurso Linux','/pi2_integrador/media/image/event/event13_image1.png'),(14,'p',14,'Logo - Palestra sobre mercado de trabalho','/pi2_integrador/media/image/event/event14_image1.jpg'),(15,'p',17,'Inauguração UTFPR-GP','/pi2_integrador/media/image/event/event17_image1.jpg'),(16,'p',15,'Logo - Mostra de Talentos','/pi2_integrador/media/image/event/event15_image1.jpg'),(18,'v',32,'UTFPR Guarapuava 3 anos','https://www.youtube.com/watch?v=tkOsLyMDFao'),(19,'p',15,'III Mostra de Talentos UTFPR Guarapuava','/pi2_integrador/media/image/event/event15_image2.jpg'),(20,'p',32,'about3','/pi2_integrador/media/image/event/event_image1.png'),(21,'p',32,'1622820_722386101127823_1053116192_n','/pi2_integrador/media/image/event/event_image1.jpg');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id_news` int(11) NOT NULL AUTO_INCREMENT,
  `id_event` int(11) DEFAULT NULL,
  `creation_date` datetime NOT NULL,
  `modification_date` datetime NOT NULL,
  `title` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `subtitle` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `path` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_news`),
  KEY `fk_news_event` (`id_event`),
  CONSTRAINT `fk_news_event` FOREIGN KEY (`id_event`) REFERENCES `event` (`id_event`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (3,13,'2014-07-23 12:57:00','2014-07-23 12:57:00','Semana Acadêmica de TSI terá minicurso sobre Linux','Na IV Semana Acadêmica de Tecnologia em Sistemas para Internet haverá um minicurso sobre o sistema operacional Linujx','<p>Na IV Semana Acad&ecirc;mica de Tecnologia em Sistemas para Internet haver&aacute; um minicurso sobre o sistema operacional Linujx</p>',0,NULL),(4,14,'2014-07-23 17:09:00','2015-03-13 13:25:00','S. A. de TSI terá palestra sobre mercado de trabalho','A IV Semana Acadêmica de TSI terá uma palestra que falará sobre a relação entre o profissional de TI e o mercado de trabalho.','<p>A IV Semana Acad&ecirc;mica de TSI ter&aacute; uma palestra que falar&aacute; sobre a rela&ccedil;&atilde;o entre o profissional de TI e o mercado de trabalho.</p>',12,NULL),(5,32,'2014-12-18 21:51:00','2015-08-18 00:32:00','Noticia teste','Noticia teste subtitulo','<p>Noticia teste descricao</p>',15,NULL);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participant`
--

DROP TABLE IF EXISTS `participant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participant` (
  `id_participant` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `cpf` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `rg` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `birthday` date DEFAULT NULL,
  `id_city` int(11) NOT NULL,
  `address` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `number` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `district` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zipcode` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `complement` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone2` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `id_participant_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_participant`),
  KEY `fk_participant_city` (`id_city`),
  KEY `fk_participant_participant_type1_idx` (`id_participant_type`),
  CONSTRAINT `fk_participant_city` FOREIGN KEY (`id_city`) REFERENCES `city` (`id_city`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_participant_participant_type1` FOREIGN KEY (`id_participant_type`) REFERENCES `participant_type` (`id_participant_type`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant`
--

LOCK TABLES `participant` WRITE;
/*!40000 ALTER TABLE `participant` DISABLE KEYS */;
INSERT INTO `participant` VALUES (4,'Participante TesteA','30145144119','1234567890','M','1995-10-10',1,'rua 1','111','bairro 1','77777777','complemento 1','55555555555','77777777777','teste5@teste505.com','c33367701511b4f6020ec61ded352059',NULL,1,1),(6,'Participante TesteC','79875886955','1234567890','M','1993-05-05',1,'Rua 3','333','bairro 3','33333333','','88888888888','77777777777','teste9@teste99.com','e10adc3949ba59abbe56e057f20f883e',NULL,1,2),(7,'Participante TesteD','22540907989','1234567890','F','1989-02-27',1,'Rua 4','444','Rua 4','44444444','complemento 4','8765432100','00112233445','teste11@teste11.com','25d55ad283aa400af464c76d713c07ad',NULL,0,1),(8,'Participante TesteE','82550675665','1234567890','M','1996-07-08',1,'Rua 5','555','Bairro 5','55555555','','5874445555','44488875474','teste4@teste4.com','25d55ad283aa400af464c76d713c07ad',NULL,1,1);
/*!40000 ALTER TABLE `participant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participant_type`
--

DROP TABLE IF EXISTS `participant_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participant_type` (
  `id_participant_type` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `code` varchar(15) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_participant_type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant_type`
--

LOCK TABLES `participant_type` WRITE;
/*!40000 ALTER TABLE `participant_type` DISABLE KEYS */;
INSERT INTO `participant_type` VALUES (1,'Acadêmico','student','Estudante da UTFPR (Possui R.A.)'),(2,'Servidor','employee','Servidor da UTFPR'),(3,'Visitante','visitor','Não é acadêmico nem servidor da UTFPR');
/*!40000 ALTER TABLE `participant_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_type`
--

DROP TABLE IF EXISTS `payment_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_type` (
  `id_payment_type` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_payment_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_type`
--

LOCK TABLES `payment_type` WRITE;
/*!40000 ALTER TABLE `payment_type` DISABLE KEYS */;
INSERT INTO `payment_type` VALUES (1,'Pagseguro','pag_seguro');
/*!40000 ALTER TABLE `payment_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setting` (
  `id_setting` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) NOT NULL,
  `value` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_setting`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting`
--

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
INSERT INTO `setting` VALUES (1,'site_title','UTFPR Eventos'),(5,'themes_name','Padrão, UTFPR'),(6,'themes_path','default, /app/resources/css/utfpr.css'),(7,'current_theme_name','Padrão'),(8,'current_theme_path','default'),(17,'contact_mail','email3@email321.com'),(18,'header_title_banner','media/img/header_title_banner.png'),(19,'maintenance_status','0'),(20,'maintenance_message','site offline'),(21,'google_maps_api','teste5'),(22,'mail_host','smtp.gmail.com'),(23,'mail_port','587'),(24,'mail_username','ghpk88@gmail.com'),(25,'mail_password','wsk9732fn88');
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponsor`
--

DROP TABLE IF EXISTS `sponsor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sponsor` (
  `id_sponsor` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `web_address` varchar(80) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_sponsor`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsor`
--

LOCK TABLES `sponsor` WRITE;
/*!40000 ALTER TABLE `sponsor` DISABLE KEYS */;
INSERT INTO `sponsor` VALUES (5,'Escola 011','www.escola01.com.br','Descrição da escola 01'),(6,'Universidade 01','www.universidade01.com.br','Descrição da universidade 01'),(7,'Empresa 01','www.empresa01.com.br','Descrição da empresa 01'),(8,'Universidade 02','www.universidade02.com.br','Descrição da universidade 02'),(9,'Escola 02','www.escola02.com.rb','Descrição de escola 02'),(10,'Empresa 02','www.empresa02.com.br','Descrição da empresa 02'),(11,'Empresa 03','www.empresa03.com.br','Descrição da empersa 03');
/*!40000 ALTER TABLE `sponsor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponsorship`
--

DROP TABLE IF EXISTS `sponsorship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sponsorship` (
  `id_sponsorship` int(11) NOT NULL AUTO_INCREMENT,
  `id_event` int(11) NOT NULL,
  `id_sponsor` int(11) NOT NULL,
  PRIMARY KEY (`id_sponsorship`),
  KEY `fk_event_sponsor_event` (`id_event`),
  KEY `fk_event_sponsor_sponsor` (`id_sponsor`),
  CONSTRAINT `fk_event_sponsor_sponsor` FOREIGN KEY (`id_sponsor`) REFERENCES `sponsor` (`id_sponsor`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsorship`
--

LOCK TABLES `sponsorship` WRITE;
/*!40000 ALTER TABLE `sponsorship` DISABLE KEYS */;
INSERT INTO `sponsorship` VALUES (143,19,7),(144,19,9),(151,18,7),(152,18,8),(153,18,11),(155,17,11),(158,23,6),(159,23,10),(160,23,11),(172,32,6),(173,32,7);
/*!40000 ALTER TABLE `sponsorship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state` (
  `id_state` int(11) NOT NULL AUTO_INCREMENT,
  `state` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_state`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (1,'PR');
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-31 12:52:39
