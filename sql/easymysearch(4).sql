-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 20, 2018 at 07:44 AM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `easymysearch`
--

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_delete` int(1) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `is_active`, `is_delete`, `created`, `updated`) VALUES
(1, 'Nashik', 1, 0, '2018-06-16 12:01:50', '2018-06-17 14:45:18'),
(2, 'Pune', 1, 0, '2018-06-16 12:01:50', NULL),
(3, 'chopda', 1, 1, '2018-06-16 12:01:50', NULL),
(4, 'Mumbai', 1, 0, '2018-06-16 12:01:50', NULL),
(5, 'bm', 1, 1, '2018-06-16 12:01:50', NULL),
(6, 'Gurgaon', 1, 0, '2018-06-16 12:01:50', NULL),
(7, 'Delhi', 1, 0, '2018-06-16 12:01:50', NULL),
(8, 'Noida', 1, 0, '2018-06-16 12:01:50', NULL),
(9, 'Jaipur', 1, 1, '2018-06-16 12:20:47', '2018-06-16 12:21:34');

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('dr6apba5n5ep1vbsmf68do0pqgvhq0co', '127.0.0.1', 1529457255, '__ci_last_regenerate|i:1529456984;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1529422069\";last_check|i:1529456605;'),
('i5elvjbj71q9em2uqkg0m0sussgic2t5', '127.0.0.1', 1529456901, '__ci_last_regenerate|i:1529456599;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1529422069\";last_check|i:1529456605;'),
('vtg33v916v670t4hudmg75tuefjbn9o1', '127.0.0.1', 1529457599, '__ci_last_regenerate|i:1529457297;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1529422069\";last_check|i:1529456605;'),
('ssekpcfg71g1vog6rleur82lnvdh6jbn', '127.0.0.1', 1529457878, '__ci_last_regenerate|i:1529457600;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1529422069\";last_check|i:1529456605;'),
('fl0q0o6qru6j3hqakpuevqcr2o8gsris', '127.0.0.1', 1529458352, '__ci_last_regenerate|i:1529458075;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1529422069\";last_check|i:1529456605;'),
('9jlisc0ttgngr57v0ne8avc07vlh2o94', '127.0.0.1', 1529458676, '__ci_last_regenerate|i:1529458390;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1529422069\";last_check|i:1529456605;'),
('5lgqjldudjqugkccmsgomh9ih6opb4b3', '127.0.0.1', 1529458968, '__ci_last_regenerate|i:1529458693;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1529422069\";last_check|i:1529456605;'),
('bskhie5j9afo4nhrbqan1ut2o6jdu02o', '127.0.0.1', 1529459127, '__ci_last_regenerate|i:1529459018;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1529422069\";last_check|i:1529456605;'),
('94nj4r9iknk2425a44s4q3nrnltjh2f8', '127.0.0.1', 1529459931, '__ci_last_regenerate|i:1529459714;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1529422069\";last_check|i:1529456605;');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `gst_no` varchar(50) DEFAULT NULL,
  `aadhar_no` varchar(50) DEFAULT NULL,
  `pencard_no` varchar(50) DEFAULT NULL,
  `company_address` varchar(255) DEFAULT NULL,
  `company_owner` varchar(255) DEFAULT NULL,
  `phone1` varchar(20) DEFAULT NULL,
  `phone2` varchar(20) DEFAULT NULL,
  `servicetypes_id` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `logitude` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `zip_code` varchar(50) DEFAULT NULL,
  `ranges` int(11) NOT NULL,
  `aadhar_doc` varchar(100) NOT NULL,
  `pencard_doc` varchar(100) DEFAULT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL COMMENT '1 Active  0 Inactive',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `slug`, `gst_no`, `aadhar_no`, `pencard_no`, `company_address`, `company_owner`, `phone1`, `phone2`, `servicetypes_id`, `email`, `location`, `state`, `city`, `latitude`, `logitude`, `country`, `zip_code`, `ranges`, `aadhar_doc`, `pencard_doc`, `is_delete`, `is_active`, `created`, `updated`) VALUES
(1, 'Tech Mahindra', '5b27db1d5532d', NULL, NULL, NULL, '30/169 Agra road Jaipur', 'Marcus Miller', '9632589632', NULL, 1, 'marcus@mailinator.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, 0, 1, '2018-06-18 21:42:46', '2018-06-19 02:36:30');

-- --------------------------------------------------------

--
-- Table structure for table `companies_city`
--

CREATE TABLE `companies_city` (
  `id` int(11) NOT NULL,
  `cities_id` int(11) NOT NULL,
  `companies_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `companies_group`
--

CREATE TABLE `companies_group` (
  `id` int(11) NOT NULL,
  `companies_id` int(11) NOT NULL,
  `company_groups_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `companies_package`
--

CREATE TABLE `companies_package` (
  `id` int(11) NOT NULL,
  `companies_id` int(11) NOT NULL,
  `packages_id` int(11) NOT NULL,
  `total_leads` int(11) NOT NULL,
  `used_leads` int(11) NOT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `companies_package`
--

INSERT INTO `companies_package` (`id`, `companies_id`, `packages_id`, `total_leads`, `used_leads`, `created`, `is_active`) VALUES
(1, 1, 2, 60, 60, '2018-06-17 18:30:00', 1),
(2, 1, 2, 120, 120, '2018-06-19 02:04:26', 1),
(3, 1, 2, 120, 0, '2018-06-19 02:10:12', 1);

-- --------------------------------------------------------

--
-- Table structure for table `companies_service`
--

CREATE TABLE `companies_service` (
  `id` int(11) NOT NULL,
  `companies_id` int(11) NOT NULL,
  `services_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `companies_service`
--

INSERT INTO `companies_service` (`id`, `companies_id`, `services_id`, `is_delete`) VALUES
(1, 1, 12, 0),
(2, 1, 13, 0);

-- --------------------------------------------------------

--
-- Table structure for table `company_groups`
--

CREATE TABLE `company_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL,
  `cities_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_delete` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `body` text,
  `variable` text,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `title`, `subject`, `slug`, `body`, `variable`, `created`, `updated`, `is_active`) VALUES
(4, 'Forgot Password', 'Forgot Password', 'forgot-password', '<p>Dear User,</p>\r\n\r\n<p>Your password is reset successfully,&nbsp;</p>\r\n\r\n<p>Please <a href=\"{link}\">click here</a> to create new password.</p>\r\n\r\n<p>Thank you</p>\r\n\r\n<p><strong>Regards,</strong></p>\r\n\r\n<p><strong>Easy My Search</strong></p>', '{link}', '2015-09-29 00:37:15', '2018-06-12 07:22:31', 1),
(6, 'Reset Password', 'Password Reset', 'reset-password', '<p>Dear User</p>\r\n\r\n<p>As per your request , Your password has been reset</p>\r\n\r\n<p>New Password : <strong>{password} </strong></p>\r\n\r\n<p>This is auto generated password. You are advised to change your password as per you convenience.</p>\r\n\r\n<p><strong>Regards,</strong></p>\r\n\r\n<p><strong>Easy My Search</strong></p>\r\n\r\n<p>&nbsp;</p>', '{password}', '2016-03-03 19:22:20', '2018-06-12 07:21:57', 1),
(7, 'Two Step Authentication', 'EasyMySearch Login Verification', 'two-step-authentication', '<p>Dear User,</p>\r\n\r\n<p><strong>{code} </strong>is your one time password (OTP) for email verification to complete the login process</p>\r\n\r\n<p>Thank you</p>\r\n\r\n<p><strong>Regards,</strong></p>\r\n\r\n<p><strong>Easy My Search Team</strong></p>', '{code}', '2018-03-10 19:30:22', '2018-06-12 07:22:13', 1);

-- --------------------------------------------------------

--
-- Table structure for table `flash_messages`
--

CREATE TABLE `flash_messages` (
  `id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `group` varchar(255) NOT NULL DEFAULT 'Unknown',
  `order` int(11) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flash_messages`
--

INSERT INTO `flash_messages` (`id`, `key`, `value`, `group`, `order`, `updated`) VALUES
(1, 'LinkExpired', 'Sorry! This link has been expired.', 'General', 1, '2018-02-22 03:30:06'),
(2, 'InvalidRequest', 'Invalid request.', 'General', 2, '2018-02-22 03:30:06'),
(3, 'SubadminUpdateSuccess', 'Subadmin updted successfully.', 'Subadmin', 1, '2018-02-22 03:30:06'),
(4, 'SubadminAddSuccess', 'Subadmin added successfully.', 'Subadmin', 2, '2018-02-22 03:30:06'),
(5, 'SubadminPermissionUpdateSuccess', 'Your Permission Update Success.', 'Subadmin', 3, '2018-02-22 03:30:06'),
(6, 'SubadminDeleteSuccess', 'Subadmin deleted successfully.', 'Subadmin', 4, '2018-02-22 03:30:06'),
(7, 'SubadminActiveSuccess', 'Subadmin Active Successfully.', 'Subadmin', 5, '2018-02-22 03:30:06'),
(8, 'SubadminInactiveSuccess', 'Subadmin Inactive Successfully.', 'Subadmin', 6, '2018-02-22 03:30:06'),
(9, 'SettingUpdateSuccess', 'Setting updted successfully.', 'Setting', 1, '2018-02-22 03:30:06'),
(10, 'PasswordChangeSuccess', 'Password changed successfully.', 'Setting', 2, '2018-02-22 03:30:06'),
(11, 'EmailTemplateUpdateSuccess', 'Email Template updated successfully.', 'Email Template', 1, '2018-06-14 00:56:13'),
(12, 'EmailTemplateAddSuccess', 'Email Template added successfully.', 'Email Template', 2, '2018-02-22 03:30:06'),
(13, 'EmailTemplateDeleteSuccess', 'Email Template deleted successfully.', 'Email Template', 3, '2018-02-22 03:30:06'),
(14, 'EmailTemplateActiveSuccess', 'Email Template Active Successfully.', 'Email Template', 4, '2018-02-22 03:30:06'),
(15, 'EmailTemplateInactiveSuccess', 'Email Template Inactive Successfully.', 'Email Template', 5, '2018-02-22 03:30:06'),
(16, 'PermissionUpdateSuccess', 'Permission updted successfully.', 'Permission', 1, '2018-02-22 03:30:06'),
(17, 'PermissionAddSuccess', 'Permission added successfully.', 'Permission', 2, '2018-02-22 03:30:06'),
(18, 'PermissionKeyExist', 'Permission key already exist.', 'Permission', 3, '2018-02-22 03:30:06'),
(19, 'PermissionDeleteSuccess', 'Permission deleted successfully.', 'Permission', 4, '2018-02-22 03:30:06'),
(20, 'ProfileUpdatedSuccess', 'Profile updated successfully.', 'Setting', 3, '2018-02-22 03:30:06'),
(21, 'FileNotExist', 'File Does not exist', 'General', 3, '2018-02-22 03:30:06'),
(22, 'ChangeProfileSuccess', 'Your profile updated successfully.', 'Setting', 4, '2018-03-09 16:36:28'),
(23, 'LogDeleteSuccess', 'Log file deleted successfully.', 'Logs', 1, '2018-03-09 17:54:04'),
(24, 'DatabaseBackUpCreated', 'Database backup file created successfully.', 'Database Backup', 1, '2018-03-11 11:08:52'),
(25, 'DatabaseBackUpDeleteSuccess', 'Backup file deleted successfully', 'Database Backup', 2, '2018-03-11 10:37:12'),
(26, 'CompanyAddSuccess', 'Company added successfully.', 'Company', 1, '2018-06-14 00:55:16'),
(27, 'CompanyUpdateSuccess', 'Company updated successfully.', 'Company', 2, '2018-06-14 00:56:04'),
(28, 'CompanyDeleteSuccess', 'Company deleted successfully.', 'Company', 3, '2018-06-14 00:56:44'),
(29, 'CompanyActiveSuccess', 'Company Active Successfully.', 'Company', 4, '2018-06-14 00:57:20'),
(30, 'CompanyInactiveSuccess', 'Company Inactive Successfully.', 'Company', 5, '2018-06-14 00:57:52'),
(31, 'GroupAddSuccess', 'Group added successfully.', 'Group', 1, '2018-06-14 16:11:34'),
(32, 'GroupUpdateSuccess', 'Group updated successfully.', 'Group', 2, '2018-06-14 16:11:54'),
(33, 'GroupDeleteSuccess', 'Group deleted successfully.', 'Group', 3, '2018-06-14 16:12:12'),
(34, 'GroupActiveSuccess', 'Group Active successfully.', 'Group', 4, '2018-06-14 16:12:32'),
(35, 'GroupInactiveSuccess', 'Group Inactive successfully.', 'Group', 5, '2018-06-14 16:12:45'),
(36, 'ServiceUpdateSuccess', 'Sub Service updted successfully.', 'SubService', 1, '2018-06-16 08:44:36'),
(37, 'ServiceAddSuccess', 'Sub Service added successfully.', 'SubService', 2, '2018-06-16 08:44:50'),
(38, 'ServiceDeleteSuccess', 'Sub Service deleted successfully.', 'SubService', 3, '2018-06-16 08:45:10'),
(39, 'ServiceActiveSuccess', 'Sub Service Active Successfully.', 'SubService', 4, '2018-06-16 08:46:03'),
(40, 'ServiceInactiveSuccess', 'Sub Service Inactive Successfully.', 'SubService', 5, '2018-06-16 08:46:31'),
(41, 'ServicetypeUpdateSuccess', 'Service updted successfully.', 'Service', 1, '2018-06-16 08:46:49'),
(42, 'ServicetypeAddSuccess', 'Service added successfully.', 'Service', 2, '2018-06-16 08:46:55'),
(43, 'ServicetypeDeleteSuccess', 'Service deleted successfully.', 'Service', 3, '2018-06-16 08:47:01'),
(44, 'ServicetypeActiveSuccess', 'Service Active Successfully.', 'Service', 4, '2018-06-16 08:47:05'),
(45, 'ServicetypeInactiveSuccess', 'Service Inactive Successfully.', 'Service', 5, '2018-06-16 08:47:10'),
(46, 'PackageUpdateSuccess', 'Package updted successfully.', 'Package', 1, '2018-06-17 14:40:49'),
(47, 'PackageAddSuccess', 'Package added successfully.', 'Package', 2, '2018-06-17 14:40:49'),
(48, 'PackageDeleteSuccess', 'Package deleted successfully.', 'Package', 3, '2018-06-17 14:40:49'),
(49, 'PackageActiveSuccess', 'Package Active Successfully.', 'Package', 4, '2018-06-17 14:40:49'),
(50, 'PackageInactiveSuccess', 'Package Inactive Successfully.', 'Package', 5, '2018-06-17 14:40:49'),
(51, 'CityUpdateSuccess', 'City updted successfully.', 'City', 1, '2018-06-17 14:43:38'),
(52, 'CityAddSuccess', 'City added successfully.', 'City', 2, '2018-06-17 14:43:38'),
(53, 'CityDeleteSuccess', 'City deleted successfully.', 'City', 3, '2018-06-17 14:43:38'),
(54, 'CityActiveSuccess', 'City Active Successfully.', 'City', 4, '2018-06-17 14:43:38'),
(55, 'CityInactiveSuccess', 'City Inactive Successfully.', 'City', 5, '2018-06-17 14:43:38'),
(56, 'FollowUpUpdateSuccess', 'FollowUp updted successfully.', 'FollowUp', 1, '2018-06-17 17:46:11'),
(57, 'FollowUpAddSuccess', 'FollowUp added successfully.', 'FollowUp', 2, '2018-06-17 17:46:11'),
(58, 'FollowUpDeleteSuccess', 'FollowUp deleted successfully.', 'FollowUp', 3, '2018-06-17 17:46:11'),
(59, 'FollowUpActiveSuccess', 'FollowUp Active Successfully.', 'FollowUp', 4, '2018-06-17 17:46:11'),
(60, 'FollowUpInactiveSuccess', 'FollowUp Inactive Successfully.', 'FollowUp', 5, '2018-06-17 17:46:11'),
(61, 'CompanyPackageAddSuccess', 'Company package added successfully.', 'Company', 6, '2018-06-19 02:12:28'),
(62, 'CompanyPackageDeleteRestrict', 'The package have used leads so you can not delete this.', 'Company', 7, '2018-06-19 02:13:34'),
(63, 'CompanyPackageInactiveSuccess', 'Company Package Inactive successfully', 'Company', 8, '2018-06-19 02:14:18'),
(64, 'CompanyPackageActiveSuccess', 'Company Package active successfully', 'Company', 9, '2018-06-19 02:14:34');

-- --------------------------------------------------------

--
-- Table structure for table `follow_up`
--

CREATE TABLE `follow_up` (
  `id` int(11) NOT NULL,
  `member_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `follow_up_date` date DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL COMMENT '1 Not interested 2 Meeting 3 Payment Done 4  Again Follow up Date',
  `phone_number` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `client_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `follow_up`
--

INSERT INTO `follow_up` (`id`, `member_name`, `follow_up_date`, `status_id`, `phone_number`, `email`, `client_name`, `is_delete`, `is_active`, `created`, `updated`) VALUES
(1, 'dddd', '2018-04-17', 2, '2', 'd', '', 1, 1, '2018-06-17 16:53:05', NULL),
(2, 'eee', '2018-04-30', 0, 'e', 'e', '', 1, 1, '2018-06-17 16:53:05', NULL),
(3, 'dhiraj  chaudhari dhiraj', '2018-04-04', 2, '123456555555555555', 'dhiraj@gmail.commmmmmmmmmmmmm', '', 1, 0, '2018-06-17 16:53:05', NULL),
(4, 'msw', '2018-04-02', 3, '02369852', 'abhi@msw.com', 'dhiraj', 0, 1, '2018-06-17 16:53:05', '2018-06-17 17:47:00'),
(5, 'dd', '0000-00-00', 0, '', '', '', 1, 1, '2018-06-17 16:53:05', NULL),
(6, 'abc', '2018-04-09', 4, '7895632587141', 'abc@gmail.com', 'xyz', 1, 0, '2018-06-17 16:53:05', NULL),
(7, 'Motilal soni', '2018-06-28', 1, '9024978491', 'motilalsoni@gmail.com', 'Marcus', 0, 1, '2018-06-17 17:03:32', '2018-06-17 17:28:13');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User'),
(3, 'subadmin', 'Sub Admins');

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE `leads` (
  `id` int(11) NOT NULL,
  `portals_id` int(11) NOT NULL,
  `record_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `zip` varchar(50) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `service_name` varchar(255) DEFAULT NULL,
  `service_from` varchar(255) DEFAULT NULL,
  `service_to` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 pending 1 sent',
  `is_delete` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `leads`
--

INSERT INTO `leads` (`id`, `portals_id`, `record_id`, `name`, `email`, `location`, `latitude`, `longitude`, `city`, `state`, `country`, `zip`, `phone_number`, `service_name`, `service_from`, `service_to`, `message`, `date`, `created`, `updated`, `status`, `is_delete`, `is_active`) VALUES
(6, 3, NULL, 'Meta tag delete', 'rakeshss@gmail.com', 'dsdsfs', '', '', '', '', '', '', '3434353422', NULL, NULL, NULL, 'dfdfg', '0000-00-00', '2018-06-15 01:11:29', '2018-06-15 01:40:45', 0, 0, 1),
(7, 3, 6, 'Meta tag delete', 'rakeshss@gmail.com', 'dsdsfs', '', '', '', '', '', '', '3434353422', NULL, NULL, NULL, 'dfdfg', '0000-00-00', '2018-06-15 01:11:29', '2018-06-15 01:40:47', 0, 0, 1),
(8, 3, 9, 'Meta tag delete', 'rakeshss@gmail.com', 'dsdsfs', '', '', '', '', '', '', '3434353422', NULL, NULL, NULL, 'dfdfg', '0000-00-00', '2018-06-15 01:20:46', '2018-06-20 01:44:29', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `leads_return_history`
--

CREATE TABLE `leads_return_history` (
  `id` int(11) NOT NULL,
  `leads_id` int(11) NOT NULL,
  `companies_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `approve_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'o for pending 1 for approve',
  `approve_by` int(11) UNSIGNED DEFAULT NULL,
  `approve_date` datetime DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `leads_return_history`
--

INSERT INTO `leads_return_history` (`id`, `leads_id`, `companies_id`, `reason`, `approve_status`, `approve_by`, `approve_date`, `created`) VALUES
(1, 7, 1, 'no reason', 0, 1, NULL, '2018-06-19 09:19:41');

-- --------------------------------------------------------

--
-- Table structure for table `leads_sent_history`
--

CREATE TABLE `leads_sent_history` (
  `id` int(11) NOT NULL,
  `leads_id` int(11) NOT NULL,
  `companies_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '1 for sent , 2 for return ',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `leads_sent_history`
--

INSERT INTO `leads_sent_history` (`id`, `leads_id`, `companies_id`, `status`, `created`) VALUES
(1, 6, 1, 1, '2018-06-19 05:59:30'),
(2, 7, 1, 2, '2018-06-19 05:59:53');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `duration` int(11) NOT NULL,
  `amount` float(10,2) NOT NULL,
  `description` text,
  `no_of_leads` int(11) NOT NULL,
  `package_type` int(11) NOT NULL COMMENT '1 single , 2 combo',
  `servicetypes_id` int(11) DEFAULT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `name`, `duration`, `amount`, `description`, `no_of_leads`, `package_type`, `servicetypes_id`, `is_delete`, `is_active`, `created`, `updated`) VALUES
(2, 'Gold', 90, 999.00, 'gold is highest package of this ', 120, 1, 1, 0, 1, '2018-06-18 16:11:09', '2018-06-18 16:17:55');

-- --------------------------------------------------------

--
-- Table structure for table `packages_service`
--

CREATE TABLE `packages_service` (
  `id` int(11) NOT NULL,
  `packages_id` int(11) NOT NULL,
  `services_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `packages_service`
--

INSERT INTO `packages_service` (`id`, `packages_id`, `services_id`, `is_delete`) VALUES
(1, 2, 13, 0);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL DEFAULT 'Unknown',
  `order` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `name`, `group`, `order`) VALUES
(21, 'email_templates-index', 'Email Template Listing', 'Email Templates', 1),
(22, 'email_templates-edit', 'Email Template Edit', 'Email Templates', 2),
(23, 'email_templates-status', 'Email Template Manage Status', 'Email Templates', 3),
(44, 'settings-index', 'Site Setting', 'Settings', 1),
(45, 'company-index', 'Company Listing', 'Company', 1),
(46, 'company-add', 'Company Add', 'Company', 2),
(47, 'company-edit', 'Company Edit', 'Company', 3),
(48, 'company-delete', 'Company Delete', 'Company', 4),
(49, 'company-status', 'Company Change Status', 'Company', 5),
(50, 'group-index', 'Group Listing', 'Group', 1),
(51, 'group-add', 'Group Add', 'Group', 2),
(52, 'group-edit', 'Group Edit', 'Group', 3),
(53, 'group-delete', 'Group Delete', 'Group', 4),
(54, 'group-status', 'Group Change Status', 'Group', 5),
(55, 'servicetype-index', 'Service Listing', 'Service', 1),
(56, 'servicetype-add', 'Service Add', 'Service', 2),
(57, 'servicetype-edit', 'Service Edit', 'Service', 3),
(58, 'servicetype-delete', 'Service Delete', 'Service', 4),
(59, 'servicetype-status', 'Service Change Status', 'Service', 5),
(60, 'service-index', 'Sub Service Listing', 'Sub Service', 1),
(61, 'service-add', 'Sub Service Add', 'Sub Service', 2),
(62, 'service-edit', 'Sub Service Edit', 'Sub Service', 3),
(63, 'service-delete', 'Sub Service Delete', 'Sub Service', 4),
(64, 'service-status', 'Sub Service Change Status', 'Sub Service', 5),
(65, 'lead-index', 'Lead Listing', 'Lead', 1),
(66, 'lead-add', 'Lead Add', 'Lead', 2),
(67, 'lead-edit', 'Lead Edit', 'Lead', 3),
(68, 'lead-delete', 'Lead Delete', 'Lead', 4),
(69, 'lead-status', 'Lead Change Status', 'Lead', 5),
(70, 'city-index', 'City Listing', 'City', 1),
(71, 'city-add', 'City Add', 'City', 2),
(72, 'city-edit', 'City Edit', 'City', 3),
(73, 'city-delete', 'City Delete', 'City', 4),
(74, 'city-status', 'City Change Status', 'City', 5),
(75, 'follow_up-index', 'Follow_Up Listing', 'Follow_Up', 1),
(76, 'follow_up-add', 'Follow_Up Add', 'Follow_Up', 2),
(77, 'follow_up-edit', 'Follow_Up Edit', 'Follow_Up', 3),
(78, 'follow_up-delete', 'Follow_Up Delete', 'Follow_Up', 4),
(79, 'follow_up-status', 'Follow_Up Change Status', 'Follow_Up', 5),
(80, 'package-index', 'Package Listing', 'Package', 1),
(81, 'package-add', 'Package Add', 'Package', 2),
(82, 'package-edit', 'Package Edit', 'Package', 3),
(83, 'package-delete', 'Package Delete', 'Package', 4),
(84, 'package-status', 'Package Change Status', 'Package', 5),
(85, 'company-package-delete', 'Delete Company Package', 'Company', 6),
(86, 'comapny-package-status', 'Change Company Package Status', 'Company', 7),
(87, 'company-add-package', 'Add Company Package', 'Company', 8);

-- --------------------------------------------------------

--
-- Table structure for table `portals`
--

CREATE TABLE `portals` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `site_link` varchar(255) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `portals`
--

INSERT INTO `portals` (`id`, `name`, `site_link`, `is_delete`, `is_active`, `created`, `updated`) VALUES
(1, 'PestoMart', 'https://www.pestomart.com/', 0, 1, '2018-06-19 17:01:12', '2018-06-19 17:03:05'),
(2, 'EasyMySearch', 'https://easymysearch.com/', 0, 1, '2018-06-19 17:01:12', '2018-06-19 17:03:12'),
(3, 'BookMytempo', 'wwwwrrrrr', 0, 1, '2018-06-19 17:01:12', '2018-06-19 17:04:44');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `servicetypes_id` int(11) NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL COMMENT '1 Active  0 Inactive',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `servicetypes_id`, `code`, `is_delete`, `is_active`, `created`, `updated`) VALUES
(12, 'car', 1, '123', 0, 1, '2018-06-18 16:11:56', '0000-00-00 00:00:00'),
(13, 'auto', 1, '543', 0, 1, '2018-06-18 16:12:12', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `servicetypes`
--

CREATE TABLE `servicetypes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `portals_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `servicetypes`
--

INSERT INTO `servicetypes` (`id`, `name`, `code`, `portals_id`, `is_delete`, `is_active`, `created`, `updated`) VALUES
(1, 'Vehichle', '102', 2, 0, 1, '2018-06-18 16:11:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `field_name` varchar(255) DEFAULT NULL,
  `type` enum('text','textarea','select','radio') NOT NULL DEFAULT 'text',
  `select_items` text COMMENT 'Comma saprated value',
  `value` text,
  `is_required` tinyint(4) NOT NULL DEFAULT '0',
  `validation_rules` text,
  `created` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `title`, `field_name`, `type`, `select_items`, `value`, `is_required`, `validation_rules`, `created`, `is_active`) VALUES
(1, 'Site Title', 'site_title', 'text', '', 'Easy My Search', 1, 'trim|required', '2013-04-07 23:23:25', 1),
(2, 'Site Email', 'site_email', 'text', '', 'support@example.com', 1, 'trim|required|valid_email', '2013-04-07 23:24:28', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `two_step_authentication` tinyint(1) NOT NULL DEFAULT '0',
  `authentication_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `multi_session` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `two_step_authentication`, `authentication_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `multi_session`) VALUES
(1, '127.0.0.1', 'admin', '$2y$08$X.wo1a1ctWWqF/tiLCx.wubIZsXlKjpxjZNsHwi0ooBkuxL1Muple', NULL, 'admin@admin.com', '', '41OxdsvwogkRPa7YoTUUku1b6c8113ad4e2f5ac2', 1508057752, NULL, 0, NULL, 1528767362, 1529456605, 1, 'Super', 'Admin', 'ADMIN', '', 0),
(7, '157.37.132.82', NULL, '$2y$08$v8Dp4PROqvlpO5G5SVMWc..U9K4RYsyxAsrfTrG/EBy/c.rF6AO9C', NULL, 'motilalsoni@gmail.com', NULL, NULL, NULL, NULL, 0, NULL, 1520696550, 1528938250, 1, 'Motilal', 'Soni', NULL, '90324978491', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(8, 7, 3);

-- --------------------------------------------------------

--
-- Table structure for table `users_permissions`
--

CREATE TABLE `users_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `last_activity_idx` (`timestamp`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `servicetypes_id` (`servicetypes_id`);

--
-- Indexes for table `companies_city`
--
ALTER TABLE `companies_city`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities_id` (`cities_id`),
  ADD KEY `companies_id` (`companies_id`);

--
-- Indexes for table `companies_group`
--
ALTER TABLE `companies_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `companies_id` (`companies_id`),
  ADD KEY `company_groups_id` (`company_groups_id`);

--
-- Indexes for table `companies_package`
--
ALTER TABLE `companies_package`
  ADD PRIMARY KEY (`id`),
  ADD KEY `companies_id` (`companies_id`),
  ADD KEY `packages_id` (`packages_id`);

--
-- Indexes for table `companies_service`
--
ALTER TABLE `companies_service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `companies_id` (`companies_id`),
  ADD KEY `services_id` (`services_id`);

--
-- Indexes for table `company_groups`
--
ALTER TABLE `company_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `udx_slug` (`slug`);

--
-- Indexes for table `flash_messages`
--
ALTER TABLE `flash_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `follow_up`
--
ALTER TABLE `follow_up`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leads`
--
ALTER TABLE `leads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `portals_id` (`portals_id`);

--
-- Indexes for table `leads_return_history`
--
ALTER TABLE `leads_return_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leads_id` (`leads_id`),
  ADD KEY `companies_id` (`companies_id`),
  ADD KEY `approve_by` (`approve_by`);

--
-- Indexes for table `leads_sent_history`
--
ALTER TABLE `leads_sent_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leads_id` (`leads_id`),
  ADD KEY `companies_id` (`companies_id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `servicetypes_id` (`servicetypes_id`);

--
-- Indexes for table `packages_service`
--
ALTER TABLE `packages_service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `packages_id` (`packages_id`),
  ADD KEY `services_id` (`services_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `portals`
--
ALTER TABLE `portals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `servicetypes`
--
ALTER TABLE `servicetypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `portals_id` (`portals_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- Indexes for table `users_permissions`
--
ALTER TABLE `users_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `permission_id` (`permission_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `companies_city`
--
ALTER TABLE `companies_city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `companies_group`
--
ALTER TABLE `companies_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `companies_package`
--
ALTER TABLE `companies_package`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `companies_service`
--
ALTER TABLE `companies_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `company_groups`
--
ALTER TABLE `company_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `flash_messages`
--
ALTER TABLE `flash_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;
--
-- AUTO_INCREMENT for table `follow_up`
--
ALTER TABLE `follow_up`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `leads`
--
ALTER TABLE `leads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `leads_return_history`
--
ALTER TABLE `leads_return_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `leads_sent_history`
--
ALTER TABLE `leads_sent_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `packages_service`
--
ALTER TABLE `packages_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;
--
-- AUTO_INCREMENT for table `portals`
--
ALTER TABLE `portals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `servicetypes`
--
ALTER TABLE `servicetypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `users_permissions`
--
ALTER TABLE `users_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `companies_ibfk_1` FOREIGN KEY (`servicetypes_id`) REFERENCES `servicetypes` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `companies_city`
--
ALTER TABLE `companies_city`
  ADD CONSTRAINT `companies_city_ibfk_1` FOREIGN KEY (`cities_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `companies_city_ibfk_2` FOREIGN KEY (`companies_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `companies_group`
--
ALTER TABLE `companies_group`
  ADD CONSTRAINT `companies_group_ibfk_1` FOREIGN KEY (`companies_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `companies_group_ibfk_2` FOREIGN KEY (`company_groups_id`) REFERENCES `company_groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `companies_package`
--
ALTER TABLE `companies_package`
  ADD CONSTRAINT `companies_package_ibfk_1` FOREIGN KEY (`companies_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `companies_package_ibfk_2` FOREIGN KEY (`packages_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `companies_service`
--
ALTER TABLE `companies_service`
  ADD CONSTRAINT `companies_service_ibfk_1` FOREIGN KEY (`companies_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `companies_service_ibfk_2` FOREIGN KEY (`services_id`) REFERENCES `services` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `leads`
--
ALTER TABLE `leads`
  ADD CONSTRAINT `leads_ibfk_1` FOREIGN KEY (`portals_id`) REFERENCES `portals` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `leads_return_history`
--
ALTER TABLE `leads_return_history`
  ADD CONSTRAINT `leads_return_history_ibfk_1` FOREIGN KEY (`leads_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `leads_return_history_ibfk_2` FOREIGN KEY (`companies_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `leads_return_history_ibfk_3` FOREIGN KEY (`approve_by`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `leads_sent_history`
--
ALTER TABLE `leads_sent_history`
  ADD CONSTRAINT `leads_sent_history_ibfk_1` FOREIGN KEY (`leads_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `leads_sent_history_ibfk_2` FOREIGN KEY (`companies_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `packages`
--
ALTER TABLE `packages`
  ADD CONSTRAINT `packages_ibfk_1` FOREIGN KEY (`servicetypes_id`) REFERENCES `servicetypes` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `packages_service`
--
ALTER TABLE `packages_service`
  ADD CONSTRAINT `packages_service_ibfk_1` FOREIGN KEY (`packages_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `packages_service_ibfk_2` FOREIGN KEY (`services_id`) REFERENCES `services` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `servicetypes`
--
ALTER TABLE `servicetypes`
  ADD CONSTRAINT `servicetypes_ibfk_1` FOREIGN KEY (`portals_id`) REFERENCES `portals` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `users_groups_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `users_groups_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `users_permissions`
--
ALTER TABLE `users_permissions`
  ADD CONSTRAINT `users_permissions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `users_permissions_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
