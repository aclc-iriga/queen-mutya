-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2024 at 04:56 PM
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
-- Database: `mmsanagustin-iriga`
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
(1, 1, 'mrsanagustin-iriga-2023', 'Mr. San Agustin 2023', '2023-04-06 13:25:10', '2023-04-23 09:58:35'),
(2, 1, 'mssanagustin-iriga-2023', 'Ms. San Agustin 2023', '2023-04-23 09:59:52', '2023-04-23 09:59:52');

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
(1, 'mmsanagustin-iriga-2023', 'Mr. and Ms. San Agustin 2023', '2023-04-06 13:24:04', '2023-04-06 13:24:04');

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
(1, 1, 'Uniqueness & Creativity', 40, '2023-04-23 09:33:48', '2023-04-23 09:33:48'),
(2, 1, 'Showmanship', 30, '2023-04-23 09:34:06', '2023-04-23 09:34:06'),
(3, 1, 'Poise & Carriage', 20, '2023-04-23 09:35:02', '2023-04-23 09:35:02'),
(4, 1, 'Audience Impact', 10, '2023-04-23 09:35:31', '2023-04-23 09:35:31'),
(5, 2, 'Body Figure', 30, '2023-04-23 09:37:40', '2023-04-23 09:37:40'),
(6, 2, 'Showmanship', 30, '2023-04-23 09:38:14', '2023-04-23 09:38:14'),
(7, 2, 'Performance & Carriage', 30, '2023-04-23 09:38:42', '2023-04-23 10:12:15'),
(8, 2, 'Audience Impact', 10, '2023-04-23 09:39:05', '2023-04-23 09:39:05'),
(9, 3, 'Confidence', 30, '2023-04-23 09:39:35', '2023-04-23 09:39:35'),
(10, 3, 'Showmanship', 30, '2023-04-23 09:40:27', '2023-04-23 09:40:27'),
(11, 3, 'Performance & Carriage', 30, '2023-04-23 09:41:01', '2023-04-23 09:41:01'),
(12, 3, 'Audience Impact', 10, '2023-04-23 09:41:22', '2023-04-23 09:41:22'),
(13, 4, 'Content & Relevance', 60, '2023-04-23 09:42:04', '2023-04-23 09:42:04'),
(14, 4, 'Delivery', 20, '2023-04-23 09:42:18', '2023-04-23 09:42:18'),
(15, 4, 'Confidence', 10, '2023-04-23 09:42:27', '2023-04-23 09:42:27'),
(16, 4, 'Over-all Impact', 10, '2023-04-23 09:42:41', '2023-04-23 09:42:41'),
(17, 5, 'Content & Relevance', 60, '2023-04-23 09:43:16', '2023-04-23 09:43:16'),
(18, 5, 'Delivery', 20, '2023-04-23 09:43:27', '2023-04-23 09:43:27'),
(19, 5, 'Confidence', 10, '2023-04-23 09:43:35', '2023-04-23 09:43:35'),
(20, 5, 'Over-all Impact', 10, '2023-04-23 09:43:46', '2023-04-23 09:43:46'),
(21, 6, 'Uniqueness & Creativity', 40, '2023-04-23 10:11:09', '2023-04-23 10:11:09'),
(22, 6, 'Showmanship', 30, '2023-04-23 10:11:15', '2023-04-23 10:11:15'),
(23, 6, 'Poise & Carriage', 20, '2023-04-23 10:11:23', '2023-04-23 10:11:23'),
(24, 6, 'Audience Impact', 10, '2023-04-23 10:11:33', '2023-04-23 10:11:33'),
(25, 7, 'Body Figure', 30, '2023-04-23 10:11:59', '2023-04-23 10:11:59'),
(26, 7, 'Showmanship', 30, '2023-04-23 10:12:05', '2023-04-23 10:12:05'),
(27, 7, 'Performance & Carriage', 30, '2023-04-23 10:12:20', '2023-04-23 10:12:20'),
(28, 7, 'Audience Impact', 10, '2023-04-23 10:12:31', '2023-04-23 10:12:31'),
(29, 8, 'Confidence', 30, '2023-04-23 10:12:56', '2023-04-23 10:12:56'),
(30, 8, 'Showmanship', 30, '2023-04-23 10:13:03', '2023-04-23 10:13:03'),
(31, 8, 'Performance & Carriage', 30, '2023-04-23 10:13:09', '2023-04-23 10:13:09'),
(32, 8, 'Audience Impact', 10, '2023-04-23 10:13:14', '2023-04-23 10:13:14'),
(33, 9, 'Content & Relevance', 60, '2023-04-23 10:13:29', '2023-04-23 10:13:29'),
(34, 9, 'Delivery', 20, '2023-04-23 10:13:35', '2023-04-23 10:13:35'),
(35, 9, 'Confidence', 10, '2023-04-23 10:13:40', '2023-04-23 10:13:40'),
(36, 9, 'Over-all Impact', 10, '2023-04-23 10:13:50', '2023-04-23 10:13:50'),
(37, 10, 'Content & Relevance', 60, '2023-04-23 10:14:32', '2023-04-23 10:14:32'),
(38, 10, 'Delivery', 20, '2023-04-23 10:14:39', '2023-04-23 10:14:39'),
(39, 10, 'Confidence', 10, '2023-04-23 10:14:45', '2023-04-23 10:14:45'),
(40, 10, 'Over-all Impact', 10, '2023-04-23 10:14:51', '2023-04-23 10:14:51');

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
(1, 'production', 'PRODUCTION', 1, 6, '2023-04-24 01:29:03', '2023-04-24 01:29:03'),
(2, 'swimwear', 'SWIMWEAR', 2, 7, '2023-04-24 01:29:37', '2023-04-24 01:29:37'),
(3, 'formal-wear-long-gown', 'FORMAL WEAR & LONG GOWN', 3, 8, '2023-04-24 01:30:43', '2023-04-24 01:30:43'),
(4, 'preliminary-qa', 'PRELIMINARY Q&A', 4, 9, '2023-04-24 01:31:18', '2023-05-03 07:55:45'),
(5, 'final-qa', 'FINAL Q&A', 5, 10, '2023-04-24 01:31:44', '2023-05-03 07:55:57');

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
(1, 1, 9, '2023-04-23 10:16:04', '2023-04-23 10:16:04'),
(2, 1, 10, '2023-04-23 10:16:05', '2023-04-23 10:16:05'),
(3, 1, 11, '2023-04-23 10:16:06', '2023-04-23 10:16:06'),
(4, 1, 12, '2023-04-23 10:16:08', '2023-04-23 10:16:08'),
(5, 1, 13, '2023-04-23 10:16:09', '2023-04-23 10:16:09'),
(6, 1, 14, '2023-04-23 10:16:10', '2023-04-23 10:16:10'),
(7, 1, 15, '2023-04-23 10:16:11', '2023-04-23 10:16:11'),
(8, 1, 16, '2023-04-23 10:16:12', '2023-04-23 10:16:12'),
(9, 2, 9, '2023-04-23 10:16:18', '2023-04-23 10:16:18'),
(10, 2, 10, '2023-04-23 10:16:19', '2023-04-23 10:16:19'),
(11, 2, 11, '2023-04-23 10:16:20', '2023-04-23 10:16:20'),
(12, 2, 12, '2023-04-23 10:16:21', '2023-04-23 10:16:21'),
(13, 2, 13, '2023-04-23 10:16:22', '2023-04-23 10:16:22'),
(14, 2, 14, '2023-04-23 10:16:24', '2023-04-23 10:16:24'),
(15, 2, 15, '2023-04-23 10:16:25', '2023-04-23 10:16:25'),
(16, 2, 16, '2023-04-23 10:16:26', '2023-04-23 10:16:26'),
(17, 3, 9, '2023-04-23 10:16:31', '2023-04-23 10:16:31'),
(18, 3, 10, '2023-04-23 10:16:32', '2023-04-23 10:16:32'),
(19, 3, 11, '2023-04-23 10:16:33', '2023-04-23 10:16:33'),
(20, 3, 12, '2023-04-23 10:16:35', '2023-04-23 10:16:35'),
(21, 3, 13, '2023-04-23 10:16:36', '2023-04-23 10:16:36'),
(22, 3, 14, '2023-04-23 10:16:38', '2023-04-23 10:16:38'),
(23, 3, 15, '2023-04-23 10:16:41', '2023-04-23 10:16:41'),
(24, 3, 16, '2023-04-23 10:16:42', '2023-04-23 10:16:42'),
(25, 4, 9, '2023-04-23 10:16:51', '2023-04-23 10:16:51'),
(26, 4, 10, '2023-04-23 10:16:53', '2023-04-23 10:16:53'),
(27, 4, 11, '2023-04-23 10:16:53', '2023-04-23 10:16:53'),
(28, 4, 12, '2023-04-23 10:16:54', '2023-04-23 10:16:54'),
(29, 4, 13, '2023-04-23 10:16:55', '2023-04-23 10:16:55'),
(30, 4, 14, '2023-04-23 10:16:56', '2023-04-23 10:16:56'),
(31, 4, 15, '2023-04-23 10:16:57', '2023-04-23 10:16:57'),
(32, 4, 16, '2023-04-23 10:16:58', '2023-04-23 10:16:58'),
(33, 5, 9, '2023-04-23 10:17:01', '2023-04-23 10:17:01'),
(34, 5, 10, '2023-04-23 10:17:02', '2023-04-23 10:17:02'),
(35, 5, 11, '2023-04-23 10:17:03', '2023-04-23 10:17:03'),
(36, 5, 12, '2023-04-23 10:17:04', '2023-04-23 10:17:04'),
(37, 5, 13, '2023-04-23 10:17:06', '2023-04-23 10:17:06'),
(38, 5, 14, '2023-04-23 10:17:08', '2023-04-23 10:17:08'),
(39, 5, 15, '2023-04-23 10:17:09', '2023-04-23 10:17:09'),
(40, 5, 16, '2023-04-23 10:17:09', '2023-04-23 10:17:09'),
(41, 6, 1, '2023-04-23 10:17:26', '2023-04-23 10:17:26'),
(42, 6, 2, '2023-04-23 10:17:27', '2023-04-23 10:17:27'),
(43, 6, 3, '2023-04-23 10:17:29', '2023-04-23 10:17:29'),
(44, 6, 4, '2023-04-23 10:17:37', '2023-04-23 10:17:37'),
(45, 6, 5, '2023-04-23 10:17:37', '2023-04-23 10:17:37'),
(46, 6, 6, '2023-04-23 10:17:39', '2023-04-23 10:17:39'),
(47, 6, 7, '2023-04-23 10:17:40', '2023-04-23 10:17:40'),
(48, 6, 8, '2023-04-23 10:17:40', '2023-04-23 10:17:40'),
(49, 7, 1, '2023-04-23 10:17:47', '2023-04-23 10:17:47'),
(50, 7, 2, '2023-04-23 10:17:48', '2023-04-23 10:17:48'),
(51, 7, 3, '2023-04-23 10:17:49', '2023-04-23 10:17:49'),
(52, 7, 4, '2023-04-23 10:17:50', '2023-04-23 10:17:50'),
(53, 7, 5, '2023-04-23 10:17:51', '2023-04-23 10:17:51'),
(54, 7, 6, '2023-04-23 10:17:53', '2023-04-23 10:17:53'),
(55, 7, 7, '2023-04-23 10:17:55', '2023-04-23 10:17:55'),
(56, 7, 8, '2023-04-23 10:17:56', '2023-04-23 10:17:56'),
(57, 8, 1, '2023-04-23 10:18:20', '2023-04-23 10:18:20'),
(58, 8, 2, '2023-04-23 10:18:21', '2023-04-23 10:18:21'),
(59, 8, 3, '2023-04-23 10:18:22', '2023-04-23 10:18:22'),
(60, 8, 4, '2023-04-23 10:18:23', '2023-04-23 10:18:23'),
(61, 8, 5, '2023-04-23 10:18:24', '2023-04-23 10:18:24'),
(62, 8, 6, '2023-04-23 10:18:25', '2023-04-23 10:18:25'),
(63, 8, 7, '2023-04-23 10:18:26', '2023-04-23 10:18:26'),
(64, 8, 8, '2023-04-23 10:18:27', '2023-04-23 10:18:27'),
(65, 9, 1, '2023-04-23 10:18:43', '2023-04-23 10:18:43'),
(66, 9, 2, '2023-04-23 10:18:44', '2023-04-23 10:18:44'),
(67, 9, 3, '2023-04-23 10:18:45', '2023-04-23 10:18:45'),
(68, 9, 4, '2023-04-23 10:18:46', '2023-04-23 10:18:46'),
(69, 9, 5, '2023-04-23 10:18:46', '2023-04-23 10:18:46'),
(70, 9, 6, '2023-04-23 10:18:47', '2023-04-23 10:18:47'),
(71, 9, 7, '2023-04-23 10:18:48', '2023-04-23 10:18:48'),
(72, 9, 8, '2023-04-23 10:18:49', '2023-04-23 10:18:49'),
(73, 10, 1, '2023-04-23 10:18:54', '2023-04-23 10:18:54'),
(74, 10, 2, '2023-04-23 10:18:55', '2023-04-23 10:18:55'),
(75, 10, 3, '2023-04-23 10:18:55', '2023-04-23 10:18:55'),
(76, 10, 4, '2023-04-23 10:18:56', '2023-04-23 10:18:56'),
(77, 10, 5, '2023-04-23 10:18:57', '2023-04-23 10:18:57'),
(78, 10, 6, '2023-04-23 10:18:58', '2023-04-23 10:18:58'),
(79, 10, 7, '2023-04-23 10:18:59', '2023-04-23 10:18:59'),
(80, 10, 8, '2023-04-23 10:19:00', '2023-04-23 10:19:00'),
(81, 5, 1, '2023-04-23 10:19:10', '2023-04-23 10:19:10'),
(82, 5, 2, '2023-04-23 10:19:11', '2023-04-23 10:19:11'),
(83, 5, 3, '2023-04-23 10:19:12', '2023-04-23 10:19:12'),
(84, 5, 4, '2023-04-23 10:19:12', '2023-04-23 10:19:12'),
(85, 5, 5, '2023-04-23 10:19:13', '2023-04-23 10:19:13'),
(86, 5, 6, '2023-04-23 10:19:14', '2023-04-23 10:19:14'),
(87, 5, 7, '2023-04-23 10:19:15', '2023-04-23 10:19:15'),
(88, 5, 8, '2023-04-23 10:19:16', '2023-04-23 10:19:16'),
(89, 10, 9, '2023-04-23 10:19:20', '2023-04-23 10:19:20'),
(90, 10, 10, '2023-04-23 10:19:20', '2023-04-23 10:19:20'),
(91, 10, 11, '2023-04-23 10:19:21', '2023-04-23 10:19:21'),
(92, 10, 12, '2023-04-23 10:19:22', '2023-04-23 10:19:22'),
(93, 10, 13, '2023-04-23 10:19:23', '2023-04-23 10:19:23'),
(94, 10, 14, '2023-04-23 10:19:24', '2023-04-23 10:19:24'),
(95, 10, 15, '2023-04-23 10:19:25', '2023-04-23 10:19:25'),
(96, 10, 16, '2023-04-23 10:19:26', '2023-04-23 10:19:26');

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
(1, 1, 'production-1', '(M) PRODUCTION', '2023-04-23 09:27:10', '2023-05-03 06:09:03'),
(2, 1, 'swimwear-1', '(M) SWIMWEAR', '2023-04-23 09:28:36', '2023-05-03 06:09:13'),
(3, 1, 'formal-wear', '(M) FORMAL WEAR', '2023-04-23 09:29:12', '2023-05-03 06:09:41'),
(4, 1, 'preliminary-qa-1', '(M) PRELIMINARY Q&A', '2023-04-23 09:29:44', '2023-05-03 07:52:57'),
(5, 1, 'final-qa-1', '(M) FINAL Q&A', '2023-04-23 09:30:11', '2023-05-03 07:53:21'),
(6, 2, 'production-2', '(F) PRODUCTION', '2023-04-23 10:08:26', '2023-05-03 06:09:52'),
(7, 2, 'swimwear-2', '(F) SWIMWEAR', '2023-04-23 10:08:43', '2023-05-03 06:10:12'),
(8, 2, 'long-gown', '(F) LONG GOWN', '2023-04-23 10:09:14', '2023-05-03 06:10:19'),
(9, 2, 'preliminary-qa-2', '(F) PRELIMINARY Q&A', '2023-04-23 10:09:48', '2023-05-03 07:53:12'),
(10, 2, 'final-qa-2', '(F) FINAL Q&A', '2023-04-23 10:10:04', '2023-05-03 07:53:27');

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
(1, 1, 'Judge 01', 'no-avatar.jpg', 'judge01', 'judge01', '', NULL, NULL, '2023-04-06 13:58:11', '2023-04-06 13:58:11'),
(2, 2, 'Judge 02', 'no-avatar.jpg', 'judge02', 'judge02', '', NULL, NULL, '2023-04-06 13:58:28', '2023-04-06 13:58:28'),
(3, 3, 'Judge 03', 'no-avatar.jpg', 'judge03', 'judge03', '', NULL, NULL, '2023-04-06 13:58:42', '2023-04-06 13:58:42'),
(4, 4, 'Judge 04', 'no-avatar.jpg', 'judge04', 'judge04', '', NULL, NULL, '2023-04-06 13:59:26', '2023-04-06 13:59:26'),
(5, 5, 'Judge 05', 'no-avatar.jpg', 'judge05', 'judge05', '', NULL, NULL, '2023-04-06 14:00:00', '2023-04-06 14:00:00');

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
(1, 1, 1, 0, 1, 0, '2023-04-23 09:46:00', '2024-11-29 15:51:36'),
(2, 1, 2, 0, 1, 0, '2023-04-23 09:46:07', '2024-11-29 15:51:36'),
(3, 1, 3, 0, 1, 0, '2023-04-23 09:46:12', '2024-11-29 15:51:36'),
(4, 1, 4, 0, 1, 0, '2023-04-23 09:46:15', '2024-11-29 15:51:36'),
(5, 1, 5, 0, 1, 0, '2023-04-23 09:46:18', '2024-11-29 15:51:36'),
(6, 2, 1, 0, 1, 0, '2023-04-23 09:46:27', '2024-11-29 15:51:36'),
(7, 2, 2, 0, 1, 0, '2023-04-23 09:46:29', '2024-11-29 15:51:36'),
(8, 2, 3, 0, 1, 0, '2023-04-23 09:46:32', '2024-11-29 15:51:36'),
(9, 2, 4, 0, 1, 0, '2023-04-23 09:46:34', '2024-11-29 15:51:36'),
(10, 2, 5, 0, 1, 0, '2023-04-23 09:46:37', '2024-11-29 15:51:36'),
(11, 3, 1, 0, 1, 0, '2023-04-23 09:46:50', '2024-11-29 15:51:36'),
(12, 3, 2, 0, 1, 0, '2023-04-23 09:46:53', '2024-11-29 15:51:36'),
(13, 3, 3, 0, 1, 0, '2023-04-23 09:46:57', '2024-11-29 15:51:36'),
(14, 3, 4, 0, 1, 0, '2023-04-23 09:46:59', '2024-11-29 15:51:36'),
(15, 3, 5, 0, 1, 0, '2023-04-23 09:47:02', '2024-11-29 15:51:36'),
(16, 4, 1, 0, 1, 0, '2023-04-23 09:47:13', '2024-11-29 15:51:36'),
(17, 4, 2, 0, 1, 0, '2023-04-23 09:47:18', '2024-11-29 15:51:36'),
(18, 4, 3, 0, 1, 0, '2023-04-23 09:47:22', '2024-11-29 15:51:36'),
(19, 4, 4, 0, 1, 0, '2023-04-23 09:47:26', '2024-11-29 15:51:36'),
(20, 4, 5, 0, 1, 0, '2023-04-23 09:47:29', '2024-11-29 15:51:36'),
(21, 5, 1, 0, 1, 0, '2023-04-23 09:47:39', '2024-11-29 15:51:36'),
(22, 5, 2, 0, 1, 0, '2023-04-23 09:47:41', '2024-11-29 15:51:36'),
(23, 5, 3, 0, 1, 0, '2023-04-23 09:47:44', '2024-11-29 15:51:36'),
(24, 5, 4, 0, 1, 0, '2023-04-23 09:47:46', '2024-11-29 15:51:36'),
(25, 5, 5, 0, 1, 0, '2023-04-23 09:47:48', '2024-11-29 15:51:36'),
(26, 1, 6, 0, 1, 0, '2023-04-23 10:42:30', '2024-11-29 15:51:36'),
(27, 1, 7, 0, 1, 0, '2023-04-23 10:42:33', '2024-11-29 15:51:36'),
(28, 1, 8, 0, 1, 0, '2023-04-23 10:42:36', '2024-11-29 15:51:36'),
(29, 1, 9, 0, 1, 0, '2023-04-23 10:42:39', '2024-11-29 15:51:36'),
(30, 1, 10, 0, 1, 0, '2023-04-23 10:42:42', '2024-11-29 15:51:36'),
(31, 2, 6, 0, 1, 0, '2023-04-23 10:42:50', '2024-11-29 15:51:36'),
(32, 2, 7, 0, 1, 0, '2023-04-23 10:42:53', '2024-11-29 15:51:36'),
(33, 2, 8, 0, 1, 0, '2023-04-23 10:42:55', '2024-11-29 15:51:36'),
(34, 2, 9, 0, 1, 0, '2023-04-23 10:42:58', '2024-11-29 15:51:36'),
(35, 2, 10, 0, 1, 0, '2023-04-23 10:43:02', '2024-11-29 15:51:36'),
(36, 3, 6, 0, 1, 0, '2023-04-23 10:43:09', '2024-11-29 15:51:36'),
(37, 3, 7, 0, 1, 0, '2023-04-23 10:43:11', '2024-11-29 15:51:36'),
(38, 3, 8, 0, 1, 0, '2023-04-23 10:43:14', '2024-11-29 15:51:36'),
(39, 3, 9, 0, 1, 0, '2023-04-23 10:43:17', '2024-11-29 15:51:36'),
(40, 3, 10, 0, 1, 0, '2023-04-23 10:43:19', '2024-11-29 15:51:36'),
(41, 4, 6, 0, 1, 0, '2023-04-23 10:43:27', '2024-11-29 15:51:36'),
(42, 4, 7, 0, 1, 0, '2023-04-23 10:43:30', '2024-11-29 15:51:36'),
(43, 4, 8, 0, 1, 0, '2023-04-23 10:43:33', '2024-11-29 15:51:36'),
(44, 4, 9, 0, 1, 0, '2023-04-23 10:43:35', '2024-11-29 15:51:36'),
(45, 4, 10, 0, 1, 0, '2023-04-23 10:43:38', '2024-11-29 15:51:36'),
(46, 5, 6, 0, 1, 0, '2023-04-23 10:43:45', '2024-11-29 15:51:36'),
(47, 5, 7, 0, 1, 0, '2023-04-23 10:43:47', '2024-11-29 15:51:36'),
(48, 5, 8, 0, 1, 0, '2023-04-23 10:43:51', '2024-11-29 15:51:36'),
(49, 5, 9, 0, 1, 0, '2023-04-23 10:43:54', '2024-11-29 15:51:36'),
(50, 5, 10, 0, 1, 0, '2023-04-23 10:43:56', '2024-11-29 15:51:36');

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

--
-- Dumping data for table `points`
--

INSERT INTO `points` (`id`, `event_id`, `rank`, `value`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(2, 1, 2, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(3, 1, 3, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(4, 1, 4, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(5, 1, 5, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(6, 1, 6, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(7, 1, 7, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(8, 1, 8, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(9, 1, 9, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(10, 1, 10, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(11, 1, 11, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(12, 1, 12, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(13, 1, 13, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(14, 1, 14, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(15, 1, 15, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(16, 1, 16, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(17, 2, 1, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(18, 2, 2, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(19, 2, 3, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(20, 2, 4, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(21, 2, 5, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(22, 2, 6, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(23, 2, 7, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(24, 2, 8, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(25, 2, 9, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(26, 2, 10, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(27, 2, 11, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(28, 2, 12, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(29, 2, 13, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(30, 2, 14, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(31, 2, 15, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(32, 2, 16, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(33, 3, 1, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(34, 3, 2, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(35, 3, 3, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(36, 3, 4, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(37, 3, 5, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(38, 3, 6, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(39, 3, 7, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(40, 3, 8, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(41, 3, 9, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(42, 3, 10, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(43, 3, 11, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(44, 3, 12, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(45, 3, 13, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(46, 3, 14, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(47, 3, 15, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(48, 3, 16, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(49, 4, 1, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(50, 4, 2, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(51, 4, 3, 0, '2023-04-23 09:44:09', '2023-04-23 09:44:09'),
(52, 4, 4, 0, '2023-04-23 09:44:09', '2023-04-23 09:44:09'),
(53, 4, 5, 0, '2023-04-23 09:44:09', '2023-04-23 09:44:09'),
(54, 4, 6, 0, '2023-04-23 09:44:09', '2023-04-23 09:44:09'),
(55, 4, 7, 0, '2023-04-23 09:44:09', '2023-04-23 09:44:09'),
(56, 4, 8, 0, '2023-04-23 09:44:09', '2023-04-23 09:44:09'),
(57, 4, 9, 0, '2023-04-23 09:44:09', '2023-04-23 09:44:09'),
(58, 4, 10, 0, '2023-04-23 09:44:09', '2023-04-23 09:44:09'),
(59, 4, 11, 0, '2023-04-23 09:44:09', '2023-04-23 09:44:09'),
(60, 4, 12, 0, '2023-04-23 09:44:09', '2023-04-23 09:44:09'),
(61, 4, 13, 0, '2023-04-23 09:44:09', '2023-04-23 09:44:09'),
(62, 4, 14, 0, '2023-04-23 09:44:09', '2023-04-23 09:44:09'),
(63, 4, 15, 0, '2023-04-23 09:44:09', '2023-04-23 09:44:09'),
(64, 4, 16, 0, '2023-04-23 09:44:09', '2023-04-23 09:44:09'),
(65, 5, 1, 0, '2023-04-23 09:44:09', '2023-04-23 09:44:09'),
(66, 5, 2, 0, '2023-04-23 09:44:09', '2023-04-23 09:44:09'),
(67, 5, 3, 0, '2023-04-23 09:44:09', '2023-04-23 09:44:09'),
(68, 5, 4, 0, '2023-04-23 09:44:09', '2023-04-23 09:44:09'),
(69, 5, 5, 0, '2023-04-23 09:44:09', '2023-04-23 09:44:09'),
(70, 5, 6, 0, '2023-04-23 09:44:09', '2023-04-23 09:44:09'),
(71, 5, 7, 0, '2023-04-23 09:44:09', '2023-04-23 09:44:09'),
(72, 5, 8, 0, '2023-04-23 09:44:09', '2023-04-23 09:44:09'),
(73, 5, 9, 0, '2023-04-23 09:44:09', '2023-04-23 09:44:09'),
(74, 5, 10, 0, '2023-04-23 09:44:09', '2023-04-23 09:44:09'),
(75, 5, 11, 0, '2023-04-23 09:44:09', '2023-04-23 09:44:09'),
(76, 5, 12, 0, '2023-04-23 09:44:09', '2023-04-23 09:44:09'),
(77, 5, 13, 0, '2023-04-23 09:44:09', '2023-04-23 09:44:09'),
(78, 5, 14, 0, '2023-04-23 09:44:09', '2023-04-23 09:44:09'),
(79, 5, 15, 0, '2023-04-23 09:44:09', '2023-04-23 09:44:09'),
(80, 5, 16, 0, '2023-04-23 09:44:09', '2023-04-23 09:44:09');

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
(1, 1, 'JAKE TAM', 'Iriga City', 'mr-01-jake-tam.jpg', '2023-04-23 09:20:41', '2023-04-23 09:20:41'),
(2, 2, 'JM BIAG', 'Iriga City', 'mr-02-jm-biag.jpg', '2023-04-23 09:20:41', '2023-04-23 09:20:41'),
(3, 3, 'DARYL HERRERA', 'Sorsogon', 'mr-03-daryl-herrera.jpg', '2023-04-23 09:20:41', '2023-04-23 09:20:41'),
(4, 4, 'BHRYAN BAUTISTA', 'Tabaco City', 'mr-04-bhryan-bautista.jpg', '2023-04-23 09:20:41', '2023-04-23 09:20:41'),
(5, 5, 'MARCUS SILVA', 'Iriga City', 'mr-05-marcus-silva.jpg', '2023-04-23 09:20:41', '2023-04-23 09:20:41'),
(6, 6, 'JOHN PAUL OROLFO', 'Iriga City', 'mr-06-john-paul-orolfo.jpg', '2023-04-23 09:20:41', '2023-04-23 09:20:41'),
(7, 7, 'AGMAR OSEO', 'Sorsogon', 'mr-07-agmar-oseo.jpg', '2023-04-23 09:20:41', '2023-04-23 09:20:41'),
(8, 8, 'RANDELL IDIOMA', 'Iriga City', 'mr-08-randell-idioma.jpg', '2023-04-23 09:20:41', '2023-04-23 09:20:41'),
(9, 1, 'THAYA LAURENARIA', 'Albay', 'ms-01-thaya-laurenaria.jpg', '2023-04-23 09:20:41', '2023-04-23 09:21:45'),
(10, 2, 'ANGELIQUE MONTENEGRO', 'Baao', 'ms-02-angelique-montenegro.jpg', '2023-04-23 09:20:41', '2023-04-23 09:21:48'),
(11, 3, 'DANIELLE MONTE', 'Iriga City', 'ms-03-danielle-monte.jpg', '2023-04-23 09:20:41', '2023-04-23 09:21:50'),
(12, 4, 'ALEAH MICHAELA CASCO', 'Iriga City', 'ms-04-aleah-michaela-casco.jpg', '2023-04-23 09:20:41', '2023-04-23 09:21:53'),
(13, 5, 'SARAH BALGEMINO', 'Baao', 'ms-05-sarah-balgemino.jpg', '2023-04-23 09:20:41', '2023-04-23 09:21:55'),
(14, 6, 'VERA DE VILLA', 'Iriga City', 'ms-06-vera-de-villa.jpg', '2023-04-23 09:20:41', '2023-04-23 09:22:41'),
(15, 7, 'LIAN SHAINE NAPARATO', 'Iriga City', 'ms-07-lian-shaine-naparato.jpg', '2023-04-23 09:20:41', '2023-04-23 09:22:54'),
(16, 8, 'JOVIE BIAG', 'Iriga City', 'ms-08-jovie-biag.jpg', '2023-04-23 09:20:41', '2023-04-23 09:23:11');

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
(1, 1, 1, 'Best in Production (Male)', '2023-04-23 10:31:50', '2023-04-23 10:33:52'),
(2, 2, 1, 'Best in Swimwear (Male)', '2023-04-23 10:32:05', '2023-04-23 10:33:54'),
(3, 3, 1, 'Best in Formal Wear', '2023-04-23 10:32:24', '2023-04-23 10:33:57'),
(4, 5, 1, 'Mr. San Agustin 2023', '2023-04-23 10:23:43', '2023-04-23 10:34:25'),
(5, 5, 2, 'Mr. SK San Agustin 2023', '2023-04-23 10:23:43', '2023-04-23 10:34:28'),
(6, 5, 3, 'Mr. SK Charity 2023', '2023-04-23 10:23:43', '2023-04-23 10:34:31'),
(7, 5, 4, '1st Runner Up', '2023-04-23 10:23:43', '2023-04-23 10:34:34'),
(8, 5, 5, '2nd Runner Up', '2023-04-23 10:23:43', '2023-04-23 10:34:37'),
(9, 6, 1, 'Best in Production (Female)', '2023-04-23 10:32:42', '2023-04-23 10:35:37'),
(10, 7, 1, 'Best in Swimwear (Female)', '2023-04-23 10:32:58', '2023-04-23 10:35:41'),
(11, 8, 1, 'Best in Long Gown', '2023-04-23 10:33:12', '2023-04-23 10:35:44'),
(12, 10, 1, 'Ms. San Agustin 2023', '2023-04-23 10:29:10', '2023-04-23 10:35:50'),
(13, 10, 2, 'Ms. SK San Agustin 2023', '2023-04-23 10:29:10', '2023-04-23 10:35:53'),
(14, 10, 3, 'Ms. SK Charity 2023', '2023-04-23 10:29:10', '2023-04-23 10:35:56'),
(15, 10, 4, '1st Runner Up', '2023-04-23 10:29:10', '2023-04-23 10:36:00'),
(16, 10, 5, '2nd Runner Up', '2023-04-23 10:29:10', '2023-04-23 10:36:03');

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
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `eliminations`
--
ALTER TABLE `eliminations`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `judges`
--
ALTER TABLE `judges`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `judge_event`
--
ALTER TABLE `judge_event`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

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
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
