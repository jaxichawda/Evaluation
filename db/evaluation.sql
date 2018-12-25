-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 25, 2018 at 02:37 PM
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
(1, 2, 13, '4', NULL, b'1', 3, '2018-12-25 12:54:17', 3, '2018-12-25 13:33:52'),
(2, 2, 14, '3', NULL, b'1', 3, '2018-12-25 12:54:17', 3, '2018-12-25 13:33:53'),
(3, 2, 15, '5', NULL, b'1', 3, '2018-12-25 12:54:17', 3, '2018-12-25 13:33:53'),
(4, 2, 16, '5', NULL, b'1', 3, '2018-12-25 12:54:17', 3, '2018-12-25 13:33:53'),
(5, 2, 17, '2', NULL, b'1', 3, '2018-12-25 12:54:17', 3, '2018-12-25 13:33:53'),
(6, 2, 18, NULL, NULL, b'1', 3, '2018-12-25 12:54:17', 3, '2018-12-25 13:33:53'),
(7, 2, 19, NULL, NULL, b'1', 3, '2018-12-25 12:54:17', 3, '2018-12-25 13:33:53'),
(8, 2, 20, NULL, NULL, b'1', 3, '2018-12-25 12:54:17', 3, '2018-12-25 13:33:53'),
(9, 2, 21, NULL, NULL, b'1', 3, '2018-12-25 12:54:17', 3, '2018-12-25 13:33:53'),
(10, 2, 22, NULL, NULL, b'1', 3, '2018-12-25 12:54:17', 3, '2018-12-25 13:33:53'),
(11, 2, 23, NULL, NULL, b'1', 3, '2018-12-25 12:54:17', 3, '2018-12-25 13:33:53'),
(12, 2, 24, NULL, NULL, b'1', 3, '2018-12-25 12:54:17', 3, '2018-12-25 13:33:53'),
(13, 2, 25, NULL, NULL, b'1', 3, '2018-12-25 12:54:17', 3, '2018-12-25 13:33:53'),
(14, 2, 26, NULL, NULL, b'1', 3, '2018-12-25 12:54:17', 3, '2018-12-25 13:33:53'),
(15, 2, 27, NULL, NULL, b'1', 3, '2018-12-25 12:54:17', 3, '2018-12-25 13:33:53'),
(16, 2, 28, NULL, NULL, b'1', 3, '2018-12-25 12:54:17', 3, '2018-12-25 13:33:53'),
(17, 2, 29, NULL, NULL, b'1', 3, '2018-12-25 12:54:17', 3, '2018-12-25 13:33:53'),
(18, 2, 30, NULL, NULL, b'1', 3, '2018-12-25 12:54:17', 3, '2018-12-25 13:33:54'),
(19, 2, 31, NULL, NULL, b'1', 3, '2018-12-25 12:54:17', 3, '2018-12-25 13:33:54'),
(20, 2, 32, NULL, NULL, b'1', 3, '2018-12-25 12:54:17', 3, '2018-12-25 13:33:54'),
(21, 2, 33, NULL, NULL, b'1', 3, '2018-12-25 12:54:17', 3, '2018-12-25 13:33:54'),
(22, 2, 34, NULL, NULL, b'1', 3, '2018-12-25 12:54:17', 3, '2018-12-25 13:33:54'),
(23, 2, 37, NULL, NULL, b'1', 3, '2018-12-25 12:54:17', 3, '2018-12-25 13:33:54'),
(24, 2, 39, NULL, NULL, b'1', 3, '2018-12-25 12:54:17', 3, '2018-12-25 13:33:54');

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
(1, 2, 2, '2018-12-26 11:13:12', 'This is test note for User', 'This is test note for Evaluator', b'1', 2, '2018-12-20 07:24:56', 2, '2018-12-20 07:24:56'),
(2, 3, 2, '2018-12-31 11:13:40', 'This is test note for User', 'This is test note for Evaluator', b'1', 2, '2018-12-20 07:24:56', 2, '2018-12-20 07:24:56'),
(3, 1, 2, '2018-12-26 09:20:00', 'Not mentioned!', 'Not mentioned!', b'1', 1, '2018-12-25 12:15:57', 1, '2018-12-25 12:15:57');

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
(1, 1, 2, 0, b'1', 2, '2018-12-20 07:24:56', 2, '2018-12-25 05:50:08'),
(2, 1, 3, 2, b'1', 2, '2018-12-20 07:24:56', 2, '2018-12-25 05:50:05'),
(3, 2, 3, 0, b'1', 2, '2018-12-20 07:24:56', 2, '2018-12-25 05:59:42'),
(4, 2, 2, 0, b'1', 2, '2018-12-20 07:24:56', 2, '2018-12-25 05:50:15'),
(5, 3, 1, 0, b'1', 1, '2018-12-25 12:15:57', 1, '2018-12-25 12:15:57'),
(6, 3, 3, 0, b'1', 1, '2018-12-25 12:15:57', 1, '2018-12-25 12:15:57');

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
(2, 'Yearly Evaluation', b'1', 1, '2018-12-07 13:42:24', 1, '2018-12-07 13:42:24');

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
(9, 2, '<p>What are the areas of your performance (behaviors and results) on which you could improve? Please describe. &nbsp;</p>', 1, 1, b'1', 1, '2018-12-18 23:53:09', 1, '2018-12-20 07:07:12'),
(10, 2, '<p>What you have done to accomplish company&rsquo;s goal? Did you find any difficulties to complete any task/ project?&nbsp;<br />\n&nbsp;</p>', 1, 1, b'1', 1, '2018-12-18 23:53:19', 1, '2018-12-20 07:07:45'),
(11, 2, '<p>Are there additional skills or knowledge that would help you more effectively perform your present job or enhance your skill opportunities? If yes, please list. &nbsp;<br />\n&nbsp;</p>', 1, 1, b'1', 1, '2018-12-18 23:53:30', 1, '2018-12-20 07:08:17'),
(12, 2, '<p>What goals (specific measurable results) do you expect to accomplish during the next year? &nbsp;<br />\n&nbsp;</p>', 1, 1, b'1', 1, '2018-12-18 23:53:42', 1, '2018-12-20 07:08:51'),
(13, 2, '<p>Rate out of 10 -&nbsp;COMMUNICATION</p>', 2, 0, b'1', 1, '2018-12-18 23:54:43', 1, '2018-12-18 23:59:54'),
(14, 2, '<p>Rate out of 10 - AMBITION / INITIATIVE</p>', 2, 0, b'1', 1, '2018-12-18 23:59:40', 1, '2018-12-18 13:29:40'),
(15, 2, '<p>Rate out of 10 - ATTENDANCE</p>', 2, 0, b'1', 1, '2018-12-19 00:02:38', 1, '2018-12-18 13:32:38'),
(16, 2, '<p>Rate out of 10 - ATTITUDE / COOPERATION</p>', 2, 0, b'1', 1, '2018-12-19 00:02:47', 1, '2018-12-18 13:32:47'),
(17, 2, '<p>Rate out of 10 - DEPARTMENT AND COMPANY ORIENTED</p>', 2, 0, b'1', 1, '2018-12-19 00:03:08', 1, '2018-12-18 13:33:08'),
(18, 2, '<p>Rate out of 10 - FOCUS</p>', 2, 0, b'1', 1, '2018-12-19 00:03:17', 1, '2018-12-18 13:33:17'),
(19, 2, '<p>Rate out of 10 - IMPROVEMENT FROM PREVIOUS EVALUATION</p>', 2, 0, b'1', 1, '2018-12-19 00:03:48', 1, '2018-12-18 13:33:48'),
(20, 2, '<p>Rate out of 10 - INTEGRITY</p>', 2, 0, b'1', 1, '2018-12-19 00:03:56', 1, '2018-12-18 13:33:56'),
(21, 2, '<p>Rate out of 10 - LEVEL OF (TECHNICAL) KNOWLEDGE</p>', 2, 0, b'1', 1, '2018-12-19 00:04:06', 1, '2018-12-18 13:34:06'),
(22, 2, '<p>Rate out of 10 - PRODUCTIVITY / DEADLINE</p>', 2, 0, b'1', 1, '2018-12-19 00:06:22', 1, '2018-12-18 13:36:22'),
(23, 2, '<p>Rate out of 10 - QUALITY OF WORK</p>', 2, 0, b'1', 1, '2018-12-19 00:06:32', 1, '2018-12-18 13:36:32'),
(24, 2, '<p>Rate out of 10 - RELIABILITY / GO-TO PERSON</p>', 2, 0, b'1', 1, '2018-12-19 00:06:40', 1, '2018-12-18 13:36:40'),
(25, 2, '<p>Rate out of 10 - STRESS MANAGEMENT</p>', 2, 0, b'1', 1, '2018-12-19 00:06:48', 1, '2018-12-18 13:36:48'),
(26, 2, '<p>Rate out of 10 - TEAMWORK</p>', 2, 0, b'1', 1, '2018-12-19 00:06:56', 1, '2018-12-18 13:36:56'),
(27, 2, '<p>Rate out of 10 - PRESENTATION</p>', 2, 0, b'1', 1, '2018-12-19 00:07:04', 1, '2018-12-18 13:37:04'),
(28, 2, '<p>List the subjects you would like to discuss during your annual performance evaluation meeting:&nbsp;</p>', 1, 0, b'1', 1, '2018-12-19 00:07:38', 1, '2018-12-18 13:37:38'),
(29, 2, '<p>Quality of work: Consider quality of work produced and the promptness with which it is completed</p>', 2, 0, b'1', 1, '2018-12-19 00:08:27', 1, '2018-12-18 13:38:27'),
(30, 2, '<p>Productivity: Consider the ability to produce a quantity of accepted work which meets company standards.</p>', 2, 0, b'1', 1, '2018-12-19 00:09:09', 1, '2018-12-18 13:39:09'),
(31, 2, '<p>Knowledge of job: Consider the knowledge of present job of other work closely related to it and of the equipment necessary to perform job functions.</p>', 2, 0, b'1', 1, '2018-12-19 00:10:03', 1, '2018-12-18 13:40:03'),
(32, 2, '<p>Reliability and Dependability: Consider the amount of supervision required and job performance regarding timely completion and follow-ups.</p>', 2, 0, b'1', 1, '2018-12-19 00:10:45', 1, '2018-12-19 00:11:05'),
(33, 2, '<p>Attendance: Consider overall attendance record and punctuality.</p>', 2, 0, b'1', 1, '2018-12-19 00:11:43', 1, '2018-12-18 13:41:43'),
(34, 2, '<p>Initiative: Consider the extent to which new work assignments and additional duties are sought out when necessary.</p>', 2, 0, b'1', 1, '2018-12-19 00:12:13', 1, '2018-12-18 13:42:13'),
(35, 2, '<p>The job timings are suitable for me.</p>', 2, 1, b'1', 1, '2018-12-19 00:12:38', 1, '2018-12-20 07:10:12'),
(36, 2, '<p>I am satisfied with my pay and other perks of this job.</p>', 2, 1, b'1', 1, '2018-12-19 00:13:10', 1, '2018-12-20 07:11:40'),
(37, 2, '<p>List your key strengths:</p>', 1, 0, b'1', 1, '2018-12-19 00:13:20', 1, '2018-12-18 13:43:20'),
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
  MODIFY `EvaluationAnswerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

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
  MODIFY `EvaluationId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblmstempevaluator`
--
ALTER TABLE `tblmstempevaluator`
  MODIFY `EmployeeEvaluatorId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
