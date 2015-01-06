-- MySQL dump 10.13  Distrib 5.5.40, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: events
-- ------------------------------------------------------
-- Server version	5.5.40-0ubuntu0.14.04.1

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cost_event`
--

LOCK TABLES `cost_event` WRITE;
/*!40000 ALTER TABLE `cost_event` DISABLE KEYS */;
INSERT INTO `cost_event` VALUES (1,11,'2014-08-20',15),(2,11,'2014-09-19',20),(4,13,'2014-09-19',5),(5,14,'2014-09-19',5),(6,18,'2014-09-17',15),(7,18,'2014-09-13',20),(8,18,'2014-09-15',25),(9,18,'2014-09-17',30),(10,18,'2014-09-18',35),(11,18,'2014-09-27',40),(12,19,'2014-12-15',15);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment`
--

LOCK TABLES `enrollment` WRITE;
/*!40000 ALTER TABLE `enrollment` DISABLE KEYS */;
INSERT INTO `enrollment` VALUES (1,4,19,'2014-12-03 20:20:08','2014-12-03 20:20:30',NULL,15,NULL,1),(4,6,19,'2014-12-08 15:14:49',NULL,NULL,15,NULL,1);
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
  `views` int(11) NOT NULL,
  `logo` blob,
  PRIMARY KEY (`id_event`),
  KEY `fk_event_event` (`id_parent_event`),
  KEY `fk_event_event_type` (`id_event_type`),
  CONSTRAINT `fk_event_event` FOREIGN KEY (`id_parent_event`) REFERENCES `event` (`id_event`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_event_type` FOREIGN KEY (`id_event_type`) REFERENCES `event_type` (`id_event_type`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (11,NULL,1,'Semana AcadÃªmica TSI 2014','<p>descricao teste 1</p>','ministrante 1','UTFPR - CÃ¢mpus Guarapuava - Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR','2014-09-22 19:00:00','2014-09-26 22:00:00',150,'2014-07-23 00:00:00','2014-09-19 23:55:00',1,'ÿØÿà\0JFIF\0\0\0d\0d\0\0ÿì\0Ducky\0\0\0\0\0(\0\0ÿî\0Adobe\0dÀ\0\0\0ÿÛ\0„\0			\n$$\'\'$$53335;;;;;;;;;;\r\r\r%\Z\Z% ## ((%%((22022;;;;;;;;;;ÿÀ\0^\"\0ÿÄ\0¬\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0!1AQa‘\"2qBR#¡±ÁÑb’Cr‚¢3$áScğ²ÂÒ4Dñâ“£d%\0\0\0\0\0\0\0!1AQa‘¡Ñ\"2qÁBRbr3±#ğáÿÚ\0\0\0?\0õT!B\0B€„ !B\0B€„ !B‚. ´”¡S^óE„0ÛŠ›~O\0ô»îV–³²âNÌ[#C‡Ü€™B\0B€„ !B\0B \"	\0M\0ÚJ£Ôy·K´w“¾.rr†Çà¯Köv /ªıSşánç¸Ë²½­Ø8+\0„!\0!@B„\0„!\0!@B„\0„!\0!@H›$±ÄÃ$cqsœh\0é%\0ä{ÒçÖŒK‰ )¬|ÃÓ-K¡Ó›ñ³Œ3\"ö¶»«µfî.yƒ]v{éLVç…€t0mëU&FÍn©ÎÚm®hìÿ\0¬˜oi¤`ô»RÊê\Zö¥©¸üL¤EºwYÙ¿­Vİ¶Ş	|ˆjâÏÎ÷p…6n÷òã¤=wYZI#-¶XÛEåB¼oô§åkïæY<ìïÅÿ\0ûViÒ8»å-­Óín#¸Å³zFñØŒ#ĞR¨à™“ÂÉ£5diè*Eƒ`„!\0!@B£xmâ|ó½±ÅK¤‘ÆkF$’PsÚÆ—<†µ¸’p\0,ı÷9X°º-5§P˜`^Ã–ŸÅ.ÿ\0Cj©nµóLşl™¢Ğ!9 …Õa¹#õ¦ÙHÇªİûJ¢¾æ\r*ÂWZÛ¼]ÉP´z\\;¡TˆÙs{}}|×I©Ü{†‚ãud #k¿xª;K¯‰¸}İ2DÏwnÁ€Ğª¯5ËÛæŸH ;bií<ı‹¿G–>Ú9HÃƒ_Ûö­PÉ°Ñ¦v,<Ò)©ã†cÜ=ElBÍVM¢xî½¥¦ŠÓB¼}ÅŸ•9ş¦ÑŞLı%¾~óqYf‘d„!B‚„\0„!\0!@B„\0„!\0!@BŠâæh5Ä†&bç¼†´zI@J£–x ÒÌöÇ\\÷ÖÒJÅk?3ì¡q¶Ñb7Óœ¤z\0ï=f§‡˜µùúÍË™ÖÁ°ÙŒwGZ©³W¬üÉÓ­ÉƒJŒßO°IˆˆîêY›“Ì\\Àñ.©9Š\r­‡cG¢1ö®Û-.ÊÈ{˜Æ}ò;µØÕ2ÙÉg¥YÚPÆÌÒÔ~.ÿ\0º¥ğ³¶.ŞÉİŒtï=K¬–±¥Î9ZÑW\0,†£~ëÛ§Kúc»àßñ@y&§v­¼jØó$£åè¯…½ASé	g2È=ÔçtŸTv«WH^âçN%.e; s­ŒÛÁÃĞ6®V÷µÚãAÖ¯c‰¬`ŒlˆRÔ<È_bóŞ‹¿ì£¨­^}òiZ›&o†7VœXvÅ¿ŠFKda«šz\nË4‡¡P „!\0!@G4ÑAæ™â8£Ï{Z1$’¼{œ~`ÿ\0{¼6–‘4{wT1Ç#nİ—–ÆïŞ·1´mSVåçÇ¦ÈìğŸ6KQúìhÅ‘´ãºN˜íFgGæ¶2ÁR\\Ät%(Â.rtŒs$¤¢›y\"KİcSÔû—wt;­â÷qû#Ö¦Ó´»Ëº2ÚYÄ¬{‡Oåı6Ús<÷ûRb:›±^ÄC@\r\0°æßæñaÄş©àº4µ+(®²šË”]å—\\L%V0T»3ÈËI^Ú‚88-Ps³\0ĞMv\0¨¹ËO¾Ù·ñÕ°pÑ¶§ÂãMÛ”Ğs—/8^uãòáDïx·qÊTf¯•u!©ià<ÿ\0QnDs´ÓÂî°»æ‘º^¯ox\\ı-nEiGí…ôôÕ«Ìùs\\–Âé“–²JCpGáût­6¤÷Iu§5Î/2ŞB*MkGfûY£ÑSÑ†Ä¨BÉ B€„ !B\0B€„…\0ª»»[(]qw3 …)$pkGYY.}ùƒoËqü–IõiC,‰§Ö’›Îæ¬C´nb×„:Ÿ2]Êc˜fŠuáeGEUHTÕë_5mZókËĞ:ús€àˆëÅ¬ç}75—0kózíÁ›[\0;á`î·ëVv:u‹2ZÄ#âí®>—WXIPËg=–›ebÚ[Æ\Zw¼âãérë	pA@N\0.}Bú+WÎúF3ÚqØ|Ë©eh°ˆ÷GLFá¹½{UI\'\r»”RM$ÒºYNiKœO»´¨ƒçó\\*Ø±‹·*{x¾\ZÙzÇ½)üGwR9Cœ“S‰)s!]$Î˜ìbƒÒUĞjæÓ­¼‹F4à÷wé+°5dÒ+µ‹lğyÍè¼_²~åqÉú—Ÿfë\'Ÿym‹:c?òœ^[\\\\*×\nĞU¥ÃôMi®?Ëc²¿¦\'&hdÏEJš×5Íi«\\*S–M„\0„!\0…y‡?òœšmçÿ\0£Ò›–:·q´`ÇŸÔ\0z®ßÒ½AG41Ïá•¢H¤ikØìA\naFšªx4Fª¨yVŸxË¨+p;Ş‚°Ê»_ÑŸÊz“¤.jº7ÀmaüMİÅtÛÏ±²XÜÀs\\6WçõúOF~×<bşãÁvÛ„¾×‘qhàÑ›yú—\\±Áym%­ÀÏÍ,xè*®p\0.ƒ{\rÏ<¬‰£kàÑÚJòBNª™¬©˜‹Üy½ı¤º>©5Æ-iË›ÚØ±áh´MDŞê\Z%”¦³ÛŞ5®<ZÖœ\\œõ©hğG-­ärj¡±ÕÁÑ“ˆÎ^îĞ¸ù\nQqÍ\Z[IïÃ.=-\rvSÕ±~£MzWlÆS‹ŒéIUSµ{Oli6¨ÏwBA±*Ù°B€„ !B\0BU\0,_Ìƒ— 66%²êó7º6¶Ÿ]ı>ËRóÿ\0?ÁËvæÊÈ¶]^f÷µ°´ş¤>ÈX.Rå‰õK“®ëy¥ló#d•.•Ä×Ì}}^}MåI¯n?ı»ši$w›râç¸šù²Wè{<\r¸…Ñ»\nâÓÀ…5¥JÒ´d¡sÇ<QÍ4!(V:¶füK=\\%ônrÌßó>•cVy|ÃôâÇó;`T…¸óT°±ÔÊ\ZíÑŒ\\t,}÷5êWud$ZÄ}Vbî·ªØÙ4Î.\0¸œ\\óõ’U ¡£½æùä«,cò›şcûÏìØ4—ÜÉgºYòI=I­†6ÿ\01ÙÏ²İªPóJ0½¨±‘ã9z6Åi§I’XÀA®®$ªÆµt[¼Å vãô -ƒ—n•oñ7¬e*Æ÷ßèºÊ­W<³s.dÂ”Ç~Ïª£Ò\0\0OB€\n£™,³Û6íƒ½éaû•Ğjsâd‘º7Š±í-pè(Qœ›ª|fğÏ5šÓ»ÒÃá?bĞ¯6Ó.¤Ğ9ƒ$¦‘yRÆ7ø]Õ^;a1P„(PB€„ÒPúş‡g¯isé— ùSëÇ‰·¤ã\rÓùËC¼ŸC·²’íĞ>±½‘>FåvÇ4Œ2»oB÷7¼…Í-ÃÀ¦å™Û„×â¤³£$£*IUK)üÍÔÿ\0˜>\n7™#\"ª<Ï‹¾×äÍüîjº³s®‘İO©o¥¿‘»Šº¬¥ÔÊR¡$cÅP‰Ed’öÖ?(9RÜpû‹·{ï©€-.—Êœ¹¤È%Óì!‚Vøe3Æìú”Øodu*ds8­\Z;U\\J B\0B€„ !%PV;Ÿ¹úß–­Í™lÚ¼Íî3kaiıI>À—Ÿ¹öß–­¥¡lÚ¼Í¬qí4ş¤Ÿ`ßè^aËÚ\rÖ¿xı[V{äï/{Ş{Ó?~>ÏÄÜ±Ë—\ZÕÓµ­dºX¤y“Ş\Zºw×êú¿ZôFP\0\0`àuÖ¡§i‡]JËhÚ(Æ\ræ°b²Ú§ÌjV=&\nîóæúÚÁö­`ŒâÍì—ÛÆfFÅ|Oy\r¬¬Æ­ó#K´ÍœÃ}0õüû[]ÕÚ¼ò÷SÕ5i³]Í%ÃıVŸô4`œí³¸3ğŒ\\¦/\"Ú·7kº¹,¹¸,€ÿ\0ÛÃÜe81=k–ŞÎw€ç=§áØL1Cò˜½·wş\n\\\\jMO¤ƒa0GˆW\rîÀv)³=Â„á¹£Ø˜Ğ¤hTÈ­\nF„\nV„\0Ğ¤kPĞ¥cP„±““Ñõ)bñHÙc4{sOHL´ôoL}Xê¤¡é÷QŞÚGrÍà78`BëhXşRÔü›£e!÷wÇ]Òù–Í¡ešLPÀCB{B…3\\å§A¡©‹İÍOdøOQWœ«qÒ[İYí)•Ú@Çu…Ó=´w0Io(¬r´±Ã ¬Fw\'/s)´¹4‰îò&\'Gvÿ\0«©\\Ñ2g¦¡%R¬š!%¡\0ÂÀTN·k·.„ 8`ÇnMşİÑuykgšêVÃõh:–oQçaæ6ßN„¹Òxf˜eöƒ6öªªLöÙ1»™°\0«¹T}ìgg#RNiØh­”( \'!B\0B€„…\0çŞ|·å«Smj[6¯3kGOêIö\réÜùÏ–Ü³jmíËfÕ¦o¹ˆâ#õ$ûõá7wwW×R]İHé®&qt’8Ô’PÖÒÛß^É¨ë·.9ÙåºYqÊ8%YßóÅëãø}2&ØÛ´ea\0å)¹«<Ëi‹»ƒ‰û—C ‰›³.ÙØªL„.ø»É²9ò½Ş)Iş\')£³‰¿Ìvsì·Ú¥©;v\'\0´¢…G0åcàÔæµ#B•¡RB‘¡ \nÂËGÔ/(`„äÿ\01İÖö•™Ü…¸ñNJß\'BÆ2“¤S“Ü±9ZÕ,q½î\rcKœvŠ•¥±å[Ş¼”ÈíÌ×¤íWÖ–ÖËM=gjæj9Õ‹xZNëßå[=–¹uÙã6­®¶flùoP”vq‹ò…}gËºu½ö›‡ïÙù~õ`\np+•{šjoaÅéÇé†¹ëz6ş^\'¾Xö½{M×â&Ò¶±®áÖ«ØÕ±º·eÕ»à~Ç6–t†GDñG0Ğõ.Ï+ÕúÖ¸$üv°öÇc9ÚëÎ$¼3ì{F±©·Qqµ¿RSTP®‰ã)Ù+˜ö½‡+šAk†â1Ò´]EšŸÓ|g»+x=¾/½y­Ô&	‹6‹}\në“uoƒÔ~SH.èÜv	„õìQ•„Ğ¤hLj•¡dÒÈ|ÀÒO—­ğÒ+Šp>và¶M	—–pßYÍi8¬s°±İØG âˆ5S‹”5îÚ4R=Õ¸ƒÜÏÆ­Øî°¯—ò}ûô>d“N¹pò§y·ƒVù€û·NÎµéèÖ!<B¡A\\š¦©e¤ÙK}} ŠŞ!Rv’NÆ´oq;×Ú…Ÿnë«Ù›\r /yŞv¼“À,Õç8İ\\ÕšTLGşîäbb¿˜…U6¦/.»Ìe¤×à,¥pËNŞ=iœ6ÓÃ°,íï7Û^İ&#4uîÜMV3¨xœªDoq}rö°>şşWÜÉ©–SR:ßqÜ§±¸’y$¾—Ç1¤cƒGI5ıåë«s+¥Æ¡Ç¡¡[i7Q²Ks8÷q¸Ó+¢Ù“c`çé†³áf#ğ?Åùv­“H j …d,‘…®˜ñCÀ‚g/Ü¿É“O˜“=‹²TítGŸÙ‡RÃ4‹t$	T(!@BB€OyæÛ–­~Ş“êÓ·ÜA´0Ô“£€ŞµR‰OšHZC	Üê`¾wæ7\\Óõ™™­—¾îSæ™œAóÃ3H¨§FäeÔ·W×R^_Ìe¸™Ù¤{\\IJÆ±N¥2Nhvn…¤BA]éÀ$	ÀTĞm;‚Ğö…ccËºİ‹ÉŒúò÷{µh,yNÆ\Z:åÎ¸;%xïó5œ%>)}0ñ>ãÓkC¨»Š‡~©`Œµ½´÷‚7Jã¹ •{eÊw’Q×o7ÙçıÁiá†#…ƒÕh¢”ÊÔs«Òª³mo~)wû\\®Üq¸ÜŞå‚8¬´-2Î…±y¼ãÙ±X	€§¹7nÜºø®JS{äê{cnT„TWA )^*3õ;ÓÅ0æ¸l;a=Œ5´@SL ´Ğ¥2[¬Y‡tÁˆÂJpÜU€)Hik…ZáB:«I©•‹±¸¶y–øíGÂı•vÛƒÛ—C3/’(Xd•ÁÊ«»×œjËFåävŞ ¸ùŠŞîÛQt¼½¹Œš€c5ËJ*Ï9ä¶… W®~ºŒâ§XÉU>†peâóNŒ¸´÷\r|¸¾JçŒœI>³zÒA‚6õ\n­·21áÌÁÌp\"•¨£†ßJîuË$•†&Ò9\Z*=—e«†\'±hÍXå­Xjº\\s¸ûøıÜãñ7XÅYÉuo\0¬¯\rèÚ{òŞ\\Õ¤Óï|¼å\\Ñ’SGİK^êã\\O–‹RÚ~`kj-ãÌ}§à;¬¹Ôo.p–C—Ø7°(\\˜U¡*c¤&]YÀz×‹Û×‡éÇÎÖ­†ß2åŸÄğ½ÁI\"¡Y4rjš–•e-õô¢xE\\ã´ğkFòwâ\\ÇÎú¦»ªüP\r·µ·\'à`xÎcÿ\0UÍğ™±z¯<ò¹æMÛÄóå¹ómMhÒúP±ãe0è^+ibÑvû[Àè¥‰Å®Œàs4Ğ´×zİ¸9ÉEfğÇ3’Œ\\Kqß=ÜŞlï}ÄÇòóû£`Vö:íÅñå4úÏÛùv®û8m Ê`iã´ö•e«§k—F•œ«Ñó—¨æSÅ[L±ì#¶Ğl£aHòÌp¤ÌëfÀÉ3ƒjÒ­Ù™äeÄïUüÏ£Êë~Çfu¿ó#2[÷~¥5zh+iÁp¸ì[QòĞë&ï8İ—¹•v=fŸ“5Ayfm&?ÔZPc´Æ|\'«b±Ô/­tıRÆö9At—1·Y)î=—ıkËô]Qö“Ç;I÷}ÉZ=hœ~Åªâ›0ÀK£–ö ×e ;õ£¤.kGdôÄ¨BÁ B€„ ¬ÿ\09ò¥¿2én€Ñ—°Õö“û.ö]ø]½hR >h¹µ¸³¹’Öê3ğ8²Xİ´8mMz÷Ì®Lşçnu>:ßÛ·ßÆÑŒ±7ş&îâ‘´BëBĞ Ô˜édŸ(ŒÑÑ0w½$+Se¥iö@|<-¹ï;óˆÓ/åÓî›q#dŒÜæË{msÌš9Z~Ãè\\>oşˆÎ®rvg’X$÷:fv¹_ùå\n(%z·‹kz©8)À¦”ÆgM¡à§˜\np*3-()€§²e¡à¥0àT¡–‡óz[õ&‚€hÈ\\üv7¥o#8,ÄI!£\ZJš8#n$f=*píÛ¸/¼,}NùJæåÖgù§—ß{¦ºá”ø«P^Æ·æúÍûW‚½æ¼ß£lÔŒ‘6–·D¾:lk½v.÷+¾’ôÊ®íG/[m·êû¥ğe-WnŸ.pëGœ$Æ2w<lí\\JA\Zˆ>…Õ<Gq¨$Ú8-®ƒ¨|uƒsšÍ\r\'Më3„ñ2ìmvaÁà}««CÔ¾ıq÷2Q’ƒ°õ!·*)İ’ì´À¦=ô®MIÙ,.]Â\'ı-P^\\ùƒMoÿ\0*Ô\n÷â| ÜüÍ¦·ı`(.^Ø¤D„,”B°?1y?â×´æU­ÜmÚö7õ\0ö›¿¡oÒİê§GPÏ´¸ÌÁ]»Õ„R«}åÈô_«Z¶š|¦®cNCêşËÅŸ±»eÃøÍZï£¡v4zŸR4oÇÕ¼äk4Ü\rÉ/ìè4v’QµŞWs&ic€s2¹§ahT¬¸k\0.phâMÒ™\'1é6ØItÂFÖ²®?ÃUè¹À—ŠI{]o¥rRğFMıª¦{U´:F¨è©XŞñFíŞ»ô\\]jš6š% EpÏ%õ83¼òG\ZƒN…ÅÌ|Ç¥êvíŠHf‰Õg\0ÑCâkŠéùwæ\\ó6œ29Í‚Rá i-Ë•ÕÒ˜Å¾ ¦Ô$¥”şĞéerV¢îÅÆk]´Ú{²T›R¯è*€„ !¢òO™<›ı¶àëZ{)c;¿©£¤qñSÙĞW®(nmàº‚Kk†	!™¥’1ÛH¡\n§@|â¹åıTÙMäJ§”ã_UŞ×£ŠŸ›ùZn\\ÔÌ\"¯²®´”ïØïÄÕJĞ¥ëP½nVæ«.®“V®ÎÕÅrÿ\0Ô=àU/ê†F9Ï¼`÷N;Ú=_HW•_•Ôéçbä­ËfOzØÏÓØ½öÕÈmÍn{‡‚œ\n`)A^v´<àSJ\n†Zœ\nŒê©C-0¸7ŠëÁ±sÀ(ÒíîÀz7©C–¢è|g‹ö\'(C“ƒ—ÕLù¸“.\rwLVÓd´u8}YÏ¸®°ä¡Ëënë„”¢èâêŒJÚ’iäÏ ‘ŠGE#K^ÂZö ƒBUjyëGòæn­\0îJC.i¹ş«ºÖN«ôú{ñ½j7#·5¹íG\Zí·nn/gğvØLÑ!‚Cî§IàïUİ©Ò5Ñ½Ñ»4Báª°{ş&Ù·d‘ÍÓì¹}O™¯å­Gã,|—šÍmF%©ûúëòiNü\0v¸Ò5i÷ñÏúg»(âÃ·³jÔó4­\Z,i«d,\r<A5B\\ˆÜüÙ§yì‰å{Bñ¿—MÏÍ–¿’»øûW²,Ë3H„,”„ÓTö6š…œÖW‘‰mî\ZY#ğÛã·?,¹¾ÏR¸µÒˆujÅté\ZÊ´ì®üÃa ^É!+–gÈ6+Óªm>‚4š£I®“Ì­¾NêÓœÚ¦­uÄ¶6¾cüf0¯,~Pò¬7sÜ^;x.°õF¿‰h¦äl\nÜŞ—bÔux·P¨°HšÃ’ùBÇ)·Ó Ìİ‘¾c»dÌ¯![’66û,£°*ˆfœÓ0]Ñ9ûÔ)Ú•DÂT\0¨B„\0„!\0!@Vëú¦»¦Ëat0v1H<Lxğ¸/Ôô»½&ş[ÆåšCÁÍ>4ğ+è™çnTf½cæÀĞ5`LÙ»LN=;ºU‹¡\Z<~\'9a-sMAA[¦_¶öÜ8ĞJÌ$hãÄt”1¾7º7´µì%®iÀ‚0 +¦ÊæKIÛ+1¦o´8/6¿Fµ°Âäqƒø{ÏV‡Xô÷1ırÂkãî5à§¡‚hæ‰²Æj×\n…%Wæ%ÓTiÑ¦~‘5$šuMU5¸x)AL-V(\Z$ªsjâ\0ÚpQÕK¥CÁ’0`	C”uKU†İj|¨Jœ¡89U#.$¡ÉÁÊä¡ËJfxBîÚËYmg¢™¥ıKÊõ9´ëÙlçñÄê¹Íõ\\=!z®e™çm#â­£}ı¨¤€mtùv®§*Özw}9?Ü=’Øş[§ã‡\Z^(LFeÓerØf÷˜Ã É(ü\'RâÌ—2ıÈ,\'ĞÊèİSâ7c&«çòø±ÖXen^˜èiØ«£ÄÚWõm…ïÊ¡Ì€×ü°n~jiö-åwÒÆı«××’|¨nncşÅ«¾—³î^¶±,ÊB…‰P€ih)†ªTˆ\r«äŸÎŸQ×tİ8ùsËšs‹mâä?º6zM[QæíNæäZ[f×\n¾‡4½.Ø\r8+FFÑ³Ì“ÄM\n“•õ4o´‘Ä½øËIiñbx|£*\0Ğ¡B\0B€„ !BÏşarpírÁöŠŞÆ7ú£¤zË\0Ğ½ùÀ9¤Pp ì^SÎ|¬tkÏŠµoÿ\0_pîè¦ó‰aèàµ°Ì‘S¥^›i<·ŸróAâ¯ÁYF…i¦ê°ùÌÓæ}&sIˆànôğ\\®k¢âNü+ö.«¼ër­mùî<ë}?Oqp\np)€¥p¨vÚû\0o¯z†-¹«õ©X‘ó–cê–©•J\nÍP’©j£ªZ©BP}RÕ2¨ªP”$ÌÑÀµÂ­\"„à¦ÕĞTà8”Ä”<Ó˜´“¤êO‰£úy}äğŸW÷Ufe¼æçézs¢’ê]Ãß€fÕŞÚ\nğ^~¿YËµ½§‹šjqğÊªœ_w¼àêì«wZ‹N/MU­Ñ·²mnÇ·‹NĞº®#KFšÆáš7qiØ«3.ëi¼ûc±’\Z¾.–zÍêÚ½©vo>P·6±~ÿ\0fİ£ó?ü«/.ù8ÚŞj’§‰åzŠÌ³*!\n\0HŠª¾`×í4;A<ÀÍq)ÉihÏæM&æ·£‰Ü€~±®Yi±×¤šwd·¶ˆf–Gm!­àÒp-wÌ\ZÖ¤Ksÿ\0o¶?§	Í1Š]ßºD¼Ãc§İI©ë—-¹Ö\'ò ÷T{[-õ[Äšf*‚û›/®åÁÄ,!qÂ¤>_¹«IšK›‹M.ÙòĞóR^ûİÒN.é%Ué®•ÁÓÈsOrj}À*¹ï~w¸¾Cµï9œ{UÆ—xëgÅ4ƒ8…ÀšïjÑ“i$°d7Q\n¾×¼ğ=fŸæÅ°ŠXå‰’Æs1íiÁÄ*qÑ¶FñÈÚ´î ®SçÒd8Û{ËjïçÈêµašEÒª„ !B\0B€„ Ícmi%¥ÓsÃ0ÊáõÒJ+Ìz\\¼»u,WU10g†_m›:w†–òy.ÖbÙsfi­6SĞ¾…çV¶æm!ör.æ:¾ÒofAÇğ»a_=ßXİX^MewŠâHÃ¸…[ª£\"TuFû—õ¦j¶Î ¹»3ÎZÕy†™¨M§]²æRÜİÎiÚÒ½\"ÆòØ#¹€æAQÄàô…ùîa£ôgÅısË¡î?GËõŠı¾¿ì‚Çî[ÎÑƒ@ë>”àTN{X3=Á£‹i\\7<Ã¢ÛTKvÌÃkXsÆ¯mNn‹“ûUODç*ÎJ?“¡iT ¬µÏ>i±Ô[Ã,äl&Œií©úU×>êo¨·Š(ØM^áÛAô/L9fª\'\nß7Oı<·5úhüü_Š©¿E=å¥³K®& 6çpËî¹‹[º¨–îL§kZrÆÑW¹ïyÌò\\Nòj~•ë·É$ÿ\0eÔº\"«ÚÏ,ù¬~KmşN‡¦]s–oP\'38n‰¥Õıìôª›Ÿ˜Œ–eÜ3©ü,¯Ö±EW®ß(ÒÇÌ¥sò}Ô<Óæ7å“PüWy ºçzzˆŞËvÑ´WµÕ*ªçUÔnÉ772Ë]¡Î4ìØ¹(”4¸€$ì½vôömù-Æ=**½gšw®OÍ9KÚÇQ.eaeÊÜÅÿ\0G¦ÜJ=¡€íphl~Qó…ÑtpÙ´ãY¤şXó•õ>f?2|S:)#\rÒ^›còD`íGT=,·ê|‡ş¢±ùKÉö´2Ã-ã†ù¤?îÇ}\nÔ\'×7TŸË{¢\rèÁÄ·©zRâÓ4m/I‰Ğé¶±ÚFóW¶!J‘…OÚ£\0„!SÌœÇaËºs¯ob{°@Ò3ÈıÍm~“¹xn­ÌZ¾³©K¨İÜÉ ,dq­/òØí q¦Ş+Ü9£—,¹K’ÂäÉâ·šèä:8¯Ò´Ë}7]“K×­ÇÇdaq9·\Zl-xØVn\\ôíÊçŸâáeŒx¤£U\ZáW‘W§i··¯Ég¤¯ˆ´aûÎ?zÖé|‰3¨ûù„Co•yİn8vUi`‰‚8ÚÁ±­\0Àºãrüæ«ê%XÙJÌwù¥Öğì=ñÑB>fäú‘Ëi é‘:íÚs´µïyÄM§bËj6ğiRÉ\rË»¸äŞç4ì!n›•İÓN$ªntåÑ{¥»p_yfÅ6º=¯oVĞœŸYyj«7;w°“œªÔ¶<O¦Ô\n¤£±!9#YĞ?O¹ó sØİ»ªªÓUÕí`¾Ó®­³:vNØiFº)G7¶^_¥ê·‘’Æ{öç8X|M[)çæçG|F¬¸¼‰Íô\n¹~¡£ÂzXJ„,\Z!B\0B€„ !\"P’¨ªVæw$\rjÌêú{+©Ú·¾ÆŒf‰¾¯í7wbİÕ%P,’A¢ê´Õµ(İ¬î‰5!¼zå½ù§ÉÊgs›ô“»úØš0G~ ËŞyÜ6óÜ?Ë‚7Êó±ŒiqìmT”c%I%%¹âXÊQu‹q{Ó ³]İNâéå|„í.q?Z‰_Øò\'6ßPÃ¦LÖŸZQåÿ\0©B¯ì¾NsØİÜ[ZŒì`¢$’¢T\r¶êİL\rJ®Ù|˜Ò#¡¾Ô\'œïlMlCµÙÕıË®L²¡nÙŞ=k‡:Jşë_áT‡‚²7ÈàÈÚ^ó±­\'¨+{Mæ›úm2áÃÚsl™WĞ6¶Zu“2YÚÃnÑ±±FÖá£Îé@x½ÉŞj¸ÆåÖömÛß~sÙrĞXü‘³m¨jrIÅ03±Ï/ÿ\0uzGš8£Í@f,~Vòe­tñë\\HçW÷ZZß¡h,ôM\ZÁ¹l¬míÇúqµ¿PSù©|ÄÕÁEæ%Î€“(ó„¹‚D&fKT›Tµ@)Ïœ¢İrĞ^Z0\rNÕ¾ìŒŒÚc=>ÊÕ¡åœ»ªºæ†¸¨ºƒ›æŒ;Fõ×ÌM7Ìæm.3<n¢hŞpóh7YA ë6ú½ŒwQ×l:øxz8/Ís~^­KÖ¶¿®oôË¹-ş8ğKÍÔhíİ•µŞq]-“ÿ\0Ÿ¹æ]Ëş¦úµ¡ÙİØÌÊ¢ëævƒìšéİ\r®+gO¬›ş»S’ühºŞœ­¯4‘AÎ\ZIĞõŸ:ÒÒä™`à\r{ñõº9ZñÓkº=ŸŠİ‰b<kªŞ¢»ÎWœÏoı¾ßL¨c™šYAÀh¨ÁYü¿å®cf»ewu§Í¤<Ù[“/tŠeqÇĞ¿a¢•ÿ\0óÅj#Ãr+…âw<}Å7ÀêfB@•}Œ‚„\0„!\0!@	¤@ITˆ©’šJKÓKÒ£q(™±Mâ™’)W±à9®h àTPÃkjÁ´1ÀÁ±±´0v6‰\\â£sŠWLx¦”yQ9åRF~”Ãp8®\'Hå¥rÀÜ)>(qUnáDn^€¹ø —âGL.¤lÏ(qp„ı*­²9L×¹`&O®¸©Zâ…;‰áë•¤©\ZJ 989BÒ¡Éj£	á\0ê¥MJP\r•±ÈÇG#Cãx-{*Nx¯/¿ù<é5)İe¨¶×L•ÙÙ	kœö×k6€CNÅé².I›&ä&Ïå,ÁåİÅÓ¸Ø›ØÒ¯ì¹/’¬haÓ!{‡­03ıÒàºfèé\\í†û6\'hJ—¶ÿ\0	vñ²&\rcCGcW@•¥SBÉÅ3ÛmåBÁÀ¥P°©BP‘*\0B€„ !”‰ÔE!4…%Q		¥ªrÔ…ˆW11Ì]e‰¦4£Qº`b	¦ ¨+]L6İ\nÓÉ		RP¨6	¦ĞpWBC\nÿ\0\rĞœ èVĞ‡èJƒ°ô)\ní	â¨9•±®\nx\ns¶5#X¦J #\rN\rR¥¢¡©À%¢Z 	h•\0”	¦6”ô #0°îIğìà¥BBÚ`DtS’ˆµ©Á-€¤J€„ !B\0B€!˜!˜!\0Ñ\'u@ÔÔ!\0wÜB	ÜKÜBq/u@Ô¨BpFBpB€T!B\0B€„ !B\0B€ÿÙ'),(13,11,2,'Minicurso sobre Linux','<p>Minicurso sobre Linux</p>','ministrante 01','UTFPR - CÃ¢mpus Guarapuava - Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR','2014-09-23 19:00:00','2014-09-23 21:00:00',25,'2014-07-23 00:00:00','2014-09-19 23:55:00',1,NULL),(14,NULL,3,'Palestra: O Mercado de Trabalho e o Profissional de TI','<p>palestra 1</p>','ministrante 01','UTFPR - CÃ¢mpus Guarapuava - Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR','2014-09-24 19:00:00','2014-09-24 21:00:00',100,'2014-07-23 00:00:00','2014-09-19 23:55:00',0,NULL),(15,NULL,5,'III Mostra de Talentos UTFPR Guarapuava','<p>OBS.: Inscri&ccedil;&atilde;o necess&aacute;ria apenas para quem ser apresentar&aacute;.<br /><br />Enviar um e-mail para <a href=\"mailto:gadir-gp@utfpr.edu.br\">gadir-gp@utfpr.edu.br</a> com os seguintes dados:</p>\r\n<ul>\r\n<li>C&oacute;digo da inscri&ccedil;&atilde;o (gerado ap&oacute;s a finaliza&ccedil;&atilde;o)</li>\r\n<li>Nome completo e turma dos integrantes</li>\r\n<li>Nome da m&uacute;sica/apresenta&ccedil;&atilde;o</li>\r\n<li>Tempo aproximado da apresenta&ccedil;&atilde;o</li>\r\n</ul>\r\n<p>Ap&oacute;s a an&aacute;lise da equipe organizadora sua inscri&ccedil;&atilde;o ser&aacute; confirmada ou cancelada.</p>','nenhum','UTFPR - CÃ¢mpus Guarapuava - Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR','2014-04-14 19:00:00','2014-04-14 22:00:00',15,'2014-04-01 00:00:00','2014-04-12 23:55:00',19,NULL),(16,NULL,4,'LanÃ§amento do site de eventos da UTFPR Guarapuava','<p>aaa</p>','nenhum','UTFPR - CÃ¢mpus Guarapuava - Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR','2014-07-23 19:25:00','2014-07-23 22:30:00',50,'2014-07-23 18:00:00','2014-07-23 18:01:00',2,NULL),(17,NULL,4,'InauguraÃ§Ã£o do Campus Guarapuava','<p>aaa</p>','Nenhum','UTFPR - CÃ¢mpus Guarapuava - Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR','2014-05-23 10:00:00','2014-05-23 11:30:00',80,'2014-05-23 10:00:00','2014-05-23 10:01:00',0,NULL),(18,NULL,6,'Churrasco da Semana AcadÃªmica de TSI','<p>churrasco tsi</p>','Ministrante 1','Acre/Unicentro - R. Francisco de Assis, 304 - BoqueirÃ£o, Guarapuava - PR, 85023-230','2014-09-26 19:00:00','2014-09-26 23:00:00',150,'2014-07-23 00:00:00','2014-09-19 23:55:00',1,NULL),(19,NULL,5,'Palestra teste 3','<p><span style=\"color: #000080;\"><strong>Palestra teste 2</strong></span></p>\r\n<p>&nbsp;</p>\r\n<p>Conte&uacute;do:</p>\r\n<ul>\r\n<li>Conte&uacute;do 1</li>\r\n<li>Conte&uacute;do 2</li>\r\n<li>Conte&uacute;do 3</li>\r\n</ul>','Palestrante 02','UTFPR - Campus Guarapuava - Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR','2014-12-07 14:00:00','2014-12-07 17:00:00',49,'2014-12-07 00:00:00','2014-12-07 10:00:00',48,'ÿØÿà\0JFIF\0,,\0\0ÿÛ\0C\0\n\n\n\r\rÿÛ\0C		\r\rÿÀ\0\0v\'\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RğbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0ıR\'\'Q}²ùïıö+Ç¿ò#x‹şÁ×ú-«ùÀy{|Ç¯­Kv)+ŸÒ¿Û ÿ\0ñÿ\0ßb¥V ©B+ù¢óûÍù×ï·ìbsû+|0Ï?ñ$ƒùPÁÆÇ´QED…5İcRÌÁTw\'_7ÿ\0ÁE	±¿ÄB—gÿ\0¥°PÑ_lƒş{Çÿ\0}Š>Ùü÷şûüÓùıæüèóûÍùÔs\ZrÒÇÛ ÿ\0ñÿ\0ßb¶Aÿ\0=ãÿ\0¾Å4şcÿ\0y¿:<Çşó~ts!ı,}²ùïıö(ûdóŞ?ûìWóOæ?÷›ó£Ìï7çG0rÒÇÛ ÿ\0ñÿ\0ßb¶Aÿ\0=ãÿ\0¾Å4şcÿ\0y¿:<Çşó~ts!ı,}²ùïıö(ûdóŞ?ûìWóOæ?÷›ó£Ìï7çG0rÒÇÛ ÿ\0ñÿ\0ßb¶Aÿ\0=ãÿ\0¾Å4şcÿ\0y¿:<Çşó~ts!ı,}²ùïıö(ûdóŞ?ûìWóOæ?÷›ó£Ìï7çG0rÒÇÛ ÿ\0ñÿ\0ßbñÊp’+ŸE`kù¥óûÍù×ßÿ\0ğG†fø¹ãœ’âHOı7Ji‰ÆÈı_¢Š*ˆ\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€0|}ÿ\0\"7ˆ¿ìqÿ\0¢Ú¿›çûíõ¯éÇßò#x‹şÁ×ú-«ù¾¾ßZ‰\Z@JıøıŒ?äÕ¾Øå_€õûñûÉ«|0ÿ\0°$Êˆ{ÑEU™|ßÿ\0ÿ\0“6ø‰ÿ\0\\ìÿ\0ô¶\núB¾oÿ\0‚Šÿ\0É›|Dÿ\0®vú[\'°Öçá}Ioİ\\Ect’0EÆI8^Ğä9§×Äú¬ÍÏ¥Çü3ö‚ á\\ú‹ÚñÊ_øv_íÿ\0B…¯ş\rí?øå~ÜGş­~‚WÊŒ¹™üüünı–>#şÏZ]ß´ht¨59+Vö÷²\0Xb68á‡ZòZıIÿ\0‚Èÿ\0Èğ×ş¿¯?ô\\uùmPô-;£¨øeğ×Äüq¦øGÂö‰}®ê&Amnó$AöFÒ7Ìäò£Oj÷ïøv_íÿ\0B…¯ş\rí?øåfÁ9äòşÿ\0¿{ÿ\0¤7úÇñÆ\ZÎ•ãë[MBh-ĞG¶4<¢“úšùn#â?\r`ãŒÄÂR‹’£kİ¦úµØïÁá\'ªéSi;_Sò¿ş—ûAÿ\0Ğ¡kÿ\0ƒ{Oş9Gü;/öƒÿ\0¡B×ÿ\0öŸür¿Jÿ\0á`ø‹ş‚×˜£şˆ¿è-qùŠüßş\"ÖUÿ\0@õ?ò_ó=ŸõüñüÈüÔÿ\0‡eşĞô(Zÿ\0àŞÓÿ\0Qÿ\0Ëı ÿ\0èPµÿ\0Á½§ÿ\0¯Ò¿øX>\"ÿ\0 µÇæ(ÿ\0…ƒâ/ú\\~bø‹YWıÔÿ\0ÉÌ?ÕüOóÇñÿ\0#óSş—ûAÿ\0Ğ¡kÿ\0ƒ{Oş9Gü;/öƒÿ\0¡B×ÿ\0öŸür¿Jÿ\0á`ø‹ş‚×˜£şˆ¿è-qùŠ?â-e_ôSÿ\0%ÿ\00ÿ\0Wñ?ÏÇüÍOøv_íÿ\0B…¯ş\rí?øå}uÿ\0âı“~&~ÏüSªøãD‡K²¿ÒÖÚ	#½†rÒ	U±ˆØ‘À<š÷øX>\"ÿ\0 µÇæ+¾øEâ]O\\Ô¯ã¿¼’é Êô9¯k&ñ.Îqô°hÎ2›²o–Ú&ú?#—“WÃQ•YI4½OQ¢Š+õÃæÂŠ( Š( Š( Š( Š( Š( Èâ/û\\è¶¯æùşû}kúAñ÷üˆŞ\"ÿ\0°uÇş‹jşoŸï·Ö¢F¿~?cù5o†öƒùWà=~ü~Æòjß?ì	ò¢#Ç´QEfA_7ÿ\0ÁEäÍ¾\"×;?ı-‚¾¯›ÿ\0à¢¿òfß?ëŸş–ÁIì5¹ø_W´ùißõñş„*^Ğä9§×Äú¬ÍÏéB?õkôêlê×è)Õ©Î~tÁdäNøkÿ\0_×Ÿú.:ü¶¯ÔŸø,ü‰ß\rëúóÿ\0EÇ_–Õ›ÜÚ;Iÿ\0Á9äòşÿ\0¿{ÿ\0¤7ú•ñ[şG½Géş‹Züµÿ\0‚rÿ\0Éåü;ÿ\0~÷ÿ\0Hn+õ+â·üzÒ?ıµø¿Šÿ\0ò\"¥ÿ\0_cÿ\0¤LúL‡ıî_áš9*ÚÂæô1··–p½|´-®*\nôÿ\0„wÍ¥è&¼TÖñ	‚„ª¹Çé_ÎÜ3“G?ÍieÓŸ\"Ÿ6©^Ö‹{|²Çb^*É^Öü]>şÂÔ¿èuÿ\0~[ü(şÂÔ¿èuÿ\0~[ü+äæÿ\0‚Åø´1ğ¯4nüşKşŸğøÏÿ\0Ñ<Ñ¿ğ2_ğ¯Ü?âa¿è2_øÿ\03å¿Ö\ZŸóé}ÿ\0ğ¬¿°µ/úİß–ÿ\0\n?°µ/úİß–ÿ\0\nù7şâßú\'š7şKşÃã<[ÿ\0DóFÿ\0ÀÉÂø„Xoú—ş\0¿Ì?Ö\ZŸóé}ÿ\0ğ¬¿°µ/úİß–ÿ\0\nôo‚ÚuÕ–«¨µÅ´Ğ)…@2!\\üŞõğ?ü>3Å¿ôO4oü—ü+é?ØöàÖ¿j¿xHÕ<3c¡G¥Ù%ÒIi;Èd,ûpw+İÈü6¡’æ4³bœœvåJ÷Mo3“OBT]4¯æ}ƒE|¥û{şÖ>*ı•´_^x_LÒ5)5‹‹ˆ§\Z´r¸A\Z¡vHœüÇ9Í|mÿ\0øµÿ\0B¿ƒ¿ğëÿ\0’+ö{Ÿ2¢ÙúíE~Eø+ÿ\0Åœóáoímuÿ\0ÉzÏşñ$Swà¿Í?2ÃöˆÉÄÈØü©]+?Yè¯ƒ~ÿ\0ÁY<ã­nßGñÖƒ\'‚%¸qzš\\ı¦Ì1éæªÑ|0Išû²+¨®mRâ	hd@é$lYHÈ  Ó½ÄÕ‰¨¯È§ÿ\0‚¾üYWaÿ\0¿ƒ¸8ÿ\0[¯şH¤ÿ\0‡¿üZÿ\0¡_Áßøuÿ\0É®‡ÊÏ×j+ò$Á_ş,ägÂŞ#ÚÚëÿ\0’+_Mÿ\0‚Äxò)ßøÃ×1ƒó-¼³ÄOĞ–l~F‹ ågêıñ¿ìïÿ\07ğÆvÏÃºşŸ?µû·[¹Ök9ä<\0¥X”À’}‘Öî&¬QE1>>ÿ\0‘Ä_ö¸ÿ\0Ñm_Íóıöú×ôƒãïù¼Eÿ\0`ëıÕüß?ßo­D %~ü~Æòjß?ì	ò¯Àzıòı‰îÏì¥ğÉ× ÑâOÅISü¨ˆç±íÔQEYWÍÿ\0ğQ_ù3oˆŸõÎÏÿ\0K`¯¤+æŸø(õÊÛ~ÆŸIêâÅ\0÷7ĞR{\rn~\ZÕíşCšwı|Gÿ\0¡\n£W´ùißõñş„+3súPıZı:›úµú\nujsŸğYù¾\Zÿ\0×õçş‹¿-«õ\'ş#ÿ\0\"wÃ_úş¼ÿ\0Ñq×åµf÷6ÇÒğN_ù<¿‡ïŞÿ\0é\rÅ~¥|Vÿ\0‘ïQúGÿ\0¢Ö¿-àœ¿òyÿ\0ß½ÿ\0ÒŠıJø­ÿ\0#Ş£ôÿ\0E­~/â¿üˆ©×Øÿ\0é>“!ÿ\0{—ø_æJ½áÇü‰¾1ÿ\0¯Sÿ\0¢ä¯:¯Eøqÿ\0\"oŒëÔÿ\0è¹+ñä¦ÃzOÿ\0H‘ô¹×ûŒş_š?äûíõ4”²}öúš–ZşÎ?8ŠıÚğ?ìoğOPğ^ƒuqğ×Ašâk$’F¶å˜Æ¤“Ïrkoş¯àoıÿ\0à7ÿ\0^«”d~Wè?üÓşJw¿ìş¯»¿áŠşÿ\0Ñ1ğÿ\0şõë®øuğá÷Â;ë»ÏxOMğíÕÜb)å±‹cH€ä)öÍ4„åt|Eÿ\0’ÿ\0‘SáŸı~Şÿ\0èWæÿ\0Ãÿ\0ÂÈø“áO	‹Ïìó®ê¶ºgÚü¿3Èó¥X÷ìÈİÙÆFqÔWéüKşEO†õû{ÿ\0 E_~Ìòr\nìjÒÿ\0ô®:—¸ã±öûÿ\0Áeåø¶„úÿ\0·5ÃüIÿ\0‚Eø÷Ã\ZÎ¡á_i¾.2g½»YÏ(¤ygRŞÌÊ=ëõ²ğ9ª²#™ŸÍ5í•Æ›y=¥Ô2[]A#E,2©WÔà©Ab¿Yà”_u|0×¼¬\\½ÕÏ…Œoa$­–û»±z‘!Ç u€+ó÷öÏÔ´_ö¥ø“u¡¼riï«H»âÁV•@Yˆ#®dsßŞ¾“ÿ\0‚>ÛLÿ\0¼wp§ı=	cqşÓN…Ej•¹¤µGÀ²ÿ\0­©¯±ÿ\0eø\'k~ÓßŒ‡G‡\0¾–ËìGHûOÜ\nwoóÓ®î˜íÖ¾8—ıkıM~Éÿ\0Á(?äÖşÃ·úT-ÂNÈñI?àŒÓû¿‹1±ôo‘ÿ\0·&¼Óãgü«Ç_|â?øŠËÆpiğµÅÕ”vÍkså¨%š5,Áğ8Ü	Ç\0+ö°|wã-á÷ƒõk÷‘Xé\Zu³Ü\\M)\0 ÏRN\0É\0rj¬Œù™üŞ‚TäpE~æÁ>>4ß|mı›4kí^á®õ½\ZgÑ¯n$l´ÍVØõ,cxòOR	ï_‡7²¤÷“Ëb(ŞFeŒtPO¿^à‘¾ºÒÿ\0g=kQ¸FHu/M%¾z2$0¡aÿ\0Wğ\Z˜î\\¶>á¢Š+C#;ÄVTĞ5;%Æë‹i!éó)Ö¿›9ãh§‘Jº±OPs_ÒáWóíûUü:—áWíãßI“\Z¤³Ú®0>Ï)óaÿ\0ÇÔHÒ”×íŸü#Æø¯öJğõšÊ%¹Ğî®´ÙÆySæ™Pß¹’¿+ìßø&íCcğGâ=ï…<Mz¶~ñ9VêSˆí/â7cü(À•cØì\'\0I;2¤®Ù:)ƒ¨e ƒÈ\"–´1\nø«ş\nÇãHtÙ®×Cóqu®ëD\"Z(ƒJÍô±ø¯´nnb³·’yäHa‰K¼’0UU$’z\0+ñ/ş\nûMÚşÑ#¶Ğ.MÏ„<9Ùéò…¹•ˆ3N=˜ª¨õTŒš—±QWgÊõ½à5õxvÂ5İ%Ö£o¯©içX5ïÿ\0°wÃ©~%~Õ³y–ºmàÕîXŒª%¿ï}‹ª/üT\Z³÷}~”ê(­LÎø,ü‰ß\rëúóÿ\0EÇ_–Õú“ÿ\0‘ÿ\0‘;á¯ı^è¸ëòÚ³{›Gcé?ø\'/ü_Ã¿÷ïô†â¿R¾+È÷¨ı#ÿ\0Ñk_–¿ğN_ù<¿‡ïŞÿ\0é\rÅ~¥|Vÿ\0‘ïQúGÿ\0¢Ö¿ñ_şDT¿ëìô‰ŸIÿ\0½Ëü/óG%^‹ğãşDßÿ\0×©ÿ\0ÑrWW¢ü8ÿ\0‘7Æ?õêô\\•øÇ‡?òSa½\'ÿ\0¤Hú\\ëıÆ/Ír}öúšï¯Ö‰>û}M	÷×ë_ÙÇçô}ğïşD\rØ6Ûÿ\0E-t5Ï|;ÿ\0‘Ã_ö\r¶ÿ\0ÑK]\rjs…Q@œ¿ğY/ù>ÿ\0×íïş~kxÆŸ<qáïéñA=ş‰¨[êVñ\\‚by!‘dPàJ’£8 ã¸¯ÒŸø,—üŠŸÿ\0ëö÷ÿ\0@Š¿7şx,üHø“á_	‹Ïìó®ê¶ºgÚü¿3Èó¥X÷ìÈİÙÆFqÔVoshì}~ÿ\0ğWÏ‹ì¤/†¼§×ìwgÿ\0nkƒø“ÿ\0-øÛñE¹Ò†«§øjÒåsÔÃ+)êÎëõR\r}?àŒ²dgâÚãÛÃ¿ıÕZzoü«JŠe:‡Å»˜»­¶Œ°±üLÍü©ê+ÄüÁUyå\n¡¤‘Î\0$“_³¿ğMßÙ£Pøğ†û[ñ³Ùø£ÅF;™­%R²Z[ o&7ç{»Û€#*k©øÿ\0øøMğ#T·Ömtûx†Ü‡‡R×e08çtQª„R0Ø,1Á¯¥eÿ\0Tÿ\0CM+)_Cù¤—ıkıMz?Ãÿ\0ÚGâoÂ½ûÂ^3Ôô-+ÍişÉi TŞØÜØÇSùWœKşµş¦¿L?àŸ?²Â_³ëxƒÆ¾]gXşÖ¸¶ûWÛî`>Z¬eF#‘GnõSFí¹ñÄ¿¶§Ç)†âwˆû·;®Ç¼{ñ6%‡Å~1×|E6ô·Ôoåš$oUFb ı}ñû`Á14oø.ûÅÿ\0	øM§Fg¼ğìò›6Ë4~}Ê2J1mÀq‚0ß^ñÆµğßÅV\"ğıßØuk<Èe1¬‹ŸFFXB¦ô³Øö?ÙÃö\'ø‹ûDkVmk¤Üè^fV¸ñ¡$(›ñœd¨æ¿n>ü;Ñ¾xDğ‡à6úF“n¶ğ+³c–v=Ù˜³Ü±¯\nı‰¿lÍ3ö¢ğ´ÖWğÁ¤øçJMşŸÄs§O´B;	à¯%I$OÓ•IÉ¶QEQ!_ŸŸğTßÙnïÇ:§ÅO\rYµÎ©¢[ıŸX·…rÒÙ‚Yf\0u1’Û¿ÙlôJı¦º,ˆÈêX`©Rz;Í\rú¥ûVÁ-,üa¨Şø£á,Öº.¡;gğåÉÙk#Iÿ\0å‘?Ü#o<ùÍñ\'àgşß=¯Œ<%ªhL­´Msn|‡?ìJ2=ÕfÕ“Lõ¿‚?ğPo‹ÿ\0´«}ËV·ñ…n¡ Óµèšu…GREe‘@ÜTví¯ÿ\0ˆñá³\n¾ğğºÿ\0†YÊß;³ÿ\0WçñëEad}	ñ×öìøµñûO›JÖu˜´n$Ò4HÍ¼I–wì³ã¥|÷@ô¯Eø_û;üGøÍyğ†§«Æìİ¬&;Tÿ\0zgÂ/âÔntM~ÃÁ2eË¿ƒ¿îüqâKFµñ?‰¢A´«‰-,GÌªÃ¨iÁS8 ŠÇı’à˜úOÂíFËÅŸ§µñ\'ˆíÙfµÒ`¬¬ÜrÉÎqÛ (=›‚>ñi)_D-QTf~tÁdäNøkÿ\0_×Ÿú.:ü¶¯Ôßø,e¼·øl\"ä\"úó;Tœ~î:üºşÎ»ÿ\0Ÿi¿ïÙ¬ŞæÑØú/ş	Ëÿ\0\'—ğïıûßı!¸¯Ô¯Šßò=ê?Hÿ\0ôZ×åßü¦Êâ/Û\'áã¼\"‡½Ë2?ãÆâ¿Q~+ÿ\0	Ö£Çhÿ\0ôZ×ã+ÿ\0ÈŠ—ı}ş‘3é2÷¹…şhäkÑ~È›ãúõ?ú.Jó¬C^ğàøC|cÇüºŸı%~/áÏü”ØoIÿ\0é>—:ÿ\0qŸËóGàTŸ}¾¦„ûëõ§¼O½¾FëéH‘>áò7_JşÎ?8?£Ï‡ò xkşÁ¶ßú)k¡®{áçüˆ\Zÿ\0°m·şŠZèkSœ(¢Š\0üåÿ\0‚ÉÈ©ğÏş¿oô«àoÙƒşNOáOıZ_ş•Ç_}ÁdT·…>àş›{Ğ±|û0Fãö“øSò·üZ_oú{³{šÇcú¢Š+C ¦Kş©ş†ŸL—ı[ı\r\04’ÿ\0­©¯Ù?ø%üšÃØvïÿ\0AŠ¿¥‰üÇù©í_²_ğJ%+û,° ƒı»w×ıØ«8îk-²HÈÁ¯Æïø)ìÿ\0\nSâü&¾³òüâIÙš8—	axrÏ~]Gl:ğgöJ¸ÿ\0‹Ÿt?õ¯x†;LÔà13\07ÂıRT=™ãÒ­«™øğâ®·ğSâ6‰ã/Íåj:dâM„“ÆxxŸUÔ•?^9Å~ş|ø©¢üjøq¡øË@—ÌÓµH¢6 ¼2\'Çñ#§éÇøñŸá½ğ?âV·àİz/téŠ¬Ê¤%ÄG˜åOöYp}¹kêŸø&/í<ÿ\0\nş\"7ÃÍ~å£ğ¿‰¦Qjòœ%¥ùÂ¡öY@}Ägš”ì\\•ÕÏ×ú(¢¬Èâxí`’i[dQ©vcØ’kãG‚¥Ó|=¨&¿Yø‚ÚkÍ.]‹¨bˆË#¯ËÀXÁnq]n¥iöı:ê×;|èš<údıkã|ø{£ü8ğÖ¯à³£Ãà\rWÓÛTmNÚXuI§´khº«—Ps¸™Bc¥&4}6¿¼ú“­\'‰m$Òõ]>ëT²º@Ì³[[({‰¶21Lÿ\0…×ğÿ\0SğŸˆ5Ç×ìåĞ´P£TšhÛlãIr²ä†IŒÜf¾>Ò¿d?‰>±Ñô­/N^oj‘6œ×‡Óu»Í:8n R_\r³D®\n’ªÍ!$	î5_Ù›Æ·^<ğ­µŒQø\'[Ót_øNckˆÏ—q¥.øSnì¸”ˆâ%7E’@Á¢ìvGm}\'ìÅã/Iáû¯xOSñÛ³¤ü5ºE¸İ´ÆÒy8Î[Šçü#àßÙÆş\'·Òt_xBïVºy#··}5£ºgzÇ½¹[!sĞÕO†ÿ\0ü}à¯Œ(¼»ğ¿[IÔücw©As¦xŠÂ=$ÚÍ\"…–kf›Íl.Y”.â\0\0gŠÃøUû3üBğ,ÿ\0\nõ-ZŞ÷Ä6:v¡¨=ï†/u<yeŸì÷ğìeYT$„<e‡šJŒŒ¥x/Sı—­®õ‰<5¥x\ZÎmFêâÓF‰[CŸ6häò¿z‰Z2Ãó®îÚoá^•âü=?‹¬,µ[(ŠTxãO>4’\0d*w$ˆ@$}á_0hÿ\0\0~)C£xŸCÓ<}áİo	ëzcèú†¹m¨iæîx\n[¦”ÎÆkxÙÎXJÈ ÈÍiê?~(düTğtÚî×Æúvc»>§f¶–F6ŞŞg‘<Ã)1º9Pä ÁÁ€±õæ§ñ#Ã:7´^ë6Öş%Ö\"–{\r5Éón0K²ñ\0\'¸8èkšOÚ?á³xİü\"Ş,³‹Ä	ztÓi2¼`İÏì¡œŒ(lœŒg5ówÄÙçãˆü{­|BÓSJşÔğş£§¯‡4ëğ\ZúîÖÁHıİÂÎ#…nš{’É\"“†\\íísRøMñ+ÄzwÄ?M§éş+ñÌ~!‹Å:•™†ÊÕeµ°‰%iL¿èì\0\nXsŒÑvGĞ¶?´wÃ½OÆ2øZÓÄKq®Å~úcÛGi9rQ£/³`!œS¼{ûDü=øc¯Ç¢x›Ä+¥êr…1ÀÖ“É¿p$(„€NÏá_ş\ZxûÀŸ|Gsá\Zÿ\0eê>2Ôu(nl<E`ºAµáŠK-©›Í?)ÜT.îâ½“ã_µ¯xËá-ş•cö»]Ä¿Ú\ZŒj\'‘Ù.#ß† ·Ï\".O9Æ§¨´&OÚoáÇˆÆ€$Yµc<VÆİ,®l’(¬Â<)!ÔòF3Î+A>=ü:“Ç¿ğ…¯Š4öñ/m~Æ	Çq‡ÌÆÏ0ùg»wµx.‡ğÓÇŞøóãMdø_Æ·\Z>«âˆõ;Yô/X[éÒÁå@…®-ä˜HÜÆÁ†Ü•\0[ÿ\0¼ñáäº%ø{§k\ZE·‰ï5i<eyÂÖÓO,ë*E»ÎcÍŒ®Ñ·;ˆ¢ìvG³hßü\r¯éºV¡¦ø‚ÎîÓTÕE³– ÇÌ½PìĞcV\'?68î3GEı¡~øÆGÂºw‹4û½wÍ’·F;e–<ù‘Ç!×*¬HÁÈâ¾Tğ\'ì•ñÁzïÃ;»+_²iRø‚}cÅ\ZwÚâ-erŸlŠŞò#¼ƒ¾„WTÉÌq’>ö:Ÿ	|ø|ğ¯á…÷‚áÒl|â]RãÅénö×PÚÊò)‚%c0–láƒª…Üù\'4·#êÇñ?…¿á%ÓuKk1Ôl‰DNÉ!%±€¬	?İ5Äü,ı£¼ñcU×ltVÄ6LĞ©¸ùî¬À\0İª•ÊÜHÜ$d\nñ?|:ø“¨~ÍºçÁ}OÀš‡‡n/lõh#ñ,Ú•Œ¶{¦y¢‘ÌÒío1PüœdÔ¾\'øIñãåŞmªø9~[è^Õ´o´É¨[Ü}ªâòÕmÕ!3cy/´œ(Á jğïí%ğ³Å—z…¶“âİ:ökIoå¬[Çş²XÉP%UÇ&=Ââ?Ú;áo„†ui¶CV´ŠşÔ¸c›i1åÌø_İFÙá¤Ú:óÁ¯\0“á÷ÆI£éÏáWğŞ‹¤xRûE»±¸¹Ó&µ¸˜Ø<‹E3 y|¦o1ã]ªmø?á·Äïƒğj«cğêÓÇø£Ã:&ÑİßÛ%¾›skd-¥‚í]ó$Ëæ-ùËŒr\rad}=¬|Jğ¿‡¼Uáï\rj\ZÕ­®¹â)Òì¾{¡\Zî}¸ã€{‘Ùª?~1ø?á;é‰â­et§ÔšE³C²´Å\0/\Z±à0?|¿ñsö|ø¿ñÇ~!ñÎ™…¥ßø|éñø[O¸MóJ,±9kyVeg–2%Rv*†\n9¯WøËğŸÄ~#| Õ`m[Ãv:\\zŒº­î—}WV\r5²Œ1İ¿.\n‡^@9¦+6§ûSü/Ñî-mîüN#¸¹´ú(–ÆåÜÂå‚9*	VëƒÅY¹ı¥şXø´øfëÅ¶všĞš+v‚á$VIU^422„ÁÔ€[<õá¿~xëMøë}­éZGµíOéÚdzŸ†üEcaq<Ğ4ÛÍÏ\"$:œ…,ÕCÇ?\n¾%ø«ş7…m¼2iÿ\0u)íüAw©ÙıÂ5¶¶G’5”ÊÎà*rT`ãš5‘ôÿ\0´oÃ˜üc7…[Ä)&½\rêéòZ%¤ï²áŠp…Aù—¾9¨ü=ûIü0ñ?Š!ğö›â«9uy®d³†ŠH„³¡`ñ£º…fX`x¯ğÃø/ãW‹µ|3ãk­\'Sñ_öµÖâ+4ÙmÌp\'™qnó	æ6Üä¨PkÁ?³oÄ]ø\\Ô,õ/iúŠµ-F÷Á’jVé‰’æáíuvªÌ‹ fİ‰óN\0#\0Ô,­tÏ‰>Ö|i­xJËY¶¸ñ&‹Sê\Zræ[¤ƒrã‚23ŒŠ½á/i:ğå†½ ßG©iÑù¶×qgl©œddØ×È_ş|ağgÄÏ\rüLÔmt‹KYÕ/‰t‹0ò[Ü%¸iÌs-³CoµcPp\rİıCöEƒÇ~øká_\0ø¯áÖ¥áÿ\0ì}<Å.±.£c=¼ª±Nòs»©\\qÍ±İZ~Ñÿ\0\r¯|lşÅ–kâ½}7ì“+Ç›¥$UÙB3äch$Ù©nÿ\0ho‡>7ÿ\0„Béñëÿ\0i[#lXí[†,\r&6	F¶âN1šùæïáÄr/x¼%†—¬üD>&Å³ê6†{5»ŠpñÄ²4ÆR°•\nU~ÿ\0$sI¬|ø‘\'Ãßü!‡ÁñÜXë~\'—TOh[ˆ#¶–ø]¤ˆ·œn\rBHS»•Øì¥>#üdğOÂItÈüY¬Ã¤I©ù¦Ñ^	$2ˆÂ™­€¡×$úÒ	áOiÎ-s†ÑI¹oØ\0HŒ22Î9 uâ¸¿<Kñ#â÷ÂİGFÕ5/éz<\Z²j\ZÖ“%²Ü[yÑÀ#UY•ó¼£ªc¨à×†xëö6ñİíåõ—‚ÚÃGĞü!¥Ágá9u¿ô«Ë«¥oå»ŠD•V	$¹T™Ó•S…\nyz‹CéßşÒ¿\r<â«ßk¾,µÒõk‰n¢¸EKs\"«G¾M»*ÊrXu®£Tø“áÆz\'„ïu›këQK6Ÿ§»2á#]ÎWŒp<õÁÆpkä_şÎ¿>\"_üMñCÙ_i’ëŸØ·2x7ûR´×#Ê$¼³’XØ´l]Mê¤êw	~\"üøÁã¯k´½3JÑõ÷Ooè\Z†É/½’–ÇqÇ“\nÎóÜ++†ãnJõ¥v;#ê)¾3ø\Z(|E4 ³Ûáëè´İW†-iq+¢F1Ÿ™¤Pã$óÁÃfø§£ÃñŠÓáàk_íy´‡Ö=Â¬‚1 BÇ‚[?1$‘€¼gœ|‘ãßÙWâ6©©x¿Å>ÒÍ©â/Å&¥¤Ïw/´…–Îâ)²$Ø²Ã42`¸«Èr¹ÜÔ¾ücŸâÇÆl´¡­Aâ”ºƒ@;´dÒ? ]yşB«Û³Í°®wŸ½Ÿ–ÂÈûVŠAÒŠd‹EPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPÿÙ');
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
INSERT INTO `event_type` VALUES (1,'Semana AcadÃªmica','Coordenador'),(2,'Minicurso','Professor'),(3,'Palestra','Palestrante'),(4,'sem_inscricao',''),(5,'sem_pagamento',''),(6,'Outro','Organizador');
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
INSERT INTO `news` VALUES (1,11,'2014-07-13 18:47:00','2014-07-23 16:19:00','ProgramaÃ§Ã£o da IV Semana AcadÃªmica de TSI','A programaÃ§Ã£o da IV Semana AcadÃªmica do curso de Tecnologia em Sistemas para Internet foi divulgada.','<p>A programa&ccedil;&atilde;o da IV Semana Acad&ecirc;mica do curso de Tecnologia em Sistemas para Internet foi divulgada.<br /><br />A semana ter&aacute; palestras e minicursos sobre diversos assuntos relacionados ao curso de TSI.</p>',3),(3,13,'2014-07-23 12:57:00','2014-07-23 12:57:00','Semana AcadÃªmica de TSI terÃ¡ minicurso sobre Linux','Na IV Semana AcadÃªmica de Tecnologia em Sistemas para Internet haverÃ¡ um minicurso sobre o sistema operacional Linujx','<p>Na IV Semana Acad&ecirc;mica de Tecnologia em Sistemas para Internet haver&aacute; um minicurso sobre o sistema operacional Linujx</p>',0),(4,14,'2014-07-23 17:09:00','2014-08-31 19:32:00','S. A. de TSI terÃ¡ palestra sobre mercado de trabalho','A IV Semana AcadÃªmica de TSI terÃ¡ uma palestra que falarÃ¡ sobre a relaÃ§Ã£o entre o profissional de TI e o mercado de trabalho.','<p>A IV Semana Acad&ecirc;mica de TSI ter&aacute; uma palestra que falar&aacute; sobre a rela&ccedil;&atilde;o entre o profissional de TI e o mercado de trabalho.</p>',9),(5,19,'2014-12-18 21:51:00','2014-12-18 21:51:00','Noticia teste','Noticia teste subtitulo','<p>Noticia teste descricao</p>',3);
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
  PRIMARY KEY (`id_payment_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting`
--

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
INSERT INTO `setting` VALUES (1,'site_title','UTFPR Eventos'),(2,'favicon','media/img/favicon.png'),(5,'themes_name','PadrÃ£o, UTFPR'),(6,'themes_path','default, /app/resources/css/utfpr.css'),(7,'current_theme_name','PadrÃ£o'),(8,'current_theme_path','default'),(9,'banner1_name','Banner 1'),(10,'banner1_path','media/image/banner/banner1.png'),(11,'banner2_name','Banner 2'),(12,'banner2_path','media/image/banner/banner2.png'),(13,'banner3_name','Banner 3'),(14,'banner3_path','media/image/banner/banner3.png'),(15,'banner4_name','Banner 4'),(16,'banner4_path','media/image/banner/banner4.png'),(17,'contact_mail',NULL),(18,'header_title_banner','media/img/header_title_banner.png'),(19,'maintenance_status','0'),(20,'maintenance_message','site offline');
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
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsorship`
--

LOCK TABLES `sponsorship` WRITE;
/*!40000 ALTER TABLE `sponsorship` DISABLE KEYS */;
INSERT INTO `sponsorship` VALUES (44,17,11),(126,18,7),(127,18,8),(128,18,11);
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

-- Dump completed on 2014-12-27 15:37:34
