-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 23, 2022 at 07:14 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hrms`
--

-- --------------------------------------------------------

--
-- Table structure for table `allowances`
--

CREATE TABLE `allowances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL DEFAULT 0,
  `branch_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assign_modules`
--

CREATE TABLE `assign_modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`module_ids`)),
  `module_names` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`module_names`)),
  `company_id` int(11) NOT NULL DEFAULT 0,
  `branch_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assign_modules`
--

INSERT INTO `assign_modules` (`id`, `module_ids`, `module_names`, `company_id`, `branch_id`, `created_at`, `updated_at`) VALUES
(5, '[]', '[]', 6, 0, '2022-07-13 09:55:22', '2022-07-13 11:17:17'),
(6, '[15]', '[\"attendance\"]', 1, 0, '2022-07-13 10:45:18', '2022-07-15 05:37:12');

-- --------------------------------------------------------

--
-- Table structure for table `assign_permissions`
--

CREATE TABLE `assign_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(11) NOT NULL,
  `permission_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`permission_ids`)),
  `permission_names` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`permission_names`)),
  `company_id` int(11) NOT NULL DEFAULT 0,
  `branch_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assign_permissions`
--

INSERT INTO `assign_permissions` (`id`, `role_id`, `permission_ids`, `permission_names`, `company_id`, `branch_id`, `created_at`, `updated_at`) VALUES
(8, 1, '[40]', '[\"assign_permission_access\"]', 0, 0, '2022-07-16 08:14:02', '2022-07-16 08:14:28'),
(10, 9, '[40]', '[\"assign_permission_access\"]', 1, 0, '2022-07-16 08:22:03', '2022-07-16 08:36:20');

-- --------------------------------------------------------

--
-- Table structure for table `attendance_logs`
--

CREATE TABLE `attendance_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `UserID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LogTime` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DeviceID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SerialNumber` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` int(11) NOT NULL DEFAULT 0,
  `branch_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendance_logs`
--

INSERT INTO `attendance_logs` (`id`, `UserID`, `LogTime`, `DeviceID`, `SerialNumber`, `created_at`, `updated_at`, `company_id`, `branch_id`) VALUES
(1, '112', '2022-06-08 08:20:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(2, '155', '2022-06-08 08:21:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(3, '138', '2022-07-23 08:22:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(4, '125', '2022-06-08 08:23:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(5, '146', '2022-06-08 08:24:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(6, '133', '2022-06-08 08:25:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(7, '134', '2022-06-08 08:26:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(8, '147', '2022-06-08 08:27:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(9, '143', '2022-06-08 08:28:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(10, '129', '2022-06-08 08:29:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(11, '150', '2022-06-08 08:30:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(12, '117', '2022-06-08 08:31:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(13, '153', '2022-06-08 08:32:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(14, '105', '2022-06-08 08:33:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(15, '116', '2022-06-08 08:34:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(16, '139', '2022-06-08 08:35:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(17, '140', '2022-06-08 08:36:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(18, '130', '2022-06-08 08:37:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(19, '104', '2022-06-08 08:38', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(20, '128', '2022-06-08 08:39', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(21, '136', '2022-06-08 08:40:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(22, '145', '2022-06-08 08:41:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(23, '118', '2022-06-08 08:42:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(24, '135', '2022-06-08 08:43:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(25, '108', '2022-06-08 08:44:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(26, '114', '2022-06-08 08:45:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(27, '107', '2022-06-08 08:46:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(28, '127', '2022-06-08 08:47:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(29, '156', '2022-06-08 08:48:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(30, '111', '2022-06-08 08:49:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(31, '148', '2022-06-08 08:50:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(32, '113', '2022-06-08 08:51:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(33, '102', '2022-06-08 08:52:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(34, '106', '2022-06-08 08:53:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(35, '110', '2022-06-08 08:54:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(36, '109', '2022-06-08 08:55:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(37, '144', '2022-06-08 08:56:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(38, '152', '2022-06-08 08:57:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(39, '162', '2022-06-08 08:58:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(40, '149', '2022-06-08 08:59:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(41, '163', '2022-06-08 08:60:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(42, '159', '2022-06-08 08:61:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(43, '120', '2022-06-08 08:62:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(44, '132', '2022-06-08 08:63:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(45, '154', '2022-06-08 08:64:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(46, '122', '2022-06-08 08:65:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(47, '101', '2022-06-08 08:66:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(48, '119', '2022-06-08 08:67:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(49, '126', '2022-06-08 08:68:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(50, '151', '2022-06-08 08:69:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(51, '121', '2022-06-08 08:70:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(52, '164', '2022-06-08 08:71:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(53, '137', '2022-06-08 08:72:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(54, '160', '2022-06-08 08:73:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(55, '131', '2022-06-08 08:74:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(56, '157', '2022-06-08 08:75:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(57, '158', '2022-06-08 08:76:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(58, '141', '2022-06-08 08:77:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(59, '124', '2022-06-08 08:78:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(60, '161', '2022-06-08 08:79:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(61, '165', '2022-06-08 08:80:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(62, '112', '2022-06-08 18:45:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(63, '155', '2022-06-08 10:21:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(64, '138', '2022-07-23 18:47:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(65, '125', '2022-06-08 18:47:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(66, '146', '2022-06-08 18:47:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(67, '133', '2022-06-08 18:47:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(68, '134', '2022-06-08 18:47:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(69, '147', '2022-06-08 18:47:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(70, '143', '2022-06-08 18:47:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(71, '129', '2022-06-08 18:47:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(72, '150', '2022-06-08 18:47:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(73, '117', '2022-06-08 18:47:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(74, '153', '2022-06-08 18:45:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(75, '105', '2022-06-08 18:47:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(76, '116', '2022-06-08 18:40:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(77, '139', '2022-06-08 18:40:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(78, '140', '2022-06-08 18:01:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(79, '130', '2022-06-08 18:03:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(80, '104', '2022-06-08 18:01:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(81, '128', '2022-06-08 18:26:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(82, '136', '2022-06-08 18:02:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(83, '145', '2022-06-08 18:26:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(84, '118', '2022-06-08 18:26:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(85, '135', '2022-06-08 18:26:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(86, '108', '2022-06-08 18:26:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(87, '114', '2022-06-08 18:26:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(88, '107', '2022-06-08 18:26:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(89, '127', '2022-06-08 18:26:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(90, '156', '2022-06-08 18:26:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(91, '111', '2022-06-08 18:26:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(92, '148', '2022-06-08 18:26:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(93, '113', '2022-06-08 18:26:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(94, '102', '2022-06-08 18:26:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(95, '106', '2022-06-08 18:26:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(96, '110', '2022-06-08 18:26:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(97, '109', '2022-06-08 18:26:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(98, '144', '2022-06-08 18:26:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(99, '152', '2022-06-08 18:26:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(100, '162', '2022-06-08 18:26:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(101, '149', '2022-06-08 18:26:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(102, '163', '2022-06-08 18:26:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(103, '159', '2022-06-08 18:26:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(104, '120', '2022-06-08 18:26:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(105, '132', '2022-06-08 18:26:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(106, '154', '2022-06-08 18:26:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(107, '122', '2022-06-08 18:26:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(108, '101', '2022-06-08 18:26:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(109, '119', '2022-06-08 18:26:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(110, '126', '2022-06-08 18:26:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(111, '151', '2022-06-08 18:26:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(112, '121', '2022-06-08 18:26:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(113, '164', '2022-06-08 18:26:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(114, '137', '2022-06-08 18:26:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(115, '160', '2022-06-08 18:26:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(116, '131', '2022-06-08 18:26:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(117, '157', '2022-06-08 18:26:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(118, '158', '2022-06-08 18:26:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(119, '141', '2022-06-08 18:26:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(120, '124', '2022-06-08 18:26:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(121, '161', '2022-06-08 18:26:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(122, '165', '2022-06-08 18:26:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(123, '155', '2022-06-08 20:21:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(124, '138', '2022-07-23 20:22:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(125, '138', '2022-07-22 08:22:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(126, '138', '2022-07-22 20:22:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(127, '138', '2022-07-21 09:30:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(128, '138', '2022-07-21 21:30:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(129, '155', '2022-07-23 08:40:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0),
(130, '155', '2022-07-23 20:40:00', 'OX-8862021010011', NULL, NULL, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `bank_infos`
--

CREATE TABLE `bank_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iban` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL DEFAULT 0,
  `branch_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `member_from` date NOT NULL,
  `expiry` date NOT NULL,
  `max_employee` int(11) NOT NULL,
  `max_devices` int(11) NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `branch_contacts`
--

CREATE TABLE `branch_contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `whatsapp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `commissions`
--

CREATE TABLE `commissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL DEFAULT 0,
  `branch_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `member_from` date NOT NULL,
  `expiry` date NOT NULL,
  `max_employee` int(11) NOT NULL,
  `max_devices` int(11) NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `user_id`, `name`, `member_from`, `expiry`, `max_employee`, `max_devices`, `location`, `logo`, `created_at`, `updated_at`) VALUES
(1, 2, 'demo company', '1982-09-04', '2012-10-24', 10, 10, 'demo location', NULL, '2022-07-13 03:48:14', '2022-07-13 03:48:14'),
(2, 3, 'Facilis ea', '1988-06-15', '1996-09-03', 53, 6, 'Recusandae Id error', NULL, '2022-07-13 03:50:17', '2022-07-13 03:50:28');

-- --------------------------------------------------------

--
-- Table structure for table `company_contacts`
--

CREATE TABLE `company_contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `whatsapp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `company_contacts`
--

INSERT INTO `company_contacts` (`id`, `company_id`, `name`, `number`, `position`, `whatsapp`, `created_at`, `updated_at`) VALUES
(1, 1, 'demo contact name', '11111111', 'demo contact position', '22222222', '2022-07-13 03:48:14', '2022-07-13 03:48:14'),
(2, 2, 'Voluptate', '2525252525', 'Animi amet autem r', '2525252525', '2022-07-13 03:50:17', '2022-07-13 03:50:45');

-- --------------------------------------------------------

--
-- Table structure for table `company_modules`
--

CREATE TABLE `company_modules` (
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deductions`
--

CREATE TABLE `deductions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL DEFAULT 0,
  `branch_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `branch_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `company_id`, `branch_id`, `created_at`, `updated_at`) VALUES
(7, 'sales', '1', '0', '2022-07-14 04:26:46', '2022-07-18 06:51:00'),
(10, 'repellendus volupta', '2', '0', '2022-07-16 03:34:23', '2022-07-16 03:34:23'),
(11, 'marketing', '1', '0', '2022-07-18 06:50:06', '2022-07-18 06:50:55'),
(12, 'hr department', '1', '0', '2022-07-18 06:50:11', '2022-07-18 06:57:21');

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE `designations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_id` int(11) NOT NULL DEFAULT 0,
  `company_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `branch_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`id`, `name`, `department_id`, `company_id`, `branch_id`, `created_at`, `updated_at`) VALUES
(7, 'sales officer', 7, '1', '0', '2022-07-14 04:46:57', '2022-07-18 06:54:24'),
(8, 'fsdfsdf', 10, '2', '0', '2022-07-16 03:34:32', '2022-07-16 03:34:32'),
(9, 'hr officer', 12, '1', '0', '2022-07-18 06:53:07', '2022-07-18 06:54:15'),
(10, 'marketing manager', 11, '1', '0', '2022-07-18 06:53:24', '2022-07-18 06:53:24'),
(11, 'marketing officer', 11, '1', '0', '2022-07-18 06:54:01', '2022-07-18 06:54:01'),
(12, 'sales manager', 7, '1', '0', '2022-07-18 06:54:40', '2022-07-18 06:54:40'),
(13, 'hr manager', 12, '1', '0', '2022-07-18 06:57:53', '2022-07-18 06:57:53');

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

CREATE TABLE `devices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `branch_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `status_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `device_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `devices`
--

INSERT INTO `devices` (`id`, `company_id`, `branch_id`, `status_id`, `name`, `device_id`, `location`, `created_at`, `updated_at`) VALUES
(6, 1, 0, 1, 'In porro lorem at cu', 'OX-8862021010011', 'Veritatis omnis fugi', '2022-07-14 07:00:27', '2022-07-14 07:01:11'),
(7, 1, 0, 2, 'Consequatur duis la', 'OX-8862021010012', 'Ut quos reprehenderi', '2022-07-14 07:02:26', '2022-07-14 07:07:00'),
(8, 2, 0, 2, 'Dicta perferendis qu', 'OX-8862021010013', 'Excepturi impedit a', '2022-07-14 07:07:33', '2022-07-14 07:07:33');

-- --------------------------------------------------------

--
-- Table structure for table `device_statuses`
--

CREATE TABLE `device_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `device_statuses`
--

INSERT INTO `device_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'active', '2022-07-13 03:48:14', '2022-07-13 03:48:14'),
(2, 'inactive', '2022-07-13 03:48:14', '2022-07-13 03:48:14');

-- --------------------------------------------------------

--
-- Table structure for table `document_infos`
--

CREATE TABLE `document_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL DEFAULT 0,
  `branch_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_relative_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp_relative_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `designation_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `company_id` int(11) NOT NULL DEFAULT 0,
  `branch_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `isAutoShift` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `first_name`, `last_name`, `profile_picture`, `phone_number`, `whatsapp_number`, `phone_relative_number`, `whatsapp_relative_number`, `employee_id`, `joining_date`, `designation_id`, `department_id`, `user_id`, `company_id`, `branch_id`, `created_at`, `updated_at`, `isAutoShift`) VALUES
(1, 'first_name 1', 'last_name 1', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '112', '2012-08-11', NULL, NULL, 167, 2, 0, '2022-07-22 08:45:42', '2022-07-22 08:45:42', 1),
(2, 'first_name 2', 'last_name 2', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '155', '2012-08-11', 11, 11, 168, 1, 0, '2022-07-22 08:45:42', '2022-07-23 12:40:47', 0),
(3, 'first_name 3', 'last_name 3', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '138', '2012-08-11', 7, 7, 169, 1, 0, '2022-07-22 08:45:42', '2022-07-23 12:41:32', 0),
(4, 'first_name 4', 'last_name 4', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '125', '2012-08-11', NULL, NULL, 170, 1, 0, '2022-07-22 08:45:42', '2022-07-22 08:45:42', 1),
(5, 'first_name 5', 'last_name 5', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '146', '2012-08-11', NULL, NULL, 171, 1, 0, '2022-07-22 08:45:42', '2022-07-22 08:45:42', 1),
(6, 'first_name 6', 'last_name 6', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '133', '2012-08-11', NULL, NULL, 172, 1, 0, '2022-07-22 08:45:42', '2022-07-22 08:45:42', 1),
(7, 'first_name 7', 'last_name 7', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '134', '2012-08-11', NULL, NULL, 173, 1, 0, '2022-07-22 08:45:42', '2022-07-22 08:45:42', 1),
(8, 'first_name 8', 'last_name 8', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '147', '2012-08-11', NULL, NULL, 174, 1, 0, '2022-07-22 08:45:42', '2022-07-22 08:45:42', 1),
(9, 'first_name 9', 'last_name 9', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '143', '2012-08-11', NULL, NULL, 175, 1, 0, '2022-07-22 08:45:42', '2022-07-22 08:45:42', 1),
(10, 'first_name 10', 'last_name 10', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '129', '2012-08-11', NULL, NULL, 176, 1, 0, '2022-07-22 08:45:42', '2022-07-22 08:45:42', 1),
(11, 'first_name 11', 'last_name 11', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '150', '2012-08-11', NULL, NULL, 177, 1, 0, '2022-07-22 08:45:43', '2022-07-22 08:45:43', 1),
(12, 'first_name 12', 'last_name 12', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '117', '2012-08-11', NULL, NULL, 178, 1, 0, '2022-07-22 08:45:43', '2022-07-22 08:45:43', 1),
(13, 'first_name 13', 'last_name 13', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '153', '2012-08-11', NULL, NULL, 179, 1, 0, '2022-07-22 08:45:43', '2022-07-22 08:45:43', 1),
(14, 'first_name 14', 'last_name 14', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '105', '2012-08-11', NULL, NULL, 180, 1, 0, '2022-07-22 08:45:43', '2022-07-22 08:45:43', 1),
(15, 'first_name 15', 'last_name 15', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '116', '2012-08-11', NULL, NULL, 181, 1, 0, '2022-07-22 08:45:43', '2022-07-22 08:45:43', 1),
(16, 'first_name 16', 'last_name 16', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '139', '2012-08-11', NULL, NULL, 182, 1, 0, '2022-07-22 08:45:43', '2022-07-22 08:45:43', 1),
(17, 'first_name 17', 'last_name 17', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '140', '2012-08-11', NULL, NULL, 183, 1, 0, '2022-07-22 08:45:43', '2022-07-22 08:45:43', 1),
(18, 'first_name 18', 'last_name 18', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '130', '2012-08-11', NULL, NULL, 184, 1, 0, '2022-07-22 08:45:43', '2022-07-22 08:45:43', 1),
(19, 'first_name 19', 'last_name 19', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '104', '2012-08-11', NULL, NULL, 185, 1, 0, '2022-07-22 08:45:43', '2022-07-22 08:45:43', 1),
(20, 'first_name 20', 'last_name 20', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '128', '2012-08-11', NULL, NULL, 186, 1, 0, '2022-07-22 08:45:43', '2022-07-22 08:45:43', 1),
(21, 'first_name 21', 'last_name 21', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '136', '2012-08-11', NULL, NULL, 187, 1, 0, '2022-07-22 08:45:43', '2022-07-22 08:45:43', 1),
(22, 'first_name 22', 'last_name 22', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '145', '2012-08-11', NULL, NULL, 188, 1, 0, '2022-07-22 08:45:43', '2022-07-22 08:45:43', 1),
(23, 'first_name 23', 'last_name 23', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '118', '2012-08-11', NULL, NULL, 189, 1, 0, '2022-07-22 08:45:44', '2022-07-22 08:45:44', 1),
(24, 'first_name 24', 'last_name 24', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '135', '2012-08-11', NULL, NULL, 190, 1, 0, '2022-07-22 08:45:44', '2022-07-22 08:45:44', 1),
(25, 'first_name 25', 'last_name 25', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '108', '2012-08-11', NULL, NULL, 191, 1, 0, '2022-07-22 08:45:44', '2022-07-22 08:45:44', 1),
(26, 'first_name 26', 'last_name 26', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '114', '2012-08-11', NULL, NULL, 192, 1, 0, '2022-07-22 08:45:44', '2022-07-22 08:45:44', 1),
(27, 'first_name 27', 'last_name 27', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '107', '2012-08-11', NULL, NULL, 193, 1, 0, '2022-07-22 08:45:44', '2022-07-22 08:45:44', 1),
(28, 'first_name 28', 'last_name 28', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '127', '2012-08-11', NULL, NULL, 194, 1, 0, '2022-07-22 08:45:44', '2022-07-22 08:45:44', 1),
(29, 'first_name 29', 'last_name 29', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '156', '2012-08-11', NULL, NULL, 195, 1, 0, '2022-07-22 08:45:44', '2022-07-22 08:45:44', 1),
(30, 'first_name 30', 'last_name 30', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '111', '2012-08-11', NULL, NULL, 196, 1, 0, '2022-07-22 08:45:44', '2022-07-22 08:45:44', 1),
(31, 'first_name 31', 'last_name 31', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '148', '2012-08-11', NULL, NULL, 197, 1, 0, '2022-07-22 08:45:44', '2022-07-22 08:45:44', 1),
(32, 'first_name 32', 'last_name 32', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '113', '2012-08-11', NULL, NULL, 198, 1, 0, '2022-07-22 08:45:44', '2022-07-22 08:45:44', 1),
(33, 'first_name 33', 'last_name 33', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '102', '2012-08-11', NULL, NULL, 199, 1, 0, '2022-07-22 08:45:44', '2022-07-22 08:45:44', 1),
(34, 'first_name 34', 'last_name 34', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '106', '2012-08-11', NULL, NULL, 200, 1, 0, '2022-07-22 08:45:44', '2022-07-22 08:45:44', 1),
(35, 'first_name 35', 'last_name 35', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '110', '2012-08-11', NULL, NULL, 201, 1, 0, '2022-07-22 08:45:44', '2022-07-22 08:45:44', 1),
(36, 'first_name 36', 'last_name 36', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '109', '2012-08-11', NULL, NULL, 202, 1, 0, '2022-07-22 08:45:45', '2022-07-22 08:45:45', 1),
(37, 'first_name 37', 'last_name 37', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '144', '2012-08-11', NULL, NULL, 203, 1, 0, '2022-07-22 08:45:45', '2022-07-22 08:45:45', 1),
(38, 'first_name 38', 'last_name 38', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '152', '2012-08-11', NULL, NULL, 204, 1, 0, '2022-07-22 08:45:45', '2022-07-22 08:45:45', 1),
(39, 'first_name 39', 'last_name 39', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '162', '2012-08-11', NULL, NULL, 205, 1, 0, '2022-07-22 08:45:45', '2022-07-22 08:45:45', 1),
(40, 'first_name 40', 'last_name 40', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '149', '2012-08-11', NULL, NULL, 206, 1, 0, '2022-07-22 08:45:45', '2022-07-22 08:45:45', 1),
(41, 'first_name 41', 'last_name 41', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '163', '2012-08-11', NULL, NULL, 207, 1, 0, '2022-07-22 08:45:45', '2022-07-22 08:45:45', 1),
(42, 'first_name 42', 'last_name 42', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '159', '2012-08-11', NULL, NULL, 208, 1, 0, '2022-07-22 08:45:45', '2022-07-22 08:45:45', 1),
(43, 'first_name 43', 'last_name 43', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '120', '2012-08-11', NULL, NULL, 209, 1, 0, '2022-07-22 08:45:45', '2022-07-22 08:45:45', 1),
(44, 'first_name 44', 'last_name 44', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '132', '2012-08-11', NULL, NULL, 210, 1, 0, '2022-07-22 08:45:45', '2022-07-22 08:45:45', 1),
(45, 'first_name 45', 'last_name 45', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '154', '2012-08-11', NULL, NULL, 211, 1, 0, '2022-07-22 08:45:45', '2022-07-22 08:45:45', 1),
(46, 'first_name 46', 'last_name 46', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '122', '2012-08-11', NULL, NULL, 212, 1, 0, '2022-07-22 08:45:45', '2022-07-22 08:45:45', 1),
(47, 'first_name 47', 'last_name 47', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '101', '2012-08-11', NULL, NULL, 213, 1, 0, '2022-07-22 08:45:45', '2022-07-22 08:45:45', 1),
(48, 'first_name 48', 'last_name 48', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '119', '2012-08-11', NULL, NULL, 214, 1, 0, '2022-07-22 08:45:46', '2022-07-22 08:45:46', 1),
(49, 'first_name 49', 'last_name 49', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '126', '2012-08-11', NULL, NULL, 215, 1, 0, '2022-07-22 08:45:46', '2022-07-22 08:45:46', 1),
(50, 'first_name 50', 'last_name 50', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '151', '2012-08-11', NULL, NULL, 216, 1, 0, '2022-07-22 08:45:46', '2022-07-22 08:45:46', 1),
(51, 'first_name 51', 'last_name 51', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '121', '2012-08-11', NULL, NULL, 217, 1, 0, '2022-07-22 08:45:46', '2022-07-22 08:45:46', 1),
(52, 'first_name 52', 'last_name 52', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '164', '2012-08-11', NULL, NULL, 218, 1, 0, '2022-07-22 08:45:46', '2022-07-22 08:45:46', 1),
(53, 'first_name 53', 'last_name 53', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '137', '2012-08-11', NULL, NULL, 219, 1, 0, '2022-07-22 08:45:46', '2022-07-22 08:45:46', 1),
(54, 'first_name 54', 'last_name 54', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '160', '2012-08-11', NULL, NULL, 220, 1, 0, '2022-07-22 08:45:46', '2022-07-22 08:45:46', 1),
(55, 'first_name 55', 'last_name 55', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '131', '2012-08-11', NULL, NULL, 221, 1, 0, '2022-07-22 08:45:46', '2022-07-22 08:45:46', 1),
(56, 'first_name 56', 'last_name 56', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '157', '2012-08-11', NULL, NULL, 222, 1, 0, '2022-07-22 08:45:46', '2022-07-22 08:45:46', 1),
(57, 'first_name 57', 'last_name 57', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '158', '2012-08-11', NULL, NULL, 223, 1, 0, '2022-07-22 08:45:47', '2022-07-22 08:45:47', 1),
(58, 'first_name 58', 'last_name 58', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '141', '2012-08-11', NULL, NULL, 224, 1, 0, '2022-07-22 08:45:47', '2022-07-22 08:45:47', 1),
(59, 'first_name 59', 'last_name 59', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '124', '2012-08-11', NULL, NULL, 225, 1, 0, '2022-07-22 08:45:47', '2022-07-22 08:45:47', 1),
(60, 'first_name 60', 'last_name 60', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '161', '2012-08-11', NULL, NULL, 226, 1, 0, '2022-07-22 08:45:47', '2022-07-22 08:45:47', 1),
(61, 'first_name 61', 'last_name 61', NULL, '3108559858', '3108559858', '3108559858', '3108559858', '165', '2012-08-11', 11, 11, 227, 1, 0, '2022-07-22 08:45:47', '2022-07-22 08:48:09', 1);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_01_30_162809_create_assign_permissions_table', 1),
(6, '2022_06_13_073058_create_companies_table', 1),
(7, '2022_06_13_074931_create_company_contacts_table', 1),
(8, '2022_06_14_085305_create_branches_table', 1),
(9, '2022_06_14_093706_create_branch_contacts_table', 1),
(10, '2022_06_14_115452_create_device_statuses_table', 1),
(11, '2022_06_14_115453_create_devices_table', 1),
(12, '2022_06_15_070801_create_modules_table', 1),
(13, '2022_06_15_070838_create_company_modules_table', 1),
(14, '2022_06_18_090948_create_attendance_logs_table', 1),
(15, '2022_06_21_141733_create_departments_table', 1),
(16, '2022_06_21_150829_create_designations_table', 1),
(17, '2022_06_22_081703_create_roles_table', 1),
(18, '2022_06_22_143654_create_permissions_table', 1),
(19, '2022_06_25_090951_create_employees_table', 1),
(20, '2022_07_04_071625_create_personal_infos_table', 1),
(21, '2022_07_04_090306_create_bank_infos_table', 1),
(22, '2022_07_04_112353_create_document_infos_table', 1),
(23, '2022_07_05_134501_create_salary_types_table', 1),
(24, '2022_07_05_151702_create_salaries_table', 1),
(25, '2022_07_06_093952_create_deductions_table', 1),
(26, '2022_07_06_143330_create_overtimes_table', 1),
(27, '2022_07_06_151738_create_allowances_table', 1),
(28, '2022_07_06_153229_create_commissions_table', 1),
(29, '2022_07_06_155552_update_overtime', 1),
(30, '2022_07_12_104426_create_assign_modules_table', 1),
(31, '2022_07_15_121559_create_schedules_table', 2),
(32, '2022_07_15_144915_add_absent_columns_to_schedule', 3),
(33, '2022_07_16_110312_add_off_days_to_schedules', 4),
(34, '2022_07_19_162220_create_no_shift_employees_table', 5),
(35, '2022_07_22_160155_add_shift_type_column', 6),
(36, '2022_07_22_160549_add_company_branch_id_to_attenddance_logs', 7);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `name`, `created_at`, `updated_at`) VALUES
(13, 'payroll', '2022-07-13 10:22:59', '2022-07-13 10:22:59'),
(14, 'live_log_acl', '2022-07-14 05:32:09', '2022-07-14 05:32:09'),
(15, 'attendance', '2022-07-15 05:36:39', '2022-07-15 05:36:39');

-- --------------------------------------------------------

--
-- Table structure for table `overtimes`
--

CREATE TABLE `overtimes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL DEFAULT 0,
  `branch_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `no_of_hours` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_of_days` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` int(11) NOT NULL DEFAULT 0,
  `branch_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `company_id`, `branch_id`, `created_at`, `updated_at`) VALUES
(1, 'company_create', 0, 0, '2022-07-13 03:48:14', '2022-07-13 03:48:14'),
(2, 'company_edit', 0, 0, '2022-07-13 03:48:14', '2022-07-13 03:48:14'),
(3, 'company_delete', 0, 0, '2022-07-13 03:48:14', '2022-07-13 03:48:14'),
(4, 'company_view', 0, 0, '2022-07-13 03:48:14', '2022-07-13 03:48:14'),
(5, 'company_access', 0, 0, '2022-07-13 03:48:14', '2022-07-13 03:48:14'),
(6, 'branch_create', 0, 0, '2022-07-13 03:48:14', '2022-07-13 03:48:14'),
(7, 'branch_edit', 0, 0, '2022-07-13 03:48:14', '2022-07-13 03:48:14'),
(8, 'branch_delete', 0, 0, '2022-07-13 03:48:14', '2022-07-13 03:48:14'),
(9, 'branch_view', 0, 0, '2022-07-13 03:48:14', '2022-07-13 03:48:14'),
(10, 'branch_access', 0, 0, '2022-07-13 03:48:14', '2022-07-13 03:48:14'),
(11, 'device_create', 0, 0, '2022-07-13 03:48:14', '2022-07-13 03:48:14'),
(12, 'device_edit', 0, 0, '2022-07-13 03:48:14', '2022-07-13 03:48:14'),
(13, 'device_delete', 0, 0, '2022-07-13 03:48:14', '2022-07-13 03:48:14'),
(14, 'device_view', 0, 0, '2022-07-13 03:48:14', '2022-07-13 03:48:14'),
(15, 'device_access', 0, 0, '2022-07-13 03:48:14', '2022-07-13 03:48:14'),
(16, 'module_create', 0, 0, '2022-07-13 03:48:14', '2022-07-13 03:48:14'),
(17, 'module_edit', 0, 0, '2022-07-13 03:48:14', '2022-07-13 03:48:14'),
(18, 'module_delete', 0, 0, '2022-07-13 03:48:14', '2022-07-13 03:48:14'),
(19, 'module_view', 0, 0, '2022-07-13 03:48:14', '2022-07-13 03:48:14'),
(20, 'module_access', 0, 0, '2022-07-13 03:48:14', '2022-07-13 03:48:14'),
(21, 'assign_module_create', 0, 0, '2022-07-13 03:48:14', '2022-07-13 03:48:14'),
(22, 'assign_module_edit', 0, 0, '2022-07-13 03:48:14', '2022-07-13 03:48:14'),
(23, 'assign_module_delete', 0, 0, '2022-07-13 03:48:14', '2022-07-13 03:48:14'),
(24, 'assign_module_view', 0, 0, '2022-07-13 03:48:14', '2022-07-13 03:48:14'),
(25, 'assign_module_access', 0, 0, '2022-07-13 03:48:14', '2022-07-13 03:48:14'),
(26, 'user_create', 0, 0, '2022-07-13 03:48:14', '2022-07-13 03:48:14'),
(27, 'user_edit', 0, 0, '2022-07-13 03:48:14', '2022-07-13 03:48:14'),
(28, 'user_delete', 0, 0, '2022-07-13 03:48:14', '2022-07-13 03:48:14'),
(29, 'user_view', 0, 0, '2022-07-13 03:48:14', '2022-07-13 03:48:14'),
(30, 'user_access', 0, 0, '2022-07-13 03:48:14', '2022-07-13 03:48:14'),
(31, 'role_create', 0, 0, '2022-07-13 03:48:14', '2022-07-13 03:48:14'),
(32, 'role_edit', 0, 0, '2022-07-13 03:48:14', '2022-07-13 03:48:14'),
(33, 'role_delete', 0, 0, '2022-07-13 03:48:14', '2022-07-13 03:48:14'),
(34, 'role_view', 0, 0, '2022-07-13 03:48:14', '2022-07-13 03:48:14'),
(35, 'role_access', 0, 0, '2022-07-13 03:48:14', '2022-07-13 03:48:14'),
(36, 'assign_permission_create', 0, 0, '2022-07-13 03:48:14', '2022-07-13 03:48:14'),
(37, 'assign_permission_edit', 0, 0, '2022-07-13 03:48:14', '2022-07-13 03:48:14'),
(38, 'assign_permission_delete', 0, 0, '2022-07-13 03:48:14', '2022-07-13 03:48:14'),
(39, 'assign_permission_view', 0, 0, '2022-07-13 03:48:14', '2022-07-13 03:48:14'),
(40, 'assign_permission_access', 0, 0, '2022-07-13 03:48:14', '2022-07-13 03:48:14');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'myApp', '90d6a3c13bbcedd11f0b08a15f2ce116dbea661e4eabc1d7b66573d28f5801cb', '[\"*\"]', '2022-07-13 03:58:42', '2022-07-13 03:48:42', '2022-07-13 03:58:42'),
(2, 'App\\Models\\User', 1, 'myApp', '72f5425199ca49066d4b7174e44e4e05280c4054343b55ea6c893298bf88abd1', '[\"*\"]', '2022-07-13 04:52:21', '2022-07-13 04:23:21', '2022-07-13 04:52:21'),
(3, 'App\\Models\\User', 1, 'myApp', '262397504e206d20fd0e62c0928ff6b9ca5ebe8d97936ebc8ef2b0feb1188df7', '[\"*\"]', '2022-07-13 05:32:26', '2022-07-13 05:32:25', '2022-07-13 05:32:26'),
(4, 'App\\Models\\User', 1, 'myApp', '6308e6a5dfd6fd5dd7dd89ba78135f747ccd69238f42421a0de5c10d2384feba', '[\"*\"]', '2022-07-13 06:48:29', '2022-07-13 06:19:09', '2022-07-13 06:48:29'),
(5, 'App\\Models\\User', 1, 'myApp', '6649afd5a762777d98cfac4ac1f0dde56391f69bb3acccc33eb98aff7781b720', '[\"*\"]', '2022-07-13 07:08:14', '2022-07-13 06:50:17', '2022-07-13 07:08:14'),
(6, 'App\\Models\\User', 1, 'myApp', 'd9d3c427b25f5d8aaa1ee63a8d2fd6add7d1e27b3b2ad4a4ede02be68281a283', '[\"*\"]', '2022-07-13 07:46:35', '2022-07-13 07:20:33', '2022-07-13 07:46:35'),
(7, 'App\\Models\\User', 1, 'myApp', '9bbe07816c190a3d3d1d39140b51940bec0d1bb2187c87be9129e9cec9c0f11d', '[\"*\"]', '2022-07-13 08:16:25', '2022-07-13 07:50:47', '2022-07-13 08:16:25'),
(8, 'App\\Models\\User', 1, 'myApp', 'f071b4f7c2824009fb8f468f2b2c1f22458187bd413e4cfde79a2ed4be376bfe', '[\"*\"]', '2022-07-13 08:23:27', '2022-07-13 08:21:02', '2022-07-13 08:23:27'),
(9, 'App\\Models\\User', 1, 'myApp', 'c58b0a915509f8a68898c79ab23e718516c91a47bca904752e9674b5acf2798b', '[\"*\"]', '2022-07-13 09:55:12', '2022-07-13 09:33:42', '2022-07-13 09:55:12'),
(10, 'App\\Models\\User', 1, 'myApp', 'ec8c44de68cd00a3d7af30582cb1c3adca55550c70baa37a251f2c844e38d84a', '[\"*\"]', '2022-07-13 10:11:23', '2022-07-13 10:11:22', '2022-07-13 10:11:23'),
(11, 'App\\Models\\User', 1, 'myApp', '25d3e8dfcfa01417454350f3c19b3758c365a3ef90ad0fb26fa96f472c4166ad', '[\"*\"]', '2022-07-13 10:42:17', '2022-07-13 10:42:16', '2022-07-13 10:42:17'),
(12, 'App\\Models\\User', 1, 'myApp', 'c73507ffc918b23a82f4a0af25b507eeeb95ae12cba03a44ee0f45bee1da9e79', '[\"*\"]', '2022-07-13 11:22:27', '2022-07-13 11:16:53', '2022-07-13 11:22:27'),
(13, 'App\\Models\\User', 2, 'myApp', 'b083d82f5e33cb040b113f446ba39dbca46d5891c1a7022fe1a54886c424ec14', '[\"*\"]', '2022-07-13 11:46:06', '2022-07-13 11:24:18', '2022-07-13 11:46:06'),
(14, 'App\\Models\\User', 2, 'myApp', '53aad509dbddbad09a950defffec02537954217d5fb732b54351365e53840322', '[\"*\"]', '2022-07-13 12:13:52', '2022-07-13 11:54:56', '2022-07-13 12:13:52'),
(15, 'App\\Models\\User', 1, 'myApp', '16dbbcdec44635cba97d727bc6c9a1edda934e35982ba49830cd26777a0218a1', '[\"*\"]', '2022-07-13 12:19:24', '2022-07-13 12:13:56', '2022-07-13 12:19:24'),
(16, 'App\\Models\\User', 1, 'myApp', '9f8ee60fa251d4246ded54d53a800729e6311b9142ec50af37498623a05f2559', '[\"*\"]', '2022-07-14 03:13:54', '2022-07-14 03:07:44', '2022-07-14 03:13:54'),
(17, 'App\\Models\\User', 2, 'myApp', '835d71b479b1a6098c1d50f342053634b5f3dc66d116b06561167d9bb53a13f4', '[\"*\"]', '2022-07-14 03:20:53', '2022-07-14 03:20:52', '2022-07-14 03:20:53'),
(18, 'App\\Models\\User', 1, 'myApp', '07518cbe1491009fb998a4a1435757b516e6c73eedc897e1977c160738b0fc80', '[\"*\"]', '2022-07-14 03:21:07', '2022-07-14 03:21:07', '2022-07-14 03:21:07'),
(19, 'App\\Models\\User', 2, 'myApp', '8835e97ab8d681993089d54d471647e2534d7f8e438e1b51008989775eac1bb2', '[\"*\"]', '2022-07-14 03:42:37', '2022-07-14 03:22:40', '2022-07-14 03:42:37'),
(20, 'App\\Models\\User', 2, 'myApp', '1c8051981e117cec55005e19b81dd3a5b43b29abb3f0ccb870e1d088b9b654d2', '[\"*\"]', '2022-07-14 04:16:04', '2022-07-14 03:53:10', '2022-07-14 04:16:04'),
(21, 'App\\Models\\User', 2, 'myApp', '35cc3a6bc9d2c5a5c6f14854e0724462e2253aa5c3575bfc8e5f6fded5d874b7', '[\"*\"]', '2022-07-14 04:54:40', '2022-07-14 04:26:31', '2022-07-14 04:54:40'),
(22, 'App\\Models\\User', 2, 'myApp', 'b8f59aa308d9c6f44b0299fe8ef32c9f4f1e74162df6660399fce3d3ca5f5f46', '[\"*\"]', '2022-07-14 05:23:51', '2022-07-14 04:58:18', '2022-07-14 05:23:51'),
(23, 'App\\Models\\User', 2, 'myApp', 'a76c07f995107c7d9f034cfb492c0d78c54e0e78815f4a9990ba77fccef7f59d', '[\"*\"]', '2022-07-14 05:31:07', '2022-07-14 05:29:34', '2022-07-14 05:31:07'),
(24, 'App\\Models\\User', 2, 'myApp', 'a26206620ad85814e9f72e4a2d5c7fe62bf674e41ec6ee050b6afd70f4bab8d9', '[\"*\"]', '2022-07-14 05:32:33', '2022-07-14 05:32:33', '2022-07-14 05:32:33'),
(25, 'App\\Models\\User', 2, 'myApp', 'ab61f268311e22ebc7ac2b28c03e6722988e4cfa5196fe8b18011e91d3c42571', '[\"*\"]', '2022-07-14 05:47:10', '2022-07-14 05:47:10', '2022-07-14 05:47:10'),
(26, 'App\\Models\\User', 2, 'myApp', '467df990022d9c783416dcf8f26f8d973c5ff4102cdcc036701f2b904a6b48fe', '[\"*\"]', '2022-07-14 06:01:25', '2022-07-14 06:01:24', '2022-07-14 06:01:25'),
(27, 'App\\Models\\User', 1, 'myApp', 'c9ee9876be5b632a86c3745360015588837b8c57f643f699df3680a886e23fb3', '[\"*\"]', '2022-07-14 06:30:22', '2022-07-14 06:01:45', '2022-07-14 06:30:22'),
(28, 'App\\Models\\User', 1, 'myApp', '14648b897ac7e319e89e3f4446d136c70f25337e37d69dd8f2f7970cd86cdf2c', '[\"*\"]', '2022-07-14 07:00:44', '2022-07-14 06:31:54', '2022-07-14 07:00:44'),
(29, 'App\\Models\\User', 1, 'myApp', '5bc78690aa26ac965b73bc0fe9edf8fb9158550ed2086c1648349cc639b7d4b4', '[\"*\"]', '2022-07-14 07:15:42', '2022-07-14 07:01:59', '2022-07-14 07:15:42'),
(30, 'App\\Models\\User', 1, 'myApp', 'a0818b57f9e0049481a0c7192f3e1a3486d6aa1fea62a5f2e271222e57b3303f', '[\"*\"]', '2022-07-14 07:32:15', '2022-07-14 07:32:03', '2022-07-14 07:32:15'),
(31, 'App\\Models\\User', 1, 'myApp', '3c794964ad180fc2c147b15755cb629522247c9e6a90a63a55cb8a005082c2a7', '[\"*\"]', '2022-07-14 08:31:42', '2022-07-14 08:31:41', '2022-07-14 08:31:42'),
(32, 'App\\Models\\User', 1, 'myApp', 'bf569c89e4236fa8f0e6cf077b4637f4853e68cb1e94964f3bced1eacc401276', '[\"*\"]', '2022-07-14 09:49:13', '2022-07-14 09:22:01', '2022-07-14 09:49:13'),
(33, 'App\\Models\\User', 1, 'myApp', '44238991302fe81cb3c09be854611518bbf7e29a8bd4f87463627a9986368efd', '[\"*\"]', '2022-07-14 09:55:24', '2022-07-14 09:55:23', '2022-07-14 09:55:24'),
(34, 'App\\Models\\User', 2, 'myApp', '7e26c6c2738a3224f1c57c4f90e1d22315b5fe2059fa26a7ef58efb2d695acd7', '[\"*\"]', '2022-07-14 10:04:55', '2022-07-14 09:59:15', '2022-07-14 10:04:55'),
(35, 'App\\Models\\User', 1, 'myApp', 'e2761a3c4f29d4c69d02a2d338a835acbac3884f1e6e4c29b907fa8108105c6c', '[\"*\"]', '2022-07-14 10:18:34', '2022-07-14 10:18:33', '2022-07-14 10:18:34'),
(36, 'App\\Models\\User', 1, 'myApp', 'eb01f5aefb70d89ccccdc69c28e48837c387531d60f6c72aa12e514aace292fc', '[\"*\"]', '2022-07-14 10:23:36', '2022-07-14 10:23:36', '2022-07-14 10:23:36'),
(37, 'App\\Models\\User', 2, 'myApp', '8c0e81b5621ecb9972e8d2590b06510e2b95ede04bc2d7fdda0b47ead8f60bc8', '[\"*\"]', '2022-07-14 10:24:40', '2022-07-14 10:24:39', '2022-07-14 10:24:40'),
(38, 'App\\Models\\User', 2, 'myApp', '979e1921458ef109603f7a90c478d439bdeff7c199e327b53a5d6544ac1df814', '[\"*\"]', '2022-07-14 10:55:55', '2022-07-14 10:55:54', '2022-07-14 10:55:55'),
(39, 'App\\Models\\User', 2, 'myApp', '4a00c21f84f656472ad2593a1af5ce0ba9dce811d86fa1e3be5243dfacf62fff', '[\"*\"]', '2022-07-14 11:36:54', '2022-07-14 11:32:45', '2022-07-14 11:36:54'),
(40, 'App\\Models\\User', 1, 'myApp', '4174843d094f3a401781f4c519eed7073c7d212c44c1193fa08b5020eb270a4c', '[\"*\"]', '2022-07-14 11:41:20', '2022-07-14 11:41:19', '2022-07-14 11:41:20'),
(41, 'App\\Models\\User', 2, 'myApp', '7f7ffa44d093efa4e599873dc5b9de6c421f12d399f06ced439d58b3b69bba31', '[\"*\"]', '2022-07-14 11:43:14', '2022-07-14 11:43:13', '2022-07-14 11:43:14'),
(42, 'App\\Models\\User', 3, 'myApp', '6c30cfc21799da1a037fac8a5b17fa3a808c6ae42739b053217bfc6777d1f91e', '[\"*\"]', '2022-07-14 11:45:26', '2022-07-14 11:45:25', '2022-07-14 11:45:26'),
(43, 'App\\Models\\User', 1, 'myApp', 'adb79a647baf65f9c0f3062779af1d8d561fb17d6dfc9c0bae57520a3586b7ff', '[\"*\"]', '2022-07-14 11:49:35', '2022-07-14 11:49:34', '2022-07-14 11:49:35'),
(44, 'App\\Models\\User', 2, 'myApp', 'ad8465a066e8a271e4e2ff85aeaecc3829b988a9ae305e353741d159a225b7a0', '[\"*\"]', '2022-07-14 11:50:25', '2022-07-14 11:50:24', '2022-07-14 11:50:25'),
(45, 'App\\Models\\User', 2, 'myApp', '8b7310903e59ce200ca2dfab9e5c7dde603f4501e9e3a7df2a80ec2f5f1904d3', '[\"*\"]', '2022-07-15 06:00:12', '2022-07-15 05:34:27', '2022-07-15 06:00:12'),
(46, 'App\\Models\\User', 1, 'myApp', 'b6da99d6905f040729258a904a3670c2730b23111f05689d4dd60612778640e6', '[\"*\"]', '2022-07-15 05:35:00', '2022-07-15 05:35:00', '2022-07-15 05:35:00'),
(47, 'App\\Models\\User', 2, 'myApp', 'c38f446f768084cc62de76212f3c1223d6997ae10a15232a8594613aa904d0f8', '[\"*\"]', '2022-07-15 06:01:51', '2022-07-15 06:01:50', '2022-07-15 06:01:51'),
(48, 'App\\Models\\User', 2, 'myApp', '3718ef62ad502526f75f6af016fee9566152f3ae727ccb550ead20322e34da41', '[\"*\"]', '2022-07-15 06:19:31', '2022-07-15 06:14:41', '2022-07-15 06:19:31'),
(49, 'App\\Models\\User', 2, 'myApp', 'ce4f50d12777161bc8411799cca9361ee3034b9eed1b72543d774f76246c2566', '[\"*\"]', '2022-07-15 07:03:11', '2022-07-15 06:36:21', '2022-07-15 07:03:11'),
(50, 'App\\Models\\User', 2, 'myApp', 'af3d168959d1731f10918317119de53afa7e2cd0ab0a395494019895ebfc9e99', '[\"*\"]', '2022-07-15 07:20:18', '2022-07-15 07:08:13', '2022-07-15 07:20:18'),
(51, 'App\\Models\\User', 2, 'myApp', '5a968a2940e3c8b5e1eb9e0e4acf802088221e65e2cf47cc5c2e8fff8b13087b', '[\"*\"]', '2022-07-15 07:55:16', '2022-07-15 07:38:54', '2022-07-15 07:55:16'),
(52, 'App\\Models\\User', 2, 'myApp', '4b0ec14db4b898df6160a3615f7c2a76b57296d5603c6c517e817b5fb40ed4e6', '[\"*\"]', '2022-07-15 08:10:13', '2022-07-15 08:10:12', '2022-07-15 08:10:13'),
(53, 'App\\Models\\User', 2, 'myApp', '025a8eac05d09f0ead42c9019f8ea45a88efdb34bd8b7d87574d37e0bb0e4380', '[\"*\"]', '2022-07-15 08:50:03', '2022-07-15 08:44:12', '2022-07-15 08:50:03'),
(54, 'App\\Models\\User', 2, 'myApp', '5395b285a0f072392575600ab465aa5241b3a9559ba29d6c456f4d44b642886f', '[\"*\"]', '2022-07-15 10:07:26', '2022-07-15 09:38:11', '2022-07-15 10:07:26'),
(55, 'App\\Models\\User', 2, 'myApp', '5fa71c21185e487673ac5202efc508157b67ea29897072d526566792c640159d', '[\"*\"]', '2022-07-15 10:13:52', '2022-07-15 10:08:20', '2022-07-15 10:13:52'),
(56, 'App\\Models\\User', 2, 'myApp', 'c4930c6122c4a94fee0af1899dac364eb198ee00f16e7113542b875e11ab09fe', '[\"*\"]', '2022-07-15 10:41:03', '2022-07-15 10:41:02', '2022-07-15 10:41:03'),
(57, 'App\\Models\\User', 2, 'myApp', '7139453b508358067676efe451a73c2e935b2a2ccb5ca9b74cfc0c94da1f5af9', '[\"*\"]', '2022-07-15 11:25:45', '2022-07-15 11:12:54', '2022-07-15 11:25:45'),
(58, 'App\\Models\\User', 2, 'myApp', '2fac9105da81e0dcf146d681c7272261b1e0eedad4c51595d35c72b0a2a4834f', '[\"*\"]', '2022-07-16 03:31:19', '2022-07-16 03:28:21', '2022-07-16 03:31:19'),
(59, 'App\\Models\\User', 3, 'myApp', '962413c4b9edfd7edb60b8c9a4faa41ff9280ca41cc00c08fff44cbb144c98ca', '[\"*\"]', '2022-07-16 03:32:15', '2022-07-16 03:32:14', '2022-07-16 03:32:15'),
(60, 'App\\Models\\User', 2, 'myApp', 'c93b4501416708867a4b0520f6add45c003e1535ba2b591f4e9c60a2d296a3b0', '[\"*\"]', '2022-07-16 04:08:01', '2022-07-16 03:57:57', '2022-07-16 04:08:01'),
(61, 'App\\Models\\User', 2, 'myApp', '3c2b65b4b9f38bb758dc28c51e77da96c0767788478ad35a41056f956fdc62fd', '[\"*\"]', '2022-07-16 04:29:44', '2022-07-16 04:29:44', '2022-07-16 04:29:44'),
(62, 'App\\Models\\User', 2, 'myApp', '3e1570d15dbe8f4685af5cf5c35a4a51cb938c4a1f7796055dd80a6e6afa1e46', '[\"*\"]', '2022-07-16 05:21:06', '2022-07-16 05:20:29', '2022-07-16 05:21:06'),
(63, 'App\\Models\\User', 2, 'myApp', '780c46adb5d318f3cf7138cd333a4102f7e43c93de500ab6e1c0c5dbc38b8752', '[\"*\"]', '2022-07-16 05:54:04', '2022-07-16 05:54:03', '2022-07-16 05:54:04'),
(64, 'App\\Models\\User', 2, 'myApp', '195832c5d9777487eb1b30239871a7e28ad7d1d4efa4a39b7069835a83502ede', '[\"*\"]', '2022-07-16 06:46:57', '2022-07-16 06:24:49', '2022-07-16 06:46:57'),
(65, 'App\\Models\\User', 2, 'myApp', '48174f0c819c26cc5f5325704fd3db3d373ed8fd0a91879195a72787dce90292', '[\"*\"]', '2022-07-16 06:54:55', '2022-07-16 06:54:54', '2022-07-16 06:54:55'),
(66, 'App\\Models\\User', 2, 'myApp', 'accd8cd1b147e5f0fbbf58be4e15149d452f70e6d04e62fbdc4b2118ac690cbd', '[\"*\"]', '2022-07-16 07:56:20', '2022-07-16 07:26:31', '2022-07-16 07:56:20'),
(67, 'App\\Models\\User', 2, 'myApp', '291c18e06da6eef9d95ba45f836f68cffff0e13dfd956678f89b69145f3c2251', '[\"*\"]', '2022-07-16 08:00:23', '2022-07-16 08:00:22', '2022-07-16 08:00:23'),
(68, 'App\\Models\\User', 1, 'myApp', '88dbefdf2d698b45dbd34855a9246dbde92833fe22c8136b3144e12b8f24dfa7', '[\"*\"]', '2022-07-16 08:12:38', '2022-07-16 08:08:23', '2022-07-16 08:12:38'),
(69, 'App\\Models\\User', 2, 'myApp', '648aab83ae75e03c4a37d74ce2e88da7e3eca519472f3c27375b7483b89d902a', '[\"*\"]', '2022-07-16 08:18:46', '2022-07-16 08:14:41', '2022-07-16 08:18:46'),
(70, 'App\\Models\\User', 1, 'myApp', 'd639fd53c874a4c7220996bf5c290584d4cc4ffab465cc04103611809cd01710', '[\"*\"]', '2022-07-16 08:19:16', '2022-07-16 08:19:15', '2022-07-16 08:19:16'),
(71, 'App\\Models\\User', 2, 'myApp', '6ec61a6894d21c67f641000fbc3400520bc280c256101b9a8d3ebdc2015a3f46', '[\"*\"]', '2022-07-16 08:24:56', '2022-07-16 08:19:42', '2022-07-16 08:24:56'),
(72, 'App\\Models\\User', 2, 'myApp', '38f2a9a8a01d4e6a984e6ef4440525bd5a363e42a50ba6b2f82b8c2e098e90ac', '[\"*\"]', '2022-07-16 09:32:07', '2022-07-16 09:30:23', '2022-07-16 09:32:07'),
(73, 'App\\Models\\User', 1, 'myApp', '6e528f0a5fb5d41c9c5d1241e6041ad38a22dc75d4df1e1be9fc02a8d3673cdc', '[\"*\"]', '2022-07-16 09:36:37', '2022-07-16 09:32:39', '2022-07-16 09:36:37'),
(74, 'App\\Models\\User', 1, 'myApp', 'e584be9c314ea07a84a95dbb123f9933b5ad9c1eded881f7406c091b4826551a', '[\"*\"]', '2022-07-16 09:36:55', '2022-07-16 09:36:55', '2022-07-16 09:36:55'),
(75, 'App\\Models\\User', 2, 'myApp', '0883a504a02d7d03c90d484524387a2f9f001470716989198261191353a06cc1', '[\"*\"]', '2022-07-16 09:49:05', '2022-07-16 09:37:07', '2022-07-16 09:49:05'),
(76, 'App\\Models\\User', 2, 'myApp', '61b076f9f272284a8ee0bb7385e3a33d2e7c3b10160e6bec013c561b286ee16b', '[\"*\"]', '2022-07-16 10:11:49', '2022-07-16 10:11:48', '2022-07-16 10:11:49'),
(77, 'App\\Models\\User', 2, 'myApp', '04dbfc2553940abcb481f10b52cc63e9c4d33ef1015fad9748ae4a3f7baa1e7f', '[\"*\"]', '2022-07-16 10:41:57', '2022-07-16 10:41:56', '2022-07-16 10:41:57'),
(78, 'App\\Models\\User', 2, 'myApp', '86297b205a22189aa28e8fccb878536dd33caca35fcf1983afc9e80dbcaa15a2', '[\"*\"]', '2022-07-16 11:14:53', '2022-07-16 11:14:52', '2022-07-16 11:14:53'),
(79, 'App\\Models\\User', 2, 'myApp', '4beec0e6cf45bf744fe15d371efe42b83b95e51035589dd06805956c4bb0b08d', '[\"*\"]', '2022-07-16 11:48:05', '2022-07-16 11:48:05', '2022-07-16 11:48:05'),
(80, 'App\\Models\\User', 2, 'myApp', 'd3b168fef4a4101b07b793ae8d5da2804494809b616b983c940d3704c6cc1172', '[\"*\"]', '2022-07-16 12:33:11', '2022-07-16 12:19:45', '2022-07-16 12:33:11'),
(81, 'App\\Models\\User', 2, 'myApp', '87bafa28caa555a97cc1afc8a35c1748c4ee6d1ae6e31b59f94d88405c71af2b', '[\"*\"]', '2022-07-18 03:24:41', '2022-07-18 03:06:03', '2022-07-18 03:24:41'),
(82, 'App\\Models\\User', 2, 'myApp', 'e58ab3b241f091b891e3bc4343a0e8e413be133f2efecdc20cfe99093c5d7aaf', '[\"*\"]', '2022-07-18 04:08:01', '2022-07-18 03:38:16', '2022-07-18 04:08:01'),
(83, 'App\\Models\\User', 2, 'myApp', '4bd07959886df8ea94915a771ccd5262ef778e624adb0b00b3a258ef2c7e93b8', '[\"*\"]', '2022-07-18 04:30:34', '2022-07-18 04:08:41', '2022-07-18 04:30:34'),
(84, 'App\\Models\\User', 2, 'myApp', '3cdc01b0ffd510cb7ea9cb3fce2d9648e7579cd6f9d1df7cd23258657b657b9e', '[\"*\"]', '2022-07-18 04:42:16', '2022-07-18 04:41:19', '2022-07-18 04:42:16'),
(85, 'App\\Models\\User', 2, 'myApp', '950fe0b1d1a23d1c8f644b1c79fe64ded2fcec0e20393fedcbca1e2496bacd02', '[\"*\"]', '2022-07-18 05:12:11', '2022-07-18 05:11:29', '2022-07-18 05:12:11'),
(86, 'App\\Models\\User', 2, 'myApp', '1cd38b3d8109540a9cac628660f70261d133c1df3120cff348ce5e5862b699c7', '[\"*\"]', '2022-07-18 06:16:37', '2022-07-18 05:46:59', '2022-07-18 06:16:37'),
(87, 'App\\Models\\User', 2, 'myApp', 'f28424b8b8f3ad4976a5c2aee7c56be8c57c771df102370038c4813c2c01be70', '[\"*\"]', '2022-07-18 06:27:45', '2022-07-18 06:19:19', '2022-07-18 06:27:45'),
(88, 'App\\Models\\User', 2, 'myApp', 'c0511d853880e8629d78c29e87ee471cc377c558766ad5e46d080a11deda764b', '[\"*\"]', '2022-07-18 07:11:39', '2022-07-18 06:49:52', '2022-07-18 07:11:39'),
(89, 'App\\Models\\User', 2, 'myApp', '3cbe0493c2fdeea2fb7437276b6c760e8c4be20a25b6051f2b24b99de017d360', '[\"*\"]', '2022-07-18 07:21:02', '2022-07-18 07:21:02', '2022-07-18 07:21:02'),
(90, 'App\\Models\\User', 2, 'myApp', '3ee047351ebaba6238427acc0e1947f400a68a455c3fb8314d907fd07fd84c94', '[\"*\"]', '2022-07-18 08:06:15', '2022-07-18 07:51:46', '2022-07-18 08:06:15'),
(91, 'App\\Models\\User', 2, 'myApp', '83d27defc6589f96eaf25e722d93d248ad36504151a7b7696c06af26fbe9278d', '[\"*\"]', '2022-07-18 08:22:06', '2022-07-18 08:22:05', '2022-07-18 08:22:06'),
(92, 'App\\Models\\User', 2, 'myApp', '68061fdbfb968c8ec818165c908918390fbff2c8db191ac2cdf728733238a557', '[\"*\"]', '2022-07-18 09:51:37', '2022-07-18 09:38:16', '2022-07-18 09:51:37'),
(93, 'App\\Models\\User', 2, 'myApp', 'c5cb8774e7fe7f2cbb82e49eb2bca223db660c7948b27fb3a537c52c50c399d2', '[\"*\"]', '2022-07-18 10:43:15', '2022-07-18 10:13:54', '2022-07-18 10:43:15'),
(94, 'App\\Models\\User', 2, 'myApp', 'f34f1cab14d7548bc9b0a6f47b1bbbb4f623815fc2314f6e2cba91d57c3243fb', '[\"*\"]', '2022-07-18 11:12:19', '2022-07-18 10:46:24', '2022-07-18 11:12:19'),
(95, 'App\\Models\\User', 2, 'myApp', '1ac513e4179715f3d74d5af5164e459b198173062c39f26adeb7501f965072c5', '[\"*\"]', '2022-07-18 11:50:10', '2022-07-18 11:21:38', '2022-07-18 11:50:10'),
(96, 'App\\Models\\User', 2, 'myApp', '3f675c1ef819a45fcdbea4139dbb9e43e3cfe8998e57115722a14edc2e8a1f7b', '[\"*\"]', '2022-07-18 12:17:44', '2022-07-18 11:52:53', '2022-07-18 12:17:44'),
(97, 'App\\Models\\User', 2, 'myApp', '2f39e5eecaae3881bc7c984a0fba8d97e6254966c97e82fcad83993b71a9ed13', '[\"*\"]', '2022-07-19 02:39:28', '2022-07-19 02:28:55', '2022-07-19 02:39:28'),
(98, 'App\\Models\\User', 2, 'myApp', '154bee8b9be17d0c7cffbb9e126a85892ece12d79b01cc3c853d2693354afc7e', '[\"*\"]', '2022-07-19 03:30:10', '2022-07-19 03:00:25', '2022-07-19 03:30:10'),
(99, 'App\\Models\\User', 2, 'myApp', '7c0c71bf37bb96bf1f009310ad051c8bd7933df45de1ce1e9c2545fd3cb57848', '[\"*\"]', '2022-07-19 04:05:38', '2022-07-19 03:39:25', '2022-07-19 04:05:38'),
(100, 'App\\Models\\User', 2, 'myApp', '3a5fa5077caa022586592941b9fcf23fc3e144f3e4998277674285fed726fcaf', '[\"*\"]', '2022-07-19 04:13:47', '2022-07-19 04:13:46', '2022-07-19 04:13:47'),
(101, 'App\\Models\\User', 2, 'myApp', '2b20c7ee47e52b6ac935957b41ee4cb9372b22571a7071f4fc5cc5768a00c9ca', '[\"*\"]', '2022-07-19 05:12:28', '2022-07-19 04:47:40', '2022-07-19 05:12:28'),
(102, 'App\\Models\\User', 2, 'myApp', '3ce47a7dd9958b64df9e8fb90b7d5b12a15fbec29adda1310d42326c86a23418', '[\"*\"]', '2022-07-19 05:47:50', '2022-07-19 05:20:21', '2022-07-19 05:47:50'),
(103, 'App\\Models\\User', 2, 'myApp', 'f9d930d5dc6772b167ed28d146944f4344755c41043098543d7f1f0c234e0e42', '[\"*\"]', '2022-07-19 06:03:01', '2022-07-19 05:53:31', '2022-07-19 06:03:01'),
(104, 'App\\Models\\User', 2, 'myApp', 'f2dfad112485d25e0a7d935e74d45b3a62cd24491be8be115891d0b01fa05173', '[\"*\"]', '2022-07-19 08:39:32', '2022-07-19 08:31:44', '2022-07-19 08:39:32'),
(105, 'App\\Models\\User', 2, 'myApp', 'de6991da299442cbeaeb7deef0905bcfba7d53803d01e42de53a46c3c861e959', '[\"*\"]', '2022-07-19 09:30:26', '2022-07-19 09:05:38', '2022-07-19 09:30:26'),
(106, 'App\\Models\\User', 2, 'myApp', 'c5be2d0cba783f24a903eb7edd898252b62f88390fce35ed82778e924dac7602', '[\"*\"]', '2022-07-19 09:39:49', '2022-07-19 09:36:44', '2022-07-19 09:39:49'),
(107, 'App\\Models\\User', 2, 'myApp', '9cb32bdd3f94ba1776cb84cb3c794a2ed39e0894e75741befa2fd643cca25c80', '[\"*\"]', '2022-07-19 10:14:28', '2022-07-19 10:07:57', '2022-07-19 10:14:28'),
(108, 'App\\Models\\User', 2, 'myApp', '6084ee7e86850b5825820d820c46172bb5b6ef058b6c7a105ebaa0707d5d2b85', '[\"*\"]', '2022-07-19 11:06:33', '2022-07-19 10:38:48', '2022-07-19 11:06:33'),
(109, 'App\\Models\\User', 2, 'myApp', '31753415b29825756a9b708557ee354b6f96370d9c0e5215c75947c702e74701', '[\"*\"]', '2022-07-19 11:27:46', '2022-07-19 11:09:41', '2022-07-19 11:27:46'),
(110, 'App\\Models\\User', 2, 'myApp', '544c394dd438793e79f4656d6e8a13fb2a63c4943ffa5e84615e55a030541924', '[\"*\"]', '2022-07-19 12:12:08', '2022-07-19 11:42:40', '2022-07-19 12:12:08'),
(111, 'App\\Models\\User', 2, 'myApp', '6b204709e82f9dda6d6329ab15fd57486e36e30b7d3b87e382e5cc1f004f80a8', '[\"*\"]', '2022-07-19 12:40:54', '2022-07-19 12:13:16', '2022-07-19 12:40:54'),
(112, 'App\\Models\\User', 2, 'myApp', '872e182ff85b771ea37df17f4ec956db765148ca4f18eea5f834c8e28aefeebb', '[\"*\"]', '2022-07-19 13:13:21', '2022-07-19 12:44:03', '2022-07-19 13:13:21'),
(113, 'App\\Models\\User', 2, 'myApp', '100fdfd77d3f8c27b63d24e5135790a4ccf06dbaa82ab63c7d75193366427354', '[\"*\"]', '2022-07-19 13:16:47', '2022-07-19 13:14:49', '2022-07-19 13:16:47'),
(114, 'App\\Models\\User', 2, 'myApp', '8542dfebe4fc7c746e87d26e2c009c7d21a7ed339135b9053b4ab90b967db38f', '[\"*\"]', '2022-07-20 02:07:38', '2022-07-20 02:07:37', '2022-07-20 02:07:38'),
(115, 'App\\Models\\User', 1, 'myApp', '70fe8a1d23ac6bf197c76beee2f4fe6d6a51c11009ca6125d7c0f1f07d172b78', '[\"*\"]', '2022-07-20 02:07:56', '2022-07-20 02:07:55', '2022-07-20 02:07:56'),
(116, 'App\\Models\\User', 2, 'myApp', 'c69b8a8fa16014ddaf9d31290517d5ab146b81ec94f268bdc2f8159ba334cec5', '[\"*\"]', '2022-07-20 02:14:34', '2022-07-20 02:14:33', '2022-07-20 02:14:34'),
(117, 'App\\Models\\User', 2, 'myApp', '632a6cdbe9a829b39c9b3373598d8209c5fb7ba22cc98178f762b4732f6d137d', '[\"*\"]', '2022-07-20 02:36:19', '2022-07-20 02:15:35', '2022-07-20 02:36:19'),
(118, 'App\\Models\\User', 2, 'myApp', '32b387cf9fbd5f4d33df66883ed4d6be35afbcb6fe6b8cdbd9c6e4828be6d19a', '[\"*\"]', '2022-07-20 02:46:25', '2022-07-20 02:46:24', '2022-07-20 02:46:25'),
(119, 'App\\Models\\User', 2, 'myApp', 'a6c29414b63ca118243e88c5b8d030f5f413a97198027e1ff81fb1e9dfa1f4ec', '[\"*\"]', '2022-07-20 03:16:48', '2022-07-20 03:16:47', '2022-07-20 03:16:48'),
(120, 'App\\Models\\User', 2, 'myApp', '381c98fb392f2edd8c0c6e022c59bc61197679cc2d5a16f9ad628717c168a573', '[\"*\"]', '2022-07-20 03:47:21', '2022-07-20 03:47:21', '2022-07-20 03:47:21'),
(121, 'App\\Models\\User', 2, 'myApp', '168ebc502da7e2bbe6a20eea24c52e427c252928f5903d06981311ca07d01297', '[\"*\"]', '2022-07-20 04:55:04', '2022-07-20 04:29:32', '2022-07-20 04:55:04'),
(122, 'App\\Models\\User', 2, 'myApp', '5900b41b1dedecc88aee74204881b8aa6604b97fbd271062266fbce92fbeb186', '[\"*\"]', '2022-07-20 05:24:22', '2022-07-20 05:00:11', '2022-07-20 05:24:22'),
(123, 'App\\Models\\User', 2, 'myApp', '0b3eedd5b801f30cc1950e287b799dd601860ce080537787bef4789f40758e23', '[\"*\"]', NULL, '2022-07-20 05:33:00', '2022-07-20 05:33:00'),
(124, 'App\\Models\\User', 2, 'myApp', '963196e97bc04e42d7c783ce2116b2cb8863e2c7837a8b25f172f85642bfed04', '[\"*\"]', '2022-07-20 05:54:34', '2022-07-20 05:33:07', '2022-07-20 05:54:34'),
(125, 'App\\Models\\User', 2, 'myApp', '94c822cceb2a8a58e27faf8eb3bef85d7a30b556b5ca43d1b4bf8441cc3f1a6d', '[\"*\"]', '2022-07-20 06:05:51', '2022-07-20 06:05:50', '2022-07-20 06:05:51'),
(126, 'App\\Models\\User', 2, 'myApp', 'a74bdf47781846404a4deebf6473ab0917bf88318285103f6c7d054e7f01156a', '[\"*\"]', '2022-07-20 08:53:59', '2022-07-20 08:34:54', '2022-07-20 08:53:59'),
(127, 'App\\Models\\User', 2, 'myApp', '8fdad0a094130c6ed8345d321877bb0d68c220d53b2b671858dc4230afdc577a', '[\"*\"]', '2022-07-20 09:23:15', '2022-07-20 09:06:19', '2022-07-20 09:23:15'),
(128, 'App\\Models\\User', 2, 'myApp', '68f02b042adb1b4cfbd70c0c94ba680eea5c08ccbf78cc452402e0663352ca61', '[\"*\"]', '2022-07-20 10:05:56', '2022-07-20 09:36:33', '2022-07-20 10:05:56'),
(129, 'App\\Models\\User', 2, 'myApp', 'f6bf8eeda34b6ffcb62b0ae2f258b8157ada0447422c1dc0aab31cf674bb4b9a', '[\"*\"]', '2022-07-20 10:32:23', '2022-07-20 10:06:36', '2022-07-20 10:32:23'),
(130, 'App\\Models\\User', 2, 'myApp', 'da813e88a670e9bde9f0b30bf5fcaafbc421dcc82532b643b0785cc36bd16cc1', '[\"*\"]', '2022-07-20 11:02:22', '2022-07-20 10:36:54', '2022-07-20 11:02:22'),
(131, 'App\\Models\\User', 2, 'myApp', 'cde8e4fd872d77120cb42692d41bc33bf73d5d79b90f86481b312deb3d05fea3', '[\"*\"]', '2022-07-20 11:39:24', '2022-07-20 11:10:07', '2022-07-20 11:39:24'),
(132, 'App\\Models\\User', 2, 'myApp', 'b705c75172c2535c68cf3412dffd02304f4250d396559c7cecf9171055dcba6a', '[\"*\"]', '2022-07-20 12:02:58', '2022-07-20 11:40:39', '2022-07-20 12:02:58'),
(133, 'App\\Models\\User', 2, 'myApp', 'cd10db3aa750568dc58e50b67f699119d1fa4696138abd4c82bb0728f0aa6e9b', '[\"*\"]', '2022-07-20 12:30:03', '2022-07-20 12:14:50', '2022-07-20 12:30:03'),
(134, 'App\\Models\\User', 2, 'myApp', '20c8565a13564c16299291f6f636d815d45df1027f2af298b2f90dadc0a9ed25', '[\"*\"]', '2022-07-20 13:10:07', '2022-07-20 12:45:34', '2022-07-20 13:10:07'),
(135, 'App\\Models\\User', 2, 'myApp', 'b573965b964ea93d75b4080ef02853aedb82501f2dfffd97c3f84b2e3fb97789', '[\"*\"]', '2022-07-21 02:17:44', '2022-07-21 02:17:43', '2022-07-21 02:17:44'),
(136, 'App\\Models\\User', 2, 'myApp', '575b8fbe456bab20932f8371b0a938598751f9b1b7fa08f33a0d7c78dfe44da6', '[\"*\"]', '2022-07-21 02:48:23', '2022-07-21 02:48:22', '2022-07-21 02:48:23'),
(137, 'App\\Models\\User', 2, 'myApp', 'eb3c2a924878ddf5c337dc19a46ebe60d4c6a2926eac6362225382c6007ff178', '[\"*\"]', '2022-07-21 03:31:56', '2022-07-21 03:31:56', '2022-07-21 03:31:56'),
(138, 'App\\Models\\User', 2, 'myApp', '65e1c5a4a6b8da7ae5663fb1e4ab03040eb8f6ca812af3d52a573e3c947610ac', '[\"*\"]', '2022-07-21 04:05:06', '2022-07-21 04:02:08', '2022-07-21 04:05:06'),
(139, 'App\\Models\\User', 2, 'myApp', '933f060c61e9487cd89814c2ecd80c18b7e276815806a9d3edf9815c139fdf69', '[\"*\"]', '2022-07-21 05:17:57', '2022-07-21 05:17:57', '2022-07-21 05:17:57'),
(140, 'App\\Models\\User', 2, 'myApp', '38150b7350996d29c9b34347a1355715e29f99833e21bcfc2b72cea98cbbfe96', '[\"*\"]', '2022-07-21 05:58:42', '2022-07-21 05:58:41', '2022-07-21 05:58:42'),
(141, 'App\\Models\\User', 2, 'myApp', '1ad8672c2e9790200794f0c7b2c6656daf114396073f02a3e9ecad789387f197', '[\"*\"]', '2022-07-21 09:11:44', '2022-07-21 08:49:55', '2022-07-21 09:11:44'),
(142, 'App\\Models\\User', 2, 'myApp', '82151369ee9b9253f91fdd5615c67c2c0beb98bd751087e4b90222717c7944ca', '[\"*\"]', '2022-07-21 09:55:21', '2022-07-21 09:25:28', '2022-07-21 09:55:21'),
(143, 'App\\Models\\User', 2, 'myApp', '5c2c1ae0918fb55e6729d55a7476b46fab0feeb794eb1585cd4a6f47a251dc42', '[\"*\"]', '2022-07-21 09:55:31', '2022-07-21 09:55:30', '2022-07-21 09:55:31'),
(144, 'App\\Models\\User', 2, 'myApp', '9fc2c163210d6cf3e2dac27bb08ec8ee30756000cad3316dbced3a91d89d2315', '[\"*\"]', '2022-07-21 10:40:16', '2022-07-21 10:40:15', '2022-07-21 10:40:16'),
(145, 'App\\Models\\User', 2, 'myApp', '07237448772a043037365854cc2e0d6de72fecbfcb566138a253408bd62158a0', '[\"*\"]', '2022-07-21 11:17:15', '2022-07-21 11:10:31', '2022-07-21 11:17:15'),
(146, 'App\\Models\\User', 2, 'myApp', 'a6634f7a7c04cf5dfee4788e2b077be33d867f31d8c3cb1564cab19104167c9c', '[\"*\"]', '2022-07-21 12:30:45', '2022-07-21 12:30:45', '2022-07-21 12:30:45'),
(147, 'App\\Models\\User', 2, 'myApp', '0cce953dcb189ab17322010c587c353abcf21acbddc4a4a37e5d42e59ed74a63', '[\"*\"]', '2022-07-21 13:05:05', '2022-07-21 13:05:04', '2022-07-21 13:05:05'),
(148, 'App\\Models\\User', 2, 'myApp', '94e04c67c04dd7da1c4bf641dd917fbabd10c5a8a09a3f97afe83b919b9e727d', '[\"*\"]', '2022-07-22 02:09:26', '2022-07-22 01:40:02', '2022-07-22 02:09:26'),
(149, 'App\\Models\\User', 2, 'myApp', '1b7176fd667c173b243df0df0b203cafe32cfeee5ef5037109b75173461b12f0', '[\"*\"]', '2022-07-22 02:12:45', '2022-07-22 02:11:26', '2022-07-22 02:12:45'),
(150, 'App\\Models\\User', 2, 'myApp', 'fb23125fdd0b702b51b5d618c1fdf71e39ffd56cc53595d4f71de4f04428a7d4', '[\"*\"]', '2022-07-22 04:21:33', '2022-07-22 04:21:32', '2022-07-22 04:21:33'),
(151, 'App\\Models\\User', 2, 'myApp', '7647252861e54257cfd3a75a9294b2ce516b78719c6794523f711e3f119c4910', '[\"*\"]', '2022-07-22 05:22:00', '2022-07-22 05:21:59', '2022-07-22 05:22:00'),
(152, 'App\\Models\\User', 2, 'myApp', '1eb70b3716b07cec938c268a12c32dd55df1c9ee27499c5935ba6addfadecc3e', '[\"*\"]', '2022-07-22 09:00:22', '2022-07-22 08:32:18', '2022-07-22 09:00:22'),
(153, 'App\\Models\\User', 2, 'myApp', 'c74de06a7480d046a5d7e243c1adf1c8b467e7ad09ef4324db5afe06439ded3d', '[\"*\"]', '2022-07-22 09:19:42', '2022-07-22 09:18:25', '2022-07-22 09:19:42'),
(154, 'App\\Models\\User', 2, 'myApp', '32bfc219c0e2ce6ae695e140c187f55f130dd343b72183d85adf1f2ae20db4d5', '[\"*\"]', '2022-07-22 10:31:43', '2022-07-22 10:02:04', '2022-07-22 10:31:43'),
(155, 'App\\Models\\User', 2, 'myApp', '83cc9eac668b347880702da44747ce7f248f7905e08e9bc2d6181742f7f4d9a3', '[\"*\"]', '2022-07-22 11:01:28', '2022-07-22 10:32:08', '2022-07-22 11:01:28'),
(156, 'App\\Models\\User', 2, 'myApp', 'c9871fe1cb4f70cd5f0c2587657b15a600520c9deaa6ff027fe7612a936d9475', '[\"*\"]', '2022-07-22 11:18:07', '2022-07-22 11:02:14', '2022-07-22 11:18:07'),
(157, 'App\\Models\\User', 2, 'myApp', '436d00c3bf66beba15703fa765b6002faf88a5dd9babe5a2467017562ee44559', '[\"*\"]', '2022-07-22 12:33:53', '2022-07-22 12:31:14', '2022-07-22 12:33:53'),
(158, 'App\\Models\\User', 2, 'myApp', '07db54c3b81a48f833b2548dafb3d15f64340d7fbc3d56bcc5cd5b61c62009a7', '[\"*\"]', '2022-07-23 02:26:11', '2022-07-23 02:18:48', '2022-07-23 02:26:11'),
(159, 'App\\Models\\User', 2, 'myApp', '9dea24c57e7d29b4aeb188dc374eae6fe8fdad27efe9b650d78db8c0ffbbaf3a', '[\"*\"]', '2022-07-23 02:59:53', '2022-07-23 02:53:17', '2022-07-23 02:59:53'),
(160, 'App\\Models\\User', 2, 'myApp', 'c42371a723d2753d3896fd4346cbb05ac2b711acb30a99d626708f8c919cd63f', '[\"*\"]', '2022-07-23 05:53:31', '2022-07-23 05:40:47', '2022-07-23 05:53:31'),
(161, 'App\\Models\\User', 2, 'myApp', 'fa7cdfb549ce4a9c0f32503e71b49da57abb8ba1b4708e3c9cb7c69318efdee7', '[\"*\"]', '2022-07-23 08:53:59', '2022-07-23 08:30:47', '2022-07-23 08:53:59'),
(162, 'App\\Models\\User', 2, 'myApp', '71d001b09a0a4f9139aa232910ac860a185503a15f676f4a10db5d40f911ffd1', '[\"*\"]', '2022-07-23 09:37:22', '2022-07-23 09:13:48', '2022-07-23 09:37:22'),
(163, 'App\\Models\\User', 2, 'myApp', '4b2e265a293042f86b0a28f9157d200509e2c7a7c61b4f8b65ff160659b4a21c', '[\"*\"]', '2022-07-23 10:44:03', '2022-07-23 10:14:24', '2022-07-23 10:44:03'),
(164, 'App\\Models\\User', 2, 'myApp', 'e859edf3a8c0f411052701ea4da4be3fd92b8e1ec3c725c91265fc63e47f7f15', '[\"*\"]', '2022-07-23 10:47:45', '2022-07-23 10:46:33', '2022-07-23 10:47:45'),
(165, 'App\\Models\\User', 2, 'myApp', '01918b3c49f8194e89926e6b034a5c985d96e50491e3fd3b93d91215d230a2bf', '[\"*\"]', '2022-07-23 12:25:25', '2022-07-23 12:01:39', '2022-07-23 12:25:25'),
(166, 'App\\Models\\User', 2, 'myApp', '7705f3f440b832800484c5db62cbe42840c90f1eb9c8afead4979443b400b7fd', '[\"*\"]', '2022-07-23 12:31:47', '2022-07-23 12:31:44', '2022-07-23 12:31:47');

-- --------------------------------------------------------

--
-- Table structure for table `personal_infos`
--

CREATE TABLE `personal_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `passport_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passport_expiry` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationality` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `religion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marital_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_of_spouse` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_of_children` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL DEFAULT 0,
  `branch_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` int(11) NOT NULL DEFAULT 0,
  `branch_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `company_id`, `branch_id`, `created_at`, `updated_at`) VALUES
(1, 'admin', 0, 0, '2022-07-13 03:48:14', '2022-07-13 03:48:14'),
(2, 'company', 0, 0, '2022-07-13 03:48:14', '2022-07-13 03:48:14'),
(5, 'voluptatem cupidatat', 0, 0, '2022-07-13 11:23:24', '2022-07-13 11:23:24'),
(6, 'log user', 0, 0, '2022-07-14 05:44:38', '2022-07-14 05:44:38'),
(7, 'company 1 role 1', 1, 0, '2022-07-16 07:22:22', '2022-07-16 07:22:22'),
(8, 'company 1 role 2', 1, 0, '2022-07-16 07:22:48', '2022-07-16 07:22:48'),
(9, 'company 1 role 3', 1, 0, '2022-07-16 07:26:40', '2022-07-16 07:26:40');

-- --------------------------------------------------------

--
-- Table structure for table `salaries`
--

CREATE TABLE `salaries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` int(11) NOT NULL,
  `salary_type_id` int(11) NOT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` int(11) NOT NULL DEFAULT 0,
  `branch_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `salaries`
--

INSERT INTO `salaries` (`id`, `employee_id`, `salary_type_id`, `amount`, `company_id`, `branch_id`, `created_at`, `updated_at`) VALUES
(3, 2, 2, '100', 1, 0, '2022-07-16 05:23:17', '2022-07-16 05:23:17');

-- --------------------------------------------------------

--
-- Table structure for table `salary_types`
--

CREATE TABLE `salary_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` int(11) NOT NULL DEFAULT 0,
  `branch_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `salary_types`
--

INSERT INTO `salary_types` (`id`, `name`, `company_id`, `branch_id`, `created_at`, `updated_at`) VALUES
(1, 'weekly', 1, 0, '2022-07-16 04:08:10', '2022-07-16 05:21:45'),
(2, 'monthly', 1, 0, '2022-07-16 05:21:57', '2022-07-16 05:21:57'),
(3, 'daily', 1, 0, '2022-07-16 05:22:07', '2022-07-16 05:22:07');

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shift_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_in` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_out` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `grace_time_in` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `grace_time_out` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` int(11) NOT NULL DEFAULT 0,
  `branch_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `absent_min_in` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `absent_min_out` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `off_days` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`off_days`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `shift_name`, `time_in`, `time_out`, `grace_time_in`, `grace_time_out`, `company_id`, `branch_id`, `created_at`, `updated_at`, `absent_min_in`, `absent_min_out`, `off_days`) VALUES
(10, 'Morning', '09:30', '18:30', '15', '10', 1, 0, '2022-07-16 12:06:30', '2022-07-18 07:06:37', '120', '120', '[\"Sun\"]'),
(11, 'Morning 2', '11:00', '20:00', '10', '5', 1, 0, '2022-07-18 07:08:31', '2022-07-18 07:08:31', '60', '60', '[\"Sun\"]');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_master` tinyint(1) NOT NULL DEFAULT 0,
  `role_id` tinyint(1) NOT NULL DEFAULT 0,
  `company_id` tinyint(1) NOT NULL DEFAULT 0,
  `branch_id` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `is_master`, `role_id`, `company_id`, `branch_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'master', 'master@hrms.com', NULL, '$2y$10$f8jQ.AcdUQK7/kB.I./8fO.vjlsTcaNaEAwwqq03fBVElFcvGNcZC', 1, 0, 0, 0, NULL, NULL, NULL),
(2, 'demo company account', 'company1@hrms.com', NULL, '$2y$10$DC.OSgivB8pTukr52RrmU.eWgpe0Y9Vp7QLn8YCGMErajv.0ISE92', 1, 2, 0, 0, NULL, '2022-07-13 03:48:14', '2022-07-13 03:48:14'),
(3, 'Omnis esse', 'company2@hrms.com', NULL, '$2y$10$oTTHCwj.CnMKJp8RZd9SHOJnk6rKO4aZvjDWGt4ZhidkfQiX4Yrqq', 1, 2, 0, 0, NULL, '2022-07-13 03:50:17', '2022-07-14 11:45:14'),
(167, 'last_name 1', 'employee1@dgmail.com', NULL, '$2y$10$AcF08nX477j3Xm0csBX4jOg8v1zuu74cNBDLQ4mPEqQBAzwSX9maK', 0, 0, 0, 0, NULL, '2022-07-22 08:45:42', '2022-07-22 08:45:42'),
(168, 'last_name 2', 'employee2@gmail.com', NULL, '$2y$10$i5bBPmajmrj6wDDTpTtk0.csYR19bIqRJrYISSm1w0KMDep7vTx2e', 0, 0, 0, 0, NULL, '2022-07-22 08:45:42', '2022-07-22 08:45:42'),
(169, 'last_name 3', 'employee3@gmail.com', NULL, '$2y$10$dYIzPBU55yJkLTuTf1GEfup0/6xyZsbhrrPIlJMIBRB3O3NekosdW', 0, 0, 0, 0, NULL, '2022-07-22 08:45:42', '2022-07-22 08:45:42'),
(170, 'last_name 4', 'employee4@dgmail.com', NULL, '$2y$10$ak1TMOeZ47cxJs9b0cDkHOu4K.6W0Xr06rcweoLmqbR9.DYdKc.la', 0, 0, 0, 0, NULL, '2022-07-22 08:45:42', '2022-07-22 08:45:42'),
(171, 'last_name 5', 'employee5@gmail.com', NULL, '$2y$10$bVeeYQsJ9XZojTJqRaegpOKDOd5/W7B/crcBNqJq7tlIRAlhpC3ue', 0, 0, 0, 0, NULL, '2022-07-22 08:45:42', '2022-07-22 08:45:42'),
(172, 'last_name 6', 'employee6@gmail.com', NULL, '$2y$10$7qVbhTY8LY0vc2h9IQiSJ.VK/I4pDfM.LfhDlUaftdMELYuAH54Ga', 0, 0, 0, 0, NULL, '2022-07-22 08:45:42', '2022-07-22 08:45:42'),
(173, 'last_name 7', 'employee61@gmail.com', NULL, '$2y$10$VEvRDCr.eE3ZAh/gN.s82eO9IR6GafFX9lwpxiDk1i3PK5N9vl2mm', 0, 0, 0, 0, NULL, '2022-07-22 08:45:42', '2022-07-22 08:45:42'),
(174, 'last_name 8', 'employee7@gmail.com', NULL, '$2y$10$soRcazfaqlsNJZdQ7dEkoeMIKws0yJefg85SPDLr8WkY5oR9Kqcjq', 0, 0, 0, 0, NULL, '2022-07-22 08:45:42', '2022-07-22 08:45:42'),
(175, 'last_name 9', 'employee8@gmail.com', NULL, '$2y$10$je5GjnHqgKw/qphH.Evnc.R/4OVlewWMovog.UrxS98sApDKZKuN.', 0, 0, 0, 0, NULL, '2022-07-22 08:45:42', '2022-07-22 08:45:42'),
(176, 'last_name 10', 'employee9@gmail.com', NULL, '$2y$10$FNn97Epfam8GLxXvxIL1POc3QRCPGfA55rv6wRWCrXeBLAhMGZ.te', 0, 0, 0, 0, NULL, '2022-07-22 08:45:42', '2022-07-22 08:45:42'),
(177, 'last_name 11', 'employee10@gmail.com', NULL, '$2y$10$m8O1../lsSvzqi9NJ8A2NeG7oYzri74HlIhBE/oh2glfJn0mcX87W', 0, 0, 0, 0, NULL, '2022-07-22 08:45:43', '2022-07-22 08:45:43'),
(178, 'last_name 12', 'employee11@gmail.com', NULL, '$2y$10$QTAxQXudazHSnUhufkc5DeOExG3GNdBu8e4DEYlmliGj7slmHuQWy', 0, 0, 0, 0, NULL, '2022-07-22 08:45:43', '2022-07-22 08:45:43'),
(179, 'last_name 13', 'employee12@gmail.com', NULL, '$2y$10$THR41OKidu5GgOgkmNSkm.FtvLZRV56FwlyeC45dfGcLBN6J.TzkG', 0, 0, 0, 0, NULL, '2022-07-22 08:45:43', '2022-07-22 08:45:43'),
(180, 'last_name 14', 'employee13@gmail.com', NULL, '$2y$10$vSeeKY4qXFEjuJio8EcsSeb/bYQ1A/8Pwq71sg1IcaA1JHHCCKxO6', 0, 0, 0, 0, NULL, '2022-07-22 08:45:43', '2022-07-22 08:45:43'),
(181, 'last_name 15', 'employee14@gmail.com', NULL, '$2y$10$YYOYLx8rQPqFtqvet6GZgOaqhNNEWUcb5S35EmRmB0q1RQZq5Vtg6', 0, 0, 0, 0, NULL, '2022-07-22 08:45:43', '2022-07-22 08:45:43'),
(182, 'last_name 16', 'employee15@gmail.com', NULL, '$2y$10$r1vSmS59AvwKGFnWp/T6Lu7zi.eYAEtmkwlNbKmFv2UCiAeZgqSMu', 0, 0, 0, 0, NULL, '2022-07-22 08:45:43', '2022-07-22 08:45:43'),
(183, 'last_name 17', 'employee16@gmail.com', NULL, '$2y$10$H6kMtS7/eT64S.5j0Nbe.OZ.pIQHbKYQiWpJau5PuJA3O.KRdv8xG', 0, 0, 0, 0, NULL, '2022-07-22 08:45:43', '2022-07-22 08:45:43'),
(184, 'last_name 18', 'employee17@gmail.com', NULL, '$2y$10$98holkTWZBHR2M5maeBtT.F8mA98bB1wdOoMGzrda5p2o4AMtE5Ve', 0, 0, 0, 0, NULL, '2022-07-22 08:45:43', '2022-07-22 08:45:43'),
(185, 'last_name 19', 'employee18@gmail.com', NULL, '$2y$10$XjClk89mM1/0y/6XBOpRmO.8vtPo9Um/L1I5dwP63smsajtbSRVhC', 0, 0, 0, 0, NULL, '2022-07-22 08:45:43', '2022-07-22 08:45:43'),
(186, 'last_name 20', 'employee19@gmail.com', NULL, '$2y$10$nUS5xuwGhtUSlkc.T4lp8uWuqXGfXLnNjsAXHt.bmPD3g3r5ZjxQi', 0, 0, 0, 0, NULL, '2022-07-22 08:45:43', '2022-07-22 08:45:43'),
(187, 'last_name 21', 'employee20@gmail.com', NULL, '$2y$10$JNUkw.4IRfUU6v2/G05ZD.Q8ltEFVGMc6VpbYDmRZQfgNInAAvFzK', 0, 0, 0, 0, NULL, '2022-07-22 08:45:43', '2022-07-22 08:45:43'),
(188, 'last_name 22', 'employee21@gmail.com', NULL, '$2y$10$GtdcvZ.KfTTUWFmrxSjPcuIxUY7zrhWZUbtlDOcWpE0p3PdJe8fUS', 0, 0, 0, 0, NULL, '2022-07-22 08:45:43', '2022-07-22 08:45:43'),
(189, 'last_name 23', 'employee22@gmail.com', NULL, '$2y$10$FDMmLmB8uSDJirJSuB7x..DcWX/tnLHXSQMg7MB9yjprB6yg19xdi', 0, 0, 0, 0, NULL, '2022-07-22 08:45:44', '2022-07-22 08:45:44'),
(190, 'last_name 24', 'employee23@gmail.com', NULL, '$2y$10$otLvW5oyvbIo23TRKhqywu77ykksncy0opP5poGthdlTm5yMKuH2e', 0, 0, 0, 0, NULL, '2022-07-22 08:45:44', '2022-07-22 08:45:44'),
(191, 'last_name 25', 'employee24@gmail.com', NULL, '$2y$10$/3GHHx5eLwN28q.oPsF94eA1.S.Ytg9nlxHSquAw/rAbRKwbVuEY2', 0, 0, 0, 0, NULL, '2022-07-22 08:45:44', '2022-07-22 08:45:44'),
(192, 'last_name 26', 'employee25@gmail.com', NULL, '$2y$10$K0.jv0zVlPfjzHub5H.XQOMjoA0Ejbj5iS3PHbfS.5b5Wyocy4kS2', 0, 0, 0, 0, NULL, '2022-07-22 08:45:44', '2022-07-22 08:45:44'),
(193, 'last_name 27', 'employee26@gmail.com', NULL, '$2y$10$338fEWEYZR8.6A9xfU7uCeSvd.8rsmJFQtfmljahLY4WrynieWjSe', 0, 0, 0, 0, NULL, '2022-07-22 08:45:44', '2022-07-22 08:45:44'),
(194, 'last_name 28', 'employee27@gmail.com', NULL, '$2y$10$BviSM42piNxFkI02cAbit.sgKBEYoDM2zCzLtB2X4r.uGPr6Kvomu', 0, 0, 0, 0, NULL, '2022-07-22 08:45:44', '2022-07-22 08:45:44'),
(195, 'last_name 29', 'employee28@gmail.com', NULL, '$2y$10$IxDT1GN7lcSWUGimKlRL8.jAB5WaG8zwElLLzbQ642ZD169FNq552', 0, 0, 0, 0, NULL, '2022-07-22 08:45:44', '2022-07-22 08:45:44'),
(196, 'last_name 30', 'employee29@gmail.com', NULL, '$2y$10$dlEZKYtOkSooyH8Zmkr1SOWhHGwTwCUlS1hb5dDm.ij0uWu5Ph7US', 0, 0, 0, 0, NULL, '2022-07-22 08:45:44', '2022-07-22 08:45:44'),
(197, 'last_name 31', 'employee30@gmail.com', NULL, '$2y$10$GM5ChQReuT0m1Q8JispOh.vdbN69fTbYcBbkUjvM9QqFNgv9AMbau', 0, 0, 0, 0, NULL, '2022-07-22 08:45:44', '2022-07-22 08:45:44'),
(198, 'last_name 32', 'employee31@gmail.com', NULL, '$2y$10$WZ33cFT88N0woCxEdVZODu8D8DqfS3unPDAnHwF2l2ANEHADgSY..', 0, 0, 0, 0, NULL, '2022-07-22 08:45:44', '2022-07-22 08:45:44'),
(199, 'last_name 33', 'employee32@gmail.com', NULL, '$2y$10$CEdb07gqOy.pyQYIFAlTjefSCLVP7h7QaoEAmO1h3eaw2O2F5mMRq', 0, 0, 0, 0, NULL, '2022-07-22 08:45:44', '2022-07-22 08:45:44'),
(200, 'last_name 34', 'employee33@gmail.com', NULL, '$2y$10$eYwtBPUlKSykfoAbDxRuLOQZd5sQKZISLTHzClQrVWNy0hYpVCrH2', 0, 0, 0, 0, NULL, '2022-07-22 08:45:44', '2022-07-22 08:45:44'),
(201, 'last_name 35', 'employee34@gmail.com', NULL, '$2y$10$Fg.lB5UAFTrth3f/B0Mlyu8xmUbvtbcR/9Cwi8AcpKP44D71eGpdS', 0, 0, 0, 0, NULL, '2022-07-22 08:45:44', '2022-07-22 08:45:44'),
(202, 'last_name 36', 'employee35@gmail.com', NULL, '$2y$10$LusM1bfGQNnoG5fp70THkuu0Ueqy96GKxU45mXTrH2MKdERaKICtG', 0, 0, 0, 0, NULL, '2022-07-22 08:45:45', '2022-07-22 08:45:45'),
(203, 'last_name 37', 'employee36@gmail.com', NULL, '$2y$10$V7wITYwOj0A6S5dg0ZK73uNw0.hrsjDleZd9JPgR1sIRb50GBCdGG', 0, 0, 0, 0, NULL, '2022-07-22 08:45:45', '2022-07-22 08:45:45'),
(204, 'last_name 38', 'employee37@gmail.com', NULL, '$2y$10$e9LS3etZ8mh6oGOQB7nmp./w4bB3TMFbPnkoKfbNa4dlq6vBnpkwm', 0, 0, 0, 0, NULL, '2022-07-22 08:45:45', '2022-07-22 08:45:45'),
(205, 'last_name 39', 'employee38@gmail.com', NULL, '$2y$10$v/CdLYCPYaUk.ST0ObDNLeE834gYRRRewSy67sFLCROyuh.wshXJa', 0, 0, 0, 0, NULL, '2022-07-22 08:45:45', '2022-07-22 08:45:45'),
(206, 'last_name 40', 'employee39@gmail.com', NULL, '$2y$10$lb7whFDPXUVe17AHHkKGweaI1ycxgclHh1JEXlyMULVFJGXd5Orbu', 0, 0, 0, 0, NULL, '2022-07-22 08:45:45', '2022-07-22 08:45:45'),
(207, 'last_name 41', 'employee40@gmail.com', NULL, '$2y$10$dLr0rvbE1OzYhzCg8AvdteVkfeTl0HWuS8YeHwJPBpPF2/z6Lutmu', 0, 0, 0, 0, NULL, '2022-07-22 08:45:45', '2022-07-22 08:45:45'),
(208, 'last_name 42', 'employee41@gmail.com', NULL, '$2y$10$YlWytR/a6.ew4CfhsxcZiOEzDqQbpQu759o72GQJocmrq6uwD8w8K', 0, 0, 0, 0, NULL, '2022-07-22 08:45:45', '2022-07-22 08:45:45'),
(209, 'last_name 43', 'employee42@gmail.com', NULL, '$2y$10$zrG3cIL5tn5.08FuRxKnr.1TbmsgN7ucjguTWPkhrkG7/YZgzv1mO', 0, 0, 0, 0, NULL, '2022-07-22 08:45:45', '2022-07-22 08:45:45'),
(210, 'last_name 44', 'employee43@gmail.com', NULL, '$2y$10$ZnrAOLrvngoVCA21ZTJ9UujrrFejJ1LMf5H4NcvhgLgQNWTzLPVwq', 0, 0, 0, 0, NULL, '2022-07-22 08:45:45', '2022-07-22 08:45:45'),
(211, 'last_name 45', 'employee44@gmail.com', NULL, '$2y$10$UbJkaFRMsL6C3dyE7jLhce189.Pddy4UmJkkXnejhIUIJZ9cTdPmy', 0, 0, 0, 0, NULL, '2022-07-22 08:45:45', '2022-07-22 08:45:45'),
(212, 'last_name 46', 'employee45@gmail.com', NULL, '$2y$10$QJrYJqfEsVYlaSMXp.pxb.0c2iThQHw/RQp15Zk8P5YRnBxac.GHa', 0, 0, 0, 0, NULL, '2022-07-22 08:45:45', '2022-07-22 08:45:45'),
(213, 'last_name 47', 'employee46@gmail.com', NULL, '$2y$10$gOC3LcL5C0OIFXwpCXOfh.PXpEVPqtdHb8w4uBIvHAQZDX8R9jpkO', 0, 0, 0, 0, NULL, '2022-07-22 08:45:45', '2022-07-22 08:45:45'),
(214, 'last_name 48', 'employee47@gmail.com', NULL, '$2y$10$03rYzP0Ut31Zx19U1JAyoOG1LsKwuTllQN/tlrWIQMAOswQ8PE86i', 0, 0, 0, 0, NULL, '2022-07-22 08:45:46', '2022-07-22 08:45:46'),
(215, 'last_name 49', 'employee48@gmail.com', NULL, '$2y$10$00nOm2zeaWeDS4OWr9p1XOFwNU6dgdQp1RzUc/HldhXpIr0aYjn8G', 0, 0, 0, 0, NULL, '2022-07-22 08:45:46', '2022-07-22 08:45:46'),
(216, 'last_name 50', 'employee49@gmail.com', NULL, '$2y$10$/65hZi3zQixcc3iIc/ffROtY1Wn39OEa2A0XyiaiCf8d/oj/YAihS', 0, 0, 0, 0, NULL, '2022-07-22 08:45:46', '2022-07-22 08:45:46'),
(217, 'last_name 51', 'employee50@gmail.com', NULL, '$2y$10$2f5Mrud1N4nMeBpMGoOCW.erfmjb7fHztkSY/.ySw3kqhT9LHZmpy', 0, 0, 0, 0, NULL, '2022-07-22 08:45:46', '2022-07-22 08:45:46'),
(218, 'last_name 52', 'employee51@gmail.com', NULL, '$2y$10$wzD3ihwZkOmfXC01WsR2y.fEeo3MzMRXu0OI.yMtHZoYMT0CDwYvC', 0, 0, 0, 0, NULL, '2022-07-22 08:45:46', '2022-07-22 08:45:46'),
(219, 'last_name 53', 'employee52@gmail.com', NULL, '$2y$10$qU.mdZRiGObuU8/VaPz47.jtavdQaslVrPY01kUV1gVStg/vxpzFi', 0, 0, 0, 0, NULL, '2022-07-22 08:45:46', '2022-07-22 08:45:46'),
(220, 'last_name 54', 'employee53@gmail.com', NULL, '$2y$10$RwK7EeO7CD6PkaxKtW0KsuOdQpdRcKdg1iQlkE61VTEP.WNdS1zfW', 0, 0, 0, 0, NULL, '2022-07-22 08:45:46', '2022-07-22 08:45:46'),
(221, 'last_name 55', 'employee54@gmail.com', NULL, '$2y$10$csTwLAVq25b36wBGkRQBye0pfnLPEIHwrGoOWXcXb5SdjhW7RdrtK', 0, 0, 0, 0, NULL, '2022-07-22 08:45:46', '2022-07-22 08:45:46'),
(222, 'last_name 56', 'employee55@gmail.com', NULL, '$2y$10$m1Ao8oATCepF8I4X/Y261OD9N.TRPMadcL/km4BM2p7sZGQlUWqs2', 0, 0, 0, 0, NULL, '2022-07-22 08:45:46', '2022-07-22 08:45:46'),
(223, 'last_name 57', 'employee56@gmail.com', NULL, '$2y$10$Rd.d/u0Axym/dBQXw5mB2ukp98bULi4h5BA2T3HqTkJmtHk6BacU.', 0, 0, 0, 0, NULL, '2022-07-22 08:45:47', '2022-07-22 08:45:47'),
(224, 'last_name 58', 'employee57@gmail.com', NULL, '$2y$10$MpjWEdJ1eznGZjW3Nh0dvenAs0Q03DpY3Fb4zBUKJNGUqQduVxv2i', 0, 0, 0, 0, NULL, '2022-07-22 08:45:47', '2022-07-22 08:45:47'),
(225, 'last_name 59', 'employee58@gmail.com', NULL, '$2y$10$QnNOXF32mlP134F25zMQyemeoB4aF.BYYMywHHfQRu6c4eq8JwaS.', 0, 0, 0, 0, NULL, '2022-07-22 08:45:47', '2022-07-22 08:45:47'),
(226, 'last_name 60', 'employee59@gmail.com', NULL, '$2y$10$HNqsr8CXrQQ9zMUs.1P.WeKQd7wmQHLr2H7kuuM733BRVRRKHD.Mi', 0, 0, 0, 0, NULL, '2022-07-22 08:45:47', '2022-07-22 08:45:47'),
(227, 'last_name 61', 'employee60@gmail.com', NULL, '$2y$10$TVQgIxaILOnA/lDIt44NLelNhT3WplJbCSrYSzUIU0BvV8e/8G/w.', 0, 0, 0, 0, NULL, '2022-07-22 08:45:47', '2022-07-22 08:45:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `allowances`
--
ALTER TABLE `allowances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assign_modules`
--
ALTER TABLE `assign_modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assign_permissions`
--
ALTER TABLE `assign_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendance_logs`
--
ALTER TABLE `attendance_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_infos`
--
ALTER TABLE `bank_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `branches_company_id_index` (`company_id`),
  ADD KEY `branches_user_id_index` (`user_id`);

--
-- Indexes for table `branch_contacts`
--
ALTER TABLE `branch_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `branch_contacts_branch_id_index` (`branch_id`);

--
-- Indexes for table `commissions`
--
ALTER TABLE `commissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `companies_user_id_index` (`user_id`);

--
-- Indexes for table `company_contacts`
--
ALTER TABLE `company_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_contacts_company_id_index` (`company_id`);

--
-- Indexes for table `company_modules`
--
ALTER TABLE `company_modules`
  ADD KEY `company_modules_company_id_index` (`company_id`),
  ADD KEY `company_modules_module_id_index` (`module_id`);

--
-- Indexes for table `deductions`
--
ALTER TABLE `deductions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `devices_company_id_foreign` (`company_id`),
  ADD KEY `devices_status_id_foreign` (`status_id`);

--
-- Indexes for table `device_statuses`
--
ALTER TABLE `device_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `document_infos`
--
ALTER TABLE `document_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `modules_name_unique` (`name`);

--
-- Indexes for table `overtimes`
--
ALTER TABLE `overtimes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `personal_infos`
--
ALTER TABLE `personal_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salaries`
--
ALTER TABLE `salaries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salary_types`
--
ALTER TABLE `salary_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `allowances`
--
ALTER TABLE `allowances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `assign_modules`
--
ALTER TABLE `assign_modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `assign_permissions`
--
ALTER TABLE `assign_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `attendance_logs`
--
ALTER TABLE `attendance_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `bank_infos`
--
ALTER TABLE `bank_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `branch_contacts`
--
ALTER TABLE `branch_contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `commissions`
--
ALTER TABLE `commissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `company_contacts`
--
ALTER TABLE `company_contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `deductions`
--
ALTER TABLE `deductions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `devices`
--
ALTER TABLE `devices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `device_statuses`
--
ALTER TABLE `device_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `document_infos`
--
ALTER TABLE `document_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `overtimes`
--
ALTER TABLE `overtimes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- AUTO_INCREMENT for table `personal_infos`
--
ALTER TABLE `personal_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `salaries`
--
ALTER TABLE `salaries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `salary_types`
--
ALTER TABLE `salary_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=228;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `branches`
--
ALTER TABLE `branches`
  ADD CONSTRAINT `branches_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `branches_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `branch_contacts`
--
ALTER TABLE `branch_contacts`
  ADD CONSTRAINT `branch_contacts_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `companies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `company_contacts`
--
ALTER TABLE `company_contacts`
  ADD CONSTRAINT `company_contacts_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `company_modules`
--
ALTER TABLE `company_modules`
  ADD CONSTRAINT `company_modules_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `company_modules_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `devices`
--
ALTER TABLE `devices`
  ADD CONSTRAINT `devices_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `devices_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `device_statuses` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
