-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 21, 2024 at 02:16 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopping_cart`
--

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `level` varchar(50) NOT NULL,
  `grade` int(11) NOT NULL,
  `class` int(11) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `password`, `name`, `level`, `grade`, `class`, `email`) VALUES
('111', '111', 'Teacher', 'Teacher', 0, 0, '0'),
('48246', '1', 'วรินทร์สิรี บุญประดิษฐ์', 'Student', 6, 7, 'ss48246@samsenwit.ac.th\r\n'),
('48487', '6', 'ปวริศ ปาลสุข', 'Student', 6, 7, 'ss48487@samsenwit.ac.th'),
('51043', '22', 'นันท์นภัส วิริยะวัฒนา', 'Student', 6, 7, 'ss51043@samsenwit.ac.th');

-- --------------------------------------------------------

--
-- Table structure for table `tbl`
--

CREATE TABLE `tbl` (
  `id` int(11) NOT NULL,
  `type` varchar(150) NOT NULL,
  `code` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `name` varchar(150) NOT NULL,
  `username` int(11) NOT NULL,
  `grade` int(11) NOT NULL,
  `class` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl`
--

INSERT INTO `tbl` (`id`, `type`, `code`, `quantity`, `time`, `name`, `username`, `grade`, `class`, `status`) VALUES
(1, 'ใบปพ.1', 1, 1, '2024-08-12 05:16:38', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(2, 'Transcript', 2, 1, '2024-08-12 05:16:38', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(3, 'ใบปพ.7 รับรองผลการศึกษา', 3, 1, '2024-08-12 05:16:38', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(4, 'ใบปพ.7 รับรองสภาพการเป็นนักเรียน ', 4, 1, '2024-08-12 05:16:38', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(5, 'ใบปพ.1', 1, 1, '2024-08-12 05:17:21', 'วรินทร์สิรี บุญประดิษฐ์', 48246, 6, 7, 0),
(6, 'Transcript', 2, 1, '2024-08-12 05:17:21', 'วรินทร์สิรี บุญประดิษฐ์', 48246, 6, 7, 0),
(7, 'ใบปพ.7 รับรองผลการศึกษา', 3, 1, '2024-08-12 05:17:21', 'วรินทร์สิรี บุญประดิษฐ์', 48246, 6, 7, 0),
(8, 'ใบปพ.7 รับรองสภาพการเป็นนักเรียน ', 4, 1, '2024-08-12 05:17:21', 'วรินทร์สิรี บุญประดิษฐ์', 48246, 6, 7, 0),
(9, 'ใบปพ.1', 1, 1, '2024-08-12 05:17:32', 'ปวริศ ปาลสุข', 48487, 6, 7, 0),
(10, 'Transcript', 2, 1, '2024-08-12 05:17:32', 'ปวริศ ปาลสุข', 48487, 6, 7, 0),
(11, 'ใบปพ.7 รับรองผลการศึกษา', 3, 1, '2024-08-12 05:17:32', 'ปวริศ ปาลสุข', 48487, 6, 7, 0),
(12, 'ใบปพ.7 รับรองสภาพการเป็นนักเรียน ', 4, 1, '2024-08-12 05:17:32', 'ปวริศ ปาลสุข', 48487, 6, 7, 0),
(13, 'ใบปพ.1', 1, 1, '2024-08-12 05:22:20', 'ปวริศ ปาลสุข', 48487, 6, 7, 0),
(14, 'Transcript', 2, 1, '2024-08-12 05:22:45', 'ปวริศ ปาลสุข', 48487, 6, 7, 0),
(15, 'ใบปพ.1', 1, 1, '2024-08-12 05:25:35', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(16, 'Transcript', 2, 1, '2024-08-12 05:25:35', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(17, 'ใบปพ.7 รับรองผลการศึกษา', 3, 1, '2024-08-12 05:25:35', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(18, 'Transcript', 2, 1, '2024-08-12 05:17:32', 'ปวริศ ปาลสุข', 48487, 6, 7, 0),
(19, 'Transcript', 2, 1, '2024-08-12 05:17:32', 'ปวริศ ปาลสุข', 48487, 6, 7, 0),
(20, 'Transcript', 2, 1, '2024-08-12 05:17:32', 'ปวริศ ปาลสุข', 48487, 6, 7, 0),
(21, 'Transcript', 2, 1, '2024-08-12 05:17:32', 'ปวริศ ปาลสุข', 48487, 6, 7, 0),
(22, 'Transcript', 2, 1, '2024-08-12 05:17:32', 'ปวริศ ปาลสุข', 48487, 6, 7, 0),
(23, 'Transcript', 2, 1, '2024-08-12 05:22:45', 'ปวริศ ปาลสุข', 48487, 6, 7, 0),
(24, 'Transcript', 2, 1, '2024-08-12 05:22:45', 'ปวริศ ปาลสุข', 48487, 6, 7, 0),
(25, 'Transcript', 2, 1, '2024-08-12 05:22:45', 'ปวริศ ปาลสุข', 48487, 6, 7, 0),
(26, 'Transcript', 2, 1, '2024-08-12 05:22:45', 'ปวริศ ปาลสุข', 48487, 6, 7, 0),
(27, 'Transcript', 2, 1, '2024-08-12 05:22:45', 'ปวริศ ปาลสุข', 48487, 6, 7, 0),
(28, 'Transcript', 2, 1, '2024-08-12 05:25:35', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(29, 'Transcript', 2, 1, '2024-08-12 05:25:35', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(30, 'Transcript', 2, 1, '2024-08-12 05:25:35', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(31, 'Transcript', 2, 1, '2024-08-12 05:25:35', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(32, 'Transcript', 2, 1, '2024-08-12 05:27:26', 'ปวริศ ปาลสุข', 48487, 6, 7, 0),
(33, 'Transcript', 2, 1, '2024-08-12 05:27:26', 'ปวริศ ปาลสุข', 48487, 6, 7, 0),
(34, 'Transcript', 2, 1, '2024-08-12 05:27:26', 'ปวริศ ปาลสุข', 48487, 6, 7, 0),
(35, 'Transcript', 2, 1, '2024-08-12 05:27:26', 'ปวริศ ปาลสุข', 48487, 6, 7, 0),
(36, 'Transcript', 2, 1, '2024-08-12 06:21:09', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(37, 'Transcript', 2, 1, '2024-08-12 06:21:09', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(38, 'Transcript', 2, 1, '2024-08-12 06:21:09', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(39, 'Transcript', 2, 1, '2024-08-12 06:21:09', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(40, 'Transcript', 2, 1, '2024-08-12 12:02:16', 'Teacher', 111, 0, 0, 0),
(41, 'Transcript', 2, 1, '2024-08-12 12:02:16', 'Teacher', 111, 0, 0, 0),
(42, 'Transcript', 2, 1, '2024-08-12 12:02:16', 'Teacher', 111, 0, 0, 0),
(43, 'Transcript', 2, 1, '2024-08-12 12:02:16', 'Teacher', 111, 0, 0, 0),
(44, 'Transcript', 2, 1, '2024-08-12 12:14:38', 'Teacher', 111, 0, 0, 0),
(45, 'Transcript', 2, 1, '2024-08-12 12:14:38', 'Teacher', 111, 0, 0, 0),
(46, 'Transcript', 2, 1, '2024-08-12 12:14:38', 'Teacher', 111, 0, 0, 0),
(47, 'Transcript', 2, 1, '2024-08-12 12:14:38', 'Teacher', 111, 0, 0, 0),
(48, 'Transcript', 2, 1, '2024-08-13 17:34:12', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(49, 'Transcript', 2, 1, '2024-08-13 17:34:12', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(50, 'Transcript', 2, 1, '2024-08-13 17:34:12', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(51, 'Transcript', 2, 1, '2024-08-13 17:34:12', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(52, 'Transcript', 2, 1, '2024-08-14 03:52:35', 'นันท์นภัส วิริยะวัฒนา', 51043, 0, 0, 0),
(53, 'Transcript', 2, 1, '2024-08-14 03:52:35', 'นันท์นภัส วิริยะวัฒนา', 51043, 0, 0, 0),
(54, 'Transcript', 2, 1, '2024-08-14 03:52:35', 'นันท์นภัส วิริยะวัฒนา', 51043, 0, 0, 0),
(55, 'Transcript', 2, 1, '2024-08-14 03:52:35', 'นันท์นภัส วิริยะวัฒนา', 51043, 0, 0, 0),
(56, 'Transcript', 2, 1, '2024-08-29 06:18:41', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(57, 'Transcript', 2, 1, '2024-08-29 06:18:41', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(58, 'Transcript', 2, 1, '2024-08-29 06:18:41', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(59, 'Transcript', 2, 1, '2024-08-29 06:18:41', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(60, 'Transcript', 2, 1, '2024-08-29 06:24:50', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(61, 'Transcript', 2, 1, '2024-08-29 06:24:50', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(62, 'Transcript', 2, 1, '2024-08-29 06:24:50', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(63, 'Transcript', 2, 1, '2024-08-29 06:24:50', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(64, 'Transcript', 2, 1, '2024-08-29 09:40:10', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(65, 'Transcript', 2, 1, '2024-08-29 09:40:10', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(66, 'Transcript', 2, 1, '2024-08-29 09:40:10', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(67, 'Transcript', 2, 1, '2024-08-29 09:40:10', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(68, 'Transcript', 2, 1, '2024-08-29 10:05:12', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(69, 'Transcript', 2, 1, '2024-08-29 10:05:12', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(70, 'Transcript', 2, 1, '2024-08-29 10:05:12', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(71, 'Transcript', 2, 1, '2024-08-29 10:05:12', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(72, 'Transcript', 2, 1, '2024-09-05 13:31:12', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(73, 'Transcript', 2, 1, '2024-09-05 13:31:12', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(74, 'Transcript', 2, 1, '2024-09-05 13:31:12', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(75, 'Transcript', 2, 1, '2024-09-05 13:31:12', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(76, 'Transcript', 2, 1, '2024-09-11 09:59:52', 'วรินทร์สิรี บุญประดิษฐ์', 48246, 6, 7, 0),
(77, 'Transcript', 2, 1, '2024-09-11 09:59:52', 'วรินทร์สิรี บุญประดิษฐ์', 48246, 6, 7, 0),
(78, 'Transcript', 2, 1, '2024-09-11 09:59:52', 'วรินทร์สิรี บุญประดิษฐ์', 48246, 6, 7, 0),
(79, 'Transcript', 2, 1, '2024-09-11 09:59:52', 'วรินทร์สิรี บุญประดิษฐ์', 48246, 6, 7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orders`
--

CREATE TABLE `tbl_orders` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `name` varchar(150) NOT NULL,
  `username` int(11) NOT NULL,
  `grade` int(11) NOT NULL,
  `class` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_orders`
--

INSERT INTO `tbl_orders` (`id`, `type`, `code`, `quantity`, `time`, `name`, `username`, `grade`, `class`, `status`) VALUES
(1, 'ใบปพ.1', '1', 1, '2024-08-13 16:52:21', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 2),
(2, 'Transcript', '2', 1, '2024-08-13 16:52:21', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 2),
(3, 'ใบปพ.7 รับรองผลการศึกษา', '3', 1, '2024-08-13 17:13:37', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 2),
(4, 'ใบปพ.7 รับรองสภาพการเป็นนักเรียน ', '4', 1, '2024-08-13 16:52:22', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 2),
(5, 'ใบปพ.1', '1', 1, '2024-08-13 17:34:50', 'วรินทร์สิรี บุญประดิษฐ์', 48246, 6, 7, 2),
(6, 'Transcript', '2', 1, '2024-08-13 17:13:39', 'วรินทร์สิรี บุญประดิษฐ์', 48246, 6, 7, 2),
(7, 'ใบปพ.7 รับรองผลการศึกษา', '3', 1, '2024-08-13 17:13:50', 'วรินทร์สิรี บุญประดิษฐ์', 48246, 6, 7, 2),
(8, 'ใบปพ.7 รับรองสภาพการเป็นนักเรียน ', '4', 1, '2024-08-25 06:58:13', 'วรินทร์สิรี บุญประดิษฐ์', 48246, 6, 7, 2),
(9, 'ใบปพ.1', '1', 1, '2024-08-29 09:38:03', 'ปวริศ ปาลสุข', 48487, 6, 7, 2),
(10, 'Transcript', '2', 1, '2024-08-13 17:35:33', 'ปวริศ ปาลสุข', 48487, 6, 7, 2),
(11, 'ใบปพ.7 รับรองผลการศึกษา', '3', 1, '2024-08-29 10:06:01', 'ปวริศ ปาลสุข', 48487, 6, 7, 2),
(12, 'ใบปพ.7 รับรองสภาพการเป็นนักเรียน ', '4', 1, '2024-08-13 17:13:53', 'ปวริศ ปาลสุข', 48487, 6, 7, 2),
(13, 'ใบปพ.1', '1', 1, '2024-08-13 17:33:45', 'ปวริศ ปาลสุข', 48487, 6, 7, 2),
(14, 'Transcript', '2', 1, '2024-09-05 13:31:38', 'ปวริศ ปาลสุข', 48487, 6, 7, 1),
(15, 'ใบปพ.1', '1', 1, '2024-08-30 12:33:53', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 1),
(16, 'Transcript', '2', 1, '2024-08-12 08:51:19', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 2),
(17, 'ใบปพ.7 รับรองผลการศึกษา', '3', 1, '2024-08-30 12:33:42', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(18, 'ใบปพ.1', '1', 1, '2024-08-30 12:33:42', 'ปวริศ ปาลสุข', 48487, 6, 7, 0),
(19, 'Transcript', '2', 1, '2024-09-10 13:29:20', 'ปวริศ ปาลสุข', 48487, 6, 7, 1),
(20, 'ใบปพ.7 รับรองผลการศึกษา', '3', 1, '2024-08-29 09:59:09', 'ปวริศ ปาลสุข', 48487, 6, 7, 1),
(21, 'ใบปพ.7 รับรองสภาพการเป็นนักเรียน ', '4', 1, '2024-08-13 17:20:18', 'ปวริศ ปาลสุข', 48487, 6, 7, 1),
(22, 'ใบปพ.1', '1', 1, '2024-08-30 12:33:55', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 1),
(23, 'Transcript', '2', 1, '2024-08-12 08:52:06', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 2),
(24, 'ใบปพ.7 รับรองผลการศึกษา', '3', 1, '2024-08-30 12:33:45', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(25, 'ใบปพ.7 รับรองสภาพการเป็นนักเรียน ', '4', 1, '2024-08-12 08:51:23', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 2),
(26, 'ใบปพ.1', '1', 1, '2024-08-30 12:33:56', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 1),
(30, 'Transcript', '2', 1, '2024-08-30 12:33:46', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(31, 'Transcript', '2', 1, '2024-08-30 12:33:46', 'นันท์นภัส วิริยะวัฒนา', 51043, 0, 0, 0),
(32, 'ใบปพ.1', '1', 1, '2024-09-10 13:22:02', 'นันท์นภัส วิริยะวัฒนา', 51043, 0, 0, 1),
(33, 'ใบปพ.7 รับรองผลการศึกษา', '3', 1, '2024-08-18 04:01:23', 'นันท์นภัส วิริยะวัฒนา', 51043, 0, 0, 0),
(34, 'ใบปพ.1', '1', 1, '2024-08-25 06:43:43', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(35, 'ใบปพ.7 รับรองผลการศึกษา', '3', 1, '2024-09-10 13:29:34', 'Teacher', 111, 0, 0, 1),
(36, 'ใบปพ.7 รับรองสภาพการเป็นนักเรียน ', '4', 1, '2024-08-28 14:35:06', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(37, 'ใบปพ.7 รับรองผลการศึกษา', '3', 1, '2024-08-29 05:35:01', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(38, 'ใบปพ.1', '1', 2, '2024-09-10 13:22:02', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 1),
(39, 'ใบปพ.1', '1', 1, '2024-09-10 13:22:03', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 1),
(40, 'Transcript', '2', 1, '2024-09-10 13:29:22', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 1),
(41, 'ใบปพ.7 รับรองผลการศึกษา', '3', 1, '2024-09-10 13:29:36', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 1),
(42, 'ใบปพ.1', '1', 1, '2024-09-10 13:22:03', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 1),
(43, 'Transcript', '2', 1, '2024-08-29 06:24:50', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(44, 'ใบปพ.1', '1', 1, '2024-09-10 13:22:03', 'วรินทร์สิรี บุญประดิษฐ์', 48246, 6, 7, 1),
(45, 'ใบปพ.1', '1', 1, '2024-08-29 07:37:03', 'วรินทร์สิรี บุญประดิษฐ์', 48246, 6, 7, 1),
(46, 'ใบปพ.1', '1', 1, '2024-08-29 07:37:00', 'วรินทร์สิรี บุญประดิษฐ์', 48246, 6, 7, 1),
(47, 'ใบปพ.1', '1', 1, '2024-09-10 13:22:03', 'วรินทร์สิรี บุญประดิษฐ์', 48246, 6, 7, 1),
(48, 'ใบปพ.1', '1', 1, '2024-08-29 09:40:10', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(49, 'Transcript', '2', 1, '2024-08-29 09:40:10', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(50, 'ใบปพ.1', '1', 2, '2024-08-29 10:00:46', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(51, 'Transcript', '2', 1, '2024-09-10 13:29:25', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 1),
(52, 'ใบปพ.1', '1', 1, '2024-08-29 13:17:36', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(53, 'ใบปพ.1', '1', 1, '2024-09-05 13:31:12', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(54, 'Transcript', '2', 1, '2024-09-05 13:31:12', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(55, 'ใบปพ.7 รับรองสภาพการเป็นนักเรียน ', '4', 1, '2024-09-10 13:22:24', 'นันท์นภัส วิริยะวัฒนา', 51043, 6, 7, 0),
(56, 'ใบปพ.7 รับรองสภาพการเป็นนักเรียน ', '4', 1, '2024-09-10 13:29:01', 'ปวริศ ปาลสุข', 48487, 6, 7, 0),
(57, 'ใบปพ.7 รับรองสภาพการเป็นนักเรียน ', '4', 3, '2024-09-10 13:30:03', 'ปวริศ ปาลสุข', 48487, 6, 7, 1),
(58, 'ใบปพ.7 รับรองสภาพการเป็นนักเรียน ', '4', 1, '2024-09-10 13:30:49', 'วรินทร์สิรี บุญประดิษฐ์', 48246, 6, 7, 1),
(59, 'ใบปพ.1', '1', 1, '2024-09-11 09:57:34', 'วรินทร์สิรี บุญประดิษฐ์', 48246, 6, 7, 0),
(60, 'ใบปพ.1', '1', 1, '2024-09-11 09:59:52', 'วรินทร์สิรี บุญประดิษฐ์', 48246, 6, 7, 0),
(61, 'Transcript', '2', 1, '2024-09-11 09:59:52', 'วรินทร์สิรี บุญประดิษฐ์', 48246, 6, 7, 0),
(62, 'ใบปพ.7 รับรองผลการศึกษา', '3', 1, '2024-09-11 09:59:52', 'วรินทร์สิรี บุญประดิษฐ์', 48246, 6, 7, 0),
(63, 'ใบปพ.7 รับรองสภาพการเป็นนักเรียน ', '4', 1, '2024-09-11 09:59:52', 'วรินทร์สิรี บุญประดิษฐ์', 48246, 6, 7, 0);

--
-- Triggers `tbl_orders`
--
DELIMITER $$
CREATE TRIGGER `after_insert_tbl_orders1` AFTER INSERT ON `tbl_orders` FOR EACH ROW BEGIN
    IF NEW.code = 1 THEN
        INSERT INTO tbl_orders_code1 (id, type, code, quantity, time, name, username, grade, class, status)
        VALUES (NEW.id, NEW.type, NEW.code, NEW.quantity, NEW.time, NEW.name, NEW.username, NEW.grade, NEW.class, NEW.status);
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_insert_tbl_orders2` AFTER INSERT ON `tbl_orders` FOR EACH ROW BEGIN
    IF NEW.code = 2 THEN
        INSERT INTO tbl_orders_code2 (id, type, code, quantity, time, name, username, grade, class, status)
        VALUES (NEW.id, NEW.type, NEW.code, NEW.quantity, NEW.time, NEW.name, NEW.username, NEW.grade, NEW.class, NEW.status);
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_insert_tbl_orders3` AFTER INSERT ON `tbl_orders` FOR EACH ROW BEGIN
    IF NEW.code = 3 THEN
        INSERT INTO tbl_orders_code3 (id, type, code, quantity, time, name, username, grade, class, status)
        VALUES (NEW.id, NEW.type, NEW.code, NEW.quantity, NEW.time, NEW.name, NEW.username, NEW.grade, NEW.class, NEW.status);
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_insert_tbl_orders4` AFTER INSERT ON `tbl_orders` FOR EACH ROW BEGIN
    IF NEW.code = 4 THEN
        INSERT INTO tbl_orders_code4 (id, type, code, quantity, time, name, username, grade, class, status)
        VALUES (NEW.id, NEW.type, NEW.code, NEW.quantity, NEW.time, NEW.name, NEW.username, NEW.grade, NEW.class, NEW.status);
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_insert_tbl_orders_code` AFTER INSERT ON `tbl_orders` FOR EACH ROW BEGIN
    IF NEW.code = 2 THEN
        INSERT INTO tbl (type, code, quantity, time, name, username, grade, class)
        VALUES (NEW.type, NEW.code, NEW.quantity, NEW.time, NEW.name, NEW.username, NEW.grade, NEW.class);
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_insert_tbl_orders_code2` AFTER INSERT ON `tbl_orders` FOR EACH ROW BEGIN
    IF NEW.code = 2 THEN
        INSERT INTO tbl (type, code, quantity, time, name, username, grade, class)
        VALUES (NEW.type, NEW.code, NEW.quantity, NEW.time, NEW.name, NEW.username, NEW.grade, NEW.class);
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_insert_tbl_orders_code3` AFTER INSERT ON `tbl_orders` FOR EACH ROW BEGIN
    IF NEW.code = 2 THEN
        INSERT INTO tbl (type, code, quantity, time, name, username, grade, class)
        VALUES (NEW.type, NEW.code, NEW.quantity, NEW.time, NEW.name, NEW.username, NEW.grade, NEW.class);
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_insert_tbl_orders_code4` AFTER INSERT ON `tbl_orders` FOR EACH ROW BEGIN
    IF NEW.code = 2 THEN
        INSERT INTO tbl (type, code, quantity, time, name, username, grade, class)
        VALUES (NEW.type, NEW.code, NEW.quantity, NEW.time, NEW.name, NEW.username, NEW.grade, NEW.class);
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_insert_tbl_status` AFTER INSERT ON `tbl_orders` FOR EACH ROW BEGIN
    IF NEW.status = 0 THEN
        INSERT INTO tbl_orders_status_0 (id, type, code, quantity, time, name, username, grade, class, status)
        VALUES (NEW.id, NEW.type, NEW.code, NEW.quantity, NEW.time, NEW.name, NEW.username, NEW.grade, NEW.class, NEW.status);
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_insert_tbl_status1` AFTER INSERT ON `tbl_orders` FOR EACH ROW BEGIN
    IF NEW.status = 1 THEN
        INSERT INTO tbl_orders_status_1 (id, type, code, quantity, time, name, username, grade, class, status)
        VALUES (NEW.id, NEW.type, NEW.code, NEW.quantity, NEW.time, NEW.name, NEW.username, NEW.grade, NEW.class, NEW.status);
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_insert_tbl_status2` AFTER INSERT ON `tbl_orders` FOR EACH ROW BEGIN
    IF NEW.status = 2 THEN
        INSERT INTO tbl_orders_status_2 (id, type, code, quantity, time, name, username, grade, class, status)
        VALUES (NEW.id, NEW.type, NEW.code, NEW.quantity, NEW.time, NEW.name, NEW.username, NEW.grade, NEW.class, NEW.status);
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update_tbl_orders1` AFTER UPDATE ON `tbl_orders` FOR EACH ROW BEGIN
    IF OLD.code = 1 THEN
        DELETE FROM tbl_orders_code1 WHERE id = OLD.id;
    END IF;
    IF NEW.code = 1 THEN
        INSERT INTO tbl_orders_code1 (id, type, code, quantity, time, name, username, grade, class, status)
        VALUES (NEW.id, NEW.type, NEW.code, NEW.quantity, NEW.time, NEW.name, NEW.username, NEW.grade, NEW.class, NEW.status)
        ON DUPLICATE KEY UPDATE 
            type = NEW.type,
            code = NEW.code,
            quantity = NEW.quantity,
            time = NEW.time,
            name = NEW.name,
            username = NEW.username,
            grade = NEW.grade,
            class = NEW.class,
            status = NEW.status;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update_tbl_orders2` AFTER UPDATE ON `tbl_orders` FOR EACH ROW BEGIN
    IF OLD.code = 2 THEN
        DELETE FROM tbl_orders_code2 WHERE id = OLD.id;
    END IF;
    IF NEW.code = 2 THEN
        INSERT INTO tbl_orders_code2 (id, type, code, quantity, time, name, username, grade, class, status)
        VALUES (NEW.id, NEW.type, NEW.code, NEW.quantity, NEW.time, NEW.name, NEW.username, NEW.grade, NEW.class, NEW.status)
        ON DUPLICATE KEY UPDATE 
            type = NEW.type,
            code = NEW.code,
            quantity = NEW.quantity,
            time = NEW.time,
            name = NEW.name,
            username = NEW.username,
            grade = NEW.grade,
            class = NEW.class,
            status = NEW.status;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update_tbl_orders3` AFTER UPDATE ON `tbl_orders` FOR EACH ROW BEGIN
    IF OLD.code = 3 THEN
        DELETE FROM tbl_orders_code3 WHERE id = OLD.id;
    END IF;
    IF NEW.code = 3 THEN
        INSERT INTO tbl_orders_code3 (id, type, code, quantity, time, name, username, grade, class, status)
        VALUES (NEW.id, NEW.type, NEW.code, NEW.quantity, NEW.time, NEW.name, NEW.username, NEW.grade, NEW.class, NEW.status)
        ON DUPLICATE KEY UPDATE 
            type = NEW.type,
            code = NEW.code,
            quantity = NEW.quantity,
            time = NEW.time,
            name = NEW.name,
            username = NEW.username,
            grade = NEW.grade,
            class = NEW.class,
            status = NEW.status;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update_tbl_orders4` AFTER UPDATE ON `tbl_orders` FOR EACH ROW BEGIN
    IF OLD.code = 4 THEN
        DELETE FROM tbl_orders_code4 WHERE id = OLD.id;
    END IF;
    IF NEW.code = 4 THEN
        INSERT INTO tbl_orders_code4 (id, type, code, quantity, time, name, username, grade, class, status)
        VALUES (NEW.id, NEW.type, NEW.code, NEW.quantity, NEW.time, NEW.name, NEW.username, NEW.grade, NEW.class, NEW.status)
        ON DUPLICATE KEY UPDATE 
            type = NEW.type,
            code = NEW.code,
            quantity = NEW.quantity,
            time = NEW.time,
            name = NEW.name,
            username = NEW.username,
            grade = NEW.grade,
            class = NEW.class,
            status = NEW.status;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update_tbl_status` AFTER UPDATE ON `tbl_orders` FOR EACH ROW BEGIN
    IF OLD.status = 0 THEN
        DELETE FROM tbl_orders_status_0 WHERE id = OLD.id;
    END IF;
    IF NEW.status = 0 THEN
        INSERT INTO tbl_orders_status_0 (id, type, code, quantity, time, name, username, grade, class, status)
        VALUES (NEW.id, NEW.type, NEW.code, NEW.quantity, NEW.time, NEW.name, NEW.username, NEW.grade, NEW.class, NEW.status)
        ON DUPLICATE KEY UPDATE 
            type = NEW.type,
            code = NEW.code,
            quantity = NEW.quantity,
            time = NEW.time,
            name = NEW.name,
            username = NEW.username,
            grade = NEW.grade,
            class = NEW.class,
            status = NEW.status;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update_tbl_status1` AFTER UPDATE ON `tbl_orders` FOR EACH ROW BEGIN
    IF OLD.status = 1 THEN
        DELETE FROM tbl_orders_status_1 WHERE id = OLD.id;
    END IF;
    IF NEW.status = 1 THEN
        INSERT INTO tbl_orders_status_1 (id, type, code, quantity, time, name, username, grade, class, status)
        VALUES (NEW.id, NEW.type, NEW.code, NEW.quantity, NEW.time, NEW.name, NEW.username, NEW.grade, NEW.class, NEW.status)
        ON DUPLICATE KEY UPDATE 
            type = NEW.type,
            code = NEW.code,
            quantity = NEW.quantity,
            time = NEW.time,
            name = NEW.name,
            username = NEW.username,
            grade = NEW.grade,
            class = NEW.class,
            status = NEW.status;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update_tbl_status2` AFTER UPDATE ON `tbl_orders` FOR EACH ROW BEGIN
    IF OLD.status = 2 THEN
        DELETE FROM tbl_orders_status_2 WHERE id = OLD.id;
    END IF;
    IF NEW.status = 2 THEN
        INSERT INTO tbl_orders_status_2 (id, type, code, quantity, time, name, username, grade, class, status)
        VALUES (NEW.id, NEW.type, NEW.code, NEW.quantity, NEW.time, NEW.name, NEW.username, NEW.grade, NEW.class, NEW.status)
        ON DUPLICATE KEY UPDATE 
            type = NEW.type,
            code = NEW.code,
            quantity = NEW.quantity,
            time = NEW.time,
            name = NEW.name,
            username = NEW.username,
            grade = NEW.grade,
            class = NEW.class,
            status = NEW.status;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orders_code1`
--

CREATE TABLE `tbl_orders_code1` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `code` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `grade` int(11) NOT NULL,
  `class` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_orders_code1`
--

INSERT INTO `tbl_orders_code1` (`id`, `type`, `code`, `quantity`, `time`, `name`, `username`, `grade`, `class`, `status`) VALUES
(1, 'ใบปพ.1', 1, 1, '2024-08-13 16:52:21', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 2),
(5, 'ใบปพ.1', 1, 1, '2024-08-13 17:34:50', 'วรินทร์สิรี บุญประดิษฐ์', '48246', 6, 7, 2),
(9, 'ใบปพ.1', 1, 1, '2024-08-29 09:38:03', 'ปวริศ ปาลสุข', '48487', 6, 7, 2),
(13, 'ใบปพ.1', 1, 1, '2024-08-13 17:33:45', 'ปวริศ ปาลสุข', '48487', 6, 7, 2),
(15, 'ใบปพ.1', 1, 1, '2024-08-30 12:33:53', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 1),
(18, 'ใบปพ.1', 1, 1, '2024-08-30 12:33:42', 'ปวริศ ปาลสุข', '48487', 6, 7, 0),
(22, 'ใบปพ.1', 1, 1, '2024-08-30 12:33:55', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 1),
(26, 'ใบปพ.1', 1, 1, '2024-08-30 12:33:56', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 1),
(32, 'ใบปพ.1', 1, 1, '2024-09-10 13:22:02', 'นันท์นภัส วิริยะวัฒนา', '51043', 0, 0, 1),
(34, 'ใบปพ.1', 1, 1, '2024-08-25 06:43:43', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 0),
(38, 'ใบปพ.1', 1, 2, '2024-09-10 13:22:02', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 1),
(39, 'ใบปพ.1', 1, 1, '2024-09-10 13:22:03', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 1),
(42, 'ใบปพ.1', 1, 1, '2024-09-10 13:22:03', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 1),
(44, 'ใบปพ.1', 1, 1, '2024-09-10 13:22:03', 'วรินทร์สิรี บุญประดิษฐ์', '48246', 6, 7, 1),
(45, 'ใบปพ.1', 1, 1, '2024-08-29 07:37:03', 'วรินทร์สิรี บุญประดิษฐ์', '48246', 6, 7, 1),
(46, 'ใบปพ.1', 1, 1, '2024-08-29 07:37:00', 'วรินทร์สิรี บุญประดิษฐ์', '48246', 6, 7, 1),
(47, 'ใบปพ.1', 1, 1, '2024-09-10 13:22:03', 'วรินทร์สิรี บุญประดิษฐ์', '48246', 6, 7, 1),
(48, 'ใบปพ.1', 1, 1, '2024-08-29 09:40:10', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 0),
(50, 'ใบปพ.1', 1, 2, '2024-08-29 10:00:46', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 0),
(52, 'ใบปพ.1', 1, 1, '2024-08-29 13:17:36', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 0),
(53, 'ใบปพ.1', 1, 1, '2024-09-05 13:31:12', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 0),
(59, 'ใบปพ.1', 1, 1, '2024-09-11 09:57:34', 'วรินทร์สิรี บุญประดิษฐ์', '48246', 6, 7, 0),
(60, 'ใบปพ.1', 1, 1, '2024-09-11 09:59:52', 'วรินทร์สิรี บุญประดิษฐ์', '48246', 6, 7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orders_code2`
--

CREATE TABLE `tbl_orders_code2` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `code` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `grade` int(11) NOT NULL,
  `class` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_orders_code2`
--

INSERT INTO `tbl_orders_code2` (`id`, `type`, `code`, `quantity`, `time`, `name`, `username`, `grade`, `class`, `status`) VALUES
(2, 'Transcript', 2, 1, '2024-08-13 16:52:21', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 2),
(6, 'Transcript', 2, 1, '2024-08-13 17:13:39', 'วรินทร์สิรี บุญประดิษฐ์', '48246', 6, 7, 2),
(10, 'Transcript', 2, 1, '2024-08-13 17:35:33', 'ปวริศ ปาลสุข', '48487', 6, 7, 2),
(14, 'Transcript', 2, 1, '2024-09-05 13:31:38', 'ปวริศ ปาลสุข', '48487', 6, 7, 1),
(16, 'Transcript', 2, 1, '2024-08-12 08:51:19', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 2),
(19, 'Transcript', 2, 1, '2024-09-10 13:29:20', 'ปวริศ ปาลสุข', '48487', 6, 7, 1),
(23, 'Transcript', 2, 1, '2024-08-12 08:52:06', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 2),
(30, 'Transcript', 2, 1, '2024-08-30 12:33:46', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 0),
(31, 'Transcript', 2, 1, '2024-08-30 12:33:47', 'นันท์นภัส วิริยะวัฒนา', '51043', 0, 0, 0),
(40, 'Transcript', 2, 1, '2024-09-10 13:29:22', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 1),
(43, 'Transcript', 2, 1, '2024-08-29 06:24:50', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 0),
(49, 'Transcript', 2, 1, '2024-08-29 09:40:10', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 0),
(51, 'Transcript', 2, 1, '2024-09-10 13:29:25', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 1),
(54, 'Transcript', 2, 1, '2024-09-05 13:31:12', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 0),
(61, 'Transcript', 2, 1, '2024-09-11 09:59:52', 'วรินทร์สิรี บุญประดิษฐ์', '48246', 6, 7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orders_code3`
--

CREATE TABLE `tbl_orders_code3` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `code` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `grade` int(11) NOT NULL,
  `class` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_orders_code3`
--

INSERT INTO `tbl_orders_code3` (`id`, `type`, `code`, `quantity`, `time`, `name`, `username`, `grade`, `class`, `status`) VALUES
(3, 'ใบปพ.7 รับรองผลการศึกษา', 3, 1, '2024-08-14 00:13:37', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 2),
(7, 'ใบปพ.7 รับรองผลการศึกษา', 3, 1, '2024-08-14 00:13:50', 'วรินทร์สิรี บุญประดิษฐ์', '48246', 6, 7, 2),
(11, 'ใบปพ.7 รับรองผลการศึกษา', 3, 1, '2024-08-29 17:06:01', 'ปวริศ ปาลสุข', '48487', 6, 7, 2),
(17, 'ใบปพ.7 รับรองผลการศึกษา', 3, 1, '2024-08-30 19:33:42', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 0),
(20, 'ใบปพ.7 รับรองผลการศึกษา', 3, 1, '2024-08-29 16:59:09', 'ปวริศ ปาลสุข', '48487', 6, 7, 1),
(24, 'ใบปพ.7 รับรองผลการศึกษา', 3, 1, '2024-08-30 19:33:45', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 0),
(33, 'ใบปพ.7 รับรองผลการศึกษา', 3, 1, '2024-08-18 11:01:23', 'นันท์นภัส วิริยะวัฒนา', '51043', 0, 0, 0),
(35, 'ใบปพ.7 รับรองผลการศึกษา', 3, 1, '2024-09-10 20:29:34', 'Teacher', '111', 0, 0, 1),
(37, 'ใบปพ.7 รับรองผลการศึกษา', 3, 1, '2024-08-29 12:35:01', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 0),
(41, 'ใบปพ.7 รับรองผลการศึกษา', 3, 1, '2024-09-10 20:29:36', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 1),
(62, 'ใบปพ.7 รับรองผลการศึกษา', 3, 1, '2024-09-11 16:59:52', 'วรินทร์สิรี บุญประดิษฐ์', '48246', 6, 7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orders_code4`
--

CREATE TABLE `tbl_orders_code4` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `code` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `grade` int(11) NOT NULL,
  `class` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_orders_code4`
--

INSERT INTO `tbl_orders_code4` (`id`, `type`, `code`, `quantity`, `time`, `name`, `username`, `grade`, `class`, `status`) VALUES
(4, 'ใบปพ.7 รับรองสภาพการเป็นนักเรียน ', 4, 1, '2024-08-13 23:52:22', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 2),
(8, 'ใบปพ.7 รับรองสภาพการเป็นนักเรียน ', 4, 1, '2024-08-25 13:58:13', 'วรินทร์สิรี บุญประดิษฐ์', '48246', 6, 7, 2),
(12, 'ใบปพ.7 รับรองสภาพการเป็นนักเรียน ', 4, 1, '2024-08-14 00:13:53', 'ปวริศ ปาลสุข', '48487', 6, 7, 2),
(21, 'ใบปพ.7 รับรองสภาพการเป็นนักเรียน ', 4, 1, '2024-08-14 00:20:18', 'ปวริศ ปาลสุข', '48487', 6, 7, 1),
(25, 'ใบปพ.7 รับรองสภาพการเป็นนักเรียน ', 4, 1, '2024-08-12 15:51:23', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 2),
(36, 'ใบปพ.7 รับรองสภาพการเป็นนักเรียน ', 4, 1, '2024-08-28 21:35:06', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 0),
(55, 'ใบปพ.7 รับรองสภาพการเป็นนักเรียน ', 4, 1, '2024-09-10 20:22:24', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 0),
(56, 'ใบปพ.7 รับรองสภาพการเป็นนักเรียน ', 4, 1, '2024-09-10 20:29:01', 'ปวริศ ปาลสุข', '48487', 6, 7, 0),
(57, 'ใบปพ.7 รับรองสภาพการเป็นนักเรียน ', 4, 3, '2024-09-10 20:30:03', 'ปวริศ ปาลสุข', '48487', 6, 7, 1),
(58, 'ใบปพ.7 รับรองสภาพการเป็นนักเรียน ', 4, 1, '2024-09-10 20:30:49', 'วรินทร์สิรี บุญประดิษฐ์', '48246', 6, 7, 1),
(63, 'ใบปพ.7 รับรองสภาพการเป็นนักเรียน ', 4, 1, '2024-09-11 16:59:52', 'วรินทร์สิรี บุญประดิษฐ์', '48246', 6, 7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orders_status_0`
--

CREATE TABLE `tbl_orders_status_0` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `code` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `grade` int(11) NOT NULL,
  `class` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_orders_status_0`
--

INSERT INTO `tbl_orders_status_0` (`id`, `type`, `code`, `quantity`, `time`, `name`, `username`, `grade`, `class`, `status`) VALUES
(17, 'ใบปพ.7 รับรองผลการศึกษา', 3, 1, '2024-08-30 19:33:42', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 0),
(18, 'ใบปพ.1', 1, 1, '2024-08-30 19:33:42', 'ปวริศ ปาลสุข', '48487', 6, 7, 0),
(24, 'ใบปพ.7 รับรองผลการศึกษา', 3, 1, '2024-08-30 19:33:45', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 0),
(30, 'Transcript', 2, 1, '2024-08-30 19:33:46', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 0),
(31, 'Transcript', 2, 1, '2024-08-30 19:33:47', 'นันท์นภัส วิริยะวัฒนา', '51043', 0, 0, 0),
(33, 'ใบปพ.7 รับรองผลการศึกษา', 3, 1, '2024-08-18 11:01:23', 'นันท์นภัส วิริยะวัฒนา', '51043', 0, 0, 0),
(34, 'ใบปพ.1', 1, 1, '2024-08-25 13:43:43', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 0),
(36, 'ใบปพ.7 รับรองสภาพการเป็นนักเรียน ', 4, 1, '2024-08-28 21:35:06', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 0),
(37, 'ใบปพ.7 รับรองผลการศึกษา', 3, 1, '2024-08-29 12:35:01', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 0),
(43, 'Transcript', 2, 1, '2024-08-29 13:24:50', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 0),
(48, 'ใบปพ.1', 1, 1, '2024-08-29 16:40:10', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 0),
(49, 'Transcript', 2, 1, '2024-08-29 16:40:10', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 0),
(50, 'ใบปพ.1', 1, 2, '2024-08-29 17:00:46', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 0),
(52, 'ใบปพ.1', 1, 1, '2024-08-29 20:17:36', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 0),
(53, 'ใบปพ.1', 1, 1, '2024-09-05 20:31:12', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 0),
(54, 'Transcript', 2, 1, '2024-09-05 20:31:12', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 0),
(55, 'ใบปพ.7 รับรองสภาพการเป็นนักเรียน ', 4, 1, '2024-09-10 20:22:24', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 0),
(56, 'ใบปพ.7 รับรองสภาพการเป็นนักเรียน ', 4, 1, '2024-09-10 20:29:01', 'ปวริศ ปาลสุข', '48487', 6, 7, 0),
(59, 'ใบปพ.1', 1, 1, '2024-09-11 16:57:34', 'วรินทร์สิรี บุญประดิษฐ์', '48246', 6, 7, 0),
(60, 'ใบปพ.1', 1, 1, '2024-09-11 16:59:52', 'วรินทร์สิรี บุญประดิษฐ์', '48246', 6, 7, 0),
(61, 'Transcript', 2, 1, '2024-09-11 16:59:52', 'วรินทร์สิรี บุญประดิษฐ์', '48246', 6, 7, 0),
(62, 'ใบปพ.7 รับรองผลการศึกษา', 3, 1, '2024-09-11 16:59:52', 'วรินทร์สิรี บุญประดิษฐ์', '48246', 6, 7, 0),
(63, 'ใบปพ.7 รับรองสภาพการเป็นนักเรียน ', 4, 1, '2024-09-11 16:59:52', 'วรินทร์สิรี บุญประดิษฐ์', '48246', 6, 7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orders_status_1`
--

CREATE TABLE `tbl_orders_status_1` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `code` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `grade` int(11) NOT NULL,
  `class` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_orders_status_1`
--

INSERT INTO `tbl_orders_status_1` (`id`, `type`, `code`, `quantity`, `time`, `name`, `username`, `grade`, `class`, `status`) VALUES
(14, 'Transcript', 2, 1, '2024-09-05 20:31:38', 'ปวริศ ปาลสุข', '48487', 6, 7, 1),
(15, 'ใบปพ.1', 1, 1, '2024-08-30 19:33:53', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 1),
(19, 'Transcript', 2, 1, '2024-09-10 20:29:20', 'ปวริศ ปาลสุข', '48487', 6, 7, 1),
(20, 'ใบปพ.7 รับรองผลการศึกษา', 3, 1, '2024-08-29 16:59:09', 'ปวริศ ปาลสุข', '48487', 6, 7, 1),
(21, 'ใบปพ.7 รับรองสภาพการเป็นนักเรียน ', 4, 1, '2024-08-14 00:20:18', 'ปวริศ ปาลสุข', '48487', 6, 7, 1),
(22, 'ใบปพ.1', 1, 1, '2024-08-30 19:33:55', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 1),
(26, 'ใบปพ.1', 1, 1, '2024-08-30 19:33:56', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 1),
(32, 'ใบปพ.1', 1, 1, '2024-09-10 20:22:02', 'นันท์นภัส วิริยะวัฒนา', '51043', 0, 0, 1),
(35, 'ใบปพ.7 รับรองผลการศึกษา', 3, 1, '2024-09-10 20:29:34', 'Teacher', '111', 0, 0, 1),
(38, 'ใบปพ.1', 1, 2, '2024-09-10 20:22:02', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 1),
(39, 'ใบปพ.1', 1, 1, '2024-09-10 20:22:03', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 1),
(40, 'Transcript', 2, 1, '2024-09-10 20:29:22', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 1),
(41, 'ใบปพ.7 รับรองผลการศึกษา', 3, 1, '2024-09-10 20:29:36', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 1),
(42, 'ใบปพ.1', 1, 1, '2024-09-10 20:22:03', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 1),
(44, 'ใบปพ.1', 1, 1, '2024-09-10 20:22:03', 'วรินทร์สิรี บุญประดิษฐ์', '48246', 6, 7, 1),
(45, 'ใบปพ.1', 1, 1, '2024-08-29 14:37:03', 'วรินทร์สิรี บุญประดิษฐ์', '48246', 6, 7, 1),
(46, 'ใบปพ.1', 1, 1, '2024-08-29 14:37:00', 'วรินทร์สิรี บุญประดิษฐ์', '48246', 6, 7, 1),
(47, 'ใบปพ.1', 1, 1, '2024-09-10 20:22:03', 'วรินทร์สิรี บุญประดิษฐ์', '48246', 6, 7, 1),
(51, 'Transcript', 2, 1, '2024-09-10 20:29:25', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 1),
(57, 'ใบปพ.7 รับรองสภาพการเป็นนักเรียน ', 4, 3, '2024-09-10 20:30:03', 'ปวริศ ปาลสุข', '48487', 6, 7, 1),
(58, 'ใบปพ.7 รับรองสภาพการเป็นนักเรียน ', 4, 1, '2024-09-10 20:30:49', 'วรินทร์สิรี บุญประดิษฐ์', '48246', 6, 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orders_status_2`
--

CREATE TABLE `tbl_orders_status_2` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `code` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `grade` int(11) NOT NULL,
  `class` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_orders_status_2`
--

INSERT INTO `tbl_orders_status_2` (`id`, `type`, `code`, `quantity`, `time`, `name`, `username`, `grade`, `class`, `status`) VALUES
(1, 'ใบปพ.1', 1, 1, '2024-08-13 23:52:21', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 2),
(2, 'Transcript', 2, 1, '2024-08-13 23:52:21', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 2),
(3, 'ใบปพ.7 รับรองผลการศึกษา', 3, 1, '2024-08-14 00:13:37', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 2),
(4, 'ใบปพ.7 รับรองสภาพการเป็นนักเรียน ', 4, 1, '2024-08-13 23:52:22', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 2),
(5, 'ใบปพ.1', 1, 1, '2024-08-14 00:34:50', 'วรินทร์สิรี บุญประดิษฐ์', '48246', 6, 7, 2),
(6, 'Transcript', 2, 1, '2024-08-14 00:13:39', 'วรินทร์สิรี บุญประดิษฐ์', '48246', 6, 7, 2),
(7, 'ใบปพ.7 รับรองผลการศึกษา', 3, 1, '2024-08-14 00:13:50', 'วรินทร์สิรี บุญประดิษฐ์', '48246', 6, 7, 2),
(8, 'ใบปพ.7 รับรองสภาพการเป็นนักเรียน ', 4, 1, '2024-08-25 13:58:13', 'วรินทร์สิรี บุญประดิษฐ์', '48246', 6, 7, 2),
(9, 'ใบปพ.1', 1, 1, '2024-08-29 16:38:03', 'ปวริศ ปาลสุข', '48487', 6, 7, 2),
(10, 'Transcript', 2, 1, '2024-08-14 00:35:33', 'ปวริศ ปาลสุข', '48487', 6, 7, 2),
(11, 'ใบปพ.7 รับรองผลการศึกษา', 3, 1, '2024-08-29 17:06:01', 'ปวริศ ปาลสุข', '48487', 6, 7, 2),
(12, 'ใบปพ.7 รับรองสภาพการเป็นนักเรียน ', 4, 1, '2024-08-14 00:13:53', 'ปวริศ ปาลสุข', '48487', 6, 7, 2),
(13, 'ใบปพ.1', 1, 1, '2024-08-14 00:33:45', 'ปวริศ ปาลสุข', '48487', 6, 7, 2),
(16, 'Transcript', 2, 1, '2024-08-12 15:51:19', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 2),
(23, 'Transcript', 2, 1, '2024-08-12 15:52:06', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 2),
(25, 'ใบปพ.7 รับรองสภาพการเป็นนักเรียน ', 4, 1, '2024-08-12 15:51:23', 'นันท์นภัส วิริยะวัฒนา', '51043', 6, 7, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_products`
--

CREATE TABLE `tbl_products` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_products`
--

INSERT INTO `tbl_products` (`id`, `type`, `image`, `code`) VALUES
(1, 'ใบปพ.1', 'transcript_thai.jpeg', 1),
(2, 'Transcript', 'transcript.jpg', 2),
(3, 'ใบปพ.7 รับรองผลการศึกษา', 'confirm_7.jpg', 3),
(4, 'ใบปพ.7 รับรองสภาพการเป็นนักเรียน ', 'student_7.jpg', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `tbl`
--
ALTER TABLE `tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_orders_code1`
--
ALTER TABLE `tbl_orders_code1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_orders_code2`
--
ALTER TABLE `tbl_orders_code2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_orders_code3`
--
ALTER TABLE `tbl_orders_code3`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_orders_code4`
--
ALTER TABLE `tbl_orders_code4`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_orders_status_0`
--
ALTER TABLE `tbl_orders_status_0`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_orders_status_1`
--
ALTER TABLE `tbl_orders_status_1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_orders_status_2`
--
ALTER TABLE `tbl_orders_status_2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_products`
--
ALTER TABLE `tbl_products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl`
--
ALTER TABLE `tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `tbl_orders_code1`
--
ALTER TABLE `tbl_orders_code1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `tbl_orders_code2`
--
ALTER TABLE `tbl_orders_code2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `tbl_orders_code3`
--
ALTER TABLE `tbl_orders_code3`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `tbl_orders_code4`
--
ALTER TABLE `tbl_orders_code4`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `tbl_orders_status_0`
--
ALTER TABLE `tbl_orders_status_0`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `tbl_orders_status_1`
--
ALTER TABLE `tbl_orders_status_1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `tbl_orders_status_2`
--
ALTER TABLE `tbl_orders_status_2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tbl_products`
--
ALTER TABLE `tbl_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
