-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 18, 2018 at 11:44 AM
-- Server version: 5.6.41
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smsaware_smsaware`
--

-- --------------------------------------------------------

--
-- Table structure for table `Address`
--

CREATE TABLE `Address` (
  `ADDRESS_ID` bigint(50) NOT NULL,
  `USER_ADDRESS` varchar(100) DEFAULT NULL,
  `STREET` varchar(50) DEFAULT NULL,
  `CITY` varchar(50) DEFAULT NULL,
  `STATE` varchar(50) DEFAULT NULL,
  `ZIP` varchar(10) DEFAULT NULL,
  `userId` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
-- Error reading data for table smsaware_smsaware.Address: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'FROM `smsaware_smsaware`.`Address`' at line 1

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `commentsId` int(20) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `website` varchar(50) DEFAULT NULL,
  `subjects` varchar(50) DEFAULT NULL,
  `comments` varchar(100) DEFAULT NULL,
  `commentDate` datetime DEFAULT NULL,
  `parentsId` int(20) DEFAULT NULL,
  `approved` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- Error reading data for table smsaware_smsaware.comments: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'FROM `smsaware_smsaware`.`comments`' at line 1

-- --------------------------------------------------------

--
-- Table structure for table `MessageHistory`
--

CREATE TABLE `MessageHistory` (
  `messageHistoryId` bigint(50) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `message` varchar(1000) DEFAULT NULL,
  `messageDate` datetime DEFAULT NULL,
  `userId` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
-- Error reading data for table smsaware_smsaware.MessageHistory: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'FROM `smsaware_smsaware`.`MessageHistory`' at line 1

-- --------------------------------------------------------

--
-- Table structure for table `numberlocator`
--

CREATE TABLE `numberlocator` (
  `id` bigint(20) NOT NULL,
  `preNumber` varchar(20) DEFAULT NULL,
  `provider` varchar(100) DEFAULT NULL,
  `state` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- Error reading data for table smsaware_smsaware.numberlocator: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'FROM `smsaware_smsaware`.`numberlocator`' at line 1

-- --------------------------------------------------------

--
-- Table structure for table `profileImage`
--

CREATE TABLE `profileImage` (
  `userId` int(11) NOT NULL,
  `photo` mediumblob
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
-- Error reading data for table smsaware_smsaware.profileImage: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'FROM `smsaware_smsaware`.`profileImage`' at line 1

-- --------------------------------------------------------

--
-- Table structure for table `reply`
--

CREATE TABLE `reply` (
  `replyId` int(20) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `comments` varchar(100) DEFAULT NULL,
  `commentsId` int(20) DEFAULT NULL,
  `approved` varchar(5) DEFAULT NULL,
  `replyDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- Error reading data for table smsaware_smsaware.reply: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'FROM `smsaware_smsaware`.`reply`' at line 1

-- --------------------------------------------------------

--
-- Table structure for table `user_contacts`
--

CREATE TABLE `user_contacts` (
  `CONTACT_ID` bigint(50) NOT NULL,
  `CONTACT_NAME` varchar(100) DEFAULT NULL,
  `PHONE_NUMBER` varchar(50) DEFAULT NULL,
  `CITY` varchar(50) DEFAULT NULL,
  `STATE` varchar(50) DEFAULT NULL,
  `userId` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- Error reading data for table smsaware_smsaware.user_contacts: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'FROM `smsaware_smsaware`.`user_contacts`' at line 1

-- --------------------------------------------------------

--
-- Table structure for table `USER_OTP`
--

CREATE TABLE `USER_OTP` (
  `userId` bigint(100) NOT NULL,
  `currentOtp` varchar(1000) DEFAULT NULL,
  `otpTime` datetime DEFAULT NULL,
  `isAuthenticated` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
-- Error reading data for table smsaware_smsaware.USER_OTP: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'FROM `smsaware_smsaware`.`USER_OTP`' at line 1

-- --------------------------------------------------------

--
-- Table structure for table `user_registration`
--

CREATE TABLE `user_registration` (
  `id` int(100) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `BIRTH_DATE` varchar(50) DEFAULT NULL,
  `GENDER` varchar(10) DEFAULT NULL,
  `NATIONALITY` varchar(50) DEFAULT NULL,
  `WEBSITE` varchar(100) NOT NULL,
  `NO_OF_SMS` int(10) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `PASSWORD` varchar(100) NOT NULL,
  `PHONE` bigint(100) NOT NULL,
  `CREATION_DATE` datetime NOT NULL,
  `AUTHENTICATED` varchar(5) NOT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `aboutMe` varchar(100) DEFAULT NULL,
  `securityQuen` varchar(100) DEFAULT NULL,
  `securityAns` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
-- Error reading data for table smsaware_smsaware.user_registration: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'FROM `smsaware_smsaware`.`user_registration`' at line 1

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Address`
--
ALTER TABLE `Address`
  ADD PRIMARY KEY (`ADDRESS_ID`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`commentsId`);

--
-- Indexes for table `MessageHistory`
--
ALTER TABLE `MessageHistory`
  ADD PRIMARY KEY (`messageHistoryId`);

--
-- Indexes for table `numberlocator`
--
ALTER TABLE `numberlocator`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profileImage`
--
ALTER TABLE `profileImage`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `reply`
--
ALTER TABLE `reply`
  ADD PRIMARY KEY (`replyId`);

--
-- Indexes for table `user_contacts`
--
ALTER TABLE `user_contacts`
  ADD PRIMARY KEY (`CONTACT_ID`);

--
-- Indexes for table `user_registration`
--
ALTER TABLE `user_registration`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Address`
--
ALTER TABLE `Address`
  MODIFY `ADDRESS_ID` bigint(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `commentsId` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `MessageHistory`
--
ALTER TABLE `MessageHistory`
  MODIFY `messageHistoryId` bigint(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `reply`
--
ALTER TABLE `reply`
  MODIFY `replyId` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_contacts`
--
ALTER TABLE `user_contacts`
  MODIFY `CONTACT_ID` bigint(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user_registration`
--
ALTER TABLE `user_registration`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
