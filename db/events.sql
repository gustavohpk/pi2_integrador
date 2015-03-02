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
-- Table structure for table `administrator_level`
--

DROP TABLE IF EXISTS `administrator_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrator_level` (
  `id_administrator_level` int(11) NOT NULL,
  `title` varchar(30) NOT NULL,
  `level` smallint(6) NOT NULL,
  UNIQUE KEY `level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator_level`
--

LOCK TABLES `administrator_level` WRITE;
/*!40000 ALTER TABLE `administrator_level` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificate`
--

LOCK TABLES `certificate` WRITE;
/*!40000 ALTER TABLE `certificate` DISABLE KEYS */;
INSERT INTO `certificate` VALUES (5,1,'e-5497486a71aea');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cost_event`
--

LOCK TABLES `cost_event` WRITE;
/*!40000 ALTER TABLE `cost_event` DISABLE KEYS */;
INSERT INTO `cost_event` VALUES (1,11,'2014-08-20',15),(2,11,'2014-09-19',20),(4,13,'2014-09-19',5),(5,14,'2014-09-19',5),(6,18,'2014-09-17',15),(7,18,'2014-09-13',20),(8,18,'2014-09-15',25),(9,18,'2014-09-17',30),(10,18,'2014-09-18',35),(11,18,'2014-09-27',40),(12,19,'2014-12-15',15),(14,23,'2015-03-20',20),(15,24,'2015-03-20',10),(16,25,'2015-03-20',10),(17,26,'2015-03-20',10);
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
  PRIMARY KEY (`id_enrollment`),
  KEY `fk_enrollment_participant` (`id_participant`),
  KEY `fk_enrollment_event` (`id_event`),
  KEY `fk_enrollment_payment_type` (`id_payment_type`),
  CONSTRAINT `fk_enrollment_participant` FOREIGN KEY (`id_participant`) REFERENCES `participant` (`id_participant`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_enrollment_payment_type` FOREIGN KEY (`id_payment_type`) REFERENCES `payment_type` (`id_payment_type`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment`
--

LOCK TABLES `enrollment` WRITE;
/*!40000 ALTER TABLE `enrollment` DISABLE KEYS */;
INSERT INTO `enrollment` VALUES (1,4,19,'2014-12-03 20:20:08','2014-12-03 20:20:30',NULL,15,0,NULL,1,5),(4,6,19,'2014-12-08 15:14:49',NULL,NULL,15,0,NULL,1,3),(5,4,20,'2015-01-08 22:31:36',NULL,NULL,0,0,NULL,0,0),(6,4,23,'2015-02-25 12:46:14',NULL,1,20,0,NULL,0,0),(11,4,25,'2015-03-01 21:13:20',NULL,1,0,1,NULL,0,0);
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
  `path` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `details` longtext COLLATE utf8_unicode_ci NOT NULL,
  `teacher` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `local` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
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
  PRIMARY KEY (`id_event`),
  UNIQUE KEY `path` (`path`),
  KEY `fk_event_event` (`id_parent_event`),
  KEY `fk_event_event_type` (`id_event_type`),
  CONSTRAINT `fk_event_event` FOREIGN KEY (`id_parent_event`) REFERENCES `event` (`id_event`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_event_type` FOREIGN KEY (`id_event_type`) REFERENCES `event_type` (`id_event_type`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (11,NULL,1,'Semana AcadÃªmica TSI 2014','semana-academica-tsi-2014','<p>descricao teste 1</p>','ministrante 1','UTFPR - CÃ¢mpus Guarapuava','Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR - Brasil','2014-09-22 19:00:00','2014-09-26 22:00:00',150,'2014-07-23 00:00:00','2014-09-19 23:55:00',17,'ÿØÿà\0JFIF\0\0\0d\0d\0\0ÿì\0Ducky\0\0\0\0\0(\0\0ÿî\0Adobe\0dÀ\0\0\0ÿÛ\0„\0			\n$$\'\'$$53335;;;;;;;;;;\r\r\r%\Z\Z% ## ((%%((22022;;;;;;;;;;ÿÀ\0^\"\0ÿÄ\0¬\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0!1AQa‘\"2qBR#¡±ÁÑb’Cr‚¢3$áScğ²ÂÒ4Dñâ“£d%\0\0\0\0\0\0\0!1AQa‘¡Ñ\"2qÁBRbr3±#ğáÿÚ\0\0\0?\0õT!B\0B€„ !B\0B€„ !B‚. ´”¡S^óE„0ÛŠ›~O\0ô»îV–³²âNÌ[#C‡Ü€™B\0B€„ !B\0B \"	\0M\0ÚJ£Ôy·K´w“¾.rr†Çà¯Köv /ªıSşánç¸Ë²½­Ø8+\0„!\0!@B„\0„!\0!@B„\0„!\0!@H›$±ÄÃ$cqsœh\0é%\0ä{ÒçÖŒK‰ )¬|ÃÓ-K¡Ó›ñ³Œ3\"ö¶»«µfî.yƒ]v{éLVç…€t0mëU&FÍn©ÎÚm®hìÿ\0¬˜oi¤`ô»RÊê\Zö¥©¸üL¤EºwYÙ¿­Vİ¶Ş	|ˆjâÏÎ÷p…6n÷òã¤=wYZI#-¶XÛEåB¼oô§åkïæY<ìïÅÿ\0ûViÒ8»å-­Óín#¸Å³zFñØŒ#ĞR¨à™“ÂÉ£5diè*Eƒ`„!\0!@B£xmâ|ó½±ÅK¤‘ÆkF$’PsÚÆ—<†µ¸’p\0,ı÷9X°º-5§P˜`^Ã–ŸÅ.ÿ\0Cj©nµóLşl™¢Ğ!9 …Õa¹#õ¦ÙHÇªİûJ¢¾æ\r*ÂWZÛ¼]ÉP´z\\;¡TˆÙs{}}|×I©Ü{†‚ãud #k¿xª;K¯‰¸}İ2DÏwnÁ€Ğª¯5ËÛæŸH ;bií<ı‹¿G–>Ú9HÃƒ_Ûö­PÉ°Ñ¦v,<Ò)©ã†cÜ=ElBÍVM¢xî½¥¦ŠÓB¼}ÅŸ•9ş¦ÑŞLı%¾~óqYf‘d„!B‚„\0„!\0!@B„\0„!\0!@BŠâæh5Ä†&bç¼†´zI@J£–x ÒÌöÇ\\÷ÖÒJÅk?3ì¡q¶Ñb7Óœ¤z\0ï=f§‡˜µùúÍË™ÖÁ°ÙŒwGZ©³W¬üÉÓ­ÉƒJŒßO°IˆˆîêY›“Ì\\Àñ.©9Š\r­‡cG¢1ö®Û-.ÊÈ{˜Æ}ò;µØÕ2ÙÉg¥YÚPÆÌÒÔ~.ÿ\0º¥ğ³¶.ŞÉİŒtï=K¬–±¥Î9ZÑW\0,†£~ëÛ§Kúc»àßñ@y&§v­¼jØó$£åè¯…½ASé	g2È=ÔçtŸTv«WH^âçN%.e; s­ŒÛÁÃĞ6®V÷µÚãAÖ¯c‰¬`ŒlˆRÔ<È_bóŞ‹¿ì£¨­^}òiZ›&o†7VœXvÅ¿ŠFKda«šz\nË4‡¡P „!\0!@G4ÑAæ™â8£Ï{Z1$’¼{œ~`ÿ\0{¼6–‘4{wT1Ç#nİ—–ÆïŞ·1´mSVåçÇ¦ÈìğŸ6KQúìhÅ‘´ãºN˜íFgGæ¶2ÁR\\Ät%(Â.rtŒs$¤¢›y\"KİcSÔû—wt;­â÷qû#Ö¦Ó´»Ëº2ÚYÄ¬{‡Oåı6Ús<÷ûRb:›±^ÄC@\r\0°æßæñaÄş©àº4µ+(®²šË”]å—\\L%V0T»3ÈËI^Ú‚88-Ps³\0ĞMv\0¨¹ËO¾Ù·ñÕ°pÑ¶§ÂãMÛ”Ğs—/8^uãòáDïx·qÊTf¯•u!©ià<ÿ\0QnDs´ÓÂî°»æ‘º^¯ox\\ı-nEiGí…ôôÕ«Ìùs\\–Âé“–²JCpGáût­6¤÷Iu§5Î/2ŞB*MkGfûY£ÑSÑ†Ä¨BÉ B€„ !B\0B€„…\0ª»»[(]qw3 …)$pkGYY.}ùƒoËqü–IõiC,‰§Ö’›Îæ¬C´nb×„:Ÿ2]Êc˜fŠuáeGEUHTÕë_5mZókËĞ:ús€àˆëÅ¬ç}75—0kózíÁ›[\0;á`î·ëVv:u‹2ZÄ#âí®>—WXIPËg=–›ebÚ[Æ\Zw¼âãérë	pA@N\0.}Bú+WÎúF3ÚqØ|Ë©eh°ˆ÷GLFá¹½{UI\'\r»”RM$ÒºYNiKœO»´¨ƒçó\\*Ø±‹·*{x¾\ZÙzÇ½)üGwR9Cœ“S‰)s!]$Î˜ìbƒÒUĞjæÓ­¼‹F4à÷wé+°5dÒ+µ‹lğyÍè¼_²~åqÉú—Ÿfë\'Ÿym‹:c?òœ^[\\\\*×\nĞU¥ÃôMi®?Ëc²¿¦\'&hdÏEJš×5Íi«\\*S–M„\0„!\0…y‡?òœšmçÿ\0£Ò›–:·q´`ÇŸÔ\0z®ßÒ½AG41Ïá•¢H¤ikØìA\naFšªx4Fª¨yVŸxË¨+p;Ş‚°Ê»_ÑŸÊz“¤.jº7ÀmaüMİÅtÛÏ±²XÜÀs\\6WçõúOF~×<bşãÁvÛ„¾×‘qhàÑ›yú—\\±Áym%­ÀÏÍ,xè*®p\0.ƒ{\rÏ<¬‰£kàÑÚJòBNª™¬©˜‹Üy½ı¤º>©5Æ-iË›ÚØ±áh´MDŞê\Z%”¦³ÛŞ5®<ZÖœ\\œõ©hğG-­ärj¡±ÕÁÑ“ˆÎ^îĞ¸ù\nQqÍ\Z[IïÃ.=-\rvSÕ±~£MzWlÆS‹ŒéIUSµ{Oli6¨ÏwBA±*Ù°B€„ !B\0BU\0,_Ìƒ— 66%²êó7º6¶Ÿ]ı>ËRóÿ\0?ÁËvæÊÈ¶]^f÷µ°´ş¤>ÈX.Rå‰õK“®ëy¥ló#d•.•Ä×Ì}}^}MåI¯n?ı»ši$w›râç¸šù²Wè{<\r¸…Ñ»\nâÓÀ…5¥JÒ´d¡sÇ<QÍ4!(V:¶füK=\\%ônrÌßó>•cVy|ÃôâÇó;`T…¸óT°±ÔÊ\ZíÑŒ\\t,}÷5êWud$ZÄ}Vbî·ªØÙ4Î.\0¸œ\\óõ’U ¡£½æùä«,cò›şcûÏìØ4—ÜÉgºYòI=I­†6ÿ\01ÙÏ²İªPóJ0½¨±‘ã9z6Åi§I’XÀA®®$ªÆµt[¼Å vãô -ƒ—n•oñ7¬e*Æ÷ßèºÊ­W<³s.dÂ”Ç~Ïª£Ò\0\0OB€\n£™,³Û6íƒ½éaû•Ğjsâd‘º7Š±í-pè(Qœ›ª|fğÏ5šÓ»ÒÃá?bĞ¯6Ó.¤Ğ9ƒ$¦‘yRÆ7ø]Õ^;a1P„(PB€„ÒPúş‡g¯isé— ùSëÇ‰·¤ã\rÓùËC¼ŸC·²’íĞ>±½‘>FåvÇ4Œ2»oB÷7¼…Í-ÃÀ¦å™Û„×â¤³£$£*IUK)üÍÔÿ\0˜>\n7™#\"ª<Ï‹¾×äÍüîjº³s®‘İO©o¥¿‘»Šº¬¥ÔÊR¡$cÅP‰Ed’öÖ?(9RÜpû‹·{ï©€-.—Êœ¹¤È%Óì!‚Vøe3Æìú”Øodu*ds8­\Z;U\\J B\0B€„ !%PV;Ÿ¹úß–­Í™lÚ¼Íî3kaiıI>À—Ÿ¹öß–­¥¡lÚ¼Í¬qí4ş¤Ÿ`ßè^aËÚ\rÖ¿xı[V{äï/{Ş{Ó?~>ÏÄÜ±Ë—\ZÕÓµ­dºX¤y“Ş\Zºw×êú¿ZôFP\0\0`àuÖ¡§i‡]JËhÚ(Æ\ræ°b²Ú§ÌjV=&\nîóæúÚÁö­`ŒâÍì—ÛÆfFÅ|Oy\r¬¬Æ­ó#K´ÍœÃ}0õüû[]ÕÚ¼ò÷SÕ5i³]Í%ÃıVŸô4`œí³¸3ğŒ\\¦/\"Ú·7kº¹,¹¸,€ÿ\0ÛÃÜe81=k–ŞÎw€ç=§áØL1Cò˜½·wş\n\\\\jMO¤ƒa0GˆW\rîÀv)³=Â„á¹£Ø˜Ğ¤hTÈ­\nF„\nV„\0Ğ¤kPĞ¥cP„±““Ñõ)bñHÙc4{sOHL´ôoL}Xê¤¡é÷QŞÚGrÍà78`BëhXşRÔü›£e!÷wÇ]Òù–Í¡ešLPÀCB{B…3\\å§A¡©‹İÍOdøOQWœ«qÒ[İYí)•Ú@Çu…Ó=´w0Io(¬r´±Ã ¬Fw\'/s)´¹4‰îò&\'Gvÿ\0«©\\Ñ2g¦¡%R¬š!%¡\0ÂÀTN·k·.„ 8`ÇnMşİÑuykgšêVÃõh:–oQçaæ6ßN„¹Òxf˜eöƒ6öªªLöÙ1»™°\0«¹T}ìgg#RNiØh­”( \'!B\0B€„…\0çŞ|·å«Smj[6¯3kGOêIö\réÜùÏ–Ü³jmíËfÕ¦o¹ˆâ#õ$ûõá7wwW×R]İHé®&qt’8Ô’PÖÒÛß^É¨ë·.9ÙåºYqÊ8%YßóÅëãø}2&ØÛ´ea\0å)¹«<Ëi‹»ƒ‰û—C ‰›³.ÙØªL„.ø»É²9ò½Ş)Iş\')£³‰¿Ìvsì·Ú¥©;v\'\0´¢…G0åcàÔæµ#B•¡RB‘¡ \nÂËGÔ/(`„äÿ\01İÖö•™Ü…¸ñNJß\'BÆ2“¤S“Ü±9ZÕ,q½î\rcKœvŠ•¥±å[Ş¼”ÈíÌ×¤íWÖ–ÖËM=gjæj9Õ‹xZNëßå[=–¹uÙã6­®¶flùoP”vq‹ò…}gËºu½ö›‡ïÙù~õ`\np+•{šjoaÅéÇé†¹ëz6ş^\'¾Xö½{M×â&Ò¶±®áÖ«ØÕ±º·eÕ»à~Ç6–t†GDñG0Ğõ.Ï+ÕúÖ¸$üv°öÇc9ÚëÎ$¼3ì{F±©·Qqµ¿RSTP®‰ã)Ù+˜ö½‡+šAk†â1Ò´]EšŸÓ|g»+x=¾/½y­Ô&	‹6‹}\në“uoƒÔ~SH.èÜv	„õìQ•„Ğ¤hLj•¡dÒÈ|ÀÒO—­ğÒ+Šp>và¶M	—–pßYÍi8¬s°±İØG âˆ5S‹”5îÚ4R=Õ¸ƒÜÏÆ­Øî°¯—ò}ûô>d“N¹pò§y·ƒVù€û·NÎµéèÖ!<B¡A\\š¦©e¤ÙK}} ŠŞ!Rv’NÆ´oq;×Ú…Ÿnë«Ù›\r /yŞv¼“À,Õç8İ\\ÕšTLGşîäbb¿˜…U6¦/.»Ìe¤×à,¥pËNŞ=iœ6ÓÃ°,íï7Û^İ&#4uîÜMV3¨xœªDoq}rö°>şşWÜÉ©–SR:ßqÜ§±¸’y$¾—Ç1¤cƒGI5ıåë«s+¥Æ¡Ç¡¡[i7Q²Ks8÷q¸Ó+¢Ù“c`çé†³áf#ğ?Åùv­“H j …d,‘…®˜ñCÀ‚g/Ü¿É“O˜“=‹²TítGŸÙ‡RÃ4‹t$	T(!@BB€OyæÛ–­~Ş“êÓ·ÜA´0Ô“£€ŞµR‰OšHZC	Üê`¾wæ7\\Óõ™™­—¾îSæ™œAóÃ3H¨§FäeÔ·W×R^_Ìe¸™Ù¤{\\IJÆ±N¥2Nhvn…¤BA]éÀ$	ÀTĞm;‚Ğö…ccËºİ‹ÉŒúò÷{µh,yNÆ\Z:åÎ¸;%xïó5œ%>)}0ñ>ãÓkC¨»Š‡~©`Œµ½´÷‚7Jã¹ •{eÊw’Q×o7ÙçıÁiá†#…ƒÕh¢”ÊÔs«Òª³mo~)wû\\®Üq¸ÜŞå‚8¬´-2Î…±y¼ãÙ±X	€§¹7nÜºø®JS{äê{cnT„TWA )^*3õ;ÓÅ0æ¸l;a=Œ5´@SL ´Ğ¥2[¬Y‡tÁˆÂJpÜU€)Hik…ZáB:«I©•‹±¸¶y–øíGÂı•vÛƒÛ—C3/’(Xd•ÁÊ«»×œjËFåävŞ ¸ùŠŞîÛQt¼½¹Œš€c5ËJ*Ï9ä¶… W®~ºŒâ§XÉU>†peâóNŒ¸´÷\r|¸¾JçŒœI>³zÒA‚6õ\n­·21áÌÁÌp\"•¨£†ßJîuË$•†&Ò9\Z*=—e«†\'±hÍXå­Xjº\\s¸ûøıÜãñ7XÅYÉuo\0¬¯\rèÚ{òŞ\\Õ¤Óï|¼å\\Ñ’SGİK^êã\\O–‹RÚ~`kj-ãÌ}§à;¬¹Ôo.p–C—Ø7°(\\˜U¡*c¤&]YÀz×‹Û×‡éÇÎÖ­†ß2åŸÄğ½ÁI\"¡Y4rjš–•e-õô¢xE\\ã´ğkFòwâ\\ÇÎú¦»ªüP\r·µ·\'à`xÎcÿ\0UÍğ™±z¯<ò¹æMÛÄóå¹ómMhÒúP±ãe0è^+ibÑvû[Àè¥‰Å®Œàs4Ğ´×zİ¸9ÉEfğÇ3’Œ\\Kqß=ÜŞlï}ÄÇòóû£`Vö:íÅñå4úÏÛùv®û8m Ê`iã´ö•e«§k—F•œ«Ñó—¨æSÅ[L±ì#¶Ğl£aHòÌp¤ÌëfÀÉ3ƒjÒ­Ù™äeÄïUüÏ£Êë~Çfu¿ó#2[÷~¥5zh+iÁp¸ì[QòĞë&ï8İ—¹•v=fŸ“5Ayfm&?ÔZPc´Æ|\'«b±Ô/­tıRÆö9At—1·Y)î=—ıkËô]Qö“Ç;I÷}ÉZ=hœ~Åªâ›0ÀK£–ö ×e ;õ£¤.kGdôÄ¨BÁ B€„ ¬ÿ\09ò¥¿2én€Ñ—°Õö“û.ö]ø]½hR >h¹µ¸³¹’Öê3ğ8²Xİ´8mMz÷Ì®Lşçnu>:ßÛ·ßÆÑŒ±7ş&îâ‘´BëBĞ Ô˜édŸ(ŒÑÑ0w½$+Se¥iö@|<-¹ï;óˆÓ/åÓî›q#dŒÜæË{msÌš9Z~Ãè\\>oşˆÎ®rvg’X$÷:fv¹_ùå\n(%z·‹kz©8)À¦”ÆgM¡à§˜\np*3-()€§²e¡à¥0àT¡–‡óz[õ&‚€hÈ\\üv7¥o#8,ÄI!£\ZJš8#n$f=*píÛ¸/¼,}NùJæåÖgù§—ß{¦ºá”ø«P^Æ·æúÍûW‚½æ¼ß£lÔŒ‘6–·D¾:lk½v.÷+¾’ôÊ®íG/[m·êû¥ğe-WnŸ.pëGœ$Æ2w<lí\\JA\Zˆ>…Õ<Gq¨$Ú8-®ƒ¨|uƒsšÍ\r\'Më3„ñ2ìmvaÁà}««CÔ¾ıq÷2Q’ƒ°õ!·*)İ’ì´À¦=ô®MIÙ,.]Â\'ı-P^\\ùƒMoÿ\0*Ô\n÷â| ÜüÍ¦·ı`(.^Ø¤D„,”B°?1y?â×´æU­ÜmÚö7õ\0ö›¿¡oÒİê§GPÏ´¸ÌÁ]»Õ„R«}åÈô_«Z¶š|¦®cNCêşËÅŸ±»eÃøÍZï£¡v4zŸR4oÇÕ¼äk4Ü\rÉ/ìè4v’QµŞWs&ic€s2¹§ahT¬¸k\0.phâMÒ™\'1é6ØItÂFÖ²®?ÃUè¹À—ŠI{]o¥rRğFMıª¦{U´:F¨è©XŞñFíŞ»ô\\]jš6š% EpÏ%õ83¼òG\ZƒN…ÅÌ|Ç¥êvíŠHf‰Õg\0ÑCâkŠéùwæ\\ó6œ29Í‚Rá i-Ë•ÕÒ˜Å¾ ¦Ô$¥”şĞéerV¢îÅÆk]´Ú{²T›R¯è*€„ !¢òO™<›ı¶àëZ{)c;¿©£¤qñSÙĞW®(nmàº‚Kk†	!™¥’1ÛH¡\n§@|â¹åıTÙMäJ§”ã_UŞ×£ŠŸ›ùZn\\ÔÌ\"¯²®´”ïØïÄÕJĞ¥ëP½nVæ«.®“V®ÎÕÅrÿ\0Ô=àU/ê†F9Ï¼`÷N;Ú=_HW•_•Ôéçbä­ËfOzØÏÓØ½öÕÈmÍn{‡‚œ\n`)A^v´<àSJ\n†Zœ\nŒê©C-0¸7ŠëÁ±sÀ(ÒíîÀz7©C–¢è|g‹ö\'(C“ƒ—ÕLù¸“.\rwLVÓd´u8}YÏ¸®°ä¡Ëënë„”¢èâêŒJÚ’iäÏ ‘ŠGE#K^ÂZö ƒBUjyëGòæn­\0îJC.i¹ş«ºÖN«ôú{ñ½j7#·5¹íG\Zí·nn/gğvØLÑ!‚Cî§IàïUİ©Ò5Ñ½Ñ»4Báª°{ş&Ù·d‘ÍÓì¹}O™¯å­Gã,|—šÍmF%©ûúëòiNü\0v¸Ò5i÷ñÏúg»(âÃ·³jÔó4­\Z,i«d,\r<A5B\\ˆÜüÙ§yì‰å{Bñ¿—MÏÍ–¿’»øûW²,Ë3H„,”„ÓTö6š…œÖW‘‰mî\ZY#ğÛã·?,¹¾ÏR¸µÒˆujÅté\ZÊ´ì®üÃa ^É!+–gÈ6+Óªm>‚4š£I®“Ì­¾NêÓœÚ¦­uÄ¶6¾cüf0¯,~Pò¬7sÜ^;x.°õF¿‰h¦äl\nÜŞ—bÔux·P¨°HšÃ’ùBÇ)·Ó Ìİ‘¾c»dÌ¯![’66û,£°*ˆfœÓ0]Ñ9ûÔ)Ú•DÂT\0¨B„\0„!\0!@Vëú¦»¦Ëat0v1H<Lxğ¸/Ôô»½&ş[ÆåšCÁÍ>4ğ+è™çnTf½cæÀĞ5`LÙ»LN=;ºU‹¡\Z<~\'9a-sMAA[¦_¶öÜ8ĞJÌ$hãÄt”1¾7º7´µì%®iÀ‚0 +¦ÊæKIÛ+1¦o´8/6¿Fµ°Âäqƒø{ÏV‡Xô÷1ırÂkãî5à§¡‚hæ‰²Æj×\n…%Wæ%ÓTiÑ¦~‘5$šuMU5¸x)AL-V(\Z$ªsjâ\0ÚpQÕK¥CÁ’0`	C”uKU†İj|¨Jœ¡89U#.$¡ÉÁÊä¡ËJfxBîÚËYmg¢™¥ıKÊõ9´ëÙlçñÄê¹Íõ\\=!z®e™çm#â­£}ı¨¤€mtùv®§*Özw}9?Ü=’Øş[§ã‡\Z^(LFeÓerØf÷˜Ã É(ü\'RâÌ—2ıÈ,\'ĞÊèİSâ7c&«çòø±ÖXen^˜èiØ«£ÄÚWõm…ïÊ¡Ì€×ü°n~jiö-åwÒÆı«××’|¨nncşÅ«¾—³î^¶±,ÊB…‰P€ih)†ªTˆ\r«äŸÎŸQ×tİ8ùsËšs‹mâä?º6zM[QæíNæäZ[f×\n¾‡4½.Ø\r8+FFÑ³Ì“ÄM\n“•õ4o´‘Ä½øËIiñbx|£*\0Ğ¡B\0B€„ !BÏşarpírÁöŠŞÆ7ú£¤zË\0Ğ½ùÀ9¤Pp ì^SÎ|¬tkÏŠµoÿ\0_pîè¦ó‰aèàµ°Ì‘S¥^›i<·ŸróAâ¯ÁYF…i¦ê°ùÌÓæ}&sIˆànôğ\\®k¢âNü+ö.«¼ër­mùî<ë}?Oqp\np)€¥p¨vÚû\0o¯z†-¹«õ©X‘ó–cê–©•J\nÍP’©j£ªZ©BP}RÕ2¨ªP”$ÌÑÀµÂ­\"„à¦ÕĞTà8”Ä”<Ó˜´“¤êO‰£úy}äğŸW÷Ufe¼æçézs¢’ê]Ãß€fÕŞÚ\nğ^~¿YËµ½§‹šjqğÊªœ_w¼àêì«wZ‹N/MU­Ñ·²mnÇ·‹NĞº®#KFšÆáš7qiØ«3.ëi¼ûc±’\Z¾.–zÍêÚ½©vo>P·6±~ÿ\0fİ£ó?ü«/.ù8ÚŞj’§‰åzŠÌ³*!\n\0HŠª¾`×í4;A<ÀÍq)ÉihÏæM&æ·£‰Ü€~±®Yi±×¤šwd·¶ˆf–Gm!­àÒp-wÌ\ZÖ¤Ksÿ\0o¶?§	Í1Š]ßºD¼Ãc§İI©ë—-¹Ö\'ò ÷T{[-õ[Äšf*‚û›/®åÁÄ,!qÂ¤>_¹«IšK›‹M.ÙòĞóR^ûİÒN.é%Ué®•ÁÓÈsOrj}À*¹ï~w¸¾Cµï9œ{UÆ—xëgÅ4ƒ8…ÀšïjÑ“i$°d7Q\n¾×¼ğ=fŸæÅ°ŠXå‰’Æs1íiÁÄ*qÑ¶FñÈÚ´î ®SçÒd8Û{ËjïçÈêµašEÒª„ !B\0B€„ Ícmi%¥ÓsÃ0ÊáõÒJ+Ìz\\¼»u,WU10g†_m›:w†–òy.ÖbÙsfi­6SĞ¾…çV¶æm!ör.æ:¾ÒofAÇğ»a_=ßXİX^MewŠâHÃ¸…[ª£\"TuFû—õ¦j¶Î ¹»3ÎZÕy†™¨M§]²æRÜİÎiÚÒ½\"ÆòØ#¹€æAQÄàô…ùîa£ôgÅısË¡î?GËõŠı¾¿ì‚Çî[ÎÑƒ@ë>”àTN{X3=Á£‹i\\7<Ã¢ÛTKvÌÃkXsÆ¯mNn‹“ûUODç*ÎJ?“¡iT ¬µÏ>i±Ô[Ã,äl&Œií©úU×>êo¨·Š(ØM^áÛAô/L9fª\'\nß7Oı<·5úhüü_Š©¿E=å¥³K®& 6çpËî¹‹[º¨–îL§kZrÆÑW¹ïyÌò\\Nòj~•ë·É$ÿ\0eÔº\"«ÚÏ,ù¬~KmşN‡¦]s–oP\'38n‰¥Õıìôª›Ÿ˜Œ–eÜ3©ü,¯Ö±EW®ß(ÒÇÌ¥sò}Ô<Óæ7å“PüWy ºçzzˆŞËvÑ´WµÕ*ªçUÔnÉ772Ë]¡Î4ìØ¹(”4¸€$ì½vôömù-Æ=**½gšw®OÍ9KÚÇQ.eaeÊÜÅÿ\0G¦ÜJ=¡€íphl~Qó…ÑtpÙ´ãY¤şXó•õ>f?2|S:)#\rÒ^›còD`íGT=,·ê|‡ş¢±ùKÉö´2Ã-ã†ù¤?îÇ}\nÔ\'×7TŸË{¢\rèÁÄ·©zRâÓ4m/I‰Ğé¶±ÚFóW¶!J‘…OÚ£\0„!SÌœÇaËºs¯ob{°@Ò3ÈıÍm~“¹xn­ÌZ¾³©K¨İÜÉ ,dq­/òØí q¦Ş+Ü9£—,¹K’ÂäÉâ·šèä:8¯Ò´Ë}7]“K×­ÇÇdaq9·\Zl-xØVn\\ôíÊçŸâáeŒx¤£U\ZáW‘W§i··¯Ég¤¯ˆ´aûÎ?zÖé|‰3¨ûù„Co•yİn8vUi`‰‚8ÚÁ±­\0Àºãrüæ«ê%XÙJÌwù¥Öğì=ñÑB>fäú‘Ëi é‘:íÚs´µïyÄM§bËj6ğiRÉ\rË»¸äŞç4ì!n›•İÓN$ªntåÑ{¥»p_yfÅ6º=¯oVĞœŸYyj«7;w°“œªÔ¶<O¦Ô\n¤£±!9#YĞ?O¹ó sØİ»ªªÓUÕí`¾Ó®­³:vNØiFº)G7¶^_¥ê·‘’Æ{öç8X|M[)çæçG|F¬¸¼‰Íô\n¹~¡£ÂzXJ„,\Z!B\0B€„ !\"P’¨ªVæw$\rjÌêú{+©Ú·¾ÆŒf‰¾¯í7wbİÕ%P,’A¢ê´Õµ(İ¬î‰5!¼zå½ù§ÉÊgs›ô“»úØš0G~ ËŞyÜ6óÜ?Ë‚7Êó±ŒiqìmT”c%I%%¹âXÊQu‹q{Ó ³]İNâéå|„í.q?Z‰_Øò\'6ßPÃ¦LÖŸZQåÿ\0©B¯ì¾NsØİÜ[ZŒì`¢$’¢T\r¶êİL\rJ®Ù|˜Ò#¡¾Ô\'œïlMlCµÙÕıË®L²¡nÙŞ=k‡:Jşë_áT‡‚²7ÈàÈÚ^ó±­\'¨+{Mæ›úm2áÃÚsl™WĞ6¶Zu“2YÚÃnÑ±±FÖá£Îé@x½ÉŞj¸ÆåÖömÛß~sÙrĞXü‘³m¨jrIÅ03±Ï/ÿ\0uzGš8£Í@f,~Vòe­tñë\\HçW÷ZZß¡h,ôM\ZÁ¹l¬míÇúqµ¿PSù©|ÄÕÁEæ%Î€“(ó„¹‚D&fKT›Tµ@)Ïœ¢İrĞ^Z0\rNÕ¾ìŒŒÚc=>ÊÕ¡åœ»ªºæ†¸¨ºƒ›æŒ;Fõ×ÌM7Ìæm.3<n¢hŞpóh7YA ë6ú½ŒwQ×l:øxz8/Ís~^­KÖ¶¿®oôË¹-ş8ğKÍÔhíİ•µŞq]-“ÿ\0Ÿ¹æ]Ëş¦úµ¡ÙİØÌÊ¢ëævƒìšéİ\r®+gO¬›ş»S’ühºŞœ­¯4‘AÎ\ZIĞõŸ:ÒÒä™`à\r{ñõº9ZñÓkº=ŸŠİ‰b<kªŞ¢»ÎWœÏoı¾ßL¨c™šYAÀh¨ÁYü¿å®cf»ewu§Í¤<Ù[“/tŠeqÇĞ¿a¢•ÿ\0óÅj#Ãr+…âw<}Å7ÀêfB@•}Œ‚„\0„!\0!@	¤@ITˆ©’šJKÓKÒ£q(™±Mâ™’)W±à9®h àTPÃkjÁ´1ÀÁ±±´0v6‰\\â£sŠWLx¦”yQ9åRF~”Ãp8®\'Hå¥rÀÜ)>(qUnáDn^€¹ø —âGL.¤lÏ(qp„ı*­²9L×¹`&O®¸©Zâ…;‰áë•¤©\ZJ 989BÒ¡Éj£	á\0ê¥MJP\r•±ÈÇG#Cãx-{*Nx¯/¿ù<é5)İe¨¶×L•ÙÙ	kœö×k6€CNÅé².I›&ä&Ïå,ÁåİÅÓ¸Ø›ØÒ¯ì¹/’¬haÓ!{‡­03ıÒàºfèé\\í†û6\'hJ—¶ÿ\0	vñ²&\rcCGcW@•¥SBÉÅ3ÛmåBÁÀ¥P°©BP‘*\0B€„ !”‰ÔE!4…%Q		¥ªrÔ…ˆW11Ì]e‰¦4£Qº`b	¦ ¨+]L6İ\nÓÉ		RP¨6	¦ĞpWBC\nÿ\0\rĞœ èVĞ‡èJƒ°ô)\ní	â¨9•±®\nx\ns¶5#X¦J #\rN\rR¥¢¡©À%¢Z 	h•\0”	¦6”ô #0°îIğìà¥BBÚ`DtS’ˆµ©Á-€¤J€„ !B\0B€!˜!˜!\0Ñ\'u@ÔÔ!\0wÜB	ÜKÜBq/u@Ô¨BpFBpB€T!B\0B€„ !B\0B€ÿÙ',0,0,0),(13,11,2,'Minicurso sobre Linux','minicurso-sobre-linux','<p>Minicurso sobre Linux</p>','ministrante 01','UTFPR - CÃ¢mpus Guarapuava','Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR - Brasil','2014-09-23 19:00:00','2014-09-23 21:00:00',25,'2014-07-23 00:00:00','2014-09-19 23:55:00',8,NULL,0,0,0),(14,NULL,3,'Palestra: O Mercado de Trabalho e o Profissional de TI','palestra-o-mercado-de-trabalho-e-o-profissional-de-ti','<p>palestra 1</p>','ministrante 01','UTFPR - CÃ¢mpus Guarapuava','Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR - Brasil','2014-09-24 19:00:00','2014-09-24 21:00:00',100,'2014-07-23 00:00:00','2014-09-19 23:55:00',6,NULL,0,0,0),(15,NULL,5,'III Mostra de Talentos UTFPR Guarapuava','iii-mostra-de-talentos-utfpr-guarapuava','<p>OBS.: Inscri&ccedil;&atilde;o necess&aacute;ria apenas para quem ser apresentar&aacute;.<br /><br />Enviar um e-mail para <a href=\"mailto:gadir-gp@utfpr.edu.br\">gadir-gp@utfpr.edu.br</a> com os seguintes dados:</p>\r\n<ul>\r\n<li>C&oacute;digo da inscri&ccedil;&atilde;o (gerado ap&oacute;s a finaliza&ccedil;&atilde;o)</li>\r\n<li>Nome completo e turma dos integrantes</li>\r\n<li>Nome da m&uacute;sica/apresenta&ccedil;&atilde;o</li>\r\n<li>Tempo aproximado da apresenta&ccedil;&atilde;o</li>\r\n</ul>\r\n<p>Ap&oacute;s a an&aacute;lise da equipe organizadora sua inscri&ccedil;&atilde;o ser&aacute; confirmada ou cancelada.</p>','nenhum','UTFPR - CÃ¢mpus Guarapuava','Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR - Brasil','2014-04-14 19:00:00','2014-04-14 22:00:00',15,'2014-04-01 00:00:00','2014-04-12 23:55:00',20,NULL,0,0,0),(16,NULL,4,'LanÃ§amento do site de eventos da UTFPR Guarapuava','','<p>aaa</p>','nenhum','UTFPR - CÃ¢mpus Guarapuava - Avenida Professora Laura Pacheco Bastos, 800 - Bairr','','2014-07-23 19:25:00','2014-07-23 22:30:00',50,'2014-07-23 18:00:00','2014-07-23 18:01:00',3,NULL,0,0,0),(17,NULL,4,'InauguraÃ§Ã£o do Campus Guarapuava','inauguracao-do-campus-guarapuava','<p>aaa</p>','Nenhum','UTFPR - CÃ¢mpus Guarapuava','Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR - Brasil','2014-05-23 10:00:00','2014-05-23 11:30:00',80,'2014-05-23 10:00:00','2014-05-23 10:01:00',2,NULL,0,0,0),(18,NULL,6,'Churrasco da Semana AcadÃªmica de TSI','churrasco-da-semana-academica-de-tsi','<p>churrasco tsi</p>','Ministrante 1','Acre/Unicentro','R. Francisco de Assis, 304 - BoqueirÃ£o, Guarapuava - PR','2014-09-26 19:00:00','2014-09-26 23:00:00',150,'2014-07-23 00:00:00','2014-09-19 23:55:00',26,NULL,0,0,0),(19,NULL,5,'Palestra teste 3','palestra-teste-3','<p><span style=\"color: #000080;\"><strong>Palestra teste 2</strong></span></p>\r\n<p>&nbsp;</p>\r\n<p>Conte&uacute;do:</p>\r\n<ul>\r\n<li>Conte&uacute;do 1</li>\r\n<li>Conte&uacute;do 2</li>\r\n<li>Conte&uacute;do 3</li>\r\n</ul>','Palestrante 02','UTFPR - Campus Guarapuava','Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR - Brasil','2014-12-07 14:00:00','2014-12-07 17:00:00',49,'2014-12-07 00:00:00','2014-12-07 10:00:00',215,'ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0C\0\n	\n\r\r\r\r\ZÿÛ\0C\rÿÀ\0\0’\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RğbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0ù[ÿ\0‘ŸSÿ\0¯¹¿ôcU\Z½­ÿ\0ÈÏ©ÿ\0×Üßú1ªfl*ıñõ¯ÖŸÙoşLûÀö_ı\r«òY~øú×ëOì·ÿ\0&}àû¯ş†ÔâLÏ^¢Š*ÌÂŠ( ¼7öÀÿ\0“8ñû¶ßúS{•xoíÿ\0&qâÿ\0÷m¿ô¦:Lksò¤õ¢ƒÖŠƒP¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(ôÇöÿ\0“R_ûİÿ\0ì•ô½|Ñû\nÿ\0É©/ı†nÿ\0öJú^­ld÷\n(¢˜‚Š( Š( Š( Š( Š( Š( Š( Ä]oşF}Oş¾æÿ\0ÑTjö·ÿ\0#>§ÿ\0_sèÆª5™°«÷ÇÖ¿Ze¿ù3ï\0Ø-ô6¯Éeûãë_­?²ßü™÷€?ì¿úS‰3=zŠ(«3\n(¢€\nğßÛşLãÅÿ\0îÛéLuîUá¿¶ü™Ç‹ÿ\0İ¶ÿ\0Ò˜é1­ÏÊ“ÖŠZ*\rM?\ré+¯xÓGĞvuû{#2®ã–Upñ»8ö¯·ÿ\0áŞ\Z/ı]Sÿ\0QñuñÃÏù,>ÿ\0°å‡ş”Ç_´c§ãT‘v>*ÿ\0‡xh¿ôUuOüEÿ\0ÅÑÿ\0ğÑèªêŸø*‹ÿ\0‹¯µ¨§dO3?0?hÏÙšÃàO…4]bÓÆšãj7jcÍ …~àU}+çjıÿ\0‚„É/ğı…¥ÿ\0Ñ¿?j^æ‘zzÁO‡|ZøÙ¤ø\nçV›JŠı\'syBVO.&“…$¸ükÏëŞ?coù<Ï\nÿ\0×ßı%’Ùï_ğï\rşŠ®©ÿ\0‚¨¿øº?áŞ\Z/ı]Sÿ\0Qñuôç/¯m/l…­ÜĞ†‰¹\\ò=+‘şÚÖ?è)wÿ\0M~ox“…Ê1Õ05(JNÕ5Õ\'úÆ$©‰¥\Zªi\\ñøw†‹ÿ\0EWTÿ\0ÁT_ü]ğï\rşŠ®©ÿ\0‚¨¿øºöïí­cş‚—÷ôÑıµ¬ĞRïşşšòâ/à¿è\Z_z:?ÕÊ¿óñ}Çˆÿ\0Ã¼4_ú*º§ş\n¢ÿ\0âèÿ\0‡xh¿ôUuOüEÿ\0Å×·mkô»ÿ\0¿¦í­cş‚—÷ôÑÿ\0ÿ\0@ÒûĞ«•çâûÿ\0‡xh¿ôUuOüEÿ\0ÅÑÿ\0ğÑèªêŸø*‹ÿ\0‹¯nşÚÖ?è)wÿ\0MÛZÇı.ÿ\0ïé£ş\"şş¥÷ ÿ\0W*ÿ\0ÏÅ÷#ÿ\0ğÑèªêŸø*‹ÿ\0‹£şá¢ÿ\0ÑUÕ?ğUÿ\0^İıµ¬ĞRïşşš?¶µú\n]ÿ\0ßÓGüEüıKïAş®Uÿ\0Ÿ‹î<Gşá¢ÿ\0ÑUÕ?ğUÿ\0Gü;ÃEÿ\0¢«ªàª/ş.½»ûkXÿ\0 ¥ßıı4mkô»ÿ\0¿¦ø‹ø/ú—Şƒı\\«ÿ\0?Üt?~Û|ø\\<k®O¬F/%»ûTĞ,-™1òíRGë^\\ÿ\0ƒ.\'¹ğªKs4’Èdq¹Û\'­túWaƒ¥‹‚²œT­ÚêçÏâ):5eM»ÙØ(¢Šï1\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€?u¿ùõ?úû›ÿ\0F5Q«ÚßüŒúŸı}Íÿ\0£\Z¨ÖfÂ¯ßZıiı–ÿ\0äÏ¼ÿ\0`µÿ\0ĞÚ¿%—ï­~´şËògŞ\0ÿ\0°Zÿ\0èmN$Ìõê(¢¬Ì(¢Š\0+Ãlù3ÿ\0»mÿ\0¥1×¹W†şØòg/ÿ\0vÛÿ\0Jc¤Æ·?*OZ(=h¨5:O‡ŸòX|#ÿ\0aËı)¿hÇOÆ¿>Éağı‡,?ô¦:ı£?\Z¨‘1h¢Š¢à¡òKüÿ\0aiôA¯ÏÚıÿ\0‚„É/ğı…¥ÿ\0Ñ¿?jæ‘Ø+Ş?coù<Ï\nÿ\0×ßı%’¼½ãö6ÿ\0“Ìğ¯ıq½ÿ\0ÒY)\rì~‡üDÿ\0ûúæÿ\0ÌW]¯ÄOøÿ\0°ÿ\0®oüÅqUü¯âü”ŸXÿ\0é1>ó&ÿ\0s§óüØQEihº5Æ¹|ö¶ÒÅ*y„Éœc vú×Êá0•±•£‡ÃÇšrÑ.ç¡R¤iÅÎnÉ´W_ÿ\0\nóVÿ\0ŸË?Í¿ÂøWš·üşYşmşôŸê6}ÿ\0@²ü?ÌáşÖÁÿ\0ÏÄrW_ÿ\0\nóVÿ\0ŸË?Í¿ÂøWš·üşYşmş¨Ù÷ıËğÿ\00şÖÁÿ\0ÏÄrW_ÿ\0\nóVÿ\0ŸË?Í¿ÂøWš·üşYşmş¨Ù÷ıËğÿ\00şÖÁÿ\0ÏÄrW_ÿ\0\nóVÿ\0ŸË?Í¿ÂøWš·üşYşmş¨Ù÷ıËğÿ\00şÖÁÿ\0ÏÄt~ÿ\0‘>?úêÿ\0ÎºJÉğæ—>¡-•Äˆî›)œr}ëZ¿¥øk\rW\r•a¨V¥E5Ù¤|6:q©ˆœâî›aEW¶r…Q@Q@Q@Q@Q@Q@Q@ˆºßüŒúŸı}Íÿ\0£\Z¨ÕíoşF}Oş¾æÿ\0ÑTk3aWï­~´şËògŞ\0ÿ\0°Zÿ\0èm_’Ë÷ÇÖ¿Ze¿ù3ï\0Ø-ô6§fzõQVfQE\0á¿¶ü™Ç‹ÿ\0İ¶ÿ\0Ò˜ëÜ«Ãlù3ÿ\0»mÿ\0¥1Òc[Ÿ•\'­´T\Z\'ÃÏù,>ÿ\0°å‡ş”Ç_´c§ã_‹Ÿ?ä°øGşÃ–úS~ÑŸTH˜´QEQÇ?ğPù%şÿ\0°´¿ú ×çí~ÁB?ä—ø?şÂÒÿ\0èƒ_ŸµsHìï±·üg…ëïş’É^^ñûÉæxWş¸Şÿ\0é,”†ö?Cş\"Çı‡ısæ+Š®×â\'üØ×7şb¸ªşWñşJO¬ô˜Ÿy“¹Óùşl+­ø{ÿ\0#$ÿ\0õîô%®Jºß‡¿ò2Oÿ\0^çÿ\0BZçàùáÅú2ó_÷J‡Ï?´ŸíKñ3á?Ç{øZßÃï§Çcop\rõœ’É¹Á\'æ(Ç•ä_ğİÿ\0ÿ\0çÏÂø.—ÿ\0UÛƒşNÖïşÁVúWÎUıbÙùúJÇÓŸğİÿ\0ÿ\0çÏÂø.—ÿ\0Qÿ\0\rßñ¿ş|ü!ÿ\0‚éøõ|ÇE‘ôçü7Æÿ\0ùóğ‡ş¥ÿ\0ãÔÃwüoÿ\0Ÿ?àº_ş=_1ÑEÂÈúsş¿ãüùøCÿ\0Òÿ\0ñê?á»ş7ÿ\0ÏŸ„?ğ]/ÿ\0¯˜è¢ád~µ~ÍüGñgà=·Œ<S‚j2^Ü[°±‰¢lo…ùK1Î=êŸíGñ3Å?	ş/Š¼!-¤Z‰Ôàµİuœ›>ï—#Ÿ”s\\ßì=ÿ\0&‘cÿ\0a;ÏıTÿ\0nßù5dÿ\0°İ§ò’«¡O—ÿ\0á¸~<ÿ\0Ïÿ\0‡ÿ\0ğV?øª?á¸~<ÿ\0Ïÿ\0‡ÿ\0ğV?øªùÆ´´oø‡ÄSK‡´SW’*iö’\\´jN`Šp	ã&¦åÙùÿ\0\rÃñç?ñÿ\0áÿ\0üş*¥öæøì‡-7†¤öm0ÿ\0Ix©øgñ$Ÿ‡~.÷¹ÿ\0ãuBûÁŞ/Ó\"iu/	ëÖh¼—¹Ó¦ŒÅ”QvGÒzgíùñbÚAı©áŸ	ê	İcŠ{v?˜ßÊ¾ˆøCûeü=øª[øÄÒxK\\„p¥ä¢K[‡=&ãOEp3Ğkó+úqGµbqGîE|•û[~Ğ?¾øûÃºO‚®tØ­¯ôùngv‚b]e\n0r01Iû|x¿ñ¿‡î>\Zx¶õîµ­5…ÜÍ—º´)V\'«ÆJŒõ*Ã¸&¼»ş\nÿ\0%kÁ¿öŸÿ\0GŠ¦ô%-lÎ3ş‡ãÏüÿ\0øÿ\0cÿ\0Š£ş‡ãÏüÿ\0øÿ\0cÿ\0Š¯œksJğ_Œµİ<_è~×õ;BÅÅ›4ñ–FäR2=3P]‘î_ğÜ?çÿ\0Ãÿ\0ø+üU*şÜ_AÉ¾ğó{0ñuã?ğ¬¾%Ñ;ñwş	nøİ!øiñuøyâÑõÑ®øŠz…‘ïšíéñ–Ö@o´Ÿ	_ ê\rœ±ø¬¿Ò½OÀßğP÷P†Ïâ‚î4ˆÜá¯ô¹ÍÔqû´lãé“ìká=GKÕ4{ß±êúmæŸqŒù7</÷XU(»T~ÚxwÄz‹|5kâ\rj¶º¦™v›àº¶}èãúĞƒÈ<\ZÔ¯ËÏÙ3ãm÷Ã‹¶ÔïøW_¸Kk¨do’Úv!c¸_Np­ê§\'îŠıCªNæmXüEÖÿ\0ägÔÿ\0ëîoıÕF¯kò3êõ÷7şŒj£Pj*ıñõ¯ÖŸÙoşLûÀö_ı\r«òY~ğú×ë/ì«*Íûø©Îİ<Æ~«+éN$Ìö*(¢¬Ì(¢Š\0+Ãlù3ÿ\0»mÿ\0¥1×¹Wƒ~Ù¬?±ÇŠwyg÷&ê*LksòÀõ¢ôT\Z\'ÃÏù,>ÿ\0°å‡ş”Ç_´c§ã_‹Ÿ?ä°øGşÃ–úS~ÑŸTH˜´QEQÇ?ğPù%şÿ\0°´¿ú ×çí~ÁB?ä—ø?şÂÒÿ\0èƒ_ŸµsHìï±·üg…ëïş’É^^ñûÉæxWş¸Şÿ\0é,”†ö?Cş\"Çı‡ısæ+Š®×â\'üØ×7şb¸ªşWñşJO¬ô˜Ÿy“¹Óùşl+­ø{ÿ\0#$ÿ\0õîô%®Jºß‡¿ò2Oÿ\0^çÿ\0BZçàùáÅú2ó_÷J‡Á¿·ü­ßı‚¬ÿ\0ô¯œ«èßÛƒşNÖïşÁVúWÎUı`Ï€[vş\Zø=ñOÆ>]ğ¯€µ½_L•™îÒÑ³)ÚÀGB®\"¿P?b_ù4\rş¿¯¿ô¡©¥pnÇÁŸğÎ¿è”xŸÿ\0×ÿ\0Š£ş×ã¯ıÿ\0à:ÿ\0ñUú÷E>RyÏÈOøg_¿ôJ<Oÿ\0€ëÿ\0ÅQÿ\0ëñ×ş‰G‰ÿ\0ğøªı{¢Pç<\'öDğ§‰|û3Ùè~+Ñ/4}I5©\ZÖñ¸V“*p	àŠæÿ\0nßù5dÿ\0°İ§ò’¾š¯™nßù5dÿ\0°İ§ò’›Ø•¹ù£_cÿ\0Á=ä¤øàÔ2Óÿ\0GI_WØÿ\0ğO_ù)>7ÿ\0°e¯ş’¥ni-Ğ}hÅU™.~Ö³·…üYğÇVñ÷†´‹};Å:D{$–±ˆÖş¤I\0à°PY_®FA¯Í A\0ƒy¿b¾6ø—Mğ—ì÷ã\rkU•RÒ§…ûÉ$C\Z ÉføèªV5SÔ\08¨‘¤OVı›<A?†¿jÏ_Ã!EŸQ[½ã™LdãÃò¯lÿ\0‚ƒÿ\0ÉYğnè?şóßÁ)uÚOÀvpƒ½õÛVôYŸÑM}	ÿ\0ÿ\0’µàßûÏÿ\0£Å`ê|}_¦¿°×üšm¿ı…¯?ô!_™Uúmû\rÉ¦Ûÿ\0ØZóÿ\0BGp–ÇÒXúÑ­U™œ§Ä‡>ø›àûx¿H‚úÖT\"9YG›nÇ¤‘?T`pr=9Èâ¿üiá›ŸüF×|#y –}&şk&oØÄÇlŒ{×ìö­«iš‡w¬kĞYXZDÓÜ\\ÌÛR$Q’Äı+ñ³âOŠ\"ñ·ÆøºÚ8u]N{¸•†›äÈìv…©‘p9bÌŠ]	£*Gb:Wí\'Ã½boü#ğ¾»råç¾ÒmnecİŞ%-ú“_‹«“¸‚g’C±FIcÀñ5ûOàM_\rü/ğç‡çP%ÓôËkI\0şòDªß¨4D&~6xµñÆµjã\r¡që+éYUè46ğçí3ã$ÆQSXhÁÊJ|ĞñúóÊ’ĞWéçìE­¦«û%éöAÃI¥êvN3ÈÌjÿ\0ã²ŠüÃ¯²¿`/Ã§øÛÄ_¯f\n5H—Q±V=eˆm•G¹B­ÿ\0\0>”ÖäËcïê(¢¬Ì(¢Š\0+åÏÛË\\Oıšm40	µMfÂz¤jò±ü\n§ç_Q×çWíçãèußŒ\ZG¬gCáûV–çiÈ3àíú¬j¿÷ßµ\'°ã¹òeQPjuíŞïãƒ-eŸ^±ú\\!? ¯ÙÁÒ¿$¿f=Möµğ=¢&å‚üßHãl1´‡õ¿[Fp3Öª$LZ(¢¨ƒãŸø(Gü’ÿ\0ÿ\0ØZ_ıkóö¿@¿à¡òKüÿ\0aiôA¯ÏÚ‡¹¤v\n÷ØÛşO3Â¿õÆ÷ÿ\0Id¯¯xı¿äó<+ÿ\0\\oô–JC{¡ÿ\0?ãşÃş¹¿óÅWkñş?ì?ë›ÿ\01\\U+øƒÿ\0%\'Ö?úLO¼É¿Üéüÿ\06Öü=ÿ\0‘’ú÷?ú×%]oÃßù\'ÿ\0¯sÿ\0¡-sğ?üp¿âıy¯û¥OCàßÛƒşNÖïşÁVúWÎUôoíÁÿ\0\'kwÿ\0`«?ı«ç*ş°gÀ-‚¿Pb_ù4\rş¿¯¿ô¡«òú¿Pb_ù4\rş¿¯¿ô¡©ÇqOcèz(¢¬Ì(¢Š\0+æ_Û·şMY?ì7iü¤¯¦«æ_Û·şMY?ì7iü¤¤ö\ZÜüÑ¯oıšş:é_üQ¯êº¦{«®©i\rº%¬©Œ£³wuÎïÒ¼BŠƒV®}øà¡^Ç5Ò}ï!ÿ\0\nÏ¿ÿ\0‚‡iâ]3ámãI•®µDUÏ¸XÉ¯„ğh$¤©§vO*=Sã\'íãßz”_ğ‘O\r–“lûí´{ˆ#lc{Ìâ=2pMy],@Ï(æ¹8	ÌOà+ß>şÉ_~%ê÷º¾qá_’\ZKıF\"“JÂØf\'³6ëĞ¡ìuÿ\0°ÇÃ+¿|dŸâ%å³\r\'ÃÑ´pÈÃå–îEÚzìBÌ}%jÿ\0ÁB?ä­x7şÀóèñ_røÀşøsàKøRÄZi¶Iµ9yòÒ;±äŸéÅ|5ÿ\0ÿ\0’µàßûÏÿ\0£ÅU¬‰Nìøú½gáïí#ñcáƒÂ¾ÖlmtÅ™îsXG3os–;˜gµy5wşø#ñ[Ç_øCÁ:†¯¦4¹â\n]Naœ>•%3Ğÿ\0áµh,ÈË¥ÿ\0à¦ğ¨&ı³hi—jøÊÎxô›lş¨kÎ¼OğâŸƒ,\ZûÅ?üA¦Z\'ß¹–Ô¼KõtÜ£ñ5ÄÓ»#ºñ·Æ_Š?m>Çã?jzàÿ\0c,\"€°èLh’=Á®µü1a ê*´°ñ7ˆ@Ó&}²êKf×~G¡1«)#ÔŒã®\r~ƒü&ı>	ZiÖ*ºÕåøÈ&¶iXÈ;0>ÌÄzŠ¸6‘à¿²ìÿ\0©xãÇö?üI§É…´‰…Å¯œ˜\ZÊœ @zÆŒèH\n3Î?I*+kkk+8­--â·‚%	Q DE\0\0àè*Z¤¬fİÏÎŸÛÓÀÒhÿ\0\Z´¯ÛÂE¦½d ™ñÇÚ ùyúÆSşù5òm~¼|øQÆ‚:—…Fš¤x¼Òç~w(ĞOe`JfÏjüÔtûí\'WºÒõ;Ilïmeh.-æ]¯ŠpÊÃÔRÑqz«[Ã$Ö<ã-3Å\ZÑ¶ÔôÛ…¹·—¨§¡ÔŒ‚;‚k&ŠE¯_ş6ø[ãG\"Õ´‰ã·Õ`E]KIgıí¤øş(Éû¯ĞB¯N¯Ä¯ø^ğ§ˆ ×|5¬^é:”÷wVr˜İ}FGP{ƒké	şŞôkHí|M¢h~$€nHk9Ø{ìÊÿ\0JD8ö?G¨¯†Oü=şÏğ«÷¸êu—ÿ\0Ef¸şİß5Û9-<7¥è¾G}¢k¹À>\'ÊüÓº+>ÈøõñçÃ_<\r-ÕÌĞŞxŠê6\Zf’ç•ú	V%<–ïŒM~PëZÎ§â/ßëÚÕÛİê7ó½ÍÍÃõ’G9cÿ\0Öì0)uoXñ¹q­kú¥Ş§¨Ü¶é®îå2É!÷cüº\n¡RİËJÁEDÑu_ø’Ç@Ğì¤½Ô¯ç[{khÆZGc€?©=€\'µ!Ÿ]~À’÷Ç#ø…sû>Ÿl4ËW#ƒ4¤<„}TÀëïúà>|3²øIğcHğ]«$·!šöå>ÑrüÈÿ\0Lğ?ÙU®ş­7vQE1ÿ\0ÁB?ä—ø?şÂÒÿ\0èƒ_Ÿµúÿ\0ÿ\0’_àÿ\0ûKÿ\0¢\r~~Ô=Í#°W¼~Æßòyÿ\0®7¿úK%x={Çìmÿ\0\'™á_úã{ÿ\0¤²RØıø‰ÿ\0öõÍÿ\0˜®*»_ˆŸñÿ\0aÿ\0\\ßùŠâ«ù_Äù(1>±ÿ\0Òb}æMşçOçù°®·áïüŒ“ÿ\0×¹ÿ\0Ğ–¹*ë~ÿ\0ÈÉ?ı{Ÿı	kŸÿ\0ä{…ÿ\0èËÍİ*zşÜòv·ö\n³ÿ\0ĞZ¾r¯£nù;[¿ûYÿ\0è-_9Wõƒ>lúƒûÿ\0É hÿ\0õı}ÿ\0¥\r_—Õúƒûÿ\0É hÿ\0õı}ÿ\0¥\rN;Š{CÑEfaEP_2şİ¿òjÉÿ\0a»Oå%}5_2şİ¿òjÉÿ\0a»Oå%\'°Öçæ}QûøÁş8ñï‹í<aá­/\\†ÛO¶’õu˜DÆW¨=	\0Â¾W¯±ÿ\0à¿òR|oÿ\0`Ë_ı%JÜÒ[\\ÿ\0Ã?|ÿ\0¢Wá?üÇşbßàoÁËWİÃ\n!õşÌˆÿ\01^EY•Ì]+ÁşĞ¥hÑ´×\ZÎÊ(HüUA­ª( ¿>?à¡òV¼ÿ\0`yÿ\0ôx¯Ğzüøÿ\0‚„ÉZğoıçÿ\0Ñâ“Ø¨î|}_¦¿°ĞöM·Èò¼ÿ\0Ğ…~eWé·ì5ÿ\0&›oÿ\0akÏıTÇr¥±ôƒÇ±4R\"²0*ÊÃ ƒÔ_¿¶ìákà«–øŸàM4A \\ÈT°·\\%Œ¬x•\0û±98#¢±á¸ıªZÆ‘¦ëú\ræ‹¬YE{a{[Ü[Ê2²#2Ÿ¨5M\\„ì~\"W·~ÎŸ´.·ğ[ÆQÚŞM=çƒïeÚ\Z~Ky9àÏìã©†œ\ZÁø÷ğ{Pø/ñvëÃ’ù“i\0İi7ÿ\0-­Éû¤ÿ\0}Êßş!^_Q±¦çíö™©Xk:5®­¥İÅwewÏÄG)\"0Ê°>„\Zµ_\r~ÃÈfø3âKÎ\0kY[ å¤¶şn£ıñé_rÕ§s6¬òÏíCû+Çñ4Kã¯Å\r·‹£Oô›V!#ÕFOE˜`€©¨¦	ØüCÕ´SAÖît}oN¹ÓµW1ÏiuH˜ve<ëTëöâoÁ/†ÿ\0ôñŒ¼?÷H»aÔ­Ï“uû²Hÿ\0e²¾Õò¿`/XI-×ÃßØêöıVÏV_³N=„Š\n7Ô…¨hµ$|qEzŸˆ?fï~\Z‘×Pøi­Î‰Ö]:1x‡èb,Jàï¼\'â­1Êj^ÖìØuFGæ´Š¹‘EOöìãì7Yôòü+JÃÂ-Õ&™á]rõAo§Í!?’Ğ5êşıš>:ø–T[†ÚÅ²?ü¶Ô‚Ù úù¤Ò½ãÀ°¿u,W¼ak§ÁÃ5Œ¦iHô2¸\n¿‚·Ö…t|ƒ¡h\Z×‰üCk¡xwKºÔõ+¦Ù\r¥¬eİÏĞt¤àæ¿Hÿ\0f?Ù‚×á˜ño‹~Ï{ã+˜¶ß›u3üNz3şŒ“ë_\rş|=øO£›xz)$P³ŞÉûÛ›úé+rG°À€®ê©\"®QE2BŠ( à¡òKüÿ\0aiôA¯ÏÚı9ı¯şxëâß|9¦øM¶½¹²Ôâué-Â¡ˆ¨ ·^{WÈ¿ğÅß´\'ı\nÚ_ş ÿ\0\Z‡¹¤^‡€W¼~Æßòyÿ\0®7¿úK%Oÿ\0]ûBĞ­¥ÿ\0àâñ¯Vı›¿f_Œ_¿iMÅş,Ğl-t›8î–i¢Ôb™”¼‹…S“ó0¢ÃmY|Dÿ\0ûúæÿ\0ÌW^ã-SÕîíÂ‘cFK…Á$z×5ÿ\0WˆçÍ?ïêÿ\07qÇæx¬ïZ†\Zr‹jÍE´ıÕÕ#ìò¬e\nxHFsIëÕwg=]oÃßù\'ÿ\0¯sÿ\0¡-Sÿ\0„+Ä?óæŸ÷õÆºø{UÒu©n/­Ö8Ú€‡\rÎAíô¬8?‡sL6s†­[\r8ÅKVâÒZuv+2Æáç…œc4Û]ÑùóûpÉÚİÿ\0Ø*Ïÿ\0AjùÊ¾ãı©?g/‹Ÿÿ\0hKø;Ã¶×Ú[Ø[À³I$ºÜ6±¸¯ÿ\0†2ı¡¿èN²ÿ\0Áµ¿ÿ\0_Óø”Õ¯ÔØ—şMGÿ\0¯ëïı(jøçşËö†ÿ\0¡:Ëÿ\0Öÿ\0üU}Õû0xÅ\r¿gM7Â0°ËU‚êêY!u˜y™”îRG Š#¸¤ô=Š(« (¢Š\0+æ_Û·şMY?ì7iü¤¯¦«Ä¿j†Ş*ø«ğ!|/àëkkHjv÷[.g®Ä¸î=şaÅ&5¹ùI_cÿ\0Á=ä¤øßşÁ–¿ú:JóïøboßôĞÿ\0ğmøWÑ¿²\'À_ˆß<gâ}KÆöĞj0Aµ¼YÉd‘Øäœ0©H¹5cëZ(¢¬Ì(¢Š\0+óãş\nÿ\0%kÁ¿öŸÿ\0GŠı¯‘¿k¯€_>/xÿ\0Ãš·‚l4û‹k:[yÚêñ`!ÚPÀ\0zŒw¤ö*;Ÿúmû\rÉ¦Ûÿ\0ØZóÿ\0Bò‡ü17Çßúhø5ü+í¯Ù{áÏŠ>ü‡Â¾/·¶ƒR]Bâà¥¼âeØì\nüÃ¿äô=Š(ª ò_ÚàÕŸÆ„:*,Që¶YºÒ.Ÿ.p>ãî8ùOà{WäÍı…î•ªÜéš•¬¶·–²´ÛÊ»^)á•‡¨ ŠıÀ¯ÿ\0jOÙK\\ø‡ãËoü4µ°şÒ¼V­iq:Û¬Œ£äIà±køSëRÑQgÀÚV©¨hšå³¤İÉge2\\[ÜDpÑH§*ÃèE~¸üø·§|dø;aâˆqjQÿ\0£j–ŠÔ\\¨°?ºÜ2ûc_Ã|}ÿ\0 6‡ÿ\0ƒXÿ\0Â½—ölø#ûAüø¶š…ö‘¥Iá½IE¶­o©£”™Wºø‚ÃÒ’*VgØö^%ğö¤š‹éúŞŸtºd­ñ†uqk\"Œ²Éƒò9 ôªxëÁw1èÏoâ½\ZUÖË\r-’ò2/ŠõóûÌ³šùóá=å‡íowsÁâ-BYQÜ)DknCƒÍx¹ğv¥ã‚ÿ\0³O†t}Iô­Vk\rRçO¼N7¯{Ê¹>†ªäXûÎïÅ°¿¿±½ñ™os§Ú‹ëÈe¹E{{sœK \'*œ˜ñÅ7Iñ…uİMôíÄz^¡v–ÑŞ5½­ÊHëƒ1ÊTì`A\rĞ×Ä:w/>\"ëŸõÍcN“N×-ş\Z7W³‘6ù7°É\"Jû$üÃØâº˜õo„—?>6]‰}áˆü5¯H‹ÀO³ùÖîŞ¤2‘øEÇcêGâ/€4ƒ¨jxÏA²şÎ-¯|ûèãû4®\"I“ò±\0$UôŠŸõû©í´?ˆ\ZÔ¦‚º–;MJ)Z8“—‘‚±ÂŒŒ‚¾4ñ7‡u#ûh6Ôìí_Ä~9øg¯Î—À˜ÈšI¼RqŸ, \\û1¯r³ğ¿ŒôxÖïÅ>øM¤Cÿ\0íòC?„a‘nK˜›*ÅÑw€sÏP(¸¬z¦›ñwáV±©Ã§i<)yy3ŠŞ\rZ’F=¨l’}]ñ?Ä_\0ø*îŞ×ÅŞ2Ğô9îFa‹P½g\nÇ8Ï~•ğ¦—©ê_³ßÂßø—Á~\nğ·‡|IöX­~ $M5ÜN’oBª<¹_ÌWóÇããÏê\Z§í+ã\rwáÆ£à_êñé––zÿ\0…|anÂKxÖ<#A1PëÉ ã\'$ò0\\v>›Å>‚m&9µı1Xmºhk”ÿ\0M;wbyòóòçŠÄ‹âçÂÉµŸì˜ş#øTßù¦²ÿ\0jÀ$Ş\nmİÙãµò‡õ¿k±şÌÓx[ÃÒèŞ&Ôí?³íîÖŞDƒˆårK&ì•ôªÏÃß	|9Õÿ\0cÏŠºŸŒtMI¡ÖµÖKû¸cÄT“YÌ|c©÷¢ácì­[WÒôãWÖõ];O¶Móİ]J\"%é–fàEWŸÄŞµğ™ñEÆ¹§E¢EÁÔáE¿–q‡ó3·iÈç5ñwŒ|qsª~Ì¿şx¾=jñõÛ{]SÄQÙZËsvúu¹-c¼ù|ÿ\0²MSÒ<açüãâïÃi¾ÛŞH¬£Ô-ŞŞvÓæ˜=¹xÜRåÁ…fxâ7€<Y¨5‡†<máífíT³[ØjO ©Ú¬N=ê–¥ñwá^«ÜiZ¿ÄoX_[HbÚçT†9\"qÕYKdjùËâ¯‡¼\'áÏ|ñƒ4+Mñ¬šö‘\r¼šl)ÅÄ2D>Ğ ÔŒnÎzûÖG„ü9ãMkãÏÆy¼-áO†\ZÌQø­ÖY<e,lbŠ£\r¸ëœsEÂÇØkâ_?„¿á)MsNmÈûWö˜¸_³ùXÏ™ægnÜwÎ+š·øÑğŠîî[_‰ŞšyäX¢=Ziˆ\nªrI \0=kwFÒ o‡ö:6­¤èª†Í!º°±ˆ váÒ4#˜óœ:WÏß\rüàóûq|[³>Ñ>Íao£ËgØbÙlæ\"Å£]¸CF9ökßŒ¿	tİBâÃPø™á;K«y\Z) ŸU7RC+ÙAÕ¯­xëÁğÅ¿ˆµïhún“rªö÷×WiS”£†È9Ï×Çÿ\0<3ãgUøuáŸ|&Ö-54yüatx%Tª0òğAõ-^ƒ6•¤k?·î— øÿ\0MÒ¦²Óüº$jÖBs(YšØm$\0@ã!TzQp±ïÃÇ¾	>\nÿ\0„Àx·E>ÈU±ı˜Á@2gh9 c=N*õßˆ´­2Ú÷Z°·›T*Â9gUk¶Û»l@ŸœíçŒñÍ|—ñ¯Kø?aû3|WÒ¾<)/öş5ÛKF\"Şå®¢î×åÎBq‘ÏA\\İ¦¡â\rşĞ	~ø¾IîµxGÓ5^/´©mX[¾¼¤Èÿ\0g`ø‡âoÃ¿	k0é\'ñÇ‡ô{ù€)m}2z¬rõ<VÅ×ˆ´Ó–÷[Ó­Î§ †ÀKr‰ö·#!bÉùÉ€¹â¾cı¼=àø[âF¯ñ#KÑuOÉâKøuÙ5˜ÒI`…N#R_˜ãœÁç-ğ5ÕÄ¾ø <³höŸ®íôigbsb»¼¼ü ïéŠ.;~Ë,P[¼óH±Ç\Z–wr\0P9$“ĞWxã†¼yãÿ\0xwIÔt\'M6a\r£Á¬Cq> ƒ$«d¬jNĞÙ9Á8¸ŸÚÿ\0P¹ö_¾[K¹cÓæÔ¬­õym›”²y€“$tåØ×ûEøoá×…>øYøm¥èšgˆáñ›FDI§F`ANdB˜É9ê2yä¸’>ŒñOÄø À¾0ñv‹¡µÇú”Ô/tÊ†9#Ş­Mã	[ø~Ç]ŸÄºBiwò¤—Æî?&âG8EGÎ±\08¯™üca¬ü|øï©ëşÒ¼]ã:ú8t#Y’4İaå)\"iAT»¾?yÎ§­xzûözµÑ<=à¥ğœ\ZGÅ]:ŞâÂ-Tê1	™÷9‰ñµS<_—Œ´\\v>Ôñ?Ä?x*âŞxÃCĞæ¹ÿ\0S¡y\r Î2HÏ~•´5=4è¿Ûjtÿ\0\'ík©‹ËÆíûó¸ç9Æ+æ…Ú\'ƒüWûCürºø§iZ¯k«­¢.±\ZHmôÁîö	>ìdrHÇÖ°~(x¿áï†ÿ\0b\'Á/¯®´_¾‹bmÖâêdƒÍ-xcFùÛh¡W›Š.+Xhºî‹âMcÃúµ–©§ÏŸ*îÊeš\'Á á”pA…dø‹â7€|#©&â¯\Zh\Z-Ü‘‰’\rFş8’\0ÄeHÏ±¯?e/hÚ7Ä_\Zü$Ñ­õ{=	e\Zï‡`Ö,ä´œ[¾Ô™6J²\0sŒ“ëP|XÒ¼E«şßºu¯†<-á?^ïk?gìÊ‚í²ã\nÇx$ÇBÔ\\,}	7Å†6ú¦¹?ÄÅ¦^I$V×¯©B!™Óïª¾ì¹\0ñN±ø©ğÓSÒõ\rKMñÿ\0†®ìôØÖ[Ûˆ5(-‘¤`ØPO\0šù³ãO‡¼AµğF_øË_—W¿2hëÎ0‚C\0›ŠÉ;sš¿ñ?ÃŞ\'Ñc?ŠoâŸü8Ñ§—O„@|¯š‚UÏ¹¡#n3ÔÑp±ôg‡¾\"xÅ·ícá\ZøYºE,Öú~¡ò\0:’ªÄãŞ¨ê_¾húµÆ—«|Gğ­õ´†)í®uHc’\'U”¶A•ó¿Å_xOÃz?ÀíwÁZF•¦xÒ_éPBúl)÷ïú@p€\\c9ÏSëXğç5Ÿ¿&ğ¯„¾k0ÇâÙ’I<c*6À@b0Ù¾ô\\v>©Ô~)ü4Ñílnu_øjÊBug%Æ£kq8!-†\\÷VÖƒâox§L:†uí3Y³\r°Üi÷Ip½!#>Õò‡Å=#Ä\'ö¬øs§h>ğv¿ªÃà»Ú%Ùi»•şqPà™¯8¨¾	x«JğWÂïŒoWJÑ¯Ìû.ü¦ÀĞE¥\\À¬‘ÄèØËÈì>eëŒó‚â±õ—â_kz–£§èúæw¦Ëä^Ákp²=³óòÈ åOƒéSiúæ‹«İ^ÛiZµôÖ{¸í§Y\ZŞP3²@¤ílv85ğwÀ/Úü;øëàËË˜|C¾3³“OñEÆ­¦Ïkê’LÓÃ$o\"…~\\Ç‘ÛõïŸ³Ä°ÅñOã‰’D>4“ï?å¡0h÷}[WÒ´ãWÖõ];O¶]óİ]J\"%Î2Ìx$u¬o|Eğ‹/ÚÇÂş6ğş³tŠY­ôıB)ä\n:ªÄãŞ¸/Ú¨†ı|~A4GıtJòoŠ~ğ—†ôº÷ƒt+Lñœ¾!Ò`…ôØRî-äˆ} 0@®1œç©õ¡°HúSÄß<à»Ø,ü[ã=D¸Ÿ˜¡¿½qÓ!Xçı+¢´¼´¿±†öÆê«iIğ8t‘OFV}E|ÁğOAğgŠş,üg¾ø…¦i:¯Š\"ñ,ö“G«Ä“5¾ 	Û\\ò8àVçì‰\"¯€¼i§i´Ş±ñeõ¾‚Å‹\"ÛØÉëbqÛ“EÂÇ¬^üZø]¦ë“hÚÄ_Yê0Ja–ÒãT†9#qÕYYØÖŞµâ\røoJ‡Sñ¿¦évSÈ°Åsyr‘G#°%UYˆ	Ú¾(µğ¿‹|_ã¯š†~øWÅbûÄ·Í¬kWqÂÚs´`ŠP¹Æw‚¤r+7â–Ÿboü#ğÅWzö¹aàŸ\n¿Û®t]:{ÖmVhv[n‚Áan ãŒÑqØû§Ä>(ğß„´¥Õ<Q¯iÚ5“È![Bá`Œ¹…Ä¤ãØÕ?xûÀŞ/¸–ßÂ1Ğu¹¢]òE§_Åpè¹ÆJ£{×Ç^5ñÕ÷ÄŸØoáÕÅ´ ±ñ®›£ßÙß‚©%Ü>bm˜HWdd<WIğËNºÔÿ\0n!/‹|9á?‡:ç„ô«‚š6‡Y†q?ÍÚ¨ñ¦zcp=@ÁÁqXúº_xvÃáiµÍ:=nxMÄZk\\ ¸’1œºÇÅ~SÎ;Jsø‹@ÅQøfMjÁ5© 7I§4ê\'x È#Îâ¹gâ¿<¼Eñ\"\rGâ«ûAÙYx’mcMñDO¦I›9±m0JpËÁfäğsMzwÆ{ø¯ö»Ó¼kğÆô¾·¡øi(£åÔnßtÔI¬1Üàw¢ã±ö\r†½¢êº†¡a¦jÖW—Zt¢Ø ™]í¤#pI\09Sp{W=à\'u[Ákc\r¶©6Ã¨Çs,åGÍ#ÆŸêA9\n¬K	 WËŸ\r¾4ézo?hŒZ\\rF·Z½ÆŸo0Ã›™mV8ã#¹{â±?g\rMøkñóÃzxŠ_èÉi¬K¬é³Ù«ëq–—|fP7†ËÇ|ô\\,sŸ¶N›§[şÕš7ÙôûX¿´bƒí»\"UûW8ıîÏÀæÏJú{ÄúvŸgñÓàmµµ¼6Ğß$Å¢Â¿dQ„\0aF;\n(¤7²8/iÚ|?ş=´6Ñ™üLR%a1.KqÉ>õ{âÅ•”ÿ\0ğMıí ’8ì4¢ˆñ†U;£\0ôà‘øÑEìXı¨ìíìwáëck“İ€H¶\r¨AŠùÇö}¶·µ¼AÏ†u@p£‘ä(¢“Ükcß5}?O¸ÿ\0‚XØÃ=´±E¢ÛI\Z<JÊŒ&epFO\"¼köºµ¶Dø[¬Goj7º¬wWŠ€Mp»å‘ú°ö$ÑE6÷]CIÒ´û¯Ù²ÚÃL³µ‚·x¢‚EBÖ ±P$’qÔšùÃú‰¨şÒæËPÑì.íe×f2A=ºHşİTŒ\Z(¤Æ²´K[Uı¿<@ëmkÛÃ3yªv/÷WØq^añâÒ×ş7ÄÏôhÒ~Fgùï¶İF÷°8éEú·9?ØçCÑgøÃy6a%İ­«›{‡·C$$ğJ1^	W–|o³´ÿ\0†“ñ³ı–Ï¬LY¶±ã“ëEºÔûÓöxUOÙ{ÁJŠF˜˜\0`Z°|+ûdüX™bE‘ít ÎØˆã\'½Uv#¹ğ‡Ä›;5øÃâÒ¶°ÚÅã äùïÉ¯¡?h½;O?°?5Saloí--VÚìÄ¾l¡øÊç8=¨¢¤¾Åè4&×ş	‰l¶Ú]”\"æâÒyÄp*‰¤ûd_;à|ÍÀäóÀ¯JøÇcdÿ\0µ/Ák×³®–úåæ0\\/–uÆI8¢ŠhGÎŸ¶f•¥Û~Òš–úmœ/¨ÇÛš8UMß8ıîÏÀ{=+Ó?km\'J³ø	à=2ÎŞÒÚp ·ŠHâgèªğ¢ŠO¨.‡;ûišmõÄkİ>ÖæÖ}6š	¢WI÷¼2‘‚=r_±æ‘¤ÜşÕzà¸Ó,æşÍY™\n·Ùå–GÉÔıÜQE}N·öùÓtëy<3¬ÛØZÅ©LL^Ç¬Ïï¸Îâ¼	Åtzƒ¡é¿±ÇÃh´íO´I¼S¥ÜH¶öÉy<Ãó°–ã©æŠ)õC“ı»tÍ6/x?P‹OµKËÁä\\Ü,J$0øíŒ²ã±â½Z-+L³ı§>\nØÙé¶–ö¶½{h\"…Q &!’Šı(¢¢ènøî—ößøWt± ´íJ#(Q¸¦ÌíÏ\\d*ÜĞÃÿ\0´ŸÊO7ş‡_3hİµôÏ¥SÍ?n[x&Ğ|ÓA….®Ê—Pvşí:g¥xWÂÛ[Vø/ñ†3m	FĞmC)A‚>ÕŞŠ*^å-@ı´=o‹—Ú„Ú=„—–¶¬mîİçƒ±±•àãŠò_6vƒöñ«‹Xw6³9c°eG&Š(è>§Ñÿ\0­íÇÅ‚Ò#¾¸Um£ y‡€}+‡øãegí7ãí K[ëK¸0å·¡İ\"ôsrsEú·=çö®†>[I$Hï»c,,Ê	Ä‡§±<Šø³ãm¥§ü4\'ì°î}Zá™¶±ÏSëEH\"}¡ñ\Z¥ÿ\0‚{O‘#Æ|1d\n2‚Ùjğ¯ØßCÑfø»{¨M£ØIwkjÆŞáíĞÉ	<Œ¯(¢‡¸-™[öíÓ4Ûo‰şÔ-´ûXnïbX®®#‰VK„\r€²0a0sÅ}™ğ×MÓ´Ÿ„^±Ò¬-lmRÂ\"[D±\"’ œ*€I$ûš(¡n\'²<÷à\\0ÅñâûG!HÎU@Ü|±Éõªÿ\0â‰~/üh¹ šOyBÌ/”ÔÛÒŠ) îxŸ‰l¬ÓÇş3m X‡Å}`‚09I	|xúõ®ãöªŠ+‰¾Ôà\"½û.¥Úm—Ë0¦áÎÓ¹¸éÉõ¢Š]Ôíüceÿ\0	§Øı²·„¥ÌXØs“òôäó\\ìígâ‡¦1¯˜¿ãŒ>9/ÛŸAéEàï´­2oÄ–1iÖ‘Ú¿ÅÍ?|\n„n%<®0yæ½Ïö§Š#ğûÂwf47ş,±xeÇÏ|ü©ê¨¢„>§ÿÙ',1,8,2),(20,NULL,5,'Palestra teste 4','palestrateste4','<ul style=\"list-style-type: disc;\">\r\n<li>Lista n&atilde;o ordenada item 1</li>\r\n<li>Lista n&atilde;o ordenada item 2</li>\r\n<li>Lista n&atilde;o ordenada item 3</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<ol style=\"list-style-type: lower-roman;\">\r\n<li>Lista ordenada item 1</li>\r\n<li>Lista ordenada item 2</li>\r\n<li>Lista ordenada item 3</li>\r\n<li>Lista ordenada item 4</li>\r\n</ol>\r\n<p>&nbsp;</p>\r\n<p><img src=\"http://redesuldenoticias.com.br/fotos/36396.jpg\" alt=\"imagem 1\" width=\"640\" height=\"301\" /></p>','ministrante 1','UTFPR - Campus Guarapuava','UTFPR Guarapuava','2015-01-12 15:00:00','2015-01-12 15:00:00',38,'2015-01-08 21:40:00','2015-01-09 14:00:00',12,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0Ö\0\0\0Ö\0\0\0š=Œ\0\0\0ÀPLTE#îîîÿÿÿûûûóóóøøøñññ \0\0\0üüü@‚®\r\"\0ØÙÚ\0\03;DéééINU\0\nÀÂÅ\0\0?€«\0\0Cˆ¶<y¢QW])3f‰”˜.[{7n”#1ÎĞÒ&5\'Mh/^x|€/@!?V\"+$G`ßàá £¦‰Œkot)/63F´¶¸^ci€„‰MRX?EM¬¯²º¼¿cio!(0Ÿ¡¥08A%	\n¾)M\0\0¤IDATxœíš{{¢<·‡Ñ¢(GQ„ŠB¥V<¶Õúı¿Õ»²â»Çw?uÙóÇ^÷\\WKBHòËJVVÒ‚ ‚ ‚ ‚ ‚ ‚ ‚ ‚ ‚ ‚ ‚ ‚ ‚ ‚ ‚ ‚ ‚ ‚ ş_£õúÚßîÍ¿„¦¦ï•*RïM†ô·{ôo`æ­j‰ÑôåÌh#ı?×ñgëÿ¬xûyÔ¬Ş î_ş€½´Ípçé’<Ğ£ÇÙøŸl*Õï4‡‡šşo‡ü©T[Õ-Sjy\n÷­%¶¶ªT›Œ³\"ş¼±x_.å.)íZ‰Å¹ÎX­-Ù\\\ZôNSáó‘®ÇÉôH“‰|W–¶X!/ĞÓmë¤¤–F£¼yJĞmx›g`súì¥ËRÛS}¯û1]¯×ÓUÇ0ôS½›n™g]ÚìO±æªøf	?#f?Ôdâ8)¼»²¬¡ÉÈ0œ»³ùóâs±æ<-®,fÉVŒbuã™%òå‚¥¬Å¼×2kP²fvgÛîòV™ÑûÇàÜä†WüôêıÌXjÁ&Ÿlö,·Pï””¼wÖDÕü’Œn­ùTwË`Çz3«†æÛàL†OP°ÚâkÜ‚ñ†Kp\'Zã­%&,hV°ûÚgëû\"5W\\°ö²¬²†ª£ÅÏTÉEÈ\\Ÿ\\Ø‰Î~\'Îä^Qm;b]¯.B£WEUïSkÒàõ	sz$|½c¹=òöSs–Ğ¾Š½<Ó¬v\r4g9«}qK¹*ó`ÜëÕ/Ñ=° Îœ«t•™ÿë²ÆÊÄ6¦}c‹ıhæİKkÖG³`Xµ—ÿÁG|Ğb…+o–$¿õş©Ùƒ\núkñäóš­Mª}´¤JP3%‘ÙïÄ	<–á…Š;“e®9önd­ùé\Zƒ×&8İ§§ıuf[“ùáæ¨£±Ñ‡·Õ¾•<èV­ÙÚÀD­@>¼¨ÖÄf½v3ßj‚µÕšWªâÆDjªøâõ§[–(™Êe¹cfwi9öd|ô\"»){Úç·°ùêê.²š5­3Ñ\"ŸƒF—u­Ù[‹WÕ›®?v\"JE$}¾cçó^™7°VcÎw¬Ş– ÅÍeÍ\'ÁÉ\'â8Q˜„Qø­ô$ë%<õ¾®Œµ2qø!Or!|û`êigë`%jë†eVãæ›¥m[¬¶j§1\0ƒÆçV‰Í´¶?õíjæØ3”UØŠëa/%y¸®íF‰zãêaÉ û\Zı=v©¶/Íøş\\Ä¼×¾ô²cV©¹µh£ú¼İçÆÚáŞlVõ“,ØØÑX|»•âŞˆ±;‡\Z«şöÃ…s0qøÚ‚¹§(áÉµ«q‘eEüÍÑ[+íæÔò–§öJ£øµDUà@>NşVòrìşÊúÄâzËáÃ¯cŠ6y?Å“}î++kˆT‡?ıĞáP—BE±Ï>P’U•zÙ\\ía;ølz(ËÜ–ÂŸÎˆOªƒft+(zÃƒ¬.NÎüĞşÀQÍœïéX¨–o\rmÏêmO•\rx3Oo:ŸÕ?Ü‡O²”ƒ9˜.¡‚ëBZJ5F5Qk½ƒµiá“Y^Zo&æ½à±ÉÀ%²ıu½Æ¾ê7–O\"£v#è4¯wzÚ+Œnßìxvkû³‹Ë‚I¨ğ°œè\n½ëÔ“„YÉJ_&oÎ³V9o±4µ!v³	3o0dı¯-?Qt‡_íÅ7jË¶öYaùó©ûÚgÎó¡ûq(ˆZ259ò~ƒå%Èû#ûq8)½Œ.ïÉĞ…Oùõ4N\ZûR¯Óèa‡ö¼“/<õÑî˜â­µ¸[lİ§’qÙ`îJú‡Ú#\'89eRÆ¸ûJŞ„%ì(ËÇ£&®›Ê×¢í5¶Ãw–eÆ—Y¯ur>øàı\Zø(®q˜!àBY‹öé£ÖÍîÔ;hı57îåj¬/²j=í±ó¶ê2<»:c)Øµlpğ°è¼²/ì/±¥ÑV3V¼ã•éÅGYo|áÀş,}åó¨&oô×TÕiÜ 	%ªöÏÃØ´Î²òÜ—ÅfœFJ-&®âpeQâ•í/}Äz½.B(ktñ±ûš„4v5Ì€xI‹ñÑ|CÍÆ¿Z6Úó\n<‰ùówwmµD,~YCÚâ«‡ÌÜÂB[Eq³ó%É$ˆ‚ œ¥·ÇI£ÛÂîúl!ñv+½·…Çøòr|9m\\Ã>í^ j8Z¯ì,!…ßìAûŒÅ¦¯ÉJ·6WÆ¾Î«\n_ğåç¨]–¼8†W•ØéëZÎššõJ¥^Y÷İ\ZB›@½nÏ<=zŸZ_\"KÔ+£×××ı.g‰ÚÊèã÷İÚ\r/L_ ògùâ¨t¤?{óO2Ø~ó0»Œ~‘“ÆWY{ì•É¶Ø{QF…\0G–\'Ùzkp@ßÈò¦uÍröÉ#|Jƒ=f.KsÓ\ZòÚæáqÔ™º’ïÁ’®Îf—\0íe\'²¦rÜ‚ûÓÊ@À`/~Ë¬¿Cnõ¾gWÄ=8˜wT;¿Æ}ÒçKšÏ®,^\rîWàØ3µ,L’`|± ¶íá¸¿ó=´ş+Uõ‘ÅVá·wâŞcÎüşI}j@\0ÉrÍUiimG|„¼ßºtÔ\\^ ,È$_åøB)éU¦ñÜÂFU¦-ñÂD¶kù­aêk<ê~´¾Ù‹Å¹+³t¢2>Lnâß¼s”¤ç!øu;H v/²db;vI•`ği\'–Ô7>–-¼`âpÏ‘côÛ™nn’¸-úŞ´Ç¾ÀH—ıîmáÈ‰%z¥¥¥­±²ü¡°éF—0‹¸ÁØ¥Øğ6ãÛ¨×:t¦<ª’Õ;xˆàa£{Šéµö×¢seqş¤mtß¦ÈğsóKÜø<ÕùMQ5ó(W;¼Ù·´C^a²z7;‰¤%XBÓ/¯Ê”*bWº}øÇ0.oV‘ôı£Ç‘½\"t/s\'…p\r¡\'SeÖ‡¿åœş²¯I@€‘²_ŠqÕzºDUfÙaİEº9²İ½úÖËÏıYe÷M¾*ßäö™¯BQ•÷Ãÿ>5ä´P/— ú8½óş—Œ¿mÖwŒ’%G½jÆ	¸%68~à&ğ$mà<õÊê$ôu•é’Äö‰¤3kK\\2-NTîİ×Iq*¤c=ã±7¥‰yBšBˆÇÔä8NcY…ª0Nù+iá†Ç83oÇcÁÃ)(MÁˆôÀÆÿğ‡2x=Ë\Zİ½ìÌq3%SM9¡cÛ<º0ÏÜ,p§˜°¼H±İBfóÔfy¡bãİd\0Û‰â„)œ%ìqU@8wºcşs4z¸°òÑ®soôà(ãD;S;œ8c7H\'Nd»±î‡Qb»‘“8Q’Ì8ïÀÁ@ğ\'J2Q\n%,ì‚17r•P	73»¡#Õÿ¬¹Œß>7/w½ °ÛR;Lì4K7V’†kGQäé~LèvD®›F‘ÁZ^¤0½nz´_Š•Y ¤6ŒHd9YgôÀ\rù^sÿ’.ş\'Ñÿò¿¼ÀqCÇñ&Aì{Ñ$u¢fìÂŒà¸I–‚u¢\"	” +$=”È$Ê$PÀkfvE…Ùnâ2­~á:a’†×S2Y¡;›¹¡$ª”ÙØ…éäâïfØiºnvtƒq‹Femæ±¾ &A\nCá“@CO‚êÜ ˆ²{>ü?Ã?ªêÑ×}èœ`”áˆã–/äXö}9†Sû:»zÔÕøxT%5ğúß‡H@ö%Õó|É÷ÙU‘Ãw]Õ/¹¶Ù“÷Ş:(R//õ»Náş‚ ‚ ‚ ‚ ‚ ‚ ‚ ‚ ‚ ‚ ‚ ‚ ‚ ‚ ‚ ‚ ‚ ‚øÿòC•ä“¢.\0\0\0\0IEND®B`‚',0,0,0),(21,NULL,5,'Semana de Palestras teste','semanadepalestrasteste','','Organizador 1','Unicentro Guarapuava','Unicentro Guarapuava','2015-01-12 10:00:00','2015-01-16 17:00:00',100,'2015-01-09 10:00:00','2015-01-12 09:45:00',357,NULL,0,0,0),(23,NULL,1,'Semana AcadÃªmica teste','semanaacademicateste2','','Professor 01','UTFPR - Campus Guarapuava','Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR - Brasil','2015-03-23 19:00:00','2015-03-27 22:00:00',81,'2015-02-19 12:00:00','2015-03-20 23:59:00',18,NULL,0,0,0),(24,23,3,'Palestra 001','palestra001','<p>Palestra teste 001<br /><br />Conte&uacute;do<br /><br /><br /></p>\r\n<ul style=\"list-style-type: disc;\">\r\n<li>Item 1</li>\r\n<li>Item 2</li>\r\n<li>Item 3</li>\r\n<li>Item 4</li>\r\n</ul>','Ministrante 001','UTFPR - Campus Guarapuava','Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR - Brasil','2015-03-23 20:00:00','2015-03-23 22:00:00',80,'2015-02-19 12:00:00','2015-03-20 23:59:00',1,NULL,0,0,0),(25,23,2,'Minicurso 001','minicurso-001','','Professor 001','UTFPR - Campus Guarapuava','Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR - Brasil','2015-03-24 19:00:00','2015-03-24 21:00:00',25,'2015-02-19 12:00:00','2015-03-20 23:59:00',2,NULL,0,0,0),(26,23,2,'Minicurso 002','minicurso002','','ministrante 01','UTFPR - Campus Guarapuava','Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR - Brasil','2015-05-25 19:00:00','2015-05-25 21:00:00',34,'2015-02-19 00:00:00','2015-03-20 23:59:00',1,NULL,0,0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_bonus`
--

LOCK TABLES `event_bonus` WRITE;
/*!40000 ALTER TABLE `event_bonus` DISABLE KEYS */;
INSERT INTO `event_bonus` VALUES (4,2,21,2),(5,3,21,1),(6,4,21,3),(9,2,23,1),(10,3,23,2);
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
INSERT INTO `event_type` VALUES (1,'Semana AcadÃªmica','Coordenador','semana_academica'),(2,'Minicurso','Professor','minicurso'),(3,'Palestra','Palestrante','palestra'),(4,'Sem InscriÃ§Ã£o','','sem_inscricao'),(5,'Sem Pagamento','','sem_pagamento'),(6,'Outro','Organizador','outro');
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
INSERT INTO `media` VALUES (12,'p',11,'Logo Semana AcadÃªmica TSI','/pi2_integrador/media/image/event/event11_image1.jpg'),(13,'p',13,'Logo minicurso Linux','/pi2_integrador/media/image/event/event13_image1.png'),(14,'p',14,'Logo - Palestra sobre mercado de trabalho','/pi2_integrador/media/image/event/event14_image1.jpg'),(15,'p',17,'InauguraÃ§Ã£o UTFPR-GP','/pi2_integrador/media/image/event/event17_image1.jpg'),(16,'p',15,'Logo - Mostra de Talentos','/pi2_integrador/media/image/event/event15_image1.jpg'),(18,'v',17,'UTFPR Guarapuava 3 anos','https://www.youtube.com/watch?v=tkOsLyMDFao'),(19,'p',15,'III Mostra de Talentos UTFPR Guarapuava','/pi2_integrador/media/image/event/event15_image2.jpg');
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
INSERT INTO `news` VALUES (1,11,'2014-07-13 18:47:00','2014-07-23 16:19:00','ProgramaÃ§Ã£o da IV Semana AcadÃªmica de TSI','A programaÃ§Ã£o da IV Semana AcadÃªmica do curso de Tecnologia em Sistemas para Internet foi divulgada.','<p>A programa&ccedil;&atilde;o da IV Semana Acad&ecirc;mica do curso de Tecnologia em Sistemas para Internet foi divulgada.<br /><br />A semana ter&aacute; palestras e minicursos sobre diversos assuntos relacionados ao curso de TSI.</p>',4,NULL),(3,13,'2014-07-23 12:57:00','2014-07-23 12:57:00','Semana AcadÃªmica de TSI terÃ¡ minicurso sobre Linux','Na IV Semana AcadÃªmica de Tecnologia em Sistemas para Internet haverÃ¡ um minicurso sobre o sistema operacional Linujx','<p>Na IV Semana Acad&ecirc;mica de Tecnologia em Sistemas para Internet haver&aacute; um minicurso sobre o sistema operacional Linujx</p>',0,NULL),(4,14,'2014-07-23 17:09:00','2014-08-31 19:32:00','S. A. de TSI terÃ¡ palestra sobre mercado de trabalho','A IV Semana AcadÃªmica de TSI terÃ¡ uma palestra que falarÃ¡ sobre a relaÃ§Ã£o entre o profissional de TI e o mercado de trabalho.','<p>A IV Semana Acad&ecirc;mica de TSI ter&aacute; uma palestra que falar&aacute; sobre a rela&ccedil;&atilde;o entre o profissional de TI e o mercado de trabalho.</p>',11,NULL),(5,19,'2014-12-18 21:51:00','2015-01-29 19:46:00','Noticia teste','Noticia teste subtitulo','<p>Noticia teste descricao</p>',13,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant`
--

LOCK TABLES `participant` WRITE;
/*!40000 ALTER TABLE `participant` DISABLE KEYS */;
INSERT INTO `participant` VALUES (4,'Participante TesteA','30145144119','1234567890','M','1995-10-10',1,'rua 1','111','bairro 1','77777777','complemento 1','55555555555','77777777777','teste5@teste505.com','e10adc3949ba59abbe56e057f20f883e'),(5,'Participante TesteB','53830951876','1234567890','F','1992-07-15',1,'Rua 2','222','Bairro 2','22222222','complemento 2','9999999999','8888888888','teste7@teste7.com','25d55ad283aa400af464c76d713c07ad'),(6,'Participante TesteC','79875886955','1234567890','M','1993-05-05',1,'Rua 3','333','bairro 3','33333333','','88888888888','77777777777','teste9@teste99.com','e10adc3949ba59abbe56e057f20f883e'),(7,'Participante TesteD','22540907989','1234567890','F','1989-02-27',1,'Rua 4','444','Rua 4','44444444','complemento 4','8765432100','00112233445','teste11@teste11.com','25d55ad283aa400af464c76d713c07ad'),(8,'Participante TesteE','82550675665','1234567890','M','1996-07-08',1,'Rua 5','555','Bairro 5','55555555','','5874445555','44488875474','teste4@teste4.com','25d55ad283aa400af464c76d713c07ad');
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting`
--

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
INSERT INTO `setting` VALUES (1,'site_title','UTFPR Eventos'),(2,'favicon','media/img/favicon.png'),(5,'themes_name','PadrÃ£o, UTFPR'),(6,'themes_path','default, /app/resources/css/utfpr.css'),(7,'current_theme_name','PadrÃ£o'),(8,'current_theme_path','default'),(9,'banner1_name','Banner 1'),(10,'banner1_path','media/image/banner/banner1.png'),(11,'banner2_name','Banner 2'),(12,'banner2_path','media/image/banner/banner2.png'),(13,'banner3_name','Banner 3'),(14,'banner3_path','media/image/banner/banner3.png'),(15,'banner4_name','Banner 4'),(16,'banner4_path','media/image/banner/banner4.png'),(17,'contact_mail','email3@email321.com'),(18,'header_title_banner','media/img/header_title_banner.png'),(19,'maintenance_status','0'),(20,'maintenance_message','site offline'),(21,'google_maps_api','teste5');
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
INSERT INTO `sponsor` VALUES (5,'Escola 01','www.escola01.com.br','DescriÃ§Ã£o da escola 01'),(6,'Universidade 01','www.universidade01.com.br','DescriÃ§Ã£o da universidade 01'),(7,'Empresa 01','www.empresa01.com.br','DescriÃ§Ã£o da empresa 01'),(8,'Universidade 02','www.universidade02.com.br','DescriÃ§Ã£o da universidade 02'),(9,'Escola 02','www.escola02.com.rb','DescriÃ§Ã£o de escola 02'),(10,'Empresa 02','www.empresa02.com.br','DescriÃ§Ã£o da empresa 02'),(11,'Empresa 03','www.empresa03.com.br','DescriÃ§Ã£o da empersa 03');
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
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsorship`
--

LOCK TABLES `sponsorship` WRITE;
/*!40000 ALTER TABLE `sponsorship` DISABLE KEYS */;
INSERT INTO `sponsorship` VALUES (143,19,7),(144,19,9),(151,18,7),(152,18,8),(153,18,11),(155,17,11),(158,23,6),(159,23,10),(160,23,11);
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

-- Dump completed on 2015-03-02 17:14:51
