-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 17, 2019 at 10:37 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `umovies`
--

-- --------------------------------------------------------

--
-- Table structure for table `actors`
--

CREATE TABLE `actors` (
  `name` varchar(80) NOT NULL,
  `gender` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `directed_by`
--

CREATE TABLE `directed_by` (
  `movie` varchar(100) NOT NULL,
  `year` year(4) NOT NULL,
  `director` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `directors`
--

CREATE TABLE `directors` (
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `name` varchar(100) NOT NULL,
  `year` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `performed_in`
--

CREATE TABLE `performed_in` (
  `actor` varchar(80) NOT NULL,
  `movie` varchar(100) NOT NULL,
  `year` year(4) NOT NULL,
  `role` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actors`
--
ALTER TABLE `actors`
  ADD PRIMARY KEY (`name`,`gender`);

--
-- Indexes for table `directed_by`
--
ALTER TABLE `directed_by`
  ADD PRIMARY KEY (`movie`,`year`,`director`),
  ADD KEY `director` (`director`);

--
-- Indexes for table `directors`
--
ALTER TABLE `directors`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`name`,`year`);

--
-- Indexes for table `performed_in`
--
ALTER TABLE `performed_in`
  ADD PRIMARY KEY (`actor`,`movie`,`year`,`role`),
  ADD KEY `movie` (`movie`,`year`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `directed_by`
--
ALTER TABLE `directed_by`
  ADD CONSTRAINT `directed_by_ibfk_1` FOREIGN KEY (`director`) REFERENCES `directors` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `directed_by_ibfk_2` FOREIGN KEY (`movie`,`year`) REFERENCES `movies` (`name`, `year`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `performed_in`
--
ALTER TABLE `performed_in`
  ADD CONSTRAINT `performed_in_ibfk_1` FOREIGN KEY (`actor`) REFERENCES `actors` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `performed_in_ibfk_2` FOREIGN KEY (`movie`,`year`) REFERENCES `movies` (`name`, `year`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
