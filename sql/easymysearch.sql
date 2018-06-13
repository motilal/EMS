-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2018 at 07:50 AM
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
  `status` tinyint(1) NOT NULL,
  `is_delete` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `status`, `is_delete`) VALUES
(1, 'Nashik', 1, 0),
(2, 'Pune', 1, 0),
(3, 'chopda', 1, 1),
(4, 'Mumbai', 1, 0),
(5, 'bm', 1, 1),
(6, 'Gurgaon', 1, 0),
(7, 'Delhi', 1, 0),
(8, 'Noida', 1, 0);

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
('cqv4bn203nhkb0ecctv6ri6vlfvf11o6', '127.0.0.1', 1528850766, '__ci_last_regenerate|i:1528850679;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1528817592\";last_check|i:1528850684;'),
('12bou63je84kepu83tocd52vpuaatft5', '127.0.0.1', 1528851725, '__ci_last_regenerate|i:1528851479;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1528817592\";last_check|i:1528850684;'),
('h6i2nif0v4riav0f3g1656ul78f1bi0n', '127.0.0.1', 1528852415, '__ci_last_regenerate|i:1528852352;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1528817592\";last_check|i:1528850684;'),
('74sr8srlgvkmovtpc8kqhbm3akhqc3ke', '127.0.0.1', 1528853637, '__ci_last_regenerate|i:1528853420;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1528817592\";last_check|i:1528850684;'),
('k4bqvi5s511fa9slerk3oqvnkmgpnubq', '::1', 1528766361, '__ci_last_regenerate|i:1528766080;'),
('e5nr4htgt84h8jmsurst02t8al80t9eb', '::1', 1528766676, '__ci_last_regenerate|i:1528766385;'),
('593dtf08a5nqvlj04amg9m2i04pohhlj', '::1', 1528766911, '__ci_last_regenerate|i:1528766741;'),
('isifale6jfaoaesi8kvgqs2flgaeblsh', '127.0.0.1', 1528855276, '__ci_last_regenerate|i:1528855025;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1528817592\";last_check|i:1528850684;'),
('rqqblcuneq12ojjhssspjbhbat1nkha0', '::1', 1528766010, '__ci_last_regenerate|i:1528765758;'),
('aeue59vr54mm48mj0ql79iahbou0tqmd', '127.0.0.1', 1528854968, '__ci_last_regenerate|i:1528854718;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1528817592\";last_check|i:1528850684;'),
('ka08dn4t0gh7tm0s7ad67ee1qum5b0ip', '127.0.0.1', 1528854690, '__ci_last_regenerate|i:1528854413;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1528817592\";last_check|i:1528850684;'),
('s857lnto6jrm9l09c29gj6ha3du1ic3s', '127.0.0.1', 1528854001, '__ci_last_regenerate|i:1528853740;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1528817592\";last_check|i:1528850684;'),
('tofa1ptiua28154ulsffqs2miomihpau', '127.0.0.1', 1528854403, '__ci_last_regenerate|i:1528854110;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1528817592\";last_check|i:1528850684;'),
('ehgtuar1fqbh0jnpfppb2676dl1lk3ub', '127.0.0.1', 1528853185, '__ci_last_regenerate|i:1528852940;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1528817592\";last_check|i:1528850684;'),
('vcp29ovpb24rrcjh4o4bpvgfbgqqmsji', '127.0.0.1', 1528856085, '__ci_last_regenerate|i:1528855848;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1528817592\";last_check|i:1528850684;');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `gst_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `aadhar_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pencard_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flg_doc` int(11) DEFAULT NULL,
  `company_owner` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone_2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cities_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `services_id` int(11) NOT NULL,
  `groups_id` int(11) NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `latitude` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `logitude` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `contry` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `zip_code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ranges` int(11) NOT NULL,
  `aadhar_doc` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `pencard_doc` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `packages_id` int(11) NOT NULL,
  `leads_id` int(11) NOT NULL,
  `remaining_leads_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '1 Active  0 Inactive',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `gst_no`, `aadhar_no`, `pencard_no`, `company_address`, `flg_doc`, `company_owner`, `phone_1`, `phone_2`, `cities_id`, `services_id`, `groups_id`, `email`, `location`, `state`, `city`, `latitude`, `logitude`, `contry`, `zip_code`, `ranges`, `aadhar_doc`, `pencard_doc`, `packages_id`, `leads_id`, `remaining_leads_id`, `is_delete`, `status`, `created`) VALUES
(4, 'DC', '77', 'weeeee', 'ACYPQ 2369852', 'pune', 0, 'DC', '741', '5644444', 'a:1:{i:0;s:6:\"Nashik\";}', 0, 0, 'admin@gmail.com', 'Indian Oil Nagar, Shivaji Nagar, Mumbai, Maharashtra, India', 'maharashtra', 'mumbai', '7', '9633', 'india', '11', 10, '', '', 0, 0, 0, 1, 0, '0000-00-00 00:00:00'),
(5, 'MSW', 'awe741', '12345693', 'ACYPQ 2369852', 'Pune Station Bus Stand, Agarkar Nagar, Pune, Maharashtra, India', 0, 'MSW 1', '741852', '852', 'a:4:{i:0;s:6:\"Nashik\";i:1;s:6:\"chopda\";i:2;s:6:\"chopda\";i:3;s:6:\"mumbai\";}', 0, 9, 'msw@gmail.com', 'Nashik Road, Nashik, Maharashtra, India', 'Maharashtra', 'pune', '9633', '8521', 'india', '11', 85, '', '', 0, 0, 0, 1, 1, '0000-00-00 00:00:00'),
(6, 'BMW', '963258', '855269933', '7412369', 'Ozar, Maharashtra, India', 0, 'BMW ', '7777', '888', 'a:1:{i:0;s:6:\"mumbai\";}', 0, 10, 'bmw@gmail.com', 'Nashik, Maharashtra, India', 'Maharashtra', 'Nashik', '52', '528', 'India', '411038', 8596, '', '', 0, 0, 0, 1, 1, '0000-00-00 00:00:00'),
(7, 'Sundaram', '87', '741', '789', 'Nashik', 0, 'Sundaram123', '456', '963', 'a:1:{i:0;s:6:\"Nashik\";}', 0, 10, 'Sundaram@gmail.com', 'Mumbai, Maharashtra, India', 'maharashtra', 'Mumbai', '88996633', '7412589', 'India', '20', 8588, '', '', 0, 0, 0, 1, 1, '0000-00-00 00:00:00'),
(8, 'MI', '', '', '', 'Pune', 0, 'MI', '', '', 'a:4:{i:0;s:6:\"Nashik\";i:1;s:6:\"chopda\";i:2;s:6:\"chopda\";i:3;s:6:\"mumbai\";}', 0, 12, 'mi@gmail.com', 'Pune Station Bus Stand, Sanjay Gandhi Road, Agarkar Nagar, Pune, Maharashtra, India', 'Maharashtra', 'Pune', '', '', '', '11', 0, '', '', 0, 0, 0, 1, 0, '0000-00-00 00:00:00'),
(9, 'Lenovo', '15223322', '', '', 'Lenovo pune', 0, 'Lenovo', '852', '7411', 'a:2:{i:0;s:6:\"Nashik\";i:1;s:4:\"Pune\";}', 0, 11, 'Lenovo@gmail.com', 'Tilak Road, Jadhav Nagar, Vadgaon Budruk, Pune, Maharashtra, India', '', '', '', '', '', '', 0, '', '', 0, 0, 0, 1, 1, '0000-00-00 00:00:00'),
(10, 'abc', '', '', '', '', 0, 'abc', '', '', 'a:2:{i:0;s:6:\"Nashik\";i:1;s:6:\"Mumbai\";}', 0, 0, '', 'Shirpur, Maharashtra, India', 'MH', 'Shirpur', '', '', 'India', '425405', 0, '', '', 0, 0, 0, 1, 1, '0000-00-00 00:00:00'),
(11, 'Google', '444', '444', '444', 'USA', 0, 'google', '111', '222', 'a:1:{i:0;s:6:\"Mumbai\";}', 0, 0, 'google', 'USAF Academy, CO, USA', 'CO', 'U.S. Air Force Academy', '', '', 'United States', '80840', 90, '', '', 6, 0, 0, 0, 0, '2018-04-28 00:00:00'),
(12, 'MI', '1562', '852', 'ACQP', 'Pune Station Bus Stand, Agarkar Nagar, Pune, Maharashtra, India', 0, 'MI', '55', '55', 'a:1:{i:0;s:4:\"Pune\";}', 0, 0, 'mi', 'Pune Station Bus Stand, Sanjay Gandhi Road, Agarkar Nagar, Pune, Maharashtra, India', 'MH', 'Pune', '', '', 'India', '411001', 0, '', '', 9, 0, 0, 0, 0, '2018-04-28 00:00:00'),
(13, 'Lenovo', '77777', '777', '77777', 'Lenovo', 0, 'Lenovo', '777', '8888', 'a:1:{i:0;s:6:\"Nashik\";}', 0, 0, 'Lenovo@gmail.com', 'Kothrud Bus Depot, Eklavya Colony, Kothrud, Pune, Maharashtra, India', 'MH', 'Pune', '', '', 'India', '411038', 230, '', '', 0, 0, 0, 1, 1, '0000-00-00 00:00:00'),
(14, 'Intel', '444', '555666', 'aqcp65656', 'USA', 0, 'Intel', '123', '456', 'a:1:{i:0;s:6:\"Mumbai\";}', 0, 0, 'admin@gmail.com', 'Utersum, Germany', 'SH', 'Utersum', '', '', 'Germany', '25938', 111, '', '', 0, 0, 0, 0, 1, '0000-00-00 00:00:00'),
(15, 'Accenture', '123', '8522', '78963258', 'Pune', 0, 'Accenture', '111', '111', 'a:1:{i:0;s:4:\"Pune\";}', 0, 0, 'abc@gamil.com', 'Hinjawadi Phase 1 Road, Phase 1, Hinjewadi Rajiv Gandhi Infotech Park, Hinjawadi, Pimpri-Chinchwad, Pune, Maharashtra, India', 'MH', 'Pimpri-Chinchwad', '', '', 'India', '411057', 0, '', '', 0, 0, 0, 1, 1, '0000-00-00 00:00:00'),
(16, 'TCS', '88888', '8888', '8888', 'TCS', 0, 'TCS', '55555', '77777', 'a:2:{i:0;s:6:\"Nashik\";i:1;s:6:\"Mumbai\";}', 0, 0, 'TCS', 'Mahatma Gandhi Road, Agarwal Colony, Sadar Bazaar, Pune, Maharashtra, India', 'MH', 'Pune', '', '', 'India', '411001', 111, '', '', 8, 0, 0, 1, 1, '0000-00-00 00:00:00'),
(17, 'MSW', '1234569852', '852963', '852963', 'MSW', 0, 'MSW', '9999', '9999', 'a:1:{i:0;s:6:\"Nashik\";}', 0, 0, 'MSW', 'Mswi Street, Village 1 South, Cape Town, South Africa', 'WC', 'Cape Town', '', '', 'South Africa', '7784', 11, '', '', 9, 0, 0, 0, 0, '2018-05-06 00:00:00'),
(18, 'abcddddd', '', '', '', '', 0, 'ss', '', '', '', 2, 0, '', '', '', '', '', '', '', '', 0, '', '', 6, 0, 0, 0, 0, '2018-04-02 00:00:00'),
(19, 'fastrack', '852', '852963', 'pl789', 'Pune', 0, 'fastrack', '123', '456', '', 2, 0, 'fastrack@gmail.com', 'Kothrud Bus Depot, Eklavya Colony, Kothrud, Pune, Maharashtra, India', 'MH', 'Pune', '122355.333', '9633.369', 'India', '411038', 10, '', '', 8, 0, 0, 0, 1, '2018-04-16 00:00:00');

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

--
-- Dumping data for table `companies_city`
--

INSERT INTO `companies_city` (`id`, `cities_id`, `companies_id`, `is_delete`) VALUES
(7, 4, 18, 0),
(8, 6, 18, 0),
(9, 1, 11, 0),
(10, 2, 11, 0),
(11, 4, 11, 0),
(12, 6, 11, 0),
(13, 7, 11, 0),
(14, 8, 11, 0),
(15, 6, 19, 0),
(16, 7, 19, 0),
(17, 8, 19, 0);

-- --------------------------------------------------------

--
-- Table structure for table `companies_group`
--

CREATE TABLE `companies_group` (
  `id` int(11) NOT NULL,
  `companies_id` int(11) NOT NULL,
  `groups_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `companies_group`
--

INSERT INTO `companies_group` (`id`, `companies_id`, `groups_id`, `is_delete`) VALUES
(1, 10, 9, 0),
(2, 7, 9, 0),
(3, 5, 13, 0),
(4, 2, 14, 0),
(5, 2, 14, 0),
(6, 2, 14, 0),
(7, 5, 14, 0),
(8, 5, 16, 0),
(9, 5, 16, 0),
(10, 5, 16, 0),
(11, 4, 17, 0),
(12, 2, 17, 0),
(13, 1, 17, 0),
(14, 6, 18, 0),
(15, 9, 18, 0),
(16, 5, 15, 0),
(17, 7, 19, 0),
(18, 6, 19, 0),
(19, 2, 19, 0),
(20, 15, 20, 0),
(21, 13, 20, 0),
(22, 16, 20, 0),
(23, 11, 21, 0),
(24, 12, 21, 0),
(25, 7, 22, 0),
(26, 14, 22, 0),
(27, 7, 22, 0),
(28, 7, 23, 0),
(29, 17, 23, 0),
(30, 9, 21, 0),
(31, 3, 24, 0),
(32, 10, 25, 0),
(33, 5, 23, 0),
(34, 10, 23, 0);

-- --------------------------------------------------------

--
-- Table structure for table `companies_services`
--

CREATE TABLE `companies_services` (
  `id` int(11) NOT NULL,
  `companies_id` int(11) NOT NULL,
  `services_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `companies_services`
--

INSERT INTO `companies_services` (`id`, `companies_id`, `services_id`, `is_delete`) VALUES
(2, 18, 3, 0),
(3, 11, 4, 0),
(4, 11, 6, 0),
(5, 19, 4, 0);

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
  `status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `title`, `subject`, `slug`, `body`, `variable`, `created`, `updated`, `status`) VALUES
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
(11, 'EmailTemplateUpdateSuccess', 'Email Template updted successfully.', 'Email Template', 1, '2018-02-22 03:30:06'),
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
(25, 'DatabaseBackUpDeleteSuccess', 'Backup file deleted successfully', 'Database Backup', 2, '2018-03-11 10:37:12');

-- --------------------------------------------------------

--
-- Table structure for table `form_alerts`
--

CREATE TABLE `form_alerts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `short_description` text,
  `image` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `description` text,
  `category` int(11) NOT NULL,
  `meta_keywords` text,
  `meta_description` text,
  `user_id` int(11) DEFAULT NULL,
  `total_views` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `form_alerts`
--

INSERT INTO `form_alerts` (`id`, `title`, `slug`, `short_description`, `image`, `description`, `category`, `meta_keywords`, `meta_description`, `user_id`, `total_views`, `created`, `updated`, `status`) VALUES
(8, 'RPSC 2nd Grade Teacher 2018', 'rpsc-2nd-grade-teacher-2018', 'Here is good news that the candidates, who have been waiting for too long for the results of their notification for RPSC 2nd Grade Teacher recruitment 2018, can finally now take a long and deep breath as the notification regarding the release of the notice has been out now. The expected exam date for RPSC 2nd grade Recruitment 2018. The latest news by RPSC for Syllabus, Eligibility, Result, cut off, No.of Posts, Qualification, Age Limit in this official PDF.', NULL, '<p><strong>RPSC 2nd Grade Teacher Recruitment 2018:</strong> Here is good news that the candidates, who have been waiting for too long for the results of their notification for RPSC 2nd Grade Teacher recruitment 2018, can finally now take a long and deep breath as the notification regarding the release of the notice has been out now.&nbsp;The expected exam date for RPSC&nbsp;2nd grade Recruitment 2018. The latest news by RPSC for Syllabus, Eligibility, Result, cut off, No.of Posts, Qualification, Age Limit in this official PDF.<img alt=\"\" src=\"http://www.kitabijhund.com/kitabijhund/asset/admin/plugin/ckfinder/userfiles/images/2nd-Grade-Recruitment-2018.jpg\" /></p>\r\n\r\n<p>Latest News in July 2018:&amp;nbsp;The real information by the Rajasthan Patrika and Dainik Bhaskar newspaper for the B.E.D Students on the RPSC Online Web Portal. Now you can apply for the application form at the following link. Interested candidates open the link and apply for the post and book the nearest center because after some time the main exam centers are filled after 2-3 days of starting of Apply Online for RPSC Second Grade.</p>', 4, 'RPSC 2nd Grade Teacher Recruitment 2018', 'RPSC 2nd Grade Teacher Recruitment 2018', NULL, 0, '2018-02-10 09:51:57', '2018-03-07 10:21:41', 1),
(9, 'SSC SI & ASI Online Form 2018', 'ssc-si-asi-online-form-2018', 'Staff Selection Commission (SSC)  has announced a notification to conduct Computer Based Examination for the recruitment of Sub Inspector (SI) in Delhi Police, CAPFs, Assistant Sub Inspector (ASI) in CISF vacancies.', NULL, '<p><strong>Application Fee</strong></p>\r\n\r\n<ul>\r\n	<li>General:<strong>&nbsp;Rs. 100/-</strong></li>\r\n	<li>Pay the application fee through SBI Challan/ SBI&nbsp; Net Banking/ Visa/ MasterCard/ Maestro Credit/ Debit card</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;<strong>Important Dates</strong></p>\r\n\r\n<ul>\r\n	<li>Notification Issued:<strong>&nbsp;03-03-2018</strong></li>\r\n	<li>Start Date to Apply Online:<strong>&nbsp;03-03-2018</strong></li>\r\n	<li>Last Date to Apply Online:<strong>&nbsp;02-04-2018</strong></li>\r\n	<li>Last Date for Payment of Fee:<strong>&nbsp;05-04-2018</strong></li>\r\n	<li>Last Date for Challan Generated:<strong>&nbsp;02-04-2018</strong></li>\r\n	<li>Date of Examination for Paper-I:&nbsp;<strong>04-06-2018 to 10-06-2018</strong></li>\r\n	<li>Date of Examination for Paper-II:&nbsp;<strong>01-12-2018</strong></li>\r\n</ul>\r\n\r\n<p><strong>&nbsp;Age Limit as on 01-08-2018</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Minimum:<strong>&nbsp;20 Years</strong></li>\r\n	<li>Maximum:&nbsp;<strong>25 years</strong></li>\r\n	<li>Age relaxation is applicable as per rules</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>', 2, 'SSC Forms', '', NULL, 0, '2018-03-07 03:14:11', '2018-03-24 09:49:23', 1),
(10, 'IDBI Bank Executive Form 2018', 'idbi-bank-executive-form-2018', 'IDBI Bank has announced a notification for the recruitment of Executive vacancies on contract basis at its different Branches and Offices. Those Candidates who are Interested to the following vacancy and completed all Eligibility Criteria can read the Notification &amp;amp;amp; Apply Online.', NULL, '<p><strong>Application Fee</strong></p>\r\n\r\n<ul>\r\n	<li>For all Others (Application fee + Intimation Charges):<strong>&nbsp;Rs. 700/-</strong></li>\r\n	<li>SC/ ST/ PWD (Intimation Charges):&nbsp;<strong>Rs. 150/-</strong></li>\r\n	<li>Pay the fee through online by using Debit Cards (RuPay/ Visa/ MasterCard/ Maestro), Credit Cards, Internet Banking, IMPS, Cash Cards/ Mobile Wallets</li>\r\n</ul>\r\n\r\n<p>&nbsp;<strong>Important Dates</strong></p>\r\n\r\n<ul>\r\n	<li>Starting Date to Apply Online &amp; Payment of Fee:&nbsp;<strong>06-02-2018</strong></li>\r\n	<li>Last Date to Apply Online &amp; Payment of Fee:&nbsp;<strong>28-02-2018</strong></li>\r\n	<li>Last date for printing application:&nbsp;<strong>15-03-2018</strong></li>\r\n	<li>Date of downloading Online Test call letters:&nbsp;<strong>from 17-04-2018</strong></li>\r\n	<li>Date of Pre -Examination training for the SC/ ST/ OBC applicants at all centers:&nbsp;<strong>16-04-2018 to 21-04-2018</strong></li>\r\n	<li>Tentative Date of Written Test:&nbsp;<strong>28-04-2018</strong></li>\r\n</ul>\r\n\r\n<p><strong>&nbsp;Age Limit as on 01-01-2018</strong></p>\r\n\r\n<ul>\r\n	<li>Minimum:<strong>&nbsp;20 Years</strong></li>\r\n	<li>Maximum:&nbsp;<strong>25 Years</strong></li>\r\n	<li>Age relaxation is applicable as per rues</li>\r\n</ul>', 3, 'Banking  jobs', '', NULL, 1, '2018-03-07 03:16:51', '2018-03-24 09:48:41', 1),
(11, 'Two Step Authentication', 'two-step-authentication', 'asads', NULL, '<p>adsa11</p>', 3, 'a', '', NULL, 3, '2018-03-24 12:15:30', '2018-03-24 06:45:45', 1);

-- --------------------------------------------------------

--
-- Table structure for table `form_alerts_categories`
--

CREATE TABLE `form_alerts_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `form_alerts_categories`
--

INSERT INTO `form_alerts_categories` (`id`, `name`, `slug`, `status`) VALUES
(1, 'REET 2018', 'reet-2018', 1),
(2, 'SSC', 'ssc', 1),
(3, 'Banking', 'banking', 1),
(4, 'RPSC', 'rpsc', 1);

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
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `short_description` text CHARACTER SET utf8,
  `start_date` datetime DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` text CHARACTER SET utf8,
  `meta_keywords` text CHARACTER SET utf8,
  `meta_description` text CHARACTER SET utf8,
  `user_id` int(11) DEFAULT NULL,
  `total_views` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `slug`, `short_description`, `start_date`, `image`, `description`, `meta_keywords`, `meta_description`, `user_id`, `total_views`, `created`, `updated`, `status`) VALUES
(7, 'Current affairs 30/01/2018', 'current-affairs-30012018', '1. India and Cambodia signed four agreements in the field of cultural exchange, an exchange line of credit of $26.9 million, memorandum of understanding to cooperate in legal matter and an agreement on prevention of human trafficking.', '2018-01-30 00:00:00', 'images.jpg', '<p>1. India&nbsp;and Cambodia signed four agreements in the field of cultural exchange, an exchange line of credit of $26.9 million, memorandum of understanding to cooperate in legal matter and an agreement on prevention of human trafficking.</p>\r\n\r\n<p>CambodianCambodian Capital- Phnom Penh, Currency- Cambodian riel.</p>\r\n\r\n<p>2. Union Home Ministry is planning to set up Indian Cyber Crime Coordination Centre (I4C), an apex centre to deal with cyber crimes such as financial frauds, circulation of pornographic and communal contents.</p>\r\n\r\n<p>3. The first Khadi Haat of India was launched by Khadi and Village Industries Commission (KVIC) and New Delhi Municipal Council (NDMC), in Connaught Place, New Delhi.</p>\r\n\r\n<p>4. The Chief Minister of Himachal Pradesh, Jai Ram Thakur launched the &lsquo;Shakti&rsquo; app for women&rsquo;s safety in the state. The app was developed by the National Informatics Centre (NIC) of the Himachal Pradesh government.</p>\r\n\r\n<p>Himachal Pradesh Governor- Acharya Dev Vrat.</p>\r\n\r\n<p>5. Trade ministers from various countries including Australia, Japan and Switzerland met for an informal WTO ministerial gathering in Davos, Switzerland. India was represented by Deepak Jagdish Saksena, ambassador and permanent representative to the WTO.</p>\r\n\r\n<p>6. The 60th Annual Grammy Awards, honouring the best achievements from October 2016 to September 2017 were held at Madison Square Garden in New York City, the USA</p>\r\n\r\n<p>&nbsp;It was Bruno Mars&#39; night at the Grammy Awards held in New York, with the three biggest wins - Album Of The Year and Record Of The Year for 24K Magic and Song Of The Year for &#39;That&#39;s What I Like&#39;.</p>\r\n\r\n<p>7. International bird festival is to be held for 3 days starting from 9th February 2018, at Dudhwa National Park, in Lakhimpur Kheri, UP.&nbsp;</p>\r\n\r\n<p>8. Maharashtra State&rsquo;s tableau has been adjudged as the &lsquo;Best Tableau&rsquo; at the 69th Republic Day parade held at Rajghat, Delhi on January 25, 2018.</p>\r\n\r\n<p>9. Sandeep Lamichhane became the first Nepal cricketer to get IPL contract after he was bought by Delhi Daredevils at the 2018 Indian Premier League (IPL) Auction.</p>\r\n\r\n<p>10. Australian open: &nbsp;Roger Federer defeated Marin Cilic in the final. It was Federer&#39;s 20th Grand Slam title. In women&#39;s&#39; single, Caroline Wozniacki became the first Danish player to win a Grand Slam singles title, defeating Simona Halep in the final.</p>\r\n\r\n<p>11. The world no.1 Tai Tzu Ying of Taiwan has defeated Saina Nehwal in the finals of the Indonesia Masters in Jakarta.&nbsp;</p>', 'Current affairs, daily current affairs, today current affairs', '60th Annual Grammy Awards, Shakti app, first Khadi Haat, India and Cambodia signed four agreements, international birds festival, Australian open final results', NULL, 0, '2018-01-30 07:59:31', '2018-01-31 18:26:45', 1),
(8, 'Current affairs 31-01-2018', 'current-affairs-31-01-2018', '1.	Armies of India and Vietnam have begun a six-day-long military exercise in Jabalpur in Madhya Pradesh. The exercise named ‘VINBAX’ is the first military exercise between the two countries. Vietnam’s  Minister Nguyen Xuan Phuc was in New Delhi to participate in the India-ASEAN Commemorative summit and attend the Republic Day celebrations.', '2018-01-31 00:00:00', 'images(1).jpg', '<p>1.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Armies of India and Vietnam have begun a six-day-long military exercise in Jabalpur in Madhya Pradesh. The exercise named &lsquo;VINBAX&rsquo; is the first military exercise between the two countries. Vietnam&rsquo;s &nbsp;Minister Nguyen Xuan Phuc was in New Delhi to participate in the India-ASEAN Commemorative summit and attend the Republic Day celebrations.</p>\r\n\r\n<p>2.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Rating agency CRISIL has revised its outlook on 18 public sector banks (PSBs) from &ldquo;negative&rdquo; to &ldquo;stable&rdquo; after the government announced bank-wise capital infusion and reform plans. Ashu Suyash is the MD and CEO of CRISIL. GurpreetGurpreet Chhatwal President of CRISIL. Its Headquarters in Mumbai. CRISIL- Credit Rating Information Services of India Limited.</p>\r\n\r\n<p>3.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Mobile payments company Paytm and Alibaba Group-owned AGTech Holdings Ltd have formed a joint venture to launch &#39;Gamepind&#39; a gaming platform aimed at mobile users in India.</p>\r\n\r\n<p>4.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Indian-American Adobe CEO Shantanu Narayen has been elected as the Vice Chairman of the US-India Strategic and Partnership Forum. It is a new organisation set up to enhance business relations between India and the US.</p>\r\n\r\n<p>5.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>President Ram Nath Kovind launched the Pulse Polio programme for 2018 from Rashtrapati Bhavan, New Delhi, by administering polio drops to children below five years.</p>\r\n\r\n<p>6.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>The Assam Assembly is to introduce digital budget in its upcoming session, instead of the conventional printed booklet.</p>\r\n\r\n<p>7.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Assam Governor Prof. Jagdish Mukhi released a postage stamp in memory of eminent football player Dr. Talimeren Ao at Sports Authority of India (SAI) complex playground in Paltan Bazar, Guwahati, Assam.</p>\r\n\r\n<p>8.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Information technology minister Ravi Shankar Prasad launched &lsquo;Stree Swabhiman&rsquo;, an initiative by CSC (Common Services Centres) on women&rsquo;s health and hygiene, in New Delhi.</p>\r\n\r\n<p>9.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Union Finance Minister, Arun Jaitley tabled the Economic Survey 2017-18 in Parliament. Economic Survey is a flagship annual document of the Ministry of Finance, Government of India. Indian economy is expected to grow between 7 per cent and 7.5 per cent in the next fiscal year i.e. April 1, 2018 &ndash; March 31, 2019. Economic Survey has revealed that average consumer price inflation based headline inflation declined to a six-year low of 3.3 per cent in 2017-18.</p>\r\n\r\n<p>10.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Thedo-Tibetan Border Police (ITBP) was named the best marching contingent in the paramilitary and auxiliary forces category at the Republic Day celebrations, in New Delhi.</p>\r\n\r\n<p>11.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Finland&rsquo;s incumbent President, Sauli Niinistowon &nbsp;has won second six-year term with an overwhelming 62.7% of the vote.</p>\r\n\r\n<p>12.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Daya Nath Singh, senior journalist, passed away following a short-term illness, at a hospital in Assam.</p>\r\n\r\n<p>13.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Dinesh Nandan Sahay, Chhattisgarh&rsquo;s first Governor passed away in Madhepura, Bihar.</p>', 'Current affairs, daily current affairs, current gk, current affairs today', 'vinbax, India and Vietnam, CRISIL rating, Adobe CEO Shantanu Narayen has been elected as the Vice Chairman, Pulse Polio programme', NULL, 0, '2018-01-31 11:25:50', NULL, 1),
(9, 'Current affairs 01/02/2018', 'current-affairs-01022018', '1.	On January 30, 2018, Uttar Pradesh State Cabinet launched ‘Mukhya Mantri Awas Yojna Grameen’, a new scheme to construct houses in rural areas. Mukhyamantri Awas Yojana Gramin is for those who have not been covered under Pradhan Mantri Awas Yojna and those who are not beneficiaries of any other government housing schemes. UnderUnder this scheme, Rs 1.30 lakh financial aid', '2018-02-01 00:00:00', 'images(3).jpg', '<p>1.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>On January 30, 2018, Uttar Pradesh State Cabinet launched &lsquo;Mukhya Mantri Awas Yojna Grameen&rsquo;, a new scheme to construct houses in rural areas. Mukhyamantri Awas Yojana Gramin is for those who have not been covered under Pradhan Mantri Awas Yojna and those who are not beneficiaries of any other government housing schemes. UnderUnder this scheme, Rs 1.30 lakh financial aid (for constructing houses) will be given to people residing in Naxal-affected areas of Uttar Pradesh and Rs 1.20 lakh to selected beneficiaries.</p>\r\n\r\n<p>2.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>On 30th January 2018, the Maharashtra state cabinet approved the introduction of Asmita (dignity), a scheme to provide sanitary pads to 7 lakh girls in government schools for Rs 5 a pack.</p>\r\n\r\n<p>3.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>India has ranked 42nd on the Economist Intelligence Unit&rsquo;s (EIU) Global Democracy Index 2017. This marks a drop by 10 spots as compared to 32nd rank last year. Topped by Norway.</p>\r\n\r\n<p>4.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Asian Development Bank (ADB) and Indian Government have signed USD 250 million loan agreement for construction of all-weather roads in five Indian states under Pradhan Mantri Gram Sadak Yojana. Funds procured through this loan will be used for construction of 6254 kilometres all-weather rural roads in West Bengal, Chhattisgarh, Assam, Madhya Pradesh and Odisha.</p>\r\n\r\n<p>5.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Prime Minister-appointed Group of Infrastructure, headed by Union Minister Nitin Gadkari constituted a high-level committee to look into procedures for sharing of infrastructure for utilities like water pipes and telecom cables.</p>\r\n\r\n<p>6.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Indian Government and World Bank signed a $100 million loan agreement to promote rural economy in across 26 districts of Tamil Nadu (TN).</p>\r\n\r\n<p>7.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Rewa Ultra Mega Solar Limited (RUMSL) and the World Bank signed USD 30 million loan agreement to develop solar power &nbsp;plants in Rewa and Mandsaur in Madhya Pradesh.</p>\r\n\r\n<p>8.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Lt. Gen Anil Chauhan assumed charge as the new Director General of Military Operations (DGMO) of the Indian Army. Lt. Gen Anil Chauhan replaces Lt General A K Bhatt. Lt General A K &nbsp;will take charge of Srinagar-based 15 Corps.</p>\r\n\r\n<p>9.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Shailendra Kumar Joshi was named the Chief Secretary of Telangana.</p>\r\n\r\n<p>10.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Indian Navy chief Admiral Sunil Lanba&rsquo;s wife Reena Lanba launched the third Scorpene class submarine Karanj at Mazagon Dock Shipbuilders Limited (MDL) in Mumbai, Maharashtra.</p>\r\n\r\n<div>&nbsp;</div>', 'Daily current affairs, current affairs today, today current affairs, gk today, today gk', '', NULL, 0, '2018-02-01 11:16:03', NULL, 0),
(10, 'Budget 2018', 'budget-2018', 'Budget review\r\n\r\nAs per the FM in the Union Budget, India is expected to become the fifth largest economy very soon.', '2018-02-02 00:00:00', 'images(4).jpg', '<p>Budget review</p>\r\n\r\n<p>As per the FM in the Union Budget, India is expected to become the fifth largest economy very soon.&nbsp;</p>\r\n\r\n<p>The Growth rate is expected between 7.2-7.5% in the second half of 2017-18.</p>\r\n\r\n<p>Exports are expected to grow 15% in 2018.</p>\r\n\r\n<p>As per the FM, India is a Rs2.5 trillion economy.</p>\r\n\r\n<p>MSP to increase at least 1.5 times that of production cost.</p>\r\n\r\n<p>Minimum Support Price (MSP) of all crops shall increase to at least 1.5 times that of the production cost.&nbsp;</p>\r\n\r\n<p>The government will set up a fund of Rs 2,000 crore for developing agricultural markets.</p>\r\n\r\n<p>Our focus is on productive and gainful on-farm and non-farm employment for farmers and landless families, says Jaitley.</p>\r\n\r\n<p>MSP for Kharif cost will be 1.5 times the cost of production.</p>\r\n\r\n<p>As per the FM, APMCs will be linked with ENAM.&nbsp;</p>\r\n\r\n<p>The government will develop 22,000 Gramin agricultural markets.&nbsp;</p>\r\n\r\n<p>The cluster-model approach will be adopted for agricultural production.</p>\r\n\r\n<p>Allocation in food production sector doubled to Rs 1400 crore.</p>\r\n\r\n<p>Minimum Support Price shall be increased by 1.5 times. Operation Green will be launched for agriculture and the Minister allocates Rs500 crore for this.</p>\r\n\r\n<p>Agricultural corpus worth Rs 2000 crore will be set up. 470 APMCs have been connected to eNAM network, the rest to be connected by March 2018.</p>\r\n\r\n<p>A fund for the fishery, aquaculture development and animal husbandry will be set up with a total corpus to be Rs 10,000 crore. We will also allocate Rs 1290 crore for a bamboo mission, as it is green gold.&nbsp;</p>\r\n\r\n<p>In all, we are providing Rs 10 lakh crore to Rs 11 lakh crore as credit for agricultural activities.</p>\r\n\r\n<p>Jaitley proposes to increase the target of providing free LPG connections to 8 crore to poor women.</p>\r\n\r\n<p>Ujjwala Yojana, the free LPG connection scheme expanded to eight crore households.</p>\r\n\r\n<p>Six crore toilets have been built already, and in the next year, two crore additional toilets will be constructed.</p>\r\n\r\n<p>The government will provide 4 crore electricity connections to the poor under Saubhagya Yojana.</p>\r\n\r\n<p>Kisan credit card to be extended to fisheries,animal husbandry farmers.</p>\r\n\r\n<p>The government will establish a dedicated affordable housing fund.</p>\r\n\r\n<p>Loans to self-help groups will increase to Rs75,000 crore.</p>\r\n\r\n<p>Govt. allocated Rs5,750 crore to National Livelihood Mission and Rs2,600 crore to the groundwater irrigation scheme.</p>\r\n\r\n<p>Ayushman Bharat program discussed.</p>\r\n\r\n<p>Eklavya schools for tribal children.</p>\r\n\r\n<p>24 new government medical colleges.</p>\r\n\r\n<p>Government is implementing a comprehensive social security scheme.</p>\r\n\r\n<p>Govt. will initiate an integrated B-Ed programme for teachers.</p>\r\n\r\n<p>Government proposes to launch the Revitalising of Infrastructure and Systems of Education (RISE) by next year.&nbsp;</p>\r\n\r\n<p>Govt. proposed to set up two new full-fledged schools of planning and architecture.&nbsp;</p>\r\n\r\n<p>18 new schools of planning and architecture will be set up in the IITs and NITs.</p>\r\n\r\n<p>Rs. 1 lakh crore over 4 years for initiative for Infrastructure Devt. in education.</p>\r\n\r\n<p>2 major initiatives as part of Ayushman Bharat program.</p>\r\n\r\n<p>Eklavya schools to be open for tribal children.</p>\r\n\r\n<p>National health protection scheme to cover 10 cr poor families. Health cover of up to 5 lakh per family per year for poor &amp; vulnerable. National health protection scheme to benefit 50 crore people.</p>\r\n\r\n<p>24 new govt medical college &amp; hospitals.</p>\r\n\r\n<p>Rs. 600 crore for nutritional support to all TB patients.</p>\r\n\r\n<p>Rs. 1200 crore for health and wellness centres.</p>\r\n\r\n<p>Loans to women self-help groups of women to be increased to 75,000 cr by March 19.&nbsp;</p>\r\n\r\n<p>Govt. is launching a new national health protection scheme &ndash; Rashtriya Samaj Beema Yojana. This will have 50 crore beneficiaries and 10 crore families will get 5 lakh per year for their families to cover secondary and tertiary hospital expenses. This is the world&#39;s largest government-funded healthcare program.&nbsp;</p>\r\n\r\n<p>A Rs 600 crore corpus is being set up to help Tuberculosis patients. This will build a new India in 2022 and enhance productivity and will also generate lakhs of jobs for women.&nbsp;</p>\r\n\r\n<p>PM Jeevan Beema Yojana benefitted more than 2 crore families.&nbsp;</p>\r\n\r\n<p>Jan Dhan Yojana will be extended to all 60&nbsp;</p>', 'Budget 2018 review, budget', '', NULL, 0, '2018-02-02 13:28:17', NULL, 1),
(11, 'Current affairs 02/02/2018', 'current-affairs-02022018', '1.	The Central Statistics Office (CSO) revised the gross domestic product (GDP) growth rate for 2015-16 to 8.2% from the earlier estimates of 8% and kept the 2016-17 growth unchanged at 7.1%. The real GDP or GDP at constant (2011-12) prices for the years 2016-17 and 2015-16 stand at Rs121.96 trillion and Rs113.86 trillion respectively, according to the CSO statement. Inn terms of real gross value added (GVA), it stated that the GVA at constant (2011-12) basic prices grew 7.1% in 2016- 17, as against a growth of 8.1% in 2015-16.', '2018-02-02 00:00:00', NULL, '<p>1.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>The Central Statistics Office (CSO) revised the gross domestic product (GDP) growth rate for 2015-16 to 8.2% from the earlier estimates of 8% and kept the 2016-17 growth unchanged at 7.1%. The real GDP or GDP at constant (2011-12) prices for the years 2016-17 and 2015-16 stand at Rs121.96 trillion and Rs113.86 trillion respectively, according to the CSO statement. Inn terms of real gross value added (GVA), it stated that the GVA at constant (2011-12) basic prices grew 7.1% in 2016- 17, as against a growth of 8.1% in 2015-16.&nbsp;</p>\r\n\r\n<p>2.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>7th India Energy Congress focusing on the theme &lsquo;Energy 4.0: Energy Transition Towards 2030&rsquo; &nbsp;begun in New Delhi on February 1, 2018. Indiadia Energy Congress is the flagship event of World Energy Council India (WEC India), which functions under the Union Power Ministry. 7th India Energy Congress has been jointly organised by Union Ministries of Power, Coal, New &amp; Renewable Energy, Petroleum &amp; Natural Gas, External Affairs and Department of Atomic Energy.</p>\r\n\r\n<p>3.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Andhra Pradesh Chief Minister Chandrababu Naidu laid the foundation stone for the Universal Peace Retreat Center of &lsquo;Prajapita Brahmakumari Eswariya University&rsquo; &nbsp;in Amaravati.</p>\r\n\r\n<p>4.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Union Home Ministry has sanctioned nearly Rs. 370 crore to Border Security Force (BSF) and the Indo-Tibetan Border Police (ITBP) to strengthen border infrastructure along Indo-Pak and Indo-China border.</p>\r\n\r\n<p>5.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Indian Railways&rsquo; first high speed electric locomotive which can run at a maximum speed of 120 kmph will be launched in March 2018 during French President Emmanuel Macron&rsquo;s Indian visit.</p>\r\n\r\n<p>6.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Neelam Kapoor was appointed as Director General (DG) of Sports Authority of India (SAI).</p>\r\n\r\n<p>7.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Indian Olympic Association (IOA) named Vikram Singh Sisodia as the Chef-de-Mission for Commonwealth Games (CWG) that will be held in Gold Coast, Australia from April 4 to 15, 2018.</p>\r\n\r\n<p>8.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>mCURA, a Health-tech startup, launched &lsquo;Smart OPD&rsquo;, India&rsquo;s first integrated mobility platform that reduces waiting time in counters and provides e-prescriptions.</p>\r\n\r\n<p>9.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>On 1st February 2018, the Indian Coast Guard celebrated its 41st Foundation Day.</p>\r\n\r\n<div>&nbsp;</div>', 'Current affairs today, current affairs, today current affairs, gk today, daily current affairs', '', NULL, 0, '2018-02-02 13:43:28', NULL, 1),
(12, 'Current affairs 03/02/2018', 'current-affairs-03022018', 'India has defeated Australia to lift the Under 19 World cup for the fourth time. The Men in Blue defeated the three-time champions Australia at Bay Oval, New Zealand. TheThe Australian team had set the target of  217 runs and was chased down easily by India. Manjot Kalra was the Hero of the match with his brilliant century.', '2018-02-03 00:00:00', 'images(6).jpg', '<p>1.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>The first two-day Global Investment Summit has been organized in Assam. The summit emphasises on promoting investments in the state and the North East. The conference was inaugurated by Prime Minister Narendra Modi. &nbsp;Businessmen like Ratan Tata and Mukesh Ambani are taking part in the Summit. Investor&#39;s from Bhutan, Bangladesh, Germany and Japan as well as ASEAN countries will attend the summit.</p>\r\n\r\n<p>2.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>External Affairs Minister (EAM) Sushma Swaraj has returned home after successful completion of the goodwill visit to Nepal. This was the first high-level visit from India after completion of historic three-tier elections in Nepal.</p>\r\n\r\n<p>3.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>The Union Minister for Finance and Corporate Affairs Mr Arun Jaitley launched CriSidEx, India&rsquo;s first sentiment index for micro and small enterprises ( MSEs) developed jointly by CRISIL &amp; SIDBI.</p>\r\n\r\n<p>4.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Alphabet has appointed John L. Hennessy as the new board chairman of the company. Hennessy has been on the board since 2004 and Lead Independent Director since 2007. He has replaced Eric Schmidt.</p>\r\n\r\n<p>5.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Shabnam Asthana was awarded the &#39;Times Power Women of the Year 2017&#39;- Pune for Global PR. The Times Group celebrated the invaluable contribution of women by introducing The Times Power Woman 2017 (Pune) awards.</p>\r\n\r\n<p>6.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>India has defeated Australia to lift the Under 19 World cup for the fourth time. The Men in Blue defeated the three-time champions Australia at Bay Oval, New Zealand. TheThe Australian team had set the target of &nbsp;217 runs and was chased down easily by India. Manjot Kalra was the Hero of the match with his brilliant century.</p>\r\n\r\n<p>7.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>India&rsquo;s leading squash player, Saurav Ghosal jumped five places to No. 14 to become the highest ranked Indian in the latest Professional Squash Association (PSA) rankings.</p>\r\n\r\n<div>&nbsp;</div>', 'Current affairs, current affairs today, today current affairs, gk today, daily current affairs', '', NULL, 0, '2018-02-06 09:54:16', NULL, 1),
(14, 'Current affairs 04/02/2018', 'current-affairs-04022018', '1.	World cancer Day is being observed today. The day is observed on 4th February every year to raise awareness about cancer, its treatment and  methods of its prevention. The primary goal of the day is to reduce the illness and related deaths by 2020. ViceVice President Venkaiah Naidu inaugurated a medical camp at Swarna Bharat Trust, Atkur in Andhra Pradesh organised on the occasion of World Cancer Day.', '2018-02-04 00:00:00', '12_cancer_7.jpg', '<p>1.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>World cancer&nbsp;Day is being observed today. The day is observed on 4th February every year to raise awareness about cancer, its treatment and &nbsp;methods of its prevention. The primary goal of the day is to reduce the illness and related deaths by 2020. ViceVice President Venkaiah Naidu inaugurated a medical camp at Swarna Bharat Trust, Atkur in Andhra Pradesh organised on the occasion of World Cancer Day.&nbsp;</p>\r\n\r\n<p>2.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>According to Union Budget 2018-19, the government will develop two defence industrial production corridors. Defence minister Nirmala Sitharaman announced that the first corridor will link Chennai and Bengaluru and will pass through Coimbatore and several other industrial clusters.</p>\r\n\r\n<p>3.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>The Maharashtra government has decided to set up a Transgender Welfare Board to protect their Constitutional and human rights. This will make Maharashtra the first Indian state to have such a board. An amount of ₹5 crore has also been set aside to provide education, housing, and employment for the transgender community.</p>\r\n\r\n<p>4.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span> February 2 being observed as World Wetlands Day, the floating treatment wetland (FTW), a joint effort of Dhruvansh, the Hyderabad Metropolitan Development Authority and the Ranga Reddy district administration, supported by other organisations, was inaugurated in Hyderabad, Telangana. The India Book of Records recognised it as the largest FTW in the country.</p>\r\n\r\n<p>5.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Sri Lanka celebrated its 70th Independence Day today (4 February 2018). It was on this day in 1948 that Sri Lanka, then Ceylon, gained independence from 133 years of British colonial rule.</p>\r\n\r\n<p>6.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>According to the Economic Survey 2017-18, Maharashtra&rsquo;s has come out to be one of the largest states in terms of its economic size and prosperity gives it the largest share in India&rsquo;s exports and the goods and service tax (GST) base</p>\r\n\r\n<p>7.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>The change of name of apex indirect tax policy making body Central Board of Excise &amp; Customs (CBEC) to Central Board of Indirect Taxes and Customs (CBIC) is likely to happen by April after the budgetary exercise gets Parliament nod. In his budget speech for 2018-19, Finance Minister Arun Jaitley said with the roll out of GST the name of CBEC would be changed to CBIC.</p>\r\n\r\n<p>8.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Star Indian shuttler P. V. Sindhu fell to fifth seeded Beiwen Zhang from the US in the women&rsquo;s singles final of the $350,000 India Open BWF World Tour Super 500 held in New Delhi.</p>\r\n\r\n<div>&nbsp;</div>', 'Current affairs, current affairs today, today current affairs, gk today, daily gk, daily current affairs', '', NULL, 0, '2018-02-06 10:05:17', NULL, 1),
(15, 'Current affairs 05/02/2018', 'current-affairs-05022018', '1. Cyprus President Nicos Anastasiades has won re-election for a second term. The official final result after a second-round run-off put the conservative incumbent on 55.99% of the vote, ahead of Communist-backed Stavros Malas on 44%', '2018-02-05 00:00:00', 'Nicos-Anastasiades-REUT.jpg', '<p>1.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>The First ever International Kala Mela was inaugurated by the Vice President of India, Shri M. Venkaiah Naidu in New Delhi.</p>\r\n\r\n<p>ii. The International Kala Mela has been organised by the Lalit Kala Akademi in partnership with IGNCA of the Ministry of Culture. More than 800 artists from across the world took part in the Festival.</p>\r\n\r\n<p>2.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>The Maharashtra government has approved Ghodazari in Chandrapur district as a new wildlife sanctuary in the state. The decision was taken at the 13th meeting of the Maharashtra State Board for Wildlife, chaired by Chief Minister Devendra Fadnavis.</p>\r\n\r\n<p>3.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Inland Waterways Authority of India (IWAI) has signed a project agreement with the World Bank for Jal Marg Vikas Project on river Ganga. The World Bank entered into a USD 375 million loan agreement with the Department of Economic Affairs, Union Ministry of Finance for Jal Marg Vikas Project (JMVP).</p>\r\n\r\n<p>4.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>The Japan Aerospace Exploration Agency (JAXA) launched the world&rsquo;s smallest rocket with the ability to put a tiny satellite into orbit. The rocket lifted off from the Uchinoura Space Center. ItIt carried a microsatellite TRICOM-1R, a three-unit CubeSat weighing about 3 kilograms. This satellite launch was a re-flight of the TRICOM-1 mission, which was lost in SS-520&rsquo;s failure in 2017.</p>\r\n\r\n<p>5.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>The President of Bangladesh, Abdul Hamid appointed Syed Mahmud Hossain as the new Chief Justice of the country. Justice Hossain is the 22nd chief justice of Bangladesh. President administered the oath of office to Justice Hossain.</p>\r\n\r\n<p>6.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Cyprus President Nicos Anastasiades has won re-election for a second term. The official final result after a second-round run-off put the conservative incumbent on 55.99% of the vote, ahead of Communist-backed Stavros Malas on 44%. Anastasiades has taken credit for steering the economy of Cyprus to recovery after it was plunged into crisis in 2013 by its exposure to debt-wracked Greece and fiscal slippage under a former left-wing administration.</p>\r\n\r\n<p>7.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Indian cricketers Jasprit Bumrah and Harmanpreet Kaur as well India women&rsquo;s hockey team goalkeeper Savita Punia and shooter Heena Sidhu are among Forbes India 30 Under 30 list.</p>\r\n\r\n<div>&nbsp;</div>', 'Current affairs, current affairs today, today current affairs, daily gk, daily current affairs', '', NULL, 0, '2018-02-06 10:12:05', NULL, 1),
(16, 'Current affairs 06/02/2018', 'current-affairs-06022018', '1. External Affairs Minister Sushma Swaraj has left for her first official visit to Saudi Arabia. During the three-day visit, Mrs Swaraj will meet with the Saudi leadership to discuss bilateral, regional and global issues of mutual interest.', '2018-02-06 00:00:00', 'images1.jpg', '<p>1.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>External Affairs Minister Sushma Swaraj has left for her first official visit to Saudi Arabia. During the three-day visit, Mrs Swaraj will meet with the Saudi leadership to discuss bilateral, regional and global issues of mutual interest.</p>\r\n\r\n<p>ii. She will also participate in the inauguration of the prestigious National Heritage and Culture Festival &lsquo;Janadriyah&rsquo;. India is the guest of honour country at the fest.</p>\r\n\r\n<p>2.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>India successfully test-fired the indigenously developed short-range nuclear capable Agni-I ballistic missile. The missile was fired from the Abdul Kalam Island off Odisha coast.</p>\r\n\r\n<p>ii. The test was conducted by the Strategic Force Command of the Indian Army. The range of Missile is 700 km. It was 18th version of Agni-I.</p>\r\n\r\n<p>3.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Ola and the Government of Assam have signed an MoU to pilot an app-based river taxi service in Guwahati. The river taxis will be machine-operated boats and users will be able to book the rides through Ola&#39;s app.</p>\r\n\r\n<p>4.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Uttar Pradesh State government in association with UNICEF has launched massive door to door campaign DASTAK to eradicate deadly Acute Encephalitis</p>\r\n\r\n<p>Syndrome (AES) and Japanise Encephalitis (JE) disease in the state.</p>\r\n\r\n<p>5.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Commerce and Industries Minister Mr Suresh Prabhu set off a series of nation-wide consultations with the industry on the proposed new Industrial Policy. The first consultation was held at Guwahati in February 2018.</p>\r\n\r\n<p>6.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>The Maldives president, Abdulla Yameen, has declared a state of emergency in the country as heavily armed troops stormed the country&rsquo;s top court and a former president Chief Justice Abdulla Saeed was arrested in a deepening political crisis.</p>\r\n\r\n<p>7.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Jerome H Powell was sworn in as the 16th Chairman of the Federal Reserve for a four-year term. Mr Powell has succeeded Janet Yellen, the first woman to lead the US central bank in its 100-year history.</p>\r\n\r\n<div>&nbsp;</div>', 'Current affairs today, today current affairs, daily current affairs, gk today', '', NULL, 0, '2018-02-13 07:27:47', NULL, 1),
(17, 'Current affairs 07/02/2018', 'current-affairs-07022018', '1. The US-based SpaceX has successfully launched the world\'s most powerful operational rocket Falcon Heavy towards Mars. The rocket, carrying a Tesla Roadster car, will revolve around the Sun in a way that will repeatedly bring it close to the Earth and Mars.', '2018-02-07 00:00:00', 'images_(1).jpg', '<p>1.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>The President of India Ram Nath Kovind inaugurated the 88th Mahamastakabhisheka Utsav of Lord Gomateshwara in Hassan district of Karnataka. Mahamastakabhisheka of Gommateshwara, who is also known as Bahubali takes place once in 12 years.&nbsp;</p>\r\n\r\n<p>2.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>India successfully test-fired its indigenously developed nuclear capable Prithvi-II missile as part of a user trial by the Army from Integrated Test Range at Chandipur, in Odisha.</p>\r\n\r\n<p>3.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>The Andhra Pradesh government has decided to hold the first-of-its-kind, one-day Pelican Festival at the Atapaka Bird Sanctuary on Kolleru.</p>\r\n\r\n<p>4.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Google and National Council of Educational Research and Training (NCERT) signed a pact to integrate a course on &#39;Digital Citizenship and Safety&#39; in information and communication technology curriculum. It was signed on the occasion of Safer Internet Day (06th February).</p>\r\n\r\n<p>5.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>External Affairs Minister Sushma Swaraj attended the opening ceremony of the 32nd Al Jana-driyah festival in Riyadh, Saudi Arabia. India has been invited as the Guest of Honour country for the festival.</p>\r\n\r\n<p>6.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>The US-based SpaceX has successfully launched the world&#39;s most powerful operational rocket Falcon Heavy towards Mars. The rocket, carrying a Tesla Roadster car, will revolve around the Sun in a way that will repeatedly bring it close to the Earth and Mars.</p>\r\n\r\n<p>7.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>The Monetary Policy Committee (MPC) decided to keep the policy repo rate under the liquidity adjustment facility (LAF) unchanged at 6.0%.</p>\r\n\r\n<p>ii. Consequently, the Reverse Repo Rate (RRR) under the LAF remains at 5.75%, and the Marginal Standing Facility (MSF) rate and the Bank Rate at 6.25%.</p>\r\n\r\n<p>iii. GVA growth for 2017-18 is projected at 6.6%. GVA growth&nbsp;</p>\r\n\r\n<p>8.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Kathakali maestro Madavoor Vasudevan Nair collapsed on stage and died while performing at Agasthyacodu Mahadeva Temple, Kerala. He was 89.</p>\r\n\r\n<p>9.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Indian women&#39;s cricket team pacer Jhulan Goswami has become the first woman in the world to take 200 wickets in ODI cricket.&nbsp;</p>\r\n\r\n<div>&nbsp;</div>', 'Daily current affairs, current affairs today, today current affairs, current affairs, gk today', '', NULL, 0, '2018-02-13 07:34:34', NULL, 1),
(18, 'Current affairs 08/02/2018', 'current-affairs-08022018', '1.	The Fifth edition of South Asia Region Public Procurement Conference was held in New Delhi. It was hosted by Public Procurement Division (PPD) of Ministry of Finance and All India Management Association (AIMA).', '2018-02-08 00:00:00', 'download.jpg', '<p>1.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>The Fifth edition of South Asia Region Public Procurement Conference was held in New Delhi. It was hosted by Public Procurement Division (PPD) of Ministry of Finance and All India Management Association (AIMA).</p>\r\n\r\n<p>2.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Arunachal Pradesh Chief Minister Prema Khandu laid the foundation stone for Rhododendron Park in Tawang. He also carried out plantation drive of different varieties of Rhodos. Tawang is home to 50+ different varieties of Rhodos.</p>\r\n\r\n<p>3.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>The first ever of its kind in the country chat-based job search mobile app &#39;Empzilla&#39; is being launched that will do away with existing limitations of employers and job seekers making selection process quick and cost-effective.</p>\r\n\r\n<p>4.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Business magazine Forbes has released its first-ever Crypto Rich List, comprising 20 wealthiest people in the cryptocurrency space. The list was topped by Ripple Co-founder Chris Larsen, who is estimated to have a crypto net worth of $7.5-8 billion.</p>\r\n\r\n<p>5.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>The Reserve Bank of India will link the base rate with the MCLR from 1st of April 2018 to ensure expeditious transmission of its policy rate to borrowers. The RBI had introduced the Marginal Cost of Funds based Lending Rates (MCLR) system with effect from 1st April 2016, the Central bank observed that a large proportion of bank loans continue to be linked to Base Rate.</p>\r\n\r\n<p>6.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>The Reserve Bank of India announced setting up ombudsman for addressing customer grievances in the non-banking finance companies. The rules will be laid out by the end of February 2018.</p>\r\n\r\n<p>7.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Actor John Mahoney passed away after a brief illness in Chicago, the USA. He was 77 years old. He was well-known for playing the title character in the &ldquo;Frasier&rdquo; show.</p>\r\n\r\n<div>&nbsp;</div>', 'Current affairs, current affairs today, today current affairs, daily current affairs, gk today', '', NULL, 0, '2018-02-13 08:01:41', NULL, 1),
(19, 'Current affairs 09/02/2018', 'current-affairs-09022018', '1.	Prime Minister Narendra Modi left for his three-nation visit to Palestine, the\r\n\r\nUnited Arab Emirates (UAE) and Oman.\r\n\r\nii. This is the first ever visit by an Indian Prime Minister to Palestine, and Prime Minister Modi\'s second visit to UAE and first to Oman.', '2018-02-09 00:00:00', 'download_(1).jpg', '<p>1.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Prime Minister Narendra Modi left for his three-nation visit to Palestine, the</p>\r\n\r\n<p>United Arab Emirates (UAE) and Oman.</p>\r\n\r\n<p>ii. This is the first ever visit by an Indian Prime Minister to Palestine, and Prime Minister Modi&#39;s second visit to UAE and first to Oman.</p>\r\n\r\n<p>iii. Prime Minister would be addressing the Sixth World Government Summit being held in Dubai, UAE at which India has been extended &#39;Guest of Honour&#39; status.</p>\r\n\r\n<p>2.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>India has increased &ldquo;substantially&rdquo; its score in the International Intellectual Property (IP) Index, ranking 44th among 50 nations, according to the US Chambers of Commerce report. Last year, India ranked 43rd out of 45 countries in the Index.</p>\r\n\r\n<p>ii. The top 3 countries on the list are- The USA, The United Kingdom and Sweden.</p>\r\n\r\n<p>3.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Defence Minister Nirmala Sitharaman has constituted a 13-member advisory committee to monitor and expedite capital acquisition projects for the modernisation of the armed forces. The committee will be headed by Vinay Sheel Oberoi, former secretary in the government</p>\r\n\r\n<p>4.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>The South Central Railway (SCR) has become the first railway zone in the country to complete 100% LED lighting at all the stations under its jurisdiction.</p>\r\n\r\n<p>5.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>The National Highways Authority of India (NHAI) will start a pilot project called &quot;pay as you use&quot; on the Delhi-Mumbai Highway to study and implement the ability of the system in the country.&nbsp;</p>\r\n\r\n<p>6.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Union Minister of State (IC) for Power and New &amp; Renewable Energy, Shri R.K Singh, launched a Web-based monitoring System and a Fly Ash mobile application named ASH TRACK</p>\r\n\r\n<p>7.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>The Competition Commission of India (CCI) has imposed a fine of around Rs. 136 crores on search engine major Google for unfair business practices in the Indian market for online search.</p>\r\n\r\n<p>8.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>IndusInd Bank launched its new Sonic Identity, which is essentially a musical logo called &#39;MOGO&#39;, as part of its branding initiatives.</p>\r\n\r\n<p>9.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>PepsiCo Chairman and CEO Indra Nooyi has been appointed as the International Cricket Council&#39;s (ICC) first-ever independent female director. Nooyi will join the cricket body in June 2018 for a 2-year term.</p>\r\n\r\n<div>&nbsp;</div>', 'Current affairs today, today current affairs, daily current affairs, current affairs daily', '', NULL, 0, '2018-02-13 08:16:55', NULL, 1),
(20, 'Current affairs 10/02/2018', 'current-affairs-10022018', '1.	The first Khelo India School Games concluded in New Delhi with sports powerhouse Haryana topped the overall medal tally. The state won 102 medals which include 38 gold and 26 silver', '2018-02-10 00:00:00', 'images(7).jpg', '<p>1.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>The first Khelo India School Games concluded in New Delhi with sports powerhouse Haryana topped the overall medal tally. The state won 102 medals which include 38 gold and 26 silver.</p>\r\n\r\n<p>2.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>SBI Card, the country&#39;s second-largest credit card issuer, has appointed Hardayal Prasad as new Managing Director (MD) &amp; Chief Executive Officer (CEO) of the</p>\r\n\r\n<p>company.&nbsp;</p>\r\n\r\n<p>3.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>NITI Aayog has released the &lsquo;Healthy States, Progressive India Report&rsquo;. Kerala, Punjab and Tamil Nadu have ranked top among the larger states in terms of overall performance. The report was released by NITI Aayog CEO Amitabh Kant.</p>\r\n\r\n<p>4.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>National Informatics Centre (NIC) has organized a three-day National Meet on Grassroot Informatics- VIVID 2018 at the India Habitat Centre, New Delhi. The Theme for VIVID 2018 is &ldquo;Cyber Security and Innovation&rdquo;.</p>\r\n\r\n<p>5.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Prime Minister Narendra Modi was conferred the &#39;Grand Collar of the State of Palestine&#39; by President of Palestine Mahmoud Abbas, recognising his key contribution to promote relations between India and Palestine</p>\r\n\r\n<p>6.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Dubai witnessed 15% growth in tourist arrivals from India in 2017, hosting 2.1 million visitors, retaining top spot as the source market.</p>\r\n\r\n<p>7.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>National Payments Corporation of India (NPCI) appointed Biswamohan Mahapatra as non-executive chairman for two years with immediate effect.</p>\r\n\r\n<p>8.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>The 23rd Olympic Winter Games officially kicked off with a colourful ceremony at Pyeongchang in South Korea.&nbsp;</p>\r\n\r\n<p>9.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Eminent litterateur Chandrasekhar Rath passed away at the age of 89. He died of old age ailments. He was recently nominated for Padma Shri by the Union government this year for his contribution towards Odia literature.</p>\r\n\r\n<div>&nbsp;</div>', 'Current affairs today, daily current affairs, current affairs, today current affairs, gk today', '', NULL, 0, '2018-02-13 08:24:18', NULL, 1),
(21, 'Current affairs 11/02/2018', 'current-affairs-11022018', '1.	 Direct tax collections grew by nearly 20 per cent between April and January this year with strong growth in both corporate and personal income tax receipts. According to official data released, net direct tax collections grew by 19.3 per cent up to January 2018 to Rs 6.95-lakh crore.', '2018-02-11 00:00:00', 'images(8).jpg', '<p>1.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span> Direct tax collections grew by nearly 20 per cent between April and January this year with strong growth in both corporate and personal income tax receipts. According to official data released, net direct tax collections grew by 19.3 per cent up to January 2018 to Rs 6.95-lakh crore.</p>\r\n\r\n<p>2.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Union Home Minister Rajnath Singh has launched the Centre for learning Sanskrit language in Gujarat University, Ahmedabad.&nbsp;</p>\r\n\r\n<p>3.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span> Mr Nitin Gadkari released India&rsquo;s first ever Highway Capacity Manual (HCM) in New Delhi. The manual is also known as Indo-HCM and it has been developed by CSIR &ndash; CRRI on the basis of an extensive, country-wide study of the traffic characteristics on different categories of roads like a single lane, two-lane, multi-lane urban roads, and the associated intersections on these roads.</p>\r\n\r\n<p>4.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Mumbai, India&#39;s financial capital is the 12th richest city in the world with a total wealth of $950 billion, according to a report by New World Wealth. The list was topped by New York as the richest city in the world.</p>\r\n\r\n<p>5.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>India and Palestine have signed six Memorandums of Understanding (MoU)s worth USD 40 million. &nbsp;This was welcomed by Palestinian President Mahmoud Abbas.</p>\r\n\r\n<p>6.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>ONGC (Oil and Natural Gas Corporation) Videsh Ltd and its partners have acquired a 10% in a large offshore oilfield Abu Dhabi National Oil Co.&rsquo;s (ADNOC) in Abu Dhabi for $600 million. It is the first time any Indian company has set foot in oil-rich Emirate.</p>\r\n\r\n<p>7.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>The country&rsquo;s largest lender SBI wrote off bad loans worth Rs 20,339 crore in 2016-17, the highest among all the public sector banks, which had a collective write off of Rs 81,683 crore for the fiscal. The data pertains to the period when the associate banks of SBI were not merged with it.</p>\r\n\r\n<p>8.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Asma Jahangir, Pakistan&rsquo;s renowned human rights lawyer, social activist and an outspoken critic of the country&rsquo;s powerful military establishment, passed away of cardiac arrest. She was 66.&nbsp;</p>\r\n\r\n<div>&nbsp;</div>', 'Current affairs today, today current affairs, daily current affairs, current affairs daily, gk today', '', NULL, 0, '2018-02-13 08:33:15', NULL, 1);
INSERT INTO `news` (`id`, `title`, `slug`, `short_description`, `start_date`, `image`, `description`, `meta_keywords`, `meta_description`, `user_id`, `total_views`, `created`, `updated`, `status`) VALUES
(22, 'Current affairs 12/02/2018', 'current-affairs-12022018', '1.	India and Oman have signed eight MoUs in different areas during PM Narendra Modi’s maiden visit to the Gulf nation. The fields in which the agreements were inked include defence, health and tourism.', '2018-02-12 00:00:00', 'images(9).jpg', '<p>1.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>India and Oman have signed eight MoUs in different areas during PM Narendra Modi&rsquo;s maiden visit to the Gulf nation. The fields in which the agreements were inked include defence, health and tourism.</p>\r\n\r\n<p>ii. An MoU on legal and judicial co-operation in civil and commercial matters was also signed. The agreements were inked after Mr Modi held delegation-level talks with the Sultan of Oman, Qaboos bin Said al Said in Muscat.</p>\r\n\r\n<p>2.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Prime Minister Narendra Modi and Crown Prince Sheikh Mohammad bin Zayed al Nahyan held bilateral talks at the Presidential Palace in Abu Dhabi, the UAE.</p>\r\n\r\n<p>ii. PM Modi also laid the foundation stone of the first Hindu temple in Abu Dhabi. The two sides inked 5 agreements related to energy &amp; railway sectors, manpower and financial services.</p>\r\n\r\n<p>3.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>On the last day of PM Modi&#39;s 3 Nation visit, he addressed business leaders at the &#39;India-Oman Business Meet&#39;, organised by Ministry of Commerce and Industry of Oman, in association with Embassy of India in Muscat.</p>\r\n\r\n<p>4.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span> Mumbai, India&#39;s financial capital is the 12th richest city in the world with a total wealth of $950 billion, according to a report by New World Wealth. The list was topped by New York as the richest city in the world.&nbsp;</p>\r\n\r\n<p>5.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Acclaimed Icelandic musician and Oscar-nominated composer Johann Johannsson has passed away aged 48.</p>\r\n\r\n<p>6.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Sharmila Nicollet has become the first Indian golfer to qualify for the China Ladies PGA Tour. The 26-year-old Bengaluru golfer fought her way back into the tournament in the last two rounds to earn a card for the Tour.</p>\r\n\r\n<p>7.<span class=\"Apple-tab-span\" style=\"white-space:pre\"> </span>Pune-based swimmer, Rohan More became the first Asian as well as the first Indian to swim across the Ocean Seven. He is the youngest to complete it. He swam across the Cook Strait between North and South Islands of New Zealand in 8 hours and 37 minutes.</p>\r\n\r\n<div>&nbsp;</div>', 'Current affairs today, today current affairs, daily current affairs, current affairs daily, gk today', '', NULL, 0, '2018-02-13 08:38:00', NULL, 1),
(23, 'current affairs 13/02/2018', 'current-affairs-13022018', 'The National Productivity Council observed the National Productivity Day (NPD) on 12 February 2018. The council is also observing the National Productivity Week till  February 18.', '2018-02-13 00:00:00', 'world-radio-day1.png', '<p>1. The National Productivity Council observed the National Productivity Day (NPD) on 12 February 2018. The council is also observing the National Productivity Week till February 18. The theme for NPD 2018 is &#39;Industry 4.0 Leapfrog Opportunity for India&#39;. 2. Union Minister of State (IC) for Power and New and Renewable Energy, Shri R.K. Singh inaugurated the &lsquo;Indian Power Stations 2018&rsquo; in New Delhi. It is the three-day International Conference on Operations and Maintenance. 3. The Institute Of Directors organised it&rsquo;s 12th International Conference on Corporate Social Responsibility in Bengaluru, Karnataka. 4. Ministry of Tourism compiles monthly estimates of Foreign Tourist Arrivals (FTAs) &amp; FTAs on e- Tourist Visa on the basis of Nationality-wise, Port-wise data received from Bureau of Immigration (BOI). The growth rate in FTAs in January 2018 over January 2017 was 8.4%. During the month of January 2018, a total of 2.40 lakh foreign tourists arrived on e-Tourist Visa as compared to 1.52 lakh during the month of January 2017 registering a growth of 58.5%. 5. . World Radio Day is observed annually on 13 February. The theme for WRD 2018 is &quot;Radio and Sports&quot;. The Day is organised globally by the UNESCO. 6. The Gevora Hotel in Dubai, developed by the Al Attar Group has now become the &ldquo;world&rsquo;s tallest hotel&rdquo;. It stands 356 metres and 53 centimetres tall. It is one metre taller than the previous holder of the title, the JW Marriott Marquis, in the same city. The title has been confirmed by Guinness Book of World Records. 7. Dubai&rsquo;s Roads and Transport Authority (RTA) launched the first tests of the world&rsquo;s first autonomous pods at the World Government Summit. The autonomous pods are launched in cooperation with Next Future Transportation (US-Based).</p>', '', '', NULL, 0, '2018-03-17 09:11:23', '2018-03-17 16:12:06', 1),
(24, 'current affairs 14/02/2018', 'current-affairs-14022018', 'Defending champion Karnataka’s Kishan Gangolli won the 13th edition of the National ‘A’ Chess Championship for the blind in Mumbai. The championship was organised by All India Chess Federation for the Blind (AICFB).', '2018-03-14 00:00:00', 'download1.jpg', '<p><strong>1. Defending champion Karnataka&rsquo;s Kishan Gangolli&nbsp;</strong>won the&nbsp;<strong>13th edition of the National &lsquo;A&rsquo; Chess Championship for the blind in Mumbai</strong>. The championship was organised by All India Chess Federation for the Blind (AICFB).</p>\r\n\r\n<p>2. The&nbsp;<strong>Government of India has proposed merger of Government Savings Certificates Act, 1959 and Public Provident Fund Act, 1968 with the Government Savings Banks Act, 1873.</strong></p>\r\n\r\n<p><strong>3.&nbsp;India&#39;s 1st Online Radio Station &#39;Radio Umang&#39;</strong>&nbsp;was launched recently in India. Listeners can tune in to this online radio station through web streaming or download the app. With 24 hours programming, it has found listeners in Hindi speaking regions of India and in over 60 countries worldwide.</p>\r\n\r\n<p>4.&nbsp;<strong>India-Russia Agriculture Business Summit 2018</strong>&nbsp;was held in New Delhi. The two countries discussed trade relations in the agricultural sector. The summit was organized by&nbsp;<strong>the Ministry of Agriculture &amp; Farmers Welfare.</strong></p>\r\n\r\n<p><strong>5.&nbsp;The defence ministry of India approved capital acquisition proposals worth Rs.15,935 crore</strong>&nbsp;which included the purchase of&nbsp;<strong>7.40 lakh assault rifles, 5,719 sniper rifles and light machine guns&nbsp;</strong>to bolster the strength of the armed forces.</p>\r\n\r\n<p>6.&nbsp;Claiming that the Bengal government had already enrolled&nbsp;<strong>50 lakh people</strong>&nbsp;under its own&nbsp;<strong>Swasthya Sathi programme,&nbsp;</strong>Chief Minister Mamata Banerjee has announced the decision to opt out of Centre&rsquo;s &lsquo;Modicare&rsquo; scheme.</p>\r\n\r\n<p>7.&nbsp;<strong>The Reserve Bank of India (RBI) scrapped numerous loan restructuring programmes</strong>, asking banks to immediately identify defaults and make disclosures every Friday to the RBI credit registry, starting from February 23. The apex bank has also warned banks of monetary penalties and higher provisions if they are found to have violated the stringent new norms.</p>', '', '', NULL, 0, '2018-03-17 09:15:38', NULL, 1),
(25, 'Current affairs 15/02/2018', 'current-affairs-15022018', '1. Reserve Bank of India has made banks\' priority sector norms lenient by saying that all loans to micro small and medium enterprises (MSME) will henceforth qualify as priority sector lending. This was a long time demand from banks.', '2018-02-15 00:00:00', 'rbi.jpg', '<p><strong>1. Reserve Bank of India&nbsp;</strong>has made&nbsp;<strong>banks&#39; priority sector norms lenient</strong>&nbsp;by saying that all loans to&nbsp;<strong>micro small and medium enterprises (MSME)</strong>&nbsp;will henceforth qualify as priority sector lending. This was a long time demand from banks.&nbsp;Till date, loans up to Rs 10 crore per MSME borrower was considered for priority sector calculation.&nbsp;<strong>The sub-target for bank lending to the micro enterprises has been 7.50 percent</strong>&nbsp;of adjusted net bank credit or credit equivalent amount of off-balance sheet exposure, whichever is higher.&nbsp;<strong>Foreign banks will also have to follow 8% sub-target</strong>&nbsp;for lending to the small and marginal farmers.</p>\r\n\r\n<p>2.&nbsp;<strong>State-owned Bank of Baroda&nbsp;</strong>has decided to exit by March-end&nbsp;<strong>its South Africa operations after 21 years</strong>&nbsp;amid a probe into alleged compliance lapses by the bank there.&nbsp;The bank stated that it is exiting operations in South Africa as part of its strategic plan for rationalisation of overseas branches.</p>\r\n\r\n<p>3.&nbsp;<strong>Kannada litterateur Chandrashekar Kambar</strong>&nbsp;has been elected as&nbsp;<strong>president of the Sahitya Akademi</strong>&nbsp;in the election held for the post. He has replaced&nbsp;<strong>Vishwanath Prasad Tiwari.&nbsp;</strong>Hindi poet Madhav Koushik has been elected as vice-president.</p>\r\n\r\n<p>4.&nbsp;India&#39;s first radio festival is being held in New Delhi to mark World Radio Day. The festival is being organized by International Association of Women in Radio and Television, in collaboration with UNESCO.&nbsp;</p>\r\n\r\n<p>5.&nbsp;Bharat Heavy Electricals Limited (BHEL) has bagged an order worth Rs 560 crore from NTPC for setting up a system for emission control<strong>.</strong>&nbsp;BHEL has secured the order for &quot;supply and installation of the flue gas desulphurisation (FGD) system from NTPC for 2x490 MW National Capital Power Station at Dadri in Uttar Pradesh.</p>\r\n\r\n<p>6.&nbsp;&nbsp;The government has extended the anti-narcotics scheme for 3 more years to combat illicit trafficking in drugs and psychotropic substance.&nbsp;</p>\r\n\r\n<p>7.&nbsp;In an effort to put India firmly among the top nations in the world theatre map, the country will play host to the 8th Theatre Olympics, the greatest carnival of thespianism.The 51-day theatre extravaganza which will be inaugurated at Red Fort, will see 450 shows including 65 shows by international artistes, 600 ambient performances and 250 youth forum shows.</p>', '', '', NULL, 0, '2018-03-17 09:19:09', NULL, 1),
(26, 'Current affairs 16/02/2018', 'current-affairs-16022018', 'Prime Minister Narendra Modi has launched several projects in Arunachal Pradesh. He inaugurated the Dorjee Khandu state convention centre at a function in Itanagar. The Centre has an auditorium, conference halls and an exhibition hall.', '2018-02-16 00:00:00', 'modi.jpg', '<p>1.&nbsp;Prime Minister Narendra Modi has launched several projects in Arunachal Pradesh. He inaugurated the Dorjee Khandu state convention centre at a function in Itanagar. The Centre has an auditorium, conference halls and an exhibition hall.&nbsp;Prime Minister&#39;s focus was also on the information revolution and now, the newly erected Secretariat building in the state capital is a big step in that direction.The building will have digital technology at its core and will have 2,500 officers and other employees.&nbsp;</p>\r\n\r\n<p>2.&nbsp;South Africa&#39;s embattled President Jacob Zuma has resigned. He announced the decision in a televised address to the nation after the ruling African National Congress (ANC) party threatened to eject him from office via a parliamentary vote of no confidence today.&nbsp;</p>\r\n\r\n<p>3.&nbsp;Tamil Nadu has won the Senior Women&#39;s National Football Championship for the first time. Tamil Nadu, which was playing its first-ever final, defeated Manipur, 2-1 at the Barabati Stadium in Cuttack, Odisha.&nbsp;</p>\r\n\r\n<p>4.&nbsp;India&rsquo;s biggest Global Conference on Pharma Industry and Medical Devices began in Bengaluru With the theme, &lsquo;Driving NextGen Pharmaceuticals. Union Minister for Chemicals &amp; Fertilisers Ananth Kumar inaugurated the three-day event.</p>\r\n\r\n<p>5.&nbsp;India&rsquo;s Umang App was named winner of the Best M-Government Service award in the Accessible Government category while Aadhar won the best emerging technology award at the recently concluded World Government Summit 2018 in Dubai, where India had the status of &lsquo;Guest of Honour&rsquo; country. The Summit acknowledged technology pioneers for providing global solutions to global challenges. The mobile application Umang App provides users a unified platform that combines government departments and services, facilitating transactions for citizens. The award acknowledged Government of India&rsquo;s efforts to provide convenient services to its citizens.</p>\r\n\r\n<p>6.&nbsp;Private sector lender, Yes Bank has announced the listing of the Bank&rsquo;s debut US $600 million bond issue under its maiden US $1 billion medium-term note (MTN) bond on country&rsquo;s first international exchange BSE&rsquo;s IndiaINX at the International Financial Services Centre (IFSC) at GIFT City in Gandhinagar.</p>', '', '', NULL, 0, '2018-03-17 09:23:40', NULL, 1),
(27, 'Current affairs 17/02/2018', 'current-affairs-17022018', 'Japan\'s government has reappointed Bank of Japan Governor Haruhiko Kuroda for another term and chose an advocate of bolder monetary easing as one of his deputies, a sign the central bank will be in no rush to dial back its massive stimulus program.', '2018-02-17 00:00:00', '0210N-Kuroda-2_article_main_image.jpg', '<p>1.&nbsp;Japan&#39;s government has reappointed Bank of Japan Governor Haruhiko Kuroda for another term and chose an advocate of bolder monetary easing as one of his deputies, a sign the central bank will be in no rush to dial back its massive stimulus program. The government also submitted to parliament its nomination of Masazumi Wakatabe, a professor at Waseda University and an advocate of aggressive monetary easing, as deputy governor.</p>\r\n\r\n<p>2.&nbsp;<strong>&nbsp;</strong>Cyril Ramaphosa, head of the ruling African National Congress (ANC) has been sworn in as South Africa&#39;s new President. He was elected as the new president of South Africa by the ruling party politicians after the resignation of Jacob Zuma.&nbsp;</p>\r\n\r\n<p>3.&nbsp;Ethiopia&#39;s Prime Minister Hailemariam Desalegn suddenly resigned in what he described as a bid to smooth reforms, following years of violent unrest that threatened the ruling party&#39;s hold on Africa&#39;s second most populous nation.</p>\r\n\r\n<p>4.&nbsp;<strong>Prime Minister Narendra Modi</strong>&nbsp;will hold bilateral talks with visiting&nbsp;<strong>Iranian President Hassan Rouhani in New Delhi,</strong>&nbsp; during which discussions on the issues of regional, international and mutual interest will be held. This is the&nbsp;<strong>first visit by Iranian President to India in 10 years.</strong></p>\r\n\r\n<p><strong>5.&nbsp;India and Iran&nbsp;</strong>signed an&nbsp;<strong>Agreement for the Avoidance of Double Taxation (DTAA)</strong>&nbsp;and the&nbsp;<strong>Prevention of Fiscal Evasion&nbsp;</strong>with respect to taxes on income. The Agreement is on similar lines as entered into by India with other countries.</p>\r\n\r\n<p>6.&nbsp;The government has signed second&nbsp;<strong>Loan Agreement with New Development Bank (NDB) for the financing of Rajasthan Water Sector Restructuring Project</strong>&nbsp;for the Desert Areas<strong>.&nbsp;</strong>This is the first tranche loan of $100 million was approved by the NDB under Multi-Tranche Financing Facility of $345 million for this project. The objective of the project is to rehabilitate 678 km long Indira Gandhi Nahar Project (IGNP) built during 1958-63 to prevent seepage.</p>\r\n\r\n<p>7.&nbsp;<strong>Russian space agency Roskosmos&nbsp;</strong>has successfully launched&nbsp;<strong>Progress MS-08,</strong>&nbsp;an unmanned cargo spacecraft for the International Space Station (ISS).</p>', '', '', NULL, 0, '2018-03-17 09:26:32', NULL, 1),
(28, 'Current affairs 18/02/2018', 'current-affairs-18022018', 'Indian Prime Minister Narendra Modi inaugurated the World Sustainable Development Summit 2018 (WSDS 2018) at Vigyan Bhawan in New Delhi.', '2018-02-18 00:00:00', 'modi1.jpg', '<p><strong>1. Indian Prime Minister Narendra Modi&nbsp;</strong>inaugurated the&nbsp;<strong>World Sustainable Development Summit 2018 (WSDS 2018)</strong>&nbsp;at Vigyan Bhawan&nbsp;<strong>in New Delhi.&nbsp;</strong>The summit is the flagship forum of&nbsp;<strong>The Energy and Resources Institute (TERI).&nbsp;</strong>The summit&rsquo;s theme&nbsp;<strong>this year was &lsquo;Partnerships for a Resilient Planet&rsquo;.</strong></p>\r\n\r\n<p><strong>2.&nbsp;Prime Minister of Canada, Justin Trudeau</strong>&nbsp;will arrive in India on a&nbsp;<strong>seven-day State visit.&nbsp;</strong><strong>According to the&nbsp;Ministry of External Affairs</strong>, his visit is aimed at further strengthening bilateral relations between the two countries in key areas of mutual interest including trade and investment, energy, science and innovation, higher education, infrastructure development, skill development and space.</p>\r\n\r\n<p>3.&nbsp;<strong>China will host 2018 Shanghai Cooperation Organization (SCO) Summit at Qingdao</strong>, eastern Shandong Province in June 2018. China had taken over rotating chair of SCO after 17th SCO summit concluded in Astana, capital of Kazakhstan in June 2017.<strong>&nbsp;</strong>SCO is a Eurasian economic, political and security organisation headquartered in Beijing, China. It was founded in 2001.</p>\r\n\r\n<p>4.&nbsp;<strong>K.P. Sharma Oli&nbsp;</strong>was sworn in as&nbsp;<strong>Nepal&rsquo;s Prime Minister</strong>&nbsp;for the second time, weeks after his Left alliance with the Communist Party of Nepal-Maoist (CPN-Maoist) swept the parliamentary polls.&nbsp;<strong>He has replaced Sher Bahadur Deuba.</strong></p>\r\n\r\n<p><strong>5.&nbsp;Vikas Sathaye,</strong>&nbsp;a Pune-born person has been honoured with the Scientific and Engineering Academy Award at the&nbsp;<strong>Oscars Scientific and Technical Awards 2018</strong>&nbsp;at Beverly Hills in Los Angeles, California.</p>\r\n\r\n<p>6.&nbsp;The government has signed second&nbsp;<strong>Loan Agreement with New Development Bank (NDB) for the financing of Rajasthan Water Sector Restructuring Project</strong>&nbsp;for the Desert Areas.<strong>&nbsp;</strong>This is the first tranche loan of $100 million was approved by the NDB under Multi-Tranche Financing Facility of $345 million for this project. The objective of the project is to rehabilitate 678 km long Indira Gandhi Nahar Project (IGNP) built during 1958-63 to prevent seepage.</p>', '', '', NULL, 0, '2018-03-17 09:29:18', NULL, 1),
(29, 'Current affairs 19/02/2018', 'current-affairs-19022018', 'Lok Sabha Speaker, Sumitra Mahajan inaugurated the 6th India region Commonwealth Parliamentary Association conference at Patna in Bihar. The conference focused on the objectives and role of the Parliamentary Association body.', '2018-05-19 00:00:00', '8585wcithyderabadindia2018.jpg', '<p>1.&nbsp;<strong>Lok Sabha Speaker, Sumitra Mahajan</strong>&nbsp;inaugurated the&nbsp;<strong>6th India region Commonwealth Parliamentary Association conference at Patna in Bihar.</strong>&nbsp;The conference focused on the objectives and role of the Parliamentary Association body. The conference hold discussions mainly on two topics viz.&nbsp;<strong>&#39;Parliament&#39;s role in the development agenda&#39;</strong>&nbsp;and&nbsp;<strong>&#39;Legislature and Judiciary</strong>&nbsp;- Two important Pillars of Democracy&#39;.&nbsp;</p>\r\n\r\n<p>2.&nbsp;The prestigious&nbsp;<strong>World Congress on Information Technology&nbsp;2018</strong>&nbsp;has begun&nbsp;<strong>in Hyderabad.</strong>&nbsp;Prime Minister Narendra Modi addressed the inaugural session of the&nbsp;<strong>three-day IT summit through a video link.&nbsp;</strong>The&nbsp;<strong>World Information Technology and Services Alliance (WITSA)</strong>&nbsp;is organising Congress while the&nbsp;<strong>National Alliance of Software and Services Companies (NASSC)</strong>&nbsp;and the&nbsp;<strong>Telangana state Government&nbsp;</strong>are jointly hosting the event.</p>\r\n\r\n<p>3.&nbsp;<strong>Vice President M Venkaiah Naidu</strong>&nbsp;inaugurated the<strong>&nbsp;8th edition of the Theatre Olympics at Lal Quila&nbsp;</strong>in New Delhi. The event has been organised by&nbsp;<strong>National School of Drama</strong>&nbsp;under the aegis of Ministry of Culture.The theme of the festival is -&nbsp;<strong>&quot;Flag of Friendship&quot;.</strong>&nbsp;30 countries are participating from across the globe.</p>\r\n\r\n<p>4.&nbsp;<strong>India and Iran</strong>&nbsp;have signed nine agreements in order to further the bilateral cooperation between the two sides. The pacts were signed after delegation-level talks between&nbsp;<strong>Prime Minister Narendra Modi&nbsp;</strong>and visiting<strong>&nbsp;Iran President Hassan Rouhani&nbsp;</strong>at New Delhi&#39;s Hyderabad house.</p>\r\n\r\n<p>5.&nbsp;According to&nbsp;the Union Minister of State of the Atomic Energy and Space, Dr Jitendra Singh,<strong>&nbsp;the Indian Space Research Organisation (ISRO)</strong>&nbsp;is planning to launch&nbsp;<strong>Chandrayan-2 Mission around April</strong>&nbsp;2018. Chandrayaan-2 is the country&#39;s second mission to the moon.</p>\r\n\r\n<p>6.&nbsp;The&nbsp;<strong>Ministry of Agriculture &amp; Farmers Welfare</strong>&nbsp;has organized a&nbsp;<strong>National Conference</strong>&nbsp;under the title of&nbsp;<strong>&ldquo;Agriculture 2022 &ndash; Doubling Farmers&rsquo; Income&rdquo;</strong>&nbsp;in New Delhi.</p>\r\n\r\n<p>7.&nbsp;<strong>Assam</strong>&nbsp;is at the bottom of the list with regard to&nbsp;<strong>maternal mortality rate (MMR)</strong>&nbsp;with a figure of 300 against the&nbsp;<strong>national average of 167,</strong>&nbsp;while the fund spending under National Health Mission (NHM) is just 13.58%&nbsp;for 2017-18. MMR is the annual number of female deaths per 1,00,000 live births from any cause related to or aggravated by pregnancy or its management. The Centre had allocated Rs 1,056.25 crore for Assam under National Health Mission (NHM) for 2017-18.</p>', '', '', NULL, 0, '2018-03-17 18:33:04', NULL, 1),
(30, 'Current affairs 20/02/2018', 'current-affairs-20022018', '1. Finance Minister Arun Jaitley arrived in Riyadh on a two-day visit to Saudi Arabia. He will co-chair the 12th India-Saudi Arabia Joint Commission Meeting to be held in the Saudi capital Riyadh. Mr Jaitley will also open the Saudi-Indian Business Council.  Finance Minister will also visit India Pavillion at the Saudi National Heritage and Cultural Festival Janadriyah.', '2018-02-20 00:00:00', 'jaitley-japan_jpg_image__975_568-e1518927289598.jpg', '<p>1.&nbsp;<strong>Finance Minister Arun Jaitley</strong>&nbsp;arrived in&nbsp;<strong>Riyadh on a two-day visit to Saudi Arabia.</strong>&nbsp;He will co-chair the&nbsp;<strong>12th India-Saudi Arabia Joint Commission Meeting</strong>&nbsp;to be held in the Saudi capital Riyadh. Mr Jaitley will also open the&nbsp;<strong>Saudi-Indian Business Council.&nbsp;&nbsp;</strong>Finance Minister will also visit India Pavillion at the&nbsp;<strong>Saudi National Heritage and Cultural Festival Janadriyah.</strong>&nbsp;Mr Jaitley will meet with the&nbsp;<strong>Saudi Minister of Trade &amp; Investment Majid Al-Qassabi&nbsp;</strong>to discuss the bilateral issues between the two countries.</p>\r\n\r\n<p>2.&nbsp;<strong>In a first in the country,</strong>&nbsp;the Maharashtra government will be setting up an institute for artificial intelligence (AI) in Mumbai.</p>\r\n\r\n<p>3.&nbsp;<strong>Mr. J P Nadda, Union Minister for Health and Family Welfare</strong>&nbsp;has addressed the&nbsp;<strong>Global Digital Health Partnership Summit</strong>, at&nbsp;<strong>Canberra, Australia.&nbsp;</strong>The Union Health Minister spoke on the topic:&nbsp;<strong>Making Digital Health Services a Priority in Healthcare Reform.</strong>&nbsp;</p>\r\n\r\n<p>4.&nbsp;<strong>Yogi Adityanath government in Uttar Pradesh</strong>&nbsp;presented its second budget(4.28 lakh crore). Ahead of 2019, general elections, this is considered&nbsp;<strong>one of biggest budgetary allocation for the state.</strong></p>\r\n\r\n<p><strong>5.&nbsp;The National Bank for Agriculture and Rural Development (NABARD)</strong>&nbsp;announced area development plans worth&nbsp;<strong>Rs 1,918 crore</strong>&nbsp;for Punjab to supplement farmers&#39; income.<strong>&nbsp;</strong>Under this plan, the activities like dairy, vegetable cultivation, bee keeping, mushroom growing will be promoted in order to provide income to farmers at the sustainable basis.</p>\r\n\r\n<p>6.&nbsp;<strong>Digital payments entity PhonePe</strong>&nbsp;has partnered with&nbsp;<strong>Indian Oil Corporation Limited (IOCL)</strong>&nbsp;for the adoption of its&nbsp;<strong>indigenously-designed Point of Sale (POS) device at IOCL retail outlets.</strong></p>\r\n\r\n<p><strong>7.&nbsp;Amazon has become the first foreign e-commerce firm</strong>&nbsp;to start its own food retail venture in India called&nbsp;<strong>Amazon Retail</strong>, piloting its services in Pune.</p>', '', '', NULL, 0, '2018-03-17 18:37:32', NULL, 1),
(31, 'Current affairs 21/02/2018', 'current-affairs-21022018', 'Business consultancy firm EY has named Bajaj Finserv’s Sanjiv Bajaj as the entrepreneur for 2017. Sanjiv Bajaj will now represent India at the EY World Entrepreneur of the Year award (WEOY) in Monte Carlo.', '2018-02-21 00:00:00', 'sanjivbajaj-kSU--621x414@LiveMint.jpg', '<p>1.&nbsp;Business consultancy firm&nbsp;<strong>EY has named Bajaj Finserv&rsquo;s Sanjiv Bajaj as the entrepreneur for 2017</strong>. Sanjiv Bajaj will now represent India at the EY World Entrepreneur of the Year award (WEOY) in Monte Carlo.</p>\r\n\r\n<p>2.&nbsp;<strong>PNB Housing Finance Ltd</strong>&nbsp;has tied up with&nbsp;<strong>International Finance Corporation (IFC),</strong>&nbsp;part of the World Bank Group, to raise&nbsp;<strong>$800 million for green and affordable housing in India</strong>. IFC is in negotiations with two other housing finance firms to invest another $150 million, as well as with property developers to assist the&nbsp;<strong>Pradhan Mantri Awas Yojana (PMAY)</strong>&nbsp;from both the demand and supply sides, the person said, requesting anonymity.</p>\r\n\r\n<p>3.&nbsp;Crime drama&nbsp;<strong>Three Billboards Outside Ebbing, Missouri</strong>&nbsp;won maximum prizes at the&nbsp;<strong>British Academy of Film and Television Arts (BAFTA) Awards 2018,&nbsp;</strong>which took place at the Royal Albert Hall in London, UK.</p>\r\n\r\n<p>4.&nbsp;<strong>Milkbasket, India&#39;s first and largest micro-delivery platform</strong>&nbsp;has been recognised as&nbsp;<strong>&#39;Startup of the Year&#39; 2017&nbsp;</strong>at the 7th Small Business Awards held in New Delhi.</p>\r\n\r\n<p>5.&nbsp;<strong>Archaeologist and historian Arvind P. Jamkhedkar</strong>&nbsp;will be the next&nbsp;<strong>Chairman of the Indian Council of Historical Research (ICHR).&nbsp;</strong>He will replace&nbsp;<strong>Prof. K. Sudershan Rao</strong>.&nbsp;</p>\r\n\r\n<p>6.&nbsp;<strong>Roger Federer (Switzerland) celebrated his return to the top of the world rankings by winning the Rotterdam Open, in the Netherlands</strong>. It was his 97th career title.</p>\r\n\r\n<p>7.&nbsp;<strong>Australia&#39;s most-capped female player and vice-captain Alex Blackwell</strong>&nbsp;has announced her&nbsp;<strong>retirement from international and state cricket.</strong></p>\r\n\r\n<p>&nbsp;</p>', '', '', NULL, 0, '2018-03-17 18:41:02', '2018-03-18 01:47:22', 1),
(32, 'Current affairs 22/02/2018', 'current-affairs-22022018', 'The government of India and the UN jointly announced that India will host the global World Environment Day celebrations on 5 June 2018. World Environment Day is celebrated globally on June 5. The theme for World Environment 2018 is “Beat Plastic Pollution”.', '2018-03-22 00:00:00', 'images2.jpg', '<p>1.&nbsp;<strong>The government of India and the UN</strong>&nbsp;jointly announced that&nbsp;<strong>India will host the global World Environment Day celebrations on 5 June 2018</strong>.<strong>&nbsp;World Environment Day</strong>&nbsp;is celebrated globally on<strong>&nbsp;June 5</strong>. The&nbsp;theme for World Environment 2018 is<strong>&nbsp;&ldquo;Beat Plastic Pollution&rdquo;.</strong></p>\r\n\r\n<p><strong>2.&nbsp;Prime Minister Narendra Modi&nbsp;</strong>flagged off&nbsp;<strong>the Palace Queen Humsafar Express</strong>&nbsp;between&nbsp;<strong>Mysuru and Udaipur in Mysuru Railway Station.</strong></p>\r\n\r\n<p><strong>3.&nbsp;Spiritual leader Aga Khan</strong>&nbsp;is on the 11-day visit to India.&nbsp;<strong>Sunder Nursery, a 90-acre park near Humayun&rsquo;s Tomb in New Delhi,</strong>&nbsp;will be inaugurated by&nbsp;<strong>Vice President M Venkaiah Naidu</strong>&nbsp;in the presence of the Aga Khan.</p>\r\n\r\n<p>4.&nbsp;<strong>The Cabinet has approved</strong>&nbsp;Proposal for Mahanadi Water Disputes &ndash; Constitution of a Tribunal under Inter-State River Disputes Act, 1956 &ndash; request from&nbsp;State&nbsp;of Odisha.</p>\r\n\r\n<p>5.&nbsp;<strong>The Cabinet has approved&nbsp;India-Morocco Cooperation Agreement</strong>&nbsp;in&nbsp; Railway Sector.</p>\r\n\r\n<p>6.&nbsp;<strong>India successfully test-fired Agni II medium-range nuclear-capable missile</strong>&nbsp;from APJ Abdul Kalam island off the Odisha coast. The&nbsp;<strong>Strategic Forces Command (SFC)&nbsp;</strong>fired Agni-II from a mobile launcher at launch complex 4 of the Integrated Test Range.</p>\r\n\r\n<p>7.&nbsp;<strong>The UK- India&nbsp;</strong>Joint research projects on&nbsp;<strong>Water Quality Research and Energy Demand Reduction</strong>&nbsp;in Built Environment were launched in New Delhi.</p>\r\n\r\n<p>8.&nbsp;<strong>Singapore will impose a &#39;carbon tax&#39;</strong>&nbsp;from 2019&nbsp;<strong>to cut its greenhouse gas emissions</strong>&nbsp;and make companies more competitive as global agreements on climate change take effect.</p>\r\n\r\n<p>9.&nbsp;The Union Cabinet has given approval for creation of&nbsp;<strong>National Urban Housing Fund (NUHF)</strong>&nbsp;for&nbsp;<strong>Rs.60,000 crores.&nbsp;</strong>This fund will be situated in&nbsp;<strong>Building Materials and Technology Promotion Council (BMTPC),</strong>&nbsp;an autonomous body under the&nbsp;<strong>Ministry of Housing and Urban Affairs.</strong></p>', '', '', NULL, 0, '2018-03-17 18:46:57', NULL, 1),
(33, 'Current affairs 23/02/2018', 'current-affairs-23022018', '1. Prime Minister Narendra Modi inaugurated the 2-Day long UP Investors Summit in Lucknow. The mega event has been organised by the Uttar Pradesh government. It is aimed at showcasing investment opportunities and potential across various sectors in Uttar Pradesh.', '2018-02-23 00:00:00', 'modi2.jpg', '<p>1.&nbsp;<strong>Prime Minister Narendra Modi</strong>&nbsp;inaugurated the 2-Day long&nbsp;<strong>UP Investors Summit in Lucknow</strong>. The mega event has been organised by the Uttar Pradesh government. It is aimed at showcasing investment opportunities and potential across various sectors in Uttar Pradesh.&nbsp;&nbsp;According to the UP Chief Minister Yogi Adityanath,&nbsp;<strong>900 MoUs have already been finalised ahead of the Summit.&nbsp;</strong>Representatives from&nbsp;<strong>Mauritius, Japan, the Netherlands, Finland, Czech Republic, Thailand and Slovakia</strong>&nbsp;will also participate in the event.</p>\r\n\r\n<p>2.&nbsp;Prime Minister Narendra Modi inaugurated the<strong>&nbsp;22nd edition of the World Congress on Information Technology (WCIT)</strong>&nbsp;in&nbsp;<strong>Hyderabad&nbsp;</strong>through a video conference. The WCIT is held for the first time in India.</p>\r\n\r\n<p>3. t<strong>he government has allowed private companies to mine the fossil fuel for commercial use</strong>. This move ended the monopoly of state-owned Coal India Ltd.</p>\r\n\r\n<p>4.&nbsp;<strong>&nbsp;Haryana Government Launched 4 Subsidized Food Canteens Under &#39;Antyodaya Aahaar Yojna&#39;&nbsp;&nbsp;Haryana Chief Minister Manohar Lal Khattar</strong>&nbsp;launched&nbsp;<strong>4 food canteens at Faridabad, Gurugram, Hisar, and Yamunanagar</strong>&nbsp;via video-conferencing from Chandigarh.</p>\r\n\r\n<p>5.&nbsp;<strong>Maharashtra government will roll out &#39;Asmita Yojana&#39;</strong>&nbsp;on the<strong>&nbsp;International Women&rsquo;s Day (March 8, 2018)</strong>&nbsp;to provide cheap (subsidised) sanitary pads to school girls and women.</p>\r\n\r\n<p>6.&nbsp;<strong>The Delhi government&nbsp;</strong>announced the launch of&nbsp;<strong>&quot;Mission Buniyaad&quot;</strong>&nbsp;for improving learning skills of children studying in state and municipal-run schools. The announcement was made by&nbsp;<strong>Deputy Chief Minister Manish Sisodia.</strong></p>\r\n\r\n<p>7.&nbsp;Union Minister of State (IC) for Power and New &amp; Renewable Energy, R.K. Singh&nbsp;inaugurated the&nbsp;<strong>&lsquo;International R&amp;D Conclave</strong>&rsquo; in&nbsp;<strong>New Delhi.</strong>&nbsp;It is a two-day conference on Emerging Opportunities and Challenges of R&amp;D in Indian Power Sector.</p>\r\n\r\n<p>8.&nbsp;<strong>India&nbsp;</strong>has been ranked&nbsp;<strong>12th-worst among 52 low-middle income countries&nbsp;</strong>based on the number of children dying within the first month of their birth, which is 25.4 per 1,000 live births.<strong>&nbsp;Pakistan is the worst&nbsp;</strong>with 45.6 newborn deaths per 1,000 live births,&nbsp;<strong>according to the United Nations Children&#39;s Fund (UNICEF). Japan, with an NMR of 0.9 deaths per 1,000 live births, has been ranked the world&#39;s safest country</strong>&nbsp;in which to be born&nbsp;<strong>followed by Iceland (1) and Singapore (1.1).</strong></p>\r\n\r\n<p>9.&nbsp;The Centre has constituted a&nbsp;<strong>committee headed by the Vice Chairman of the NITI Aayog Mr Rajiv Kumar&nbsp;</strong>to study the&nbsp;<strong>Brahmaputra and flood control measures in Assam and neighbouring states.</strong></p>\r\n\r\n<p>10<strong>.&nbsp;Kerala government has made vaccination compulsory for school admissions&nbsp;</strong>from next academic year onwards. Parents will have to show details of shots given to children at the time of enrolment in schools.&nbsp;</p>\r\n\r\n<p>11.&nbsp;<strong>The Gandhi Nagar railway station in Jaipur,</strong>&nbsp;<strong>Rajasthan&nbsp;</strong>became railway station to be fully-managed by women. Gandhi Nagar is an important railway station in Jaipur situated on the&nbsp;<strong>Jaipur-Delhi rail route.</strong>&nbsp;The station has the footfall of more than 7,000 passengers every day.</p>\r\n\r\n<p>12.&nbsp;The Union Government has issued order setting up the&nbsp;<strong>&lsquo;Niti Forum for North-East&rsquo;.</strong>&nbsp;<strong>The forum will be co-chaired by the Vice-Chairman of NITI Aayog Mr Rajiv Kumar and Minister of State (I/C), Ministry of Development of Northeastern Region (DoNER), Dr Jitendra Singh.</strong>&nbsp;</p>\r\n\r\n<p>13.&nbsp;Uttar Pradesh has signed&nbsp;<strong>1,045 pacts worth Rs4.28 trillion&nbsp;</strong>on the first day of the UP investors&rsquo; summit.</p>\r\n\r\n<p>14.&nbsp;<strong>US Marines in Thailand&nbsp;</strong>for the&nbsp;<strong>Cobra Gold training exercise</strong>&nbsp;took part in one of the wildest parts of the drills - drinking cobra blood.&nbsp;<strong>This was the 37th edition of the exercise.</strong></p>', '`', '', NULL, 0, '2018-03-17 18:55:37', '2018-03-18 13:57:24', 1),
(35, 'Current affairs 24/02/2018', 'current-affairs-24022018', 'The Indian and Indonesian armies began the sixth edition of their annual military exercise named \'Garuda Shakti\' in Bandung, Indonesia. The exercises will include experience sharing in counter-terrorism operations, close quarter combat, and other areas of special operations.', '2018-03-24 00:00:00', 'india-indonesia.jpg', '<p>1.&nbsp;The Indian and Indonesian armies began the sixth edition of their annual military exercise named &#39;Garuda Shakti&#39; in Bandung, Indonesia. The exercises will include experience sharing in counter-terrorism operations, close quarter combat, and other areas of special operations.</p>\r\n\r\n<p>2.&nbsp;The Centre has constituted a&nbsp;<strong>committee headed by the Vice Chairman of the NITI Aayog Mr Rajiv Kumar&nbsp;</strong>to study the&nbsp;<strong>Brahmaputra and flood control measures in Assam and neighbouring states.</strong></p>\r\n\r\n<p><strong>3.&nbsp;India has been ranked 81st</strong>&nbsp;in the&nbsp;<strong>global corruption perception index for 2017,</strong>&nbsp;released by&nbsp;<strong>Transparency International</strong>. The index ranks 180 countries and territories by their perceived levels of public sector corruption.&nbsp;<strong>In the 2016 India was in the 79th place among 176 countries.</strong></p>\r\n\r\n<p><strong>4.&nbsp;Agriculture Minister Radha Mohan Singh</strong>&nbsp;launched&nbsp;<strong>six new features</strong>&nbsp;in the&nbsp;<strong>National Agriculture Market (e-NAM) platform</strong>&nbsp;to make it more user-friendly.<br />\r\n<strong>ii.&nbsp;</strong>The six new features of&nbsp;e-NAM&nbsp;platform includes-</p>\r\n\r\n<p><strong>1.</strong>&nbsp;MIS dashboard for better analysis,</p>\r\n\r\n<p><strong>2.</strong>&nbsp;BHIM payment facility by traders,</p>\r\n\r\n<p><strong>3.</strong>&nbsp;Mobile payment facility by traders,</p>\r\n\r\n<p><strong>4.</strong>&nbsp;Enhanced features on mobile app such as gate entry and payment through mobile,</p>\r\n\r\n<p><strong>5.&nbsp;</strong>Integration of farmer&rsquo;s database, and</p>\r\n\r\n<p><strong>6.</strong>&nbsp;e-Learning module.</p>\r\n\r\n<p>5.&nbsp;<strong>The Telangana Government</strong>&nbsp;signed an MOU with&nbsp;<strong>Taoyuan&nbsp;City of Taiwan</strong>&nbsp;for better technology partnership in the state. The agreement was signed after the&nbsp;<strong>World Congress on Information Technology (WCIT) 2018 in Hyderabad.</strong></p>\r\n\r\n<p><strong>6.&nbsp;Flying officer Avani Chaturvedi</strong>&nbsp;scripted history by becoming the&nbsp;<strong>first&nbsp; Indian woman to fly a fighter aircraft solo.</strong></p>\r\n\r\n<p><strong>7.&nbsp;Uttar Pradesh&#39;s Khadi and Village Industries Board</strong>&nbsp;has signed a pact with&nbsp;<strong>Amazon India</strong>&nbsp;to facilitate<strong>&nbsp;online selling of Khadi products.</strong></p>\r\n\r\n<p><strong>8.&nbsp;</strong>India successfully conducted a&nbsp;<strong>night trial of its indigenously developed nuclear capable Prithvi-II missile</strong>&nbsp;with a strike range of 350 km, from a test range in Odisha.&nbsp;</p>', '', '', NULL, 0, '2018-03-17 19:03:33', NULL, 1),
(36, 'Current affairs 25/02/2018', 'current-affairs-25022018', '1. The Government of India and Asian Development Bank (ADB) signed a $84 million loan for improvement and expansion of water supply in Bhagalpur and Gaya towns in Bihar.', '2017-03-25 00:00:00', 'download2.jpg', '<p>1.&nbsp;<strong>The Government of India and Asian Development Bank (ADB)</strong>&nbsp;signed&nbsp;<strong>a $84 million loan</strong>&nbsp;<strong>for improvement and expansion of water supply in Bhagalpur and Gaya towns in Bihar.&nbsp;</strong>The loan will have a 25-year term, including a grace period of 5 years, an annual interest rate determined in accordance with ADB&rsquo;s lending facility based on the&nbsp;<strong>London interbank offered rate (LIBOR),</strong>&nbsp;and a commitment charge of 0.15% per year.</p>\r\n\r\n<p><strong>2. A three &ndash;day India International Textiles Expo (IITExpo)</strong>&nbsp;of India began in Sri Lankan capital of Colombo. It is being organized by Powerloom Development &amp; Export Promotion Council (PDEXCIL) with the support of Union Ministry of Textiles &amp; Ministry of Commerce &amp; Industry.</p>\r\n\r\n<p>3. Retirement fund body&nbsp;<strong>Employees&rsquo; Provident Fund Organisation (EPFO)</strong>&nbsp;has&nbsp;<strong>reduced the interest rate on deposits to 8.55%&nbsp;</strong>for 2017-18 from 8.65% for 2016-17 following a general decline in interest rates.</p>\r\n\r\n<p><strong>4. Capital First</strong>&nbsp;announced that the regulator&nbsp;<strong>National Housing Bank (NHB)</strong>&nbsp;has&nbsp;<strong>approved the merger of the company along with Capital Home Finance and Capital First Securities Limited with IDFC Bank.</strong></p>\r\n\r\n<p><strong>5. The Telangana Government</strong>&nbsp;signed an MOU with&nbsp;<strong>Taoyuan&nbsp;City of Taiwan</strong>&nbsp;for better technology partnership in the state. The agreement was signed after the&nbsp;<strong>World Congress on Information Technology (WCIT) 2018 in Hyderabad.</strong></p>\r\n\r\n<p><strong>6.&nbsp;Israeli Ambassador to India, Mr Daniel Carmon</strong>&nbsp;has stated that a Centre for Agriculture, with the collaboration of Israeli expertise, is going to be<strong>&nbsp;inaugurated in Mizoram in March 2018.</strong></p>\r\n\r\n<p><strong>7.&nbsp;The Haryana government</strong>&nbsp;launched&nbsp;<strong>Parivartan</strong>, a scheme designed to address&nbsp;<strong>10 issues</strong>, including cleanliness and pollution, in 46 developmental blocks of the state. The scheme was launched by&nbsp;<strong>Chief Minister Manohar Lal Khattar.</strong></p>\r\n\r\n<p><strong>8.&nbsp;</strong>An MoU between the<strong>&nbsp;Government of India and Canada&rsquo;s International Development Research Centre (IDRC)</strong>&nbsp;was signed in New Delhi. The agreement was signed to usher the&nbsp;<strong>&ldquo;programme based research support&rdquo;</strong>&nbsp;in addressing current and future global and local developmental challenges.</p>', '', '', NULL, 0, '2018-03-17 19:08:53', NULL, 1),
(37, 'Current affairs 26/02/2018', 'current-affairs-26022018', '1. Reserve Bank of India (RBI) has constituted an expert committee under the chairmanship of YH Malegam to look into a range of issues relating to classification of bad loans, rising incidents of frauds and effectiveness of audits.', '2018-02-25 00:00:00', 'rbi-kSDE--621x414@LiveMint.jpg', '<p><strong>1. Reserve Bank of India (RBI)</strong>&nbsp;has constituted an expert committee&nbsp;<strong>under the chairmanship of YH Malegam</strong>&nbsp;to look into a range of issues relating to&nbsp;<strong>classification of bad loans, rising incidents of frauds and effectiveness of audits.</strong></p>\r\n\r\n<p><strong>2. Digital payments startup Paytm&nbsp;</strong>has launched two insurance companies,&nbsp;<strong>Paytm Life Insurance and Paytm General Insurance.</strong></p>\r\n\r\n<p><strong>3.&nbsp;Noted violinist M.S. Anantharaman,&nbsp;</strong>an exponent of<strong>&nbsp;Parur style</strong>&nbsp;of violin playing had passed away.</p>\r\n\r\n<p>4.&nbsp;<strong>&nbsp;India has successfully test-fired the nuclear-capable surface-to-surface &#39;Dhanush&#39; ballistic missile</strong>&nbsp;with a strike range of&nbsp;<strong>350 km</strong>&nbsp;from a naval ship off Odisha coast.</p>\r\n\r\n<p>5.&nbsp;<strong>&nbsp;India</strong>&nbsp;will host the&nbsp;<strong>first International Solar Alliance (ISA) summit on</strong>&nbsp;11th March 2018. It will be attended by&nbsp;<strong>French President Emmanuel Macron and United Nations&nbsp;Secretary-General&nbsp;Antonio Guterres.</strong></p>\r\n\r\n<p><strong>6.&nbsp;The 44th edition of Khajuraho Dance Festival 2018</strong>&nbsp;was held at Khajuraho temple, a UNESCO world heritage site in Madhya Pradesh. It was inaugurated by&nbsp;<strong>Madhya Pradesh Governor Anandiben Patel&nbsp;</strong>and was organised by culture department of state government.</p>\r\n\r\n<p>7.&nbsp;<strong>The Assam government&nbsp;</strong>has announced to observe&nbsp;<strong>September 22 as &#39;Rhino Day&#39;&nbsp;</strong>to generate public awareness on&nbsp;protection&nbsp;of the one-horned pachyderm.</p>\r\n\r\n<p>&nbsp;</p>', '', '', NULL, 0, '2018-03-17 19:12:36', NULL, 1),
(38, 'Current affairs 27/02/2018', 'current-affairs-27022018', 'Chinese technology giant Huawei and telecom services provider Bharti Airtel announced to have successfully conducted 5G network trial under a test set-up in India. The trial was conducted at Airtel’s Network Experience Centre in Manesar (Gurugram).', '2018-02-27 00:00:00', '30160-5g-network-reuters.jpg', '<p>1. C<strong>hinese technology giant Huawei</strong>&nbsp;and&nbsp;<strong>telecom services provider Bharti Airtel&nbsp;</strong>announced to have successfully conducted&nbsp;<strong>5G network trial</strong>&nbsp;under a test set-up in India. The trial was conducted at Airtel&rsquo;s Network Experience Centre in Manesar (Gurugram).</p>\r\n\r\n<p>2.&nbsp;<strong>Aditya Birla Idea Payments Bank Ltd (ABIPBL)&nbsp;</strong>started operations, making it the&nbsp;<strong>fifth payments bank to roll out operations</strong>.&nbsp;</p>\r\n\r\n<p>3.&nbsp;<strong>The Reserve Bank of India</strong>&nbsp;has&nbsp;<strong>launched Ombudsman Scheme for non-banking financial companies (NBFCs)</strong>&nbsp;for redressal of complaints against them.</p>\r\n\r\n<p>4.&nbsp;<strong>Prime Minister Narendra Modi launched the Amma Two Wheeler Scheme (in Chennai)&nbsp;</strong>of the state government coinciding with the birth anniversary of former Chief Minister of Tamil Nadu, Jayalalithaa.</p>\r\n\r\n<p>5.&nbsp;<strong>Prime Minister Narendra Modi flagged off the &#39;Run for New India&#39; marathon in Surat, Gujarat.&nbsp;</strong>The Marathon is aimed at creating awareness about social causes and call upon all to resolve to build a New India.</p>\r\n\r\n<p>6.&nbsp;<strong>Prime Minister Narendra Modi laid foundation stones for projects worth 1000 crore rupees in Daman&nbsp;</strong>in the union territory of Daman and Diu. PM distributed keys for scooters to differently-abled beneficiaries,&nbsp;<strong>&#39;SWABHIMAN&#39; cards&nbsp;</strong>to pregnant and Lactating Women,&nbsp;<strong>&#39;Badhai Kit&#39; to the newly born girl children</strong>&nbsp;under &#39;Beti Bachao, Beti Padhao&#39;.</p>\r\n\r\n<p>7.&nbsp;<strong>The 15th edition of BioAsia,</strong>&nbsp;the annual flagship event of the Government of Telangana,&nbsp;<strong>was held Hyderabad.</strong>&nbsp;The&nbsp;<strong>theme of BioAsia 2018 was &ldquo;Right Time, Right Now&rdquo;&nbsp;</strong>focusing on strategies to keep up with the pace&nbsp;of change and innovative ways to develop new models for distribution &amp; healthcare delivery.</p>\r\n\r\n<p>8.&nbsp;<strong>Veteran Bollywood actress</strong>&nbsp;and&nbsp;<strong>Padma Shri awardee&nbsp;Sridevi,&nbsp;</strong>who had an illustrious career spanning over four decades, passed away. She was 54.</p>', '', '', NULL, 2, '2018-03-17 19:16:32', NULL, 1);
INSERT INTO `news` (`id`, `title`, `slug`, `short_description`, `start_date`, `image`, `description`, `meta_keywords`, `meta_description`, `user_id`, `total_views`, `created`, `updated`, `status`) VALUES
(39, 'Current affairs 28/02/2018', 'current-affairs-28022018', '1. The seventh meeting of Eminent Persons Group (EPG) on Nepal-India relations has concluded in Kathmandu, Nepal. Various bilateral issues including 1950 Peace and Friendship treaty, trade, environment, border and hydropower were discussed during the two-day meeting.', '2018-06-28 00:00:00', 'download_(1)1.jpg', '<p>1.&nbsp;<strong>The seventh meeting of Eminent Persons Group (EPG)</strong>&nbsp;on&nbsp;<strong>Nepal-India relations</strong>&nbsp;has concluded in&nbsp;<strong>Kathmandu, Nepal.</strong>&nbsp;Various bilateral issues including 1950 Peace and Friendship treaty, trade, environment, border and hydropower were discussed during the two-day meeting.</p>\r\n\r\n<p>2.&nbsp;The second week of March will witness&nbsp;<strong>Andaman &amp; Nicobar Command&nbsp;</strong>hosting a&nbsp;<strong>multinational mega event MILAN 2018.</strong>&nbsp;MILAN is a congregation of littoral navies conducted biennially by Indian Navy at the Andaman and Nicobar Islands.</p>\r\n\r\n<p>3.&nbsp;<strong>The government of Tamil Nadu</strong>&nbsp;announced signing an agreement with&nbsp;<strong>IT Major Microsoft</strong>&nbsp;to improve the integration of technology in teaching and learning in the state.</p>\r\n\r\n<p>4.&nbsp;<strong>The 15th edition of BioAsia,</strong>&nbsp;the annual flagship event of the Government of Telangana,&nbsp;<strong>was held Hyderabad.</strong>&nbsp;The&nbsp;<strong>theme of BioAsia 2018 was &ldquo;Right Time, Right Now&rdquo;&nbsp;</strong>focusing on strategies to keep up with the pace&nbsp;of change and innovative ways to develop new models for distribution &amp; healthcare delivery.</p>\r\n\r\n<p>5.&nbsp;<strong>A two-day International Conference on Sustainable Biofuels&nbsp;</strong>organized by Department of Biotechnology has&nbsp;<strong>begun in New Delhi.</strong>&nbsp;Union Minister for Science and technology<strong>&nbsp;Dr. Harsh Vardhan inaugurated the Conference.</strong></p>\r\n\r\n<p><strong>6.&nbsp;The 21st national conference on e-Governance</strong>&nbsp;will be held in&nbsp;<strong>Hyderabad</strong>. The government of India and Telangana Administrative Reforms department are jointly organising the conference with the&nbsp;<strong>main theme around- technology for accelerating development.</strong></p>\r\n\r\n<p><strong>7.&nbsp;Defence Research and Development Organisation (DRDO)</strong>&nbsp;has successfully flown its&nbsp;<strong>Unmanned Combat Aerial Vehicle RUSTOM 2&nbsp;</strong>in Karnataka.</p>\r\n\r\n<p>8.&nbsp;<strong>Aruna Budda Reddy&nbsp;</strong>has created history by becoming&nbsp;<strong>the first Indian to win an individual medal at the Gymnastics World Cup&nbsp;</strong>in&nbsp;<strong>Melbourne, Australia.</strong>&nbsp;She clinched&nbsp;<strong>a Bronze medal&nbsp;</strong>in the Women&rsquo;s Vault.</p>\r\n\r\n<p>9.&nbsp;Reigning Commonwealth Games champion<strong>&nbsp;Parupalli Kashyap</strong>&nbsp;overcame Malaysia&#39;s&nbsp;<strong>June Wei Cheam&nbsp;</strong>in straight games in the men&#39;s singles final to clinch the Austrian Open International Challenge, his first international title in over three years</p>\r\n\r\n<p>10.&nbsp;<strong>Former Cabinet Secretary T.S.R. Subramanian&nbsp;</strong>passed away. He was 79. Mr Subramanian was a 1961 batch officer of the Uttar Pradesh cadre.&nbsp;</p>', '', '', NULL, 2, '2018-03-17 19:20:56', NULL, 1),
(40, 'Current affairs 01/03/2018', 'current-affairs-01032018', '1. PM Narendra Modi addressed the 2nd India-Korea Business Summit in New Delhi. The theme of the Summit this year is “India-Korea: Scaling up the Special Strategic Relationship through Trade and Investments”.', '2018-03-01 00:00:00', 'modi3.jpg', '<p>1.&nbsp;PM Narendra Modi addressed the 2nd India-Korea Business Summit in New Delhi. The theme of the Summit this year is &ldquo;India-Korea: Scaling up the Special Strategic Relationship through Trade and Investments&rdquo;.<strong>&nbsp;</strong>The Summit aims to create the framework for an open and action-oriented dialogue between top business leaders and Government officials from both countries. India and Korea are the third and fourth largest economies in Asia. The two way trade between India and South Korea currently stands at nearly 17 billion dollar.</p>\r\n\r\n<p>2.&nbsp;Unique Identification Authority of India (UIDAI) introduced a &lsquo;Baal Aadhaar&rsquo; card for children below the age of five years. No biometric details will be required to get this blue-coloured Baal Aadhaar card.</p>\r\n\r\n<p>3.&nbsp;Union Minister of Drinking Water and Sanitation, Uma Bharti launched the Swajal pilot project at Village Bhikampura in Rajasthan. Besides ensuring the availability of clean drinking water to every household round the year, the project would also generate employment.</p>\r\n\r\n<p>4.&nbsp;Television journalist Rahul Mahajan has been appointed as editor-in-chief of the television channel Rajya Sabha TV. Mahajan&rsquo;s name was recommended by a five-member selection committee headed by Prasar Bharti chairman A. Surya Prakash and was approved by the vice-president of India M.Venkaiah Naidu.</p>\r\n\r\n<p>5.&nbsp;China was elected as the Vice President of Financial Action Task Force (FATF), a global body mandated to combat terror financing and money laundering. China&#39;s election came after the FATF plenary meeting in Paris.</p>\r\n\r\n<p>6.&nbsp;Michael McCormack has been elected new Deputy Prime Minister of Australia. He has replaced former Deputy Prime Minister Barnaby Joyce.</p>\r\n\r\n<p>7.&nbsp;Employees&rsquo; Provident Fund Organisation (EPFO) has introduced UAN-Aadhaar linking facility for the convenience of members using EPFO Link in UMANG Mobile App.</p>\r\n\r\n<p>8.&nbsp;India has been ranked 47th out of 86 countries on the Inclusive Internet Index by the Economist Intelligence Unit (EIU), which was commissioned by Facebook.</p>\r\n\r\n<p>9.&nbsp;ndian stars Seema Poonia and MC Mary Kom have settled for Silver medals after losing in the final of 69th Strandja Memorial Boxing tournament at Sofia in Bulgaria.</p>', 'sss', 'PM Narendra Modi addressed the 2nd India-Korea Business Summit in New Delhi. The theme of the Summit this year is “India-Korea: Scaling up the Special Strategic Relationship through Trade and Investments”', NULL, 4, '2018-03-17 19:25:35', '2018-03-24 09:30:08', 1),
(42, 'new afairs', 'new-afairs', 'this is new', '2018-05-20 00:00:00', NULL, '<p>this is test only</p>', '', '', 1, 2, '2018-05-20 07:35:52', NULL, 1);

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
(44, 'settings-index', 'Site Setting', 'Settings', 1);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `portals_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `code`, `portals_id`, `is_delete`, `status`) VALUES
(1, 'amc mdmdmdmd', '', 0, 1, 1),
(2, 'msw ', '', 0, 0, 1),
(3, 'docomo', '', 0, 1, 1),
(4, 'abc', '', 0, 0, 1),
(5, 'abc', 'hnnnn', 0, 1, 0),
(6, 'hiiii', 'rrrr', 1, 0, 1);

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
  `status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `title`, `field_name`, `type`, `select_items`, `value`, `is_required`, `validation_rules`, `created`, `status`) VALUES
(1, 'Site Title', 'site_title', 'text', '', 'Easy My Search', 1, 'trim|required', '2013-04-07 23:23:25', 1),
(2, 'Site Email', 'site_email', 'text', '', 'support@example.com', 1, 'trim|required|valid_email', '2013-04-07 23:24:28', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sub_services`
--

CREATE TABLE `sub_services` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `services_id` int(11) NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '1 Active  0 Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sub_services`
--

INSERT INTO `sub_services` (`id`, `name`, `services_id`, `code`, `is_delete`, `status`) VALUES
(1, 'msw pune ffff', 0, '', 1, 1),
(2, 'hj', 0, '', 1, 1),
(3, 'MSW', 4, '', 0, 1),
(4, 'MSW1', 2, '', 0, 1),
(5, 'b1', 2, 'kkkk', 1, 0),
(6, 'dff', 0, 'dfd', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_companies_package`
--

CREATE TABLE `tbl_companies_package` (
  `in_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `flg_is_delete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_companies_package`
--

INSERT INTO `tbl_companies_package` (`in_id`, `company_id`, `package_id`, `flg_is_delete`) VALUES
(1, 2, 9, 0),
(2, 2, 10, 0),
(3, 2, 12, 0),
(4, 2, 13, 0),
(5, 2, 14, 0),
(6, 2, 15, 0),
(7, 2, 16, 0),
(8, 2, 20, 0),
(12, 10, 9, 0),
(18, 13, 9, 0),
(19, 13, 16, 0),
(32, 14, 9, 0),
(33, 14, 10, 0),
(34, 14, 12, 0),
(35, 14, 13, 0),
(36, 14, 14, 0),
(37, 14, 15, 0),
(38, 14, 16, 0),
(39, 14, 20, 0),
(50, 16, 7, 0),
(51, 16, 9, 0),
(52, 19, 9, 0),
(53, 19, 8, 0),
(54, 18, 7, 0),
(55, 18, 9, 0),
(56, 17, 7, 0),
(57, 17, 9, 0),
(58, 17, 8, 0);

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
(1, '127.0.0.1', 'admin', '$2y$08$X.wo1a1ctWWqF/tiLCx.wubIZsXlKjpxjZNsHwi0ooBkuxL1Muple', NULL, 'admin@admin.com', '', '41OxdsvwogkRPa7YoTUUku1b6c8113ad4e2f5ac2', 1508057752, NULL, 0, NULL, 1528767362, 1528850684, 1, 'Super', 'Admin', 'ADMIN', '', 0),
(6, '112.110.103.182', NULL, '$2y$08$vpd/P3G4muFz2ndh.ffxVuOLnnS6Tuk7VXfZI9qRLLGvpoxiTe3n6', NULL, 'raoarun16@gmail.com', NULL, NULL, NULL, NULL, 0, NULL, 1520146847, 1520873599, 1, 'Arun', 'kumar', NULL, '9138333368', 0),
(7, '157.37.132.82', NULL, '$2y$08$fGILetq/Noz8If5a7FccF.WiNAH1hbGQQXWQF9JaostHDlaDMl7LC', NULL, 'motilalsoni@gmail.com', NULL, NULL, NULL, NULL, 0, NULL, 1520696550, 1520697301, 1, 'Motilal', 'Soni', NULL, '90324978491', 0);

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
(7, 6, 3),
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
-- Dumping data for table `users_permissions`
--

INSERT INTO `users_permissions` (`id`, `user_id`, `permission_id`, `created`) VALUES
(19, 6, 1, '2018-03-04 07:43:59'),
(20, 6, 2, '2018-03-04 07:43:59'),
(21, 6, 3, '2018-03-04 07:43:59'),
(22, 6, 4, '2018-03-04 07:43:59'),
(23, 6, 24, '2018-03-04 07:43:59'),
(24, 6, 28, '2018-03-04 07:43:59'),
(25, 6, 29, '2018-03-04 07:43:59'),
(26, 6, 30, '2018-03-04 07:43:59'),
(27, 6, 31, '2018-03-04 07:43:59'),
(28, 6, 32, '2018-03-04 07:43:59'),
(29, 6, 38, '2018-03-04 07:43:59'),
(30, 6, 39, '2018-03-04 07:43:59'),
(31, 6, 40, '2018-03-04 07:43:59'),
(32, 6, 41, '2018-03-04 07:43:59'),
(33, 6, 42, '2018-03-04 07:43:59'),
(34, 6, 45, '2018-03-04 07:43:59'),
(35, 6, 46, '2018-03-04 07:43:59'),
(36, 6, 47, '2018-03-04 07:43:59'),
(37, 6, 48, '2018-03-04 07:43:59'),
(38, 6, 49, '2018-03-04 07:43:59'),
(39, 6, 55, '2018-03-04 07:43:59'),
(40, 6, 56, '2018-03-04 07:43:59'),
(41, 6, 57, '2018-03-04 07:43:59'),
(42, 6, 58, '2018-03-04 07:43:59'),
(43, 6, 59, '2018-03-04 07:43:59'),
(44, 6, 60, '2018-03-04 07:43:59'),
(45, 6, 61, '2018-03-04 07:43:59'),
(46, 6, 62, '2018-03-04 07:43:59'),
(47, 6, 63, '2018-03-04 07:43:59'),
(48, 6, 64, '2018-03-04 07:43:59'),
(49, 6, 33, '2018-03-07 03:08:00'),
(50, 6, 34, '2018-03-07 03:08:00'),
(51, 6, 35, '2018-03-07 03:08:00'),
(52, 6, 36, '2018-03-07 03:08:00'),
(53, 6, 37, '2018-03-07 03:08:00'),
(54, 6, 50, '2018-03-07 03:08:00'),
(55, 6, 51, '2018-03-07 03:08:00'),
(56, 6, 52, '2018-03-07 03:08:00'),
(57, 6, 53, '2018-03-07 03:08:00'),
(58, 6, 54, '2018-03-07 03:08:00');

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--

CREATE TABLE `visitors` (
  `id` int(11) NOT NULL,
  `ip_address` varchar(20) NOT NULL,
  `come_in` datetime NOT NULL,
  `last_activity` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `visitors`
--

INSERT INTO `visitors` (`id`, `ip_address`, `come_in`, `last_activity`) VALUES
(16, '127.0.0.1', '2018-05-10 22:03:04', NULL),
(15, '127.0.0.1', '2018-05-10 21:59:42', '2018-05-10 22:03:01'),
(14, '127.0.0.1', '2018-05-10 21:59:37', '2018-05-10 22:06:21'),
(13, '127.0.0.5', '2018-05-10 21:59:35', NULL),
(12, '127.0.0.1', '2018-05-10 09:12:53', '2018-05-10 09:13:04'),
(11, '127.0.0.1', '2018-05-10 09:09:31', '2018-05-10 09:10:09'),
(10, '127.0.0.1', '2018-05-10 07:54:18', '2018-05-10 21:59:27'),
(17, '127.0.0.1', '2018-05-10 22:03:06', NULL),
(18, '127.0.0.1', '2018-05-10 22:05:58', '2018-05-10 22:06:27'),
(19, '127.0.0.1', '2018-05-10 22:06:08', '2018-05-10 22:09:35'),
(20, '127.0.0.1', '2018-05-10 22:06:11', NULL),
(21, '127.0.0.1', '2018-05-10 22:06:15', NULL),
(22, '127.0.0.1', '2018-05-10 22:06:19', NULL),
(23, '127.0.0.1', '2018-05-10 22:06:24', NULL),
(24, '127.0.0.1', '2018-05-10 22:09:29', '2018-05-10 22:21:48'),
(25, '127.0.0.1', '2018-05-11 07:20:22', '2018-05-11 20:49:56'),
(26, '127.0.0.1', '2018-05-11 20:46:59', NULL),
(27, '127.0.0.1', '2018-05-11 20:47:02', NULL),
(28, '127.0.0.1', '2018-05-11 20:47:06', NULL),
(29, '127.0.0.1', '2018-05-11 20:47:08', NULL),
(30, '127.0.0.1', '2018-05-11 20:47:12', NULL),
(31, '127.0.0.1', '2018-05-11 20:49:37', NULL),
(32, '127.0.0.1', '2018-05-11 20:49:40', '2018-05-11 20:49:53'),
(33, '127.0.0.1', '2018-05-11 20:49:59', NULL),
(34, '127.0.0.1', '2018-05-19 11:23:27', '2018-05-19 22:33:40'),
(35, '127.0.0.1', '2018-05-19 12:45:00', '2018-05-19 13:24:05'),
(36, '127.0.0.1', '2018-05-19 12:47:42', '2018-05-19 13:42:30'),
(37, '127.0.0.1', '2018-05-19 13:42:41', '2018-05-19 13:44:51'),
(38, '127.0.0.1', '2018-05-19 13:48:04', '2018-05-19 13:54:48'),
(39, '127.0.0.1', '2018-05-19 15:39:31', NULL),
(40, '127.0.0.1', '2018-05-19 15:39:33', NULL),
(41, '127.0.0.1', '2018-05-20 07:02:36', '2018-05-20 07:47:40'),
(42, '127.0.0.1', '2018-05-23 22:27:14', NULL),
(43, '127.0.0.1', '2018-05-27 09:49:54', '2018-05-27 09:50:09'),
(44, '127.0.0.1', '2018-06-02 11:25:45', '2018-06-02 13:30:39'),
(45, '127.0.0.1', '2018-06-03 12:58:59', NULL),
(46, '127.0.0.1', '2018-06-09 16:15:43', '2018-06-09 16:16:36'),
(47, '127.0.0.1', '2018-06-10 09:39:03', '2018-06-10 14:36:15'),
(48, '::1', '2018-06-12 06:42:59', '2018-06-12 07:03:36');

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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companies_city`
--
ALTER TABLE `companies_city`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companies_group`
--
ALTER TABLE `companies_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companies_services`
--
ALTER TABLE `companies_services`
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
-- Indexes for table `form_alerts`
--
ALTER TABLE `form_alerts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`category`);

--
-- Indexes for table `form_alerts_categories`
--
ALTER TABLE `form_alerts_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_services`
--
ALTER TABLE `sub_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_companies_package`
--
ALTER TABLE `tbl_companies_package`
  ADD PRIMARY KEY (`in_id`);

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
-- Indexes for table `visitors`
--
ALTER TABLE `visitors`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `companies_city`
--
ALTER TABLE `companies_city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `companies_group`
--
ALTER TABLE `companies_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `companies_services`
--
ALTER TABLE `companies_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `flash_messages`
--
ALTER TABLE `flash_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `form_alerts`
--
ALTER TABLE `form_alerts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `form_alerts_categories`
--
ALTER TABLE `form_alerts_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `sub_services`
--
ALTER TABLE `sub_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tbl_companies_package`
--
ALTER TABLE `tbl_companies_package`
  MODIFY `in_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
--
-- AUTO_INCREMENT for table `visitors`
--
ALTER TABLE `visitors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
