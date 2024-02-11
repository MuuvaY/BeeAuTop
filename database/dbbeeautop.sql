-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 22 mai 2023 à 16:17
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `dbbeeautop`
--

-- --------------------------------------------------------

--
-- Structure de la table `apiculteur`
--

CREATE TABLE `apiculteur` (
  `idApiculteur` int(11) NOT NULL,
  `pseudo` varchar(50) NOT NULL,
  `mdp` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `apiculteur`
--

INSERT INTO `apiculteur` (`idApiculteur`, `pseudo`, `mdp`) VALUES
(1, 'Mpaulet', '5ebe2294ecd0e0f08eab7690d2a6ee69'),
(2, 'Pbidet', '5ebe2294ecd0e0f08eab7690d2a6ee69'),
(3, 'TismaCreate', '5ebe2294ecd0e0f08eab7690d2a6ee69');

-- --------------------------------------------------------

--
-- Structure de la table `ruche`
--

CREATE TABLE `ruche` (
  `idRuche` int(11) NOT NULL,
  `dateInstallation` date NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `latitude` double NOT NULL,
  `longitude` double DEFAULT NULL,
  `idApiculteur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ruche`
--

INSERT INTO `ruche` (`idRuche`, `dateInstallation`, `nom`, `latitude`, `longitude`, `idApiculteur`) VALUES
(1, '2023-02-21', 'ruche1', -68.4008, 99.1067, 1),
(2, '2023-01-30', 'ruche2', 40.8181, -125.8606, 1),
(3, '2023-03-03', 'ruche3', -54.4685, -119.447, 1),
(4, '2023-03-17', 'première ruche', 79.3118, 32.152, 2),
(5, '2023-01-21', 'les ouvrières', 71.2165, 16.3716, 3),
(6, '2023-04-06', 'le qg', -8.2958, -56.9647, 3);

-- --------------------------------------------------------

--
-- Structure de la table `visite`
--

CREATE TABLE `visite` (
  `idVisite` int(11) NOT NULL,
  `dateVisite` date NOT NULL,
  `comportement` enum('Douces','Normales','Aggressives') NOT NULL,
  `forceColonie` int(11) NOT NULL,
  `commentaire` varchar(100) DEFAULT NULL,
  `idRuche` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `visite`
--

INSERT INTO `visite` (`idVisite`, `dateVisite`, `comportement`, `forceColonie`, `commentaire`, `idRuche`) VALUES
(1, '2023-02-28', 'Douces', 85, 'Une colonnie en bonne santé avec des abeilles douces. ', 1),
(2, '2023-03-20', 'Aggressives', 60, 'Les abeilles ne sont pas très efficaces et assez agitées.', 1),
(3, '2023-03-31', 'Normales', 97, 'Les abeilles ont été productives ces derniers temps.', 1),
(4, '2023-02-09', 'Douces', 82, NULL, 2),
(5, '2023-03-14', 'Normales', 77, NULL, 2),
(10, '2023-01-30', 'Douces', 100, 'Une bonne ruche productive', 5),
(11, '2023-02-09', 'Normales', 83, NULL, 5),
(12, '2023-04-10', 'Aggressives', 41, 'Abeilles très aggressives qui ne produisent pas énormément', 6),
(13, '2023-04-19', 'Normales', 77, NULL, 6),
(14, '2023-05-03', 'Normales', 83, NULL, 6);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `apiculteur`
--
ALTER TABLE `apiculteur`
  ADD PRIMARY KEY (`idApiculteur`),
  ADD UNIQUE KEY `pseudo` (`pseudo`);

--
-- Index pour la table `ruche`
--
ALTER TABLE `ruche`
  ADD PRIMARY KEY (`idRuche`),
  ADD KEY `idApiculteur` (`idApiculteur`);

--
-- Index pour la table `visite`
--
ALTER TABLE `visite`
  ADD PRIMARY KEY (`idVisite`),
  ADD KEY `idRuche` (`idRuche`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `apiculteur`
--
ALTER TABLE `apiculteur`
  MODIFY `idApiculteur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `ruche`
--
ALTER TABLE `ruche`
  MODIFY `idRuche` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `visite`
--
ALTER TABLE `visite`
  MODIFY `idVisite` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `ruche`
--
ALTER TABLE `ruche`
  ADD CONSTRAINT `ruche_ibfk_1` FOREIGN KEY (`idApiculteur`) REFERENCES `apiculteur` (`idApiculteur`);

--
-- Contraintes pour la table `visite`
--
ALTER TABLE `visite`
  ADD CONSTRAINT `visite_ibfk_1` FOREIGN KEY (`idRuche`) REFERENCES `ruche` (`idRuche`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
