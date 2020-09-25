-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 18, 2020 at 12:36 PM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nosokomeio`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `onoma` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `epitheto` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `etos_gennhshs` int(11) DEFAULT NULL,
  `amka` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `eidikothta` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`onoma`, `epitheto`, `etos_gennhshs`, `amka`, `eidikothta`) VALUES
('John', 'Doe', 1994, '1243120590123', 'cardiologist');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `onoma` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `epitheto` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `fulo` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL,
  `trex_nosos` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `allergies` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL,
  `nosokomeiako_istoriko` text COLLATE utf8mb4_bin,
  `farmaka` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL,
  `klin_kat` text COLLATE utf8mb4_bin,
  `amka_a` varchar(20) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `surge`
--

CREATE TABLE `surge` (
  `amka_i` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `code_xe` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `head` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `surgery`
--

CREATE TABLE `surgery` (
  `praktiko` varchar(5000) COLLATE utf8mb4_bin DEFAULT NULL,
  `wra` time DEFAULT NULL,
  `hmeromhnia` date DEFAULT NULL,
  `perigrafh` text COLLATE utf8mb4_bin,
  `kwdikos_xeir` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `amka_a` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `amka` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`, `amka`) VALUES
('cardio_jd', '12345678', '1243120590123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`amka`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`amka_a`);

--
-- Indexes for table `surge`
--
ALTER TABLE `surge`
  ADD KEY `code_xe` (`code_xe`);

--
-- Indexes for table `surgery`
--
ALTER TABLE `surgery`
  ADD PRIMARY KEY (`kwdikos_xeir`),
  ADD KEY `amka_a` (`amka_a`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`),
  ADD KEY `amka` (`amka`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `surge`
--
ALTER TABLE `surge`
  ADD CONSTRAINT `surge_ibfk_1` FOREIGN KEY (`code_xe`) REFERENCES `surgery` (`kwdikos_xeir`);

--
-- Constraints for table `surgery`
--
ALTER TABLE `surgery`
  ADD CONSTRAINT `surgery_ibfk_1` FOREIGN KEY (`amka_a`) REFERENCES `patient` (`amka_a`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`amka`) REFERENCES `doctor` (`amka`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
