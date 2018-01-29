-- phpMyAdmin SQL Dump
-- version 4.0.10.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 29, 2018 at 12:18 PM
-- Server version: 5.5.41-log
-- PHP Version: 5.4.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `platform-laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `confirms`
--

CREATE TABLE IF NOT EXISTS `confirms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `token` text COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `directions`
--

CREATE TABLE IF NOT EXISTS `directions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `direction_skill`
--

CREATE TABLE IF NOT EXISTS `direction_skill` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `direction_id` int(10) unsigned NOT NULL,
  `skill_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `direction_skill_direction_id_foreign` (`direction_id`),
  KEY `direction_skill_skill_id_foreign` (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `followers`
--

CREATE TABLE IF NOT EXISTS `followers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `follower_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `graph_skill`
--

CREATE TABLE IF NOT EXISTS `graph_skill` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_skill` int(10) unsigned DEFAULT NULL,
  `related_skill` int(10) unsigned NOT NULL,
  `weight` int(11) DEFAULT NULL,
  `last_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `related_skill` (`related_skill`),
  KEY `parent_skill` (`parent_skill`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `graph_skill`
--

INSERT INTO `graph_skill` (`id`, `parent_skill`, `related_skill`, `weight`, `last_date`, `created_at`, `updated_at`) VALUES
(1, NULL, 2, NULL, NULL, '2018-01-24 09:38:05', NULL),
(2, NULL, 3, NULL, NULL, '2018-01-24 09:38:10', NULL),
(3, NULL, 4, NULL, NULL, '2018-01-24 09:38:13', NULL),
(4, NULL, 5, NULL, NULL, '2018-01-24 09:38:16', NULL),
(5, NULL, 6, NULL, NULL, '2018-01-24 09:38:19', NULL),
(6, NULL, 2, NULL, NULL, '2018-01-29 08:55:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `graph_skill_vacancies`
--

CREATE TABLE IF NOT EXISTS `graph_skill_vacancies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `graph_skill_id` int(10) unsigned NOT NULL,
  `vacancy_id` int(10) unsigned NOT NULL,
  `last_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `graph_skill_vacancies_graph_skill_id_foreign` (`graph_skill_id`),
  KEY `graph_skill_vacancies_vacancy_id_foreign` (`vacancy_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- Dumping data for table `graph_skill_vacancies`
--

INSERT INTO `graph_skill_vacancies` (`id`, `graph_skill_id`, `vacancy_id`, `last_date`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL, NULL),
(3, 2, 1, NULL, '2018-01-23 22:00:00', NULL),
(4, 1, 2, NULL, '2018-01-23 22:00:00', NULL),
(5, 2, 2, NULL, NULL, NULL),
(6, 1, 3, NULL, NULL, NULL),
(7, 4, 3, NULL, NULL, NULL),
(8, 1, 4, NULL, NULL, NULL),
(9, 5, 4, NULL, NULL, NULL),
(10, 3, 5, NULL, NULL, NULL),
(11, 5, 5, NULL, NULL, NULL),
(12, 2, 6, NULL, NULL, NULL),
(13, 4, 6, NULL, NULL, NULL),
(14, 1, 7, NULL, NULL, NULL),
(15, 4, 7, NULL, NULL, NULL),
(16, 6, 6, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `materials`
--

CREATE TABLE IF NOT EXISTS `materials` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `skill_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `materials`
--

INSERT INTO `materials` (`id`, `skill_id`, `title`, `text`, `created_at`, `updated_at`) VALUES
(7, 1, 'test-title-put', 'test-text-put', '2018-01-23 12:52:32', '2018-01-23 12:52:32');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=15 ;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_01_21_115946_create_follower_table', 1),
(4, '2018_01_21_122108_create_notifications_table', 1),
(5, '2018_01_21_122739_create_confirms_table', 1),
(6, '2018_01_21_122829_create_directions_table', 1),
(7, '2018_01_21_122916_create_skills_table', 1),
(8, '2018_01_21_123002_create_materials_table', 1),
(9, '2018_01_21_123029_create_progress_table', 1),
(10, '2018_01_21_123502_create_vacancies_table', 1),
(11, '2018_01_21_123524_create_user_skill_table', 1),
(12, '2018_01_21_123741_create_direction_skill_table', 1),
(13, '2018_01_21_123815_create_graph_skill_table', 1),
(14, '2018_01_21_123836_create_graph_skill_vacancies_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `progress`
--

CREATE TABLE IF NOT EXISTS `progress` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `material_id` int(10) unsigned NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `progress_user_id_foreign` (`user_id`),
  KEY `progress_material_id_foreign` (`material_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `reporting`
--

CREATE TABLE IF NOT EXISTS `reporting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skill` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE IF NOT EXISTS `skills` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `difficulty` int(11) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`id`, `title`, `image`, `difficulty`, `description`, `created_at`, `updated_at`) VALUES
(2, 'SQL', NULL, NULL, NULL, '2018-01-24 09:28:10', NULL),
(3, 'Java', NULL, NULL, NULL, '2018-01-24 09:28:16', NULL),
(4, 'PHP', NULL, NULL, NULL, '2018-01-24 09:28:22', NULL),
(5, '.NET', NULL, NULL, NULL, '2018-01-24 09:28:29', NULL),
(6, 'Ruby', NULL, NULL, NULL, '2018-01-24 09:28:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bio` text COLLATE utf8_unicode_ci,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'user',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_skill`
--

CREATE TABLE IF NOT EXISTS `user_skill` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `skill_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_skill_user_id_foreign` (`user_id`),
  KEY `user_skill_skill_id_foreign` (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vacancies`
--

CREATE TABLE IF NOT EXISTS `vacancies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `link` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `vacancies`
--

INSERT INTO `vacancies` (`id`, `link`, `created_at`, `updated_at`) VALUES
(1, 'work.ua/1234', '2018-01-24 09:35:37', NULL),
(2, 'hh.com/3232', '2018-01-24 09:35:45', NULL),
(3, 'work.ua/4562', '2018-01-24 09:35:53', NULL),
(4, 'hh.com/3435', '2018-01-24 09:36:02', NULL),
(5, 'work.ua/5389', '2018-01-26 09:33:48', NULL),
(6, 'work.ua/4858', '2018-01-26 09:33:56', NULL),
(7, 'hh.com/3450', '2018-01-26 09:34:08', NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `direction_skill`
--
ALTER TABLE `direction_skill`
  ADD CONSTRAINT `direction_skill_direction_id_foreign` FOREIGN KEY (`direction_id`) REFERENCES `directions` (`id`),
  ADD CONSTRAINT `direction_skill_skill_id_foreign` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`id`);

--
-- Constraints for table `graph_skill`
--
ALTER TABLE `graph_skill`
  ADD CONSTRAINT `graph_skill_ibfk_1` FOREIGN KEY (`parent_skill`) REFERENCES `skills` (`id`),
  ADD CONSTRAINT `graph_skill_ibfk_2` FOREIGN KEY (`related_skill`) REFERENCES `skills` (`id`);

--
-- Constraints for table `graph_skill_vacancies`
--
ALTER TABLE `graph_skill_vacancies`
  ADD CONSTRAINT `graph_skill_vacancies_graph_skill_id_foreign` FOREIGN KEY (`graph_skill_id`) REFERENCES `graph_skill` (`id`),
  ADD CONSTRAINT `graph_skill_vacancies_vacancy_id_foreign` FOREIGN KEY (`vacancy_id`) REFERENCES `vacancies` (`id`);

--
-- Constraints for table `progress`
--
ALTER TABLE `progress`
  ADD CONSTRAINT `progress_material_id_foreign` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`),
  ADD CONSTRAINT `progress_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_skill`
--
ALTER TABLE `user_skill`
  ADD CONSTRAINT `user_skill_skill_id_foreign` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`id`),
  ADD CONSTRAINT `user_skill_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
