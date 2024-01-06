SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Structure de la table `char_vars`
--

DROP TABLE IF EXISTS `char_vars`;
CREATE TABLE IF NOT EXISTS `char_vars` (
  `charid` int(10) unsigned NOT NULL,
  `varname` varchar(30) NOT NULL,
  `value` int(11) NOT NULL,
  `expiry` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`charid`,`varname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
