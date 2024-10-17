-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 15 Okt 2024 pada 18.30
-- Versi server: 8.0.30
-- Versi PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_rooming`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `booking_lists`
--

CREATE TABLE `booking_lists` (
  `id` bigint UNSIGNED NOT NULL,
  `room_id` bigint UNSIGNED DEFAULT NULL,
  `cars_id` bigint UNSIGNED DEFAULT NULL,
  `is_overtime` tinyint(1) DEFAULT NULL,
  `destination` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int NOT NULL,
  `date` date NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `purpose` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `approved_by` bigint UNSIGNED DEFAULT NULL,
  `approval_date` timestamp NULL DEFAULT NULL,
  `status` enum('PENDING','DISETUJUI','DIGUNAKAN','DITOLAK','EXPIRED','BATAL','SELESAI') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `applicant_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `applicant_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dept` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passenger_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passenger_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `booking_lists`
--

INSERT INTO `booking_lists` (`id`, `room_id`, `cars_id`, `is_overtime`, `destination`, `user_id`, `date`, `start_time`, `end_time`, `purpose`, `approved_by`, `approval_date`, `status`, `applicant_name`, `applicant_phone`, `dept`, `passenger_name`, `passenger_phone`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL, NULL, 2, '2024-10-15', '2024-10-15 19:10:00', '2024-10-15 19:20:00', 'Meeting', NULL, NULL, 'BATAL', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-14 18:07:47', '2024-10-15 04:56:44'),
(2, NULL, 1, NULL, NULL, 2, '2024-10-15', '2024-10-15 12:00:00', '2024-10-16 12:00:00', 'Pulang kampung', NULL, NULL, 'BATAL', 'Reza', '0888123123', 'IT', 'Sam', '0888123123', NULL, '2024-10-15 04:26:37', '2024-10-15 05:23:00'),
(3, NULL, 1, NULL, 'Bandung', 2, '2024-10-15', '2024-10-16 12:00:00', '2024-10-17 12:00:00', 'Jalan jalan', 1, '2024-10-15 08:26:20', 'DISETUJUI', 'King', '08881238123', 'SCM', 'Queen', '0888717237213', NULL, '2024-10-15 05:24:30', '2024-10-15 08:26:20'),
(4, NULL, 2, NULL, 'Bali', 7, '2024-10-15', '2024-10-19 12:00:00', '2024-10-20 12:00:00', 'Mudik Jenguk Orang Tua Dikampung', 1, NULL, 'DISETUJUI', 'John', '088123123123', 'IT', 'Doe', '088777712377', NULL, '2024-10-15 06:41:01', '2024-10-15 06:09:39');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cars`
--

CREATE TABLE `cars` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `license_plate` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `cars`
--

INSERT INTO `cars` (`id`, `name`, `description`, `photo`, `license_plate`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Ifeoma Burks 2', 'Rerum voluptatem inv', 'assets/image/cars/OPm5gT9snn9pAEw8WFb1B8eZ5BQTTPVY3pGjsxdR.jpg', 'B 1000 AAA', '2024-10-14 18:54:48', '2024-10-14 18:57:10', NULL),
(2, 'Xenia', NULL, 'assets/image/cars/Zp2cgDGo0Fb2t0UVyRtiS40XqRrOWvA50vphhmeV.png', 'N 9471', '2024-10-15 06:38:41', '2024-10-15 06:47:07', NULL),
(3, 'Avanza', NULL, 'assets/image/cars/0qGTM44R4ZjviSJhlJLoG96hG8lK5SEQ5so4wrpH.png', 'F 1234 HHH', '2024-10-15 08:24:40', '2024-10-15 08:24:40', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(1, 'default', '{\"uuid\":\"ad94addd-9825-4a35-be45-73cd19815c70\",\"displayName\":\"App\\\\Jobs\\\\SendEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmail\",\"command\":\"O:18:\\\"App\\\\Jobs\\\\SendEmail\\\":21:{s:14:\\\"receiver_email\\\";s:13:\\\"user@user.com\\\";s:9:\\\"user_name\\\";s:4:\\\"User\\\";s:9:\\\"room_name\\\";s:9:\\\"Meeting 1\\\";s:4:\\\"date\\\";s:10:\\\"2024-10-15\\\";s:10:\\\"start_time\\\";s:5:\\\"19:10\\\";s:8:\\\"end_time\\\";s:5:\\\"19:20\\\";s:7:\\\"purpose\\\";s:7:\\\"Meeting\\\";s:7:\\\"to_role\\\";s:4:\\\"USER\\\";s:13:\\\"receiver_name\\\";s:4:\\\"User\\\";s:3:\\\"url\\\";s:18:\\\"https:\\/\\/google.com\\\";s:6:\\\"status\\\";s:6:\\\"DIBUAT\\\";s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1728929267, 1728929267),
(2, 'default', '{\"uuid\":\"e9fdb980-5e7a-4445-9cf9-5bb7875ebfeb\",\"displayName\":\"App\\\\Jobs\\\\SendEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmail\",\"command\":\"O:18:\\\"App\\\\Jobs\\\\SendEmail\\\":21:{s:14:\\\"receiver_email\\\";s:15:\\\"admin@admin.com\\\";s:9:\\\"user_name\\\";s:4:\\\"User\\\";s:9:\\\"room_name\\\";s:9:\\\"Meeting 1\\\";s:4:\\\"date\\\";s:10:\\\"2024-10-15\\\";s:10:\\\"start_time\\\";s:5:\\\"19:10\\\";s:8:\\\"end_time\\\";s:5:\\\"19:20\\\";s:7:\\\"purpose\\\";s:7:\\\"Meeting\\\";s:7:\\\"to_role\\\";s:5:\\\"ADMIN\\\";s:13:\\\"receiver_name\\\";s:5:\\\"Admin\\\";s:3:\\\"url\\\";s:18:\\\"https:\\/\\/google.com\\\";s:6:\\\"status\\\";s:6:\\\"DIBUAT\\\";s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1728929267, 1728929267),
(3, 'default', '{\"uuid\":\"8e7cb444-b691-438f-99cf-5069219a1af1\",\"displayName\":\"App\\\\Jobs\\\\SendEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmail\",\"command\":\"O:18:\\\"App\\\\Jobs\\\\SendEmail\\\":21:{s:14:\\\"receiver_email\\\";s:13:\\\"user@user.com\\\";s:9:\\\"user_name\\\";s:4:\\\"User\\\";s:9:\\\"room_name\\\";s:9:\\\"Meeting 1\\\";s:4:\\\"date\\\";s:10:\\\"2024-10-15\\\";s:10:\\\"start_time\\\";s:19:\\\"2024-10-15 19:10:00\\\";s:8:\\\"end_time\\\";s:19:\\\"2024-10-15 19:20:00\\\";s:7:\\\"purpose\\\";s:7:\\\"Meeting\\\";s:7:\\\"to_role\\\";s:4:\\\"USER\\\";s:13:\\\"receiver_name\\\";s:4:\\\"User\\\";s:3:\\\"url\\\";s:18:\\\"https:\\/\\/google.com\\\";s:6:\\\"status\\\";s:7:\\\"DITOLAK\\\";s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1728933802, 1728933802),
(4, 'default', '{\"uuid\":\"d92d330d-fc1d-4f35-9a10-686254c0520c\",\"displayName\":\"App\\\\Jobs\\\\SendEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmail\",\"command\":\"O:18:\\\"App\\\\Jobs\\\\SendEmail\\\":21:{s:14:\\\"receiver_email\\\";s:15:\\\"admin@admin.com\\\";s:9:\\\"user_name\\\";s:4:\\\"User\\\";s:9:\\\"room_name\\\";s:9:\\\"Meeting 1\\\";s:4:\\\"date\\\";s:10:\\\"2024-10-15\\\";s:10:\\\"start_time\\\";s:19:\\\"2024-10-15 19:10:00\\\";s:8:\\\"end_time\\\";s:19:\\\"2024-10-15 19:20:00\\\";s:7:\\\"purpose\\\";s:7:\\\"Meeting\\\";s:7:\\\"to_role\\\";s:5:\\\"ADMIN\\\";s:13:\\\"receiver_name\\\";s:5:\\\"Admin\\\";s:3:\\\"url\\\";s:18:\\\"https:\\/\\/google.com\\\";s:6:\\\"status\\\";s:7:\\\"DITOLAK\\\";s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1728933802, 1728933802),
(5, 'default', '{\"uuid\":\"1a5c4e76-8c8b-4e2a-8b59-b47445095aed\",\"displayName\":\"App\\\\Jobs\\\\SendEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmail\",\"command\":\"O:18:\\\"App\\\\Jobs\\\\SendEmail\\\":21:{s:14:\\\"receiver_email\\\";s:13:\\\"user@user.com\\\";s:9:\\\"user_name\\\";s:4:\\\"User\\\";s:9:\\\"room_name\\\";s:14:\\\"Ifeoma Burks 2\\\";s:4:\\\"date\\\";s:10:\\\"2024-10-15\\\";s:10:\\\"start_time\\\";s:16:\\\"2024-10-15 12:00\\\";s:8:\\\"end_time\\\";s:16:\\\"2024-10-16 12:00\\\";s:7:\\\"purpose\\\";s:14:\\\"Pulang kampung\\\";s:7:\\\"to_role\\\";s:4:\\\"USER\\\";s:13:\\\"receiver_name\\\";s:4:\\\"User\\\";s:3:\\\"url\\\";s:18:\\\"https:\\/\\/google.com\\\";s:6:\\\"status\\\";s:6:\\\"DIBUAT\\\";s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1728966400, 1728966400),
(6, 'default', '{\"uuid\":\"a569c07d-6e16-4754-bf4f-3e20472c5be2\",\"displayName\":\"App\\\\Jobs\\\\SendEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmail\",\"command\":\"O:18:\\\"App\\\\Jobs\\\\SendEmail\\\":21:{s:14:\\\"receiver_email\\\";s:15:\\\"admin@admin.com\\\";s:9:\\\"user_name\\\";s:4:\\\"User\\\";s:9:\\\"room_name\\\";s:14:\\\"Ifeoma Burks 2\\\";s:4:\\\"date\\\";s:10:\\\"2024-10-15\\\";s:10:\\\"start_time\\\";s:16:\\\"2024-10-15 12:00\\\";s:8:\\\"end_time\\\";s:16:\\\"2024-10-16 12:00\\\";s:7:\\\"purpose\\\";s:14:\\\"Pulang kampung\\\";s:7:\\\"to_role\\\";s:5:\\\"ADMIN\\\";s:13:\\\"receiver_name\\\";s:5:\\\"Admin\\\";s:3:\\\"url\\\";s:18:\\\"https:\\/\\/google.com\\\";s:6:\\\"status\\\";s:6:\\\"DIBUAT\\\";s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1728966400, 1728966400),
(7, 'default', '{\"uuid\":\"22407e97-ea5b-492c-a88b-3f73ff74398e\",\"displayName\":\"App\\\\Jobs\\\\SendEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmail\",\"command\":\"O:18:\\\"App\\\\Jobs\\\\SendEmail\\\":21:{s:14:\\\"receiver_email\\\";s:13:\\\"user@user.com\\\";s:9:\\\"user_name\\\";s:4:\\\"User\\\";s:9:\\\"room_name\\\";s:9:\\\"Meeting 1\\\";s:4:\\\"date\\\";s:10:\\\"2024-10-15\\\";s:10:\\\"start_time\\\";s:19:\\\"2024-10-15 19:10:00\\\";s:8:\\\"end_time\\\";s:19:\\\"2024-10-15 19:20:00\\\";s:7:\\\"purpose\\\";s:7:\\\"Meeting\\\";s:7:\\\"to_role\\\";s:4:\\\"USER\\\";s:13:\\\"receiver_name\\\";s:4:\\\"User\\\";s:3:\\\"url\\\";s:18:\\\"https:\\/\\/google.com\\\";s:6:\\\"status\\\";s:5:\\\"BATAL\\\";s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1728968205, 1728968205),
(8, 'default', '{\"uuid\":\"1f5c5b11-ffa6-4176-a341-1e848a983f41\",\"displayName\":\"App\\\\Jobs\\\\SendEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmail\",\"command\":\"O:18:\\\"App\\\\Jobs\\\\SendEmail\\\":21:{s:14:\\\"receiver_email\\\";s:15:\\\"admin@admin.com\\\";s:9:\\\"user_name\\\";s:4:\\\"User\\\";s:9:\\\"room_name\\\";s:9:\\\"Meeting 1\\\";s:4:\\\"date\\\";s:10:\\\"2024-10-15\\\";s:10:\\\"start_time\\\";s:19:\\\"2024-10-15 19:10:00\\\";s:8:\\\"end_time\\\";s:19:\\\"2024-10-15 19:20:00\\\";s:7:\\\"purpose\\\";s:7:\\\"Meeting\\\";s:7:\\\"to_role\\\";s:5:\\\"ADMIN\\\";s:13:\\\"receiver_name\\\";s:5:\\\"Admin\\\";s:3:\\\"url\\\";s:18:\\\"https:\\/\\/google.com\\\";s:6:\\\"status\\\";s:5:\\\"BATAL\\\";s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1728968205, 1728968205),
(9, 'default', '{\"uuid\":\"9d704a64-c3a3-42ab-9907-09af82ca93fb\",\"displayName\":\"App\\\\Jobs\\\\SendEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmail\",\"command\":\"O:18:\\\"App\\\\Jobs\\\\SendEmail\\\":21:{s:14:\\\"receiver_email\\\";s:13:\\\"user@user.com\\\";s:9:\\\"user_name\\\";s:4:\\\"User\\\";s:9:\\\"room_name\\\";s:9:\\\"Meeting 1\\\";s:4:\\\"date\\\";s:10:\\\"2024-10-15\\\";s:10:\\\"start_time\\\";s:19:\\\"2024-10-15 19:10:00\\\";s:8:\\\"end_time\\\";s:19:\\\"2024-10-15 19:20:00\\\";s:7:\\\"purpose\\\";s:7:\\\"Meeting\\\";s:7:\\\"to_role\\\";s:4:\\\"USER\\\";s:13:\\\"receiver_name\\\";s:4:\\\"User\\\";s:3:\\\"url\\\";s:18:\\\"https:\\/\\/google.com\\\";s:6:\\\"status\\\";s:5:\\\"BATAL\\\";s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1728968881, 1728968881),
(10, 'default', '{\"uuid\":\"64de5bc9-9156-4d6e-acb9-7ce753e4fa2a\",\"displayName\":\"App\\\\Jobs\\\\SendEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmail\",\"command\":\"O:18:\\\"App\\\\Jobs\\\\SendEmail\\\":21:{s:14:\\\"receiver_email\\\";s:15:\\\"admin@admin.com\\\";s:9:\\\"user_name\\\";s:4:\\\"User\\\";s:9:\\\"room_name\\\";s:9:\\\"Meeting 1\\\";s:4:\\\"date\\\";s:10:\\\"2024-10-15\\\";s:10:\\\"start_time\\\";s:19:\\\"2024-10-15 19:10:00\\\";s:8:\\\"end_time\\\";s:19:\\\"2024-10-15 19:20:00\\\";s:7:\\\"purpose\\\";s:7:\\\"Meeting\\\";s:7:\\\"to_role\\\";s:5:\\\"ADMIN\\\";s:13:\\\"receiver_name\\\";s:5:\\\"Admin\\\";s:3:\\\"url\\\";s:18:\\\"https:\\/\\/google.com\\\";s:6:\\\"status\\\";s:5:\\\"BATAL\\\";s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1728968881, 1728968881),
(11, 'default', '{\"uuid\":\"82f2aa2c-4f06-40f6-8f48-4fc1c1dddcb5\",\"displayName\":\"App\\\\Jobs\\\\SendEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmail\",\"command\":\"O:18:\\\"App\\\\Jobs\\\\SendEmail\\\":21:{s:14:\\\"receiver_email\\\";s:13:\\\"user@user.com\\\";s:9:\\\"user_name\\\";s:4:\\\"User\\\";s:9:\\\"room_name\\\";s:9:\\\"Meeting 1\\\";s:4:\\\"date\\\";s:10:\\\"2024-10-15\\\";s:10:\\\"start_time\\\";s:19:\\\"2024-10-15 19:10:00\\\";s:8:\\\"end_time\\\";s:19:\\\"2024-10-15 19:20:00\\\";s:7:\\\"purpose\\\";s:7:\\\"Meeting\\\";s:7:\\\"to_role\\\";s:4:\\\"USER\\\";s:13:\\\"receiver_name\\\";s:4:\\\"User\\\";s:3:\\\"url\\\";s:18:\\\"https:\\/\\/google.com\\\";s:6:\\\"status\\\";s:5:\\\"BATAL\\\";s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1728968895, 1728968895),
(12, 'default', '{\"uuid\":\"a67ae78a-0f84-47d8-8bda-511b7df8e2d4\",\"displayName\":\"App\\\\Jobs\\\\SendEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmail\",\"command\":\"O:18:\\\"App\\\\Jobs\\\\SendEmail\\\":21:{s:14:\\\"receiver_email\\\";s:15:\\\"admin@admin.com\\\";s:9:\\\"user_name\\\";s:4:\\\"User\\\";s:9:\\\"room_name\\\";s:9:\\\"Meeting 1\\\";s:4:\\\"date\\\";s:10:\\\"2024-10-15\\\";s:10:\\\"start_time\\\";s:19:\\\"2024-10-15 19:10:00\\\";s:8:\\\"end_time\\\";s:19:\\\"2024-10-15 19:20:00\\\";s:7:\\\"purpose\\\";s:7:\\\"Meeting\\\";s:7:\\\"to_role\\\";s:5:\\\"ADMIN\\\";s:13:\\\"receiver_name\\\";s:5:\\\"Admin\\\";s:3:\\\"url\\\";s:18:\\\"https:\\/\\/google.com\\\";s:6:\\\"status\\\";s:5:\\\"BATAL\\\";s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1728968895, 1728968895),
(13, 'default', '{\"uuid\":\"c7012457-6ff4-4f8e-87af-59339305365e\",\"displayName\":\"App\\\\Jobs\\\\SendEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmail\",\"command\":\"O:18:\\\"App\\\\Jobs\\\\SendEmail\\\":21:{s:14:\\\"receiver_email\\\";s:13:\\\"user@user.com\\\";s:9:\\\"user_name\\\";s:4:\\\"User\\\";s:9:\\\"room_name\\\";s:14:\\\"Ifeoma Burks 2\\\";s:4:\\\"date\\\";s:10:\\\"2024-10-15\\\";s:10:\\\"start_time\\\";s:19:\\\"2024-10-15 12:00:00\\\";s:8:\\\"end_time\\\";s:19:\\\"2024-10-16 12:00:00\\\";s:7:\\\"purpose\\\";s:14:\\\"Pulang kampung\\\";s:7:\\\"to_role\\\";s:4:\\\"USER\\\";s:13:\\\"receiver_name\\\";s:4:\\\"User\\\";s:3:\\\"url\\\";s:18:\\\"https:\\/\\/google.com\\\";s:6:\\\"status\\\";s:5:\\\"BATAL\\\";s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1728969780, 1728969780),
(14, 'default', '{\"uuid\":\"d9e46b07-7b7f-4dbe-b1f4-ea9999d42213\",\"displayName\":\"App\\\\Jobs\\\\SendEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmail\",\"command\":\"O:18:\\\"App\\\\Jobs\\\\SendEmail\\\":21:{s:14:\\\"receiver_email\\\";s:15:\\\"admin@admin.com\\\";s:9:\\\"user_name\\\";s:4:\\\"User\\\";s:9:\\\"room_name\\\";s:14:\\\"Ifeoma Burks 2\\\";s:4:\\\"date\\\";s:10:\\\"2024-10-15\\\";s:10:\\\"start_time\\\";s:19:\\\"2024-10-15 12:00:00\\\";s:8:\\\"end_time\\\";s:19:\\\"2024-10-16 12:00:00\\\";s:7:\\\"purpose\\\";s:14:\\\"Pulang kampung\\\";s:7:\\\"to_role\\\";s:5:\\\"ADMIN\\\";s:13:\\\"receiver_name\\\";s:5:\\\"Admin\\\";s:3:\\\"url\\\";s:18:\\\"https:\\/\\/google.com\\\";s:6:\\\"status\\\";s:5:\\\"BATAL\\\";s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1728969780, 1728969780),
(15, 'default', '{\"uuid\":\"cc1ede64-9ea9-4daf-8afa-33d9cbc841a3\",\"displayName\":\"App\\\\Jobs\\\\SendEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmail\",\"command\":\"O:18:\\\"App\\\\Jobs\\\\SendEmail\\\":21:{s:14:\\\"receiver_email\\\";s:13:\\\"user@user.com\\\";s:9:\\\"user_name\\\";s:4:\\\"User\\\";s:9:\\\"room_name\\\";s:14:\\\"Ifeoma Burks 2\\\";s:4:\\\"date\\\";s:10:\\\"2024-10-15\\\";s:10:\\\"start_time\\\";s:16:\\\"2024-10-16 12:00\\\";s:8:\\\"end_time\\\";s:16:\\\"2024-10-17 12:00\\\";s:7:\\\"purpose\\\";s:11:\\\"Jalan jalan\\\";s:7:\\\"to_role\\\";s:4:\\\"USER\\\";s:13:\\\"receiver_name\\\";s:4:\\\"User\\\";s:3:\\\"url\\\";s:18:\\\"https:\\/\\/google.com\\\";s:6:\\\"status\\\";s:6:\\\"DIBUAT\\\";s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1728969870, 1728969870),
(16, 'default', '{\"uuid\":\"826fd6b0-2248-4d23-9bf9-6a12bd0a4019\",\"displayName\":\"App\\\\Jobs\\\\SendEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmail\",\"command\":\"O:18:\\\"App\\\\Jobs\\\\SendEmail\\\":21:{s:14:\\\"receiver_email\\\";s:15:\\\"admin@admin.com\\\";s:9:\\\"user_name\\\";s:4:\\\"User\\\";s:9:\\\"room_name\\\";s:14:\\\"Ifeoma Burks 2\\\";s:4:\\\"date\\\";s:10:\\\"2024-10-15\\\";s:10:\\\"start_time\\\";s:16:\\\"2024-10-16 12:00\\\";s:8:\\\"end_time\\\";s:16:\\\"2024-10-17 12:00\\\";s:7:\\\"purpose\\\";s:11:\\\"Jalan jalan\\\";s:7:\\\"to_role\\\";s:5:\\\"ADMIN\\\";s:13:\\\"receiver_name\\\";s:5:\\\"Admin\\\";s:3:\\\"url\\\";s:18:\\\"https:\\/\\/google.com\\\";s:6:\\\"status\\\";s:6:\\\"DIBUAT\\\";s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1728969870, 1728969870),
(17, 'default', '{\"uuid\":\"567c56a8-9782-4e90-9ece-40019987fe5c\",\"displayName\":\"App\\\\Jobs\\\\SendEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmail\",\"command\":\"O:18:\\\"App\\\\Jobs\\\\SendEmail\\\":21:{s:14:\\\"receiver_email\\\";s:13:\\\"user@user.com\\\";s:9:\\\"user_name\\\";s:4:\\\"User\\\";s:9:\\\"room_name\\\";s:14:\\\"Ifeoma Burks 2\\\";s:4:\\\"date\\\";s:10:\\\"2024-10-15\\\";s:10:\\\"start_time\\\";s:19:\\\"2024-10-16 12:00:00\\\";s:8:\\\"end_time\\\";s:19:\\\"2024-10-17 12:00:00\\\";s:7:\\\"purpose\\\";s:11:\\\"Jalan jalan\\\";s:7:\\\"to_role\\\";s:4:\\\"USER\\\";s:13:\\\"receiver_name\\\";s:4:\\\"User\\\";s:3:\\\"url\\\";s:18:\\\"https:\\/\\/google.com\\\";s:6:\\\"status\\\";s:7:\\\"DITOLAK\\\";s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1728973209, 1728973209),
(18, 'default', '{\"uuid\":\"db819943-b3db-4ecf-b592-9fb18f1a742d\",\"displayName\":\"App\\\\Jobs\\\\SendEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmail\",\"command\":\"O:18:\\\"App\\\\Jobs\\\\SendEmail\\\":21:{s:14:\\\"receiver_email\\\";s:23:\\\"xunupaky@mailinator.com\\\";s:9:\\\"user_name\\\";s:4:\\\"User\\\";s:9:\\\"room_name\\\";s:14:\\\"Ifeoma Burks 2\\\";s:4:\\\"date\\\";s:10:\\\"2024-10-15\\\";s:10:\\\"start_time\\\";s:19:\\\"2024-10-16 12:00:00\\\";s:8:\\\"end_time\\\";s:19:\\\"2024-10-17 12:00:00\\\";s:7:\\\"purpose\\\";s:11:\\\"Jalan jalan\\\";s:7:\\\"to_role\\\";s:5:\\\"ADMIN\\\";s:13:\\\"receiver_name\\\";s:16:\\\"Valentine Garcia\\\";s:3:\\\"url\\\";s:18:\\\"https:\\/\\/google.com\\\";s:6:\\\"status\\\";s:7:\\\"DITOLAK\\\";s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1728973209, 1728973209),
(19, 'default', '{\"uuid\":\"328f4586-8959-4378-8fd2-3f6b757905f8\",\"displayName\":\"App\\\\Jobs\\\\SendEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmail\",\"command\":\"O:18:\\\"App\\\\Jobs\\\\SendEmail\\\":21:{s:14:\\\"receiver_email\\\";s:13:\\\"user@user.com\\\";s:9:\\\"user_name\\\";s:4:\\\"User\\\";s:9:\\\"room_name\\\";s:14:\\\"Ifeoma Burks 2\\\";s:4:\\\"date\\\";s:10:\\\"2024-10-15\\\";s:10:\\\"start_time\\\";s:19:\\\"2024-10-16 12:00:00\\\";s:8:\\\"end_time\\\";s:19:\\\"2024-10-17 12:00:00\\\";s:7:\\\"purpose\\\";s:11:\\\"Jalan jalan\\\";s:7:\\\"to_role\\\";s:4:\\\"USER\\\";s:13:\\\"receiver_name\\\";s:4:\\\"User\\\";s:3:\\\"url\\\";s:18:\\\"https:\\/\\/google.com\\\";s:6:\\\"status\\\";s:9:\\\"DISETUJUI\\\";s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1728973215, 1728973215),
(20, 'default', '{\"uuid\":\"5d7f3794-d7ee-4646-aaf6-9a95d047f5b4\",\"displayName\":\"App\\\\Jobs\\\\SendEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmail\",\"command\":\"O:18:\\\"App\\\\Jobs\\\\SendEmail\\\":21:{s:14:\\\"receiver_email\\\";s:23:\\\"xunupaky@mailinator.com\\\";s:9:\\\"user_name\\\";s:4:\\\"User\\\";s:9:\\\"room_name\\\";s:14:\\\"Ifeoma Burks 2\\\";s:4:\\\"date\\\";s:10:\\\"2024-10-15\\\";s:10:\\\"start_time\\\";s:19:\\\"2024-10-16 12:00:00\\\";s:8:\\\"end_time\\\";s:19:\\\"2024-10-17 12:00:00\\\";s:7:\\\"purpose\\\";s:11:\\\"Jalan jalan\\\";s:7:\\\"to_role\\\";s:5:\\\"ADMIN\\\";s:13:\\\"receiver_name\\\";s:16:\\\"Valentine Garcia\\\";s:3:\\\"url\\\";s:18:\\\"https:\\/\\/google.com\\\";s:6:\\\"status\\\";s:9:\\\"DISETUJUI\\\";s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1728973215, 1728973215),
(21, 'default', '{\"uuid\":\"d99d7e50-faf5-4597-bc34-3c7699e856c9\",\"displayName\":\"App\\\\Jobs\\\\SendEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmail\",\"command\":\"O:18:\\\"App\\\\Jobs\\\\SendEmail\\\":21:{s:14:\\\"receiver_email\\\";s:23:\\\"xunupaky@mailinator.com\\\";s:9:\\\"user_name\\\";s:7:\\\"Manager\\\";s:9:\\\"room_name\\\";s:5:\\\"Xenia\\\";s:4:\\\"date\\\";s:10:\\\"2024-10-15\\\";s:10:\\\"start_time\\\";s:16:\\\"2024-10-19 12:00\\\";s:8:\\\"end_time\\\";s:16:\\\"2024-10-20 12:00\\\";s:7:\\\"purpose\\\";s:32:\\\"Mudik Jenguk Orang Tua Dikampung\\\";s:7:\\\"to_role\\\";s:4:\\\"USER\\\";s:13:\\\"receiver_name\\\";s:7:\\\"Manager\\\";s:3:\\\"url\\\";s:18:\\\"https:\\/\\/google.com\\\";s:6:\\\"status\\\";s:6:\\\"DIBUAT\\\";s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1728974463, 1728974463),
(22, 'default', '{\"uuid\":\"3a12bcf4-2c88-4dfa-a43c-de8ffc13d419\",\"displayName\":\"App\\\\Jobs\\\\SendEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmail\",\"command\":\"O:18:\\\"App\\\\Jobs\\\\SendEmail\\\":21:{s:14:\\\"receiver_email\\\";s:15:\\\"admin@admin.com\\\";s:9:\\\"user_name\\\";s:7:\\\"Manager\\\";s:9:\\\"room_name\\\";s:5:\\\"Xenia\\\";s:4:\\\"date\\\";s:10:\\\"2024-10-15\\\";s:10:\\\"start_time\\\";s:16:\\\"2024-10-19 12:00\\\";s:8:\\\"end_time\\\";s:16:\\\"2024-10-20 12:00\\\";s:7:\\\"purpose\\\";s:32:\\\"Mudik Jenguk Orang Tua Dikampung\\\";s:7:\\\"to_role\\\";s:5:\\\"ADMIN\\\";s:13:\\\"receiver_name\\\";s:5:\\\"Admin\\\";s:3:\\\"url\\\";s:18:\\\"https:\\/\\/google.com\\\";s:6:\\\"status\\\";s:6:\\\"DIBUAT\\\";s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1728974463, 1728974463),
(23, 'default', '{\"uuid\":\"00898523-c8a5-4907-8d85-e944012fc36c\",\"displayName\":\"App\\\\Jobs\\\\SendEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmail\",\"command\":\"O:18:\\\"App\\\\Jobs\\\\SendEmail\\\":21:{s:14:\\\"receiver_email\\\";s:23:\\\"xunupaky@mailinator.com\\\";s:9:\\\"user_name\\\";s:7:\\\"Manager\\\";s:9:\\\"room_name\\\";s:5:\\\"Xenia\\\";s:4:\\\"date\\\";s:10:\\\"2024-10-15\\\";s:10:\\\"start_time\\\";s:19:\\\"2024-10-19 12:00:00\\\";s:8:\\\"end_time\\\";s:19:\\\"2024-10-20 12:00:00\\\";s:7:\\\"purpose\\\";s:32:\\\"Mudik Jenguk Orang Tua Dikampung\\\";s:7:\\\"to_role\\\";s:4:\\\"USER\\\";s:13:\\\"receiver_name\\\";s:7:\\\"Manager\\\";s:3:\\\"url\\\";s:18:\\\"https:\\/\\/google.com\\\";s:6:\\\"status\\\";s:9:\\\"DISETUJUI\\\";s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1728974525, 1728974525),
(24, 'default', '{\"uuid\":\"0a7066e9-9985-4a0e-a084-0da544dcce32\",\"displayName\":\"App\\\\Jobs\\\\SendEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmail\",\"command\":\"O:18:\\\"App\\\\Jobs\\\\SendEmail\\\":21:{s:14:\\\"receiver_email\\\";s:23:\\\"xunupaky@mailinator.com\\\";s:9:\\\"user_name\\\";s:7:\\\"Manager\\\";s:9:\\\"room_name\\\";s:5:\\\"Xenia\\\";s:4:\\\"date\\\";s:10:\\\"2024-10-15\\\";s:10:\\\"start_time\\\";s:19:\\\"2024-10-19 12:00:00\\\";s:8:\\\"end_time\\\";s:19:\\\"2024-10-20 12:00:00\\\";s:7:\\\"purpose\\\";s:32:\\\"Mudik Jenguk Orang Tua Dikampung\\\";s:7:\\\"to_role\\\";s:5:\\\"ADMIN\\\";s:13:\\\"receiver_name\\\";s:7:\\\"Manager\\\";s:3:\\\"url\\\";s:18:\\\"https:\\/\\/google.com\\\";s:6:\\\"status\\\";s:9:\\\"DISETUJUI\\\";s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1728974525, 1728974525),
(25, 'default', '{\"uuid\":\"8f1fadcc-9220-4c75-91a8-94988cb06e3e\",\"displayName\":\"App\\\\Jobs\\\\SendEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmail\",\"command\":\"O:18:\\\"App\\\\Jobs\\\\SendEmail\\\":21:{s:14:\\\"receiver_email\\\";s:23:\\\"xunupaky@mailinator.com\\\";s:9:\\\"user_name\\\";s:7:\\\"Manager\\\";s:9:\\\"room_name\\\";s:5:\\\"Xenia\\\";s:4:\\\"date\\\";s:10:\\\"2024-10-15\\\";s:10:\\\"start_time\\\";s:19:\\\"2024-10-19 12:00:00\\\";s:8:\\\"end_time\\\";s:19:\\\"2024-10-20 12:00:00\\\";s:7:\\\"purpose\\\";s:32:\\\"Mudik Jenguk Orang Tua Dikampung\\\";s:7:\\\"to_role\\\";s:4:\\\"USER\\\";s:13:\\\"receiver_name\\\";s:7:\\\"Manager\\\";s:3:\\\"url\\\";s:18:\\\"https:\\/\\/google.com\\\";s:6:\\\"status\\\";s:7:\\\"DITOLAK\\\";s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1728974537, 1728974537),
(26, 'default', '{\"uuid\":\"f6622392-9360-40fb-aff0-c518082512e0\",\"displayName\":\"App\\\\Jobs\\\\SendEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmail\",\"command\":\"O:18:\\\"App\\\\Jobs\\\\SendEmail\\\":21:{s:14:\\\"receiver_email\\\";s:23:\\\"xunupaky@mailinator.com\\\";s:9:\\\"user_name\\\";s:7:\\\"Manager\\\";s:9:\\\"room_name\\\";s:5:\\\"Xenia\\\";s:4:\\\"date\\\";s:10:\\\"2024-10-15\\\";s:10:\\\"start_time\\\";s:19:\\\"2024-10-19 12:00:00\\\";s:8:\\\"end_time\\\";s:19:\\\"2024-10-20 12:00:00\\\";s:7:\\\"purpose\\\";s:32:\\\"Mudik Jenguk Orang Tua Dikampung\\\";s:7:\\\"to_role\\\";s:5:\\\"ADMIN\\\";s:13:\\\"receiver_name\\\";s:7:\\\"Manager\\\";s:3:\\\"url\\\";s:18:\\\"https:\\/\\/google.com\\\";s:6:\\\"status\\\";s:7:\\\"DITOLAK\\\";s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1728974537, 1728974537),
(27, 'default', '{\"uuid\":\"2a5511df-a714-47b0-980d-52272ca4f5f0\",\"displayName\":\"App\\\\Jobs\\\\SendEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmail\",\"command\":\"O:18:\\\"App\\\\Jobs\\\\SendEmail\\\":21:{s:14:\\\"receiver_email\\\";s:23:\\\"xunupaky@mailinator.com\\\";s:9:\\\"user_name\\\";s:7:\\\"Manager\\\";s:9:\\\"room_name\\\";s:5:\\\"Xenia\\\";s:4:\\\"date\\\";s:10:\\\"2024-10-15\\\";s:10:\\\"start_time\\\";s:19:\\\"2024-10-19 12:00:00\\\";s:8:\\\"end_time\\\";s:19:\\\"2024-10-20 12:00:00\\\";s:7:\\\"purpose\\\";s:32:\\\"Mudik Jenguk Orang Tua Dikampung\\\";s:7:\\\"to_role\\\";s:4:\\\"USER\\\";s:13:\\\"receiver_name\\\";s:7:\\\"Manager\\\";s:3:\\\"url\\\";s:18:\\\"https:\\/\\/google.com\\\";s:6:\\\"status\\\";s:9:\\\"DISETUJUI\\\";s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1728974545, 1728974545),
(28, 'default', '{\"uuid\":\"00a82b15-0fd8-4877-b751-29ca2783b6d4\",\"displayName\":\"App\\\\Jobs\\\\SendEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmail\",\"command\":\"O:18:\\\"App\\\\Jobs\\\\SendEmail\\\":21:{s:14:\\\"receiver_email\\\";s:23:\\\"xunupaky@mailinator.com\\\";s:9:\\\"user_name\\\";s:7:\\\"Manager\\\";s:9:\\\"room_name\\\";s:5:\\\"Xenia\\\";s:4:\\\"date\\\";s:10:\\\"2024-10-15\\\";s:10:\\\"start_time\\\";s:19:\\\"2024-10-19 12:00:00\\\";s:8:\\\"end_time\\\";s:19:\\\"2024-10-20 12:00:00\\\";s:7:\\\"purpose\\\";s:32:\\\"Mudik Jenguk Orang Tua Dikampung\\\";s:7:\\\"to_role\\\";s:5:\\\"ADMIN\\\";s:13:\\\"receiver_name\\\";s:7:\\\"Manager\\\";s:3:\\\"url\\\";s:18:\\\"https:\\/\\/google.com\\\";s:6:\\\"status\\\";s:9:\\\"DISETUJUI\\\";s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1728974545, 1728974545),
(29, 'default', '{\"uuid\":\"f909438f-7b8f-4ec4-b4c5-1cb15e4b2435\",\"displayName\":\"App\\\\Jobs\\\\SendEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmail\",\"command\":\"O:18:\\\"App\\\\Jobs\\\\SendEmail\\\":21:{s:14:\\\"receiver_email\\\";s:13:\\\"user@user.com\\\";s:9:\\\"user_name\\\";s:4:\\\"User\\\";s:9:\\\"room_name\\\";s:14:\\\"Ifeoma Burks 2\\\";s:4:\\\"date\\\";s:10:\\\"2024-10-15\\\";s:10:\\\"start_time\\\";s:19:\\\"2024-10-16 12:00:00\\\";s:8:\\\"end_time\\\";s:19:\\\"2024-10-17 12:00:00\\\";s:7:\\\"purpose\\\";s:11:\\\"Jalan jalan\\\";s:7:\\\"to_role\\\";s:4:\\\"USER\\\";s:13:\\\"receiver_name\\\";s:4:\\\"User\\\";s:3:\\\"url\\\";s:18:\\\"https:\\/\\/google.com\\\";s:6:\\\"status\\\";s:7:\\\"DITOLAK\\\";s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1728982434, 1728982434),
(30, 'default', '{\"uuid\":\"87c018fe-6aca-4a93-b0c0-7916a25b187e\",\"displayName\":\"App\\\\Jobs\\\\SendEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmail\",\"command\":\"O:18:\\\"App\\\\Jobs\\\\SendEmail\\\":21:{s:14:\\\"receiver_email\\\";s:15:\\\"admin@admin.com\\\";s:9:\\\"user_name\\\";s:4:\\\"User\\\";s:9:\\\"room_name\\\";s:14:\\\"Ifeoma Burks 2\\\";s:4:\\\"date\\\";s:10:\\\"2024-10-15\\\";s:10:\\\"start_time\\\";s:19:\\\"2024-10-16 12:00:00\\\";s:8:\\\"end_time\\\";s:19:\\\"2024-10-17 12:00:00\\\";s:7:\\\"purpose\\\";s:11:\\\"Jalan jalan\\\";s:7:\\\"to_role\\\";s:5:\\\"ADMIN\\\";s:13:\\\"receiver_name\\\";s:5:\\\"Admin\\\";s:3:\\\"url\\\";s:18:\\\"https:\\/\\/google.com\\\";s:6:\\\"status\\\";s:7:\\\"DITOLAK\\\";s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1728982434, 1728982434),
(31, 'default', '{\"uuid\":\"bf2b0945-4183-42d1-baf9-ab483dd5e235\",\"displayName\":\"App\\\\Jobs\\\\SendEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmail\",\"command\":\"O:18:\\\"App\\\\Jobs\\\\SendEmail\\\":21:{s:14:\\\"receiver_email\\\";s:23:\\\"xunupaky@mailinator.com\\\";s:9:\\\"user_name\\\";s:7:\\\"Manager\\\";s:9:\\\"room_name\\\";s:5:\\\"Xenia\\\";s:4:\\\"date\\\";s:10:\\\"2024-10-15\\\";s:10:\\\"start_time\\\";s:19:\\\"2024-10-19 12:00:00\\\";s:8:\\\"end_time\\\";s:19:\\\"2024-10-20 12:00:00\\\";s:7:\\\"purpose\\\";s:32:\\\"Mudik Jenguk Orang Tua Dikampung\\\";s:7:\\\"to_role\\\";s:4:\\\"USER\\\";s:13:\\\"receiver_name\\\";s:7:\\\"Manager\\\";s:3:\\\"url\\\";s:18:\\\"https:\\/\\/google.com\\\";s:6:\\\"status\\\";s:7:\\\"DITOLAK\\\";s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1728972570, 1728972570),
(32, 'default', '{\"uuid\":\"06f7a685-117b-4273-b9e0-20deb863620d\",\"displayName\":\"App\\\\Jobs\\\\SendEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmail\",\"command\":\"O:18:\\\"App\\\\Jobs\\\\SendEmail\\\":21:{s:14:\\\"receiver_email\\\";s:15:\\\"admin@admin.com\\\";s:9:\\\"user_name\\\";s:7:\\\"Manager\\\";s:9:\\\"room_name\\\";s:5:\\\"Xenia\\\";s:4:\\\"date\\\";s:10:\\\"2024-10-15\\\";s:10:\\\"start_time\\\";s:19:\\\"2024-10-19 12:00:00\\\";s:8:\\\"end_time\\\";s:19:\\\"2024-10-20 12:00:00\\\";s:7:\\\"purpose\\\";s:32:\\\"Mudik Jenguk Orang Tua Dikampung\\\";s:7:\\\"to_role\\\";s:5:\\\"ADMIN\\\";s:13:\\\"receiver_name\\\";s:5:\\\"Admin\\\";s:3:\\\"url\\\";s:18:\\\"https:\\/\\/google.com\\\";s:6:\\\"status\\\";s:7:\\\"DITOLAK\\\";s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1728972570, 1728972570),
(33, 'default', '{\"uuid\":\"684af276-7c72-4843-8a71-008fb0cdc377\",\"displayName\":\"App\\\\Jobs\\\\SendEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmail\",\"command\":\"O:18:\\\"App\\\\Jobs\\\\SendEmail\\\":21:{s:14:\\\"receiver_email\\\";s:23:\\\"xunupaky@mailinator.com\\\";s:9:\\\"user_name\\\";s:7:\\\"Manager\\\";s:9:\\\"room_name\\\";s:5:\\\"Xenia\\\";s:4:\\\"date\\\";s:10:\\\"2024-10-15\\\";s:10:\\\"start_time\\\";s:19:\\\"2024-10-19 12:00:00\\\";s:8:\\\"end_time\\\";s:19:\\\"2024-10-20 12:00:00\\\";s:7:\\\"purpose\\\";s:32:\\\"Mudik Jenguk Orang Tua Dikampung\\\";s:7:\\\"to_role\\\";s:4:\\\"USER\\\";s:13:\\\"receiver_name\\\";s:7:\\\"Manager\\\";s:3:\\\"url\\\";s:18:\\\"https:\\/\\/google.com\\\";s:6:\\\"status\\\";s:9:\\\"DISETUJUI\\\";s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1728972579, 1728972579),
(34, 'default', '{\"uuid\":\"3f2ef308-9b3a-4d4d-b7ea-fda7ba1b61c8\",\"displayName\":\"App\\\\Jobs\\\\SendEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmail\",\"command\":\"O:18:\\\"App\\\\Jobs\\\\SendEmail\\\":21:{s:14:\\\"receiver_email\\\";s:15:\\\"admin@admin.com\\\";s:9:\\\"user_name\\\";s:7:\\\"Manager\\\";s:9:\\\"room_name\\\";s:5:\\\"Xenia\\\";s:4:\\\"date\\\";s:10:\\\"2024-10-15\\\";s:10:\\\"start_time\\\";s:19:\\\"2024-10-19 12:00:00\\\";s:8:\\\"end_time\\\";s:19:\\\"2024-10-20 12:00:00\\\";s:7:\\\"purpose\\\";s:32:\\\"Mudik Jenguk Orang Tua Dikampung\\\";s:7:\\\"to_role\\\";s:5:\\\"ADMIN\\\";s:13:\\\"receiver_name\\\";s:5:\\\"Admin\\\";s:3:\\\"url\\\";s:18:\\\"https:\\/\\/google.com\\\";s:6:\\\"status\\\";s:9:\\\"DISETUJUI\\\";s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1728972579, 1728972579),
(35, 'default', '{\"uuid\":\"7e83deec-203e-4e37-ac0b-94161dc098db\",\"displayName\":\"App\\\\Jobs\\\\SendEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmail\",\"command\":\"O:18:\\\"App\\\\Jobs\\\\SendEmail\\\":21:{s:14:\\\"receiver_email\\\";s:13:\\\"user@user.com\\\";s:9:\\\"user_name\\\";s:4:\\\"User\\\";s:9:\\\"room_name\\\";s:14:\\\"Ifeoma Burks 2\\\";s:4:\\\"date\\\";s:10:\\\"2024-10-15\\\";s:10:\\\"start_time\\\";s:19:\\\"2024-10-16 12:00:00\\\";s:8:\\\"end_time\\\";s:19:\\\"2024-10-17 12:00:00\\\";s:7:\\\"purpose\\\";s:11:\\\"Jalan jalan\\\";s:7:\\\"to_role\\\";s:4:\\\"USER\\\";s:13:\\\"receiver_name\\\";s:4:\\\"User\\\";s:3:\\\"url\\\";s:18:\\\"https:\\/\\/google.com\\\";s:6:\\\"status\\\";s:9:\\\"DISETUJUI\\\";s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1728980780, 1728980780),
(36, 'default', '{\"uuid\":\"360ff9c7-2a7f-4e3f-a410-488bbba6868d\",\"displayName\":\"App\\\\Jobs\\\\SendEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmail\",\"command\":\"O:18:\\\"App\\\\Jobs\\\\SendEmail\\\":21:{s:14:\\\"receiver_email\\\";s:15:\\\"admin@admin.com\\\";s:9:\\\"user_name\\\";s:4:\\\"User\\\";s:9:\\\"room_name\\\";s:14:\\\"Ifeoma Burks 2\\\";s:4:\\\"date\\\";s:10:\\\"2024-10-15\\\";s:10:\\\"start_time\\\";s:19:\\\"2024-10-16 12:00:00\\\";s:8:\\\"end_time\\\";s:19:\\\"2024-10-17 12:00:00\\\";s:7:\\\"purpose\\\";s:11:\\\"Jalan jalan\\\";s:7:\\\"to_role\\\";s:5:\\\"ADMIN\\\";s:13:\\\"receiver_name\\\";s:5:\\\"Admin\\\";s:3:\\\"url\\\";s:18:\\\"https:\\/\\/google.com\\\";s:6:\\\"status\\\";s:9:\\\"DISETUJUI\\\";s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1728980780, 1728980780);

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_12_30_021429_create_rooms_table', 1),
(5, '2020_12_30_021543_create_booking_lists_table', 1),
(6, '2021_01_20_062644_add_email_to_users_table', 1),
(7, '2021_01_21_201940_create_jobs_table', 1),
(8, '2024_10_15_005534_update_users_role_and_add_cars_table', 2),
(9, '2024_10_15_105933_add_column_booking_lists', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rooms`
--

CREATE TABLE `rooms` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capacity` int DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `rooms`
--

INSERT INTO `rooms` (`id`, `name`, `description`, `capacity`, `photo`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Meeting 1', 'Ruang meeting Dyeing atas', 20, NULL, NULL, '2024-10-14 17:44:20', '2024-10-14 17:44:20'),
(2, 'Meeting 2', 'Ruang meeting Dyeing sebelah Meeting 1', 15, NULL, NULL, '2024-10-14 17:44:20', '2024-10-14 17:44:20'),
(3, 'Meeting 3', 'Ruang meeting di Office bawah', 15, NULL, NULL, '2024-10-14 17:44:20', '2024-10-14 17:44:20'),
(4, 'Meeting 4', 'Ruang meeting di Weaving', 15, NULL, NULL, '2024-10-14 17:44:20', '2024-10-14 17:44:20'),
(5, 'Honda Brio', 'Bagus', NULL, 'assets/image/room/BZ3R9pEybjuzEmPhuv6DWAQirjsyP6SbJdcSrlyi.jpg', '2024-10-14 18:51:27', '2024-10-14 18:50:45', '2024-10-14 18:51:27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `username` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('USER','ADMIN','MANAGER') COLLATE utf8mb4_unicode_ci DEFAULT 'USER',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `name`, `description`, `role`, `deleted_at`, `remember_token`, `created_at`, `updated_at`, `email`, `phone`) VALUES
(1, 'admin', '$2y$10$.gikfY66dK2tfkhZxnwxM.jhOMnIND08TOR11csnFQ9wDeJkifpQu', 'Admin', NULL, 'ADMIN', NULL, NULL, '2024-10-14 17:44:19', '2024-10-14 17:44:19', 'admin@admin.com', NULL),
(2, 'user', '$2y$10$fC.nNCysHTzPuT.Lul/YIO0MBbRQvruJ1tp/JJVx6u4Vhq3RuijsG', 'User', 'Accounting Staff', 'USER', NULL, NULL, '2024-10-14 17:44:20', '2024-10-14 17:44:20', 'user@user.com', NULL),
(3, 'fajar', '$2y$10$oUSjI9CaZDW88lgW5.yvv.38CIqI53YNMJI8WmiH29TSAmXoPPz..', 'Fajarwz', 'IT Staff', 'USER', NULL, NULL, '2024-10-14 17:44:20', '2024-10-14 17:44:20', 'fajar@gmail.com', NULL),
(4, 'foo', '$2y$10$nyKiSt4eKQaZLtIqkME4Lu371Pl9f2GYkghT3eUbSbniIEybGUIoC', 'Foo', NULL, 'USER', NULL, NULL, '2024-10-14 17:44:20', '2024-10-14 17:44:20', 'foo@gmail.com', NULL),
(5, 'bar', '$2y$10$AtoD8q41f36x.eAq05L9M.Mvurw1jJQ7c2nn1bHfPnVYQDmh7IktS', 'Bar', NULL, 'USER', NULL, NULL, '2024-10-14 17:44:20', '2024-10-14 17:44:20', 'bar@gmail.com', NULL),
(6, 'kimi', '$2y$10$yP4nfXdioiIFayOfUInxfuJ9ZM8N/LG72RA/8nNx5iYoUU6A5GB3S', 'Kimi No Tori', NULL, 'USER', NULL, NULL, '2024-10-15 06:00:47', '2024-10-15 06:00:47', 'kimi@j.co', NULL),
(7, 'manager', '$2y$10$kxSJa44hd4kjJ7Jh2pz1IeJIWYyBw.gsRiowI1ru0zLvlJnDjve5e', 'Manager', 'Manager', 'MANAGER', NULL, NULL, '2024-10-15 06:02:45', '2024-10-15 06:02:45', 'xunupaky@mailinator.com', NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `booking_lists`
--
ALTER TABLE `booking_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cars_license_plate_unique` (`license_plate`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_username_email_unique` (`username`,`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `booking_lists`
--
ALTER TABLE `booking_lists`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `cars`
--
ALTER TABLE `cars`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
