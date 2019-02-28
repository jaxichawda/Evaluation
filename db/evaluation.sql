-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 28, 2019 at 06:29 AM
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
-- Database: `evaluation2`
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

--
-- Dumping data for table `tblactivitylog`
--

INSERT INTO `tblactivitylog` (`ActivityLogId`, `UserId`, `Module`, `Activity`, `CreatedOn`) VALUES
(1, 2, 'Password', 'Send Password reset Link', '2019-01-31 05:50:57'),
(2, 2, 'Password', 'Send Password reset Link', '2019-01-31 06:02:13'),
(3, 2, 'Password', 'Reset Password without Login', '2019-01-31 06:05:39'),
(4, 1, 'Password', 'Change Password after Login', '2019-01-31 06:16:17'),
(5, 1, 'Password', 'Change Password after Login', '2019-01-31 06:17:04'),
(6, 1, 'Employee', 'Add Employee - Sudhir Parmar', '2019-01-31 06:18:47'),
(7, 1, 'Question', 'Add Question (QuestionId = 40)', '2019-01-31 06:40:47'),
(8, 1, 'Question', 'Update Question Active Status (QuestionId = 40)', '2019-01-31 06:41:00'),
(9, 1, 'Question', 'Update Question Active Status (QuestionId = 40)', '2019-01-31 06:41:44'),
(10, 1, 'Question', 'Add Question (QuestionId = 41)', '2019-01-31 07:10:05'),
(11, 1, 'Evaluation', 'Generate Evaluation of UserId = 10 (EvaluationId = 5)', '2019-01-31 07:46:49'),
(12, 1, 'Evaluation', 'Assign Evaluator (UserId - 7) to Evaluation (EvaluationId - 5)', '2019-01-31 07:46:50'),
(13, 1, 'Evaluation', 'Assign Evaluator (UserId - 10) to Evaluation (EvaluationId - 5)', '2019-01-31 07:46:50'),
(14, 1, 'Evaluation', 'Assign Evaluator (UserId - 2) to Evaluation (EvaluationId - 5)', '2019-01-31 07:46:50'),
(15, 1, 'Evaluation', 'Add Evaluation Note - EvaluationId = 1', '2019-01-31 07:55:37'),
(16, 1, 'Question', 'Delete Question (QuestionId = 41)', '2019-01-31 08:08:00'),
(17, 1, 'Question', 'Delete Question (QuestionId = 40)', '2019-01-31 08:08:03'),
(18, 1, 'Question', 'Update Question (QuestionId = 29)', '2019-01-31 08:09:42'),
(19, 1, 'Question', 'Update Question (QuestionId = 30)', '2019-01-31 08:09:57'),
(20, 1, 'Question', 'Update Question (QuestionId = 31)', '2019-01-31 08:10:07'),
(21, 1, 'Question', 'Update Question (QuestionId = 32)', '2019-01-31 08:10:16'),
(22, 1, 'Question', 'Update Question (QuestionId = 33)', '2019-01-31 08:10:25'),
(23, 1, 'Question', 'Update Question (QuestionId = 34)', '2019-01-31 08:10:38'),
(24, 1, 'Question', 'Update Question (QuestionId = 35)', '2019-01-31 08:10:55'),
(25, 1, 'Question', 'Update Question (QuestionId = 36)', '2019-01-31 08:11:05'),
(26, 1, 'Question', 'Update Question (QuestionId = 37)', '2019-01-31 08:11:18'),
(27, 1, 'Question', 'Update Question (QuestionId = 38)', '2019-01-31 08:12:11'),
(28, 1, 'Question', 'Update Question (QuestionId = 39)', '2019-01-31 08:12:23'),
(29, 2, 'Evaluation', 'Start Evaluation (EmployeeEvaluatorId = 19)', '2019-01-31 08:25:43'),
(30, 2, 'Evaluation', 'Save as Draft Evaluation (EmployeeEvaluatorId = 19)', '2019-01-31 08:26:53'),
(31, 2, 'Evaluation', 'Save as Draft Evaluation (EmployeeEvaluatorId = 19)', '2019-01-31 08:27:38'),
(32, 1, 'Evaluation', 'Change Evaluation Status to 1 of EmployeeEvaluatorId = 19', '2019-01-31 08:32:16'),
(33, 1, 'Evaluation', 'Change Evaluation Status to 2 of EmployeeEvaluatorId = 19', '2019-01-31 08:33:04'),
(34, 1, 'Evaluation', 'Change Evaluation Status to 1 of EmployeeEvaluatorId = 19', '2019-01-31 08:39:10'),
(35, 1, 'Question', 'Add Question (QuestionId = 40)', '2019-02-25 11:25:22'),
(36, 1, 'Question', 'Update Question Active Status (QuestionId = 7)', '2019-02-25 11:39:01'),
(37, 1, 'Question', 'Update Question Active Status (QuestionId = 8)', '2019-02-25 11:39:03'),
(38, 1, 'Evaluation', 'Generate Evaluation of UserId = 2 (EvaluationId = 6)', '2019-02-25 11:41:17'),
(39, 1, 'Evaluation', 'Assign Evaluator (UserId - 1) to Evaluation (EvaluationId - 6)', '2019-02-25 11:41:17'),
(40, 1, 'Evaluation', 'Assign Evaluator (UserId - 2) to Evaluation (EvaluationId - 6)', '2019-02-25 11:41:17'),
(41, 1, 'Evaluation', 'Start Evaluation (EmployeeEvaluatorId = 20)', '2019-02-25 11:41:34'),
(42, 1, 'Evaluation', 'Start Evaluation (EmployeeEvaluatorId = 20)', '2019-02-25 11:51:58'),
(43, 1, 'Evaluation', 'Start Evaluation (EmployeeEvaluatorId = 20)', '2019-02-25 12:14:03'),
(44, 1, 'Evaluation', 'Start Evaluation (EmployeeEvaluatorId = 20)', '2019-02-25 12:24:02'),
(45, 1, 'Evaluation', 'Save as Draft Evaluation (EmployeeEvaluatorId = 20)', '2019-02-25 12:28:02'),
(46, 1, 'Evaluation', 'Save as Draft Evaluation (EmployeeEvaluatorId = 20)', '2019-02-25 12:28:35'),
(47, 1, 'Question', 'Add Question (QuestionId = 41)', '2019-02-25 12:32:55'),
(48, 1, 'Evaluation', 'Start Evaluation (EmployeeEvaluatorId = 20)', '2019-02-25 12:33:35'),
(49, 1, 'Evaluation', 'Save as Draft Evaluation (EmployeeEvaluatorId = 20)', '2019-02-25 12:41:07'),
(50, 1, 'Evaluation', 'Save as Draft Evaluation (EmployeeEvaluatorId = 20)', '2019-02-25 12:41:50'),
(51, 1, 'Evaluation', 'Save as Draft Evaluation (EmployeeEvaluatorId = 20)', '2019-02-25 12:43:26'),
(52, 1, 'Evaluation', 'Submit Evaluation (EmployeeEvaluatorId = 20)', '2019-02-25 12:43:47'),
(53, 1, 'Question', 'Add Question (QuestionId = 42)', '2019-02-27 05:57:07'),
(54, 1, 'Question', 'Update Question (QuestionId = 42)', '2019-02-27 07:25:01'),
(55, 1, 'Question', 'Update Question (QuestionId = 42)', '2019-02-27 07:25:34'),
(56, 1, 'Employee', 'Add Employee - Uttam Bhut', '2019-02-27 10:59:04'),
(57, 1, 'Employee', 'Update Employee - Uttam Bhut', '2019-02-27 10:59:22'),
(58, 1, 'Employee', 'Add Employee - Sudhir Parmar', '2019-02-27 11:01:05'),
(59, 1, 'Evaluation', 'Generate Evaluation of UserId = 12 (EvaluationId = 1)', '2019-02-27 11:02:03'),
(60, 1, 'Evaluation', 'Assign Evaluator (UserId - 11) to Evaluation (EvaluationId - 1)', '2019-02-27 11:02:03'),
(61, 1, 'Evaluation', 'Assign Evaluator (UserId - 12) to Evaluation (EvaluationId - 1)', '2019-02-27 11:02:03'),
(62, 1, 'Evaluation', 'Generate Evaluation of UserId = 11 (EvaluationId = 2)', '2019-02-27 11:04:00'),
(63, 1, 'Evaluation', 'Assign Evaluator (UserId - 1) to Evaluation (EvaluationId - 2)', '2019-02-27 11:04:01'),
(64, 1, 'Evaluation', 'Assign Evaluator (UserId - 11) to Evaluation (EvaluationId - 2)', '2019-02-27 11:04:01'),
(65, 1, 'Evaluation', 'Start Evaluation (EmployeeEvaluatorId = 3)', '2019-02-27 11:46:55'),
(66, 11, 'Evaluation', 'Start Evaluation (EmployeeEvaluatorId = 4)', '2019-02-27 11:47:46'),
(67, 11, 'Evaluation', 'Start Evaluation (EmployeeEvaluatorId = 1)', '2019-02-27 11:47:59'),
(68, 12, 'Evaluation', 'Start Evaluation (EmployeeEvaluatorId = 2)', '2019-02-27 11:48:48'),
(69, 12, 'Evaluation', 'Submit Evaluation (EmployeeEvaluatorId = 2)', '2019-02-27 11:53:04'),
(70, 11, 'Evaluation', 'Submit Evaluation (EmployeeEvaluatorId = 4)', '2019-02-27 11:54:01'),
(71, 11, 'Evaluation', 'Submit Evaluation (EmployeeEvaluatorId = 1)', '2019-02-27 11:54:19'),
(72, 1, 'Evaluation', 'Submit Evaluation (EmployeeEvaluatorId = 3)', '2019-02-27 11:55:05'),
(73, 1, 'Evaluation', 'Generate Evaluation of UserId = 12 (EvaluationId = 3)', '2019-02-27 12:25:35'),
(74, 1, 'Evaluation', 'Assign Evaluator (UserId - 1) to Evaluation (EvaluationId - 3)', '2019-02-27 12:25:35'),
(75, 1, 'Evaluation', 'Assign Evaluator (UserId - 12) to Evaluation (EvaluationId - 3)', '2019-02-27 12:25:35'),
(76, 1, 'Evaluation', 'Assign Evaluator (UserId - 11) to Evaluation (EvaluationId - 3)', '2019-02-27 12:25:36'),
(77, 1, 'Evaluation', 'Start Evaluation (EmployeeEvaluatorId = 5)', '2019-02-27 12:26:09'),
(78, 1, 'Evaluation', 'Save as Draft Evaluation (EmployeeEvaluatorId = 5)', '2019-02-27 13:57:19'),
(79, 1, 'Question', 'Add Question (QuestionId = 11)', '2019-02-27 14:12:28'),
(80, 1, 'Evaluation', 'Generate Evaluation of UserId = 1 (EvaluationId = 4)', '2019-02-27 14:14:11'),
(81, 1, 'Evaluation', 'Assign Evaluator (UserId - 1) to Evaluation (EvaluationId - 4)', '2019-02-27 14:14:11'),
(82, 1, 'Evaluation', 'Start Evaluation (EmployeeEvaluatorId = 8)', '2019-02-27 14:14:22'),
(83, 1, 'Evaluation', 'Save as Draft Evaluation (EmployeeEvaluatorId = 8)', '2019-02-27 14:14:47');

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

--
-- Dumping data for table `tblemaillog`
--

INSERT INTO `tblemaillog` (`EmailLogId`, `TokenId`, `From`, `Cc`, `Bcc`, `To`, `Subject`, `MessageBody`, `CreatedOn`) VALUES
(1, 0, 'myopeneyes3937@gmail.com', '', '', 'uttam.bhut@theopeneyes.in', 'Employee Evaluation - Password Reset Request', '\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:1px solid #333333; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto; width:600px\">\r\n						<tbody>\r\n							<tr>\r\n								<td style=\"background-color:#fff; background:#fff; padding:10px 10px 5px 10px; text-align:center\"><img alt=\"\" style=\"width:130px\" src=\"https://devbyopeneyes.com/emailer_images/oess.png\" /></td>\r\n							</tr>\r\n							<tr>\r\n								<td style=\"border-width:0; padding:20px 10px 10px 10px; text-align:center\">\r\n									<p style=\"color:#000; font-size: 25px; line-height: 25px; font-weight: bold;padding: 0; margin: 0 0 10px;\"><strong>Forgot</strong></p>\r\n									<p style=\"color:#000; font-size: 18px; line-height: 18px; font-weight: bold; padding: 0; margin: 0 0 10px;\">Your Password?</p>\r\n									<p style=\"color:#000; font-size: 14px; line-height:20px; padding: 0; margin: 0 0;\">Not to worry, we got you! Let&#39;s get you a new password.</p>\r\n								</td>\r\n							</tr>\r\n							<tr>\r\n								<td style=\"border-width:0; padding:0; text-align:center; vertical-align:middle\">\r\n								<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:0; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto\">\r\n									<tbody>\r\n										<tr>\r\n											<td style=\"background-color:#0061AF; background:#0061AF; border-radius:4px; border-width:0; clear:both; color:#ffffff; font-size:14px; line-height:13px; opacity:1; padding:10px; text-align:center; text-decoration:none; width:130px\"><a href=\"http://localhost:4200/reset-password/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJVc2VySWQiOiIyIiwiRm9yZ290UGFzc3dvcmRDb2RlIjozMDMxMjIsIkVtYWlsQWRkcmVzcyI6InV0dGFtLmJodXRAdGhlb3BlbmV5ZXMuaW4ifQ.wmF_xBkAO6nkl8-X_KhFhQis_VEYthlAXJ6cyQN84G4\" style=\"color:#fff; text-decoration:none;\">Reset Password</a></td>\r\n										</tr>\r\n									</tbody>\r\n								</table>\r\n								</td>\r\n							</tr>\r\n							<tr>\r\n								<td style=\"border-width:0; padding:20px 10px 10px 10px; text-align:center; vertical-align:middle\">\r\n									<p style=\"color:#777; font-size: 14px; line-height:20px; padding: 0; margin: 0 0 25px;\">If you did not request a password reset, please ignore this email.</p>\r\n									<p style=\"color:#777; font-size: 12px; line-height:20px; padding: 0; margin: 0 0 10px; text-align: left;\">If you&rsquo;re having trouble with the button above, copy and paste the URL below into your web browser. <a href=\"http://localhost:4200/reset-password/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJVc2VySWQiOiIyIiwiRm9yZ290UGFzc3dvcmRDb2RlIjozMDMxMjIsIkVtYWlsQWRkcmVzcyI6InV0dGFtLmJodXRAdGhlb3BlbmV5ZXMuaW4ifQ.wmF_xBkAO6nkl8-X_KhFhQis_VEYthlAXJ6cyQN84G4\" style=\"cursor:pointer;\">click here</a></p>\r\n								</td>\r\n							</tr>\r\n							<tr>\r\n								<td style=\"background-color:#a6ce39; background:#a6ce39; border-top:1px solid #cccccc; color:#000; font-size:13px; padding:7px; text-align:center\">Copyright &copy; 2018 OpenEyes Software Solutions</td>\r\n							</tr>\r\n						</tbody>\r\n					</table>', '2019-01-31 06:02:20'),
(2, 0, 'myopeneyes3937@gmail.com', '', '', 'uttam.bhut@theopeneyes.in', 'Employee Evaluation - Password has been Changed', '\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:1px solid #333333; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto; width:600px\">\r\n							<tbody>\r\n								<tr>\r\n									<td style=\"background-color:#fff; background:#fff; padding:10px 10px 5px 10px; text-align:center\"><img alt=\"\" style=\"width:130px\" src=\"https://devbyopeneyes.com/emailer_images/oess.png\" /></td>\r\n								</tr>\r\n								<tr>\r\n									<td style=\"border-width:0; padding:10px 10px 10px 10px; text-align:center\">\r\n										<p style=\"color:#000; font-size: 25px; line-height: 25px; font-weight: bold;padding: 0; margin: 0 0 10px;\"><strong>Password Reset!</strong></p>\r\n										<p style=\"color:#000; font-size: 18px; line-height: 18px; font-weight: bold; padding: 0; margin: 0 0 10px;\">Your new password has been set.</p>\r\n										<p style=\"color:#000; font-size: 14px; line-height:20px; padding: 0; margin: 0 0;\">Use the button below to access your account:</p>\r\n									</td>\r\n								</tr>\r\n								<tr>\r\n									<td style=\"border-width:0; padding:0; text-align:center; vertical-align:middle\">\r\n									<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:0; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto\">\r\n										<tbody>\r\n											<tr>\r\n												<td style=\"background-color:#0061AF; background:#0061AF; border-radius:4px; border-width:0; clear:both; color:#ffffff; font-size:14px; line-height:13px; opacity:1; padding:10px; text-align:center; text-decoration:none; width:130px\"><a href=\"http://localhost:4200/login/\" style=\"color:#fff; text-decoration:none;\">Login to Account</a></td>\r\n											</tr>\r\n										</tbody>\r\n									</table>\r\n									</td>\r\n								</tr>\r\n								<tr>\r\n									<td style=\"border-width:0; padding:20px 10px 10px 10px; text-align:center; vertical-align:middle\">\r\n										<p style=\"color:#777; font-size: 14px; line-height:20px; padding: 0; margin: 0 0 25px;\">If the changes described above are accurate, no further action is needed. If anything doesn&#39;t look right, follow the link below to make changes: <a href=\"http://localhost:4200/forgot-password/\">Restore password</a></p>\r\n										<p style=\"color:#777; font-size: 14px; line-height:20px; padding: 0; margin: 0 0 25px;\">If you have any questions, you can reply to this email and it will go right to them.</p>\r\n										<p style=\"color:#777; font-size: 12px; line-height:20px; padding: 0; margin: 0 0 10px; text-align: left;\">If you&rsquo;re having trouble with the button above, copy and paste the URL below into your web browser. <a href=\"http://localhost:4200/login/\" style=\"cursor:pointer;\">click here</a></p>\r\n									</td>\r\n								</tr>\r\n								<tr>\r\n									<td style=\"background-color:#a6ce39; background:#a6ce39; border-top:1px solid #cccccc; color:#000; font-size:13px; padding:7px; text-align:center\">Copyright &copy; 2018 OpenEyes Software Solutions</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>', '2019-01-31 06:05:44'),
(3, 0, 'myopeneyes3937@gmail.com', '', '', 'sparmar@theopeneyes.in', 'Employee Evaluation', '\r\n					<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:1px solid #333333; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto; width:600px\">\r\n						<tbody>\r\n							<tr>\r\n								<td style=\"background-color:#fff; background:#fff; padding:10px 10px 5px 10px; text-align:center\"><img alt=\"\" style=\"width:130px\" src=\"https://devbyopeneyes.com/emailer_images/oess.png\" /></td>\r\n							</tr>\r\n							<tr>\r\n								<td style=\"border-width:0; padding:20px 10px 10px 10px; text-align:center\">\r\n								<p style=\"color:#000; font-size: 25px; line-height: 25px; font-weight: bold;padding: 0; margin: 0 0 10px;\">Welcome, <strong>Sudhir Parmar!</strong></p>\r\n\r\n								<p style=\"color:#000; font-size: 18px; line-height: 18px; font-weight: bold; padding: 0; margin: 0 0 10px;\">Find your login credential for Employee Evaluation below:</p>\r\n\r\n								<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"margin:20px 0; width:100%; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto;\">\r\n									<tbody>\r\n										<tr>\r\n											<td style=\"padding:5px; text-align:right; width:35%\">Login Id</td>\r\n											<td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n											<td style=\"padding:5px; text-align:left; width:48%\">sparmar@theopeneyes.in</td>\r\n										</tr>\r\n										<tr>\r\n											<td style=\"padding:5px; text-align:right; width:35%\">Password</td>\r\n											<td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n											<td style=\"padding:5px; text-align:left; width:48%\">srciTtoB</td>\r\n										</tr>\r\n										<tr>\r\n											<td style=\"padding:5px; text-align:right; width:35%\">Your Line Manager</td>\r\n											<td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n											<td style=\"padding:5px; text-align:left; width:48%\">Uttam Bhut</td>\r\n										</tr>\r\n									</tbody>\r\n								</table>\r\n								<p style=\"color:#000; font-size: 14px; line-height:20px; padding: 0; margin:20px 0 0;\">Use the button below to access your account:</p>\r\n								</td>\r\n							</tr>\r\n							<tr>\r\n								<td style=\"border-width:0; padding:0; text-align:center; vertical-align:middle\">\r\n								<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:0; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto\">\r\n									<tbody>\r\n										<tr>\r\n											<td style=\"background-color:#0061AF; background:#0061AF; border-radius:4px; border-width:0; clear:both; color:#ffffff; font-size:14px; line-height:13px; opacity:1; padding:10px; text-align:center; text-decoration:none; width:130px\"><a href=\"http://localhost:4200/login/\" style=\"color:#fff; text-decoration:none;\">Login to Account</a></td>\r\n										</tr>\r\n									</tbody>\r\n								</table>\r\n								</td>\r\n							</tr>\r\n							<tr>\r\n								<td style=\"border-width:0; padding:20px 10px 10px 10px; text-align:center; vertical-align:middle\">\r\n									<p style=\"color:#777; font-size: 12px; line-height:20px; padding: 0; margin: 0 0 10px; text-align: left;\">If you&rsquo;re having trouble with the button above, copy and paste the URL below into your web browser. <a href=\"http://localhost:4200/login/\" style=\"cursor:pointer;\">click here</a></p>\r\n								</td>\r\n							</tr>\r\n							<tr>\r\n								<td style=\"background-color:#a6ce39; background:#a6ce39; border-top:1px solid #cccccc; color:#000; font-size:13px; padding:7px; text-align:center\">Copyright &copy; 2018 OpenEyes Software Solutions</td>\r\n							</tr>\r\n						</tbody>\r\n					</table>\r\n					', '2019-01-31 06:18:53'),
(4, 0, 'myopeneyes3937@gmail.com', '', '', 'mitesh.patel@theopeneyes.in', 'Sudhir Parmar\'s Employee evaluation', '\r\n\r\n                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:1px solid #333333; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto; width:600px\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td style=\"background-color:#fff; background:#fff; padding:10px 10px 5px 10px; text-align:center\"><img alt=\"\" style=\"width:130px\" src=\"https://devbyopeneyes.com/emailer_images/oess.png\" /></td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"border-width:0; padding:20px 10px 10px 10px; text-align:center\">\r\n\r\n                                    <p style=\"color:#000; font-size: 18px; line-height: 18px; font-weight: bold; padding: 0; margin: 0 0 10px;\">Please provide feedback for below employee.</p>\r\n\r\n                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"margin:20px 0; width:100%; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto;\">\r\n                                        <tbody>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Employee Name</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">Sudhir Parmar</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Evaluation Type:</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">Yearly Evaluation</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Scheduled Evaluation Date</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">02/05/2019 18:00</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Note</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">This is note for Evaluators</td>\r\n                                            </tr>\r\n                                        </tbody>\r\n                                    </table>\r\n                                    <p style=\"color:#000; font-size: 14px; line-height:20px; padding: 0; margin:20px 0 0;\">Use the button below to give evaluation:</p>\r\n                                    </td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"border-width:0; padding:0; text-align:center; vertical-align:middle\">\r\n                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:0; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto\">\r\n                                        <tbody>\r\n                                            <tr>\r\n                                                <td style=\"background-color:#0061AF; background:#0061AF; border-radius:4px; border-width:0; clear:both; color:#ffffff; font-size:14px; line-height:13px; opacity:1; padding:10px; text-align:center; text-decoration:none; width:130px\"><a href=\"http://localhost:4200/dashboard/\" style=\"color:#fff; text-decoration:none;\">Give Evaluation</a></td>\r\n                                            </tr>\r\n                                        </tbody>\r\n                                    </table>\r\n                                    </td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"border-width:0; padding:20px 10px 10px 10px; text-align:center; vertical-align:middle\">\r\n                                        <p style=\"color:#777; font-size: 12px; line-height:20px; padding: 0; margin: 0 0 10px; text-align: left;\">If you&rsquo;re having trouble with the button above, copy and paste the URL below into your web browser. <a href=\"http://localhost:4200/dashboard/\" style=\"cursor:pointer;\">click here</a></p>\r\n                                    </td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"background-color:#a6ce39; background:#a6ce39; border-top:1px solid #cccccc; color:#000; font-size:13px; padding:7px; text-align:center\">Copyright &copy; 2018 OpenEyes Software Solutions</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                    ', '2019-01-31 07:46:56'),
(5, 0, 'myopeneyes3937@gmail.com', '', '', 'sparmar@theopeneyes.in', 'Self-Employee evaluation', '\r\n\r\n                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:1px solid #333333; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto; width:600px\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td style=\"background-color:#fff; background:#fff; padding:10px 10px 5px 10px; text-align:center\"><img alt=\"\" style=\"width:130px\" src=\"https://devbyopeneyes.com/emailer_images/oess.png\" /></td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"border-width:0; padding:20px 10px 10px 10px; text-align:center\">\r\n\r\n                                    <p style=\"color:#000; font-size: 18px; line-height: 18px; font-weight: bold; padding: 0; margin: 0 0 10px;\">Congratulations! Please give feedback for below evaluation.</p>\r\n\r\n                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"margin:20px 0; width:100%; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto;\">\r\n                                        <tbody>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Evaluation Type</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">Yearly Evaluation</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Scheduled Evaluation Date</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">02/05/2019 18:00</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Note</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">This is note for Employee</td>\r\n                                            </tr>\r\n                                        </tbody>\r\n                                    </table>\r\n                                    <p style=\"color:#000; font-size: 14px; line-height:20px; padding: 0; margin:20px 0 0;\">Use the button below to give evaluation:</p>\r\n                                    </td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"border-width:0; padding:0; text-align:center; vertical-align:middle\">\r\n                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:0; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto\">\r\n                                        <tbody>\r\n                                            <tr>\r\n                                                <td style=\"background-color:#0061AF; background:#0061AF; border-radius:4px; border-width:0; clear:both; color:#ffffff; font-size:14px; line-height:13px; opacity:1; padding:10px; text-align:center; text-decoration:none; width:130px\"><a href=\"http://localhost:4200/dashboard/\" style=\"color:#fff; text-decoration:none;\">Give Evaluation</a></td>\r\n                                            </tr>\r\n                                        </tbody>\r\n                                    </table>\r\n                                    </td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"border-width:0; padding:20px 10px 10px 10px; text-align:center; vertical-align:middle\">\r\n                                        <p style=\"color:#777; font-size: 12px; line-height:20px; padding: 0; margin: 0 0 10px; text-align: left;\">If you&rsquo;re having trouble with the button above, copy and paste the URL below into your web browser. <a href=\"http://localhost:4200/dashboard/\" style=\"cursor:pointer;\">click here</a></p>\r\n                                    </td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"background-color:#a6ce39; background:#a6ce39; border-top:1px solid #cccccc; color:#000; font-size:13px; padding:7px; text-align:center\">Copyright &copy; 2018 OpenEyes Software Solutions</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        ', '2019-01-31 07:47:01'),
(6, 0, 'myopeneyes3937@gmail.com', '', '', 'uttam.bhut@theopeneyes.in', 'Sudhir Parmar\'s Employee evaluation', '\r\n\r\n                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:1px solid #333333; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto; width:600px\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td style=\"background-color:#fff; background:#fff; padding:10px 10px 5px 10px; text-align:center\"><img alt=\"\" style=\"width:130px\" src=\"https://devbyopeneyes.com/emailer_images/oess.png\" /></td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"border-width:0; padding:20px 10px 10px 10px; text-align:center\">\r\n\r\n                                    <p style=\"color:#000; font-size: 18px; line-height: 18px; font-weight: bold; padding: 0; margin: 0 0 10px;\">Please provide feedback for below employee.</p>\r\n\r\n                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"margin:20px 0; width:100%; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto;\">\r\n                                        <tbody>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Employee Name</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">Sudhir Parmar</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Evaluation Type:</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">Yearly Evaluation</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Scheduled Evaluation Date</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">02/05/2019 18:00</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Note</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">This is note for Evaluators</td>\r\n                                            </tr>\r\n                                        </tbody>\r\n                                    </table>\r\n                                    <p style=\"color:#000; font-size: 14px; line-height:20px; padding: 0; margin:20px 0 0;\">Use the button below to give evaluation:</p>\r\n                                    </td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"border-width:0; padding:0; text-align:center; vertical-align:middle\">\r\n                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:0; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto\">\r\n                                        <tbody>\r\n                                            <tr>\r\n                                                <td style=\"background-color:#0061AF; background:#0061AF; border-radius:4px; border-width:0; clear:both; color:#ffffff; font-size:14px; line-height:13px; opacity:1; padding:10px; text-align:center; text-decoration:none; width:130px\"><a href=\"http://localhost:4200/dashboard/\" style=\"color:#fff; text-decoration:none;\">Give Evaluation</a></td>\r\n                                            </tr>\r\n                                        </tbody>\r\n                                    </table>\r\n                                    </td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"border-width:0; padding:20px 10px 10px 10px; text-align:center; vertical-align:middle\">\r\n                                        <p style=\"color:#777; font-size: 12px; line-height:20px; padding: 0; margin: 0 0 10px; text-align: left;\">If you&rsquo;re having trouble with the button above, copy and paste the URL below into your web browser. <a href=\"http://localhost:4200/dashboard/\" style=\"cursor:pointer;\">click here</a></p>\r\n                                    </td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"background-color:#a6ce39; background:#a6ce39; border-top:1px solid #cccccc; color:#000; font-size:13px; padding:7px; text-align:center\">Copyright &copy; 2018 OpenEyes Software Solutions</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                    ', '2019-01-31 07:47:07'),
(7, 0, 'myopeneyes3937@gmail.com', '', '', 'it@theopeneyes.com', 'Uttam Bhut\'s Employee evaluation', '\r\n\r\n                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:1px solid #333333; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto; width:600px\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td style=\"background-color:#fff; background:#fff; padding:10px 10px 5px 10px; text-align:center\"><img alt=\"\" style=\"width:130px\" src=\"https://devbyopeneyes.com/emailer_images/oess.png\" /></td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"border-width:0; padding:20px 10px 10px 10px; text-align:center\">\r\n\r\n                                    <p style=\"color:#000; font-size: 18px; line-height: 18px; font-weight: bold; padding: 0; margin: 0 0 10px;\">Please provide feedback for below employee.</p>\r\n\r\n                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"margin:20px 0; width:100%; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto;\">\r\n                                        <tbody>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Employee Name</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">Uttam Bhut</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Evaluation Type:</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">Yearly Evaluation</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Scheduled Evaluation Date</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">02/27/2019 08:25</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Expiration Date</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">02/26/2019 08:25</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Note</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">Not mentioned!</td>\r\n                                            </tr>\r\n                                        </tbody>\r\n                                    </table>\r\n                                    <p style=\"color:#000; font-size: 14px; line-height:20px; padding: 0; margin:20px 0 0;\">Use the button below to give evaluation:</p>\r\n                                    </td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"border-width:0; padding:0; text-align:center; vertical-align:middle\">\r\n                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:0; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto\">\r\n                                        <tbody>\r\n                                            <tr>\r\n                                                <td style=\"background-color:#0061AF; background:#0061AF; border-radius:4px; border-width:0; clear:both; color:#ffffff; font-size:14px; line-height:13px; opacity:1; padding:10px; text-align:center; text-decoration:none; width:130px\"><a href=\"http://localhost:4200/dashboard/\" style=\"color:#fff; text-decoration:none;\">Give Evaluation</a></td>\r\n                                            </tr>\r\n                                        </tbody>\r\n                                    </table>\r\n                                    </td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"border-width:0; padding:20px 10px 10px 10px; text-align:center; vertical-align:middle\">\r\n                                        <p style=\"color:#777; font-size: 12px; line-height:20px; padding: 0; margin: 0 0 10px; text-align: left;\">If you&rsquo;re having trouble with the button above, copy and paste the URL below into your web browser. <a href=\"http://localhost:4200/dashboard/\" style=\"cursor:pointer;\">click here</a></p>\r\n                                    </td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"background-color:#a6ce39; background:#a6ce39; border-top:1px solid #cccccc; color:#000; font-size:13px; padding:7px; text-align:center\">Copyright &copy; 2019 OpenEyes Software Solutions</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                    ', '2019-02-25 11:41:23'),
(8, 0, 'myopeneyes3937@gmail.com', '', '', 'uttam.bhut@theopeneyes.in', 'Self-Employee evaluation', '\r\n\r\n                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:1px solid #333333; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto; width:600px\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td style=\"background-color:#fff; background:#fff; padding:10px 10px 5px 10px; text-align:center\"><img alt=\"\" style=\"width:130px\" src=\"https://devbyopeneyes.com/emailer_images/oess.png\" /></td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"border-width:0; padding:20px 10px 10px 10px; text-align:center\">\r\n\r\n                                    <p style=\"color:#000; font-size: 18px; line-height: 18px; font-weight: bold; padding: 0; margin: 0 0 10px;\">Congratulations! Please give feedback for below evaluation.</p>\r\n\r\n                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"margin:20px 0; width:100%; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto;\">\r\n                                        <tbody>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Evaluation Type</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">Yearly Evaluation</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Scheduled Evaluation Date</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">02/27/2019 08:25</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Expiration Date</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">02/26/2019 08:25</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Note</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">Not mentioned!</td>\r\n                                            </tr>\r\n                                        </tbody>\r\n                                    </table>\r\n                                    <p style=\"color:#000; font-size: 14px; line-height:20px; padding: 0; margin:20px 0 0;\">Use the button below to give evaluation:</p>\r\n                                    </td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"border-width:0; padding:0; text-align:center; vertical-align:middle\">\r\n                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:0; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto\">\r\n                                        <tbody>\r\n                                            <tr>\r\n                                                <td style=\"background-color:#0061AF; background:#0061AF; border-radius:4px; border-width:0; clear:both; color:#ffffff; font-size:14px; line-height:13px; opacity:1; padding:10px; text-align:center; text-decoration:none; width:130px\"><a href=\"http://localhost:4200/dashboard/\" style=\"color:#fff; text-decoration:none;\">Give Evaluation</a></td>\r\n                                            </tr>\r\n                                        </tbody>\r\n                                    </table>\r\n                                    </td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"border-width:0; padding:20px 10px 10px 10px; text-align:center; vertical-align:middle\">\r\n                                        <p style=\"color:#777; font-size: 12px; line-height:20px; padding: 0; margin: 0 0 10px; text-align: left;\">If you&rsquo;re having trouble with the button above, copy and paste the URL below into your web browser. <a href=\"http://localhost:4200/dashboard/\" style=\"cursor:pointer;\">click here</a></p>\r\n                                    </td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"background-color:#a6ce39; background:#a6ce39; border-top:1px solid #cccccc; color:#000; font-size:13px; padding:7px; text-align:center\">Copyright &copy; 2019 OpenEyes Software Solutions</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        ', '2019-02-25 11:41:28'),
(9, 0, 'myopeneyes3937@gmail.com', '', '', 'uttam.bhut@theopeneyes.in', 'Employee Evaluation', '\r\n					<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:1px solid #333333; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto; width:600px\">\r\n						<tbody>\r\n							<tr>\r\n								<td style=\"background-color:#fff; background:#fff; padding:10px 10px 5px 10px; text-align:center\"><img alt=\"\" style=\"width:130px\" src=\"https://devbyopeneyes.com/emailer_images/oess.png\" /></td>\r\n							</tr>\r\n							<tr>\r\n								<td style=\"border-width:0; padding:20px 10px 10px 10px; text-align:center\">\r\n								<p style=\"color:#000; font-size: 25px; line-height: 25px; font-weight: bold;padding: 0; margin: 0 0 10px;\">Welcome, <strong>Uttam Bhut!</strong></p>\r\n\r\n								<p style=\"color:#000; font-size: 18px; line-height: 18px; font-weight: bold; padding: 0; margin: 0 0 10px;\">Find your login credential for Employee Evaluation below:</p>\r\n\r\n								<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"margin:20px 0; width:100%; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto;\">\r\n									<tbody>\r\n										<tr>\r\n											<td style=\"padding:5px; text-align:right; width:35%\">Login Id</td>\r\n											<td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n											<td style=\"padding:5px; text-align:left; width:48%\">uttam.bhut@theopeneyes.in</td>\r\n										</tr>\r\n										<tr>\r\n											<td style=\"padding:5px; text-align:right; width:35%\">Password</td>\r\n											<td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n											<td style=\"padding:5px; text-align:left; width:48%\">h4A9GS2S</td>\r\n										</tr>\r\n										<tr>\r\n											<td style=\"padding:5px; text-align:right; width:35%\">Your Line Manager</td>\r\n											<td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n											<td style=\"padding:5px; text-align:left; width:48%\">IT Developer</td>\r\n										</tr>\r\n									</tbody>\r\n								</table>\r\n								<p style=\"color:#000; font-size: 14px; line-height:20px; padding: 0; margin:20px 0 0;\">Use the button below to access your account:</p>\r\n								</td>\r\n							</tr>\r\n							<tr>\r\n								<td style=\"border-width:0; padding:0; text-align:center; vertical-align:middle\">\r\n								<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:0; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto\">\r\n									<tbody>\r\n										<tr>\r\n											<td style=\"background-color:#0061AF; background:#0061AF; border-radius:4px; border-width:0; clear:both; color:#ffffff; font-size:14px; line-height:13px; opacity:1; padding:10px; text-align:center; text-decoration:none; width:130px\"><a href=\"http://localhost:4200/login/\" style=\"color:#fff; text-decoration:none;\">Login to Account</a></td>\r\n										</tr>\r\n									</tbody>\r\n								</table>\r\n								</td>\r\n							</tr>\r\n							<tr>\r\n								<td style=\"border-width:0; padding:20px 10px 10px 10px; text-align:center; vertical-align:middle\">\r\n									<p style=\"color:#777; font-size: 12px; line-height:20px; padding: 0; margin: 0 0 10px; text-align: left;\">If you&rsquo;re having trouble with the button above, copy and paste the URL below into your web browser. <a href=\"http://localhost:4200/login/\" style=\"cursor:pointer;\">click here</a></p>\r\n								</td>\r\n							</tr>\r\n							<tr>\r\n								<td style=\"background-color:#a6ce39; background:#a6ce39; border-top:1px solid #cccccc; color:#000; font-size:13px; padding:7px; text-align:center\">Copyright &copy; 2019 OpenEyes Software Solutions</td>\r\n							</tr>\r\n						</tbody>\r\n					</table>\r\n					', '2019-02-27 10:59:10'),
(10, 0, 'myopeneyes3937@gmail.com', '', '', 'sparmar@theopeneyes.in', 'Employee Evaluation', '\r\n					<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:1px solid #333333; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto; width:600px\">\r\n						<tbody>\r\n							<tr>\r\n								<td style=\"background-color:#fff; background:#fff; padding:10px 10px 5px 10px; text-align:center\"><img alt=\"\" style=\"width:130px\" src=\"https://devbyopeneyes.com/emailer_images/oess.png\" /></td>\r\n							</tr>\r\n							<tr>\r\n								<td style=\"border-width:0; padding:20px 10px 10px 10px; text-align:center\">\r\n								<p style=\"color:#000; font-size: 25px; line-height: 25px; font-weight: bold;padding: 0; margin: 0 0 10px;\">Welcome, <strong>Sudhir Parmar!</strong></p>\r\n\r\n								<p style=\"color:#000; font-size: 18px; line-height: 18px; font-weight: bold; padding: 0; margin: 0 0 10px;\">Find your login credential for Employee Evaluation below:</p>\r\n\r\n								<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"margin:20px 0; width:100%; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto;\">\r\n									<tbody>\r\n										<tr>\r\n											<td style=\"padding:5px; text-align:right; width:35%\">Login Id</td>\r\n											<td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n											<td style=\"padding:5px; text-align:left; width:48%\">sparmar@theopeneyes.in</td>\r\n										</tr>\r\n										<tr>\r\n											<td style=\"padding:5px; text-align:right; width:35%\">Password</td>\r\n											<td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n											<td style=\"padding:5px; text-align:left; width:48%\">2o3djXDQ</td>\r\n										</tr>\r\n										<tr>\r\n											<td style=\"padding:5px; text-align:right; width:35%\">Your Line Manager</td>\r\n											<td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n											<td style=\"padding:5px; text-align:left; width:48%\">Uttam Bhut</td>\r\n										</tr>\r\n									</tbody>\r\n								</table>\r\n								<p style=\"color:#000; font-size: 14px; line-height:20px; padding: 0; margin:20px 0 0;\">Use the button below to access your account:</p>\r\n								</td>\r\n							</tr>\r\n							<tr>\r\n								<td style=\"border-width:0; padding:0; text-align:center; vertical-align:middle\">\r\n								<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:0; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto\">\r\n									<tbody>\r\n										<tr>\r\n											<td style=\"background-color:#0061AF; background:#0061AF; border-radius:4px; border-width:0; clear:both; color:#ffffff; font-size:14px; line-height:13px; opacity:1; padding:10px; text-align:center; text-decoration:none; width:130px\"><a href=\"http://localhost:4200/login/\" style=\"color:#fff; text-decoration:none;\">Login to Account</a></td>\r\n										</tr>\r\n									</tbody>\r\n								</table>\r\n								</td>\r\n							</tr>\r\n							<tr>\r\n								<td style=\"border-width:0; padding:20px 10px 10px 10px; text-align:center; vertical-align:middle\">\r\n									<p style=\"color:#777; font-size: 12px; line-height:20px; padding: 0; margin: 0 0 10px; text-align: left;\">If you&rsquo;re having trouble with the button above, copy and paste the URL below into your web browser. <a href=\"http://localhost:4200/login/\" style=\"cursor:pointer;\">click here</a></p>\r\n								</td>\r\n							</tr>\r\n							<tr>\r\n								<td style=\"background-color:#a6ce39; background:#a6ce39; border-top:1px solid #cccccc; color:#000; font-size:13px; padding:7px; text-align:center\">Copyright &copy; 2019 OpenEyes Software Solutions</td>\r\n							</tr>\r\n						</tbody>\r\n					</table>\r\n					', '2019-02-27 11:01:09');
INSERT INTO `tblemaillog` (`EmailLogId`, `TokenId`, `From`, `Cc`, `Bcc`, `To`, `Subject`, `MessageBody`, `CreatedOn`) VALUES
(11, 0, 'myopeneyes3937@gmail.com', '', '', 'uttam.bhut@theopeneyes.in', 'Sudhir Parmar\'s Employee evaluation', '\r\n\r\n                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:1px solid #333333; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto; width:600px\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td style=\"background-color:#fff; background:#fff; padding:10px 10px 5px 10px; text-align:center\"><img alt=\"\" style=\"width:130px\" src=\"https://devbyopeneyes.com/emailer_images/oess.png\" /></td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"border-width:0; padding:20px 10px 10px 10px; text-align:center\">\r\n\r\n                                    <p style=\"color:#000; font-size: 18px; line-height: 18px; font-weight: bold; padding: 0; margin: 0 0 10px;\">Please provide feedback for below employee.</p>\r\n\r\n                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"margin:20px 0; width:100%; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto;\">\r\n                                        <tbody>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Employee Name</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">Sudhir Parmar</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Evaluation Type:</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">Monthly Evaluation</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Scheduled Evaluation Date</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">03/03/2019 10:30</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Expiration Date</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">02/28/2019 16:30</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Note</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">Not mentioned!</td>\r\n                                            </tr>\r\n                                        </tbody>\r\n                                    </table>\r\n                                    <p style=\"color:#000; font-size: 14px; line-height:20px; padding: 0; margin:20px 0 0;\">Use the button below to give evaluation:</p>\r\n                                    </td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"border-width:0; padding:0; text-align:center; vertical-align:middle\">\r\n                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:0; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto\">\r\n                                        <tbody>\r\n                                            <tr>\r\n                                                <td style=\"background-color:#0061AF; background:#0061AF; border-radius:4px; border-width:0; clear:both; color:#ffffff; font-size:14px; line-height:13px; opacity:1; padding:10px; text-align:center; text-decoration:none; width:130px\"><a href=\"http://localhost:4200/dashboard/\" style=\"color:#fff; text-decoration:none;\">Give Evaluation</a></td>\r\n                                            </tr>\r\n                                        </tbody>\r\n                                    </table>\r\n                                    </td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"border-width:0; padding:20px 10px 10px 10px; text-align:center; vertical-align:middle\">\r\n                                        <p style=\"color:#777; font-size: 12px; line-height:20px; padding: 0; margin: 0 0 10px; text-align: left;\">If you&rsquo;re having trouble with the button above, copy and paste the URL below into your web browser. <a href=\"http://localhost:4200/dashboard/\" style=\"cursor:pointer;\">click here</a></p>\r\n                                    </td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"background-color:#a6ce39; background:#a6ce39; border-top:1px solid #cccccc; color:#000; font-size:13px; padding:7px; text-align:center\">Copyright &copy; 2019 OpenEyes Software Solutions</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                    ', '2019-02-27 11:02:07'),
(12, 0, 'myopeneyes3937@gmail.com', '', '', 'sparmar@theopeneyes.in', 'Self-Employee evaluation', '\r\n\r\n                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:1px solid #333333; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto; width:600px\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td style=\"background-color:#fff; background:#fff; padding:10px 10px 5px 10px; text-align:center\"><img alt=\"\" style=\"width:130px\" src=\"https://devbyopeneyes.com/emailer_images/oess.png\" /></td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"border-width:0; padding:20px 10px 10px 10px; text-align:center\">\r\n\r\n                                    <p style=\"color:#000; font-size: 18px; line-height: 18px; font-weight: bold; padding: 0; margin: 0 0 10px;\">Congratulations! Please give feedback for below evaluation.</p>\r\n\r\n                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"margin:20px 0; width:100%; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto;\">\r\n                                        <tbody>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Evaluation Type</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">Monthly Evaluation</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Scheduled Evaluation Date</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">03/03/2019 10:30</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Expiration Date</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">02/28/2019 16:30</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Note</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">Not mentioned!</td>\r\n                                            </tr>\r\n                                        </tbody>\r\n                                    </table>\r\n                                    <p style=\"color:#000; font-size: 14px; line-height:20px; padding: 0; margin:20px 0 0;\">Use the button below to give evaluation:</p>\r\n                                    </td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"border-width:0; padding:0; text-align:center; vertical-align:middle\">\r\n                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:0; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto\">\r\n                                        <tbody>\r\n                                            <tr>\r\n                                                <td style=\"background-color:#0061AF; background:#0061AF; border-radius:4px; border-width:0; clear:both; color:#ffffff; font-size:14px; line-height:13px; opacity:1; padding:10px; text-align:center; text-decoration:none; width:130px\"><a href=\"http://localhost:4200/dashboard/\" style=\"color:#fff; text-decoration:none;\">Give Evaluation</a></td>\r\n                                            </tr>\r\n                                        </tbody>\r\n                                    </table>\r\n                                    </td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"border-width:0; padding:20px 10px 10px 10px; text-align:center; vertical-align:middle\">\r\n                                        <p style=\"color:#777; font-size: 12px; line-height:20px; padding: 0; margin: 0 0 10px; text-align: left;\">If you&rsquo;re having trouble with the button above, copy and paste the URL below into your web browser. <a href=\"http://localhost:4200/dashboard/\" style=\"cursor:pointer;\">click here</a></p>\r\n                                    </td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"background-color:#a6ce39; background:#a6ce39; border-top:1px solid #cccccc; color:#000; font-size:13px; padding:7px; text-align:center\">Copyright &copy; 2019 OpenEyes Software Solutions</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        ', '2019-02-27 11:02:13'),
(13, 0, 'myopeneyes3937@gmail.com', '', '', 'it@theopeneyes.com', 'Uttam Bhut\'s Employee evaluation', '\r\n\r\n                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:1px solid #333333; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto; width:600px\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td style=\"background-color:#fff; background:#fff; padding:10px 10px 5px 10px; text-align:center\"><img alt=\"\" style=\"width:130px\" src=\"https://devbyopeneyes.com/emailer_images/oess.png\" /></td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"border-width:0; padding:20px 10px 10px 10px; text-align:center\">\r\n\r\n                                    <p style=\"color:#000; font-size: 18px; line-height: 18px; font-weight: bold; padding: 0; margin: 0 0 10px;\">Please provide feedback for below employee.</p>\r\n\r\n                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"margin:20px 0; width:100%; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto;\">\r\n                                        <tbody>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Employee Name</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">Uttam Bhut</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Evaluation Type:</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">Yearly Evaluation</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Scheduled Evaluation Date</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">03/09/2019 16:30</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Expiration Date</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">03/01/2019 16:30</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Note</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">Not mentioned!</td>\r\n                                            </tr>\r\n                                        </tbody>\r\n                                    </table>\r\n                                    <p style=\"color:#000; font-size: 14px; line-height:20px; padding: 0; margin:20px 0 0;\">Use the button below to give evaluation:</p>\r\n                                    </td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"border-width:0; padding:0; text-align:center; vertical-align:middle\">\r\n                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:0; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto\">\r\n                                        <tbody>\r\n                                            <tr>\r\n                                                <td style=\"background-color:#0061AF; background:#0061AF; border-radius:4px; border-width:0; clear:both; color:#ffffff; font-size:14px; line-height:13px; opacity:1; padding:10px; text-align:center; text-decoration:none; width:130px\"><a href=\"http://localhost:4200/dashboard/\" style=\"color:#fff; text-decoration:none;\">Give Evaluation</a></td>\r\n                                            </tr>\r\n                                        </tbody>\r\n                                    </table>\r\n                                    </td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"border-width:0; padding:20px 10px 10px 10px; text-align:center; vertical-align:middle\">\r\n                                        <p style=\"color:#777; font-size: 12px; line-height:20px; padding: 0; margin: 0 0 10px; text-align: left;\">If you&rsquo;re having trouble with the button above, copy and paste the URL below into your web browser. <a href=\"http://localhost:4200/dashboard/\" style=\"cursor:pointer;\">click here</a></p>\r\n                                    </td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"background-color:#a6ce39; background:#a6ce39; border-top:1px solid #cccccc; color:#000; font-size:13px; padding:7px; text-align:center\">Copyright &copy; 2019 OpenEyes Software Solutions</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                    ', '2019-02-27 11:04:05'),
(14, 0, 'myopeneyes3937@gmail.com', '', '', 'uttam.bhut@theopeneyes.in', 'Self-Employee evaluation', '\r\n\r\n                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:1px solid #333333; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto; width:600px\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td style=\"background-color:#fff; background:#fff; padding:10px 10px 5px 10px; text-align:center\"><img alt=\"\" style=\"width:130px\" src=\"https://devbyopeneyes.com/emailer_images/oess.png\" /></td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"border-width:0; padding:20px 10px 10px 10px; text-align:center\">\r\n\r\n                                    <p style=\"color:#000; font-size: 18px; line-height: 18px; font-weight: bold; padding: 0; margin: 0 0 10px;\">Congratulations! Please give feedback for below evaluation.</p>\r\n\r\n                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"margin:20px 0; width:100%; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto;\">\r\n                                        <tbody>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Evaluation Type</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">Yearly Evaluation</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Scheduled Evaluation Date</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">03/09/2019 16:30</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Expiration Date</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">03/01/2019 16:30</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Note</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">Not mentioned!</td>\r\n                                            </tr>\r\n                                        </tbody>\r\n                                    </table>\r\n                                    <p style=\"color:#000; font-size: 14px; line-height:20px; padding: 0; margin:20px 0 0;\">Use the button below to give evaluation:</p>\r\n                                    </td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"border-width:0; padding:0; text-align:center; vertical-align:middle\">\r\n                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:0; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto\">\r\n                                        <tbody>\r\n                                            <tr>\r\n                                                <td style=\"background-color:#0061AF; background:#0061AF; border-radius:4px; border-width:0; clear:both; color:#ffffff; font-size:14px; line-height:13px; opacity:1; padding:10px; text-align:center; text-decoration:none; width:130px\"><a href=\"http://localhost:4200/dashboard/\" style=\"color:#fff; text-decoration:none;\">Give Evaluation</a></td>\r\n                                            </tr>\r\n                                        </tbody>\r\n                                    </table>\r\n                                    </td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"border-width:0; padding:20px 10px 10px 10px; text-align:center; vertical-align:middle\">\r\n                                        <p style=\"color:#777; font-size: 12px; line-height:20px; padding: 0; margin: 0 0 10px; text-align: left;\">If you&rsquo;re having trouble with the button above, copy and paste the URL below into your web browser. <a href=\"http://localhost:4200/dashboard/\" style=\"cursor:pointer;\">click here</a></p>\r\n                                    </td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"background-color:#a6ce39; background:#a6ce39; border-top:1px solid #cccccc; color:#000; font-size:13px; padding:7px; text-align:center\">Copyright &copy; 2019 OpenEyes Software Solutions</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        ', '2019-02-27 11:04:09'),
(15, 0, 'myopeneyes3937@gmail.com', '', '', 'it@theopeneyes.com', 'Sudhir Parmar\'s Employee evaluation', '\r\n\r\n                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:1px solid #333333; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto; width:600px\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td style=\"background-color:#fff; background:#fff; padding:10px 10px 5px 10px; text-align:center\"><img alt=\"\" style=\"width:130px\" src=\"https://devbyopeneyes.com/emailer_images/oess.png\" /></td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"border-width:0; padding:20px 10px 10px 10px; text-align:center\">\r\n\r\n                                    <p style=\"color:#000; font-size: 18px; line-height: 18px; font-weight: bold; padding: 0; margin: 0 0 10px;\">Please provide feedback for below employee.</p>\r\n\r\n                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"margin:20px 0; width:100%; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto;\">\r\n                                        <tbody>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Employee Name</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">Sudhir Parmar</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Evaluation Type:</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">Yearly Evaluation</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Scheduled Evaluation Date</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">03/02/2019 17:55</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Expiration Date</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">03/01/2019 16:50</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Note</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">Not mentioned!</td>\r\n                                            </tr>\r\n                                        </tbody>\r\n                                    </table>\r\n                                    <p style=\"color:#000; font-size: 14px; line-height:20px; padding: 0; margin:20px 0 0;\">Use the button below to give evaluation:</p>\r\n                                    </td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"border-width:0; padding:0; text-align:center; vertical-align:middle\">\r\n                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:0; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto\">\r\n                                        <tbody>\r\n                                            <tr>\r\n                                                <td style=\"background-color:#0061AF; background:#0061AF; border-radius:4px; border-width:0; clear:both; color:#ffffff; font-size:14px; line-height:13px; opacity:1; padding:10px; text-align:center; text-decoration:none; width:130px\"><a href=\"http://localhost:4200/dashboard/\" style=\"color:#fff; text-decoration:none;\">Give Evaluation</a></td>\r\n                                            </tr>\r\n                                        </tbody>\r\n                                    </table>\r\n                                    </td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"border-width:0; padding:20px 10px 10px 10px; text-align:center; vertical-align:middle\">\r\n                                        <p style=\"color:#777; font-size: 12px; line-height:20px; padding: 0; margin: 0 0 10px; text-align: left;\">If you&rsquo;re having trouble with the button above, copy and paste the URL below into your web browser. <a href=\"http://localhost:4200/dashboard/\" style=\"cursor:pointer;\">click here</a></p>\r\n                                    </td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"background-color:#a6ce39; background:#a6ce39; border-top:1px solid #cccccc; color:#000; font-size:13px; padding:7px; text-align:center\">Copyright &copy; 2019 OpenEyes Software Solutions</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                    ', '2019-02-27 12:25:41'),
(16, 0, 'myopeneyes3937@gmail.com', '', '', 'sparmar@theopeneyes.in', 'Self-Employee evaluation', '\r\n\r\n                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:1px solid #333333; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto; width:600px\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td style=\"background-color:#fff; background:#fff; padding:10px 10px 5px 10px; text-align:center\"><img alt=\"\" style=\"width:130px\" src=\"https://devbyopeneyes.com/emailer_images/oess.png\" /></td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"border-width:0; padding:20px 10px 10px 10px; text-align:center\">\r\n\r\n                                    <p style=\"color:#000; font-size: 18px; line-height: 18px; font-weight: bold; padding: 0; margin: 0 0 10px;\">Congratulations! Please give feedback for below evaluation.</p>\r\n\r\n                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"margin:20px 0; width:100%; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto;\">\r\n                                        <tbody>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Evaluation Type</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">Yearly Evaluation</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Scheduled Evaluation Date</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">03/02/2019 17:55</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Expiration Date</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">03/01/2019 16:50</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Note</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">Not mentioned!</td>\r\n                                            </tr>\r\n                                        </tbody>\r\n                                    </table>\r\n                                    <p style=\"color:#000; font-size: 14px; line-height:20px; padding: 0; margin:20px 0 0;\">Use the button below to give evaluation:</p>\r\n                                    </td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"border-width:0; padding:0; text-align:center; vertical-align:middle\">\r\n                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:0; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto\">\r\n                                        <tbody>\r\n                                            <tr>\r\n                                                <td style=\"background-color:#0061AF; background:#0061AF; border-radius:4px; border-width:0; clear:both; color:#ffffff; font-size:14px; line-height:13px; opacity:1; padding:10px; text-align:center; text-decoration:none; width:130px\"><a href=\"http://localhost:4200/dashboard/\" style=\"color:#fff; text-decoration:none;\">Give Evaluation</a></td>\r\n                                            </tr>\r\n                                        </tbody>\r\n                                    </table>\r\n                                    </td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"border-width:0; padding:20px 10px 10px 10px; text-align:center; vertical-align:middle\">\r\n                                        <p style=\"color:#777; font-size: 12px; line-height:20px; padding: 0; margin: 0 0 10px; text-align: left;\">If you&rsquo;re having trouble with the button above, copy and paste the URL below into your web browser. <a href=\"http://localhost:4200/dashboard/\" style=\"cursor:pointer;\">click here</a></p>\r\n                                    </td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"background-color:#a6ce39; background:#a6ce39; border-top:1px solid #cccccc; color:#000; font-size:13px; padding:7px; text-align:center\">Copyright &copy; 2019 OpenEyes Software Solutions</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        ', '2019-02-27 12:25:45'),
(17, 0, 'myopeneyes3937@gmail.com', '', '', 'uttam.bhut@theopeneyes.in', 'Sudhir Parmar\'s Employee evaluation', '\r\n\r\n                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:1px solid #333333; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto; width:600px\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td style=\"background-color:#fff; background:#fff; padding:10px 10px 5px 10px; text-align:center\"><img alt=\"\" style=\"width:130px\" src=\"https://devbyopeneyes.com/emailer_images/oess.png\" /></td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"border-width:0; padding:20px 10px 10px 10px; text-align:center\">\r\n\r\n                                    <p style=\"color:#000; font-size: 18px; line-height: 18px; font-weight: bold; padding: 0; margin: 0 0 10px;\">Please provide feedback for below employee.</p>\r\n\r\n                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"margin:20px 0; width:100%; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto;\">\r\n                                        <tbody>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Employee Name</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">Sudhir Parmar</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Evaluation Type:</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">Yearly Evaluation</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Scheduled Evaluation Date</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">03/02/2019 17:55</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Expiration Date</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">03/01/2019 16:50</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Note</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">Not mentioned!</td>\r\n                                            </tr>\r\n                                        </tbody>\r\n                                    </table>\r\n                                    <p style=\"color:#000; font-size: 14px; line-height:20px; padding: 0; margin:20px 0 0;\">Use the button below to give evaluation:</p>\r\n                                    </td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"border-width:0; padding:0; text-align:center; vertical-align:middle\">\r\n                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:0; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto\">\r\n                                        <tbody>\r\n                                            <tr>\r\n                                                <td style=\"background-color:#0061AF; background:#0061AF; border-radius:4px; border-width:0; clear:both; color:#ffffff; font-size:14px; line-height:13px; opacity:1; padding:10px; text-align:center; text-decoration:none; width:130px\"><a href=\"http://localhost:4200/dashboard/\" style=\"color:#fff; text-decoration:none;\">Give Evaluation</a></td>\r\n                                            </tr>\r\n                                        </tbody>\r\n                                    </table>\r\n                                    </td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"border-width:0; padding:20px 10px 10px 10px; text-align:center; vertical-align:middle\">\r\n                                        <p style=\"color:#777; font-size: 12px; line-height:20px; padding: 0; margin: 0 0 10px; text-align: left;\">If you&rsquo;re having trouble with the button above, copy and paste the URL below into your web browser. <a href=\"http://localhost:4200/dashboard/\" style=\"cursor:pointer;\">click here</a></p>\r\n                                    </td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"background-color:#a6ce39; background:#a6ce39; border-top:1px solid #cccccc; color:#000; font-size:13px; padding:7px; text-align:center\">Copyright &copy; 2019 OpenEyes Software Solutions</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                    ', '2019-02-27 12:25:48'),
(18, 0, 'myopeneyes3937@gmail.com', '', '', 'it@theopeneyes.com', 'Self-Employee evaluation', '\r\n\r\n                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:1px solid #333333; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto; width:600px\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td style=\"background-color:#fff; background:#fff; padding:10px 10px 5px 10px; text-align:center\"><img alt=\"\" style=\"width:130px\" src=\"https://devbyopeneyes.com/emailer_images/oess.png\" /></td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"border-width:0; padding:20px 10px 10px 10px; text-align:center\">\r\n\r\n                                    <p style=\"color:#000; font-size: 18px; line-height: 18px; font-weight: bold; padding: 0; margin: 0 0 10px;\">Congratulations! Please give feedback for below evaluation.</p>\r\n\r\n                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"margin:20px 0; width:100%; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto;\">\r\n                                        <tbody>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Evaluation Type</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">Yearly Evaluation</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Scheduled Evaluation Date</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">02/28/2019 09:30</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Expiration Date</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">02/28/2019 00:00</td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td style=\"padding:5px; text-align:right; width:35%\">Note</td>\r\n                                                <td style=\"padding:5px; text-align:center; width:4%\">:</td>\r\n                                                <td style=\"padding:5px; text-align:left; width:48%\">Not mentioned!</td>\r\n                                            </tr>\r\n                                        </tbody>\r\n                                    </table>\r\n                                    <p style=\"color:#000; font-size: 14px; line-height:20px; padding: 0; margin:20px 0 0;\">Use the button below to give evaluation:</p>\r\n                                    </td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"border-width:0; padding:0; text-align:center; vertical-align:middle\">\r\n                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:0; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto\">\r\n                                        <tbody>\r\n                                            <tr>\r\n                                                <td style=\"background-color:#0061AF; background:#0061AF; border-radius:4px; border-width:0; clear:both; color:#ffffff; font-size:14px; line-height:13px; opacity:1; padding:10px; text-align:center; text-decoration:none; width:130px\"><a href=\"http://localhost:4200/dashboard/\" style=\"color:#fff; text-decoration:none;\">Give Evaluation</a></td>\r\n                                            </tr>\r\n                                        </tbody>\r\n                                    </table>\r\n                                    </td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"border-width:0; padding:20px 10px 10px 10px; text-align:center; vertical-align:middle\">\r\n                                        <p style=\"color:#777; font-size: 12px; line-height:20px; padding: 0; margin: 0 0 10px; text-align: left;\">If you&rsquo;re having trouble with the button above, copy and paste the URL below into your web browser. <a href=\"http://localhost:4200/dashboard/\" style=\"cursor:pointer;\">click here</a></p>\r\n                                    </td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"background-color:#a6ce39; background:#a6ce39; border-top:1px solid #cccccc; color:#000; font-size:13px; padding:7px; text-align:center\">Copyright &copy; 2019 OpenEyes Software Solutions</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        ', '2019-02-27 14:14:17');

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
(1, 3, 4, 'Answer 4', NULL, b'1', 1, '2019-02-27 11:46:55', 1, '2019-02-27 11:55:05'),
(2, 3, 6, 'Answer 6', NULL, b'1', 1, '2019-02-27 11:46:55', 1, '2019-02-27 11:55:05'),
(3, 3, 8, 'Answer 8', NULL, b'1', 1, '2019-02-27 11:46:55', 1, '2019-02-27 11:55:05'),
(4, 3, 9, 'Answer 9', NULL, b'1', 1, '2019-02-27 11:46:55', 1, '2019-02-27 11:55:05'),
(8, 4, 3, 'Answer 3', NULL, b'1', 11, '2019-02-27 11:47:46', 11, '2019-02-27 11:54:01'),
(9, 4, 6, 'Answer 6', NULL, b'1', 11, '2019-02-27 11:47:46', 11, '2019-02-27 11:54:01'),
(10, 4, 7, 'Answer 7', NULL, b'1', 11, '2019-02-27 11:47:46', 11, '2019-02-27 11:54:01'),
(11, 4, 9, 'Answer 9', NULL, b'1', 11, '2019-02-27 11:47:46', 11, '2019-02-27 11:54:01'),
(15, 1, 2, 'Answer 2', NULL, b'1', 11, '2019-02-27 11:47:57', 11, '2019-02-27 11:54:19'),
(16, 1, 5, 'Answer 5', NULL, b'1', 11, '2019-02-27 11:47:57', 11, '2019-02-27 11:54:19'),
(17, 1, 8, 'Answer 8', NULL, b'1', 11, '2019-02-27 11:47:57', 11, '2019-02-27 11:54:19'),
(18, 1, 9, 'Answer 9', NULL, b'1', 11, '2019-02-27 11:47:57', 11, '2019-02-27 11:54:19'),
(22, 2, 1, 'Answer 1', NULL, b'1', 12, '2019-02-27 11:48:48', 12, '2019-02-27 11:53:04'),
(23, 2, 5, 'Answer 5', NULL, b'1', 12, '2019-02-27 11:48:48', 12, '2019-02-27 11:53:04'),
(24, 2, 7, 'Answer 7', NULL, b'1', 12, '2019-02-27 11:48:48', 12, '2019-02-27 11:53:04'),
(25, 2, 9, 'Answer 9', NULL, b'1', 12, '2019-02-27 11:48:48', 12, '2019-02-27 11:53:04'),
(29, 5, 4, 'swert', NULL, b'1', 1, '2019-02-27 12:26:09', 1, '2019-02-27 13:57:18'),
(30, 5, 6, 'erty', NULL, b'1', 1, '2019-02-27 12:26:09', 1, '2019-02-27 13:57:18'),
(31, 5, 8, 'ert', NULL, b'1', 1, '2019-02-27 12:26:09', 1, '2019-02-27 13:57:18'),
(32, 5, 9, 'rty', NULL, b'1', 1, '2019-02-27 12:26:09', 1, '2019-02-27 13:57:18'),
(36, 8, 3, 'ert5yu', NULL, b'1', 1, '2019-02-27 14:14:22', 1, '2019-02-27 14:14:46'),
(37, 8, 6, 'rtyu', NULL, b'1', 1, '2019-02-27 14:14:22', 1, '2019-02-27 14:14:47'),
(38, 8, 7, 'ertyu', NULL, b'1', 1, '2019-02-27 14:14:22', 1, '2019-02-27 14:14:47'),
(39, 8, 9, 'frtyui', NULL, b'1', 1, '2019-02-27 14:14:22', 1, '2019-02-27 14:14:47'),
(40, 8, 11, '4', 'ssss', b'1', 1, '2019-02-27 14:14:22', 1, '2019-02-27 14:14:47');

-- --------------------------------------------------------

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
-- Dumping data for table `tblloginlog`
--

INSERT INTO `tblloginlog` (`LoginLogId`, `UserId`, `LoginType`, `UserAgent`, `IPAddress`, `CreatedOn`) VALUES
(1, 1, 1, NULL, NULL, '2019-01-25 11:09:01'),
(2, 1, 1, NULL, NULL, '2019-01-29 10:33:48'),
(3, 1, 0, NULL, NULL, '2019-01-29 10:40:31'),
(4, 9, 1, NULL, NULL, '2019-01-29 10:40:52'),
(5, 9, 0, NULL, NULL, '2019-01-29 11:10:04'),
(6, 1, 1, NULL, NULL, '2019-01-29 11:10:13'),
(7, 1, 1, NULL, NULL, '2019-01-29 11:47:14'),
(8, 1, 1, NULL, NULL, '2019-01-29 12:08:31'),
(9, 1, 1, NULL, NULL, '2019-01-30 07:10:53'),
(10, 1, 1, NULL, NULL, '2019-01-31 05:30:31'),
(11, 1, 0, NULL, NULL, '2019-01-31 05:30:55'),
(12, 2, 1, NULL, NULL, '2019-01-31 06:14:12'),
(13, 2, 0, NULL, NULL, '2019-01-31 06:14:35'),
(14, 1, 1, NULL, NULL, '2019-01-31 06:14:45'),
(15, 1, 0, NULL, NULL, '2019-01-31 06:16:32'),
(16, 1, 1, NULL, NULL, '2019-01-31 06:16:46'),
(17, 1, 0, NULL, NULL, '2019-01-31 06:23:29'),
(18, 10, 1, NULL, NULL, '2019-01-31 06:24:07'),
(19, 10, 0, NULL, NULL, '2019-01-31 06:25:34'),
(20, 1, 1, NULL, NULL, '2019-01-31 06:25:44'),
(21, 1, 1, NULL, NULL, '2019-01-31 07:05:32'),
(22, 1, 1, NULL, NULL, '2019-01-31 07:39:31'),
(23, 2, 1, NULL, NULL, '2019-01-31 08:06:59'),
(24, 1, 1, NULL, NULL, '2019-02-01 07:42:18'),
(25, 1, 1, NULL, NULL, '2019-02-25 10:47:25'),
(26, 1, 1, NULL, NULL, '2019-02-25 12:12:50'),
(27, 1, 1, NULL, NULL, '2019-02-26 12:59:45'),
(28, 1, 1, NULL, NULL, '2019-02-26 13:43:58'),
(29, 1, 1, NULL, NULL, '2019-02-27 05:47:13'),
(30, 1, 1, NULL, NULL, '2019-02-27 06:09:18'),
(31, 1, 1, NULL, NULL, '2019-02-27 06:12:10'),
(32, 1, 1, NULL, NULL, '2019-02-27 06:56:23'),
(33, 1, 1, NULL, NULL, '2019-02-27 07:22:41'),
(34, 1, 1, NULL, NULL, '2019-02-27 10:51:29'),
(35, 1, 1, NULL, NULL, '2019-02-27 11:41:17'),
(36, 1, 1, NULL, NULL, '2019-02-27 11:45:28'),
(37, 1, 0, NULL, NULL, '2019-02-27 11:47:17'),
(38, 11, 1, NULL, NULL, '2019-02-27 11:47:35'),
(39, 11, 0, NULL, NULL, '2019-02-27 11:48:21'),
(40, 12, 1, NULL, NULL, '2019-02-27 11:48:43'),
(41, 12, 0, NULL, NULL, '2019-02-27 11:53:14'),
(42, 11, 1, NULL, NULL, '2019-02-27 11:53:33'),
(43, 11, 0, NULL, NULL, '2019-02-27 11:54:24'),
(44, 1, 1, NULL, NULL, '2019-02-27 11:54:40'),
(45, 1, 1, NULL, NULL, '2019-02-28 05:16:46');

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
(2, 'AnswerType', '2', 'Rating', 'It store rating from 1 to 5 stars.', 0, b'1', 1, '2018-12-07 06:34:45', 1, '2018-12-07 06:34:45'),
(3, 'AnswerType', '3', 'MCQ', 'It store MCQ Answers.', 0, b'1', 1, '2018-12-07 06:34:45', 1, '2018-12-07 06:34:45'),
(4, 'EvaluationStatus', '0', 'Pending', NULL, 0, b'1', 1, '2018-12-07 06:43:08', 1, '2018-12-07 06:43:08'),
(5, 'EvaluationStatus', '2', 'In Progress', NULL, 0, b'1', 1, '2018-12-07 06:44:27', 1, '2018-12-07 06:44:27'),
(6, 'EvaluationStatus', '1', 'Submitted', NULL, 0, b'1', 1, '2018-12-07 06:44:27', 1, '2018-12-07 06:44:27'),
(7, 'EvaluationStatus', '3', 'Revoked', NULL, 0, b'1', 1, '2018-12-07 06:44:27', 1, '2018-12-07 06:44:27'),
(8, 'EvaluatorType', '0', 'Both (Employee & Evaluator)', 'Question displays to Employee & Evaluator.', 0, b'0', 1, '2018-12-20 06:17:53', 1, '2018-12-20 06:17:53'),
(9, 'EvaluatorType', '1', 'Employee', 'Question displays to Employee.', 0, b'1', 1, '2018-12-20 06:17:53', 1, '2018-12-20 06:17:53'),
(10, 'EvaluatorType', '2', 'Evaluator', 'Question displays to Evaluator.', 0, b'1', 1, '2018-12-20 06:17:53', 1, '2018-12-20 06:17:53'),
(11, 'AnswerType', '4', 'Yes/No', 'It store Yes/No Answers.', 0, b'1', 1, '2018-12-07 06:34:45', 1, '2018-12-07 06:34:45');

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
-- Dumping data for table `tblmstempevaluation`
--

INSERT INTO `tblmstempevaluation` (`EvaluationId`, `UserId`, `EvaluationTypeId`, `EvaluationDate`, `ExpirationDate`, `EmployeeEmailNote`, `EvaluatorEmailNote`, `EvaluationNote`, `ParentEvaluation`, `IsActive`, `CreatedBy`, `CreatedOn`, `UpdatedBy`, `UpdatedOn`) VALUES
(1, 12, 1, '2019-03-03 05:00:00', '2019-02-28 11:00:00', 'Not mentioned!', 'Not mentioned!', NULL, NULL, b'1', 1, '2019-02-27 11:02:03', 1, '2019-02-27 11:02:03'),
(2, 11, 2, '2019-03-09 11:00:00', '2019-03-01 11:00:00', 'Not mentioned!', 'Not mentioned!', NULL, NULL, b'1', 1, '2019-02-27 11:04:00', 1, '2019-02-27 11:04:00'),
(3, 12, 2, '2019-03-02 12:25:00', '2019-03-01 11:20:00', 'Not mentioned!', 'Not mentioned!', NULL, NULL, b'1', 1, '2019-02-27 12:25:35', 1, '2019-02-27 12:25:35'),
(4, 1, 2, '2019-04-04 04:00:00', '2019-03-02 18:30:00', 'Not mentioned!', 'Not mentioned!', NULL, NULL, b'1', 1, '2019-02-27 14:14:11', 1, '2019-02-27 14:14:11');

-- --------------------------------------------------------

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
-- Dumping data for table `tblmstempevaluator`
--

INSERT INTO `tblmstempevaluator` (`EmployeeEvaluatorId`, `EvaluationId`, `EvaluatorId`, `StatusId`, `EvaluatorType`, `IsActive`, `CreatedBy`, `CreatedOn`, `UpdatedBy`, `UpdatedOn`) VALUES
(1, 1, 11, 1, b'0', b'1', 1, '2019-02-27 11:02:03', 1, '2019-02-27 11:02:03'),
(2, 1, 12, 1, b'0', b'1', 1, '2019-02-27 11:02:03', 1, '2019-02-27 11:02:03'),
(3, 2, 1, 1, b'0', b'1', 1, '2019-02-27 11:04:01', 1, '2019-02-27 11:04:01'),
(4, 2, 11, 1, b'0', b'1', 1, '2019-02-27 11:04:01', 1, '2019-02-27 11:04:01'),
(5, 3, 1, 2, b'0', b'1', 1, '2019-02-27 12:25:35', 1, '2019-02-27 12:25:35'),
(6, 3, 12, 0, b'0', b'1', 1, '2019-02-27 12:25:35', 1, '2019-02-27 12:25:35'),
(7, 3, 11, 0, b'0', b'1', 1, '2019-02-27 12:25:35', 1, '2019-02-27 12:25:35'),
(8, 4, 1, 2, b'0', b'1', 1, '2019-02-27 14:14:11', 1, '2019-02-27 14:14:11');

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
  `EvaluationTypeId` varchar(50) NOT NULL,
  `QuestionText` text NOT NULL,
  `AnswerTypeId` int(11) NOT NULL,
  `EvaluatorTypeId` varchar(50) NOT NULL DEFAULT '0',
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `CreatedBy` int(11) NOT NULL DEFAULT '1',
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL DEFAULT '1',
  `UpdatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblmstquestion`
--

INSERT INTO `tblmstquestion` (`QuestionId`, `EvaluationTypeId`, `QuestionText`, `AnswerTypeId`, `EvaluatorTypeId`, `IsActive`, `CreatedBy`, `CreatedOn`, `UpdatedBy`, `UpdatedOn`) VALUES
(1, '1', 'question 1', 1, '1', b'1', 1, '2019-02-27 09:53:10', 1, '2019-02-27 09:53:10'),
(2, '1', 'question 2', 1, '2', b'1', 1, '2019-02-27 09:53:10', 1, '2019-02-27 09:53:10'),
(3, '2', 'question 3', 1, '1', b'1', 1, '2019-02-27 09:53:10', 1, '2019-02-27 09:53:10'),
(4, '2', 'question 4', 1, '2', b'1', 1, '2019-02-27 09:53:10', 1, '2019-02-27 09:53:10'),
(5, '1', 'question 5', 1, '1,2', b'1', 1, '2019-02-27 09:53:10', 1, '2019-02-27 09:53:10'),
(6, '2', 'question 6', 1, '1,2', b'1', 1, '2019-02-27 09:53:10', 1, '2019-02-27 09:53:10'),
(7, '1,2', 'question 7', 1, '1', b'1', 1, '2019-02-27 09:53:10', 1, '2019-02-27 09:53:10'),
(8, '1,2', 'question 8', 1, '2', b'1', 1, '2019-02-27 09:53:10', 1, '2019-02-27 09:53:10'),
(9, '1,2', 'question 9', 1, '1,2', b'1', 1, '2019-02-27 09:53:10', 1, '2019-02-27 09:53:10'),
(11, '1,2', '<p>Rating</p>', 2, '1,2', b'1', 1, '2019-02-27 14:12:28', 1, '2019-02-27 14:12:28');

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
(1, 1, 15, 0, 'IT', 'Admin', 'Developer', NULL, 'it@theopeneyes.com', '25d55ad283aa400af464c76d713c07ad', NULL, b'1', 1, '2018-12-18 18:15:58', 1, '2019-01-31 06:17:03'),
(11, 2, 5, 1, 'Uttam', '', 'Bhut', '37', 'uttam.bhut@theopeneyes.in', '25d55ad283aa400af464c76d713c07ad', NULL, b'1', 1, '2019-02-27 10:59:04', 1, '2019-02-27 10:59:22'),
(12, 3, 5, 11, 'Sudhir', '', 'Parmar', '44', 'sparmar@theopeneyes.in', '25d55ad283aa400af464c76d713c07ad', NULL, b'1', 1, '2019-02-27 11:01:05', 0, '2019-02-27 11:01:05');

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
  MODIFY `ActivityLogId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `tblemaillog`
--
ALTER TABLE `tblemaillog`
  MODIFY `EmailLogId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tblevaluationanswer`
--
ALTER TABLE `tblevaluationanswer`
  MODIFY `EvaluationAnswerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `tblloginlog`
--
ALTER TABLE `tblloginlog`
  MODIFY `LoginLogId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `tblmstconfiguration`
--
ALTER TABLE `tblmstconfiguration`
  MODIFY `ConfigurationId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tblmstdepartment`
--
ALTER TABLE `tblmstdepartment`
  MODIFY `DepartmentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblmstempevaluation`
--
ALTER TABLE `tblmstempevaluation`
  MODIFY `EvaluationId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblmstempevaluator`
--
ALTER TABLE `tblmstempevaluator`
  MODIFY `EmployeeEvaluatorId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  MODIFY `QuestionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
