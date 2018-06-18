-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2018 at 08:55 AM
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
('qe4mtftb4lc8geiqmf2rstc955tecsm2', '127.0.0.1', 1529025633, '__ci_last_regenerate|i:1529025633;'),
('pfo162a6vc9dt7fijgj4kmuefk1ivr28', '127.0.0.1', 1529025646, '__ci_last_regenerate|i:1529025646;'),
('ec8rdnkrpdko1jk6fu3p1i2cu20v9vf7', '127.0.0.1', 1529025599, '__ci_last_regenerate|i:1529025599;'),
('orvf9g95v8os545rh47rokjoa9jt69ll', '127.0.0.1', 1529024840, '__ci_last_regenerate|i:1529024840;'),
('dn4m9lsihnrr31gfrvb3nvgo2p12agbj', '127.0.0.1', 1529024716, '__ci_last_regenerate|i:1529024715;'),
('guc0bn2goa1vm2n80tf5e7vhh0ie2oe0', '127.0.0.1', 1529024791, '__ci_last_regenerate|i:1529024791;'),
('rs2raf3fqsmejck1g1dfhcrofkhoeq9g', '127.0.0.1', 1529024580, '__ci_last_regenerate|i:1529024579;'),
('i75c25ne0uecu8tt8rbluqrh0lg898bg', '127.0.0.1', 1529256718, '__ci_last_regenerate|i:1529256418;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1529246449\";last_check|i:1529256466;'),
('h8mk9njjqqpuindso898q764rig8nbf0', '127.0.0.1', 1529256856, '__ci_last_regenerate|i:1529256740;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1529246449\";last_check|i:1529256466;'),
('jpcgfijq1406paumdhie7rus30mr54qa', '127.0.0.1', 1529257675, '__ci_last_regenerate|i:1529257393;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1529246449\";last_check|i:1529256466;'),
('666hf8j6n2mrs4n2fpdpitimqtojpq6a', '127.0.0.1', 1529257727, '__ci_last_regenerate|i:1529257719;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1529246449\";last_check|i:1529256466;'),
('v7ijvq254gpkcv4s2bmo2mg4jsb4ppsm', '127.0.0.1', 1529258290, '__ci_last_regenerate|i:1529258031;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1529246449\";last_check|i:1529256466;'),
('dag6cdqdels0uhpnksfpvpfq7it59he9', '::1', 1529171938, '__ci_last_regenerate|i:1529171937;');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `gst_no` varchar(255) DEFAULT NULL,
  `aadhar_no` varchar(255) DEFAULT NULL,
  `pencard_no` varchar(255) DEFAULT NULL,
  `company_address` varchar(255) DEFAULT NULL,
  `flg_doc` int(11) DEFAULT NULL,
  `company_owner` varchar(255) DEFAULT NULL,
  `phone1` varchar(255) DEFAULT NULL,
  `phone2` varchar(255) DEFAULT NULL,
  `cities_id` varchar(255) DEFAULT NULL,
  `servicetypes_id` int(11) DEFAULT NULL,
  `groups_id` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `latitude` varchar(200) DEFAULT NULL,
  `logitude` varchar(200) DEFAULT NULL,
  `country` varchar(200) DEFAULT NULL,
  `zip_code` varchar(100) DEFAULT NULL,
  `ranges` int(11) NOT NULL,
  `aadhar_doc` varchar(100) NOT NULL,
  `pencard_doc` varchar(100) DEFAULT NULL,
  `packages_id` int(11) DEFAULT NULL,
  `leads_id` int(11) DEFAULT NULL,
  `remaining_leads_id` int(11) DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL COMMENT '1 Active  0 Inactive',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `slug`, `gst_no`, `aadhar_no`, `pencard_no`, `company_address`, `flg_doc`, `company_owner`, `phone1`, `phone2`, `cities_id`, `servicetypes_id`, `groups_id`, `email`, `location`, `state`, `city`, `latitude`, `logitude`, `country`, `zip_code`, `ranges`, `aadhar_doc`, `pencard_doc`, `packages_id`, `leads_id`, `remaining_leads_id`, `is_delete`, `is_active`, `created`, `updated`) VALUES
(4, 'DC', '', '77', 'weeeee', 'ACYPQ 2369852', 'pune', 0, 'DC', '741', '5644444', 'a:1:{i:0;s:6:\"Nashik\";}', 0, 0, 'admin@gmail.com', 'Indian Oil Nagar, Shivaji Nagar, Mumbai, Maharashtra, India', 'maharashtra', 'mumbai', '7', '9633', 'india', '11', 10, '', '', 0, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'MSW', '', 'awe741', '12345693', 'ACYPQ 2369852', 'Pune Station Bus Stand, Agarkar Nagar, Pune, Maharashtra, India', 0, 'MSW 1', '741852', '852', 'a:4:{i:0;s:6:\"Nashik\";i:1;s:6:\"chopda\";i:2;s:6:\"chopda\";i:3;s:6:\"mumbai\";}', 0, 9, 'msw@gmail.com', 'Nashik Road, Nashik, Maharashtra, India', 'Maharashtra', 'pune', '9633', '8521', 'india', '11', 85, '', '', 0, 0, 0, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'BMW', '', '963258', '855269933', '7412369', 'Ozar, Maharashtra, India', 0, 'BMW ', '7777', '888', 'a:1:{i:0;s:6:\"mumbai\";}', 0, 10, 'bmw@gmail.com', 'Nashik, Maharashtra, India', 'Maharashtra', 'Nashik', '52', '528', 'India', '411038', 8596, '', '', 0, 0, 0, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'Sundaram', '', '87', '741', '789', 'Nashik', 0, 'Sundaram123', '456', '963', 'a:1:{i:0;s:6:\"Nashik\";}', 0, 10, 'Sundaram@gmail.com', 'Mumbai, Maharashtra, India', 'maharashtra', 'Mumbai', '88996633', '7412589', 'India', '20', 8588, '', '', 0, 0, 0, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'MI', '', '', '', '', 'Pune', 0, 'MI', '', '', 'a:4:{i:0;s:6:\"Nashik\";i:1;s:6:\"chopda\";i:2;s:6:\"chopda\";i:3;s:6:\"mumbai\";}', 0, 12, 'mi@gmail.com', 'Pune Station Bus Stand, Sanjay Gandhi Road, Agarkar Nagar, Pune, Maharashtra, India', 'Maharashtra', 'Pune', '', '', '', '11', 0, '', '', 0, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'Lenovo', '', '15223322', '', '', 'Lenovo pune', 0, 'Lenovo', '852', '7411', 'a:2:{i:0;s:6:\"Nashik\";i:1;s:4:\"Pune\";}', 0, 11, 'Lenovo@gmail.com', 'Tilak Road, Jadhav Nagar, Vadgaon Budruk, Pune, Maharashtra, India', '', '', '', '', '', '', 0, '', '', 0, 0, 0, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'abc', '', '', '', '', '', 0, 'abc', '', '', 'a:2:{i:0;s:6:\"Nashik\";i:1;s:6:\"Mumbai\";}', 0, 0, '', 'Shirpur, Maharashtra, India', 'MH', 'Shirpur', '', '', 'India', '425405', 0, '', '', 0, 0, 0, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'Google', '', '444', '444', '444', 'USA', 0, 'google', '111', '222', 'a:1:{i:0;s:6:\"Mumbai\";}', 0, 0, 'google', 'USAF Academy, CO, USA', 'CO', 'U.S. Air Force Academy', '', '', 'United States', '80840', 90, '', '', 6, 0, 0, 0, 1, '2018-04-28 00:00:00', '2018-06-13 15:24:05'),
(12, 'MI', '', '1562', '852', 'ACQP', 'Pune Station Bus Stand, Agarkar Nagar, Pune, Maharashtra, India', 0, 'MI', '55', '55', 'a:1:{i:0;s:4:\"Pune\";}', 0, 0, 'mi', 'Pune Station Bus Stand, Sanjay Gandhi Road, Agarkar Nagar, Pune, Maharashtra, India', 'MH', 'Pune', '', '', 'India', '411001', 0, '', '', 9, 0, 0, 0, 1, '2018-04-28 00:00:00', '2018-06-13 15:24:07'),
(13, 'Lenovo', '', '77777', '777', '77777', 'Lenovo', 0, 'Lenovo', '777', '8888', 'a:1:{i:0;s:6:\"Nashik\";}', 0, 0, 'Lenovo@gmail.com', 'Kothrud Bus Depot, Eklavya Colony, Kothrud, Pune, Maharashtra, India', 'MH', 'Pune', '', '', 'India', '411038', 230, '', '', 0, 0, 0, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'Intel', '', '444', '555666', 'aqcp65656', 'USA', 0, 'Intel', '123', '456', 'a:1:{i:0;s:6:\"Mumbai\";}', 0, 0, 'admin@gmail.com', 'Utersum, Germany', 'SH', 'Utersum', '', '', 'Germany', '25938', 111, '', '', 0, 0, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'Accenture', '', '123', '8522', '78963258', 'Pune', 0, 'Accenture', '111', '111', 'a:1:{i:0;s:4:\"Pune\";}', 0, 0, 'abc@gamil.com', 'Hinjawadi Phase 1 Road, Phase 1, Hinjewadi Rajiv Gandhi Infotech Park, Hinjawadi, Pimpri-Chinchwad, Pune, Maharashtra, India', 'MH', 'Pimpri-Chinchwad', '', '', 'India', '411057', 0, '', '', 0, 0, 0, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'TCS', '', '88888', '8888', '8888', 'TCS', 0, 'TCS', '55555', '77777', 'a:2:{i:0;s:6:\"Nashik\";i:1;s:6:\"Mumbai\";}', 0, 0, 'TCS', 'Mahatma Gandhi Road, Agarwal Colony, Sadar Bazaar, Pune, Maharashtra, India', 'MH', 'Pune', '', '', 'India', '411001', 111, '', '', 8, 0, 0, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 'MSW', '5b25e0bc44065', '1234569852', '852963', '852963', 'MSW', 0, 'MSW', '9999', '9999', 'a:1:{i:0;s:6:\"Nashik\";}', NULL, 0, 'MSW', 'Mswi Street, Village 1 South, Cape Town, South Africa', 'WC', 'Cape Town', NULL, NULL, 'South Africa', '7784', 11, '', '', 9, 0, 0, 0, 1, '2018-05-06 00:00:00', '2018-06-17 04:17:00'),
(18, 'abcddddd', '5b21c18abdae5', NULL, '123654789', NULL, 'alwar', 0, 'ss', NULL, NULL, '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '36985', 0, 'WhatsApp_Image_2018-05-22_at_5_31_45_PM.jpeg', 'WhatsApp_Image_2018-05-22_at_5_31_46_PM(1).jpeg', 6, 0, 0, 0, 1, '2018-04-02 00:00:00', '2018-06-14 01:14:50'),
(19, 'fastrack', '', '852', '852963', 'pl789', 'Pune', 0, 'fastrack', '123', '456', '', 2, 0, 'fastrack@gmail.com', 'Kothrud Bus Depot, Eklavya Colony, Kothrud, Pune, Maharashtra, India', 'MH', 'Pune', '122355.333', '9633.369', 'India', '411038', 10, '', '', 8, 0, 0, 0, 1, '2018-04-16 00:00:00', '0000-00-00 00:00:00'),
(28, 'Company name', '5b2150bce3fc2', 'GST No.', 'Aadhar No.', 'Pencard No.', 'Company Address', NULL, 'Company Owner', 'Phone', 'Alternate Phone', NULL, 2, NULL, 'Email', 'Jaipur, Rajasthan, India', 'rajastha', 'jaipur', '1265', '544545', 'india', '302011', 0, 'DRGbzQ4X4AAjRsr5.jpg', 'New_Picture_(2)3.png', NULL, NULL, NULL, NULL, NULL, '2018-06-13 14:22:02', '2018-06-13 17:13:32');

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
(9, 1, 11, 0),
(10, 2, 11, 0),
(11, 4, 11, 0),
(12, 6, 11, 0),
(13, 7, 11, 0),
(14, 8, 11, 0),
(15, 6, 19, 0),
(16, 7, 19, 0),
(17, 8, 19, 0),
(32, 6, 27, 0),
(33, 4, 27, 0),
(36, 4, 28, 0),
(37, 1, 28, 0),
(38, 2, 28, 0),
(39, 6, 17, 0),
(40, 4, 17, 0),
(41, 1, 17, 0),
(42, 8, 17, 0);

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

--
-- Dumping data for table `companies_group`
--

INSERT INTO `companies_group` (`id`, `companies_id`, `company_groups_id`, `is_delete`) VALUES
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
(23, 11, 21, 0),
(24, 12, 21, 0),
(25, 7, 22, 0),
(26, 14, 22, 0),
(27, 7, 22, 0),
(29, 17, 23, 0),
(30, 9, 21, 0),
(31, 3, 24, 0),
(32, 10, 25, 0),
(35, 19, 27, 0),
(36, 11, 27, 0),
(58, 12, 26, 0),
(59, 12, 26, 0),
(69, 19, 20, 0),
(70, 14, 20, 0),
(71, 19, 23, 0),
(72, 11, 23, 0),
(73, 14, 23, 0),
(74, 19, 28, 0),
(75, 12, 20, 0);

-- --------------------------------------------------------

--
-- Table structure for table `companies_package`
--

CREATE TABLE `companies_package` (
  `id` int(11) NOT NULL,
  `companies_id` int(11) NOT NULL,
  `packages_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `companies_package`
--

INSERT INTO `companies_package` (`id`, `companies_id`, `packages_id`, `is_delete`) VALUES
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
(3, 11, 4, 0),
(4, 11, 6, 0),
(5, 19, 4, 0),
(6, 27, 4, 0),
(8, 0, 28, 0),
(9, 0, 28, 0),
(10, 28, 5, 0),
(11, 28, 4, 0);

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

--
-- Dumping data for table `company_groups`
--

INSERT INTO `company_groups` (`id`, `name`, `slug`, `parent_id`, `cities_id`, `created`, `is_delete`, `is_active`) VALUES
(1, 'msw nashik', '', 0, 0, '0000-00-00 00:00:00', 1, 0),
(2, 'dfdf', '', 0, 0, '2018-10-19 18:30:00', 1, 0),
(3, 'dhiraj', '', 0, 0, '2018-03-16 18:30:00', 1, 1),
(4, 'aa', '', 0, 0, '2018-03-28 18:30:00', 1, 1),
(5, 'abhi', '', 0, 0, '2018-02-28 18:30:00', 1, 0),
(6, 'aa', '', 0, 0, '0000-00-00 00:00:00', 1, 1),
(7, 'sss', '', 0, 0, '2018-04-20 18:30:00', 1, 1),
(8, 'raje', '', 0, 0, '2018-04-26 18:30:00', 1, 0),
(9, 'Testing 1', '', 0, 0, '2018-04-10 18:30:00', 1, 0),
(10, 'Testing 2', '', 0, 0, '2018-04-11 18:30:00', 1, 1),
(11, 'Testing 3', '', 0, 0, '2018-04-13 18:30:00', 1, 1),
(12, 'MSW', '', 0, 0, '2018-04-18 18:30:00', 1, 1),
(13, 'PVPIT', '', 0, 4, '2018-04-17 18:30:00', 1, 0),
(14, 'yyyyy', '', 0, 1, '2018-04-01 18:30:00', 1, 0),
(15, 'sdfsdf', '', 0, 1, '2018-04-01 18:30:00', 1, 0),
(16, 'fdgdfgdgdg', '', 0, 2, '2018-04-19 18:30:00', 1, 0),
(17, 'rl', '', 0, 2, '2018-04-27 18:30:00', 1, 0),
(18, 'JSPM', '', 0, 2, '2018-03-31 18:30:00', 1, 0),
(19, 'intel', '', 0, 2, '2018-04-09 18:30:00', 1, 0),
(20, 'Tata Building', 'tata-building', 0, 8, '2018-04-09 18:30:00', 0, 1),
(21, 'B2', '', 0, 3, '2018-04-18 18:30:00', 1, 0),
(22, 'C3', '', 0, 4, '2018-04-16 18:30:00', 1, 0),
(23, 'C3', 'c3', 0, 1, '2018-04-09 18:30:00', 0, 1),
(24, 'B2', '', 0, 2, '2018-04-14 18:30:00', 1, 0),
(25, 'B2', '', 0, 4, '2018-04-01 18:30:00', 1, 0),
(26, 'Motilal soni', 'motilal-soni', 0, 7, '2018-06-13 18:30:00', 1, 1),
(27, 'Chemistry', 'chemistry', 0, 8, '2018-06-14 11:00:13', 0, 1),
(28, 'Chemistry', 'chemistry-1', 0, 7, '2018-06-14 11:00:16', 1, 1);

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
(60, 'FollowUpInactiveSuccess', 'FollowUp Inactive Successfully.', 'FollowUp', 5, '2018-06-17 17:46:11');

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
  `is_delete` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `leads`
--

INSERT INTO `leads` (`id`, `portals_id`, `record_id`, `name`, `email`, `location`, `latitude`, `longitude`, `city`, `state`, `country`, `zip`, `phone_number`, `service_name`, `service_from`, `service_to`, `message`, `date`, `created`, `updated`, `is_delete`, `is_active`) VALUES
(1, 0, NULL, 'msw', 'msw@gmail.com', 'pune', '', '', '', '', '', '', '123456985230', NULL, NULL, NULL, 'hi', '2018-04-17', '2018-06-15 01:11:29', '2018-06-15 01:43:16', 1, 1),
(2, 0, NULL, 'dda', 'da', 'da', '', '', '', '', '', '', 'd4a', NULL, NULL, NULL, 'fgggggaa', '2018-04-05', '2018-06-15 01:11:29', '2018-06-15 01:37:01', 1, 1),
(3, 0, NULL, 'testing', 'testing', 'Pune Airport, Pune International Airport Area, Lohgaon, Pune, Maharashtra', '122355.333', '1526933.444', 'Pune', 'MH', '', '411032', '789413321', NULL, NULL, NULL, 'hiiii', '2018-04-28', '2018-06-15 01:11:29', '2018-06-15 01:42:11', 1, 1),
(4, 0, NULL, 'abc', '', 'Shirpur, Maharashtra, India', '', '', 'Shirpur', 'MH', '', '425405', '', NULL, NULL, NULL, '', '2018-04-28', '2018-06-15 01:11:29', '2018-06-15 01:42:16', 1, 1),
(5, 0, NULL, 'rohit', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, '', '0000-00-00', '2018-06-15 01:11:29', '2018-06-15 01:43:19', 1, 1),
(6, 3, NULL, 'Meta tag delete', 'rakeshss@gmail.com', 'dsdsfs', '', '', '', '', '', '', '3434353422', NULL, NULL, NULL, 'dfdfg', '0000-00-00', '2018-06-15 01:11:29', '2018-06-15 01:40:45', 0, 1),
(7, 3, 6, 'Meta tag delete', 'rakeshss@gmail.com', 'dsdsfs', '', '', '', '', '', '', '3434353422', NULL, NULL, NULL, 'dfdfg', '0000-00-00', '2018-06-15 01:11:29', '2018-06-15 01:40:47', 0, 1),
(8, 3, 9, 'Meta tag delete', 'rakeshss@gmail.com', 'dsdsfs', '', '', '', '', '', '', '3434353422', NULL, NULL, NULL, 'dfdfg', '0000-00-00', '2018-06-15 01:20:46', '2018-06-15 01:36:58', 0, 1);

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

--
-- Dumping data for table `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `ip_address`, `login`, `time`) VALUES
(2, '127.0.0.1', 'abhi7779988@gmail.com', 1529234174);

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `duration` int(11) NOT NULL,
  `amount` float(10,2) NOT NULL,
  `description` varchar(500) NOT NULL,
  `no_of_leads` int(11) NOT NULL,
  `package_type` int(11) NOT NULL COMMENT '1 single , 2 combo',
  `servicetypes_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `name`, `duration`, `amount`, `description`, `no_of_leads`, `package_type`, `servicetypes_id`, `is_delete`, `is_active`, `created`, `updated`) VALUES
(1, 'idea', 150, 200.00, 'ok', 10, 2, 0, 1, 0, '2018-06-17 04:56:28', NULL),
(2, 'ddasdas', 55555, 20.36, 'sdas', 50, 2, 0, 1, 0, '2018-06-17 04:56:28', NULL),
(3, 'sdsdsdgggggggg', 10, 250.00, 'sdsd', 888888888, 1, 0, 1, 1, '2018-06-17 04:56:28', NULL),
(4, 'sffss', 10, 2563.00, 'dfdf', 10, 2, 0, 1, 1, '2018-06-17 04:56:28', '2018-06-17 16:12:41'),
(5, 'abc', 10, 2603.00, 'fgf', 25, 2, 2, 1, 1, '2018-06-17 04:56:28', NULL),
(6, 'abcde', 100, 563.00, 'hiiiiii', 123, 1, 4, 0, 1, '2018-06-17 04:56:28', '2018-06-17 14:41:31'),
(7, 't1', 52, 632.00, '', 90, 1, 2, 0, 1, '2018-06-17 04:56:28', NULL),
(8, 'G1', 963, 8569.00, '', 77, 2, 4, 0, 1, '2018-06-17 04:56:28', NULL),
(9, 'c1', 7, 66.00, 'ok', 88, 1, 0, 0, 1, '2018-06-17 04:56:28', '2018-06-17 08:53:33'),
(10, 'New package', 30, 56.00, 'this is very nice package', 15, 1, 11, 0, 1, '2018-06-17 08:31:41', '2018-06-17 08:40:19');

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
(5, 6, 4, 0),
(6, 6, 6, 0),
(7, 7, 4, 0),
(8, 7, 6, 0),
(9, 8, 4, 0),
(11, 10, 10, 0),
(12, 10, 8, 0);

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
(84, 'package-status', 'Package Change Status', 'Package', 5);

-- --------------------------------------------------------

--
-- Table structure for table `portals`
--

CREATE TABLE `portals` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `site_link` varchar(255) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `portals`
--

INSERT INTO `portals` (`id`, `name`, `site_link`, `is_delete`, `is_active`) VALUES
(1, 'pestomart', 'https://www.pestomart.com/', 0, 1),
(2, 'easymysearch', 'https://easymysearch.com/', 0, 1),
(3, 'wwwwrrrr', 'wwwwrrrrr', 0, 1);

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
(4, 'MSW1', 6, 'sdfsd', 0, 1, '2018-06-16 06:54:52', '2018-06-16 07:28:42'),
(5, 'b1', 6, 'kkkkwe', 0, 0, '2018-06-16 06:54:52', '2018-06-16 07:46:57'),
(6, 'dff', 6, 'dfd', 0, 1, '2018-06-16 06:54:52', '2018-06-16 07:33:22'),
(7, 'Meta tag edit', 4, 'dddd', 1, 1, '2018-06-16 07:36:03', '2018-06-16 07:46:41'),
(8, 'Meta tag edit', 11, 'dddd', 0, 1, '2018-06-16 07:44:09', '0000-00-00 00:00:00'),
(9, 'Meta tag edit', 11, 'dddd', 1, 1, '2018-06-16 07:44:16', '2018-06-16 07:46:39'),
(10, 'Meta tag edit', 11, 'dddd', 0, 1, '2018-06-16 07:44:57', '0000-00-00 00:00:00'),
(11, 'flipkart', 11, '12es1', 0, 0, '2018-06-16 07:45:15', '2018-06-16 07:46:52');

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
(1, 'amc mdmdmdmd', '', 0, 1, 1, '2018-06-16 05:27:27', '2018-06-16 05:27:54'),
(2, 'msw', 'olo1', 1, 0, 1, '2018-06-16 05:27:27', '2018-06-16 06:13:04'),
(3, 'docomo', '', 0, 1, 1, '2018-06-16 05:27:27', '2018-06-16 05:27:54'),
(4, 'abc', '1234', 3, 0, 1, '2018-06-16 05:27:27', '2018-06-16 06:23:13'),
(5, 'abc', 'hnnnn', 0, 1, 0, '2018-06-16 05:27:27', '2018-06-16 05:27:54'),
(6, 'hiiii', 'rrrr', 1, 1, 1, '2018-06-16 05:27:27', '2018-06-16 06:17:18'),
(7, 'My serer', '123454', 2, 0, 1, '2018-06-16 06:07:53', '2018-06-16 06:14:50'),
(8, 'My ser', 'olo1', 1, 0, 1, '2018-06-16 06:07:59', '2018-06-16 06:07:59'),
(9, 'My ser', 'olo1', 1, 1, 1, '2018-06-16 06:08:29', '2018-06-16 06:17:26'),
(10, 'My ser', 'olo1', 1, 1, 1, '2018-06-16 06:08:45', '2018-06-16 06:17:27'),
(11, 'Flipkart pay', 'code 123', 1, 0, 1, '2018-06-16 06:23:29', '2018-06-16 06:23:29'),
(12, 'Group Add', 'ddd', 1, 0, 0, '2018-06-16 06:24:05', '2018-06-16 06:24:09');

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
(1, '127.0.0.1', 'admin', '$2y$08$X.wo1a1ctWWqF/tiLCx.wubIZsXlKjpxjZNsHwi0ooBkuxL1Muple', NULL, 'admin@admin.com', '', '41OxdsvwogkRPa7YoTUUku1b6c8113ad4e2f5ac2', 1508057752, NULL, 0, NULL, 1528767362, 1529256466, 1, 'Super', 'Admin', 'ADMIN', '', 0),
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
(58, 6, 54, '2018-03-07 03:08:00'),
(59, 7, 45, '2018-06-14 01:03:15'),
(60, 7, 46, '2018-06-14 01:03:15');

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
-- Indexes for table `companies_package`
--
ALTER TABLE `companies_package`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companies_service`
--
ALTER TABLE `companies_service`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages_service`
--
ALTER TABLE `packages_service`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `companies_city`
--
ALTER TABLE `companies_city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `companies_group`
--
ALTER TABLE `companies_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;
--
-- AUTO_INCREMENT for table `companies_package`
--
ALTER TABLE `companies_package`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
--
-- AUTO_INCREMENT for table `companies_service`
--
ALTER TABLE `companies_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `company_groups`
--
ALTER TABLE `company_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `flash_messages`
--
ALTER TABLE `flash_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
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
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `packages_service`
--
ALTER TABLE `packages_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;
--
-- AUTO_INCREMENT for table `portals`
--
ALTER TABLE `portals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `servicetypes`
--
ALTER TABLE `servicetypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
