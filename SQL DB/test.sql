-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 07, 2018 at 07:07 AM
-- Server version: 5.7.23-log
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `posttest`
--

CREATE TABLE `posttest` (
  `postID` int(11) NOT NULL,
  `address` varchar(45) NOT NULL,
  `contents` varchar(60000) NOT NULL,
  `title` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Owner` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posttest`
--

INSERT INTO `posttest` (`postID`, `address`, `contents`, `title`, `type`, `date`, `Owner`) VALUES
(5, 'St.Lucia', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 'INFS3208_Assignment', 'find', '2018-10-07 04:08:08', 's4405278'),
(6, 'St.Lucia', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 'INFS3208_Assignment 2', 'find', '2018-10-07 04:08:49', 's4405278'),
(7, 'St.Lucia', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 'INFS3208_Assignment 3', 'find', '2018-10-07 04:08:55', 's4405278'),
(10, 'St.Lucia', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 'INFS3208_Assignment 4', 'employ', '2018-10-07 04:20:22', 's4405278'),
(14, 'St.Lucia', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 'INFS3208_Assignment 5', 'employ', '2018-10-07 04:25:24', 's4405278');

-- --------------------------------------------------------

--
-- Table structure for table `usertest`
--

CREATE TABLE `usertest` (
  `ID` int(100) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `Email` varchar(60) NOT NULL,
  `Password` varchar(200) NOT NULL,
  `Icon` varchar(20) NOT NULL DEFAULT 'img/default.jpg',
  `Gender` varchar(45) NOT NULL,
  `Address` varchar(45) NOT NULL,
  `Country` varchar(45) NOT NULL,
  `Phone` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usertest`
--

INSERT INTO `usertest` (`ID`, `Username`, `Email`, `Password`, `Icon`, `Gender`, `Address`, `Country`, `Phone`) VALUES
(1, 's4405272', 'ligushijila@gmail.com', '$2b$12$YaH6BYCGNPN7RwXepo0iDuu0.XmKZV.kOMdVU4DyiOKPy5h13ZMZ2', 'baa7da208ecf84b6.png', '', '', '', 0),
(7, 's4405278', 'ligusjila@gmail.com', '$2y$10$Uet3sY2u/4Frrs45Y6uWgO6oQDEBXMsNNDWAHvOLujDtPHOBDXfvC', 'default.jpg', 'Male', 'St.Lucia', 'Austraila', 451871234);

-- --------------------------------------------------------

--
-- Table structure for table `user_post_relationship`
--

CREATE TABLE `user_post_relationship` (
  `U_id` int(11) NOT NULL,
  `P_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_post_relationship`
--

INSERT INTO `user_post_relationship` (`U_id`, `P_id`) VALUES
(7, 14);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `posttest`
--
ALTER TABLE `posttest`
  ADD PRIMARY KEY (`postID`);

--
-- Indexes for table `usertest`
--
ALTER TABLE `usertest`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Username_UNIQUE` (`Username`),
  ADD UNIQUE KEY `Email_UNIQUE` (`Email`);

--
-- Indexes for table `user_post_relationship`
--
ALTER TABLE `user_post_relationship`
  ADD PRIMARY KEY (`U_id`,`P_id`),
  ADD KEY `FK_Pid_idx` (`P_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `posttest`
--
ALTER TABLE `posttest`
  MODIFY `postID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `usertest`
--
ALTER TABLE `usertest`
  MODIFY `ID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_post_relationship`
--
ALTER TABLE `user_post_relationship`
  ADD CONSTRAINT `FK_Pid` FOREIGN KEY (`P_id`) REFERENCES `posttest` (`postID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Uid` FOREIGN KEY (`U_id`) REFERENCES `usertest` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
