-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 15, 2019 at 09:47 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.1.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `network_providers`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL,
  `is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `created_date`, `is_deleted`) VALUES
(1, '100MB', '2019-02-16 00:20:00', 0),
(2, '200MB', '2019-02-16 00:20:00', 0),
(3, '300MB', '2019-02-16 00:20:00', 0),
(4, '17MB', '2019-02-16 00:20:00', 0),
(5, '72MB', '2019-02-16 00:20:00', 0),
(6, 'Standard tariff', '2019-02-16 00:20:00', 0),
(7, 'Green tariff', '2019-02-16 00:20:00', 0),
(8, 'Saver tariff', '2019-02-16 00:20:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `providers`
--

CREATE TABLE `providers` (
  `id` int(11) NOT NULL,
  `provider_name` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL,
  `is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `providers`
--

INSERT INTO `providers` (`id`, `provider_name`, `created_date`, `is_deleted`) VALUES
(1, 'BSNL', '2019-02-16 00:20:00', 0),
(2, 'Airtel', '2019-02-16 00:20:00', 0),
(3, 'Indane energy', '2019-02-16 00:20:00', 0),
(4, 'Tata Power', '2019-02-16 00:20:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `provider_product_mappings`
--

CREATE TABLE `provider_product_mappings` (
  `id` int(11) NOT NULL,
  `provider_type_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variation_id` int(11) DEFAULT NULL,
  `monthly_price` double NOT NULL,
  `created_date` datetime NOT NULL,
  `is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `provider_product_mappings`
--

INSERT INTO `provider_product_mappings` (`id`, `provider_type_id`, `provider_id`, `product_id`, `variation_id`, `monthly_price`, `created_date`, `is_deleted`) VALUES
(1, 1, 1, 1, NULL, 30, '2019-02-16 00:20:00', 0),
(2, 1, 1, 2, NULL, 40, '2019-02-16 00:20:00', 0),
(3, 1, 1, 3, NULL, 50, '2019-02-16 00:20:00', 0),
(4, 1, 2, 4, NULL, 25, '2019-02-16 00:20:00', 0),
(5, 1, 2, 5, NULL, 40, '2019-02-16 00:20:00', 0),
(6, 2, 3, 6, 1, 12.12, '2019-02-16 00:20:00', 0),
(7, 2, 3, 6, 2, 56.5, '2019-02-16 00:20:00', 0),
(8, 2, 3, 6, 3, 61.92, '2019-02-16 00:20:00', 0),
(9, 2, 3, 7, 1, 64.85, '2019-02-16 00:20:00', 0),
(10, 2, 3, 7, 2, 68.21, '2019-02-16 00:20:00', 0),
(11, 2, 3, 7, 3, 71.66, '2019-02-16 00:20:00', 0),
(12, 2, 4, 6, 1, 51.95, '2019-02-16 00:20:00', 0),
(13, 2, 4, 6, 2, 52, '2019-02-16 00:20:00', 0),
(14, 2, 4, 6, 3, 56.62, '2019-02-16 00:20:00', 0),
(15, 2, 4, 8, 1, 42.57, '2019-02-16 00:20:00', 0),
(16, 2, 4, 8, 2, 45.22, '2019-02-16 00:20:00', 0),
(17, 2, 4, 8, 3, 47.67, '2019-02-16 00:20:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `provider_type`
--

CREATE TABLE `provider_type` (
  `id` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL,
  `is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `provider_type`
--

INSERT INTO `provider_type` (`id`, `type`, `created_date`, `is_deleted`) VALUES
(1, 'BROADBAND', '2019-02-16 00:20:00', 0),
(2, 'ENERGY PROVIDERS', '2019-02-16 00:20:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `variations`
--

CREATE TABLE `variations` (
  `id` int(11) NOT NULL,
  `variation_type` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL,
  `is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `variations`
--

INSERT INTO `variations` (`id`, `variation_type`, `created_date`, `is_deleted`) VALUES
(1, 'North', '2019-02-16 00:20:00', 0),
(2, 'Mid', '2019-02-16 00:20:00', 0),
(3, 'South', '2019-02-16 00:20:00', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provider_product_mappings`
--
ALTER TABLE `provider_product_mappings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_PROVIDER` (`provider_id`),
  ADD KEY `FK_PRODUCT` (`product_id`),
  ADD KEY `FK_VARIATION` (`variation_id`),
  ADD KEY `FK_PROVIDER_TYPE` (`provider_type_id`);

--
-- Indexes for table `provider_type`
--
ALTER TABLE `provider_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `variations`
--
ALTER TABLE `variations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `providers`
--
ALTER TABLE `providers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `provider_product_mappings`
--
ALTER TABLE `provider_product_mappings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `provider_type`
--
ALTER TABLE `provider_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `variations`
--
ALTER TABLE `variations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `provider_product_mappings`
--
ALTER TABLE `provider_product_mappings`
  ADD CONSTRAINT `FK_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FK_PROVIDER` FOREIGN KEY (`provider_id`) REFERENCES `providers` (`id`),
  ADD CONSTRAINT `FK_PROVIDER_TYPE` FOREIGN KEY (`provider_type_id`) REFERENCES `provider_type` (`id`),
  ADD CONSTRAINT `FK_VARIATION` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
