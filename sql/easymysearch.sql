-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 17, 2018 at 09:10 AM
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
(1, 'Nashik', 1, 0, '2018-06-16 12:01:50', '2018-06-26 02:04:08'),
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
('d63nugo876s9e94gl3ha2ef4smmo56no', '127.0.0.1', 1534477208, '__ci_last_regenerate|i:1534477199;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1534436262\";last_check|i:1534477207;'),
('3q0tkogk00tqt3654rbvqq4v7hvn4ki6', '127.0.0.1', 1534440889, '__ci_last_regenerate|i:1534440521;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1534264457\";last_check|i:1534436262;'),
('r3ech9je5qac4njr1bua1bfokj94q120', '127.0.0.1', 1534440398, '__ci_last_regenerate|i:1534440172;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1534264457\";last_check|i:1534436262;'),
('ocka77soagcbmjenk1tkfcjp75rtqouf', '127.0.0.1', 1534440091, '__ci_last_regenerate|i:1534439849;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1534264457\";last_check|i:1534436262;'),
('1h2klnvi8a47j4d5321dcq34iv3b0mku', '127.0.0.1', 1534439758, '__ci_last_regenerate|i:1534439494;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1534264457\";last_check|i:1534436262;'),
('ar42guvrettr3usam2l8aknrcfqpm17c', '127.0.0.1', 1534439483, '__ci_last_regenerate|i:1534439185;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1534264457\";last_check|i:1534436262;'),
('lmltn5hjah0kjnrdm5oe039gib402a36', '127.0.0.1', 1534438395, '__ci_last_regenerate|i:1534438227;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1534264457\";last_check|i:1534436262;'),
('co5erbfp3lvqt3bbq2c854d2ndvge8q6', '127.0.0.1', 1534438034, '__ci_last_regenerate|i:1534437875;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1534264457\";last_check|i:1534436262;'),
('24ganjmt1mkh71mnv4pmkt99aa35djnr', '127.0.0.1', 1534436887, '__ci_last_regenerate|i:1534436882;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1534264457\";last_check|i:1534436262;'),
('pi3ltuj2jqisvm7rmnir9hgpke8qpa2t', '127.0.0.1', 1534436401, '__ci_last_regenerate|i:1534436206;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1534264457\";last_check|i:1534436262;'),
('n82b6qqosu17fm3uccn34oo2d8lva0cv', '127.0.0.1', 1534436875, '__ci_last_regenerate|i:1534436532;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1534264457\";last_check|i:1534436262;'),
('dcls3eurmst6u0vus4ap5ic1mg4sirk9', '127.0.0.1', 1534132155, '__ci_last_regenerate|i:1534132154;'),
('jphcnhorndftmhvb7kgsavffjlu395ce', '127.0.0.1', 1534132155, '__ci_last_regenerate|i:1534132155;'),
('46ehi8fqutahtbf62u4onmonms21n32p', '127.0.0.1', 1534007131, '__ci_last_regenerate|i:1534007062;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533963258\";last_check|i:1534003609;'),
('b6217uhc3dg3btmdoago3ovcm7efb78l', '127.0.0.1', 1534264624, '__ci_last_regenerate|i:1534264451;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1534003609\";last_check|i:1534264457;'),
('77tdu2jh3jmlpcctq58qa9u34fa4rn5f', '127.0.0.1', 1534007032, '__ci_last_regenerate|i:1534006761;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533963258\";last_check|i:1534003609;'),
('10e83i9de5arukuqhvmgoteiu2t115j9', '127.0.0.1', 1534006603, '__ci_last_regenerate|i:1534006428;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533963258\";last_check|i:1534003609;'),
('e58lia753297jv2ge13v4gbeqsg30skv', '127.0.0.1', 1534006345, '__ci_last_regenerate|i:1534006095;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533963258\";last_check|i:1534003609;'),
('04of831c3sc9uo6hov2s4j6s2suiokj5', '127.0.0.1', 1534005085, '__ci_last_regenerate|i:1534004929;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533963258\";last_check|i:1534003609;'),
('9100no25rplfbv5vefaj6cjtrparmtdh', '127.0.0.1', 1534004842, '__ci_last_regenerate|i:1534004573;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533963258\";last_check|i:1534003609;'),
('5trvcf71f8cvv00c49d4ln9m5anuq0n7', '127.0.0.1', 1534004502, '__ci_last_regenerate|i:1534004219;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533963258\";last_check|i:1534003609;'),
('r243p653r6tg8ledspc2olpa5qqe08b6', '127.0.0.1', 1534004190, '__ci_last_regenerate|i:1534003915;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533963258\";last_check|i:1534003609;'),
('ol3euifhbf150tf8cr1dff2thhgvutkv', '127.0.0.1', 1534003682, '__ci_last_regenerate|i:1534003603;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533963258\";last_check|i:1534003609;'),
('c2jn7r4a802kmt4qgq8ehmp0tnltikkn', '127.0.0.1', 1533986411, '__ci_last_regenerate|i:1533986410;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533833202\";last_check|i:1533963258;'),
('ggplv3vapte8tv1tiaquo7m9l16slj2e', '127.0.0.1', 1533982583, '__ci_last_regenerate|i:1533982282;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533833202\";last_check|i:1533963258;'),
('uql1uamr88itacotoedcajvlah3saik8', '127.0.0.1', 1533982876, '__ci_last_regenerate|i:1533982587;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533833202\";last_check|i:1533963258;'),
('t3dkgu02ke72fdrqg8pq5gr0peacj412', '127.0.0.1', 1533982897, '__ci_last_regenerate|i:1533982891;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533833202\";last_check|i:1533963258;'),
('a0j2j269gkhj3irlmdlhpi76a17bl85v', '127.0.0.1', 1533984540, '__ci_last_regenerate|i:1533984242;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533833202\";last_check|i:1533963258;'),
('i3i75ec423do4oe6mc4stipj0566m5bb', '127.0.0.1', 1533984795, '__ci_last_regenerate|i:1533984566;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533833202\";last_check|i:1533963258;'),
('lf2p719ut2ia5bctaos16cpsn9mb4iqe', '127.0.0.1', 1533985158, '__ci_last_regenerate|i:1533984880;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533833202\";last_check|i:1533963258;'),
('d4n52g6de2sg0t6emp9nhsbra9ctqm3a', '127.0.0.1', 1533985456, '__ci_last_regenerate|i:1533985186;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533833202\";last_check|i:1533963258;'),
('85uukeldu7k9dlrptkca5npnkfdoltku', '127.0.0.1', 1533985778, '__ci_last_regenerate|i:1533985488;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533833202\";last_check|i:1533963258;'),
('soh4kpe30l0d4bqn354qi0v2p585p27s', '127.0.0.1', 1533986086, '__ci_last_regenerate|i:1533985833;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533833202\";last_check|i:1533963258;'),
('2jksbrqg5dd1jqor4q56cc31re3qupft', '127.0.0.1', 1533982268, '__ci_last_regenerate|i:1533981972;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533833202\";last_check|i:1533963258;'),
('sog50fl2ra1tiao2626j4mrjj190ulmk', '127.0.0.1', 1533981540, '__ci_last_regenerate|i:1533981531;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533833202\";last_check|i:1533963258;'),
('p4iv1mobjfkmg26ksd477goj2agposre', '127.0.0.1', 1533980893, '__ci_last_regenerate|i:1533980636;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533833202\";last_check|i:1533963258;'),
('951ec3d7l97pi373le3nu8mrilbhjtul', '127.0.0.1', 1533981291, '__ci_last_regenerate|i:1533981103;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533833202\";last_check|i:1533963258;'),
('jgqvqke13gajjvv4u8r6s44jmltmmgkc', '127.0.0.1', 1533980268, '__ci_last_regenerate|i:1533980028;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533833202\";last_check|i:1533963258;'),
('eebtku5al1inblvo7fa7k2t3mle2ag82', '127.0.0.1', 1533979995, '__ci_last_regenerate|i:1533979699;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533833202\";last_check|i:1533963258;'),
('44hlmlte3nlns90qarqmkkcuu1kues32', '127.0.0.1', 1533979648, '__ci_last_regenerate|i:1533979383;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533833202\";last_check|i:1533963258;'),
('q7cabe2k21g9e2m0ngpj15166d67aq3s', '127.0.0.1', 1533978941, '__ci_last_regenerate|i:1533978941;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533833202\";last_check|i:1533963258;'),
('56utd1gsug75cqnepdp03ckcr0tijsci', '127.0.0.1', 1533978811, '__ci_last_regenerate|i:1533978610;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533833202\";last_check|i:1533963258;'),
('g6kvoc4bg3nu29sl2mb5c94773u9jm8k', '127.0.0.1', 1533978409, '__ci_last_regenerate|i:1533978290;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533833202\";last_check|i:1533963258;success|s:35:\"Message successfully send to groups\";__ci_vars|a:1:{s:7:\"success\";s:3:\"old\";}'),
('laugurqml7sur37ghercqg8qcoc62tv7', '127.0.0.1', 1533977999, '__ci_last_regenerate|i:1533977930;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533833202\";last_check|i:1533963258;'),
('967he9necn136lecnnge17dcnakm0cm0', '127.0.0.1', 1533977696, '__ci_last_regenerate|i:1533977480;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533833202\";last_check|i:1533963258;'),
('jhsabkfl07bon0u9bgj0p8snivs2up77', '127.0.0.1', 1533977428, '__ci_last_regenerate|i:1533977171;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533833202\";last_check|i:1533963258;'),
('kvcoafocjatpbcf5eqr0hc4hv9b7i969', '127.0.0.1', 1533976688, '__ci_last_regenerate|i:1533976553;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533833202\";last_check|i:1533963258;'),
('2lc0v7kbfcd946jio15233ec26015j5a', '127.0.0.1', 1533976279, '__ci_last_regenerate|i:1533975989;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533833202\";last_check|i:1533963258;'),
('gusal5063q8gre460sr3hp4057ubnhsf', '127.0.0.1', 1533975622, '__ci_last_regenerate|i:1533975622;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533833202\";last_check|i:1533963258;'),
('1s1013f56cj4f90sv83fvtlbv7cn22i1', '127.0.0.1', 1533975295, '__ci_last_regenerate|i:1533975295;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533833202\";last_check|i:1533963258;'),
('14mrq2lv4d6evt8h9vfi9pesumicq7at', '127.0.0.1', 1533969767, '__ci_last_regenerate|i:1533969503;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533833202\";last_check|i:1533963258;'),
('ujan9bdjdjemr3o35a9qd4v1mqro2bjp', '127.0.0.1', 1533964847, '__ci_last_regenerate|i:1533964847;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533833202\";last_check|i:1533963258;'),
('tp6qps94m3baa6cnc8bbdj1hob74o9pg', '127.0.0.1', 1533964789, '__ci_last_regenerate|i:1533964508;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533833202\";last_check|i:1533963258;'),
('a1th922lojpkg1l4d953qt9u28ag8kk9', '127.0.0.1', 1533964490, '__ci_last_regenerate|i:1533964195;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533833202\";last_check|i:1533963258;'),
('rc4iea70qm9fmoesi9r19spi2t84e58q', '127.0.0.1', 1533964183, '__ci_last_regenerate|i:1533963888;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533833202\";last_check|i:1533963258;'),
('6vqopn4c3ti9lnrt456dacor5ejaghbt', '127.0.0.1', 1533963843, '__ci_last_regenerate|i:1533963548;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533833202\";last_check|i:1533963258;'),
('600d6uvr497b2k7mvjk9sonf84noc7pc', '127.0.0.1', 1533963545, '__ci_last_regenerate|i:1533963246;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533833202\";last_check|i:1533963258;'),
('nn9ip7lo1g3phvjuv00usisgs9bfj9o3', '127.0.0.1', 1533835539, '__ci_last_regenerate|i:1533835333;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533778216\";last_check|i:1533833202;'),
('jp04rbsug7fditjdtg7lrta9fp728vft', '127.0.0.1', 1533835888, '__ci_last_regenerate|i:1533835747;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533778216\";last_check|i:1533833202;'),
('qjvhvras1rsv9egk02g3ektqk9fgo66m', '127.0.0.1', 1533835118, '__ci_last_regenerate|i:1533834828;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533778216\";last_check|i:1533833202;'),
('orovt1j5ij1kf910jaaocmss45e446rh', '127.0.0.1', 1533834797, '__ci_last_regenerate|i:1533834523;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533778216\";last_check|i:1533833202;'),
('blj7qlhenj1tijnrgtd1daef3bb605vr', '127.0.0.1', 1533833203, '__ci_last_regenerate|i:1533833175;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533778216\";last_check|i:1533833202;'),
('2japd181ot3ugvgnlbvhek5cap1ilmu1', '127.0.0.1', 1533089323, '__ci_last_regenerate|i:1533089030;'),
('krg8colekr6ao5v241kafvtmdmt51auj', '127.0.0.1', 1533088994, '__ci_last_regenerate|i:1533088698;'),
('c8ul1f0i9mg4luicdoh0gpu8hqpljjmg', '127.0.0.1', 1533088495, '__ci_last_regenerate|i:1533088252;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533055946\";last_check|i:1533087327;'),
('re087l6suh8h3ij6g1l283abn5ao2a5n', '127.0.0.1', 1533086998, '__ci_last_regenerate|i:1533086997;'),
('s5s3skn56tdu924snhcq9nkj791i4653', '127.0.0.1', 1533087424, '__ci_last_regenerate|i:1533087326;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533055946\";last_check|i:1533087327;'),
('5dhhkbbhs6kj09cnfu21t2h0ajhasscp', '127.0.0.1', 1533780085, '__ci_last_regenerate|i:1533780046;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533745986\";last_check|i:1533778216;'),
('2hhhss39q9om2m5rucc77h9jqv0bnkje', '127.0.0.1', 1533779973, '__ci_last_regenerate|i:1533779732;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533745986\";last_check|i:1533778216;'),
('31qgpegqpndhn0cjcob2i1lsuc2g63r1', '127.0.0.1', 1533779189, '__ci_last_regenerate|i:1533779188;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533745986\";last_check|i:1533778216;'),
('6ghqqsav23u7n06138dkqkasp966d5lh', '127.0.0.1', 1533779183, '__ci_last_regenerate|i:1533778816;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533745986\";last_check|i:1533778216;'),
('0f27rr8caq4vufjh071pjk7r7hj2rtql', '127.0.0.1', 1533778275, '__ci_last_regenerate|i:1533778212;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533745986\";last_check|i:1533778216;'),
('6lnmi75bdn4p3u3qujsik4co4ume9d7a', '127.0.0.1', 1533749216, '__ci_last_regenerate|i:1533749091;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533604731\";last_check|i:1533745986;'),
('fpqu03ii9n9ok0ggjl0vij6ch0j0ac2o', '127.0.0.1', 1533748674, '__ci_last_regenerate|i:1533748380;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533604731\";last_check|i:1533745986;'),
('up12ll34adc2fu2jkl8g552uii93g5g4', '127.0.0.1', 1533749077, '__ci_last_regenerate|i:1533748681;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533604731\";last_check|i:1533745986;'),
('kfcr44kmkubrvshpsg96scpauba6g3ub', '127.0.0.1', 1533748118, '__ci_last_regenerate|i:1533747908;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533604731\";last_check|i:1533745986;'),
('hmkma98c9jbpf248q78818a3amrrmabk', '127.0.0.1', 1533747904, '__ci_last_regenerate|i:1533747605;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533604731\";last_check|i:1533745986;'),
('donnb9hgok5fimf7hgon5i5g5bqebi1k', '127.0.0.1', 1533747213, '__ci_last_regenerate|i:1533747039;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533604731\";last_check|i:1533745986;'),
('cofbq95m4pjfd67vl2edeqla7bt53spe', '127.0.0.1', 1533746356, '__ci_last_regenerate|i:1533745976;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533604731\";last_check|i:1533745986;'),
('9g1mmvdteo9ou1gq5p8jasomoc0uq1kp', '127.0.0.1', 1533610185, '__ci_last_regenerate|i:1533610011;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533174373\";last_check|i:1533604731;'),
('2n57rvjuagiae77i95e26eg63e9pev5m', '127.0.0.1', 1533609752, '__ci_last_regenerate|i:1533609468;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533174373\";last_check|i:1533604731;'),
('591b7se3q14jmblsguislb3f70fj1ra2', '127.0.0.1', 1533609391, '__ci_last_regenerate|i:1533609155;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533174373\";last_check|i:1533604731;'),
('53rptk72j1je6d2oqsinr39ol2ciel0d', '127.0.0.1', 1533609110, '__ci_last_regenerate|i:1533608818;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533174373\";last_check|i:1533604731;'),
('igcsle4qo72302r2atddgvgtcirus201', '127.0.0.1', 1533605119, '__ci_last_regenerate|i:1533605062;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533174373\";last_check|i:1533604731;'),
('kuseo40lek13vlspk2jvu8b7uo19vrr6', '127.0.0.1', 1533605024, '__ci_last_regenerate|i:1533604724;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533174373\";last_check|i:1533604731;'),
('ssem7gqgm1j09ot1vrn4hfv9kc7vtst5', '127.0.0.1', 1533175477, '__ci_last_regenerate|i:1533175444;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533140686\";last_check|i:1533174373;'),
('amubsbe1nbhf9kr7895555g3api23ljn', '127.0.0.1', 1533175421, '__ci_last_regenerate|i:1533175090;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533140686\";last_check|i:1533174373;'),
('1bf193kq4eu6c7ieabmlvf509bj810uc', '127.0.0.1', 1533175020, '__ci_last_regenerate|i:1533174759;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533140686\";last_check|i:1533174373;'),
('3vnedvibvmlq1ilflosa4i1g6sqeel4t', '127.0.0.1', 1533174642, '__ci_last_regenerate|i:1533174365;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533140686\";last_check|i:1533174373;'),
('sat36vsb5p8mkv5n4588iclcpcu9uudt', '127.0.0.1', 1533145823, '__ci_last_regenerate|i:1533145823;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533087327\";last_check|i:1533140686;'),
('6e23ia4hefnmib3qk53drvrer0o2cbv2', '127.0.0.1', 1533145499, '__ci_last_regenerate|i:1533145417;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533087327\";last_check|i:1533140686;'),
('lmt9hqkcbjmsfj1s73tnaheh77s3q22e', '127.0.0.1', 1533145285, '__ci_last_regenerate|i:1533145093;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533087327\";last_check|i:1533140686;'),
('va4g64cghj3c72unl1m3tv1is8qorbao', '127.0.0.1', 1533144835, '__ci_last_regenerate|i:1533144774;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533087327\";last_check|i:1533140686;'),
('rci96fgq3bav5nffccl20ufae3c7np2q', '127.0.0.1', 1533144660, '__ci_last_regenerate|i:1533144386;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533087327\";last_check|i:1533140686;'),
('3p2nahbm2jgt9dktlkuh696khimg5qp5', '127.0.0.1', 1533144287, '__ci_last_regenerate|i:1533144009;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533087327\";last_check|i:1533140686;'),
('bqh8sngb85a0uostggnudmocln54kplf', '127.0.0.1', 1533143253, '__ci_last_regenerate|i:1533143028;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533087327\";last_check|i:1533140686;'),
('nfnsiltu54inat7ndrrsa1ca8e81g94g', '127.0.0.1', 1533142579, '__ci_last_regenerate|i:1533142355;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533087327\";last_check|i:1533140686;'),
('vrb5j8rd5ag5a5eu27fv40v3lp6ab1e0', '127.0.0.1', 1533141773, '__ci_last_regenerate|i:1533141712;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533087327\";last_check|i:1533140686;'),
('i8mv3m8093u94652d60f7ha8vumoovoc', '127.0.0.1', 1533140687, '__ci_last_regenerate|i:1533140682;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533087327\";last_check|i:1533140686;'),
('ttg64f930nrr2bo2dmnr14n3jt9or283', '127.0.0.1', 1533140047, '__ci_last_regenerate|i:1533140047;'),
('v5nmh2l8qevn2v4a8uvna9c8scbbjtdp', '127.0.0.1', 1533140048, '__ci_last_regenerate|i:1533140048;'),
('4n35pk4eg3hbn6tnchnojq3sfo06f6db', '127.0.0.1', 1533093942, '__ci_last_regenerate|i:1533093942;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533055946\";last_check|i:1533087327;'),
('c86sgbhc946estl5h4fgmqci4r51e5v3', '127.0.0.1', 1533091349, '__ci_last_regenerate|i:1533091128;'),
('rd1hfl4aebld4pg5q7f2p5go0k85nkeh', '127.0.0.1', 1533094043, '__ci_last_regenerate|i:1533093872;'),
('f71egr7071npu9nmf40tjljkspnh219i', '127.0.0.1', 1533091082, '__ci_last_regenerate|i:1533090827;'),
('b27bivjipebupo7sf18q4kue0mdh8bsm', '127.0.0.1', 1533091278, '__ci_last_regenerate|i:1533091108;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533055946\";last_check|i:1533087327;success|s:29:\"Company updated successfully.\";__ci_vars|a:1:{s:7:\"success\";s:3:\"old\";}'),
('cmqjg70lru3vojfdgl5ujf9fkggs72lh', '127.0.0.1', 1533091103, '__ci_last_regenerate|i:1533090807;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533055946\";last_check|i:1533087327;'),
('msmtkif9m0dve11k1h0cjdm92m1h0i3e', '127.0.0.1', 1533090801, '__ci_last_regenerate|i:1533090503;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533055946\";last_check|i:1533087327;'),
('jemrb840f3r2napvcupljncleh6bh16k', '127.0.0.1', 1533090450, '__ci_last_regenerate|i:1533090170;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533055946\";last_check|i:1533087327;'),
('kofqq8jnt81dl38vh1s0qh39u5759jnk', '127.0.0.1', 1533090190, '__ci_last_regenerate|i:1533089917;'),
('t54edrfs31mm2lricpf4lifqt9qg8pkq', '127.0.0.1', 1533090147, '__ci_last_regenerate|i:1533089866;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533055946\";last_check|i:1533087327;success|s:29:\"Company updated successfully.\";__ci_vars|a:1:{s:7:\"success\";s:3:\"old\";}'),
('t696t6sjo912l11tmiqkc3igbmpj1g3h', '127.0.0.1', 1533089381, '__ci_last_regenerate|i:1533089377;'),
('gplbeouc2e2nbdobb9ojc44qcfu1tab4', '127.0.0.1', 1533089425, '__ci_last_regenerate|i:1533089400;identity|s:15:\"admin@admin.com\";email|s:15:\"admin@admin.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1533055946\";last_check|i:1533087327;');

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
  `driving_license` varchar(255) DEFAULT NULL,
  `other_documents` text,
  `photo` varchar(255) DEFAULT NULL,
  `lead_limit` int(11) DEFAULT NULL,
  `lead_sent_flag` tinyint(1) NOT NULL DEFAULT '0',
  `users_id` int(10) UNSIGNED DEFAULT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL COMMENT '1 Active  0 Inactive',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `slug`, `gst_no`, `aadhar_no`, `pencard_no`, `company_address`, `company_owner`, `phone1`, `phone2`, `servicetypes_id`, `email`, `location`, `state`, `city`, `latitude`, `logitude`, `country`, `zip_code`, `ranges`, `aadhar_doc`, `pencard_doc`, `driving_license`, `other_documents`, `photo`, `lead_limit`, `lead_sent_flag`, `users_id`, `is_delete`, `is_active`, `created`, `updated`) VALUES
(1, 'Tech Mahindra', '5b2f653884fcd', NULL, NULL, NULL, '30/169 Agra road Jaipur', 'Marcus Miller', '9632589632', NULL, 1, 'marcus@mailinator.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2018-06-18 21:42:46', '2018-06-24 09:32:40'),
(2, 'Tata Building', '5b2f652f513db', NULL, NULL, NULL, '30/169 Agra road Jaipur', 'Marcus Miller', '9632589633', NULL, 1, 'rakeshss@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, 10, 0, NULL, 0, 1, '2018-06-24 14:33:54', '2018-07-01 08:56:30'),
(3, 'Company 3', '5b38782fba746', NULL, NULL, NULL, NULL, 'Motilal soni', '9632589634', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, 12, 0, NULL, 0, 1, '2018-07-01 11:59:29', '2018-07-01 08:33:09'),
(4, 'Company 4', '5b387f1ce4122', NULL, NULL, NULL, NULL, NULL, '9632589638', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2018-07-01 12:00:07', '2018-07-01 08:33:09'),
(5, 'Company 1', 'company-1', NULL, NULL, NULL, NULL, NULL, '9632589641', NULL, 1, 'motilalsoni@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, 'computer1.jpg', NULL, 'boring-subjects-compressor.jpg', NULL, 1, NULL, 0, 1, '2018-07-01 12:41:15', '2018-08-16 17:12:23'),
(6, 'Company 2', 'company-2', NULL, NULL, NULL, NULL, NULL, '9632589664', NULL, 1, 'admin1@lehar.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, '2018-07-01 12:41:47', '2018-08-16 17:25:56'),
(7, 'company name', '5b53761e1f449', '3453453535', '123654789', NULL, 'DDD, Kissimmee, FL, USA', 'Company Owner', '9632589654', '234345456546', 1, 'Email@gmail.com', NULL, 'rajasthan', 'alwar', NULL, NULL, 'india', '36985', 0, 'fitness-bank1.jpg', NULL, NULL, '22qc7r28-1400667334.jpg,62864536_jpg.gif,bank-clerk-mobile.png,computer.jpg,fitness-bank.jpg,headerBg.jpg', NULL, NULL, 0, NULL, 0, 1, '2018-07-19 23:12:19', '2018-07-21 18:06:22'),
(9, 'test', '5b568700d112e', '4353453', NULL, NULL, NULL, NULL, '23234242', NULL, 1, 'test11@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, 12, 0, NULL, 1, 0, '2018-07-24 07:25:12', '2018-07-24 02:09:52'),
(10, 'dssfs', '5b5687ee627c7', NULL, NULL, NULL, NULL, NULL, '2343242423', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 0, '2018-07-24 07:29:10', '2018-07-24 02:09:45'),
(11, 'ddgdf', '5b56883b96ef4', NULL, NULL, NULL, NULL, NULL, '56576557', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 0, '2018-07-24 07:30:27', '2018-07-24 02:09:41'),
(12, 'ddgdfss', '5b56885353e06', NULL, NULL, NULL, NULL, NULL, '565765572', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 0, '2018-07-24 07:30:51', '2018-07-24 02:09:43'),
(13, 'ddgdfsss', '5b568869ce9d6', NULL, NULL, NULL, NULL, NULL, '565766572', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 0, '2018-07-24 07:31:13', '2018-07-24 02:09:44'),
(14, 'finaltest', '5b56895b91e28', NULL, NULL, NULL, NULL, NULL, '3242423424', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 0, '2018-07-24 07:35:15', '2018-07-24 02:09:46'),
(15, 'finaltest1', '5b5689cc6d2d3', NULL, NULL, NULL, NULL, NULL, '3242423425', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 0, '2018-07-24 07:37:08', '2018-07-24 02:09:48'),
(16, 'finaltest2', '5b568a1ab5ac7', NULL, NULL, NULL, NULL, NULL, '3242423545', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 0, '2018-07-24 07:38:26', '2018-07-24 02:09:49'),
(17, 'finaltest5', '5b568a4bcb7e8', NULL, NULL, NULL, NULL, NULL, '3242423549', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 0, '2018-07-24 07:39:15', '2018-07-24 02:09:51'),
(18, 'fsfsdf', '5b568b14020e2', NULL, NULL, NULL, NULL, NULL, '2424324234', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, '2018-07-24 07:42:36', NULL),
(19, 'Octal IT Infosolution', '5b611dcda1e2a', '4353453', '123654789', '334534543', 'malviya nagar jaipur', 'arun goyal', '9632589657', NULL, 1, 'arun@gmail.com', NULL, 'rajasthan', 'Jaipur', NULL, NULL, 'india', '302033', 0, 'fitness-bank2.jpg', 'fitness-bank3.jpg', 'history-clipart-school-subject-2.jpg', 'jamb-subject-combinations-for-all-course.png,night.jpg', 'computer2.jpg', 2, 0, NULL, 0, 1, '2018-07-31 22:25:08', '2018-08-01 02:41:17');

-- --------------------------------------------------------

--
-- Table structure for table `companies_city`
--

CREATE TABLE `companies_city` (
  `id` int(11) NOT NULL,
  `cities_id` int(11) NOT NULL,
  `companies_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `companies_city`
--

INSERT INTO `companies_city` (`id`, `cities_id`, `companies_id`) VALUES
(1, 6, 1),
(2, 1, 1),
(3, 8, 1),
(4, 6, 2),
(5, 4, 2),
(6, 8, 2),
(7, 7, 3),
(9, 6, 4),
(10, 8, 4),
(11, 8, 3),
(15, 6, 6),
(16, 8, 6),
(17, 7, 4),
(20, 7, 7),
(21, 4, 7),
(24, 7, 5),
(25, 4, 5),
(26, 1, 5),
(28, 4, 17),
(29, 7, 17),
(30, 7, 18),
(31, 1, 18),
(32, 8, 18),
(33, 8, 5),
(34, 7, 19),
(35, 7, 6),
(36, 4, 19),
(37, 1, 19);

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
  `package_amount` int(11) NOT NULL,
  `package_lead` int(11) NOT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `companies_package`
--

INSERT INTO `companies_package` (`id`, `companies_id`, `packages_id`, `total_leads`, `used_leads`, `package_amount`, `package_lead`, `created`, `is_active`) VALUES
(7, 5, 2, 59, 3, 999, 120, '2018-07-12 17:38:58', 1),
(9, 6, 3, 5, 2, 500, 12, '2018-07-17 15:58:11', 1),
(10, 3, 3, 3, 0, 500, 12, '2018-07-17 15:59:33', 1),
(11, 19, 3, 6, 0, 500, 12, '2018-07-31 17:13:24', 1);

-- --------------------------------------------------------

--
-- Table structure for table `companies_package_payment`
--

CREATE TABLE `companies_package_payment` (
  `id` int(11) NOT NULL,
  `companies_package_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `companies_package_payment`
--

INSERT INTO `companies_package_payment` (`id`, `companies_package_id`, `amount`, `approved`, `created`) VALUES
(16, 7, 100, 1, '2018-07-12 17:38:58'),
(18, 7, 200, 1, '2018-07-12 17:39:31'),
(19, 7, 100, 1, '2018-07-12 17:40:19'),
(20, 7, 20, 1, '2018-07-12 18:08:04'),
(21, 9, 300, 1, '2018-07-17 15:58:11'),
(22, 10, 133, 1, '2018-07-17 15:59:33'),
(23, 11, 250, 1, '2018-07-31 17:13:24');

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
(3, 2, 12, 0),
(4, 4, 12, 0),
(5, 4, 13, 0),
(6, 5, 13, 0),
(7, 7, 13, 0),
(8, 7, 12, 0),
(9, 9, 12, 0),
(10, 9, 13, 0),
(11, 10, 12, 0),
(12, 19, 12, 0),
(14, 6, 14, 0),
(15, 5, 14, 0),
(16, 19, 14, 0);

-- --------------------------------------------------------

--
-- Table structure for table `companies_sub_city`
--

CREATE TABLE `companies_sub_city` (
  `id` int(11) NOT NULL,
  `cities_id` int(11) NOT NULL,
  `sub_cities_id` int(11) NOT NULL,
  `companies_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `companies_sub_city`
--

INSERT INTO `companies_sub_city` (`id`, `cities_id`, `sub_cities_id`, `companies_id`) VALUES
(1, 7, 7, 7),
(2, 7, 4, 7),
(5, 4, 9, 7),
(22, 4, 9, 17),
(23, 4, 10, 17),
(24, 4, 9, 17),
(25, 4, 10, 17),
(26, 7, 1, 17),
(27, 7, 4, 17),
(28, 7, 1, 18),
(29, 7, 3, 18),
(30, 7, 1, 18),
(31, 7, 3, 18),
(32, 1, 11, 18),
(53, 7, 15, 5),
(56, 4, 17, 19),
(57, 7, 14, 5);

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
(1, 'Test', 'test', 0, 4, '2018-06-24 11:48:14', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `contact`, `is_active`, `created`, `updated`) VALUES
(1, 'Motilal', '2147483647', 1, '2018-08-08 17:16:26', '2018-08-11 09:54:48'),
(2, 'Rajiv Chowk', '9024978491', 1, '2018-08-08 17:16:52', '2018-08-08 17:24:08'),
(3, 'My jio', '2147483647', 1, '2018-08-08 17:17:20', '0000-00-00 00:00:00'),
(4, 'Aman', '9632589987', 1, '2018-08-08 17:18:17', '2018-08-09 01:58:24'),
(5, 'Las Vegas', '9024978493', 1, '2018-08-08 17:19:11', '2018-08-08 17:24:37'),
(6, 'Las Vegas', '2147483647', 1, '2018-08-08 17:21:02', '2018-08-08 17:26:56'),
(7, 'Ritk', '9632587415', 1, '2018-08-09 01:45:39', NULL),
(8, 'Rose', '963258745', 1, '2018-08-09 01:45:51', NULL),
(10, 'Sanker', '8526987458', 1, '2018-08-09 01:46:12', NULL),
(11, 'rahul', '7412589633', 1, '2018-08-09 01:46:23', NULL),
(12, 'Sonam', '8525869878', 1, '2018-08-09 01:59:33', NULL),
(13, 'Sonam jio', '8525896547', 1, '2018-08-09 02:01:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contacts_group`
--

CREATE TABLE `contacts_group` (
  `id` int(11) NOT NULL,
  `contacts_id` int(11) NOT NULL,
  `contact_groups_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contacts_group`
--

INSERT INTO `contacts_group` (`id`, `contacts_id`, `contact_groups_id`, `created`) VALUES
(0, 1, 1, '2018-08-09 17:16:19'),
(0, 2, 1, '2018-08-09 17:16:19'),
(0, 3, 1, '2018-08-09 17:16:19'),
(0, 5, 1, '2018-08-09 17:30:29'),
(0, 4, 1, '2018-08-09 17:30:29'),
(0, 6, 1, '2018-08-09 17:30:29'),
(0, 7, 1, '2018-08-09 17:30:29'),
(0, 8, 1, '2018-08-09 17:30:35'),
(0, 2, 2, '2018-08-11 08:50:11'),
(0, 11, 2, '2018-08-11 08:59:00');

-- --------------------------------------------------------

--
-- Table structure for table `contact_groups`
--

CREATE TABLE `contact_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contact_groups`
--

INSERT INTO `contact_groups` (`id`, `name`, `is_active`, `created`, `updated`) VALUES
(1, 'test', 1, '2018-08-09 17:14:55', NULL),
(2, 'General', 1, '2018-08-11 08:48:32', NULL),
(3, 'Sender', 1, '2018-08-11 08:49:43', NULL);

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
  `users_id` int(10) UNSIGNED DEFAULT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `follow_up`
--

INSERT INTO `follow_up` (`id`, `member_name`, `follow_up_date`, `status_id`, `phone_number`, `email`, `client_name`, `users_id`, `is_delete`, `is_active`, `created`, `updated`) VALUES
(1, 'dddd', '2018-04-17', 2, '2', 'd', '', NULL, 1, 1, '2018-06-17 16:53:05', NULL),
(2, 'eee', '2018-04-30', 0, 'e', 'e', '', NULL, 1, 1, '2018-06-17 16:53:05', NULL),
(3, 'dhiraj  chaudhari dhiraj', '2018-04-04', 2, '123456555555555555', 'dhiraj@gmail.commmmmmmmmmmmmm', '', NULL, 1, 0, '2018-06-17 16:53:05', NULL),
(4, 'msw', '2018-04-02', 3, '02369852', 'abhi@msw.com', 'dhiraj', 7, 0, 1, '2018-06-17 16:53:05', '2018-08-08 17:01:51'),
(5, 'dd', '0000-00-00', 0, '', '', '', NULL, 1, 1, '2018-06-17 16:53:05', NULL),
(6, 'abc', '2018-04-09', 4, '7895632587141', 'abc@gmail.com', 'xyz', NULL, 1, 0, '2018-06-17 16:53:05', NULL),
(7, 'Motilal soni', '2018-06-28', 1, '9024978491', 'motilalsoni@gmail.com', 'Marcus', 7, 0, 1, '2018-06-17 17:03:32', '2018-08-08 17:05:08');

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
  `source_location` varchar(255) DEFAULT NULL,
  `destination_location` varchar(255) DEFAULT NULL,
  `cities_id` int(11) DEFAULT NULL,
  `sub_cities_id` int(11) DEFAULT NULL,
  `destination_cities_id` int(11) DEFAULT NULL,
  `destination_sub_cities_id` int(11) DEFAULT NULL,
  `services_id` int(11) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
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

INSERT INTO `leads` (`id`, `portals_id`, `record_id`, `name`, `email`, `source_location`, `destination_location`, `cities_id`, `sub_cities_id`, `destination_cities_id`, `destination_sub_cities_id`, `services_id`, `phone_number`, `source`, `message`, `date`, `created`, `updated`, `status`, `is_delete`, `is_active`) VALUES
(22, 3, NULL, 'Motilal Soni', 'motilalsoni@gmail.com', 'Rajiv Chowk, Connaught Place, New Delhi, Delhi, India', 'Chandni Chowk, New Delhi, Delhi, India', 7, 13, 7, 14, 14, '963254896', NULL, '', '2018-07-16', '2018-08-16 16:26:28', '2018-08-16 17:32:14', 0, 0, 1);

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
  `reasons_id` int(11) DEFAULT NULL,
  `approve_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'o for pending 1 for approve',
  `approve_by` int(11) UNSIGNED DEFAULT NULL,
  `approve_date` datetime DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(2, 'Gold', 90, 999.00, 'gold is highest package of this ', 120, 1, 1, 0, 1, '2018-06-18 16:11:09', '2018-07-04 02:06:59'),
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
(75, 'follow_up-index', 'Follow_Up Listing', 'Follow Up', 1),
(76, 'follow_up-add', 'Follow_Up Add', 'Follow Up', 2),
(77, 'follow_up-edit', 'Follow_Up Edit', 'Follow Up', 3),
(78, 'follow_up-delete', 'Follow_Up Delete', 'Follow Up', 4),
(79, 'follow_up-status', 'Follow_Up Change Status', 'Follow Up', 5),
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
(94, 'company-package-add', 'Company package add', 'Company', 7),
(97, 'portal-index', 'Portal Listing', 'Portal', 1),
(98, 'portal-add', 'Portal Add', 'Portal', 2),
(99, 'portal-edit', 'Portal Edit', 'Portal', 3),
(100, 'portal-delete', 'Portal Delete', 'Portal', 4),
(101, 'portal-status', 'Portal Change Status', 'Portal', 5),
(102, 'resend-lead', 'Resend Lead', 'Lead', 11);

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
(3, 'BookMytempo', 'wwwwrrrrr', 0, 1, '2018-06-19 17:01:12', '2018-08-16 16:17:51');

-- --------------------------------------------------------

--
-- Table structure for table `reasons`
--

CREATE TABLE `reasons` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reasons`
--

INSERT INTO `reasons` (`id`, `name`, `is_active`, `is_delete`, `created`, `updated`) VALUES
(1, 'Not get the leads', 1, 0, '2018-06-30 06:02:18', '2018-06-30 06:23:26'),
(2, 'Wrong Lead', 1, 0, '2018-06-30 06:54:27', NULL);

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
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `servicetypes_id`, `code`, `is_delete`, `is_active`, `created`, `updated`) VALUES
(12, 'car', 1, '123', 0, 1, '2018-06-18 16:11:56', '0000-00-00 00:00:00'),
(13, 'auto', 1, '543', 0, 1, '2018-06-18 16:12:12', '0000-00-00 00:00:00'),
(14, 'Truck on rent', 1, '', 0, 1, '2018-07-31 17:34:51', NULL);

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
(2, 'Site Email', 'site_email', 'text', '', 'support@example.com', 1, 'trim|required|valid_email', '2013-04-07 23:24:28', 1),
(14, 'Lead Send Cron', 'lead_send_cron', 'select', 'On,Off', 'On', 1, 'trim|required', '2018-04-07 23:24:28', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sms_send_history`
--

CREATE TABLE `sms_send_history` (
  `id` int(11) NOT NULL,
  `contact_groups_id` int(11) DEFAULT NULL,
  `batch_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sms_send_history`
--

INSERT INTO `sms_send_history` (`id`, `contact_groups_id`, `batch_id`, `message`, `created`) VALUES
(2, 2, 459781938, 'Hello, %nPlease give test quotation to the following customer:%ntesting,%n %nBookMyTempo', '2018-08-11 09:06:49'),
(3, 2, 459801540, 'Hello, %nPlease give test quotation to the following customer:%ntesting,%n %nBookMyTempo', '2018-08-11 09:34:58'),
(4, 2, 460086889, 'Hi motilal,\r\nThanks for service.You will be contacted by these professionals:\r\n \r\nmotis ovt', '2018-08-11 17:01:22'),
(5, 2, 460087909, 'Hello, <br />\r\nPlease give truck rent quotation to the following customer:<br />\r\nmotiaosni test,<br />\r\n <br />\r\nBookMyTempo', '2018-08-11 17:04:23');

-- --------------------------------------------------------

--
-- Table structure for table `sub_cities`
--

CREATE TABLE `sub_cities` (
  `id` int(11) NOT NULL,
  `cities_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `pin_code` int(8) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sub_cities`
--

INSERT INTO `sub_cities` (`id`, `cities_id`, `name`, `pin_code`, `is_active`, `is_delete`, `created`, `updated`) VALUES
(1, 7, '110006', NULL, 1, 1, '2018-07-21 10:15:10', '2018-07-31 17:14:47'),
(2, 7, '122001', NULL, 1, 1, '2018-07-21 10:15:21', '2018-07-31 17:14:47'),
(3, 7, '110002', NULL, 1, 1, '2018-07-21 12:02:49', '2018-07-31 17:14:45'),
(4, 7, 'Rajiv Chowk Sector 3', NULL, 1, 1, '2018-07-21 12:03:06', '2018-07-31 17:14:57'),
(5, 7, 'Pratap Nagar sector 3', NULL, 1, 1, '2018-07-21 12:03:21', '2018-07-31 17:14:56'),
(6, 7, 'Pratap Nagar', NULL, 1, 1, '2018-07-21 12:03:36', '2018-07-31 17:14:55'),
(7, 7, 'Mansarovar Shipra path', NULL, 1, 1, '2018-07-21 12:04:03', '2018-07-31 17:14:53'),
(8, 7, 'Tonk Phatak', NULL, 1, 1, '2018-07-21 12:04:14', '2018-07-31 17:14:59'),
(9, 4, 'Gateway Of India', NULL, 1, 1, '2018-07-21 13:00:46', '2018-07-31 17:14:49'),
(10, 4, 'Taj Hotel', NULL, 1, 1, '2018-07-21 13:00:54', '2018-07-31 17:14:58'),
(11, 1, 'Gulshan Nagar', NULL, 1, 1, '2018-07-22 05:35:33', '2018-07-31 17:14:51'),
(12, 1, 'Gandhi nagar', NULL, 1, 1, '2018-07-22 05:35:42', '2018-07-31 17:14:48'),
(13, 7, 'Rajiv Chowk', 110001, 1, 0, '2018-07-31 17:16:18', NULL),
(14, 7, 'Chandni Chowk', 110006, 1, 0, '2018-07-31 17:16:29', NULL),
(15, 7, 'Mayur vihar extension', 110091, 1, 0, '2018-07-31 17:16:47', '2018-08-09 17:25:16'),
(16, 7, 'badar pur border', 110044, 1, 0, '2018-07-31 17:22:45', '2018-08-09 17:25:14'),
(17, 4, 'Gateway Of India', 400001, 1, 0, '2018-08-01 02:30:09', '2018-08-09 17:25:18'),
(18, 4, 'Palika market', 400708, 1, 0, '2018-08-01 02:30:31', NULL),
(19, 6, 'iffico chowk', 122002, 1, 0, '2018-08-01 16:42:50', NULL);

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
  `multi_session` tinyint(1) NOT NULL DEFAULT '1',
  `update_setting_flag` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `two_step_authentication`, `authentication_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `multi_session`, `update_setting_flag`) VALUES
(1, '127.0.0.1', 'admin', '$2y$08$X.wo1a1ctWWqF/tiLCx.wubIZsXlKjpxjZNsHwi0ooBkuxL1Muple', NULL, 'admin@admin.com', '', '41OxdsvwogkRPa7YoTUUku1b6c8113ad4e2f5ac2', 1508057752, NULL, 0, NULL, 1528767362, 1534477207, 1, 'Super', 'Admin', 'ADMIN', '', 1, 0),
(7, '157.37.132.82', NULL, '$2y$08$v8Dp4PROqvlpO5G5SVMWc..U9K4RYsyxAsrfTrG/EBy/c.rF6AO9C', NULL, 'motilalsoni@gmail.com', NULL, NULL, NULL, NULL, 0, NULL, 1520696550, 1531417199, 1, 'Motilal', 'Soni', NULL, '90324978491', 0, 0);

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
(64, 7, 84, '2018-06-24 11:51:29'),
(65, 7, 97, '2018-06-30 09:51:20'),
(66, 7, 98, '2018-06-30 09:51:20'),
(67, 7, 99, '2018-06-30 09:51:20'),
(68, 7, 100, '2018-06-30 09:51:20'),
(69, 7, 101, '2018-06-30 09:51:20'),
(72, 7, 92, '2018-06-30 10:01:51'),
(73, 7, 102, '2018-06-30 10:08:44'),
(74, 7, 90, '2018-06-30 10:09:15');

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
  ADD KEY `servicetypes_id` (`servicetypes_id`),
  ADD KEY `users_id` (`users_id`);

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
-- Indexes for table `companies_package_payment`
--
ALTER TABLE `companies_package_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `companies_package_id` (`companies_package_id`);

--
-- Indexes for table `companies_service`
--
ALTER TABLE `companies_service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `companies_id` (`companies_id`),
  ADD KEY `services_id` (`services_id`);

--
-- Indexes for table `companies_sub_city`
--
ALTER TABLE `companies_sub_city`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities_id` (`cities_id`),
  ADD KEY `sub_cities_id` (`sub_cities_id`),
  ADD KEY `companies_id` (`companies_id`);

--
-- Indexes for table `company_groups`
--
ALTER TABLE `company_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts_group`
--
ALTER TABLE `contacts_group`
  ADD KEY `contacts_id` (`contacts_id`),
  ADD KEY `contact_groups_id` (`contact_groups_id`);

--
-- Indexes for table `contact_groups`
--
ALTER TABLE `contact_groups`
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
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_id` (`users_id`);

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
  ADD KEY `services_id` (`services_id`),
  ADD KEY `sub_cities_id` (`sub_cities_id`);

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
-- Indexes for table `reasons`
--
ALTER TABLE `reasons`
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
-- Indexes for table `sms_send_history`
--
ALTER TABLE `sms_send_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_groups_id` (`contact_groups_id`);

--
-- Indexes for table `sub_cities`
--
ALTER TABLE `sub_cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities_id` (`cities_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `companies_city`
--
ALTER TABLE `companies_city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `companies_group`
--
ALTER TABLE `companies_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `companies_package`
--
ALTER TABLE `companies_package`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `companies_package_payment`
--
ALTER TABLE `companies_package_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `companies_service`
--
ALTER TABLE `companies_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `companies_sub_city`
--
ALTER TABLE `companies_sub_city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT for table `company_groups`
--
ALTER TABLE `company_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `contact_groups`
--
ALTER TABLE `contact_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `leads_return_history`
--
ALTER TABLE `leads_return_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `leads_sent_history`
--
ALTER TABLE `leads_sent_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;
--
-- AUTO_INCREMENT for table `portals`
--
ALTER TABLE `portals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `reasons`
--
ALTER TABLE `reasons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `servicetypes`
--
ALTER TABLE `servicetypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `sms_send_history`
--
ALTER TABLE `sms_send_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sub_cities`
--
ALTER TABLE `sub_cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `companies_ibfk_1` FOREIGN KEY (`servicetypes_id`) REFERENCES `servicetypes` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `companies_ibfk_2` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
-- Constraints for table `companies_package_payment`
--
ALTER TABLE `companies_package_payment`
  ADD CONSTRAINT `companies_package_payment_ibfk_1` FOREIGN KEY (`companies_package_id`) REFERENCES `companies_package` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `companies_service`
--
ALTER TABLE `companies_service`
  ADD CONSTRAINT `companies_service_ibfk_1` FOREIGN KEY (`companies_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `companies_service_ibfk_2` FOREIGN KEY (`services_id`) REFERENCES `services` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `companies_sub_city`
--
ALTER TABLE `companies_sub_city`
  ADD CONSTRAINT `companies_sub_city_ibfk_1` FOREIGN KEY (`companies_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `companies_sub_city_ibfk_2` FOREIGN KEY (`cities_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `companies_sub_city_ibfk_3` FOREIGN KEY (`sub_cities_id`) REFERENCES `sub_cities` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `contacts_group`
--
ALTER TABLE `contacts_group`
  ADD CONSTRAINT `contacts_group_ibfk_1` FOREIGN KEY (`contacts_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `contacts_group_ibfk_2` FOREIGN KEY (`contact_groups_id`) REFERENCES `contact_groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `leads`
--
ALTER TABLE `leads`
  ADD CONSTRAINT `leads_ibfk_1` FOREIGN KEY (`portals_id`) REFERENCES `portals` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `leads_ibfk_2` FOREIGN KEY (`cities_id`) REFERENCES `cities` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `leads_ibfk_3` FOREIGN KEY (`services_id`) REFERENCES `services` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `leads_ibfk_4` FOREIGN KEY (`sub_cities_id`) REFERENCES `sub_cities` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
-- Constraints for table `sms_send_history`
--
ALTER TABLE `sms_send_history`
  ADD CONSTRAINT `sms_send_history_ibfk_1` FOREIGN KEY (`contact_groups_id`) REFERENCES `contact_groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `sub_cities`
--
ALTER TABLE `sub_cities`
  ADD CONSTRAINT `sub_cities_ibfk_1` FOREIGN KEY (`cities_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

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
