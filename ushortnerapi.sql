-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 23, 2023 at 03:39 PM
-- Server version: 8.0.32-0ubuntu0.20.04.2
-- PHP Version: 7.4.3-4ubuntu2.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ushortnerapi`
--

-- --------------------------------------------------------

--
-- Table structure for table `api`
--

CREATE TABLE `api` (
  `id` int NOT NULL,
  `api_key` varchar(255) NOT NULL,
  `requests_left` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `api`
--

INSERT INTO `api` (`id`, `api_key`, `requests_left`) VALUES
(1, 'O48pNTzZZNTgjNUrbEPOcDjBYDfd4G3v', 10),
(2, 'FCFNiOrRyCtPlDtDAHFc6yCbLQ4TIzis', 0),
(3, '52nAZZ4klulQTNsGfhEgCp1CxC93kG62', 10),
(4, '1orKDnG69dYxvTT9PEdE0SRHQoPwZGq9', 999),
(5, 'eI2y0njQtn9MePlOAxPKnTTCNwzs9Q8q', 0),
(6, 'COMPANY_API_KEY', 99995);

-- --------------------------------------------------------

--
-- Table structure for table `shorten_links`
--

CREATE TABLE `shorten_links` (
  `id` int NOT NULL,
  `urllong` varchar(255) NOT NULL,
  `urlshort` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `shorten_links`
--

INSERT INTO `shorten_links` (`id`, `urllong`, `urlshort`) VALUES
(1, 'https://stackoverflow.com/', 'DH0OL'),
(2, 'https://stackoverflow.com/', 'vCYmv'),
(3, 'https://stackoverflow.com/', 'Vkb4S'),
(4, 'https://stackoverflow.com/', 'pYUQY'),
(5, 'https://stackoverflow.com/', 'RjybOy'),
(6, '1234', 'rvvo2Q'),
(7, '1234', 's2VH22'),
(8, '1234', 'hyBDJm'),
(9, 'https://www.w3schools.com/', 'ZlGuKU'),
(10, 'https://stackoverflow.com', 'BKdvBM'),
(11, 'http://localhost/UShortnerAPI/createapi.php', 'JvOER9'),
(12, 'https://google.com', '9umpBu'),
(13, 'https://www.google.com/', 'HrndfN'),
(14, 'https://google.com', 'YCyLAq'),
(15, 'http://localhost/UShortnerAPI/viewapi.php?url=YCyLAq', 'o6rtd8');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `api`
--
ALTER TABLE `api`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shorten_links`
--
ALTER TABLE `shorten_links`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `api`
--
ALTER TABLE `api`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `shorten_links`
--
ALTER TABLE `shorten_links`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
