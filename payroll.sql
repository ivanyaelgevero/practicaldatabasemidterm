-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 19, 2025 at 08:18 AM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `payroll`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
CREATE TABLE IF NOT EXISTS `attendance` (
  `employeeid` int NOT NULL,
  `date` date NOT NULL,
  `timein` int NOT NULL,
  `timeout` int NOT NULL,
  `late` int NOT NULL,
  `overtime` int NOT NULL,
  PRIMARY KEY (`employeeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`employeeid`, `date`, `timein`, `timeout`, `late`, `overtime`) VALUES
(123, '2025-12-22', 4, 10, 0, 0),
(124, '2025-05-12', 7, 6, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `departmentid` int NOT NULL,
  `name` varchar(25) NOT NULL,
  `depthead` varchar(25) NOT NULL,
  `officelocation` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`departmentid`, `name`, `depthead`, `officelocation`) VALUES
(0, 'BSIT', 'COE', 'RTS'),
(0, 'BSCE', 'CIVILENG', 'RTS');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`username`, `password`) VALUES
('nathaniel123', 'qweqwe123'),
('brylle12345', '123456789');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `employeeid` int NOT NULL,
  `name` varchar(25) NOT NULL,
  `lastname` varchar(25) NOT NULL,
  `department` varchar(25) NOT NULL,
  `position` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  PRIMARY KEY (`employeeid`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `name` (`name`,`lastname`,`department`,`position`,`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employeeid`, `name`, `lastname`, `department`, `position`, `email`) VALUES
(124, 'Ivan', 'Gevero', 'bsit', 'StudentAssitant', 'ivan123@gmail.com'),
(123, 'Mark', 'Pahilga', 'bsit', 'cashier', 'mark@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `payrolls`
--

DROP TABLE IF EXISTS `payrolls`;
CREATE TABLE IF NOT EXISTS `payrolls` (
  `payrollid` int NOT NULL,
  `employeeid` int NOT NULL,
  `salaryid` int NOT NULL,
  `payperiodstart` int NOT NULL,
  `payperiodend` int NOT NULL,
  `netpay` int NOT NULL,
  PRIMARY KEY (`employeeid`),
  UNIQUE KEY `employeeid` (`employeeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `payrolls`
--

INSERT INTO `payrolls` (`payrollid`, `employeeid`, `salaryid`, `payperiodstart`, `payperiodend`, `netpay`) VALUES
(123, 123, 905405, 0, 0, 0),
(456, 124, 9451900, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `salaries`
--

DROP TABLE IF EXISTS `salaries`;
CREATE TABLE IF NOT EXISTS `salaries` (
  `salaryid` int NOT NULL,
  `salary` int NOT NULL,
  `amountincentives` int NOT NULL,
  PRIMARY KEY (`salaryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `salaries`
--

INSERT INTO `salaries` (`salaryid`, `salary`, `amountincentives`) VALUES
(905405, 100000, 50000),
(9451900, 75000, 25000);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`employeeid`) REFERENCES `payrolls` (`employeeid`);

--
-- Constraints for table `payrolls`
--
ALTER TABLE `payrolls`
  ADD CONSTRAINT `payrolls_ibfk_1` FOREIGN KEY (`employeeid`) REFERENCES `attendance` (`employeeid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
