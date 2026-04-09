-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 09, 2026 at 09:15 AM
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
-- Database: `tn_registration_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `id` int(11) NOT NULL,
  `app_code` varchar(20) NOT NULL,
  `applicant_id` int(11) NOT NULL,
  `position` varchar(150) NOT NULL,
  `department` varchar(100) NOT NULL,
  `resume_path` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `status` enum('pending','review','approved','rejected') NOT NULL DEFAULT 'pending',
  `reviewed_by` int(11) DEFAULT NULL,
  `review_notes` text DEFAULT NULL,
  `reviewed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `applications`
--

INSERT INTO `applications` (`id`, `app_code`, `applicant_id`, `position`, `department`, `resume_path`, `notes`, `status`, `reviewed_by`, `review_notes`, `reviewed_at`, `created_at`, `updated_at`) VALUES
(1, 'APP-220-001', 1, 'Software Engineer', 'Information Technology', NULL, NULL, 'rejected', 2, 'Qualified applicant. Approved for onboarding.', '2026-04-09 01:07:53', '2025-02-15 00:30:00', '2026-04-09 07:07:53'),
(2, 'APP-220-002', 1, 'Teacher', 'Education', NULL, NULL, 'pending', 2, '', '2026-04-09 01:08:00', '2025-03-02 02:00:00', '2026-04-09 07:08:00'),
(3, 'APP-220-003', 1, 'Data Analyst', 'Information Technology', NULL, NULL, 'approved', 2, 'Documents under verification.', '2026-04-08 18:49:26', '2025-03-10 03:00:00', '2026-04-09 00:49:26');

-- --------------------------------------------------------

--
-- Table structure for table `audit_logs`
--

CREATE TABLE `audit_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `action` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `audit_logs`
--

INSERT INTO `audit_logs` (`id`, `user_id`, `action`, `description`, `ip_address`, `user_agent`, `created_at`) VALUES
(1, 3, 'login', 'Admin logged into the system.', '127.0.0.1', NULL, '2026-04-07 07:32:13'),
(2, 1, 'login', 'Applicant John Doe logged in.', '127.0.0.1', NULL, '2026-04-07 07:32:13'),
(3, 1, 'application_create', 'Submitted application APP-220-001 for Software Engineer.', '127.0.0.1', NULL, '2026-04-07 07:32:13'),
(4, 2, 'status_update', 'Updated APP-220-001 status from pending to approved.', '127.0.0.1', NULL, '2026-04-07 07:32:13'),
(5, 1, 'application_create', 'Submitted application APP-220-002 for Teacher.', '127.0.0.1', NULL, '2026-04-07 07:32:13'),
(6, 1, 'application_create', 'Submitted application APP-220-003 for Data Analyst.', '127.0.0.1', NULL, '2026-04-07 07:32:13'),
(7, 2, 'status_update', 'Updated APP-220-003 status from pending to review.', '127.0.0.1', NULL, '2026-04-07 07:32:13'),
(8, 2, 'login', 'Maria Santos (hr) logged in.', '::1', NULL, '2026-04-09 00:48:24'),
(9, 2, 'page_view', 'HR viewed dashboard.', '::1', NULL, '2026-04-09 00:48:25'),
(10, 2, 'job_update', 'Job \"Operations Manager\" updated by Maria Santos.', '::1', NULL, '2026-04-09 00:49:07'),
(11, 2, 'job_update', 'Job \"Data Analyst\" updated by Maria Santos.', '::1', NULL, '2026-04-09 00:49:18'),
(12, 2, 'status_update', 'App APP-220-003 changed from review to approved by Maria Santos.', '::1', NULL, '2026-04-09 00:49:26'),
(13, 2, 'page_view', 'HR viewed dashboard.', '::1', NULL, '2026-04-09 00:50:02'),
(14, 2, 'job_post', 'New job \"TantanTest\" posted by Maria Santos.', '::1', NULL, '2026-04-09 00:51:12'),
(15, 2, 'logout', 'Maria Santos logged out.', '::1', NULL, '2026-04-09 00:51:16'),
(16, 1, 'login', 'John Doe (applicant) logged in.', '::1', NULL, '2026-04-09 00:51:26'),
(17, 1, 'page_view', 'Applicant viewed dashboard.', '::1', NULL, '2026-04-09 00:51:26'),
(18, 1, 'logout', 'John Doe logged out.', '::1', NULL, '2026-04-09 00:51:31'),
(19, 3, 'login', 'Administrator System (admin) logged in.', '::1', NULL, '2026-04-09 07:03:42'),
(20, 3, 'page_view', 'Admin viewed dashboard.', '::1', NULL, '2026-04-09 07:03:43'),
(21, 3, 'job_update', 'Job \"Accountant\" updated by admin.', '::1', NULL, '2026-04-09 07:06:06'),
(22, 3, 'logout', 'Administrator System logged out.', '::1', NULL, '2026-04-09 07:06:08'),
(23, 3, 'login', 'Administrator System (admin) logged in.', '::1', NULL, '2026-04-09 07:06:31'),
(24, 3, 'page_view', 'Admin viewed dashboard.', '::1', NULL, '2026-04-09 07:06:32'),
(25, 3, 'job_update', 'Job \"Accountant\" updated by admin.', '::1', NULL, '2026-04-09 07:06:42'),
(26, 3, 'job_update', 'Job \"Accountant\" updated by admin.', '::1', NULL, '2026-04-09 07:06:56'),
(27, 3, 'job_update', 'Job \"Accountant\" updated by admin.', '::1', NULL, '2026-04-09 07:07:02'),
(28, 3, 'logout', 'Administrator System logged out.', '::1', NULL, '2026-04-09 07:07:22'),
(29, 2, 'login', 'Maria Santos (hr) logged in.', '::1', NULL, '2026-04-09 07:07:34'),
(30, 2, 'page_view', 'HR viewed dashboard.', '::1', NULL, '2026-04-09 07:07:35'),
(31, 2, 'status_update', 'App APP-220-001 changed from approved to rejected by Maria Santos.', '::1', NULL, '2026-04-09 07:07:53'),
(32, 2, 'status_update', 'App APP-220-002 changed from pending to pending by Maria Santos.', '::1', NULL, '2026-04-09 07:08:00'),
(33, 2, 'logout', 'Maria Santos logged out.', '::1', NULL, '2026-04-09 07:08:01'),
(34, 3, 'login', 'Administrator System (admin) logged in.', '::1', NULL, '2026-04-09 07:08:27'),
(35, 3, 'page_view', 'Admin viewed dashboard.', '::1', NULL, '2026-04-09 07:08:28');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` varchar(10) NOT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `code`, `description`, `is_active`) VALUES
(1, 'Information Technology', 'IT', 'Software, systems, and infrastructure', 1),
(2, 'Human Resources', 'HR', 'Recruitment, benefits, and employee relations', 1),
(3, 'Finance', 'FIN', 'Accounting, payroll, and budgeting', 1),
(4, 'Education', 'EDU', 'Training, development, and instruction', 1),
(5, 'Operations', 'OPS', 'Day-to-day operations and logistics', 1);

-- --------------------------------------------------------

--
-- Table structure for table `job_positions`
--

CREATE TABLE `job_positions` (
  `id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `department_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `requirements` text DEFAULT NULL,
  `status` enum('open','closed','on_hold') NOT NULL DEFAULT 'open',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_positions`
--

INSERT INTO `job_positions` (`id`, `title`, `department_id`, `description`, `requirements`, `status`, `created_at`) VALUES
(1, 'Software Engineer', 1, 'Design and develop software applications.', 'BS Computer Science or IT; 1+ year experience', 'open', '2026-04-07 07:32:13'),
(2, 'Data Analyst', 1, 'Analyze data and generate business insights.', 'BS Information Technology; Excel, SQL skills', 'open', '2026-04-07 07:32:13'),
(3, 'HR Officer', 2, 'Handle recruitment and employee records.', 'BS Psychology or Management; good communication', 'open', '2026-04-07 07:32:13'),
(4, 'Accountant', 3, 'Manage financial records and reports.', 'BS Accountancy; CPA preferred', 'open', '2026-04-07 07:32:13'),
(5, 'Training Specialist', 4, 'Design and deliver employee training programs.', 'BS Education or HR Management', 'open', '2026-04-07 07:32:13'),
(6, 'Operations Manager', 5, 'Oversee daily operations and process improvement.', '5+ years management experience', 'open', '2026-04-07 07:32:13'),
(7, 'TantanTest', 2, 'for testing', 'testing lang', 'open', '2026-04-09 00:51:12');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('applicant','hr','admin') NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` enum('male','female','other') DEFAULT NULL,
  `status` enum('active','inactive','suspended') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `role`, `first_name`, `last_name`, `phone`, `address`, `dob`, `gender`, `status`, `created_at`, `updated_at`) VALUES
(1, 'applicant@test.com', 'test123', 'applicant', 'John', 'Doe', NULL, NULL, NULL, NULL, 'active', '2026-04-07 07:32:13', '2026-04-07 07:32:13'),
(2, 'hr@test.com', 'test123', 'hr', 'Maria', 'Santos', NULL, NULL, NULL, NULL, 'active', '2026-04-07 07:32:13', '2026-04-07 07:32:13'),
(3, 'admin@test.com', 'admin123', 'admin', 'Administrator', 'System', NULL, NULL, NULL, NULL, 'active', '2026-04-07 07:32:13', '2026-04-07 07:32:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_applications_app_code` (`app_code`),
  ADD KEY `fk_applications_applicant` (`applicant_id`),
  ADD KEY `fk_applications_reviewer` (`reviewed_by`);

--
-- Indexes for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_audit_logs_user` (`user_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_departments_code` (`code`);

--
-- Indexes for table `job_positions`
--
ALTER TABLE `job_positions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_job_positions_department` (`department_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_users_email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `job_positions`
--
ALTER TABLE `job_positions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `applications`
--
ALTER TABLE `applications`
  ADD CONSTRAINT `fk_applications_applicant` FOREIGN KEY (`applicant_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_applications_reviewer` FOREIGN KEY (`reviewed_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD CONSTRAINT `fk_audit_logs_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `job_positions`
--
ALTER TABLE `job_positions`
  ADD CONSTRAINT `fk_job_positions_department` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
