-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 30, 2017 at 06:58 AM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quizzer`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_user`
--

CREATE TABLE `app_user` (
  `id` bigint(20) NOT NULL,
  `sso_id` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_user`
--

INSERT INTO `app_user` (`id`, `sso_id`, `password`, `first_name`, `last_name`, `email`) VALUES
(4, '1122', '12212', 'abdul', 'abdul', 'abdul'),
(5, '12456', '12345', 'abdul', 'basit', 'a.basit.k08@gmail.com'),
(6, '12478', '112233', 'mujeeb-ur', '-rehman', 'a.basit.k08@gmail.com'),
(7, '', 'pass', 'saad', 'khaleeq', 'saad@mail.com'),
(8, '1001', 'password', 'me', 'me', 'me@me.com'),
(9, 'asd', 'asd', 'a', 'b', 'a@a.com');

-- --------------------------------------------------------

--
-- Table structure for table `app_user_user_profile`
--

CREATE TABLE `app_user_user_profile` (
  `user_id` bigint(20) NOT NULL,
  `user_profile_id` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_user_user_profile`
--

INSERT INTO `app_user_user_profile` (`user_id`, `user_profile_id`) VALUES
(4, 1),
(5, 1),
(6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` bigint(20) NOT NULL,
  `quiz_id` bigint(20) NOT NULL,
  `question_type` varchar(30) NOT NULL,
  `title` varchar(255) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `opt1` varchar(255) DEFAULT NULL,
  `opt2` varchar(255) DEFAULT NULL,
  `opt3` varchar(255) DEFAULT NULL,
  `opt4` varchar(255) DEFAULT NULL,
  `marks` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `quiz_id`, `question_type`, `title`, `answer`, `opt1`, `opt2`, `opt3`, `opt4`, `marks`) VALUES
(1, 6, 'MCQ', 'question q', '', 'optq', 'optw', 'opte', 'optr', 1),
(2, 6, 'MCQ', 'question titke', 'opt3', 'optq', 'opt2', 'opt3', 'opt4', 1),
(3, 6, 'true_false', '2+2 equals 4?', 'true', 'true', 'false', NULL, NULL, 1),
(4, 6, 'numeric', '2+2= ?', '4', NULL, NULL, NULL, NULL, 1),
(5, 6, 'numeric', '5+2= ?', '7', NULL, NULL, NULL, NULL, 1),
(6, 6, 'true_false', '2>5', 'false', 'true', 'false', '', '', 1),
(7, 6, 'true_false', '2<3', 'true', 'true', 'false', '', '', 1),
(8, 6, 'numaric', '2+2', '4', 'true', 'false', '', '', 1),
(9, 6, 'numaric', '2+ 6', '8', 'true', 'false', '', '', 1),
(10, 6, 'numaric', '', '', 'true', 'false', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
  `id` bigint(20) NOT NULL,
  `user_id` varchar(30) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`id`, `user_id`, `title`, `description`) VALUES
(1, '4', 'Maths quiz', 'Quiz here'),
(2, '4', 'Maths quiz', 'Quiz here'),
(3, '4', 'AP quiz', 'AP Quiz 4 here'),
(4, '4', 'CN', 'Computer Networks Quiz here'),
(5, '5', 'Maths quiz', 'Quiz here'),
(6, '4', 'New Quiz Added', 'description'),
(7, '4', 'New Quiz Added', 'description'),
(8, '4', 'New Quiz Added', 'description'),
(9, '4', '1w', '1w'),
(10, '4', 'final quiz', 'test quiz'),
(11, '9', 'physics quiz 1', 'law of inertia'),
(12, '9', 'maths quiz 2', 'integration'),
(13, '9', 'new quiz', 'quiz'),
(14, '9', 'first quiz by asd', 'ASD quiz'),
(15, '4', 'new quiz', 'hy'),
(16, '4', 'nawan quiz', 'new quiz details'),
(17, '4', 'maths quiz', 'quiz 5'),
(18, '4', 'weryuxdf', 'ddhh'),
(19, '4', 'abdul made a quiz', 'q8'),
(20, '4', 'uiahsh', 'ssghshsb');

-- --------------------------------------------------------

--
-- Table structure for table `user_profile`
--

CREATE TABLE `user_profile` (
  `id` bigint(20) NOT NULL,
  `type` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_profile`
--

INSERT INTO `user_profile` (`id`, `type`) VALUES
(1, 'USER'),
(2, 'ADMIN');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_user`
--
ALTER TABLE `app_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sso_id` (`sso_id`);

--
-- Indexes for table `app_user_user_profile`
--
ALTER TABLE `app_user_user_profile`
  ADD PRIMARY KEY (`user_id`,`user_profile_id`),
  ADD KEY `FK_USER_PROFILE` (`user_profile_id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_QUIZ` (`quiz_id`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_APP_USER` (`user_id`);

--
-- Indexes for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `type` (`type`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_user`
--
ALTER TABLE `app_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `quiz`
--
ALTER TABLE `quiz`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `user_profile`
--
ALTER TABLE `user_profile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
