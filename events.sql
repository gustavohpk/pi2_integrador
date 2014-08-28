-- MySQL dump 10.13  Distrib 5.5.38, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: events
-- ------------------------------------------------------
-- Server version	5.5.38-0ubuntu0.12.04.1

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
  `rg` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cpf` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `phone2` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_administrator`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES (3,'Gustavo Pchek','ghpk88@gmail.com','e10adc3949ba59abbe56e057f20f883e',NULL,'08839621954','5555555',NULL);
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cost_event`
--

LOCK TABLES `cost_event` WRITE;
/*!40000 ALTER TABLE `cost_event` DISABLE KEYS */;
INSERT INTO `cost_event` VALUES (1,11,'2014-08-20',15),(2,11,'2014-09-19',20),(4,13,'2014-09-19',5),(5,14,'2014-09-19',5),(6,18,'2014-09-12',15),(7,18,'2014-09-19',20);
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
  `uri_payment` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attendance` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_enrollment`),
  KEY `fk_enrollment_participant` (`id_participant`),
  KEY `fk_enrollment_event` (`id_event`),
  KEY `fk_enrollment_payment_type` (`id_payment_type`),
  CONSTRAINT `fk_enrollment_event` FOREIGN KEY (`id_event`) REFERENCES `event` (`id_event`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_enrollment_participant` FOREIGN KEY (`id_participant`) REFERENCES `participant` (`id_participant`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_enrollment_payment_type` FOREIGN KEY (`id_payment_type`) REFERENCES `payment_type` (`id_payment_type`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment`
--

LOCK TABLES `enrollment` WRITE;
/*!40000 ALTER TABLE `enrollment` DISABLE KEYS */;
/*!40000 ALTER TABLE `enrollment` ENABLE KEYS */;
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
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `details` longtext COLLATE utf8_unicode_ci NOT NULL,
  `teacher` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `local` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `spaces` int(11) NOT NULL,
  `start_date_enrollment` datetime NOT NULL,
  `end_date_enrollment` datetime NOT NULL,
  PRIMARY KEY (`id_event`),
  KEY `fk_event_event` (`id_parent_event`),
  KEY `fk_event_event_type` (`id_event_type`),
  CONSTRAINT `fk_event_event` FOREIGN KEY (`id_parent_event`) REFERENCES `event` (`id_event`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_event_type` FOREIGN KEY (`id_event_type`) REFERENCES `event_type` (`id_event_type`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (11,NULL,1,'Semana Acadêmica TSI 2014','<p>descricao teste 1</p>','ministrante 1','UTFPR - Câmpus Guarapuava - Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR','2014-09-22 19:00:00','2014-09-26 22:00:00',150,'2014-07-23 00:00:00','2014-09-19 23:55:00'),(13,NULL,2,'Minicurso sobre Linux','<p>Minicurso sobre Linux</p>','ministrante 01','UTFPR - Câmpus Guarapuava - Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR','2014-09-23 19:00:00','2014-09-23 21:00:00',25,'2014-07-23 00:00:00','2014-09-19 23:55:00'),(14,NULL,3,'Palestra: O Mercado de Trabalho e o Profissional de TI','<p>palestra 1</p>','ministrante 01','UTFPR - Câmpus Guarapuava - Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR','2014-09-24 19:00:00','2014-09-24 21:00:00',100,'2014-07-23 00:00:00','2014-09-19 23:55:00'),(15,NULL,5,'III Mostra de Talentos UTFPR Guarapuava','<p>OBS.: Inscri&ccedil;&atilde;o necess&aacute;ria apenas para quem ser apresentar&aacute;.<br /><br />Enviar um e-mail para <a href=\"mailto:gadir-gp@utfpr.edu.br\">gadir-gp@utfpr.edu.br</a> com os seguintes dados:</p>\r\n<ul>\r\n<li>C&oacute;digo da inscri&ccedil;&atilde;o (gerado ap&oacute;s a finaliza&ccedil;&atilde;o)</li>\r\n<li>Nome completo e turma dos integrantes</li>\r\n<li>Nome da m&uacute;sica/apresenta&ccedil;&atilde;o</li>\r\n<li>Tempo aproximado da apresenta&ccedil;&atilde;o</li>\r\n</ul>\r\n<p>Ap&oacute;s a an&aacute;lise da equipe organizadora sua inscri&ccedil;&atilde;o ser&aacute; confirmada ou cancelada.</p>','nenhum','UTFPR - Câmpus Guarapuava - Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR','2014-04-14 19:00:00','2014-04-14 22:00:00',15,'2014-04-01 00:00:00','2014-04-12 23:55:00'),(16,NULL,4,'Lançamento do site de eventos da UTFPR Guarapuava','<p>aaa</p>','nenhum','UTFPR - Câmpus Guarapuava - Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR','2014-07-23 19:25:00','2014-07-23 22:30:00',50,'2014-07-23 18:00:00','2014-07-23 18:01:00'),(17,NULL,4,'Inauguração do Campus Guarapuava','<p>aaa</p>','Nenhum','UTFPR - Câmpus Guarapuava - Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR','2014-05-23 10:00:00','2014-05-23 11:30:00',80,'2014-05-23 10:00:00','2014-05-23 10:01:00'),(18,NULL,6,'Churrasco da Semana Acadêmica de TSI','<p>churrasco tsi</p>','Ministrante 1','Acre/Unicentro - R. Francisco de Assis, 304 - Boqueirão, Guarapuava - PR, 85023-230','2014-09-26 19:00:00','2014-09-26 23:00:00',150,'2014-07-23 00:00:00','2014-09-19 23:55:00');
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
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
  PRIMARY KEY (`id_event_type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_type`
--

LOCK TABLES `event_type` WRITE;
/*!40000 ALTER TABLE `event_type` DISABLE KEYS */;
INSERT INTO `event_type` VALUES (1,'Semana Acadêmica','Coordenador'),(2,'Minicurso','Professor'),(3,'Palestra','Palestrante'),(4,'sem_inscricao',''),(5,'sem_pagamento',''),(6,'Outro','Organizador');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (12,'p',11,'Logo Semana Acadêmica TSI','/pi2_integrador/media/image/event/event11_image1.jpg'),(13,'p',13,'Logo minicurso Linux','/pi2_integrador/media/image/event/event13_image1.png'),(14,'p',14,'Logo - Palestra sobre mercado de trabalho','/pi2_integrador/media/image/event/event14_image1.jpg'),(15,'p',17,'Inauguração UTFPR-GP','/pi2_integrador/media/image/event/event17_image1.jpg'),(16,'p',15,'Logo - Mostra de Talentos','/pi2_integrador/media/image/event/event15_image1.jpg'),(18,'v',17,'UTFPR Guarapuava 3 anos','https://www.youtube.com/watch?v=tkOsLyMDFao'),(19,'p',15,'III Mostra de Talentos UTFPR Guarapuava','/pi2_integrador/media/image/event/event15_image2.jpg');
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
  PRIMARY KEY (`id_news`),
  KEY `fk_news_event` (`id_event`),
  CONSTRAINT `fk_news_event` FOREIGN KEY (`id_event`) REFERENCES `event` (`id_event`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,11,'2014-07-13 18:47:00','2014-07-23 16:19:00','Programação da IV Semana Acadêmica de TSI','A programação da IV Semana Acadêmica do curso de Tecnologia em Sistemas para Internet foi divulgada.','<p>A programa&ccedil;&atilde;o da IV Semana Acad&ecirc;mica do curso de Tecnologia em Sistemas para Internet foi divulgada.<br /><br />A semana ter&aacute; palestras e minicursos sobre diversos assuntos relacionados ao curso de TSI.</p>'),(2,16,'2014-07-13 19:01:00','2014-07-23 13:19:00','Lançamento do site de eventos da UTFPR Guarapuava','O site de eventos da UTFPR Guarapuava foi ao ar na última sexta feira (18), veja detalhes ','<p>O sistema de eventos da UTFPR Guarapuava foi ao ar na &uacute;ltima sexta feira, dia 18.<br /><br />O site &eacute; dividido em algumas &aacute;reas. Na &aacute;rea <strong>PR&Oacute;XIMOS EVENTOS</strong> &eacute; poss&iacute;vel visualizar e inscrever-se nos futuros eventos da UTFPR. E na &aacute;rea&nbsp;<strong>EVENTOS ANTERIORES</strong> estar&atilde;o os eventos que j&aacute; ocorreram.<br /><br />Na parte de&nbsp;<strong>NOT&Iacute;CIAS</strong> ser&atilde;o divulgadas informa&ccedil;&otilde;es e novidades sobre os eventos da UTFPR. E h&aacute; tamb&eacute;m&nbsp;a &aacute;rea de <strong>FOTOS E V&Iacute;DEOS</strong> e a &aacute;rea de <strong>CONTATO</strong>.<br /><br />Para inscrever-se em um evento &eacute; necess&aacute;rio criar uma&nbsp;<strong>NOVA CONTA</strong>. Ap&oacute;s criada, voc&ecirc; pode inscrever-se nos eventos e acessar o <strong>PAINEL DO</strong> <strong>USU&Aacute;RIO</strong>, onde &eacute; poss&iacute;vel visualizar o status das inscri&ccedil;&otilde;es, alterar seus dados e gerar certificados.<br /><br />Al&eacute;m disso, h&aacute; a &aacute;rea de <strong>BUSCA</strong>&nbsp;na lateral direita da p&aacute;gina inicial, para facilitar a procura por eventos e not&iacute;cias.<br /><br />Seja bem vindo!</p>'),(3,13,'2014-07-23 12:57:00','2014-07-23 12:57:00','Semana Acadêmica de TSI terá minicurso sobre Linux','Na IV Semana Acadêmica de Tecnologia em Sistemas para Internet haverá um minicurso sobre o sistema operacional Linujx','<p>Na IV Semana Acad&ecirc;mica de Tecnologia em Sistemas para Internet haver&aacute; um minicurso sobre o sistema operacional Linujx</p>'),(4,14,'2014-07-23 17:09:00','2014-07-23 17:10:00','S. A. de TSI terá palestra sobre mercado de trabalho','A IV Semana Acadêmica de TSI terá uma palestra que falará sobre a relação entre o profissional de TI e o mercado de trabalho.','<p>A IV Semana Acad&ecirc;mica de TSI ter&aacute; uma palestra que falar&aacute; sobre a rela&ccedil;&atilde;o entre o profissional de TI e o mercado de trabalho.</p>');
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
  PRIMARY KEY (`id_participant`),
  KEY `fk_participant_city` (`id_city`),
  CONSTRAINT `fk_participant_city` FOREIGN KEY (`id_city`) REFERENCES `city` (`id_city`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant`
--

LOCK TABLES `participant` WRITE;
/*!40000 ALTER TABLE `participant` DISABLE KEYS */;
INSERT INTO `participant` VALUES (3,'Gustavo Henrique Pchek Kwaczynski','08839621954','10.665.568-5','M','1994-08-30',1,'Rua Coroados','99999','Vila Carli','85040220','','4236244109','','ghpk88@gmail.com','735fa1ff956d1a2c5094a7bb59aae10f');
/*!40000 ALTER TABLE `participant` ENABLE KEYS */;
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
  PRIMARY KEY (`id_payment_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_type`
--

LOCK TABLES `payment_type` WRITE;
/*!40000 ALTER TABLE `payment_type` DISABLE KEYS */;
INSERT INTO `payment_type` VALUES (1,'Pagseguro');
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
  PRIMARY KEY (`id_setting`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting`
--

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
INSERT INTO `setting` VALUES (1,'site_title','UTFPR Eventos'),(2,'favicon','media/img/favicon.png'),(5,'themes_name','Padrão, UTFPR'),(6,'themes_path','default, /app/resources/css/utfpr.css'),(7,'current_theme_name','Padrão'),(8,'current_theme_path','default'),(9,'banner1_name','Banner 1'),(10,'banner1_path','media/image/banner/banner1.png'),(11,'banner2_name','Banner 2'),(12,'banner2_path','media/image/banner/banner2.png'),(13,'banner3_name','Banner 3'),(14,'banner3_path','media/image/banner/banner3.png'),(15,'banner4_name','Banner 4'),(16,'banner4_path','media/image/banner/banner4.png'),(17,'contact_mail',NULL),(18,'header_title_banner','media/img/header_title_banner.png');
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
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

-- Dump completed on 2014-07-23 16:18:16
