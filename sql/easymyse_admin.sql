-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2018 at 07:52 AM
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
-- Database: `easymyse_admin`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_city`
--

CREATE TABLE `tbl_city` (
  `in_id` int(11) NOT NULL,
  `st_city_name` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `flg_is_active` tinyint(1) NOT NULL,
  `flg_is_delete` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_city`
--

INSERT INTO `tbl_city` (`in_id`, `st_city_name`, `flg_is_active`, `flg_is_delete`) VALUES
(1, 'Nashik', 0, 0),
(2, 'Pune', 1, 0),
(3, 'chopda', 1, 1),
(4, 'Mumbai', 1, 0),
(5, 'bm', 1, 1),
(6, 'Gurgaon', 1, 0),
(7, 'Delhi', 1, 0),
(8, 'Noida', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_company`
--

CREATE TABLE `tbl_company` (
  `in_id` int(11) NOT NULL,
  `st_company_name` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `st_gst_no` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `st_adhar_no` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `st_pancard_no` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `st_company_address` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `flg_doc` int(11) NOT NULL,
  `st_company_owner` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `st_leads_phone_one` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `st_leads_phone_two` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `in_city_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `in_service_type_id` int(11) NOT NULL,
  `in_group_id` int(11) NOT NULL,
  `st_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `st_location` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `st_state` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `st_city` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `st_latitude` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `st_logitude` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `st_contry` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `st_zip_code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `in_range` int(11) NOT NULL,
  `flg_is_delete` tinyint(1) NOT NULL,
  `flg_is_active` tinyint(1) NOT NULL COMMENT '1 Active  0 Inactive',
  `st_image` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `st_pancard_doc` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `in_package_id` int(11) NOT NULL,
  `lead_id` int(11) NOT NULL,
  `remaining_leads_id` int(11) NOT NULL,
  `added_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_company`
--

INSERT INTO `tbl_company` (`in_id`, `st_company_name`, `st_gst_no`, `st_adhar_no`, `st_pancard_no`, `st_company_address`, `flg_doc`, `st_company_owner`, `st_leads_phone_one`, `st_leads_phone_two`, `in_city_id`, `in_service_type_id`, `in_group_id`, `st_email`, `st_location`, `st_state`, `st_city`, `st_latitude`, `st_logitude`, `st_contry`, `st_zip_code`, `in_range`, `flg_is_delete`, `flg_is_active`, `st_image`, `st_pancard_doc`, `in_package_id`, `lead_id`, `remaining_leads_id`, `added_date`) VALUES
(4, 'DC', '77', 'weeeee', 'ACYPQ 2369852', 'pune', 0, 'DC', '741', '5644444', 'a:1:{i:0;s:6:\"Nashik\";}', 0, 0, 'admin@gmail.com', 'Indian Oil Nagar, Shivaji Nagar, Mumbai, Maharashtra, India', 'maharashtra', 'mumbai', '7', '9633', 'india', '11', 10, 1, 0, '', '', 0, 0, 0, '0000-00-00'),
(5, 'MSW', 'awe741', '12345693', 'ACYPQ 2369852', 'Pune Station Bus Stand, Agarkar Nagar, Pune, Maharashtra, India', 0, 'MSW 1', '741852', '852', 'a:4:{i:0;s:6:\"Nashik\";i:1;s:6:\"chopda\";i:2;s:6:\"chopda\";i:3;s:6:\"mumbai\";}', 0, 9, 'msw@gmail.com', 'Nashik Road, Nashik, Maharashtra, India', 'Maharashtra', 'pune', '9633', '8521', 'india', '11', 85, 1, 1, '', '', 0, 0, 0, '0000-00-00'),
(6, 'BMW', '963258', '855269933', '7412369', 'Ozar, Maharashtra, India', 0, 'BMW ', '7777', '888', 'a:1:{i:0;s:6:\"mumbai\";}', 0, 10, 'bmw@gmail.com', 'Nashik, Maharashtra, India', 'Maharashtra', 'Nashik', '52', '528', 'India', '411038', 8596, 1, 1, '', '', 0, 0, 0, '0000-00-00'),
(7, 'Sundaram', '87', '741', '789', 'Nashik', 0, 'Sundaram123', '456', '963', 'a:1:{i:0;s:6:\"Nashik\";}', 0, 10, 'Sundaram@gmail.com', 'Mumbai, Maharashtra, India', 'maharashtra', 'Mumbai', '88996633', '7412589', 'India', '20', 8588, 1, 1, '', '', 0, 0, 0, '0000-00-00'),
(8, 'MI', '', '', '', 'Pune', 0, 'MI', '', '', 'a:4:{i:0;s:6:\"Nashik\";i:1;s:6:\"chopda\";i:2;s:6:\"chopda\";i:3;s:6:\"mumbai\";}', 0, 12, 'mi@gmail.com', 'Pune Station Bus Stand, Sanjay Gandhi Road, Agarkar Nagar, Pune, Maharashtra, India', 'Maharashtra', 'Pune', '', '', '', '11', 0, 1, 0, '', '', 0, 0, 0, '0000-00-00'),
(9, 'Lenovo', '15223322', '', '', 'Lenovo pune', 0, 'Lenovo', '852', '7411', 'a:2:{i:0;s:6:\"Nashik\";i:1;s:4:\"Pune\";}', 0, 11, 'Lenovo@gmail.com', 'Tilak Road, Jadhav Nagar, Vadgaon Budruk, Pune, Maharashtra, India', '', '', '', '', '', '', 0, 1, 1, '', '', 0, 0, 0, '0000-00-00'),
(10, 'abc', '', '', '', '', 0, 'abc', '', '', 'a:2:{i:0;s:6:\"Nashik\";i:1;s:6:\"Mumbai\";}', 0, 0, '', 'Shirpur, Maharashtra, India', 'MH', 'Shirpur', '', '', 'India', '425405', 0, 1, 1, '', '', 0, 0, 0, '0000-00-00'),
(11, 'Google', '444', '444', '444', 'USA', 0, 'google', '111', '222', 'a:1:{i:0;s:6:\"Mumbai\";}', 0, 0, 'google', 'USAF Academy, CO, USA', 'CO', 'U.S. Air Force Academy', '', '', 'United States', '80840', 90, 0, 1, '', '', 6, 0, 0, '2018-04-28'),
(12, 'MI', '1562', '852', 'ACQP', 'Pune Station Bus Stand, Agarkar Nagar, Pune, Maharashtra, India', 0, 'MI', '55', '55', 'a:1:{i:0;s:4:\"Pune\";}', 0, 0, 'mi', 'Pune Station Bus Stand, Sanjay Gandhi Road, Agarkar Nagar, Pune, Maharashtra, India', 'MH', 'Pune', '', '', 'India', '411001', 0, 0, 0, '', '', 9, 0, 0, '2018-04-28'),
(13, 'Lenovo', '77777', '777', '77777', 'Lenovo', 0, 'Lenovo', '777', '8888', 'a:1:{i:0;s:6:\"Nashik\";}', 0, 0, 'Lenovo@gmail.com', 'Kothrud Bus Depot, Eklavya Colony, Kothrud, Pune, Maharashtra, India', 'MH', 'Pune', '', '', 'India', '411038', 230, 1, 1, '', '', 0, 0, 0, '0000-00-00'),
(14, 'Intel', '444', '555666', 'aqcp65656', 'USA', 0, 'Intel', '123', '456', 'a:1:{i:0;s:6:\"Mumbai\";}', 0, 0, 'admin@gmail.com', 'Utersum, Germany', 'SH', 'Utersum', '', '', 'Germany', '25938', 111, 0, 1, '', '', 0, 0, 0, '0000-00-00'),
(15, 'Accenture', '123', '8522', '78963258', 'Pune', 0, 'Accenture', '111', '111', 'a:1:{i:0;s:4:\"Pune\";}', 0, 0, 'abc@gamil.com', 'Hinjawadi Phase 1 Road, Phase 1, Hinjewadi Rajiv Gandhi Infotech Park, Hinjawadi, Pimpri-Chinchwad, Pune, Maharashtra, India', 'MH', 'Pimpri-Chinchwad', '', '', 'India', '411057', 0, 1, 1, '', '', 0, 0, 0, '0000-00-00'),
(16, 'TCS', '88888', '8888', '8888', 'TCS', 0, 'TCS', '55555', '77777', 'a:2:{i:0;s:6:\"Nashik\";i:1;s:6:\"Mumbai\";}', 0, 0, 'TCS', 'Mahatma Gandhi Road, Agarwal Colony, Sadar Bazaar, Pune, Maharashtra, India', 'MH', 'Pune', '', '', 'India', '411001', 111, 1, 1, '', '', 8, 0, 0, '0000-00-00'),
(17, 'MSW', '1234569852', '852963', '852963', 'MSW', 0, 'MSW', '9999', '9999', 'a:1:{i:0;s:6:\"Nashik\";}', 0, 0, 'MSW', 'Mswi Street, Village 1 South, Cape Town, South Africa', 'WC', 'Cape Town', '', '', 'South Africa', '7784', 11, 0, 0, '', '', 9, 0, 0, '2018-05-06'),
(18, 'abcddddd', '', '', '', '', 0, 'ss', '', '', '', 2, 0, '', '', '', '', '', '', '', '', 0, 0, 0, '', '', 6, 0, 0, '2018-04-02'),
(19, 'fastrack', '852', '852963', 'pl789', 'Pune', 0, 'fastrack', '123', '456', '', 2, 0, 'fastrack@gmail.com', 'Kothrud Bus Depot, Eklavya Colony, Kothrud, Pune, Maharashtra, India', 'MH', 'Pune', '122355.333', '9633.369', 'India', '411038', 10, 0, 1, '', '', 8, 0, 0, '2018-04-16'),
(20, 'xcdc', '', '', '', '', 0, '', '', '', '', 0, 0, '', 'ssss', '', '', '', '', '', '', 0, 0, 1, '', '', 0, 0, 0, '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_company_city`
--

CREATE TABLE `tbl_company_city` (
  `in_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `flg_is_delete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_company_city`
--

INSERT INTO `tbl_company_city` (`in_id`, `city_id`, `company_id`, `flg_is_delete`) VALUES
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
-- Table structure for table `tbl_company_group`
--

CREATE TABLE `tbl_company_group` (
  `in_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `grop_id` int(11) NOT NULL,
  `flg_is_delete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_company_group`
--

INSERT INTO `tbl_company_group` (`in_id`, `company_id`, `grop_id`, `flg_is_delete`) VALUES
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
-- Table structure for table `tbl_company_package`
--

CREATE TABLE `tbl_company_package` (
  `in_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `flg_is_delete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_company_package`
--

INSERT INTO `tbl_company_package` (`in_id`, `company_id`, `package_id`, `flg_is_delete`) VALUES
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
-- Table structure for table `tbl_company_services`
--

CREATE TABLE `tbl_company_services` (
  `in_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `services_id` int(11) NOT NULL,
  `flg_is_delete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_company_services`
--

INSERT INTO `tbl_company_services` (`in_id`, `company_id`, `services_id`, `flg_is_delete`) VALUES
(2, 18, 3, 0),
(3, 11, 4, 0),
(4, 11, 6, 0),
(5, 19, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_follow_up`
--

CREATE TABLE `tbl_follow_up` (
  `in_id` int(11) NOT NULL,
  `st_name` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `follow_up_date` date NOT NULL,
  `in_status_id` int(11) NOT NULL COMMENT '1 Not interested 2 Meeting 3 Payment Done 4  Again Follow up Date',
  `flg_is_delete` tinyint(1) NOT NULL,
  `flg_is_active` tinyint(1) NOT NULL,
  `in_company_id` int(11) NOT NULL,
  `st_phone_number` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `st_email` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `client_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_follow_up`
--

INSERT INTO `tbl_follow_up` (`in_id`, `st_name`, `follow_up_date`, `in_status_id`, `flg_is_delete`, `flg_is_active`, `in_company_id`, `st_phone_number`, `st_email`, `client_name`) VALUES
(1, 'dddd', '2018-04-17', 2, 1, 1, 0, '2', 'd', ''),
(2, 'eee', '2018-04-30', 0, 1, 1, 0, 'e', 'e', ''),
(3, 'dhiraj  chaudhari dhiraj', '2018-04-04', 2, 1, 0, 0, '123456555555555555', 'dhiraj@gmail.commmmmmmmmmmmmm', ''),
(4, 'msw', '2018-04-02', 1, 0, 1, 0, '02369852', 'abhi@msw.com', 'dhiraj'),
(5, 'dd', '0000-00-00', 0, 1, 1, 0, '', '', ''),
(6, 'abc', '2018-04-09', 4, 1, 0, 0, '7895632587141', 'abc@gmail.com', 'xyz');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_group`
--

CREATE TABLE `tbl_group` (
  `in_id` int(11) NOT NULL,
  `st_grop_name` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `create_date` date NOT NULL,
  `parent_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `flg_is_delete` tinyint(1) NOT NULL,
  `flg_is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_group`
--

INSERT INTO `tbl_group` (`in_id`, `st_grop_name`, `create_date`, `parent_id`, `city_id`, `flg_is_delete`, `flg_is_active`) VALUES
(1, 'msw nashik', '0000-00-00', 0, 0, 1, 0),
(2, 'dfdf', '2018-10-20', 0, 0, 1, 0),
(3, 'dhiraj', '2018-03-17', 0, 0, 1, 1),
(4, 'aa', '2018-03-29', 0, 0, 1, 1),
(5, 'abhi', '2018-03-01', 0, 0, 1, 0),
(6, 'aa', '0000-00-00', 0, 0, 1, 1),
(7, 'sss', '2018-04-21', 0, 0, 1, 1),
(8, 'raje', '2018-04-27', 0, 0, 1, 0),
(9, 'Testing 1', '2018-04-11', 0, 0, 1, 0),
(10, 'Testing 2', '2018-04-12', 0, 0, 1, 1),
(11, 'Testing 3', '2018-04-14', 0, 0, 1, 1),
(12, 'MSW', '2018-04-19', 0, 0, 1, 1),
(13, 'PVPIT', '2018-04-18', 0, 4, 1, 0),
(14, 'yyyyy', '2018-04-02', 0, 1, 1, 0),
(15, 'sdfsdf', '2018-04-02', 0, 1, 1, 0),
(16, 'fdgdfgdgdg', '2018-04-20', 0, 2, 1, 0),
(17, 'rl', '2018-04-28', 0, 2, 1, 0),
(18, 'JSPM', '2018-04-01', 0, 2, 1, 0),
(19, 'intel', '2018-04-10', 0, 2, 1, 0),
(20, 'A1', '2018-04-10', 0, 1, 0, 1),
(21, 'B2', '2018-04-19', 0, 3, 1, 0),
(22, 'C3', '2018-04-17', 0, 4, 1, 0),
(23, 'C3', '2018-04-10', 0, 1, 0, 1),
(24, 'B2', '2018-04-15', 0, 2, 1, 0),
(25, 'B2', '2018-04-02', 0, 4, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_leads`
--

CREATE TABLE `tbl_leads` (
  `in_id` int(11) NOT NULL,
  `st_name` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `st_email_address` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `st_location` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `st_latitude` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `st_longitude` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `st_city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `st_state` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `st_country` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `st_zip` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dt_date` date NOT NULL,
  `st_phone_number` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `st_message` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `flg_is_delete` tinyint(1) NOT NULL,
  `flg_is_active` tinyint(1) NOT NULL,
  `in_portal_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_leads`
--

INSERT INTO `tbl_leads` (`in_id`, `st_name`, `st_email_address`, `st_location`, `st_latitude`, `st_longitude`, `st_city`, `st_state`, `st_country`, `st_zip`, `dt_date`, `st_phone_number`, `st_message`, `flg_is_delete`, `flg_is_active`, `in_portal_id`) VALUES
(1, 'msw', 'msw@gmail.com', 'pune', '', '', '', '', '', '', '2018-04-17', '123456985230', 'hi', 0, 1, 0),
(2, 'dda', 'da', 'da', '', '', '', '', '', '', '2018-04-05', 'd4a', 'fgggggaa', 1, 0, 0),
(3, 'testing', 'testing', 'Pune Airport, Pune International Airport Area, Lohgaon, Pune, Maharashtra', '122355.333', '1526933.444', 'Pune', 'MH', '', '411032', '2018-04-28', '789413321', 'hiiii', 0, 0, 0),
(4, 'abc', '', 'Shirpur, Maharashtra, India', '', '', 'Shirpur', 'MH', '', '425405', '2018-04-28', '', '', 0, 0, 0),
(5, 'rohit', '', '', '', '', '', '', '', '', '0000-00-00', '', '', 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_leads_service`
--

CREATE TABLE `tbl_leads_service` (
  `in_id` int(11) NOT NULL,
  `service_name` varchar(600) COLLATE utf8_unicode_ci NOT NULL,
  `lead_id` int(10) NOT NULL,
  `flg_is_delete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_lead_manage`
--

CREATE TABLE `tbl_lead_manage` (
  `in_id` int(11) NOT NULL,
  `flg_is_active` tinyint(1) NOT NULL,
  `flg_is_delete` tinyint(1) NOT NULL,
  `lead_verified` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_lead_manage`
--

INSERT INTO `tbl_lead_manage` (`in_id`, `flg_is_active`, `flg_is_delete`, `lead_verified`) VALUES
(1, 1, 1, 'ssssssssssshhhh'),
(2, 1, 0, 'no');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_lead_return`
--

CREATE TABLE `tbl_lead_return` (
  `in_id` int(11) NOT NULL,
  `client_name` varchar(600) COLLATE utf8_unicode_ci NOT NULL,
  `dt_return_date` date NOT NULL,
  `reason_of_return` varchar(600) COLLATE utf8_unicode_ci NOT NULL,
  `flg_is_active` tinyint(1) NOT NULL,
  `flg_is_delete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_lead_return`
--

INSERT INTO `tbl_lead_return` (`in_id`, `client_name`, `dt_return_date`, `reason_of_return`, `flg_is_active`, `flg_is_delete`) VALUES
(1, 'dhiraj ', '2018-04-05', '', 1, 1),
(2, 'abc', '2018-04-06', 'hi', 0, 1),
(3, 'abd', '2018-04-14', 'abcd', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_package`
--

CREATE TABLE `tbl_package` (
  `in_id` int(11) NOT NULL,
  `st_package_name` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `in_duration` int(11) NOT NULL,
  `fl_package_amount` float(10,2) NOT NULL,
  `package_description` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `in_no_of_leads` int(11) NOT NULL,
  `in_package_type` int(11) NOT NULL COMMENT '1 single , 2 combo',
  `in_service_id` int(11) NOT NULL,
  `flg_is_delete` tinyint(1) NOT NULL,
  `flg_is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_package`
--

INSERT INTO `tbl_package` (`in_id`, `st_package_name`, `in_duration`, `fl_package_amount`, `package_description`, `in_no_of_leads`, `in_package_type`, `in_service_id`, `flg_is_delete`, `flg_is_active`) VALUES
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
-- Table structure for table `tbl_package_services`
--

CREATE TABLE `tbl_package_services` (
  `in_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `flg_is_delete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_package_services`
--

INSERT INTO `tbl_package_services` (`in_id`, `package_id`, `service_id`, `flg_is_delete`) VALUES
(5, 6, 4, 0),
(6, 6, 6, 0),
(7, 7, 4, 0),
(8, 7, 6, 0),
(9, 8, 4, 0),
(10, 9, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_portal`
--

CREATE TABLE `tbl_portal` (
  `in_id` int(11) NOT NULL,
  `st_portal_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `st_site_link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `flg_is_delete` tinyint(1) NOT NULL,
  `flg_is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_portal`
--

INSERT INTO `tbl_portal` (`in_id`, `st_portal_name`, `st_site_link`, `flg_is_delete`, `flg_is_active`) VALUES
(1, 'pestomart', 'https://www.pestomart.com/', 0, 1),
(2, 'easymysearch', 'https://easymysearch.com/', 0, 0),
(3, 'wwwwrrrr', 'wwwwrrrrr', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_renewal`
--

CREATE TABLE `tbl_renewal` (
  `in_id` int(11) NOT NULL,
  `in_company_id` int(11) NOT NULL,
  `renewal_date` date NOT NULL,
  `expiry_date` date NOT NULL,
  `in_package_id` int(11) NOT NULL,
  `flg_is_active` tinyint(1) NOT NULL,
  `flg_is_delete` tinyint(1) NOT NULL,
  `flg_is_limit_over` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_renewal`
--

INSERT INTO `tbl_renewal` (`in_id`, `in_company_id`, `renewal_date`, `expiry_date`, `in_package_id`, `flg_is_active`, `flg_is_delete`, `flg_is_limit_over`) VALUES
(1, 0, '2018-04-05', '0000-00-00', 0, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_service`
--

CREATE TABLE `tbl_service` (
  `in_id` int(11) NOT NULL,
  `st_service_name` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `in_service_type_id` int(11) NOT NULL,
  `st_code` varchar(700) COLLATE utf8_unicode_ci NOT NULL,
  `flg_is_delete` tinyint(4) NOT NULL,
  `flg_is_active` tinyint(1) NOT NULL COMMENT '1 Active  0 Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_service`
--

INSERT INTO `tbl_service` (`in_id`, `st_service_name`, `in_service_type_id`, `st_code`, `flg_is_delete`, `flg_is_active`) VALUES
(1, 'msw pune ffff', 0, '', 1, 1),
(2, 'hj', 0, '', 1, 1),
(3, 'MSW', 4, '', 0, 0),
(4, 'MSW1', 2, '', 0, 1),
(5, 'b1', 2, 'kkkk', 1, 0),
(6, 'dff', 0, 'dfd', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_service_city`
--

CREATE TABLE `tbl_service_city` (
  `in_id` int(11) NOT NULL,
  `in_service_id` int(11) NOT NULL,
  `in_city_id` int(11) NOT NULL,
  `flg_is_delete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_service_type`
--

CREATE TABLE `tbl_service_type` (
  `in_id` int(11) NOT NULL,
  `st_name` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(700) COLLATE utf8_unicode_ci NOT NULL,
  `portal_id` int(11) NOT NULL,
  `flg_is_delete` tinyint(1) NOT NULL,
  `flg_is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_service_type`
--

INSERT INTO `tbl_service_type` (`in_id`, `st_name`, `code`, `portal_id`, `flg_is_delete`, `flg_is_active`) VALUES
(1, 'amc mdmdmdmd', '', 0, 1, 1),
(2, 'msw ', '', 0, 0, 1),
(3, 'docomo', '', 0, 1, 1),
(4, 'abc', '', 0, 0, 1),
(5, 'abc', 'hnnnn', 0, 1, 0),
(6, 'hiiii', 'rrrr', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_system_log`
--

CREATE TABLE `tbl_system_log` (
  `in_id` int(11) NOT NULL,
  `in_user_id` int(11) NOT NULL,
  `st_post` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `st_updated_fields` text COLLATE utf8_unicode_ci NOT NULL,
  `dt_date_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_system_user`
--

CREATE TABLE `tbl_system_user` (
  `in_user_id` int(11) NOT NULL,
  `st_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `st_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `st_image` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `st_username` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `st_password` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `flg_is_active` int(1) NOT NULL DEFAULT '0' COMMENT '0- Inactive, 1- Active',
  `flg_is_delete` int(1) NOT NULL DEFAULT '0' COMMENT '0- Active, 1- Deleted',
  `in_master_user` int(1) NOT NULL DEFAULT '0' COMMENT '1- Master User, 0- Employee',
  `in_role_id` int(11) NOT NULL,
  `st_phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `st_mobile` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `st_skype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `st_position` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `flg_logged` int(11) NOT NULL,
  `dt_last_logged` datetime NOT NULL,
  `st_biography` text COLLATE utf8_unicode_ci NOT NULL,
  `st_address` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `dt_added_date` datetime NOT NULL,
  `st_code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `fl_advance` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_system_user`
--

INSERT INTO `tbl_system_user` (`in_user_id`, `st_name`, `st_email`, `st_image`, `st_username`, `st_password`, `flg_is_active`, `flg_is_delete`, `in_master_user`, `in_role_id`, `st_phone`, `st_mobile`, `st_skype`, `st_position`, `flg_logged`, `dt_last_logged`, `st_biography`, `st_address`, `dt_added_date`, `st_code`, `fl_advance`) VALUES
(1, 'Admin', 'admin@gmail.com', '1522308306.jpg', 'abhi7779988@gmail.com', 'Moti$S@467', 1, 0, 1, 1, '', '', '', 'Staff', 1, '2018-06-13 06:16:28', '', 'ozar', '0000-00-00 00:00:00', '', 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_system_user_roles`
--

CREATE TABLE `tbl_system_user_roles` (
  `in_id` int(11) NOT NULL,
  `st_role_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_system_user_roles`
--

INSERT INTO `tbl_system_user_roles` (`in_id`, `st_role_name`) VALUES
(1, 'Admin'),
(2, 'User');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_city`
--
ALTER TABLE `tbl_city`
  ADD PRIMARY KEY (`in_id`);

--
-- Indexes for table `tbl_company`
--
ALTER TABLE `tbl_company`
  ADD PRIMARY KEY (`in_id`);

--
-- Indexes for table `tbl_company_city`
--
ALTER TABLE `tbl_company_city`
  ADD PRIMARY KEY (`in_id`);

--
-- Indexes for table `tbl_company_group`
--
ALTER TABLE `tbl_company_group`
  ADD PRIMARY KEY (`in_id`);

--
-- Indexes for table `tbl_company_package`
--
ALTER TABLE `tbl_company_package`
  ADD PRIMARY KEY (`in_id`);

--
-- Indexes for table `tbl_company_services`
--
ALTER TABLE `tbl_company_services`
  ADD PRIMARY KEY (`in_id`);

--
-- Indexes for table `tbl_follow_up`
--
ALTER TABLE `tbl_follow_up`
  ADD PRIMARY KEY (`in_id`);

--
-- Indexes for table `tbl_group`
--
ALTER TABLE `tbl_group`
  ADD PRIMARY KEY (`in_id`);

--
-- Indexes for table `tbl_leads`
--
ALTER TABLE `tbl_leads`
  ADD PRIMARY KEY (`in_id`);

--
-- Indexes for table `tbl_leads_service`
--
ALTER TABLE `tbl_leads_service`
  ADD PRIMARY KEY (`in_id`);

--
-- Indexes for table `tbl_lead_manage`
--
ALTER TABLE `tbl_lead_manage`
  ADD PRIMARY KEY (`in_id`);

--
-- Indexes for table `tbl_lead_return`
--
ALTER TABLE `tbl_lead_return`
  ADD PRIMARY KEY (`in_id`);

--
-- Indexes for table `tbl_package`
--
ALTER TABLE `tbl_package`
  ADD PRIMARY KEY (`in_id`);

--
-- Indexes for table `tbl_package_services`
--
ALTER TABLE `tbl_package_services`
  ADD PRIMARY KEY (`in_id`);

--
-- Indexes for table `tbl_portal`
--
ALTER TABLE `tbl_portal`
  ADD PRIMARY KEY (`in_id`);

--
-- Indexes for table `tbl_renewal`
--
ALTER TABLE `tbl_renewal`
  ADD PRIMARY KEY (`in_id`);

--
-- Indexes for table `tbl_service`
--
ALTER TABLE `tbl_service`
  ADD PRIMARY KEY (`in_id`);

--
-- Indexes for table `tbl_service_city`
--
ALTER TABLE `tbl_service_city`
  ADD PRIMARY KEY (`in_id`);

--
-- Indexes for table `tbl_service_type`
--
ALTER TABLE `tbl_service_type`
  ADD PRIMARY KEY (`in_id`);

--
-- Indexes for table `tbl_system_log`
--
ALTER TABLE `tbl_system_log`
  ADD PRIMARY KEY (`in_id`);

--
-- Indexes for table `tbl_system_user`
--
ALTER TABLE `tbl_system_user`
  ADD PRIMARY KEY (`in_user_id`);

--
-- Indexes for table `tbl_system_user_roles`
--
ALTER TABLE `tbl_system_user_roles`
  ADD PRIMARY KEY (`in_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_city`
--
ALTER TABLE `tbl_city`
  MODIFY `in_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tbl_company`
--
ALTER TABLE `tbl_company`
  MODIFY `in_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `tbl_company_city`
--
ALTER TABLE `tbl_company_city`
  MODIFY `in_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `tbl_company_group`
--
ALTER TABLE `tbl_company_group`
  MODIFY `in_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `tbl_company_package`
--
ALTER TABLE `tbl_company_package`
  MODIFY `in_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
--
-- AUTO_INCREMENT for table `tbl_company_services`
--
ALTER TABLE `tbl_company_services`
  MODIFY `in_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tbl_follow_up`
--
ALTER TABLE `tbl_follow_up`
  MODIFY `in_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tbl_group`
--
ALTER TABLE `tbl_group`
  MODIFY `in_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `tbl_leads`
--
ALTER TABLE `tbl_leads`
  MODIFY `in_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tbl_leads_service`
--
ALTER TABLE `tbl_leads_service`
  MODIFY `in_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_lead_manage`
--
ALTER TABLE `tbl_lead_manage`
  MODIFY `in_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_lead_return`
--
ALTER TABLE `tbl_lead_return`
  MODIFY `in_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbl_package`
--
ALTER TABLE `tbl_package`
  MODIFY `in_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tbl_package_services`
--
ALTER TABLE `tbl_package_services`
  MODIFY `in_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `tbl_portal`
--
ALTER TABLE `tbl_portal`
  MODIFY `in_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbl_renewal`
--
ALTER TABLE `tbl_renewal`
  MODIFY `in_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_service`
--
ALTER TABLE `tbl_service`
  MODIFY `in_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tbl_service_city`
--
ALTER TABLE `tbl_service_city`
  MODIFY `in_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_service_type`
--
ALTER TABLE `tbl_service_type`
  MODIFY `in_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tbl_system_log`
--
ALTER TABLE `tbl_system_log`
  MODIFY `in_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_system_user`
--
ALTER TABLE `tbl_system_user`
  MODIFY `in_user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_system_user_roles`
--
ALTER TABLE `tbl_system_user_roles`
  MODIFY `in_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
