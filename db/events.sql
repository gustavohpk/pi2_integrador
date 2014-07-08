-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: 26/06/2014 às 21:19:36
-- Versão do Servidor: 5.5.37
-- Versão do PHP: 5.4.4-14+deb7u11

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `events`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `administrator`
--

CREATE TABLE IF NOT EXISTS `administrator` (
  `id_administrator` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_administrator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `city`
--

CREATE TABLE IF NOT EXISTS `city` (
  `id_city` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `id_state` int(11) NOT NULL,
  PRIMARY KEY (`id_city`),
  KEY `fk_city_state` (`id_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cost_event`
--

CREATE TABLE IF NOT EXISTS `cost_event` (
  `id_cost_event` int(11) NOT NULL AUTO_INCREMENT,
  `id_event` int(11) NOT NULL COMMENT '	',
  `date_max` date NOT NULL,
  `cost` float NOT NULL,
  PRIMARY KEY (`id_cost_event`),
  KEY `fk_cost_event_event` (`id_event`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `event`
--

CREATE TABLE IF NOT EXISTS `event` (
  `id_event` int(11) NOT NULL AUTO_INCREMENT,
  `id_parent_event` int(11) DEFAULT NULL,
  `id_event_type` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `details` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `teacher` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `local` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `spaces` int(11) NOT NULL,
  `id_payment_type` int(11) NOT NULL,
  `start_date_registration` datetime NOT NULL,
  `end_date_registration` datetime NOT NULL,
  PRIMARY KEY (`id_event`),
  KEY `fk_event_event` (`id_parent_event`),
  KEY `fk_event_event_type` (`id_event_type`),
  KEY `fk_event_payment_type` (`id_payment_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `event`
--

INSERT INTO `event` (`id_event`, `id_parent_event`, `id_event_type`, `name`, `details`, `teacher`, `local`, `start_date`, `end_date`, `spaces`, `id_payment_type`, `start_date_registration`, `end_date_registration`) VALUES
(1, NULL, 1, 'Semana Acadêmica 2014', '<p>Melhor semana que UTFPR ter&aacute;</p>', 'Leandro', 'UTFPR', '2014-07-01 00:00:00', '2014-07-31 00:00:00', 30, 1, '2014-07-01 00:00:00', '2014-07-15 00:00:00'),
(2, 1, 1, 'Evento mixiruca', '<p>asdfasdf</p>\r\n<p>hahaha</p>\r\n<p>hahah</p>', 'Fulanão da Silva Sauro', 'local a saber', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 10, 1, '2014-06-26 00:00:00', '2014-06-26 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `event_organizer`
--

CREATE TABLE IF NOT EXISTS `event_organizer` (
  `id_event_organizer` int(11) NOT NULL AUTO_INCREMENT,
  `id_event` int(11) NOT NULL,
  `id_administrator` int(11) NOT NULL,
  PRIMARY KEY (`id_event_organizer`),
  KEY `fk_event_organizer_event` (`id_event`),
  KEY `fk_event_organizer_administrator` (`id_administrator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `event_type`
--

CREATE TABLE IF NOT EXISTS `event_type` (
  `id_event_type` int(11) NOT NULL AUTO_INCREMENT,
  `event_type` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `teacher_type` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_event_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `event_type`
--

INSERT INTO `event_type` (`id_event_type`, `event_type`, `teacher_type`) VALUES
(1, 'Semana Acadêmica', 'Palestrante'),
(2, 'Minicurso', 'Professor');

-- --------------------------------------------------------

--
-- Estrutura da tabela `media`
--

CREATE TABLE IF NOT EXISTS `media` (
  `id_media` int(11) NOT NULL AUTO_INCREMENT,
  `media_type` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `id_event` int(11) DEFAULT NULL,
  `label` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_media`),
  KEY `fk_media_event` (`id_event`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id_news` int(11) NOT NULL AUTO_INCREMENT,
  `id_event` int(11) DEFAULT NULL,
  `creation_date` datetime NOT NULL,
  `modification_date` datetime NOT NULL,
  `title` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `subtitle` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_news`),
  KEY `fk_news_event` (`id_event`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `participant`
--

CREATE TABLE IF NOT EXISTS `participant` (
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
  KEY `fk_participant_city` (`id_city`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `payment_type`
--

CREATE TABLE IF NOT EXISTS `payment_type` (
  `id_payment_type` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_payment_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `payment_type`
--

INSERT INTO `payment_type` (`id_payment_type`, `name`) VALUES
(1, 'Pagseguro');

-- --------------------------------------------------------

--
-- Estrutura da tabela `registration`
--

CREATE TABLE IF NOT EXISTS `registration` (
  `id_registration` int(11) NOT NULL AUTO_INCREMENT,
  `id_participant` int(11) NOT NULL,
  `id_event` int(11) DEFAULT NULL,
  `date_registration` datetime NOT NULL,
  `date_payment` datetime DEFAULT NULL,
  `id_payment_type` int(11) DEFAULT NULL,
  `cost` float NOT NULL,
  PRIMARY KEY (`id_registration`),
  KEY `fk_registration_participant` (`id_participant`),
  KEY `fk_registration_event` (`id_event`),
  KEY `fk_registration_payment_type` (`id_payment_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `state`
--

CREATE TABLE IF NOT EXISTS `state` (
  `id_state` int(11) NOT NULL AUTO_INCREMENT,
  `state` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Restrições para as tabelas dumpadas
--

--
-- Restrições para a tabela `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `fk_city_state` FOREIGN KEY (`id_state`) REFERENCES `state` (`id_state`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `cost_event`
--
ALTER TABLE `cost_event`
  ADD CONSTRAINT `fk_cost_event_event` FOREIGN KEY (`id_event`) REFERENCES `event` (`id_event`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `fk_event_event` FOREIGN KEY (`id_parent_event`) REFERENCES `event` (`id_event`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_event_event_type` FOREIGN KEY (`id_event_type`) REFERENCES `event_type` (`id_event_type`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_event_payment_type` FOREIGN KEY (`id_payment_type`) REFERENCES `payment_type` (`id_payment_type`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `event_organizer`
--
ALTER TABLE `event_organizer`
  ADD CONSTRAINT `fk_event_organizer_administrator` FOREIGN KEY (`id_administrator`) REFERENCES `administrator` (`id_administrator`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_event_organizer_event` FOREIGN KEY (`id_event`) REFERENCES `event` (`id_event`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `fk_media_event` FOREIGN KEY (`id_event`) REFERENCES `event` (`id_event`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `fk_news_event` FOREIGN KEY (`id_event`) REFERENCES `event` (`id_event`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `participant`
--
ALTER TABLE `participant`
  ADD CONSTRAINT `fk_participant_city` FOREIGN KEY (`id_city`) REFERENCES `city` (`id_city`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `registration`
--
ALTER TABLE `registration`
  ADD CONSTRAINT `fk_registration_event` FOREIGN KEY (`id_event`) REFERENCES `event` (`id_event`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_registration_participant` FOREIGN KEY (`id_participant`) REFERENCES `participant` (`id_participant`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_registration_payment_type` FOREIGN KEY (`id_payment_type`) REFERENCES `payment_type` (`id_payment_type`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
