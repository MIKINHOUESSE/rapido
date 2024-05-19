-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 19 mai 2024 à 21:06
-- Version du serveur : 8.2.0
-- Version de PHP : 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `rapido.com`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin_table`
--

DROP TABLE IF EXISTS `admin_table`;
CREATE TABLE IF NOT EXISTS `admin_table` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `prenoms` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `telephone` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `sexe` varchar(5) COLLATE utf8mb4_general_ci NOT NULL,
  `mot_de_passe` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `admin_table`
--

INSERT INTO `admin_table` (`admin_id`, `nom`, `prenoms`, `email`, `telephone`, `sexe`, `mot_de_passe`, `createdAt`, `updatedAt`) VALUES
(3, 'MIKINHOUESSE', 'Fifamè Chancelle', 'mikinhouessechancelle@gmail.com', '64586412', 'F', '0ff24175b0acf94fb505e9c2c259cafb', '2024-05-18 09:04:58', '2024-05-18 09:04:58');

-- --------------------------------------------------------

--
-- Structure de la table `chauffeurs`
--

DROP TABLE IF EXISTS `chauffeurs`;
CREATE TABLE IF NOT EXISTS `chauffeurs` (
  `chauffeur_id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `prenoms` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `telephone` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `sexe` varchar(5) COLLATE utf8mb4_general_ci NOT NULL,
  `disponible` int NOT NULL,
  `mot_de_passe` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `admin_created_id` int DEFAULT NULL,
  `admin_updated_id` int DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`chauffeur_id`),
  KEY `admin_created_id` (`admin_created_id`),
  KEY `admin_updated_id` (`admin_updated_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `chauffeurs`
--

INSERT INTO `chauffeurs` (`chauffeur_id`, `nom`, `prenoms`, `telephone`, `sexe`, `disponible`, `mot_de_passe`, `email`, `admin_created_id`, `admin_updated_id`, `createdAt`, `updatedAt`) VALUES
(1, 'MIKINHOUESSE', 'Jean', '52254225', 'M', 1, '3aff193dbb9943141cd96068afa3a3ed', 'jean@gmail.com', 3, NULL, '2024-05-18 12:28:07', '2024-05-19 01:09:35'),
(2, 'ABALO', 'Morel', '52254224', 'M', 1, 'bc6bb8ebf2809641db079e5f457f8a83', 'ab@gmail.com', 3, NULL, '2024-05-18 12:38:11', '2024-05-19 01:21:25'),
(3, 'OSSA', 'Séraphin', '52254226', 'M', 1, 'aab45416695d7b9d60b215eb6372a0b9', 'ossa@gmail.com', 3, NULL, '2024-05-18 20:18:20', '2024-05-19 01:23:24'),
(4, 'OVODJI', 'Kémi', '52254231', 'M', 0, '86cbb2410b10acadb3b26992aa89b0d7', 'ovodji@gmail.com', 3, NULL, '2024-05-18 21:28:53', '2024-05-18 21:28:53'),
(5, 'AVOYON', 'Chiganvi', '52254232', 'M', 0, '05ad5abed196ab3e6ea48b38253a6a71', 'avoyon@gmail.com', 3, NULL, '2024-05-18 21:30:37', '2024-05-18 21:30:37');

-- --------------------------------------------------------

--
-- Structure de la table `courses`
--

DROP TABLE IF EXISTS `courses`;
CREATE TABLE IF NOT EXISTS `courses` (
  `course_id` int NOT NULL AUTO_INCREMENT,
  `point_depart` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `point_arrivee` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `date_heure` datetime NOT NULL,
  `chauffeur_id` int DEFAULT NULL,
  `operateur_id` int DEFAULT NULL,
  `admin_created_id` int DEFAULT NULL,
  `admin_updated_id` int DEFAULT NULL,
  `statut` int NOT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`course_id`),
  KEY `chauffeur_id` (`chauffeur_id`),
  KEY `operateur_id` (`operateur_id`),
  KEY `admin_created_id` (`admin_created_id`),
  KEY `admin_updated_id` (`admin_updated_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `courses`
--

INSERT INTO `courses` (`course_id`, `point_depart`, `point_arrivee`, `date_heure`, `chauffeur_id`, `operateur_id`, `admin_created_id`, `admin_updated_id`, `statut`, `createdAt`, `updatedAt`) VALUES
(1, 'Dogla', 'Porto-Novo', '2024-05-22 08:00:00', NULL, NULL, 3, NULL, 0, '2024-05-18 20:57:18', '2024-05-18 20:57:18'),
(2, 'IMSP', 'Natitingou', '2024-06-01 10:00:00', 1, NULL, 3, NULL, 2, '2024-05-18 20:58:24', '2024-05-19 19:56:46'),
(3, 'Dangbo', 'Cotonou', '2024-05-29 09:00:00', 1, NULL, 3, NULL, 1, '2024-05-18 21:09:00', '2024-05-19 19:56:13'),
(4, 'Dogla', 'Adohoun', '2024-05-24 08:00:00', 1, 4, NULL, NULL, 2, '2024-05-18 23:02:00', '2024-05-19 01:53:16'),
(5, 'Cotonou', 'Tokpa', '2024-06-01 09:50:00', 1, 4, NULL, NULL, 2, '2024-05-18 23:41:43', '2024-05-19 01:56:42'),
(6, 'Avrankou', 'Adja', '2024-06-08 06:00:00', 2, 4, NULL, NULL, 1, '2024-05-18 23:50:08', '2024-05-19 01:23:45'),
(7, 'Akpakpa', 'Bohicon', '2024-06-09 07:00:00', 1, NULL, 3, NULL, 2, '2024-05-18 23:54:48', '2024-05-19 02:14:49'),
(8, 'Tori-Bossito', 'Agblagadan', '2024-06-04 10:30:00', 1, NULL, 3, NULL, 1, '2024-05-18 23:55:43', '2024-05-19 19:55:50'),
(9, 'Dassa', 'Cotonou', '2024-06-02 07:00:00', NULL, 4, NULL, NULL, 0, '2024-05-19 20:02:06', '2024-05-19 20:02:06'),
(10, 'Bohicon', 'Lokossa', '2024-05-26 10:00:00', NULL, 4, NULL, NULL, 0, '2024-05-19 20:02:38', '2024-05-19 20:02:38'),
(11, 'Ouando', 'Tokpa', '2024-05-23 08:30:00', NULL, 4, NULL, NULL, 0, '2024-05-19 20:03:07', '2024-05-19 20:03:07');

-- --------------------------------------------------------

--
-- Structure de la table `operateurs`
--

DROP TABLE IF EXISTS `operateurs`;
CREATE TABLE IF NOT EXISTS `operateurs` (
  `operateur_id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `prenoms` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `telephone` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `sexe` varchar(5) COLLATE utf8mb4_general_ci NOT NULL,
  `mot_de_passe` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `creator_id` int DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`operateur_id`),
  KEY `creator_id` (`creator_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `operateurs`
--

INSERT INTO `operateurs` (`operateur_id`, `nom`, `prenoms`, `telephone`, `sexe`, `mot_de_passe`, `email`, `creator_id`, `createdAt`, `updatedAt`) VALUES
(1, 'DANSOU', 'Christophe', '52254222', 'M', 'fb6e088eb6582fbb33d98e4f87b74271', 'dansou@gmail.com', 3, '2024-05-18 13:00:43', '2024-05-18 13:00:43'),
(2, 'ODO', 'Claude', '52254221', 'M', '35bca89d0738ed99a945fd7fbcc4c121', 'odo@gmail.com', 3, '2024-05-18 13:09:02', '2024-05-18 13:09:02'),
(3, 'AGBA', 'Michaël', '52254220', 'M', '11244cf8ef38601ad333e27cb7ba5952', 'agba@gmail.com', 3, '2024-05-18 13:12:05', '2024-05-18 13:12:05'),
(4, 'GATODJI', 'Blanchard', '52254230', 'M', 'e6caa27e6283834b4d54858c1090ddc9', 'gatodji@gmail.com', 3, '2024-05-18 20:20:02', '2024-05-18 20:20:02');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
