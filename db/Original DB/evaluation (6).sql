-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2018 at 10:52 AM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `CreatedBy` int(11) NOT NULL DEFAULT '1',
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL DEFAULT '1',
  `UpdatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblevaluationanswer`
--

INSERT INTO `tblevaluationanswer` (`EvaluationAnswerId`, `EmployeeEvaluatorId`, `QuestionId`, `AnswerText`, `IsActive`, `CreatedBy`, `CreatedOn`, `UpdatedBy`, `UpdatedOn`) VALUES
(436, 68, 1, 'sdfghj', b'1', 1, '2018-12-14 12:49:10', 1, '2018-12-17 06:06:28'),
(437, 68, 2, 'fghjfgh', b'1', 1, '2018-12-14 12:49:10', 1, '2018-12-17 06:06:28'),
(438, 68, 3, 'Widow', b'1', 1, '2018-12-14 12:49:10', 1, '2018-12-17 06:06:28'),
(439, 68, 4, 'No', b'1', 1, '2018-12-14 12:49:10', 1, '2018-12-17 06:06:28'),
(440, 68, 5, 'Yes', b'1', 1, '2018-12-14 12:49:10', 1, '2018-12-17 06:06:28'),
(441, 68, 6, 'No', b'1', 1, '2018-12-14 12:49:10', 1, '2018-12-17 06:06:28'),
(442, 68, 7, 'asdfghj', b'1', 1, '2018-12-14 12:49:10', 1, '2018-12-17 06:06:28'),
(443, 68, 8, 'bbbbbbbbbb', b'1', 1, '2018-12-14 12:49:10', 1, '2018-12-17 06:06:28'),
(444, 68, 9, 'Yes', b'1', 1, '2018-12-14 12:49:10', 1, '2018-12-17 06:06:28'),
(445, 68, 10, 'bbbbbb', b'1', 1, '2018-12-14 12:49:10', 1, '2018-12-17 06:06:28'),
(451, 77, 1, 'ghffdgfdghfgh', b'1', 1, '2018-12-17 12:50:22', 1, '2018-12-17 13:17:42'),
(452, 77, 2, 'fdghgg', b'1', 1, '2018-12-17 12:50:22', 1, '2018-12-17 13:17:42'),
(453, 77, 3, 'Widow', b'1', 1, '2018-12-17 12:50:22', 1, '2018-12-17 13:17:43'),
(454, 77, 4, 'Yes', b'1', 1, '2018-12-17 12:50:22', 1, '2018-12-17 13:17:43'),
(455, 77, 5, 'Yes', b'1', 1, '2018-12-17 12:50:22', 1, '2018-12-17 13:17:43'),
(456, 77, 6, 'Yes', b'1', 1, '2018-12-17 12:50:22', 1, '2018-12-17 13:17:43'),
(457, 77, 7, '434342', b'1', 1, '2018-12-17 12:50:22', 1, '2018-12-17 13:17:43'),
(458, 77, 8, 'rertydfgh', b'1', 1, '2018-12-17 12:50:22', 1, '2018-12-17 13:17:43'),
(459, 77, 9, 'No', b'1', 1, '2018-12-17 12:50:22', 1, '2018-12-17 13:17:43'),
(460, 77, 10, 'fgdfgdfg', b'1', 1, '2018-12-17 12:50:22', 1, '2018-12-17 13:17:43'),
(466, 80, 1, 'aaa', b'1', 1, '2018-12-17 13:21:46', 1, '2018-12-17 13:21:55'),
(467, 80, 2, 'bbb', b'1', 1, '2018-12-17 13:21:46', 1, '2018-12-17 13:21:55'),
(468, 80, 3, NULL, b'1', 1, '2018-12-17 13:21:46', 1, '2018-12-17 13:21:55'),
(469, 80, 4, NULL, b'1', 1, '2018-12-17 13:21:46', 1, '2018-12-17 13:21:55'),
(470, 80, 5, NULL, b'1', 1, '2018-12-17 13:21:46', 1, '2018-12-17 13:21:55'),
(471, 80, 6, NULL, b'1', 1, '2018-12-17 13:21:46', 1, '2018-12-17 13:21:55'),
(472, 80, 7, NULL, b'1', 1, '2018-12-17 13:21:46', 1, '2018-12-17 13:21:55'),
(473, 80, 8, NULL, b'1', 1, '2018-12-17 13:21:46', 1, '2018-12-17 13:21:55'),
(474, 80, 9, NULL, b'1', 1, '2018-12-17 13:21:46', 1, '2018-12-17 13:21:55'),
(475, 80, 10, NULL, b'1', 1, '2018-12-17 13:21:46', 1, '2018-12-17 13:21:55'),
(481, 78, 1, NULL, b'1', 1, '2018-12-17 13:24:29', 1, '2018-12-17 13:24:29'),
(482, 78, 2, NULL, b'1', 1, '2018-12-17 13:24:29', 1, '2018-12-17 13:24:29'),
(483, 78, 3, NULL, b'1', 1, '2018-12-17 13:24:29', 1, '2018-12-17 13:24:29'),
(484, 78, 4, NULL, b'1', 1, '2018-12-17 13:24:29', 1, '2018-12-17 13:24:29'),
(485, 78, 5, NULL, b'1', 1, '2018-12-17 13:24:29', 1, '2018-12-17 13:24:29'),
(486, 78, 6, NULL, b'1', 1, '2018-12-17 13:24:29', 1, '2018-12-17 13:24:29'),
(487, 78, 7, NULL, b'1', 1, '2018-12-17 13:24:29', 1, '2018-12-17 13:24:29'),
(488, 78, 8, NULL, b'1', 1, '2018-12-17 13:24:29', 1, '2018-12-17 13:24:29'),
(489, 78, 9, NULL, b'1', 1, '2018-12-17 13:24:29', 1, '2018-12-17 13:24:29'),
(490, 78, 10, NULL, b'1', 1, '2018-12-17 13:24:29', 1, '2018-12-17 13:24:29'),
(496, 81, 1, 'kjnk ryer', b'1', 1, '2018-12-17 13:26:17', 1, '2018-12-18 09:43:11'),
(497, 81, 2, 'njkn', b'1', 1, '2018-12-17 13:26:17', 1, '2018-12-18 09:43:11'),
(498, 81, 3, 'Widow', b'1', 1, '2018-12-17 13:26:17', 1, '2018-12-18 09:43:12'),
(499, 81, 4, 'No', b'1', 1, '2018-12-17 13:26:17', 1, '2018-12-18 09:43:12'),
(500, 81, 5, NULL, b'1', 1, '2018-12-17 13:26:17', 1, '2018-12-18 09:43:12'),
(501, 81, 6, NULL, b'1', 1, '2018-12-17 13:26:17', 1, '2018-12-18 09:43:12'),
(502, 81, 7, NULL, b'1', 1, '2018-12-17 13:26:17', 1, '2018-12-18 09:43:12'),
(503, 81, 8, 'ytryrt', b'1', 1, '2018-12-17 13:26:17', 1, '2018-12-18 09:43:12'),
(504, 81, 9, NULL, b'1', 1, '2018-12-17 13:26:17', 1, '2018-12-18 09:43:12'),
(505, 81, 10, 'fdgdf', b'1', 1, '2018-12-17 13:26:17', 1, '2018-12-18 09:43:12');

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
  `CreatedBy` int(11) NOT NULL DEFAULT '1',
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL DEFAULT '1',
  `UpdatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblmstconfiguration`
--

INSERT INTO `tblmstconfiguration` (`ConfigurationId`, `Key`, `Value`, `DisplayText`, `Description`, `DisplayOrder`, `IsActive`, `CreatedBy`, `CreatedOn`, `UpdatedBy`, `UpdatedOn`) VALUES
(1, 'AnswerType', '1', 'Descriptive', 'It store descriptive answers.', 0, b'1', 1, '2018-12-07 06:31:29', 1, '2018-12-07 06:31:29'),
(2, 'AnswerType', '2', 'Numeric', 'It store numeric answers.', 0, b'1', 1, '2018-12-07 06:34:45', 1, '2018-12-07 06:34:45'),
(3, 'AnswerType', '3', 'MCQ', 'It store MCQ Answers.', 0, b'1', 1, '2018-12-07 06:34:45', 1, '2018-12-07 06:34:45'),
(4, 'EvaluationStatus', '0', 'Pending', NULL, 0, b'1', 1, '2018-12-07 06:43:08', 1, '2018-12-07 06:43:08'),
(5, 'EvaluationStatus', '2', 'In Progress', NULL, 0, b'1', 1, '2018-12-07 06:44:27', 1, '2018-12-07 06:44:27'),
(6, 'EvaluationStatus', '1', 'Submitted', NULL, 0, b'1', 1, '2018-12-07 06:44:27', 1, '2018-12-07 06:44:27'),
(7, 'EvaluationStatus', '3', 'Revoked', NULL, 0, b'1', 1, '2018-12-07 06:44:27', 1, '2018-12-07 06:44:27');

-- --------------------------------------------------------

--
-- Table structure for table `tblmstdepartment`
--

CREATE TABLE `tblmstdepartment` (
  `DepartmentId` int(11) NOT NULL,
  `DepartmentName` varchar(100) NOT NULL,
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `CreatedBy` int(11) NOT NULL DEFAULT '1',
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL DEFAULT '1',
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
  `EvaluationDate` timestamp NOT NULL,
  `EvaluationDescription` text,
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `CreatedBy` int(11) NOT NULL DEFAULT '1',
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL DEFAULT '1',
  `UpdatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblmstempevaluation`
--

INSERT INTO `tblmstempevaluation` (`EvaluationId`, `UserId`, `EvaluationTypeId`, `EvaluationDate`, `EvaluationDescription`, `IsActive`, `CreatedBy`, `CreatedOn`, `UpdatedBy`, `UpdatedOn`) VALUES
(21, 5, 1, '2018-12-18 02:55:00', 'jaxi\'s evaluation', b'1', 4, '2018-12-13 14:15:54', 1, '2018-12-17 13:25:55'),
(23, 4, 2, '2018-12-31 15:15:00', 'Not mentioned!', b'1', 1, '2018-12-17 09:28:55', 1, '2018-12-17 13:19:12');

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
  `CreatedBy` int(11) NOT NULL DEFAULT '1',
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL DEFAULT '1',
  `UpdatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblmstempevaluator`
--

INSERT INTO `tblmstempevaluator` (`EmployeeEvaluatorId`, `EvaluationId`, `EvaluatorId`, `StatusId`, `IsActive`, `CreatedBy`, `CreatedOn`, `UpdatedBy`, `UpdatedOn`) VALUES
(78, 23, 4, 2, b'1', 1, '2018-12-17 13:19:13', 1, '2018-12-17 13:19:13'),
(79, 23, 5, 3, b'1', 1, '2018-12-17 13:19:13', 1, '2018-12-18 09:51:35'),
(81, 21, 4, 2, b'1', 1, '2018-12-17 13:25:56', 1, '2018-12-17 13:25:56');

-- --------------------------------------------------------

--
-- Table structure for table `tblmstevaluationtype`
--

CREATE TABLE `tblmstevaluationtype` (
  `EvaluationTypeId` int(11) NOT NULL,
  `EvaluationTypeName` varchar(100) NOT NULL,
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `CreatedBy` int(11) NOT NULL DEFAULT '1',
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL DEFAULT '1',
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
  `CreatedBy` int(11) NOT NULL DEFAULT '1',
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL DEFAULT '1',
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
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `CreatedBy` int(11) NOT NULL DEFAULT '1',
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL DEFAULT '1',
  `UpdatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblmstquestion`
--

INSERT INTO `tblmstquestion` (`QuestionId`, `EvaluationTypeId`, `QuestionText`, `AnswerTypeId`, `IsActive`, `CreatedBy`, `CreatedOn`, `UpdatedBy`, `UpdatedOn`) VALUES
(1, 0, '<p>Has any of the following happened to you in the last 5 years?</p>\r\n\r\n<ol style=""list-style-type:circle;"">\r\n	<li>Fired from a job.</li>\r\n	<li>Quit a job after being told you&#39;d be fired.</li>\r\n	<li>Left a job by mutual agreement following allegations of misconduct.</li>\r\n	<li>Left a job by mutual agreement following allegations of unsatisfactory performance.</li>\r\n	<li>Left a job for other reasons under unfavorable circumstances.</li>\r\n</ol>', 1, b'1', 1, '2018-12-14 06:21:12', 1, '2018-12-14 06:21:12'),
(2, 0, '<p>List three people in the specific textbox who know you well and live in the state of Gujarat. They should be good friends, peers, colleagues, college roommates, etc., whose combined association with you covers as well as possible the last 5 years.&nbsp;</p>\r\n\r\n<p><strong>Note:</strong> In each text box, write people&#39;s details in order of their name, email address and contact number (like <strong>NAME, EMAIL ADDRESS, CONTACT NUMBER</strong>).&nbsp;</p>\r\n\r\n<p><strong>Do not</strong> list your spouse, former spouses, or other relatives, and try not to list anyone who is listed elsewhere on this form.</p>', 1, b'1', 1, '2018-12-14 06:21:12', 1, '2018-12-14 06:21:12'),
(3, 0, '<p>What is your current marital status?</p>', 3, b'1', 1, '2018-12-14 06:21:52', 1, '2018-12-14 06:21:52'),
(4, 0, '<p>Have you served in the Indian Military?</p>', 3, b'1', 1, '2018-12-14 06:21:52', 1, '2018-12-14 06:21:52'),
(5, 0, '<p>Have you served in the Indian Merchant Marine?</p>', 3, b'1', 1, '2018-12-14 06:25:09', 1, '2018-12-14 06:25:09'),
(6, 0, '<p>In the last 5 years, have you been arrested for, charged with, or convicted of any criminal offense(s)?</p>', 3, b'1', 1, '2018-12-14 06:25:09', 1, '2018-12-14 06:25:09'),
(7, 0, '<p>In the last 5 year, have you illegally used any controlled substance, for example, marijuana, cocaine, crack cocaine, hashish, narcotics (opium, morphine, codeine, heroin, etc.), amphetamines, depressants (barbiturates, methaqualone, tranquilizers, etc.), hallucinogenic (LSD, PCP, etc.), or prescription drugs?</p>', 2, b'1', 1, '2018-12-14 06:25:43', 1, '2018-12-14 06:25:43'),
(8, 0, '<p>In the last 5 years, have you been involved in the illegal purchase, manufacture, trafficking, production, transfer, shipping, receiving, or sale of any narcotic, depressant, stimulant, hallucinogen, or cannabis, for your own intended profit or that of another?</p>', 1, b'1', 1, '2018-12-14 06:25:43', 1, '2018-12-14 06:25:43'),
(9, 0, '<p>In the last 5 years, have you, or a company over which you exercised some control, filed for bankruptcy, been declared bankrupt, been subject to a tax lien, or had legal judgment rendered against you for a debt?</p>', 3, b'1', 1, '2018-12-14 06:26:30', 1, '2018-12-14 06:26:30'),
(10, 0, '<p>Are you now over 180 days&rsquo; delinquent on any loan or financial obligation? Include loans or obligations funded or guaranteed by the Government?</p>"\r\n"12";"<p>Would you like to add any additional note for us?</p>', 1, b'1', 1, '2018-12-14 06:26:30', 1, '2018-12-14 06:26:30');

-- --------------------------------------------------------

--
-- Table structure for table `tblmstuserrole`
--

CREATE TABLE `tblmstuserrole` (
  `RoleId` int(11) NOT NULL,
  `RoleName` varchar(50) NOT NULL,
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `CreatedBy` int(11) NOT NULL DEFAULT '1',
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL DEFAULT '1',
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
  `CreatedBy` int(11) NOT NULL DEFAULT '1',
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL DEFAULT '1',
  `UpdatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblquestionoptions`
--

INSERT INTO `tblquestionoptions` (`QuestionOptionId`, `QuestionId`, `OptionValue`, `IsActive`, `CreatedBy`, `CreatedOn`, `UpdatedBy`, `UpdatedOn`) VALUES
(1, 3, 'Married', b'1', 1, '2018-12-14 06:27:27', 1, '2018-12-14 06:27:27'),
(2, 3, 'Unmarried', b'1', 1, '2018-12-14 06:27:27', 1, '2018-12-14 06:27:27'),
(3, 3, 'Widow', b'1', 1, '2018-12-14 06:27:45', 1, '2018-12-14 06:27:45'),
(4, 4, 'Yes', b'1', 1, '2018-12-14 06:28:35', 1, '2018-12-14 06:28:35'),
(5, 4, 'No', b'1', 1, '2018-12-14 06:28:35', 1, '2018-12-14 06:28:35'),
(6, 5, 'Yes', b'1', 1, '2018-12-14 06:29:34', 1, '2018-12-14 06:29:34'),
(7, 5, 'No', b'1', 1, '2018-12-14 06:29:34', 1, '2018-12-14 06:29:34'),
(8, 6, 'Yes', b'1', 1, '2018-12-14 06:30:06', 1, '2018-12-14 06:30:06'),
(9, 6, 'No', b'1', 1, '2018-12-14 06:30:06', 1, '2018-12-14 06:30:06'),
(10, 9, 'Yes', b'1', 1, '2018-12-14 06:30:29', 1, '2018-12-14 06:30:29'),
(11, 9, 'No', b'1', 1, '2018-12-14 06:30:29', 1, '2018-12-14 06:30:29');

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
  `CreatedBy` int(11) NOT NULL DEFAULT '1',
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL DEFAULT '1',
  `UpdatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`UserId`, `RoleId`, `JobTitleId`, `LineManagerId`, `FirstName`, `MiddleName`, `LastName`, `EmployeeId`, `EmailAddress`, `Password`, `ResetPasswordCode`, `IsActive`, `CreatedBy`, `CreatedOn`, `UpdatedBy`, `UpdatedOn`) VALUES
(1, 1, 15, 0, 'IT', 'Admin', 'Developer', NULL, 'it@theopeneyes.com', '25d55ad283aa400af464c76d713c07ad', NULL, b'1', 1, '2018-12-07 05:24:11', 1, '2018-12-07 05:24:11'),
(2, 2, 2, 0, 'HR', 'Admin', 'Developer', NULL, 'sparmar@theopeneyes.in', '25d55ad283aa400af464c76d713c07ad', NULL, b'1', 1, '2018-12-07 05:24:11', 1, '2018-12-07 05:24:11'),
(4, 3, 10, 2, 'Uttam', '', 'Bhut', NULL, 'uttam.bhut@theopeneyes.in', '25d55ad283aa400af464c76d713c07ad', NULL, b'1', 1, '2018-12-07 05:24:11', 1, '2018-12-07 05:24:11'),
(5, 3, 5, 4, 'Jaxi', '', 'Chawda', NULL, 'jaxi.chawda@theopeneyes.in', '25f9e794323b453885f5181f1b624d0b', '690627', b'1', 1, '2018-12-17 12:47:49', 1, '2018-12-17 12:47:49'),
(6, 3, 5, 4, 'Vidhi', '', 'Bathani', NULL, 'vidhi.bathani@theopeneyes.in', '25d55ad283aa400af464c76d713c07ad', NULL, b'1', 1, '2018-12-07 05:24:11', 1, '2018-12-07 05:24:11'),
(7, 3, 5, 4, 'Nirav', '', 'Patel', NULL, 'nirav.patel@theopeneyes.in', '25d55ad283aa400af464c76d713c07ad', NULL, b'1', 1, '2018-12-07 05:24:11', 1, '2018-12-07 05:24:11');

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
  MODIFY `EvaluationAnswerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=511;
--
-- AUTO_INCREMENT for table `tblmstconfiguration`
--
ALTER TABLE `tblmstconfiguration`
  MODIFY `ConfigurationId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tblmstdepartment`
--
ALTER TABLE `tblmstdepartment`
  MODIFY `DepartmentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tblmstempevaluation`
--
ALTER TABLE `tblmstempevaluation`
  MODIFY `EvaluationId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `tblmstempevaluator`
--
ALTER TABLE `tblmstempevaluator`
  MODIFY `EmployeeEvaluatorId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;
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
  MODIFY `QuestionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `tblmstuserrole`
--
ALTER TABLE `tblmstuserrole`
  MODIFY `RoleId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tblquestionoptions`
--
ALTER TABLE `tblquestionoptions`
  MODIFY `QuestionOptionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
