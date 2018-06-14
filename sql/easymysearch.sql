-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2018 at 07:21 PM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
  `is_delete` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `is_active`, `is_delete`) VALUES
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
('24fssnf3tg5p0df3b0vdfbhsp2pjbm35', '::1', 1528881634, '__ci_last_regenerate|i:1528881360;identity|s:15:"admin@admin.com";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1528850684";last_check|i:1528871126;'),
('b6avocerlut82lefgklnjs9vlerk6klh', '::1', 1528880984, '__ci_last_regenerate|i:1528880961;identity|s:15:"admin@admin.com";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1528850684";last_check|i:1528871126;'),
('2r9ojr2igu8ktgjc9juh97ohnn8omlru', '::1', 1528879922, '__ci_last_regenerate|i:1528879705;identity|s:15:"admin@admin.com";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1528850684";last_check|i:1528871126;success|s:18:"ComapanyAddSuccess";__ci_vars|a:1:{s:7:"success";s:3:"old";}'),
('in3tcp6aphld0fqjmhvbi78f1ik8s29p', '::1', 1528879507, '__ci_last_regenerate|i:1528879251;identity|s:15:"admin@admin.com";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1528850684";last_check|i:1528871126;'),
('k4bqvi5s511fa9slerk3oqvnkmgpnubq', '::1', 1528766361, '__ci_last_regenerate|i:1528766080;'),
('e5nr4htgt84h8jmsurst02t8al80t9eb', '::1', 1528766676, '__ci_last_regenerate|i:1528766385;'),
('593dtf08a5nqvlj04amg9m2i04pohhlj', '::1', 1528766911, '__ci_last_regenerate|i:1528766741;'),
('aavarr9sf54ni8hhi335bio79ruhcsi7', '::1', 1528878435, '__ci_last_regenerate|i:1528878232;identity|s:15:"admin@admin.com";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1528850684";last_check|i:1528871126;'),
('rqqblcuneq12ojjhssspjbhbat1nkha0', '::1', 1528766010, '__ci_last_regenerate|i:1528765758;'),
('0to1nngvtp8q49se8areb3nqbai6hvmt', '::1', 1528877772, '__ci_last_regenerate|i:1528877572;identity|s:15:"admin@admin.com";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1528850684";last_check|i:1528871126;'),
('hebeu8fbmgnajfl4qbkp4htd06vuhaec', '::1', 1528877437, '__ci_last_regenerate|i:1528877231;identity|s:15:"admin@admin.com";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1528850684";last_check|i:1528871126;'),
('ijnembldnu28rfncb31rv64ms8bsorfd', '::1', 1528873584, '__ci_last_regenerate|i:1528873520;identity|s:15:"admin@admin.com";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1528850684";last_check|i:1528871126;'),
('43prlf7ivs53rad7fa4p0chamontc24u', '::1', 1528873496, '__ci_last_regenerate|i:1528872743;identity|s:15:"admin@admin.com";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1528850684";last_check|i:1528871126;'),
('h8ghfr3u1g2vgac23ucscd5qc29ftq0o', '::1', 1528872656, '__ci_last_regenerate|i:1528872431;identity|s:15:"admin@admin.com";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1528850684";last_check|i:1528871126;'),
('cajvgtevj9mo5g20gn2k4v9g8pe7eqb9', '::1', 1528871556, '__ci_last_regenerate|i:1528871365;identity|s:15:"admin@admin.com";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1528850684";last_check|i:1528871126;'),
('4js155vgdh158nq4jq7u8bvl35857pm6', '::1', 1528871282, '__ci_last_regenerate|i:1528871060;identity|s:15:"admin@admin.com";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1528850684";last_check|i:1528871126;'),
('5l1qj4e8g82go31te3dgqq1vq8plub5t', '::1', 1528881873, '__ci_last_regenerate|i:1528881763;identity|s:15:"admin@admin.com";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1528850684";last_check|i:1528871126;'),
('t1rbptu8q6mv6c8isk8gpcmh5idbq9n6', '::1', 1528882622, '__ci_last_regenerate|i:1528882622;identity|s:15:"admin@admin.com";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1528850684";last_check|i:1528871126;'),
('vnm72d2pu86qukt882k6fo7ihhj42h0c', '::1', 1528883330, '__ci_last_regenerate|i:1528883095;identity|s:15:"admin@admin.com";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1528850684";last_check|i:1528871126;'),
('cbdkf5oi6vfte48o99viqc53131me5dv', '::1', 1528883583, '__ci_last_regenerate|i:1528883420;identity|s:15:"admin@admin.com";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1528850684";last_check|i:1528871126;'),
('7ghgvvpmbsi8l1mbd9riji2dbn4rnd8s', '::1', 1528884027, '__ci_last_regenerate|i:1528883753;identity|s:15:"admin@admin.com";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1528850684";last_check|i:1528871126;'),
('3fmms3vc3pm1ver32gspu9p620127p41', '::1', 1528884300, '__ci_last_regenerate|i:1528884065;identity|s:15:"admin@admin.com";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1528850684";last_check|i:1528871126;'),
('kvoi1hiq594b3f83i8l18aepnclfop81', '::1', 1528884883, '__ci_last_regenerate|i:1528884624;identity|s:15:"admin@admin.com";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1528850684";last_check|i:1528871126;');

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
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `slug`, `gst_no`, `aadhar_no`, `pencard_no`, `company_address`, `flg_doc`, `company_owner`, `phone1`, `phone2`, `cities_id`, `servicetypes_id`, `groups_id`, `email`, `location`, `state`, `city`, `latitude`, `logitude`, `country`, `zip_code`, `ranges`, `aadhar_doc`, `pencard_doc`, `packages_id`, `leads_id`, `remaining_leads_id`, `is_delete`, `is_active`, `created`, `updated`) VALUES
(4, 'DC', '', '77', 'weeeee', 'ACYPQ 2369852', 'pune', 0, 'DC', '741', '5644444', 'a:1:{i:0;s:6:"Nashik";}', 0, 0, 'admin@gmail.com', 'Indian Oil Nagar, Shivaji Nagar, Mumbai, Maharashtra, India', 'maharashtra', 'mumbai', '7', '9633', 'india', '11', 10, '', '', 0, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'MSW', '', 'awe741', '12345693', 'ACYPQ 2369852', 'Pune Station Bus Stand, Agarkar Nagar, Pune, Maharashtra, India', 0, 'MSW 1', '741852', '852', 'a:4:{i:0;s:6:"Nashik";i:1;s:6:"chopda";i:2;s:6:"chopda";i:3;s:6:"mumbai";}', 0, 9, 'msw@gmail.com', 'Nashik Road, Nashik, Maharashtra, India', 'Maharashtra', 'pune', '9633', '8521', 'india', '11', 85, '', '', 0, 0, 0, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'BMW', '', '963258', '855269933', '7412369', 'Ozar, Maharashtra, India', 0, 'BMW ', '7777', '888', 'a:1:{i:0;s:6:"mumbai";}', 0, 10, 'bmw@gmail.com', 'Nashik, Maharashtra, India', 'Maharashtra', 'Nashik', '52', '528', 'India', '411038', 8596, '', '', 0, 0, 0, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'Sundaram', '', '87', '741', '789', 'Nashik', 0, 'Sundaram123', '456', '963', 'a:1:{i:0;s:6:"Nashik";}', 0, 10, 'Sundaram@gmail.com', 'Mumbai, Maharashtra, India', 'maharashtra', 'Mumbai', '88996633', '7412589', 'India', '20', 8588, '', '', 0, 0, 0, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'MI', '', '', '', '', 'Pune', 0, 'MI', '', '', 'a:4:{i:0;s:6:"Nashik";i:1;s:6:"chopda";i:2;s:6:"chopda";i:3;s:6:"mumbai";}', 0, 12, 'mi@gmail.com', 'Pune Station Bus Stand, Sanjay Gandhi Road, Agarkar Nagar, Pune, Maharashtra, India', 'Maharashtra', 'Pune', '', '', '', '11', 0, '', '', 0, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'Lenovo', '', '15223322', '', '', 'Lenovo pune', 0, 'Lenovo', '852', '7411', 'a:2:{i:0;s:6:"Nashik";i:1;s:4:"Pune";}', 0, 11, 'Lenovo@gmail.com', 'Tilak Road, Jadhav Nagar, Vadgaon Budruk, Pune, Maharashtra, India', '', '', '', '', '', '', 0, '', '', 0, 0, 0, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'abc', '', '', '', '', '', 0, 'abc', '', '', 'a:2:{i:0;s:6:"Nashik";i:1;s:6:"Mumbai";}', 0, 0, '', 'Shirpur, Maharashtra, India', 'MH', 'Shirpur', '', '', 'India', '425405', 0, '', '', 0, 0, 0, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'Google', '', '444', '444', '444', 'USA', 0, 'google', '111', '222', 'a:1:{i:0;s:6:"Mumbai";}', 0, 0, 'google', 'USAF Academy, CO, USA', 'CO', 'U.S. Air Force Academy', '', '', 'United States', '80840', 90, '', '', 6, 0, 0, 0, 0, '2018-04-28 00:00:00', '0000-00-00 00:00:00'),
(12, 'MI', '', '1562', '852', 'ACQP', 'Pune Station Bus Stand, Agarkar Nagar, Pune, Maharashtra, India', 0, 'MI', '55', '55', 'a:1:{i:0;s:4:"Pune";}', 0, 0, 'mi', 'Pune Station Bus Stand, Sanjay Gandhi Road, Agarkar Nagar, Pune, Maharashtra, India', 'MH', 'Pune', '', '', 'India', '411001', 0, '', '', 9, 0, 0, 0, 0, '2018-04-28 00:00:00', '0000-00-00 00:00:00'),
(13, 'Lenovo', '', '77777', '777', '77777', 'Lenovo', 0, 'Lenovo', '777', '8888', 'a:1:{i:0;s:6:"Nashik";}', 0, 0, 'Lenovo@gmail.com', 'Kothrud Bus Depot, Eklavya Colony, Kothrud, Pune, Maharashtra, India', 'MH', 'Pune', '', '', 'India', '411038', 230, '', '', 0, 0, 0, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'Intel', '', '444', '555666', 'aqcp65656', 'USA', 0, 'Intel', '123', '456', 'a:1:{i:0;s:6:"Mumbai";}', 0, 0, 'admin@gmail.com', 'Utersum, Germany', 'SH', 'Utersum', '', '', 'Germany', '25938', 111, '', '', 0, 0, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'Accenture', '', '123', '8522', '78963258', 'Pune', 0, 'Accenture', '111', '111', 'a:1:{i:0;s:4:"Pune";}', 0, 0, 'abc@gamil.com', 'Hinjawadi Phase 1 Road, Phase 1, Hinjewadi Rajiv Gandhi Infotech Park, Hinjawadi, Pimpri-Chinchwad, Pune, Maharashtra, India', 'MH', 'Pimpri-Chinchwad', '', '', 'India', '411057', 0, '', '', 0, 0, 0, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'TCS', '', '88888', '8888', '8888', 'TCS', 0, 'TCS', '55555', '77777', 'a:2:{i:0;s:6:"Nashik";i:1;s:6:"Mumbai";}', 0, 0, 'TCS', 'Mahatma Gandhi Road, Agarwal Colony, Sadar Bazaar, Pune, Maharashtra, India', 'MH', 'Pune', '', '', 'India', '411001', 111, '', '', 8, 0, 0, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 'MSW', '', '1234569852', '852963', '852963', 'MSW', 0, 'MSW', '9999', '9999', 'a:1:{i:0;s:6:"Nashik";}', 0, 0, 'MSW', 'Mswi Street, Village 1 South, Cape Town, South Africa', 'WC', 'Cape Town', '', '', 'South Africa', '7784', 11, '', '', 9, 0, 0, 0, 0, '2018-05-06 00:00:00', '0000-00-00 00:00:00'),
(18, 'abcddddd', '', '', '', '', '', 0, 'ss', '', '', '', 2, 0, '', '', '', '', '', '', '', '', 0, '', '', 6, 0, 0, 0, 0, '2018-04-02 00:00:00', '0000-00-00 00:00:00'),
(19, 'fastrack', '', '852', '852963', 'pl789', 'Pune', 0, 'fastrack', '123', '456', '', 2, 0, 'fastrack@gmail.com', 'Kothrud Bus Depot, Eklavya Colony, Kothrud, Pune, Maharashtra, India', 'MH', 'Pune', '122355.333', '9633.369', 'India', '411038', 10, '', '', 8, 0, 0, 0, 1, '2018-04-16 00:00:00', '0000-00-00 00:00:00'),
(28, 'Company name', '5b20eda91b724', 'GST No.', 'Aadhar No.', 'Pencard No.', 'Company Address', NULL, 'Company Owner', 'Phone', 'Alternate Phone', NULL, 2, NULL, 'Email', 'Jaipur, Rajasthan, India', 'rajastha', 'jaipur', '1265', '544545', 'india', '302011', 0, 'DRGbzQ4X4AAjRsr5.jpg', 'New_Picture_(2)3.png', NULL, NULL, NULL, NULL, NULL, '2018-06-13 14:22:02', '2018-06-13 10:10:49');

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
(17, 8, 19, 0),
(32, 6, 27, 0),
(33, 4, 27, 0);

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
(2, 18, 3, 0),
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
(4, 'Forgot Password', 'Forgot Password', 'forgot-password', '<p>Dear User,</p>\r\n\r\n<p>Your password is reset successfully,&nbsp;</p>\r\n\r\n<p>Please <a href="{link}">click here</a> to create new password.</p>\r\n\r\n<p>Thank you</p>\r\n\r\n<p><strong>Regards,</strong></p>\r\n\r\n<p><strong>Easy My Search</strong></p>', '{link}', '2015-09-29 00:37:15', '2018-06-12 07:22:31', 1),
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
  `portal_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email_address` varchar(100) NOT NULL,
  `location` varchar(255) NOT NULL,
  `latitude` varchar(50) NOT NULL,
  `longitude` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `zip` varchar(50) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `leads`
--

INSERT INTO `leads` (`id`, `portal_id`, `name`, `email_address`, `location`, `latitude`, `longitude`, `city`, `state`, `country`, `zip`, `phone_number`, `message`, `date`, `is_delete`, `is_active`) VALUES
(1, 0, 'msw', 'msw@gmail.com', 'pune', '', '', '', '', '', '', '123456985230', 'hi', '2018-04-17', 0, 1),
(2, 0, 'dda', 'da', 'da', '', '', '', '', '', '', 'd4a', 'fgggggaa', '2018-04-05', 1, 0),
(3, 0, 'testing', 'testing', 'Pune Airport, Pune International Airport Area, Lohgaon, Pune, Maharashtra', '122355.333', '1526933.444', 'Pune', 'MH', '', '411032', '789413321', 'hiiii', '2018-04-28', 0, 0),
(4, 0, 'abc', '', 'Shirpur, Maharashtra, India', '', '', 'Shirpur', 'MH', '', '425405', '', '', '2018-04-28', 0, 0),
(5, 0, 'rohit', '', '', '', '', '', '', '', '', '', '', '0000-00-00', 0, 1);

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
  `description` varchar(500) NOT NULL,
  `no_of_leads` int(11) NOT NULL,
  `package_type` int(11) NOT NULL COMMENT '1 single , 2 combo',
  `service_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `name`, `duration`, `amount`, `description`, `no_of_leads`, `package_type`, `service_id`, `is_delete`, `is_active`) VALUES
(1, 'idea', 150, 200.00, 'ok', 10, 2, 0, 1, 0),
(2, 'ddasdas', 55555, 20.36, 'sdas', 50, 2, 0, 1, 0),
(3, 'sdsdsdgggggggg', 10, 250.00, 'sdsd', 888888888, 1, 0, 1, 1),
(4, 'sffss', 10, 2563.00, 'dfdf', 10, 2, 0, 1, 1),
(5, 'abc', 10, 2603.00, 'fgf', 25, 2, 2, 1, 1),
(6, 'abcde', 100, 563.00, 'hiiiiii', 123, 1, 4, 0, 1),
(7, 't1', 52, 632.00, '', 90, 1, 2, 0, 1),
(8, 'G1', 963, 8569.00, '', 77, 2, 4, 0, 1),
(9, 'c1', 7, 66.00, 'ok', 88, 1, 2, 0, 1);

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
(2, 'easymysearch', 'https://easymysearch.com/', 0, 0),
(3, 'wwwwrrrr', 'wwwwrrrrr', 1, 0);

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
  `is_active` tinyint(1) NOT NULL COMMENT '1 Active  0 Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `servicetypes_id`, `code`, `is_delete`, `is_active`) VALUES
(1, 'msw pune ffff', 0, '', 0, 1),
(2, 'hj', 0, '', 0, 1),
(3, 'MSW', 4, '', 0, 1),
(4, 'MSW1', 2, '', 0, 1),
(5, 'b1', 2, 'kkkk', 0, 1),
(6, 'dff', 0, 'dfd', 0, 1);

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
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `servicetypes`
--

INSERT INTO `servicetypes` (`id`, `name`, `code`, `portals_id`, `is_delete`, `is_active`) VALUES
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
(1, '127.0.0.1', 'admin', '$2y$08$X.wo1a1ctWWqF/tiLCx.wubIZsXlKjpxjZNsHwi0ooBkuxL1Muple', NULL, 'admin@admin.com', '', '41OxdsvwogkRPa7YoTUUku1b6c8113ad4e2f5ac2', 1508057752, NULL, 0, NULL, 1528767362, 1528871126, 1, 'Super', 'Admin', 'ADMIN', '', 0),
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `companies_city`
--
ALTER TABLE `companies_city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `companies_group`
--
ALTER TABLE `companies_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
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
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `leads`
--
ALTER TABLE `leads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `portals`
--
ALTER TABLE `portals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `servicetypes`
--
ALTER TABLE `servicetypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
--
-- AUTO_INCREMENT for table `visitors`
--
ALTER TABLE `visitors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
