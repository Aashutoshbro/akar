-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 06, 2023 at 05:58 AM
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
(1, 'Road', 'This is a category for complaint related to road maintenance', '2023-06-18 13:16:17', ''),
(2, 'Pole ko batti', 'this is category for pole ko batti', '2023-06-18 16:14:44', '');

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
(1, 'Bagmati', 'demo state', '2023-06-18 13:16:37', ''),
(2, 'lumbini', 'demo state 2\r\n', '2023-06-18 16:15:11', ''),
(3, 'lumbini', 'demo state 2\r\n', '2023-06-18 16:16:19', '');

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
(32, 2, 'aashutoshbro1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-02 02:35:22', '', 1);

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
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullName`, `userEmail`, `password`, `contactNo`, `address`, `State`, `country`, `pincode`, `userImage`, `regDate`, `updationDate`, `status`) VALUES
(1, 'John Smith', 'john@gmail.com', '202cb962ac59075b964b07152d234b70', 9999999999, NULL, NULL, NULL, NULL, NULL, '2020-05-08 14:10:50', '2020-05-08 14:16:22', 1),
(2, 'Aashutosh Sapkota', 'aashutoshbro1@gmail.com', 'da998cc422a0dccd0009bd332fa99e13', 9843966770, NULL, NULL, NULL, NULL, NULL, '2023-05-18 15:55:06', '0000-00-00 00:00:00', 1),
(3, 'rajeev', 'rajjev@gmail.com', '5d41402abc4b2a76b9719d911017c592', 9840000000, NULL, NULL, NULL, NULL, NULL, '2023-05-18 16:03:38', '0000-00-00 00:00:00', 1);

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
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `complaintremark`
--
ALTER TABLE `complaintremark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblcomplaints`
--
ALTER TABLE `tblcomplaints`
  MODIFY `complaintNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
