-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2024 at 03:51 PM
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
-- Database: `fyp_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add vehicle owner', 7, 'add_vehicleowner'),
(26, 'Can change vehicle owner', 7, 'change_vehicleowner'),
(27, 'Can delete vehicle owner', 7, 'delete_vehicleowner'),
(28, 'Can view vehicle owner', 7, 'view_vehicleowner'),
(29, 'Can add vehicle', 7, 'add_vehicle'),
(30, 'Can change vehicle', 7, 'change_vehicle'),
(31, 'Can delete vehicle', 7, 'delete_vehicle'),
(32, 'Can view vehicle', 7, 'view_vehicle');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$720000$WLlhZrfcbSi8qTkos7fZZN$BrmSoBmW9s216jMKc71+4X1+aFmj1TBJD/p1GBdaNpI=', '2024-11-30 14:19:55.644302', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2024-09-07 12:47:48.165906'),
(2, 'pbkdf2_sha256$720000$vTe2AV8L99RX1nk1lUfpkL$54tvSV6pkDrk+FaRzflRwko4vtntPrpPdbaNK7ct+mI=', NULL, 0, 'new', 'testing', 'test', 'test@gmail.com', 1, 1, '2024-10-30 18:27:50.000000');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user_user_permissions`
--

INSERT INTO `auth_user_user_permissions` (`id`, `user_id`, `permission_id`) VALUES
(9, 2, 16),
(2, 2, 25),
(3, 2, 26),
(4, 2, 27),
(5, 2, 28),
(6, 2, 29),
(7, 2, 30),
(8, 2, 31),
(1, 2, 32);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-10-30 18:27:51.575911', '2', 'new', 1, '[{\"added\": {}}]', 4, 1),
(2, '2024-10-30 18:29:31.248081', '2', 'new', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Staff status\", \"User permissions\"]}}]', 4, 1),
(3, '2024-10-30 18:31:30.441708', '2', 'new', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 1),
(4, '2024-10-30 18:32:26.428066', '2', 'new', 2, '[{\"changed\": {\"fields\": [\"User permissions\", \"Last login\"]}}]', 4, 1),
(5, '2024-10-31 17:41:18.364650', '3', 'Ali', 1, '[{\"added\": {}}]', 7, 1),
(6, '2024-10-31 17:44:39.648506', '3', 'Ali', 2, '[{\"changed\": {\"fields\": [\"Plate num\"]}}]', 7, 1),
(7, '2024-10-31 17:45:34.278503', '3', 'Ali', 2, '[{\"changed\": {\"fields\": [\"Plate num\"]}}]', 7, 1),
(8, '2024-11-30 13:28:18.731629', '3', 'Ali Khan', 1, '[{\"added\": {}}]', 7, 1),
(9, '2024-11-30 14:20:20.149960', '3', 'Ali Khan', 2, '[{\"changed\": {\"fields\": [\"Vehicle Make\", \"Vehicle Model\"]}}]', 7, 1),
(10, '2024-11-30 14:21:55.946956', '4', 'Jhon dae', 1, '[{\"added\": {}}]', 7, 1),
(11, '2024-11-30 14:23:19.677465', '5', 'Jawed', 1, '[{\"added\": {}}]', 7, 1),
(12, '2024-11-30 14:32:27.255904', '6', 'Anus', 1, '[{\"added\": {}}]', 7, 1),
(13, '2024-11-30 14:33:46.849313', '7', 'Saleem', 1, '[{\"added\": {}}]', 7, 1),
(14, '2024-11-30 14:34:51.701807', '8', 'Hamza', 1, '[{\"added\": {}}]', 7, 1),
(15, '2024-11-30 14:35:56.775161', '9', 'Aqib', 1, '[{\"added\": {}}]', 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'vehicle', 'vehicle');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-09-07 12:43:47.878095'),
(2, 'auth', '0001_initial', '2024-09-07 12:43:49.471147'),
(3, 'admin', '0001_initial', '2024-09-07 12:43:49.760387'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-09-07 12:43:49.797039'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-09-07 12:43:49.816594'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-09-07 12:43:49.963797'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-09-07 12:43:50.125358'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-09-07 12:43:50.160198'),
(9, 'auth', '0004_alter_user_username_opts', '2024-09-07 12:43:50.177089'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-09-07 12:43:50.331308'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-09-07 12:43:50.338923'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-09-07 12:43:50.354716'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-09-07 12:43:50.389783'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-09-07 12:43:50.420159'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-09-07 12:43:50.454662'),
(16, 'auth', '0011_update_proxy_permissions', '2024-09-07 12:43:50.475969'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-09-07 12:43:50.509367'),
(18, 'sessions', '0001_initial', '2024-09-07 12:43:50.620423'),
(19, 'vehicle', '0001_initial', '2024-10-24 19:09:50.108665'),
(20, 'vehicle', '0002_rename_vehicleowner_vehicle_and_more', '2024-10-26 13:37:50.335541'),
(21, 'vehicle', '0003_vehicle_owner_age', '2024-10-27 08:59:58.683595'),
(22, 'vehicle', '0003_vehicle_owner_address_vehicle_owner_age_and_more', '2024-11-30 08:37:39.962686'),
(23, 'vehicle', '0004_vehicle_vehicle_make_vehicle_vehicle_model_and_more', '2024-11-30 13:37:28.443295');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0idw5truj60x0foez1uevfof0jx494be', '.eJxVjDsOwjAQRO_iGlnGa_lDSc8ZrF3vBgeQI8VJhbg7iZQCutG8N_NWGdel5rXLnEdWF3VWp9-OsDyl7YAf2O6TLlNb5pH0ruiDdn2bWF7Xw_07qNjrtnZokGIhk7zFyGEY0FobShJgkwS35MEXBhOjIwISC8lZCILsPXr1-QL2pDgx:1tHOKB:BChO4L7RQlrOCS3e6Zr9JUKXoXJAk-ReQiC16pLjs5g', '2024-12-14 14:19:55.670177'),
('dlu7iinusfcqi9j35rerctohvvbya5up', '.eJxVjLEOwiAURf-F2RCgQMHR3W8g7wFPqgaS0k7Gf1eSDrrc4Z6T82IB9q2Evec1LImdmWKn3w8hPnIdIN2h3hqPrW7rgnwo_KCdX1vKz8vh_gUK9DKyVulJg7SoyBiShLPV6KywmSbpU57Jme8geUyJhPZZSmeUJaOi8MDeH9nCN-Y:1t6DTp:802gC-6IMTQ7mn5Peqcr6CuKl3N_8KqtZwyBdICP3sw', '2024-11-13 18:31:41.738929'),
('g5a96fj5fmijpkm0jseydae1ei2q7g7g', '.eJxVjDsOwjAQRO_iGlnGa_lDSc8ZrF3vBgeQI8VJhbg7iZQCutG8N_NWGdel5rXLnEdWF3VWp9-OsDyl7YAf2O6TLlNb5pH0ruiDdn2bWF7Xw_07qNjrtnZokGIhk7zFyGEY0FobShJgkwS35MEXBhOjIwISC8lZCILsPXr1-QL2pDgx:1tHKJg:tlfyTAfU798lwxST8ClJPegIz3zfXWXya_VJ8wxAMn4', '2024-12-14 10:03:08.758522'),
('hyqa9y6mzri4zgo7goee1ic8whwmkhp0', '.eJxVjDsOwjAQRO_iGlnGa_lDSc8ZrF3vBgeQI8VJhbg7iZQCutG8N_NWGdel5rXLnEdWF3VWp9-OsDyl7YAf2O6TLlNb5pH0ruiDdn2bWF7Xw_07qNjrtnZokGIhk7zFyGEY0FobShJgkwS35MEXBhOjIwISC8lZCILsPXr1-QL2pDgx:1smurM:6Uk1EA1iDRWxikD0FVvuG84pYhqv6aUOuOGEn2F2YrA', '2024-09-21 12:48:12.492284'),
('p5vcnnkb1ye6nqehlog7mrm50ocqylb2', '.eJxVjDsOwjAQRO_iGlnGa_lDSc8ZrF3vBgeQI8VJhbg7iZQCutG8N_NWGdel5rXLnEdWF3VWp9-OsDyl7YAf2O6TLlNb5pH0ruiDdn2bWF7Xw_07qNjrtnZokGIhk7zFyGEY0FobShJgkwS35MEXBhOjIwISC8lZCILsPXr1-QL2pDgx:1t6DTe:aoNsiSO9eXem1-3czZ82JU0s4L_S98b7QSYzZoQK2Ws', '2024-11-13 18:31:30.471565');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_vehicle`
--

CREATE TABLE `vehicle_vehicle` (
  `id` bigint(20) NOT NULL,
  `plate_num` varchar(15) NOT NULL,
  `owner_name` varchar(100) NOT NULL,
  `owner_address` varchar(250) NOT NULL,
  `owner_age` varchar(100) NOT NULL,
  `owner_cnic` varchar(100) NOT NULL,
  `owner_depart` varchar(100) NOT NULL,
  `owner_gender` varchar(10) NOT NULL,
  `owner_phone` varchar(100) NOT NULL,
  `vehicle_Make` varchar(100) NOT NULL,
  `vehicle_Model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehicle_vehicle`
--

INSERT INTO `vehicle_vehicle` (`id`, `plate_num`, `owner_name`, `owner_address`, `owner_age`, `owner_cnic`, `owner_depart`, `owner_gender`, `owner_phone`, `vehicle_Make`, `vehicle_Model`) VALUES
(1, 'AHE 493', 'hamza', 'Not provided', '22', 'Not provided', 'Not provided', 'male', 'Not provided', 'xyz', 'xyz'),
(2, 'AHE:493', 'hamza', 'Not provided', '22', 'Not provided', 'Not provided', 'male', 'Not provided', 'xyz', 'xyz'),
(3, 'avz 835', 'Ali Khan', 'xyz street', '26', '12345-6789012-3', 'IT', 'Male', '+9236797533', 'Suzuki', 'Cultus 2011'),
(4, 'bfr 541', 'Jhon dae', 'xyz street 2nd Road', '35', '12345-6789012-1', 'Chemical Industry', 'Male', '+92367975323', 'Suzuki', 'Cultus 2016'),
(5, 'AVE 986', 'Jawed', 'xyz street 3rd Road', '40', '12345-6786012-3', 'Computer Engineering', 'Male', '+9236797536', 'Toyota', 'Corolla 2012'),
(6, 'BWJ-698', 'Anus', 'xyz street 2nd road', '31', '12345-6780012-3', 'Mechanical', 'Male', '+9236797531', 'Suzuki', 'Alto 2023'),
(7, 'AKL-909', 'Saleem', 'xyz street', '30', '12345-6789012-5', 'Computer science', 'Male', '+92367975332', 'Honda', 'Civic 2007'),
(8, 'AED 832', 'Hamza', 'xyz street', '25', '12345-6789012-2', 'Computer Science', 'Male', '+9236797535', 'Honda', 'City 2004'),
(9, 'ACQ-222', 'Aqib', 'xyz street 3rd building', '29', '12345-6789012-8', 'Artificial Intelligence', 'Male', '+9236797539', 'Suzuki', 'Mehran 2002');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `vehicle_vehicle`
--
ALTER TABLE `vehicle_vehicle`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plate_number` (`plate_num`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `vehicle_vehicle`
--
ALTER TABLE `vehicle_vehicle`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
