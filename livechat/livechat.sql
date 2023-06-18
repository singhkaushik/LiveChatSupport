-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2023 at 08:10 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `livechat`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `role` enum('Guest','Operator') NOT NULL,
  `secret` varchar(255) NOT NULL DEFAULT '',
  `last_seen` datetime NOT NULL,
  `status` enum('Occupied','Waiting','Idle') NOT NULL DEFAULT 'Idle'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `email`, `password`, `full_name`, `role`, `secret`, `last_seen`, `status`) VALUES
(1, 'operator@example.com', 'Livechat@123', 'Operator', 'Operator', '$2y$10$FynMD5G3iN1PQ2iCL5fc1u8WQf/YE6svhX6EeA0JAYIFtPTRB6CM6', '2023-06-18 07:53:24', 'Occupied'),
(2, 'test@gmail.com', '123456', 'test', 'Operator', '$2y$10$OMZxYrrsyl3Jy2ffYsT.iepNV76OsDSf9MTZbgtGtAn9jd4rXaMQK', '2023-06-18 07:07:15', 'Occupied'),
(3, 'test387927@gmail.com', '', 'Gaurav', 'Guest', '$2y$10$gRvryoQvl1c8ihBoJb/DF.J.m2SJk.ukpiJhg2WVO89vKniy2JaHW', '2023-06-18 07:05:21', 'Occupied'),
(4, 'ghapinku@gmail.com', '', 'kaushik', 'Guest', '$2y$10$qpHsTitCgaW05S1ULeU0jeNeV5FfbYu8gbv3Zw.GoLTNZqlyZkPpy', '2023-06-18 07:53:20', 'Occupied');

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` int(11) NOT NULL,
  `account_sender_id` int(11) NOT NULL,
  `account_receiver_id` int(11) NOT NULL,
  `submit_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `conversations`
--

INSERT INTO `conversations` (`id`, `account_sender_id`, `account_receiver_id`, `submit_date`) VALUES
(1, 3, 2, '2023-06-18 07:02:26'),
(2, 4, 1, '2023-06-18 07:07:32');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `conversation_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `msg` varchar(255) NOT NULL,
  `submit_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `conversation_id`, `account_id`, `msg`, `submit_date`) VALUES
(1, 1, 3, 'hi ', '2023-06-18 07:02:33'),
(2, 1, 2, 'hi gaurav', '2023-06-18 07:04:13'),
(3, 1, 2, 'how are you', '2023-06-18 07:04:23'),
(4, 1, 3, 'i\'m fine and you', '2023-06-18 07:04:37'),
(5, 1, 2, 'hi', '2023-06-18 07:06:20'),
(6, 2, 4, 'hi', '2023-06-18 07:07:44'),
(7, 2, 1, 'hlo', '2023-06-18 07:07:53'),
(8, 2, 1, 'how can i help you', '2023-06-18 07:08:02'),
(9, 2, 4, 'when can i get my order delivered', '2023-06-18 07:08:22'),
(10, 2, 1, 'within 10 hours', '2023-06-18 07:08:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
