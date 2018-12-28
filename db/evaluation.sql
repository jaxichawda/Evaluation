-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 27, 2018 at 03:24 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `evaluation`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblevaluationanswer`
--

CREATE TABLE `tblevaluationanswer` (
  `EvaluationAnswerId` int(11) NOT NULL,
  `EmployeeEvaluatorId` int(11) NOT NULL,
  `QuestionId` int(11) NOT NULL,
  `AnswerText` text,
  `Comments` text,
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `CreatedBy` int(11) NOT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL,
  `UpdatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblevaluationanswer`
--

INSERT INTO `tblevaluationanswer` (`EvaluationAnswerId`, `EmployeeEvaluatorId`, `QuestionId`, `AnswerText`, `Comments`, `IsActive`, `CreatedBy`, `CreatedOn`, `UpdatedBy`, `UpdatedOn`) VALUES
(1, 1, 13, '4', NULL, b'1', 1, '2018-12-26 06:58:50', 1, '2018-12-27 13:53:40'),
(2, 1, 14, '4', NULL, b'1', 1, '2018-12-26 06:58:50', 1, '2018-12-27 13:53:40'),
(3, 1, 15, '2.5', NULL, b'1', 1, '2018-12-26 06:58:50', 1, '2018-12-27 13:53:40'),
(4, 1, 16, '4.5', NULL, b'1', 1, '2018-12-26 06:58:50', 1, '2018-12-27 13:53:40'),
(5, 1, 29, '4.5', NULL, b'1', 1, '2018-12-26 06:58:50', 1, '2018-12-27 13:53:40'),
(6, 1, 30, '4', NULL, b'1', 1, '2018-12-26 06:58:50', 1, '2018-12-27 13:53:40'),
(7, 1, 31, '5', NULL, b'1', 1, '2018-12-26 06:58:50', 1, '2018-12-27 13:53:41'),
(8, 1, 32, '3.5', NULL, b'1', 1, '2018-12-26 06:58:50', 1, '2018-12-27 13:53:41'),
(9, 1, 39, NULL, NULL, b'1', 1, '2018-12-26 06:58:50', 1, '2018-12-27 13:53:41'),
(16, 3, 7, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL, b'1', 3, '2018-12-26 07:00:44', 3, '2018-12-26 07:02:20'),
(17, 3, 8, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaeca.', NULL, b'1', 3, '2018-12-26 07:00:44', 3, '2018-12-26 07:02:20'),
(18, 3, 13, '4', NULL, b'1', 3, '2018-12-26 07:00:44', 3, '2018-12-26 07:02:20'),
(19, 3, 14, '4', NULL, b'1', 3, '2018-12-26 07:00:44', 3, '2018-12-26 07:02:20'),
(20, 3, 15, '5', NULL, b'1', 3, '2018-12-26 07:00:44', 3, '2018-12-26 07:02:20'),
(21, 3, 16, '4.5', ' dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur i.', b'1', 3, '2018-12-26 07:00:44', 3, '2018-12-26 07:02:20'),
(22, 3, 29, '5', NULL, b'1', 3, '2018-12-26 07:00:44', 3, '2018-12-26 07:02:20'),
(23, 3, 30, '4.5', NULL, b'1', 3, '2018-12-26 07:00:44', 3, '2018-12-26 07:02:20'),
(24, 3, 31, '5', NULL, b'1', 3, '2018-12-26 07:00:44', 3, '2018-12-26 07:02:20'),
(25, 3, 32, '4', NULL, b'1', 3, '2018-12-26 07:00:44', 3, '2018-12-26 07:02:20'),
(26, 3, 38, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL, b'1', 3, '2018-12-26 07:00:44', 3, '2018-12-26 07:02:20'),
(27, 3, 39, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.', NULL, b'1', 3, '2018-12-26 07:00:44', 3, '2018-12-26 07:02:20'),
(31, 2, 13, '3', NULL, b'1', 2, '2018-12-26 07:02:57', 2, '2018-12-26 07:04:18'),
(32, 2, 14, '4', NULL, b'1', 2, '2018-12-26 07:02:57', 2, '2018-12-26 07:04:19'),
(33, 2, 15, '5', NULL, b'1', 2, '2018-12-26 07:02:57', 2, '2018-12-26 07:04:19'),
(34, 2, 16, '4', NULL, b'1', 2, '2018-12-26 07:02:57', 2, '2018-12-26 07:04:19'),
(35, 2, 29, '4', NULL, b'1', 2, '2018-12-26 07:02:57', 2, '2018-12-26 07:04:19'),
(36, 2, 30, '5', NULL, b'1', 2, '2018-12-26 07:02:57', 2, '2018-12-26 07:04:19'),
(37, 2, 31, '3', NULL, b'1', 2, '2018-12-26 07:02:57', 2, '2018-12-26 07:04:19'),
(38, 2, 32, '4', NULL, b'1', 2, '2018-12-26 07:02:57', 2, '2018-12-26 07:04:19'),
(39, 2, 39, 'Answer 9', NULL, b'1', 2, '2018-12-26 07:02:57', 2, '2018-12-26 07:04:19');

-- --------------------------------------------------------

--
-- Table structure for table `tblmstconfiguration`
--

CREATE TABLE `tblmstconfiguration` (
  `ConfigurationId` int(11) NOT NULL,
  `Key` varchar(100) NOT NULL,
  `Value` varchar(100) NOT NULL,
  `DisplayText` varchar(100) DEFAULT NULL,
  `Description` text,
  `DisplayOrder` int(4) NOT NULL DEFAULT '0',
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `CreatedBy` int(11) NOT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL,
  `UpdatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblmstconfiguration`
--

INSERT INTO `tblmstconfiguration` (`ConfigurationId`, `Key`, `Value`, `DisplayText`, `Description`, `DisplayOrder`, `IsActive`, `CreatedBy`, `CreatedOn`, `UpdatedBy`, `UpdatedOn`) VALUES
(1, 'AnswerType', '1', 'Descriptive', 'It store descriptive answers.', 0, b'1', 1, '2018-12-07 06:31:29', 1, '2018-12-07 06:31:29'),
(2, 'AnswerType', '2', 'Rating out of 5 stars', 'It store rating from 1 to 5 stars.', 0, b'1', 1, '2018-12-07 06:34:45', 1, '2018-12-07 06:34:45'),
(3, 'AnswerType', '3', 'MCQ', 'It store MCQ Answers.', 0, b'0', 1, '2018-12-07 06:34:45', 1, '2018-12-07 06:34:45'),
(4, 'EvaluationStatus', '0', 'Pending', NULL, 0, b'1', 1, '2018-12-07 06:43:08', 1, '2018-12-07 06:43:08'),
(5, 'EvaluationStatus', '2', 'In Progress', NULL, 0, b'1', 1, '2018-12-07 06:44:27', 1, '2018-12-07 06:44:27'),
(6, 'EvaluationStatus', '1', 'Submitted', NULL, 0, b'1', 1, '2018-12-07 06:44:27', 1, '2018-12-07 06:44:27'),
(7, 'EvaluationStatus', '3', 'Revoked', NULL, 0, b'1', 1, '2018-12-07 06:44:27', 1, '2018-12-07 06:44:27'),
(8, 'EvaluatorType', '0', 'Both (Employee & Evaluator)', 'Question displays to Employee & Evaluator.', 0, b'1', 1, '2018-12-20 06:17:53', 1, '2018-12-20 06:17:53'),
(9, 'EvaluatorType', '1', 'Employee', 'Question displays to Employee.', 0, b'1', 1, '2018-12-20 06:17:53', 1, '2018-12-20 06:17:53'),
(10, 'EvaluatorType', '2', 'Evaluator', 'Question displays to Evaluator.', 0, b'1', 1, '2018-12-20 06:17:53', 1, '2018-12-20 06:17:53');

-- --------------------------------------------------------

--
-- Table structure for table `tblmstdepartment`
--

CREATE TABLE `tblmstdepartment` (
  `DepartmentId` int(11) NOT NULL,
  `DepartmentName` varchar(100) NOT NULL,
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `CreatedBy` int(11) NOT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL,
  `UpdatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblmstdepartment`
--

INSERT INTO `tblmstdepartment` (`DepartmentId`, `DepartmentName`, `IsActive`, `CreatedBy`, `CreatedOn`, `UpdatedBy`, `UpdatedOn`) VALUES
(1, 'Admin', b'1', 1, '2018-12-07 07:39:32', 1, '2018-12-07 07:39:32'),
(2, 'Human Resource', b'1', 1, '2018-12-07 07:41:31', 1, '2018-12-07 07:41:31'),
(3, 'Development', b'1', 1, '2018-12-07 07:41:31', 1, '2018-12-07 07:41:31'),
(4, 'Staffing', b'1', 1, '2018-12-07 07:41:31', 1, '2018-12-07 07:41:31'),
(5, 'Marketing', b'1', 1, '2018-12-07 07:41:31', 1, '2018-12-07 07:41:31'),
(6, 'Head Department', b'1', 1, '2018-12-07 08:11:58', 1, '2018-12-07 08:11:58');

-- --------------------------------------------------------

--
-- Table structure for table `tblmstempevaluation`
--

CREATE TABLE `tblmstempevaluation` (
  `EvaluationId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `EvaluationTypeId` int(11) NOT NULL,
  `EvaluationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `UserNote` text,
  `EvaluatorNote` text,
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `CreatedBy` int(11) NOT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL,
  `UpdatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblmstempevaluation`
--

INSERT INTO `tblmstempevaluation` (`EvaluationId`, `UserId`, `EvaluationTypeId`, `EvaluationDate`, `UserNote`, `EvaluatorNote`, `IsActive`, `CreatedBy`, `CreatedOn`, `UpdatedBy`, `UpdatedOn`) VALUES
(1, 3, 2, '2018-12-28 14:30:00', 'Note for User', 'Note for Evaluator', b'1', 1, '2018-12-26 06:56:57', 1, '2018-12-26 06:56:57');

-- --------------------------------------------------------

--
-- Table structure for table `tblmstempevaluator`
--

CREATE TABLE `tblmstempevaluator` (
  `EmployeeEvaluatorId` int(11) NOT NULL,
  `EvaluationId` int(11) NOT NULL,
  `EvaluatorId` int(11) NOT NULL,
  `StatusId` tinyint(1) NOT NULL DEFAULT '0',
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `CreatedBy` int(11) NOT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL,
  `UpdatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblmstempevaluator`
--

INSERT INTO `tblmstempevaluator` (`EmployeeEvaluatorId`, `EvaluationId`, `EvaluatorId`, `StatusId`, `IsActive`, `CreatedBy`, `CreatedOn`, `UpdatedBy`, `UpdatedOn`) VALUES
(1, 1, 1, 2, b'1', 1, '2018-12-26 06:56:57', 1, '2018-12-27 10:44:14'),
(2, 1, 2, 1, b'1', 1, '2018-12-26 06:56:58', 1, '2018-12-26 06:56:58'),
(3, 1, 3, 1, b'1', 1, '2018-12-26 06:56:58', 1, '2018-12-26 13:54:42');

-- --------------------------------------------------------

--
-- Table structure for table `tblmstevaluationtype`
--

CREATE TABLE `tblmstevaluationtype` (
  `EvaluationTypeId` int(11) NOT NULL,
  `EvaluationTypeName` varchar(100) NOT NULL,
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `CreatedBy` int(11) NOT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL,
  `UpdatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblmstevaluationtype`
--

INSERT INTO `tblmstevaluationtype` (`EvaluationTypeId`, `EvaluationTypeName`, `IsActive`, `CreatedBy`, `CreatedOn`, `UpdatedBy`, `UpdatedOn`) VALUES
(1, 'Monthly Evaluation', b'1', 1, '2018-12-07 13:42:24', 1, '2018-12-07 13:42:24'),
(2, 'Yearly Evaluation', b'1', 1, '2018-12-07 13:42:24', 1, '2018-12-26 13:14:45');

-- --------------------------------------------------------

--
-- Table structure for table `tblmstjobtitle`
--

CREATE TABLE `tblmstjobtitle` (
  `JobTitleId` int(11) NOT NULL,
  `DepartmentId` int(11) NOT NULL,
  `JobTitleName` varchar(100) NOT NULL,
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `CreatedBy` int(11) NOT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL,
  `UpdatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblmstjobtitle`
--

INSERT INTO `tblmstjobtitle` (`JobTitleId`, `DepartmentId`, `JobTitleName`, `IsActive`, `CreatedBy`, `CreatedOn`, `UpdatedBy`, `UpdatedOn`) VALUES
(1, 1, 'Office Administrator', b'1', 1, '2018-12-07 07:42:32', 1, '2018-12-07 07:42:32'),
(2, 2, 'HR Executive', b'1', 1, '2018-12-07 07:49:00', 1, '2018-12-07 07:49:00'),
(3, 2, 'Sr. HR Executive', b'1', 1, '2018-12-07 07:49:00', 1, '2018-12-07 07:49:00'),
(4, 2, 'HR Manager', b'1', 1, '2018-12-07 07:49:00', 1, '2018-12-07 07:49:00'),
(5, 3, 'PHP Developer', b'1', 1, '2018-12-07 07:57:00', 1, '2018-12-07 07:57:00'),
(6, 3, 'Front-End Developer', b'1', 1, '2018-12-07 07:57:01', 1, '2018-12-07 07:57:01'),
(7, 3, 'Wordpress Developer', b'1', 1, '2018-12-07 07:57:01', 1, '2018-12-07 07:57:01'),
(8, 3, '.Net Developer', b'1', 1, '2018-12-07 07:57:01', 1, '2018-12-07 07:57:01'),
(9, 3, 'Quality Analyst', b'1', 1, '2018-12-07 07:57:01', 1, '2018-12-07 07:57:01'),
(10, 3, 'Project and Product Lead', b'1', 1, '2018-12-07 07:57:01', 1, '2018-12-07 07:57:01'),
(11, 3, 'Project Manager', b'1', 1, '2018-12-07 07:57:01', 1, '2018-12-07 07:57:01'),
(12, 4, 'Technical Recruiter', b'1', 1, '2018-12-07 07:59:25', 1, '2018-12-07 07:59:25'),
(13, 4, 'Sr. Technical Recruiter', b'1', 1, '2018-12-07 07:59:25', 1, '2018-12-07 07:59:25'),
(14, 5, 'Business Development Executive', b'1', 1, '2018-12-07 08:00:25', 1, '2018-12-07 08:00:25'),
(15, 6, 'CEO', b'1', 1, '2018-12-07 08:12:42', 1, '2018-12-07 08:12:42'),
(16, 6, 'CTO', b'1', 1, '2018-12-07 08:13:44', 1, '2018-12-07 08:13:44'),
(17, 6, 'Managing Director', b'1', 1, '2018-12-07 08:13:44', 1, '2018-12-07 08:13:44');

-- --------------------------------------------------------

--
-- Table structure for table `tblmstquestion`
--

CREATE TABLE `tblmstquestion` (
  `QuestionId` int(11) NOT NULL,
  `EvaluationTypeId` int(11) NOT NULL,
  `QuestionText` text NOT NULL,
  `AnswerTypeId` int(11) NOT NULL,
  `EvaluatorTypeId` int(11) NOT NULL DEFAULT '0',
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `CreatedBy` int(11) NOT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL,
  `UpdatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblmstquestion`
--

INSERT INTO `tblmstquestion` (`QuestionId`, `EvaluationTypeId`, `QuestionText`, `AnswerTypeId`, `EvaluatorTypeId`, `IsActive`, `CreatedBy`, `CreatedOn`, `UpdatedBy`, `UpdatedOn`) VALUES
(7, 2, '<p>What were your major achievements in the past year? &nbsp;</p>', 1, 1, b'1', 1, '2018-12-18 23:47:46', 1, '2018-12-20 07:05:15'),
(8, 2, '<p>What was your goal? Did you reach to your goal? Personally and Professionally. &nbsp;</p>', 1, 1, b'1', 1, '2018-12-18 23:52:59', 1, '2018-12-20 07:06:39'),
(9, 2, '<p>What are the areas of your performance (behaviors and results) on which you could improve? Please describe. &nbsp;</p>', 1, 1, b'0', 1, '2018-12-18 23:53:09', 1, '2018-12-26 06:57:29'),
(10, 2, '<p>What you have done to accomplish company&rsquo;s goal? Did you find any difficulties to complete any task/ project?&nbsp;<br />\n&nbsp;</p>', 1, 1, b'0', 1, '2018-12-18 23:53:19', 1, '2018-12-26 06:57:30'),
(11, 2, '<p>Are there additional skills or knowledge that would help you more effectively perform your present job or enhance your skill opportunities? If yes, please list. &nbsp;<br />\n&nbsp;</p>', 1, 1, b'0', 1, '2018-12-18 23:53:30', 1, '2018-12-26 06:57:32'),
(12, 2, '<p>What goals (specific measurable results) do you expect to accomplish during the next year? &nbsp;<br />\n&nbsp;</p>', 1, 1, b'0', 1, '2018-12-18 23:53:42', 1, '2018-12-26 06:57:37'),
(13, 2, '<p>Rate out of 10 -&nbsp;COMMUNICATION</p>', 2, 0, b'1', 1, '2018-12-18 23:54:43', 1, '2018-12-18 23:59:54'),
(14, 2, '<p>Rate out of 10 - AMBITION / INITIATIVE</p>', 2, 0, b'1', 1, '2018-12-18 23:59:40', 1, '2018-12-18 13:29:40'),
(15, 2, '<p>Rate out of 10 - ATTENDANCE</p>', 2, 0, b'1', 1, '2018-12-19 00:02:38', 1, '2018-12-18 13:32:38'),
(16, 2, '<p>Rate out of 10 - ATTITUDE / COOPERATION</p>', 2, 0, b'1', 1, '2018-12-19 00:02:47', 1, '2018-12-18 13:32:47'),
(17, 2, '<p>Rate out of 10 - DEPARTMENT AND COMPANY ORIENTED</p>', 2, 0, b'0', 1, '2018-12-19 00:03:08', 1, '2018-12-26 06:57:47'),
(18, 2, '<p>Rate out of 10 - FOCUS</p>', 2, 0, b'0', 1, '2018-12-19 00:03:17', 1, '2018-12-26 06:57:48'),
(19, 2, '<p>Rate out of 10 - IMPROVEMENT FROM PREVIOUS EVALUATION</p>', 2, 0, b'0', 1, '2018-12-19 00:03:48', 1, '2018-12-26 06:57:50'),
(20, 2, '<p>Rate out of 10 - INTEGRITY</p>', 2, 0, b'0', 1, '2018-12-19 00:03:56', 1, '2018-12-26 06:57:51'),
(21, 2, '<p>Rate out of 10 - LEVEL OF (TECHNICAL) KNOWLEDGE</p>', 2, 0, b'0', 1, '2018-12-19 00:04:06', 1, '2018-12-26 06:57:53'),
(22, 2, '<p>Rate out of 10 - PRODUCTIVITY / DEADLINE</p>', 2, 0, b'0', 1, '2018-12-19 00:06:22', 1, '2018-12-26 06:57:56'),
(23, 2, '<p>Rate out of 10 - QUALITY OF WORK</p>', 2, 0, b'0', 1, '2018-12-19 00:06:32', 1, '2018-12-26 06:57:57'),
(24, 2, '<p>Rate out of 10 - RELIABILITY / GO-TO PERSON</p>', 2, 0, b'0', 1, '2018-12-19 00:06:40', 1, '2018-12-26 06:57:59'),
(25, 2, '<p>Rate out of 10 - STRESS MANAGEMENT</p>', 2, 0, b'0', 1, '2018-12-19 00:06:48', 1, '2018-12-26 06:58:01'),
(26, 2, '<p>Rate out of 10 - TEAMWORK</p>', 2, 0, b'0', 1, '2018-12-19 00:06:56', 1, '2018-12-26 06:58:04'),
(27, 2, '<p>Rate out of 10 - PRESENTATION</p>', 2, 0, b'0', 1, '2018-12-19 00:07:04', 1, '2018-12-26 06:58:13'),
(28, 2, '<p>List the subjects you would like to discuss during your annual performance evaluation meeting:&nbsp;</p>', 1, 0, b'0', 1, '2018-12-19 00:07:38', 1, '2018-12-26 06:58:09'),
(29, 2, '<p>Quality of work: Consider quality of work produced and the promptness with which it is completed</p>', 2, 0, b'1', 1, '2018-12-19 00:08:27', 1, '2018-12-18 13:38:27'),
(30, 2, '<p>Productivity: Consider the ability to produce a quantity of accepted work which meets company standards.</p>', 2, 0, b'1', 1, '2018-12-19 00:09:09', 1, '2018-12-18 13:39:09'),
(31, 2, '<p>Knowledge of job: Consider the knowledge of present job of other work closely related to it and of the equipment necessary to perform job functions.</p>', 2, 0, b'1', 1, '2018-12-19 00:10:03', 1, '2018-12-18 13:40:03'),
(32, 2, '<p>Reliability and Dependability: Consider the amount of supervision required and job performance regarding timely completion and follow-ups.</p>', 2, 0, b'1', 1, '2018-12-19 00:10:45', 1, '2018-12-19 00:11:05'),
(33, 2, '<p>Attendance: Consider overall attendance record and punctuality.</p>', 2, 0, b'0', 1, '2018-12-19 00:11:43', 1, '2018-12-26 06:58:22'),
(34, 2, '<p>Initiative: Consider the extent to which new work assignments and additional duties are sought out when necessary.</p>', 2, 0, b'0', 1, '2018-12-19 00:12:13', 1, '2018-12-26 06:58:24'),
(35, 2, '<p>The job timings are suitable for me.</p>', 2, 1, b'0', 1, '2018-12-19 00:12:38', 1, '2018-12-26 06:58:26'),
(36, 2, '<p>I am satisfied with my pay and other perks of this job.</p>', 2, 1, b'0', 1, '2018-12-19 00:13:10', 1, '2018-12-26 06:58:28'),
(37, 2, '<p>List your key strengths:</p>', 1, 0, b'0', 1, '2018-12-19 00:13:20', 1, '2018-12-26 06:58:39'),
(38, 2, '<p>List your performance areas that need further development.</p>', 1, 1, b'1', 1, '2018-12-19 00:13:35', 1, '2018-12-20 07:13:08'),
(39, 2, '<p>Mention any skills&nbsp;according to you are not utilised or under utilised for&nbsp;your role,&nbsp;if any.&nbsp;</p>', 1, 0, b'1', 1, '2018-12-19 00:20:52', 1, '2018-12-18 13:50:52');

-- --------------------------------------------------------

--
-- Table structure for table `tblmstuserrole`
--

CREATE TABLE `tblmstuserrole` (
  `RoleId` int(11) NOT NULL,
  `RoleName` varchar(50) NOT NULL,
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `CreatedBy` int(11) NOT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL,
  `UpdatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblmstuserrole`
--

INSERT INTO `tblmstuserrole` (`RoleId`, `RoleName`, `IsActive`, `CreatedBy`, `CreatedOn`, `UpdatedBy`, `UpdatedOn`) VALUES
(1, 'Admin', b'1', 1, '2018-12-07 07:24:43', 1, '2018-12-07 07:24:43'),
(2, 'HR', b'1', 1, '2018-12-07 07:24:43', 1, '2018-12-07 07:24:43'),
(3, 'Employee', b'1', 1, '2018-12-07 07:24:43', 1, '2018-12-07 07:24:43');

-- --------------------------------------------------------

--
-- Table structure for table `tblquestionoptions`
--

CREATE TABLE `tblquestionoptions` (
  `QuestionOptionId` int(11) NOT NULL,
  `QuestionId` int(11) NOT NULL,
  `OptionValue` text NOT NULL,
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `CreatedBy` int(11) NOT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL,
  `UpdatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE `tbluser` (
  `UserId` int(11) NOT NULL,
  `RoleId` int(11) NOT NULL,
  `JobTitleId` int(11) NOT NULL,
  `LineManagerId` int(11) NOT NULL DEFAULT '0',
  `FirstName` varchar(50) DEFAULT NULL,
  `MiddleName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `EmployeeId` varchar(50) DEFAULT '0',
  `EmailAddress` varchar(100) NOT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `ResetPasswordCode` varchar(10) DEFAULT NULL,
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `CreatedBy` int(11) NOT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL,
  `UpdatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`UserId`, `RoleId`, `JobTitleId`, `LineManagerId`, `FirstName`, `MiddleName`, `LastName`, `EmployeeId`, `EmailAddress`, `Password`, `ResetPasswordCode`, `IsActive`, `CreatedBy`, `CreatedOn`, `UpdatedBy`, `UpdatedOn`) VALUES
(1, 1, 15, 0, 'IT', NULL, 'Developer', '0', 'it@theopeneyes.com', '25d55ad283aa400af464c76d713c07ad', NULL, b'1', 1, '2018-12-19 14:08:56', 1, '2018-12-19 14:08:56'),
(2, 2, 5, 0, 'Jaxi', '', 'Chawda', '', 'jaxi.chawda@theopeneyes.in', '25d55ad283aa400af464c76d713c07ad', NULL, b'1', 1, '2018-12-20 07:22:28', 1, '2018-12-20 07:22:28'),
(3, 3, 5, 2, 'Uttam', '', 'Bhut', '', 'uttam.bhut@theopeneyes.in', '25d55ad283aa400af464c76d713c07ad', NULL, b'1', 2, '2018-12-20 07:24:01', 1, '2018-12-20 07:24:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblevaluationanswer`
--
ALTER TABLE `tblevaluationanswer`
  ADD PRIMARY KEY (`EvaluationAnswerId`);

--
-- Indexes for table `tblmstconfiguration`
--
ALTER TABLE `tblmstconfiguration`
  ADD PRIMARY KEY (`ConfigurationId`);

--
-- Indexes for table `tblmstdepartment`
--
ALTER TABLE `tblmstdepartment`
  ADD PRIMARY KEY (`DepartmentId`);

--
-- Indexes for table `tblmstempevaluation`
--
ALTER TABLE `tblmstempevaluation`
  ADD PRIMARY KEY (`EvaluationId`);

--
-- Indexes for table `tblmstempevaluator`
--
ALTER TABLE `tblmstempevaluator`
  ADD PRIMARY KEY (`EmployeeEvaluatorId`);

--
-- Indexes for table `tblmstevaluationtype`
--
ALTER TABLE `tblmstevaluationtype`
  ADD PRIMARY KEY (`EvaluationTypeId`);

--
-- Indexes for table `tblmstjobtitle`
--
ALTER TABLE `tblmstjobtitle`
  ADD PRIMARY KEY (`JobTitleId`);

--
-- Indexes for table `tblmstquestion`
--
ALTER TABLE `tblmstquestion`
  ADD PRIMARY KEY (`QuestionId`);

--
-- Indexes for table `tblmstuserrole`
--
ALTER TABLE `tblmstuserrole`
  ADD PRIMARY KEY (`RoleId`);

--
-- Indexes for table `tblquestionoptions`
--
ALTER TABLE `tblquestionoptions`
  ADD PRIMARY KEY (`QuestionOptionId`);

--
-- Indexes for table `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`UserId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblevaluationanswer`
--
ALTER TABLE `tblevaluationanswer`
  MODIFY `EvaluationAnswerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `tblmstconfiguration`
--
ALTER TABLE `tblmstconfiguration`
  MODIFY `ConfigurationId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblmstdepartment`
--
ALTER TABLE `tblmstdepartment`
  MODIFY `DepartmentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblmstempevaluation`
--
ALTER TABLE `tblmstempevaluation`
  MODIFY `EvaluationId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblmstempevaluator`
--
ALTER TABLE `tblmstempevaluator`
  MODIFY `EmployeeEvaluatorId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblmstevaluationtype`
--
ALTER TABLE `tblmstevaluationtype`
  MODIFY `EvaluationTypeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblmstjobtitle`
--
ALTER TABLE `tblmstjobtitle`
  MODIFY `JobTitleId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tblmstquestion`
--
ALTER TABLE `tblmstquestion`
  MODIFY `QuestionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `tblmstuserrole`
--
ALTER TABLE `tblmstuserrole`
  MODIFY `RoleId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblquestionoptions`
--
ALTER TABLE `tblquestionoptions`
  MODIFY `QuestionOptionId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
