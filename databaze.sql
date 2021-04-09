-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 09, 2021 at 02:43 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `automobily`
--

CREATE TABLE `automobily` (
  `idautomobily` int(11) NOT NULL,
  `registracni_znacka` varchar(45) DEFAULT NULL,
  `vyrobce_vozu` varchar(45) DEFAULT NULL,
  `rok_vyroby` varchar(45) DEFAULT NULL,
  `obsah_motoru` varchar(45) DEFAULT NULL,
  `typ_prevodovky` varchar(45) DEFAULT NULL,
  `majitel_vozu_idmajitel_vozu` int(11) NOT NULL,
  `typ_vozu_idtyp_vozu` int(11) NOT NULL,
  `nazev_vozu_idnazev_vozu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `automobily`
--

INSERT INTO `automobily` (`idautomobily`, `registracni_znacka`, `vyrobce_vozu`, `rok_vyroby`, `obsah_motoru`, `typ_prevodovky`, `majitel_vozu_idmajitel_vozu`, `typ_vozu_idtyp_vozu`, `nazev_vozu_idnazev_vozu`) VALUES
(1, '007 MICAK', 'Skoda', '2002', '1,6', 'manual', 1, 1, 1),
(2, 'NOT 4YOUU', 'Hyundai', '2000', '1,6', 'automat', 2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `majitel_vozu`
--

CREATE TABLE `majitel_vozu` (
  `id` int(11) NOT NULL,
  `jmeno` varchar(45) DEFAULT NULL,
  `prijmeni` varchar(45) DEFAULT NULL,
  `adresa` varchar(45) DEFAULT NULL,
  `telefon` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `majitel_vozu`
--

INSERT INTO `majitel_vozu` (`id`, `jmeno`, `prijmeni`, `adresa`, `telefon`, `email`) VALUES
(1, 'Jana', 'Niklová', 'Straznicka 1272, 696 42', '007 007 007', 'jana@oauh.cz'),
(2, 'Milan', 'Svoboda', 'Praha 10', '+420 001 001 001', 'milan@gmail.com'),
(3, 'Jan', 'Novák', 'Praha 1', '+420 007 007 007', 'jan@gmail.com'),
(4, 'Jana', 'Zborilova', 'Dlouha 456, 777 30', '007 007 007', 'janaz@seznam.cz'),
(5, 'Lenka', 'Zborilova', 'Kratka 456, 777 30', '001 001 001', 'lenka.zborilova@centrum.cz');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `idmenu` int(11) NOT NULL,
  `polozka_menu` text NOT NULL,
  `display` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`idmenu`, `polozka_menu`, `display`) VALUES
(1, 'Knihy k maturitě', 'Maturita'),
(2, 'Kategorie', 'Kategorie'),
(3, 'Všechny knihy', 'Knihy');

-- --------------------------------------------------------

--
-- Table structure for table `nahradni_dily`
--

CREATE TABLE `nahradni_dily` (
  `idnahradni_dily` int(11) NOT NULL,
  `nazev` varchar(45) DEFAULT NULL,
  `do_ktereho_auta_se_hodi` varchar(45) DEFAULT NULL,
  `cena` varchar(45) DEFAULT NULL,
  `pocet_kusu_na_skalde` varchar(45) DEFAULT NULL,
  `automobily_idautomobily` int(11) NOT NULL,
  `automobily_majitel_vozu_idmajitel_vozu` int(11) NOT NULL,
  `automobily_typ_vozu_idtyp_vozu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nahradni_dily`
--

INSERT INTO `nahradni_dily` (`idnahradni_dily`, `nazev`, `do_ktereho_auta_se_hodi`, `cena`, `pocet_kusu_na_skalde`, `automobily_idautomobily`, `automobily_majitel_vozu_idmajitel_vozu`, `automobily_typ_vozu_idtyp_vozu`) VALUES
(1, 'zrcátko', 'Hyundai', '1500', '3', 1, 1, 1),
(2, 'výfuk', 'Skoda', '1000', '4', 2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `nahradni_dily_has_automobily`
--

CREATE TABLE `nahradni_dily_has_automobily` (
  `nahradni_dily_idnahradni_dily` int(11) NOT NULL,
  `nahradni_dily_automobily_idautomobily` int(11) NOT NULL,
  `nahradni_dily_automobily_majitel_vozu_idmajitel_vozu` int(11) NOT NULL,
  `nahradni_dily_automobily_typ_vozu_idtyp_vozu` int(11) NOT NULL,
  `automobily_idautomobily` int(11) NOT NULL,
  `automobily_majitel_vozu_idmajitel_vozu` int(11) NOT NULL,
  `automobily_typ_vozu_idtyp_vozu` int(11) NOT NULL,
  `automobily_nazev_vozu_idnazev_vozu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `nazev_vozu`
--

CREATE TABLE `nazev_vozu` (
  `idnazev_vozu` int(11) NOT NULL,
  `nazev_vozu` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nazev_vozu`
--

INSERT INTO `nazev_vozu` (`idnazev_vozu`, `nazev_vozu`) VALUES
(1, 'SuperB'),
(2, 'Octavia');

-- --------------------------------------------------------

--
-- Table structure for table `oprava`
--

CREATE TABLE `oprava` (
  `id` int(11) NOT NULL,
  `datum` varchar(45) DEFAULT NULL,
  `id_zamestnance` int(11) DEFAULT NULL,
  `zavada` varchar(45) DEFAULT NULL,
  `vymenene_soucastky` varchar(45) DEFAULT NULL,
  `cas` varchar(45) DEFAULT NULL,
  `naklady` varchar(45) DEFAULT NULL,
  `id_soucastky` varchar(45) DEFAULT NULL,
  `id_vymenenych_kusu_soucastek` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oprava`
--

INSERT INTO `oprava` (`id`, `datum`, `id_zamestnance`, `zavada`, `vymenene_soucastky`, `cas`, `naklady`, `id_soucastky`, `id_vymenenych_kusu_soucastek`) VALUES
(1, '22.3.2021', NULL, 'rozbita kapota', 'kapota', '16:30', '4400', NULL, NULL),
(2, '19.3.2021', NULL, 'rozbité okno', 'okno', '15:30', '5500', NULL, NULL),
(12, '22.3.2021', NULL, 'rozbity vyfuk', 'vyfuk', '16:00', '3500', NULL, NULL),
(13, '26.3.2021', NULL, 'porucha motoru', 'motor', '13:30', '6000', NULL, NULL),
(14, '26.3.2021', NULL, 'porucha motoru', 'motor', '13:30', '6000', NULL, NULL),
(15, '26.3.2021', NULL, 'rozbita klimatizace', 'klimatizace', '14:50', '3000', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `provedene_opravy_has_nahradni_dily`
--

CREATE TABLE `provedene_opravy_has_nahradni_dily` (
  `provedene_opravy_idprovedene_opravy` int(11) NOT NULL,
  `nahradni_dily_idnahradni_dily` int(11) NOT NULL,
  `nahradni_dily_automobily_idautomobily` int(11) NOT NULL,
  `nahradni_dily_automobily_majitel_vozu_idmajitel_vozu` int(11) NOT NULL,
  `nahradni_dily_automobily_typ_vozu_idtyp_vozu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `typ_vozu`
--

CREATE TABLE `typ_vozu` (
  `idtyp_vozu` int(11) NOT NULL,
  `typ_vozu` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `typ_vozu`
--

INSERT INTO `typ_vozu` (`idtyp_vozu`, `typ_vozu`) VALUES
(1, 'rodinny'),
(2, 'rodinny');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `activation_selector` varchar(255) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `forgotten_password_selector` varchar(255) DEFAULT NULL,
  `forgotten_password_code` varchar(255) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_selector` varchar(255) DEFAULT NULL,
  `remember_code` varchar(255) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `email`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', 'administrator', '$2y$12$QdcCWH15E/G7kP3GNVG0GeFwTsdlQnOw9QJqJyYOupoly7duO3Jeq', 'admin@admin.com', NULL, '', NULL, NULL, NULL, NULL, NULL, 1268889823, 1617971722, 1, 'Admin', 'istrator', 'ADMIN', '0'),
(2, '::1', NULL, '$2y$10$fmpIvFPljpgm/YNG7yfFkOh91sG5nDPRsPc1OcKR.qQ/QsrNgboSW', 'stepan.vracov@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1607077364, 1607078117, 1, 'St', 'Zb', 'oa', '1111');

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `zamestnanci`
--

CREATE TABLE `zamestnanci` (
  `id` int(11) NOT NULL,
  `jmeno` varchar(45) DEFAULT NULL,
  `prijmeni` varchar(45) DEFAULT NULL,
  `osobni_cislo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `zamestnanci`
--

INSERT INTO `zamestnanci` (`id`, `jmeno`, `prijmeni`, `osobni_cislo`) VALUES
(1, 'Stepan', 'Zboril', 5),
(2, 'Tereza', 'Novotná', 2),
(3, 'Nikolas', 'Tuzil', 3),
(6, 'Martin', 'Zboril', 4);

-- --------------------------------------------------------

--
-- Table structure for table `zamestnanci_has_provedene_opravy`
--

CREATE TABLE `zamestnanci_has_provedene_opravy` (
  `zamestnanci_idzaměstnanci` int(11) NOT NULL,
  `provedene_opravy_idprovedene_opravy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `automobily`
--
ALTER TABLE `automobily`
  ADD PRIMARY KEY (`idautomobily`,`majitel_vozu_idmajitel_vozu`,`typ_vozu_idtyp_vozu`,`nazev_vozu_idnazev_vozu`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `majitel_vozu`
--
ALTER TABLE `majitel_vozu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nahradni_dily`
--
ALTER TABLE `nahradni_dily`
  ADD PRIMARY KEY (`idnahradni_dily`,`automobily_idautomobily`,`automobily_majitel_vozu_idmajitel_vozu`,`automobily_typ_vozu_idtyp_vozu`);

--
-- Indexes for table `nahradni_dily_has_automobily`
--
ALTER TABLE `nahradni_dily_has_automobily`
  ADD PRIMARY KEY (`nahradni_dily_idnahradni_dily`,`nahradni_dily_automobily_idautomobily`,`nahradni_dily_automobily_majitel_vozu_idmajitel_vozu`,`nahradni_dily_automobily_typ_vozu_idtyp_vozu`,`automobily_idautomobily`,`automobily_majitel_vozu_idmajitel_vozu`,`automobily_typ_vozu_idtyp_vozu`,`automobily_nazev_vozu_idnazev_vozu`);

--
-- Indexes for table `nazev_vozu`
--
ALTER TABLE `nazev_vozu`
  ADD PRIMARY KEY (`idnazev_vozu`);

--
-- Indexes for table `oprava`
--
ALTER TABLE `oprava`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provedene_opravy_has_nahradni_dily`
--
ALTER TABLE `provedene_opravy_has_nahradni_dily`
  ADD PRIMARY KEY (`provedene_opravy_idprovedene_opravy`,`nahradni_dily_idnahradni_dily`,`nahradni_dily_automobily_idautomobily`,`nahradni_dily_automobily_majitel_vozu_idmajitel_vozu`,`nahradni_dily_automobily_typ_vozu_idtyp_vozu`);

--
-- Indexes for table `typ_vozu`
--
ALTER TABLE `typ_vozu`
  ADD PRIMARY KEY (`idtyp_vozu`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_email` (`email`),
  ADD UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  ADD UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`),
  ADD UNIQUE KEY `uc_remember_selector` (`remember_selector`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- Indexes for table `zamestnanci`
--
ALTER TABLE `zamestnanci`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zamestnanci_has_provedene_opravy`
--
ALTER TABLE `zamestnanci_has_provedene_opravy`
  ADD PRIMARY KEY (`zamestnanci_idzaměstnanci`,`provedene_opravy_idprovedene_opravy`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `majitel_vozu`
--
ALTER TABLE `majitel_vozu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `oprava`
--
ALTER TABLE `oprava`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `zamestnanci`
--
ALTER TABLE `zamestnanci`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
