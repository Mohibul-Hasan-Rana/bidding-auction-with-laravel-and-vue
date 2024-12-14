-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 13, 2024 at 03:01 PM
-- Server version: 8.0.30
-- PHP Version: 8.3.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `auction`
--

-- --------------------------------------------------------

--
-- Table structure for table `auctions`
--

CREATE TABLE `auctions` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `retail_price` decimal(10,2) NOT NULL,
  `current_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `current_bidder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_time` timestamp NOT NULL,
  `status` enum('active','completed','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `auctions`
--

INSERT INTO `auctions` (`id`, `title`, `description`, `retail_price`, `current_price`, `current_bidder`, `end_time`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Netflix', NULL, 100.00, 53.00, 'Mohibul', '2024-12-30 01:31:29', 'active', NULL, '2024-12-12 20:13:38'),
(2, 'Youtube', NULL, 200.00, 48.00, 'Mohibul', '2024-12-30 01:32:13', 'active', NULL, '2024-12-12 20:13:34');

-- --------------------------------------------------------

--
-- Table structure for table `bids`
--

CREATE TABLE `bids` (
  `id` bigint UNSIGNED NOT NULL,
  `auction_id` bigint UNSIGNED NOT NULL,
  `bidder_id` bigint NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bids`
--

INSERT INTO `bids` (`id`, `auction_id`, `bidder_id`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 33.00, '2024-12-12 03:52:34', '2024-12-12 03:52:34'),
(2, 1, 1, 34.00, '2024-12-12 03:52:43', '2024-12-12 03:52:43'),
(3, 1, 1, 35.00, '2024-12-12 03:54:08', '2024-12-12 03:54:08'),
(4, 1, 1, 36.00, '2024-12-12 03:58:50', '2024-12-12 03:58:50'),
(5, 2, 1, 35.00, '2024-12-12 03:59:09', '2024-12-12 03:59:09'),
(6, 2, 1, 36.00, '2024-12-12 03:59:13', '2024-12-12 03:59:13'),
(7, 2, 1, 37.00, '2024-12-12 03:59:18', '2024-12-12 03:59:18'),
(8, 2, 1, 38.00, '2024-12-12 03:59:23', '2024-12-12 03:59:23'),
(9, 1, 1, 37.00, '2024-12-12 03:59:25', '2024-12-12 03:59:25'),
(10, 1, 1, 38.00, '2024-12-12 03:59:27', '2024-12-12 03:59:27'),
(11, 1, 1, 39.00, '2024-12-12 04:17:07', '2024-12-12 04:17:07'),
(12, 2, 1, 39.00, '2024-12-12 04:17:10', '2024-12-12 04:17:10'),
(13, 2, 1, 40.00, '2024-12-12 04:24:48', '2024-12-12 04:24:48'),
(14, 1, 1, 41.00, '2024-12-12 04:27:55', '2024-12-12 04:27:55'),
(15, 1, 1, 42.00, '2024-12-12 04:29:04', '2024-12-12 04:29:04'),
(16, 1, 1, 43.00, '2024-12-12 04:29:51', '2024-12-12 04:29:51'),
(17, 1, 1, 44.00, '2024-12-12 04:30:52', '2024-12-12 04:30:52'),
(18, 1, 1, 45.00, '2024-12-12 12:51:07', '2024-12-12 12:51:07'),
(19, 2, 1, 41.00, '2024-12-12 12:51:14', '2024-12-12 12:51:14'),
(20, 1, 1, 46.00, '2024-12-12 12:52:50', '2024-12-12 12:52:50'),
(21, 2, 1, 42.00, '2024-12-12 12:54:04', '2024-12-12 12:54:04'),
(22, 2, 1, 43.00, '2024-12-12 12:54:45', '2024-12-12 12:54:45'),
(23, 1, 1, 47.00, '2024-12-12 13:10:33', '2024-12-12 13:10:33'),
(24, 1, 1, 47.00, '2024-12-12 13:10:33', '2024-12-12 13:10:33'),
(25, 1, 1, 48.00, '2024-12-12 13:10:50', '2024-12-12 13:10:50'),
(26, 2, 1, 44.00, '2024-12-12 13:10:52', '2024-12-12 13:10:52'),
(27, 1, 1, 49.00, '2024-12-12 13:10:58', '2024-12-12 13:10:58'),
(28, 1, 1, 50.00, '2024-12-12 20:03:58', '2024-12-12 20:03:58'),
(29, 2, 1, 45.00, '2024-12-12 20:04:18', '2024-12-12 20:04:18'),
(30, 1, 1, 51.00, '2024-12-12 20:13:07', '2024-12-12 20:13:07'),
(31, 2, 1, 46.00, '2024-12-12 20:13:15', '2024-12-12 20:13:15'),
(32, 2, 1, 47.00, '2024-12-12 20:13:25', '2024-12-12 20:13:25'),
(33, 1, 1, 52.00, '2024-12-12 20:13:30', '2024-12-12 20:13:30'),
(34, 2, 1, 48.00, '2024-12-12 20:13:35', '2024-12-12 20:13:35'),
(35, 1, 1, 53.00, '2024-12-12 20:13:40', '2024-12-12 20:13:40');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_12_11_150227_create_auctions_table', 1),
(5, '2024_12_11_150247_create_bids_table', 1),
(6, '2024_12_11_154108_create_personal_access_tokens_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bids_remaining` int NOT NULL DEFAULT '10',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `bids_remaining`, `created_at`, `updated_at`) VALUES
(1, 'Mohibul', 'rana.csesust@gmail.com', '', 68, NULL, '2024-12-12 20:13:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auctions`
--
ALTER TABLE `auctions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bids`
--
ALTER TABLE `bids`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bids_auction_id_foreign` (`auction_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

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
-- AUTO_INCREMENT for table `auctions`
--
ALTER TABLE `auctions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bids`
--
ALTER TABLE `bids`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bids`
--
ALTER TABLE `bids`
  ADD CONSTRAINT `bids_auction_id_foreign` FOREIGN KEY (`auction_id`) REFERENCES `auctions` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
