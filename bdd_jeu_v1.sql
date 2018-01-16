-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 16, 2018 at 09:25 PM
-- Server version: 5.5.58-0+deb8u1
-- PHP Version: 5.6.30-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bdd_jeu_v1`
--

-- --------------------------------------------------------

--
-- Table structure for table `aventurier`
--

CREATE TABLE IF NOT EXISTS `aventurier` (
`idAventurier` int(3) NOT NULL,
  `idJoueur` int(3) DEFAULT NULL,
  `idTerrain` int(3) DEFAULT NULL,
  `nom` char(32) DEFAULT NULL,
  `vie` int(2) DEFAULT '100',
  `magie` int(2) DEFAULT '100'
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aventurier`
--

INSERT INTO `aventurier` (`idAventurier`, `idJoueur`, `idTerrain`, `nom`, `vie`, `magie`) VALUES
(1, NULL, NULL, 'Brandon Stark', 100, 100),
(3, NULL, NULL, 'Gandalf', 100, 100),
(4, NULL, NULL, 'George Clooney', 100, 100),
(5, NULL, NULL, 'Didier Deschamps', 100, 100),
(9, NULL, NULL, 'TestAventurier', 100, 100),
(10, 1, NULL, 'Didier Deschamps', 100, 100),
(11, 2, NULL, 'Gandalf', 100, 100),
(12, 4, NULL, 'Gandalf', 100, 100),
(13, 3, NULL, 'Brandon Stark', 100, 100);

-- --------------------------------------------------------

--
-- Table structure for table `connaitre`
--

CREATE TABLE IF NOT EXISTS `connaitre` (
  `idAventurier` int(3) NOT NULL,
  `idSort` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `connaitre`
--

INSERT INTO `connaitre` (`idAventurier`, `idSort`) VALUES
(1, 1),
(3, 2),
(3, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `joueur`
--

CREATE TABLE IF NOT EXISTS `joueur` (
`idJoueur` int(3) NOT NULL,
  `nom` char(32) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `joueur`
--

INSERT INTO `joueur` (`idJoueur`, `nom`) VALUES
(1, 'joueur1'),
(2, 'joueur2'),
(3, 'TestProcédure'),
(4, 'joueur4');

-- --------------------------------------------------------

--
-- Table structure for table `objet`
--

CREATE TABLE IF NOT EXISTS `objet` (
`idObjet` int(3) NOT NULL,
  `nom` char(32) NOT NULL,
  `genre` int(2) NOT NULL,
  `vie` int(2) DEFAULT NULL,
  `contenance` int(2) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `objet`
--

INSERT INTO `objet` (`idObjet`, `nom`, `genre`, `vie`, `contenance`) VALUES
(1, 'Oeuf de Dragon', 1, NULL, NULL),
(2, 'Anneau de Sauron', 1, NULL, NULL),
(5, 'raclette', 3, 10, NULL),
(6, 'chocolatine', 3, 2, NULL),
(9, 'sac à dos', 2, NULL, 10),
(10, 'sac banane', 2, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `posseder`
--

CREATE TABLE IF NOT EXISTS `posseder` (
`idAventurier` int(3) NOT NULL,
  `idObjet` int(3) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posseder`
--

INSERT INTO `posseder` (`idAventurier`, `idObjet`) VALUES
(1, 2),
(3, 5),
(3, 6),
(3, 10),
(5, 1),
(5, 10);

-- --------------------------------------------------------

--
-- Table structure for table `sort`
--

CREATE TABLE IF NOT EXISTS `sort` (
`idSort` int(3) NOT NULL,
  `nom` char(32) DEFAULT NULL,
  `magie` char(32) DEFAULT NULL,
  `idObjet` int(3) DEFAULT NULL,
  `idTypeTerrain` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sort`
--

INSERT INTO `sort` (`idSort`, `nom`, `magie`, `idObjet`, `idTypeTerrain`) VALUES
(1, 'dévastation', '10000', 2, 1),
(2, 'boule lumineuse', '1', NULL, 2),
(4, 'métamorphose en mouton', '10', NULL, 1),
(5, 'omelette', '2', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `terrain`
--

CREATE TABLE IF NOT EXISTS `terrain` (
`idTerrain` int(3) NOT NULL,
  `nom` char(32) NOT NULL,
  `idTypeTerrain` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `terrain`
--

INSERT INTO `terrain` (`idTerrain`, `nom`, `idTypeTerrain`) VALUES
(2, 'forêt hantée', 2),
(3, 'forêt enchantée', 2),
(4, 'montagnes du Sud', 1),
(5, 'montagnes du Nord', 1);

-- --------------------------------------------------------

--
-- Table structure for table `type_terrains`
--

CREATE TABLE IF NOT EXISTS `type_terrains` (
`id` int(11) NOT NULL,
  `libelle` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `type_terrains`
--

INSERT INTO `type_terrains` (`id`, `libelle`) VALUES
(1, 'Montagne'),
(2, 'Foret');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aventurier`
--
ALTER TABLE `aventurier`
 ADD PRIMARY KEY (`idAventurier`), ADD KEY `I_FK_aventurier_joueur` (`idJoueur`), ADD KEY `I_FK_aventurier_terrain` (`idTerrain`);

--
-- Indexes for table `connaitre`
--
ALTER TABLE `connaitre`
 ADD PRIMARY KEY (`idAventurier`,`idSort`), ADD KEY `I_FK_connaitre_aventurier` (`idAventurier`), ADD KEY `I_FK_connaitre_sort` (`idSort`);

--
-- Indexes for table `joueur`
--
ALTER TABLE `joueur`
 ADD PRIMARY KEY (`idJoueur`);

--
-- Indexes for table `objet`
--
ALTER TABLE `objet`
 ADD PRIMARY KEY (`idObjet`);

--
-- Indexes for table `posseder`
--
ALTER TABLE `posseder`
 ADD PRIMARY KEY (`idAventurier`,`idObjet`), ADD KEY `I_FK_posseder_aventurier` (`idAventurier`), ADD KEY `I_FK_posseder_objet` (`idObjet`);

--
-- Indexes for table `sort`
--
ALTER TABLE `sort`
 ADD PRIMARY KEY (`idSort`), ADD UNIQUE KEY `I_FK_sort_objet` (`idObjet`), ADD KEY `I_FK_sort_terrain` (`idTypeTerrain`);

--
-- Indexes for table `terrain`
--
ALTER TABLE `terrain`
 ADD PRIMARY KEY (`idTerrain`), ADD KEY `idTypeTerrain` (`idTypeTerrain`);

--
-- Indexes for table `type_terrains`
--
ALTER TABLE `type_terrains`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aventurier`
--
ALTER TABLE `aventurier`
MODIFY `idAventurier` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `joueur`
--
ALTER TABLE `joueur`
MODIFY `idJoueur` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `objet`
--
ALTER TABLE `objet`
MODIFY `idObjet` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `posseder`
--
ALTER TABLE `posseder`
MODIFY `idAventurier` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sort`
--
ALTER TABLE `sort`
MODIFY `idSort` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `terrain`
--
ALTER TABLE `terrain`
MODIFY `idTerrain` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `type_terrains`
--
ALTER TABLE `type_terrains`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `aventurier`
--
ALTER TABLE `aventurier`
ADD CONSTRAINT `FK_aventurier_joueur` FOREIGN KEY (`idJoueur`) REFERENCES `joueur` (`idJoueur`),
ADD CONSTRAINT `FK_aventurier_terrain` FOREIGN KEY (`idTerrain`) REFERENCES `terrain` (`idTerrain`);

--
-- Constraints for table `connaitre`
--
ALTER TABLE `connaitre`
ADD CONSTRAINT `FK_connaitre_aventurier` FOREIGN KEY (`idAventurier`) REFERENCES `aventurier` (`idAventurier`),
ADD CONSTRAINT `FK_connaitre_sort` FOREIGN KEY (`idSort`) REFERENCES `sort` (`idSort`);

--
-- Constraints for table `posseder`
--
ALTER TABLE `posseder`
ADD CONSTRAINT `FK_posseder_aventurier` FOREIGN KEY (`idAventurier`) REFERENCES `aventurier` (`idAventurier`),
ADD CONSTRAINT `FK_posseder_objet` FOREIGN KEY (`idObjet`) REFERENCES `objet` (`idObjet`);

--
-- Constraints for table `sort`
--
ALTER TABLE `sort`
ADD CONSTRAINT `FK_sort_objet` FOREIGN KEY (`idObjet`) REFERENCES `objet` (`idObjet`),
ADD CONSTRAINT `sort_ibfk_1` FOREIGN KEY (`idTypeTerrain`) REFERENCES `type_terrains` (`id`);

--
-- Constraints for table `terrain`
--
ALTER TABLE `terrain`
ADD CONSTRAINT `terrain_ibfk_1` FOREIGN KEY (`idTypeTerrain`) REFERENCES `type_terrains` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
