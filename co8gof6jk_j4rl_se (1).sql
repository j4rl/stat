-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: co8gof6jk.mysql.service.one.com:3306
-- Generation Time: Oct 06, 2026 at 12:33 PM
-- Server version: 10.11.18-MariaDB-ubu2404
-- PHP Version: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `co8gof6jk_j4rl_se`
--

-- --------------------------------------------------------

--
-- Table structure for table `ch_accounts`
--

CREATE TABLE `ch_accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Dumping data for table `ch_accounts`
--

INSERT INTO `ch_accounts` (`id`, `username`, `password_hash`, `created_at`) VALUES
(2, 'j4rl', '$2y$10$.CXQF4E5MIDMXlIeshP6duiJGechMNxCAIHalq7iyq2ckLBdHyx16', '2026-07-01 09:17:32');

-- --------------------------------------------------------

--
-- Table structure for table `ch_matches`
--

CREATE TABLE `ch_matches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_id` int(10) UNSIGNED DEFAULT NULL,
  `winner_name` varchar(24) NOT NULL,
  `winner_score` tinyint(3) UNSIGNED NOT NULL,
  `loser_name` varchar(24) NOT NULL,
  `loser_score` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Dumping data for table `ch_matches`
--

INSERT INTO `ch_matches` (`id`, `account_id`, `winner_name`, `winner_score`, `loser_name`, `loser_score`, `created_at`) VALUES
(12, 2, 'Jenny', 25, 'Charlie', 16, '2026-07-01 19:22:04'),
(13, 2, 'Jenny', 21, 'Charlie', 15, '2026-07-01 19:29:26'),
(14, 2, 'Charlie', 21, 'Jenny', 14, '2026-07-01 19:34:40'),
(15, 2, 'Yvonne', 25, 'Jenny', 19, '2026-07-14 18:08:19'),
(16, 2, 'Charlie', 22, 'Yvonne', 20, '2026-07-14 18:16:40'),
(17, 2, 'Charlie', 23, 'Jenny', 17, '2026-07-14 18:24:13'),
(18, 2, 'Charlie', 21, 'Yvonne', 7, '2026-07-14 18:28:31'),
(19, NULL, 'Yvonne', 24, 'Jenny', 17, '2026-07-14 18:35:35'),
(20, 2, 'Charlie', 21, 'Yvonne', 13, '2026-07-14 18:41:17'),
(21, 2, 'Jenny', 21, 'Charlie', 20, '2026-07-14 18:48:50'),
(22, 2, 'Exempelvis', 21, 'Exempel', 20, '2026-07-15 15:40:15'),
(23, 2, 'Exempelvis', 21, 'Exempelina', 18, '2026-07-15 15:40:37'),
(24, 2, 'Yvonne', 23, 'Jenny', 12, '2026-07-15 19:21:44'),
(25, 2, 'Yvonne', 23, 'Charlie', 19, '2026-07-15 19:26:42'),
(26, 2, 'Charlie', 25, 'Jenny', 19, '2026-07-15 19:35:51'),
(27, 2, 'Charlie', 21, 'Yvonne', 14, '2026-07-15 19:40:20'),
(28, 2, 'Yvonne', 23, 'Jenny', 15, '2026-07-15 19:46:50'),
(29, 2, 'Yvonne', 25, 'Charlie', 17, '2026-07-15 19:51:42'),
(30, 2, 'Jenny', 22, 'Yvonne', 15, '2026-07-15 19:58:01'),
(31, 2, 'Jenny', 21, 'Charlie', 17, '2026-07-15 20:04:25'),
(32, 2, 'Jenny', 21, 'Yvonne', 11, '2026-07-15 20:08:54'),
(33, NULL, 'Yvonne', 23, 'Jenny', 19, '2026-07-16 18:54:00'),
(34, 2, 'Charlie', 22, 'Yvonne', 16, '2026-07-16 18:59:26'),
(35, 2, 'Charlie', 26, 'Jenny', 20, '2026-07-16 19:05:31'),
(36, 2, 'Charlie', 23, 'Yvonne', 13, '2026-07-16 19:10:39'),
(37, 2, 'Jenny', 23, 'Yvonne', 18, '2026-07-16 19:16:38');

-- --------------------------------------------------------

--
-- Table structure for table `ch_player_stats`
--

CREATE TABLE `ch_player_stats` (
  `account_id` int(10) UNSIGNED NOT NULL,
  `player_name` varchar(24) NOT NULL,
  `games` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `wins` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tournament_wins` int(11) NOT NULL DEFAULT 0,
  `losses` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `points` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `holes` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `boards` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ground` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Dumping data for table `ch_player_stats`
--

INSERT INTO `ch_player_stats` (`account_id`, `player_name`, `games`, `wins`, `tournament_wins`, `losses`, `points`, `holes`, `boards`, `ground`, `updated_at`) VALUES
(2, 'Charlie', 16, 10, 0, 6, 329, 68, 125, 65, '2026-07-16 19:10:39'),
(2, 'Exempel', 1, 0, 0, 1, 20, 6, 2, 1, '2026-07-15 15:40:15'),
(2, 'Exempelina', 1, 0, 0, 1, 18, 6, 0, 0, '2026-07-15 15:40:37'),
(2, 'Exempelvis', 2, 2, 0, 0, 42, 12, 6, 0, '2026-07-15 15:40:37'),
(2, 'Jenny', 14, 7, 0, 7, 270, 47, 129, 58, '2026-07-16 19:16:38'),
(2, 'Yvonne', 14, 5, 0, 9, 246, 52, 90, 74, '2026-07-16 19:16:38');

-- --------------------------------------------------------

--
-- Table structure for table `ch_turns`
--

CREATE TABLE `ch_turns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `match_id` bigint(20) UNSIGNED NOT NULL,
  `turn_order` int(10) UNSIGNED NOT NULL,
  `player_name` varchar(24) NOT NULL,
  `points` tinyint(3) UNSIGNED NOT NULL,
  `holes` tinyint(3) UNSIGNED NOT NULL,
  `boards` tinyint(3) UNSIGNED NOT NULL,
  `ground` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Dumping data for table `ch_turns`
--

INSERT INTO `ch_turns` (`id`, `match_id`, `turn_order`, `player_name`, `points`, `holes`, `boards`, `ground`, `created_at`) VALUES
(69, 12, 1, 'Jenny', 4, 1, 1, 1, '2026-07-01 19:22:04'),
(70, 12, 2, 'Charlie', 1, 0, 1, 2, '2026-07-01 19:22:04'),
(71, 12, 3, 'Jenny', 2, 0, 2, 1, '2026-07-01 19:22:04'),
(72, 12, 4, 'Charlie', 2, 0, 2, 1, '2026-07-01 19:22:04'),
(73, 12, 5, 'Jenny', 4, 1, 1, 1, '2026-07-01 19:22:04'),
(74, 12, 6, 'Charlie', 5, 1, 2, 0, '2026-07-01 19:22:04'),
(75, 12, 7, 'Jenny', 4, 1, 1, 1, '2026-07-01 19:22:04'),
(76, 12, 8, 'Charlie', 4, 1, 1, 1, '2026-07-01 19:22:04'),
(77, 12, 9, 'Jenny', 4, 1, 1, 1, '2026-07-01 19:22:04'),
(78, 12, 10, 'Charlie', 2, 0, 2, 1, '2026-07-01 19:22:04'),
(79, 12, 11, 'Jenny', 2, 0, 2, 1, '2026-07-01 19:22:04'),
(80, 12, 12, 'Charlie', 2, 0, 2, 1, '2026-07-01 19:22:04'),
(81, 12, 13, 'Jenny', 5, 1, 2, 0, '2026-07-01 19:22:04'),
(82, 13, 1, 'Jenny', 4, 1, 1, 1, '2026-07-01 19:29:26'),
(83, 13, 2, 'Charlie', 1, 0, 1, 2, '2026-07-01 19:29:26'),
(84, 13, 3, 'Jenny', 7, 2, 1, 0, '2026-07-01 19:29:26'),
(85, 13, 4, 'Charlie', 3, 0, 3, 0, '2026-07-01 19:29:26'),
(86, 13, 5, 'Jenny', 1, 0, 1, 2, '2026-07-01 19:29:26'),
(87, 13, 6, 'Charlie', 4, 1, 1, 1, '2026-07-01 19:29:26'),
(88, 13, 7, 'Jenny', 2, 0, 2, 1, '2026-07-01 19:29:26'),
(89, 13, 8, 'Charlie', 1, 0, 1, 2, '2026-07-01 19:29:26'),
(90, 13, 9, 'Jenny', 0, 0, 0, 3, '2026-07-01 19:29:26'),
(91, 13, 10, 'Charlie', 5, 1, 2, 0, '2026-07-01 19:29:26'),
(92, 13, 11, 'Jenny', 4, 1, 1, 1, '2026-07-01 19:29:26'),
(93, 13, 12, 'Charlie', 1, 0, 1, 2, '2026-07-01 19:29:26'),
(94, 13, 13, 'Jenny', 3, 0, 3, 0, '2026-07-01 19:29:26'),
(95, 14, 1, 'Jenny', 0, 0, 0, 3, '2026-07-01 19:34:40'),
(96, 14, 2, 'Charlie', 5, 1, 2, 0, '2026-07-01 19:34:40'),
(97, 14, 3, 'Jenny', 4, 1, 1, 1, '2026-07-01 19:34:40'),
(98, 14, 4, 'Charlie', 5, 1, 2, 0, '2026-07-01 19:34:40'),
(99, 14, 5, 'Jenny', 2, 0, 2, 1, '2026-07-01 19:34:40'),
(100, 14, 6, 'Charlie', 7, 2, 1, 0, '2026-07-01 19:34:40'),
(101, 14, 7, 'Jenny', 5, 1, 2, 0, '2026-07-01 19:34:40'),
(102, 14, 8, 'Charlie', 3, 0, 3, 0, '2026-07-01 19:34:40'),
(103, 14, 9, 'Jenny', 3, 0, 3, 0, '2026-07-01 19:34:40'),
(104, 14, 10, 'Charlie', 1, 0, 1, 2, '2026-07-01 19:34:40'),
(105, 15, 1, 'Jenny', 2, 0, 2, 1, '2026-07-14 18:08:19'),
(106, 15, 2, 'Yvonne', 1, 0, 1, 2, '2026-07-14 18:08:19'),
(107, 15, 3, 'Jenny', 5, 1, 2, 0, '2026-07-14 18:08:19'),
(108, 15, 4, 'Yvonne', 3, 1, 0, 2, '2026-07-14 18:08:19'),
(109, 15, 5, 'Jenny', 3, 0, 3, 0, '2026-07-14 18:08:19'),
(110, 15, 6, 'Yvonne', 4, 1, 1, 1, '2026-07-14 18:08:19'),
(111, 15, 7, 'Jenny', 2, 0, 2, 1, '2026-07-14 18:08:19'),
(112, 15, 8, 'Yvonne', 6, 2, 0, 1, '2026-07-14 18:08:19'),
(113, 15, 9, 'Jenny', 1, 0, 1, 2, '2026-07-14 18:08:19'),
(114, 15, 10, 'Yvonne', 1, 0, 1, 2, '2026-07-14 18:08:19'),
(115, 15, 11, 'Jenny', 2, 0, 2, 1, '2026-07-14 18:08:19'),
(116, 15, 12, 'Yvonne', 5, 1, 2, 0, '2026-07-14 18:08:19'),
(117, 15, 13, 'Jenny', 4, 1, 1, 1, '2026-07-14 18:08:19'),
(118, 15, 14, 'Yvonne', 5, 1, 2, 0, '2026-07-14 18:08:19'),
(119, 16, 1, 'Yvonne', 4, 1, 1, 1, '2026-07-14 18:16:40'),
(120, 16, 2, 'Charlie', 2, 0, 2, 1, '2026-07-14 18:16:40'),
(121, 16, 3, 'Yvonne', 6, 2, 0, 1, '2026-07-14 18:16:40'),
(122, 16, 4, 'Charlie', 0, 0, 0, 3, '2026-07-14 18:16:40'),
(123, 16, 5, 'Yvonne', 2, 0, 2, 1, '2026-07-14 18:16:40'),
(124, 16, 6, 'Charlie', 3, 0, 3, 0, '2026-07-14 18:16:40'),
(125, 16, 7, 'Yvonne', 3, 1, 0, 2, '2026-07-14 18:16:40'),
(126, 16, 8, 'Charlie', 2, 0, 2, 1, '2026-07-14 18:16:40'),
(127, 16, 9, 'Yvonne', 1, 0, 1, 2, '2026-07-14 18:16:40'),
(128, 16, 10, 'Charlie', 2, 0, 2, 1, '2026-07-14 18:16:40'),
(129, 16, 11, 'Yvonne', 0, 0, 0, 3, '2026-07-14 18:16:40'),
(130, 16, 12, 'Charlie', 5, 1, 2, 0, '2026-07-14 18:16:40'),
(131, 16, 13, 'Yvonne', 0, 0, 0, 3, '2026-07-14 18:16:40'),
(132, 16, 14, 'Charlie', 1, 0, 1, 2, '2026-07-14 18:16:40'),
(133, 16, 15, 'Yvonne', 2, 0, 2, 1, '2026-07-14 18:16:40'),
(134, 16, 16, 'Charlie', 2, 0, 2, 1, '2026-07-14 18:16:40'),
(135, 16, 17, 'Yvonne', 2, 0, 2, 1, '2026-07-14 18:16:40'),
(136, 16, 18, 'Charlie', 5, 1, 2, 0, '2026-07-14 18:16:40'),
(137, 17, 1, 'Jenny', 3, 0, 3, 0, '2026-07-14 18:24:13'),
(138, 17, 2, 'Charlie', 4, 1, 1, 1, '2026-07-14 18:24:13'),
(139, 17, 3, 'Jenny', 1, 0, 1, 2, '2026-07-14 18:24:13'),
(140, 17, 4, 'Charlie', 2, 0, 2, 1, '2026-07-14 18:24:13'),
(141, 17, 5, 'Jenny', 4, 1, 1, 1, '2026-07-14 18:24:13'),
(142, 17, 6, 'Charlie', 3, 1, 0, 2, '2026-07-14 18:24:13'),
(143, 17, 7, 'Jenny', 4, 1, 1, 1, '2026-07-14 18:24:13'),
(144, 17, 8, 'Charlie', 7, 2, 1, 0, '2026-07-14 18:24:13'),
(145, 17, 9, 'Jenny', 5, 1, 2, 0, '2026-07-14 18:24:13'),
(146, 17, 10, 'Charlie', 7, 2, 1, 0, '2026-07-14 18:24:13'),
(147, 18, 1, 'Charlie', 6, 2, 0, 1, '2026-07-14 18:28:31'),
(148, 18, 2, 'Yvonne', 4, 1, 1, 1, '2026-07-14 18:28:31'),
(149, 18, 3, 'Charlie', 5, 1, 2, 0, '2026-07-14 18:28:31'),
(150, 18, 4, 'Yvonne', 0, 0, 0, 3, '2026-07-14 18:28:31'),
(151, 18, 5, 'Charlie', 1, 0, 1, 2, '2026-07-14 18:28:31'),
(152, 18, 6, 'Yvonne', 1, 0, 1, 2, '2026-07-14 18:28:31'),
(153, 18, 7, 'Charlie', 4, 1, 1, 1, '2026-07-14 18:28:31'),
(154, 18, 8, 'Yvonne', 2, 0, 2, 1, '2026-07-14 18:28:31'),
(155, 18, 9, 'Charlie', 5, 1, 2, 0, '2026-07-14 18:28:31'),
(156, 19, 1, 'Jenny', 2, 0, 2, 1, '2026-07-14 18:35:35'),
(157, 19, 2, 'Yvonne', 6, 2, 0, 1, '2026-07-14 18:35:35'),
(158, 19, 3, 'Jenny', 3, 0, 3, 0, '2026-07-14 18:35:35'),
(159, 19, 4, 'Yvonne', 4, 1, 1, 1, '2026-07-14 18:35:35'),
(160, 19, 5, 'Jenny', 3, 1, 0, 2, '2026-07-14 18:35:35'),
(161, 19, 6, 'Yvonne', 0, 0, 0, 3, '2026-07-14 18:35:35'),
(162, 19, 7, 'Jenny', 3, 0, 3, 0, '2026-07-14 18:35:35'),
(163, 19, 8, 'Yvonne', 6, 2, 0, 1, '2026-07-14 18:35:35'),
(164, 19, 9, 'Jenny', 2, 0, 2, 1, '2026-07-14 18:35:35'),
(165, 19, 10, 'Yvonne', 4, 1, 1, 1, '2026-07-14 18:35:35'),
(166, 19, 11, 'Jenny', 4, 1, 1, 1, '2026-07-14 18:35:35'),
(167, 19, 12, 'Yvonne', 4, 1, 1, 1, '2026-07-14 18:35:35'),
(168, 20, 1, 'Charlie', 5, 1, 2, 0, '2026-07-14 18:41:17'),
(169, 20, 2, 'Yvonne', 4, 1, 1, 1, '2026-07-14 18:41:17'),
(170, 20, 3, 'Charlie', 4, 1, 1, 1, '2026-07-14 18:41:17'),
(171, 20, 4, 'Yvonne', 3, 0, 3, 0, '2026-07-14 18:41:17'),
(172, 20, 5, 'Charlie', 2, 0, 2, 1, '2026-07-14 18:41:17'),
(173, 20, 6, 'Yvonne', 2, 0, 2, 1, '2026-07-14 18:41:17'),
(174, 20, 7, 'Charlie', 3, 1, 0, 2, '2026-07-14 18:41:17'),
(175, 20, 8, 'Yvonne', 4, 1, 1, 1, '2026-07-14 18:41:17'),
(176, 20, 9, 'Charlie', 7, 2, 1, 0, '2026-07-14 18:41:17'),
(177, 21, 1, 'Jenny', 2, 0, 2, 1, '2026-07-14 18:48:50'),
(178, 21, 2, 'Charlie', 0, 0, 0, 3, '2026-07-14 18:48:50'),
(179, 21, 3, 'Jenny', 2, 0, 2, 1, '2026-07-14 18:48:50'),
(180, 21, 4, 'Charlie', 5, 1, 2, 0, '2026-07-14 18:48:50'),
(181, 21, 5, 'Jenny', 6, 2, 0, 1, '2026-07-14 18:48:50'),
(182, 21, 6, 'Charlie', 4, 1, 1, 1, '2026-07-14 18:48:50'),
(183, 21, 7, 'Jenny', 4, 1, 1, 1, '2026-07-14 18:48:50'),
(184, 21, 8, 'Charlie', 4, 1, 1, 1, '2026-07-14 18:48:50'),
(185, 21, 9, 'Jenny', 2, 0, 2, 1, '2026-07-14 18:48:50'),
(186, 21, 10, 'Charlie', 2, 0, 2, 1, '2026-07-14 18:48:50'),
(187, 21, 11, 'Jenny', 1, 0, 1, 2, '2026-07-14 18:48:50'),
(188, 21, 12, 'Charlie', 5, 1, 2, 0, '2026-07-14 18:48:50'),
(189, 21, 13, 'Jenny', 4, 1, 1, 1, '2026-07-14 18:48:50'),
(190, 22, 1, 'Exempel', 9, 3, 0, 0, '2026-07-15 15:40:15'),
(191, 22, 2, 'Exempelvis', 9, 3, 0, 0, '2026-07-15 15:40:15'),
(192, 22, 3, 'Exempel', 9, 3, 0, 0, '2026-07-15 15:40:15'),
(193, 22, 4, 'Exempelvis', 9, 3, 0, 0, '2026-07-15 15:40:15'),
(194, 22, 5, 'Exempel', 2, 0, 2, 1, '2026-07-15 15:40:15'),
(195, 22, 6, 'Exempelvis', 3, 0, 3, 0, '2026-07-15 15:40:15'),
(196, 23, 1, 'Exempelvis', 9, 3, 0, 0, '2026-07-15 15:40:37'),
(197, 23, 2, 'Exempelina', 9, 3, 0, 0, '2026-07-15 15:40:37'),
(198, 23, 3, 'Exempelvis', 9, 3, 0, 0, '2026-07-15 15:40:37'),
(199, 23, 4, 'Exempelina', 9, 3, 0, 0, '2026-07-15 15:40:37'),
(200, 23, 5, 'Exempelvis', 3, 0, 3, 0, '2026-07-15 15:40:37'),
(201, 24, 1, 'Yvonne', 1, 0, 1, 2, '2026-07-15 19:21:44'),
(202, 24, 2, 'Jenny', 3, 0, 3, 0, '2026-07-15 19:21:44'),
(203, 24, 3, 'Yvonne', 7, 2, 1, 0, '2026-07-15 19:21:44'),
(204, 24, 4, 'Jenny', 2, 0, 2, 1, '2026-07-15 19:21:44'),
(205, 24, 5, 'Yvonne', 9, 3, 0, 0, '2026-07-15 19:21:44'),
(206, 24, 6, 'Jenny', 3, 0, 3, 0, '2026-07-15 19:21:44'),
(207, 24, 7, 'Yvonne', 1, 0, 1, 2, '2026-07-15 19:21:44'),
(208, 24, 8, 'Jenny', 4, 1, 1, 1, '2026-07-15 19:21:44'),
(209, 24, 9, 'Yvonne', 5, 1, 2, 0, '2026-07-15 19:21:44'),
(210, 25, 1, 'Yvonne', 3, 0, 3, 0, '2026-07-15 19:26:42'),
(211, 25, 2, 'Charlie', 2, 0, 2, 1, '2026-07-15 19:26:42'),
(212, 25, 3, 'Yvonne', 5, 1, 2, 0, '2026-07-15 19:26:42'),
(213, 25, 4, 'Charlie', 3, 0, 3, 0, '2026-07-15 19:26:42'),
(214, 25, 5, 'Yvonne', 3, 1, 0, 2, '2026-07-15 19:26:42'),
(215, 25, 6, 'Charlie', 7, 2, 1, 0, '2026-07-15 19:26:42'),
(216, 25, 7, 'Yvonne', 5, 1, 2, 0, '2026-07-15 19:26:42'),
(217, 25, 8, 'Charlie', 2, 0, 2, 1, '2026-07-15 19:26:42'),
(218, 25, 9, 'Yvonne', 2, 0, 2, 1, '2026-07-15 19:26:42'),
(219, 25, 10, 'Charlie', 5, 1, 2, 0, '2026-07-15 19:26:42'),
(220, 25, 11, 'Yvonne', 5, 1, 2, 0, '2026-07-15 19:26:42'),
(221, 26, 1, 'Jenny', 5, 1, 2, 0, '2026-07-15 19:35:51'),
(222, 26, 2, 'Charlie', 2, 0, 2, 1, '2026-07-15 19:35:51'),
(223, 26, 3, 'Jenny', 3, 0, 3, 0, '2026-07-15 19:35:51'),
(224, 26, 4, 'Charlie', 7, 2, 1, 0, '2026-07-15 19:35:51'),
(225, 26, 5, 'Jenny', 4, 1, 1, 1, '2026-07-15 19:35:51'),
(226, 26, 6, 'Charlie', 2, 0, 2, 1, '2026-07-15 19:35:51'),
(227, 26, 7, 'Jenny', 0, 0, 0, 3, '2026-07-15 19:35:51'),
(228, 26, 8, 'Charlie', 7, 2, 1, 0, '2026-07-15 19:35:51'),
(229, 26, 9, 'Jenny', 7, 2, 1, 0, '2026-07-15 19:35:51'),
(230, 26, 10, 'Charlie', 7, 2, 1, 0, '2026-07-15 19:35:51'),
(231, 27, 1, 'Charlie', 4, 1, 1, 1, '2026-07-15 19:40:20'),
(232, 27, 2, 'Yvonne', 4, 1, 1, 1, '2026-07-15 19:40:20'),
(233, 27, 3, 'Charlie', 4, 1, 1, 1, '2026-07-15 19:40:20'),
(234, 27, 4, 'Yvonne', 3, 1, 0, 2, '2026-07-15 19:40:20'),
(235, 27, 5, 'Charlie', 3, 1, 0, 2, '2026-07-15 19:40:20'),
(236, 27, 6, 'Yvonne', 2, 0, 2, 1, '2026-07-15 19:40:20'),
(237, 27, 7, 'Charlie', 3, 0, 3, 0, '2026-07-15 19:40:20'),
(238, 27, 8, 'Yvonne', 5, 1, 2, 0, '2026-07-15 19:40:20'),
(239, 27, 9, 'Charlie', 7, 2, 1, 0, '2026-07-15 19:40:20'),
(240, 28, 1, 'Yvonne', 1, 0, 1, 2, '2026-07-15 19:46:50'),
(241, 28, 2, 'Jenny', 5, 1, 2, 0, '2026-07-15 19:46:50'),
(242, 28, 3, 'Yvonne', 7, 2, 1, 0, '2026-07-15 19:46:50'),
(243, 28, 4, 'Jenny', 2, 0, 2, 1, '2026-07-15 19:46:50'),
(244, 28, 5, 'Yvonne', 6, 2, 0, 1, '2026-07-15 19:46:50'),
(245, 28, 6, 'Jenny', 3, 0, 3, 0, '2026-07-15 19:46:50'),
(246, 28, 7, 'Yvonne', 2, 0, 2, 1, '2026-07-15 19:46:50'),
(247, 28, 8, 'Jenny', 5, 1, 2, 0, '2026-07-15 19:46:50'),
(248, 28, 9, 'Yvonne', 7, 2, 1, 0, '2026-07-15 19:46:50'),
(249, 29, 1, 'Charlie', 3, 0, 3, 0, '2026-07-15 19:51:42'),
(250, 29, 2, 'Yvonne', 7, 2, 1, 0, '2026-07-15 19:51:42'),
(251, 29, 3, 'Charlie', 4, 1, 1, 1, '2026-07-15 19:51:42'),
(252, 29, 4, 'Yvonne', 5, 1, 2, 0, '2026-07-15 19:51:42'),
(253, 29, 5, 'Charlie', 0, 0, 0, 3, '2026-07-15 19:51:42'),
(254, 29, 6, 'Yvonne', 5, 1, 2, 0, '2026-07-15 19:51:42'),
(255, 29, 7, 'Charlie', 5, 1, 2, 0, '2026-07-15 19:51:42'),
(256, 29, 8, 'Yvonne', 2, 0, 2, 1, '2026-07-15 19:51:42'),
(257, 29, 9, 'Charlie', 5, 1, 2, 0, '2026-07-15 19:51:42'),
(258, 29, 10, 'Yvonne', 6, 2, 0, 1, '2026-07-15 19:51:42'),
(259, 30, 1, 'Jenny', 3, 0, 3, 0, '2026-07-15 19:58:01'),
(260, 30, 2, 'Yvonne', 3, 0, 3, 0, '2026-07-15 19:58:01'),
(261, 30, 3, 'Jenny', 6, 2, 0, 1, '2026-07-15 19:58:01'),
(262, 30, 4, 'Yvonne', 1, 0, 1, 2, '2026-07-15 19:58:01'),
(263, 30, 5, 'Jenny', 2, 0, 2, 1, '2026-07-15 19:58:01'),
(264, 30, 6, 'Yvonne', 3, 0, 3, 0, '2026-07-15 19:58:01'),
(265, 30, 7, 'Jenny', 3, 0, 3, 0, '2026-07-15 19:58:01'),
(266, 30, 8, 'Yvonne', 4, 1, 1, 1, '2026-07-15 19:58:01'),
(267, 30, 9, 'Jenny', 2, 0, 2, 1, '2026-07-15 19:58:01'),
(268, 30, 10, 'Yvonne', 4, 1, 1, 1, '2026-07-15 19:58:01'),
(269, 30, 11, 'Jenny', 6, 2, 0, 1, '2026-07-15 19:58:01'),
(270, 31, 1, 'Jenny', 4, 1, 1, 1, '2026-07-15 20:04:25'),
(271, 31, 2, 'Charlie', 7, 2, 1, 0, '2026-07-15 20:04:25'),
(272, 31, 3, 'Jenny', 5, 1, 2, 0, '2026-07-15 20:04:25'),
(273, 31, 4, 'Charlie', 7, 2, 1, 0, '2026-07-15 20:04:25'),
(274, 31, 5, 'Jenny', 3, 0, 3, 0, '2026-07-15 20:04:25'),
(275, 31, 6, 'Charlie', 2, 0, 2, 1, '2026-07-15 20:04:25'),
(276, 31, 7, 'Jenny', 4, 1, 1, 1, '2026-07-15 20:04:25'),
(277, 31, 8, 'Charlie', 1, 0, 1, 2, '2026-07-15 20:04:25'),
(278, 31, 9, 'Jenny', 5, 1, 2, 0, '2026-07-15 20:04:25'),
(279, 32, 1, 'Jenny', 5, 1, 2, 0, '2026-07-15 20:08:54'),
(280, 32, 2, 'Yvonne', 4, 1, 1, 1, '2026-07-15 20:08:54'),
(281, 32, 3, 'Jenny', 6, 2, 0, 1, '2026-07-15 20:08:54'),
(282, 32, 4, 'Yvonne', 4, 1, 1, 1, '2026-07-15 20:08:54'),
(283, 32, 5, 'Jenny', 4, 1, 1, 1, '2026-07-15 20:08:54'),
(284, 32, 6, 'Yvonne', 1, 0, 1, 2, '2026-07-15 20:08:54'),
(285, 32, 7, 'Jenny', 3, 0, 3, 0, '2026-07-15 20:08:54'),
(286, 32, 8, 'Yvonne', 2, 0, 2, 1, '2026-07-15 20:08:54'),
(287, 32, 9, 'Jenny', 3, 0, 3, 0, '2026-07-15 20:08:54'),
(288, 33, 1, 'Yvonne', 4, 1, 1, 1, '2026-07-16 18:54:00'),
(289, 33, 2, 'Jenny', 3, 0, 3, 0, '2026-07-16 18:54:00'),
(290, 33, 3, 'Yvonne', 4, 1, 1, 1, '2026-07-16 18:54:00'),
(291, 33, 4, 'Jenny', 2, 0, 2, 1, '2026-07-16 18:54:00'),
(292, 33, 5, 'Yvonne', 4, 1, 1, 1, '2026-07-16 18:54:00'),
(293, 33, 6, 'Jenny', 3, 0, 3, 0, '2026-07-16 18:54:00'),
(294, 33, 7, 'Yvonne', 5, 1, 2, 0, '2026-07-16 18:54:00'),
(295, 33, 8, 'Jenny', 5, 1, 2, 0, '2026-07-16 18:54:00'),
(296, 33, 9, 'Yvonne', 1, 0, 1, 2, '2026-07-16 18:54:00'),
(297, 33, 10, 'Jenny', 6, 2, 0, 1, '2026-07-16 18:54:00'),
(298, 33, 11, 'Yvonne', 5, 1, 2, 0, '2026-07-16 18:54:00'),
(299, 34, 1, 'Yvonne', 5, 1, 2, 0, '2026-07-16 18:59:26'),
(300, 34, 2, 'Charlie', 3, 0, 3, 0, '2026-07-16 18:59:26'),
(301, 34, 3, 'Yvonne', 1, 0, 1, 2, '2026-07-16 18:59:26'),
(302, 34, 4, 'Charlie', 5, 1, 2, 0, '2026-07-16 18:59:26'),
(303, 34, 5, 'Yvonne', 4, 1, 1, 1, '2026-07-16 18:59:26'),
(304, 34, 6, 'Charlie', 5, 1, 2, 0, '2026-07-16 18:59:26'),
(305, 34, 7, 'Yvonne', 1, 0, 1, 2, '2026-07-16 18:59:26'),
(306, 34, 8, 'Charlie', 2, 0, 2, 1, '2026-07-16 18:59:26'),
(307, 34, 9, 'Yvonne', 5, 1, 2, 0, '2026-07-16 18:59:26'),
(308, 34, 10, 'Charlie', 7, 2, 1, 0, '2026-07-16 18:59:26'),
(309, 35, 1, 'Jenny', 7, 2, 1, 0, '2026-07-16 19:05:31'),
(310, 35, 2, 'Charlie', 2, 0, 2, 1, '2026-07-16 19:05:31'),
(311, 35, 3, 'Jenny', 3, 0, 3, 0, '2026-07-16 19:05:31'),
(312, 35, 4, 'Charlie', 9, 3, 0, 0, '2026-07-16 19:05:31'),
(313, 35, 5, 'Jenny', 2, 0, 2, 1, '2026-07-16 19:05:31'),
(314, 35, 6, 'Charlie', 4, 1, 1, 1, '2026-07-16 19:05:31'),
(315, 35, 7, 'Jenny', 2, 0, 2, 1, '2026-07-16 19:05:31'),
(316, 35, 8, 'Charlie', 4, 1, 1, 1, '2026-07-16 19:05:31'),
(317, 35, 9, 'Jenny', 6, 2, 0, 1, '2026-07-16 19:05:31'),
(318, 35, 10, 'Charlie', 7, 2, 1, 0, '2026-07-16 19:05:31'),
(319, 36, 1, 'Charlie', 4, 1, 1, 1, '2026-07-16 19:10:39'),
(320, 36, 2, 'Yvonne', 7, 2, 1, 0, '2026-07-16 19:10:39'),
(321, 36, 3, 'Charlie', 5, 1, 2, 0, '2026-07-16 19:10:39'),
(322, 36, 4, 'Yvonne', 2, 0, 2, 1, '2026-07-16 19:10:39'),
(323, 36, 5, 'Charlie', 1, 0, 1, 2, '2026-07-16 19:10:39'),
(324, 36, 6, 'Yvonne', 4, 1, 1, 1, '2026-07-16 19:10:39'),
(325, 36, 7, 'Charlie', 7, 2, 1, 0, '2026-07-16 19:10:39'),
(326, 36, 8, 'Yvonne', 0, 0, 0, 3, '2026-07-16 19:10:39'),
(327, 36, 9, 'Charlie', 6, 2, 0, 1, '2026-07-16 19:10:39'),
(328, 37, 1, 'Jenny', 7, 2, 1, 0, '2026-07-16 19:16:38'),
(329, 37, 2, 'Yvonne', 4, 1, 1, 1, '2026-07-16 19:16:38'),
(330, 37, 3, 'Jenny', 3, 0, 3, 0, '2026-07-16 19:16:38'),
(331, 37, 4, 'Yvonne', 4, 1, 1, 1, '2026-07-16 19:16:38'),
(332, 37, 5, 'Jenny', 2, 0, 2, 1, '2026-07-16 19:16:38'),
(333, 37, 6, 'Yvonne', 5, 1, 2, 0, '2026-07-16 19:16:38'),
(334, 37, 7, 'Jenny', 2, 0, 2, 1, '2026-07-16 19:16:38'),
(335, 37, 8, 'Yvonne', 4, 1, 1, 1, '2026-07-16 19:16:38'),
(336, 37, 9, 'Jenny', 6, 2, 0, 1, '2026-07-16 19:16:38'),
(337, 37, 10, 'Yvonne', 1, 0, 1, 2, '2026-07-16 19:16:38'),
(338, 37, 11, 'Jenny', 3, 0, 3, 0, '2026-07-16 19:16:38');

-- --------------------------------------------------------

--
-- Table structure for table `ch_users`
--

CREATE TABLE `ch_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(24) NOT NULL,
  `games` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `wins` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `losses` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `points` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `holes` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `boards` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ground` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fire_series`
--

CREATE TABLE `fire_series` (
  `id` int(10) UNSIGNED NOT NULL,
  `session_id` int(10) UNSIGNED NOT NULL,
  `series_number` int(10) UNSIGNED NOT NULL,
  `shots_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`shots_json`)),
  `total_score` int(10) UNSIGNED NOT NULL,
  `x_count` int(10) UNSIGNED NOT NULL,
  `shot_count` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `miss_count` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fire_shooting_sessions`
--

CREATE TABLE `fire_shooting_sessions` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `weapon_id` int(10) UNSIGNED NOT NULL,
  `session_date` date NOT NULL,
  `location` text NOT NULL,
  `discipline` varchar(120) NOT NULL,
  `distance_meters` int(10) UNSIGNED NOT NULL,
  `shooter_age` tinyint(3) UNSIGNED DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fire_shooting_sessions`
--

INSERT INTO `fire_shooting_sessions` (`id`, `user_id`, `weapon_id`, `session_date`, `location`, `discipline`, `distance_meters`, `shooter_age`, `notes`, `created_at`) VALUES
(1, 1, 1, '2026-06-10', 'flenc:v1:UAda8xvELYc88IXV9kANOEt58nVG8oRO/u4WBNYj6STqpDM=', 'Snabbserie', 25, 55, '', '2026-06-10 17:43:05'),
(2, 1, 1, '2026-06-11', 'flenc:v1:JE/NCBSee7X1zA9b+hiH0ous1VY3zXQEhDzFloRwG35+Cio=', 'Snabbserie', 25, 55, '', '2026-06-11 10:43:07'),
(3, 1, 3, '2026-08-19', 'flenc:v1:rlkaubIKvmuLY71K1T8AYNYAmkpsRcCFG1beHkkinMQF/OY=', 'Precision', 25, 55, '', '2026-08-19 16:16:36');

-- --------------------------------------------------------

--
-- Table structure for table `fire_users`
--

CREATE TABLE `fire_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(80) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `birth_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fire_users`
--

INSERT INTO `fire_users` (`id`, `username`, `password_hash`, `is_admin`, `birth_date`, `created_at`) VALUES
(1, 'j4rl', '$2y$10$dvfWOzkH9wYUmmHCqzRvz.F1wxq2OH/peAULuP6XpJDKnpSOF/1am', 0, '1970-12-09', '2026-06-04 08:24:42'),
(2, 'adminjarl', '$2y$10$q0oETxPySw/eH0V2EpruYepKdE5bjfg9eovhwU5ThnBByKc.LQC3a', 1, NULL, '2026-06-25 21:51:48');

-- --------------------------------------------------------

--
-- Table structure for table `fire_weapons`
--

CREATE TABLE `fire_weapons` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `manufacturer` text NOT NULL,
  `model` text NOT NULL,
  `caliber` text NOT NULL,
  `serial_number` text NOT NULL,
  `weapon_class` enum('A','B','C','R') NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fire_weapons`
--

INSERT INTO `fire_weapons` (`id`, `user_id`, `manufacturer`, `model`, `caliber`, `serial_number`, `weapon_class`, `notes`, `created_at`) VALUES
(1, 1, 'flenc:v1:l0HG7ioqUaZ4cfr1HnyOOPwdhZJR0gNDd2zOgH+zafpIgsA=', 'flenc:v1:+ymOyAR3dkXe9XG2adD/O7jOfNCt882wCWzHWowJZU5DsJU=', 'flenc:v1:j43R9khvZr6+mX6kGlzXo1Lh5R9+4teR4moXU6gq+Cs0', 'flenc:v1:PpUunmo70Vz49DIuHkDddXcHtoRZhxnZ7HkHB0ylJnQ=', 'C', '', '2026-06-04 08:50:47'),
(2, 1, 'flenc:v1:7taqt2QUT3+NGLemS6YPuAyLimepoN5CV3Eqeu5ZAQXbiA==', 'flenc:v1:/hfOD1Xk0TTx1aAYauuUZR78+o4jCJ1ZExymAHoRmg==', 'flenc:v1:zPqnzpebBI0j3nI7R0HBkxHbVG7JBLDGMqRSWpyWxesee/s=', 'flenc:v1:KuPPqqBIa9FnDr0UgJ7tapMcLk9rd31YkBwnmp2WHKE=', 'R', '', '2026-06-04 08:51:25'),
(3, 1, 'flenc:v1:NArr17oeTr9VURJ7izFTbf1UUupD4YyONvFAMlVGsPbJ', 'flenc:v1:Gppwg6BlJ/EQN7stoNdy522WlTgWyAiJHCOWrjObLjkdK+M=', 'flenc:v1:tetM83kFArq3ZfEBtAd7S2j8paJbFrNbawLPm4Jlhw==', 'flenc:v1:qI4BVsv+2atjJ2ypqiQ75HmbHkv1edETtoEFNYa/Gzw=', 'A', '', '2026-06-04 08:51:53'),
(4, 1, 'flenc:v1:r47El8etzlvAofK6/My6fms22U9+jYfj5MCqm5POMZsS', 'flenc:v1:c4SWzfh1KTDYi5WOuSdeyp069D/JF4zdKMPoI/BiCD0Xi2LGIvM=', 'flenc:v1:zVt5U2QqqsqOi6CL1OvexCwrFdbEB4TSeBJZROm0x/CG', 'flenc:v1:ae4f198pnof15y46uJkIiKjvgT2U1vDWx9/NtMeahko=', 'C', '', '2026-06-10 15:55:16');

-- --------------------------------------------------------

--
-- Table structure for table `jolt_answers`
--

CREATE TABLE `jolt_answers` (
  `id` int(10) UNSIGNED NOT NULL,
  `question_id` int(10) UNSIGNED NOT NULL,
  `text` varchar(300) NOT NULL,
  `is_correct` tinyint(1) NOT NULL DEFAULT 0,
  `position` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jolt_answers`
--

INSERT INTO `jolt_answers` (`id`, `question_id`, `text`, `is_correct`, `position`) VALUES
(1, 1, '130 hk', 0, 1),
(2, 1, '75 hk', 0, 2),
(3, 1, '256 hk', 0, 3),
(4, 1, '874 hk', 1, 4),
(5, 2, 'Orientering', 0, 1),
(6, 2, 'Hockey', 1, 2),
(7, 2, 'Handboll', 0, 3),
(8, 2, 'Innebandy', 0, 4),
(9, 3, 'Jätterik', 0, 1),
(10, 3, 'Megarik', 1, 2),
(11, 3, 'Inte alls', 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `jolt_games`
--

CREATE TABLE `jolt_games` (
  `id` int(10) UNSIGNED NOT NULL,
  `quiz_id` int(10) UNSIGNED NOT NULL,
  `host_user_id` int(10) UNSIGNED NOT NULL,
  `code` char(6) NOT NULL,
  `status` enum('lobby','question','results','finished') NOT NULL DEFAULT 'lobby',
  `name` varchar(140) DEFAULT NULL,
  `current_question` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `question_started_at` datetime(3) DEFAULT NULL,
  `results_started_at` datetime(3) DEFAULT NULL,
  `leaderboard_time` smallint(5) UNSIGNED DEFAULT NULL,
  `allow_profiles` tinyint(1) NOT NULL DEFAULT 1,
  `music_theme` enum('pulse','arcade','focus','none') NOT NULL DEFAULT 'pulse',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jolt_games`
--

INSERT INTO `jolt_games` (`id`, `quiz_id`, `host_user_id`, `code`, `status`, `name`, `current_question`, `question_started_at`, `results_started_at`, `leaderboard_time`, `allow_profiles`, `music_theme`, `created_at`) VALUES
(1, 1, 1, '184947', 'lobby', NULL, 0, NULL, NULL, NULL, 1, 'arcade', '2026-08-27 21:52:18'),
(2, 1, 1, '751967', 'lobby', NULL, 0, NULL, NULL, NULL, 1, 'pulse', '2026-08-27 21:52:55'),
(3, 1, 1, '429294', 'lobby', NULL, 0, NULL, NULL, NULL, 1, 'pulse', '2026-08-28 06:52:03'),
(4, 2, 2, '806758', 'finished', NULL, 1, '2026-09-30 12:47:26.342', '2026-09-30 12:47:29.057', NULL, 1, 'pulse', '2026-09-30 12:44:38'),
(5, 3, 3, '353305', 'results', NULL, 1, '2026-10-06 12:23:09.608', '2026-10-06 12:23:29.594', NULL, 1, 'pulse', '2026-10-06 12:22:45');

-- --------------------------------------------------------

--
-- Table structure for table `jolt_game_questions`
--

CREATE TABLE `jolt_game_questions` (
  `id` int(10) UNSIGNED NOT NULL,
  `game_id` int(10) UNSIGNED NOT NULL,
  `question_id` int(10) UNSIGNED DEFAULT NULL,
  `position` smallint(5) UNSIGNED NOT NULL,
  `text` varchar(500) NOT NULL,
  `max_points` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jolt_game_questions`
--

INSERT INTO `jolt_game_questions` (`id`, `game_id`, `question_id`, `position`, `text`, `max_points`) VALUES
(1, 1, 1, 1, 'Hur många hästkrafter hade Charlies BMW 2002?', 1000),
(2, 1, 2, 2, 'Vilken sport har Johanna inte utövat?', 1000),
(4, 2, 1, 1, 'Hur många hästkrafter hade Charlies BMW 2002?', 1000),
(5, 2, 2, 2, 'Vilken sport har Johanna inte utövat?', 1000),
(7, 3, 1, 1, 'Hur många hästkrafter hade Charlies BMW 2002?', 1000),
(8, 3, 2, 2, 'Vilken sport har Johanna inte utövat?', 1000),
(10, 5, 3, 1, 'Hur rik är Niklas Fransson?', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `jolt_players`
--

CREATE TABLE `jolt_players` (
  `id` int(10) UNSIGNED NOT NULL,
  `game_id` int(10) UNSIGNED NOT NULL,
  `token` char(48) NOT NULL,
  `name` varchar(40) NOT NULL,
  `avatar` varchar(12) NOT NULL DEFAULT '⚡',
  `score` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `joined_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jolt_players`
--

INSERT INTO `jolt_players` (`id`, `game_id`, `token`, `name`, `avatar`, `score`, `joined_at`) VALUES
(1, 4, '621f5ca62fd20df900cd3e04f61b029ebb60fc9ddc1c761d', 'Skal', '⚡', 0, '2026-09-30 12:47:15'),
(2, 5, '93d6c570277e180c3adbcf8d880ea219fd1c2c59283bbcbc', 'Frasse', '⚡', 909, '2026-10-06 12:23:01');

-- --------------------------------------------------------

--
-- Table structure for table `jolt_questions`
--

CREATE TABLE `jolt_questions` (
  `id` int(10) UNSIGNED NOT NULL,
  `quiz_id` int(10) UNSIGNED NOT NULL,
  `position` smallint(5) UNSIGNED NOT NULL,
  `text` varchar(500) NOT NULL,
  `type` enum('single','multiple','truefalse') NOT NULL DEFAULT 'single',
  `time_limit` smallint(5) UNSIGNED NOT NULL DEFAULT 20,
  `points` smallint(5) UNSIGNED NOT NULL DEFAULT 1000,
  `media_path` varchar(255) DEFAULT NULL,
  `media_type` enum('image','video') DEFAULT NULL,
  `media_credit` varchar(1000) DEFAULT NULL,
  `media_source_url` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jolt_questions`
--

INSERT INTO `jolt_questions` (`id`, `quiz_id`, `position`, `text`, `type`, `time_limit`, `points`, `media_path`, `media_type`, `media_credit`, `media_source_url`) VALUES
(1, 1, 1, 'Hur många hästkrafter hade Charlies BMW 2002?', 'single', 20, 1000, 'uploads/1411b3e52e9ac9b25128709c.jpg', 'image', '\"BMW 2002 Turbo\" by nakhon100 is licensed under CC BY 2.0. To view a copy of this license, visit https://creativecommons.org/licenses/by/2.0/.', 'https://www.flickr.com/photos/8058098@N07/494019084'),
(2, 1, 2, 'Vilken sport har Johanna inte utövat?', 'single', 20, 1000, 'uploads/43fa6de940d3b0e276cfee37.webp', 'image', '\"Soccer - Army Youth Sports and Fitness - CYSS - Camp Humphreys, South Korea - 111001\" by USAG-Humphreys is licensed under CC BY 2.0. To view a copy of this license, visit https://creativecommons.org/licenses/by/2.0/.', 'https://www.flickr.com/photos/31687107@N07/6205997306'),
(3, 3, 1, 'Hur rik är Niklas Fransson?', 'single', 20, 1000, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jolt_quizzes`
--

CREATE TABLE `jolt_quizzes` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(140) NOT NULL,
  `description` varchar(500) NOT NULL DEFAULT '',
  `is_public` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jolt_quizzes`
--

INSERT INTO `jolt_quizzes` (`id`, `user_id`, `title`, `description`, `is_public`, `created_at`, `updated_at`) VALUES
(1, 1, 'TE26', 'Känner du Charlie och Johanna? Verkligen?', 0, '2026-08-27 21:36:35', '2026-08-27 21:37:10'),
(2, 2, 'Maträtt', '', 0, '2026-09-30 12:43:54', '2026-09-30 12:43:54'),
(3, 3, 'Nicke-quiz', '', 0, '2026-10-06 12:18:51', '2026-10-06 12:18:51');

-- --------------------------------------------------------

--
-- Table structure for table `jolt_responses`
--

CREATE TABLE `jolt_responses` (
  `id` int(10) UNSIGNED NOT NULL,
  `game_id` int(10) UNSIGNED NOT NULL,
  `player_id` int(10) UNSIGNED NOT NULL,
  `question_id` int(10) UNSIGNED NOT NULL,
  `answer_ids` varchar(255) NOT NULL,
  `is_correct` tinyint(1) NOT NULL,
  `response_ms` int(10) UNSIGNED NOT NULL,
  `points_awarded` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jolt_responses`
--

INSERT INTO `jolt_responses` (`id`, `game_id`, `player_id`, `question_id`, `answer_ids`, `is_correct`, `response_ms`, `points_awarded`, `created_at`) VALUES
(1, 5, 2, 3, '10', 1, 5186, 909, '2026-10-06 12:23:14');

-- --------------------------------------------------------

--
-- Table structure for table `jolt_users`
--

CREATE TABLE `jolt_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(80) NOT NULL,
  `email` varchar(190) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jolt_users`
--

INSERT INTO `jolt_users` (`id`, `name`, `email`, `password_hash`, `created_at`) VALUES
(1, 'Charlie Jarl', 'charlie.jarl@gmail.com', '$2y$10$RiIZa3cZb40NrB./CNlm6e1f7ezovUxoq.ob7kqV2qXj4DjTOsfgC', '2026-08-27 20:56:04'),
(2, 'Armelana Catovic', 'armelana.catovic@karlskoga.se', '$2y$12$Pw2Ioslx8CGJtKyyF45Pnew.bvbh094EFmau2100x/9UrVPeP1gXu', '2026-09-30 12:43:25'),
(3, 'Linnea Borg', 'linnea.borg@karlskoga.se', '$2y$12$g1uCOaXiecjhSNuiJvo51OegrnhWanOqTh06Om9e0EFq3T.cl/jhK', '2026-10-06 12:18:25');

-- --------------------------------------------------------

--
-- Table structure for table `jolt_walking_jolts`
--

CREATE TABLE `jolt_walking_jolts` (
  `id` int(10) UNSIGNED NOT NULL,
  `quiz_id` int(10) UNSIGNED NOT NULL,
  `host_user_id` int(10) UNSIGNED NOT NULL,
  `code` char(6) NOT NULL,
  `scan_secret` char(64) NOT NULL,
  `status` enum('open','closed') NOT NULL DEFAULT 'open',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `closed_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jolt_walking_jolts`
--

INSERT INTO `jolt_walking_jolts` (`id`, `quiz_id`, `host_user_id`, `code`, `scan_secret`, `status`, `created_at`, `closed_at`) VALUES
(1, 1, 1, '912225', '813a0c90a9d252b5cc9de1350bc5ac43d8678e6767d75a2fc6b9610d235a772b', 'open', '2026-08-28 06:52:14', NULL),
(2, 1, 1, '449810', 'ad0ef1b434bc9d5fc0ed4e667937b355f4155b727dc31cb42c6bd8c89aa7e01f', 'open', '2026-08-31 13:18:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jolt_walking_players`
--

CREATE TABLE `jolt_walking_players` (
  `id` int(10) UNSIGNED NOT NULL,
  `walking_jolt_id` int(10) UNSIGNED NOT NULL,
  `token` char(48) NOT NULL,
  `name` varchar(40) NOT NULL,
  `avatar` varchar(12) NOT NULL DEFAULT '⚡',
  `score` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `submitted_at` datetime DEFAULT NULL,
  `joined_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jolt_walking_responses`
--

CREATE TABLE `jolt_walking_responses` (
  `id` int(10) UNSIGNED NOT NULL,
  `player_id` int(10) UNSIGNED NOT NULL,
  `question_id` int(10) UNSIGNED NOT NULL,
  `answer_id` int(10) UNSIGNED NOT NULL,
  `is_correct` tinyint(1) NOT NULL,
  `points_awarded` int(10) UNSIGNED NOT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jolt_walking_unlocks`
--

CREATE TABLE `jolt_walking_unlocks` (
  `player_id` int(10) UNSIGNED NOT NULL,
  `question_id` int(10) UNSIGNED NOT NULL,
  `unlocked_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `memeuser`
--

CREATE TABLE `memeuser` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `memeuser`
--

INSERT INTO `memeuser` (`id`, `username`, `password_hash`, `created_at`) VALUES
(1, 'j4rl', '$2y$10$XhjETBM8mEHqvuULfZ0A0OJ.2W0yqx5aE45OErZdUB89/Ta2BMjSS', '2026-04-21 23:08:48');

-- --------------------------------------------------------

--
-- Table structure for table `molkky_games`
--

CREATE TABLE `molkky_games` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `ruleset_name` varchar(120) NOT NULL,
  `winner_name` varchar(80) NOT NULL,
  `winner_score` int(11) NOT NULL,
  `player_key` varchar(255) NOT NULL,
  `players_json` longtext NOT NULL,
  `game_json` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `molkky_users`
--

CREATE TABLE `molkky_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(40) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `molkky_users`
--

INSERT INTO `molkky_users` (`id`, `username`, `password_hash`, `created_at`) VALUES
(1, 'j4rl', '$2y$10$3Pgf9NHarql8PvKSLzSgiO/UJEbYvwAgxpFVIYQTxjxkwSeRTNtfO', '2026-08-15 16:00:29');

-- --------------------------------------------------------

--
-- Table structure for table `puls_answers`
--

CREATE TABLE `puls_answers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `voter_hash` char(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `value_json` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `puls_answers`
--

INSERT INTO `puls_answers` (`id`, `question_id`, `voter_hash`, `value_json`, `created_at`) VALUES
(5, 3, 'c7d9f0d96c72bdd22a33cd3ff367df8f6a5d423cdb1efe085aee2a6e734735f0', '\"Ganska hög, men hanterbar\"', '2026-09-17 12:21:19'),
(6, 3, 'cfcfb12fc8ba10cc4377f54b6c0030d5e14c3c14f4091cb3cb008f1235ca0684', '\"Klart för hög – jag hinner sällan med det jag ska\"', '2026-09-17 12:21:43'),
(7, 4, 'c7d9f0d96c72bdd22a33cd3ff367df8f6a5d423cdb1efe085aee2a6e734735f0', '\"Nej, sällan\"', '2026-09-17 12:22:05'),
(8, 4, 'cfcfb12fc8ba10cc4377f54b6c0030d5e14c3c14f4091cb3cb008f1235ca0684', '\"Delvis – vissa delar går ihop, andra inte\"', '2026-09-17 12:22:06'),
(9, 5, 'c7d9f0d96c72bdd22a33cd3ff367df8f6a5d423cdb1efe085aee2a6e734735f0', '\"Varken bra eller dåligt\"', '2026-09-17 12:22:23'),
(10, 5, 'cfcfb12fc8ba10cc4377f54b6c0030d5e14c3c14f4091cb3cb008f1235ca0684', '\"Varken bra eller dåligt\"', '2026-09-17 12:22:28'),
(11, 6, 'cfcfb12fc8ba10cc4377f54b6c0030d5e14c3c14f4091cb3cb008f1235ca0684', '\"Mycket bra – jag har det jag behöver\"', '2026-09-17 12:23:07'),
(12, 7, 'cfcfb12fc8ba10cc4377f54b6c0030d5e14c3c14f4091cb3cb008f1235ca0684', '\"Tydligare information och organisation\"', '2026-09-17 12:24:09'),
(13, 7, 'c7d9f0d96c72bdd22a33cd3ff367df8f6a5d423cdb1efe085aee2a6e734735f0', '\"Mer tid för planering och förberedelser\"', '2026-09-17 12:24:13'),
(14, 8, 'c0ec075c9f1aed6d746175ccee06a223a90d6839e2c99958268405fd28f88ea3', '\"Team fortress 2\"', '2026-09-18 09:00:44'),
(15, 9, 'c0ec075c9f1aed6d746175ccee06a223a90d6839e2c99958268405fd28f88ea3', '\"Win 7\"', '2026-09-18 09:00:49'),
(16, 10, 'c0ec075c9f1aed6d746175ccee06a223a90d6839e2c99958268405fd28f88ea3', '\"Xbox360\"', '2026-09-18 09:01:02'),
(17, 8, '38b4f2eb225bf1b6bb77f1b1dda4eb00549a0ef1a557fcd5cdd4ba6b0d0e8bce', '\"Minecraft\"', '2026-09-18 09:01:11'),
(18, 8, '8256167438bb214415f2dbe20db9287a78ed4c61e47710bd0f224f000d271e59', '\"Det första spelet jag spelade på PC var Roblox\"', '2026-09-18 09:01:16'),
(19, 9, '38b4f2eb225bf1b6bb77f1b1dda4eb00549a0ef1a557fcd5cdd4ba6b0d0e8bce', '\"Win 10\"', '2026-09-18 09:01:17'),
(20, 8, 'da1ca9e3129a48e44a47b01a66cebfc5a732bcfddfb4b450c83d0201a58a5651', '\"Roblox\"', '2026-09-18 09:01:24'),
(21, 9, 'da1ca9e3129a48e44a47b01a66cebfc5a732bcfddfb4b450c83d0201a58a5651', '\"Win 10\"', '2026-09-18 09:01:36'),
(22, 9, '8256167438bb214415f2dbe20db9287a78ed4c61e47710bd0f224f000d271e59', '\"Win 7\"', '2026-09-18 09:01:45'),
(23, 8, 'b1bffa63e088e10b1ca8a1290740ce166cf1cb1b04d6531fef93f090998c2038', '\"Minecraft\"', '2026-09-18 09:01:48'),
(24, 10, '38b4f2eb225bf1b6bb77f1b1dda4eb00549a0ef1a557fcd5cdd4ba6b0d0e8bce', '\"XboxOne\"', '2026-09-18 09:01:49'),
(25, 9, 'b1bffa63e088e10b1ca8a1290740ce166cf1cb1b04d6531fef93f090998c2038', '\"Win 10\"', '2026-09-18 09:01:51'),
(26, 8, 'b590e7ecb3403b841cae90c63604d57a31232e05fc19be575bd3660655c0276b', '\"Red dead redemption 2\"', '2026-09-18 09:01:55'),
(27, 9, 'b590e7ecb3403b841cae90c63604d57a31232e05fc19be575bd3660655c0276b', '\"Win 11\"', '2026-09-18 09:02:01'),
(28, 10, 'da1ca9e3129a48e44a47b01a66cebfc5a732bcfddfb4b450c83d0201a58a5651', '\"Xbox\"', '2026-09-18 09:02:02'),
(29, 10, '8256167438bb214415f2dbe20db9287a78ed4c61e47710bd0f224f000d271e59', '\"PS3\"', '2026-09-18 09:02:03'),
(30, 10, 'b1bffa63e088e10b1ca8a1290740ce166cf1cb1b04d6531fef93f090998c2038', '\"Xbox\"', '2026-09-18 09:02:13'),
(31, 10, 'b590e7ecb3403b841cae90c63604d57a31232e05fc19be575bd3660655c0276b', '\"NintendoSwitch\"', '2026-09-18 09:02:29'),
(32, 17, 'feec331168a7e83374e4e8f8a6ad7b818bae12f2e8ae28690f442c143742f21c', '\"Ganska hög, men hanterbar\"', '2026-09-29 13:35:46'),
(33, 17, '5f99306135d36b22532bb3bb77d49f671c47369dd6a7466593b528bc6e9e011a', '\"Ganska hög, men hanterbar\"', '2026-09-29 13:35:47'),
(34, 17, '1a1588ca5357b4df05750fcbc5ccc4c58ce6039d09fc1d7b79186908c19d6a14', '\"Ganska hög, men hanterbar\"', '2026-09-29 13:35:47'),
(35, 17, '373f1f80d949ddfe84aca26d79052f1c112d9b5a70f72208b4b096a60e467fd9', '\"Klart för hög – jag hinner sällan med det jag ska\"', '2026-09-29 13:35:51'),
(36, 17, '6b50ed5a4558d01dfa860bb6026b0a95e498b4ff0babbab24028cf50fe58cee8', '\"Lagom\"', '2026-09-29 13:35:55'),
(37, 17, '6641bf697022dc394c6f2f776e3627696b0f73ebf014fbde05b107c393b17911', '\"Ganska hög, men hanterbar\"', '2026-09-29 13:35:57'),
(38, 17, '4ddf97591498308671d622c34afd5feabaa2448bd8618ddbccda0c510fe4945e', '\"Ganska hög, men hanterbar\"', '2026-09-29 13:35:57'),
(39, 17, '5ed8be04fd8a5914e6bdbc32b70e0887f0c4750764a2dfbd4938c6805d1478cd', '\"Klart för hög – jag hinner sällan med det jag ska\"', '2026-09-29 13:36:02'),
(40, 17, 'b16e720e9760ea565cfaca835559c187d025b7b66faf7e0c09cf2db209a5ed0e', '\"Klart för hög – jag hinner sällan med det jag ska\"', '2026-09-29 13:36:04'),
(41, 17, 'e53ac566515fcbeb6d8c6476a00bc2d9f1d1f67907eec0145c0b18d0c485fdae', '\"Klart för hög – jag hinner sällan med det jag ska\"', '2026-09-29 13:36:04'),
(42, 17, '15ca4270e28b47623c95205a91c8a3b8da1f9d5ab2b2fee96fcd89212e82439f', '\"Lagom\"', '2026-09-29 13:36:05'),
(43, 17, '42c308981b496db34880bae733af929a4577e13f54af37a59204e1837a4bd385', '\"Klart för hög – jag hinner sällan med det jag ska\"', '2026-09-29 13:36:07'),
(44, 17, '0613e5ff7a19e54cc00c6870f9f21c72328d549f29c38bc97b47ab1be515ce85', '\"Klart för hög – jag hinner sällan med det jag ska\"', '2026-09-29 13:36:10'),
(45, 17, '9ca0d647c316b5eee42f6caa6a5712570f0292cdc1c216a0a237f856d2ee0204', '\"Ganska hög, men hanterbar\"', '2026-09-29 13:36:12'),
(46, 17, 'daa29dd261e37cb5763c1a3c6aed79feb991a355700e712ca8a08b65024b665a', '\"Klart för hög – jag hinner sällan med det jag ska\"', '2026-09-29 13:36:13'),
(47, 17, 'd0dd18ebe10c98ff0e85cccaf66d8d3d99bca7c026411fcce898783480e01e4c', '\"Klart för hög – jag hinner sällan med det jag ska\"', '2026-09-29 13:36:17'),
(48, 17, 'acc8274f8a06e9414958316416b5001aab66f4465f28abec9395b1486293ecef', '\"Ganska hög, men hanterbar\"', '2026-09-29 13:36:18'),
(49, 17, '2880b926f7a2f4a0c30dcdd36b81221c2d8e87c6f7b5a803d34285ca7779e440', '\"Klart för hög – jag hinner sällan med det jag ska\"', '2026-09-29 13:36:21'),
(50, 17, '94cd3828b5f9cd3b3869b6adfea97382e1e21e8d122bd073adffafce0367f48f', '\"Ganska hög, men hanterbar\"', '2026-09-29 13:36:23'),
(51, 17, '8346387a1c9176b12bea69dac55e1d4156478d8ebd7fbaeecfb48cc460e9d714', '\"Ganska hög, men hanterbar\"', '2026-09-29 13:36:26'),
(52, 17, '462e3fcba723cb499bdcb166751f6fdba723c6664f411dd8409eb786fe7295cf', '\"Ganska hög, men hanterbar\"', '2026-09-29 13:36:28'),
(53, 17, '52d4d810eafff442c792c60591748c1d539656a7a56a6f9c91ee17a8ee09c81c', '\"Ganska hög, men hanterbar\"', '2026-09-29 13:36:38'),
(54, 17, '1a696f24011588dff993d753d74a61ede4d64ee2fdf9a65247b23213dbbf86ef', '\"Ganska hög, men hanterbar\"', '2026-09-29 13:36:40'),
(55, 17, 'ce9a43a1399b7768ef3cac0301fc5e3997f1b6addfdc286062f5f548c8e4d5ce', '\"Ganska hög, men hanterbar\"', '2026-09-29 13:37:05'),
(56, 17, 'a6e5a8b817b048048acbf4d6e3137a3adf499ce0e1d6168a750c1be5ebdbd07c', '\"Klart för hög – jag hinner sällan med det jag ska\"', '2026-09-29 13:37:05'),
(57, 17, '41e7b9b9520fbec1052a21a7bc05cb446e16917d780e43ccf1de987945b3d26a', '\"Ganska hög, men hanterbar\"', '2026-09-29 13:37:07'),
(58, 17, '4cb4cd43c82fb47c2d551eee2f44eb9b288034bdd549c19df254ad0170389484', '\"Klart för hög – jag hinner sällan med det jag ska\"', '2026-09-29 13:37:16'),
(59, 17, '279dfaf7f88a63ea51d3527cb05f4b0f9c76e917aa5063260869566208de00b8', '\"Klart för hög – jag hinner sällan med det jag ska\"', '2026-09-29 13:37:36'),
(60, 18, 'a6e5a8b817b048048acbf4d6e3137a3adf499ce0e1d6168a750c1be5ebdbd07c', '\"Nej, sällan\"', '2026-09-29 13:39:34'),
(61, 18, '373f1f80d949ddfe84aca26d79052f1c112d9b5a70f72208b4b096a60e467fd9', '\"Delvis – vissa delar går ihop, andra inte\"', '2026-09-29 13:39:36'),
(62, 18, '2880b926f7a2f4a0c30dcdd36b81221c2d8e87c6f7b5a803d34285ca7779e440', '\"Nej, aldrig\"', '2026-09-29 13:39:37'),
(63, 18, '0613e5ff7a19e54cc00c6870f9f21c72328d549f29c38bc97b47ab1be515ce85', '\"Delvis – vissa delar går ihop, andra inte\"', '2026-09-29 13:39:38'),
(64, 18, '462e3fcba723cb499bdcb166751f6fdba723c6664f411dd8409eb786fe7295cf', '\"Ja, det fungerar bra\"', '2026-09-29 13:39:39'),
(65, 18, '15ca4270e28b47623c95205a91c8a3b8da1f9d5ab2b2fee96fcd89212e82439f', '\"Delvis – vissa delar går ihop, andra inte\"', '2026-09-29 13:39:39'),
(66, 18, 'ce9a43a1399b7768ef3cac0301fc5e3997f1b6addfdc286062f5f548c8e4d5ce', '\"Delvis – vissa delar går ihop, andra inte\"', '2026-09-29 13:39:40'),
(67, 18, '1a1588ca5357b4df05750fcbc5ccc4c58ce6039d09fc1d7b79186908c19d6a14', '\"Delvis – vissa delar går ihop, andra inte\"', '2026-09-29 13:39:41'),
(68, 18, 'acc8274f8a06e9414958316416b5001aab66f4465f28abec9395b1486293ecef', '\"Delvis – vissa delar går ihop, andra inte\"', '2026-09-29 13:39:41'),
(69, 18, '5f99306135d36b22532bb3bb77d49f671c47369dd6a7466593b528bc6e9e011a', '\"Delvis – vissa delar går ihop, andra inte\"', '2026-09-29 13:39:41'),
(70, 18, '4cb4cd43c82fb47c2d551eee2f44eb9b288034bdd549c19df254ad0170389484', '\"Delvis – vissa delar går ihop, andra inte\"', '2026-09-29 13:39:43'),
(71, 18, 'feec331168a7e83374e4e8f8a6ad7b818bae12f2e8ae28690f442c143742f21c', '\"Delvis – vissa delar går ihop, andra inte\"', '2026-09-29 13:39:43'),
(72, 18, '9ca0d647c316b5eee42f6caa6a5712570f0292cdc1c216a0a237f856d2ee0204', '\"Ja, det fungerar bra\"', '2026-09-29 13:39:44'),
(73, 18, '6b50ed5a4558d01dfa860bb6026b0a95e498b4ff0babbab24028cf50fe58cee8', '\"Delvis – vissa delar går ihop, andra inte\"', '2026-09-29 13:39:44'),
(74, 18, '94cd3828b5f9cd3b3869b6adfea97382e1e21e8d122bd073adffafce0367f48f', '\"Ja, det fungerar bra\"', '2026-09-29 13:39:45'),
(75, 18, '42c308981b496db34880bae733af929a4577e13f54af37a59204e1837a4bd385', '\"Nej, sällan\"', '2026-09-29 13:39:45'),
(76, 18, '8346387a1c9176b12bea69dac55e1d4156478d8ebd7fbaeecfb48cc460e9d714', '\"Delvis – vissa delar går ihop, andra inte\"', '2026-09-29 13:39:47'),
(77, 18, '52d4d810eafff442c792c60591748c1d539656a7a56a6f9c91ee17a8ee09c81c', '\"Delvis – vissa delar går ihop, andra inte\"', '2026-09-29 13:39:48'),
(78, 18, 'b16e720e9760ea565cfaca835559c187d025b7b66faf7e0c09cf2db209a5ed0e', '\"Delvis – vissa delar går ihop, andra inte\"', '2026-09-29 13:39:48'),
(79, 18, 'daa29dd261e37cb5763c1a3c6aed79feb991a355700e712ca8a08b65024b665a', '\"Delvis – vissa delar går ihop, andra inte\"', '2026-09-29 13:39:49'),
(80, 18, 'd0dd18ebe10c98ff0e85cccaf66d8d3d99bca7c026411fcce898783480e01e4c', '\"Nej, sällan\"', '2026-09-29 13:39:50'),
(81, 18, '279dfaf7f88a63ea51d3527cb05f4b0f9c76e917aa5063260869566208de00b8', '\"Nej, sällan\"', '2026-09-29 13:39:52'),
(82, 18, '5ed8be04fd8a5914e6bdbc32b70e0887f0c4750764a2dfbd4938c6805d1478cd', '\"Delvis – vissa delar går ihop, andra inte\"', '2026-09-29 13:39:53'),
(83, 18, '41e7b9b9520fbec1052a21a7bc05cb446e16917d780e43ccf1de987945b3d26a', '\"Ja, det fungerar bra\"', '2026-09-29 13:39:58'),
(84, 18, '70e4e316ff10a5117df480fffafb47ebbea803470bcf5833653d5c8fe4a65d4a', '\"Nej, sällan\"', '2026-09-29 13:39:59'),
(85, 18, 'e53ac566515fcbeb6d8c6476a00bc2d9f1d1f67907eec0145c0b18d0c485fdae', '\"Delvis – vissa delar går ihop, andra inte\"', '2026-09-29 13:40:00'),
(86, 18, '4ddf97591498308671d622c34afd5feabaa2448bd8618ddbccda0c510fe4945e', '\"Delvis – vissa delar går ihop, andra inte\"', '2026-09-29 13:40:02'),
(87, 18, '6641bf697022dc394c6f2f776e3627696b0f73ebf014fbde05b107c393b17911', '\"Ja, det fungerar bra\"', '2026-09-29 13:40:06'),
(88, 18, '1a696f24011588dff993d753d74a61ede4d64ee2fdf9a65247b23213dbbf86ef', '\"Ja, det fungerar bra\"', '2026-09-29 13:40:19'),
(89, 19, '70e4e316ff10a5117df480fffafb47ebbea803470bcf5833653d5c8fe4a65d4a', '\"Bra\"', '2026-09-29 13:41:17'),
(90, 19, '0613e5ff7a19e54cc00c6870f9f21c72328d549f29c38bc97b47ab1be515ce85', '\"Bra\"', '2026-09-29 13:41:17'),
(91, 19, '4ddf97591498308671d622c34afd5feabaa2448bd8618ddbccda0c510fe4945e', '\"Bra\"', '2026-09-29 13:41:19'),
(92, 19, '1a1588ca5357b4df05750fcbc5ccc4c58ce6039d09fc1d7b79186908c19d6a14', '\"Bra\"', '2026-09-29 13:41:19'),
(93, 19, '5f99306135d36b22532bb3bb77d49f671c47369dd6a7466593b528bc6e9e011a', '\"Bra\"', '2026-09-29 13:41:20'),
(94, 19, '373f1f80d949ddfe84aca26d79052f1c112d9b5a70f72208b4b096a60e467fd9', '\"Bra\"', '2026-09-29 13:41:21'),
(95, 19, 'a6e5a8b817b048048acbf4d6e3137a3adf499ce0e1d6168a750c1be5ebdbd07c', '\"Bra\"', '2026-09-29 13:41:21'),
(96, 19, '42c308981b496db34880bae733af929a4577e13f54af37a59204e1837a4bd385', '\"Varken bra eller dåligt\"', '2026-09-29 13:41:21'),
(97, 19, '9ca0d647c316b5eee42f6caa6a5712570f0292cdc1c216a0a237f856d2ee0204', '\"Bra\"', '2026-09-29 13:41:21'),
(98, 19, 'feec331168a7e83374e4e8f8a6ad7b818bae12f2e8ae28690f442c143742f21c', '\"Bra\"', '2026-09-29 13:41:21'),
(99, 19, '15ca4270e28b47623c95205a91c8a3b8da1f9d5ab2b2fee96fcd89212e82439f', '\"Bra\"', '2026-09-29 13:41:22'),
(100, 19, '1a696f24011588dff993d753d74a61ede4d64ee2fdf9a65247b23213dbbf86ef', '\"Bra\"', '2026-09-29 13:41:22'),
(101, 19, 'acc8274f8a06e9414958316416b5001aab66f4465f28abec9395b1486293ecef', '\"Bra\"', '2026-09-29 13:41:22'),
(102, 19, '6b50ed5a4558d01dfa860bb6026b0a95e498b4ff0babbab24028cf50fe58cee8', '\"Bra\"', '2026-09-29 13:41:22'),
(103, 19, '5ed8be04fd8a5914e6bdbc32b70e0887f0c4750764a2dfbd4938c6805d1478cd', '\"Bra\"', '2026-09-29 13:41:22'),
(104, 19, '4cb4cd43c82fb47c2d551eee2f44eb9b288034bdd549c19df254ad0170389484', '\"Bra\"', '2026-09-29 13:41:23'),
(105, 19, '41e7b9b9520fbec1052a21a7bc05cb446e16917d780e43ccf1de987945b3d26a', '\"Bra\"', '2026-09-29 13:41:23'),
(106, 19, '94cd3828b5f9cd3b3869b6adfea97382e1e21e8d122bd073adffafce0367f48f', '\"Bra\"', '2026-09-29 13:41:24'),
(107, 19, '6641bf697022dc394c6f2f776e3627696b0f73ebf014fbde05b107c393b17911', '\"Bra\"', '2026-09-29 13:41:24'),
(108, 19, 'd0dd18ebe10c98ff0e85cccaf66d8d3d99bca7c026411fcce898783480e01e4c', '\"Bra\"', '2026-09-29 13:41:25'),
(109, 19, 'e53ac566515fcbeb6d8c6476a00bc2d9f1d1f67907eec0145c0b18d0c485fdae', '\"Varken bra eller dåligt\"', '2026-09-29 13:41:25'),
(110, 19, 'daa29dd261e37cb5763c1a3c6aed79feb991a355700e712ca8a08b65024b665a', '\"Bra\"', '2026-09-29 13:41:27'),
(111, 19, '279dfaf7f88a63ea51d3527cb05f4b0f9c76e917aa5063260869566208de00b8', '\"Bra\"', '2026-09-29 13:41:28'),
(112, 19, '52d4d810eafff442c792c60591748c1d539656a7a56a6f9c91ee17a8ee09c81c', '\"Bra\"', '2026-09-29 13:41:29'),
(113, 19, 'ce9a43a1399b7768ef3cac0301fc5e3997f1b6addfdc286062f5f548c8e4d5ce', '\"Varken bra eller dåligt\"', '2026-09-29 13:41:30'),
(114, 19, '462e3fcba723cb499bdcb166751f6fdba723c6664f411dd8409eb786fe7295cf', '\"Bra\"', '2026-09-29 13:41:31'),
(115, 19, 'b16e720e9760ea565cfaca835559c187d025b7b66faf7e0c09cf2db209a5ed0e', '\"Varken bra eller dåligt\"', '2026-09-29 13:41:32'),
(116, 19, '2880b926f7a2f4a0c30dcdd36b81221c2d8e87c6f7b5a803d34285ca7779e440', '\"Varken bra eller dåligt\"', '2026-09-29 13:41:33'),
(117, 19, '8346387a1c9176b12bea69dac55e1d4156478d8ebd7fbaeecfb48cc460e9d714', '\"Bra\"', '2026-09-29 13:41:37'),
(118, 20, '1a1588ca5357b4df05750fcbc5ccc4c58ce6039d09fc1d7b79186908c19d6a14', '\"Mycket bra – jag har det jag behöver\"', '2026-09-29 13:42:16'),
(119, 20, 'a6e5a8b817b048048acbf4d6e3137a3adf499ce0e1d6168a750c1be5ebdbd07c', '\"Ganska dåligt – flera saker brist\"', '2026-09-29 13:42:18'),
(120, 20, '6b50ed5a4558d01dfa860bb6026b0a95e498b4ff0babbab24028cf50fe58cee8', '\"Ganska bra, med några brister\"', '2026-09-29 13:42:18'),
(121, 20, '0613e5ff7a19e54cc00c6870f9f21c72328d549f29c38bc97b47ab1be515ce85', '\"Ganska bra, med några brister\"', '2026-09-29 13:42:18'),
(122, 20, '5f99306135d36b22532bb3bb77d49f671c47369dd6a7466593b528bc6e9e011a', '\"Ganska bra, med några brister\"', '2026-09-29 13:42:19'),
(123, 20, '373f1f80d949ddfe84aca26d79052f1c112d9b5a70f72208b4b096a60e467fd9', '\"Ganska dåligt – flera saker brist\"', '2026-09-29 13:42:21'),
(124, 20, '1a696f24011588dff993d753d74a61ede4d64ee2fdf9a65247b23213dbbf86ef', '\"Mycket bra – jag har det jag behöver\"', '2026-09-29 13:42:22'),
(125, 20, 'b16e720e9760ea565cfaca835559c187d025b7b66faf7e0c09cf2db209a5ed0e', '\"Ganska bra, med några brister\"', '2026-09-29 13:42:22'),
(126, 20, 'feec331168a7e83374e4e8f8a6ad7b818bae12f2e8ae28690f442c143742f21c', '\"Ganska dåligt – flera saker brist\"', '2026-09-29 13:42:22'),
(127, 20, '70e4e316ff10a5117df480fffafb47ebbea803470bcf5833653d5c8fe4a65d4a', '\"Ganska bra, med några brister\"', '2026-09-29 13:42:22'),
(128, 20, '42c308981b496db34880bae733af929a4577e13f54af37a59204e1837a4bd385', '\"Ganska bra, med några brister\"', '2026-09-29 13:42:22'),
(129, 20, '4cb4cd43c82fb47c2d551eee2f44eb9b288034bdd549c19df254ad0170389484', '\"Ganska bra, med några brister\"', '2026-09-29 13:42:23'),
(130, 20, 'e53ac566515fcbeb6d8c6476a00bc2d9f1d1f67907eec0145c0b18d0c485fdae', '\"Ganska bra, med några brister\"', '2026-09-29 13:42:23'),
(131, 20, '462e3fcba723cb499bdcb166751f6fdba723c6664f411dd8409eb786fe7295cf', '\"Ganska dåligt – flera saker brist\"', '2026-09-29 13:42:24'),
(132, 20, '5ed8be04fd8a5914e6bdbc32b70e0887f0c4750764a2dfbd4938c6805d1478cd', '\"Ganska dåligt – flera saker brist\"', '2026-09-29 13:42:26'),
(133, 20, '6641bf697022dc394c6f2f776e3627696b0f73ebf014fbde05b107c393b17911', '\"Ganska bra, med några brister\"', '2026-09-29 13:42:26'),
(134, 20, '52d4d810eafff442c792c60591748c1d539656a7a56a6f9c91ee17a8ee09c81c', '\"Ganska bra, med några brister\"', '2026-09-29 13:42:27'),
(135, 20, 'ce9a43a1399b7768ef3cac0301fc5e3997f1b6addfdc286062f5f548c8e4d5ce', '\"Ganska bra, med några brister\"', '2026-09-29 13:42:28'),
(136, 20, '9ca0d647c316b5eee42f6caa6a5712570f0292cdc1c216a0a237f856d2ee0204', '\"Ganska bra, med några brister\"', '2026-09-29 13:42:28'),
(137, 20, '41e7b9b9520fbec1052a21a7bc05cb446e16917d780e43ccf1de987945b3d26a', '\"Ganska bra, med några brister\"', '2026-09-29 13:42:28'),
(138, 20, '94cd3828b5f9cd3b3869b6adfea97382e1e21e8d122bd073adffafce0367f48f', '\"Ganska bra, med några brister\"', '2026-09-29 13:42:30'),
(139, 20, 'daa29dd261e37cb5763c1a3c6aed79feb991a355700e712ca8a08b65024b665a', '\"Ganska dåligt – flera saker brist\"', '2026-09-29 13:42:30'),
(140, 20, 'acc8274f8a06e9414958316416b5001aab66f4465f28abec9395b1486293ecef', '\"Ganska bra, med några brister\"', '2026-09-29 13:42:32'),
(141, 20, '8346387a1c9176b12bea69dac55e1d4156478d8ebd7fbaeecfb48cc460e9d714', '\"Ganska bra, med några brister\"', '2026-09-29 13:42:33'),
(142, 20, '279dfaf7f88a63ea51d3527cb05f4b0f9c76e917aa5063260869566208de00b8', '\"Ganska bra, med några brister\"', '2026-09-29 13:42:34'),
(143, 20, '15ca4270e28b47623c95205a91c8a3b8da1f9d5ab2b2fee96fcd89212e82439f', '\"Mycket bra – jag har det jag behöver\"', '2026-09-29 13:42:34'),
(144, 20, '4ddf97591498308671d622c34afd5feabaa2448bd8618ddbccda0c510fe4945e', '\"Mycket bra – jag har det jag behöver\"', '2026-09-29 13:42:34'),
(145, 20, '2880b926f7a2f4a0c30dcdd36b81221c2d8e87c6f7b5a803d34285ca7779e440', '\"Ganska dåligt – flera saker brist\"', '2026-09-29 13:42:35'),
(146, 20, 'd0dd18ebe10c98ff0e85cccaf66d8d3d99bca7c026411fcce898783480e01e4c', '\"Ganska bra, med några brister\"', '2026-09-29 13:42:40'),
(147, 21, '4ddf97591498308671d622c34afd5feabaa2448bd8618ddbccda0c510fe4945e', '\"Mer tid för planering och förberedelser\"', '2026-09-29 13:44:41'),
(148, 21, 'daa29dd261e37cb5763c1a3c6aed79feb991a355700e712ca8a08b65024b665a', '\"Mer tid för planering och förberedelser\"', '2026-09-29 13:44:42'),
(149, 21, '5f99306135d36b22532bb3bb77d49f671c47369dd6a7466593b528bc6e9e011a', '\"Mer tid för planering och förberedelser\"', '2026-09-29 13:44:42'),
(150, 21, 'a6e5a8b817b048048acbf4d6e3137a3adf499ce0e1d6168a750c1be5ebdbd07c', '\"Mer tid för planering och förberedelser\"', '2026-09-29 13:44:42'),
(151, 21, '5ed8be04fd8a5914e6bdbc32b70e0887f0c4750764a2dfbd4938c6805d1478cd', '\"Mer tid för planering och förberedelser\"', '2026-09-29 13:44:43'),
(152, 21, '8346387a1c9176b12bea69dac55e1d4156478d8ebd7fbaeecfb48cc460e9d714', '\"Mer tid för planering och förberedelser\"', '2026-09-29 13:44:43'),
(153, 21, 'feec331168a7e83374e4e8f8a6ad7b818bae12f2e8ae28690f442c143742f21c', '\"Mer tid för planering och förberedelser\"', '2026-09-29 13:44:43'),
(154, 21, '0613e5ff7a19e54cc00c6870f9f21c72328d549f29c38bc97b47ab1be515ce85', '\"Mer tid för planering och förberedelser\"', '2026-09-29 13:44:44'),
(155, 21, '4cb4cd43c82fb47c2d551eee2f44eb9b288034bdd549c19df254ad0170389484', '\"Mer tid för planering och förberedelser\"', '2026-09-29 13:44:46'),
(156, 21, '42c308981b496db34880bae733af929a4577e13f54af37a59204e1837a4bd385', '\"Tydligare information och organisation\"', '2026-09-29 13:44:47'),
(157, 21, '2880b926f7a2f4a0c30dcdd36b81221c2d8e87c6f7b5a803d34285ca7779e440', '\"Mer tid för planering och förberedelser\"', '2026-09-29 13:44:48'),
(158, 21, '373f1f80d949ddfe84aca26d79052f1c112d9b5a70f72208b4b096a60e467fd9', '\"Mer tid för planering och förberedelser\"', '2026-09-29 13:44:49'),
(159, 21, 'd0dd18ebe10c98ff0e85cccaf66d8d3d99bca7c026411fcce898783480e01e4c', '\"Mer tid för planering och förberedelser\"', '2026-09-29 13:44:51'),
(160, 21, '52d4d810eafff442c792c60591748c1d539656a7a56a6f9c91ee17a8ee09c81c', '\"Mer tid för planering och förberedelser\"', '2026-09-29 13:44:52'),
(161, 21, 'acc8274f8a06e9414958316416b5001aab66f4465f28abec9395b1486293ecef', '\"Mer tid för planering och förberedelser\"', '2026-09-29 13:44:54'),
(162, 21, '15ca4270e28b47623c95205a91c8a3b8da1f9d5ab2b2fee96fcd89212e82439f', '\"Mer tid för planering och förberedelser\"', '2026-09-29 13:44:55'),
(163, 21, '279dfaf7f88a63ea51d3527cb05f4b0f9c76e917aa5063260869566208de00b8', '\"Mer tid för planering och förberedelser\"', '2026-09-29 13:44:56'),
(164, 21, '70e4e316ff10a5117df480fffafb47ebbea803470bcf5833653d5c8fe4a65d4a', '\"Mer tid för planering och förberedelser\"', '2026-09-29 13:44:57'),
(165, 21, 'ce9a43a1399b7768ef3cac0301fc5e3997f1b6addfdc286062f5f548c8e4d5ce', '\"Mer tid för planering och förberedelser\"', '2026-09-29 13:44:58'),
(166, 21, 'b16e720e9760ea565cfaca835559c187d025b7b66faf7e0c09cf2db209a5ed0e', '\"Tydligare information och organisation\"', '2026-09-29 13:45:03'),
(167, 21, '462e3fcba723cb499bdcb166751f6fdba723c6664f411dd8409eb786fe7295cf', '\"Mer stöd från kollegor\"', '2026-09-29 13:45:05'),
(168, 21, '41e7b9b9520fbec1052a21a7bc05cb446e16917d780e43ccf1de987945b3d26a', '\"Mer tid för planering och förberedelser\"', '2026-09-29 13:45:08'),
(169, 21, 'e53ac566515fcbeb6d8c6476a00bc2d9f1d1f67907eec0145c0b18d0c485fdae', '\"Tydligare information och organisation\"', '2026-09-29 13:45:09'),
(170, 21, '1a1588ca5357b4df05750fcbc5ccc4c58ce6039d09fc1d7b79186908c19d6a14', '\"Mer tid för planering och förberedelser\"', '2026-09-29 13:45:11'),
(171, 21, '6641bf697022dc394c6f2f776e3627696b0f73ebf014fbde05b107c393b17911', '\"Mer tid för planering och förberedelser\"', '2026-09-29 13:45:25'),
(172, 21, '9ca0d647c316b5eee42f6caa6a5712570f0292cdc1c216a0a237f856d2ee0204', '\"Tydligare information och organisation\"', '2026-09-29 13:45:33');

-- --------------------------------------------------------

--
-- Table structure for table `puls_auth_rate_limits`
--

CREATE TABLE `puls_auth_rate_limits` (
  `rate_key` char(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `attempts` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `reset_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `puls_auth_rate_limits`
--

INSERT INTO `puls_auth_rate_limits` (`rate_key`, `attempts`, `reset_at`) VALUES
('00232aae51e955983f13a8f606e6293ca32f92412a5d747a5efd51b4721773c1', 6, '2026-09-18 22:29:52'),
('03d05dbcaa33243068de53a04c06da66cb9474a313c15dd923067cf3720dbf24', 1, '2026-09-17 13:01:24'),
('299984cd35c5e40bddfd6325d7df4c969162cc179aa1da088779c2392107e8ba', 1, '2026-09-18 09:11:39'),
('37ea05505ef1b816b1818ac253e6aa7312f15c43d2600f04042fc5aa2d7957d4', 1, '2026-09-30 12:55:12'),
('4685e3b3543d7742979525feab180a7b0d505e5206ecfa3e7424855e9045e226', 1, '2026-09-19 11:10:46'),
('52a0a605b6ea23ff8fe28bada383ead84b216e8f9f49eb583773bbbc82092400', 1, '2026-09-30 12:16:49'),
('7a019af0731a1640e53d18a7524a0934b11499e0b131908ff9a09670cb65a1e5', 5, '2026-09-29 07:36:58'),
('96429e608244918dc292c33b7acd622e6c331a6f51023ab86c2657a03f2d485c', 1, '2026-09-17 12:55:41'),
('ad791f6d8fd401ef66cf72b24f72818c66f473b3b6112b06110e96b9e7897939', 1, '2026-09-30 12:16:49'),
('af8229bce77a1db4d65bf4a478faf9cb996d2e13b56dd3f883e2b33569947d72', 2, '2026-09-17 12:47:45'),
('c02fe6acb6ee361fcb38092e792fa6683df21361bb85551be623ca8b468d845b', 1, '2026-09-30 12:55:12'),
('c5d440bc9692e34d7a07590ccb970efbefdd365fb0cebaa1bab6b97037c8a55c', 1, '2026-09-17 12:15:29'),
('fc8afdac13d502f1a4f99b57d765f3b4900424ea55d0ad139968c6b44d9e4728', 1, '2026-09-18 09:59:45');

-- --------------------------------------------------------

--
-- Table structure for table `puls_questions`
--

CREATE TABLE `puls_questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` char(6) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `owner_hash` char(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `title` varchar(240) NOT NULL,
  `kind` varchar(16) NOT NULL,
  `options_json` text NOT NULL,
  `min_value` double NOT NULL DEFAULT 0,
  `max_value` double NOT NULL DEFAULT 10,
  `result_view` varchar(16) NOT NULL,
  `is_open` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `puls_questions`
--

INSERT INTO `puls_questions` (`id`, `code`, `owner_hash`, `title`, `kind`, `options_json`, `min_value`, `max_value`, `result_view`, `is_open`, `created_at`) VALUES
(3, '768326', '9b1196ac7802293acd58d6e48d97d37e1c113321951120f732824bcd60d0b6bb', '1. Hur upplever du din arbetsbelastning under en vanlig arbetsvecka?', 'choice', '[\"Klart för hög – jag hinner sällan med det jag ska\",\"Ganska hög, men hanterbar\",\"Lagom\",\"För låg\"]', 0, 10, 'pie', 1, '2026-09-17 12:20:37'),
(4, '407472', '9b1196ac7802293acd58d6e48d97d37e1c113321951120f732824bcd60d0b6bb', '2. Har du de förutsättningar du behöver för att hinna med planering, undervisning och administration inom din arbetstid?', 'choice', '[\"Ja, det fungerar bra\",\"Delvis – vissa delar går ihop, andra inte\",\"Nej, sällan\",\"Nej, aldrig\"]', 0, 10, 'bars', 1, '2026-09-17 12:20:37'),
(5, '344167', '9b1196ac7802293acd58d6e48d97d37e1c113321951120f732824bcd60d0b6bb', 'Hur upplever du stödet från skolledningen och kollegor?', 'choice', '[\"Bra\",\"Varken bra eller dåligt\",\"Dåligt\"]', 0, 10, 'pie', 1, '2026-09-17 12:20:37'),
(6, '186928', '9b1196ac7802293acd58d6e48d97d37e1c113321951120f732824bcd60d0b6bb', '4. Hur trivs du med de fysiska förutsättningarna i din arbetsmiljö (klassrum, arbetsrum, ljudnivå, ergonomi)?', 'choice', '[\"Mycket bra – jag har det jag behöver\",\"Ganska bra, med några brister\",\"Ganska dåligt – flera saker brist\"]', 0, 10, 'bars', 1, '2026-09-17 12:20:37'),
(7, '319554', '9b1196ac7802293acd58d6e48d97d37e1c113321951120f732824bcd60d0b6bb', 'Vad skulle främst förbättra din arbetsmiljö?', 'choice', '[\"Mer tid för planering och förberedelser\",\"Tydligare information och organisation\",\"Mer stöd från skolledning och\\/eller kollegor\"]', 0, 10, 'bars', 1, '2026-09-17 12:20:37'),
(8, '516848', 'cf55153b690bbbc2ec15aa600119529e9317c32b55ac46e649296018c5460080', 'Vilket datorspel på PC var det första du spelade?', 'sentence', '[]', 0, 10, 'cards', 1, '2026-09-18 08:59:45'),
(9, '394220', 'cf55153b690bbbc2ec15aa600119529e9317c32b55ac46e649296018c5460080', 'Vilken var ditt första Windows?', 'choice', '[\"Me\",\"XP\",\"Win 8\",\"Win 7\",\"Win 10\",\"Win 11\"]', 0, 10, 'bars', 1, '2026-09-18 08:59:45'),
(10, '861674', 'cf55153b690bbbc2ec15aa600119529e9317c32b55ac46e649296018c5460080', 'Vilken var din första konsoll?', 'word', '[]', 0, 10, 'cloud', 1, '2026-09-18 08:59:45'),
(11, '419216', 'cf55153b690bbbc2ec15aa600119529e9317c32b55ac46e649296018c5460080', 'Vilket datorspel på PC var det första du spelade?', 'sentence', '[]', 0, 10, 'cards', 1, '2026-09-18 21:29:52'),
(12, '533211', 'cf55153b690bbbc2ec15aa600119529e9317c32b55ac46e649296018c5460080', 'Vilken var ditt första Windows?', 'choice', '[\"Me\",\"XP\",\"Win 8\",\"Win 7\",\"Win 10\",\"Win 11\"]', 0, 10, 'bars', 1, '2026-09-18 21:29:52'),
(13, '838541', 'cf55153b690bbbc2ec15aa600119529e9317c32b55ac46e649296018c5460080', 'Vilken var din första konsoll?', 'word', '[]', 0, 10, 'cloud', 1, '2026-09-18 21:29:52'),
(14, '929381', 'cf55153b690bbbc2ec15aa600119529e9317c32b55ac46e649296018c5460080', 'Vilket datorspel på PC var det första du spelade?', 'sentence', '[]', 0, 10, 'cards', 1, '2026-09-18 21:30:43'),
(15, '256871', 'cf55153b690bbbc2ec15aa600119529e9317c32b55ac46e649296018c5460080', 'Vilken var ditt första Windows?', 'choice', '[\"Me\",\"XP\",\"Win 8\",\"Win 7\",\"Win 10\",\"Win 11\"]', 0, 10, 'bars', 1, '2026-09-18 21:30:43'),
(16, '135413', 'cf55153b690bbbc2ec15aa600119529e9317c32b55ac46e649296018c5460080', 'Vilken var din första konsoll?', 'word', '[]', 0, 10, 'cloud', 1, '2026-09-18 21:30:43'),
(17, '767674', '9b1196ac7802293acd58d6e48d97d37e1c113321951120f732824bcd60d0b6bb', '1. Hur upplever du din arbetsbelastning under en vanlig arbetsvecka?', 'choice', '[\"Klart för hög – jag hinner sällan med det jag ska\",\"Ganska hög, men hanterbar\",\"Lagom\",\"För låg\"]', 0, 10, 'pie', 1, '2026-09-29 06:36:58'),
(18, '175912', '9b1196ac7802293acd58d6e48d97d37e1c113321951120f732824bcd60d0b6bb', '2. Har du de förutsättningar du behöver för att hinna med planering, undervisning och administration inom din arbetstid?', 'choice', '[\"Ja, det fungerar bra\",\"Delvis – vissa delar går ihop, andra inte\",\"Nej, sällan\",\"Nej, aldrig\"]', 0, 10, 'pie', 1, '2026-09-29 06:36:58'),
(19, '315144', '9b1196ac7802293acd58d6e48d97d37e1c113321951120f732824bcd60d0b6bb', 'Hur upplever du stödet från skolledningen?', 'choice', '[\"Bra\",\"Varken bra eller dåligt\",\"Dåligt\"]', 0, 10, 'pie', 1, '2026-09-29 06:36:58'),
(20, '800820', '9b1196ac7802293acd58d6e48d97d37e1c113321951120f732824bcd60d0b6bb', '4. Hur trivs du med de fysiska förutsättningarna i din arbetsmiljö (klassrum, arbetsrum, ljudnivå, ergonomi)?', 'choice', '[\"Mycket bra – jag har det jag behöver\",\"Ganska bra, med några brister\",\"Ganska dåligt – flera saker brist\"]', 0, 10, 'pie', 1, '2026-09-29 06:36:58'),
(21, '781193', '9b1196ac7802293acd58d6e48d97d37e1c113321951120f732824bcd60d0b6bb', 'Vad skulle främst förbättra din arbetsmiljö?', 'choice', '[\"Mer tid för planering och förberedelser\",\"Tydligare information och organisation\",\"Mer stöd från skolledning\",\"Mer stöd från kollegor\"]', 0, 10, 'pie', 1, '2026-09-29 06:36:58');

-- --------------------------------------------------------

--
-- Table structure for table `puls_question_designs`
--

CREATE TABLE `puls_question_designs` (
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `design_json` text NOT NULL,
  `version` char(32) CHARACTER SET ascii COLLATE ascii_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `puls_question_design_assets`
--

CREATE TABLE `puls_question_design_assets` (
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `slot` varchar(16) NOT NULL,
  `mime` varchar(32) NOT NULL,
  `content` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `puls_question_sets`
--

CREATE TABLE `puls_question_sets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(240) NOT NULL,
  `progression` varchar(16) NOT NULL,
  `current_position` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_open` tinyint(1) NOT NULL DEFAULT 1,
  `finished` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `puls_question_sets`
--

INSERT INTO `puls_question_sets` (`id`, `title`, `progression`, `current_position`, `is_open`, `finished`) VALUES
(3, 'Arbetsmiljö', 'host', 4, 0, 1),
(8, 'Datorhistoria', 'automatic', 0, 1, 0),
(11, 'Datorhistoria', 'automatic', 0, 0, 0),
(14, 'Datorhistoria', 'automatic', 0, 0, 0),
(17, 'Arbetsmiljö', 'host', 4, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `puls_saved_items`
--

CREATE TABLE `puls_saved_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `owner_hash` char(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `item_type` varchar(16) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `title` varchar(240) NOT NULL,
  `data_json` mediumtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `puls_saved_items`
--

INSERT INTO `puls_saved_items` (`id`, `owner_hash`, `item_type`, `title`, `data_json`, `created_at`, `updated_at`) VALUES
(1, 'cf55153b690bbbc2ec15aa600119529e9317c32b55ac46e649296018c5460080', 'set', 'Datorhistoria', '{\"title\":\"Datorhistoria\",\"progression\":\"automatic\",\"questions\":[{\"title\":\"Vilket datorspel på PC var det första du spelade?\",\"kind\":\"sentence\",\"options\":[],\"min\":0,\"max\":10,\"view\":\"cards\"},{\"title\":\"Vilken var ditt första Windows?\",\"kind\":\"choice\",\"options\":[\"Me\",\"XP\",\"Win 8\",\"Win 7\",\"Win 10\",\"Win 11\"],\"min\":0,\"max\":10,\"view\":\"bars\"},{\"title\":\"Vilken var din första konsoll?\",\"kind\":\"word\",\"options\":[],\"min\":0,\"max\":10,\"view\":\"cloud\"}],\"design\":{\"colors\":null,\"images\":{\"background\":null,\"foreground\":null,\"logo\":null}}}', '2026-09-18 21:29:30', '2026-09-18 21:29:48'),
(2, '9b1196ac7802293acd58d6e48d97d37e1c113321951120f732824bcd60d0b6bb', 'set', 'Arbetsmiljö', '{\"title\":\"Arbetsmiljö\",\"progression\":\"host\",\"questions\":[{\"title\":\"1. Hur upplever du din arbetsbelastning under en vanlig arbetsvecka?\",\"kind\":\"choice\",\"options\":[\"Klart för hög – jag hinner sällan med det jag ska\",\"Ganska hög, men hanterbar\",\"Lagom\",\"För låg\"],\"min\":0,\"max\":10,\"view\":\"pie\"},{\"title\":\"2. Har du de förutsättningar du behöver för att hinna med planering, undervisning och administration inom din arbetstid?\",\"kind\":\"choice\",\"options\":[\"Ja, det fungerar bra\",\"Delvis – vissa delar går ihop, andra inte\",\"Nej, sällan\",\"Nej, aldrig\"],\"min\":0,\"max\":10,\"view\":\"pie\"},{\"title\":\"Hur upplever du stödet från skolledningen?\",\"kind\":\"choice\",\"options\":[\"Bra\",\"Varken bra eller dåligt\",\"Dåligt\"],\"min\":0,\"max\":10,\"view\":\"pie\"},{\"title\":\"4. Hur trivs du med de fysiska förutsättningarna i din arbetsmiljö (klassrum, arbetsrum, ljudnivå, ergonomi)?\",\"kind\":\"choice\",\"options\":[\"Mycket bra – jag har det jag behöver\",\"Ganska bra, med några brister\",\"Ganska dåligt – flera saker brist\"],\"min\":0,\"max\":10,\"view\":\"pie\"},{\"title\":\"Vad skulle främst förbättra din arbetsmiljö?\",\"kind\":\"choice\",\"options\":[\"Mer tid för planering och förberedelser\",\"Tydligare information och organisation\",\"Mer stöd från skolledning\",\"Mer stöd från kollegor\"],\"min\":0,\"max\":10,\"view\":\"pie\"}],\"design\":{\"colors\":{\"background\":\"#a8e1ae\",\"surface\":\"#e5d2d2\",\"text\":\"#173d2a\",\"primary\":\"#276847\"},\"images\":{\"background\":null,\"foreground\":null,\"logo\":null}}}', '2026-09-29 06:32:30', '2026-09-29 06:35:35');

-- --------------------------------------------------------

--
-- Table structure for table `puls_saved_item_runs`
--

CREATE TABLE `puls_saved_item_runs` (
  `saved_item_id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `puls_saved_item_runs`
--

INSERT INTO `puls_saved_item_runs` (`saved_item_id`, `question_id`) VALUES
(1, 8),
(1, 11),
(1, 14),
(2, 3),
(2, 17);

-- --------------------------------------------------------

--
-- Table structure for table `puls_set_designs`
--

CREATE TABLE `puls_set_designs` (
  `set_id` bigint(20) UNSIGNED NOT NULL,
  `design_json` text NOT NULL,
  `version` char(32) CHARACTER SET ascii COLLATE ascii_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `puls_set_designs`
--

INSERT INTO `puls_set_designs` (`set_id`, `design_json`, `version`) VALUES
(3, '{\"colors\":{\"background\":\"#a8e1ae\",\"surface\":\"#e5d2d2\",\"text\":\"#173d2a\",\"primary\":\"#276847\"},\"images\":[]}', '5b1eb4d79524573d15937e01bb40c1dc'),
(8, '{\"colors\":null,\"images\":[]}', '1891e50a0ad0377fb1db8544473c9b7f'),
(11, '{\"colors\":null,\"images\":[]}', '167b4d05d890a55760fca316c78a0c0a'),
(14, '{\"colors\":null,\"images\":[]}', '7532871e70939ed8d7aad47e70b85f2b'),
(17, '{\"colors\":{\"background\":\"#a8e1ae\",\"surface\":\"#e5d2d2\",\"text\":\"#173d2a\",\"primary\":\"#276847\"},\"images\":[]}', '35d8df425f098c6102657bc6fd0bd1cf');

-- --------------------------------------------------------

--
-- Table structure for table `puls_set_design_assets`
--

CREATE TABLE `puls_set_design_assets` (
  `set_id` bigint(20) UNSIGNED NOT NULL,
  `slot` varchar(16) NOT NULL,
  `mime` varchar(32) NOT NULL,
  `content` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `puls_set_questions`
--

CREATE TABLE `puls_set_questions` (
  `set_id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `position` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `puls_set_questions`
--

INSERT INTO `puls_set_questions` (`set_id`, `question_id`, `position`) VALUES
(3, 3, 0),
(3, 4, 1),
(3, 5, 2),
(3, 6, 3),
(3, 7, 4),
(8, 8, 0),
(8, 9, 1),
(8, 10, 2),
(11, 11, 0),
(11, 12, 1),
(11, 13, 2),
(14, 14, 0),
(14, 15, 1),
(14, 16, 2),
(17, 17, 0),
(17, 18, 1),
(17, 19, 2),
(17, 20, 3),
(17, 21, 4);

-- --------------------------------------------------------

--
-- Table structure for table `puls_users`
--

CREATE TABLE `puls_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(80) NOT NULL,
  `email` varchar(254) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `password_hash` varchar(255) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `owner_hash` char(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `theme_json` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `puls_users`
--

INSERT INTO `puls_users` (`id`, `name`, `email`, `password_hash`, `owner_hash`, `theme_json`, `created_at`) VALUES
(1, 'Charlie Jarl', 'charlie.jarl@gmail.com', '$2y$12$viR9MvC.piDMYp.cpbjrZOcrtvz0EDGEy1HQhrcQuihCvpKYKwYpq', 'cf55153b690bbbc2ec15aa600119529e9317c32b55ac46e649296018c5460080', NULL, '2026-09-17 11:15:30'),
(2, 'Armelana Catovic', 'armelana.catovic@karlskoga.se', '$2y$12$ph5Q8kZ6QUw7qqhJvrhrzeOVSypx1rmdUGZvhRwp6rhUHAkmLpbkC', '9b1196ac7802293acd58d6e48d97d37e1c113321951120f732824bcd60d0b6bb', NULL, '2026-09-17 11:55:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ch_accounts`
--
ALTER TABLE `ch_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_accounts_username` (`username`);

--
-- Indexes for table `ch_matches`
--
ALTER TABLE `ch_matches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_matches_created_at` (`created_at`);

--
-- Indexes for table `ch_player_stats`
--
ALTER TABLE `ch_player_stats`
  ADD PRIMARY KEY (`account_id`,`player_name`);

--
-- Indexes for table `ch_turns`
--
ALTER TABLE `ch_turns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_turns_match_id` (`match_id`);

--
-- Indexes for table `ch_users`
--
ALTER TABLE `ch_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_users_name` (`name`);

--
-- Indexes for table `fire_series`
--
ALTER TABLE `fire_series`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_series_session_number` (`session_id`,`series_number`),
  ADD KEY `idx_series_session` (`session_id`),
  ADD KEY `idx_series_score` (`total_score`);

--
-- Indexes for table `fire_shooting_sessions`
--
ALTER TABLE `fire_shooting_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_sessions_user_date` (`user_id`,`session_date`),
  ADD KEY `idx_sessions_weapon` (`weapon_id`);

--
-- Indexes for table `fire_users`
--
ALTER TABLE `fire_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `fire_weapons`
--
ALTER TABLE `fire_weapons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_weapons_user` (`user_id`);

--
-- Indexes for table `jolt_answers`
--
ALTER TABLE `jolt_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `jolt_games`
--
ALTER TABLE `jolt_games`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `quiz_id` (`quiz_id`),
  ADD KEY `host_user_id` (`host_user_id`),
  ADD KEY `code_2` (`code`,`status`);

--
-- Indexes for table `jolt_game_questions`
--
ALTER TABLE `jolt_game_questions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `game_id` (`game_id`,`position`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `game_id_2` (`game_id`,`question_id`);

--
-- Indexes for table `jolt_players`
--
ALTER TABLE `jolt_players`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD UNIQUE KEY `game_id` (`game_id`,`name`);

--
-- Indexes for table `jolt_questions`
--
ALTER TABLE `jolt_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_id` (`quiz_id`,`position`);

--
-- Indexes for table `jolt_quizzes`
--
ALTER TABLE `jolt_quizzes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `jolt_responses`
--
ALTER TABLE `jolt_responses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `player_id` (`player_id`,`question_id`),
  ADD KEY `game_id` (`game_id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `jolt_users`
--
ALTER TABLE `jolt_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `jolt_walking_jolts`
--
ALTER TABLE `jolt_walking_jolts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `quiz_id` (`quiz_id`),
  ADD KEY `host_user_id` (`host_user_id`),
  ADD KEY `code_2` (`code`,`status`);

--
-- Indexes for table `jolt_walking_players`
--
ALTER TABLE `jolt_walking_players`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD UNIQUE KEY `walking_jolt_id` (`walking_jolt_id`,`name`);

--
-- Indexes for table `jolt_walking_responses`
--
ALTER TABLE `jolt_walking_responses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `player_id` (`player_id`,`question_id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `answer_id` (`answer_id`);

--
-- Indexes for table `jolt_walking_unlocks`
--
ALTER TABLE `jolt_walking_unlocks`
  ADD PRIMARY KEY (`player_id`,`question_id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `memeuser`
--
ALTER TABLE `memeuser`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `memeuser_username_unique` (`username`);

--
-- Indexes for table `molkky_games`
--
ALTER TABLE `molkky_games`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_created_at` (`user_id`,`created_at`),
  ADD KEY `player_key_created_at` (`player_key`,`created_at`);

--
-- Indexes for table `molkky_users`
--
ALTER TABLE `molkky_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `puls_answers`
--
ALTER TABLE `puls_answers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_answers_question_voter` (`question_id`,`voter_hash`),
  ADD KEY `idx_answers_question_id` (`question_id`,`id`);

--
-- Indexes for table `puls_auth_rate_limits`
--
ALTER TABLE `puls_auth_rate_limits`
  ADD PRIMARY KEY (`rate_key`),
  ADD KEY `idx_auth_rate_reset` (`reset_at`);

--
-- Indexes for table `puls_questions`
--
ALTER TABLE `puls_questions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_questions_code` (`code`),
  ADD KEY `idx_questions_owner_created` (`owner_hash`,`created_at`);

--
-- Indexes for table `puls_question_designs`
--
ALTER TABLE `puls_question_designs`
  ADD PRIMARY KEY (`question_id`);

--
-- Indexes for table `puls_question_design_assets`
--
ALTER TABLE `puls_question_design_assets`
  ADD PRIMARY KEY (`question_id`,`slot`);

--
-- Indexes for table `puls_question_sets`
--
ALTER TABLE `puls_question_sets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `puls_saved_items`
--
ALTER TABLE `puls_saved_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_saved_items_owner_updated` (`owner_hash`,`updated_at`);

--
-- Indexes for table `puls_saved_item_runs`
--
ALTER TABLE `puls_saved_item_runs`
  ADD PRIMARY KEY (`saved_item_id`,`question_id`),
  ADD UNIQUE KEY `uq_saved_item_run_question` (`question_id`);

--
-- Indexes for table `puls_set_designs`
--
ALTER TABLE `puls_set_designs`
  ADD PRIMARY KEY (`set_id`);

--
-- Indexes for table `puls_set_design_assets`
--
ALTER TABLE `puls_set_design_assets`
  ADD PRIMARY KEY (`set_id`,`slot`);

--
-- Indexes for table `puls_set_questions`
--
ALTER TABLE `puls_set_questions`
  ADD PRIMARY KEY (`set_id`,`position`),
  ADD UNIQUE KEY `uq_set_question` (`question_id`);

--
-- Indexes for table `puls_users`
--
ALTER TABLE `puls_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_users_email` (`email`),
  ADD UNIQUE KEY `uq_users_owner` (`owner_hash`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ch_accounts`
--
ALTER TABLE `ch_accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ch_matches`
--
ALTER TABLE `ch_matches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `ch_turns`
--
ALTER TABLE `ch_turns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=339;

--
-- AUTO_INCREMENT for table `ch_users`
--
ALTER TABLE `ch_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `fire_series`
--
ALTER TABLE `fire_series`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fire_shooting_sessions`
--
ALTER TABLE `fire_shooting_sessions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `fire_users`
--
ALTER TABLE `fire_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fire_weapons`
--
ALTER TABLE `fire_weapons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `jolt_answers`
--
ALTER TABLE `jolt_answers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `jolt_games`
--
ALTER TABLE `jolt_games`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `jolt_game_questions`
--
ALTER TABLE `jolt_game_questions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `jolt_players`
--
ALTER TABLE `jolt_players`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jolt_questions`
--
ALTER TABLE `jolt_questions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jolt_quizzes`
--
ALTER TABLE `jolt_quizzes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jolt_responses`
--
ALTER TABLE `jolt_responses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jolt_users`
--
ALTER TABLE `jolt_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jolt_walking_jolts`
--
ALTER TABLE `jolt_walking_jolts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jolt_walking_players`
--
ALTER TABLE `jolt_walking_players`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jolt_walking_responses`
--
ALTER TABLE `jolt_walking_responses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `memeuser`
--
ALTER TABLE `memeuser`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `molkky_games`
--
ALTER TABLE `molkky_games`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `molkky_users`
--
ALTER TABLE `molkky_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `puls_answers`
--
ALTER TABLE `puls_answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173;

--
-- AUTO_INCREMENT for table `puls_questions`
--
ALTER TABLE `puls_questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `puls_saved_items`
--
ALTER TABLE `puls_saved_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `puls_users`
--
ALTER TABLE `puls_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ch_player_stats`
--
ALTER TABLE `ch_player_stats`
  ADD CONSTRAINT `fk_player_stats_account` FOREIGN KEY (`account_id`) REFERENCES `ch_accounts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ch_turns`
--
ALTER TABLE `ch_turns`
  ADD CONSTRAINT `fk_turns_match` FOREIGN KEY (`match_id`) REFERENCES `ch_matches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fire_series`
--
ALTER TABLE `fire_series`
  ADD CONSTRAINT `fire_series_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `fire_shooting_sessions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fire_shooting_sessions`
--
ALTER TABLE `fire_shooting_sessions`
  ADD CONSTRAINT `fire_shooting_sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `fire_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fire_shooting_sessions_ibfk_2` FOREIGN KEY (`weapon_id`) REFERENCES `fire_weapons` (`id`);

--
-- Constraints for table `fire_weapons`
--
ALTER TABLE `fire_weapons`
  ADD CONSTRAINT `fire_weapons_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `fire_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `jolt_answers`
--
ALTER TABLE `jolt_answers`
  ADD CONSTRAINT `jolt_answers_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `jolt_questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `jolt_games`
--
ALTER TABLE `jolt_games`
  ADD CONSTRAINT `jolt_games_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `jolt_quizzes` (`id`),
  ADD CONSTRAINT `jolt_games_ibfk_2` FOREIGN KEY (`host_user_id`) REFERENCES `jolt_users` (`id`);

--
-- Constraints for table `jolt_game_questions`
--
ALTER TABLE `jolt_game_questions`
  ADD CONSTRAINT `jolt_game_questions_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `jolt_games` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jolt_game_questions_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `jolt_questions` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `jolt_players`
--
ALTER TABLE `jolt_players`
  ADD CONSTRAINT `jolt_players_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `jolt_games` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `jolt_questions`
--
ALTER TABLE `jolt_questions`
  ADD CONSTRAINT `jolt_questions_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `jolt_quizzes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `jolt_quizzes`
--
ALTER TABLE `jolt_quizzes`
  ADD CONSTRAINT `jolt_quizzes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `jolt_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `jolt_responses`
--
ALTER TABLE `jolt_responses`
  ADD CONSTRAINT `jolt_responses_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `jolt_games` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jolt_responses_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `jolt_players` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jolt_responses_ibfk_3` FOREIGN KEY (`question_id`) REFERENCES `jolt_questions` (`id`);

--
-- Constraints for table `jolt_walking_jolts`
--
ALTER TABLE `jolt_walking_jolts`
  ADD CONSTRAINT `jolt_walking_jolts_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `jolt_quizzes` (`id`),
  ADD CONSTRAINT `jolt_walking_jolts_ibfk_2` FOREIGN KEY (`host_user_id`) REFERENCES `jolt_users` (`id`);

--
-- Constraints for table `jolt_walking_players`
--
ALTER TABLE `jolt_walking_players`
  ADD CONSTRAINT `jolt_walking_players_ibfk_1` FOREIGN KEY (`walking_jolt_id`) REFERENCES `jolt_walking_jolts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `jolt_walking_responses`
--
ALTER TABLE `jolt_walking_responses`
  ADD CONSTRAINT `jolt_walking_responses_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `jolt_walking_players` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jolt_walking_responses_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `jolt_questions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jolt_walking_responses_ibfk_3` FOREIGN KEY (`answer_id`) REFERENCES `jolt_answers` (`id`);

--
-- Constraints for table `jolt_walking_unlocks`
--
ALTER TABLE `jolt_walking_unlocks`
  ADD CONSTRAINT `jolt_walking_unlocks_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `jolt_walking_players` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jolt_walking_unlocks_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `jolt_questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `molkky_games`
--
ALTER TABLE `molkky_games`
  ADD CONSTRAINT `fk_molkky_games_user` FOREIGN KEY (`user_id`) REFERENCES `molkky_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `puls_answers`
--
ALTER TABLE `puls_answers`
  ADD CONSTRAINT `puls_fk_answers_question` FOREIGN KEY (`question_id`) REFERENCES `puls_questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `puls_question_designs`
--
ALTER TABLE `puls_question_designs`
  ADD CONSTRAINT `puls_fk_question_design` FOREIGN KEY (`question_id`) REFERENCES `puls_questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `puls_question_design_assets`
--
ALTER TABLE `puls_question_design_assets`
  ADD CONSTRAINT `puls_fk_question_design_asset` FOREIGN KEY (`question_id`) REFERENCES `puls_questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `puls_question_sets`
--
ALTER TABLE `puls_question_sets`
  ADD CONSTRAINT `puls_fk_sets_root` FOREIGN KEY (`id`) REFERENCES `puls_questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `puls_saved_item_runs`
--
ALTER TABLE `puls_saved_item_runs`
  ADD CONSTRAINT `puls_fk_saved_run_item` FOREIGN KEY (`saved_item_id`) REFERENCES `puls_saved_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `puls_fk_saved_run_question` FOREIGN KEY (`question_id`) REFERENCES `puls_questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `puls_set_designs`
--
ALTER TABLE `puls_set_designs`
  ADD CONSTRAINT `puls_fk_set_design` FOREIGN KEY (`set_id`) REFERENCES `puls_question_sets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `puls_set_design_assets`
--
ALTER TABLE `puls_set_design_assets`
  ADD CONSTRAINT `puls_fk_set_design_asset` FOREIGN KEY (`set_id`) REFERENCES `puls_question_sets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `puls_set_questions`
--
ALTER TABLE `puls_set_questions`
  ADD CONSTRAINT `puls_fk_set_questions_question` FOREIGN KEY (`question_id`) REFERENCES `puls_questions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `puls_fk_set_questions_set` FOREIGN KEY (`set_id`) REFERENCES `puls_question_sets` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
