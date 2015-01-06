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
INSERT INTO `event` VALUES (11,NULL,1,'Semana Acadêmica TSI 2014','<p>descricao teste 1</p>','ministrante 1','UTFPR - Câmpus Guarapuava - Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR','2014-09-22 19:00:00','2014-09-26 22:00:00',150,'2014-07-23 00:00:00','2014-09-19 23:55:00',1,'����\0JFIF\0\0\0d\0d\0\0��\0Ducky\0\0\0\0\0(\0\0��\0Adobe\0d�\0\0\0��\0�\0			\n$$\'\'$$53335;;;;;;;;;;\r\r\r%\Z\Z% ## ((%%((22022;;;;;;;;;;��\0^\"\0��\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0!1AQa��\"2qBR#����b�Cr��3$�Sc���4D�ⓣd%\0\0\0\0\0\0\0!1AQa���\"2q��BRbr3�#����\0\0\0?\0�T!B\0B�� !B\0B�� !B���. ���S^�E�0���~O\0���V����N�[#C�܀�B\0B�� !B\0B \"	\0M\0�J��y�K�w��.rr���K�v /��S��n������8+\0�!\0!@B�\0�!\0!@B�\0�!\0!@H�$���$�cqs�h\0�%\0�{��֌K��)�|��-K�ӛ�3\"�����f�.y�]v{�LV���t0m�U&F�n���m�h��\0��oi�`��R��\Z�����L�E�wYٿ�Vݶ�	|�j����p�6��n����=wYZI#-�X�E�B�o���k��Y<����\0�Vi�8���-���n#����zF�،#�R�����ɣ5d�i�*E�`�!\0!@B��xm�|��K��ƍkF$�Ps�Ɨ<����p\0,��9X��-5�P�`^Ö��.�\0Cj�n��L�l���!9���a�#���HǪ��J���\r*�WZۼ]��P�z\\;�T��s{}}|�I��{���ud #k�x�;K���}�2D�wn��Ъ�5����H�;b�i�<���G�>�9HÃ_���PɰѦv�,<�)��c�=ElB�VM�x���B�}ş�9����L�%�~�qYf�d�!B��\0�!\0!@B�\0�!\0!@B���h�5č�&b缆�zI@J��x������\\��ց�J�k?3�q��b7Ӝ�z\0�=f�������˙���ٌwGZ��W���ӭɃJ��O�I�����Y���\\��.�9�\r��cG�1���-.��{��}�;���2��g�Y�P����~.�\0���.��݌t�=K�����9Z�W\0,��~�ۧK�c����@y&�v��j؏�$��诅�AS�	g2�=��t�Tv�WH^��N%.e; s������6�V�����A֯c��`�l�R�<�_b�ދ�읣��^}�iZ�&o�7V�Xv�ſ�FKda��z\n�4��P��!\0!@G4�A��8��{�Z1$��{�~`�\0{�6��4{wT1�#nݎ����޷1�mSV��Ǧ���6KQ��hŞ���N��FgG�2�R\\�t%(�.rt�s$���y\"K�cS���wt;���q�#֦Ӵ�˺2�Y��{�O��6ڎs<��Rb:��^�C@\r\0�����a���ຏ4�+(���˔]�\\L%V0T�3���I^ڂ88-Ps�\0�Mv\0���O��ٷ�հpѶ���M۔�s�/8^u���D��x�q�Tf��u!�i�<�\0QnDs���摺^�ox\\�-nEiG���ի��s\\�����JCpG��t�6��Iu�5�/2�B*MkGf�Y��SцĨBɠB�� !B\0B���\0���[(]qw3 ��)$pkGYY.}��o�q��I�iC,��֒���C�nbׄ:�2]�c�f��u�eGEUHT��_5mZ�k��:�s�����Ŭ�}75�0k��z���[\0;�`��Vv:u��2Z�#��>�WXIP�g=��eb�[�\Zw����r�	pA@N\0.}B�+W��F3�q�|˩eh����GLFṽ{UI\'\r��RM$ҺYNiK�O������\\*ر��*{x�\Zِzǽ)�GwR�9C��S�)s!]$Θ��b��U�j�ӭ��F4��w��+�5d�+��l�y��_�~�q����f�\'�ym�:c?�^[\\\\*�\n�U���Mi�?�c���\'&hd�EJ��5�i�\\*S�M�\0�!\0�y�?�m��\0�қ�:�q�`ǟ�\0z��ҽAG41�ᕢH�ik��A\naF��x4F��yV�x˨+p;����ʻ_џ�z���.j�7��ma�M��t����X��s\\6W���OF~�<b���vۄ�בqh�ћy��\\��ym%����,x�*�p\0.�{\r�<���k����J�BN�������y����>�5��-i˛ڍر�h�MD��\Z%�����5�<Z֜�\\���h�G-��rj����ѓ��^�и�\nQq�\Z[I��.=-\rvSձ~�MzWl�S���IUS�{Oli6��wBA�*ٰB�� !B\0BU\0,_��� 66%���7�6��]�>�R��\0?��v��ȶ]^f�������>�X.R��K���y�l��#d�.����}}^}�M�I�n?���i$w�r�縚��W�{<\r��ѻ\n�����5�JҴd�s�<Q�4!(V:��f�K=\\%�nr���>�cVy�|�����;`T����T����\Z�ь\\t,}�5�Wud$Z�}Vb��4�.\0��\\���U�������,c��c����4��ɞg�Y�I=I��6�\01�ϲݝ�P�J0������9z6��i�I�X�A��$�Ƶt[�� v�� -��n�o�7�e*�����ʭW<�s.d���~Ϫ��\0�\0OB�\n��,��6탽�a���js�d��7���-p�(Q���|f���5�ӻ����?bЯ6�.��9�$��yR��7�]Ձ^�;a1P�(PB���P���g�is闠�S�ǉ����\r���C��C�����>���>F�v�4�2�oB�7���-����ۄ�⤳�$�*IUK)����\0�>\n7�#\"�<��������j��s����O���o�����������R�$c�P�Ed���?(9R�p���{���-.�ʜ���%��!�V�e3�����odu*ds8�\Z;U\\J� B\0B�� !%PV;���ߖ�͝�lڼ��3kai�I>�����ߖ����lڼͬq�4���`��^a��\rֿx�[V{��/{�{�?~>��ܱ˗\Z�ӵ�d�X�y��\Z�w����Z�FP\0\0`�u֡�i��]J�h�(�\r�b�ڧ�jV=&\n��������`������f�F�|Oy\r��ƭ�#K����}0���[]�ڼ��S�5i�]�%��V��4`��3��\\�/\"�ڷ7k��,��,��\0���e81=k���w��=���L1C���w��\n\\\\jMO��a0G�W\r��v)�=ṣؘФhTȭ\nF��\nV�\0ФkPХcP������)b��H�c4{sOHL���oL}X�����Q��Gr͏�78`B�hX�R����e!�w�]���͡e�LP�CB{B�3\\�A�����Od�OQW���q�[�Y�)��@�u��=�w0Io(�r��à�F�w\'/s)��4���&\'Gv�\0��\\�2g��%R��!%�\0��TN�k�.� 8�`�nM���uykg��V���h:�oQ�a�6�N���xf�e��6���L��1���\0��T}��gg�#RNi�h��(��\'!B\0B���\0���|��Smj[6�3kGO�I�\r���ϖܳjm��fզo���#�$���7wwW�R]�H�&qt�8ԒP����^ɨ�.�9���Y�q�8%Y������}2&�۴ea\0�)��<�i������C ����.�تL�.����9��)I�\')�����vs�ڥ�;v\'\0���G0�c����#B��RB�� \n��G�/(`���\01�����܅��NJ�\'B�2��S�ܱ9Z�,q��\rcK�v�����[޼���̏פ�W֖֍�M��=gj�j9ՋxZN���[=��u��6���fl�oP���vq��}g˺u��������~�`\np+�{�joa�������z6�^\'�X��{M��&������֫�ձ��eջ�~�6�t�GD�G0��.�+��ָ$�v���c9����$�3�{F���Qq��R��STP���)�+����+�Ak��1Ҵ]E����|g�+x=�/�y��&	�6�}\n�uo��~SH.��v	���Q��ФhLj��d��|��O����+�p>v�M	��p�Y�i8�s����G��5S��5���4R=ո���ƭ���}��>d�N�p�y���V�����Nε���!<B�A\\���e��K}} ��!Rv�Nƴoq;�څ��n�ٛ\r�/y�v���,��8�\\՚TLG���bb���U6�/.��e���,�p�N�=i�6�ð,��7�^�&#4u��MV3�x��Doq}r��>��W����SR:�q�����y$���1�c�GI5���s+�ơ�ǡ�[i7Q�Ks8�q��+��ٓc`����f#�?��v��H j ��d,�����C��g/ܿɓO��=��T�tG�هR�4�t$	T(!@BB�O�y�ۖ�~ޓ�ӷ�A�0ԓ��޵R�O�HZC	��`�w�7\\��������S晜A��3H��F�eԷW�R^_�e��٤{�\\IJƱ�N��2�Nhvn��BA]��$	�T�m;����cc˺���Ɍ���{�h,yN�\Z:�θ;%x��5�%>)}0�>��kC����~�`������7J㹠�{e�w�Q�o7����i�#�����h����s�Ҫ�mo~)w�\\��q����8��-2΅�y����ٱX�	���7nܺ��JS{��{cnT�TWA )^*3�;��0�l;a=�5�@S�L �Х2�[�Y�t���Jp�U�)Hik�Z�B:�I������y���G���vۃۗC3/�(Xd���ʫ�לj�F��vޠ������Qt�������c5�J*�9䶅�W��~���X�U>�pe��N�����\r|��J猜I>�z�A�6�\n��21����p\"�����J�u�$��&�9\Z*=�e��\'�h�X�Xj�\\s�������7X�Y�uo\0��\r��{��\\դ��|��\\ђSG��K^��\\O��R�~`kj-��}��;���o.p�C��7�(\\�U�*c�&]Y�z����ׇ���֭��2����I\"�Y4rj����e-���xE\\��kF�w�\\�������P\r���\'�`x�c�\0U���z�<��M�����mMh��P��e0�^+ib�v�[�襉Ů��s4д�zݸ9�Ef��3��\\�Kq�=��l�}������`V�:����4����v��8m��`i���e��k�F������S�[�L��#��l�aH��p���f��3�j�ҭٙ�e��U�ϣ��~�fu��#2[�~�5zh+i�p��[Q���&�8ݗ��v=�f��5Ayfm&?�ZPc��|\'�b��/�t�R��9At��1�Y)�=��k��]Q���;I�}�Z=h�~Ū����0�K��� �e ;���.kGd�ĨB��B�� ��\09�2�n�ї�����.�]�]�hR >h��������3�8�Xݴ8mMz�̮L��nu�>:�۷��ь�7�&����B�BРԘ�d�(���0w�$�+Se�i�@|<-��;���/���q#d����{ms���9Z~��\\>o��ήrvg�X$�:fv�_��\n(%z��kz�8)����gM���\np*3-()���e��0�T�����z[�&��h��\\�v7�o#8,�I!�\ZJ�8#n$f=*p�۸/�,}N��J���g����{�����P^Ʒ����W�����ߣlԌ�6��D�:lk�v.�+���ʮ�G/[m�����e-Wn�.p�G�$�2w<l�\\JA\Z�>��<Gq�$�8-���|u�s��\r\'M��3��2�mva��}��CԾ��q�2Q�����!�*)ݒ촞��=��MI�,.]�\'�-P^\\��Mo�\0*�\n��|���ͦ��`(.^ؤ�D�,�B�?1y?�״�U��m��7�\0����o���GP�����]�ՄR�}���_�Z��|��cNC��ˎş��e���Zv4z�R4o�ռ�k4�\r�/��4v�Q��Ws&ic�s2��ahT��k\0.ph�Mҙ\'1�6�It�Fֲ�?�U����I{]o�rR�FM���{U�:F��Xޏ�F�ސ��\\]j�6�% Ep�%�83��G\Z�N���|ǥ�v�Hf�Վg\0�C�k���w�\\�6�29͂R� i-˕�Ҙž���$�����erV����k]��{�T�R���*�� !��O�<�����Z{)c;�����q�S��W�(nmຂKk�	!���1�H�\n�@|����T�M�J���_U�ף����Zn\\��\"�����������JХ�P�nV�.��V����r�\0�=�U/�F9ϼ`�N;�=_HW�_����b��fOz���ؽ���m�n{���\n`)A^v��<�SJ\n�Z�\n��C-0�7����s�(����z7�C���|g��\'(C����L���.\rwL�V�d�u�8}Yϸ�����n넔����Jڒi�� ���GE#K^�Z����BUjy�G��n�\0�JC.i�����N���{�j7#�5��G\Z�nn/g�v�L�!�C�I��Uݩ�5ѽѻ4�B᪰{�&ٷd�����}O���G�,|���mF�%������iN�\0v���5i����g�(�÷�j��4�\Z,�i�d,\r<A5B\\���٧�y��{B�M�͖������W�,�3H�,���T�6����W��m�\ZY#���?,���R��҈u�j�t�\Zʴ���a�^�!+�g�6+Ӫm>�4��I��̭�N�Ӝڦ�uĶ6�c�f0�,~P�7s�^;x.��F��h���l\n�ޗb�ux�P��H�Ò�B�)�� �ݏ��c�d̯!�[�66�,��*�f��0]�9��)ڕD�T�\0�B�\0�!\0!@V������at0v1H<Lx�/����&�[��C��>4�+���nTf�c���5`Lٝ�LN=;�U��\Z<~\'9�a-sMAA[�_���8�J�$h��t�1�7�7���%�i��0 �+���KI�+1�o�8/6�F����q��{�V�X��1�r�k��5���h扲�j�\n�%W�%�TiѦ~�5$�uMU5�x)AL-V(\Z$�sj�\0�pQ�K�C��0`	C�uKU��j|�J��89U#.$������JfxB���Ymg������K��9���l�������\\=!z�e��m#��}����mt�v��*�zw}9?�=����[��\Z^(LFe�er�f��� �(�\'R�̗2��,\'����ݎS��7c&�������Xen^��iث���W�m��ʡ̀���n~ji�-�w�����ג|�nnc��ū����^��,ʁB��P�ih)���T�\r����Q�t�8�s˚s�m��?�6zM[Q��N��Z[�f�\n��4��.�\r8+FFѳ���M\n���4o��Ľ��ˍIi�bx|�*\0��B\0B�� !B��ar�p�r������7����z�\0н��9�Pp �^S�|�tkϊ�o�\0_p����a���̑S�^�i<��r�A��YF�i������}&sI��n��\\�k��N�+�.����r�m��<�}?Oqp\np)��p�v��\0o�z�-�����X��cꖩ�J\n�P��j��Z�BP}R�2��P�$̐���­\"����T�8�Ĕ<Ә����O���y}��W�Ufe����zs���]�߀f���\n��^~�Y˵����jq�ʪ�_w����wZ�N/M�U�ѷ��mnǷ�Nк�#KF���7qiث3.�i��c��\Z�.�z��ڽ��vo>P�6�~�\0fݣ�?��/.�8��j����z�̳*!\n\0H���`��4;A<��q)�ih��M&淣�܀~��Yi����wd���f�Gm!���p-w�\Z֤Ks�\0o�?�	�1�]ߺD��c��I��-��\'� ��T{[-�[Ěf*���/����,!q¤>_��I�K��M.����R^���N.�%U鮕���sOrj}�*��~w��C��9�{UƗx�g�4�8����jѓi$�d7Q\n�׼�=f��Ű�X剒�s1�i��*qѶF��ڴ� ��S��d8�{�j����a�E��� !B\0B�� �cmi%��s�0����J+�z\\��u,WU10g�_m�:w���y.��b�sfi�6Sо��V��m!�r.�:��ofA��a_=�X�X^Mew��Hø�[��\"TuF����j��Π���3�Z�y���M�]��R���i�ҽ\"���#���AQ�����a��g��sˡ�?G���������[�у@�>��TN{X3=����i\\7<â�TKv��kXs�ƯmNn����UOD�*�J?��iT����>i��[�,�l&�i��U�>�o���(�M^��A�/L9f�\'\n�7O�<�5�h��_���E=女K�&� 6�p�[����L�kZr��W��y��\\N�j~���$�\0eԺ\"���,��~Km�N��]s��oP\'38n������������e�3��,�ֱEW��(��̥s�}�<��7�P�Wy���zz���v�ѴW��*��U�n�772�]��4�ع(�4��$��v��m�-�=**�g�w�O�9K��Q.eae����\0G��J=���phl~Q��tpٴ�Y��X��>f?2|S:)#\r�^�c�D`�GT=,���|�����K���2�-���?�ǐ}\n�\'�7T���{�\r��ķ�zR��4m/I��鶱�F�W�!J��Oڣ\0�!S̜�a˺s�ob{�@�3���m~��xn��Z���K���� ,dq��/���q��+�9��,��K����ⷚ���:8�Ҵ�}7]�K׭Ǟ�daq9�\Zl-x�Vn\\�������e�x��U\Z�W�W�i����g����a��?z��|�3����Co�y�n8vUi`��8����\0���r�櫞�%X�J�w�����=��B>f����i���:��s���y�M�b�j6�iR�\r˻����4�!n����N$�nt��{��p_yf�6�=�oVМ�Yyj�7;w����Զ<O���\n���!9#Y��?O��� s��ݻ���U��`�Ӯ��:vN�iF�)�G7��^_������{��8X|M[)���G|F������\n�~���zXJ�,\Z!B\0B�� !\"P���V�w$\rj���{+�ڷ�ƌf����7wb��%P,�A��յ(��5!�z�����gs�����ؚ0�G~�ˎ�y�6��?˂7��iq�mT�c%I%%��X�Qu�q{Ӡ�]�N���|��.q?Z�_��\'6�PæL֟ZQ��\0�B��Ns���[Z���`�$��T\r���L\rJ��|��#���\'��lMlC�����ˮL��n���=k�:J��_�T���7����^�\'�+{M��m2���sl�W�6�Zu�2Y��nѱ�F֏����@x����j�����m��~s�r�X���m�jrIŐ03��/�\0uzG�8��@f,~V�e��t��\\H�W�ZZߡh,�M\Z��l�m���q��PS��|���E�%΀�(󄹂D&fKT��T�@)Ϝ��r�^Z0\rNվ���c=>�ա圻����������;F���M7��m.3�<n�h�p�h7YA��6���wQ��l�:�xz8/�s~^�Kֶ��o�˹�-�8�K��h�ݕ��q]-��\0���]����������ʢ��v����\r�+�gO����S��h�����4�A�\ZI���:���`�\r{���9Z��k�=��݉b<k�ޢ��W��o���L�c��YA�h��Y���cf�ewu���<�[�/t�eq�пa���\0��j#�r+��w<}�7��fB@�}���\0�!\0!@	�@IT����JK�K��q(��M♍�)W��9�h �TP�kj��1�����0v6�\\�s�WLx��yQ9�RF~��p8�\'H��r�܎)>(qUn��Dn^������GL.�l�(qp��*��9L׹`&O���Z�;��땤�\ZJ�989BҞ��j�	�\0�MJP\r����G#C�x-{*Nx�/��<�5)�e���L���	k���k6�CN��.I�&�&��,�����Ӹ؛��ү�/��ha�!{��03���f���\\��6\'hJ���\0	v�&\r�cCGcW@��SB��3�m�B����P��BP�*\0B�� !���E!4�%Q		��rԅ�W11�]e��4�Q�`b	� �+]L6�\n��		RP�6�	��pWBC\n�\0\rМ �VЏ��J����)\n�	��9����\nx�\ns�5#X�J�#\rN\rR�����%�Z 	h�\0�	�6�� #0��I���BB�`DtS������-��J�� !B\0B�!�!�!\0�\'u@ԝ�!\0w�B	�K�Bq/u@ԨBpFBpB�T!B\0B�� !B\0B���'),(13,11,2,'Minicurso sobre Linux','<p>Minicurso sobre Linux</p>','ministrante 01','UTFPR - Câmpus Guarapuava - Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR','2014-09-23 19:00:00','2014-09-23 21:00:00',25,'2014-07-23 00:00:00','2014-09-19 23:55:00',1,NULL),(14,NULL,3,'Palestra: O Mercado de Trabalho e o Profissional de TI','<p>palestra 1</p>','ministrante 01','UTFPR - Câmpus Guarapuava - Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR','2014-09-24 19:00:00','2014-09-24 21:00:00',100,'2014-07-23 00:00:00','2014-09-19 23:55:00',0,NULL),(15,NULL,5,'III Mostra de Talentos UTFPR Guarapuava','<p>OBS.: Inscri&ccedil;&atilde;o necess&aacute;ria apenas para quem ser apresentar&aacute;.<br /><br />Enviar um e-mail para <a href=\"mailto:gadir-gp@utfpr.edu.br\">gadir-gp@utfpr.edu.br</a> com os seguintes dados:</p>\r\n<ul>\r\n<li>C&oacute;digo da inscri&ccedil;&atilde;o (gerado ap&oacute;s a finaliza&ccedil;&atilde;o)</li>\r\n<li>Nome completo e turma dos integrantes</li>\r\n<li>Nome da m&uacute;sica/apresenta&ccedil;&atilde;o</li>\r\n<li>Tempo aproximado da apresenta&ccedil;&atilde;o</li>\r\n</ul>\r\n<p>Ap&oacute;s a an&aacute;lise da equipe organizadora sua inscri&ccedil;&atilde;o ser&aacute; confirmada ou cancelada.</p>','nenhum','UTFPR - Câmpus Guarapuava - Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR','2014-04-14 19:00:00','2014-04-14 22:00:00',15,'2014-04-01 00:00:00','2014-04-12 23:55:00',19,NULL),(16,NULL,4,'Lançamento do site de eventos da UTFPR Guarapuava','<p>aaa</p>','nenhum','UTFPR - Câmpus Guarapuava - Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR','2014-07-23 19:25:00','2014-07-23 22:30:00',50,'2014-07-23 18:00:00','2014-07-23 18:01:00',2,NULL),(17,NULL,4,'Inauguração do Campus Guarapuava','<p>aaa</p>','Nenhum','UTFPR - Câmpus Guarapuava - Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR','2014-05-23 10:00:00','2014-05-23 11:30:00',80,'2014-05-23 10:00:00','2014-05-23 10:01:00',0,NULL),(18,NULL,6,'Churrasco da Semana Acadêmica de TSI','<p>churrasco tsi</p>','Ministrante 1','Acre/Unicentro - R. Francisco de Assis, 304 - Boqueirão, Guarapuava - PR, 85023-230','2014-09-26 19:00:00','2014-09-26 23:00:00',150,'2014-07-23 00:00:00','2014-09-19 23:55:00',1,NULL),(19,NULL,5,'Palestra teste 3','<p><span style=\"color: #000080;\"><strong>Palestra teste 2</strong></span></p>\r\n<p>&nbsp;</p>\r\n<p>Conte&uacute;do:</p>\r\n<ul>\r\n<li>Conte&uacute;do 1</li>\r\n<li>Conte&uacute;do 2</li>\r\n<li>Conte&uacute;do 3</li>\r\n</ul>','Palestrante 02','UTFPR - Campus Guarapuava - Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR','2014-12-07 14:00:00','2014-12-07 17:00:00',49,'2014-12-07 00:00:00','2014-12-07 10:00:00',48,'����\0JFIF\0,,\0\0��\0C\0\n\n\n\r\r��\0C		\r\r��\0\0v\'\"\0��\0\0\0\0\0\0\0\0\0\0\0	\n��\0�\0\0\0}\0!1AQa\"q2���#B��R��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������\0\0\0\0\0\0\0\0	\n��\0�\0\0w\0!1AQaq\"2�B����	#3R�br�\n$4�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������\0\0\0?\0�R\'\'�Q}�����+ǿ�#x�����-���y{|ǯ�Kv)+�ҿ� �\0���\0�b�V��B+���������bs�+|0�?�$��P���ǴQED�5�cR��Tw\'�_7�\0�E	���B�g�\0��P�_l��{��\0}�>�������������������s\Zr��� �\0���\0�b��A�\0=��\0��4�c�\0y�:<���~ts!�,}�����(�d��?��W�O�?�����7�G0r��� �\0���\0�b��A�\0=��\0��4�c�\0y�:<���~ts!�,}�����(�d��?��W�O�?�����7�G0r��� �\0���\0�b��A�\0=��\0��4�c�\0y�:<���~ts!�,}�����(�d��?��W�O�?�����7�G0r��� �\0���\0�b���p�+�E`k���������\0�G�f��㜒�H�O�7Ji����_��*�\n(��\n(��\n(��\n(��\n(��\n(��0|}�\0\"7���q�\0�ڿ����������#x�����-�����Z�\Z@J����?�վ��_�����ɫ|0�\0�$ʈ�{�EU�|��\0�\0�6���\0\\��\0��\n�B�o�\0���\0ɛ|D�\0�v�[\'����}Io�\\Ect�0E�I8^��9������ϥ��3�� �\\�����_�v_��\0B���\r�?��~�G��~��Wʌ�����n��>#��Z]ߎ�ht�59+V����\0Xb68�Z�Z�I�\0���\0ȝ�����?�\\u�mP�-;���e����q��G���}��&Amn�$A�F�7���Oj���v_��\0B���\r�?��f�9����\0�{�\0�7����\ZΕ��[MBh-�G�4<�����n#�?\r`���R����kݦ������\'���Si;_S����A�\0Сk�\0�{O�9G�;/���\0�B��\0���r�J�\0�`�����������-q�����\"�U�\0@�?�_�=���������\0�e���(Z�\0����\0�Q�\0����\0�P��\0����\0�ҿ�X>\"�\0����(�\0���/�\\~b���YW���\0��?��O����\0#�S���A�\0Сk�\0�{O�9G�;/���\0�B��\0���r�J�\0�`�����������-q��?�-e_�S�\0%�\00�\0W�?�����O�v_��\0B���\r�?��}u�\0���~&~��S���D�K�����	#��r�	U��ؑ�<���X>\"�\0����+��E�]O\\ԯ㿼�� ��9�k&�.�q��h�2��o��&�?#��W�Q�YI4�OQ��+���(��(��(��(��(��(�ȍ�/�\\趯����}k�A�����\"�\0�u���j�o��֢F��~?c�5o����W�=~�~��j�?�	�#�ǴQEfA_7�\0�E�;\"�;?�-������\0ࢿ�f�?띟���I�5��_W��i�����*�^��9��������B?�k��l���)թ�~t�d�N�k�\0_ן�.:���ԟ�,����\r����\0E�_�՛��;I�\0�9����\0�{�\0�7���[�G�G���Z���\0�r�\0���;�\0~��\0Hn+�+���z��?������\0�\"��\0_c�\0�L�L���_��9*�����1���p�|�-��*\n��\0�wͥ�&�T��	�������_��3�G?�ieӟ\"�6�^֋{|���b^*�^��]�>��Կ�u�\0~[�(��Կ�u�\0~[�+���\0����1�4n��K������\0�<ѿ�2_��?�a��2_��\03��\Z���}�\0�����/��ߖ�\0\n?��/��ߖ�\0\n�7����\'�7�K���<[�\0D�F�\0����Xo���\0��?�\Z���}�\0�����/��ߖ�\0\n�o��uՖ���Ŵ�)�@2!\\����?�>3ſ�O4o���+�?؏��ֿj�x�H�<3c�G��%�Ii;�d,�pw+���6���4�b��v�J�Mo3��OBT]4��}�E|��{��>*���_^x_L�5)5����\Z�r�A\Z�vH���9�|m�\0���\0B������\0�+�{�2����E~E�+�\0Ŝ��o�mu�\0�z���$Sw��?2���������]+?Y诃~�\0�Y<�n�G�փ\'�%�qz�\\���1���я|0I���+��mR�	hd@�$lYH� ��ӽ�Չ��ȧ�\0���YWa�\0���8�\0�[��H��\0���Z�\0�_���u�\0������j+�$�_�,�g��#����\0�+_M�\0��x�)����1��-���OЖl~F���g������\07�ƍv�ú��?����[��k9�<\0�X�����}�֝�&�QE1>>�\0��_���\0�m_�����������E�\0`�����?�o�D� %~�~��j�?�	��z���������נ��O�IS������QEY�W��\0�Q_�3o������\0K`��+��(���~ƟI���\0�7�R{\rn~\Z���C�w�|G�\0�\n�W��i�����+3s�P��Z�:����\nujs���Y��\Z�\0�������-��\'�#�\0\"w�_����\0�q��f�6����N_�<�����\0�\r�~�|V�\0��Q�G�\0�ֿ-����y�\0߽�\0���J���\0#ޣ��\0E�~/�������\0�>�!�\0{��_�J������1�\0�S�\0��:�E�q�\0\"o����\0�+���zO�\0H�������_�?����4��}����Z��?8����?�o�OP�^�uq��A��k$�F��Ƥ��rko���o��\0�7�\0^���d~W�?���Jw�����������\0�1��\0����u����;��xOM����b)屋cH��)��4��t|E�\0��\0�S��~��\0�W��\0��\0�����O	����궺g���3��X���ݍ��Fq�W��K�EO���{�\0�E_~��r\n�j��\0��:������\0�e������\0�5��I�\0�E���\ZΡ�_i�.�2g��Y�(�ygR���=�����9��#���5�ƛy=��2[]A#E,2�W����Ab�Y��_u|0׼�\\��υ�oa$�����z�!Ǡu�+����Դ�_����u��ri�H���V�@Y�#�ds�޾��\0�>�L�\0�wp��=	cq��N�Ej����G���\0�����\0e�\'k~�����G�\0����GH�O�\nwo�Ӯ��־8��k�M~��\0�(?���÷�T-�N��I?��Ӂ���1��o��\0�&���g���_|�?����pi��Քv�ks�%�5,��8�	�\0�+��|w�-����k��X�\Zu��\\M)\0��RN\0�\0rj�����ނT�pE~��>>4�|m��4k�^���\Zgѯn$l��V���,cx�OR	�_�7�����b(�Fe�tPO�^������\0g=kQ�FHu/M%�z2$0�a�\0W�\Z��\\�>ᢊ+C#;�VT�5;%��i!��)ֿ�9�h��J��OPs_��W���U�:��W���I�\Z��ڮ0>�)�a�\0��H�����#Ɛ���J����%����yS�P߹��+���&��Cc�G�=�<Mz�~�9�V�S��/�7c�(��c��\'\0I;2����:)��e ��\"��1\n���\n��Htٮ�C�qu��D\"Z(�J�������nnb���y�Ha�K��0UU$�z\0+�/�\n�M���#��.Mτ<9��򁅹��3N=����T����QWg����5��xv�5�%֣o��i�X5��\0�wé~%~��y��m���X��%��}��/�T\Z��}~��(�LΏ�,����\r����\0E�_�����\0��\0�;��^���ڳ{�Gc�?�\'/��_ÿ����R�+����#�\0�k_���N_�<�����\0�\r�~�|V�\0��Q�G�\0�ֿ�_�DT����I��\0���/�G%^����D��\0ש�\0�rW�W��8�\0�7�?���\\��Ǉ?�Sa�\'�\0�H�\\���/��r}����։>�}M	���_����}���D\r�6��\0E-t5�|;�\0��_�\r��\0�K]\rjs�Q@���Y/�>�\0�����~kx��<q����A=���[�V�\\�by!�dP�J��8 㸯ҟ�,�����\0����\0@��7�x,�H���_	����궺g���3��X���ݍ��Fq�Vosh�}~�\0�Wϋ�/�����wg�\0nk����\0-���E�҆���j��s��+)�����R\r}?���dg����ÿ��Zzo��J�e:�����������L����+���Uy�\n����\0$�_���M�٣P����[������F;��%R�Z[ o&7��{�ۀ#*k���\0��M�#T��mt��x�܇�R�e08�tQ��R0�,1���e�\0T�\0CM+)_C����k�Mz?��\0�G�o½��^3��-+�i��i T�����S��W�K�����L?��?��_���x�ƾ]gX�ָ��W��`>Z�eF#�G�n�SF��Ŀ���)��w���;����{�6%��~1�|E6���o�$oUFb��}��`�14o�.���\0	�M�Fg����6�4~}�2J1m�q�0ߞ^�Ƶ���V\"����uk<�e1���FFXB�����?���\'���DkVmk���^fV���$(��d��n>�;ѾxD����6�F�n��+�c�v=٘�ܱ�\n���l�3����W�����J�M���s�O�B;	�%I$OӕIɶQEQ!_���T��n��:��O\rY�Ω�[��X��r�قYf\0u1�ۿ�l�J���,���X`�Rz�;�\r���V�-,�a�����,ֺ.�;g����k#�I��\0�?�#o<���\'�g���=��<%�hL��Msn|�?�J2�=ՍfՍ�L���?�Po��\0��}�V���n� ӵ�u�GREe�@�Tv��\0���\n����\0��Y��;��\0�W���Ead}	��������O�J�u���n$�4Hͼ�I�w��|�@��E�_�;�G��y������ݬ&;T�\0zg�/��ntM~��2e˿����q�KF��?��A���-,G̪èi��S8 �������O��F�ş���\'���f��`���r��q� (=��>�i)_D-QTf~t�d�N�k�\0_ן�.:������,e���l\"��\"��;T�~�:���λ�\0�i��٬�����/�	��\0\'�������!��ԯ���=�?H�\0�Z�������/�\'��\"���2?���Q~+�\0	֣�h�\0�Z��+�\0Ȋ��}���3�2����h�k�~ț���?�.J�C^����C|c�����%~/�����oI�\0�>�:�\0q���G�T�}��������O��F��H�>��7_J��?8?�χ� xk�����)k��{����\Z�\0�m���Z�kS�(��\0���\0��ȩ����o���oك�NO�O��Z_���_}�dT��>���{��|�0F����S���Z_o�{��{��c���+C �K�����L��[�\r\04��\0����?�%����v��\0A���������_�_�J%+�,� ���w��ث8�k-��H������)��\0\nS��&�����Iٚ8�	axr�~]Gl:�g�J��\0��t?���x�;L��13\07��RT=��ҭ������⮷�S�6��/��j:d�M����xx�Uԕ?^9�~�|����j�q���@��ӵH�6 �2\'��#��������?�V���z/t銬ʤ%�G��O�Yp}��k��&/�<�\0\n�\"7��~�𿉦Qj�%��¡�Y@}�g����\\�����(��Ȏ�x�`�i[dQ�vc��k���G���|=�&�Y���k�.]���b��#���X�nq]n�i��:��;|�<�d�k�|��{��8�֯ೣ��\rW��TmN�XuI��kh���Ps��Bc�&4}6�����\'�m$��]>�T��@̳[[({��21L�\0����\0S�5����дP�T�h�l�Ir��I���f�>ҿd?�>����/N^oj�6�א��u��:8n R_\r�D�\n���!$	�5_ٛƷ^<����Q�\'[�t_�Nck�ϗq�.�Sn츔��%7E�@���vGm}\'���/I���xOS������5�E�ݴ��y8�[���#�����\'��t_xB�V�y#��}5��gzǽ�[!s��O��\0�}ௌ�(���[I��cw�As�x��=$��\"��kf��l.Y�.�\0\0g���U�3�B�,�\0\n�-Z���6:v��=�/u<�ye�����eYT$�<e���J���x/S������<5�x�\Z�mF���F�[C�6h��z��Z2����o�^���=?��,�[(�Tx�O>4�\0d*w$�@$}�_0h�\0\0~)C�x�C�<}��o	�zc����m�i��x\n[����kx��XJȠ��i�?~(d�T�t�����v�c�>�f��F6��g�<�)1�9P��������#�:7��^�6��%�\"�{\r5��n0K��\0\'��8�k�O�?�x��\"�,���	zt�i2�`�����(l��g5�w������{�|B�SJ��������4��\Z����H����#�n�{��\"��\\��sR�M�+�zw�?M���+��~!��:�����e����%iL���\0\nXs��vGж?�wýO�2�Z��Kq��~�c�Gi9r�Q�/�`!��S�{�D�=�c�Ǣx��+��r�1�֓ɿp$(��N��_�\Zx���|Gs�\Z�\0e�>2�u(nl<E`�A���K-���?)�T.�⽓�_���x��-��c��]Ŀ�\Z��j\'��.#߆ ��\".O9����&O�o�ǈƀ�$Y�c<V��,�l�(��<)!��F3�+A>=�:�ǿ����4��/�m~�	Ǟq����0�g�w�x.��������Md�_Ʒ\Z>���;Y�/X[����@��-�H����ܕ\0[�\0�����%�{�k\ZE���5i<ey���O,�*E��c���ѷ;���vG�h��\r��V�������T�E�� �̽P��cV\'?68�3GE��~���Gºw�4��w͒�F;e�<���!�*�H���T�\'���z��;�+_�iR��}c�\Zw��-er�l���#����WT��q�>�:�	|��|������l|�]R���n��P���)�%c0�lც���\'4�#���?���%�uKk�1�l�DN�!%����	?�5��,����cU�lt�V�6�LЩ����\0ݪ���H�$d\n�?|:���~ͺ��}O����n/l�h#�,ڕ��{��y�����o1P��dԾ\'�I���ލm��9~[�^մo�ɨ[�}����m�!3cy/��(��j���%�ŗz�����:�kIo��[���X�P%U�&=�?�;�o���ui�CV���Ըc�i1���_�F���:���\0���ƏI����W�ދ�xR�E�����&����<�E3�y|�o1�]�m�?����j�c�������:&�����%��skd-���]�$��-�ˌr\rad}=�|J𿇼U��\rj\Zխ���)�읾{�\Z�}��{��٪?~1�?�;��et�ԚE�C���\0/�\Z��0?�|��s�|����~!�Ι����|���[O�M�J,�9kyVe��g�2%Rv*�\n9�W����~#| �`m[�v:\\z����}WV\r5��1ݿ.\n��^@9�+6��S�/��-m��N#�����(������9*	V��Y����X���f�Ŷv�К+v��$�VIU^422��Ԁ[<���~x�M��}��ZG���O��dz���Ecaq<�4��ϝ\"$:��,�C�?\n�%���7�m�2i�\0u)��Aw�����5���G�5��΍�*rT`�5���\0�oØ�c7�[�)&�\r���Z%��ኁp�A���9��=�I�0�?�!����9uy�d���H���`񣺅fX`x����/�W��|3�k�\'S�_���֏�+4�m�p\'�qn�	�6��Pk�?�o�]�\\�,�/i���-F���jV������uv�̋ f�݉�N\0#\0�,��tω>�|i�xJ�Y���&�S�\Zr�[��r��23����/i:�冽��G�i����qgl��dd���_�|a�g��\r�L�mt��KY�/��t�0�[�%�i�s-�Co�cPp\r��C�E��~�k�_\0���֥��\0�}<�.�.�c=�����N�s��\\q���Z~��\0\r�|l��Ŗk��}7�+Ǜ�$U�B3�ch$�٩n�\0ho�>7�\0�B����\0i[#lX�[�,\r&6	F��N1�����čr/x�%����D>&�ų�6�{5��p�Ĳ4�R��\nU~�\0$sI�|��\'���!����X�~\'�TOh[�#���]����n\r�B�HS���쏥>#�d�O�It��Y�äI����^	$2�����$����	�OiΞ-s��I�o�\0H��22�9 u���<K�#����GF�5/�z<\Z�j\Z֓%��[y��#UY���c��׆x��6���������G��!��g�9u���˫��o廊D�V	$�T��ӕS�\nyz�C���ҿ\r<��k�,���k�n���EKs\"�G�M�*�rXu��T����z\'��u�k�QK6���2�#]�W�p<���pk�_�ο>\"_�M�C�_i��ط2x7�R��#��$���Xشl]Mꤎ�w	~\"����k��3J���Oo�\Z��/�����qǓ\n���++��nJ��v;#�)�3�\Z(|E4� ������W�-iq+�F�1���P�$���f��������k_�y���=¬�1 �Bǂ[?1$���g�|����W�6��x��>�͞��/�&���w/�����)�$ز�42`���r��Ծ�c����l���A┺�@;�dҐ? ]y�B�۳Ͱ�w��������V�AҊd�EPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEP��');
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
INSERT INTO `news` VALUES (1,11,'2014-07-13 18:47:00','2014-07-23 16:19:00','Programação da IV Semana Acadêmica de TSI','A programação da IV Semana Acadêmica do curso de Tecnologia em Sistemas para Internet foi divulgada.','<p>A programa&ccedil;&atilde;o da IV Semana Acad&ecirc;mica do curso de Tecnologia em Sistemas para Internet foi divulgada.<br /><br />A semana ter&aacute; palestras e minicursos sobre diversos assuntos relacionados ao curso de TSI.</p>',3),(3,13,'2014-07-23 12:57:00','2014-07-23 12:57:00','Semana Acadêmica de TSI terá minicurso sobre Linux','Na IV Semana Acadêmica de Tecnologia em Sistemas para Internet haverá um minicurso sobre o sistema operacional Linujx','<p>Na IV Semana Acad&ecirc;mica de Tecnologia em Sistemas para Internet haver&aacute; um minicurso sobre o sistema operacional Linujx</p>',0),(4,14,'2014-07-23 17:09:00','2014-08-31 19:32:00','S. A. de TSI terá palestra sobre mercado de trabalho','A IV Semana Acadêmica de TSI terá uma palestra que falará sobre a relação entre o profissional de TI e o mercado de trabalho.','<p>A IV Semana Acad&ecirc;mica de TSI ter&aacute; uma palestra que falar&aacute; sobre a rela&ccedil;&atilde;o entre o profissional de TI e o mercado de trabalho.</p>',9),(5,19,'2014-12-18 21:51:00','2014-12-18 21:51:00','Noticia teste','Noticia teste subtitulo','<p>Noticia teste descricao</p>',3);
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
INSERT INTO `setting` VALUES (1,'site_title','UTFPR Eventos'),(2,'favicon','media/img/favicon.png'),(5,'themes_name','Padrão, UTFPR'),(6,'themes_path','default, /app/resources/css/utfpr.css'),(7,'current_theme_name','Padrão'),(8,'current_theme_path','default'),(9,'banner1_name','Banner 1'),(10,'banner1_path','media/image/banner/banner1.png'),(11,'banner2_name','Banner 2'),(12,'banner2_path','media/image/banner/banner2.png'),(13,'banner3_name','Banner 3'),(14,'banner3_path','media/image/banner/banner3.png'),(15,'banner4_name','Banner 4'),(16,'banner4_path','media/image/banner/banner4.png'),(17,'contact_mail',NULL),(18,'header_title_banner','media/img/header_title_banner.png'),(19,'maintenance_status','0'),(20,'maintenance_message','site offline');
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
INSERT INTO `sponsor` VALUES (5,'Escola 01','www.escola01.com.br','Descrição da escola 01'),(6,'Universidade 01','www.universidade01.com.br','Descrição da universidade 01'),(7,'Empresa 01','www.empresa01.com.br','Descrição da empresa 01'),(8,'Universidade 02','www.universidade02.com.br','Descrição da universidade 02'),(9,'Escola 02','www.escola02.com.rb','Descrição de escola 02'),(10,'Empresa 02','www.empresa02.com.br','Descrição da empresa 02'),(11,'Empresa 03','www.empresa03.com.br','Descrição da empersa 03');
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
