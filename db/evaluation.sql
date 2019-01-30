-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2019 at 06:26 AM
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
-- Table structure for table `tblactivitylog`
--

CREATE TABLE `tblactivitylog` (
  `ActivityLogId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `Module` varchar(50) NOT NULL,
  `Activity` varchar(100) NOT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblemaillog`
--

CREATE TABLE `tblemaillog` (
  `EmailLogId` int(11) NOT NULL,
  `TokenId` int(11) NOT NULL,
  `From` varchar(100) NOT NULL,
  `Cc` text NOT NULL,
  `Bcc` text NOT NULL,
  `To` varchar(100) NOT NULL,
  `Subject` varchar(250) NOT NULL,
  `MessageBody` text NOT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Table structure for table `tblloginlog`
--

CREATE TABLE `tblloginlog` (
  `LoginLogId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `LoginType` int(1) NOT NULL,
  `UserAgent` int(11) DEFAULT NULL,
  `IPAddress` varchar(50) DEFAULT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


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
(6, 'Head Department', b'1', 1, '2018-12-07 08:11:58', 9, '2019-01-10 11:41:09');

-- --------------------------------------------------------

--
-- Table structure for table `tblmstempevaluation`
--

CREATE TABLE `tblmstempevaluation` (
  `EvaluationId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `EvaluationTypeId` int(11) NOT NULL,
  `EvaluationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ExpirationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `EmployeeEmailNote` text,
  `EvaluatorEmailNote` text,
  `EvaluationNote` text,
  `ParentEvaluation` int(11) DEFAULT NULL,
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `CreatedBy` int(11) NOT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL,
  `UpdatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `tblmstempevaluator`
--

CREATE TABLE `tblmstempevaluator` (
  `EmployeeEvaluatorId` int(11) NOT NULL,
  `EvaluationId` int(11) NOT NULL,
  `EvaluatorId` int(11) NOT NULL,
  `StatusId` tinyint(1) NOT NULL DEFAULT '0',
  `EvaluatorType` bit(1) NOT NULL DEFAULT b'0',
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `CreatedBy` int(11) NOT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL,
  `UpdatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


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
-- Table structure for table `tblmstjob`
--

CREATE TABLE `tblmstjob` (
  `JobId` int(11) NOT NULL,
  `DepartmentId` int(11) NOT NULL,
  `JobTitle` varchar(100) NOT NULL,
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `CreatedBy` int(11) NOT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL,
  `UpdatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblmstjob`
--

INSERT INTO `tblmstjob` (`JobId`, `DepartmentId`, `JobTitle`, `IsActive`, `CreatedBy`, `CreatedOn`, `UpdatedBy`, `UpdatedOn`) VALUES
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
(7, 2, '<p>What were your major achievements in the past year?</p>', 1, 0, b'1', 1, '2018-12-18 18:17:46', 1, '2018-12-31 09:55:39'),
(8, 2, '<p>What was your goal? Did you reach to your goal? Personally and Professionally.</p>', 1, 0, b'1', 1, '2018-12-18 18:22:59', 1, '2018-12-31 09:55:50'),
(9, 2, '<p>What are the areas of your performance (behaviors and results) on which you could improve? Please describe.</p>', 1, 0, b'1', 1, '2018-12-18 18:23:09', 1, '2018-12-31 09:56:07'),
(10, 2, '<p>What you have done to accomplish company&rsquo;s goal? Did you find any difficulties to complete any task/ project?</p>', 1, 0, b'1', 1, '2018-12-18 18:23:19', 1, '2018-12-18 07:53:19'),
(11, 2, '<p>Are there additional skills or knowledge that would help you more effectively perform your present job or enhance your skill opportunities? If yes, please list.</p>', 1, 0, b'1', 1, '2018-12-18 18:23:30', 1, '2018-12-18 07:53:30'),
(12, 2, '<p>What goals (specific measurable results) do you expect to accomplish during the next year?</p>', 1, 0, b'1', 1, '2018-12-18 18:23:42', 1, '2018-12-31 09:56:57'),
(13, 2, '<p>Rate out of 5 - COMMUNICATION</p>', 2, 0, b'1', 1, '2018-12-18 18:24:43', 1, '2018-12-18 18:29:54'),
(14, 2, '<p>Rate out of 5 - AMBITION / INITIATIVE</p>', 2, 0, b'1', 1, '2018-12-18 18:29:40', 1, '2018-12-18 07:59:40'),
(15, 2, '<p>Rate out of 5 - ATTENDANCE</p>', 2, 0, b'1', 1, '2018-12-18 18:32:38', 1, '2018-12-18 08:02:38'),
(16, 2, '<p>Rate out of 5 - ATTITUDE / COOPERATION</p>', 2, 0, b'1', 1, '2018-12-18 18:32:47', 1, '2018-12-18 08:02:47'),
(17, 2, '<p>Rate out of 5 - DEPARTMENT AND COMPANY ORIENTED</p>', 2, 0, b'1', 1, '2018-12-18 18:33:08', 1, '2018-12-18 08:03:08'),
(18, 2, '<p>Rate out of 5 - FOCUS</p>', 2, 0, b'1', 1, '2018-12-18 18:33:17', 1, '2018-12-18 08:03:17'),
(19, 2, '<p>Rate out of 5 - IMPROVEMENT FROM PREVIOUS EVALUATION</p>', 2, 0, b'1', 1, '2018-12-18 18:33:48', 1, '2018-12-18 08:03:48'),
(20, 2, '<p>Rate out of 5 - INTEGRITY</p>', 2, 0, b'1', 1, '2018-12-18 18:33:56', 1, '2018-12-18 08:03:56'),
(21, 2, '<p>Rate out of 5 - LEVEL OF (TECHNICAL) KNOWLEDGE</p>', 2, 0, b'1', 1, '2018-12-18 18:34:06', 1, '2018-12-18 08:04:06'),
(22, 2, '<p>Rate out of 5 - PRODUCTIVITY / DEADLINE</p>', 2, 0, b'1', 1, '2018-12-18 18:36:22', 1, '2018-12-18 08:06:22'),
(23, 2, '<p>Rate out of 5 - QUALITY OF WORK</p>', 2, 0, b'1', 1, '2018-12-18 18:36:32', 1, '2018-12-18 08:06:32'),
(24, 2, '<p>Rate out of 5 - RELIABILITY / GO-TO PERSON</p>', 2, 0, b'1', 1, '2018-12-18 18:36:40', 1, '2018-12-18 08:06:40'),
(25, 2, '<p>Rate out of 5 - STRESS MANAGEMENT</p>', 2, 0, b'1', 1, '2018-12-18 18:36:48', 1, '2018-12-18 08:06:48'),
(26, 2, '<p>Rate out of 5 - TEAMWORK</p>', 2, 0, b'1', 1, '2018-12-18 18:36:56', 1, '2018-12-18 08:06:56'),
(27, 2, '<p>Rate out of 5 - PRESENTATION</p>', 2, 0, b'1', 1, '2018-12-18 18:37:04', 1, '2018-12-18 08:07:04'),
(28, 2, '<p>List the subjects you would like to discuss during your annual performance evaluation meeting:&nbsp;</p>', 1, 0, b'1', 1, '2018-12-18 18:37:38', 1, '2018-12-18 08:07:38'),
(29, 2, '<p>Quality of work: Consider quality of work produced and the promptness with which it is completed.</p>', 2, 0, b'1', 1, '2018-12-18 18:38:27', 1, '2018-12-31 10:01:38'),
(30, 2, '<p>Productivity: Consider the ability to produce a quantity of accepted work which meets company standards.</p>', 2, 0, b'1', 1, '2018-12-18 18:39:09', 1, '2018-12-31 10:01:51'),
(31, 2, '<p>Knowledge of job: Consider the knowledge of present job of other work closely related to it and of the equipment necessary to perform job functions.</p>', 2, 0, b'1', 1, '2018-12-18 18:40:03', 1, '2018-12-31 10:02:06'),
(32, 2, '<p>Reliability and Dependability: Consider the amount of supervision required and job performance regarding timely completion and follow-ups.</p>', 2, 0, b'1', 1, '2018-12-18 18:40:45', 1, '2018-12-31 10:00:48'),
(33, 2, '<p>Attendance: Consider overall attendance record and punctuality.</p>', 2, 0, b'1', 1, '2018-12-18 18:41:43', 1, '2018-12-31 10:00:29'),
(34, 2, '<p>Initiative: Consider the extent to which new work assignments and additional duties are sought out when necessary.</p>', 2, 0, b'1', 1, '2018-12-18 18:42:13', 1, '2018-12-31 10:00:16'),
(35, 2, '<p>The job timings are suitable for me.</p>', 2, 0, b'1', 1, '2018-12-18 18:42:38', 1, '2018-12-31 09:59:23'),
(36, 2, '<p>I am satisfied with my pay and other perks of this job.</p>', 2, 0, b'1', 1, '2018-12-18 18:43:10', 1, '2018-12-31 09:59:35'),
(37, 2, '<p>List your key strengths:</p>', 1, 0, b'1', 1, '2018-12-18 18:43:20', 1, '2018-12-18 08:13:20'),
(38, 2, '<p>List your performance areas that need further development.</p>', 1, 0, b'1', 1, '2018-12-18 18:43:35', 1, '2018-12-18 08:13:35'),
(39, 2, '<p>Mention any skills according to you are not utilised or under utilised for your role, if any.</p>', 1, 0, b'1', 1, '2018-12-18 18:50:52', 1, '2019-01-11 09:02:07');

-- --------------------------------------------------------

--
-- Table structure for table `tblmstrole`
--

CREATE TABLE `tblmstrole` (
  `RoleId` int(11) NOT NULL,
  `RoleName` varchar(50) NOT NULL,
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `CreatedBy` int(11) NOT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL,
  `UpdatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblmstrole`
--

INSERT INTO `tblmstrole` (`RoleId`, `RoleName`, `IsActive`, `CreatedBy`, `CreatedOn`, `UpdatedBy`, `UpdatedOn`) VALUES
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
  `JobId` int(11) NOT NULL,
  `LineManagerId` int(11) NOT NULL DEFAULT '0',
  `FirstName` varchar(50) DEFAULT NULL,
  `MiddleName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `EmployeeId` varchar(50) DEFAULT '0',
  `EmailAddress` varchar(100) NOT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `ForgotPasswordCode` varchar(10) DEFAULT NULL,
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `CreatedBy` int(11) NOT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL,
  `UpdatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`UserId`, `RoleId`, `JobId`, `LineManagerId`, `FirstName`, `MiddleName`, `LastName`, `EmployeeId`, `EmailAddress`, `Password`, `ForgotPasswordCode`, `IsActive`, `CreatedBy`, `CreatedOn`, `UpdatedBy`, `UpdatedOn`) VALUES
(1, 1, 15, 0, 'IT', 'Admin', 'Developer', NULL, 'it@theopeneyes.com', '25d55ad283aa400af464c76d713c07ad', NULL, b'1', 1, '2018-12-18 18:15:58', 1, '2018-12-18 18:15:58'),
(2, 3, 5, 0, 'Uttam', '', 'Bhut', '37', 'uttam.bhut@theopeneyes.in', '25d55ad283aa400af464c76d713c07ad', NULL, b'0', 1, '2018-12-18 17:29:22', 1, '2018-12-19 16:19:39'),
(3, 2, 15, 0, 'Trushant', '', 'Mehta', '007', 'TMehta@theopeneyes.com', 'a7871740a2c841299f8661527e721329', NULL, b'1', 1, '2018-12-18 19:30:13', 1, '2018-12-18 09:00:13'),
(4, 3, 10, 3, 'Pooja', '', 'Shah', '29', 'pooja.patel@theopeneyes.com', '82080600934821faf0bc59cba79964bc', NULL, b'1', 1, '2018-12-20 12:25:13', 1, '2018-12-20 12:26:18'),
(5, 3, 5, 4, 'Vidhi', '', 'Bathani', '28', 'vidhi.bathani@theopeneyes.in', '4285e46dd79d81d14cc290464e67b842', NULL, b'1', 1, '2019-01-09 14:58:15', 1, '2019-01-09 14:59:24'),
(6, 2, 2, 3, 'Dharti', '', 'Desai', '29', 'dharti.desai@theopeneyes.in', '7ed990bb62e5627aedc639c34383d158', NULL, b'1', 1, '2019-01-09 12:15:51', 1, '2019-01-09 12:16:28'),
(7, 3, 5, 4, 'Mitesh', '', 'Patel', '27', 'mitesh.patel@theopeneyes.in', '40e2744ed5e11495748555c090369cbf', NULL, b'1', 6, '2018-12-19 16:41:49', 1, '2018-12-19 16:41:49'),
(8, 3, 5, 4, 'Nirav', '', 'Patel', '26', 'nirav.patel@theopeneyes.in', '8af3d234280b1e0ec6919cd265648e0a', NULL, b'1', 6, '2018-12-19 16:42:43', 1, '2018-12-19 16:42:43'),
(9, 3, 6, 3, 'Krupali', '', 'Mistry', '31', 'krupali.mistry@theopeneyes.in', '25d55ad283aa400af464c76d713c07ad', NULL, b'1', 6, '2019-01-10 11:11:37', 1, '2019-01-10 11:12:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblactivitylog`
--
ALTER TABLE `tblactivitylog`
  ADD PRIMARY KEY (`ActivityLogId`);

--
-- Indexes for table `tblemaillog`
--
ALTER TABLE `tblemaillog`
  ADD PRIMARY KEY (`EmailLogId`);

--
-- Indexes for table `tblevaluationanswer`
--
ALTER TABLE `tblevaluationanswer`
  ADD PRIMARY KEY (`EvaluationAnswerId`);

--
-- Indexes for table `tblloginlog`
--
ALTER TABLE `tblloginlog`
  ADD PRIMARY KEY (`LoginLogId`);

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
-- Indexes for table `tblmstjob`
--
ALTER TABLE `tblmstjob`
  ADD PRIMARY KEY (`JobId`);

--
-- Indexes for table `tblmstquestion`
--
ALTER TABLE `tblmstquestion`
  ADD PRIMARY KEY (`QuestionId`);

--
-- Indexes for table `tblmstrole`
--
ALTER TABLE `tblmstrole`
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
-- AUTO_INCREMENT for table `tblactivitylog`
--
ALTER TABLE `tblactivitylog`
  MODIFY `ActivityLogId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblemaillog`
--
ALTER TABLE `tblemaillog`
  MODIFY `EmailLogId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblevaluationanswer`
--
ALTER TABLE `tblevaluationanswer`
  MODIFY `EvaluationAnswerId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblloginlog`
--
ALTER TABLE `tblloginlog`
  MODIFY `LoginLogId` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `EvaluationId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblmstempevaluator`
--
ALTER TABLE `tblmstempevaluator`
  MODIFY `EmployeeEvaluatorId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblmstevaluationtype`
--
ALTER TABLE `tblmstevaluationtype`
  MODIFY `EvaluationTypeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblmstjob`
--
ALTER TABLE `tblmstjob`
  MODIFY `JobId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tblmstquestion`
--
ALTER TABLE `tblmstquestion`
  MODIFY `QuestionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `tblmstrole`
--
ALTER TABLE `tblmstrole`
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
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
