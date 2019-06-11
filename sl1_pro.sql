-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 11, 2019 at 08:04 AM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sl1_pro`
--

-- --------------------------------------------------------

--
-- Table structure for table `blood`
--

CREATE TABLE `blood` (
  `blood_group` varchar(20) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `expiry_date` varchar(20) DEFAULT NULL,
  `from_date` varchar(20) DEFAULT NULL,
  `donor_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blood`
--

INSERT INTO `blood` (`blood_group`, `quantity`, `cost`, `expiry_date`, `from_date`, `donor_id`) VALUES
('B-', 5, NULL, '2018-11-09', '2018-10-20', 1),
('B+', 10, NULL, '2018-11-16', '2018-10-27', 2),
('B-', 10, NULL, '2018-11-16', '2018-10-27', 3),
('B-', 5, NULL, '2018-11-16', '2018-10-27', 4),
('A+', 10, NULL, '2018-11-16', '2018-10-27', 5),
('A+', 2, NULL, '2018-11-16', '2018-10-27', 6),
('AB+', 10, NULL, '2018-11-16', '2018-10-27', 7),
('A+', 10, NULL, '2018-11-16', '2018-10-27', 8),
('A+', 10, NULL, '2018-11-16', '2018-10-27', 9),
('O+', 2, NULL, '2018-11-17', '2018-10-28', 10),
('O+', 2, NULL, '2018-11-17', '2018-10-28', 11),
('AB-', 1, 10850, '2018-11-17', '2018-10-28', 12),
('A+', 2, 21700, '2018-11-18', '2018-10-29', 13),
('A-', 3, 32550, '2018-11-18', '2018-10-29', 14),
('B+', 1, 10850, '2018-10-30', '2018-10-10', 15),
('A+', 1, 10850, '2018-10-31', '2018-10-11', 16);

--
-- Triggers `blood`
--
DELIMITER $$
CREATE TRIGGER `calculate_cost` BEFORE INSERT ON `blood` FOR EACH ROW SET NEW.cost=NEW.quantity*10850
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `blood_bank`
--

CREATE TABLE `blood_bank` (
  `bloodbank_id` int(11) NOT NULL,
  `hospital_id` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `street` varchar(20) DEFAULT NULL,
  `locality` varchar(20) DEFAULT NULL,
  `pin_code` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `blood_stock`
--

CREATE TABLE `blood_stock` (
  `type` varchar(20) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blood_stock`
--

INSERT INTO `blood_stock` (`type`, `stock`) VALUES
('A+', 33),
('A-', 3),
('B+', 1),
('B-', 15),
('AB+', 10),
('AB-', 1),
('O+', 3),
('O-', 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `display_details`
-- (See below for the actual view)
--
CREATE TABLE `display_details` (
`first_name` varchar(20)
,`last_name` varchar(20)
,`email` varchar(20)
,`mobile` bigint(20)
,`gender` varchar(20)
,`street` varchar(20)
,`locality` varchar(20)
,`pin_code` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `donor`
--

CREATE TABLE `donor` (
  `aadhar_no` bigint(20) NOT NULL,
  `dob` varchar(20) DEFAULT NULL,
  `disease` varchar(20) DEFAULT NULL,
  `allergy` varchar(20) DEFAULT NULL,
  `cardiac` varchar(20) DEFAULT NULL,
  `ID` int(11) NOT NULL,
  `blood_group` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `donor`
--

INSERT INTO `donor` (`aadhar_no`, `dob`, `disease`, `allergy`, `cardiac`, `ID`, `blood_group`) VALUES
(123456789123, '10/04/1998', 'No', 'No', 'No', 13, 'O+'),
(123456789012, '18/12/19', 'No', 'No', 'No', 16, 'A+');

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

CREATE TABLE `hospital` (
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `hospital_id` int(11) NOT NULL,
  `mobile` bigint(20) DEFAULT NULL,
  `street` varchar(20) DEFAULT NULL,
  `locality` varchar(20) DEFAULT NULL,
  `pin_code` int(11) DEFAULT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hospital`
--

INSERT INTO `hospital` (`name`, `email`, `hospital_id`, `mobile`, `street`, `locality`, `pin_code`, `username`, `password`) VALUES
('Sancheti', 'sancheti@gmail.com', 112, 9965225879, 'Ganeshkhind Road', 'Shivaji Nagar', 411005, 'sancheti', 'sancheti');

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `username` varchar(20) DEFAULT NULL,
  `salary` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`username`, `salary`, `password`) VALUES
('sancheti', '50,000', 'sancheti');

-- --------------------------------------------------------

--
-- Table structure for table `persons`
--

CREATE TABLE `persons` (
  `ID` int(11) NOT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `mobile` bigint(20) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `street` varchar(20) DEFAULT NULL,
  `locality` varchar(20) DEFAULT NULL,
  `pin_code` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `persons`
--

INSERT INTO `persons` (`ID`, `first_name`, `last_name`, `email`, `mobile`, `gender`, `street`, `locality`, `pin_code`) VALUES
(13, 'karan', 'Naik', 'sushrut@gmail.com', 9405602248, 'Male', 'Range Hills Road', 'Ashok Nagar', 411020),
(16, 'Aditya', 'jangid', 'aditya@gmail.com', 9876543210, 'Male', 'VIIT', 'VIIT', 123456);

-- --------------------------------------------------------

--
-- Structure for view `display_details`
--
DROP TABLE IF EXISTS `display_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `display_details`  AS  select `persons`.`first_name` AS `first_name`,`persons`.`last_name` AS `last_name`,`persons`.`email` AS `email`,`persons`.`mobile` AS `mobile`,`persons`.`gender` AS `gender`,`persons`.`street` AS `street`,`persons`.`locality` AS `locality`,`persons`.`pin_code` AS `pin_code` from (`persons` join `donor` on((`persons`.`ID` = `donor`.`ID`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blood`
--
ALTER TABLE `blood`
  ADD PRIMARY KEY (`donor_id`);

--
-- Indexes for table `blood_bank`
--
ALTER TABLE `blood_bank`
  ADD PRIMARY KEY (`bloodbank_id`);

--
-- Indexes for table `donor`
--
ALTER TABLE `donor`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`hospital_id`);

--
-- Indexes for table `persons`
--
ALTER TABLE `persons`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blood`
--
ALTER TABLE `blood`
  MODIFY `donor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `blood_bank`
--
ALTER TABLE `blood_bank`
  MODIFY `bloodbank_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `donor`
--
ALTER TABLE `donor`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `hospital`
--
ALTER TABLE `hospital`
  MODIFY `hospital_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;
--
-- AUTO_INCREMENT for table `persons`
--
ALTER TABLE `persons`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
