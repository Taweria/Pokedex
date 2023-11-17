-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 16 nov. 2023 à 14:36
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `pokedex`
--

-- --------------------------------------------------------

--
-- Structure de la table `pokemon`
--

DROP TABLE IF EXISTS `pokemon`;
CREATE TABLE IF NOT EXISTS `pokemon` (
  `pokemonID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  `healthPoints` int NOT NULL,
  `attackDamages` int NOT NULL,
  `defensePoints` int NOT NULL,
  `specificDefense` int NOT NULL,
  `specificAttack` int NOT NULL,
  `speed` int NOT NULL,
  `picture` varchar(255) NOT NULL,
  PRIMARY KEY (`pokemonID`),
  KEY `idx_pokemon_name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `pokemon`
--

INSERT INTO `pokemon` (`pokemonID`, `name`, `number`, `healthPoints`, `attackDamages`, `defensePoints`, `specificDefense`, `specificAttack`, `speed`, `picture`) VALUES
(1, 'Bulbasaur', '#0001', 45, 49, 49, 65, 65, 45, './assets/img/bulbasaur.png'),
(2, 'Ivysaur', '#0002', 60, 62, 63, 80, 80, 60, './assets/img/ivysaur.png'),
(3, 'Venusaur', '#0003', 80, 82, 83, 100, 100, 80, './assets/img/venusaur.png'),
(4, 'Charmander', '#0004', 39, 52, 43, 60, 50, 65, './assets/img/charmander.png'),
(5, 'Charmeleon', '#0005', 58, 64, 58, 80, 65, 80, './assets/img/charmeleon'),
(6, 'Charizard', '#0006', 78, 84, 78, 109, 85, 100, './assets/img/charizard'),
(7, 'Squirtle', '#0007', 44, 48, 65, 50, 64, 43, './assets/img/squirtle.png'),
(8, 'Wartortle', '#0008', 59, 63, 80, 65, 80, 58, './assets/img/wartortle.png'),
(9, 'Blastoise', '#0009', 79, 83, 100, 85, 105, 78, './assets/img/blastoise.png'),
(10, 'Caterpie', '#0010', 45, 30, 35, 20, 20, 45, './assets/img/caterpie.png'),
(11, 'Metapod', '#0011', 50, 20, 55, 25, 25, 30, './assets/img/metapod.png'),
(12, 'Butterfree', '#0012', 60, 45, 50, 90, 80, 70, './assets/img/butterfree.png');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;