-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2019 at 08:44 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `disease`
--

CREATE TABLE `disease` (
  `dis_name` varchar(20) NOT NULL,
  `treatment` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `disease`
--

INSERT INTO `disease` (`dis_name`, `treatment`) VALUES
('dis1', 'treat_dis1'),
('dis2', 'treat_dis2');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `doc_id` int(11) NOT NULL,
  `doc_name` varchar(20) DEFAULT NULL,
  `contct` int(11) NOT NULL,
  `desig` varchar(20) DEFAULT NULL,
  `qualif` varchar(20) DEFAULT NULL,
  `dis_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doc_id`, `doc_name`, `contct`, `desig`, `qualif`, `dis_name`) VALUES
(1, 'doc_1', 123, 'desig1', 'qualif1', 'dis1'),
(2, 'doc_2', 1234, 'desig2', 'qualif2', 'dis2');

-- --------------------------------------------------------

--
-- Table structure for table `gets_med`
--

CREATE TABLE `gets_med` (
  `pat_id` int(11) NOT NULL,
  `med_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gets_med`
--

INSERT INTO `gets_med` (`pat_id`, `med_id`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `has_disease`
--

CREATE TABLE `has_disease` (
  `pat_id` int(11) NOT NULL,
  `dis_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `has_disease`
--

INSERT INTO `has_disease` (`pat_id`, `dis_name`) VALUES
(1, 'dis1'),
(2, 'dis2');

-- --------------------------------------------------------

--
-- Table structure for table `hospital_department`
--

CREATE TABLE `hospital_department` (
  `dept_name` varchar(20) NOT NULL,
  `expens` int(11) DEFAULT NULL,
  `revenue` int(11) DEFAULT NULL,
  `specializ` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hospital_department`
--

INSERT INTO `hospital_department` (`dept_name`, `expens`, `revenue`, `specializ`) VALUES
('dept_1', 123, 123, 'specializ_1'),
('dept_2', 1234, 1234, 'specializ_2');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `user_name` varchar(20) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`user_name`, `password`) VALUES
('abc', 'abc');

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `med_id` int(11) NOT NULL,
  `med_name` varchar(20) DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `manuf` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`med_id`, `med_name`, `exp_date`, `manuf`) VALUES
(1, 'med_1', '2019-01-23', '2019-01-10'),
(2, 'med_2', '2019-01-23', '2019-01-11');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `pat_id` int(11) NOT NULL,
  `pat_name` varchar(20) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `cntct` int(11) NOT NULL,
  `locality` varchar(20) DEFAULT NULL,
  `street` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`pat_id`, `pat_name`, `age`, `cntct`, `locality`, `street`) VALUES
(1, 'pat_1', 123, 123, 'locality_1', 'street_1'),
(2, 'pat_2', 1234, 1234, 'locality_2', 'street_2');

-- --------------------------------------------------------

--
-- Table structure for table `patient_pin`
--

CREATE TABLE `patient_pin` (
  `pin` int(11) NOT NULL,
  `locality` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient_pin`
--

INSERT INTO `patient_pin` (`pin`, `locality`) VALUES
(1, 'locality_1'),
(2, 'locality_2');

-- --------------------------------------------------------

--
-- Table structure for table `prescribe`
--

CREATE TABLE `prescribe` (
  `doc_id` int(11) NOT NULL,
  `med_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prescribe`
--

INSERT INTO `prescribe` (`doc_id`, `med_id`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `recieve_treatment`
--

CREATE TABLE `recieve_treatment` (
  `pat_id` int(11) NOT NULL,
  `doc_id` int(11) NOT NULL,
  `dept_name` varchar(20) NOT NULL,
  `time_in` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `discharge` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recieve_treatment`
--

INSERT INTO `recieve_treatment` (`pat_id`, `doc_id`, `dept_name`, `time_in`, `discharge`) VALUES
(1, 1, 'dept_1', '2019-01-29 18:28:21', '0000-00-00 00:00:00'),
(2, 2, 'dept_2', '2019-01-29 18:28:38', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `disease`
--
ALTER TABLE `disease`
  ADD PRIMARY KEY (`dis_name`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doc_id`),
  ADD KEY `dis_name` (`dis_name`);

--
-- Indexes for table `gets_med`
--
ALTER TABLE `gets_med`
  ADD PRIMARY KEY (`pat_id`,`med_id`);

--
-- Indexes for table `has_disease`
--
ALTER TABLE `has_disease`
  ADD PRIMARY KEY (`pat_id`,`dis_name`);

--
-- Indexes for table `hospital_department`
--
ALTER TABLE `hospital_department`
  ADD PRIMARY KEY (`dept_name`);

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`med_id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`pat_id`);

--
-- Indexes for table `patient_pin`
--
ALTER TABLE `patient_pin`
  ADD PRIMARY KEY (`pin`);

--
-- Indexes for table `prescribe`
--
ALTER TABLE `prescribe`
  ADD PRIMARY KEY (`doc_id`,`med_id`);

--
-- Indexes for table `recieve_treatment`
--
ALTER TABLE `recieve_treatment`
  ADD PRIMARY KEY (`pat_id`,`doc_id`,`dept_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `doc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `medicine`
--
ALTER TABLE `medicine`
  MODIFY `med_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `pat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`dis_name`) REFERENCES `disease` (`dis_name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
