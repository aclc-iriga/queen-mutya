-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 20, 2025 at 10:02 AM
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
-- Database: `queen-mutya`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `number` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `active_portion` varchar(255) DEFAULT NULL,
  `called_at` timestamp NULL DEFAULT NULL,
  `pinged_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `number`, `name`, `avatar`, `username`, `password`, `active_portion`, `called_at`, `pinged_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'DEVELOPMENT', 'no-avatar.jpg', 'admin', 'admin', NULL, NULL, NULL, '2023-02-19 07:36:32', '2023-05-28 05:27:35');

-- --------------------------------------------------------

--
-- Table structure for table `arrangements`
--

CREATE TABLE `arrangements` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `team_id` tinyint(3) UNSIGNED NOT NULL,
  `order` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `competition_id` tinyint(3) UNSIGNED NOT NULL,
  `slug` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `competition_id`, `slug`, `title`, `created_at`, `updated_at`) VALUES
(1, 1, 'arriba-plaza-queen-2025', 'Arriba Plaza Queen 2025', '2023-04-06 13:25:10', '2025-06-20 05:55:17'),
(2, 1, 'mutyang-pangkalawakan-2025', 'Mutyang Pangkalawakan 2025', '2023-04-23 09:59:52', '2025-06-20 05:55:38');

-- --------------------------------------------------------

--
-- Table structure for table `competitions`
--

CREATE TABLE `competitions` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `slug` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `competitions`
--

INSERT INTO `competitions` (`id`, `slug`, `title`, `created_at`, `updated_at`) VALUES
(1, 'queen-mutya-2025', 'Arriba Plaza Queen & Mutyang Pangkalawakan 2025', '2023-04-06 13:24:04', '2025-06-20 06:33:15');

-- --------------------------------------------------------

--
-- Table structure for table `criteria`
--

CREATE TABLE `criteria` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `percentage` float UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `criteria`
--

INSERT INTO `criteria` (`id`, `event_id`, `title`, `percentage`, `created_at`, `updated_at`) VALUES
(1, 1, 'Uniqueness & Style', 40, '2025-06-20 06:03:43', '2025-06-20 06:03:43'),
(2, 1, 'Poise & Projection', 30, '2025-06-20 06:03:56', '2025-06-20 06:03:56'),
(3, 1, 'Stage Appeal', 20, '2025-06-20 06:04:05', '2025-06-20 06:04:05'),
(4, 1, 'Audience Impact', 10, '2025-06-20 06:04:14', '2025-06-20 06:04:14'),
(5, 2, 'Uniqueness & Style', 40, '2025-06-20 06:04:55', '2025-06-20 06:04:55'),
(6, 2, 'Poise & Projection', 30, '2025-06-20 06:05:05', '2025-06-20 06:05:05'),
(7, 2, 'Stage Appeal', 20, '2025-06-20 06:05:13', '2025-06-20 06:05:13'),
(8, 2, 'Audience Impact', 10, '2025-06-20 06:05:20', '2025-06-20 06:05:20'),
(9, 3, 'Uniqueness & Style', 30, '2025-06-20 06:08:06', '2025-06-20 06:08:06'),
(10, 3, 'Figure', 40, '2025-06-20 06:08:13', '2025-06-20 06:08:13'),
(11, 3, 'Poise & Projection', 30, '2025-06-20 06:08:28', '2025-06-20 06:08:28'),
(12, 4, 'Uniqueness & Style', 40, '2025-06-20 06:08:57', '2025-06-20 06:08:57'),
(13, 4, 'Poise & Bearing', 30, '2025-06-20 06:09:07', '2025-06-20 06:09:07'),
(14, 4, 'Stage Deportment', 30, '2025-06-20 06:09:40', '2025-06-20 06:09:40'),
(15, 5, 'Mastery', 40, '2025-06-20 06:11:45', '2025-06-20 06:11:45'),
(16, 5, 'Uniqueness', 40, '2025-06-20 06:11:55', '2025-06-20 06:11:55'),
(17, 5, 'Entertainment Value', 20, '2025-06-20 06:12:05', '2025-06-20 06:12:05'),
(18, 6, 'Mastery', 40, '2025-06-20 06:12:44', '2025-06-20 06:12:44'),
(19, 6, 'Uniqueness', 40, '2025-06-20 06:12:53', '2025-06-20 06:12:53'),
(20, 6, 'Entertainment Value', 20, '2025-06-20 06:13:03', '2025-06-20 06:13:03'),
(21, 7, 'Style & Elegance', 40, '2025-06-20 06:14:43', '2025-06-20 06:14:43'),
(22, 7, 'Poise & Grace', 40, '2025-06-20 06:14:51', '2025-06-20 06:14:51'),
(23, 7, 'Stage Deportment', 20, '2025-06-20 06:15:13', '2025-06-20 06:15:13'),
(24, 8, 'Uniqueness & Style', 40, '2025-06-20 06:15:29', '2025-06-20 06:15:29'),
(25, 8, 'Eksenang Pang Awra', 40, '2025-06-20 06:15:46', '2025-06-20 06:15:46'),
(26, 8, 'Pagkamangha ng Madla', 20, '2025-06-20 06:15:59', '2025-06-20 06:15:59'),
(27, 9, 'Beauty of the Face', 50, '2025-06-20 06:18:11', '2025-06-20 06:18:11'),
(28, 9, 'Intelligence', 30, '2025-06-20 06:18:23', '2025-06-20 06:18:23'),
(29, 9, 'Poise & Bearing', 20, '2025-06-20 06:18:32', '2025-06-20 06:18:32'),
(30, 10, 'Kakaibang Ganda', 40, '2025-06-20 06:18:47', '2025-06-20 06:18:47'),
(31, 10, 'Talinong Walang Palya', 40, '2025-06-20 06:18:59', '2025-06-20 06:18:59'),
(32, 10, 'Kabog na Pagrampa', 20, '2025-06-20 06:19:18', '2025-06-20 06:21:31'),
(33, 11, 'Beauty of the Face', 40, '2025-06-20 06:22:04', '2025-06-20 06:22:04'),
(34, 11, 'Intelligence', 30, '2025-06-20 06:22:15', '2025-06-20 06:22:15'),
(35, 11, 'Figure', 20, '2025-06-20 06:22:23', '2025-06-20 06:22:23'),
(36, 11, 'Stage Deportment', 10, '2025-06-20 06:22:29', '2025-06-20 06:22:29'),
(37, 12, 'Mahusay na Pagsagot', 40, '2025-06-20 06:22:45', '2025-06-20 06:22:45'),
(38, 12, 'Nakakatawang Ganda', 30, '2025-06-20 06:22:55', '2025-06-20 06:22:55'),
(39, 12, 'Nakakaaliw na Pagrampa', 20, '2025-06-20 06:23:04', '2025-06-20 06:23:04'),
(40, 12, 'Kakaibang Dating sa Entablado', 10, '2025-06-20 06:23:17', '2025-06-20 06:23:17');

-- --------------------------------------------------------

--
-- Table structure for table `deductions`
--

CREATE TABLE `deductions` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `technical_id` tinyint(3) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `team_id` tinyint(3) UNSIGNED NOT NULL,
  `value` float UNSIGNED NOT NULL DEFAULT 0,
  `is_locked` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `duos`
--

CREATE TABLE `duos` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `slug` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `event_id_1` smallint(5) UNSIGNED NOT NULL,
  `event_id_2` smallint(5) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `duos`
--

INSERT INTO `duos` (`id`, `slug`, `title`, `event_id_1`, `event_id_2`, `created_at`, `updated_at`) VALUES
(1, 'production', 'PRODUCTION', 1, 2, '2025-06-20 06:24:40', '2025-06-20 06:24:40'),
(2, 'swimsuit', 'SWIMSUIT', 3, 4, '2025-06-20 06:25:10', '2025-06-20 06:25:10'),
(3, 'talent', 'TALENT', 5, 6, '2025-06-20 06:25:32', '2025-06-20 06:25:32'),
(4, 'long-gown', 'LONG GOWN', 7, 8, '2025-06-20 06:26:00', '2025-06-20 06:26:00'),
(5, 'prelim-qa', 'PRELIM', 9, 10, '2025-06-20 06:26:52', '2025-06-20 06:26:52'),
(6, 'final-qa', 'FINAL', 11, 12, '2025-06-20 06:27:22', '2025-06-20 06:27:22');

-- --------------------------------------------------------

--
-- Table structure for table `eliminations`
--

CREATE TABLE `eliminations` (
  `id` mediumint(9) NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `team_id` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `eliminations`
--

INSERT INTO `eliminations` (`id`, `event_id`, `team_id`, `created_at`, `updated_at`) VALUES
(1, 1, 10, '2025-06-20 07:06:57', '2025-06-20 07:06:57'),
(2, 1, 11, '2025-06-20 07:06:58', '2025-06-20 07:06:58'),
(3, 1, 12, '2025-06-20 07:06:59', '2025-06-20 07:06:59'),
(4, 1, 13, '2025-06-20 07:07:00', '2025-06-20 07:07:00'),
(5, 1, 14, '2025-06-20 07:07:01', '2025-06-20 07:07:01'),
(6, 1, 15, '2025-06-20 07:07:02', '2025-06-20 07:07:02'),
(7, 1, 16, '2025-06-20 07:07:03', '2025-06-20 07:07:03'),
(8, 1, 17, '2025-06-20 07:07:05', '2025-06-20 07:07:05'),
(9, 1, 18, '2025-06-20 07:07:06', '2025-06-20 07:07:06'),
(10, 1, 19, '2025-06-20 07:07:07', '2025-06-20 07:07:07'),
(11, 3, 10, '2025-06-20 07:07:12', '2025-06-20 07:07:12'),
(12, 3, 11, '2025-06-20 07:07:13', '2025-06-20 07:07:13'),
(13, 3, 12, '2025-06-20 07:07:14', '2025-06-20 07:07:14'),
(14, 3, 13, '2025-06-20 07:07:16', '2025-06-20 07:07:16'),
(15, 3, 14, '2025-06-20 07:07:17', '2025-06-20 07:07:17'),
(16, 3, 15, '2025-06-20 07:07:18', '2025-06-20 07:07:18'),
(17, 3, 16, '2025-06-20 07:07:19', '2025-06-20 07:07:19'),
(18, 3, 17, '2025-06-20 07:07:20', '2025-06-20 07:07:20'),
(19, 3, 18, '2025-06-20 07:07:21', '2025-06-20 07:07:21'),
(20, 3, 19, '2025-06-20 07:07:22', '2025-06-20 07:07:22'),
(21, 5, 10, '2025-06-20 07:07:24', '2025-06-20 07:07:24'),
(22, 5, 11, '2025-06-20 07:07:25', '2025-06-20 07:07:25'),
(23, 5, 12, '2025-06-20 07:07:26', '2025-06-20 07:07:26'),
(24, 5, 13, '2025-06-20 07:07:28', '2025-06-20 07:07:28'),
(25, 5, 14, '2025-06-20 07:07:28', '2025-06-20 07:07:28'),
(26, 5, 15, '2025-06-20 07:07:29', '2025-06-20 07:07:29'),
(27, 5, 16, '2025-06-20 07:07:30', '2025-06-20 07:07:30'),
(28, 5, 17, '2025-06-20 07:07:31', '2025-06-20 07:07:31'),
(29, 5, 18, '2025-06-20 07:07:32', '2025-06-20 07:07:32'),
(30, 5, 19, '2025-06-20 07:07:33', '2025-06-20 07:07:33'),
(31, 7, 10, '2025-06-20 07:07:38', '2025-06-20 07:07:38'),
(32, 7, 11, '2025-06-20 07:07:39', '2025-06-20 07:07:39'),
(33, 7, 12, '2025-06-20 07:07:40', '2025-06-20 07:07:40'),
(34, 7, 13, '2025-06-20 07:07:41', '2025-06-20 07:07:41'),
(35, 7, 14, '2025-06-20 07:07:42', '2025-06-20 07:07:42'),
(36, 7, 15, '2025-06-20 07:07:43', '2025-06-20 07:07:43'),
(37, 7, 16, '2025-06-20 07:07:44', '2025-06-20 07:07:44'),
(38, 7, 17, '2025-06-20 07:07:45', '2025-06-20 07:07:45'),
(39, 7, 18, '2025-06-20 07:07:46', '2025-06-20 07:07:46'),
(40, 7, 19, '2025-06-20 07:07:47', '2025-06-20 07:07:47'),
(41, 9, 10, '2025-06-20 07:07:49', '2025-06-20 07:07:49'),
(42, 9, 11, '2025-06-20 07:07:51', '2025-06-20 07:07:51'),
(43, 9, 12, '2025-06-20 07:07:51', '2025-06-20 07:07:51'),
(44, 9, 13, '2025-06-20 07:07:53', '2025-06-20 07:07:53'),
(45, 9, 14, '2025-06-20 07:07:54', '2025-06-20 07:07:54'),
(46, 9, 15, '2025-06-20 07:07:55', '2025-06-20 07:07:55'),
(47, 9, 16, '2025-06-20 07:07:56', '2025-06-20 07:07:56'),
(48, 9, 17, '2025-06-20 07:07:57', '2025-06-20 07:07:57'),
(49, 9, 18, '2025-06-20 07:07:58', '2025-06-20 07:07:58'),
(50, 9, 19, '2025-06-20 07:07:59', '2025-06-20 07:07:59'),
(51, 11, 10, '2025-06-20 07:08:03', '2025-06-20 07:08:03'),
(52, 11, 11, '2025-06-20 07:08:04', '2025-06-20 07:08:04'),
(53, 11, 12, '2025-06-20 07:08:05', '2025-06-20 07:08:05'),
(54, 11, 13, '2025-06-20 07:08:06', '2025-06-20 07:08:06'),
(55, 11, 14, '2025-06-20 07:08:07', '2025-06-20 07:08:07'),
(56, 11, 15, '2025-06-20 07:08:08', '2025-06-20 07:08:08'),
(57, 11, 16, '2025-06-20 07:08:09', '2025-06-20 07:08:09'),
(58, 11, 17, '2025-06-20 07:08:10', '2025-06-20 07:08:10'),
(59, 11, 18, '2025-06-20 07:08:11', '2025-06-20 07:08:11'),
(60, 11, 19, '2025-06-20 07:08:11', '2025-06-20 07:08:11'),
(61, 11, 1, '2025-06-20 07:08:13', '2025-06-20 07:08:13'),
(62, 11, 2, '2025-06-20 07:08:14', '2025-06-20 07:08:14'),
(63, 11, 3, '2025-06-20 07:08:15', '2025-06-20 07:08:15'),
(64, 11, 4, '2025-06-20 07:08:16', '2025-06-20 07:08:16'),
(65, 11, 5, '2025-06-20 07:08:17', '2025-06-20 07:08:17'),
(66, 11, 6, '2025-06-20 07:08:18', '2025-06-20 07:08:18'),
(67, 11, 7, '2025-06-20 07:08:19', '2025-06-20 07:08:19'),
(68, 11, 8, '2025-06-20 07:08:20', '2025-06-20 07:08:20'),
(69, 11, 9, '2025-06-20 07:08:21', '2025-06-20 07:08:21'),
(70, 2, 1, '2025-06-20 07:08:30', '2025-06-20 07:08:30'),
(71, 2, 2, '2025-06-20 07:08:30', '2025-06-20 07:08:30'),
(72, 2, 3, '2025-06-20 07:08:31', '2025-06-20 07:08:31'),
(73, 2, 4, '2025-06-20 07:08:32', '2025-06-20 07:08:32'),
(74, 2, 5, '2025-06-20 07:08:33', '2025-06-20 07:08:33'),
(75, 2, 6, '2025-06-20 07:08:34', '2025-06-20 07:08:34'),
(76, 2, 7, '2025-06-20 07:08:35', '2025-06-20 07:08:35'),
(77, 2, 8, '2025-06-20 07:08:36', '2025-06-20 07:08:36'),
(78, 2, 9, '2025-06-20 07:08:37', '2025-06-20 07:08:37'),
(79, 4, 1, '2025-06-20 07:08:41', '2025-06-20 07:08:41'),
(80, 4, 2, '2025-06-20 07:08:42', '2025-06-20 07:08:42'),
(81, 4, 3, '2025-06-20 07:08:42', '2025-06-20 07:08:42'),
(82, 4, 4, '2025-06-20 07:08:43', '2025-06-20 07:08:43'),
(83, 4, 5, '2025-06-20 07:08:44', '2025-06-20 07:08:44'),
(84, 4, 6, '2025-06-20 07:08:45', '2025-06-20 07:08:45'),
(85, 4, 7, '2025-06-20 07:08:46', '2025-06-20 07:08:46'),
(86, 4, 8, '2025-06-20 07:08:47', '2025-06-20 07:08:47'),
(87, 4, 9, '2025-06-20 07:08:48', '2025-06-20 07:08:48'),
(88, 6, 1, '2025-06-20 07:08:51', '2025-06-20 07:08:51'),
(89, 6, 2, '2025-06-20 07:08:52', '2025-06-20 07:08:52'),
(90, 6, 3, '2025-06-20 07:08:53', '2025-06-20 07:08:53'),
(91, 6, 4, '2025-06-20 07:08:54', '2025-06-20 07:08:54'),
(92, 6, 5, '2025-06-20 07:08:55', '2025-06-20 07:08:55'),
(93, 6, 6, '2025-06-20 07:08:56', '2025-06-20 07:08:56'),
(94, 6, 7, '2025-06-20 07:08:57', '2025-06-20 07:08:57'),
(95, 6, 8, '2025-06-20 07:08:58', '2025-06-20 07:08:58'),
(96, 6, 9, '2025-06-20 07:08:58', '2025-06-20 07:08:58'),
(97, 8, 1, '2025-06-20 07:09:01', '2025-06-20 07:09:01'),
(98, 8, 2, '2025-06-20 07:09:02', '2025-06-20 07:09:02'),
(99, 8, 3, '2025-06-20 07:09:02', '2025-06-20 07:09:02'),
(100, 8, 4, '2025-06-20 07:09:03', '2025-06-20 07:09:03'),
(101, 8, 5, '2025-06-20 07:09:04', '2025-06-20 07:09:04'),
(102, 8, 6, '2025-06-20 07:09:05', '2025-06-20 07:09:05'),
(103, 8, 7, '2025-06-20 07:09:06', '2025-06-20 07:09:06'),
(104, 8, 8, '2025-06-20 07:09:07', '2025-06-20 07:09:07'),
(105, 8, 9, '2025-06-20 07:09:08', '2025-06-20 07:09:08'),
(106, 10, 1, '2025-06-20 07:09:09', '2025-06-20 07:09:09'),
(107, 10, 2, '2025-06-20 07:09:11', '2025-06-20 07:09:11'),
(108, 10, 3, '2025-06-20 07:09:11', '2025-06-20 07:09:11'),
(109, 10, 4, '2025-06-20 07:09:12', '2025-06-20 07:09:12'),
(110, 10, 5, '2025-06-20 07:09:13', '2025-06-20 07:09:13'),
(111, 10, 6, '2025-06-20 07:09:14', '2025-06-20 07:09:14'),
(112, 10, 7, '2025-06-20 07:09:15', '2025-06-20 07:09:15'),
(113, 10, 8, '2025-06-20 07:09:16', '2025-06-20 07:09:16'),
(114, 10, 9, '2025-06-20 07:09:17', '2025-06-20 07:09:17'),
(115, 12, 1, '2025-06-20 07:09:18', '2025-06-20 07:09:18'),
(116, 12, 2, '2025-06-20 07:09:19', '2025-06-20 07:09:19'),
(117, 12, 3, '2025-06-20 07:09:20', '2025-06-20 07:09:20'),
(118, 12, 4, '2025-06-20 07:09:21', '2025-06-20 07:09:21'),
(119, 12, 5, '2025-06-20 07:09:22', '2025-06-20 07:09:22'),
(120, 12, 6, '2025-06-20 07:09:23', '2025-06-20 07:09:23'),
(121, 12, 7, '2025-06-20 07:09:24', '2025-06-20 07:09:24'),
(122, 12, 8, '2025-06-20 07:09:25', '2025-06-20 07:09:25'),
(123, 12, 9, '2025-06-20 07:09:26', '2025-06-20 07:09:26'),
(124, 12, 10, '2025-06-20 07:09:28', '2025-06-20 07:09:28'),
(125, 12, 11, '2025-06-20 07:09:29', '2025-06-20 07:09:29'),
(126, 12, 12, '2025-06-20 07:09:30', '2025-06-20 07:09:30'),
(127, 12, 13, '2025-06-20 07:09:31', '2025-06-20 07:09:31'),
(128, 12, 14, '2025-06-20 07:09:32', '2025-06-20 07:09:32'),
(129, 12, 15, '2025-06-20 07:09:32', '2025-06-20 07:09:32'),
(130, 12, 16, '2025-06-20 07:09:34', '2025-06-20 07:09:34'),
(131, 12, 17, '2025-06-20 07:09:34', '2025-06-20 07:09:34'),
(132, 12, 18, '2025-06-20 07:09:35', '2025-06-20 07:09:35'),
(133, 12, 19, '2025-06-20 07:09:36', '2025-06-20 07:09:36');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `category_id` tinyint(3) UNSIGNED NOT NULL,
  `slug` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `category_id`, `slug`, `title`, `created_at`, `updated_at`) VALUES
(1, 1, 'production-queen', 'Production (Queen)', '2025-06-20 06:02:37', '2025-06-20 06:02:47'),
(2, 2, 'production-mutya', 'Production (Mutya)', '2025-06-20 06:03:15', '2025-06-20 06:04:36'),
(3, 1, 'swimsuit-queen', 'Swimsuit (Queen)', '2025-06-20 06:06:56', '2025-06-20 06:06:56'),
(4, 2, 'swimsuit-mutya', 'Swimsuit (Mutya)', '2025-06-20 06:07:12', '2025-06-20 06:07:12'),
(5, 1, 'talent-queen', 'Talent (Queen)', '2025-06-20 06:11:08', '2025-06-20 06:11:08'),
(6, 2, 'talent-mutya', 'Talent (Mutya)', '2025-06-20 06:11:24', '2025-06-20 06:11:24'),
(7, 1, 'long-gown-queen', 'Long Gown (Queen)', '2025-06-20 06:14:08', '2025-06-20 06:14:08'),
(8, 2, 'long-gown-mutya', 'Long Gown (Mutya)', '2025-06-20 06:14:20', '2025-06-20 06:14:20'),
(9, 1, 'prelim-qa-queen', 'Preliminary Q&A (Queen)', '2025-06-20 06:17:19', '2025-06-20 06:17:19'),
(10, 2, 'prelim-qa-mutya', 'Preliminary Q&A (Mutya)', '2025-06-20 06:17:41', '2025-06-20 06:17:41'),
(11, 1, 'final-qa-queen', 'Final Q&A (Queen)', '2025-06-20 06:20:16', '2025-06-20 06:20:16'),
(12, 2, 'final-qa-mutya', 'Final Q&A (Mutya)', '2025-06-20 06:20:43', '2025-06-20 06:20:43');

-- --------------------------------------------------------

--
-- Table structure for table `judges`
--

CREATE TABLE `judges` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `number` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `active_portion` varchar(255) DEFAULT NULL,
  `called_at` timestamp NULL DEFAULT NULL,
  `pinged_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `judges`
--

INSERT INTO `judges` (`id`, `number`, `name`, `avatar`, `username`, `password`, `active_portion`, `called_at`, `pinged_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Judge 01', 'no-avatar.jpg', 'judge01', 'judge01', NULL, NULL, NULL, '2023-04-06 13:58:11', '2025-06-20 08:01:18'),
(2, 2, 'Judge 02', 'no-avatar.jpg', 'judge02', 'judge02', NULL, NULL, NULL, '2023-04-06 13:58:28', '2025-06-20 08:01:20'),
(3, 3, 'Judge 03', 'no-avatar.jpg', 'judge03', 'judge03', NULL, NULL, NULL, '2023-04-06 13:58:42', '2025-06-20 05:54:10'),
(4, 4, 'Judge 04', 'no-avatar.jpg', 'judge04', 'judge04', NULL, NULL, NULL, '2023-04-06 13:59:26', '2025-06-20 05:54:10'),
(5, 5, 'Judge 05', 'no-avatar.jpg', 'judge05', 'judge05', NULL, NULL, NULL, '2023-04-06 14:00:00', '2025-06-20 05:54:10');

-- --------------------------------------------------------

--
-- Table structure for table `judge_event`
--

CREATE TABLE `judge_event` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `judge_id` tinyint(3) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `is_chairman` tinyint(1) NOT NULL DEFAULT 0,
  `active_team_id` tinyint(3) UNSIGNED NOT NULL,
  `has_active_team` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `judge_event`
--

INSERT INTO `judge_event` (`id`, `judge_id`, `event_id`, `is_chairman`, `active_team_id`, `has_active_team`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0, 1, 0, '2025-06-20 07:16:54', '2025-06-20 07:16:54'),
(2, 1, 2, 0, 1, 0, '2025-06-20 07:16:56', '2025-06-20 07:16:56'),
(3, 1, 3, 0, 1, 0, '2025-06-20 07:16:58', '2025-06-20 07:16:58'),
(4, 1, 4, 0, 1, 0, '2025-06-20 07:17:00', '2025-06-20 07:17:00'),
(5, 1, 5, 0, 1, 0, '2025-06-20 07:17:02', '2025-06-20 07:17:02'),
(6, 1, 6, 0, 1, 0, '2025-06-20 07:17:04', '2025-06-20 07:17:04'),
(7, 1, 7, 0, 1, 0, '2025-06-20 07:17:06', '2025-06-20 07:17:06'),
(8, 1, 8, 0, 1, 0, '2025-06-20 07:17:08', '2025-06-20 07:17:08'),
(9, 1, 9, 0, 1, 0, '2025-06-20 07:17:10', '2025-06-20 07:17:10'),
(10, 1, 10, 0, 1, 0, '2025-06-20 07:17:12', '2025-06-20 07:17:12'),
(11, 1, 11, 0, 1, 0, '2025-06-20 07:17:14', '2025-06-20 07:17:14'),
(12, 1, 12, 0, 1, 0, '2025-06-20 07:17:16', '2025-06-20 07:17:16'),
(13, 2, 1, 0, 1, 0, '2025-06-20 07:17:21', '2025-06-20 07:17:21'),
(14, 2, 2, 0, 1, 0, '2025-06-20 07:17:25', '2025-06-20 07:17:25'),
(15, 2, 3, 0, 1, 0, '2025-06-20 07:17:28', '2025-06-20 07:17:28'),
(16, 2, 4, 0, 1, 0, '2025-06-20 07:17:30', '2025-06-20 07:17:30'),
(17, 2, 5, 0, 1, 0, '2025-06-20 07:17:32', '2025-06-20 07:17:32'),
(18, 2, 6, 0, 1, 0, '2025-06-20 07:17:34', '2025-06-20 07:17:34'),
(19, 2, 7, 0, 1, 0, '2025-06-20 07:17:37', '2025-06-20 07:17:37'),
(20, 2, 8, 0, 1, 0, '2025-06-20 07:17:39', '2025-06-20 07:17:39'),
(21, 2, 9, 0, 1, 0, '2025-06-20 07:17:41', '2025-06-20 07:17:41'),
(22, 2, 10, 0, 1, 0, '2025-06-20 07:17:43', '2025-06-20 07:17:43'),
(23, 2, 11, 0, 1, 0, '2025-06-20 07:17:46', '2025-06-20 07:17:46'),
(24, 2, 12, 0, 1, 0, '2025-06-20 07:17:48', '2025-06-20 07:17:48'),
(25, 3, 1, 0, 1, 0, '2025-06-20 07:17:53', '2025-06-20 07:17:53'),
(26, 3, 2, 0, 1, 0, '2025-06-20 07:17:56', '2025-06-20 07:17:56'),
(27, 3, 3, 0, 1, 0, '2025-06-20 07:17:58', '2025-06-20 07:17:58'),
(28, 3, 4, 0, 1, 0, '2025-06-20 07:18:00', '2025-06-20 07:18:00'),
(29, 3, 5, 0, 1, 0, '2025-06-20 07:18:02', '2025-06-20 07:18:02'),
(30, 3, 6, 0, 1, 0, '2025-06-20 07:18:04', '2025-06-20 07:18:04'),
(31, 3, 7, 0, 1, 0, '2025-06-20 07:18:06', '2025-06-20 07:18:06'),
(32, 3, 8, 0, 1, 0, '2025-06-20 07:18:08', '2025-06-20 07:18:08'),
(33, 3, 9, 0, 1, 0, '2025-06-20 07:18:10', '2025-06-20 07:18:10'),
(34, 3, 10, 0, 1, 0, '2025-06-20 07:18:12', '2025-06-20 07:18:12'),
(35, 3, 11, 0, 1, 0, '2025-06-20 07:18:14', '2025-06-20 07:18:14'),
(36, 3, 12, 0, 1, 0, '2025-06-20 07:18:16', '2025-06-20 07:18:16'),
(37, 4, 1, 0, 1, 0, '2025-06-20 07:18:22', '2025-06-20 07:18:22'),
(38, 4, 2, 0, 1, 0, '2025-06-20 07:18:24', '2025-06-20 07:18:24'),
(39, 4, 3, 0, 1, 0, '2025-06-20 07:18:26', '2025-06-20 07:18:26'),
(40, 4, 4, 0, 1, 0, '2025-06-20 07:18:28', '2025-06-20 07:18:28'),
(41, 4, 5, 0, 1, 0, '2025-06-20 07:18:30', '2025-06-20 07:18:30'),
(42, 4, 6, 0, 1, 0, '2025-06-20 07:18:34', '2025-06-20 07:18:34'),
(43, 4, 7, 0, 1, 0, '2025-06-20 07:18:37', '2025-06-20 07:18:37'),
(44, 4, 8, 0, 1, 0, '2025-06-20 07:18:40', '2025-06-20 07:18:40'),
(45, 4, 9, 0, 1, 0, '2025-06-20 07:18:42', '2025-06-20 07:18:42'),
(46, 4, 10, 0, 1, 0, '2025-06-20 07:18:44', '2025-06-20 07:18:44'),
(47, 4, 11, 0, 1, 0, '2025-06-20 07:18:47', '2025-06-20 07:18:47'),
(48, 4, 12, 0, 1, 0, '2025-06-20 07:18:49', '2025-06-20 07:18:49'),
(49, 5, 1, 0, 1, 0, '2025-06-20 07:18:55', '2025-06-20 07:18:55'),
(50, 5, 2, 0, 1, 0, '2025-06-20 07:18:57', '2025-06-20 07:18:57'),
(51, 5, 3, 0, 1, 0, '2025-06-20 07:19:00', '2025-06-20 07:19:00'),
(52, 5, 4, 0, 1, 0, '2025-06-20 07:19:02', '2025-06-20 07:19:02'),
(53, 5, 5, 0, 1, 0, '2025-06-20 07:19:04', '2025-06-20 07:19:04'),
(54, 5, 6, 0, 1, 0, '2025-06-20 07:19:06', '2025-06-20 07:19:06'),
(55, 5, 7, 0, 1, 0, '2025-06-20 07:19:08', '2025-06-20 07:19:08'),
(56, 5, 8, 0, 1, 0, '2025-06-20 07:19:10', '2025-06-20 07:19:10'),
(57, 5, 9, 0, 1, 0, '2025-06-20 07:19:12', '2025-06-20 07:19:12'),
(58, 5, 10, 0, 1, 0, '2025-06-20 07:19:14', '2025-06-20 07:19:14'),
(59, 5, 11, 0, 1, 0, '2025-06-20 07:19:16', '2025-06-20 07:19:16'),
(60, 5, 12, 0, 1, 0, '2025-06-20 07:19:18', '2025-06-20 07:19:18');

-- --------------------------------------------------------

--
-- Table structure for table `noshows`
--

CREATE TABLE `noshows` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `team_id` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `participants`
--

CREATE TABLE `participants` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `team_id` tinyint(3) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `number` smallint(5) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `points`
--

CREATE TABLE `points` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `rank` tinyint(3) UNSIGNED NOT NULL,
  `value` float UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `judge_id` tinyint(3) UNSIGNED NOT NULL,
  `criteria_id` smallint(5) UNSIGNED NOT NULL,
  `team_id` tinyint(3) UNSIGNED NOT NULL,
  `value` float UNSIGNED NOT NULL DEFAULT 0,
  `is_locked` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `number` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `location` varchar(32) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `number`, `name`, `location`, `avatar`, `created_at`, `updated_at`) VALUES
(1, 1, 'MARIA CHESKA DEYN', 'Pilar, Sorsogon', 'queen-maria-cheska-deyn.jpg', '2025-06-20 07:01:01', '2025-06-20 07:01:01'),
(2, 2, 'SAPPHIRE NEIGEL', 'Iriga City', 'queen-sapphire-neigel.jpg', '2025-06-20 07:01:01', '2025-06-20 07:01:01'),
(3, 3, 'PRECIOUS LOVEMARIE', 'Naga City', 'queen-precious-lovemarie.jpg', '2025-06-20 07:01:01', '2025-06-20 07:01:01'),
(4, 4, 'MACY DELA PAZ', 'Legazapi City', 'queen-macy-dela-paz.jpg', '2025-06-20 07:01:01', '2025-06-20 07:01:01'),
(5, 5, 'ML TUCAY', 'Pangasinan', 'queen-ml-tucay.jpg', '2025-06-20 07:01:01', '2025-06-20 07:01:01'),
(6, 6, 'JONA', 'Albay', 'queen-jona.jpg', '2025-06-20 07:01:01', '2025-06-20 07:01:01'),
(7, 7, 'JEWEL OLIVERA', 'Guinobatan, Albay', 'queen-jewel-olivera.jpg', '2025-06-20 07:01:01', '2025-06-20 07:01:01'),
(8, 8, 'GABRIELLE', 'Nabua', 'queen-gabrielle.jpg', '2025-06-20 07:01:01', '2025-06-20 07:01:01'),
(9, 9, 'AMIELA JOHNA', 'Iriga City', 'queen-amiela-johna.jpg', '2025-06-20 07:01:01', '2025-06-20 07:01:01'),
(10, 1, 'MERIAM DEFENSOR FORTSANTIAGO', 'Tondo, Manila', 'mutya-meriam-defensor-fortsantiago.jpg', '2025-06-20 07:01:01', '2025-06-20 07:01:01'),
(11, 2, 'BRYAN NAVA', 'Iriga City', 'mutya-bryan-nava.jpg', '2025-06-20 07:01:01', '2025-06-20 07:01:01'),
(12, 3, 'TONI DRAGONZAGA', 'Caloocan', 'mutya-toni-dragonzaga.jpg', '2025-06-20 07:01:01', '2025-06-20 07:01:01'),
(13, 4, 'PRINCESS FIONA', 'Iriga City', 'mutya-princess-fiona.jpg', '2025-06-20 07:01:01', '2025-06-20 07:01:01'),
(14, 5, 'SAM GOKU', 'Navotas City', 'mutya-sam-goku.jpg', '2025-06-20 07:01:01', '2025-06-20 07:01:01'),
(15, 6, 'ODESSA OLIVIA', 'Iriga City', 'mutya-odessa-olivia.jpg', '2025-06-20 07:01:01', '2025-06-20 07:01:01'),
(16, 7, 'JULIA BARETTA', 'Malabon City', 'mutya-jullia-baretta.jpg', '2025-06-20 07:01:01', '2025-06-20 07:01:01'),
(17, 8, 'DIANA KADIRI', 'Malabon City', 'mutya-diana-kadiri.jpg', '2025-06-20 07:01:01', '2025-06-20 07:01:01'),
(18, 9, 'BEA BUNDA', 'Rosario, Cavite', 'mutya-bea-bunda.jpg', '2025-06-20 07:01:01', '2025-06-20 07:01:01'),
(19, 10, 'BARBIENGOT FORTEZA', 'Pandi, Bulacan', 'mutya-barbiengot-forteza.jpg', '2025-06-20 07:01:01', '2025-06-20 07:01:01');

-- --------------------------------------------------------

--
-- Table structure for table `technicals`
--

CREATE TABLE `technicals` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `number` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `active_portion` varchar(255) DEFAULT NULL,
  `called_at` timestamp NULL DEFAULT NULL,
  `pinged_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `technicals`
--

INSERT INTO `technicals` (`id`, `number`, `name`, `avatar`, `username`, `password`, `active_portion`, `called_at`, `pinged_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Technical 01', 'no-avatar.jpg', 'technical01', 'technical01', NULL, NULL, NULL, '2023-02-19 08:58:58', '2023-04-06 14:00:12');

-- --------------------------------------------------------

--
-- Table structure for table `technical_event`
--

CREATE TABLE `technical_event` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `technical_id` tinyint(3) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `active_team_id` tinyint(3) UNSIGNED NOT NULL,
  `has_active_team` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `titles`
--

CREATE TABLE `titles` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `rank` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `titles`
--

INSERT INTO `titles` (`id`, `event_id`, `rank`, `title`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Best in Production (Queen)', '2025-06-20 07:53:50', '2025-06-20 07:54:15'),
(2, 2, 1, 'Best in Production (Mutya)', '2025-06-20 07:53:50', '2025-06-20 07:58:48'),
(3, 3, 1, 'Best in Swimsuit (Queen)', '2025-06-20 07:53:50', '2025-06-20 07:58:52'),
(4, 4, 1, 'Best in Swimsuit (Mutya)', '2025-06-20 07:53:50', '2025-06-20 07:58:55'),
(5, 5, 1, 'Best in Talent (Queen)', '2025-06-20 07:53:50', '2025-06-20 07:59:04'),
(6, 6, 1, 'Best in Talent (Mutya)', '2025-06-20 07:53:50', '2025-06-20 07:59:09'),
(7, 7, 1, 'Best in Long Gown (Queen)', '2025-06-20 07:53:50', '2025-06-20 07:59:20'),
(8, 8, 1, 'Best in Long Gown (Mutya)', '2025-06-20 07:53:50', '2025-06-20 07:59:25'),
(9, 11, 1, 'Arriba Plaza QUEEN 2025', '2025-06-20 07:53:50', '2025-06-20 07:59:43'),
(10, 11, 2, 'Arriba Plaza PRINCESS 2025', '2025-06-20 07:53:50', '2025-06-20 07:59:46'),
(11, 11, 3, 'Arriba Plaza COUNTESS 2025', '2025-06-20 07:53:50', '2025-06-20 07:59:49'),
(12, 12, 1, 'Mutyang PANGKALAWAKAN 2025', '2025-06-20 07:53:51', '2025-06-20 07:59:54'),
(13, 12, 2, 'Mutyang PANDAIGDIG 2025', '2025-06-20 07:53:51', '2025-06-20 07:59:57'),
(14, 12, 3, 'Mutyang PAMBANSA 2025', '2025-06-20 07:53:51', '2025-06-20 08:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `arrangements`
--
ALTER TABLE `arrangements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `competition_id` (`competition_id`);

--
-- Indexes for table `competitions`
--
ALTER TABLE `competitions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `criteria`
--
ALTER TABLE `criteria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `deductions`
--
ALTER TABLE `deductions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `judge_id` (`technical_id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `duos`
--
ALTER TABLE `duos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event1` (`event_id_1`),
  ADD KEY `event2` (`event_id_2`);

--
-- Indexes for table `eliminations`
--
ALTER TABLE `eliminations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `area_id` (`category_id`);

--
-- Indexes for table `judges`
--
ALTER TABLE `judges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `judge_event`
--
ALTER TABLE `judge_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `judge_id` (`judge_id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `active_team_id` (`active_team_id`);

--
-- Indexes for table `noshows`
--
ALTER TABLE `noshows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `participants`
--
ALTER TABLE `participants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `points`
--
ALTER TABLE `points`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `judge_id` (`judge_id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `criteria_id` (`criteria_id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `technicals`
--
ALTER TABLE `technicals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `technical_event`
--
ALTER TABLE `technical_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `judge_id` (`technical_id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `active_team_id` (`active_team_id`);

--
-- Indexes for table `titles`
--
ALTER TABLE `titles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `arrangements`
--
ALTER TABLE `arrangements`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `competitions`
--
ALTER TABLE `competitions`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `criteria`
--
ALTER TABLE `criteria`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `deductions`
--
ALTER TABLE `deductions`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `duos`
--
ALTER TABLE `duos`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `eliminations`
--
ALTER TABLE `eliminations`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `judges`
--
ALTER TABLE `judges`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `judge_event`
--
ALTER TABLE `judge_event`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `noshows`
--
ALTER TABLE `noshows`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `participants`
--
ALTER TABLE `participants`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `points`
--
ALTER TABLE `points`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `technicals`
--
ALTER TABLE `technicals`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `technical_event`
--
ALTER TABLE `technical_event`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `titles`
--
ALTER TABLE `titles`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=229;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `arrangements`
--
ALTER TABLE `arrangements`
  ADD CONSTRAINT `arrangements_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `arrangements_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`competition_id`) REFERENCES `competitions` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `criteria`
--
ALTER TABLE `criteria`
  ADD CONSTRAINT `criteria_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `deductions`
--
ALTER TABLE `deductions`
  ADD CONSTRAINT `deductions_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `deductions_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `deductions_ibfk_3` FOREIGN KEY (`technical_id`) REFERENCES `technicals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `duos`
--
ALTER TABLE `duos`
  ADD CONSTRAINT `duos_ibfk_1` FOREIGN KEY (`event_id_1`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `duos_ibfk_2` FOREIGN KEY (`event_id_2`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eliminations`
--
ALTER TABLE `eliminations`
  ADD CONSTRAINT `eliminations_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `eliminations_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `judge_event`
--
ALTER TABLE `judge_event`
  ADD CONSTRAINT `judge_event_ibfk_1` FOREIGN KEY (`judge_id`) REFERENCES `judges` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `judge_event_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `judge_event_ibfk_3` FOREIGN KEY (`active_team_id`) REFERENCES `teams` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `noshows`
--
ALTER TABLE `noshows`
  ADD CONSTRAINT `noshows_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `noshows_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `participants`
--
ALTER TABLE `participants`
  ADD CONSTRAINT `participants_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `participants_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `points`
--
ALTER TABLE `points`
  ADD CONSTRAINT `points_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`criteria_id`) REFERENCES `criteria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ratings_ibfk_3` FOREIGN KEY (`judge_id`) REFERENCES `judges` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `technical_event`
--
ALTER TABLE `technical_event`
  ADD CONSTRAINT `technical_event_ibfk_2` FOREIGN KEY (`technical_id`) REFERENCES `technicals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `technical_event_ibfk_3` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `technical_event_ibfk_4` FOREIGN KEY (`active_team_id`) REFERENCES `teams` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `titles`
--
ALTER TABLE `titles`
  ADD CONSTRAINT `titles_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
