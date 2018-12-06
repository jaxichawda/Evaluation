-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2018 at 08:14 AM
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
-- Database: `questionnaire`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblcandidate`
--

CREATE TABLE `tblcandidate` (
  `CandidateId` int(11) NOT NULL,
  `CandidateName` varchar(100) NOT NULL,
  `CandidateEmail` varchar(100) NOT NULL,
  `PhoneNumber` varchar(15) NOT NULL,
  `JobPositionId` int(11) NOT NULL,
  `CandidateHrForm` varchar(200) NOT NULL,
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `CreatedBy` int(11) NOT NULL DEFAULT '1',
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL DEFAULT '1',
  `UpdatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblcandidate`
--

INSERT INTO `tblcandidate` (`CandidateId`, `CandidateName`, `CandidateEmail`, `PhoneNumber`, `JobPositionId`, `CandidateHrForm`, `IsActive`, `CreatedBy`, `CreatedOn`, `UpdatedBy`, `UpdatedOn`) VALUES
(1, 'Uttan', 'uttam.bhut@theopeneyes.in', '76547', 1, '1541156725_HR_Form.pdf', b'1', 1, '2018-11-02 11:05:25', 1, '2018-11-02 10:29:24'),
(2, 'Uttam Bhut', 'frgthyu@rtyu.dghj', '4567890567', 5, '1541155185_HR_Form.pdf', b'1', 1, '2018-11-02 10:39:44', 1, '2018-11-02 10:31:19');

-- --------------------------------------------------------

--
-- Table structure for table `tblcandidateanswer`
--

CREATE TABLE `tblcandidateanswer` (
  `CAnswerId` int(11) NOT NULL,
  `CandidateId` int(11) NOT NULL,
  `QuestionId` int(11) NOT NULL,
  `QAnswerId` int(11) NOT NULL,
  `CAnswer` text NOT NULL,
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `CreatedBy` int(11) NOT NULL DEFAULT '1',
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL DEFAULT '1',
  `UpdatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblcandidateanswer`
--

INSERT INTO `tblcandidateanswer` (`CAnswerId`, `CandidateId`, `QuestionId`, `QAnswerId`, `CAnswer`, `IsActive`, `CreatedBy`, `CreatedOn`, `UpdatedBy`, `UpdatedOn`) VALUES
(1, 1, 1, 1, 'NA', b'1', 1, '2018-11-02 10:29:24', 1, '2018-11-02 10:29:24'),
(2, 1, 2, 2, 'Pooja', b'1', 1, '2018-11-02 10:29:24', 1, '2018-11-02 10:29:24'),
(3, 1, 2, 3, 'Swar', b'1', 1, '2018-11-02 10:29:24', 1, '2018-11-02 10:29:24'),
(4, 1, 2, 4, 'Dharti', b'1', 1, '2018-11-02 10:29:24', 1, '2018-11-02 10:29:24'),
(5, 1, 3, 32, 'Unmarried', b'1', 1, '2018-11-02 10:29:25', 1, '2018-11-02 10:29:25'),
(6, 1, 3, 33, '', b'1', 1, '2018-11-02 10:29:25', 1, '2018-11-02 10:29:25'),
(7, 1, 3, 34, '', b'1', 1, '2018-11-02 10:29:25', 1, '2018-11-02 10:29:25'),
(8, 1, 3, 35, '', b'1', 1, '2018-11-02 10:29:25', 1, '2018-11-02 10:29:25'),
(9, 1, 4, 9, 'No', b'1', 1, '2018-11-02 10:29:25', 1, '2018-11-02 10:29:25'),
(10, 1, 5, 27, 'No', b'1', 1, '2018-11-02 10:29:25', 1, '2018-11-02 10:29:25'),
(11, 1, 6, 11, 'No', b'1', 1, '2018-11-02 10:29:25', 1, '2018-11-02 10:29:25'),
(12, 1, 6, 12, 'NA', b'1', 1, '2018-11-02 10:29:25', 1, '2018-11-02 10:29:25'),
(13, 1, 6, 13, 'NA', b'1', 1, '2018-11-02 10:29:25', 1, '2018-11-02 10:29:25'),
(14, 1, 6, 14, 'NA', b'1', 1, '2018-11-02 10:29:25', 1, '2018-11-02 10:29:25'),
(15, 1, 7, 15, 'NA', b'1', 1, '2018-11-02 10:29:25', 1, '2018-11-02 10:29:25'),
(16, 1, 8, 16, 'NA', b'1', 1, '2018-11-02 10:29:25', 1, '2018-11-02 10:29:25'),
(17, 1, 9, 17, 'NA', b'1', 1, '2018-11-02 10:29:25', 1, '2018-11-02 10:29:25'),
(18, 1, 10, 18, 'NA', b'1', 1, '2018-11-02 10:29:25', 1, '2018-11-02 10:29:25'),
(19, 1, 11, 19, 'NA', b'1', 1, '2018-11-02 10:29:25', 1, '2018-11-02 10:29:25'),
(20, 1, 12, 20, 'NA', b'1', 1, '2018-11-02 10:29:25', 1, '2018-11-02 10:29:25'),
(21, 2, 1, 1, 'NA', b'1', 1, '2018-11-02 10:31:19', 1, '2018-11-02 10:31:19'),
(22, 2, 2, 2, 'Uttam', b'1', 1, '2018-11-02 10:31:19', 1, '2018-11-02 10:31:19'),
(23, 2, 2, 3, 'Swar', b'1', 1, '2018-11-02 10:31:19', 1, '2018-11-02 10:31:19'),
(24, 2, 2, 4, 'Dharti', b'1', 1, '2018-11-02 10:31:19', 1, '2018-11-02 10:31:19'),
(25, 2, 3, 32, 'Unmarried', b'1', 1, '2018-11-02 10:31:19', 1, '2018-11-02 10:31:19'),
(26, 2, 3, 33, '', b'1', 1, '2018-11-02 10:31:19', 1, '2018-11-02 10:31:19'),
(27, 2, 3, 34, '', b'1', 1, '2018-11-02 10:31:19', 1, '2018-11-02 10:31:19'),
(28, 2, 3, 35, '', b'1', 1, '2018-11-02 10:31:19', 1, '2018-11-02 10:31:19'),
(29, 2, 4, 9, 'NA', b'1', 1, '2018-11-02 10:31:19', 1, '2018-11-02 10:31:19'),
(30, 2, 5, 27, 'NA', b'1', 1, '2018-11-02 10:31:19', 1, '2018-11-02 10:31:19'),
(31, 2, 6, 11, 'NA', b'1', 1, '2018-11-02 10:31:19', 1, '2018-11-02 10:31:19'),
(32, 2, 6, 12, 'NA', b'1', 1, '2018-11-02 10:31:19', 1, '2018-11-02 10:31:19'),
(33, 2, 6, 13, 'NA', b'1', 1, '2018-11-02 10:31:19', 1, '2018-11-02 10:31:19'),
(34, 2, 6, 14, 'NA', b'1', 1, '2018-11-02 10:31:19', 1, '2018-11-02 10:31:19'),
(35, 2, 7, 15, 'NA', b'1', 1, '2018-11-02 10:31:19', 1, '2018-11-02 10:31:19'),
(36, 2, 8, 16, 'NA', b'1', 1, '2018-11-02 10:31:19', 1, '2018-11-02 10:31:19'),
(37, 2, 9, 17, 'NA', b'1', 1, '2018-11-02 10:31:19', 1, '2018-11-02 10:31:19'),
(38, 2, 10, 18, 'NA', b'1', 1, '2018-11-02 10:31:19', 1, '2018-11-02 10:31:19'),
(39, 2, 11, 19, 'NA', b'1', 1, '2018-11-02 10:31:19', 1, '2018-11-02 10:31:19'),
(40, 2, 12, 20, 'NA', b'1', 1, '2018-11-02 10:31:20', 1, '2018-11-02 10:31:20');

-- --------------------------------------------------------

--
-- Table structure for table `tblmstanswertype`
--

CREATE TABLE `tblmstanswertype` (
  `AnswerTypeId` int(11) NOT NULL,
  `AnswerName` varchar(100) NOT NULL,
  `DisplayText` varchar(100) DEFAULT NULL,
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `CreatedBy` int(11) NOT NULL DEFAULT '1',
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL DEFAULT '1',
  `UpdatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblmstanswertype`
--

INSERT INTO `tblmstanswertype` (`AnswerTypeId`, `AnswerName`, `DisplayText`, `IsActive`, `CreatedBy`, `CreatedOn`, `UpdatedBy`, `UpdatedOn`) VALUES
(1, 'Radio Button', NULL, b'1', 1, '2018-10-10 08:31:56', 1, '2018-10-10 08:31:56'),
(2, 'Multiple Textbox', NULL, b'1', 1, '2018-10-10 08:31:56', 1, '2018-10-10 08:31:56'),
(3, 'Textbox', NULL, b'1', 1, '2018-10-10 08:31:56', 1, '2018-10-10 08:31:56');

-- --------------------------------------------------------

--
-- Table structure for table `tblmstjobposition`
--

CREATE TABLE `tblmstjobposition` (
  `JobPositionId` int(11) NOT NULL,
  `JobPositionName` varchar(100) NOT NULL,
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `CreatedBy` int(11) NOT NULL DEFAULT '1',
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL DEFAULT '1',
  `UpdatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblmstjobposition`
--

INSERT INTO `tblmstjobposition` (`JobPositionId`, `JobPositionName`, `IsActive`, `CreatedBy`, `CreatedOn`, `UpdatedBy`, `UpdatedOn`) VALUES
(1, 'Intern - PHP Developer (< 1 Year)', b'1', 1, '2018-10-10 08:30:12', 1, '2018-10-10 08:30:12'),
(2, 'Intern - Designer (< 1 Year)', b'1', 1, '2018-10-10 08:30:12', 1, '2018-10-10 08:30:12'),
(3, 'QA Tester/Analyst (>1 and < 3 Years)', b'1', 1, '2018-10-10 08:30:12', 1, '2018-10-10 08:30:12'),
(4, 'Jr. PHP Developer (> 1 and < 3 Years)', b'1', 1, '2018-10-10 08:30:12', 1, '2018-10-10 08:30:12'),
(5, 'PHP Developer (>3 and < 5 Years)', b'1', 1, '2018-10-10 08:30:12', 1, '2018-10-10 08:30:12'),
(6, 'Sr. PHP Developer (> 5 Years)', b'1', 1, '2018-10-10 08:30:12', 1, '2018-10-10 08:30:12'),
(7, 'Technical Lead (> 7 Years)', b'1', 1, '2018-10-10 08:30:12', 1, '2018-10-10 08:30:12'),
(8, 'Technical Recruiter (U.S. Shift)', b'1', 1, '2018-10-10 08:30:12', 1, '2018-10-10 08:30:12');

-- --------------------------------------------------------

--
-- Table structure for table `tblmstuserrole`
--

CREATE TABLE `tblmstuserrole` (
  `RoleId` int(11) NOT NULL,
  `RoleName` varchar(50) NOT NULL,
  `IsActive` bit(1) DEFAULT b'1',
  `CreatedBy` int(11) NOT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL,
  `UpdatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblmstuserrole`
--

INSERT INTO `tblmstuserrole` (`RoleId`, `RoleName`, `IsActive`, `CreatedBy`, `CreatedOn`, `UpdatedBy`, `UpdatedOn`) VALUES
(2, 'Admin', b'1', 1, '2018-09-17 10:44:16', 1, '2018-09-17 10:44:16'),
(3, 'HR', b'1', 1, '2018-09-17 10:44:35', 1, '2018-10-23 07:50:07');

-- --------------------------------------------------------

--
-- Table structure for table `tblquestion`
--

CREATE TABLE `tblquestion` (
  `QuestionId` int(11) NOT NULL,
  `QuestionName` text NOT NULL,
  `AnswerTypeId` int(11) NOT NULL,
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `CreatedBy` int(11) NOT NULL DEFAULT '1',
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL DEFAULT '1',
  `UpdatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblquestion`
--

INSERT INTO `tblquestion` (`QuestionId`, `QuestionName`, `AnswerTypeId`, `IsActive`, `CreatedBy`, `CreatedOn`, `UpdatedBy`, `UpdatedOn`) VALUES
(1, '<p>Has any of the following happened to you in the last 5 years?</p>\r\n\r\n<ol style=\"list-style-type:circle;\">\r\n	<li>Fired from a job.</li>\r\n	<li>Quit a job after being told you&#39;d be fired.</li>\r\n	<li>Left a job by mutual agreement following allegations of misconduct.</li>\r\n	<li>Left a job by mutual agreement following allegations of unsatisfactory performance.</li>\r\n	<li>Left a job for other reasons under unfavorable circumstances.</li>\r\n</ol>', 3, b'1', 1, '2018-10-10 09:44:44', 1, '2018-10-10 09:44:44'),
(2, '<p>List three people in the specific textbox who know you well and live in the state of Gujarat. They should be good friends, peers, colleagues, college roommates, etc., whose combined association with you covers as well as possible the last 5 years.&nbsp;</p>\r\n\r\n<p><strong>Note:</strong> In each text box, write people&#39;s details in order of their name, email address and contact number (like <strong>NAME, EMAIL ADDRESS, CONTACT NUMBER</strong>).&nbsp;</p>\r\n\r\n<p><strong>Do not</strong> list your spouse, former spouses, or other relatives, and try not to list anyone who is listed elsewhere on this form.</p>', 2, b'1', 1, '2018-10-10 09:47:04', 1, '2018-10-10 09:47:04'),
(3, '<p>What is your current marital status?</p>', 1, b'1', 1, '2018-10-10 09:58:05', 1, '2018-10-10 09:58:05'),
(4, '<p>Have you served in the Indian Military?</p>', 3, b'1', 1, '2018-10-10 09:58:05', 1, '2018-10-10 09:58:05'),
(5, '<p>Have you served in the Indian Merchant Marine?</p>', 3, b'1', 1, '2018-10-10 09:58:05', 1, '2018-10-10 09:58:05'),
(6, '<p>List foreign countries you have visited in the past 5 years.</p>\r\n\r\n<p><span style=\"font-size: 12px;\">If Yes, please specify below details. (If there are multiple values then separate it with comma or slash in the same sequence). Otherwise, write &lsquo;No&rsquo; in all boxes.</span></p>', 2, b'1', 1, '2018-10-10 09:58:05', 1, '2018-10-10 09:58:05'),
(7, '<p>In the last 5 years, have you been arrested for, charged with, or convicted of any criminal offense(s)?</p>', 3, b'1', 1, '2018-10-10 09:58:05', 1, '2018-10-10 09:58:05'),
(8, '<p>In the last 5 year, have you illegally used any controlled substance, for example, marijuana, cocaine, crack cocaine, hashish, narcotics (opium, morphine, codeine, heroin, etc.), amphetamines, depressants (barbiturates, methaqualone, tranquilizers, etc.), hallucinogenic (LSD, PCP, etc.), or prescription drugs?</p>', 3, b'1', 1, '2018-10-10 09:58:05', 1, '2018-10-10 09:58:05'),
(9, '<p>In the last 5 years, have you been involved in the illegal purchase, manufacture, trafficking, production, transfer, shipping, receiving, or sale of any narcotic, depressant, stimulant, hallucinogen, or cannabis, for your own intended profit or that of another?</p>', 3, b'1', 1, '2018-10-10 09:58:05', 1, '2018-10-10 09:58:05'),
(10, '<p>In the last 5 years, have you, or a company over which you exercised some control, filed for bankruptcy, been declared bankrupt, been subject to a tax lien, or had legal judgment rendered against you for a debt?</p>', 3, b'1', 1, '2018-10-10 09:58:05', 1, '2018-10-10 09:58:05'),
(11, '<p>Are you now over 180 days&rsquo; delinquent on any loan or financial obligation? Include loans or obligations funded or guaranteed by the Government?</p>', 3, b'1', 1, '2018-10-10 09:58:05', 1, '2018-10-10 09:58:05'),
(12, '<p>Would you like to add any additional note for us?</p>', 3, b'1', 1, '2018-10-10 09:58:05', 1, '2018-10-10 09:58:05');

-- --------------------------------------------------------

--
-- Table structure for table `tblquestionanswer`
--

CREATE TABLE `tblquestionanswer` (
  `QAnswerId` int(11) NOT NULL,
  `QuestionId` int(11) NOT NULL,
  `QLabel` varchar(100) NOT NULL,
  `QValue` text,
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `CreatedBy` int(11) NOT NULL DEFAULT '1',
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL DEFAULT '1',
  `UpdatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblquestionanswer`
--

INSERT INTO `tblquestionanswer` (`QAnswerId`, `QuestionId`, `QLabel`, `QValue`, `IsActive`, `CreatedBy`, `CreatedOn`, `UpdatedBy`, `UpdatedOn`) VALUES
(1, 1, 'If Yes, please explain. Otherwise, write ‘No’.', '', b'1', 1, '2018-10-10 04:53:11', 1, '2018-10-10 04:53:11'),
(2, 2, 'People 1', '', b'1', 1, '2018-10-10 04:54:15', 1, '2018-10-10 04:54:15'),
(3, 2, 'People 2', '', b'1', 1, '2018-10-10 04:54:15', 1, '2018-10-10 04:54:15'),
(4, 2, 'People 3', '', b'1', 1, '2018-10-10 04:54:15', 1, '2018-10-10 04:54:15'),
(9, 4, 'If Yes, please enter the duration. Otherwise, write ‘No’.', '', b'1', 1, '2018-10-10 05:06:08', 1, '2018-10-10 05:06:08'),
(11, 6, 'Country', '', b'1', 1, '2018-10-10 05:06:08', 1, '2018-10-10 05:06:08'),
(12, 6, 'From [Month/Year]', '', b'1', 1, '2018-10-10 05:06:08', 1, '2018-10-10 05:06:08'),
(13, 6, 'To [Month/Year]', '', b'1', 1, '2018-10-10 05:06:08', 1, '2018-10-10 05:06:08'),
(14, 6, 'Purpose of Visit', '', b'1', 1, '2018-10-10 05:06:08', 1, '2018-10-10 05:06:08'),
(15, 7, 'If Yes, please explain. Otherwise, write ‘No’.', '', b'1', 1, '2018-10-10 05:07:52', 1, '2018-10-10 05:07:52'),
(16, 8, 'If Yes, please explain. Otherwise, write ‘No’.', '', b'1', 1, '2018-10-10 05:07:52', 1, '2018-10-10 05:07:52'),
(17, 9, 'If Yes, please explain. Otherwise, write ‘No’.', '', b'1', 1, '2018-10-10 05:07:52', 1, '2018-10-10 05:07:52'),
(18, 10, 'If Yes, please explain. Otherwise, write ‘No’.', '', b'1', 1, '2018-10-10 05:07:52', 1, '2018-10-10 05:07:52'),
(19, 11, 'If Yes, please explain. Otherwise, write ‘No’.', '', b'1', 1, '2018-10-10 05:07:52', 1, '2018-10-10 05:07:52'),
(20, 12, 'If Yes, please explain. Otherwise, write ‘No’.', '', b'1', 1, '2018-10-10 05:07:52', 1, '2018-10-10 05:07:52'),
(27, 5, 'If Yes, please explain. Otherwise, write ‘No’.', NULL, b'1', 1, '2018-10-25 10:12:29', 1, '2018-10-25 10:12:29'),
(32, 3, 'Unmarried', 'Unmarried', b'1', 1, '2018-10-25 10:13:17', 1, '2018-10-25 10:13:17'),
(33, 3, 'Married', 'Married', b'1', 1, '2018-10-25 10:13:17', 1, '2018-10-25 10:13:17'),
(34, 3, 'Legally Separated', 'Legally Separated', b'1', 1, '2018-10-25 10:13:17', 1, '2018-10-25 10:13:17'),
(35, 3, 'Widow', 'Widow', b'1', 1, '2018-10-25 10:13:17', 1, '2018-10-25 10:13:17');

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE `tbluser` (
  `UserId` int(11) NOT NULL,
  `RoleId` int(11) DEFAULT NULL,
  `FirstName` varchar(100) DEFAULT NULL,
  `LastName` varchar(100) DEFAULT NULL,
  `EmailAddress` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `Address1` varchar(300) DEFAULT NULL,
  `PhoneNumber` varchar(13) DEFAULT NULL,
  `IsActive` bit(1) DEFAULT b'1',
  `CreatedBy` int(11) NOT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL,
  `UpdatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`UserId`, `RoleId`, `FirstName`, `LastName`, `EmailAddress`, `Password`, `Address1`, `PhoneNumber`, `IsActive`, `CreatedBy`, `CreatedOn`, `UpdatedBy`, `UpdatedOn`) VALUES
(1, 1, 'IT', 'Admin', 'it@gmail.com', '1bbd886460827015e5d605ed44252251', 'anand', '123456789066', b'1', 1, '2018-10-25 10:09:21', 1, '2018-10-30 14:12:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblcandidate`
--
ALTER TABLE `tblcandidate`
  ADD PRIMARY KEY (`CandidateId`);

--
-- Indexes for table `tblcandidateanswer`
--
ALTER TABLE `tblcandidateanswer`
  ADD PRIMARY KEY (`CAnswerId`);

--
-- Indexes for table `tblmstanswertype`
--
ALTER TABLE `tblmstanswertype`
  ADD PRIMARY KEY (`AnswerTypeId`);

--
-- Indexes for table `tblmstjobposition`
--
ALTER TABLE `tblmstjobposition`
  ADD PRIMARY KEY (`JobPositionId`);

--
-- Indexes for table `tblmstuserrole`
--
ALTER TABLE `tblmstuserrole`
  ADD PRIMARY KEY (`RoleId`);

--
-- Indexes for table `tblquestion`
--
ALTER TABLE `tblquestion`
  ADD PRIMARY KEY (`QuestionId`),
  ADD KEY `AnswerTypeId` (`AnswerTypeId`);

--
-- Indexes for table `tblquestionanswer`
--
ALTER TABLE `tblquestionanswer`
  ADD PRIMARY KEY (`QAnswerId`),
  ADD KEY `tblquestionanswer_ibfk_1` (`QuestionId`);

--
-- Indexes for table `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`UserId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblcandidate`
--
ALTER TABLE `tblcandidate`
  MODIFY `CandidateId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblcandidateanswer`
--
ALTER TABLE `tblcandidateanswer`
  MODIFY `CAnswerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `tblmstanswertype`
--
ALTER TABLE `tblmstanswertype`
  MODIFY `AnswerTypeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblmstjobposition`
--
ALTER TABLE `tblmstjobposition`
  MODIFY `JobPositionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tblmstuserrole`
--
ALTER TABLE `tblmstuserrole`
  MODIFY `RoleId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblquestion`
--
ALTER TABLE `tblquestion`
  MODIFY `QuestionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tblquestionanswer`
--
ALTER TABLE `tblquestionanswer`
  MODIFY `QAnswerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=282;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblquestion`
--
ALTER TABLE `tblquestion`
  ADD CONSTRAINT `tblquestion_ibfk_1` FOREIGN KEY (`AnswerTypeId`) REFERENCES `tblmstanswertype` (`AnswerTypeId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblquestionanswer`
--
ALTER TABLE `tblquestionanswer`
  ADD CONSTRAINT `tblquestionanswer_ibfk_1` FOREIGN KEY (`QuestionId`) REFERENCES `tblquestion` (`QuestionId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
