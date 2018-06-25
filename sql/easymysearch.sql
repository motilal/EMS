-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2018 at 08:38 AM
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
(1, 'Nashik', 1, 0, '2018-06-16 12:01:50', '2018-06-22 17:10:35'),
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
('8q68sju4m3208k18b1pd1vikcga0o9i9', '127.0.0.1', 1529834878, '__ci_last_regenerate|i:1529834743;identity|s:21:\"motilalsoni@gmail.com\";email|s:21:\"motilalsoni@gmail.com\";user_id|s:1:\"7\";old_last_login|s:10:\"1529833991\";last_check|i:1529834069;_subadmin_allow_actions|a:4:{i:0;s:21:\"email_templates-index\";i:1;s:20:\"email_templates-edit\";i:2;s:22:\"email_templates-status\";i:3;s:13:\"company-index\";}_subadmin_allow_module|a:2:{i:0;s:15:\"email templates\";i:3;s:7:\"company\";}error|s:25:\"You dont have permission.\";__ci_vars|a:1:{s:5:\"error\";s:3:\"old\";}'),
('rvud4kvtmjk9a5goldrab826m8r0tctk', '127.0.0.1', 1529834621, '__ci_last_regenerate|i:1529834322;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1529774545\";last_check|i:1529814781;'),
('hi6f7k3o1aaven34o28cb65d5rc4hrpa', '127.0.0.1', 1529834722, '__ci_last_regenerate|i:1529834675;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1529774545\";last_check|i:1529814781;success|s:30:\"Permission added Successfully.\";__ci_vars|a:1:{s:7:\"success\";s:3:\"old\";}'),
('euiq2s2js5c59ufgkbjgkr7vlv1mn4ee', '127.0.0.1', 1529834346, '__ci_last_regenerate|i:1529834065;identity|s:21:\"motilalsoni@gmail.com\";email|s:21:\"motilalsoni@gmail.com\";user_id|s:1:\"7\";old_last_login|s:10:\"1529833991\";last_check|i:1529834069;_subadmin_allow_actions|a:4:{i:0;s:21:\"email_templates-index\";i:1;s:20:\"email_templates-edit\";i:2;s:22:\"email_templates-status\";i:3;s:13:\"company-index\";}_subadmin_allow_module|a:2:{i:0;s:15:\"email templates\";i:3;s:7:\"company\";}error|s:25:\"You dont have permission.\";__ci_vars|a:1:{s:5:\"error\";s:3:\"old\";}'),
('ktrkdc2ft1aupi5mmvk6hqpkgodk1i1n', '127.0.0.1', 1529834004, '__ci_last_regenerate|i:1529833956;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1529774545\";last_check|i:1529814781;'),
('7p0o0qtbkp1ve6qbe1kn7qb7t590a135', '127.0.0.1', 1529833759, '__ci_last_regenerate|i:1529833644;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1529774545\";last_check|i:1529814781;success|s:30:\"Permission added Successfully.\";__ci_vars|a:1:{s:7:\"success\";s:3:\"old\";}'),
('753tjjna7sppou577rojd4g1i0iqo743', '127.0.0.1', 1529833630, '__ci_last_regenerate|i:1529833338;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1529774545\";last_check|i:1529814781;success|s:30:\"Permission added Successfully.\";__ci_vars|a:1:{s:7:\"success\";s:3:\"old\";}'),
('cgosbmbgb22i41m493mlkv2iq022rlg4', '127.0.0.1', 1529833316, '__ci_last_regenerate|i:1529833016;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1529774545\";last_check|i:1529814781;success|s:33:\"Flash Message added Successfully.\";__ci_vars|a:1:{s:7:\"success\";s:3:\"old\";}'),
('lm67m9c5j39atbgg7p6kbkhgq9s6l10v', '127.0.0.1', 1529833010, '__ci_last_regenerate|i:1529832714;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1529774545\";last_check|i:1529814781;'),
('cnsbtjd399d9j7301uqg7ktfmdbs0i5a', '127.0.0.1', 1529832535, '__ci_last_regenerate|i:1529832391;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1529774545\";last_check|i:1529814781;'),
('f7hhcqq9d69m8agbalu07tnlirbdq037', '127.0.0.1', 1529831897, '__ci_last_regenerate|i:1529831877;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1529774545\";last_check|i:1529814781;'),
('0416duir5fh7gvkglujjbvdmpdevodvd', '127.0.0.1', 1529831855, '__ci_last_regenerate|i:1529831573;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1529774545\";last_check|i:1529814781;'),
('fguqargg138v4ppoqh63s8sn54g7q56q', '127.0.0.1', 1529831277, '__ci_last_regenerate|i:1529831087;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1529774545\";last_check|i:1529814781;'),
('th1egpoanjv3hb47rpkas4ekrduep9de', '127.0.0.1', 1529831082, '__ci_last_regenerate|i:1529830773;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1529774545\";last_check|i:1529814781;'),
('j4okvfs1aara2pblu2d835derg69f08j', '127.0.0.1', 1529830632, '__ci_last_regenerate|i:1529830449;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1529774545\";last_check|i:1529814781;'),
('sfqfdtm4cjcbvlkjpmqma0h31ql4u002', '127.0.0.1', 1529830449, '__ci_last_regenerate|i:1529829763;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1529774545\";last_check|i:1529814781;'),
('ljqlep71lge3a4vog32at9rfratm3cms', '127.0.0.1', 1529856001, '__ci_last_regenerate|i:1529855997;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1529855159\";last_check|i:1529856001;'),
('ur7dekej7ri56ij3551e90h5ob6oujvt', '127.0.0.1', 1529855281, '__ci_last_regenerate|i:1529855155;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1529834062\";last_check|i:1529855159;success|s:37:\"Language file successfully generated.\";__ci_vars|a:1:{s:7:\"success\";s:3:\"old\";}'),
('v6j9m9rqcl9serm3qvs820ebqb80teqf', '127.0.0.1', 1529841090, '__ci_last_regenerate|i:1529840909;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1529774545\";last_check|i:1529814781;'),
('35ka7pj7lv0j4e07fv6mf5go1926k3k3', '127.0.0.1', 1529841105, '__ci_last_regenerate|i:1529840896;identity|s:21:\"motilalsoni@gmail.com\";email|s:21:\"motilalsoni@gmail.com\";user_id|s:1:\"7\";old_last_login|s:10:\"1529833991\";last_check|i:1529834069;_subadmin_allow_actions|a:53:{i:0;s:21:\"email_templates-index\";i:1;s:20:\"email_templates-edit\";i:2;s:22:\"email_templates-status\";i:3;s:13:\"company-index\";i:4;s:22:\"company-package-manage\";i:5;s:19:\"company-package-add\";i:6;s:22:\"company-package-delete\";i:7;s:22:\"company-package-status\";i:8;s:11:\"group-index\";i:9;s:17:\"servicetype-index\";i:10;s:13:\"service-index\";i:11;s:14:\"settings-index\";i:12;s:11:\"company-add\";i:13;s:12:\"company-edit\";i:14;s:14:\"company-delete\";i:15;s:14:\"company-status\";i:16;s:9:\"group-add\";i:17;s:10:\"group-edit\";i:18;s:12:\"group-delete\";i:19;s:12:\"group-status\";i:20;s:15:\"servicetype-add\";i:21;s:16:\"servicetype-edit\";i:22;s:18:\"servicetype-delete\";i:23;s:18:\"servicetype-status\";i:24;s:11:\"service-add\";i:25;s:12:\"service-edit\";i:26;s:14:\"service-delete\";i:27;s:14:\"service-status\";i:28;s:10:\"lead-index\";i:29;s:8:\"lead-add\";i:30;s:9:\"lead-edit\";i:31;s:11:\"lead-delete\";i:32;s:11:\"lead-status\";i:33;s:17:\"lead-sent-history\";i:34;s:19:\"lead-return-history\";i:35;s:23:\"add-lead-return-request\";i:36;s:9:\"send-lead\";i:37;s:19:\"approve-return-lead\";i:38;s:10:\"city-index\";i:39;s:8:\"city-add\";i:40;s:9:\"city-edit\";i:41;s:11:\"city-delete\";i:42;s:11:\"city-status\";i:43;s:15:\"follow_up-index\";i:44;s:13:\"follow_up-add\";i:45;s:14:\"follow_up-edit\";i:46;s:16:\"follow_up-delete\";i:47;s:16:\"follow_up-status\";i:48;s:13:\"package-index\";i:49;s:11:\"package-add\";i:50;s:12:\"package-edit\";i:51;s:14:\"package-delete\";i:52;s:14:\"package-status\";}_subadmin_allow_module|a:10:{i:0;s:15:\"email templates\";i:3;s:7:\"company\";i:8;s:5:\"group\";i:9;s:7:\"service\";i:10;s:11:\"sub service\";i:11;s:8:\"settings\";i:28;s:4:\"lead\";i:38;s:4:\"city\";i:43;s:9:\"follow_up\";i:48;s:7:\"package\";}'),
('j7rgtuplnr2vuh7affpad8dq810begd7', '127.0.0.1', 1529840845, '__ci_last_regenerate|i:1529840580;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1529774545\";last_check|i:1529814781;'),
('bk83dtmo72iord4qb6tjtchbqghuk859', '127.0.0.1', 1529840894, '__ci_last_regenerate|i:1529840572;identity|s:21:\"motilalsoni@gmail.com\";email|s:21:\"motilalsoni@gmail.com\";user_id|s:1:\"7\";old_last_login|s:10:\"1529833991\";last_check|i:1529834069;_subadmin_allow_actions|a:13:{i:0;s:21:\"email_templates-index\";i:1;s:20:\"email_templates-edit\";i:2;s:22:\"email_templates-status\";i:3;s:13:\"company-index\";i:4;s:22:\"company-package-manage\";i:5;s:19:\"company-package-add\";i:6;s:22:\"company-package-delete\";i:7;s:22:\"company-package-status\";i:8;s:11:\"group-index\";i:9;s:9:\"group-add\";i:10;s:10:\"group-edit\";i:11;s:12:\"group-delete\";i:12;s:12:\"group-status\";}_subadmin_allow_module|a:3:{i:0;s:15:\"email templates\";i:3;s:7:\"company\";i:8;s:5:\"group\";}'),
('o3sh97t94r8dlmtcproapdcvrdmufm1i', '127.0.0.1', 1529837574, '__ci_last_regenerate|i:1529837567;identity|s:21:\"motilalsoni@gmail.com\";email|s:21:\"motilalsoni@gmail.com\";user_id|s:1:\"7\";old_last_login|s:10:\"1529833991\";last_check|i:1529834069;_subadmin_allow_actions|a:6:{i:0;s:21:\"email_templates-index\";i:1;s:20:\"email_templates-edit\";i:2;s:22:\"email_templates-status\";i:3;s:13:\"company-index\";i:4;s:22:\"company-package-manage\";i:5;s:19:\"company-package-add\";}_subadmin_allow_module|a:2:{i:0;s:15:\"email templates\";i:3;s:7:\"company\";}'),
('fphqphbovn1p6me9s9861b87ek9np87c', '127.0.0.1', 1529836283, '__ci_last_regenerate|i:1529836281;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1529774545\";last_check|i:1529814781;'),
('r9d8sa9fubqllmg5jq6ptkbqq9g00sth', '127.0.0.1', 1529836326, '__ci_last_regenerate|i:1529836130;identity|s:21:\"motilalsoni@gmail.com\";email|s:21:\"motilalsoni@gmail.com\";user_id|s:1:\"7\";old_last_login|s:10:\"1529833991\";last_check|i:1529834069;_subadmin_allow_actions|a:6:{i:0;s:21:\"email_templates-index\";i:1;s:20:\"email_templates-edit\";i:2;s:22:\"email_templates-status\";i:3;s:13:\"company-index\";i:4;s:22:\"company-package-manage\";i:5;s:19:\"company-package-add\";}_subadmin_allow_module|a:2:{i:0;s:15:\"email templates\";i:3;s:7:\"company\";}'),
('ep9m9pjispgr5fh4k4ni165dq7198p2h', '127.0.0.1', 1529836129, '__ci_last_regenerate|i:1529835974;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1529774545\";last_check|i:1529814781;'),
('srfrlj8vqvriqfp60o80va4br3uo32nu', '127.0.0.1', 1529835938, '__ci_last_regenerate|i:1529835666;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1529774545\";last_check|i:1529814781;'),
('7v2a6pk10ufc84tj9vjl19q2oa6sko9l', '127.0.0.1', 1529835188, '__ci_last_regenerate|i:1529835106;identity|s:21:\"motilalsoni@gmail.com\";email|s:21:\"motilalsoni@gmail.com\";user_id|s:1:\"7\";old_last_login|s:10:\"1529833991\";last_check|i:1529834069;_subadmin_allow_actions|a:5:{i:0;s:21:\"email_templates-index\";i:1;s:20:\"email_templates-edit\";i:2;s:22:\"email_templates-status\";i:3;s:13:\"company-index\";i:4;s:22:\"manage-company-package\";}_subadmin_allow_module|a:2:{i:0;s:15:\"email templates\";i:3;s:7:\"company\";}'),
('rhc180e2o7os3fnfacb4j54idda4nklo', '127.0.0.1', 1529835642, '__ci_last_regenerate|i:1529835155;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1529774545\";last_check|i:1529814781;'),
('2q2oiue9vaah3r01qj3dosmaiga97c8o', '127.0.0.1', 1529857885, '__ci_last_regenerate|i:1529857885;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1529855159\";last_check|i:1529856001;'),
('02acbip8d9ar6u6fupo484v4lmh09shu', '127.0.0.1', 1529858447, '__ci_last_regenerate|i:1529858443;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1529855159\";last_check|i:1529856001;'),
('d127rj5c4eo4h361nnpnkj4p6quk1rmi', '127.0.0.1', 1529895463, '__ci_last_regenerate|i:1529895458;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1529856001\";last_check|i:1529895462;'),
('arpcf9esdl0jm8md73j92s2gjheq0icb', '127.0.0.1', 1529895845, '__ci_last_regenerate|i:1529895597;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1529895462\";last_check|i:1529895600;'),
('mvrchs6asopka249anr13a3k97f3agra', '127.0.0.1', 1529895914, '__ci_last_regenerate|i:1529895914;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1529895462\";last_check|i:1529895600;');

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
  `lead_limit` int(11) DEFAULT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL COMMENT '1 Active  0 Inactive',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `slug`, `gst_no`, `aadhar_no`, `pencard_no`, `company_address`, `company_owner`, `phone1`, `phone2`, `servicetypes_id`, `email`, `location`, `state`, `city`, `latitude`, `logitude`, `country`, `zip_code`, `ranges`, `aadhar_doc`, `pencard_doc`, `lead_limit`, `is_delete`, `is_active`, `created`, `updated`) VALUES
(1, 'Tech Mahindra', '5b2f653884fcd', NULL, NULL, NULL, '30/169 Agra road Jaipur', 'Marcus Miller', '9632589632', NULL, 1, 'marcus@mailinator.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, 0, 1, '2018-06-18 21:42:46', '2018-06-24 09:32:40'),
(2, 'Tata Building', '5b2f652f513db', NULL, NULL, NULL, '30/169 Agra road Jaipur', 'Marcus Miller', '9632589633', NULL, 1, 'rakeshss@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, 10, 0, 1, '2018-06-24 14:33:54', '2018-06-24 09:32:31');

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
(1, 6, 1, 0),
(2, 1, 1, 0),
(3, 8, 1, 0),
(4, 6, 2, 0),
(5, 4, 2, 0),
(6, 8, 2, 0);

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
(1, 1, 1, 0);

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
(3, 1, 2, 116, 1, '2018-06-19 02:10:12', 1),
(4, 2, 3, 10, 2, '2018-06-24 09:05:50', 1);

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
(2, 1, 13, 0),
(3, 2, 12, 0);

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
(1, 'Test', 'test', 0, 4, '2018-06-24 11:48:14', 0, 1);

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
(64, 'CompanyPackageActiveSuccess', 'Company Package active successfully', 'Company', 9, '2018-06-19 02:14:34'),
(65, 'LeadInactiveSuccess', 'Lead Inactive successfully.', 'Lead', 4, '2018-06-24 09:39:36'),
(66, 'LeadAddSuccess', 'Lead added successfully.', 'Lead', 1, '2018-06-24 09:37:58'),
(67, 'LeadUpdateSuccess', 'Lead Update successfully.', 'Lead', 2, '2018-06-24 09:38:15'),
(68, 'LeadDeleteSuccess', 'Lead deleted successfully.', 'Lead', 3, '2018-06-24 09:38:36'),
(69, 'LeadActiveSuccess', 'Lead active sucessfully.', 'Lead', 5, '2018-06-24 09:40:30'),
(70, 'LeadReturnRequestAddSuccess', 'Lead return request generated successfully.', 'Lead', 6, '2018-06-24 09:41:13'),
(71, 'LeadResendSuccess', 'Lead resend successfully.', 'Lead', 8, '2018-06-24 09:43:06'),
(72, 'LeadReturnApproveSuccess', 'Lead return request approved successfully.', 'Lead', 7, '2018-06-24 09:42:56');

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
  `cities_id` int(11) DEFAULT NULL,
  `servicetypes_id` int(11) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `service_to` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
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

INSERT INTO `leads` (`id`, `portals_id`, `record_id`, `name`, `email`, `location`, `cities_id`, `servicetypes_id`, `phone_number`, `service_to`, `source`, `message`, `date`, `created`, `updated`, `status`, `is_delete`, `is_active`) VALUES
(6, 3, NULL, 'Meta tag delete', 'rakeshss@gmail.com', 'dsdsfs', NULL, NULL, '3434353422', NULL, NULL, 'dfdfg', '0000-00-00', '2018-06-15 01:11:29', '2018-06-24 09:13:53', 1, 0, 1),
(7, 3, 6, 'Meta tag delete', 'rakeshss@gmail.com', 'dsdsfs', NULL, NULL, '3434353422', NULL, NULL, 'dfdfg', '0000-00-00', '2018-06-15 01:11:29', '2018-06-24 05:54:58', 0, 0, 1),
(8, 3, 9, 'Meta tag delete', 'rakeshss@gmail.com', 'dsdsfs', 1, 1, '3434353422', NULL, NULL, 'dfdfg', '1970-01-01', '2018-06-15 01:20:46', '2018-06-24 09:06:45', 1, 0, 1),
(10, 3, NULL, 'Meta tag edit', 'rakeshss@gmail.com', 'Malviya Nagar, New Delhi, Delhi, India', 6, 1, '9024978491', 'Mansarovar, Jaipur, Rajasthan, India', NULL, '', '2018-07-25', '2018-06-23 17:48:16', '2018-06-24 15:47:39', 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `leads_return_history`
--

CREATE TABLE `leads_return_history` (
  `id` int(11) NOT NULL,
  `leads_id` int(11) NOT NULL,
  `companies_id` int(11) NOT NULL,
  `leads_sent_history_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `approve_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'o for pending 1 for approve',
  `approve_by` int(11) UNSIGNED DEFAULT NULL,
  `approve_date` datetime DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `leads_return_history`
--

INSERT INTO `leads_return_history` (`id`, `leads_id`, `companies_id`, `leads_sent_history_id`, `reason`, `approve_status`, `approve_by`, `approve_date`, `created`) VALUES
(1, 8, 2, 5, 'no response', 1, 1, '2018-06-24 14:37:32', '2018-06-24 09:07:18'),
(2, 6, 2, 7, 'sss', 1, 1, '2018-06-24 14:44:45', '2018-06-24 09:14:29');

-- --------------------------------------------------------

--
-- Table structure for table `leads_sent_history`
--

CREATE TABLE `leads_sent_history` (
  `id` int(11) NOT NULL,
  `leads_id` int(11) NOT NULL,
  `companies_package_id` int(11) NOT NULL,
  `companies_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '1 for sent , 2 for return ',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `leads_sent_history`
--

INSERT INTO `leads_sent_history` (`id`, `leads_id`, `companies_package_id`, `companies_id`, `status`, `created`) VALUES
(4, 10, 3, 1, 1, '2018-06-24 08:54:09'),
(5, 8, 4, 2, 2, '2018-06-24 09:06:45'),
(6, 8, 3, 1, 1, '2018-06-24 09:06:45'),
(7, 6, 4, 2, 2, '2018-06-24 09:13:52'),
(8, 6, 3, 1, 1, '2018-06-24 09:13:52');

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
  `package_types_id` int(11) NOT NULL,
  `servicetypes_id` int(11) DEFAULT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `name`, `duration`, `amount`, `description`, `no_of_leads`, `package_types_id`, `servicetypes_id`, `is_delete`, `is_active`, `created`, `updated`) VALUES
(2, 'Gold', 90, 999.00, 'gold is highest package of this ', 120, 1, 1, 0, 1, '2018-06-18 16:11:09', '2018-06-18 16:17:55'),
(3, 'Silver', 30, 500.00, '', 12, 2, 1, 0, 1, '2018-06-24 09:04:47', '2018-06-24 09:05:18');

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
(1, 2, 13, 0),
(2, 3, 12, 0),
(3, 3, 13, 0);

-- --------------------------------------------------------

--
-- Table structure for table `package_types`
--

CREATE TABLE `package_types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `package_types`
--

INSERT INTO `package_types` (`id`, `name`, `is_active`, `is_delete`, `created`, `updated`) VALUES
(1, 'Single', 1, 0, '2018-06-21 12:46:41', '2018-06-22 06:05:56'),
(2, 'Combo', 1, 0, '2018-06-21 12:46:56', NULL);

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
(85, 'company-package-delete', 'Delete Company Package', 'Company', 8),
(86, 'company-package-status', 'Change Company Package Status', 'Company', 9),
(88, 'lead-sent-history', 'Lead Sent History', 'Lead', 6),
(89, 'lead-return-history', 'Lead Return History', 'Lead', 7),
(90, 'add-lead-return-request', 'Generate Lead Return History', 'Lead', 8),
(91, 'send-lead', 'Send Manual Lead', 'Lead', 9),
(92, 'approve-return-lead', 'Approve Return Lead', 'Lead', 10),
(93, 'company-package-manage', 'Manage Company Package', 'Company', 6),
(94, 'company-package-add', 'Company package add', 'Company', 7);

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
(1, '127.0.0.1', 'admin', '$2y$08$X.wo1a1ctWWqF/tiLCx.wubIZsXlKjpxjZNsHwi0ooBkuxL1Muple', NULL, 'admin@admin.com', '', '41OxdsvwogkRPa7YoTUUku1b6c8113ad4e2f5ac2', 1508057752, NULL, 0, NULL, 1528767362, 1529895600, 1, 'Super', 'Admin', 'ADMIN', '', 1),
(7, '157.37.132.82', NULL, '$2y$08$v8Dp4PROqvlpO5G5SVMWc..U9K4RYsyxAsrfTrG/EBy/c.rF6AO9C', NULL, 'motilalsoni@gmail.com', NULL, NULL, NULL, NULL, 0, NULL, 1520696550, 1529834069, 1, 'Motilal', 'Soni', NULL, '90324978491', 0);

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
(1, 7, 21, '2018-06-24 09:53:21'),
(2, 7, 22, '2018-06-24 09:53:21'),
(3, 7, 23, '2018-06-24 09:53:21'),
(4, 7, 45, '2018-06-24 09:58:48'),
(5, 7, 93, '2018-06-24 10:12:46'),
(6, 7, 94, '2018-06-24 10:28:47'),
(8, 7, 85, '2018-06-24 11:43:20'),
(9, 7, 86, '2018-06-24 11:43:20'),
(10, 7, 50, '2018-06-24 11:47:23'),
(21, 7, 55, '2018-06-24 11:50:36'),
(22, 7, 60, '2018-06-24 11:50:36'),
(23, 7, 44, '2018-06-24 11:51:29'),
(24, 7, 46, '2018-06-24 11:51:29'),
(25, 7, 47, '2018-06-24 11:51:29'),
(26, 7, 48, '2018-06-24 11:51:29'),
(27, 7, 49, '2018-06-24 11:51:29'),
(28, 7, 51, '2018-06-24 11:51:29'),
(29, 7, 52, '2018-06-24 11:51:29'),
(30, 7, 53, '2018-06-24 11:51:29'),
(31, 7, 54, '2018-06-24 11:51:29'),
(32, 7, 56, '2018-06-24 11:51:29'),
(33, 7, 57, '2018-06-24 11:51:29'),
(34, 7, 58, '2018-06-24 11:51:29'),
(35, 7, 59, '2018-06-24 11:51:29'),
(36, 7, 61, '2018-06-24 11:51:29'),
(37, 7, 62, '2018-06-24 11:51:29'),
(38, 7, 63, '2018-06-24 11:51:29'),
(39, 7, 64, '2018-06-24 11:51:29'),
(40, 7, 65, '2018-06-24 11:51:29'),
(41, 7, 66, '2018-06-24 11:51:29'),
(42, 7, 67, '2018-06-24 11:51:29'),
(43, 7, 68, '2018-06-24 11:51:29'),
(44, 7, 69, '2018-06-24 11:51:29'),
(45, 7, 88, '2018-06-24 11:51:29'),
(46, 7, 89, '2018-06-24 11:51:29'),
(47, 7, 90, '2018-06-24 11:51:29'),
(48, 7, 91, '2018-06-24 11:51:29'),
(49, 7, 92, '2018-06-24 11:51:29'),
(50, 7, 70, '2018-06-24 11:51:29'),
(51, 7, 71, '2018-06-24 11:51:29'),
(52, 7, 72, '2018-06-24 11:51:29'),
(53, 7, 73, '2018-06-24 11:51:29'),
(54, 7, 74, '2018-06-24 11:51:29'),
(55, 7, 75, '2018-06-24 11:51:29'),
(56, 7, 76, '2018-06-24 11:51:29'),
(57, 7, 77, '2018-06-24 11:51:29'),
(58, 7, 78, '2018-06-24 11:51:29'),
(59, 7, 79, '2018-06-24 11:51:29'),
(60, 7, 80, '2018-06-24 11:51:29'),
(61, 7, 81, '2018-06-24 11:51:29'),
(62, 7, 82, '2018-06-24 11:51:29'),
(63, 7, 83, '2018-06-24 11:51:29'),
(64, 7, 84, '2018-06-24 11:51:29');

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
  ADD KEY `portals_id` (`portals_id`),
  ADD KEY `cities_id` (`cities_id`),
  ADD KEY `servicetypes_id` (`servicetypes_id`);

--
-- Indexes for table `leads_return_history`
--
ALTER TABLE `leads_return_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leads_id` (`leads_id`),
  ADD KEY `companies_id` (`companies_id`),
  ADD KEY `approve_by` (`approve_by`),
  ADD KEY `leads_sent_history_id` (`leads_sent_history_id`);

--
-- Indexes for table `leads_sent_history`
--
ALTER TABLE `leads_sent_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leads_id` (`leads_id`),
  ADD KEY `companies_id` (`companies_id`),
  ADD KEY `companies_package_id` (`companies_package_id`);

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
  ADD KEY `servicetypes_id` (`servicetypes_id`),
  ADD KEY `package_types_id` (`package_types_id`);

--
-- Indexes for table `packages_service`
--
ALTER TABLE `packages_service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `packages_id` (`packages_id`),
  ADD KEY `services_id` (`services_id`);

--
-- Indexes for table `package_types`
--
ALTER TABLE `package_types`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `companies_city`
--
ALTER TABLE `companies_city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `companies_group`
--
ALTER TABLE `companies_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `companies_package`
--
ALTER TABLE `companies_package`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `companies_service`
--
ALTER TABLE `companies_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `company_groups`
--
ALTER TABLE `company_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `flash_messages`
--
ALTER TABLE `flash_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `leads_return_history`
--
ALTER TABLE `leads_return_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `leads_sent_history`
--
ALTER TABLE `leads_sent_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `packages_service`
--
ALTER TABLE `packages_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `package_types`
--
ALTER TABLE `package_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;
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
  ADD CONSTRAINT `leads_ibfk_1` FOREIGN KEY (`portals_id`) REFERENCES `portals` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `leads_ibfk_2` FOREIGN KEY (`cities_id`) REFERENCES `cities` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `leads_ibfk_3` FOREIGN KEY (`servicetypes_id`) REFERENCES `servicetypes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `leads_return_history`
--
ALTER TABLE `leads_return_history`
  ADD CONSTRAINT `leads_return_history_ibfk_1` FOREIGN KEY (`leads_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `leads_return_history_ibfk_2` FOREIGN KEY (`companies_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `leads_return_history_ibfk_3` FOREIGN KEY (`approve_by`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `leads_return_history_ibfk_4` FOREIGN KEY (`leads_sent_history_id`) REFERENCES `leads_sent_history` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `leads_sent_history`
--
ALTER TABLE `leads_sent_history`
  ADD CONSTRAINT `leads_sent_history_ibfk_1` FOREIGN KEY (`leads_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `leads_sent_history_ibfk_2` FOREIGN KEY (`companies_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `leads_sent_history_ibfk_3` FOREIGN KEY (`companies_package_id`) REFERENCES `companies_package` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `packages`
--
ALTER TABLE `packages`
  ADD CONSTRAINT `packages_ibfk_1` FOREIGN KEY (`servicetypes_id`) REFERENCES `servicetypes` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `packages_ibfk_2` FOREIGN KEY (`package_types_id`) REFERENCES `package_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
