-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 25, 2023 at 06:28 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `updationDate`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '18-05-2023 09:28:01 PM');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) NOT NULL,
  `categoryDescription` longtext NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(4, 'Pot Holes', 'Potholes are areas of road surface that have cracked, worn away, and eventually formed a hole.', '2023-09-25 16:15:22', ''),
(5, 'Road Cracks', 'Road cracks are caused by either repeated loading from traffic, or via temperature (climate) induced cracking.', '2023-09-25 16:15:58', ''),
(6, 'Blocked Drainage', 'Blocked drains are a result of residue build-up from either food or substance particles over time.', '2023-09-25 16:17:42', ''),
(7, 'Street Light', 'A street light or street lamp is a raised source of light often mounted on a pole', '2023-09-25 16:18:58', ''),
(8, 'Malfunctioning Traffic Signal', 'If the light is flashing, you should come to a complete stop, check traffic from all other directions.', '2023-09-25 16:20:12', '');

-- --------------------------------------------------------

--
-- Table structure for table `complaintremark`
--

CREATE TABLE `complaintremark` (
  `id` int(11) NOT NULL,
  `complaintNumber` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `remark` mediumtext NOT NULL,
  `remarkDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complaintremark`
--

INSERT INTO `complaintremark` (`id`, `complaintNumber`, `status`, `remark`, `remarkDate`) VALUES
(1, 1, 'in process', 'Thank You for your cooperation', '2023-06-18 13:18:44'),
(2, 1, 'closed', 'Thank you for your time and here is your gift for your first complain', '2023-06-18 13:28:32'),
(3, 2, 'in process', 'your complaint is in the process of review', '2023-06-18 16:17:09'),
(4, 2, 'closed', 'jaau gayera hera pole ko batti baliracha', '2023-06-18 16:19:16');

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `id` int(11) NOT NULL,
  `stateName` varchar(255) NOT NULL,
  `stateDescription` tinytext NOT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`id`, `stateName`, `stateDescription`, `postingDate`, `updationDate`) VALUES
(4, 'Province 1', '14 districts', '2023-09-25 15:38:12', ''),
(5, 'Province 2', '8 districts', '2023-09-25 15:38:39', ''),
(6, 'Province 3', '13 districts', '2023-09-25 15:39:08', ''),
(7, 'Province 4', '11 districts', '2023-09-25 15:40:14', ''),
(9, 'Province 5', '12 districts', '2023-09-25 15:41:38', ''),
(10, 'Province 6', '10 districts', '2023-09-25 15:43:11', ''),
(11, 'Province 7', '9 districts', '2023-09-25 15:43:39', '');

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `subcategory` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(1, 4, 'Deep Holes', '2023-09-25 16:21:16', ''),
(2, 4, 'Multiples Holes', '2023-09-25 16:21:29', ''),
(3, 5, 'Longitudinal Crack', '2023-09-25 16:22:24', ''),
(4, 5, 'Transverse Crack', '2023-09-25 16:22:43', ''),
(5, 6, 'Flood During Rain', '2023-09-25 16:24:44', ''),
(6, 6, 'Water Accumulation(paani jameko)', '2023-09-25 16:25:18', ''),
(7, 7, 'Malfunctioning', '2023-09-25 16:25:46', ''),
(8, 7, 'Switch Problem', '2023-09-25 16:26:04', ''),
(9, 7, 'Bulb Problem', '2023-09-25 16:26:23', ''),
(10, 8, 'Non Functioning Lights', '2023-09-25 16:27:00', ''),
(11, 8, 'Inconsistent Behaviour', '2023-09-25 16:28:03', '');

-- --------------------------------------------------------

--
-- Table structure for table `tblcomplaints`
--

CREATE TABLE `tblcomplaints` (
  `complaintNumber` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `subcategory` varchar(255) NOT NULL,
  `complaintType` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `noc` varchar(255) NOT NULL,
  `complaintDetails` mediumtext NOT NULL,
  `complaintFile` varchar(255) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(50) DEFAULT NULL,
  `lastUpdationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcomplaints`
--

INSERT INTO `tblcomplaints` (`complaintNumber`, `userId`, `category`, `subcategory`, `complaintType`, `state`, `noc`, `complaintDetails`, `complaintFile`, `regDate`, `status`, `lastUpdationDate`) VALUES
(1, 2, 1, 'Select Subcategory', ' Complaint', 'Bagmati', 'baato bhayena k', 'demo', 'Screenshot (1065).png', '2023-06-18 13:17:37', 'closed', '2023-06-18 13:28:32'),
(2, 2, 2, 'Select Subcategory', ' Complaint', 'lumbini', 'batti gul', 'pole ko batti balena balen', 'Screenshot (1067).png', '2023-06-18 16:16:11', 'closed', '2023-06-18 16:19:16'),
(3, 2, 2, 'Select Subcategory', ' Complaint', 'lumbini', 'batti gul', 'pole ko batti balena balen', 'Screenshot (1067).png', '2023-06-18 16:17:21', NULL, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `userip` binary(16) NOT NULL,
  `loginTime` timestamp NOT NULL DEFAULT current_timestamp(),
  `logout` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `uid`, `username`, `userip`, `loginTime`, `logout`, `status`) VALUES
(1, 0, 'john@gmail.com', 0x3a3a3100000000000000000000000000, '2020-05-08 14:14:43', '', 0),
(2, 1, 'john@gmail.com', 0x3a3a3100000000000000000000000000, '2020-05-08 14:14:50', '08-05-2020 07:44:51 PM', 1),
(3, 1, 'john@gmail.com', 0x3a3a3100000000000000000000000000, '2020-05-08 14:16:30', '', 1),
(4, 0, 'admin', 0x3a3a3100000000000000000000000000, '2023-05-18 15:44:07', '', 0),
(5, 0, 'admin', 0x3a3a3100000000000000000000000000, '2023-05-18 15:54:21', '', 0),
(6, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-05-18 15:56:02', '18-05-2023 09:27:39 PM', 1),
(7, 0, 'admin', 0x3a3a3100000000000000000000000000, '2023-05-18 15:58:35', '', 0),
(8, 0, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-05-18 15:58:44', '', 0),
(9, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-05-18 15:58:59', '18-05-2023 09:32:10 PM', 1),
(10, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-05-18 16:04:12', '18-05-2023 09:35:28 PM', 1),
(11, 0, 'admin', 0x3a3a3100000000000000000000000000, '2023-06-18 13:12:09', '', 0),
(12, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-18 13:13:52', '18-06-2023 06:45:34 PM', 1),
(13, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-18 13:17:07', '18-06-2023 06:47:56 PM', 1),
(14, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-18 13:19:07', '', 1),
(15, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-18 15:43:58', '18-06-2023 09:36:41 PM', 1),
(16, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-18 16:13:20', '18-06-2023 09:44:01 PM', 1),
(17, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-18 16:15:24', '18-06-2023 10:04:20 PM', 1),
(18, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-20 16:34:20', '20-06-2023 10:10:28 PM', 1),
(19, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-20 16:41:01', '20-06-2023 10:13:22 PM', 1),
(20, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-20 16:57:42', '', 1),
(21, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-20 16:57:48', '', 1),
(22, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-20 17:17:46', '', 1),
(23, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-20 17:45:54', '', 1),
(24, 0, 'admin', 0x3a3a3100000000000000000000000000, '2023-06-24 09:57:36', '24-06-2023 03:28:33 PM', 0),
(25, 0, 'admin', 0x3a3a3100000000000000000000000000, '2023-06-28 04:53:20', '', 0),
(26, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-28 04:53:27', '', 1),
(27, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-28 04:53:44', '28-06-2023 10:47:05 AM', 1),
(28, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-28 05:17:52', '', 1),
(29, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-28 06:20:12', '', 1),
(30, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-06-28 06:44:38', '', 1),
(31, 0, 'admin', 0x3a3a3100000000000000000000000000, '2023-07-02 02:35:14', '', 0),
(32, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-02 02:35:22', '', 1),
(33, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-06 04:08:13', '06-07-2023 09:41:58 AM', 1),
(34, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-07 02:33:12', '', 1),
(35, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-07 02:34:32', '', 1),
(36, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-09 06:52:46', '09-07-2023 12:24:25 PM', 1),
(37, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-09 07:14:26', '09-07-2023 07:06:57 PM', 1),
(38, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-09 13:37:04', '', 1),
(39, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-09 13:41:40', '', 1),
(40, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-09 14:58:25', '09-07-2023 10:25:15 PM', 1),
(41, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-09 16:40:19', '09-07-2023 10:25:30 PM', 1),
(42, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-09 16:40:40', '09-07-2023 10:25:42 PM', 1),
(43, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-09 16:40:53', '09-07-2023 10:25:54 PM', 1),
(44, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-09 16:43:59', '', 1),
(45, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-09 16:45:31', '', 1),
(46, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-09 16:46:45', '', 1),
(47, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-09 16:47:59', '09-07-2023 10:34:36 PM', 1),
(48, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-09 16:49:40', '09-07-2023 10:38:12 PM', 1),
(49, 0, '9843966770', 0x3a3a3100000000000000000000000000, '2023-07-09 16:57:03', '', 0),
(50, 0, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-09 16:57:07', '', 0),
(51, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-09 16:57:15', '', 1),
(52, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-11 13:35:58', '11-07-2023 07:21:47 PM', 1),
(53, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-11 14:46:54', '11-07-2023 08:31:58 PM', 1),
(54, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-11 14:47:02', '11-07-2023 08:32:26 PM', 1),
(55, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-11 14:49:20', '11-07-2023 08:34:58 PM', 1),
(56, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-11 14:55:09', '11-07-2023 08:40:43 PM', 1),
(57, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-11 14:58:02', '11-07-2023 08:43:35 PM', 1),
(58, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-13 12:52:48', '19-09-2023 04:42:10 PM', 1),
(59, 0, 'Aashu', 0x3a3a3100000000000000000000000000, '2023-09-19 10:57:22', '', 0),
(60, 0, 'aashu', 0x3a3a3100000000000000000000000000, '2023-09-19 10:57:42', '', 0),
(61, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-09-19 10:57:47', '', 1),
(62, 0, 'aashu', 0x3a3a3100000000000000000000000000, '2023-09-19 11:04:21', '', 0),
(63, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-09-19 11:04:25', '19-09-2023 04:51:01 PM', 1),
(64, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-09-19 11:14:31', '19-09-2023 10:14:50 PM', 1),
(65, 0, 'hari@gmail.com', 0x3a3a3100000000000000000000000000, '2023-09-20 19:01:34', '', 0),
(66, 4, 'hari@gmail.com', 0x3a3a3100000000000000000000000000, '2023-09-20 19:01:44', '21-09-2023 12:54:00 AM', 1),
(67, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-09-20 20:53:52', '21-09-2023 02:39:18 AM', 1),
(68, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-09-20 21:06:03', '25-09-2023 06:28:04 PM', 1),
(69, 0, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-09-25 12:48:31', '', 0),
(70, 0, 'Aashu', 0x3a3a3100000000000000000000000000, '2023-09-25 12:48:37', '', 0),
(71, 4, 'hari@gmail.com', 0x3a3a3100000000000000000000000000, '2023-09-25 12:48:44', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `contactNo` bigint(11) DEFAULT NULL,
  `address` tinytext DEFAULT NULL,
  `State` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `pincode` int(6) DEFAULT NULL,
  `userImage` varchar(255) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(1) NOT NULL,
  `reset_token_hash` varchar(64) DEFAULT NULL,
  `reset_token_expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullName`, `userEmail`, `password`, `contactNo`, `address`, `State`, `country`, `pincode`, `userImage`, `regDate`, `updationDate`, `status`, `reset_token_hash`, `reset_token_expires_at`) VALUES
(1, 'John Smith', 'john@gmail.com', '202cb962ac59075b964b07152d234b70', 9999999999, NULL, NULL, NULL, NULL, NULL, '2020-05-08 14:10:50', '2023-09-20 19:46:20', 1, '83c5e8e825f7d5bf9d05fb6bc531b67348ce5ec78749ba1df574d1a508448545', '2023-09-20 22:16:20'),
(2, 'User Name', 'aashutoshbro1@gmail.com', 'da998cc422a0dccd0009bd332fa99e13', 9843966770, 'Bharatpur', 'Bagmati', 'Nepal', 44200, NULL, '2023-05-18 15:55:06', '2023-09-25 08:31:17', 1, '9f4016b435700581f4461ed5215c9135ca70410efeb0e2d42ac6451c38c0ed55', '2023-09-25 11:01:17'),
(3, 'rajeev', 'rajjev@gmail.com', '5d41402abc4b2a76b9719d911017c592', 9840000000, NULL, NULL, NULL, NULL, NULL, '2023-05-18 16:03:38', '0000-00-00 00:00:00', 1, NULL, NULL),
(4, 'hari', 'hari@gmail.com', '0769e56eb5d72039f01530d705e971da', 0, NULL, NULL, NULL, NULL, NULL, '2023-09-20 19:01:19', NULL, 1, NULL, NULL),
(5, 'james', 'jame@gmail.com', 'b9366f63dca441a309412bfd20517f11', 0, NULL, NULL, NULL, NULL, NULL, '2023-09-20 19:09:31', NULL, 1, NULL, NULL),
(6, 'james', 'jame@gmail.com', 'b9366f63dca441a309412bfd20517f11', 0, NULL, NULL, NULL, NULL, NULL, '2023-09-20 19:10:55', NULL, 1, NULL, NULL),
(7, 'james', 'jame@gmail.com', 'b9366f63dca441a309412bfd20517f11', 0, NULL, NULL, NULL, NULL, NULL, '2023-09-20 19:11:56', NULL, 1, NULL, NULL),
(8, 'james', 'jame@gmail.com', 'b9366f63dca441a309412bfd20517f11', 0, NULL, NULL, NULL, NULL, NULL, '2023-09-20 19:12:02', NULL, 1, NULL, NULL),
(9, 'james', 'jame@gmail.com', 'b9366f63dca441a309412bfd20517f11', 0, NULL, NULL, NULL, NULL, NULL, '2023-09-20 19:12:05', NULL, 1, NULL, NULL),
(10, 'james', 'jame@gmail.com', 'b9366f63dca441a309412bfd20517f11', 0, NULL, NULL, NULL, NULL, NULL, '2023-09-20 19:12:06', NULL, 1, NULL, NULL),
(11, 'james', 'jame@gmail.com', 'b9366f63dca441a309412bfd20517f11', 0, NULL, NULL, NULL, NULL, NULL, '2023-09-20 19:13:08', NULL, 1, NULL, NULL),
(12, 'james', 'jame@gmail.com', 'b9366f63dca441a309412bfd20517f11', 0, NULL, NULL, NULL, NULL, NULL, '2023-09-20 19:13:11', NULL, 1, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaintremark`
--
ALTER TABLE `complaintremark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcomplaints`
--
ALTER TABLE `tblcomplaints`
  ADD PRIMARY KEY (`complaintNumber`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reset_token_hash` (`reset_token_hash`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `complaintremark`
--
ALTER TABLE `complaintremark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tblcomplaints`
--
ALTER TABLE `tblcomplaints`
  MODIFY `complaintNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
