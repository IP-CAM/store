-- phpMyAdmin SQL Dump
-- version 4.4.13.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 20, 2016 at 03:51 PM
-- Server version: 5.6.27-0ubuntu1
-- PHP Version: 5.6.11-1ubuntu3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `venezol1_store20160120`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_accc_customer_affiliate`
--

CREATE TABLE IF NOT EXISTS `oc_accc_customer_affiliate` (
  `accc_customer_affiliate_id` int(11) unsigned NOT NULL,
  `customer_id` int(11) unsigned NOT NULL DEFAULT '0',
  `affiliate_id` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

--
-- Dumping data for table `oc_accc_customer_affiliate`
--

INSERT INTO `oc_accc_customer_affiliate` (`accc_customer_affiliate_id`, `customer_id`, `affiliate_id`) VALUES
(1, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_address`
--

CREATE TABLE IF NOT EXISTS `oc_address` (
  `address_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(40) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_address`
--

INSERT INTO `oc_address` (`address_id`, `customer_id`, `firstname`, `lastname`, `company`, `address_1`, `address_2`, `city`, `postcode`, `country_id`, `zone_id`, `custom_field`) VALUES
(1, 1, 'buyer', 'htc', 'htc', '8307 14 ave', '', 'edmonton', 't6k 1x3', 38, 602, ''),
(2, 2, 'buyer', 'htc', 'hydro tools', '8301 14 av', '', 'edmonton', 't6k', 38, 602, ''),
(3, 3, 'test', 'affiliated', 'HTC', '8307 14 Ave  NW', '', 'Edmonton', 't6k 1x3', 38, 602, ''),
(4, 4, 'Pedro', 'Cones', 'HTC', '8307 14 Ave  NW', '', 'Edmonton', 'T6K 1X3', 38, 602, '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_affiliate`
--

CREATE TABLE IF NOT EXISTS `oc_affiliate` (
  `affiliate_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `company` varchar(40) NOT NULL,
  `website` varchar(255) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_affiliate`
--

INSERT INTO `oc_affiliate` (`affiliate_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `password`, `salt`, `company`, `website`, `address_1`, `address_2`, `city`, `postcode`, `country_id`, `zone_id`, `code`, `commission`, `tax`, `payment`, `cheque`, `paypal`, `bank_name`, `bank_branch_number`, `bank_swift_code`, `bank_account_name`, `bank_account_number`, `ip`, `status`, `approved`, `date_added`) VALUES
(1, 'Pedro', 'Cones', 'pedro.cones@hydrotools.com', '780-224.8873', '', '012299ad4dca40b02a454d18ac8f9ad648dbc6cd', 'oQaGXfLcN', 'HTC', 'na', '8307 14 Ave  NW', '', 'Edmonton', 'T6K 1X3', 38, 602, '56a00c04ba242', 5.00, 'na', 'cheque', 'seller HTC', '', '', '', '', '', '', '192.168.1.110', 1, 1, '2016-01-20 15:36:52');

-- --------------------------------------------------------

--
-- Table structure for table `oc_affiliate_activity`
--

CREATE TABLE IF NOT EXISTS `oc_affiliate_activity` (
  `activity_id` int(11) NOT NULL,
  `affiliate_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_affiliate_login`
--

CREATE TABLE IF NOT EXISTS `oc_affiliate_login` (
  `affiliate_login_id` int(11) NOT NULL,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_affiliate_tracking_discount`
--

CREATE TABLE IF NOT EXISTS `oc_affiliate_tracking_discount` (
  `affiliate_id` int(11) unsigned NOT NULL DEFAULT '0',
  `amount` decimal(6,2) NOT NULL DEFAULT '0.00',
  `type` enum('percent','fixed') NOT NULL DEFAULT 'percent'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_affiliate_transaction`
--

CREATE TABLE IF NOT EXISTS `oc_affiliate_transaction` (
  `affiliate_transaction_id` int(11) NOT NULL,
  `affiliate_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_api`
--

CREATE TABLE IF NOT EXISTS `oc_api` (
  `api_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `key` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_api`
--

INSERT INTO `oc_api` (`api_id`, `name`, `key`, `status`, `date_added`, `date_modified`) VALUES
(1, 'Default', 'c60TC8Dz1L65FNxkCaZEmBbprC2LlMXNprr9emvWppTktxJBlwZExxie5WG74MWPYMKDJHhzv2TxqCiZ1AShaLHNQCBadCvm12GRSNgA6ie7srSNln5lhrZXowwMKCdURUNYrBEamzXiSx4o02bIZDLKFVSaJzfOhl6VZHS3K8Q90vfymZkSG61VPeLq0zDndLtIbv3wpAqeqC37iviNiUbpq2rkLlbQ35FmuIS3HB5XLhWsHwOX49QDsVAitHKy', 1, '2016-01-17 08:26:49', '2016-01-17 08:26:49');

-- --------------------------------------------------------

--
-- Table structure for table `oc_api_ip`
--

CREATE TABLE IF NOT EXISTS `oc_api_ip` (
  `api_ip_id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_api_ip`
--

INSERT INTO `oc_api_ip` (`api_ip_id`, `api_id`, `ip`) VALUES
(1, 1, '192.168.1.110');

-- --------------------------------------------------------

--
-- Table structure for table `oc_api_session`
--

CREATE TABLE IF NOT EXISTS `oc_api_session` (
  `api_session_id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `token` varchar(32) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `session_name` varchar(32) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_api_session`
--

INSERT INTO `oc_api_session` (`api_session_id`, `api_id`, `token`, `session_id`, `session_name`, `ip`, `date_added`, `date_modified`) VALUES
(1, 1, 'dqR346BMOGmaJ4eG9lgly5MuO11ol5XU', 'rvbftbgpr6c8e04cegbmgvkld3', 'temp_session_569ebdf290399', '192.168.1.110', '2016-01-19 15:51:30', '2016-01-19 15:51:38'),
(2, 1, 'UmUN7XiKdDVdBNbtRjs130tGzkjht8AJ', 'rvbftbgpr6c8e04cegbmgvkld3', 'temp_session_569ebe106a58a', '192.168.1.110', '2016-01-19 15:52:00', '2016-01-19 15:52:00'),
(3, 1, 'vSOHG9UWMOwpbzv7REjqwvnFmh2Rn78T', 'rvbftbgpr6c8e04cegbmgvkld3', 'temp_session_569ebe8883af0', '192.168.1.110', '2016-01-19 15:54:00', '2016-01-19 15:54:00'),
(4, 1, 'pVWjO3YhOzZyovil9rs45z5mVE7vStYA', 'rvbftbgpr6c8e04cegbmgvkld3', 'temp_session_569ebe8dc4660', '192.168.1.110', '2016-01-19 15:54:05', '2016-01-19 15:54:05');

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute`
--

CREATE TABLE IF NOT EXISTS `oc_attribute` (
  `attribute_id` int(11) NOT NULL,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute_description`
--

CREATE TABLE IF NOT EXISTS `oc_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute_group`
--

CREATE TABLE IF NOT EXISTS `oc_attribute_group` (
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute_group_description`
--

CREATE TABLE IF NOT EXISTS `oc_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_banner`
--

CREATE TABLE IF NOT EXISTS `oc_banner` (
  `banner_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_banner`
--

INSERT INTO `oc_banner` (`banner_id`, `name`, `status`) VALUES
(7, 'Home Page Slideshow', 1),
(8, 'Manufacturers', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_banner_image`
--

CREATE TABLE IF NOT EXISTS `oc_banner_image` (
  `banner_image_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=144 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_banner_image`
--

INSERT INTO `oc_banner_image` (`banner_image_id`, `banner_id`, `link`, `image`, `sort_order`) VALUES
(136, 7, 'www.hydrotools.com', 'catalog/canpumps_logo.jpg', 0),
(137, 7, 'www.hydrotools.com', 'catalog/HTC160x135.png', 0),
(143, 8, 'http://www.stanleyhydraulics.com/products', 'catalog/stanley_hydraulics.jpg', 0),
(141, 8, 'http://www.howden.com/', 'catalog/howden200x100.jpg', 0),
(142, 8, 'http://groupsixtech.com/', 'catalog/groupsix-2.png', 0),
(134, 7, 'http://groupsixtech.com/', 'catalog/groupsix-2.png', 0),
(139, 8, '', 'catalog/parker_hydraulics.jpg', 0),
(140, 8, 'http://xceedmachine.ca/', 'catalog/xceed_logo.png', 0),
(135, 7, 'http://www.howden.com/', 'catalog/howden200x100.jpg', 0),
(132, 7, 'http://xceedmachine.ca/', 'catalog/xceed_logo.png', 0),
(133, 7, 'http://www.tricocorp.com', 'catalog/trico_logo_bg.jpg', 0),
(138, 8, 'http://www.tricocorp.com/', 'catalog/trico-corp-300x225.png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_banner_image_description`
--

CREATE TABLE IF NOT EXISTS `oc_banner_image_description` (
  `banner_image_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_banner_image_description`
--

INSERT INTO `oc_banner_image_description` (`banner_image_id`, `language_id`, `banner_id`, `title`) VALUES
(137, 2, 7, 'Hydro Tools Corp'),
(136, 2, 7, 'Canpumps'),
(135, 2, 7, 'Howden Roots Blowers'),
(132, 2, 7, 'Xceed machine Works Inc'),
(134, 5, 7, 'Group Six Technologies Inc'),
(135, 5, 7, 'Howden Roots Blowers'),
(136, 5, 7, 'Canpumps'),
(134, 2, 7, 'Group Six Technologies Inc'),
(137, 5, 7, 'Hydro Tools Corp'),
(133, 2, 7, 'Trico Corp'),
(143, 2, 8, 'Stanley Hydraulic'),
(142, 2, 8, 'Group Six Technologies Inc'),
(141, 2, 8, 'Roots Blower NOW Howden'),
(140, 2, 8, 'Xceed Machine Works Inc'),
(138, 2, 8, 'Trico Corp'),
(139, 2, 8, 'Parker'),
(143, 5, 8, 'Stanley Hydraulic'),
(133, 5, 7, 'Trico Corp'),
(142, 5, 8, 'Group Six Technologies Inc'),
(141, 5, 8, 'Roots Blower NOW Howden'),
(140, 5, 8, 'Xceed Machine Works Inc'),
(139, 5, 8, 'Parker'),
(132, 5, 7, 'Xceed machine Works Inc'),
(138, 5, 8, 'Trico Corp'),
(137, 6, 7, 'Hydro Tools Corp'),
(136, 6, 7, 'Canpumps'),
(135, 6, 7, 'Howden Roots Blowers'),
(134, 6, 7, 'Group Six Technologies Inc'),
(143, 6, 8, 'Stanley Hydraulic'),
(133, 6, 7, 'Trico Corp'),
(142, 6, 8, 'Group Six Technologies Inc'),
(141, 6, 8, 'Roots Blower NOW Howden'),
(140, 6, 8, 'Xceed Machine Works Inc'),
(139, 6, 8, 'Parker'),
(132, 6, 7, 'Xceed machine Works Inc'),
(138, 6, 8, 'Trico Corp');

-- --------------------------------------------------------

--
-- Table structure for table `oc_cart`
--

CREATE TABLE IF NOT EXISTS `oc_cart` (
  `cart_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `option` text NOT NULL,
  `quantity` int(5) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_category`
--

CREATE TABLE IF NOT EXISTS `oc_category` (
  `category_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category`
--

INSERT INTO `oc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(61, '', 59, 1, 2, 0, 1, '2016-01-17 12:06:08', '2016-01-19 16:30:18'),
(73, '', 70, 0, 1, 0, 1, '2016-01-17 12:52:17', '2016-01-19 16:53:15'),
(69, '', 0, 1, 1, 0, 1, '2016-01-17 12:31:52', '2016-01-19 16:50:09'),
(70, '', 0, 1, 1, 0, 1, '2016-01-17 12:33:15', '2016-01-19 16:52:06'),
(66, '', 60, 0, 1, 0, 1, '2016-01-17 12:18:24', '2016-01-19 16:39:49'),
(65, '', 60, 0, 1, 0, 1, '2016-01-17 12:15:08', '2016-01-19 16:39:35'),
(64, '', 60, 0, 1, 0, 1, '2016-01-17 12:13:11', '2016-01-19 16:37:57'),
(63, '', 60, 0, 1, 0, 1, '2016-01-17 12:11:00', '2016-01-19 16:37:31'),
(62, '', 59, 0, 1, 0, 1, '2016-01-17 12:07:38', '2016-01-19 16:40:02'),
(59, '', 0, 1, 1, 0, 1, '2016-01-17 11:51:22', '2016-01-19 16:28:09'),
(60, '', 59, 1, 1, 0, 1, '2016-01-17 12:02:37', '2016-01-19 16:37:05'),
(68, '', 0, 1, 1, 0, 1, '2016-01-17 12:25:44', '2016-01-19 16:48:26'),
(67, 'catalog/constant_level_oiler.jpg', 0, 1, 1, 0, 1, '2016-01-17 12:20:01', '2016-01-19 16:41:24'),
(82, '', 67, 0, 1, 0, 1, '2016-01-17 13:25:06', '2016-01-19 16:45:52'),
(81, '', 67, 0, 1, 0, 1, '2016-01-17 13:24:33', '2016-01-19 16:45:24'),
(80, '', 67, 0, 1, 0, 1, '2016-01-17 13:23:57', '2016-01-19 16:44:48'),
(79, '', 67, 0, 1, 0, 1, '2016-01-17 13:23:15', '2016-01-19 16:44:30'),
(72, '', 70, 0, 1, 0, 1, '2016-01-17 12:51:19', '2016-01-19 16:52:58'),
(71, '', 70, 0, 1, 0, 1, '2016-01-17 12:49:54', '2016-01-19 16:52:25'),
(78, '', 67, 0, 1, 0, 1, '2016-01-17 13:22:33', '2016-01-19 16:43:55'),
(77, '', 67, 0, 1, 0, 1, '2016-01-17 13:21:47', '2016-01-19 16:43:18'),
(76, '', 74, 0, 1, 0, 1, '2016-01-17 13:20:47', '2016-01-19 16:42:24'),
(75, '', 74, 0, 1, 0, 1, '2016-01-17 13:19:05', '2016-01-19 16:42:01'),
(74, '', 67, 0, 1, 0, 1, '2016-01-17 13:16:50', '2016-01-19 16:41:08'),
(83, '', 67, 0, 1, 0, 1, '2016-01-17 13:25:36', '2016-01-19 16:46:25'),
(84, '', 67, 0, 1, 0, 1, '2016-01-17 13:26:04', '2016-01-19 16:46:54'),
(85, '', 67, 0, 1, 0, 1, '2016-01-17 13:26:36', '2016-01-19 16:47:39'),
(86, '', 67, 0, 1, 0, 1, '2016-01-17 13:27:00', '2016-01-19 16:48:12'),
(87, '', 69, 0, 1, 0, 1, '2016-01-17 13:27:47', '2016-01-19 16:50:45'),
(88, '', 69, 0, 1, 0, 1, '2016-01-17 13:28:27', '2016-01-19 16:51:29'),
(89, '', 69, 0, 1, 0, 1, '2016-01-17 13:29:00', '2016-01-19 16:51:12'),
(90, '', 68, 0, 1, 0, 1, '2016-01-17 13:30:36', '2016-01-19 16:48:43'),
(91, '', 68, 0, 1, 0, 1, '2016-01-17 13:31:08', '2016-01-19 16:49:25');

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_description`
--

CREATE TABLE IF NOT EXISTS `oc_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category_description`
--

INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(63, 2, 'Accessoires', '&lt;p&gt;Accessoires Hydrauliques&lt;br&gt;&lt;/p&gt;', 'Accessoires Hydrauliques', 'Accessoires Hydrauliques', 'Accessoires Hydrauliques'),
(59, 2, 'Equipements', '&lt;p&gt;équipements&lt;br&gt;&lt;/p&gt;', 'équipements', 'équipements', 'équipements de process, ventilateurs, ventilateur. pompes, compresseurs, hydraulique, pneumatique'),
(61, 2, 'Blowers &amp; Compresseur', '&lt;p&gt;Blowers &amp;amp; Compresseur&lt;br&gt;&lt;/p&gt;', 'Blowers &amp; Compresseur', 'Blowers &amp; Compresseur', 'Blowers &amp; Compresseur'),
(62, 2, 'Pompes', '&lt;p&gt;Pompes&lt;br&gt;&lt;/p&gt;', 'Pompes', 'Pompes', 'Pompes'),
(68, 2, 'Réaménager', '&lt;p&gt;&lt;strong style=&quot;color: rgb(59, 59, 59); font-family: Georgia, ''Times New Roman'', Times, serif; font-size: 14.994px; line-height: 22.491px;&quot;&gt;Recycling&amp;nbsp;&lt;/strong&gt;&lt;span style=&quot;color: rgb(59, 59, 59); font-family: Georgia, ''Times New Roman'', Times, serif; font-size: 14.994px; line-height: 22.491px;&quot;&gt;is part of our&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;http://hydrotools.com/website/mission&quot; style=&quot;color: rgb(0, 113, 179); border-bottom-width: 1px; border-bottom-style: dotted; font-family: Georgia, ''Times New Roman'', Times, serif; font-size: 14.994px; line-height: 22.491px; background-color: rgb(255, 255, 255);&quot;&gt;Mission&amp;nbsp;&lt;/a&gt;&lt;span style=&quot;color: rgb(59, 59, 59); font-family: Georgia, ''Times New Roman'', Times, serif; font-size: 14.994px; line-height: 22.491px;&quot;&gt;to contribute with&amp;nbsp;our single Earth&amp;nbsp;- to&amp;nbsp;&lt;/span&gt;&lt;strong style=&quot;color: rgb(59, 59, 59); font-family: Georgia, ''Times New Roman'', Times, serif; font-size: 14.994px; line-height: 22.491px;&quot;&gt;Minimize cost and environmental footprint of heavy machinery&lt;/strong&gt;&lt;span style=&quot;color: rgb(59, 59, 59); font-family: Georgia, ''Times New Roman'', Times, serif; font-size: 14.994px; line-height: 22.491px;&quot;&gt;.&amp;nbsp;If you don''t find your product here, don''t hesitate to drop us a line to&amp;nbsp; explore remanufacture opportunitty with one of our principals&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;http://xceedmachine.ca/&quot; style=&quot;color: rgb(0, 113, 179); border-bottom-width: 1px; border-bottom-style: dotted; font-family: Georgia, ''Times New Roman'', Times, serif; font-size: 14.994px; line-height: 22.491px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;strong&gt;Xceed Machine Works Inc&lt;/strong&gt;&lt;/a&gt;&lt;br&gt;&lt;/p&gt;', 'Réaménager', 'Réaménager', 'Réaménager'),
(66, 2, 'Power Units', '&lt;p&gt;Intégration du système avec la source d''alimentation ainsi que les composants hydrauliques. PU peut avoir un ou plusieurs raccord hydraulique pour une utilisation autonome et / ou avec des outils détachables&lt;br&gt;&lt;/p&gt;', 'Unités de puissance', 'Unités de puissance', 'Unités de puissance'),
(60, 2, 'Hydraulique', '&lt;p&gt;Hydraulique&lt;br&gt;&lt;/p&gt;', 'Hydraulique', 'Hydraulique', 'Hydraulique'),
(69, 2, 'Loyer', '&lt;p&gt;&lt;strong style=&quot;line-height: 17.1428px;&quot;&gt;Reuse&amp;nbsp;&lt;/strong&gt;&lt;span style=&quot;line-height: 17.1428px;&quot;&gt;is key in our&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;http://hydrotools.com/website/mission&quot; style=&quot;line-height: 17.1428px; background-color: rgb(255, 255, 255);&quot;&gt;Mission&amp;nbsp;&lt;/a&gt;&lt;span style=&quot;line-height: 17.1428px;&quot;&gt;&amp;nbsp;maximixing utilization.&amp;nbsp;&lt;/span&gt;&lt;strong style=&quot;line-height: 17.1428px;&quot;&gt;Rentals&lt;/strong&gt;&lt;span style=&quot;line-height: 17.1428px;&quot;&gt;&amp;nbsp;are provide&amp;nbsp;exclusively by our network of&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;http://hydrotools.com/website/IMS&quot; style=&quot;line-height: 17.1428px; background-color: rgb(255, 255, 255);&quot;&gt;IM - Independent Members&lt;/a&gt;&lt;span style=&quot;line-height: 17.1428px;&quot;&gt;. Would like to&amp;nbsp;know more about becoming an IM - , please fill the&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;http://hydrotools.com/website/IMS&quot; style=&quot;line-height: 17.1428px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;strong&gt;online from&lt;/strong&gt;&lt;/a&gt;&lt;span style=&quot;line-height: 17.1428px;&quot;&gt;&amp;nbsp;or drop us a line&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;http://hydrotools.com/website/contact&quot; style=&quot;line-height: 17.1428px; background-color: rgb(255, 255, 255);&quot;&gt;Contact US&lt;/a&gt;&lt;br&gt;&lt;/p&gt;', 'Rentals', 'Rentals', 'Rentals'),
(70, 2, 'Services', '&lt;p&gt;Services&lt;br&gt;&lt;/p&gt;', 'Services', 'Services', 'Services'),
(71, 2, 'Ingénierie', '&lt;p&gt;Ingénierie&lt;br&gt;&lt;/p&gt;', 'Ingénierie', 'Ingénierie', 'Ingénierie'),
(72, 2, 'Field Services', '&lt;p&gt;Field Services&lt;br&gt;&lt;/p&gt;', 'Field Services', 'Field Services', 'Field Services'),
(73, 2, 'Réparation Services', '&lt;p&gt;Shop Services&lt;br&gt;&lt;/p&gt;', 'Shop Services', 'Shop Services', 'Shop Services'),
(74, 2, 'Central Lubrication System', '&lt;p&gt;Automatic and continuous pumps, fittings, line, positive displacement pumps, and manifolds.&lt;br&gt;&lt;/p&gt;', 'Central Lubrication System', 'Central Lubrication System', 'Central Lubrication System'),
(75, 2, 'Pompes automatiques', '&lt;p&gt;Do you need automatic lubrication on an intermittent basis? The Trico\r\n automatic pump is a low cost option with various size reservoir and \r\nadjustable timing intervals.&lt;/p&gt;&lt;p&gt;Features:&lt;/p&gt;&lt;p&gt;Spring discharge and \r\ngear pumps, adjustable interval times between lubrication, up to 20 \r\nliter capacity, big enough to drive systems with up to 50 lubrication \r\npoints.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Automatic pumps use meter units to apportion the amount of oil at each lubrication point.&lt;/p&gt;', 'Automatic Pumps', 'Automatic Pumps', 'Automatic Pumps'),
(76, 2, 'Pompes cycliques Manuel', '&lt;p&gt;Looking for a low cost solution to infrequent lubrication? Single-shot \r\nmanual lubrication pumps are the answer providing lubrication for up to \r\n50 application points via metering units. Manual or spring discharge \r\noptions with reservoir capacities of up to 450 Cubic Centimeters.&lt;br&gt;&lt;/p&gt;', 'Manual Cyclic Pumps', 'Manual Cyclic Pumps', 'Manual Cyclic Pumps'),
(77, 2, 'Constant Niveau Lubricator', '&lt;p&gt;Constant Niveau Lubricator&lt;br&gt;&lt;/p&gt;', 'Constant Niveau Lubricator', 'Constant Niveau Lubricator', 'Constant Niveau Lubricator'),
(78, 2, 'Contamination Control', '&lt;p&gt;Contamination Control&lt;br&gt;&lt;/p&gt;', 'Contamination Control', 'Contamination Control', 'Contamination Control'),
(79, 2, 'Gravity Feed Oilers', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Gravity Feed Oilers', '', ''),
(80, 2, 'Grease Lubrication', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Grease Lubrication', '', ''),
(81, 2, 'Lab Instrumentation', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Lab Instrumentation', '', ''),
(82, 2, 'Metalworking', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Metalworking', '', ''),
(83, 2, 'Oil Absorbent Products', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Oil Absorbent Products', '', ''),
(84, 2, 'Oil Sampling', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Oil Sampling', '', ''),
(85, 2, 'Storage, Handling, &amp; Identification', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Storage, Handling, &amp; Identification', '', ''),
(86, 2, 'Visual Inspection', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Visual Inspection', '', ''),
(87, 2, 'Conditioning Equipment Rentals', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Conditioning Equipment Rentals', '', ''),
(88, 2, 'Power Unit Rentals', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Power Unit Rentals', '', ''),
(89, 2, 'Hydraulic Tools Rentals', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Hydraulic Tools Rentals', '', ''),
(90, 2, 'Blowers &amp; Compressors', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Blowers &amp; Compressors', '', ''),
(91, 2, 'Hydraulic cilinders', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Hydraulic cilinders', '', ''),
(64, 5, 'Componentes', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Hydraulic  &gt; Cylinders, Pumps, Motors and Valves', 'Hydraulic  &gt; Cylinders, Pumps, Motors and Valves', 'Hydraulic  &gt; Cylinders, Pumps, Motors and Valves'),
(64, 2, 'Composants', '&lt;p&gt;Vérins hydrauliques, pompes, moteurs et vannes&lt;br&gt;&lt;/p&gt;', 'Vérins hydrauliques, pompes, moteurs et vannes', 'Vérins hydrauliques, pompes, moteurs et vannes', 'Vérins hydrauliques, pompes, moteurs et vannes'),
(59, 5, 'Equipos', 'Equipos', 'Equipments', 'Equipments', 'process Equipments, blowers, fan. pumps, compressors, hydraulic, pheumatic'),
(69, 5, 'Equipos para Rentar', '&lt;p&gt;&lt;strong&gt;Reuse &lt;/strong&gt;is key in our &lt;a href=&quot;http://hydrotools.com/website/mission&quot;&gt;Mission &lt;/a&gt;&amp;nbsp;maximixing utilization. &lt;strong&gt;Rentals&lt;/strong&gt; are provide&amp;nbsp;exclusively by our network of &lt;a href=&quot;http://hydrotools.com/website/IMS&quot;&gt;IM - Independent Members&lt;/a&gt;. Would like to&amp;nbsp;know more about becoming an IM - , please fill the &lt;a href=&quot;http://hydrotools.com/website/IMS&quot;&gt;&lt;strong&gt;online from&lt;/strong&gt;&lt;/a&gt; or drop us a line &lt;a href=&quot;http://hydrotools.com/website/contact&quot;&gt;Contact US&lt;/a&gt;&lt;/p&gt;', 'Rentals', 'Rentals', 'Rentals'),
(67, 5, 'Lubricación', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'lubrication', 'Proactive Maintenance and Lubrication ', 'lubrication, lubricants, oil, grease, proactive maintenance, maintenance'),
(67, 2, 'Lubrification', '&lt;p&gt;Proactive entretien et lubrification&lt;br&gt;&lt;/p&gt;', 'Lubrification', 'Lubrification', 'Lubrification'),
(68, 5, 'Remanufactura', '&lt;p&gt;&lt;strong style=&quot;color: rgb(59, 59, 59); font-family: Georgia, ''Times New Roman'', Times, serif; font-size: 14.994px; line-height: 22.491px;&quot;&gt;Recycling&amp;nbsp;&lt;/strong&gt;&lt;span style=&quot;color: rgb(59, 59, 59); font-family: Georgia, ''Times New Roman'', Times, serif; font-size: 14.994px; line-height: 22.491px;&quot;&gt;is part of our&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;http://hydrotools.com/website/mission&quot; style=&quot;border-bottom-width: 1px; border-bottom-style: dotted; color: rgb(0, 113, 179); font-family: Georgia, ''Times New Roman'', Times, serif; font-size: 14.994px; line-height: 22.491px; background-color: rgb(255, 255, 255);&quot;&gt;Mission&amp;nbsp;&lt;/a&gt;&lt;span style=&quot;color: rgb(59, 59, 59); font-family: Georgia, ''Times New Roman'', Times, serif; font-size: 14.994px; line-height: 22.491px;&quot;&gt;to contribute with&amp;nbsp;our single Earth&amp;nbsp;- to&amp;nbsp;&lt;/span&gt;&lt;strong style=&quot;color: rgb(59, 59, 59); font-family: Georgia, ''Times New Roman'', Times, serif; font-size: 14.994px; line-height: 22.491px;&quot;&gt;Minimize cost and environmental footprint of heavy machinery&lt;/strong&gt;&lt;span style=&quot;color: rgb(59, 59, 59); font-family: Georgia, ''Times New Roman'', Times, serif; font-size: 14.994px; line-height: 22.491px;&quot;&gt;.&amp;nbsp;If\r\n you don''t find your product here, don''t hesitate to drop us a line to \r\nexplore remanufacture opportunitty with one of our principals&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;http://xceedmachine.ca/&quot; style=&quot;border-bottom-width: 1px; border-bottom-style: dotted; color: rgb(0, 113, 179); font-family: Georgia, ''Times New Roman'', Times, serif; font-size: 14.994px; line-height: 22.491px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;strong&gt;Xceed Machine Works Inc&lt;/strong&gt;&lt;/a&gt;&lt;br&gt;&lt;/p&gt;', 'Refurbishing', 'Refurbishing', 'Refurbishing'),
(62, 5, 'Bombas', '&lt;p&gt;Pumps&lt;br&gt;&lt;/p&gt;', 'Pumps', 'Pumps', 'Pumps'),
(61, 5, 'Ventiladores y Compresores', '&lt;p&gt;Ventiladores y Compresores&lt;br&gt;&lt;/p&gt;', 'Blowers &amp; Compressor', 'Blowers &amp; Compressor', 'Blowers &amp; Compressor'),
(66, 5, 'Unidades de Fuerza', '&lt;p&gt;System Integration with power source plus hydraulic components. PU might\r\n have one or more hydraulic port for usage stand alone and/or with \r\nDetachable tools&lt;br&gt;&lt;/p&gt;', 'Power Units', 'Power Units', 'Power Units'),
(60, 5, 'Hidráulica', '&lt;p&gt;Hidráulica&lt;br&gt;&lt;/p&gt;', 'Hydraulics', 'Hydraulics', 'Hydraulics'),
(63, 5, 'Accesorios', '&lt;p&gt;Accesorios&lt;br&gt;&lt;/p&gt;', 'Accessories', 'Hydraulic Accessories', 'Hydraulic Accessories'),
(65, 5, 'Herramientas Hidráulicas', '&lt;p&gt;Herramientas Hidráulicas removibles.&lt;br&gt;&lt;/p&gt;', 'Hydraulic Tools', 'Hydraulic Tools', 'Hydraulic Tools'),
(65, 2, 'Outils hydrauliques', '&lt;p&gt;Outils hydrauliques&lt;br&gt;&lt;/p&gt;', 'Outils hydrauliques', 'Outils hydrauliques', 'Outils hydrauliques'),
(70, 5, 'Servicos', '&lt;p&gt;Services que podrán ser contratados con hydro tools corp.&lt;br&gt;&lt;/p&gt;', 'Services', 'Services', 'Services'),
(71, 5, 'ingeniería ', '&lt;p&gt;Engineering Services Provided by Hydro Tools Corp&lt;br&gt;&lt;/p&gt;', 'Engineering', 'Engineering', 'Engineering'),
(72, 5, 'Servicios de Campo', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Field Services', 'Field Services', 'Field Services'),
(73, 5, 'Servicios de Taller', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Shop Services', 'Shop Services', 'Shop Services'),
(74, 5, 'Sistemas Centrales de Lubricación', '&lt;p&gt;Automatic and continuous pumps, fittings, line, positive displacement pumps, and manifolds.&lt;br&gt;&lt;/p&gt;', 'Central Lubrication System', 'Central Lubrication System', 'Central Lubrication System'),
(75, 5, 'Bombas Automáticas', '&lt;p&gt;Do you need automatic lubrication on an intermittent basis? The Trico\r\n automatic pump is a low cost option with various size reservoir and \r\nadjustable timing intervals.&lt;/p&gt;&lt;p&gt;Features:&lt;/p&gt;&lt;p&gt;Spring discharge and \r\ngear pumps, adjustable interval times between lubrication, up to 20 \r\nliter capacity, big enough to drive systems with up to 50 lubrication \r\npoints.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Automatic pumps use meter units to apportion the amount of oil at each lubrication point.&lt;/p&gt;', 'Automatic Pumps', 'Automatic Pumps', 'Automatic Pumps'),
(76, 5, 'Bombas Manuales', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Manual Cyclic Pumps', 'Manual Cyclic Pumps', 'Manual Cyclic Pumps'),
(77, 5, 'Nivel constante de Lubricación', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Constant Level Lubrication', 'Constant Level Lubrication', 'Constant Level Lubrication'),
(78, 5, 'Control de Contaminación del Lubricante', '&lt;p&gt;Contamination Control&lt;br&gt;&lt;/p&gt;', 'Contamination Control', 'Contamination Control', 'Contamination Control'),
(79, 5, 'Alimentadores de Aceite por Gravedad', '&lt;p&gt;Gravity Feed Oilers&lt;br&gt;&lt;/p&gt;', 'Gravity Feed Oilers', 'Gravity Feed Oilers', 'Gravity Feed Oilers'),
(80, 5, 'Engrasadores', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Grease Lubrication', '', ''),
(81, 5, 'Equipos de Laboratorio', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Lab Instrumentation', '', ''),
(82, 5, 'Equipos para Talleres Metalurgicos', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Metalworking', '', ''),
(83, 5, 'Productos absorbentes', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Oil Absorbent Products', '', ''),
(84, 5, 'Boquillas Toma Muestras', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Oil Sampling', '', ''),
(85, 5, 'Equipos para identificación y Manejos', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Storage, Handling, &amp; Identification', '', ''),
(86, 5, 'Equipos para inspecciones visuales', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Visual Inspection', '', ''),
(87, 5, 'Equipos para acondicionamiento de fluidos', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Conditioning Equipment Rentals', '', ''),
(88, 5, 'Fuentes de Potencia', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Power Unit Rentals', '', ''),
(89, 5, 'Herramientas Hidráulicas para la Renta', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Hydraulic Tools Rentals', '', ''),
(90, 5, 'Ventiladores y Compresores', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Blowers &amp; Compressors', '', ''),
(91, 5, 'Cilindros Hidráulicos', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Hydraulic cilinders', '', ''),
(64, 6, 'Components', '&lt;p&gt;Hydraulic &amp;nbsp;&amp;gt; Cylinders, Pumps, Motors and Valves&lt;br&gt;&lt;/p&gt;', 'Hydraulic  &gt; Cylinders, Pumps, Motors and Valves', 'Hydraulic  &gt; Cylinders, Pumps, Motors and Valves', 'Hydraulic  &gt; Cylinders, Pumps, Motors and Valves'),
(59, 6, 'Equipments', 'Equipments', 'Equipments', 'Equipments', 'process Equipments, blowers, fan. pumps, compressors, hydraulic, pheumatic'),
(69, 6, 'Rentals', '&lt;p&gt;&lt;strong&gt;Reuse &lt;/strong&gt;is key in our &lt;a href=&quot;http://hydrotools.com/website/mission&quot;&gt;Mission &lt;/a&gt;&amp;nbsp;maximixing utilization. &lt;strong&gt;Rentals&lt;/strong&gt; are provide&amp;nbsp;exclusively by our network of &lt;a href=&quot;http://hydrotools.com/website/IMS&quot;&gt;IM - Independent Members&lt;/a&gt;. Would like to&amp;nbsp;know more about becoming an IM - , please fill the &lt;a href=&quot;http://hydrotools.com/website/IMS&quot;&gt;&lt;strong&gt;online from&lt;/strong&gt;&lt;/a&gt; or drop us a line &lt;a href=&quot;http://hydrotools.com/website/contact&quot;&gt;Contact US&lt;/a&gt;&lt;/p&gt;', 'Rentals', 'Rentals', 'Rentals'),
(67, 6, 'Lubrication', '&lt;p&gt;Proactive Maintenance and Lubrication&amp;nbsp;&lt;br&gt;&lt;/p&gt;', 'lubrication', 'Proactive Maintenance and Lubrication ', 'lubrication, lubricants, oil, grease, proactive maintenance, maintenance'),
(68, 6, 'Refurbishing', '&lt;p&gt;&lt;strong style=&quot;color: rgb(59, 59, 59); font-family: Georgia, ''Times New Roman'', Times, serif; font-size: 14.994px; line-height: 22.491px;&quot;&gt;Recycling&amp;nbsp;&lt;/strong&gt;&lt;span style=&quot;color: rgb(59, 59, 59); font-family: Georgia, ''Times New Roman'', Times, serif; font-size: 14.994px; line-height: 22.491px;&quot;&gt;is part of our&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;http://hydrotools.com/website/mission&quot; style=&quot;border-bottom-width: 1px; border-bottom-style: dotted; color: rgb(0, 113, 179); font-family: Georgia, ''Times New Roman'', Times, serif; font-size: 14.994px; line-height: 22.491px; background-color: rgb(255, 255, 255);&quot;&gt;Mission&amp;nbsp;&lt;/a&gt;&lt;span style=&quot;color: rgb(59, 59, 59); font-family: Georgia, ''Times New Roman'', Times, serif; font-size: 14.994px; line-height: 22.491px;&quot;&gt;to contribute with&amp;nbsp;our single Earth&amp;nbsp;- to&amp;nbsp;&lt;/span&gt;&lt;strong style=&quot;color: rgb(59, 59, 59); font-family: Georgia, ''Times New Roman'', Times, serif; font-size: 14.994px; line-height: 22.491px;&quot;&gt;Minimize cost and environmental footprint of heavy machinery&lt;/strong&gt;&lt;span style=&quot;color: rgb(59, 59, 59); font-family: Georgia, ''Times New Roman'', Times, serif; font-size: 14.994px; line-height: 22.491px;&quot;&gt;.&amp;nbsp;If\r\n you don''t find your product here, don''t hesitate to drop us a line to \r\nexplore remanufacture opportunitty with one of our principals&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;http://xceedmachine.ca/&quot; style=&quot;border-bottom-width: 1px; border-bottom-style: dotted; color: rgb(0, 113, 179); font-family: Georgia, ''Times New Roman'', Times, serif; font-size: 14.994px; line-height: 22.491px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;strong&gt;Xceed Machine Works Inc&lt;/strong&gt;&lt;/a&gt;&lt;br&gt;&lt;/p&gt;', 'Refurbishing', 'Refurbishing', 'Refurbishing'),
(62, 6, 'Pumps', '&lt;p&gt;Pumps&lt;br&gt;&lt;/p&gt;', 'Pumps', 'Pumps', 'Pumps'),
(61, 6, 'Blowers &amp; Compressor', '&lt;p&gt;Blowers &amp;amp; Compressor&lt;br&gt;&lt;/p&gt;', 'Blowers &amp; Compressor', 'Blowers &amp; Compressor', 'Blowers &amp; Compressor'),
(66, 6, 'Power Units', '&lt;p&gt;System Integration with power source plus hydraulic components. PU might\r\n have one or more hydraulic port for usage stand alone and/or with \r\nDetachable tools&lt;br&gt;&lt;/p&gt;', 'Power Units', 'Power Units', 'Power Units'),
(60, 6, 'Hydraulics', '&lt;p&gt;Hydraulics&lt;br&gt;&lt;/p&gt;', 'Hydraulics', 'Hydraulics', 'Hydraulics'),
(63, 6, 'Accessories', '&lt;p&gt;Hydraulic Accessories&lt;br&gt;&lt;/p&gt;', 'Accessories', 'Hydraulic Accessories', 'Hydraulic Accessories'),
(65, 6, 'Hydraulic Tools', '&lt;p&gt;Hydraulic powered tools that can be detachable from source and replace for reuse another tools.&lt;br&gt;&lt;/p&gt;', 'Hydraulic Tools', 'Hydraulic Tools', 'Hydraulic Tools'),
(70, 6, 'Services', '&lt;p&gt;Services provided by Hydro Tools Corp&lt;br&gt;&lt;/p&gt;', 'Services', 'Services', 'Services'),
(71, 6, 'Engineering', '&lt;p&gt;Engineering Services Provided by Hydro Tools Corp&lt;br&gt;&lt;/p&gt;', 'Engineering', 'Engineering', 'Engineering'),
(72, 6, 'Field Services', '&lt;p&gt;Field Services provided by Hydro Tools Corp&lt;br&gt;&lt;/p&gt;', 'Field Services', 'Field Services', 'Field Services'),
(73, 6, 'Shop Services', '&lt;p&gt;Shop Services&lt;br&gt;&lt;/p&gt;', 'Shop Services', 'Shop Services', 'Shop Services'),
(74, 6, 'Central Lubrication System', '&lt;p&gt;Automatic and continuous pumps, fittings, line, positive displacement pumps, and manifolds.&lt;br&gt;&lt;/p&gt;', 'Central Lubrication System', 'Central Lubrication System', 'Central Lubrication System'),
(75, 6, 'Automatic Pumps', '&lt;p&gt;Do you need automatic lubrication on an intermittent basis? The Trico\r\n automatic pump is a low cost option with various size reservoir and \r\nadjustable timing intervals.&lt;/p&gt;&lt;p&gt;Features:&lt;/p&gt;&lt;p&gt;Spring discharge and \r\ngear pumps, adjustable interval times between lubrication, up to 20 \r\nliter capacity, big enough to drive systems with up to 50 lubrication \r\npoints.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Automatic pumps use meter units to apportion the amount of oil at each lubrication point.&lt;/p&gt;', 'Automatic Pumps', 'Automatic Pumps', 'Automatic Pumps'),
(76, 6, 'Manual Cyclic Pumps', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Manual Cyclic Pumps', 'Manual Cyclic Pumps', 'Manual Cyclic Pumps'),
(77, 6, 'Constant Level Lubrication', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Constant Level Lubrication', 'Constant Level Lubrication', 'Constant Level Lubrication'),
(78, 6, 'Contamination Control', '&lt;p&gt;Contamination Control&lt;br&gt;&lt;/p&gt;', 'Contamination Control', 'Contamination Control', 'Contamination Control'),
(79, 6, 'Gravity Feed Oilers', '&lt;p&gt;Gravity Feed Oilers&lt;br&gt;&lt;/p&gt;', 'Gravity Feed Oilers', 'Gravity Feed Oilers', 'Gravity Feed Oilers'),
(80, 6, 'Grease Lubrication', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Grease Lubrication', '', ''),
(81, 6, 'Lab Instrumentation', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Lab Instrumentation', '', ''),
(82, 6, 'Metalworking', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Metalworking', '', ''),
(83, 6, 'Oil Absorbent Products', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Oil Absorbent Products', '', ''),
(84, 6, 'Oil Sampling', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Oil Sampling', '', ''),
(85, 6, 'Storage, Handling, &amp; Identification', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Storage, Handling, &amp; Identification', '', ''),
(86, 6, 'Visual Inspection', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Visual Inspection', '', ''),
(87, 6, 'Conditioning Equipment Rentals', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Conditioning Equipment Rentals', '', ''),
(88, 6, 'Power Unit Rentals', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Power Unit Rentals', '', ''),
(89, 6, 'Hydraulic Tools Rentals', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Hydraulic Tools Rentals', '', ''),
(90, 6, 'Blowers &amp; Compressors', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Blowers &amp; Compressors', '', ''),
(91, 6, 'Hydraulic cilinders', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Hydraulic cilinders', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_filter`
--

CREATE TABLE IF NOT EXISTS `oc_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_path`
--

CREATE TABLE IF NOT EXISTS `oc_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category_path`
--

INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES
(67, 67, 0),
(66, 66, 2),
(66, 59, 0),
(66, 60, 1),
(65, 65, 2),
(65, 59, 0),
(65, 60, 1),
(64, 64, 2),
(64, 59, 0),
(64, 60, 1),
(63, 59, 0),
(63, 60, 1),
(63, 63, 2),
(62, 62, 1),
(62, 59, 0),
(61, 61, 1),
(61, 59, 0),
(73, 70, 0),
(72, 72, 1),
(72, 70, 0),
(71, 71, 1),
(71, 70, 0),
(70, 70, 0),
(69, 69, 0),
(68, 68, 0),
(60, 60, 1),
(60, 59, 0),
(59, 59, 0),
(91, 91, 1),
(91, 68, 0),
(90, 90, 1),
(90, 68, 0),
(89, 89, 1),
(89, 69, 0),
(88, 88, 1),
(88, 69, 0),
(87, 87, 1),
(87, 69, 0),
(86, 86, 1),
(86, 67, 0),
(85, 85, 1),
(85, 67, 0),
(84, 84, 1),
(84, 67, 0),
(83, 83, 1),
(83, 67, 0),
(82, 82, 1),
(82, 67, 0),
(81, 81, 1),
(81, 67, 0),
(80, 80, 1),
(80, 67, 0),
(79, 79, 1),
(79, 67, 0),
(78, 78, 1),
(78, 67, 0),
(77, 77, 1),
(77, 67, 0),
(76, 76, 2),
(76, 67, 0),
(76, 74, 1),
(75, 75, 2),
(75, 67, 0),
(75, 74, 1),
(74, 74, 1),
(74, 67, 0),
(73, 73, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_to_layout`
--

CREATE TABLE IF NOT EXISTS `oc_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category_to_layout`
--

INSERT INTO `oc_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES
(59, 0, 0),
(60, 0, 0),
(61, 0, 0),
(62, 0, 0),
(63, 0, 0),
(64, 0, 0),
(65, 0, 0),
(66, 0, 0),
(67, 0, 0),
(68, 0, 0),
(69, 0, 0),
(70, 0, 0),
(71, 0, 0),
(72, 0, 0),
(73, 0, 0),
(74, 0, 0),
(75, 0, 0),
(76, 0, 0),
(77, 0, 0),
(78, 0, 0),
(79, 0, 0),
(80, 0, 0),
(81, 0, 0),
(82, 0, 0),
(83, 0, 0),
(84, 0, 0),
(85, 0, 0),
(86, 0, 0),
(87, 0, 0),
(88, 0, 0),
(89, 0, 0),
(90, 0, 0),
(91, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category_to_store`
--

INSERT INTO `oc_category_to_store` (`category_id`, `store_id`) VALUES
(59, 0),
(60, 0),
(61, 0),
(62, 0),
(63, 0),
(64, 0),
(65, 0),
(66, 0),
(67, 0),
(68, 0),
(69, 0),
(70, 0),
(71, 0),
(72, 0),
(73, 0),
(74, 0),
(75, 0),
(76, 0),
(77, 0),
(78, 0),
(79, 0),
(80, 0),
(81, 0),
(82, 0),
(83, 0),
(84, 0),
(85, 0),
(86, 0),
(87, 0),
(88, 0),
(89, 0),
(90, 0),
(91, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_cftyp_coupon_affiliate`
--

CREATE TABLE IF NOT EXISTS `oc_cftyp_coupon_affiliate` (
  `coupon_id` int(11) unsigned NOT NULL DEFAULT '0',
  `affiliate_id` int(11) unsigned NOT NULL DEFAULT '0',
  `marketing_id` int(11) unsigned NOT NULL DEFAULT '0',
  `ctype` enum('a','m') NOT NULL DEFAULT 'a'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_country`
--

CREATE TABLE IF NOT EXISTS `oc_country` (
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=258 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_country`
--

INSERT INTO `oc_country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES
(1, 'Afghanistan', 'AF', 'AFG', '', 0, 1),
(2, 'Albania', 'AL', 'ALB', '', 0, 1),
(3, 'Algeria', 'DZ', 'DZA', '', 0, 1),
(4, 'American Samoa', 'AS', 'ASM', '', 0, 1),
(5, 'Andorra', 'AD', 'AND', '', 0, 1),
(6, 'Angola', 'AO', 'AGO', '', 0, 1),
(7, 'Anguilla', 'AI', 'AIA', '', 0, 1),
(8, 'Antarctica', 'AQ', 'ATA', '', 0, 1),
(9, 'Antigua and Barbuda', 'AG', 'ATG', '', 0, 1),
(10, 'Argentina', 'AR', 'ARG', '', 0, 1),
(11, 'Armenia', 'AM', 'ARM', '', 0, 1),
(12, 'Aruba', 'AW', 'ABW', '', 0, 1),
(13, 'Australia', 'AU', 'AUS', '', 0, 1),
(14, 'Austria', 'AT', 'AUT', '', 0, 1),
(15, 'Azerbaijan', 'AZ', 'AZE', '', 0, 1),
(16, 'Bahamas', 'BS', 'BHS', '', 0, 1),
(17, 'Bahrain', 'BH', 'BHR', '', 0, 1),
(18, 'Bangladesh', 'BD', 'BGD', '', 0, 1),
(19, 'Barbados', 'BB', 'BRB', '', 0, 1),
(20, 'Belarus', 'BY', 'BLR', '', 0, 1),
(21, 'Belgium', 'BE', 'BEL', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 0, 1),
(22, 'Belize', 'BZ', 'BLZ', '', 0, 1),
(23, 'Benin', 'BJ', 'BEN', '', 0, 1),
(24, 'Bermuda', 'BM', 'BMU', '', 0, 1),
(25, 'Bhutan', 'BT', 'BTN', '', 0, 1),
(26, 'Bolivia', 'BO', 'BOL', '', 0, 1),
(27, 'Bosnia and Herzegovina', 'BA', 'BIH', '', 0, 1),
(28, 'Botswana', 'BW', 'BWA', '', 0, 1),
(29, 'Bouvet Island', 'BV', 'BVT', '', 0, 1),
(30, 'Brazil', 'BR', 'BRA', '', 0, 1),
(31, 'British Indian Ocean Territory', 'IO', 'IOT', '', 0, 1),
(32, 'Brunei Darussalam', 'BN', 'BRN', '', 0, 1),
(33, 'Bulgaria', 'BG', 'BGR', '', 0, 1),
(34, 'Burkina Faso', 'BF', 'BFA', '', 0, 1),
(35, 'Burundi', 'BI', 'BDI', '', 0, 1),
(36, 'Cambodia', 'KH', 'KHM', '', 0, 1),
(37, 'Cameroon', 'CM', 'CMR', '', 0, 1),
(38, 'Canada', 'CA', 'CAN', '', 0, 1),
(39, 'Cape Verde', 'CV', 'CPV', '', 0, 1),
(40, 'Cayman Islands', 'KY', 'CYM', '', 0, 1),
(41, 'Central African Republic', 'CF', 'CAF', '', 0, 1),
(42, 'Chad', 'TD', 'TCD', '', 0, 1),
(43, 'Chile', 'CL', 'CHL', '', 0, 1),
(44, 'China', 'CN', 'CHN', '', 0, 1),
(45, 'Christmas Island', 'CX', 'CXR', '', 0, 1),
(46, 'Cocos (Keeling) Islands', 'CC', 'CCK', '', 0, 1),
(47, 'Colombia', 'CO', 'COL', '', 0, 1),
(48, 'Comoros', 'KM', 'COM', '', 0, 1),
(49, 'Congo', 'CG', 'COG', '', 0, 1),
(50, 'Cook Islands', 'CK', 'COK', '', 0, 1),
(51, 'Costa Rica', 'CR', 'CRI', '', 0, 1),
(52, 'Cote D''Ivoire', 'CI', 'CIV', '', 0, 1),
(53, 'Croatia', 'HR', 'HRV', '', 0, 1),
(54, 'Cuba', 'CU', 'CUB', '', 0, 1),
(55, 'Cyprus', 'CY', 'CYP', '', 0, 1),
(56, 'Czech Republic', 'CZ', 'CZE', '', 0, 1),
(57, 'Denmark', 'DK', 'DNK', '', 0, 1),
(58, 'Djibouti', 'DJ', 'DJI', '', 0, 1),
(59, 'Dominica', 'DM', 'DMA', '', 0, 1),
(60, 'Dominican Republic', 'DO', 'DOM', '', 0, 1),
(61, 'East Timor', 'TL', 'TLS', '', 0, 1),
(62, 'Ecuador', 'EC', 'ECU', '', 0, 1),
(63, 'Egypt', 'EG', 'EGY', '', 0, 1),
(64, 'El Salvador', 'SV', 'SLV', '', 0, 1),
(65, 'Equatorial Guinea', 'GQ', 'GNQ', '', 0, 1),
(66, 'Eritrea', 'ER', 'ERI', '', 0, 1),
(67, 'Estonia', 'EE', 'EST', '', 0, 1),
(68, 'Ethiopia', 'ET', 'ETH', '', 0, 1),
(69, 'Falkland Islands (Malvinas)', 'FK', 'FLK', '', 0, 1),
(70, 'Faroe Islands', 'FO', 'FRO', '', 0, 1),
(71, 'Fiji', 'FJ', 'FJI', '', 0, 1),
(72, 'Finland', 'FI', 'FIN', '', 0, 1),
(74, 'France, Metropolitan', 'FR', 'FRA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(75, 'French Guiana', 'GF', 'GUF', '', 0, 1),
(76, 'French Polynesia', 'PF', 'PYF', '', 0, 1),
(77, 'French Southern Territories', 'TF', 'ATF', '', 0, 1),
(78, 'Gabon', 'GA', 'GAB', '', 0, 1),
(79, 'Gambia', 'GM', 'GMB', '', 0, 1),
(80, 'Georgia', 'GE', 'GEO', '', 0, 1),
(81, 'Germany', 'DE', 'DEU', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(82, 'Ghana', 'GH', 'GHA', '', 0, 1),
(83, 'Gibraltar', 'GI', 'GIB', '', 0, 1),
(84, 'Greece', 'GR', 'GRC', '', 0, 1),
(85, 'Greenland', 'GL', 'GRL', '', 0, 1),
(86, 'Grenada', 'GD', 'GRD', '', 0, 1),
(87, 'Guadeloupe', 'GP', 'GLP', '', 0, 1),
(88, 'Guam', 'GU', 'GUM', '', 0, 1),
(89, 'Guatemala', 'GT', 'GTM', '', 0, 1),
(90, 'Guinea', 'GN', 'GIN', '', 0, 1),
(91, 'Guinea-Bissau', 'GW', 'GNB', '', 0, 1),
(92, 'Guyana', 'GY', 'GUY', '', 0, 1),
(93, 'Haiti', 'HT', 'HTI', '', 0, 1),
(94, 'Heard and Mc Donald Islands', 'HM', 'HMD', '', 0, 1),
(95, 'Honduras', 'HN', 'HND', '', 0, 1),
(96, 'Hong Kong', 'HK', 'HKG', '', 0, 1),
(97, 'Hungary', 'HU', 'HUN', '', 0, 1),
(98, 'Iceland', 'IS', 'ISL', '', 0, 1),
(99, 'India', 'IN', 'IND', '', 0, 1),
(100, 'Indonesia', 'ID', 'IDN', '', 0, 1),
(101, 'Iran (Islamic Republic of)', 'IR', 'IRN', '', 0, 1),
(102, 'Iraq', 'IQ', 'IRQ', '', 0, 1),
(103, 'Ireland', 'IE', 'IRL', '', 0, 1),
(104, 'Israel', 'IL', 'ISR', '', 0, 1),
(105, 'Italy', 'IT', 'ITA', '', 0, 1),
(106, 'Jamaica', 'JM', 'JAM', '', 0, 1),
(107, 'Japan', 'JP', 'JPN', '', 0, 1),
(108, 'Jordan', 'JO', 'JOR', '', 0, 1),
(109, 'Kazakhstan', 'KZ', 'KAZ', '', 0, 1),
(110, 'Kenya', 'KE', 'KEN', '', 0, 1),
(111, 'Kiribati', 'KI', 'KIR', '', 0, 1),
(112, 'North Korea', 'KP', 'PRK', '', 0, 1),
(113, 'South Korea', 'KR', 'KOR', '', 0, 1),
(114, 'Kuwait', 'KW', 'KWT', '', 0, 1),
(115, 'Kyrgyzstan', 'KG', 'KGZ', '', 0, 1),
(116, 'Lao People''s Democratic Republic', 'LA', 'LAO', '', 0, 1),
(117, 'Latvia', 'LV', 'LVA', '', 0, 1),
(118, 'Lebanon', 'LB', 'LBN', '', 0, 1),
(119, 'Lesotho', 'LS', 'LSO', '', 0, 1),
(120, 'Liberia', 'LR', 'LBR', '', 0, 1),
(121, 'Libyan Arab Jamahiriya', 'LY', 'LBY', '', 0, 1),
(122, 'Liechtenstein', 'LI', 'LIE', '', 0, 1),
(123, 'Lithuania', 'LT', 'LTU', '', 0, 1),
(124, 'Luxembourg', 'LU', 'LUX', '', 0, 1),
(125, 'Macau', 'MO', 'MAC', '', 0, 1),
(126, 'FYROM', 'MK', 'MKD', '', 0, 1),
(127, 'Madagascar', 'MG', 'MDG', '', 0, 1),
(128, 'Malawi', 'MW', 'MWI', '', 0, 1),
(129, 'Malaysia', 'MY', 'MYS', '', 0, 1),
(130, 'Maldives', 'MV', 'MDV', '', 0, 1),
(131, 'Mali', 'ML', 'MLI', '', 0, 1),
(132, 'Malta', 'MT', 'MLT', '', 0, 1),
(133, 'Marshall Islands', 'MH', 'MHL', '', 0, 1),
(134, 'Martinique', 'MQ', 'MTQ', '', 0, 1),
(135, 'Mauritania', 'MR', 'MRT', '', 0, 1),
(136, 'Mauritius', 'MU', 'MUS', '', 0, 1),
(137, 'Mayotte', 'YT', 'MYT', '', 0, 1),
(138, 'Mexico', 'MX', 'MEX', '', 0, 1),
(139, 'Micronesia, Federated States of', 'FM', 'FSM', '', 0, 1),
(140, 'Moldova, Republic of', 'MD', 'MDA', '', 0, 1),
(141, 'Monaco', 'MC', 'MCO', '', 0, 1),
(142, 'Mongolia', 'MN', 'MNG', '', 0, 1),
(143, 'Montserrat', 'MS', 'MSR', '', 0, 1),
(144, 'Morocco', 'MA', 'MAR', '', 0, 1),
(145, 'Mozambique', 'MZ', 'MOZ', '', 0, 1),
(146, 'Myanmar', 'MM', 'MMR', '', 0, 1),
(147, 'Namibia', 'NA', 'NAM', '', 0, 1),
(148, 'Nauru', 'NR', 'NRU', '', 0, 1),
(149, 'Nepal', 'NP', 'NPL', '', 0, 1),
(150, 'Netherlands', 'NL', 'NLD', '', 0, 1),
(151, 'Netherlands Antilles', 'AN', 'ANT', '', 0, 1),
(152, 'New Caledonia', 'NC', 'NCL', '', 0, 1),
(153, 'New Zealand', 'NZ', 'NZL', '', 0, 1),
(154, 'Nicaragua', 'NI', 'NIC', '', 0, 1),
(155, 'Niger', 'NE', 'NER', '', 0, 1),
(156, 'Nigeria', 'NG', 'NGA', '', 0, 1),
(157, 'Niue', 'NU', 'NIU', '', 0, 1),
(158, 'Norfolk Island', 'NF', 'NFK', '', 0, 1),
(159, 'Northern Mariana Islands', 'MP', 'MNP', '', 0, 1),
(160, 'Norway', 'NO', 'NOR', '', 0, 1),
(161, 'Oman', 'OM', 'OMN', '', 0, 1),
(162, 'Pakistan', 'PK', 'PAK', '', 0, 1),
(163, 'Palau', 'PW', 'PLW', '', 0, 1),
(164, 'Panama', 'PA', 'PAN', '', 0, 1),
(165, 'Papua New Guinea', 'PG', 'PNG', '', 0, 1),
(166, 'Paraguay', 'PY', 'PRY', '', 0, 1),
(167, 'Peru', 'PE', 'PER', '', 0, 1),
(168, 'Philippines', 'PH', 'PHL', '', 0, 1),
(169, 'Pitcairn', 'PN', 'PCN', '', 0, 1),
(170, 'Poland', 'PL', 'POL', '', 0, 1),
(171, 'Portugal', 'PT', 'PRT', '', 0, 1),
(172, 'Puerto Rico', 'PR', 'PRI', '', 0, 1),
(173, 'Qatar', 'QA', 'QAT', '', 0, 1),
(174, 'Reunion', 'RE', 'REU', '', 0, 1),
(175, 'Romania', 'RO', 'ROM', '', 0, 1),
(176, 'Russian Federation', 'RU', 'RUS', '', 0, 1),
(177, 'Rwanda', 'RW', 'RWA', '', 0, 1),
(178, 'Saint Kitts and Nevis', 'KN', 'KNA', '', 0, 1),
(179, 'Saint Lucia', 'LC', 'LCA', '', 0, 1),
(180, 'Saint Vincent and the Grenadines', 'VC', 'VCT', '', 0, 1),
(181, 'Samoa', 'WS', 'WSM', '', 0, 1),
(182, 'San Marino', 'SM', 'SMR', '', 0, 1),
(183, 'Sao Tome and Principe', 'ST', 'STP', '', 0, 1),
(184, 'Saudi Arabia', 'SA', 'SAU', '', 0, 1),
(185, 'Senegal', 'SN', 'SEN', '', 0, 1),
(186, 'Seychelles', 'SC', 'SYC', '', 0, 1),
(187, 'Sierra Leone', 'SL', 'SLE', '', 0, 1),
(188, 'Singapore', 'SG', 'SGP', '', 0, 1),
(189, 'Slovak Republic', 'SK', 'SVK', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city} {postcode}\r\n{zone}\r\n{country}', 0, 1),
(190, 'Slovenia', 'SI', 'SVN', '', 0, 1),
(191, 'Solomon Islands', 'SB', 'SLB', '', 0, 1),
(192, 'Somalia', 'SO', 'SOM', '', 0, 1),
(193, 'South Africa', 'ZA', 'ZAF', '', 0, 1),
(194, 'South Georgia &amp; South Sandwich Islands', 'GS', 'SGS', '', 0, 1),
(195, 'Spain', 'ES', 'ESP', '', 0, 1),
(196, 'Sri Lanka', 'LK', 'LKA', '', 0, 1),
(197, 'St. Helena', 'SH', 'SHN', '', 0, 1),
(198, 'St. Pierre and Miquelon', 'PM', 'SPM', '', 0, 1),
(199, 'Sudan', 'SD', 'SDN', '', 0, 1),
(200, 'Suriname', 'SR', 'SUR', '', 0, 1),
(201, 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', '', 0, 1),
(202, 'Swaziland', 'SZ', 'SWZ', '', 0, 1),
(203, 'Sweden', 'SE', 'SWE', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(204, 'Switzerland', 'CH', 'CHE', '', 0, 1),
(205, 'Syrian Arab Republic', 'SY', 'SYR', '', 0, 1),
(206, 'Taiwan', 'TW', 'TWN', '', 0, 1),
(207, 'Tajikistan', 'TJ', 'TJK', '', 0, 1),
(208, 'Tanzania, United Republic of', 'TZ', 'TZA', '', 0, 1),
(209, 'Thailand', 'TH', 'THA', '', 0, 1),
(210, 'Togo', 'TG', 'TGO', '', 0, 1),
(211, 'Tokelau', 'TK', 'TKL', '', 0, 1),
(212, 'Tonga', 'TO', 'TON', '', 0, 1),
(213, 'Trinidad and Tobago', 'TT', 'TTO', '', 0, 1),
(214, 'Tunisia', 'TN', 'TUN', '', 0, 1),
(215, 'Turkey', 'TR', 'TUR', '', 0, 1),
(216, 'Turkmenistan', 'TM', 'TKM', '', 0, 1),
(217, 'Turks and Caicos Islands', 'TC', 'TCA', '', 0, 1),
(218, 'Tuvalu', 'TV', 'TUV', '', 0, 1),
(219, 'Uganda', 'UG', 'UGA', '', 0, 1),
(220, 'Ukraine', 'UA', 'UKR', '', 0, 1),
(221, 'United Arab Emirates', 'AE', 'ARE', '', 0, 1),
(222, 'United Kingdom', 'GB', 'GBR', '', 1, 1),
(223, 'United States', 'US', 'USA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city}, {zone} {postcode}\r\n{country}', 0, 1),
(224, 'United States Minor Outlying Islands', 'UM', 'UMI', '', 0, 1),
(225, 'Uruguay', 'UY', 'URY', '', 0, 1),
(226, 'Uzbekistan', 'UZ', 'UZB', '', 0, 1),
(227, 'Vanuatu', 'VU', 'VUT', '', 0, 1),
(228, 'Vatican City State (Holy See)', 'VA', 'VAT', '', 0, 1),
(229, 'Venezuela', 'VE', 'VEN', '', 0, 1),
(230, 'Viet Nam', 'VN', 'VNM', '', 0, 1),
(231, 'Virgin Islands (British)', 'VG', 'VGB', '', 0, 1),
(232, 'Virgin Islands (U.S.)', 'VI', 'VIR', '', 0, 1),
(233, 'Wallis and Futuna Islands', 'WF', 'WLF', '', 0, 1),
(234, 'Western Sahara', 'EH', 'ESH', '', 0, 1),
(235, 'Yemen', 'YE', 'YEM', '', 0, 1),
(237, 'Democratic Republic of Congo', 'CD', 'COD', '', 0, 1),
(238, 'Zambia', 'ZM', 'ZMB', '', 0, 1),
(239, 'Zimbabwe', 'ZW', 'ZWE', '', 0, 1),
(242, 'Montenegro', 'ME', 'MNE', '', 0, 1),
(243, 'Serbia', 'RS', 'SRB', '', 0, 1),
(244, 'Aaland Islands', 'AX', 'ALA', '', 0, 1),
(245, 'Bonaire, Sint Eustatius and Saba', 'BQ', 'BES', '', 0, 1),
(246, 'Curacao', 'CW', 'CUW', '', 0, 1),
(247, 'Palestinian Territory, Occupied', 'PS', 'PSE', '', 0, 1),
(248, 'South Sudan', 'SS', 'SSD', '', 0, 1),
(249, 'St. Barthelemy', 'BL', 'BLM', '', 0, 1),
(250, 'St. Martin (French part)', 'MF', 'MAF', '', 0, 1),
(251, 'Canary Islands', 'IC', 'ICA', '', 0, 1),
(252, 'Ascension Island (British)', 'AC', 'ASC', '', 0, 1),
(253, 'Kosovo, Republic of', 'XK', 'UNK', '', 0, 1),
(254, 'Isle of Man', 'IM', 'IMN', '', 0, 1),
(255, 'Tristan da Cunha', 'TA', 'SHN', '', 0, 1),
(256, 'Guernsey', 'GG', 'GGY', '', 0, 1),
(257, 'Jersey', 'JE', 'JEY', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon`
--

CREATE TABLE IF NOT EXISTS `oc_coupon` (
  `coupon_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(10) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_coupon`
--

INSERT INTO `oc_coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`) VALUES
(4, '-10% Discount', '2222', 'P', 10.0000, 0, 0, 0.0000, '2014-01-01', '2020-01-01', 10, '10', 0, '2009-01-27 13:55:03'),
(5, 'Free Shipping', '3333', 'P', 0.0000, 0, 1, 100.0000, '2014-01-01', '2014-02-01', 10, '10', 0, '2009-03-14 21:13:53'),
(6, '-10.00 Discount', '1111', 'F', 10.0000, 0, 0, 10.0000, '2014-01-01', '2020-01-01', 100000, '10000', 0, '2009-03-14 21:15:18');

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon_category`
--

CREATE TABLE IF NOT EXISTS `oc_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon_history`
--

CREATE TABLE IF NOT EXISTS `oc_coupon_history` (
  `coupon_history_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon_product`
--

CREATE TABLE IF NOT EXISTS `oc_coupon_product` (
  `coupon_product_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_currency`
--

CREATE TABLE IF NOT EXISTS `oc_currency` (
  `currency_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` float(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_currency`
--

INSERT INTO `oc_currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(1, 'Pound Sterling', 'GBP', '£', '', '2', 0.70480001, 1, '2016-01-20 15:40:54'),
(2, 'US Dollar', 'USD', '$USD  ', '', '2', 1.00000000, 1, '2016-01-20 15:47:48'),
(3, 'Euro', 'EUR', '', '€', '2', 0.91810000, 1, '2016-01-20 15:40:54'),
(4, 'Canadian Dollar', 'CAD', '$CAD ', '', '2', 1.45070004, 1, '2016-01-20 15:40:54');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer`
--

CREATE TABLE IF NOT EXISTS `oc_customer` (
  `customer_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `safe` tinyint(1) NOT NULL,
  `token` text NOT NULL,
  `date_added` datetime NOT NULL,
  `affiliate_id` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_customer`
--

INSERT INTO `oc_customer` (`customer_id`, `customer_group_id`, `store_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `password`, `salt`, `cart`, `wishlist`, `newsletter`, `address_id`, `custom_field`, `ip`, `status`, `approved`, `safe`, `token`, `date_added`, `affiliate_id`) VALUES
(1, 1, 0, 'buyer', 'htc', 'buyer@hydrotools.com', '780-224.8873', '', 'cf4c3986ef2ee7e35cbe73b2953c0bd2d6318553', 'ibXftnMuO', NULL, NULL, 1, 1, '', '192.168.1.110', 1, 1, 0, '', '2016-01-18 09:33:53', 1),
(2, 1, 0, 'buyer', 'htc', 'webmaster-buyer@hydrotools.com', '780-2248873', '', '705ac5b6cd944f7075f829bdac34d070c0ce7ff7', 'Sp1aVtZ19', NULL, NULL, 0, 2, '', '192.168.1.110', 1, 1, 0, '', '2016-01-18 11:08:15', 0),
(3, 1, 0, 'test', 'affiliated', 'seller@hydrotools.com', '780-224.8873', '', '9466f4d21eeaf999b2bcbd54fb4a46d992a8a706', 'UDLRaB8TQ', NULL, NULL, 1, 3, '', '192.168.1.110', 1, 1, 0, '', '2016-01-20 13:53:04', 0),
(4, 1, 0, 'Pedro', 'Cones', 'pedro.cones@hydrotools.com', '780-224.8873', '', '012299ad4dca40b02a454d18ac8f9ad648dbc6cd', 'oQaGXfLcN', NULL, NULL, 1, 4, '', '192.168.1.110', 1, 1, 0, '', '2016-01-20 15:36:52', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_activity`
--

CREATE TABLE IF NOT EXISTS `oc_customer_activity` (
  `activity_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_customer_activity`
--

INSERT INTO `oc_customer_activity` (`activity_id`, `customer_id`, `key`, `data`, `ip`, `date_added`) VALUES
(1, 1, 'register', '{"customer_id":1,"name":"buyer htc"}', '192.168.1.110', '2016-01-18 09:33:53'),
(2, 1, 'edit', '{"customer_id":"1","name":"buyer htc"}', '192.168.1.110', '2016-01-18 09:36:30'),
(3, 1, 'order_account', '{"customer_id":"1","name":"buyer htc","order_id":6}', '192.168.1.110', '2016-01-18 10:23:29'),
(4, 2, 'register', '{"customer_id":2,"name":"buyer htc"}', '192.168.1.110', '2016-01-18 11:08:15'),
(5, 2, 'login', '{"customer_id":"2","name":"buyer htc"}', '192.168.1.110', '2016-01-18 15:11:07'),
(6, 3, 'register', '{"customer_id":3,"name":"test affiliated"}', '192.168.1.110', '2016-01-20 13:53:04'),
(7, 4, 'register', '{"customer_id":4,"name":"Pedro Cones"}', '192.168.1.110', '2016-01-20 15:36:52'),
(8, 1, 'login', '{"customer_id":"1","name":"buyer htc"}', '192.168.1.110', '2016-01-20 15:43:44'),
(9, 1, 'order_account', '{"customer_id":"1","name":"buyer htc","order_id":8}', '192.168.1.110', '2016-01-20 15:45:00');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_group`
--

CREATE TABLE IF NOT EXISTS `oc_customer_group` (
  `customer_group_id` int(11) NOT NULL,
  `approval` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_customer_group`
--

INSERT INTO `oc_customer_group` (`customer_group_id`, `approval`, `sort_order`) VALUES
(1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_group_description`
--

CREATE TABLE IF NOT EXISTS `oc_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_customer_group_description`
--

INSERT INTO `oc_customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`) VALUES
(1, 5, 'Default', 'test'),
(1, 2, 'Default', 'test'),
(1, 6, 'Default', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_history`
--

CREATE TABLE IF NOT EXISTS `oc_customer_history` (
  `customer_history_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_ip`
--

CREATE TABLE IF NOT EXISTS `oc_customer_ip` (
  `customer_ip_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_customer_ip`
--

INSERT INTO `oc_customer_ip` (`customer_ip_id`, `customer_id`, `ip`, `date_added`) VALUES
(1, 1, '192.168.1.110', '2016-01-18 09:33:53'),
(2, 2, '192.168.1.110', '2016-01-18 11:08:15'),
(3, 3, '192.168.1.110', '2016-01-20 13:53:04'),
(4, 4, '192.168.1.110', '2016-01-20 15:36:52');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_login`
--

CREATE TABLE IF NOT EXISTS `oc_customer_login` (
  `customer_login_id` int(11) NOT NULL,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_customer_login`
--

INSERT INTO `oc_customer_login` (`customer_login_id`, `email`, `ip`, `total`, `date_added`, `date_modified`) VALUES
(1, 'webmaster', '192.168.1.110', 2, '2016-01-18 09:31:46', '2016-01-18 15:10:37');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_online`
--

CREATE TABLE IF NOT EXISTS `oc_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_reward`
--

CREATE TABLE IF NOT EXISTS `oc_customer_reward` (
  `customer_reward_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_transaction`
--

CREATE TABLE IF NOT EXISTS `oc_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_wishlist`
--

CREATE TABLE IF NOT EXISTS `oc_customer_wishlist` (
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field` (
  `custom_field_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `location` varchar(7) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_customer_group`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_description`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_value`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_value_description`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_download`
--

CREATE TABLE IF NOT EXISTS `oc_download` (
  `download_id` int(11) NOT NULL,
  `filename` varchar(128) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_download_description`
--

CREATE TABLE IF NOT EXISTS `oc_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_event`
--

CREATE TABLE IF NOT EXISTS `oc_event` (
  `event_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `trigger` text NOT NULL,
  `action` text NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_event`
--

INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`) VALUES
(1, 'voucher', 'post.order.history.add', 'total/voucher/send'),
(44, 'mta', 'post.affiliate.add.transaction', 'affiliate/mta_event/eventAddTransactionPost'),
(43, 'mta', 'post.order.history.add', 'affiliate/mta_event/eventAutoAddCommissions'),
(42, 'mta', 'pre.order.history.add', 'affiliate/mta_event/eventAddOrderHistoryPre'),
(41, 'mta', 'post.affiliate.add', 'affiliate/mta_event/eventAddAffiliatePost'),
(40, 'mta', 'post.customer.add', 'affiliate/mta_event/eventAddCustomerPost'),
(39, 'mta', 'pre.customer.add', 'affiliate/mta_event/eventAddCustomerPre'),
(38, 'mta', 'post.admin.product.delete', 'mta/mta_event/eventDeleteProductPost'),
(37, 'mta', 'post.admin.product.edit', 'mta/mta_event/eventEditProductPost'),
(36, 'mta', 'pre.admin.product.edit', 'mta/mta_event/eventEditProductPre'),
(35, 'mta', 'post.admin.affiliate.edit', 'mta/mta_event/eventEditAffiliatePost'),
(34, 'mta', 'pre.admin.affiliate.edit', 'mta/mta_event/eventEditAffiliatePre'),
(33, 'mta', 'post.admin.affiliate.add', 'mta/mta_event/eventAddAffiliatePost'),
(32, 'mta', 'pre.admin.affiliate.add', 'mta/mta_event/eventAddAffiliatePre'),
(31, 'mta', 'post.admin.product.add', 'mta/mta_event/eventAddProductPost'),
(30, 'mta', 'pre.admin.affiliate.delete', 'mta/mta_event/eventDeleteAffiliate'),
(29, 'mta', 'pre.admin.product.add', 'mta/mta_event/eventAddProductPre'),
(28, 'mta', 'pre.admin.coupon.delete', 'mta/mta_event/eventDeleteCoupon'),
(45, 'mta', 'pre.order.add', 'affiliate/mta_event/eventAddOrderPre'),
(46, 'mta', 'post.order.add', 'affiliate/mta_event/eventAddOrderPost'),
(47, 'mta', 'pre.order.delete', 'affiliate/mta_event/eventDeleteOrder'),
(48, 'mta', 'pre.order.edit', 'affiliate/mta_event/eventEditOrderPre'),
(49, 'mta', 'post.order.edit', 'affiliate/mta_event/eventEditOrderPost'),
(63, 'tracking_discount', 'post.admin.affiliate.edit', 'total/tracking_discount/eventAffiliatePost'),
(64, 'tracking_discount', 'pre.admin.affiliate.delete', 'total/tracking_discount/eventDeleteAffiliate'),
(62, 'tracking_discount', 'pre.admin.affiliate.edit', 'total/tracking_discount/eventAffiliatePre'),
(60, 'tracking_discount', 'pre.admin.affiliate.add', 'total/tracking_discount/eventAffiliatePre'),
(61, 'tracking_discount', 'post.admin.affiliate.add', 'total/tracking_discount/eventAffiliatePost'),
(65, 'cftyp', 'pre.admin.coupon.delete', 'module/coupon_for_tracking/eventDeleteCoupon'),
(66, 'account_combine', 'post.affiliate.add.transaction', 'affiliate/account_combine/eventAutoCredit'),
(67, 'account_combine', 'pre.admin.affiliate.delete', 'module/account_combine/eventDeleteAffiliate'),
(68, 'account_combine', 'post.admin.affiliate.transaction.add', 'module/account_combine/eventAutoCredit');

-- --------------------------------------------------------

--
-- Table structure for table `oc_extension`
--

CREATE TABLE IF NOT EXISTS `oc_extension` (
  `extension_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_extension`
--

INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES
(1, 'payment', 'cod'),
(2, 'total', 'shipping'),
(3, 'total', 'sub_total'),
(4, 'total', 'tax'),
(5, 'total', 'total'),
(6, 'module', 'banner'),
(7, 'module', 'carousel'),
(8, 'total', 'credit'),
(9, 'shipping', 'flat'),
(10, 'total', 'handling'),
(11, 'total', 'low_order_fee'),
(12, 'total', 'coupon'),
(13, 'module', 'category'),
(14, 'module', 'account'),
(15, 'total', 'reward'),
(16, 'total', 'voucher'),
(17, 'payment', 'free_checkout'),
(18, 'module', 'featured'),
(19, 'module', 'slideshow'),
(20, 'payment', 'pp_express'),
(22, 'module', 'pp_button'),
(24, 'payment', 'pp_standard'),
(27, 'captcha', 'google_captcha'),
(28, 'captcha', 'basic_captcha'),
(32, 'module', 'affiliate'),
(31, 'module', 'mta'),
(33, 'module', 'tracking_input'),
(34, 'total', 'tracking_discount'),
(35, 'module', 'coupon_for_tracking'),
(36, 'module', 'account_combine'),
(37, 'module', 'affiliate_payout');

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter`
--

CREATE TABLE IF NOT EXISTS `oc_filter` (
  `filter_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter_description`
--

CREATE TABLE IF NOT EXISTS `oc_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter_group`
--

CREATE TABLE IF NOT EXISTS `oc_filter_group` (
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter_group_description`
--

CREATE TABLE IF NOT EXISTS `oc_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_geo_zone`
--

CREATE TABLE IF NOT EXISTS `oc_geo_zone` (
  `geo_zone_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_modified` datetime NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_geo_zone`
--

INSERT INTO `oc_geo_zone` (`geo_zone_id`, `name`, `description`, `date_modified`, `date_added`) VALUES
(3, 'UK VAT Zone', 'UK VAT', '2010-02-26 22:33:24', '2009-01-06 23:26:25'),
(4, 'UK Shipping', 'UK Shipping Zones', '2010-12-15 15:18:13', '2009-06-23 01:14:53');

-- --------------------------------------------------------

--
-- Table structure for table `oc_information`
--

CREATE TABLE IF NOT EXISTS `oc_information` (
  `information_id` int(11) NOT NULL,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_information`
--

INSERT INTO `oc_information` (`information_id`, `bottom`, `sort_order`, `status`) VALUES
(3, 1, 3, 1),
(4, 1, 1, 1),
(5, 1, 4, 1),
(6, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_information_description`
--

CREATE TABLE IF NOT EXISTS `oc_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_information_description`
--

INSERT INTO `oc_information_description` (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(4, 2, 'About Us', '&lt;p&gt;&lt;a href=&quot;http://www.hydrotools.com/website/mission&quot; target=&quot;_blank&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;About US&lt;/span&gt;&lt;/a&gt;&lt;br&gt;&lt;/p&gt;\r\n', 'About US', 'We R - Rent, Resell &amp; Refurbish Heavy Duty Tools', ''),
(6, 2, 'Delivery Information', '&lt;p&gt;&lt;span style=&quot;line-height: 17.1428px;&quot;&gt;Some Products are only deliverable on restricted &amp;nbsp;territory. Hence please check the details on the product description itself. Taxes are extra and applicable upon the final destination.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;\r\n', 'Delivery Information', '', ''),
(3, 2, 'Privacy Policy', '&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;a href=&quot;http://www.hydrotools.com/downloables/HTC-Privacy-Policy-v20160115.pdf&quot; target=&quot;_blank&quot;&gt;Privacy Policy&lt;/a&gt;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;\r\n', 'Privacy Policy', 'Privacy Policy', 'Privacy Policy'),
(5, 2, 'Terms &amp; Conditions', '&lt;p&gt;&lt;a href=&quot;http://www.hydrotools.com/downloables/HTC-TC-eCommerce-v20160115.pdf&quot; target=&quot;_blank&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Terms &amp;amp; Conditions&lt;/span&gt;&lt;/a&gt;&lt;br&gt;&lt;/p&gt;\r\n', 'Terms &amp; Conditions', '', ''),
(4, 5, 'About Us', '&lt;p&gt;&lt;a href=&quot;http://www.hydrotools.com/website/mission&quot; target=&quot;_blank&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;About US&lt;/span&gt;&lt;/a&gt;&lt;br&gt;&lt;/p&gt;\r\n', 'About US', 'We R - Rent, Resell &amp; Refurbish Heavy Duty Tools', 'rent,resell,refurbush, heavy duty tools'),
(5, 5, 'Terms &amp; Conditions', '&lt;p&gt;&lt;a href=&quot;http://www.hydrotools.com/downloables/HTC-TC-eCommerce-v20160115.pdf&quot; target=&quot;_blank&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Terms &amp;amp; Conditions&lt;/span&gt;&lt;/a&gt;&lt;br&gt;&lt;/p&gt;\r\n', 'Terms &amp; Conditions', 'Terms &amp; Conditions', 'Terms &amp; Conditions'),
(3, 5, 'Privacy Policy', '&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;a href=&quot;http://www.hydrotools.com/downloables/HTC-Privacy-Policy-v20160115.pdf&quot; target=&quot;_blank&quot;&gt;Privacy Policy&lt;/a&gt;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;\r\n', 'Privacy Policy', 'Privacy Policy', 'Privacy Policy'),
(6, 5, 'Delivery Information', '&lt;p&gt;\r\n	\r\n	Some Products are only deliverable on restricted &amp;nbsp;territory. Hence \r\nplease check the details on the product description itself. Taxes are \r\nextra and applicable upon the final destination.&lt;/p&gt;\r\n', 'Delivery Information', 'Delivery Information', 'Delivery Information'),
(4, 6, 'About Us', '&lt;p&gt;&lt;a href=&quot;http://www.hydrotools.com/website/mission&quot; target=&quot;_blank&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;About US&lt;/span&gt;&lt;/a&gt;&lt;br&gt;&lt;/p&gt;\r\n', 'About US', 'We R - Rent, Resell &amp; Refurbish Heavy Duty Tools', 'rent,resell,refurbush, heavy duty tools'),
(5, 6, 'Terms &amp; Conditions', '&lt;p&gt;&lt;a href=&quot;http://www.hydrotools.com/downloables/HTC-TC-eCommerce-v20160115.pdf&quot; target=&quot;_blank&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Terms &amp;amp; Conditions&lt;/span&gt;&lt;/a&gt;&lt;br&gt;&lt;/p&gt;\r\n', 'Terms &amp; Conditions', 'Terms &amp; Conditions', 'Terms &amp; Conditions'),
(3, 6, 'Privacy Policy', '&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;a href=&quot;http://www.hydrotools.com/downloables/HTC-Privacy-Policy-v20160115.pdf&quot; target=&quot;_blank&quot;&gt;Privacy Policy&lt;/a&gt;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;\r\n', 'Privacy Policy', 'Privacy Policy', 'Privacy Policy'),
(6, 6, 'Delivery Information', '&lt;p&gt;\r\n	\r\n	Some Products are only deliverable on restricted &amp;nbsp;territory. Hence \r\nplease check the details on the product description itself. Taxes are \r\nextra and applicable upon the final destination.&lt;/p&gt;\r\n', 'Delivery Information', 'Delivery Information', 'Delivery Information');

-- --------------------------------------------------------

--
-- Table structure for table `oc_information_to_layout`
--

CREATE TABLE IF NOT EXISTS `oc_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_information_to_layout`
--

INSERT INTO `oc_information_to_layout` (`information_id`, `store_id`, `layout_id`) VALUES
(4, 0, 0),
(6, 0, 0),
(3, 0, 0),
(5, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_information_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_information_to_store`
--

INSERT INTO `oc_information_to_store` (`information_id`, `store_id`) VALUES
(3, 0),
(4, 0),
(5, 0),
(6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_language`
--

CREATE TABLE IF NOT EXISTS `oc_language` (
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_language`
--

INSERT INTO `oc_language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `sort_order`, `status`) VALUES
(6, 'English', 'en', 'en,en-us,en_us,en-US,english', 'ca.png', 'english', 1, 1),
(2, 'Le français', 'fr-CA', 'fr-ca, fr_ca, fr-CA,french', 'ca.png', 'fr-CA', 3, 1),
(5, 'Español', 'es-ES', 'es-ES,es_es,spanish, ', 'es.png', 'es-ES', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_layout`
--

CREATE TABLE IF NOT EXISTS `oc_layout` (
  `layout_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_layout`
--

INSERT INTO `oc_layout` (`layout_id`, `name`) VALUES
(1, 'Home'),
(2, 'Product'),
(3, 'Category'),
(4, 'Default'),
(5, 'Manufacturer'),
(6, 'Account'),
(7, 'Checkout'),
(8, 'Contact'),
(9, 'Sitemap'),
(10, 'Affiliate'),
(11, 'Information'),
(12, 'Compare'),
(13, 'Search');

-- --------------------------------------------------------

--
-- Table structure for table `oc_layout_module`
--

CREATE TABLE IF NOT EXISTS `oc_layout_module` (
  `layout_module_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `position` varchar(14) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_layout_module`
--

INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES
(2, 4, '0', 'content_top', 0),
(3, 4, '0', 'content_top', 1),
(20, 5, '0', 'column_left', 2),
(68, 6, 'account', 'column_right', 1),
(67, 1, 'carousel.29', 'content_top', 3),
(66, 1, 'slideshow.27', 'content_top', 1),
(65, 1, 'featured.28', 'content_top', 2),
(72, 3, 'category', 'column_left', 1),
(73, 3, 'banner.30', 'column_left', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oc_layout_route`
--

CREATE TABLE IF NOT EXISTS `oc_layout_route` (
  `layout_route_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(255) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_layout_route`
--

INSERT INTO `oc_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(38, 6, 0, 'account/%'),
(17, 10, 0, 'affiliate/%'),
(44, 3, 0, 'product/category'),
(42, 1, 0, 'common/home'),
(20, 2, 0, 'product/product'),
(24, 11, 0, 'information/information'),
(23, 7, 0, 'checkout/%'),
(31, 8, 0, 'information/contact'),
(32, 9, 0, 'information/sitemap'),
(34, 4, 0, ''),
(45, 5, 0, 'product/manufacturer'),
(52, 12, 0, 'product/compare'),
(53, 13, 0, 'product/search');

-- --------------------------------------------------------

--
-- Table structure for table `oc_length_class`
--

CREATE TABLE IF NOT EXISTS `oc_length_class` (
  `length_class_id` int(11) NOT NULL,
  `value` decimal(15,8) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_length_class`
--

INSERT INTO `oc_length_class` (`length_class_id`, `value`) VALUES
(1, 1.00000000),
(2, 10.00000000),
(3, 0.39370000);

-- --------------------------------------------------------

--
-- Table structure for table `oc_length_class_description`
--

CREATE TABLE IF NOT EXISTS `oc_length_class_description` (
  `length_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_length_class_description`
--

INSERT INTO `oc_length_class_description` (`length_class_id`, `language_id`, `title`, `unit`) VALUES
(2, 5, 'Millimeter', 'mm'),
(1, 5, 'Centimeter', 'cm'),
(1, 2, 'Centimeter', 'cm'),
(2, 2, 'Millimeter', 'mm'),
(3, 2, 'Inch', 'in'),
(2, 6, 'Millimeter', 'mm'),
(1, 6, 'Centimeter', 'cm'),
(3, 5, 'Inch', 'in'),
(3, 6, 'Inch', 'in');

-- --------------------------------------------------------

--
-- Table structure for table `oc_location`
--

CREATE TABLE IF NOT EXISTS `oc_location` (
  `location_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `geocode` varchar(32) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `open` text NOT NULL,
  `comment` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_manufacturer`
--

CREATE TABLE IF NOT EXISTS `oc_manufacturer` (
  `manufacturer_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_manufacturer`
--

INSERT INTO `oc_manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`) VALUES
(11, 'Group Six Tecnologies Inc', 'catalog/groupsix-2.png', 0),
(12, 'Howden', 'catalog/howden200x100.jpg', 9),
(13, 'Hydro Tools Corporation', 'catalog/HTC160x135.png', 0),
(14, 'parker hydraulic', 'catalog/parker_hydraulics.jpg', 0),
(15, 'Stanley Hydraulic', 'catalog/stanley_hydraulics.jpg', 0),
(16, 'Trico', 'catalog/trico-corp-300x225.png', 0),
(17, 'Xceed Machine Works Inc', 'catalog/xceed_logo.png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_manufacturer_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_manufacturer_to_store`
--

INSERT INTO `oc_manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES
(11, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_marketing`
--

CREATE TABLE IF NOT EXISTS `oc_marketing` (
  `marketing_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `code` varchar(64) NOT NULL,
  `clicks` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_modification`
--

CREATE TABLE IF NOT EXISTS `oc_modification` (
  `modification_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `author` varchar(64) NOT NULL,
  `version` varchar(32) NOT NULL,
  `link` varchar(255) NOT NULL,
  `xml` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_modification`
--

INSERT INTO `oc_modification` (`modification_id`, `name`, `code`, `author`, `version`, `link`, `xml`, `status`, `date_added`) VALUES
(1, 'Ask for Price with Disabled Button v2.1.0.1', 'Ask for Price with Disabled Button v2.1.0.1', 'GoGo OpenCart', '', '', '<modification>\n	<id><![CDATA[Ask for Price with Disabled Button v2.1.0.1]]></id>\n	<version><![CDATA[]]></version>\n	<vqmver><![CDATA[]]></vqmver>\n	<author><![CDATA[GoGo OpenCart]]></author>\n	<file name="catalog/view/theme/*/template/module/bestseller.tpl">\n		<operation>\n			<search position="replace" index="1"><![CDATA[<?php echo $product[''price'']; ?>]]></search>\n			<add><![CDATA[<?php if ($product[''zero_price''] <= 0) { ?><a href="<?php echo $product[''href''] . ''#tab-askquestion''; ?>" style="text-decoration: none !important;"><img src="image/ask_for_price.png" align="absmiddle" /> <?php echo $text_zero_price; ?></a><?php } else { ?><?php echo $product[''price'']; ?><?php } ?>]]></add>\n		</operation>\n		<operation>\n			<search position="replace"><![CDATA[<?php if ($product[''tax'']) { ?>]]></search>\n			<add><![CDATA[<?php if (($product[''tax'']) && ($product[''zero_price''] > 0)) { ?>]]></add>\n		</operation>\n		<operation>\n			<search position="replace"><![CDATA[<button type="button" onclick="cart.add(''<?php echo $product[''product_id'']; ?>'');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>]]></search>\n			<add><![CDATA[<?php if ($product[''zero_price''] <= 0) { ?>\n<button type="button" style="cursor: default !important; background: gray !important; color: lightgray !important;"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>\n<?php } else { ?>\n<button type="button" onclick="cart.add(''<?php echo $product[''product_id'']; ?>'');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>\n<?php } ?>]]></add>\n		</operation>\n	</file>\n	<file name="catalog/controller/module/bestseller.php">\n		<operation>\n			<search position="after"><![CDATA[$data[''button_cart''] = $this->language->get(''button_cart'');]]></search>\n			<add><![CDATA[		$data[''text_zero_price''] = $this->language->get(''text_zero_price'');]]></add>\n		</operation>\n		<operation>\n			<search position="after" offset="2"><![CDATA[$price = false;]]></search>\n			<add><![CDATA[				if ((float)$result[''price'']) {\n					$zero_price = $result[''price''];\n				} else {\n					$zero_price = false;\n				}]]></add>\n		</operation>\n		<operation>\n			<search position="after"><![CDATA[''price''       => $price,]]></search>\n			<add><![CDATA[					''zero_price''  => $zero_price,]]></add>\n		</operation>\n	</file>\n	<file name="catalog/view/theme/*/template/module/featured.tpl">\n		<operation>\n			<search position="replace" index="1"><![CDATA[<?php echo $product[''price'']; ?>]]></search>\n			<add><![CDATA[<?php if ($product[''zero_price''] <= 0) { ?><a href="<?php echo $product[''href''] . ''#tab-askquestion''; ?>" style="text-decoration: none !important;"><img src="image/ask_for_price.png" align="absmiddle" /> <?php echo $text_zero_price; ?></a><?php } else { ?><?php echo $product[''price'']; ?><?php } ?>]]></add>\n		</operation>\n		<operation>\n			<search position="replace"><![CDATA[<?php if ($product[''tax'']) { ?>]]></search>\n			<add><![CDATA[<?php if (($product[''tax'']) && ($product[''zero_price''] > 0)) { ?>]]></add>\n		</operation>\n		<operation>\n			<search position="replace"><![CDATA[<button type="button" onclick="cart.add(''<?php echo $product[''product_id'']; ?>'');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>]]></search>\n			<add><![CDATA[<?php if ($product[''zero_price''] <= 0) { ?>\n<button type="button" style="cursor: default !important; background: gray !important; color: lightgray !important;"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>\n<?php } else { ?>\n<button type="button" onclick="cart.add(''<?php echo $product[''product_id'']; ?>'');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>\n<?php } ?>]]></add>\n		</operation>\n	</file>\n	<file name="catalog/controller/module/featured.php">\n		<operation>\n			<search position="after"><![CDATA[$data[''button_cart''] = $this->language->get(''button_cart'');]]></search>\n			<add><![CDATA[		$data[''text_zero_price''] = $this->language->get(''text_zero_price'');]]></add>\n		</operation>\n		<operation>\n			<search position="after" offset="2"><![CDATA[$price = false;]]></search>\n			<add><![CDATA[				if ((float)$product_info[''price'']) {\n					$zero_price = $product_info[''price''];\n				} else {\n					$zero_price = false;\n				}]]></add>\n		</operation>\n		<operation>\n			<search position="after"><![CDATA[''price''       => $price,]]></search>\n			<add><![CDATA[					''zero_price''  => $zero_price,]]></add>\n		</operation>\n	</file>\n	<file name="catalog/view/theme/*/template/module/latest.tpl">\n		<operation>\n			<search position="replace" index="1"><![CDATA[<?php echo $product[''price'']; ?>]]></search>\n			<add><![CDATA[<?php if ($product[''zero_price''] <= 0) { ?><a href="<?php echo $product[''href''] . ''#tab-askquestion''; ?>" style="text-decoration: none !important;"><img src="image/ask_for_price.png" align="absmiddle" /> <?php echo $text_zero_price; ?></a><?php } else { ?><?php echo $product[''price'']; ?><?php } ?>]]></add>\n		</operation>\n		<operation>\n			<search position="replace"><![CDATA[<?php if ($product[''tax'']) { ?>]]></search>\n			<add><![CDATA[<?php if (($product[''tax'']) && ($product[''zero_price''] > 0)) { ?>]]></add>\n		</operation>\n		<operation>\n			<search position="replace"><![CDATA[<button type="button" onclick="cart.add(''<?php echo $product[''product_id'']; ?>'');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>]]></search>\n			<add><![CDATA[<?php if ($product[''zero_price''] <= 0) { ?>\n<button type="button" style="cursor: default !important; background: gray !important; color: lightgray !important;"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>\n<?php } else { ?>\n<button type="button" onclick="cart.add(''<?php echo $product[''product_id'']; ?>'');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>\n<?php } ?>]]></add>\n		</operation>\n	</file>\n	<file name="catalog/controller/module/latest.php">\n		<operation>\n			<search position="after"><![CDATA[$data[''button_cart''] = $this->language->get(''button_cart'');]]></search>\n			<add><![CDATA[		$data[''text_zero_price''] = $this->language->get(''text_zero_price'');]]></add>\n		</operation>\n		<operation>\n			<search position="after" offset="2"><![CDATA[$price = false;]]></search>\n			<add><![CDATA[				if ((float)$result[''price'']) {\n					$zero_price = $result[''price''];\n				} else {\n					$zero_price = false;\n				}]]></add>\n		</operation>\n		<operation>\n			<search position="after"><![CDATA[''price''       => $price,]]></search>\n			<add><![CDATA[					''zero_price''  => $zero_price,]]></add>\n		</operation>\n	</file>\n	<file name="catalog/view/theme/*/template/module/special.tpl">\n		<operation>\n			<search position="replace" index="1"><![CDATA[<?php echo $product[''price'']; ?>]]></search>\n			<add><![CDATA[<?php if ($product[''zero_price''] <= 0) { ?><a href="<?php echo $product[''href''] . ''#tab-askquestion''; ?>" style="text-decoration: none !important;"><img src="image/ask_for_price.png" align="absmiddle" /> <?php echo $text_zero_price; ?></a><?php } else { ?><?php echo $product[''price'']; ?><?php } ?>]]></add>\n		</operation>\n		<operation>\n			<search position="replace"><![CDATA[<?php if ($product[''tax'']) { ?>]]></search>\n			<add><![CDATA[<?php if (($product[''tax'']) && ($product[''zero_price''] > 0)) { ?>]]></add>\n		</operation>\n		<operation>\n			<search position="replace"><![CDATA[<button type="button" onclick="cart.add(''<?php echo $product[''product_id'']; ?>'');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>]]></search>\n			<add><![CDATA[<?php if ($product[''zero_price''] <= 0) { ?>\n<button type="button" style="cursor: default !important; background: gray !important; color: lightgray !important;"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>\n<?php } else { ?>\n<button type="button" onclick="cart.add(''<?php echo $product[''product_id'']; ?>'');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>\n<?php } ?>]]></add>\n		</operation>\n	</file>\n	<file name="catalog/controller/module/special.php">\n		<operation>\n			<search position="after"><![CDATA[$data[''button_cart''] = $this->language->get(''button_cart'');]]></search>\n			<add><![CDATA[		$data[''text_zero_price''] = $this->language->get(''text_zero_price'');]]></add>\n		</operation>\n		<operation>\n			<search position="after" offset="2"><![CDATA[$price = false;]]></search>\n			<add><![CDATA[				if ((float)$result[''price'']) {\n					$zero_price = $result[''price''];\n				} else {\n					$zero_price = false;\n				}]]></add>\n		</operation>\n		<operation>\n			<search position="after"><![CDATA[''price''       => $price,]]></search>\n			<add><![CDATA[					''zero_price''  => $zero_price,]]></add>\n		</operation>\n	</file>\n	<file name="catalog/view/theme/*/template/product/category.tpl">\n		<operation>\n			<search position="replace" index="1"><![CDATA[<?php echo $product[''price'']; ?>]]></search>\n			<add><![CDATA[<?php if ($product[''zero_price''] <= 0) { ?><a href="<?php echo $product[''href''] . ''#tab-askquestion''; ?>" style="text-decoration: none !important;"><img src="image/ask_for_price.png" align="absmiddle" /> <?php echo $text_zero_price; ?></a><?php } else { ?><?php echo $product[''price'']; ?><?php } ?>]]></add>\n		</operation>\n		<operation>\n			<search position="replace"><![CDATA[<?php if ($product[''tax'']) { ?>]]></search>\n			<add><![CDATA[<?php if (($product[''tax'']) && ($product[''zero_price''] > 0)) { ?>]]></add>\n		</operation>\n		<operation>\n			<search position="replace"><![CDATA[<button type="button" onclick="cart.add(''<?php echo $product[''product_id'']; ?>'', ''<?php echo $product[''minimum'']; ?>'');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>]]></search>\n			<add><![CDATA[<?php if ($product[''zero_price''] <= 0) { ?>\n<button type="button" style="cursor: default !important; background: gray !important; color: lightgray !important;"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>\n<?php } else { ?>\n<button type="button" onclick="cart.add(''<?php echo $product[''product_id'']; ?>'', ''<?php echo $product[''minimum'']; ?>'');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>\n<?php } ?>]]></add>\n		</operation>\n	</file>\n	<file name="catalog/controller/product/category.php">\n		<operation>\n			<search position="after"><![CDATA[$data[''button_cart''] = $this->language->get(''button_cart'');]]></search>\n			<add><![CDATA[			$data[''text_zero_price''] = $this->language->get(''text_zero_price'');]]></add>\n		</operation>\n		<operation>\n			<search position="after" offset="2"><![CDATA[$price = false;]]></search>\n			<add><![CDATA[				if ((float)$result[''price'']) {\n					$zero_price = $result[''price''];\n				} else {\n					$zero_price = false;\n				}]]></add>\n		</operation>\n		<operation>\n			<search position="after"><![CDATA[''price''       => $price,]]></search>\n			<add><![CDATA[					''zero_price''  => $zero_price,]]></add>\n		</operation>\n	</file>\n	<file name="catalog/view/theme/*/template/product/manufacturer_info.tpl">\n		<operation>\n			<search position="replace" index="1"><![CDATA[<?php echo $product[''price'']; ?>]]></search>\n			<add><![CDATA[<?php if ($product[''zero_price''] <= 0) { ?><a href="<?php echo $product[''href''] . ''#tab-askquestion''; ?>" style="text-decoration: none !important;"><img src="image/ask_for_price.png" align="absmiddle" /> <?php echo $text_zero_price; ?></a><?php } else { ?><?php echo $product[''price'']; ?><?php } ?>]]></add>\n		</operation>\n		<operation>\n			<search position="replace"><![CDATA[<?php if ($product[''tax'']) { ?>]]></search>\n			<add><![CDATA[<?php if (($product[''tax'']) && ($product[''zero_price''] > 0)) { ?>]]></add>\n		</operation>\n		<operation>\n			<search position="replace"><![CDATA[<button type="button" onclick="cart.add(''<?php echo $product[''product_id'']; ?>'', ''<?php echo $product[''minimum'']; ?>'');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>]]></search>\n			<add><![CDATA[<?php if ($product[''zero_price''] <= 0) { ?>\n<button type="button" style="cursor: default !important; background: gray !important; color: lightgray !important;"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>\n<?php } else { ?>\n<button type="button" onclick="cart.add(''<?php echo $product[''product_id'']; ?>'', ''<?php echo $product[''minimum'']; ?>'');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>\n<?php } ?>]]></add>\n		</operation>\n	</file>\n	<file name="catalog/controller/product/manufacturer.php">\n		<operation>\n			<search position="after"><![CDATA[$data[''button_cart''] = $this->language->get(''button_cart'');]]></search>\n			<add><![CDATA[			$data[''text_zero_price''] = $this->language->get(''text_zero_price'');]]></add>\n		</operation>\n		<operation>\n			<search position="after" offset="2"><![CDATA[$price = false;]]></search>\n			<add><![CDATA[				if ((float)$result[''price'']) {\n					$zero_price = $result[''price''];\n				} else {\n					$zero_price = false;\n				}]]></add>\n		</operation>\n		<operation>\n			<search position="after"><![CDATA[''price''       => $price,]]></search>\n			<add><![CDATA[					''zero_price''  => $zero_price,]]></add>\n		</operation>\n	</file>\n	<file name="catalog/view/theme/*/template/product/search.tpl">\n		<operation>\n			<search position="replace" index="1"><![CDATA[<?php echo $product[''price'']; ?>]]></search>\n			<add><![CDATA[<?php if ($product[''zero_price''] <= 0) { ?><a href="<?php echo $product[''href''] . ''#tab-askquestion''; ?>" style="text-decoration: none !important;"><img src="image/ask_for_price.png" align="absmiddle" /> <?php echo $text_zero_price; ?></a><?php } else { ?><?php echo $product[''price'']; ?><?php } ?>]]></add>\n		</operation>\n		<operation>\n			<search position="replace"><![CDATA[<?php if ($product[''tax'']) { ?>]]></search>\n			<add><![CDATA[<?php if (($product[''tax'']) && ($product[''zero_price''] > 0)) { ?>]]></add>\n		</operation>\n		<operation>\n			<search position="replace"><![CDATA[<button type="button" onclick="cart.add(''<?php echo $product[''product_id'']; ?>'', ''<?php echo $product[''minimum'']; ?>'');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>]]></search>\n			<add><![CDATA[<?php if ($product[''zero_price''] <= 0) { ?>\n<button type="button" style="cursor: default !important; background: gray !important; color: lightgray !important;"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>\n<?php } else { ?>\n<button type="button" onclick="cart.add(''<?php echo $product[''product_id'']; ?>'', ''<?php echo $product[''minimum'']; ?>'');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>\n<?php } ?>]]></add>\n		</operation>\n	</file>\n	<file name="catalog/controller/product/search.php">\n		<operation>\n			<search position="after"><![CDATA[$data[''button_cart''] = $this->language->get(''button_cart'');]]></search>\n			<add><![CDATA[		$data[''text_zero_price''] = $this->language->get(''text_zero_price'');]]></add>\n		</operation>\n		<operation>\n			<search position="after" offset="2"><![CDATA[$price = false;]]></search>\n			<add><![CDATA[				if ((float)$result[''price'']) {\n					$zero_price = $result[''price''];\n				} else {\n					$zero_price = false;\n				}]]></add>\n		</operation>\n		<operation>\n			<search position="after"><![CDATA[''price''       => $price,]]></search>\n			<add><![CDATA[					''zero_price''  => $zero_price,]]></add>\n		</operation>\n	</file>\n	<file name="catalog/view/theme/*/template/product/special.tpl">\n		<operation>\n			<search position="replace" index="1"><![CDATA[<?php echo $product[''price'']; ?>]]></search>\n			<add><![CDATA[<?php if ($product[''zero_price''] <= 0) { ?><a href="<?php echo $product[''href''] . ''#tab-askquestion''; ?>" style="text-decoration: none !important;"><img src="image/ask_for_price.png" align="absmiddle" /> <?php echo $text_zero_price; ?></a><?php } else { ?><?php echo $product[''price'']; ?><?php } ?>]]></add>\n		</operation>\n		<operation>\n			<search position="replace"><![CDATA[<?php if ($product[''tax'']) { ?>]]></search>\n			<add><![CDATA[<?php if (($product[''tax'']) && ($product[''zero_price''] > 0)) { ?>]]></add>\n		</operation>\n		<operation>\n			<search position="replace"><![CDATA[<button type="button" onclick="cart.add(''<?php echo $product[''product_id'']; ?>'', ''<?php echo $product[''minimum'']; ?>'');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>]]></search>\n			<add><![CDATA[<?php if ($product[''zero_price''] <= 0) { ?>\n<button type="button" style="cursor: default !important; background: gray !important; color: lightgray !important;"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>\n<?php } else { ?>\n<button type="button" onclick="cart.add(''<?php echo $product[''product_id'']; ?>'', ''<?php echo $product[''minimum'']; ?>'');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>\n<?php } ?>]]></add>\n		</operation>\n	</file>\n	<file name="catalog/controller/product/special.php">\n		<operation>\n			<search position="after"><![CDATA[$data[''button_cart''] = $this->language->get(''button_cart'');]]></search>\n			<add><![CDATA[		$data[''text_zero_price''] = $this->language->get(''text_zero_price'');]]></add>\n		</operation>\n		<operation>\n			<search position="after" offset="2"><![CDATA[$price = false;]]></search>\n			<add><![CDATA[			if ((float)$result[''price'']) {\n				$zero_price = $result[''price''];\n			} else {\n				$zero_price = false;\n			}]]></add>\n		</operation>\n		<operation>\n			<search position="after"><![CDATA[''price''       => $price,]]></search>\n			<add><![CDATA[				''zero_price''  => $zero_price,]]></add>\n		</operation>\n	</file>\n	<file name="catalog/view/theme/*/template/account/wishlist.tpl">\n		<operation>\n			<search position="replace" index="1"><![CDATA[<?php echo $product[''price'']; ?>]]></search>\n			<add><![CDATA[<?php if ($product[''zero_price''] <= 0) { ?><a href="<?php echo $product[''href''] . ''#tab-askquestion''; ?>" style="text-decoration: none !important;"><img src="image/ask_for_price.png" align="absmiddle" /> <?php echo $text_zero_price; ?></a><?php } else { ?><?php echo $product[''price'']; ?><?php } ?>]]></add>\n		</operation>\n		<operation>\n			<search position="replace"><![CDATA[<button type="button" onclick="cart.add(''<?php echo $product[''product_id'']; ?>'');" data-toggle="tooltip" title="<?php echo $button_cart; ?>" class="btn btn-primary"><i class="fa fa-shopping-cart"></i></button>]]></search>\n			<add><![CDATA[<?php if ($product[''zero_price''] <= 0) { ?>\n<button type="button" data-toggle="tooltip" title="<?php echo $button_cart; ?>" class="btn btn-primary" style="cursor: default !important; background: gray !important; color: lightgray !important;"><i class="fa fa-shopping-cart"></i></button>\n<?php } else { ?>\n<button type="button" onclick="cart.add(''<?php echo $product[''product_id'']; ?>'');" data-toggle="tooltip" title="<?php echo $button_cart; ?>" class="btn btn-primary"><i class="fa fa-shopping-cart"></i></button>\n<?php } ?>]]></add>\n		</operation>\n	</file>\n	<file name="catalog/controller/account/wishlist.php">\n		<operation>\n			<search position="after"><![CDATA[$data[''button_cart''] = $this->language->get(''button_cart'');]]></search>\n			<add><![CDATA[		$data[''text_zero_price''] = $this->language->get(''text_zero_price'');]]></add>\n		</operation>\n		<operation>\n			<search position="after" offset="2"><![CDATA[$price = false;]]></search>\n			<add><![CDATA[				if ((float)$product_info[''price'']) {\n					$zero_price = $product_info[''price''];\n				} else {\n					$zero_price = false;\n				}]]></add>\n		</operation>\n		<operation>\n			<search position="after"><![CDATA[''price''      => $price,]]></search>\n			<add><![CDATA[					''zero_price'' => $zero_price,]]></add>\n		</operation>\n	</file>\n	<file name="catalog/view/theme/*/template/product/compare.tpl">\n		<operation>\n			<search position="replace" index="1"><![CDATA[<?php echo $product[''price'']; ?>]]></search>\n			<add><![CDATA[<?php if ($product[''zero_price''] <= 0) { ?><a href="<?php echo $product[''href''] . ''#tab-askquestion''; ?>" style="text-decoration: none !important;"><img src="image/ask_for_price.png" align="absmiddle" /> <?php echo $text_zero_price; ?></a><?php } else { ?><?php echo $product[''price'']; ?><?php } ?>]]></add>\n		</operation>\n		<operation>\n			<search position="replace"><![CDATA[<input type="button" value="<?php echo $button_cart; ?>" class="btn btn-primary btn-block" onclick="cart.add(''<?php echo $product[''product_id'']; ?>'', ''<?php echo $product[''minimum'']; ?>'');" />]]></search>\n			<add><![CDATA[<?php if ($product[''zero_price''] <= 0) { ?>\n<input type="button" value="<?php echo $button_cart; ?>" class="btn btn-primary btn-block" style="cursor: default !important; background: gray !important; color: lightgray !important;" />\n<?php } else { ?>\n<input type="button" value="<?php echo $button_cart; ?>" class="btn btn-primary btn-block" onclick="cart.add(''<?php echo $product[''product_id'']; ?>'', ''<?php echo $product[''minimum'']; ?>'');" />\n<?php } ?>]]></add>\n		</operation>\n	</file>\n	<file name="catalog/controller/product/compare.php">\n		<operation>\n			<search position="after"><![CDATA[$data[''button_cart''] = $this->language->get(''button_cart'');]]></search>\n			<add><![CDATA[		$data[''text_zero_price''] = $this->language->get(''text_zero_price'');]]></add>\n		</operation>\n		<operation>\n			<search position="after" offset="2"><![CDATA[$price = false;]]></search>\n			<add><![CDATA[				if ((float)$product_info[''price'']) {\n					$zero_price = $product_info[''price''];\n				} else {\n					$zero_price = false;\n				}]]></add>\n		</operation>\n		<operation>\n			<search position="after"><![CDATA[''price''        => $price,]]></search>\n			<add><![CDATA[					''zero_price''   => $zero_price,]]></add>\n		</operation>\n	</file>\n	<file name="catalog/view/theme/*/template/product/product.tpl">\n		<operation>\n			<search position="replace" index="1"><![CDATA[<?php echo $price; ?>]]></search>\n			<add><![CDATA[<?php if ($zero_price <= 0) { ?><a onclick="$(''a[href=\\''#tab-askquestion\\'']'').trigger(''click''); return false;" style="text-decoration: none !important; cursor: pointer !important;"><img src="image/ask_for_price.png" align="absmiddle" /> <?php echo $text_zero_price; ?></a><?php } else { ?><?php echo $price; ?><?php } ?>]]></add>\n		</operation>\n		<operation>\n			<search position="replace"><![CDATA[<?php if ($tax) { ?>]]></search>\n			<add><![CDATA[<?php if (($tax) && ($zero_price > 0)) { ?>]]></add>\n		</operation>\n		<operation>\n			<search position="replace"><![CDATA[<button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary btn-lg btn-block"><?php echo $button_cart; ?></button>]]></search>\n			<add><![CDATA[<?php if ($zero_price <= 0) { ?>\n<button type="button" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary btn-lg btn-block" style="cursor: default !important; background: gray !important; color: lightgray !important;"><?php echo $button_cart; ?></button>\n<?php } else { ?>\n<button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary btn-lg btn-block"><?php echo $button_cart; ?></button>\n<?php } ?>]]></add>\n		</operation>\n		<operation>\n			<search position="replace" index="1"><![CDATA[<?php echo $product[''price'']; ?>]]></search>\n			<add><![CDATA[<?php if ($product[''zero_price''] <= 0) { ?><a href="<?php echo $product[''href''] . ''#tab-askquestion''; ?>" style="text-decoration: none !important;"><img src="image/ask_for_price.png" align="absmiddle" /> <?php echo $text_zero_price; ?></a><?php } else { ?><?php echo $product[''price'']; ?><?php } ?>]]></add>\n		</operation>\n		<operation>\n			<search position="replace"><![CDATA[<?php if ($product[''tax'']) { ?>]]></search>\n			<add><![CDATA[<?php if (($product[''tax'']) && ($product[''zero_price''] > 0)) { ?>]]></add>\n		</operation>\n		<operation>\n			<search position="replace"><![CDATA[<button type="button" onclick="cart.add(''<?php echo $product[''product_id'']; ?>'', ''<?php echo $product[''minimum'']; ?>'');"><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span> <i class="fa fa-shopping-cart"></i></button>]]></search>\n			<add><![CDATA[<?php if ($product[''zero_price''] <= 0) { ?>\n<button type="button" style="cursor: default !important; background: gray !important; color: lightgray !important;"><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span> <i class="fa fa-shopping-cart"></i></button>\n<?php } else { ?>\n<button type="button" onclick="cart.add(''<?php echo $product[''product_id'']; ?>'', ''<?php echo $product[''minimum'']; ?>'');"><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span> <i class="fa fa-shopping-cart"></i></button>\n<?php } ?>]]></add>\n		</operation>\n		<operation>\n			<search position="after" offset="1"><![CDATA[<li><a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a></li>]]></search>\n			<add><![CDATA[            <li><a href="#tab-askquestion" class="scroll" data-toggle="tab"><?php echo $tab_question; ?></a></li>]]></add>\n		</operation>\n		<operation>\n			<search position="replace"><![CDATA[<?php echo $captcha; ?>]]></search>\n			<add><![CDATA[<?php echo $captcha1; ?>]]></add>\n		</operation>\n		<operation>\n			<search position="after" offset="4"><![CDATA[<?php echo $text_login; ?>]]></search>\n			<add><![CDATA[            <a href="#tab-askquestion" class="scroll"></a><div class="tab-pane" id="tab-askquestion">\n              <form class="form-horizontal" id="form-askquestion">\n                <div id="askquestion"></div>\n                <h2><?php echo $text_ask; ?> <?php echo $heading_title; ?>?</h2>\n                <div class="form-group required">\n                  <div class="col-sm-12">\n                    <label class="control-label" for="input-name1"><?php echo $entry_name_ask; ?></label>\n                    <input type="text" name="name1" value="<?php echo $name1; ?>" id="input-name1" class="form-control" />\n                  </div>\n                </div>\n                <div class="form-group required">\n                  <div class="col-sm-12">\n                    <label class="control-label" for="input-email1"><?php echo $entry_email_ask; ?></label>\n                    <input type="text" name="email1" value="<?php echo $email1; ?>" id="input-email1" class="form-control" />\n                  </div>\n                </div>\n                <div class="form-group required">\n                  <div class="col-sm-12">\n                    <label class="control-label" for="input-text1"><?php echo $entry_question_ask; ?></label>\n                    <textarea name="text1" rows="5" id="input-text1" class="form-control"></textarea>\n                  </div>\n                </div>\n                <?php echo $captcha2; ?>\n                <div class="buttons clearfix">\n                  <div class="pull-right">\n                    <button type="button" id="button-askquestion" data-loading-text="<?php echo $entry_sending_ask; ?>" class="btn btn-primary"><?php echo $entry_send_ask; ?></button>\n                  </div>\n                </div>\n              </form>\n            </div>]]></add>\n		</operation>\n		<operation>\n			<search position="before"><![CDATA[<?php echo $footer; ?>]]></search>\n			<add><![CDATA[<script type="text/javascript"><!--\n$(''#button-askquestion'').on(''click'', function() {\n	$.ajax({\n		url: ''index.php?route=product/product/write1&product_id=<?php echo $product_id; ?>'',\n		type: ''post'',\n		dataType: ''json'',\n		data: $("#form-askquestion").serialize(),\n		beforeSend: function() {\n			$(''#button-askquestion'').button(''loading'');\n		},\n		complete: function() {\n			$(''#button-askquestion'').button(''reset'');\n		},\n		success: function(json) {\n			$(''.alert-success, .alert-danger'').remove();\n\n			if (json[''error'']) {\n				$(''#askquestion'').after(''<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> '' + json[''error''] + ''</div>'');\n			}\n\n			if (json[''success'']) {\n				$(''#askquestion'').after(''<div class="alert alert-success"><i class="fa fa-check-circle"></i> '' + json[''success''] + ''</div>'');\n\n				$(''input[name=\\''name1\\'']'').val('''');\n				$(''input[name=\\''email1\\'']'').val('''');\n				$(''textarea[name=\\''text1\\'']'').val('''');\n			}\n		}\n	});\n});\n//--></script>\n<script type="text/javascript"><!--\n	$(window).load(function ()\n	{\n    if(window.location.hash.length > 1) {\n        $(''a[href="#tab-askquestion"]'').click();\n    }\n	});\n//--></script>\n<script type="text/javascript"><!--\njQuery(document).ready(function($) {\n	$(".scroll").click(function(event){		\n		event.preventDefault();\n		$(''html,body'').animate({scrollTop:$(this.hash).offset().top}, 1000);\n	});\n});\n\n//--></script>]]></add>\n		</operation>\n	</file>\n	<file name="catalog/controller/product/product.php">\n		<operation>\n			<search position="after"><![CDATA[$data[''button_cart''] = $this->language->get(''button_cart'');]]></search>\n			<add><![CDATA[			$data[''text_zero_price''] = $this->language->get(''text_zero_price'');\n			$data[''tab_question''] = $this->language->get(''tab_question'');\n			$data[''text_ask''] = $this->language->get(''text_ask'');\n			$data[''entry_name_ask''] = $this->language->get(''entry_name_ask'');\n			$data[''entry_email_ask''] = $this->language->get(''entry_email_ask'');\n			$data[''entry_question_ask''] = $this->language->get(''entry_question_ask'');\n			$data[''entry_send_ask''] = $this->language->get(''entry_send_ask'');\n			$data[''entry_sending_ask''] = $this->language->get(''entry_sending_ask'');]]></add>\n		</operation>\n		<operation>\n			<search position="before"><![CDATA[if ($product_info[''quantity''] <= 0) {]]></search>\n			<add><![CDATA[			if (isset($this->request->post[''name1''])) {\n				$data[''name1''] = $this->request->post[''name1''];\n			} else {\n				$data[''name1''] = $this->customer->getFirstName();\n			}\n\n			if (isset($this->request->post[''email1''])) {\n				$data[''email1''] = $this->request->post[''email1''];\n			} else {\n				$data[''email1''] = $this->customer->getEmail();\n			}]]></add>\n		</operation>\n		<operation>\n			<search position="after" offset="2"><![CDATA[$data[''price''] = false;]]></search>\n			<add><![CDATA[			if ((float)$product_info[''price'']) {\n				$data[''zero_price''] = $product_info[''price''];\n			} else {\n				$data[''zero_price''] = false;\n			}]]></add>\n		</operation>\n		<operation>\n			<search position="replace" index="1" offset="5"><![CDATA[// Captcha]]></search>\n			<add><![CDATA[			// Captcha1\n			if ($this->config->get($this->config->get(''config_captcha'') . ''_status'') && in_array(''review'', (array)$this->config->get(''config_captcha_page''))) {\n				$data[''captcha1''] = $this->load->controller(''captcha1/'' . $this->config->get(''config_captcha''));\n			} else {\n				$data[''captcha1''] = '''';\n			}]]></add>\n		</operation>\n		<operation>\n			<search position="before"><![CDATA[$data[''attribute_groups''] = $this->model_catalog_product->getProductAttributes($this->request->get[''product_id'']);]]></search>\n			<add><![CDATA[			// Captcha2\n			if ($this->config->get($this->config->get(''config_captcha'') . ''_status'') && in_array(''askaquestion'', (array)$this->config->get(''config_captcha_page''))) {\n				$data[''captcha2''] = $this->load->controller(''captcha2/'' . $this->config->get(''config_captcha''));\n			} else {\n				$data[''captcha2''] = '''';\n			}]]></add>\n		</operation>\n		<operation>\n			<search position="after" offset="2" index="2"><![CDATA[$price = false;]]></search>\n			<add><![CDATA[				if ((float)$result[''price'']) {\n					$zero_price = $result[''price''];\n				} else {\n					$zero_price = false;\n				}]]></add>\n		</operation>\n		<operation>\n			<search position="after"><![CDATA[''price''       => $price,]]></search>\n			<add><![CDATA[					''zero_price''  => $zero_price,]]></add>\n		</operation>\n		<operation>\n			<search position="replace" index="3" offset="7"><![CDATA[// Captcha]]></search>\n			<add><![CDATA[			// Captcha1\n			if ($this->config->get($this->config->get(''config_captcha'') . ''_status'') && in_array(''review'', (array)$this->config->get(''config_captcha_page''))) {\n				$captcha1 = $this->load->controller(''captcha1/'' . $this->config->get(''config_captcha'') . ''/validate'');\n\n				if ($captcha1) {\n					$json[''error''] = $captcha1;\n				}\n			}]]></add>\n		</operation>\n		<operation>\n			<search position="before"><![CDATA[public function getRecurringDescription() {]]></search>\n			<add><![CDATA[	public function write1() {\n		$this->load->language(''product/product'');\n\n		$json = array();\n\n		if ($this->request->server[''REQUEST_METHOD''] == ''POST'') {\n			if ((utf8_strlen($this->request->post[''name1'']) < 3) || (utf8_strlen($this->request->post[''name1'']) > 25)) {\n				$json[''error''] = $this->language->get(''error_name_ask'');\n			}\n			\n			if (!preg_match(''/^[^\\@]+@.*\\.[a-z]{2,15}$/i'', $this->request->post[''email1''])) {\n				$json[''error''] = $this->language->get(''error_email_ask'');\n			}\n\n			if ((utf8_strlen($this->request->post[''text1'']) < 25) || (utf8_strlen($this->request->post[''text1'']) > 1000)) {\n				$json[''error''] = $this->language->get(''error_question_ask'');\n			}\n\n			// Captcha2\n			if ($this->config->get($this->config->get(''config_captcha'') . ''_status'') && in_array(''askaquestion'', (array)$this->config->get(''config_captcha_page''))) {\n				$captcha2 = $this->load->controller(''captcha2/'' . $this->config->get(''config_captcha'') . ''/validate'');\n\n				if ($captcha2) {\n					$json[''error''] = $captcha2;\n				}\n			}\n\n			if (!isset($json[''error''])) {\n				$this->load->model(''catalog/askquestion'');\n\n				$this->model_catalog_askquestion->addAskquestion($this->request->get[''product_id''], $this->request->post);\n\n				$json[''success''] = $this->language->get(''text_success_ask'');\n			}\n		}\n\n		$this->response->addHeader(''Content-Type: application/json'');\n		$this->response->setOutput(json_encode($json));\n	}]]></add>\n		</operation>\n	</file>\n	<file name="admin/controller/setting/setting.php">\n		<operation>\n			<search position="after"><![CDATA[$data[''text_review''] = $this->language->get(''text_review'');]]></search>\n			<add><![CDATA[		$data[''text_askaquestion''] = $this->language->get(''text_askaquestion'');]]></add>\n		</operation>\n		<operation>\n			<search position="after"><![CDATA[$data[''captcha_pages''] = array();]]></search>\n			<add><![CDATA[		$data[''captcha_pages''][] = array(\n			''text''  => $this->language->get(''text_askaquestion''),\n			''value'' => ''askaquestion''\n		);]]></add>\n		</operation>\n	</file>\n	<file name="catalog/language/english/english.php">\n		<operation>\n			<search position="after"><![CDATA[<?php]]></search>\n			<add><![CDATA[$_[''text_zero_price'']       = ''Ask for Price'';\n$_[''tab_question'']          = ''Ask a Question'';\n$_[''text_ask'']              = ''Do you have any questions about '';\n$_[''entry_name_ask'']        = ''Your Name:'';\n$_[''entry_email_ask'']       = ''Your E-Mail Address:'';\n$_[''entry_question_ask'']    = ''Your Question:'';\n$_[''entry_send_ask'']        = ''Send'';\n$_[''entry_sending_ask'']     = ''Sending...'';\n$_[''text_product_e_ask'']    = ''Product Name: %s'';\n$_[''text_url_e_ask'']        = ''Product URL: %s'';\n$_[''text_name_e_ask'']       = ''Name: %s'';\n$_[''text_email_e_ask'']      = ''E-Mail Address: %s'';\n$_[''text_question_e_ask'']   = ''Question:'';\n$_[''text_subject_e_ask'']    = ''%s wants to ask you something about %s'';\n$_[''error_name_ask'']        = ''Warning: The Name must be between 3 and 25 characters!'';\n$_[''error_email_ask'']       = ''Warning: The E-Mail Address does not appear to be valid!'';\n$_[''error_question_ask'']    = ''Warning: The Question must be between 25 and 1000 characters!'';\n$_[''text_success_ask'']      = ''Your question has been successfully sent. We will answer you as soon as possible.'';]]></add>\n		</operation>\n	</file>\n	<file name="admin/language/english/english.php">\n		<operation>\n			<search position="after"><![CDATA[<?php]]></search>\n			<add><![CDATA[$_[''text_askaquestion'']                = ''Ask a Question'';]]></add>\n		</operation>\n	</file>\n</modification>', 1, '2016-01-19 11:45:25');
INSERT INTO `oc_modification` (`modification_id`, `name`, `code`, `author`, `version`, `link`, `xml`, `status`, `date_added`) VALUES
(6, 'Multi tier affiliate system (templates, language)', 'mta160104_2yp', 'YP', '1.6.0104', '', '<?xml version="1.0" encoding="utf-8"?>\n<modification>\n	<id><![CDATA[Multi tier affiliate system for openCart 2 (templates, language)]]></id>\n	<name><![CDATA[Multi tier affiliate system (templates, language)]]></name>	\n	<version><![CDATA[1.6.0104]]></version>	\n	<code><![CDATA[mta160104_2yp]]></code>	\n	<author><![CDATA[YP]]></author>\n<file path="admin/view/template/catalog/category_form.tpl">\n		<operation>\n			<search><![CDATA[<?php echo $footer]]></search>\n			<add position="before"><![CDATA[\n			\n<?php //+mod by yp start\n	if(isset($mta_do_edit) && $mta_do_edit) {?>	\n<script type="text/javascript"><!--\n	$(document).ready(function() {\n		if($(''.nav-tabs'').length < 1) {\n			var _c = $(''#form-<?php echo $page_type; ?>'').html();\n			$(''#form-<?php echo $page_type; ?>'').html(''<ul class="nav nav-tabs"><li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general_added; ?></a></li></ul><div class="tab-content"><div class="tab-pane active" id="tab-general">''+_c+''</div></div>'');\n		}\n		$(''.nav-tabs:first'').append(''<li><a href="#tab-commission" data-toggle="tab"><?php echo $tab_commission; ?></a></li>'');\n		$(''.tab-pane:last'').after(''<div class="tab-pane" id="tab-commission"><div id="commission"></div></div>'');\n		$.ajax({url : ''<?php echo $mta_pds_url;?>'', dataType : ''html'', success : function(_html) {\n				$(''#commission'').html(_html);\n			}\n		});\n	});\n//--></script> \n<?php } //+mod by yp end  \n?>\n\n		]]></add>\n		</operation>	\n	</file>	\n<file path="admin/view/template/catalog/manufacturer_form.tpl">\n		<operation>\n			<search><![CDATA[<?php echo $footer]]></search>\n			<add position="before"><![CDATA[\n			\n<?php //+mod by yp start\n	if(isset($mta_do_edit) && $mta_do_edit) {?>	\n<script type="text/javascript"><!--\n	$(document).ready(function() {\n		if($(''.nav-tabs'').length < 1) {\n			var _c = $(''#form-<?php echo $page_type; ?>'').html();\n			$(''#form-<?php echo $page_type; ?>'').html(''<ul class="nav nav-tabs"><li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general_added; ?></a></li></ul><div class="tab-content"><div class="tab-pane active" id="tab-general">''+_c+''</div></div>'');\n		}\n		$(''.nav-tabs:first'').append(''<li><a href="#tab-commission" data-toggle="tab"><?php echo $tab_commission; ?></a></li>'');\n		$(''.tab-pane:last'').after(''<div class="tab-pane" id="tab-commission"><div id="commission"></div></div>'');\n		$.ajax({url : ''<?php echo $mta_pds_url;?>'', dataType : ''html'', success : function(_html) {\n				$(''#commission'').html(_html);\n			}\n		});\n	});\n//--></script> \n<?php } //+mod by yp end  \n?>\n\n		]]></add>\n		</operation>	\n	</file>	\n<file path="admin/view/template/marketing/coupon_form.tpl">\n		<operation>\n			<search><![CDATA[<?php echo $footer]]></search>\n			<add position="before"><![CDATA[\n			\n<?php //+mod by yp start\n	if(isset($mta_do_edit) && $mta_do_edit) {?>	\n<script type="text/javascript"><!--\n	$(document).ready(function() {\n		if($(''.nav-tabs'').length < 1) {\n			var _c = $(''#form-<?php echo $page_type; ?>'').html();\n			$(''#form-<?php echo $page_type; ?>'').html(''<ul class="nav nav-tabs"><li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general_added; ?></a></li></ul><div class="tab-content"><div class="tab-pane active" id="tab-general">''+_c+''</div></div>'');\n		}\n		$(''.nav-tabs:first'').append(''<li><a href="#tab-commission" data-toggle="tab"><?php echo $tab_commission; ?></a></li>'');\n		$(''.tab-pane:last'').after(''<div class="tab-pane" id="tab-commission"><div id="commission"></div></div>'');\n		$.ajax({url : ''<?php echo $mta_pds_url;?>'', dataType : ''html'', success : function(_html) {\n				$(''#commission'').html(_html);\n			}\n		});\n	});\n//--></script> \n<?php } //+mod by yp end  \n?>\n\n		]]></add>\n		</operation>	\n	</file>		\n		<file path="admin/view/template/catalog/product_form.tpl">\n		<operation>\n			<search><![CDATA[<select name="product_discount[<?php echo $discount_row; ?>][customer_group_id]" class="form-control">]]></search>\n			<add position="before"><![CDATA[\n			\n<?php if($do_edit) { ?><input type="hidden" name="product_discount[<?php echo $discount_row; ?>][product_discount_id]" value="<?php echo $product_discount[''product_discount_id''];?>" /><?php } /* //+mod by yp */ ?>\n\n]]></add>\n		</operation>		\n		<operation>\n			<search><![CDATA[<select name="product_special[<?php echo $special_row; ?>][customer_group_id]" class="form-control">]]></search>\n			<add position="before"><![CDATA[\n			\n<?php if($do_edit) { ?><input type="hidden" name="product_special[<?php echo $special_row; ?>][product_special_id]" value="<?php echo $product_special[''product_special_id''];?>" /><?php } /* //+mod by yp */ ?>\n\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[<td class="text-left"><button type="button" onclick="$(''#discount-row<?php echo $discount_row; ?>'').]]></search>\n			<add position="before"><![CDATA[\n			\n<?php //+mod by yp start\n	if($do_edit) { ?>              \n        				<td class="text-left">\n        					<div class="input-group">\n        						<select name="product_discount[<?php echo $discount_row; ?>][scheme_id]" class="form-control">\n								<?php foreach ($schemes0 as $_sid => $_sname) { ?>\n									<option value="<?php echo $_sid;?>"<?php if ($_sid == $product_discount[''scheme_id'']) { ?> selected="selected"<?php } ?>><?php echo $_sname;?></option>\n								<?php } ?>\n								</select>\n								<br />\n								<?php if(isset($product_discount[''product_discount_id'']) && $product_discount[''product_discount_id'']) { ?>\n								<a id="product_discount_<?php echo $product_discount[''product_discount_id'']; ?>_affiliates_link" href="javascript:;"><?php echo $text_aff_schemes; ?></a>\n							<?php foreach ($schemes as $_sid => $_sname) { ?>\n        						<input type="hidden" id="product_discount_<?php echo $product_discount[''product_discount_id'']; ?>_affiliates_<?php echo $_sid; ?>" name="_product_discount_affiliates[<?php echo $discount_row; ?>][<?php echo $_sid; ?>]" value="" />\n        					<?php } ?>\n        					</div>								\n        					<?php } ?>\n						</td>                 \n<?php } //+mod by yp end\n?>\n\n]]></add>\n		</operation>		\n		<operation>\n			<search><![CDATA[<td class="text-left"><button type="button" onclick="$(''#special-row<?php echo $special_row; ?>'').]]></search>\n			<add position="before"><![CDATA[\n<?php //+mod by yp start\n	if($do_edit) { ?>\n        				<td class="text-left">\n        					<div class="input-group">\n        						<select name="product_special[<?php echo $special_row; ?>][scheme_id]" class="form-control">\n								<?php foreach ($schemes0 as $_sid => $_sname) { ?>\n									<option value="<?php echo $_sid; ?>"<?php if ($_sid == $product_special[''scheme_id'']) { ?> selected="selected"<?php } ?>><?php echo $_sname; ?></option>\n								<?php } ?>\n								</select>\n								<br />\n							<?php if (isset($product_special[''product_special_id'']) && $product_special[''product_special_id'']) { ?>\n								<a id="product_special_<?php echo $product_special[''product_special_id'']; ?>_affiliates_link" href="javascript:;"><?php echo $text_aff_schemes; ?></a>\n							<?php foreach ($schemes as $_sid => $_sname) { ?>\n        						<input type="hidden" id="product_special_<?php echo $product_special[''product_special_id'']; ?>_affiliates_<?php echo $_sid; ?>" name="_product_special_affiliates[<?php echo $special_row; ?>][<?php echo $_sid; ?>]" value="" />\n        					<?php } ?>\n        					</div>								\n        					<?php } ?>\n						</td>                 \n<?php } //+mod by yp end\n?>\n\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[html += ''  <td class="text-left"><button type="button" onclick="$(\\''#discount-row'' + discount_row + ''\\'').remove();]]></search>\n			<add position="before"><![CDATA[\n			\n<?php //+mod by yp start\n	if ($do_edit) { ?>\n	html += ''<td class="text-left"><select class="form-control" name="product_discount['' + discount_row + ''][scheme_id]">'';\n<?php foreach ($schemes0 as $_sid => $_sname) { ?>\n	html +=''<option value="<?php echo $_sid; ?>"><?php echo mta_jsstr($_sname); ?></option>'';\n<?php } ?>\n	html += ''</select></td>'';\n<?php } //+mod by yp end\n?>\n\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[html += ''  <td class="text-left"><button type="button" onclick="$(\\''#special-row'' + special_row + ''\\'').remove();]]></search>\n			<add position="before"><![CDATA[\n			\n<?php //+mod by yp start\n	if ($do_edit) { ?>\n	html += ''<td class="text-left"><select class="form-control" name="product_special['' + special_row + ''][scheme_id]">'';\n<?php foreach ($schemes0 as $_sid => $_sname) { ?>\n	html +=''<option value="<?php echo $_sid; ?>"><?php echo mta_jsstr($_sname); ?></option>'';\n<?php } ?>\n	html += ''</select></td>'';\n<?php } //+mod by yp end\n?>\n			\n]]></add>\n		</operation>		\n		<operation>\n			<search><![CDATA[<?php echo $footer;]]></search>\n			<add position="before"><![CDATA[\n			\n			<?php /* //+mod by yp start	*/ \n				if ($do_edit) { ?>\n<script type="text/javascript" src="view/javascript/jquery.migrate.min.js"></script>\n<script type="text/javascript" src="view/javascript/jquery.dataTables.min.js"></script>\n<script type="text/javascript" src="view/javascript/jquery.tools.min.js"></script>\n<script type="text/javascript"><!--		\n$(''.nav-tabs:first'').append(''<li><a href="#tab-scheme" data-toggle="tab"><?php echo mta_jsstr($tab_scheme); ?></a></li>'');	\n$(''.tab-content:first'').append(''<div class="tab-pane" id="tab-scheme"></div>'');\n$(document).ready(function() {\n	$(''#discount>thead>tr>td:last'').before(''<td class="text-left"><?php echo mta_jsstr($tab_scheme); ?></td>'');\n	$(''#special>thead>tr>td:last'').before(''<td class="text-left"><?php echo mta_jsstr($tab_scheme); ?></td>'');\n	$.ajax({\n		url: ''index.php?route=mta/mta_pds/datatable&token=<?php echo $token; ?>&add_jsp=mta/mta_pds/product_dt&s=s'',\n		type: ''get'',\n		dataType: ''html'',\n		success: function(html) {\n			$(''#content'').append(html);\n			$.ajax({\n				url : ''<?php echo $link_commission_tab; ?>'',\n				method : ''GET'',\n				dataType : ''html'',\n				success : function(_r) {\n					$(''#tab-scheme'').html(_r);\n				}\n			});			\n		}\n	});\n});	\n//--></script>			\n							<?php } /* //+mod by yp end\n							*/ ?>	\n							\n]]></add>\n		</operation>\n	</file>	\n	<file path="admin/view/template/catalog/product_list.tpl">	\n		<operation>\n			<search><![CDATA[<td class="text-right"><?php if ($sort == ''p.quantity'') { ?>]]></search>\n			<add position="before"><![CDATA[\n			\n<td class="text-right"><?php echo $column_mta_scheme;?></td><?php /* //+mod by yp */ ?>\n\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[colspan="8"]]></search><add position="replace"><![CDATA[colspan="9"]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[<td class="text-right"><?php if ($product[''quantity''] <= 0) { ?>]]></search>\n			<add position="before"><![CDATA[\n			\n				<?php /* //+mod by yp start */ ?>\n				<td class="text-left">\n					<?php echo $product[''mta_scheme''];?><br />\n					<?php if($product[''mta_scheme_total'']) {?>\n					<a class="mta_schemes"><?php echo  $entry_mta_schemes;?> (<?php echo $product[''mta_scheme_total''];?>)</a>\n					<a class="mta_schemes_hide" style="display:none;"><?php echo $text_hide;?></a>\n					<div class="mta_schemes_div" style="display:none;">\n					<?php foreach($mta_scheme_types as $_k => $_v) {\n						if($product[''mta_scheme_count''][$_k]) {\n							echo $mta_scheme_types_lng[$_k];?> :  <strong><?php echo $product[''mta_scheme_count''][$_k];?></strong><br />\n					<?php 	}\n						} ?>\n					</div>\n					<br />\n					<?php } ?>\n				</td>\n				<?php /* //+mod by yp end */ ?>\n				\n]]></add>\n		</operation>	\n	</file>\n\n	<file path="admin/view/template/marketing/affiliate_form.tpl">\n		<operation>\n			<search><![CDATA[<?php echo $footer;]]></search>\n			<add position="before"><![CDATA[\n			\n			<?php /* //+mod by yp start	*/ ?>\n<script type="text/javascript" src="view/javascript/jquery.migrate.min.js"></script>\n<script type="text/javascript" src="view/javascript/jquery.dataTables.min.js"></script>\n<script type="text/javascript" src="view/javascript/jquery.tools.min.js"></script>\n<script type="text/javascript"><!--			\n$(document).ready(function() {\n	var _html = ''<div class="form-group"><label class="col-sm-2 control-label" id="level_span"><?php echo mta_jsstr($text_level); ?>  <?php echo $level; ?></label><div class="col-sm-10"><a href="<?php echo mta_jsstr($link_downline); ?>" target="_blank"><?php echo mta_jsstr($text_view_downline); ?></a></div></div>'';\n	_html += ''<div class="form-group"><label class="col-sm-2 control-label" for="input-parent-affiliate-id"><?php echo mta_jsstr($entry_parent); ?></label><div class="col-sm-10"><div class="input-group"><input type="hidden" name="parent_affiliate_id" value="<?php echo $parent_affiliate_id; ?>" /><input type="hidden" name="parent_affiliate_name" value="<?php echo mta_jsstr($parent_affiliate_name); ?>" /><span id="parent_affiliate_span">'';\n	<?php if($parent_affiliate_id) {?>\n	_html += ''<a href="<?php echo mta_jsstr($parent_affiliate_link); ?>" target="_blank"><?php echo mta_jsstr($parent_affiliate_name); ?></a>'';\n						<?php\n							} else { ?>\n	_html += ''<?php echo mta_jsstr($text_none); ?>'';\n						<?php } ?>\n	_html += ''</span><div class="btn-group"><button type="button" rel="#affiliate_dt_overlay_div" id="affiliate_dt_overlay_open" class="btn btn-default"><?php echo mta_jsstr($text_select_affiliate); ?></button><button type="button" id="affiliate_set_none" class="btn btn-default"><?php echo mta_jsstr($text_set_none); ?></button></div></div></div></div><div class="form-group"><label class="col-sm-2 control-label" for="input-scheme"><?php echo mta_jsstr($entry_scheme); ?></label><div class="col-sm-10"><select name="scheme" id="input-scheme" class="form-control"><option value="0"<?php if(!$scheme_id) { ?> selected="selected"<?php } ?>><?php echo mta_jsstr($option_default); ?></option>'';\n						<?php	\n							foreach($schemes as $_id => $_name) {?>\n	_html += ''<option value="<?php echo $_id;?>"<?php if($scheme_id == $_id) {?> selected="selected"<?php } ?>><?php echo mta_jsstr($_name); ?></option>'';\n						<?php } ?>\n	_html += ''</select></div></div>'';\n	$(''input[name="email"]'').parent().parent().after(_html);\n	$.ajax({\n		url: ''index.php?route=mta/mta_pds/datatable&token=<?php echo $token; ?>&add_js=affiliate_form'',\n		type: ''get'',\n		dataType: ''html'',\n		success: function(html) {\n			$(''#content'').append(html);\n		}\n	});\n});	\n//--></script>			\n			<?php /* //+mod by yp end */ ?>\n							\n]]></add>\n		</operation>		\n	</file>		\n	<file path="admin/view/template/marketing/affiliate_list.tpl">\n		<operation>\n			<search><![CDATA[== ''c.email]]></search>\n			<add position="replace"><![CDATA[== ''a.email]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[== ''c.status]]></search>\n			<add position="replace"><![CDATA[== ''a.status]]></add>\n		</operation>		\n		<operation>\n			<search><![CDATA[== ''c.date_added]]></search>\n			<add position="replace"><![CDATA[== ''a.date_added]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[<td class="text-right"><?php echo $column_balance; ?></td>]]></search>\n			<add position="before"><![CDATA[\n<td class="text-right"><?php echo $column_scheme; ?></td><?php /* //+mod by yp */?>\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[<td class="text-right"><?php echo $affiliate[''balance'']; ?></td>]]></search>\n			<add position="before"><![CDATA[\n        <td class="text-right"><?php echo $affiliate[''scheme'']; ?><br /><?php echo $text_level;?> <?php echo $affiliate[''level''];?></td><?php /* //+mod by yp */?>\n]]></add>\n		</operation>		\n	</file>	\n	<file path="admin/view/template/report/affiliate.tpl">\n		<operation>\n			<search><![CDATA[$column_commission]]></search>\n			<add position="replace"><![CDATA[$column_current_balance]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[<td class="text-right"><?php echo $column_orders; ?></td>]]></search>\n			<add position="replace"><![CDATA[          ]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[<?php echo $column_total; ?></td>]]></search>\n			<add position="after"><![CDATA[\n<td class="text-right"><?php echo $column_total_sales; ?></td><td class="text-right"><?php echo $column_orders; ?></td>			\n			]]></add>\n		</operation>	\n		<operation>\n			<search><![CDATA[<?php echo $affiliate[''affiliate'']; ?>]]></search>\n			<add position="replace"><![CDATA[\n<?php echo $affiliate[''affiliate'']; ?>\n						<?php if(!$payout_accounts[$affiliate[''affiliate_id'']]) {?>\n						<br /><span style="font-weight:bold;color:#e11;"><?php echo $text_no_payout_account;?></span>\n						<?php }?>\n]]></add>\n		</operation>		\n		<operation>\n			<search><![CDATA[$affiliate[''commission'']; ?></td>]]></search>\n			<add position="after"><![CDATA[\n        <td class="text-right"><?php echo $affiliate[''total_earnings'']; ?></td><td class="text-right"><?php echo $affiliate[''total''];?></td><?php /* //+mod by yp */ ?>\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[<td class="text-right"><?php echo $affiliate[''total'']; ?></td>]]></search>\n			<add position="replace"><![CDATA[          ]]></add>\n		</operation>\n		<operation>\n			<search position="replace"><![CDATA[colspan="7"]]></search>\n			<add><![CDATA[colspan="8"]]></add>\n		</operation>			\n		<operation>\n			<search><![CDATA[<?php echo $affiliate[''edit'']; ?>"]]></search>\n			<add position="replace"><![CDATA[<?php echo $affiliate[''edit'']; ?>" target="_blank"]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[location = url;]]></search>\n			<add position="before"><![CDATA[\n			\n	<?php /* //+mod by yp start */ ?>\n	var filter_balance = $(''input[name=\\''filter_balance\\'']'').val();\n\n	if (filter_balance > 0) {\n		url += ''&filter_balance='' + encodeURIComponent(filter_balance);\n	}\n	<?php /* //+mod by yp end */ ?>\n	\n]]></add>\n		</operation>	\n		<operation>\n			<search><![CDATA[<?php echo $footer]]></search>\n			<add position="before"><![CDATA[\n			\n<?php /* //+mod by yp start */ ?>			\n<script type="text/javascript"><!--		\n$(document).ready(function() {\n	var _html = ''<div class="col-sm-6"><div class="form-group"><label class="control-label" for="input-balance"><?php echo mta_jsstr($entry_current_balance); ?></label><div><input type="text" name="filter_balance" value="<?php echo $filter_balance;?>" placeholder="<?php echo mta_jsstr($entry_current_balance); ?>" id="input-balance" class="form-control" /></div></div></div>'';\n	$(''#button-filter'').parent().parent().append(_html);\n});\n//--></script>\n<?php /* //+mod by yp start */ ?>\n\n]]></add>\n		</operation>		\n	</file>	\n	<file path="admin/view/template/sale/customer_form.tpl">\n		<operation>\n			<search><![CDATA[<?php echo $footer;]]></search>\n			<add position="before"><![CDATA[\n			\n			<?php /* //+mod by yp start	*/ ?>\n<script type="text/javascript" src="view/javascript/jquery.migrate.min.js"></script>\n<script type="text/javascript" src="view/javascript/jquery.dataTables.min.js"></script>\n<script type="text/javascript" src="view/javascript/jquery.tools.min.js"></script>\n<script type="text/javascript"><!--			\n$(document).ready(function() {\n	var _html = ''<div class="form-group"><label class="col-sm-2 control-label" for="input-affiliate-id"><?php echo mta_jsstr($entry_affiliate); ?></label><div class="col-sm-10" id="affiliate_td"><div class="input-group"><span>'';\n				<?php if($affiliate_id) { ?>\n	_html += ''<a href="<?php echo mta_jsstr($affiliate_link); ?>" target="_blank"><?php echo mta_jsstr($affiliate_name); ?></a>'';\n              	<?php } else { ?>\n	_html += ''<?php echo mta_jsstr($text_none); ?>'';\n				<?php } ?>	\n	_html += ''</span><div class="btn-group"><button class="btn btn-default" type="button" rel="#affiliate_dt_overlay_div" id="affiliate_dt_overlay_open"><?php echo mta_jsstr($text_select_affiliate);?></button><button class="btn btn-default" type="button" id="affiliate_set_none"><?php echo mta_jsstr($text_set_none);?></button><input type="hidden" name="affiliate_id" value="<?php echo $affiliate_id;?>" id="input-affiliate-id" /><input type="hidden" name="affiliate_name" value="<?php echo mta_jsstr($affiliate_name);?>" /></div></div></div></div>'';\n	$(''#tab-customer'').append(_html);\n	$.ajax({\n		url: ''index.php?route=mta/mta_pds/datatable&token=<?php echo $token; ?>&add_js=customer'',\n		type: ''get'',\n		dataType: ''html'',\n		success: function(html) {\n			$(''#content'').append(html);\n		}\n	});\n});	\n//--></script>			\n							<?php /* //+mod by yp end\n							*/ ?>	\n							\n]]></add>\n		</operation>\n	</file>	\n		<file path="admin/view/template/sale/order_form.tpl">\n		<operation>\n			<search><![CDATA[<?php echo $footer]]></search>\n			<add position="before"><![CDATA[\n			\n<?php /* //+mod by yp start */ ?>\n<?php if ($link_edit_order_commission) { ?>	\n<script type="text/javascript"><!--			\n	$(''[name="affiliate"]'').attr(''readonly'', ''readonly'');\n	$(''[name="affiliate"]'').parent().append(''<div><a href="<?php echo mta_jsstr($link_edit_order_commission); ?>"><?php echo mta_jsstr($text_edit_order_commission); ?></a>'');\n<?php } ?>	\n//--></script>				\n<?php /* //+mod by yp end */ ?>\n\n]]></add>\n		</operation>\n	</file>	\n	<file path="admin/view/template/sale/order_info.tpl">\n		<operation>\n			<search><![CDATA[<?php echo $footer]]></search>\n			<add position="before"><![CDATA[	\n			\n<?php /* //+mod by yp start */ ?>			\n<script type="text/javascript">			\nORDER_ID_MTA = ''<?php echo $order_id; ?>'';\nTOKEN_MTA = ''<?php echo $token; ?>'';\n<?php if ($link_edit_order_commission) { ?>\n$(document).ready(function() {\n	var _btn = $(''#button-reward-add'').length > 0 ? $(''#button-reward-add'') : $(''#button-reward-remove'');\n	_btn.parent().parent().after(''<tr><td colspan="2"><a href="<?php echo $link_edit_order_commission; ?>"><strong><?php echo $text_edit_order_commission; ?></strong></a></td></tr>'');\n});\n<?php } ?>\n</script>\n<?php /* //+mod by yp end */ ?>\n\n]]></add>\n		</operation>\n<!--	<operation>\n			<search><![CDATA[<?php if ($ip) {]]></search>\n			<add position="before"><![CDATA[	\n			\n<?php /* //+mod by yp start */\n	if ($link_edit_order_commission) { ?>\n<tr>\n	<td colspan="2"><a href="<?php echo $link_edit_order_commission; ?>"><strong><?php echo $text_edit_order_commission; ?></strong></a></td>\n</tr>\n<?php /* //+mod by yp end */ } ?>	\n	\n]]></add>\n		</operation> -->\n		<operation>\n			<!-- v == 2.1.0.1 -->\n			<ignoreif><![CDATA[if ($ip)]]></ignoreif>\n			<search><![CDATA[php echo $commission]]></search>\n			<add position="replace"><![CDATA[php echo (isset($commission) ? $commission : '''')]]></add>\n		</operation>\n		<operation>\n			<!-- v < 2.1.0.1 -->\n			<ignoreif><![CDATA[button-ip-add]]></ignoreif>\n			<search><![CDATA[<?php if ($affiliate) { ?>]]></search>\n			<add position="before"><![CDATA[\n\n			<?php /* //+mod by yp start */\n				if ($affiliates) { ?>\n          <tr>\n            <td><?php echo $text_affiliates; ?></td>\n            <td>\n				<div>\n					<table class="table table-bordered table-hover">\n						<thead>\n							<tr>\n								<td class="text-right"><?php echo $column_affiliate;?></td>\n								<td class="text-left"><?php echo $column_product_name;?></td>\n								<td class="text-left"><?php echo $column_product_commission;?></td>\n								<td class="text-left"><?php echo $column_scheme;?></td>\n								<td class="text-left"><?php echo $column_total_commission;?></td>\n								<td class="text-left">&nbsp;</td>\n							</tr>\n						</thead>\n					<tbody>\n					<?php foreach($affiliates as $_aff) {\n						if($_aff[''num_rows''] < 2) {	?>\n						<tr>\n							<td class="text-right"><a href="<?php echo $_aff[''affiliate_link''];?>" target="_blank"><?php echo $_aff[''affiliate_name''];?></a></td>\n							<td class="text-left"><?php echo $_aff[''product_name''];?></td>\n							<td class="text-left"><?php echo $_aff[''commission''];?></td>\n							<td class="text-left"><?php if ($_aff[''affiliate_scheme_id'']) { ?><a href="<?php echo $_aff[''affiliate_scheme_link''];?>" target="_blank"><?php echo $_aff[''affiliate_scheme_name''];?></a>\n							<?php } else { echo $text_none; } ?></td>\n							<td class="text-left"><?php echo $_aff[''commission_total''];?></td>\n							<td class="text-left">\n								<button id="commission-add-<?php echo $_aff[''affiliate_id''];?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-success btn-xs"<?php if($_aff[''commission_added'']) { ?> style="display:none"<?php } ?>><i class="fa fa-plus-circle"></i> <?php echo $button_commission_add; ?></button>							\n								<button id="commission-remove-<?php echo $_aff[''affiliate_id''];?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-danger btn-xs"<?php if(!$_aff[''commission_added'']) { ?> style="display:none"<?php } ?>><i class="fa fa-minus-circle"></i> <?php echo $button_commission_remove; ?></button>\n							</td>\n						</tr>\n						<?php } else {?>\n						<tr>\n							<td class="text-right" rowspan="<?php echo $_aff[''num_rows''];?>"><a href="<?php echo $_aff[''affiliate_link''];?>" target="_blank"><?php echo $_aff[''affiliate_name''];?></a></td>\n							<td class="text-left"><?php echo $_aff[''data''][0][''product_name''];?></td>					\n							<td class="text-left"><?php echo $_aff[''data''][0][''commission''];?></td>\n							<td class="text-left"><?php if ($_aff[''data''][0][''affiliate_scheme_id'']) { ?><a href="<?php echo $_aff[''data''][0][''affiliate_scheme_link''];?>" target="_blank"><?php echo $_aff[''data''][0][''affiliate_scheme_name''];?></a><?php } else { echo $text_none; } ?></td>\n							<td class="text-left" rowspan="<?php echo $_aff[''num_rows''];?>"><?php echo $_aff[''commission_total''];?></td>										\n							<td class="text-left" rowspan="<?php echo $_aff[''num_rows''];?>">\n								<button id="commission-add-<?php echo $_aff[''affiliate_id''];?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-success btn-xs"<?php if($_aff[''commission_added'']) { ?> style="display:none"<?php } ?>><i class="fa fa-plus-circle"></i> <?php echo $button_commission_add; ?></button>							\n								<button id="commission-remove-<?php echo $_aff[''affiliate_id''];?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-danger btn-xs"<?php if(!$_aff[''commission_added'']) { ?> style="display:none"<?php } ?>><i class="fa fa-minus-circle"></i> <?php echo $button_commission_remove; ?></button>							\n							</td>\n						</tr>\n						<?php for ($_i = 1; $_i < $_aff[''num_rows'']; $_i++) { ?>\n						<tr>\n							<td class="text-left"><?php echo $_aff[''data''][$_i][''product_name''];?></td>					\n							<td class="text-left"><?php echo $_aff[''data''][$_i][''commission''];?></td>\n							<td class="text-left"><?php if ($_aff[''data''][$_i][''affiliate_scheme_id'']) { ?><a href="<?php echo $_aff[''data''][$_i][''affiliate_scheme_link''];?>" target="_blank"><?php echo $_aff[''data''][$_i][''affiliate_scheme_name''];?></a><?php } else { echo $text_none; } ?></td>\n						</tr>\n						<?php 	}\n							}\n						} ?>\n					</tbody>\n				</table>\n			</div>\n		</td>\n      </tr>\n<?php /* //+mod by yp end */ } ?>	\n		  \n			]]></add>\n		</operation>			\n				<operation>\n			<!-- v == 2.1.0.1 -->\n			<ignoreif><![CDATA[if ($ip]]></ignoreif>\n			<search index="3"><![CDATA[<div class="panel panel-default">]]></search>\n			<add position="before"><![CDATA[\n\n			<?php /* //+mod by yp start */\n				if (version_compare(VERSION, ''2.1'', ''>='') && $affiliates) { ?>\n          <div class="panel panel-default">\n            <h4><?php echo $text_affiliates; ?></h4>\n				<div>\n					<table class="table table-bordered table-hover">\n						<thead>\n							<tr>\n								<td class="text-right"><?php echo $column_affiliate;?></td>\n								<td class="text-left"><?php echo $column_product_name;?></td>\n								<td class="text-left"><?php echo $column_product_commission;?></td>\n								<td class="text-left"><?php echo $column_scheme;?></td>\n								<td class="text-left"><?php echo $column_total_commission;?></td>\n								<td class="text-left">&nbsp;</td>\n							</tr>\n						</thead>\n					<tbody>\n					<?php foreach($affiliates as $_aff) {\n						if($_aff[''num_rows''] < 2) {	?>\n						<tr>\n							<td class="text-right"><a href="<?php echo $_aff[''affiliate_link''];?>" target="_blank"><?php echo $_aff[''affiliate_name''];?></a></td>\n							<td class="text-left"><?php echo $_aff[''product_name''];?></td>\n							<td class="text-left"><?php echo $_aff[''commission''];?></td>\n							<td class="text-left"><?php if ($_aff[''affiliate_scheme_id'']) { ?><a href="<?php echo $_aff[''affiliate_scheme_link''];?>" target="_blank"><?php echo $_aff[''affiliate_scheme_name''];?></a>\n							<?php } else { echo $text_none; } ?></td>\n							<td class="text-left"><?php echo $_aff[''commission_total''];?></td>\n							<td class="text-left">\n								<button id="commission-add-<?php echo $_aff[''affiliate_id''];?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-success btn-xs"<?php if($_aff[''commission_added'']) { ?> style="display:none"<?php } ?>><i class="fa fa-plus-circle"></i> <?php echo $button_commission_add; ?></button>							\n								<button id="commission-remove-<?php echo $_aff[''affiliate_id''];?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-danger btn-xs"<?php if(!$_aff[''commission_added'']) { ?> style="display:none"<?php } ?>><i class="fa fa-minus-circle"></i> <?php echo $button_commission_remove; ?></button>\n							</td>\n						</tr>\n						<?php } else {?>\n						<tr>\n							<td class="text-right" rowspan="<?php echo $_aff[''num_rows''];?>"><a href="<?php echo $_aff[''affiliate_link''];?>" target="_blank"><?php echo $_aff[''affiliate_name''];?></a></td>\n							<td class="text-left"><?php echo $_aff[''data''][0][''product_name''];?></td>					\n							<td class="text-left"><?php echo $_aff[''data''][0][''commission''];?></td>\n							<td class="text-left"><?php if ($_aff[''data''][0][''affiliate_scheme_id'']) { ?><a href="<?php echo $_aff[''data''][0][''affiliate_scheme_link''];?>" target="_blank"><?php echo $_aff[''data''][0][''affiliate_scheme_name''];?></a><?php } else { echo $text_none; } ?></td>\n							<td class="text-left" rowspan="<?php echo $_aff[''num_rows''];?>"><?php echo $_aff[''commission_total''];?></td>										\n							<td class="text-left" rowspan="<?php echo $_aff[''num_rows''];?>">\n								<button id="commission-add-<?php echo $_aff[''affiliate_id''];?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-success btn-xs"<?php if($_aff[''commission_added'']) { ?> style="display:none"<?php } ?>><i class="fa fa-plus-circle"></i> <?php echo $button_commission_add; ?></button>							\n								<button id="commission-remove-<?php echo $_aff[''affiliate_id''];?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-danger btn-xs"<?php if(!$_aff[''commission_added'']) { ?> style="display:none"<?php } ?>><i class="fa fa-minus-circle"></i> <?php echo $button_commission_remove; ?></button>							\n							</td>\n						</tr>\n						<?php for ($_i = 1; $_i < $_aff[''num_rows'']; $_i++) { ?>\n						<tr>\n							<td class="text-left"><?php echo $_aff[''data''][$_i][''product_name''];?></td>					\n							<td class="text-left"><?php echo $_aff[''data''][$_i][''commission''];?></td>\n							<td class="text-left"><?php if ($_aff[''data''][$_i][''affiliate_scheme_id'']) { ?><a href="<?php echo $_aff[''data''][$_i][''affiliate_scheme_link''];?>" target="_blank"><?php echo $_aff[''data''][$_i][''affiliate_scheme_name''];?></a><?php } else { echo $text_none; } ?></td>\n						</tr>\n						<?php 	}\n							}\n						} ?>\n					</tbody>\n				</table>\n			</div>\n			</div>\n<?php /* //+mod by yp end */ } ?>	\n		  \n			]]></add>\n		</operation>\n	</file>\n	<file path="catalog/view/theme/*/template/affiliate/account.tpl">\n		<operation>\n			<search><![CDATA[<?php echo $content_bottom;]]></search>\n			<add position="before"><![CDATA[\n\n	<?php /* //+mod by yp start */ ?>\n	<h2><?php echo $text_signup_link; ?></h2>\n	<ul class="list-unstyled">	\n		<li><strong><?php echo $signup_link;?></strong><br />\n		<?php echo $text_aff_link_any_page;?></li>\n	</ul>\n	<?php if($show_downline) {?>\n	<div class="list-unstyled">\n		<ul>\n			<li><a href="<?php echo $link_affiliate_downline; ?>"><?php echo $text_affiliate_downline; ?></a></li>\n		</ul>\n	</div>\n	<?php }\n	/* //+mod by yp end */ ?>\n	\n]]></add>\n		</operation>\n	</file>	\n	<file path="catalog/view/theme/*/template/affiliate/transaction.tpl">\n		<operation>\n			<search><![CDATA[$balance; ?></strong>.</p>]]></search>\n			<add position="after" ><![CDATA[\n\n	<?php /* //+mod by yp start */ ?>\n	<p><?php echo $text_total_earnings; ?> <strong><?php echo $total_earnings; ?></strong>.</p>\n	<?php if($sub_affiliates) { ?>\n	<?php\n		if($show_downline) { ?>\n	<div>		\n	<a href="<?php echo $link_affiliate_downline; ?>"><?php echo $text_affiliate_downline; ?></a></div>\n	<?php } ?>	\n	<div><a href="javascript:;" onclick="javascript:$(''#view_subs_table'').toggle();" id="view_subs_link"><?php echo $text_view_subs;?></a></div>\n	<div class="table-responsive" id="view_subs_table" style="display:none;">\n	<table class="table table-striped table-bordered table-hover">\n    <thead>\n      <tr>\n        <td class="text-right"><?php echo $column_level; ?></td>\n        <td class="text-left"><?php echo $column_num_affs; ?></td>\n	  </tr>\n	</thead>\n	<tbody>\n		<?php foreach($sub_affiliates as $_sub_aff) {?>\n		<tr>\n			<td class="text-right"><?php echo $_sub_aff[''level''];?></td>\n			<td class="text-left"><?php echo $_sub_aff[''num''];?></td>\n		</tr>\n		<?php } ?>\n	</tbody>\n	</table>\n	</div>\n	<?php } \n	/* //+mod by yp end */ ?>\n	\n\n]]></add>\n		</operation>\n	</file>\n<!-- LANGUAGE -->\n	<file path="admin/language/*/sale/customer.php">\n		<operation>\n			<search><![CDATA[<?php]]></search>\n			<add position="after"><![CDATA[\n\n//+mod by yp start			\n$_[''entry_affiliate''] = ''Parent Affiliate'';\n$_[''text_select_affiliate''] = ''Select Affiliate'';\n$_[''text_set_none''] = ''Set to None'';\n//+mod by yp end\n\n]]></add>\n		</operation>\n	</file>\n	<file path="admin/language/*/mail/affiliate.php">\n		<operation>\n			<search><![CDATA[<?php]]></search>\n			<add position="after"><![CDATA[\n\n//+mod by yp start			\n$_[''text_payment_received''] = ''You have been sent %s payment!'';\n$_[''text_balance'']    = ''Your current balance is now %s.'';\n$_[''text_transaction_level'']    = '' Level %d'';\n//+mod by yp end\n\n]]></add>\n		</operation>\n	</file>	\n	<file path="catalog/language/*/checkout/checkout.php">\n		<operation>\n			<search><![CDATA[<?php]]></search>\n			<add position="after"><![CDATA[\n			\n$_[''text_order_id'']           = ''Order ID:'';//+mod by yp\n\n]]></add>\n		</operation>\n	</file>\n	<file path="catalog/language/*/mail/affiliate.php">\n		<operation>\n			<search><![CDATA[<?php]]></search>\n			<add position="after"><![CDATA[\n\n//+mod by yp start			\n$_[''text_approve_subject'']      = ''%s - Your Affiliate Account has been activated!'';\n$_[''text_approve_welcome'']      = ''Welcome and thank you for registering at %s!'';\n$_[''text_approve_login'']        = ''Your account has now been created and you can log in by using your email address and password by visiting our website or at the following URL:'';\n$_[''text_approve_services'']     = ''Upon logging in, you will be able to generate tracking codes, track commission payments and edit your account information.'';\n$_[''text_approve_thanks'']       = ''Thanks,'';\n$_[''text_transaction_subject'']  = ''%s - Affiliate Commission'';\n$_[''text_transaction_received''] = ''You have received %s commission!'';\n$_[''text_transaction_total'']    = ''Your total amount of commission is now %s.'';\n$_[''text_transaction_level'']    = '' Level %d'';\n//+mod by yp end\n\n]]></add>\n		</operation>\n	</file>	\n\n	<file path="admin/language/*/*.php">\n		<operation>\n			<search><![CDATA[<?php]]></search>\n			<add position="after"><![CDATA[\n\n//+mod by yp start			\n$_[''word_affiliate''] = ''affiliate'';\n$_[''word_product''] = ''product'';\n$_[''word_coupon''] = ''coupon'';\n$_[''word_discount''] = ''discount'';\n$_[''word_special''] = ''special'';\n//+mod by yp end\n\n]]></add>\n		</operation>\n	</file>	\n	<file path="catalog/language/*/*.php">\n		<operation>\n			<search><![CDATA[<?php]]></search>\n			<add position="after"><![CDATA[\n\n$_[''error_database''] = ''Database Error'';//+mod by yp\n\n]]></add>\n		</operation>\n	</file>\n	<file path="admin/language/*/catalog/product.php">\n		<operation>\n			<search><![CDATA[<?php]]></search>\n			<add position="after"><![CDATA[\n\n//+mod by yp start\n$_[''column_mta_scheme'']      = ''Commission Scheme'';\n$_[''text_edit_mta_schemes'']  = ''Edit Custom Commissions'';\n$_[''entry_mta_schemes''] = ''Custom Commission'';\n$_[''text_hide''] = ''Hide'';\n$_[''text_default''] = ''Default'';\n$_[''tab_scheme''] = ''Commission'';\n$_[''entry_product''] = ''Product:'';\n$_[''entry_coupons''] = ''Coupons:'';\n$_[''text_aff_schemes''] = ''Custom Schemes for Selected Affiliates'';\n$_[''column_affiliates''] = ''Affiliates'';\n$_[''column_coupon''] = ''Coupon'';\n$_[''text_edit_commission''] = ''Edit'';\n$_[''text_add_commission''] = ''Add'';\n\n$_[''button_add_selected''] = ''Add Selected'';\n$_[''button_remove_selected''] = ''Remove Selected'';\n$_[''error_commission_price''] = ''Error: Total commission can not be higher than the price of a product!'';\n//+mod by yp end\n\n]]></add>\n		</operation>\n	</file>	\n	<file path="admin/language/*/report/affiliate.php">\n		<operation>\n			<search><![CDATA[<?php]]></search>\n			<add position="after"><![CDATA[\n\n//+mod by yp start\n$_[''column_current_balance''] = ''Current Balance'';\n$_[''column_total_sales'']     = ''Total Sales'';\n$_[''text_no_payout_account''] = ''This affiliate have not set up any payout account yet !'';\n$_[''entry_current_balance''] = ''Current Balance &gt;= :'';\n//+mod by yp end			\n\n]]></add>\n		</operation>\n	</file>\n	<file path="admin/language/*/marketing/affiliate.php">\n		<operation>\n			<search><![CDATA[<?php]]></search>\n			<add position="after"><![CDATA[\n\n//+mod by yp start\n$_[''text_level''] = ''Level'';\n$_[''text_view_downline''] = ''View Downline'';\n$_[''text_default''] = ''<small>(Default)</small>'';\n$_[''option_default''] = ''Default'';\n$_[''text_select_affiliate''] = ''Select Affiliate'';\n$_[''text_set_none''] = ''Set to None'';\n\n$_[''column_scheme''] = ''Scheme'';\n\n$_[''entry_commission'']          = ''Commission (%):<span class="help">Percentage the affiliate recieves on each order. <strong> Ignored</strong> when using Multi Tier system.</span>'';\n\n$_[''entry_scheme''] = ''Multi Tier Scheme'';\n$_[''entry_parent''] = ''Parent Affiliate'';\n\n$_[''error_database'']            = ''Database Error!'';\n//+mod by yp end\n\n]]></add>\n		</operation>\n	</file>	\n	<file path="admin/language/*/sale/order.php">\n		<operation>\n			<search><![CDATA[<?php]]></search>\n			<add position="after"><![CDATA[\n\n//+mod by yp start\n$_[''text_affiliates'']                         = ''Affiliates:'';\n$_[''text_affiliates_edit_in_view'']            = ''<small>Please use affiliate transactions instead!</small>'';\n$_[''text_edit_order_commission'']              = ''Edit Order Commissions'';\n$_[''column_affiliate'']                        = ''Affiliate'';\n$_[''column_product_name'']                     = ''Product'';\n$_[''column_product_commission'']               = ''Product Commission'';\n$_[''column_scheme'']                           = ''Scheme'';\n$_[''column_total_commission'']                 = ''Total Commission'';\n//+mod by yp end\n\n]]></add>\n		</operation>\n	</file>		\n\n<!-- end LANGUAGE -->	\n\n<!-- 2.1.x customer/customer -->\n	<file path="admin/controller/customer/customer.php">\n		<operation>\n			<search><![CDATA[function getForm() {]]></search>\n			<add position="after"><![CDATA[\n			\n			//+mod by yp start\n			$this->document->addStyle(''view/stylesheet/jquery.dataTables.css'');	\n			foreach(array(''entry_affiliate'', ''text_select_affiliate'', ''text_set_none'', ''text_none'') as $_k) {\n				$data[$_k] = $this->language->get($_k);\n			}\n			//+mod by yp end\n			\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[if (isset($this->request->post[''firstname'']]></search>\n			<add position="before"><![CDATA[\n			\n		//+mod by yp start\n    	if (isset($this->request->post[''affiliate_id''])) {\n      		$data[''affiliate_id''] = $this->request->post[''affiliate_id''];\n		} elseif (!empty($customer_info)) { \n			$data[''affiliate_id''] = $customer_info[''affiliate_id''];\n		} else {\n      		$data[''affiliate_id''] = 0;\n    	}		\n		if($data[''affiliate_id''])	{\n			$this->load->model(''marketing/affiliate'');\n			$_aff = $this->model_marketing_affiliate->getAffiliate($data[''affiliate_id'']);\n			if(is_array($_aff) && isset($_aff[''firstname''])) {\n				$data[''affiliate_name''] = $_aff[''firstname''] . '' '' . $_aff[''lastname''];\n			} else {\n				$data[''affiliate_id''] = 0;\n			}\n		} else {\n			$data[''affiliate_name''] = '''';\n		}\n		if($data[''affiliate_id'']) $data[''affiliate_link''] = $this->url->link(''marketing/affiliate/edit'', ''token='' . $this->session->data[''token''] . ''&affiliate_id='' . $data[''affiliate_id''], ''SSL'');			\n		//+mod by yp end							\n\n]]></add>\n		</operation>		\n		</file>	\n	<file path="admin/model/customer/customer.php">\n		<operation>\n			<search><![CDATA[$customer_id = $this->db->getLastId();]]></search>\n			<add position="after"><![CDATA[\n\n				//+mod by yp start\n				if(isset($data[''affiliate_id'']) && mta_check_int($data[''affiliate_id'']) && $data[''affiliate_id''] > 0) $this->db->query("UPDATE " . DB_PREFIX . "customer SET affiliate_id=''" . (int) $data[''affiliate_id''] . "'' where customer_id=''" . (int) $customer_id . "''");\n				//+mod by yp end\n\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[if ($data[''password'']) {]]></search>\n			<add position="before"><![CDATA[\n\n				//+mod by yp start\n				if(isset($data[''affiliate_id'']) && mta_check_int($data[''affiliate_id''])) $this->db->query("UPDATE " . DB_PREFIX . "customer SET affiliate_id=''" . (int) $data[''affiliate_id''] . "'' where customer_id=''" . (int) $customer_id . "''");\n				//+mod by yp end\n\n]]></add>\n		</operation>		\n	</file>		\n	<file path="admin/view/template/customer/customer_form.tpl">\n		<operation>\n			<search><![CDATA[<?php echo $footer;]]></search>\n			<add position="before"><![CDATA[\n			\n			<?php /* //+mod by yp start	*/ ?>\n<script type="text/javascript" src="view/javascript/jquery.migrate.min.js"></script>\n<script type="text/javascript" src="view/javascript/jquery.dataTables.min.js"></script>\n<script type="text/javascript" src="view/javascript/jquery.tools.min.js"></script>\n<script type="text/javascript"><!--			\n$(document).ready(function() {\n	var _html = ''<div class="form-group"><label class="col-sm-2 control-label" for="input-affiliate-id"><?php echo mta_jsstr($entry_affiliate); ?></label><div class="col-sm-10" id="affiliate_td"><div class="input-group"><span>'';\n				<?php if($affiliate_id) { ?>\n	_html += ''<a href="<?php echo mta_jsstr($affiliate_link); ?>" target="_blank"><?php echo mta_jsstr($affiliate_name); ?></a>'';\n              	<?php } else { ?>\n	_html += ''<?php echo mta_jsstr($text_none); ?>'';\n				<?php } ?>	\n	_html += ''</span><div class="btn-group"><button class="btn btn-default" type="button" rel="#affiliate_dt_overlay_div" id="affiliate_dt_overlay_open"><?php echo mta_jsstr($text_select_affiliate);?></button><button class="btn btn-default" type="button" id="affiliate_set_none"><?php echo mta_jsstr($text_set_none);?></button><input type="hidden" name="affiliate_id" value="<?php echo $affiliate_id;?>" id="input-affiliate-id" /><input type="hidden" name="affiliate_name" value="<?php echo mta_jsstr($affiliate_name);?>" /></div></div></div></div>'';\n	$(''#tab-customer'').append(_html);\n	$.ajax({\n		url: ''index.php?route=mta/mta_pds/datatable&token=<?php echo $token; ?>&add_js=customer'',\n		type: ''get'',\n		dataType: ''html'',\n		success: function(html) {\n			$(''#content'').append(html);\n		}\n	});\n});	\n//--></script>			\n							<?php /* //+mod by yp end\n							*/ ?>	\n							\n]]></add>\n		</operation>\n	</file>	\n	<file path="admin/language/*/customer/customer.php">\n		<operation>\n			<search><![CDATA[<?php]]></search>\n			<add position="after"><![CDATA[\n\n//+mod by yp start			\n$_[''entry_affiliate''] = ''Parent Affiliate'';\n$_[''text_select_affiliate''] = ''Select Affiliate'';\n$_[''text_set_none''] = ''Set to None'';\n//+mod by yp end\n\n]]></add>\n		</operation>\n	</file>\n	\n<file path="admin/controller/marketing/coupon.php">\n		<operation>\n			<search><![CDATA[function getForm() {]]></search>\n			<add position="after"><![CDATA[\n			\n		//+mod by yp start\n		$__cl = strtolower(get_class($this));		\n		preg_match("/^controller(?:(?:catalog)|(?:marketing))(.+)$/", $__cl, $__ar);\n		$data[''page_type''] = $__ar[1];	\n		$etype = $data[''page_type''] === ''coupon'' ? $data[''page_type''] : substr($data[''page_type''], 0, 1);\n		if(isset($this->request->get[$data[''page_type''] . ''_id'']) && $this->request->get[$data[''page_type''] . ''_id'']) {\n			$this->language->load(''mta/mta_pds'');\n			$data[''tab_commission''] = mta_jsstr($this->language->get(''tab_commission''));\n			$data[''tab_general_added''] = mta_jsstr($this->language->get(''tab_general_added''));\n			$data[''mta_do_edit''] = true;\n			$data[''mta_pds_url''] = mta_jsstr($this->url->link(''mta/mta_pds'', ''token='' . $this->session->data[''token''] . ''&type='' . $etype . ''&id='' . intval($this->request->get[$data[''page_type''] . ''_id'']), ''SSL''));\n		}\n		//+mod by yp end	\n		\n		]]></add>\n		</operation>	\n	</file>\n<file path="admin/controller/catalog/manufacturer.php">\n		<operation>\n			<search><![CDATA[function getForm() {]]></search>\n			<add position="after"><![CDATA[\n			\n		//+mod by yp start\n		$__cl = strtolower(get_class($this));		\n		preg_match("/^controller(?:(?:catalog)|(?:marketing))(.+)$/", $__cl, $__ar);\n		$data[''page_type''] = $__ar[1];	\n		$etype = $data[''page_type''] === ''coupon'' ? $data[''page_type''] : substr($data[''page_type''], 0, 1);\n		if(isset($this->request->get[$data[''page_type''] . ''_id'']) && $this->request->get[$data[''page_type''] . ''_id'']) {\n			$this->language->load(''mta/mta_pds'');\n			$data[''tab_commission''] = mta_jsstr($this->language->get(''tab_commission''));\n			$data[''tab_general_added''] = mta_jsstr($this->language->get(''tab_general_added''));\n			$data[''mta_do_edit''] = true;\n			$data[''mta_pds_url''] = mta_jsstr($this->url->link(''mta/mta_pds'', ''token='' . $this->session->data[''token''] . ''&type='' . $etype . ''&id='' . intval($this->request->get[$data[''page_type''] . ''_id'']), ''SSL''));\n		}\n		//+mod by yp end	\n		\n		]]></add>\n		</operation>	\n	</file>\n<file path="admin/controller/catalog/category.php">\n		<operation>\n			<search><![CDATA[function getForm() {]]></search>\n			<add position="after"><![CDATA[\n			\n		//+mod by yp start\n		$__cl = strtolower(get_class($this));		\n		preg_match("/^controller(?:(?:catalog)|(?:marketing))(.+)$/", $__cl, $__ar);\n		$data[''page_type''] = $__ar[1];	\n		$etype = $data[''page_type''] === ''coupon'' ? $data[''page_type''] : substr($data[''page_type''], 0, 1);\n		if(isset($this->request->get[$data[''page_type''] . ''_id'']) && $this->request->get[$data[''page_type''] . ''_id'']) {\n			$this->language->load(''mta/mta_pds'');\n			$data[''tab_commission''] = mta_jsstr($this->language->get(''tab_commission''));\n			$data[''tab_general_added''] = mta_jsstr($this->language->get(''tab_general_added''));\n			$data[''mta_do_edit''] = true;\n			$data[''mta_pds_url''] = mta_jsstr($this->url->link(''mta/mta_pds'', ''token='' . $this->session->data[''token''] . ''&type='' . $etype . ''&id='' . intval($this->request->get[$data[''page_type''] . ''_id'']), ''SSL''));\n		}\n		//+mod by yp end	\n		\n		]]></add>\n		</operation>	\n	</file>	\n	\n</modification>', 1, '2016-01-20 14:32:18');
INSERT INTO `oc_modification` (`modification_id`, `name`, `code`, `author`, `version`, `link`, `xml`, `status`, `date_added`) VALUES
(5, 'Multi tier affiliate system (controllers, models, system)', 'mta160104_1yp', 'YP', '1.6.0104', '', '<?xml version="1.0" encoding="utf-8"?>\n<modification>\n	<id><![CDATA[Multi tier affiliate system for openCart 2 (controllers, models, system)]]></id>\n	<name><![CDATA[Multi tier affiliate system (controllers, models, system)]]></name>	\n	<version><![CDATA[1.6.0104]]></version>	\n	<code><![CDATA[mta160104_1yp]]></code>	\n	<author><![CDATA[YP]]></author>\n	<file path="admin/controller/catalog/product.php">\n		<operation>\n			<search><![CDATA[private $error = array();]]></search>\n			<add position="after"><![CDATA[\n\n	//+mod by yp start\n	private $_coupons = false;\n\n	private function _get_schemes() {				\n		$_s = $this->model_mta_mta_product->getSchemes(array(''fields'' => array(''mta_scheme_id as id'', ''scheme_name as n'')));\n		$out = array();\n		foreach($_s as $_s2) {\n			$out[strval($_s2[''id''])] = $_s2[''n''];\n		}\n		return $out;\n	}	\n\n	private function _check_coupons($max_comm, $price, $coupon_id) {\n		$coupons = $this->_get_coupons();\n		if(isset($coupons[$coupon_id]) && $max_comm >= ($price - ($price * 0.01 * floatval($coupons[$coupon_id][''discount''])))) return false;\n		return true;		\n	}\n	\n	private function _get_coupons() {\n		if($this->_coupons === false) {\n			$this->load->model(''marketing/coupon'');\n			$_coupons = $this->model_marketing_coupon->getCoupons();\n			$this->_coupons = array();\n			foreach($_coupons as $_coupon) {\n				$this->_coupons[$_coupon[''coupon_id'']] = $_coupon;\n			}\n		}\n		return $this->_coupons;\n	}\n	\n	private function _count_product_scheme_usage($product_id) {		\n		return array_merge($this->model_mta_mta_product_affiliate->countProductUsage($product_id, ''product_affiliate''), $this->model_mta_mta_product_affiliate->countProductUsage($product_id));\n	}\n\n	public function get_affiliates() {\n		$this->load->model(''mta/mta_product_affiliate'');\n		$product_id = $this->request->request[''product_id''];\n		if($product_id && mta_check_int($product_id)) {\n			$mod_type = isset($this->request->request[''mod_type'']) && in_array($this->request->request[''mod_type''], array(''coupon'', ''discount'', ''special'')) ? $this->request->request[''mod_type''] : '''';\n  			if(isset($this->request->request[''mod_id'']) && preg_match("/^new/", $this->request->request[''mod_id''])) {\n  				$this->response->setOutput(json_encode(array()));			\n  				return;\n  			}\n  			$mod_id = isset($this->request->request[''mod_id'']) && mta_check_int($this->request->request[''mod_id'']) ? $this->request->request[''mod_id''] : 0;\n  			$ret = $this->model_mta_mta_product_affiliate->getProductAffiliates($product_id, $mod_type, $mod_id);\n		} else {\n			$ret = ''0'';\n		}\n		$this->response->setOutput(json_encode($ret));			\n	}\n	//+mod by yp end\n\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[public function edit() {]]></search>\n			<add position="after"><![CDATA[\n			\n		//+mod by yp start\n		$this->language->load(''catalog/product'');\n		$this->load->model(''catalog/product'');\n		$this->document->addStyle(''view/stylesheet/jquery.dataTables.css'');\n		$this->load->model(''mta/mta_product'');\n		$this->load->model(''mta/mta_product_affiliate'');\n		\n		$data[''schemes''] = $this->_get_schemes();	\n		$data[''schemes0''] = array(''0'' => $this->language->get(''text_default''));\n		foreach($data[''schemes''] as $_k => $_v) {\n			$data[''schemes0''][strval($_k)] = $_v;\n		}		\n		//+mod by yp end\n		\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[$product_total = $this->model_catalog_product->getTotalProducts($filter_data);]]></search>\n			<add position="after"><![CDATA[\n			\n		//+mod by yp start\n		$this->document->addScript(''view/javascript/mta/product_list.js'');\n		$data[''column_mta_scheme''] = $this->language->get(''column_mta_scheme'');\n		$data[''text_edit_mta_schemes''] = $this->language->get(''text_edit_mta_schemes'');\n		$data[''entry_mta_schemes''] = $this->language->get(''entry_mta_schemes'');\n		$data[''text_hide''] = $this->language->get(''text_hide'');	\n\n		$data[''mta_scheme_types''] = array(			\n			''product'' => ''p'',			\n			''product_discount'' => ''p_d'',\n			''product_special'' => ''p_s'',\n			''product_coupon'' => ''p_c'',\n			''product_affiliate'' => ''pa'',\n			''product_affiliate_discount'' => ''pa_d'',\n			''product_affiliate_special'' => ''pa_s'',\n			''product_affiliate_coupon'' => ''pa_c''	\n		);\n		$data[''mta_scheme_types_lng''] = array();\n		$_trans = array();\n		foreach($data[''mta_scheme_types''] as $_k => $_v) {\n			$_kAr = explode(''_'', $_k);\n			$_kAr2 = array();\n			foreach($_kAr as $_k2) {\n				if(!isset($_trans[$_k2])) $_trans[$_k2] = $this->language->get(''word_'' . $_k2);\n				$_kAr2[] = ucfirst($_trans[$_k2]);\n			}\n			$data[''mta_scheme_types_lng''][$_k] = implode('' / '', $_kAr2);\n		}\n		$this->load->model(''mta/mta_product_affiliate'');\n		//+mod by yp end\n		\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[$data[''products''][] = array(]]></search>\n			<add position="before"><![CDATA[\n			\n			//+mod by yp start			\n			$_s = $this->model_mta_mta_product_affiliate->getProductScheme($result[''product_id'']);\n			$_sc = $this->_count_product_scheme_usage($result[''product_id'']);\n			$_st = array_sum(array_values($_sc));\n			\n			foreach($data[''mta_scheme_types''] as $_k => $_v) {\n				if(!isset($_sc[$_k])) $_sc[$_k] = 0;\n			}			\n			//+mod by yp end\n			\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[$data[''products''][] = array(]]></search>\n			<add position="after"><![CDATA[\n			\n      //+mod by yp start\n      ''mta_scheme'' => ($_s ? $_s[''name''] : $this->language->get(''text_default'')),\n      ''mta_scheme_count'' => $_sc,\n	  ''mta_scheme_total'' => $_st,\n	  //+mod by yp end\n	  \n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[$data[''tab_design''] = $this->language->get(''tab_design'');]]></search>\n			<add position="after"><![CDATA[\n			\n//+mod by yp start\n$data[''text_aff_schemes''] = $this->language->get(''text_aff_schemes'');\n$data[''text_edit''] = $this->language->get(''text_edit'');			\n$data[''text_add''] = $this->language->get(''text_add'');	\n$data[''entry_product''] = $this->language->get(''entry_product'');	\n$data[''entry_coupons''] = $this->language->get(''entry_coupons'');	\n$data[''tab_scheme''] = $this->language->get(''tab_scheme'');	\n$data[''column_affiliates''] = $this->language->get(''column_affiliates'');			\n$data[''column_mta_scheme''] = $this->language->get(''column_mta_scheme'');			\n$data[''button_add_selected''] = $this->language->get(''button_add_selected'');			\n$data[''button_remove_selected''] = $this->language->get(''button_remove_selected'');\n$data[''column_coupon''] = $this->language->get(''column_coupon'');\n\n\n  		if(isset($this->request->get[''product_id'']) && (!mta_check_int($this->request->get[''product_id'']) || $this->request->get[''product_id''] < 1)) unset($this->request->get[''product_id'']);\n  		$_do_edit = (isset($this->request->get[''product_id''])); 		\n  		if($_do_edit) {\n  			$data[''product_id''] = $product_id = $this->request->get[''product_id''];\n				$_psch = $this->model_mta_mta_product->getProductScheme($product_id);\n				$data[''product_scheme_id''] = $_psch && isset($_psch[''id'']) ? $_psch[''id''] : 0;\n				$all_sub_schemes = $this->model_mta_mta_product->getAllProductSubSchemes($product_id);\n\n				$coupons = $this->_get_coupons();\n				$data[''coupons''] = array();\n				foreach($coupons as $_coupon) {\n					$data[''coupons''][] = array(\n						''id'' => $_coupon[''coupon_id''],\n						''description'' => ($_coupon[''name''] . ''<br />(%'' . intval($_coupon[''discount'']) . '')<br />'' . date(''d/m/Y'', strtotime($_coupon[''date_start''])) . '' - '' . date(''d/m/Y'', strtotime($_coupon[''date_end'']))),\n						''scheme_id'' => (isset($all_sub_schemes[''coupon''][strval($_coupon[''coupon_id''])]) ? $all_sub_schemes[''coupon''][strval($_coupon[''coupon_id''])] : ''0'')\n					);\n				}\n  			\n  		}\n  	//+mod by yp end\n			\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[$this->model_catalog_product->getProductDiscounts($this->request->get[''product_id'']);]]></search>\n			<add position="after"><![CDATA[\n			\n			//+mod by yp start\n			foreach($product_discounts as $_did => $_d) {\n				$product_discounts[$_did][''scheme_id''] = isset($all_sub_schemes[''discount''][$_d[''product_discount_id'']]) && $all_sub_schemes[''discount''][$_d[''product_discount_id'']] ? $all_sub_schemes[''discount''][$_d[''product_discount_id'']] : ''0'';\n			}			\n			//+mod by yp end\n			\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[$data[''product_discounts''][] = array(]]></search>\n			<add position="after"><![CDATA[\n			\n			//+mod by yp start\n			''product_discount_id'' => (isset($product_discount[''product_discount_id'']) ? $product_discount[''product_discount_id''] : ''''),\n			''scheme_id'' => (isset($product_discount[''scheme_id'']) ? $product_discount[''scheme_id''] : ''0''),\n			//+mod by yp end\n			\n]]></add>\n		</operation>		\n		<operation>\n			<search><![CDATA[$this->model_catalog_product->getProductSpecials($this->request->get[''product_id'']);]]></search>\n			<add position="after"><![CDATA[\n			\n			//+mod by yp start\n			foreach($product_specials as $_did => $_d) {\n				$product_specials[$_did][''scheme_id''] = isset($all_sub_schemes[''special''][$_d[''product_special_id'']]) && $all_sub_schemes[''special''][$_d[''product_special_id'']] ? $all_sub_schemes[''special''][$_d[''product_special_id'']] : ''0'';\n			}			\n			//+mod by yp end\n			\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[$data[''product_specials''][] = array(]]></search>\n			<add position="after"><![CDATA[\n			\n			//+mod by yp start\n			''product_special_id'' => (isset($product_special[''product_special_id'']) ? $product_special[''product_special_id''] : ''''),\n			''scheme_id'' => (isset($product_special[''scheme_id'']) ? $product_special[''scheme_id''] : ''0''),\n			//+mod by yp end\n			\n]]></add>\n		</operation>		\n		<operation>\n			<search><![CDATA[$this->model_design_layout->getLayouts();]]></search>\n			<add position="after"><![CDATA[\n			\n		//+mod by yp start\n		$data[''do_edit''] = $_do_edit;\n		if($_do_edit) $data[''link_commission_tab''] = mta_jsstr($this->url->link(''mta/mta_pds/product_commission'', ''token='' . $this->session->data[''token''] . ''&product_id='' . $data[''product_id''], ''SSL''));\n		//+mod by yp end\n		\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[if ($this->error && !isset($this->error[''warning''])) {]]></search>\n			<add position="before"><![CDATA[\n			\n			//+mod by yp start\n			if(isset($this->request->request[''product_id''])) {\n				$_schemes = $this->model_mta_mta_product->getSchemes(array(''fields'' => array(''mta_scheme_id as id'', ''commission_type'')));\n				$schemes = array();			\n				foreach($_schemes as $_s) {				\n					if($_s[''commission_type''] == ''fixed'') $schemes[strval($_s[''id''])] = $this->model_mta_mta_product->getMaxTotalCommission($_s[''id'']);\n				} \n				if(sizeof($schemes) > 0) {					\n					$p =& $this->request->post;\n					\n					if(isset($p[''product_scheme_id'']) && isset($schemes[$p[''product_scheme_id'']]) && $p[''price''] <= $schemes[$p[''product_scheme_id'']]) $this->error[''warning''] = $this->language->get(''error_commission_price'');\n					if(!$this->error) {\n				 		foreach($schemes as $_id => $_max) {\n				 			if(false && isset($p[''product_affiliates''][$_id]) && sizeof($p[''product_affiliates''][$_id]) > 0 && $p[''price''] <= $_max) {\n				 				$this->error[''warning''] = $this->language->get(''error_commission_price'');\n				 				break;				 			\n				 			}\n				 		}				 	  	\n				 	}\n				 	if(!$this->error && isset($p[''product_coupon_scheme_id''])) {\n				 		foreach($p[''product_coupon_scheme_id''] as $_cid => $_sid) {\n				 			if($_sid && isset($schemes[$_sid]) && !$this->_check_coupons($schemes[$_sid], $p[''price''], $_cid)) {\n			 					$this->error[''warning''] = $this->language->get(''error_commission_price'');\n			 					break;\n				 			}\n				 		}				 		\n					}\n					if(!$this->error && isset($p[''product_coupon_affiliates''])) {\n						foreach($p[''product_coupon_affiliates''] as $_cid => $_sAr) {\n							foreach($_sAr as $_sid => $_affs) {\n								if($_affs && isset($schemes[$_sid]) && !$this->_check_coupons($schemes[$_sid], $p[''price''], $_cid)) {\n				 					$this->error[''warning''] = $this->language->get(''error_commission_price'');\n			 						break 2;								\n								}\n							}							\n						}					\n					}\n					if(!$this->error && isset($p[''product_discount''])) {\n						foreach($p[''product_discount''] as $_i => $_d) {\n							if(isset($_d[''scheme_id'']) && isset($schemes[$_d[''scheme_id'']]) && $schemes[$_d[''scheme_id'']] >= $_d[''price'']) {\n			 					$this->error[''warning''] = $this->language->get(''error_commission_price'');\n			 					break;								\n							}							\n							if(isset($p[''product_discount_affiliates''][$_i])) {\n								foreach($p[''product_discount_affiliates''][$_i] as $_sid => $_affs) {\n									if($_affs && isset($schemes[$_sid]) &&  $schemes[$_sid] >= $_d[''price'']) {\n			 							$this->error[''warning''] = $this->language->get(''error_commission_price'');\n			 							break 2;								\n									}\n								}\n							}\n						}\n					}\n\n					if(!$this->error && isset($p[''product_special''])) {\n						foreach($p[''product_special''] as $_i => $_d) {\n							if(isset($_d[''scheme_id'']) && isset($schemes[$_d[''scheme_id'']]) && $schemes[$_d[''scheme_id'']] >= $_d[''price'']) {\n			 					$this->error[''warning''] = $this->language->get(''error_commission_price'');\n			 					break;								\n							}							\n							if(isset($p[''product_special_affiliates''][$_i])) {\n								foreach($p[''product_special_affiliates''][$_i] as $_sid => $_affs) {\n									if($_affs && isset($schemes[$_sid]) &&  $schemes[$_sid] >= $_d[''price'']) {\n			 							$this->error[''warning''] = $this->language->get(''error_commission_price'');\n			 							break 2;								\n									}\n								}\n							}\n						}\n					}				\n				}\n			}\n			//+mod by yp end\n			\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[function getForm() {]]></search>\n			<add position="after"><![CDATA[\n		\n		//+mod by yp start\n		$this->load->model(''mta/mta_product'');		\n		$data[''schemes''] = $this->_get_schemes();	\n		$data[''schemes0''] = array(''0'' => $this->language->get(''text_default''));\n		foreach($data[''schemes''] as $_k => $_v) {\n			$data[''schemes0''][strval($_k)] = $_v;\n		}		\n		//+mod by yp end\n			\n]]></add>\n		</operation>		\n	</file>	\n	<file path="admin/controller/marketing/affiliate.php">\n		<operation>\n			<search><![CDATA[$data[''transactions''] = array();]]></search>\n			<add position="after"><![CDATA[\n\n			$plimit = intval($this->config->get(''config_limit_admin''));//+mod by yp\n			\n]]></add>\n		</operation>	\n		<operation>\n			<search><![CDATA[$results = $this->model_marketing_affiliate->getTransactions($this->request->get[''affiliate_id''], ($page - 1) * 10, 10);]]></search>\n			<add position="replace"><![CDATA[$results = $this->model_marketing_affiliate->getTransactions($this->request->get[''affiliate_id''], ($page - 1) * $plimit, $plimit);//+mod by yp]]></add>\n		</operation>	\n		<operation>\n			<search><![CDATA[$data[''results''] = sprintf($this->language->get(''text_pagination''), ($transaction_total) ? (($page - 1) * 10) + 1 : 0, ((($page - 1) * 10) > ($transaction_total - 10)) ? $transaction_total : ((($page - 1) * 10) + 10), $transaction_total, ceil($transaction_total / 10));]]></search>\n			<add position="replace"><![CDATA[$data[''results''] = sprintf($this->language->get(''text_pagination''), ($transaction_total) ? (($page - 1) * $plimit) + 1 : 0, ((($page - 1) * $plimit) > ($transaction_total - $plimit)) ? $transaction_total : ((($page - 1) * $plimit) + $plimit), $transaction_total, ceil($transaction_total / $plimit));//+mod by yp]]></add>\n		</operation>			\n		<operation>\n			<search><![CDATA[private $error = array();]]></search>\n			<add position="after"><![CDATA[\n\n			private $_schemes = false;//+mod by yp\n			\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[public function add() {]]></search>\n			<add position="after"><![CDATA[\n			\n//+mod by yp start		\n$this->language->load(''marketing/affiliate'');			\n$this->document->addStyle(''view/stylesheet/jquery.dataTables.css'');\n//+mod by yp end\n\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[public function edit() {]]></search>\n			<add position="after"><![CDATA[\n			\n//+mod by yp start		\n$this->language->load(''marketing/affiliate'');			\n$this->document->addStyle(''view/stylesheet/jquery.dataTables.css'');\n//+mod by yp end\n\n]]></add>\n		</operation>	\n		<operation>\n			<search><![CDATA[$affiliate_total = $this->model_marketing_affiliate->getTotalAffiliates($filter_data);]]></search>\n			<add position="after"><![CDATA[\n			\n		$this->_get_schemes();//+mod by yp\n		\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[=> $result[''email''],]]></search>\n			<add position="after"><![CDATA[ \n			\n//+mod by yp start\n''scheme'' => ($result[''scheme_id''] ? $this->_schemes[$result[''scheme_id'']] : $this->language->get(''text_default'')),\n''level'' => $result[''level''], \n// +mod by yp end\n\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[$data[''button_filter''] = $this->language->get(''button_filter'');]]></search>\n			<add position="after"><![CDATA[		\n			\n		//+mod by yp start\n		$data[''text_level''] = $this->language->get(''text_level'');		\n		$data[''column_scheme''] = $this->language->get(''column_scheme'');\n		//+mod by yp end\n		\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[$data[''text_bank''] = $this->language->get(''text_bank'');]]></search>\n			<add position="after"><![CDATA[	\n			\n		//+mod by yp start\n		$data[''text_none''] = $this->language->get(''text_none'');\n		$data[''text_level''] = $this->language->get(''text_level'');	\n		$data[''option_default''] = $this->language->get(''option_default'');\n		$data[''text_select_affiliate''] = $this->language->get(''text_select_affiliate'');\n		$data[''text_set_none''] = $this->language->get(''text_set_none'');\n 		$data[''entry_parent''] = $this->language->get(''entry_parent'');//+mod by yp\n 		$data[''entry_scheme''] = $this->language->get(''entry_scheme'');//+mod by yp\n		//+mod by yp end\n		\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[if (isset($this->request->get[''affiliate_id'']) && ($this->request->server[''REQUEST_METHOD''] != ''POST'')) {]]></search>\n			<add position="before"><![CDATA[\n			\n		//+mod by yp start    	\n    	$this->_get_schemes();\n    	$data[''schemes''] = $this->_schemes;\n    	$this->load->model(''mta/mta_affiliate'');		\n		//+mod by yp end\n		\n]]></add>\n		</operation>		\n		<operation>\n			<search><![CDATA[$affiliate_info = $this->model_marketing_affiliate->getAffiliate($this->request->get[''affiliate_id'']);]]></search>\n			<add position="after"><![CDATA[\n			\n$affiliate_info_mta = $this->model_mta_mta_affiliate->getAffiliate($this->request->get[''affiliate_id''], true);//+mod by yp\n\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[if (isset($this->request->post[''firstname''])) {]]></search>\n			<add position="before"><![CDATA[\n			\n	//+mod by yp start\n    $data[''level''] = isset($affiliate_info_mta[''level_original'']) ? $affiliate_info_mta[''level_original''] : 1;\n	if(isset($affiliate_info_mta[''level_original''])) {\n		$data[''text_view_downline''] = $this->language->get(''text_view_downline'');\n		$data[''link_downline''] = $this->url->link(''mta/affiliate_downline'', ''token='' . $this->session->data[''token''] . ''&affiliate_id='' . $affiliate_info[''affiliate_id''], ''SSL'');\n	} else {\n		$data[''text_view_downline''] = '''';\n		$data[''link_downline''] = '''';\n	}	\n\n    if (isset($this->request->post[''parent_affiliate_id''])) {\n      		$data[''parent_affiliate_id''] = $this->request->post[''parent_affiliate_id''];\n		} elseif (!empty($affiliate_info_mta)) { \n			$data[''parent_affiliate_id''] = $affiliate_info_mta[''parent_affiliate_id''];\n		} else {\n      		$data[''parent_affiliate_id''] = '''';\n    }\n    if($data[''parent_affiliate_id'']) $data[''parent_affiliate_link''] = $this->url->link(''marketing/affiliate/edit'', ''token='' . $this->session->data[''token''] . ''&affiliate_id='' . $data[''parent_affiliate_id''], ''SSL'');\n			\n    if (isset($this->request->post[''parent_affiliate_name''])) {\n      		$data[''parent_affiliate_name''] = $this->request->post[''parent_affiliate_name''];\n		} elseif (!empty($affiliate_info_mta)) { \n			$data[''parent_affiliate_name''] = (isset($affiliate_info_mta[''parent_affiliate_name'']) ? $affiliate_info_mta[''parent_affiliate_name''] : '''');\n		} else {\n      		$data[''parent_affiliate_name''] = '''';\n    }					\n\n    if (isset($this->request->post[''scheme_id''])) {\n      		$data[''scheme_id''] = $this->request->post[''scheme_id''];\n		} elseif (!empty($affiliate_info_mta)) { \n			$data[''scheme_id''] = $affiliate_info_mta[''scheme_id''];\n		} else {\n     	$data[''scheme_id''] = 0;\n    }\n	//+mod by yp end\n	\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[public function autocomplete() {]]></search>\n			<add position="before"><![CDATA[\n			\n	//+mod by yp start	\n	private function _get_schemes() {\n		if($this->_schemes) return;\n		$this->load->model(''mta/mta_scheme'');\n		$_s = $this->model_mta_mta_scheme->getSchemes(array(''fields'' => array(''mta_scheme_id as id'', ''scheme_name as n'')));\n		$this->_schemes = array();\n		foreach($_s as $_s2) {\n			$this->_schemes[$_s2[''id'']] = $_s2[''n''];\n		}\n\n	}		\n	//+mod by yp end\n	\n]]></add>\n		</operation>\n	</file>	\n	<file path="admin/controller/report/affiliate.php">\n		<operation>\n			<search><![CDATA[$this->load->language(''report/affiliate'');]]></search>\n			<add position="after"><![CDATA[\n\n		$filter_balance = isset($this->request->get[''filter_balance'']) && mta_check_int($this->request->get[''filter_balance'']) ? $this->request->get[''filter_balance''] : 0;//+mod by yp\n\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[$data[''breadcrumbs''] = array();]]></search>\n			<add position="before"><![CDATA[\n			\n		if(isset($this->request->get[''filter_balance''])) $url .= ''&filter_balance='' . $this->request->get[''filter_balance''];//+mod by yp\n		\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[''filter_date_start''	=> $filter_date_start,]]></search>\n			<add position="before"><![CDATA[\n			\n''filter_balance'' => $filter_balance,//+mod by yp\n\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[$results = $this->model_report_affiliate->getCommission($filter_data);]]></search>\n			<add position="after"><![CDATA[\n			\n$affiliate_ids = array();//+mod by yp\n\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[$data[''affiliates''][] = array(]]></search>\n			<add position="before"><![CDATA[\n			\n$affiliate_ids[] = intval($result[''affiliate_id'']);//+mod by yp\n\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[''affiliate''  => $result[''affiliate'']]></search>\n			<add position="before"><![CDATA[\n			\n				//+mod by yp start\n				''affiliate_id'' => intval($result[''affiliate_id'']),\n				''commission'' => $this->currency->format($result[''commission''], $this->config->get(''config_currency'')),\n				''total_earnings'' => $this->currency->format((isset($result[''total_earnings'']) ? $result[''total_earnings''] : 0), $this->config->get(''config_currency'')),\n				//+mod by yp end\n\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[$data[''heading_title''] = $this->language->get(''heading_title'');]]></search>\n			<add position="before"><![CDATA[\n			\n		//+mod by yp start\n		$this->load->model(''mta/mta_affiliate'');\n		$data[''payout_accounts''] = $this->model_mta_mta_affiliate->getPayoutAccounts($affiliate_ids);\n		foreach(array(''column_current_balance'', ''text_no_payout_account'', ''entry_current_balance'', ''column_total_sales'') as $_v) {\n			$data[$_v] = $this->language->get($_v);		\n		}\n		//+mod by yp end\n		\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[$pagination = new Pagination();]]></search>\n			<add position="before"><![CDATA[\n			\nif(isset($this->request->get[''filter_balance''])) $url .= ''&filter_balance='' . $this->request->get[''filter_balance''];//+mod by yp\n\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[$data[''header''] = $this->load->controller(''common/header'');]]></search>\n			<add position="before"><![CDATA[\n			\n$data[''filter_balance''] = $filter_balance;//+mod by yp\n\n]]></add>\n		</operation>\n	</file>	\n	<file path="admin/controller/sale/customer.php">\n		<operation>\n			<search><![CDATA[function getForm() {]]></search>\n			<add position="after"><![CDATA[\n			\n			//+mod by yp start\n			$this->document->addStyle(''view/stylesheet/jquery.dataTables.css'');	\n			foreach(array(''entry_affiliate'', ''text_select_affiliate'', ''text_set_none'', ''text_none'') as $_k) {\n				$data[$_k] = $this->language->get($_k);\n			}\n			//+mod by yp end\n			\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[if (isset($this->request->post[''firstname'']]></search>\n			<add position="before"><![CDATA[\n			\n		//+mod by yp start\n    	if (isset($this->request->post[''affiliate_id''])) {\n      		$data[''affiliate_id''] = $this->request->post[''affiliate_id''];\n		} elseif (!empty($customer_info)) { \n			$data[''affiliate_id''] = $customer_info[''affiliate_id''];\n		} else {\n      		$data[''affiliate_id''] = 0;\n    	}		\n		if($data[''affiliate_id''])	{\n			$this->load->model(''marketing/affiliate'');\n			$_aff = $this->model_marketing_affiliate->getAffiliate($data[''affiliate_id'']);\n			if(is_array($_aff) && isset($_aff[''firstname''])) {\n				$data[''affiliate_name''] = $_aff[''firstname''] . '' '' . $_aff[''lastname''];\n			} else {\n				$data[''affiliate_id''] = 0;\n			}\n		} else {\n			$data[''affiliate_name''] = '''';\n		}\n		if($data[''affiliate_id'']) $data[''affiliate_link''] = $this->url->link(''marketing/affiliate/edit'', ''token='' . $this->session->data[''token''] . ''&affiliate_id='' . $data[''affiliate_id''], ''SSL'');			\n		//+mod by yp end							\n\n]]></add>\n		</operation>		\n		</file>	\n	<file path="admin/controller/sale/order.php">\n		<operation>\n			<search><![CDATA[function getForm() {]]></search>\n			<add position="after"><![CDATA[\n			\n			//+mod by yp start\n			$data[''text_affiliates_edit_in_view''] = $this->language->get(''text_affiliates_edit_in_view'');\n			if(isset($this->request->request[''order_id''])) {\n				$data[''text_edit_order_commission''] = $this->language->get(''text_edit_order_commission'');\n				$data[''link_edit_order_commission''] = $this->url->link(''mta/mta/order_commission'', ''token='' . $this->session->data[''token''] . ''&order_id='' . $this->request->request[''order_id''], ''SSL'');\n			} else {\n				$data[''link_edit_order_commission''] = '''';\n			}\n			//+mod by yp end\n			\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[(''button_history_add'');]]></search>\n			<add position="after"><![CDATA[\n			\n			//+mod by yp start\n			$data[''text_affiliates''] = $this->language->get(''text_affiliates'');\n			$data[''text_affiliates_edit_in_view''] = $this->language->get(''text_affiliates_edit_in_view'');\n			if(isset($this->request->request[''order_id''])) {\n				$data[''text_edit_order_commission''] = $this->language->get(''text_edit_order_commission'');\n				$data[''link_edit_order_commission''] = $this->url->link(''mta/mta/order_commission'', ''token='' . $this->session->data[''token''] . ''&order_id='' . $this->request->request[''order_id''], ''SSL'');\n			} else {\n				$data[''link_edit_order_commission''] = '''';\n			}\n			foreach(array(''column_affiliate'', ''column_product_name'', ''column_product_commission'', ''column_scheme'', ''column_total_commission'') as $_v) {\n				$data[$_v] = $this->language->get($_v);		\n			}\n			//+mod by yp end\n			\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[if ($order_info[''affiliate_id'']) {]]></search>\n			<add position="before"><![CDATA[\n			\n//+mod by yp start			\n$data[''text_edit_order_commission''] = $this->language->get(''text_edit_order_commission'');\n$data[''link_edit_order_commission''] = $this->url->link(''mta/mta/order_commission'', ''token='' . $this->session->data[''token''] . ''&order_id='' . $this->request->request[''order_id''], ''SSL'');\n\n/*\n//+mod by yp end\n\n]]></add>\n		</operation>\n		<operation>\n		<search><![CDATA[getTotalTransactionsByOrderId($this->request->get[''order_id'']);]]></search>\n			<add position="after"><![CDATA[\n			\n			//+mod by yp start\n*/\n			$this->document->addScript(''view/javascript/mta/order_info.js'');\n			$this->load->model(''marketing/affiliate'');\n			$_aff_infos = $this->model_marketing_affiliate->getOrderCommissions($this->request->get[''order_id'']);\n			if ($order_info[''affiliate_id''] || $_aff_infos) {\n				if(!$_aff_infos) {\n					$data[''affiliates''] = false;\n					$data[''affiliate''] = $this->url->link(''marketing/affiliate/edit'', ''token='' . $this->session->data[''token''] . ''&affiliate_id='' . $order_info[''affiliate_id''], ''SSL'');\n					$data[''commission''] = $this->currency->format($order_info[''commission''], $order_info[''currency_code''], $order_info[''currency_value'']);\n						\n					$this->load->model(''marketing/affiliate'');\n			\n					$data[''commission_total''] = $this->model_marketing_affiliate->getTotalTransactionsByOrderId( $this->request->get[''order_id''] ); \n				} else {\n					$data[''text_none''] = $this->language->get(''text_none'');				\n					$data[''affiliate''] = false;\n					$data[''affiliates''] = array();\n					$__ars = array();\n					foreach($_aff_infos as $_aff_info) {\n						$__ar = array(\n							''affiliate_name'' => $_aff_info[''affiliate_name''],\n							''commission'' => $this->currency->format($_aff_info[''commission''], $order_info[''currency_code''], $order_info[''currency_value'']),\n							''commission_total'' => $this->currency->format($_aff_info[''commission_total''], $order_info[''currency_code''], $order_info[''currency_value'']),\n							''commission_added'' => (bool) $_aff_info[''commission_added''],\n							''product_name'' => $_aff_info[''product_name''],\n							''affiliate_id'' => $_aff_info[''affiliate_id''],\n							''affiliate_link'' => $this->url->link(''marketing/affiliate/edit'', ''token='' . $this->session->data[''token''] . ''&affiliate_id='' . $_aff_info[''affiliate_id''], ''SSL''),\n							''affiliate_scheme_id'' => $_aff_info[''scheme_id''],\n							''affiliate_scheme_name'' => ($_aff_info[''scheme_id''] ? $_aff_info[''scheme_name''] : ''''),\n							''affiliate_scheme_link'' => ($_aff_info[''scheme_id''] ? $this->url->link(''mta/mta/update'', ''token='' . $this->session->data[''token''] . ''&id='' . $_aff_info[''scheme_id''], ''SSL'') : ''''),\n							''mta_order_id'' => $_aff_info[''mta_order_id'']\n						);			\n						$__ars[] = $__ar;\n					}		\n					$__ar2 = array();\n					foreach($__ars as $__r) {\n						if(!isset($__ar2[$__r[''mta_order_id'']])) $__ar2[$__r[''mta_order_id'']] = array();\n						$__ar2[$__r[''mta_order_id'']][] = $__r;							\n					}\n					ksort($__ar2);\n					foreach($__ar2 as $_moi => $__r) {\n						$__sz = sizeof($__r);\n						$__ar2[$_moi] = $__r[0];								\n						if($__sz > 1) $__ar2[$_moi][''data''] = $__r;\n						$__ar2[$_moi][''num_rows''] = $__sz;\n					}					\n					$data[''affiliates''] = array_values($__ar2);\n				}\n			} else {\n				$data[''affiliate''] = '''';			\n				$data[''affiliates''] = '''';			\n			}			\n			//+mod by yp end\n			\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[$affiliate_total = $this->model_marketing_affiliate->getTotalTransactionsByOrderId]]></search>\n			<add position="before"><![CDATA[\n\n		//+mod by yp start\n		if(isset($this->request->request[''affiliate_id''])) {\n			$this->_addMtaCommission($order_id, $this->request->request[''affiliate_id'']);\n			return;\n		}\n		//+mod by yp end\n		\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[$this->model_marketing_affiliate->deleteTransaction($order_id);]]></search>\n			<add position="before"><![CDATA[\n			\n		//+mod by yp start\n		if(isset($this->request->request[''affiliate_id''])) {\n			$this->_removeMtaCommission($order_id, $this->request->request[''affiliate_id'']);\n			return;\n		}\n		//+mod by yp end		\n		\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[public function index(]]></search>\n			<add position="before"><![CDATA[\n\n	//+mod by yp start\n	protected function _addMtaCommission($order_id, $affiliate_id) {\n		$this->language->load(''sale/order'');\n		$json = array();    	\n		\n		$this->load->model(''marketing/affiliate'');\n		if($this->model_marketing_affiliate->addMtaTransaction($order_id, $affiliate_id, $this->language->get(''text_order_id'') . '' #'' . $order_id)) {\n			$json[''success''] = $this->language->get(''text_commission_added'');\n		} else {\n			$json[''error''] = $this->language->get(''error_action'');\n		}		\n		$this->response->addHeader(''Content-Type: application/json'');\n		$this->response->setOutput(json_encode($json));\n	}\n\n	protected function _removeMtaCommission($order_id, $affiliate_id) {\n		$this->language->load(''sale/order'');\n		$json = array(); \n\n		$this->load->model(''marketing/affiliate'');\n		if($this->model_marketing_affiliate->deleteMtaTransaction($order_id, $affiliate_id)) {\n			$json[''success''] = $this->language->get(''text_commission_added'');\n		} else {\n			$json[''error''] = $this->language->get(''error_action'');\n		}		\n		$this->response->addHeader(''Content-Type: application/json'');\n		$this->response->setOutput(json_encode($json));		\n    }			\n	//+mod by yp end\n	\n]]></add>\n		</operation>\n	</file>			\n	<file path="admin/model/marketing/affiliate.php">\n		<operation>\n			<search><![CDATA[function editAffiliate($affiliate_id, $data) {]]></search>\n			<add position="after"><![CDATA[\n			\n			if(!isset($data[''payment''])) $data[''payment''] = '''';//+mod by yp\n			\n			]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[function addAffiliate($data) {]]></search>\n			<add position="after"><![CDATA[\n			\n			if(!isset($data[''payment''])) $data[''payment''] = '''';//+mod by yp\n			\n			]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[function getAffiliates($data = array()) {]]></search>\n			<add position="after"><![CDATA[\n			\n			return $this->getAffiliatesMta($data);//+mod by yp\n			\n]]></add>\n		</operation>		\n		<operation>\n			<search><![CDATA[function getTotalAffiliates($data = array()) {]]></search>\n			<add position="after"><![CDATA[\n			\n			return $this->getTotalAffiliatesMta($data);//+mod by yp\n			\n]]></add>\n		</operation>		\n		<operation>\n			<search><![CDATA[$this->currency->format($this->getTransactionTotal($affiliate_id), $this->config->get(''config_currency'')));]]></search>\n			<add position="after"><![CDATA[\n			\n			//+mod by yp start\n			if(floatval($amount) < 0) {\n				$text_received = $this->language->get(''text_payment_received'');				\n				$amount = abs(floatval($amount));\n			} else {\n				$text_received = $this->language->get(''text_transaction_received'');				\n			}\n			\n			$message  = sprintf($text_received, $this->currency->format($amount, $this->config->get(''config_currency''))) . "\\n\\n";\n			$message .= sprintf($this->language->get(''text_balance''), $this->currency->format( $this->getTransactionTotal($affiliate_id), $this->config->get(''config_currency'')) );\n			//+mod by yp end\n			\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[public function getTotalTransactionsByOrderId(]]></search>\n			<add position="before"><![CDATA[\n			\n	//+mod by yp start		\n	protected function getAffiliatesMta($data = array()) {\n		$sql = "SELECT *, CONCAT(a.firstname, '' '', a.lastname) AS name, (SELECT SUM(at.amount) FROM " . DB_PREFIX . "affiliate_transaction at WHERE at.affiliate_id = a.affiliate_id GROUP BY at.affiliate_id) AS balance, mta_a.mta_scheme_id as scheme_id, mta_a.level_original as level FROM " . DB_PREFIX . "affiliate AS a left join " . DB_PREFIX . "mta_affiliate AS mta_a on mta_a.affiliate_id=a.affiliate_id";\n\n		$implode = array();\n\n		if (!empty($data[''filter_name''])) {\n			$implode[] = "CONCAT(a.firstname, '' '', a.lastname) LIKE ''" . $this->db->escape($data[''filter_name'']) . "%''";\n		}\n\n		if (!empty($data[''filter_email''])) {\n			$implode[] = "LCASE(a.email) = ''" . $this->db->escape(utf8_strtolower($data[''filter_email''])) . "''";\n		}\n\n		if (!empty($data[''filter_code''])) {\n			$implode[] = "a.code = ''" . $this->db->escape($data[''filter_code'']) . "''";\n		}\n\n		if (isset($data[''filter_status'']) && $data[''filter_status''] !== null) {\n			$implode[] = "a.status = ''" . (int)$data[''filter_status''] . "''";\n		}\n\n		if (isset($data[''filter_approved'']) && $data[''filter_approved''] !== null) {\n			$implode[] = "a.approved = ''" . (int)$data[''filter_approved''] . "''";\n		}\n\n		if (!empty($data[''filter_date_added''])) {\n			$implode[] = "DATE(a.date_added) = DATE(''" . $this->db->escape($data[''filter_date_added'']) . "'')";\n		}\n\n		//+mod by yp start\n		if(isset($data[''ids'']) && preg_match("/^\\d+(?:\\,\\d+)*$/", $data[''ids''])) {\n			$implode[] = ''a.affiliate_id '' . (isset($data[''filter_ids'']) && $data[''filter_ids''] == ''exclude'' ? ''NOT '' : '''') . ''in ('' . $data[''ids''] . '')'';			\n		}		\n		//+mod by yp end\n		\n		if ($implode) {\n			$sql .= " WHERE " . implode(" AND ", $implode);\n		}\n\n		$sort_data = array(\n			''name'',\n			''a.email'',\n			''a.code'',\n			''a.status'',\n			''a.approved'',\n			''a.date_added'',\n			''mta_a.level_original''//+mod by yp\n		);\n\n		if (isset($data[''sort'']) && in_array($data[''sort''], $sort_data)) {\n			$sql .= " ORDER BY " . $data[''sort''];\n		} else {\n			$sql .= " ORDER BY name";\n		}\n\n		if (isset($data[''order'']) && ($data[''order''] == ''DESC'')) {\n			$sql .= " DESC";\n		} else {\n			$sql .= " ASC";\n		}\n\n		if (isset($data[''start'']) || isset($data[''limit''])) {\n			if ($data[''start''] < 0) {\n				$data[''start''] = 0;\n			}\n\n			if ($data[''limit''] < 1) {\n				$data[''limit''] = 20;\n			}\n\n			$sql .= " LIMIT " . (int)$data[''start''] . "," . (int)$data[''limit''];\n		}\n\n		$query = $this->db->query($sql);\n\n		return $query->rows;\n	}\n	\n	protected function getTotalAffiliatesMta($data = array()) {\n		$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "affiliate";\n\n		$implode = array();\n\n		if (!empty($data[''filter_name''])) {\n			$implode[] = "CONCAT(firstname, '' '', lastname) LIKE ''%" . $this->db->escape($data[''filter_name'']) . "%''";\n		}\n\n		if (!empty($data[''filter_email''])) {\n			$implode[] = "LCASE(email) = ''" . $this->db->escape(utf8_strtolower($data[''filter_email''])) . "''";\n		}\n\n		if (isset($data[''filter_status'']) && $data[''filter_status''] !== null) {\n			$implode[] = "status = ''" . (int)$data[''filter_status''] . "''";\n		}\n\n		if (isset($data[''filter_approved'']) && $data[''filter_approved''] !== null) {\n			$implode[] = "approved = ''" . (int)$data[''filter_approved''] . "''";\n		}\n\n		if (!empty($data[''filter_date_added''])) {\n			$implode[] = "DATE(date_added) = DATE(''" . $this->db->escape($data[''filter_date_added'']) . "'')";\n		}\n\n		//+mod by  yp start\n		if(isset($data[''ids'']) && preg_match("/^\\d+(?:\\,\\d+)*$/", $data[''ids''])) {\n			$implode[] = ''affiliate_id '' . (isset($data[''filter_ids'']) && $data[''filter_ids''] == ''exclude'' ? ''NOT '' : '''') . ''in ('' . $data[''ids''] . '')'';			\n		}		\n		//+mod by  yp end		\n		\n		if ($implode) {\n			$sql .= " WHERE " . implode(" AND ", $implode);\n		}\n\n		$query = $this->db->query($sql);\n\n		return $query->row[''total''];\n	}\n	\n	public function addMtaTransaction($order_id, $affiliate_id, $description) {\n		$res = $this->db->query("select mta_order_id, commission from " . DB_PREFIX . "mta_order where order_id=''" . (int) $order_id . "'' and affiliate_id=''" . (int) $affiliate_id . "'' and commission_added=''0''");\n		if($res->num_rows < 1) return false;\n		$commission = $res->row[''commission''];\n		$res2 = $this->db->query("select " . DB_PREFIX . "mta_order_product.num_levels, " . DB_PREFIX . "mta_order_product.level, " . DB_PREFIX . "order_product.quantity, " . DB_PREFIX . "product_description.name as product_name from " . DB_PREFIX . "mta_order_product left join " . DB_PREFIX . "order_product on " . DB_PREFIX . "order_product.order_product_id=" . DB_PREFIX . "mta_order_product.order_product_id left join " . DB_PREFIX . "product_description on " . DB_PREFIX . "product_description.product_id=" . DB_PREFIX . "mta_order_product.product_id where " . DB_PREFIX . "mta_order_product.mta_order_id=''" . (int) $res->row[''mta_order_id''] . "''  group by " . DB_PREFIX . "mta_order_product.order_product_id");\n		if($res2->num_rows > 0) {\n			$this->language->load(''mail/affiliate'');\n			$_ar = array();\n			foreach($res2->rows as $_r) {\n				$_str = $_r[''product_name''];\n				if($_r[''quantity''] > 1) $_str .= '' x'' . $_r[''quantity''];\n				if($_r[''level'']) $_str .= sprintf($this->language->get(''text_transaction_level''), (intval($_r[''num_levels'']) - intval($_r[''level'']) + 1));\n				$_ar[] = $_str;\n			}\n\n			if(sizeof($_ar) > 0) $description .= '': '' . implode('', '', $_ar);\n		}		\n		$this->db->query("update " . DB_PREFIX . "mta_order set commission_added=''1'' where order_id=''" . (int) $order_id . "'' and affiliate_id=''" . (int) $affiliate_id . "''");\n		$this->addTransaction($affiliate_id, $description, $commission, $order_id);\n		return true;\n	}\n\n	public function deleteMtaTransaction($order_id, $affiliate_id) {\n		$this->db->query("DELETE FROM " . DB_PREFIX . "affiliate_transaction WHERE order_id = ''" . (int) $order_id . "'' and affiliate_id = ''" . (int) $affiliate_id . "''");		\n		//if(!$this->db->countAffected()) return false;\n		$this->db->query("update " . DB_PREFIX . "mta_order set commission_added=''0'' where order_id=''" . (int) $order_id . "'' and affiliate_id=''" . (int) $affiliate_id . "''");\n		return true;\n	}\n\n	public function getOrderCommissions($order_id) {\n		$res = $this->db->query("select " . DB_PREFIX . "mta_order.mta_order_id, " . DB_PREFIX . "mta_order.order_id, " . DB_PREFIX . "mta_order.commission AS commission_total, " . DB_PREFIX . "mta_order.affiliate_id, " . DB_PREFIX . "mta_order.commission_added, " . DB_PREFIX . "mta_order.autoadd, CONCAT(" . DB_PREFIX . "affiliate.firstname, '' '', " . DB_PREFIX . "affiliate.lastname) as affiliate_name, " . DB_PREFIX . "mta_scheme.mta_scheme_id AS scheme_id, " . DB_PREFIX . "mta_scheme.scheme_name AS scheme_name, " . DB_PREFIX . "mta_order_product.order_product_id, " . DB_PREFIX . "mta_order_product.commission, " . DB_PREFIX . "product.model AS product_name FROM " . DB_PREFIX . "mta_order left join " . DB_PREFIX . "affiliate on " . DB_PREFIX . "affiliate.affiliate_id=" . DB_PREFIX . "mta_order.affiliate_id left join " . DB_PREFIX . "mta_order_product on " . DB_PREFIX . "mta_order_product.mta_order_id=" . DB_PREFIX . "mta_order.mta_order_id left join " . DB_PREFIX . "mta_scheme on " . DB_PREFIX . "mta_scheme.mta_scheme_id=" . DB_PREFIX . "mta_order_product.mta_scheme_id LEFT JOIN " . DB_PREFIX . "product ON " . DB_PREFIX . "product.product_id=" . DB_PREFIX . "mta_order_product.product_id WHERE " . DB_PREFIX . "mta_order.order_id=''" . (int) $order_id . "'' group by " . DB_PREFIX . "mta_order_product.order_product_id, " . DB_PREFIX . "mta_order_product.affiliate_id order by " . DB_PREFIX . "mta_order.mta_order_id asc");\n		//if($res->num_rows < 1) return false;\n		return $res->rows;\n	}\n	\n	public function setOrderCommissions($order_id, $commissions = false, $do_add = false) {\n		if(!is_int($order_id)) $order_id = (int)$order_id;\n		if(!$commissions) $commissions = array();\n		$added = array();\n		$_res = $this->db->query("select affiliate_id from " . DB_PREFIX . "affiliate_transaction where order_id = ''" . $order_id . "''");\n		foreach($_res->rows as $_r) {\n			$added[] = (int)$_r[''affiliate_id''];\n		}\n		$aff_ids = array();\n		$comms = array();\n		$totals = array();\n		foreach($commissions as $__c) {\n			foreach($__c as $_c) {\n				if(in_array(intval($_c[''affiliate_id'']), $added)) continue;\n				if(!isset($comms[$_c[''affiliate_id'']])) $comms[$_c[''affiliate_id'']] = array();\n				if(!isset($totals[$_c[''affiliate_id'']])) $totals[$_c[''affiliate_id'']] = 0;\n				$aff_ids[] = $_c[''affiliate_id''];			\n				$comms[$_c[''affiliate_id'']][] = $_c;\n				$totals[$_c[''affiliate_id'']] += (float)$_c[''commission''];\n			}\n		}\n		if(sizeof($aff_ids) > 0) $aff_ids = array_values(array_unique($aff_ids));	\n		$this->db->query("delete from " . DB_PREFIX . "mta_order_product where mta_order_id in (select mta_order_id from " . DB_PREFIX . "mta_order where order_id = ''" . $order_id . "'' and commission_added=''0'')");\n		$this->db->query("delete from " . DB_PREFIX . "mta_order where order_id = ''" . $order_id . "'' and commission_added=''0''");\n		if(sizeof($comms) < 1) return;\n		$ops = array();\n		$_res = $this->db->query("SELECT order_product_id, product_id FROM " . DB_PREFIX . "order_product WHERE order_id = ''" . $order_id . "''");\n		foreach($_res->rows as $_r) {\n			$ops[$_r[''order_product_id'']] = $_r[''product_id''];\n		}\n		if($do_add) $tAr = array();\n		foreach($comms as $_aff_id => $_comms) {\n			$this->db->query("insert into " . DB_PREFIX . "mta_order (order_id, affiliate_id, commission) values (''" . $order_id . "'', ''" . (int)$_aff_id . "'', ''" . $totals[$_aff_id] . "'')");\n			$mta_order_id = $this->db->getLastId();\n			$qAr = array();			\n			foreach($_comms as $_c) {\n				if(!isset($ops[$_c[''order_product_id'']])) continue;\n				$qAr[] = "(''" . $mta_order_id . "'', ''" . (int)$_c[''order_product_id''] . "'', ''" . (int)$ops[$_c[''order_product_id'']] . "'', ''" . (int)$_aff_id . "'', ''" . (float)$_c[''commission''] . "'', 0, 0, 0)";				\n			}\n			if($do_add && !in_array($_aff_id, $tAr)) $tAr[] = $_aff_id;\n			if(sizeof($qAr) > 0) $this->db->query("insert into " . DB_PREFIX . "mta_order_product (mta_order_id, order_product_id, product_id, affiliate_id, commission, mta_scheme_id, num_levels, level) values " . implode('', '', $qAr));\n		}\n		if($do_add && sizeof($tAr) > 0) {\n			$this->language->load(''mta/mta'');\n			foreach($tAr as $_aff_id) {\n				$this->addMtaTransaction($order_id, $_aff_id, $this->language->get(''text_order_id'') . '' #'' . $order_id);\n			}\n		}\n	}\n	//+mod by yp end\n	\n]]></add>\n		</operation>\n	</file>	\n	<file path="admin/model/report/affiliate.php">\n		<operation>\n			<search><![CDATA[public function getCommission(]]></search>\n			<add position="before"><![CDATA[\n			\n	//+mod by yp start\n	protected function _mta_getCommission($data = array()) { \n		$sql_e = "SELECT at.affiliate_id, SUM(at.amount) AS total_earnings FROM " . DB_PREFIX . "affiliate_transaction at";\n		$sql = "SELECT at.affiliate_id, CONCAT(a.firstname, '' '', a.lastname) AS affiliate, a.email, a.status, SUM(at.amount) AS commission, COUNT(o.order_id) AS orders, SUM(o.total) AS total FROM " . DB_PREFIX . "affiliate_transaction at LEFT JOIN `" . DB_PREFIX . "affiliate` a ON (at.affiliate_id = a.affiliate_id) LEFT JOIN `" . DB_PREFIX . "order` o ON (at.order_id = o.order_id)";\n		\n		$implode = array();\n		\n		if (preg_match("/^\\d{4}\\-\\d{2}\\-\\d{2}$/", $data[''filter_date_start''])) {\n			$implode[] = "DATE(at.date_added) >= ''" . $this->db->escape($data[''filter_date_start'']) . "''";\n		}\n\n		if (preg_match("/^\\d{4}\\-\\d{2}\\-\\d{2}$/", $data[''filter_date_end''])) {\n			$implode[] = "DATE(at.date_added) <= ''" . $this->db->escape($data[''filter_date_end'']) . "''";\n		}	\n		\n		if ($implode) {\n			$_imp = " WHERE " . implode(" AND ", $implode);\n			$sql .= $_imp;\n			$sql_e .= $_imp . " AND at.amount > 0";\n		} else {\n			$sql_e .= " WHERE at.amount > 0";\n		}\n				\n		$sql .= " GROUP BY at.affiliate_id ORDER BY commission DESC";\n		$sql_e .= " AND at.affiliate_id in ([[AFFILIATES]]) GROUP BY at.affiliate_id";\n				\n		if (isset($data[''start'']) || isset($data[''limit''])) {\n			if ($data[''start''] < 0) {\n				$data[''start''] = 0;\n			}			\n\n			if ($data[''limit''] < 1) {\n				$data[''limit''] = 20;\n			}	\n			\n			$sql .= " LIMIT " . (int)$data[''start''] . "," . (int)$data[''limit''];\n			$sql_e .= " LIMIT " . (int)$data[''start''] . "," . (int)$data[''limit''];\n		}\n			\n		$query = $this->db->query($sql);\n		$rows = $query->rows;\n		$_aff_ids = array();\n		foreach($rows as $_i => $_r) {\n			if($data[''filter_balance''] > 0 && $_r[''commission''] < $data[''filter_balance'']) {\n				unset($rows[$_i]);\n				continue;\n			}\n			$_aff_ids[] = $_r[''affiliate_id''];			\n		}\n		$rows = array_values($rows);\n		$sql_e = str_replace(''[[AFFILIATES]]'', implode('','', $_aff_ids), $sql_e);\n		\n		if(sizeof($_aff_ids) > 0) {\n			$query_e = $this->db->query($sql_e);\n			$rows_e = array();\n			foreach($query_e->rows as $_r) {\n				$rows_e[intval($_r[''affiliate_id''])] = $_r[''total_earnings''];\n			}\n		} else {\n			$rows_e = array();\n		}\n		\n		foreach($rows as $_i => $_r) {\n			if(isset($rows_e[intval($_r[''affiliate_id''])])) {\n				$_r[''total_earnings''] = $rows_e[intval($_r[''affiliate_id''])];\n				$rows[$_i] = $_r;\n			}\n		}		\n		return $rows;\n	}\n	//+mod by yp end\n\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[function getCommission($data = array()) {]]></search>\n			<add position="after"><![CDATA[\n			\nreturn $this->_mta_getCommission($data);//+mod by yp\n\n]]></add>\n		</operation>\n	</file>	\n	<file path="admin/model/sale/customer.php">\n		<operation>\n			<search><![CDATA[$customer_id = $this->db->getLastId();]]></search>\n			<add position="after"><![CDATA[\n\n				//+mod by yp start\n				if(isset($data[''affiliate_id'']) && mta_check_int($data[''affiliate_id'']) && $data[''affiliate_id''] > 0) $this->db->query("UPDATE " . DB_PREFIX . "customer SET affiliate_id=''" . (int) $data[''affiliate_id''] . "'' where customer_id=''" . (int) $customer_id . "''");\n				//+mod by yp end\n\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[if ($data[''password'']) {]]></search>\n			<add position="before"><![CDATA[\n\n				//+mod by yp start\n				if(isset($data[''affiliate_id'']) && mta_check_int($data[''affiliate_id''])) $this->db->query("UPDATE " . DB_PREFIX . "customer SET affiliate_id=''" . (int) $data[''affiliate_id''] . "'' where customer_id=''" . (int) $customer_id . "''");\n				//+mod by yp end\n\n]]></add>\n		</operation>		\n	</file>		\n	<file path="admin/model/tool/backup.php">\n		<operation>\n			<search><![CDATA[function restore($sql) {]]></search>\n			<add position="after"><![CDATA[\n\n$this->db->query("SET FOREIGN_KEY_CHECKS=0");//+mod by yp\n\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[$this->cache->delete(''*'');]]></search>\n			<add position="after"><![CDATA[\n\n$this->db->query("SET FOREIGN_KEY_CHECKS=1");//+mod by yp\n\n]]></add>\n		</operation>		\n	</file>\n	\n	<file path="catalog/controller/affiliate/account.php">\n		<operation>\n			<search><![CDATA[$this->url->link(''affiliate/transaction'', '''', ''SSL'');]]></search>\n			<add position="after"><![CDATA[\n\n			//+mod by yp start\n			$this->language->load(''affiliate/mta'');\n			foreach(array(''text_signup_link'', ''text_aff_link_any_page'', ''text_affiliate_downline'') as $_v) {\n				$data[$_v] = $this->language->get($_v);		\n			}						\n			$data[''signup_link''] = $this->url->link(''affiliate/register'', ''tracking='' . $this->affiliate->getCode(), ''SSL'');\n			$data[''show_downline''] = $this->config->get(''mta_ypx_downline'');\n			$data[''link_affiliate_downline''] = $this->url->link(''affiliate/downline'', '''', ''SSL'');\n			//+mod by yp end\n			\n]]></add>\n		</operation>\n	</file>		\n	<file path="catalog/controller/affiliate/transaction.php">\n		<operation>\n			<search><![CDATA[$data[''continue''] = ]]></search>\n			<add position="before"><![CDATA[\n			\n		//+mod by yp start\n		$this->load->model(''affiliate/mta_affiliate'');\n		$this->language->load(''affiliate/mta'');\n		foreach(array(''text_total_earnings'', ''text_view_subs'', ''column_level'', ''column_num_affs'', ''text_affiliate_downline'') as $_v) {\n			$data[$_v] = $this->language->get($_v);		\n		}\n		$data[''total_earnings''] = $this->currency->format($this->model_affiliate_mta_affiliate->getTotalEarnings());			\n		$limit = $this->config->get(''mta_ypx_downline_limit'');\n		if($limit) {			\n			$self_aff = $this->model_affiliate_mta_affiliate->getAffiliate($this->affiliate->getId());\n			$max_level = intval($self_aff[''level_original'']) + intval($limit);\n		} else {\n			$max_level = false;\n		}\n		\n		$_sub_affs = $this->model_affiliate_mta_affiliate->getSubAffiliates(((int)$this->affiliate->getId()), $max_level);\n		if($_sub_affs) {\n			$data[''sub_affiliates''] = array();\n			foreach($_sub_affs as $_i => $_num) {\n				$data[''sub_affiliates''][] = array(''level'' => ($_i + 1), ''num'' => $_num);\n			}\n		} else {\n			$data[''sub_affiliates''] = false;\n		}\n		$data[''show_downline''] = $this->config->get(''mta_ypx_downline'');\n		$data[''link_affiliate_downline''] = $this->url->link(''affiliate/downline'', '''', ''SSL'');		\n		//+mod by yp end\n\n]]></add>\n		</operation>\n	</file>\n	<file path="catalog/controller/common/footer.php">\n		<operation>\n			<search><![CDATA[function index() {]]></search>\n			<add position="after"><![CDATA[\n		\n		if($this->affiliate->isLogged()) $this->document->addScript(''catalog/view/javascript/mta_als.js.php?t='' . urlencode($this->affiliate->getCode())); //+mod by yp\n		\n]]></add>\n		</operation>\n	</file>	\n	<file path="catalog/controller/payment/pp_express.php">\n		<operation>\n			<search><![CDATA[$this->request->post[''txn_type''] == ''recurring_payment'']]></search>\n			<add position="before"><![CDATA[\n			\n			//+mod by yp start\n			if (isset($this->request->post[''txn_type'']) && ($this->request->post[''txn_type''] == ''recurring_payment'' || $this->request->post[''txn_type''] == ''recurring_payment_outstanding_payment'') && $this->config->get(''mta_ypx_pay_recur'')) {\n				$profile = $this->model_account_recurring->getProfileByRef($this->request->post[''recurring_payment_id'']);			\n				if ($profile != false) {					\n					$_res = $this->db->query("select " . DB_PREFIX . "mta_order_product.affiliate_id, " . DB_PREFIX . "mta_order_product.commission, " . DB_PREFIX . "order_product.total from " . DB_PREFIX . "mta_order, " . DB_PREFIX . "mta_order_product, " . DB_PREFIX . "order_product  where " . DB_PREFIX . "mta_order_product.product_id = ''" . (int)$profile[''product_id''] . "'' and " . DB_PREFIX . "mta_order.order_id = ''" . (int)$profile[''order_id''] . "'' and " . DB_PREFIX . "mta_order_product.mta_order_id = " . DB_PREFIX . "mta_order.mta_order_id and " . DB_PREFIX . "order_product.order_product_id = " . DB_PREFIX . "mta_order_product.order_product_id");\n					$_comms = array();\n					foreach($_res->rows as $_r) {\n						if(!isset($_comms[$_r[''affiliate_id'']])) $_comms[$_r[''affiliate_id'']] = 0;\n						$__c = round(($profile[''recurring_price''] / ($_r[''total''] / $_r[''commission''])) * 100) * 0.01;\n						$_comms[$_r[''affiliate_id'']] += $__c;\n					}\n					if(sizeof($_comms) > 0) {\n						$this->load->model(''affiliate/affiliate'');\n						$this->language->load(''affiliate/mta'');\n						foreach($_comms as $_aff_id => $_comm) {\n							$this->model_affiliate_affiliate->addTransaction($_aff_id, sprintf($this->language->get(''text_recurring_commission''), strval($profile[''order_id''])), $_comm, $profile[''order_id'']);\n						}\n					}				\n				}\n			}\n			//+mod by yp end		\n			\n]]></add>\n			</operation>\n	</file>				\n	<file path="catalog/model/total/coupon.php">\n		<operation>\n			<search><![CDATA[$discount_total = 0;]]></search>\n			<add position="before"><![CDATA[\n\n$product_ids = array();//+mod by yp\n\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[$sub_total += $product[''total''];]]></search>\n			<add position="after"><![CDATA[\n				\n$product_ids[] = $product[''product_id''];//+mod by yp\n\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[$total_data[] = array(]]></search>\n			<add position="after"><![CDATA[\n				\n					''product_ids'' => $product_ids, //+mod by yp\n					''coupon_id''  => $coupon_info[''coupon_id''], //+mod by yp	\n\n]]></add>\n		</operation>\n</file>		\n	<file path="system/engine/action.php">\n		<operation>\n			<search><![CDATA[?php]]></search>\n			<add position="after"><![CDATA[\n			\n//+mod by yp start\nrequire_once(DIR_SYSTEM . ''helper/mta_util.php''); \nif (isset($_REQUEST[''mta'']) && !isset($_COOKIE[''mta''])) {\n	setcookie(''mta'', $_REQUEST[''mta''], time() + 3600 * 24 * 1000, ''/'');\n}\nif(!defined(''MTA_YPX_HAS_MTA'')) define(''MTA_YPX_HAS_MTA'', true);\n//+mod by yp end\n\n]]></add>\n		</operation>\n	</file>	\n	<file path="system/library/cart.php">\n		<operation>\n			<search><![CDATA[class Cart {]]></search>\n			<add position="after"><![CDATA[\n\n			public $aff_info = array(''products'' => array());//+mod by yp\n\n			]]></add>\n		</operation>		\n		<operation>\n			<!-- v < 2.1.0.1 -->\n			<ignoreif><![CDATA[foreach ($cart_query->rows as $cart) {]]></ignoreif>\n			<search><![CDATA[foreach ($this->session->data[''cart''] as $key =>]]></search>\n			<add position="before"><![CDATA[\n\n$this->aff_info = array(''products'' => array(), ''price_before_shipping'' => 0.00, ''_new_'' => true);//+mod by yp			\n\n			]]></add>\n		</operation>	\n		<operation>\n			<!-- v == 2.1.0.1 -->\n			<ignoreif><![CDATA[if (!$this->data) {]]></ignoreif>\n			<search><![CDATA[$product_data = array();]]></search>\n			<add position="after"><![CDATA[\n\n$this->aff_info = array(''products'' => array(), ''price_before_shipping'' => 0.00, ''_new_'' => true);//+mod by yp			\n\n			]]></add>\n		</operation>			\n		<operation>\n			<!-- v < 2.1.0.1 -->\n			<ignoreif><![CDATA[foreach ($cart_query->rows as $cart) {]]></ignoreif>\n			<search><![CDATA[$product_id = $product[''product_id''];]]></search>\n			<add position="after"><![CDATA[\n			\n//+mod by yp start			\n$_mta_product_id = $product_id;\n$this->aff_info[''products''][strval($_mta_product_id)] = array(''mods'' => array());\n//+mod by yp end\n\n			]]></add>\n		</operation>\n		<operation>\n			<!-- v == 2.1.0.1 -->\n			<ignoreif><![CDATA[if (!$this->data) {]]></ignoreif>\n			<search><![CDATA[foreach ($cart_query->rows as $cart) {]]></search>\n			<add position="after"><![CDATA[\n\n//+mod by yp start\n$_mta_product_id = $cart[''product_id''];\n$this->aff_info[''products''][strval($_mta_product_id)] = array(''mods'' => array());\n//+mod by yp end\n			]]></add>\n		</operation>		\n		<operation>\n			<search><![CDATA[SELECT price FROM " . DB_PREFIX . "product_discount]]></search>\n			<add position="replace"><![CDATA[SELECT product_discount_id, price FROM " . DB_PREFIX . "product_discount]]></add>\n		</operation>			\n		<operation>\n			<search><![CDATA[SELECT price FROM " . DB_PREFIX . "product_special]]></search>\n			<add position="replace"><![CDATA[SELECT product_special_id, price FROM " . DB_PREFIX . "product_special]]></add>\n		</operation>	\n		<operation>\n			<search><![CDATA[if ($product_discount_query->num_rows]]></search>\n			<add position="before"><![CDATA[\n			\nif($product_discount_query->num_rows) $this->aff_info[''products''][$_mta_product_id][''mods''][''discount''] = $product_discount_query->row[''product_discount_id''];//+mod by yp\n			\n			]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[if ($product_special_query->num_rows]]></search>\n			<add position="before"><![CDATA[\n			\nif($product_special_query->num_rows) $this->aff_info[''products''][$_mta_product_id][''mods''][''special''] = $product_special_query->row[''product_special_id''];//+mod by yp\n			\n			]]></add>\n		</operation>\n		<operation>\n			<!-- v < 2.1.0.1 -->\n			<ignoreif><![CDATA[foreach ($cart_query->rows as $cart) {]]></ignoreif>\n			<search><![CDATA[return $this->data;]]></search>\n			<add position="before"><![CDATA[			\n			\n		//+mod by yp start\n		if(isset($this->aff_info[''_new_''])) {\n			unset($this->aff_info[''_new_'']);\n			$this->aff_info[''price_before_shipping''] = 0;\n			foreach($this->data as $k => $v) {			\n				if(isset($v[''total'']) && $v[''total''] && $v[''total''] > 0) $this->aff_info[''price_before_shipping''] += floatval($v[''total'']);\n			}			\n			foreach($this->data as $k => $v) {			\n				if(!isset($this->aff_info[''products''][$v[''product_id'']])) {\n					$this->aff_info[''products''][$v[''product_id'']] = array(''share'' => 0, ''quantity'' => 0);\n				} else {\n					if(!isset($this->aff_info[''products''][$v[''product_id'']][''share''])) $this->aff_info[''products''][$v[''product_id'']][''share''] = 0;\n					if(!isset($this->aff_info[''products''][$v[''product_id'']][''quantity''])) $this->aff_info[''products''][$v[''product_id'']][''quantity''] = 0;					\n				}\n				$this->aff_info[''products''][$v[''product_id'']][''share''] += ($this->aff_info[''price_before_shipping''] > 0.00 ? ((floatval($v[''total''])) / $this->aff_info[''price_before_shipping'']) : 0);\n				$this->aff_info[''products''][$v[''product_id'']][''quantity''] += $v[''quantity''];				\n			}\n		}\n		//+mod by yp end			\n		\n			]]></add>\n		</operation>		\n		<operation>\n			<!-- v == 2.1.0.1 -->\n			<ignoreif><![CDATA[if (!$this->data) {]]></ignoreif>\n			<search index="0"><![CDATA[return $product_data;]]></search>\n			<add position="before"><![CDATA[			\n			\n		//+mod by yp start\n		if(isset($this->aff_info[''_new_''])) {\n			unset($this->aff_info[''_new_'']);\n			$this->aff_info[''price_before_shipping''] = 0;\n			foreach($product_data as $k => $v) {			\n				if(isset($v[''total'']) && $v[''total''] && $v[''total''] > 0) $this->aff_info[''price_before_shipping''] += floatval($v[''total'']);\n			}			\n			foreach($product_data as $k => $v) {			\n				if(!isset($this->aff_info[''products''][$v[''product_id'']])) {\n					$this->aff_info[''products''][$v[''product_id'']] = array(''share'' => 0, ''quantity'' => 0);\n				} else {\n					if(!isset($this->aff_info[''products''][$v[''product_id'']][''share''])) $this->aff_info[''products''][$v[''product_id'']][''share''] = 0;\n					if(!isset($this->aff_info[''products''][$v[''product_id'']][''quantity''])) $this->aff_info[''products''][$v[''product_id'']][''quantity''] = 0;					\n				}\n				$this->aff_info[''products''][$v[''product_id'']][''share''] += ($this->aff_info[''price_before_shipping''] > 0.00 ? ((floatval($v[''total''])) / $this->aff_info[''price_before_shipping'']) : 0);\n				$this->aff_info[''products''][$v[''product_id'']][''quantity''] += $v[''quantity''];				\n			}\n		}\n		//+mod by yp end			\n		\n			]]></add>\n		</operation>		\n	</file>	\n	<file path="system/library/customer.php">	\n		<operation>\n			<search><![CDATA[$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer_ip]]></search>\n			<add position="before"><![CDATA[\n			\n				$this->_fix_parent_aff($customer_query->row);//+mod by yp\n				\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[customer SET ip = ''" . $this->db->escape($this->request->server[''REMOTE_ADDR'']) . "'' WHERE customer_id = ''" . (int)$this->customer_id . "''");]]></search>\n			<add position="after"><![CDATA[\n			\n			$this->_fix_parent_aff($customer_query->row);//+mod by yp\n			\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[function logout() {]]></search>\n			<add position="after"><![CDATA[\n			\n		//+mod by yp start\n		if(isset($this->session->data[''_mta_ypx_aff_id''])) unset($this->session->data[''_mta_ypx_aff_id'']);\n		if(isset($this->session->data[''_mta_ypx_aff_code''])) unset($this->session->data[''_mta_ypx_aff_code'']);		\n		//+mod by yp end	\n		\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[public function getRewardPoints(]]></search>\n			<add position="before"><![CDATA[\n			\n	//+mod by yp start\n	private function _fix_parent_aff($data) {\n		if(!$this->config->get(''mta_ypx_db_perm'') || !isset($data[''affiliate_id''])) return;\n		if(!isset($this->session->data[''_mta_ypx_aff_id'']) || $this->session->data[''_mta_ypx_aff_id''] != $data[''affiliate_id'']) {\n			$this->session->data[''_mta_ypx_aff_id''] = $data[''affiliate_id''];\n			if($data[''affiliate_id'']) {\n				$_res = $this->db->query("SELECT code FROM " . DB_PREFIX . "affiliate WHERE affiliate_id = ''" . (int)$data[''affiliate_id''] . "''");\n				if($_res->num_rows > 0) {\n					$this->session->data[''_mta_ypx_aff_code''] = $_res->row[''code''];\n				} else {\n					$this->session->data[''_mta_ypx_aff_code''] = '''';\n				}\n			} else {\n				$this->session->data[''_mta_ypx_aff_code''] = '''';\n			}\n		}\n		$changed = false;\n		if(strlen($this->session->data[''_mta_ypx_aff_code'']) > 0) {\n			if(!isset($this->request->cookie[''tracking'']) || $this->request->cookie[''tracking''] != $this->session->data[''_mta_ypx_aff_code'']) {\n				$changed = true;\n				if(isset($this->request->cookie[''tracking''])) {\n					setcookie(''tracking'', '''', (time() - 3600), ''/'');\n					setcookie(''tracking'', '''', (time() - 3600), ''/'', ''.'' . preg_replace("/www\\./i", '''', $_SERVER[''HTTP_HOST'']));\n				}\n				setcookie(''tracking'', $this->session->data[''_mta_ypx_aff_code''], time() + 3600 * 24 * 1000, ''/'');\n				$this->request->cookie[''tracking''] = $this->session->data[''_mta_ypx_aff_code''];\n				if(isset($this->request->post[''tracking''])) $this->request->post[''tracking''] = $this->session->data[''_mta_ypx_aff_code''];\n				if(isset($this->request->get[''tracking''])) $this->request->get[''tracking''] = $this->session->data[''_mta_ypx_aff_code''];			\n				if(isset($this->session->data[''tracking''])) $this->session->data[''tracking''] = $this->session->data[''_mta_ypx_aff_code''];				\n			}\n		} else {\n			if(isset($this->request->cookie[''tracking''])) {\n				$changed = true;\n				setcookie(''tracking'', '''', (time() - 3600), ''/'');\n				setcookie(''tracking'', '''', (time() - 3600), ''/'', ''.'' . preg_replace("/www\\./i", '''', $_SERVER[''HTTP_HOST'']));		\n				unset($this->request->cookie[''tracking'']);\n				if(isset($this->request->post[''tracking''])) unset($this->request->post[''tracking'']);\n				if(isset($this->request->get[''tracking''])) unset($this->request->get[''tracking'']);\n				if(isset($this->session->data[''tracking''])) unset($this->session->data[''tracking'']);\n			}\n		}\n		/*if($changed === true) {\n			$url = ''http'' . (isset($_SERVER[''HTTPS'']) && $_SERVER[''HTTPS''] === ''on'' ? ''s'' : '''') . ''://'' . $_SERVER[''HTTP_HOST''] . $_SERVER[''REQUEST_URI''];\n			header(''HTTP/1.1 302 Found'');\n			header(''Location: '' . $url);\n			die();\n		}*/\n	}\n	//+mod by yp end\n	\n]]></add>\n		</operation>	\n	</file>		\n</modification>', 1, '2016-01-20 14:32:02');
INSERT INTO `oc_modification` (`modification_id`, `name`, `code`, `author`, `version`, `link`, `xml`, `status`, `date_added`) VALUES
(4, 'OC 2.1.0.1 and higher - Fix for Affiliate Pack extensions', 'fix21151025_yp', 'YP', '1.5.1025', '', '<?xml version="1.0" encoding="utf-8"?>\r\n<modification>\r\n	<id><![CDATA[OC 2.1.0.1 and higher - Fix for Affiliate Pack extensions]]></id>\r\n	<name><![CDATA[OC 2.1.0.1 and higher - Fix for Affiliate Pack extensions]]></name>	\r\n	<version><![CDATA[1.5.1025]]></version>	\r\n	<code><![CDATA[fix21151025_yp]]></code>	\r\n	<author><![CDATA[YP]]></author>\r\n	\r\n<file path="system/engine/loader.php">\r\n		<operation>\r\n			<search><![CDATA[function controller($route, $data = array()) {]]></search>\r\n			<add position="after"><![CDATA[	\r\n\r\nif(defined(''HTTP_CATALOG'') && version_compare(VERSION, ''2.1'', ''>='') && strpos($route, ''sale/custom'') === 0) $route = substr_replace($route, ''customer'', 0, 4); //+mod by yp\r\n\r\n		]]></add>\r\n		</operation>	\r\n		<operation>\r\n			<search><![CDATA[$model = str_replace(''../'', '''', (string)$model);]]></search>\r\n			<add position="after"><![CDATA[	\r\n//+mod by yp start\r\nif(defined(''HTTP_CATALOG'') && version_compare(VERSION, ''2.1'', ''>='') && strpos($model, ''sale/custom'') === 0) {\r\n	$model_old = $model;\r\n	$model = substr_replace($model, ''customer'', 0, 4); \r\n}\r\n//+mod by yp end\r\n\r\n		]]></add>\r\n		</operation>		\r\n		<operation>\r\n			<search><![CDATA[new $class($this->registry));]]></search>\r\n			<add position="after"><![CDATA[	\r\n\r\nif(isset($model_old)) $this->registry->set(''model_'' . str_replace(''/'', ''_'', $model_old), new $class($this->registry)); //+mod by yp\r\n\r\n		]]></add>\r\n		</operation>		\r\n		<operation>\r\n			<search><![CDATA[function view($template, $data = array()) {]]></search>\r\n			<add position="after"><![CDATA[	\r\n\r\nif(defined(''HTTP_CATALOG'') && version_compare(VERSION, ''2.1'', ''>='') && strpos($template, ''sale/custom'') === 0) $template = substr_replace($template, ''customer'', 0, 4); //+mod by yp\r\n\r\n		]]></add>\r\n		</operation>\r\n		<operation>\r\n			<search><![CDATA[function language($language) {]]></search>\r\n			<add position="after"><![CDATA[	\r\n\r\nif(defined(''HTTP_CATALOG'') && version_compare(VERSION, ''2.1'', ''>='') && strpos($language, ''sale/custom'') === 0) $language = substr_replace($language, ''customer'', 0, 4); //+mod by yp\r\n\r\n		]]></add>\r\n		</operation>		\r\n	</file>		\r\n<file path="system/library/language.php">\r\n		<operation>\r\n			<search><![CDATA[function load($filename) {]]></search>\r\n			<add position="after"><![CDATA[	\r\nif(defined(''HTTP_CATALOG'') && version_compare(VERSION, ''2.1'', ''>='') && strpos($filename, ''sale/custom'') === 0) $filename = substr_replace($filename, ''customer'', 0, 4); //+mod by yp			\r\n		]]></add>\r\n		</operation>		\r\n	</file>	\r\n<file path="system/library/url.php">\r\n		<operation>\r\n			<search><![CDATA[function link($route, $args = '''', $secure = false) {]]></search>\r\n			<add position="after"><![CDATA[	\r\nif(defined(''HTTP_CATALOG'') && version_compare(VERSION, ''2.1'', ''>='') && strpos($route, ''sale/custom'') === 0) $route = substr_replace($route, ''customer'', 0, 4); //+mod by yp			\r\n		]]></add>\r\n		</operation>		\r\n	</file>		\r\n</modification>	', 1, '2016-01-20 13:31:24'),
(7, 'Tracking Input for openCart 2', 'ti151028_yp', 'YP', '1.5.1028', '', '<?xml version="1.0" encoding="utf-8"?>\n<modification>\n	<id><![CDATA[Tracking Input for openCart 2]]></id>\n	<name><![CDATA[Tracking Input for openCart 2]]></name>	\n	<version><![CDATA[1.5.1028]]></version>\n	<code><![CDATA[ti151028_yp]]></code>\n	<author><![CDATA[YP]]></author>\n<file path="admin/controller/marketing/affiliate.php">\n		<operation>\n			<search><![CDATA[if (!$this->request->post[''code'']) {]]></search>\n			<add position="before"><![CDATA[	\n			\n		//+mod by yp start\n		if ($this->request->post[''code'']) {\n			if (!isset($this->request->get[''affiliate_id'']) || ($affiliate_info && isset($affiliate_info[''code'']) && $affiliate_info[''code''] != $this->request->post[''code''])) {\n				$this->language->load(''module/tracking_input_error'');\n				$_affs = $this->model_marketing_affiliate->getAffiliates(array(''filter_code'' => $this->request->post[''code''], ''start'' => 0, ''limit'' => 1));\n				if(sizeof($_affs) > 0) {\n					$this->error[''code''] = $this->language->get(''ti_error_aff_code'');\n				} else if($this->config->get(''tracking_input_status'') && $this->config->get(''tracking_input_allow_coupon'')) {\n					$this->load->model(''marketing/coupon'');\n					$_cp = $this->model_marketing_coupon->getCouponByCode($this->request->post[''code'']);\n					if(sizeof($_cp) > 0) $this->error[''code''] = $this->language->get(''ti_error_aff_coupon'');					\n				}\n			}		\n		}\n		//+mod by yp end			\n		\n			]]></add>\n		</operation>					\n</file>					\n<file path="admin/controller/marketing/coupon.php">\n		<operation>\n			<search><![CDATA[$coupon_info = $this->model_marketing_coupon->getCouponByCode]]></search>\n			<add position="before"><![CDATA[	\n			\n		//+mod by yp start\n		if (!$this->error && $this->config->get(''tracking_input_status'') && $this->config->get(''tracking_input_allow_coupon'')) {\n			$this->load->model(''marketing/affiliate'');\n			$_affs = $this->model_marketing_affiliate->getAffiliates(array(''filter_code'' => $this->request->post[''code''], ''start'' => 0, ''limit'' => 1));\n			if(sizeof($_affs) > 0) {\n				$this->language->load(''module/tracking_input_error'');\n				$this->error[''code''] = $this->language->get(''ti_error_coupon_aff'');\n			}\n		}\n		//+mod by yp end					\n		\n			]]></add>\n		</operation>					\n</file>					\n<file path="catalog/controller/account/register.php">\n		<operation>\n			<search><![CDATA[$data[''column_left''] =]]></search>\n			<add position="before"><![CDATA[\n\n		//+mod by yp start\n		if (isset($accc_status) && $accc_status && $this->config->get(''tracking_input_status'') && $this->config->get(''tracking_input_choose_code'')) {\n			$data[''tracking_input_show''] = true;\n			$data[''tracking_input_settings_json''] = array(\n				''accc'' => true,\n				''tracking_input_value'' => (isset($this->request->post[''tracking_input'']) ? $this->request->post[''tracking_input''] : ''''),\n				''error'' => ''''\n			);\n			if(isset($this->error[''tracking_input''])) $data[''tracking_input_settings_json''][''error''] = is_array($this->error[''tracking_input'']) ? implode(''<br />'', $this->error[''tracking_input'']) : $this->error[''tracking_input''];			\n			$this->language->load(''affiliate/tracking_input'');\n			foreach(array(''exists'', ''invalid'', ''long'', ''required'') as $_v) {\n				$data[''tracking_input_settings_json''][''error_'' . $_v] = $this->language->get(''error_tracking_code_'' . $_v);\n			}\n			$data[''tracking_input_settings_json''][''required''] = $this->config->get(''tracking_input_require_code'') ? 1 : 0;			\n			$data[''tracking_input_settings_json''][''entry''] = $this->language->get(''entry_tracking_input'');\n			$data[''tracking_input_settings_json''][''help''] = $this->language->get(''help_tracking_input'');\n			$data[''tracking_input_settings_json''][''link_check''] = html_entity_decode($this->url->link(''affiliate/tracking_input/check_tracking'', '''', ''SSL''), ENT_QUOTES, ''UTF-8'');\n			$data[''tracking_input_settings_json''] = json_encode($data[''tracking_input_settings_json'']);			\n			$this->document->addScript(''catalog/view/javascript/trifyp.min.js'');\n		} else {\n			$data[''tracking_input_show''] = false;\n		}\n		//+mod by yp end				\n			\n			]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[if ((utf8_strlen(trim($this->request->post[''firstname''])) < 1)]]></search>\n			<add position="before"><![CDATA[		\n			\n		//+mod by yp start\n		if (isset($do_aff) && $do_aff === true && $this->config->get(''tracking_input_status'') && $this->config->get(''tracking_input_choose_code'')) {\n			$this->language->load(''affiliate/tracking_input'');\n			$_er = array();\n			if(strlen($this->request->post[''tracking_input'']) < 1) {\n				if($this->config->get(''tracking_input_require_code'')) $_er[] = $this->language->get(''error_tracking_code_required'');\n			} else {\n				if(!preg_match("/^[\\w\\-]+$/", $this->request->post[''tracking_input''])) $_er[] = $this->language->get(''error_tracking_code_invalid'');\n				if(strlen($this->request->post[''tracking_input'']) > 20) $_er[] = $this->language->get(''error_tracking_code_long'');\n				if(sizeof($_er) < 1) {\n					$this->load->model(''affiliate/affiliate'');\n					if($this->model_affiliate_affiliate->getAffiliateByCode($this->request->post[''tracking_input'']))  $_er[] = $this->language->get(''error_tracking_code_exists'');\n				}\n				if(sizeof($_er) < 1 && $this->config->get(''tracking_input_allow_coupon'')) {\n					$_mpfx = version_compare(VERSION, ''2.1'', ''<'') ? ''checkout'' : ''total'';\n					$this->load->model($_mpfx . ''/coupon'');\n					if($this->{''model_'' . $_mpfx . ''_coupon''}->getCoupon($this->request->post[''tracking_input''])) $_er[] = $this->language->get(''error_tracking_code_exists'');\n				}				\n			}\n			if(sizeof($_er) > 0) $this->error[''tracking_input''] = sizeof($_er) > 1 ? $_er : $_er[0];			\n		}\n		//+mod by yp end\n		\n			]]></add>\n		</operation>					\n</file>		\n<file path="catalog/controller/affiliate/register.php">\n		<operation>\n			<search><![CDATA[$data[''column_left''] = ]]></search>\n			<add position="before"><![CDATA[\n\n		//+mod by yp start\n		if ($this->config->get(''tracking_input_status'') && $this->config->get(''tracking_input_choose_code'')) {\n			$data[''tracking_input_show''] = true;\n			$data[''tracking_input_settings_json''] = array(\n				''tracking_input_value'' => (isset($this->request->post[''tracking_input'']) ? $this->request->post[''tracking_input''] : ''''),\n				''error'' => ''''\n			);\n			$data[''tracking_input_settings_json''][''required''] = $this->config->get(''tracking_input_require_code'') ? 1 : 0;			\n			if(isset($this->error[''tracking_input''])) $data[''tracking_input_settings_json''][''error''] = is_array($this->error[''tracking_input'']) ? implode(''<br />'', $this->error[''tracking_input'']) : $this->error[''tracking_input''];			\n			$this->language->load(''affiliate/tracking_input'');\n			foreach(array(''exists'', ''invalid'', ''long'', ''required'') as $_v) {\n				$data[''tracking_input_settings_json''][''error_'' . $_v] = $this->language->get(''error_tracking_code_'' . $_v);\n			}\n			$data[''tracking_input_settings_json''][''entry''] = $this->language->get(''entry_tracking_input'');\n			$data[''tracking_input_settings_json''][''help''] = $this->language->get(''help_tracking_input'');\n			$data[''tracking_input_settings_json''][''link_check''] = html_entity_decode($this->url->link(''affiliate/tracking_input/check_tracking'', '''', ''SSL''), ENT_QUOTES, ''UTF-8'');\n			$data[''tracking_input_settings_json''] = json_encode($data[''tracking_input_settings_json'']);			\n			$this->document->addScript(''catalog/view/javascript/trifyp.min.js'');\n		} else {\n			$data[''tracking_input_show''] = false;\n		}\n		//+mod by yp end\n			\n			]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[function validate() {]]></search>\n			<add position="after"><![CDATA[		\n			\n		//+mod by yp start\n		if ($this->config->get(''tracking_input_status'') && $this->config->get(''tracking_input_choose_code'')) {\n			$this->language->load(''affiliate/tracking_input'');\n			$_er = array();\n			if(strlen($this->request->post[''tracking_input'']) < 1) {\n				if($this->config->get(''tracking_input_require_code'')) $_er[] = $this->language->get(''error_tracking_code_required'');\n			} else {\n				if(!preg_match("/^[\\w\\-]+$/", $this->request->post[''tracking_input''])) $_er[] = $this->language->get(''error_tracking_code_invalid'');\n				if(strlen($this->request->post[''tracking_input'']) > 20) $_er[] = $this->language->get(''error_tracking_code_long'');\n				if(sizeof($_er) < 1) {\n					$this->load->model(''affiliate/affiliate'');\n					if($this->model_affiliate_affiliate->getAffiliateByCode($this->request->post[''tracking_input'']))  $_er[] = $this->language->get(''error_tracking_code_exists'');\n				}\n				if(sizeof($_er) < 1 && $this->config->get(''tracking_input_allow_coupon'')) {\n					$_mpfx = version_compare(VERSION, ''2.1'', ''<'') ? ''checkout'' : ''total'';\n					$this->load->model($_mpfx . ''/coupon'');\n					if($this->{''model_'' . $_mpfx . ''_coupon''}->getCoupon($this->request->post[''tracking_input''])) $_er[] = $this->language->get(''error_tracking_code_exists'');\n				}								\n			}\n			if(sizeof($_er) > 0) $this->error[''tracking_input''] = sizeof($_er) > 1 ? $_er : $_er[0];			\n		}\n		//+mod by yp end\n		\n			]]></add>\n		</operation>			\n</file>	\n<file path="catalog/controller/affiliate/tracking.php">\n		<operation>\n			<search><![CDATA[function index() {]]></search>\n			<add position="after"><![CDATA[\n\n		//+mod by yp start\n		if($this->config->get(''tracking_input_status'') && $this->config->get(''tracking_input_edit_code'')) {\n		$data[''do_edit_code''] = true;\n		$this->language->load(''affiliate/tracking_input'');\n		foreach(array(''button_edit_code'', ''error_tracking_code_exists'', ''error_tracking_code_invalid'', ''error_tracking_code_long'', ''error_tracking_code_required'', ''warning_edit_code'', ''text_loading'') as $_v) {\n			$data[$_v] = str_replace(array("\\r\\n", "\\r", "\\n", ''"''), array(''\\\\n'', ''\\\\n'', ''\\\\n'', "''"), addslashes(html_entity_decode($this->language->get($_v), ENT_QUOTES, ''UTF-8'')));\n		}\n		$data[''edit_code_link''] = addslashes(html_entity_decode($this->url->link(''affiliate/tracking_input/update'', '''', ''SSL''), ENT_QUOTES, ''UTF-8''));\n		} else {\n			$data[''do_edit_code''] = false;\n		}\n		//+mod by yp end	\n		\n			]]></add>\n		</operation>			\n</file>	\n<file path="catalog/controller/checkout/coupon.php">\n		<operation>\n			<search><![CDATA[->getCoupon($coupon);]]></search>\n			<add position="replace"><![CDATA[->getCoupon($this->request->post[''coupon''], true);//+mod by yp]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[$this->language->get(''text_success'');]]></search>\n			<add position="after"><![CDATA[\n\n		//+mod by yp start\n		if ($coupon_info === ''tracking_input'' && $this->config->get(''tracking_input_status'') && $this->config->get(''tracking_input_allow_coupon'')) {\n			$this->language->load(''affiliate/tracking_input'');\n			$this->session->data[''success''] = $this->language->get(''text_tracking_input_coupon_success'');\n			unset($this->session->data[''coupon'']);\n			\n		}\n		//+mod by yp end\n		\n			]]></add>\n		</operation>			\n</file>\n<file path="catalog/controller/total/coupon.php">\n		<operation>\n			<search><![CDATA[->getCoupon($coupon);]]></search>\n			<add position="replace"><![CDATA[->getCoupon($this->request->post[''coupon''], true);//+mod by yp]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[$this->language->get(''text_success'');]]></search>\n			<add position="after"><![CDATA[\n\n		//+mod by yp start\n		if ($coupon_info === ''tracking_input'' && $this->config->get(''tracking_input_status'') && $this->config->get(''tracking_input_allow_coupon'')) {\n			$this->language->load(''affiliate/tracking_input'');\n			$this->session->data[''success''] = $this->language->get(''text_tracking_input_coupon_success'');\n			unset($this->session->data[''coupon'']);\n			\n		}\n		//+mod by yp end\n		\n			]]></add>\n		</operation>			\n</file>\n<file path="catalog/controller/checkout/register.php">\n		<operation>\n			<search><![CDATA[if (file_exists(DIR_TEMPLATE]]></search>\n			<add position="before"><![CDATA[\n\n		//+mod by yp start\n		if (isset($accc_status) && $accc_status && $this->config->get(''tracking_input_status'') && $this->config->get(''tracking_input_choose_code_checkout'')) {\n			$data[''tracking_input_show''] = true;\n			$data[''tracking_input_settings_json''] = array(\n				''accc'' => true,\n				''tracking_input_value'' => (isset($this->request->post[''tracking_input'']) ? $this->request->post[''tracking_input''] : ''''),\n				''error'' => ''''\n			);\n			if(isset($this->error[''tracking_input''])) $data[''tracking_input_settings_json''][''error''] = is_array($this->error[''tracking_input'']) ? implode(''<br />'', $this->error[''tracking_input'']) : $this->error[''tracking_input''];			\n			$this->language->load(''affiliate/tracking_input'');\n			foreach(array(''exists'', ''invalid'', ''long'', ''required'') as $_v) {\n				$data[''tracking_input_settings_json''][''error_'' . $_v] = $this->language->get(''error_tracking_code_'' . $_v);\n			}\n			$data[''tracking_input_settings_json''][''accc_checkout''] = 1;\n			$data[''tracking_input_settings_json''][''required''] = $this->config->get(''tracking_input_require_code'') ? 1 : 0;			\n			$data[''tracking_input_settings_json''][''entry''] = $this->language->get(''entry_tracking_input'');\n			$data[''tracking_input_settings_json''][''help''] = $this->language->get(''help_tracking_input'');\n			$data[''tracking_input_settings_json''][''link_check''] = html_entity_decode($this->url->link(''affiliate/tracking_input/check_tracking'', '''', ''SSL''), ENT_QUOTES, ''UTF-8'');\n			$data[''tracking_input_settings_json''] = json_encode($data[''tracking_input_settings_json'']);			\n			$data[''trifyp_script''] = ''catalog/view/javascript/trifyp.min.js'';\n			//$this->document->addScript(''catalog/view/javascript/trifyp.min.js'');\n		} else {\n			$data[''tracking_input_show''] = false;\n		}\n		//+mod by yp end	\n			\n			]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[if ((utf8_strlen(trim($this->request->post[''firstname''])) < 1)]]></search>\n			<add position="before"><![CDATA[		\n			\n		//+mod by yp start\n		if (isset($do_aff) && $do_aff === true && $this->config->get(''tracking_input_status'') && $this->config->get(''tracking_input_choose_code_checkout'')) {\n			$this->language->load(''affiliate/tracking_input'');\n			$_er = array();\n			if(strlen($this->request->post[''tracking_input'']) < 1) {\n				if($this->config->get(''tracking_input_require_code'')) $_er[] = $this->language->get(''error_tracking_code_required'');\n			} else {\n				if(!preg_match("/^[\\w\\-]+$/", $this->request->post[''tracking_input''])) $_er[] = $this->language->get(''error_tracking_code_invalid'');\n				if(strlen($this->request->post[''tracking_input'']) > 20) $_er[] = $this->language->get(''error_tracking_code_long'');\n				if(sizeof($_er) < 1) {\n					$this->load->model(''affiliate/affiliate'');\n					if($this->model_affiliate_affiliate->getAffiliateByCode($this->request->post[''tracking_input'']))  $_er[] = $this->language->get(''error_tracking_code_exists'');\n				}\n				if(sizeof($_er) < 1 && $this->config->get(''tracking_input_allow_coupon'')) {\n					$_mpfx = version_compare(VERSION, ''2.1'', ''<'') ? ''checkout'' : ''total'';\n					$this->load->model($_mpfx . ''/coupon'');\n					if($this->{''model_'' . $_mpfx . ''_coupon''}->getCoupon($this->request->post[''tracking_input''])) $_er[] = $this->language->get(''error_tracking_code_exists'');\n				}				\n			}\n			if(sizeof($_er) > 0) $json[''error''][''tracking_input''] = implode(''<br />'', $_er);\n		}\n		//+mod by yp end\n		\n			]]></add>\n		</operation>					\n</file>				\n<file path="catalog/model/affiliate/affiliate.php">\n		<operation>\n			<search><![CDATA[$affiliate_id = $this->db->getLastId();]]></search>\n			<add position="after"><![CDATA[\n						\n		if($this->config->get(''tracking_input_status'') && $this->config->get(''tracking_input_choose_code'') && isset($this->request->post[''tracking_input'']) && preg_match("/^[\\w\\-]+$/", $this->request->post[''tracking_input'']) && strlen($this->request->post[''tracking_input'']) < 21) $this->db->query("UPDATE " . DB_PREFIX . "affiliate SET `code` = ''" . $this->db->escape($this->request->post[''tracking_input'']) . "'' WHERE affiliate_id = ''" . (int)$affiliate_id . "''");//+mod by yp\n			\n			]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[public function editPayment(]]></search>\n			<add position="before"><![CDATA[\n			\n	//+mod by yp start\n	public function editCode($code) {\n		$this->db->query("UPDATE " . DB_PREFIX . "affiliate SET code = ''" . $this->db->escape($code) . "'' WHERE affiliate_id = ''" . (int)$this->affiliate->getId() . "''");\n	}\n	//+mod by yp end\n	\n			]]></add>\n		</operation>		\n</file>\n<file path="catalog/model/checkout/coupon.php">\n		<operation>\n			<search><![CDATA[public function getCoupon($code) {]]></search>\n			<add position="replace"><![CDATA[public function getCoupon($code, $tracking_input = false) {//+mod by yp]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[if ($status) {]]></search>\n			<add position="before"><![CDATA[\n			\n		//+mod by yp start\n		if ($tracking_input && !$status && $this->config->get(''tracking_input_status'') && $this->config->get(''tracking_input_allow_coupon'')) {\n			$this->load->model(''affiliate/affiliate'');\n			$mark = false;\n			$aff = $this->model_affiliate_affiliate->getAffiliateByCode($code);\n			if(!$aff && !isset($this->request->cookie[''tracking'']) && $this->config->get(''tracking_input_allow_marketing'')) {\n				$this->load->model(''checkout/marketing'');\n				$mark = $this->model_checkout_marketing->getMarketingByCode($code);\n			}\n			if($mark || ($aff && $aff[''status''] && $aff[''approved''])) {\n				$_cookie_ttl = 86400000;\n				$this->session->data[''tracking_input_show''] = false;\n				if(isset($this->request->cookie[''tracking''])) setcookie(''tracking'', '''', time() - 86400, ''/'');	\n				setcookie(''tracking'', $code, ($_cookie_ttl ? (time() + $_cookie_ttl) : 0), ''/'');\n				$this->session->data[''tracking''] = $code;\n				if($mark) $this->db->query("UPDATE `" . DB_PREFIX . "marketing` SET clicks = (clicks + 1) WHERE code = ''" . $this->db->escape($code) . "''");\n				return ''tracking_input'';\n			}			\n		}\n		//+mod by yp end			\n		\n			]]></add>\n		</operation>		\n</file>			\n<file path="catalog/model/total/coupon.php">\n		<operation>\n			<ignoreif><![CDATA[model_checkout_coupon]]></ignoreif>\n			<search><![CDATA[public function getCoupon($code) {]]></search>\n			<add position="replace"><![CDATA[public function getCoupon($code, $tracking_input = false) {//+mod by yp]]></add>\n		</operation>\n		<operation>\n			<ignoreif><![CDATA[model_checkout_coupon]]></ignoreif>\n			<search index="0"><![CDATA[if ($status) {]]></search>\n			<add position="before"><![CDATA[\n			\n		//+mod by yp start\n		if (version_compare(VERSION, ''2.1'', ''>='') && $tracking_input && !$status && $this->config->get(''tracking_input_status'') && $this->config->get(''tracking_input_allow_coupon'')) {\n			$this->load->model(''affiliate/affiliate'');\n			$mark = false;\n			$aff = $this->model_affiliate_affiliate->getAffiliateByCode($code);\n			if(!$aff && !isset($this->request->cookie[''tracking'']) && $this->config->get(''tracking_input_allow_marketing'')) {\n				$this->load->model(''checkout/marketing'');\n				$mark = $this->model_checkout_marketing->getMarketingByCode($code);\n			}\n			if($mark || ($aff && $aff[''status''] && $aff[''approved''])) {\n				$_cookie_ttl = 86400000;\n				$this->session->data[''tracking_input_show''] = false;\n				if(isset($this->request->cookie[''tracking''])) setcookie(''tracking'', '''', time() - 86400, ''/'');	\n				setcookie(''tracking'', $code, ($_cookie_ttl ? (time() + $_cookie_ttl) : 0), ''/'');\n				$this->session->data[''tracking''] = $code;\n				if($mark) $this->db->query("UPDATE `" . DB_PREFIX . "marketing` SET clicks = (clicks + 1) WHERE code = ''" . $this->db->escape($code) . "''");\n				return ''tracking_input'';\n			}			\n		}\n		//+mod by yp end			\n		\n			]]></add>\n		</operation>		\n</file>			\n<file path="catalog/view/theme/*/template/account/register.tpl">\n		<operation>\n			<search><![CDATA[<?php echo $footer]]></search>\n			<add position="before"><![CDATA[\n\n<?php //+mod by yp start\n	if(isset($tracking_input_show) && $tracking_input_show) {?>\n<script type="text/javascript"><!--\n	var _TI_ = <?php echo $tracking_input_settings_json;?>;\n//--></script>\n<?php } //+mod by yp end \n?>\n			\n			]]></add>\n		</operation>\n</file>\n<file path="catalog/view/theme/*/template/affiliate/register.tpl">\n		<operation>\n			<search><![CDATA[<?php echo $footer]]></search>\n			<add position="before"><![CDATA[\n\n<?php //+mod by yp start\n	if(isset($tracking_input_show) && $tracking_input_show) {?>\n<script type="text/javascript"><!--\n	var _TI_ = <?php echo $tracking_input_settings_json;?>;\n//--></script>\n<?php } //+mod by yp end \n?>\n			\n			]]></add>\n		</operation>\n</file>\n<file path="catalog/view/theme/*/template/affiliate/tracking.tpl">\n		<operation>\n			<search><![CDATA[<?php echo $footer]]></search>\n			<add position="before"><![CDATA[\n\n<?php //+mod by yp start \n	if($do_edit_code) {?>\n<script type="text/javascript"><!--\n$(document).ready(function() {\nvar _t;\nfor(var _i = 0; _i < $(''textarea'').length; _i++) {\n    if($($(''textarea'')[_i]).val() == ''<?php echo $code; ?>'') {\n        _t = $(''textarea'')[_i];\n		$(_t).after(''<input type="text" id="__edit_code" value="<?php echo $code; ?>" class="form-control" /> <button class="btn btn-default" type="button" id="__edit_code_button" data-loading-text="<?php echo $text_loading; ?>" value="<?php echo $button_edit_code;?>"><?php echo $button_edit_code;?></button>'');\n		$(_t).hide();		\n        break;\n    }\n}\n\n$(document).on(''click'', ''#__edit_code_button'', function() {\n	$(''#__edit_code_error'').remove();\n	var node = this;\n	var _code = $(''#__edit_code'').val();\n	if(_code == ''<?php echo $code; ?>'') return;\n	if(_code.length < 1) {\n		$(node).parent().find(''input'').after(''<div class="text-danger" id="__edit_code_error"><?php echo $error_tracking_code_required; ?></div>'');		\n		return;\n	}\n	\n	if(_code.length > 20) {\n		$(node).parent().find(''input'').after(''<div class="text-danger" id="__edit_code_error"><?php echo $error_tracking_code_long; ?></div>'');\n		return;\n	}	\n	\n	if(!/^[a-z0-9_\\-]+$/.test(_code)) {\n		$(node).parent().find(''input'').after(''<div class="text-danger" id="__edit_code_error"><?php echo $error_tracking_code_invalid; ?></div>'');\n		return;\n	}\n	if(confirm(''<?php echo $warning_edit_code;?>'')) {\n		\n		$.ajax({\n			url: ''<?php echo $edit_code_link; ?>'',\n			type: ''post'',			\n			data: {tracking_input : _code},\n			cache: false,\n			beforeSend: function() {\n				$(node).button(''loading'');\n			},\n			complete: function() {\n				$(node).button(''reset'');\n			},\n			success: function(_r) {\n				if(!_r || _r == ''0'') {\n					$(node).parent().find(''input'').after(''<div class="text-danger" id="__edit_code_error"><?php echo $error_tracking_code_exists; ?></div>'');\n					return;\n				}\n				document.location.reload();\n			},\n			error: function(xhr, ajaxOptions, thrownError) {\n				alert(thrownError + "\\r\\n" + xhr.statusText + "\\r\\n" + xhr.responseText);\n			}\n		});		\n	}\n});\n\n});\n//--></script>\n<?php }\n	//+mod by yp end \n?>\n			\n			]]></add>\n		</operation>\n</file>\n<file path="catalog/view/theme/*/template/checkout/register.tpl">\n		<operation>\n			<search><![CDATA[<div class="row">]]></search>\n			<add position="before"><![CDATA[\n\n<?php //+mod by yp start\n	if(isset($tracking_input_show) && $tracking_input_show) {?>\n<script type="text/javascript"><!--\n	var _TI_ = <?php echo $tracking_input_settings_json;?>;\n//--></script>\n<script type="text/javascript" src="<?php echo $trifyp_script; ?>"></script>\n<?php } //+mod by yp end \n?>\n			\n			]]></add>\n		</operation>\n</file>\n\n</modification>', 1, '2016-01-20 15:07:28'),
(8, 'Tracking Discount (OC2)', 'td151028_yp', 'YP', '1.5.1028', '', '<?xml version="1.0" encoding="utf-8"?>\n<modification>\n	<id><![CDATA[Tracking Discount (OC2)]]></id>\n	<name><![CDATA[Tracking Discount (OC2)]]></name>\n	<version><![CDATA[1.5.1028]]></version>\n	<code><![CDATA[td151028_yp]]></code>\n	<author><![CDATA[YP]]></author>\n<file path="admin/controller/marketing/affiliate.php">\n		<operation>\n			<search><![CDATA[if (!$this->request->post[''code'']) {]]></search>\n			<add position="before"><![CDATA[	\n			\n		//+mod by yp start\nif ($this->config->get(''tracking_discount_status'') && isset($this->request->post[''tracking_discount_amount'']) && strlen($this->request->post[''tracking_discount_amount'']) > 0 && !preg_match("/^\\d+(\\.\\d+)?$/", $this->request->post[''tracking_discount_amount''])) {\n	$this->error[''tracking_discount_amount''] = $this->language->get(''error_tracking_discount_amount'');\n	if(isset($this->error[''warning'']) && $this->error[''warning'']) {\n		$this->error[''warning''] .= ''<br />'' . $this->language->get(''error_tracking_discount_amount'');\n	} else {\n		$this->error[''warning''] = $this->language->get(''error_tracking_discount_amount'');	\n	}\n}			\n		//+mod by yp end			\n		\n			]]></add>\n		</operation>	\n		<operation>\n			<search><![CDATA[(''tab_transaction'');]]></search>\n			<add position="after"><![CDATA[	\n			\n		//+mod by yp start\nif ($this->config->get(''tracking_discount_status'')) {	\n		$data[''tracking_discount_status''] = true;\n		foreach(array(''entry_tracking_discount_amount'', ''help_tracking_discount_amount'', ''entry_tracking_discount_type'', ''option_tracking_discount_fixed'', ''option_tracking_discount_percent'') as $_v) {\n			$data[$_v] = preg_replace("/[\\n\\r\\s]+/", '' '', addcslashes($this->language->get($_v), "''"));\n		}\n 		if (isset($this->error[''tracking_discount_amount''])) {\n			$data[''error_tracking_discount_amount''] = $this->error[''tracking_discount_amount''];\n		} else {\n			$data[''error_tracking_discount_amount''] = '''';\n		}\n} else {\n		$data[''tracking_discount_status''] = false;\n}\n		//+mod by yp end			\n		\n			]]></add>\n		</operation>					\n		<operation>\n			<search><![CDATA[if (isset($this->request->get[''affiliate_id''])) {]]></search>\n			<add position="before"><![CDATA[	\n			\n		//+mod by yp start\nif ($this->config->get(''tracking_discount_status'')) {			\n    	if (isset($this->request->post[''tracking_discount_amount''])) {\n      		$data[''tracking_discount_amount''] = $this->request->post[''tracking_discount_amount''];\n		} elseif (!empty($affiliate_info) && isset($affiliate_info[''tracking_discount_amount''])) { \n			$data[''tracking_discount_amount''] = $affiliate_info[''tracking_discount_amount''];\n		} else {\n      		$data[''tracking_discount_amount''] = '''';\n    	}\n		\n    	if (isset($this->request->post[''tracking_discount_type''])) {\n      		$data[''tracking_discount_type''] = $this->request->post[''tracking_discount_type''];\n		} elseif (!empty($affiliate_info) && isset($affiliate_info[''tracking_discount_type''])) { \n			$data[''tracking_discount_type''] = $affiliate_info[''tracking_discount_type''];\n		} else {\n      		$data[''tracking_discount_type''] = '''';\n    	}}\n		//+mod by yp end			\n		\n			]]></add>\n		</operation>		\n</file>					\n<file path="admin/model/marketing/affiliate.php">\n		<operation>\n			<search><![CDATA[$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "affiliate WHERE affiliate_id]]></search>\n			<add position="before"><![CDATA[	\n			\n	//+mod by yp start					\nif($this->config->get(''tracking_discount_status'')) {\n	$query = $this->db->query("SELECT a.*, atd.amount AS tracking_discount_amount, atd.type AS tracking_discount_type FROM " . DB_PREFIX . "affiliate a LEFT  JOIN " . DB_PREFIX . "affiliate_tracking_discount atd ON atd.affiliate_id = a.affiliate_id WHERE a.affiliate_id = ''" . (int)$affiliate_id . "''");\n} else {\n	//+mod by yp end			\n	\n			]]></add>\n		</operation>			\n		<operation>\n			<search><![CDATA[SELECT DISTINCT * FROM " . DB_PREFIX . "affiliate WHERE affiliate_id = ''" . (int)$affiliate_id . "''");]]></search>\n			<add position="after"><![CDATA[	\n			\n	 } //+mod by yp\n	 \n			]]></add>\n		</operation>\n</file>					\n<file path="admin/language/*/marketing/affiliate.php">\n		<operation>\n			<search><![CDATA[?php]]></search>\n			<add position="after"><![CDATA[	\n			\n		//+mod by yp start	\n$_[''entry_tracking_discount_amount''] = ''Tracking Discount Amount'';\n$_[''help_tracking_discount_amount''] = ''Global setting is used if left blank'';\n$_[''entry_tracking_discount_type'']   = ''Tracking Discount Type'';\n$_[''option_tracking_discount_fixed''] = ''Fixed'';\n$_[''option_tracking_discount_percent''] = ''Percent (%)'';\n$_[''error_tracking_discount_amount'']   = ''Error: Only numbers (such as 5 or 5.5) allowed for Tracking Discount Amount, or leave it blank'';\n		//+mod by yp end			\n		\n			]]></add>\n		</operation>					\n</file>					\n<file path="admin/view/template/marketing/affiliate_form.tpl">\n		<operation>\n			<search><![CDATA[<?php echo $footer;]]></search>\n			<add position="before"><![CDATA[	\n			\n<?php //+mod by yp start\n	if($tracking_discount_status) { ?>\n<script type="text/javascript"><!-- \njQuery(document).ready(function() {\n	var _html = ''<div class="form-group"><label class="col-sm-2 control-label" for="input-tracking-discount-amount"><span data-toggle="tooltip" title="<?php echo $help_tracking_discount_amount; ?>"><?php echo $entry_tracking_discount_amount; ?></span></label><div class="col-sm-10"><input type="text" name="tracking_discount_amount" value="<?php echo $tracking_discount_amount; ?>" placeholder="<?php echo $entry_tracking_discount_amount; ?>" id="input-tracking-discount-amount" class="form-control" />'';\n<?php if ($error_tracking_discount_amount) { ?>	\n	_html += ''<div class="text-danger"><?php echo $error_tracking_discount_amount; ?></div>'';\n<?php } ?>	\n	_html += ''</div></div><div class="form-group"><label class="col-sm-2 control-label" for="input-tracking-discount-type"><?php echo $entry_tracking_discount_type; ?></label><div class="col-sm-10"><select name="tracking_discount_type" id="input-tracking-discount-type" class="form-control"><option value="percent"<?php if ($tracking_discount_type != ''fixed'') { echo '' selected="selected"''; } ?>><?php echo $option_tracking_discount_percent; ?></option><option value="fixed"<?php if ($tracking_discount_type == ''fixed'') { echo '' selected="selected"''; } ?>><?php echo $option_tracking_discount_fixed; ?></option></select></div></div>'';\n	jQuery(''#tab-payment>div:first'').after(_html);\n});\n//--></script> 			\n<?php //+mod by yp end\n	} ?>\n	\n			]]></add>\n		</operation>					\n</file>\n</modification>', 1, '2016-01-20 15:14:27'),
(9, 'Affiliate Tracking with Coupons (OC2)', 'cft151122_yp', 'YP', '1.5.1122', '', '<?xml version="1.0" encoding="utf-8"?>\n<modification>\n	<id><![CDATA[Affiliate Tracking with Coupons (OC2)]]></id>\n	<name><![CDATA[Affiliate Tracking with Coupons (OC2)]]></name>\n	<version><![CDATA[1.5.1122]]></version>\n	<author><![CDATA[YP]]></author>\n	<code><![CDATA[cft151122_yp]]></code>\n<file path="admin/controller/marketing/coupon.php">\n		<operation>\n			<search><![CDATA[public function index(]]></search>\n			<add position="before"><![CDATA[\n			\n	//+mod by yp cft start\n	public function affautocomplete() {\n		$_REQUEST[''format''] = $_GET[''format''] = ''raw'';//+mod by yp mijoshop\n		$this->language->load(''marketing/coupon'');\n		$out = array();\n		if(isset($this->request->request[''afffilter''])) {\n			$this->load->model(''marketing/cftyp'');\n			$r = $this->model_marketing_cftyp->getAffiliates($this->request->request[''afffilter'']);\n			foreach($r as $k => $v) {\n				$out[] = array(''item_id'' => ''a_'' . $k, ''name'' => $v, ''category'' => $this->language->get(''text_category_affiliates''));\n			}\n			$r = $this->model_marketing_cftyp->getMarketing($this->request->request[''afffilter'']);\n			foreach($r as $k => $v) {\n				$out[] = array(''item_id'' => ''m_'' . $k, ''name'' => $v, ''category'' => $this->language->get(''text_category_marketing''));\n			}			\n		}	\n		$this->response->addHeader(''Content-Type: application/json'');\n		$this->response->setOutput(json_encode($out));\n	}\n	//+mod by yp cft end	\n	\n	\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[function getForm() {]]></search>\n			<add position="after"><![CDATA[\n			\n		//+mod by yp cft start\n		if($this->config->get(''cftyp_status'')) {\n			$data[''cftyp_status''] = true;\n			$data[''text_none''] = $this->language->get(''text_none'');\n			$data[''entry_affiliate''] = $this->language->get(''entry_affiliate'');\n			$data[''help_affiliate''] = $this->language->get(''help_affiliate'');\n			$data[''text_clear''] = $this->language->get(''text_clear'');\n			$this->load->model(''marketing/cftyp'');\n		} else {\n			$data[''cftyp_status''] = false;\n		}\n		//+mod by yp cft end	\n		\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[$this->response->setOutput($this->load->view(''marketing/coupon_form.tpl'']]></search>\n			<add position="before"><![CDATA[\n			\n		//+mod by yp cft start\n		if($this->config->get(''cftyp_status'')) {\n			if (isset($this->request->post[''cftyp_affiliate''])) {\n				$data[''cftyp_affiliate''] = $this->request->post[''cftyp_affiliate''];\n			} elseif (!empty($coupon_info)) {\n				$data[''cftyp_affiliate''] = $coupon_info[''cftyp_affiliate''];\n			} else {\n				$data[''cftyp_affiliate''] = ''0'';\n			}		\n		\n			if($data[''cftyp_affiliate'']) {\n				$_c = explode(''_'', $data[''cftyp_affiliate'']);\n				if(sizeof($_c) < 2) array_unshift($_c, ''a'');\n				if($_c[0] == ''a'') {\n					$this->load->model(''marketing/affiliate'');\n					$_aff = $this->model_marketing_affiliate->getAffiliate($_c[1]);\n					$data[''cftyp_affiliate_name''] = $_aff[''firstname''] . '' '' . $_aff[''lastname''] . ''('' . $_aff[''email''] . '')'';\n				} else {\n					$_res = $this->db->query("SELECT `name` FROM " . DB_PREFIX . "marketing WHERE marketing_id = ''" . (int)$_c[1] . "''");\n					$data[''cftyp_affiliate_name''] = $_res->row[''name''];\n				}\n			} else {\n				$data[''cftyp_affiliate_name''] = '''';\n			}		\n		}\n		//+mod by yp cft end\n		\n]]></add>\n		</operation>		\n</file>	\n<file path="admin/model/marketing/coupon.php">\n		<operation>\n			<search><![CDATA[$coupon_id = $this->db->getLastId();]]></search>\n			<add position="after"><![CDATA[\n			\n		//+mod by yp cft start\n		if($this->config->get(''cftyp_status'')) {\n			$this->load->model(''marketing/cftyp'');\n			if(isset($data[''cftyp_affiliate''])) {\n				$this->model_marketing_cftyp->edit($coupon_id, $data[''cftyp_affiliate'']);\n			} else {\n				$this->model_marketing_cftyp->edit($coupon_id);\n			}		\n		}\n		//+mod by yp cft end\n\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[function editCoupon($coupon_id, $data) {]]></search>\n			<add position="after"><![CDATA[\n			\n		//+mod by yp cft start\n		if($this->config->get(''cftyp_status'')) {\n			$this->load->model(''marketing/cftyp'');\n			if(isset($data[''cftyp_affiliate''])) {\n				$this->model_marketing_cftyp->edit($coupon_id, $data[''cftyp_affiliate'']);\n			} else {\n				$this->model_marketing_cftyp->edit($coupon_id);\n			}		\n		}\n		//+mod by yp cft end\n\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[DISTINCT * FROM " . DB_PREFIX . "coupon WHERE coupon_id = ''" . (int)$coupon_id . "''");]]></search>\n			<add position="after"><![CDATA[\n			\n		//+mod by yp cft start\n		if($query->row && $this->config->get(''cftyp_status'')) {\n			$this->load->model(''marketing/cftyp'');\n			$query->row[''cftyp_affiliate''] = $this->model_marketing_cftyp->getCouponAssoc($query->row[''coupon_id'']);					\n		}\n		//+mod by yp cft end\n]]></add>\n		</operation>		\n		<operation>\n			<search><![CDATA[DISTINCT * FROM " . DB_PREFIX . "coupon WHERE code = ''" . $this->db->escape($code) . "''");]]></search>\n			<add position="after"><![CDATA[\n			\n		//+mod by yp cft start\n		if($query->row && $this->config->get(''cftyp_status'')) {\n			$this->load->model(''marketing/cftyp'');\n			$query->row[''cftyp_affiliate''] = $this->model_marketing_cftyp->getCouponAssoc($query->row[''coupon_id'']);					\n		}\n		//+mod by yp cft end\n]]></add>\n		</operation>\n</file>\n<file path="admin/language/*/marketing/coupon.php">\n		<operation>\n			<search><![CDATA[?php]]></search>\n			<add position="after"><![CDATA[\n			\n//+mod by yp cft start			\n$_[''entry_affiliate'']     = ''Affiliate or Marketing Campaign'';\n$_[''help_affiliate'']      = ''start typing affiliate&apos;s name or email, or marketing campaign&apos;s name for autocomplete'';\n$_[''text_clear'']          = ''clear'';\n$_[''text_category_affiliates''] = ''Affiliates'';\n$_[''text_category_marketing'']  = ''Marketing Campaigns'';\n//+mod by yp cft end\n\n]]></add>\n		</operation>\n</file>\n<file path="admin/view/template/marketing/coupon_form.tpl">\n		<operation>\n			<search><![CDATA[<?php echo $footer; ?>]]></search>\n			<add position="before"><![CDATA[\n			\n<?php /* //+mod by yp cft start	*/ \n	if(isset($cftyp_status) && $cftyp_status) {\n	?>\n<script type="text/javascript"><!--\n\n$(document).ready(function() {\n\n$(document).on(''click'', ''#affclear'', function() {\n	$(''[name="cftyp_affiliate"]'').val(''0'');\n	$(''[name="cftyp_category"]'').val('''');\n	$(''#cftyp_affiliate_name_span'').html('''');\n	$(''#cftyp_affiliate_clear'').hide();\n});\n\n	var _html = ''<div class="form-group"><label class="col-sm-2 control-label" for="cftyp_affiliate_autocomplete"><span data-toggle="tooltip" title="<?php echo $help_affiliate; ?>"><?php echo $entry_affiliate; ?></span></label><div class="col-sm-10"><input type="text" id="cftyp_affiliate_autocomplete" class="form-control" /><input type="hidden" name="cftyp_affiliate" value="<?php echo ($cftyp_affiliate ? $cftyp_affiliate : 0); ?>" /><input type="hidden" name="cftyp_category" value="<?php echo (isset($cftyp_category) ? $cftyp_category : ''''); ?><div id="cftyp_affiliate_div"><span id="cftyp_affiliate_name_span"><?php echo $cftyp_affiliate_name;?></span> &nbsp; <span id="cftyp_affiliate_clear"<?php if(!$cftyp_affiliate) {?> style="display:none;"<?php } ?>>'';\n\n	_html += ''<a href="javascript:;" id="affclear"><?php echo $text_clear; ?></a></span></div></div></div>'';\n\n	$(''#input-discount'').parent().parent().before(_html);\n			  \n$(''#cftyp_affiliate_autocomplete'').autocomplete({\n	delay: 0,\n	source: function(request, response) {\n		$.ajax({\n			url: ''index.php?route=marketing/coupon/affautocomplete&token=<?php echo $token; ?>&afffilter='' +  encodeURIComponent(request),\n			dataType: ''json'',\n			success: function(json) {						\n				response($.map(json, function(item) {					\n					return {\n						label: item.name,\n						value: item.item_id,\n						category: item.category\n					}\n				}));\n			}\n		});\n	}, \n	select: function(item) {		\n		$(''#cftyp_affiliate_clear'').show();\n		$(''#cftyp_affiliate_name_span'').html(item.label);\n		$(''input[name=\\''cftyp_affiliate\\'']'').val(item.value);\n		$(''input[name=\\''cftyp_category\\'']'').val(item.category);\n		$(''#cftyp_affiliate_autocomplete'').val('''');\n		return false;\n	}\n});\n});\n//--></script>\n<?php }\n	/* //+mod by yp cft end	*/ ?>\n	\n]]></add>\n		</operation>\n</file>\n<file path="catalog/model/total/coupon.php">\n		<operation>\n			<ignoreif><![CDATA[model_checkout_coupon]]></ignoreif>\n			<search><![CDATA[public function getCoupon(]]></search>\n			<add position="before"><![CDATA[\n			\n	//+mod by yp cft start\n	private function _set_tracking($coupon_id) {\n		$this->load->model(''checkout/cftyp_coupon_affiliate'');\n		$affiliate = $this->model_checkout_cftyp_coupon_affiliate->getAffiliate($coupon_id);\n		if($affiliate[''cftyp_ctype''] == ''m'' && !isset($this->request->cookie[''tracking''])) {\n			setcookie(''tracking'', $affiliate[''code''], ($this->config->get(''cftyp_session_only'') ? 0 : (time() + 3600 * 24 * 1000)), ''/'');\n			$this->db->query("UPDATE `" . DB_PREFIX . "marketing` SET clicks = (clicks + 1) WHERE code = ''" . $this->db->escape($affiliate[''code'']) . "''");			\n		} else if($affiliate[''cftyp_ctype''] == ''a'' && (!isset($this->request->cookie[''tracking'']) || $this->request->cookie[''tracking''] != $affiliate[''code''])) {\n			if(isset($this->request->cookie[''tracking''])) setcookie(''tracking'', '''', time() - 3600, ''/'');\n			setcookie(''tracking'', $affiliate[''code''], ($this->config->get(''cftyp_session_only'') ? 0 : (time() + 3600 * 24 * 1000)), ''/'');\n		}\n		$this->session->data[''tracking''] = $affiliate[''code''];\n	}\n	//+mod by yp cft end	\n	\n]]></add>\n		</operation>\n		<operation>\n			<ignoreif><![CDATA[model_checkout_coupon]]></ignoreif>\n			<search><![CDATA[if ($coupon_query->num_rows)]]></search>\n			<add position="before"><![CDATA[\n			\n		//+mod by yp cft start\n		if($this->config->get(''cftyp_status'') && (!defined(''CFTYP_NO_AFFILIATE'') || !CFTYP_NO_AFFILIATE) && $this->config->get(''cftyp_always'')) {\n			if($coupon_query->num_rows > 0) {\n				$this->_set_tracking($coupon_query->row[''coupon_id'']);\n			} else {\n				$_cq = $this->db->query("SELECT coupon_id FROM `" . DB_PREFIX . "coupon` WHERE code = ''" . $this->db->escape($code) . "''");\n				if($_cq->num_rows > 0) $this->_set_tracking($_cq->row[''coupon_id'']);\n			}\n		}\n		//+mod by yp cft end\n		\n]]></add>\n		</operation>\n		<operation>\n			<ignoreif><![CDATA[model_checkout_coupon]]></ignoreif>\n			<search><![CDATA[if ($status) {]]></search>\n			<add position="after"><![CDATA[\n			\n			if(isset($coupon_query) && $this->config->get(''cftyp_status'') && (!defined(''CFTYP_NO_AFFILIATE'') || !CFTYP_NO_AFFILIATE) && !$this->config->get(''cftyp_always'')) $this->_set_tracking($coupon_query->row[''coupon_id'']); //+mod by yp cft\n			\n]]></add>\n		</operation>\n</file>\n<file path="catalog/model/checkout/coupon.php">\n		<operation>\n			<search><![CDATA[public function getCoupon(]]></search>\n			<add position="before"><![CDATA[\n			\n	//+mod by yp cft start\n	private function _set_tracking($coupon_id) {\n		$this->load->model(''checkout/cftyp_coupon_affiliate'');\n		$affiliate = $this->model_checkout_cftyp_coupon_affiliate->getAffiliate($coupon_id);\n		if($affiliate[''cftyp_ctype''] == ''m'' && !isset($this->request->cookie[''tracking''])) {\n			setcookie(''tracking'', $affiliate[''code''], ($this->config->get(''cftyp_session_only'') ? 0 : (time() + 3600 * 24 * 1000)), ''/'');\n			$this->db->query("UPDATE `" . DB_PREFIX . "marketing` SET clicks = (clicks + 1) WHERE code = ''" . $this->db->escape($affiliate[''code'']) . "''");			\n		} else if($affiliate[''cftyp_ctype''] == ''a'' && (!isset($this->request->cookie[''tracking'']) || $this->request->cookie[''tracking''] != $affiliate[''code''])) {\n			if(isset($this->request->cookie[''tracking''])) setcookie(''tracking'', '''', time() - 3600, ''/'');\n			setcookie(''tracking'', $affiliate[''code''], ($this->config->get(''cftyp_session_only'') ? 0 : (time() + 3600 * 24 * 1000)), ''/'');\n		}\n		$this->session->data[''tracking''] = $affiliate[''code''];\n	}\n	//+mod by yp cft end	\n	\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[if ($coupon_query->num_rows)]]></search>\n			<add position="before"><![CDATA[\n			\n		//+mod by yp cft start\n		if($this->config->get(''cftyp_status'') && (!defined(''CFTYP_NO_AFFILIATE'') || !CFTYP_NO_AFFILIATE) && $this->config->get(''cftyp_always'')) {\n			if($coupon_query->num_rows > 0) {\n				$this->_set_tracking($coupon_query->row[''coupon_id'']);\n			} else {\n				$_cq = $this->db->query("SELECT coupon_id FROM `" . DB_PREFIX . "coupon` WHERE code = ''" . $this->db->escape($code) . "''");\n				if($_cq->num_rows > 0) $this->_set_tracking($_cq->row[''coupon_id'']);\n			}\n		}\n		//+mod by yp cft end\n		\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[if ($status) {]]></search>\n			<add position="after"><![CDATA[\n			\n			if($this->config->get(''cftyp_status'') && (!defined(''CFTYP_NO_AFFILIATE'') || !CFTYP_NO_AFFILIATE) && !$this->config->get(''cftyp_always'')) $this->_set_tracking($coupon_query->row[''coupon_id'']); //+mod by yp cft\n			\n]]></add>\n		</operation>\n</file>\n</modification>', 1, '2016-01-20 15:20:56');
INSERT INTO `oc_modification` (`modification_id`, `name`, `code`, `author`, `version`, `link`, `xml`, `status`, `date_added`) VALUES
(10, 'Accounts Combine module for openCart 2', 'accc160107_yp', 'YP', '1.6.0107', '', '<?xml version="1.0" encoding="utf-8"?>\n<modification>\n	<id><![CDATA[Accounts Combine module for openCart 2]]></id>\n	<name><![CDATA[Accounts Combine module for openCart 2]]></name>\n	<version><![CDATA[1.6.0107]]></version>\n	<code><![CDATA[accc160107_yp]]></code>\n	<author><![CDATA[YP]]></author>\n<file path="admin/controller/marketing/affiliate.php">\n		<operation>\n			<search><![CDATA[function validateForm() {]]></search>\n			<add position="after"><![CDATA[			\n			\n//+mod by yp start\n$this->validateAcccInsert();\nif($this->config->get(''account_combine_status'')) {\n	$this->request->post[''website''] = isset($this->request->post[''website'']) ? trim($this->request->post[''website'']) : '''';\n	$_fields = $this->config->get(''account_combine_fields'');\n	if($_fields[''website''] == ''r'' && !$this->request->post[''website'']) {\n		$this->language->load(''marketing/account_combine'');\n		$this->error[''website''] = str_replace(array("\\r\\n", "\\r", "\\n"), array(''\\\\n'', ''\\\\n'', ''\\\\n''), addslashes(html_entity_decode($this->language->get(''error_website''), ENT_QUOTES, ''UTF-8'')));\n	}\n}\nif(!isset($this->request->post[''payment''])) $this->request->post[''payment''] = '''';\n//+mod by yp end\n			\n			]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[if (!$this->request->post[''code'']) {]]></search>\n			<add position="before"><![CDATA[\n\n//+mod by yp start\n$__errs = array();\nforeach (array(''paypal'', ''cheque'', ''bank_account_name'', ''bank_account_number'') as $_v) {\n	if(isset($this->error[$_v])) $__errs[] = $this->error[$_v];			\n}\nif(sizeof($__errs) > 0) {\n	if(isset($this->error[''warning''])) $__errs[] = $this->error[''warning''];\n	$this->error[''warning''] = implode(''<br />'', $__errs);\n}			\n//+mod by yp end		\n		\n			]]></add>\n		</operation>			\n		<operation>\n			<search><![CDATA[model_marketing_affiliate->addAffiliate($this->request->post);]]></search>\n			<add position="after"><![CDATA[\n			\n//+mod by yp start			\nif($this->config->get(''account_combine_status'')) {\n	$_accc_aff = $this->model_marketing_affiliate->getAffiliateByEmail($this->request->post[''email'']);\n	if($_accc_aff) {\n		$customer = $this->model_sale_customer->getCustomerByEmail($this->request->post[''email'']);\n		if(!$customer || !sizeof($customer)) {\n			$this->model_marketing_account_combine->addCustomerFromAffiliate($_accc_aff);\n		} else {\n			$this->model_marketing_account_combine->linkCustomerAffiliate($customer[''customer_id''], $_accc_aff[''affiliate_id'']);\n		}			\n	}\n}\n//+mod by yp end\n			\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[model_marketing_affiliate->editAffiliate($this->request->get[''affiliate_id''], $this->request->post);]]></search>\n			<add position="after"><![CDATA[	\n			\n			//+mod by yp start\n			if ($this->config->get(''account_combine_status'')) {\n				$this->load->model(''marketing/account_combine'');\n				$this->model_marketing_account_combine->syncCustomerToAffiliate($this->request->get[''affiliate_id''], (isset($this->request->post[''password'']) ? $this->request->post[''password''] : false));\n			}\n			//+mod by yp end			\n			\n]]></add>\n		</operation>			\n		<operation>\n			<search><![CDATA[protected function validateForm]]></search>\n			<add position="before"><![CDATA[\n			\n	//+mod by yp start\n	protected function validateAcccInsert() {\n		if(!$this->config->get(''account_combine_status'') || isset($this->request->get[''affiliate_id''])) return;\n		$this->load->model(''sale/customer'');\n		$this->load->model(''marketing/account_combine'');\n		$customer = $this->model_sale_customer->getCustomerByEmail($this->request->post[''email'']);\n		if(!$customer || !sizeof($customer)) return true;\n		$existing_aff_id = $this->model_marketing_account_combine->getAffiliateIdByCustomerId($customer[''customer_id'']);\n		\n		if($existing_aff_id) {\n			$this->language->load(''marketing/account_combine'');\n			$this->error[''warning''] = sprintf($this->language->get(''error_customer_has_affiliate''), $customer[''email'']);\n		}		\n	}\n	//+mod by yp end\n	\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[function getForm() {]]></search>\n			<add position="after"><![CDATA[\n			\n		//+mod by yp start\n		$data[''link_customer''] = false;\n		if($this->config->get(''account_combine_status'')) {\n			$acc_fields = $this->config->get(''account_combine_fields'');\n			$rform = $this->config->get(''account_combine_rform'');\n			$cform = $this->config->get(''account_combine_rform'');\n			$data[''config_website_textarea''] = $rform[''website_textarea''] || $cform[''website_textarea''];\n			$data[''config_website_required''] = $acc_fields[''website''] == ''r'';\n			if (isset($this->error[''website''])) {\n				$data[''error_website''] = $this->error[''website''];\n			} else {\n				$data[''error_website''] = '''';\n			}\n			if(isset($this->request->get[''affiliate_id''])) {\n				$this->load->model(''marketing/account_combine'');\n				$customer_id = $this->model_marketing_account_combine->getCustomerIdByAffiliateId($this->request->get[''affiliate_id'']);\n				if($customer_id) {\n					$this->language->load(''marketing/account_combine'');\n					$data[''link_customer''] = ''<a href="'' . $this->url->link(''sale/customer/edit'', ''customer_id='' . $customer_id . ''&token='' . $this->session->data[''token''], ''SSL'') . ''" target="_blank">'' . $this->language->get(''text_customer'') . '' '' . $this->language->get(''text_account'') . ''</a>'';\n				}\n			}\n		} else {\n			$data[''config_website_textarea''] = false;\n			$data[''config_website_required''] = false;\n			$data[''error_website''] = '''';\n		}\n		//+mod by yp end\n		\n]]></add>\n		</operation>		\n	</file>\n<file path="admin/controller/sale/customer.php">\n		<operation>	\n			<search><![CDATA[_customer->editCustomer($this->request->get[''customer_id''], $this->request->post);]]></search>\n			<add position="after"><![CDATA[\n			\n			//+mod by yp start\n			if ($this->config->get(''account_combine_status'')) {\n				$this->load->model(''marketing/account_combine'');\n				$this->model_marketing_account_combine->syncAffiliateToCustomer($this->request->get[''customer_id''], (isset($this->request->post[''password'']) ? $this->request->post[''password''] : false));\n			}\n			//+mod by yp end\n			\n]]></add>\n		</operation>\n		<operation>	\n			<search><![CDATA[function getForm() {]]></search>\n			<add position="after"><![CDATA[	\n			\n		//+mod by yp start\n		$data[''link_affiliate''] = false;\n		if($this->config->get(''account_combine_status'')) {\n			if(!isset($this->request->get[''customer_id'']) && $this->request->server[''REQUEST_METHOD''] != ''POST'') {\n				$this->language->load(''marketing/account_combine'');\n				$this->error[''warning''] = sprintf($this->language->get(''text_insert_only_customer''), $this->url->link(''marketing/affiliate/insert'', ''token='' . $this->session->data[''token''], ''SSL''));\n			}\n			if(isset($this->request->get[''customer_id''])) {\n				$this->load->model(''marketing/account_combine'');\n				$affiliate_id = $this->model_marketing_account_combine->getAffiliateIdByCustomerId($this->request->get[''customer_id'']);\n				if($affiliate_id) {\n					$this->language->load(''marketing/account_combine'');\n					$data[''link_affiliate''] = ''<a href="'' . $this->url->link(''marketing/affiliate/edit'', ''affiliate_id='' . $affiliate_id . ''&token='' . $this->session->data[''token''], ''SSL'') . ''" target="_blank">'' . $this->language->get(''text_affiliate'') . '' '' . $this->language->get(''text_account'') . ''</a>'';\n				}\n			}			\n		}\n		//+mod by yp end		\n		\n]]></add>\n		</operation>			\n	</file>				\n<file path="admin/model/sale/customer.php">\n		<operation>\n			<search><![CDATA[function deleteCustomer($customer_id) {]]></search>\n			<add position="after"><![CDATA[	\n			\n		//+mod by yp start\n		if($this->config->get(''account_combine_status'')) {\n			$accc_res = $this->db->query("SELECT affiliate_id FROM " . DB_PREFIX . "accc_customer_affiliate WHERE customer_id = ''" . (int)$customer_id . "''");\n			if($accc_res->num_rows > 0) {\n				$this->load->model(''marketing/affiliate'');	$this->model_marketing_affiliate->deleteAffiliate($accc_res->row[''affiliate_id'']);\n			}\n		}\n		//+mod by yp end\n		\n]]></add>\n		</operation>\n	</file>\n<file path="admin/controller/customer/customer.php">\n		<operation>	\n			<search><![CDATA[_customer->editCustomer($this->request->get[''customer_id''], $this->request->post);]]></search>\n			<add position="after"><![CDATA[\n			\n			//+mod by yp start\n			if ($this->config->get(''account_combine_status'')) {\n				$this->load->model(''marketing/account_combine'');\n				$this->model_marketing_account_combine->syncAffiliateToCustomer($this->request->get[''customer_id''], (isset($this->request->post[''password'']) ? $this->request->post[''password''] : false));\n			}\n			//+mod by yp end\n			\n]]></add>\n		</operation>\n		<operation>	\n			<search><![CDATA[function getForm() {]]></search>\n			<add position="after"><![CDATA[	\n			\n		//+mod by yp start\n		$data[''link_affiliate''] = false;\n		if($this->config->get(''account_combine_status'')) {\n			if(!isset($this->request->get[''customer_id'']) && $this->request->server[''REQUEST_METHOD''] != ''POST'') {\n				$this->language->load(''marketing/account_combine'');\n				$this->error[''warning''] = sprintf($this->language->get(''text_insert_only_customer''), $this->url->link(''marketing/affiliate/insert'', ''token='' . $this->session->data[''token''], ''SSL''));\n			}\n			if(isset($this->request->get[''customer_id''])) {\n				$this->load->model(''marketing/account_combine'');\n				$affiliate_id = $this->model_marketing_account_combine->getAffiliateIdByCustomerId($this->request->get[''customer_id'']);\n				if($affiliate_id) {\n					$this->language->load(''marketing/account_combine'');\n					$data[''link_affiliate''] = ''<a href="'' . $this->url->link(''marketing/affiliate/edit'', ''affiliate_id='' . $affiliate_id . ''&token='' . $this->session->data[''token''], ''SSL'') . ''" target="_blank">'' . $this->language->get(''text_affiliate'') . '' '' . $this->language->get(''text_account'') . ''</a>'';\n				}\n			}			\n		}\n		//+mod by yp end		\n		\n]]></add>\n		</operation>			\n	</file>				\n<file path="admin/model/customer/customer.php">\n		<operation>\n			<search><![CDATA[function deleteCustomer($customer_id) {]]></search>\n			<add position="after"><![CDATA[	\n			\n		//+mod by yp start\n		if($this->config->get(''account_combine_status'')) {\n			$accc_res = $this->db->query("SELECT affiliate_id FROM " . DB_PREFIX . "accc_customer_affiliate WHERE customer_id = ''" . (int)$customer_id . "''");\n			if($accc_res->num_rows > 0) {\n				$this->load->model(''marketing/affiliate'');	$this->model_marketing_affiliate->deleteAffiliate($accc_res->row[''affiliate_id'']);\n			}\n		}\n		//+mod by yp end\n		\n]]></add>\n		</operation>\n	</file>	\n<file path="admin/view/template/marketing/affiliate_form.tpl">			\n		<operation>\n			<search><![CDATA[<?php echo $footer]]></search>\n			<add position="before"><![CDATA[\n			\n<?php //+mod by yp start \n	if ($link_customer) { ?>\n<script type="text/javascript"><!--\n	$(document).ready(function() {	\n		$(''.panel-body'').prepend(''<div><?php echo $link_customer; ?></div>'');\n	});\n//--></script> \n<?php }		\n	if($config_website_textarea) {?>\n<script type="text/javascript"><!--\n	$(document).ready(function() {\n        $(''input[name="website"]'').after(''<textarea name="website" id="input-website" class="form-control"><?php echo $website; ?></textarea>'');\n		$(''input[name="website"]'').remove();\n	});\n//--></script> \n<?php }	\n	if($config_website_required) {?>\n<script type="text/javascript"><!--	\n$(document).ready(function() {\n	$(''[name="website"]'').parent().parent().addClass(''required'')\n});\n//--></script> 	\n<?php }\n	if($error_website) {?>\n<script type="text/javascript"><!--\n	$(document).ready(function() {\n		$(''[name="website"]'').after(''<div class="text-danger"><?php echo $error_website; ?></div>'');\n	});\n//--></script> \n<?php }\n	//+mod by yp end \n	?>\n\n]]></add>\n		</operation>\n</file>\n<file path="admin/view/template/marketing/affiliate_list.tpl">\n		<operation>\n			<search><![CDATA[? $(''#form-affiliate'').submit() :]]></search>\n			<add position="replace"><![CDATA[? $(''#form-affiliate'').attr(''action'', ''<?php echo html_entity_decode($this->registry->get(''url'')->link(''marketing/affiliate/delete'', ''token='' . $token, ''SSL''), ENT_QUOTES, ''UTF-8''); ?>'').submit() :]]></add>\n		</operation>\n</file>			\n<file path="admin/view/template/sale/customer_form.tpl">\n		<operation>\n			<search><![CDATA[<?php echo $footer]]></search>\n			<add position="before"><![CDATA[\n			\n<?php //+mod by yp start \n	if ($link_affiliate) { ?>\n<script type="text/javascript"><!--\n	$(document).ready(function() {	\n		$(''.panel-body'').prepend(''<div><?php echo $link_affiliate; ?></div>'');\n	});\n//--></script> \n<?php } //+mod by yp end\n?>\n\n]]></add>\n		</operation>\n</file>		\n<file path="admin/view/template/customer/customer_form.tpl">\n		<operation>\n			<search><![CDATA[<?php echo $footer]]></search>\n			<add position="before"><![CDATA[\n			\n<?php //+mod by yp start \n	if ($link_affiliate) { ?>\n<script type="text/javascript"><!--\n	$(document).ready(function() {	\n		$(''.panel-body'').prepend(''<div><?php echo $link_affiliate; ?></div>'');\n	});\n//--></script> \n<?php } //+mod by yp end\n?>\n\n]]></add>\n		</operation>\n</file>		\n<file path="catalog/controller/account/account.php">\n		<operation>\n			<search><![CDATA[if (file_exists(DIR_TEMPLATE]]></search>\n			<add position="before"><![CDATA[\n			\n		//+mod by yp start\n		if ($this->config->get(''account_combine_status'') && $this->config->get(''account_combine_aff_links_in_account'')) {\n			$this->language->load(''affiliate/account_combine'');	\n			$data[''text_affiliate_account''] = $this->language->get(''text_affiliate_account'');			\n			if($this->affiliate->isLogged()) {\n				$data[''text_link_to_affiliate''] = $this->language->get(''text_affiliate_account'');\n				$data[''affiliate_logged''] = true;\n				\n				$data[''link_to_affiliate''] = $this->url->link(''affiliate/account'', '''', ''SSL'');\n				$data[''affiliate_info''] = $this->url->link(''affiliate/info'', '''', ''SSL'');\n				$data[''affiliate_transaction''] = $this->url->link(''affiliate/transaction'', '''', ''SSL'');\n				$data[''affiliate_tracking''] = $this->url->link(''affiliate/tracking'', '''', ''SSL'');\n\n				$data[''text_affiliate_info''] = $this->language->get(''text_affiliate_info'');\n				$data[''text_affiliate_tracking''] = $this->language->get(''text_affiliate_tracking'');\n				$data[''text_affiliate_transaction''] = $this->language->get(''text_affiliate_transaction'');\n			} else {				\n				$data[''affiliate_logged''] = false;\n				$this->load->model(''affiliate/account_combine'');\n				$_aff_status = $this->model_affiliate_account_combine->getAccountStatus($this->customer->getId());\n				if($_aff_status === true) {\n					$data[''text_link_to_affiliate''] = $this->language->get(''text_link_to_affiliate_in_customer'');\n				} else {\n					$_map = array(\n						''no_account'' => ''text_link_to_create_affiliate_in_customer'',\n						''not_approved'' => ''text_link_to_affiliate_not_approved_in_customer'',\n						''disabled'' => ''text_link_to_affiliate_disabled_in_customer''\n					);\n					$data[''text_link_to_affiliate''] = isset($_map[$_aff_status]) ? $this->language->get($_map[$_aff_status]) : '''';\n				}\n				$data[''link_to_affiliate''] = $this->url->link(''affiliate/account_combine'', '''', ''SSL'');\n			}		\n		} else {\n			$data[''text_link_to_affiliate''] = false;\n		}\n		//+mod by yp end			\n		\n]]></add>\n		</operation>\n</file>			\n<file path="catalog/controller/account/address.php">\n		<operation>\n			<search><![CDATA[if (file_exists(DIR_TEMPLATE . $this->config->get(''config_template'') . ''/template/account/address_form.tpl''))]]></search>\n			<add position="before"><![CDATA[\n			\n		//+mod by yp start\n		if($this->config->get(''account_combine_status'')) {\n			$this->language->load(''affiliate/account_combine'');\n			$data[''entry_affiliate_address''] = $this->language->get(''entry_affiliate_address'');\n		} else {\n			$data[''entry_affiliate_address''] = false;\n		}\n		//+mod by yp end			\n		\n]]></add>\n		</operation>\n</file>				\n<file path="catalog/controller/account/forgotten.php">\n		<operation>\n			<search><![CDATA[model_account_customer->editPassword($this->request->post[''email''], $password);]]></search>\n			<add position="after"><![CDATA[\n			\n//+mod by yp start\nif($this->config->get(''account_combine_status'')) {	\n	$_carr = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer WHERE LOWER(email) = ''" . $this->db->escape(utf8_strtolower($this->request->post[''email''])) . "''");\n	$customer = $_carr->num_rows > 0 ? $_carr->row : false;\n	if($customer) {		\n		$this->load->model(''affiliate/account_combine'');\n		$affiliate = $this->model_affiliate_account_combine->getAffiliateByCustomerId($customer[''customer_id'']);\n		if($affiliate) {\n			$this->load->model(''affiliate/affiliate'');\n			$this->model_affiliate_affiliate->editPassword($affiliate[''email''], $password);	\n		}\n	}\n}\n//+mod by yp end  \n\n]]></add>\n		</operation>\n	</file>\n<file path="catalog/controller/account/login.php">\n		<operation>\n			<search><![CDATA[$this->customer->logout();]]></search>\n			<add position="after"><![CDATA[\n			\nif($this->config->get(''account_combine_status'') && $this->affiliate->isLogged()) $this->affiliate->logout();//+mod by yp\n\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[$customer_info && $this->customer->login($customer_info[''email''], '''', true)) {]]></search>\n			<add position="after"><![CDATA[\n			\nif($this->config->get(''account_combine_status'')) $this->affiliate->login('''', '''', $this->customer->getId());//+mod by yp		\n	\n]]></add>\n		</operation>	\n		<operation>\n			<search><![CDATA[$this->model_account_customer->deleteLoginAttempts]]></search>\n			<add position="before"><![CDATA[\n			\n			//+mod by yp start\n			if($this->config->get(''account_combine_status'')) $this->affiliate->login('''', '''', $this->customer->getId());\n			if(isset($this->session->data[''accc_show_aff_section''])) unset($this->session->data[''accc_show_aff_section'']);\n			//+mod by yp end\n			\n]]></add>\n		</operation>		\n	</file>\n<file path="catalog/controller/account/logout.php">	\n		<operation>\n			<search><![CDATA[$this->customer->logout();]]></search>\n			<add position="after"><![CDATA[\n			\nif($this->config->get(''account_combine_status'') && $this->affiliate->isLogged()) $this->affiliate->logout();//+mod by yp	\n\n]]></add>\n		</operation>\n	</file>\n<file path="catalog/controller/account/password.php">	\n		<operation>\n			<search><![CDATA[model_account_customer->editPassword($this->customer->getEmail(), $this->request->post[''password'']);]]></search>\n			<add position="after"><![CDATA[\n			\n//+mod by yp start\nif($this->config->get(''account_combine_status'') && $this->affiliate->isLogged()) {	\n	$this->load->model(''affiliate/affiliate'');\n	$this->model_affiliate_affiliate->editPassword($this->affiliate->getEmail(), $this->request->post[''password'']);	\n}\n//+mod by yp end  \n	\n]]></add>\n		</operation>\n	</file>\n<file path="catalog/controller/account/register.php">\n		<operation>\n			<search><![CDATA[$this->document->setTitle($this->language->get(''heading_title''));]]></search>\n			<add position="before"><![CDATA[\n			\n		if ($this->config->get(''account_combine_status'')) $this->language->load(''affiliate/account_combine_info'');//+mod by yp\n		\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[$this->response->redirect($this->url->link(''account/success'')]]></search>\n			<add position="before"><![CDATA[\n			\n			if($this->config->get(''account_combine_status'') && $this->affiliate->login('''', '''', $this->customer->getId())) $this->response->redirect($this->config->get(''config_affiliate_approval'') ? $this->url->link(''affiliate/account'', '''', ''SSL'') : $this->url->link(''affiliate/account_combine'', '''', ''SSL'')); //+mod by yp\n			\n]]></add>\n		</operation>		\n		<operation>\n			<search><![CDATA[if (isset($this->request->post[''agree''])) {]]></search>\n			<add position="before"><![CDATA[\n			\n		//+mod by yp start\n		$data[''show_affiliate_section''] = 0;\n		$accc_status = $this->config->get(''account_combine_status'');\n		if($accc_status) {\n			$rform = $this->config->get(''account_combine_rform'');\n			if($rform[''affiliate''] == ''n'') $accc_status = false;\n		}\n		if($accc_status) {\n			if(!isset($data[''aff_fields''])) $data[''aff_fields''] = $this->config->get(''account_combine__fields'');		\n			$data[''payment_methods''] = $this->config->get(''account_combine__payment_methods'');\n			$fields = $this->config->get(''account_combine_fields'');\n			$data[''show_affiliate_section''] = 1;\n			$data[''website_textarea''] = $rform[''website_textarea''];\n			\n			$data[''affiliate_choice''] = $rform[''affiliate''] == ''c'';\n			if ($data[''affiliate_choice'']) {\n				if (isset($this->request->post[''accc_create_affiliate_account''])) {\n					$data[''accc_create_affiliate_account''] = $this->request->post[''accc_create_affiliate_account''];				\n				} else {\n					if(isset($this->session->data[''accc_show_aff_section''])) {\n						$data[''accc_create_affiliate_account''] = 1;\n						unset($this->session->data[''accc_show_aff_section'']);\n					} else {\n						$data[''accc_create_affiliate_account''] = isset($this->session->data[''redirect'']) && $this->session->data[''redirect''] == $this->url->link(''affiliate/account'', '''', ''SSL'') ? 1 : 0;\n					}\n				}\n			}\n			\n			if ($rform[''agreement'']) {			\n				$this->load->model(''affiliate/account_combine'');\n				$aff_information_info = $this->model_affiliate_account_combine->getAgreement();\n				if ($aff_information_info) {\n					$data[''text_affiliate_agree''] = sprintf($this->language->get(''text_agree''), $this->url->link(''information/information/agree'', ''information_id='' . $this->config->get(''config_affiliate_id''), ''SSL''), $aff_information_info[''title''], $aff_information_info[''title'']);\n					$data[''error_affiliate_agree''] = str_replace(array("\\r\\n", "\\r", "\\n"), array(''\\\\n'', ''\\\\n'', ''\\\\n''), addslashes(html_entity_decode(sprintf($this->language->get(''error_agree''), $aff_information_info[''title'']), ENT_QUOTES, ''UTF-8'')));\n					if (isset($this->request->post[''affiliate_agree''])) {\n						$data[''affiliate_agree''] = $this->request->post[''affiliate_agree''];\n					} else {\n						$data[''affiliate_agree''] = false;\n					}						\n				} else {\n					$data[''text_affiliate_agree''] = '''';\n					$data[''error_affiliate_agree''] = false;\n				}			\n			} else {\n				$data[''error_affiliate_agree''] = false;\n				$data[''text_affiliate_agree''] = '''';\n			}			\n			\n			$data[''text_affiliate_information''] = $this->language->get(''text_info'');\n			$data[''text_affiliate_checkbox_confirm''] = $this->language->get(''text_affiliate_checkbox_confirm'');\n			\n			foreach($data[''aff_fields''] as $field) {\n				$data[$field] = ($field == ''payment'' ? $fields[''payment_default''] : '''');\n				if($fields[$field] == ''n'' || !$rform[''show_'' . $field]) {\n					$data[''entry_'' . $field] = '''';\n					$data[''use_'' . $field] = false;				\n					$data[$field . ''_required''] = false;\n					$data[''error_'' . $field] = '''';				\n				} else {\n					$data[''entry_'' . $field] = $this->language->get(''entry_'' . $field);\n					$data[''use_'' . $field] = true;\n					if (isset($this->request->post[$field])) $data[$field] = $this->request->post[$field];\n					$data[$field . ''_required''] = ($fields[$field] == ''r'');\n					$data[''error_'' . $field] = (isset($this->error[$field]) ? $this->error[$field] : '''');\n				}		\n			}\n\n			foreach($data[''payment_methods''] as $method) {\n				if($fields[''payment''] == ''n'' || !$rform[''show_payment'']) $fields[''use_'' . $method] = false;\n				if($fields[''use_'' . $method]) {\n					$data[''use_'' . $method] = true;\n					$data[''text_'' . $method] = $this->language->get(''text_'' . $method);\n					if(isset($fields[$method]) && !$fields[$method]) continue;\n					if(!isset($fields[$method]) || !is_array($fields[$method])) $fields[$method] = array(''_'' => 1);\n					foreach($fields[$method] as $mfield => $_use) {					\n						$mfield = $method . ($mfield == ''_'' ? '''' : ''_'' . $mfield);\n						if(!$_use) {\n							$data[''use_'' . $mfield] = false;\n							continue;\n						}\n						$data[''use_'' . $mfield] = true;\n						$data[$mfield . ''_required''] = $data[''payment_required''];\n						$data[''entry_'' . $mfield] = $this->language->get(''entry_'' . $mfield);\n						if (isset($this->request->post[$mfield])) {\n							$data[$mfield] = $this->request->post[$mfield];\n						} else {\n							$data[$mfield] = '''';		\n						}						\n						$data[''error_'' . $mfield] = (isset($this->error[$mfield]) ? $this->error[$mfield] : '''');					\n					}\n				} else {\n					$data[''use_'' . $method] = false;				\n				}		\n			}		\n		}\n		//+mod by yp end	\n		\n]]></add>\n		</operation>	\n		<operation>\n			<search><![CDATA[function validate() {]]></search>\n			<add position="after"><![CDATA[\n			\n		//+mod by yp start\n		$do_aff = false;\n		if($this->config->get(''account_combine_status'')) {\n			$rform = $this->config->get(''account_combine_rform'');\n			if($rform[''affiliate''] == ''y'' || ($rform[''affiliate''] == ''c'' && isset($this->request->post[''accc_create_affiliate_account'']) && $this->request->post[''accc_create_affiliate_account''])) $do_aff = true;			\n		}\n		if($do_aff === true) {			\n			if($rform[''agreement'']) {\n				$this->load->model(''affiliate/account_combine'');\n				$affagr = $this->model_affiliate_account_combine->getAgreement();\n				if ($affagr && (!isset($this->request->post[''affiliate_agree'']) || !$this->request->post[''affiliate_agree''])) {\n					$this->error[''warning''] = sprintf($this->language->get(''error_agree''), $affagr[''title'']);\n				}				\n			}\n			$fields = $this->config->get(''account_combine_fields'');\n			if(!isset($data[''aff_fields''])) $data[''aff_fields''] = $this->config->get(''account_combine__fields'');\n			foreach($data[''aff_fields''] as $field) {\n				if($fields[$field] == ''n'' || !$rform[''show_'' . $field]) continue;\n				if(isset($this->request->post[$field])) $this->request->post[$field] = trim($this->request->post[$field]);\n				if($fields[$field] == ''r'' && (!isset($this->request->post[$field]) || utf8_strlen($this->request->post[$field]) < 1)) $this->error[$field] = $this->language->get(''error_'' . $field);\n			}			\n			if($rform[''show_payment''] && $fields[''payment''] == ''r'') {\n				$method = $this->request->post[''payment''];\n				if(!isset($fields[''use_'' . $method]) || !$fields[''use_'' . $method]) {\n					$this->error[''payment''] = $this->language->get(''error_payment'');\n				} else {				\n					if(!isset($fields[$method]) || ($fields[$method] && !is_array($fields[$method]))) $fields[$method] = array(''_'' => 1);\n					foreach($fields[$method] as $mfield => $_use) {					\n						$mfield = $method . ($mfield == ''_'' ? '''' : ''_'' . $mfield);\n						if(!$_use) continue;\n						if(isset($this->request->post[$mfield])) $this->request->post[$mfield] = trim($this->request->post[$mfield]);\n						if(!isset($this->request->post[$mfield]) || utf8_strlen($this->request->post[$mfield]) < 1) $this->error[$mfield] = $this->language->get(''error_'' . $mfield);			\n					}\n				}		\n			}		\n		}\n		//+mod by yp end\n		\n]]></add>\n		</operation>	\n</file>	\n<file path="catalog/controller/affiliate/account.php">\n		<operation>\n			<search><![CDATA[!$this->affiliate->isLogged()) {]]></search>\n			<add position="after"><![CDATA[\n			\n			//+mod by yp start\n			if ($this->config->get(''account_combine_status'') && $this->customer->isLogged()) {			\n				$this->response->redirect($this->url->link(''affiliate/account_combine'', '''', ''SSL''));\n			}		\n			//+mod by yp end\n			\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[$data[''breadcrumbs''] = array();]]></search>\n			<add position="before"><![CDATA[	\n			\n		//+mod by yp start\n		if($this->config->get(''account_combine_status'')) {\n			$this->load->model(''affiliate/account_combine'');\n			if(isset($this->session->data[''accc_force_required'']) || $this->model_affiliate_account_combine->forceRequired()) {\n				$this->session->data[''accc_force_required''] = 1;\n				$this->response->redirect($this->url->link(''affiliate/info'', '''', ''SSL''));\n			}		\n		}\n		//+mod by yp end			\n		\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[if (file_exists(DIR_TEMPLATE]]></search>\n			<add position="before"><![CDATA[	\n			\n		//+mod by yp start \n		if ($this->config->get(''account_combine_status'')) {\n			$data[''accc''] = true;\n			$this->language->load(''affiliate/account_combine'');\n			$data[''text_affiliate_info''] = $this->language->get(''text_affiliate_info'');\n			$data[''affiliate_info''] = $this->url->link(''affiliate/info'', '''', ''SSL'');\n			$data[''text_customer_account''] = $this->language->get(''text_customer'') . '' '' . $this->language->get(''text_account'');\n			$data[''customer_account''] = $this->url->link(''account/account'', '''', ''SSL'');\n		} else {\n			$data[''accc''] = false;\n		}\n		//+mod by yp end			\n		\n]]></add>\n		</operation>			\n	</file>	\n<file path="catalog/controller/affiliate/edit.php">\n		<operation>\n			<search><![CDATA[function index() {]]></search>\n			<add position="after"><![CDATA[\n\n			if($this->config->get(''account_combine_status'')) $this->response->redirect($this->url->link(''account/edit'', '''', ''SSL''));//+mod by yp\n			\n		]]></add>\n		</operation>\n	</file>	\n<file path="catalog/controller/affiliate/forgotten.php">\n		<operation>\n			<search><![CDATA[$this->load->language(''affiliate/forgotten'');]]></search>\n			<add position="before"><![CDATA[\n			\nif ($this->config->get(''account_combine_status'')) $this->response->redirect($this->url->link(''account/forgotten'', '''', ''SSL''));//+mod by yp\n\n]]></add>\n		</operation>\n	</file>\n<file path="catalog/controller/affiliate/login.php">\n		<operation>\n			<search><![CDATA[$this->load->language(''affiliate/login'');]]></search>\n			<add position="before"><![CDATA[\n			\n		//+mod by yp start\n		if ($this->config->get(''account_combine_status'')) {\n			if($this->customer->isLogged()) {\n				$this->response->redirect($this->url->link(''affiliate/account_combine'', '''', ''SSL''));\n			}		\n			$this->session->data[''redirect''] = $this->url->link(''affiliate/account'', '''', ''SSL'');\n			$this->session->data[''accc_show_aff_section''] = true;\n			$this->response->redirect($this->url->link(''account/login'', '''', ''SSL''));\n		}\n		//+mod by yp end\n		\n]]></add>\n		</operation>\n	</file>\n<file path="catalog/controller/affiliate/logout.php">\n		<operation>\n			<search><![CDATA[function index() {]]></search>\n			<add position="after"><![CDATA[\n			\nif ($this->config->get(''account_combine_status'')) $this->response->redirect($this->url->link(''account/logout'', '''', ''SSL''));//+mod by yp\n\n]]></add>\n		</operation>\n	</file>\n<file path="catalog/controller/affiliate/password.php">\n		<operation>\n			<search><![CDATA[$this->load->language(''affiliate/password'');]]></search>\n			<add position="before"><![CDATA[\n			\nif ($this->config->get(''account_combine_status'')) $this->response->redirect($this->url->link(''account/password'', '''', ''SSL''));//+mod by yp\n\n]]></add>\n		</operation>\n	</file>\n<file path="catalog/controller/affiliate/payment.php">\n		<operation>\n			<search><![CDATA[function index() {]]></search>\n			<add position="after"><![CDATA[\n\n			if($this->config->get(''account_combine_status'')) $this->response->redirect($this->url->link(''affiliate/info'', '''', ''SSL''));//+mod by yp\n			\n		]]></add>\n		</operation>\n	</file>		\n<file path="catalog/controller/affiliate/register.php">\n		<operation>\n			<search><![CDATA[$this->load->language(''affiliate/register'');]]></search>\n			<add position="before"><![CDATA[\n			\n		//+mod by yp start\n		if ($this->config->get(''account_combine_status'')) {\n			if($this->customer->isLogged()) {\n				$this->response->redirect($this->url->link(''affiliate/account_combine'', '''', ''SSL''));\n			}\n			$this->session->data[''redirect''] = $this->url->link(''affiliate/account'', '''', ''SSL'');\n			$this->session->data[''accc_show_aff_section''] = true;\n			$this->response->redirect($this->url->link(''account/register'', '''', ''SSL''));\n		}\n		//+mod by yp end\n		\n]]></add>\n		</operation>\n	</file>\n<file path="catalog/controller/affiliate/tracking.php">\n		<operation>\n			<search><![CDATA[$this->load->language(''affiliate/tracking'');]]></search>\n			<add position="before"><![CDATA[	\n		\n		//+mod by yp start\n		if($this->config->get(''account_combine_status'')) {\n			$this->load->model(''affiliate/account_combine'');\n			if(isset($this->session->data[''accc_force_required'']) || $this->model_affiliate_account_combine->forceRequired()) {\n				$this->session->data[''accc_force_required''] = 1;\n				$this->response->redirect($this->url->link(''affiliate/info'', '''', ''SSL''));\n			}		\n		}\n		//+mod by yp end			\n		\n]]></add>\n		</operation>\n	</file>			\n<file path="catalog/controller/affiliate/transaction.php">\n		<operation>\n			<search><![CDATA[$this->load->language(''affiliate/transaction'');]]></search>\n			<add position="before"><![CDATA[	\n			\n		//+mod by yp start\n		if($this->config->get(''account_combine_status'')) {\n			$this->load->model(''affiliate/account_combine'');\n			if(isset($this->session->data[''accc_force_required'']) || $this->model_affiliate_account_combine->forceRequired()) {\n				$this->session->data[''accc_force_required''] = 1;\n				$this->response->redirect($this->url->link(''affiliate/info'', '''', ''SSL''));\n			}		\n		}\n		//+mod by yp end\n		\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[$data[''continue'']]></search>\n			<add position="before"><![CDATA[\n			\n		//+mod by yp start\n		$data[''accc_allow_funds_transfer''] = false;\n		if($this->config->get(''account_combine_status'') && $this->config->get(''account_combine_allow_funds_transfer'')) {			\n			$_balance = $this->model_affiliate_transaction->getBalance();\n			if($_balance > 0) {\n				$this->language->load(''affiliate/account_combine'');\n				$data[''text_loading''] = $this->language->get(''text_loading'');\n				$data[''accc_allow_funds_transfer''] = true;\n				$data[''balance_raw''] = $this->currency->convert($_balance, $this->config->get(''config_currency''),  $this->currency->getCode());			\n				$data[''action_funds_transfer''] = $this->url->link(''affiliate/account_combine/transaction'', '''', ''SSL'');\n				$data[''entry_funds_transfer_input''] = sprintf($this->language->get(''entry_funds_transfer_input''), $data[''balance'']);\n				$data[''symbol_left''] = $this->currency->getSymbolLeft();\n				$data[''symbol_right''] = $this->currency->getSymbolRight();\n				$data[''button_funds_transfer''] = $this->language->get(''button_funds_transfer'');\n				$data[''error_invalid_transfer_amount''] = $this->language->get(''error_invalid_transfer_amount'');				\n				$data[''error_invalid_transfer_amount_js''] = addcslashes(str_replace(array("\\r\\n", "\\n", "\\r"), array('' '', '' '', '' ''), strip_tags(html_entity_decode($data[''error_invalid_transfer_amount''], ENT_COMPAT))), "''");\n				$data[''credit_amount_message''] = addcslashes(str_replace(array("\\r\\n", "\\n", "\\r"), array('' '', '' '', '' ''), $this->language->get(''text_credit_amount_message'')), "''");\n				$data[''transfer_multiplier''] = $this->config->get(''account_combine_transfer_multiplier'') ? $this->config->get(''account_combine_transfer_multiplier'') : 1;\n				$data[''use_multiplier''] = (float) $data[''transfer_multiplier''] === 1.0 ? false : true;\n				\n			}		\n		}\n		//+mod by yp end\n		\n]]></add>\n		</operation>\n	</file>	\n<file path="catalog/controller/checkout/login.php">\n		<operation>\n			<search><![CDATA[unset($this->session->data[''guest'']]></search>\n			<add position="before"><![CDATA[\n			\nif($this->config->get(''account_combine_status'')) $this->affiliate->login('''', '''', $this->customer->getId());//+mod by yp\n\n]]></add>\n		</operation>\n	</file>	\n<file path="catalog/controller/checkout/register.php">\n		<operation>\n			<search><![CDATA[public function index(]]></search>\n			<add position="before"><![CDATA[\n			\n	//+mod by yp start\n	private function _jsstr($str) {\n		return str_replace(array("\\r\\n", "\\r", "\\n"), array(''\\\\n'', ''\\\\n'', ''\\\\n''), addslashes(html_entity_decode($str, ENT_QUOTES, ''UTF-8'')));\n	}\n	//+mod by yp end\n	\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[function index() {]]></search>\n			<add position="after"><![CDATA[\n			\n		if ($this->config->get(''account_combine_status'')) $this->language->load(''affiliate/account_combine_info'');//+mod by yp\n		\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[customer->login($this->request->post[''email''], $this->request->post[''password'']);]]></search>\n			<add position="after"><![CDATA[\n			\nif($this->config->get(''account_combine_status'')) $this->affiliate->login('''', '''', $this->customer->isLogged());//+mod by yp\n\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[$data[''shipping_required''] = $this->cart->hasShipping();]]></search>\n			<add position="after"><![CDATA[\n			\n		//+mod by yp start\n		$data[''show_affiliate_section''] = 0;\n		$accc_status = $this->config->get(''account_combine_status'');\n		if($accc_status) {\n			$cform = $this->config->get(''account_combine_cform'');\n			if($cform[''affiliate''] == ''n'') $accc_status = false;\n		}\n		if($accc_status) {\n			if(!isset($data[''aff_fields''])) $data[''aff_fields''] = $this->config->get(''account_combine__fields'');		\n			$data[''payment_methods''] = $this->config->get(''account_combine__payment_methods'');\n			$fields = $this->config->get(''account_combine_fields'');\n			$data[''show_affiliate_section''] = 1;\n			$data[''website_textarea''] = $cform[''website_textarea''];\n			\n			$data[''affiliate_choice''] = $cform[''affiliate''] == ''c'';\n			if ($data[''affiliate_choice'']) {\n				if (isset($this->request->post[''accc_create_affiliate_account''])) {\n					$data[''accc_create_affiliate_account''] = $this->request->post[''accc_create_affiliate_account''];				\n				} else {\n					if(isset($this->session->data[''accc_show_aff_section''])) {\n						$data[''accc_create_affiliate_account''] = 1;\n						unset($this->session->data[''accc_show_aff_section'']);\n					} else {\n						$data[''accc_create_affiliate_account''] = isset($this->session->data[''redirect'']) && $this->session->data[''redirect''] == $this->url->link(''affiliate/account'', '''', ''SSL'') ? 1 : 0;\n					}\n				}\n			}\n			\n			if ($cform[''agreement'']) {			\n				$this->load->model(''affiliate/account_combine'');\n				$aff_information_info = $this->model_affiliate_account_combine->getAgreement();\n				if ($aff_information_info) {\n					$data[''text_affiliate_agree''] = sprintf($this->language->get(''text_agree''), $this->url->link(''information/information/agree'', ''information_id='' . $this->config->get(''config_affiliate_id''), ''SSL''), $aff_information_info[''title''], $aff_information_info[''title'']);\n					$data[''error_affiliate_agree''] = str_replace(array("\\r\\n", "\\r", "\\n"), array(''\\\\n'', ''\\\\n'', ''\\\\n''), addslashes(html_entity_decode(sprintf($this->language->get(''error_agree''), $aff_information_info[''title'']), ENT_QUOTES, ''UTF-8'')));\n					if (isset($this->request->post[''affiliate_agree''])) {\n						$data[''affiliate_agree''] = $this->request->post[''affiliate_agree''];\n					} else {\n						$data[''affiliate_agree''] = false;\n					}					\n				} else {\n					$data[''text_affiliate_agree''] = '''';\n					$data[''error_affiliate_agree''] = false;\n				}			\n			} else {\n				$data[''error_affiliate_agree''] = false;\n				$data[''text_affiliate_agree''] = '''';\n			}			\n			\n			$data[''text_affiliate_information''] = $this->language->get(''text_info'');\n			$data[''text_affiliate_checkbox_confirm''] = $this->language->get(''text_affiliate_checkbox_confirm'');\n			\n			foreach($data[''aff_fields''] as $field) {\n				$data[$field] = ($field == ''payment'' ? $fields[''payment_default''] : '''');\n				if($fields[$field] == ''n'' || !$cform[''show_'' . $field]) {\n					$data[''entry_'' . $field] = '''';\n					$data[''use_'' . $field] = false;				\n					$data[$field . ''_required''] = false;\n					$data[''error_'' . $field] = '''';				\n				} else {\n					$data[''entry_'' . $field] = $this->language->get(''entry_'' . $field);\n					$data[''use_'' . $field] = true;\n					if (isset($this->request->post[$field])) $data[$field] = $this->request->post[$field];\n					$data[$field . ''_required''] = ($fields[$field] == ''r'');\n					$data[''error_'' . $field] = (isset($this->error[$field]) ? $this->error[$field] : '''');\n				}		\n			}\n\n			foreach($data[''payment_methods''] as $method) {\n				if($fields[''payment''] == ''n'' || !$cform[''show_payment'']) $fields[''use_'' . $method] = false;\n				if($fields[''use_'' . $method]) {\n					$data[''use_'' . $method] = true;\n					$data[''text_'' . $method] = $this->language->get(''text_'' . $method);\n					if(isset($fields[$method]) && !$fields[$method]) continue;\n					if(!isset($fields[$method]) || !is_array($fields[$method])) $fields[$method] = array(''_'' => 1);\n					foreach($fields[$method] as $mfield => $_use) {					\n						$mfield = $method . ($mfield == ''_'' ? '''' : ''_'' . $mfield);\n						if(!$_use) {\n							$data[''use_'' . $mfield] = false;\n							continue;\n						}\n						$data[''use_'' . $mfield] = true;\n						$data[$mfield . ''_required''] = $data[''payment_required''];\n						$data[''entry_'' . $mfield] = $this->language->get(''entry_'' . $mfield);\n						if (isset($this->request->post[$mfield])) {\n							$data[$mfield] = $this->request->post[$mfield];\n						} else {\n							$data[$mfield] = '''';		\n						}						\n						$data[''error_'' . $mfield] = (isset($this->error[$mfield]) ? $this->error[$mfield] : '''');					\n					}\n				} else {\n					$data[''use_'' . $method] = false;				\n				}		\n			}		\n		}\n		//+mod by yp end\n		\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[$this->load->model(''account/customer'');]]></search>\n			<add position="before"><![CDATA[\n		//+mod by yp start\n		$do_aff = false;\n		if($this->config->get(''account_combine_status'')) {\n			$cform = $this->config->get(''account_combine_cform'');\n			if($cform[''affiliate''] == ''y'' || ($cform[''affiliate''] == ''c'' && isset($this->request->post[''accc_create_affiliate_account'']) && $this->request->post[''accc_create_affiliate_account''])) $do_aff = true;			\n		}\n		if($do_aff === true) {						\n			$this->language->load(''affiliate/account_combine_info'');\n			if($cform[''agreement'']) {\n				$this->load->model(''affiliate/account_combine'');		\n				$affagr = $this->model_affiliate_account_combine->getAgreement();\n				if ($affagr && (!isset($this->request->post[''affiliate_agree'']) || !$this->request->post[''affiliate_agree''])) {\n					$json[''error''][''warning''] = sprintf($this->language->get(''error_agree''), $affagr[''title'']);\n				}				\n			}\n			$fields = $this->config->get(''account_combine_fields'');\n			if(!isset($data[''aff_fields''])) $data[''aff_fields''] = $this->config->get(''account_combine__fields'');\n			foreach($data[''aff_fields''] as $field) {\n				if($fields[$field] == ''n'' || !$cform[''show_'' . $field]) continue;\n				if(isset($this->request->post[$field])) $this->request->post[$field] = trim($this->request->post[$field]);\n				if($fields[$field] == ''r'' && (!isset($this->request->post[$field]) || utf8_strlen($this->request->post[$field]) < 1)) $json[''error''][$field] = $this->language->get(''error_'' . $field);\n			}			\n			if($cform[''show_payment''] && $fields[''payment''] == ''r'') {\n				$method = $this->request->post[''payment''];\n				if(!isset($fields[''use_'' . $method]) || !$fields[''use_'' . $method]) {\n					$json[''error''][''payment''] = $this->language->get(''error_payment'');\n				} else {				\n					if(!isset($fields[$method]) || ($fields[$method] && !is_array($fields[$method]))) $fields[$method] = array(''_'' => 1);\n					foreach($fields[$method] as $mfield => $_use) {					\n						$mfield = $method . ($mfield == ''_'' ? '''' : ''_'' . $mfield);\n						if(!$_use) continue;\n						if(isset($this->request->post[$mfield])) $this->request->post[$mfield] = trim($this->request->post[$mfield]);\n						if(!isset($this->request->post[$mfield]) || utf8_strlen($this->request->post[$mfield]) < 1) $json[''error''][$mfield] = $this->language->get(''error_'' . $mfield);\n					}\n				}		\n			}		\n		}\n		//+mod by yp end\n		\n]]></add>\n		</operation>		\n		<operation>\n			<search><![CDATA[$json[''error''][''warning''] = sprintf($this->language->get(''error_agree''), $information_info[''title'']);]]></search>\n			<add position="replace"><![CDATA[$json[''error''][''warning''] = (isset($json[''error''][''warning'']) && utf8_strlen($json[''error''][''warning'']) > 0 ? $json[''error''][''warning''] . ''<br />'' : '''') . sprintf($this->language->get(''error_agree''), $information_info[''title'']);]]></add>\n		</operation>					\n	</file>	\n<file path="catalog/controller/module/account.php">\n		<operation>\n			<search><![CDATA[function index() {]]></search>\n			<add position="after"><![CDATA[\n\nif($this->config->get(''account_combine_status'')) return $this->load->controller(''module/account_combine'');//+mod by yp\n\n]]></add>\n		</operation>\n	</file>		\n<file path="catalog/controller/module/affiliate.php">\n		<operation>\n			<search><![CDATA[function index() {]]></search>\n			<add position="after"><![CDATA[\n\nif($this->config->get(''account_combine_status'')) return $this->load->controller(''module/account_combine'');//+mod by yp\n\n]]></add>\n		</operation>\n	</file>		\n\n<file path="catalog/model/affiliate/affiliate.php">\n		<operation>\n			<search><![CDATA[function getAffiliateByCode($code) {]]></search>\n			<add position="after"><![CDATA[\n			\n		//+mod by yp start\n		if($this->config->get(''account_combine_status'') && !$this->config->get(''account_combine_allow_own_aff'')) { \n			$customer_id = $this->customer->getId();\n			if($customer_id) {\n				$res = $this->db->query("SELECT " .  DB_PREFIX . "affiliate.affiliate_id FROM " .  DB_PREFIX . "affiliate,  " .  DB_PREFIX . "accc_customer_affiliate WHERE " .  DB_PREFIX . "affiliate.code = ''" . $this->db->escape($code) . "'' AND " .  DB_PREFIX . "affiliate.affiliate_id = " .  DB_PREFIX . "accc_customer_affiliate.affiliate_id AND " .  DB_PREFIX . "accc_customer_affiliate.customer_id = ''" . (int) $customer_id . "''");\n				if($res->num_rows > 0) return array();\n			}					\n		}\n		//+mod by yp end\n		\n]]></add>\n		</operation>\n	</file>\n<file path="catalog/model/account/address.php">\n		<operation>\n			<search><![CDATA[$address_id = $this->db->getLastId();]]></search>\n			<add position="after"><![CDATA[		\n			\n		//+mod by yp start\n		if ($this->config->get(''account_combine_status'') && isset($data[''accc_affiliate_address'']) && $data[''accc_affiliate_address'']) {\n			$aff_data = $data;\n			unset($aff_data[''firstname'']);\n			unset($aff_data[''lastname'']);\n			$this->load->model(''affiliate/account_combine'');\n			$this->model_affiliate_account_combine->editAffiliate($aff_data);\n		}\n		//+mod by yp end			\n		\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA["'' WHERE address_id  = ''" . (int)$address_id . "'' AND customer_id = ''" . (int)$this->customer->getId() . "''");]]></search>\n			<add position="after"><![CDATA[		\n			\n		//+mod by yp start\n		if ($this->config->get(''account_combine_status'') && isset($data[''accc_affiliate_address'']) && $data[''accc_affiliate_address'']) {\n			$aff_data = $data;\n			unset($aff_data[''firstname'']);\n			unset($aff_data[''lastname'']);\n			$this->load->model(''affiliate/account_combine'');\n			$this->model_affiliate_account_combine->editAffiliate($aff_data);\n		}\n		//+mod by yp end			\n		\n]]></add>\n		</operation>\n	</file>			\n<file path="catalog/model/account/customer.php">\n		<operation>\n			<search><![CDATA[$this->load->language(''mail/customer'');]]></search>\n			<add position="before"><![CDATA[\n			\n		//+mod by yp start\n		if($this->config->get(''account_combine_status'') && $customer_id && !$this->affiliate->isLogged()) {		\n			if((isset($data[''accc_create_affiliate_account'']) && $data[''accc_create_affiliate_account'']) || (isset($data[''create_affiliate_account'']) && $data[''create_affiliate_account'']) || (isset($this->request->post[''accc_create_affiliate_account'']) && $this->request->post[''accc_create_affiliate_account'']) || (isset($this->request->post[''create_affiliate_account'']) && $this->request->post[''create_affiliate_account''])) {\n				$this->load->model(''affiliate/account_combine'');\n				$account_status = $this->model_affiliate_account_combine->getAccountStatus($customer_id);			\n				if($account_status === ''no_account'') {\n					$affiliate_id = $this->model_affiliate_account_combine->addAffiliateFromCustomer($customer_id, $data);\n				}\n			}\n		}\n		//+mod by yp end		\n		\n			]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[function editCustomer($data) {]]></search>\n			<add position="after"><![CDATA[\n\n		//+mod by yp start\n		if ($this->config->get(''account_combine_status'')) {\n			$this->load->model(''affiliate/account_combine'');\n			$this->model_affiliate_account_combine->editAffiliate($data);\n		}	\n		//+mod by yp end\n		\n]]></add>\n		</operation>			\n		<operation>\n			<search><![CDATA[function editPassword($email, $password) {]]></search>\n			<add position="after"><![CDATA[\n			\n		//+mod by yp start\n		if($this->config->get(''account_combine_status'') && $this->affiliate->isLogged() && $this->affiliate->getEmail() == $email) {\n			$this->load->model(''affiliate/affiliate'');			\n			$this->model_affiliate_affiliate->editPassword($email, $password);\n		}\n		//+mod by yp end\n		\n]]></add>\n		</operation>		\n	</file>\n\n<file path="system/library/affiliate.php">\n		<operation>\n			<search><![CDATA[public function logout(]]></search>\n			<add position="before"><![CDATA[\n			\n	//+mod by yp start\n	private function _set_own_tracking() {\n		if(!isset($this->request->cookie[''tracking'']) && $this->config->get(''account_combine_status'') && $this->config->get(''account_combine_own_parent'')) setcookie(''tracking'', $this->code, time() + 86400000, ''/'');		\n	}\n	//+mod by yp end		\n	\n			]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[public function login($email, $password) {]]></search>\n			<add position="replace"><![CDATA[public function login($email, $password, $customer_id=false) {//+mod by yp ]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[affiliate_id = ''" . (int)$this->session->data[''affiliate_id''] . "'' AND status = ''1''");]]></search>\n			<add position="after"><![CDATA[\n			\n			if($affiliate_query->num_rows) $this->_set_own_tracking();//+mod by yp\n			\n			]]></add>\n		</operation>	\n		<operation>\n			<search><![CDATA[$affiliate_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "affiliate WHERE LOWER]]></search>\n			<add position="before"><![CDATA[\n			\n		//+mod by yp start\n		if(!$email && !$password && !$customer_id) return false;\n		if($customer_id !== false && preg_match("/^\\d+$/", $customer_id)) {\n			$affiliate_query = $this->db->query("SELECT " . DB_PREFIX . "affiliate.* FROM " . DB_PREFIX . "affiliate, " . DB_PREFIX . "accc_customer_affiliate WHERE " . DB_PREFIX . "accc_customer_affiliate.affiliate_id=" . DB_PREFIX . "affiliate.affiliate_id AND " . DB_PREFIX . "accc_customer_affiliate.customer_id = ''" . (int) $customer_id . "'' AND " . DB_PREFIX . "affiliate.status = ''1'' AND " . DB_PREFIX . "affiliate.approved = ''1'' LIMIT 1");\n		} else {\n		//+mod by yp end\n		\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[OR password = ''" . $this->db->escape(md5($password)) . "'') AND status = ''1'' AND approved = ''1''");]]></search>\n			<add position="after"><![CDATA[\n			\n} //+mod by yp\n\nif($affiliate_query->num_rows) $this->_set_own_tracking(); //+mod by yp\n\n]]></add>\n		</operation>		\n	</file>\n<file path="system/library/customer.php">\n		<operation>\n		<search regex="true"><![CDATA[/if\\s*\\(.customer_query->num_rows\\)\\s*\\{[\\n\\r\\s]*.this->session->data\\[''customer_id''\\]\\s*=\\s*.customer_query->row\\[''customer_id''\\]\\;/sm]]></search>\n			<add position="replace"><![CDATA[\n			\n//+mod by yp start\nif ($this->config->get(''account_combine_status'') && !$customer_query->num_rows) {\n	$_accc_res = $this->db->query("SELECT " . DB_PREFIX . "accc_customer_affiliate.customer_id, " . DB_PREFIX . "accc_customer_affiliate.affiliate_id FROM " . DB_PREFIX . "affiliate LEFT JOIN " . DB_PREFIX . "accc_customer_affiliate ON " . DB_PREFIX . "accc_customer_affiliate.affiliate_id=" . DB_PREFIX . "affiliate.affiliate_id WHERE " . DB_PREFIX . "affiliate.email = ''" . $this->db->escape($email) . "'' AND (" . DB_PREFIX . "affiliate.password = SHA1(CONCAT(" . DB_PREFIX . "affiliate.salt, SHA1(CONCAT(" . DB_PREFIX . "affiliate.salt, SHA1(''" . $this->db->escape($password) . "''))))) OR " . DB_PREFIX . "affiliate.password = ''" . $this->db->escape(md5($password)) . "'') AND " . DB_PREFIX . "affiliate.status = ''1'' AND " . DB_PREFIX . "affiliate.approved = ''1'' AND " . DB_PREFIX . "accc_customer_affiliate.affiliate_id IS NOT NULL");\n	if($_accc_res->num_rows > 0) {\n		$accc_aff = $_accc_res->row[''affiliate_id''];\n		$_q = "SELECT * FROM " . DB_PREFIX . "customer WHERE customer_id=''" . ((int) $_accc_res->row[''customer_id'']) . "'' AND status = ''1'' AND approved = ''1''";\n		$customer_query = $this->db->query($_q);\n	}\n}\n//+mod by yp end\nif ($customer_query->num_rows) {\n			$this->session->data[''customer_id''] = $customer_query->row[''customer_id''];\n			\n]]></add>\n		</operation>\n	</file>\n</modification>', 1, '2016-01-20 15:25:20');
INSERT INTO `oc_modification` (`modification_id`, `name`, `code`, `author`, `version`, `link`, `xml`, `status`, `date_added`) VALUES
(11, 'Accounts Combine module for openCart 2 - Templates', 'accc160107t_yp', 'YP', '1.6.0107', '', '<?xml version="1.0" encoding="utf-8"?>\n<modification>\n	<id><![CDATA[Accounts Combine module for openCart 2 - Templates]]></id>\n	<name><![CDATA[Accounts Combine module for openCart 2 - Templates]]></name>\n	<version><![CDATA[1.6.0107]]></version>\n	<code><![CDATA[accc160107t_yp]]></code>\n	<author><![CDATA[YP]]></author>	\n<file path="catalog/view/theme/*/template/account/account.tpl">\n		<operation>\n			<search><![CDATA[<?php echo $content_bottom]]></search>\n			<add position="before"><![CDATA[	\n			\n<?php //+mod by yp start  \n	if ($text_link_to_affiliate) { ?>\n  <h2><?php echo $text_affiliate_account; ?></h2>  \n    <ul class="list-unstyled">\n      <li><a href="<?php echo $link_to_affiliate; ?>"><?php echo $text_link_to_affiliate; ?></a></li>	\n<?php if ($affiliate_logged) { ?>\n      <li><a href="<?php echo $affiliate_info; ?>"><?php echo $text_affiliate_info; ?></a></li>\n      <li><a href="<?php echo $affiliate_tracking; ?>"><?php echo $text_affiliate_tracking; ?></a></li>\n      <li><a href="<?php echo $affiliate_transaction; ?>"><?php echo $text_affiliate_transaction; ?></a></li>\n	<?php } ?>\n    </ul>  \n<?php //+mod by yp end\n	} ?>\n	\n]]></add>\n		</operation>\n	</file>\n	<file path="catalog/view/theme/*/template/account/address_form.tpl">\n		<operation>\n			<search><![CDATA[<?php echo $footer]]></search>\n			<add position="before"><![CDATA[	\n\n<?php //+mod by yp start \n	if ($entry_affiliate_address) { ?>\n<script type="text/javascript"><!--\n	$(document).ready(function() {\n       var _html = ''<div class="form-group"><label class="col-sm-2 control-label"><?php echo $entry_affiliate_address; ?></label><div class="col-sm-10">'';\n              <?php if ($default) { ?>\n       var _html += ''<label class="radio-inline"><input type="radio" name="accc_affiliate_address" value="1" checked="checked" /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="accc_affiliate_address" value="0" /><?php echo $text_no; ?></label>'';\n              <?php } else { ?>\n       var _html += ''<label class="radio-inline"><input type="radio" name="accc_affiliate_address" value="1" /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="accc_affiliate_address" value="0" checked="checked" /><?php echo $text_no; ?></label>'';\n  	      <?php } ?>\n       var _html += ''</div></div>'';\n	   $(''fieldset'').append(_html);\n	});\n//--></script>\n<?php } //+mod by yp end \n?>					\n		  \n]]></add>\n		</operation>\n	</file>					\n	<file path="catalog/view/theme/*/template/account/register.tpl">\n		<operation>\n			<search><![CDATA[<?php if ($text_agree)]]></search>\n			<add position="before"><![CDATA[\n			\n<?php /* //+mod by yp start */	\n	if($show_affiliate_section) { \n		if($affiliate_choice) { ?>\n    <div class="buttons">\n      <div>        \n		<div class="checkbox">\n			<label>\n		<?php if ($accc_create_affiliate_account) { ?>\n			<input type="checkbox" name="accc_create_affiliate_account" value="1" checked="checked" id="accc_create_account_checkbox" />\n        <?php } else { ?>\n			<input type="checkbox" name="accc_create_affiliate_account" value="1" id="accc_create_account_checkbox" />\n        <?php } ?><?php echo $text_affiliate_checkbox_confirm; ?></label>\n		</div>\n	  </div>\n	</div>\n	<?php } else {?>\n	<input type="hidden" name="accc_create_affiliate_account" value="1" />\n	<?php }?>    \n    <fieldset id="accc_aff_data">\n	  <legend><?php echo $text_affiliate_information; ?></legend>\n		  <?php if ($use_website) { ?>\n          <div class="form-group<?php if ($website_required) { ?> required<?php } ?>">\n            <label class="col-sm-2 control-label" for="input-website"><?php echo $entry_website; ?></label>\n            <div class="col-sm-10">\n			<?php if ($website_textarea) { ?>\n			  <textarea name="website" id="input-website" class="form-control"><?php echo $website; ?></textarea>\n			<?php } else { ?>\n              <input type="text" name="website" value="<?php echo $website; ?>" placeholder="<?php echo $entry_website; ?>" id="input-website" class="form-control" />\n			<?php } ?>\n			<?php if ($error_website) { ?><div class="text-danger" id="error_website"><?php echo $error_website; ?></div><?php } ?>\n            </div>\n          </div>\n		  <?php } ?>\n		  <?php if ($use_tax) { ?>\n          <div class="form-group<?php if ($tax_required) { ?> required<?php } ?>">\n            <label class="col-sm-2 control-label" for="input-tax"><?php echo $entry_tax; ?></label>\n            <div class="col-sm-10">\n              <input type="text" name="tax" value="<?php echo $tax; ?>" placeholder="<?php echo $entry_tax; ?>" id="input-tax" class="form-control" />\n     		  <?php if ($error_tax) { ?><div class="text-danger" id="error_tax"><?php echo $error_tax; ?></div><?php } ?>			  \n            </div>\n          </div>\n		  <?php } ?>\n		  <?php if ($use_payment) { ?>\n          <div class="form-group<?php if ($payment_required) { ?> required<?php } ?>">\n            <label class="col-sm-2 control-label"><?php echo $entry_payment; ?></label>\n            <div class="col-sm-10">\n			  <?php if ($use_cheque) { ?>\n              <div class="radio">\n                <label>\n                  <?php if ($payment == ''cheque'') { ?>\n                  <input type="radio" name="payment" value="cheque" checked="checked" />\n                  <?php } else { ?>\n                  <input type="radio" name="payment" value="cheque" />\n                  <?php } ?>\n                  <?php echo $text_cheque; ?></label>\n              </div>\n			  <?php } ?>\n			  <?php if ($use_paypal) { ?>\n              <div class="radio">\n                <label>\n                  <?php if ($payment == ''paypal'') { ?>\n                  <input type="radio" name="payment" value="paypal" checked="checked" />\n                  <?php } else { ?>\n                  <input type="radio" name="payment" value="paypal" />\n                  <?php } ?>\n                  <?php echo $text_paypal; ?></label>\n              </div>\n			  <?php } ?>\n			  <?php if ($use_bank) { ?>\n              <div class="radio">\n                <label>\n                  <?php if ($payment == ''bank'') { ?>\n                  <input type="radio" name="payment" value="bank" checked="checked" />\n                  <?php } else { ?>\n                  <input type="radio" name="payment" value="bank" />\n                  <?php } ?>\n                  <?php echo $text_bank; ?></label>\n              </div>\n			  <?php } ?>\n			  <?php if ($error_payment) { ?><div class="text-danger" id="error_payment"><?php echo $error_payment; ?></div><?php } ?>			  \n            </div>\n          </div>		  \n		  <?php if ($use_cheque) { ?>\n          <div class="form-group payment<?php if ($payment_required) { ?> required<?php } ?>" id="payment-cheque">\n            <label class="col-sm-2 control-label" for="input-cheque"><?php echo $entry_cheque; ?></label>\n            <div class="col-sm-10">\n              <input type="text" name="cheque" value="<?php echo $cheque; ?>" placeholder="<?php echo $entry_cheque; ?>" id="input-cheque" class="form-control" />\n			<?php if ($error_cheque) { ?><div class="text-danger" id="error_cheque"><?php echo $error_cheque; ?></div><?php } ?>			  \n            </div>\n          </div>\n		  <?php } ?>\n		  <?php if ($use_paypal) { ?>\n          <div class="form-group payment<?php if ($payment_required) { ?> required<?php } ?>" id="payment-paypal">\n            <label class="col-sm-2 control-label" for="input-paypal"><?php echo $entry_paypal; ?></label>\n            <div class="col-sm-10">\n              <input type="text" name="paypal" value="<?php echo $paypal; ?>" placeholder="<?php echo $entry_paypal; ?>" id="input-paypal" class="form-control" />\n			<?php if ($error_paypal) { ?><div class="text-danger" id="error_paypal"><?php echo $error_paypal; ?></div><?php } ?>			  \n            </div>\n          </div>\n		  <?php } ?>\n		  <?php if ($use_bank) { ?>\n          <div class="payment" id="payment-bank">\n			<?php if ($use_bank_name) { ?>\n            <div class="form-group<?php if ($payment_required) { ?> required<?php } ?>">\n              <label class="col-sm-2 control-label" for="input-bank-name"><?php echo $entry_bank_name; ?></label>\n              <div class="col-sm-10">\n                <input type="text" name="bank_name" value="<?php echo $bank_name; ?>" placeholder="<?php echo $entry_bank_name; ?>" id="input-bank-name" class="form-control" />\n				<?php if ($error_bank_name) { ?><div class="text-danger" id="error_bank_name"><?php echo $error_bank_name; ?></div><?php } ?>\n              </div>\n            </div>\n			<?php } ?>\n			<?php if ($use_bank_branch_number) { ?>\n            <div class="form-group<?php if ($payment_required) { ?> required<?php } ?>">\n              <label class="col-sm-2 control-label" for="input-bank-branch-number"><?php echo $entry_bank_branch_number; ?></label>\n              <div class="col-sm-10">\n                <input type="text" name="bank_branch_number" value="<?php echo $bank_branch_number; ?>" placeholder="<?php echo $entry_bank_branch_number; ?>" id="input-bank-branch-number" class="form-control" />\n				<?php if ($error_bank_branch_number) { ?><div class="text-danger" id="error_bank_branch_number"><?php echo $error_bank_branch_number; ?></div><?php } ?>\n              </div>\n            </div>\n			<?php } ?>\n			<?php if ($use_bank_swift_code) { ?>\n            <div class="form-group<?php if ($payment_required) { ?> required<?php } ?>">\n              <label class="col-sm-2 control-label" for="input-bank-swift-code"><?php echo $entry_bank_swift_code; ?></label>\n              <div class="col-sm-10">\n                <input type="text" name="bank_swift_code" value="<?php echo $bank_swift_code; ?>" placeholder="<?php echo $entry_bank_swift_code; ?>" id="input-bank-swift-code" class="form-control" />\n				<?php if ($error_bank_swift_code) { ?><div class="text-danger" id="error_bank_swift_code"><?php echo $error_bank_swift_code; ?></div><?php } ?>\n              </div>\n            </div>\n			<?php } ?>\n			<?php if ($use_bank_account_name) { ?>\n            <div class="form-group<?php if ($payment_required) { ?> required<?php } ?>">\n              <label class="col-sm-2 control-label" for="input-bank-account-name"><?php echo $entry_bank_account_name; ?></label>\n              <div class="col-sm-10">\n                <input type="text" name="bank_account_name" value="<?php echo $bank_account_name; ?>" placeholder="<?php echo $entry_bank_account_name; ?>" id="input-bank-account-name" class="form-control" />\n				<?php if ($error_bank_account_name) { ?><div class="text-danger" id="error_bank_account_name"><?php echo $error_bank_account_name; ?></div><?php } ?>\n              </div>\n            </div>\n			<?php } ?>\n			<?php if ($use_bank_account_number) { ?>\n            <div class="form-group<?php if ($payment_required) { ?> required<?php } ?>">\n              <label class="col-sm-2 control-label" for="input-bank-account-number"><?php echo $entry_bank_account_number; ?></label>\n              <div class="col-sm-10">\n                <input type="text" name="bank_account_number" value="<?php echo $bank_account_number; ?>" placeholder="<?php echo $entry_bank_account_number; ?>" id="input-bank-account-number" class="form-control" />\n				<?php if ($error_bank_account_number) { ?><div class="text-danger" id="error_bank_account_number"><?php echo $error_bank_account_number; ?></div><?php } ?>\n              </div>\n            </div>\n			<?php } ?>\n          </div>\n		  <?php } ?>\n		  <?php } ?>\n        </fieldset>\n    <?php if ($text_affiliate_agree) { ?>\n    <div class="buttons clearfix" id="accc_affiliate_agree">\n      <div class="pull-right"><?php echo $text_affiliate_agree; ?>        \n        <input type="checkbox" name="affiliate_agree" value="1" <?php if ($affiliate_agree) { ?>checked="checked"<?php } ?> />\n      </div>\n    </div>\n	<?php } ?>\n<?php } /* //+mod by yp end */ ?>\n\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[<?php echo $footer]]></search>\n			<add position="before"><![CDATA[\n\n<?php /* //+mod by yp start */	\n	if($show_affiliate_section) { ?>\n<script type="text/javascript"><!--	\n\nif($(''#accc_aff_data div'').length < 1) $(''#accc_aff_data'').hide();\n<?php if($affiliate_choice) {?>\nif($(''#accc_create_account_checkbox'').is('':checked'')) {\n	$(''#accc_aff_data'').show();\n	$(''#accc_affiliate_agree'').show();\n\n} else {\n	$(''#accc_aff_data'').hide();\n	$(''#accc_affiliate_agree'').hide();\n}\n$(document).on(''click'', ''#accc_create_account_checkbox'', function() {\n	if($(this).is('':checked'')) {\n		$(''#accc_aff_data'').show();\n		$(''#accc_affiliate_agree'').show();\n	} else {\n		$(''#accc_aff_data'').hide();\n		$(''#accc_affiliate_agree'').hide();\n	}\n});\n<?php } if ($use_payment) {?>\n\n$(''input[name=\\''payment\\'']'').on(''change'', function() {\n	$(''.payment'').hide();\n	\n	$(''#payment-'' + this.value).show();\n});\n\n$(''input[name=\\''payment\\'']:checked'').trigger(''change'');\n<?php } ?>\n//--></script> \n<?php } /* //+mod by yp end */ ?>\n\n]]></add>\n		</operation>\n	</file>	\n	<file path="catalog/view/theme/*/template/affiliate/account.tpl">\n		<operation>\n			<search><![CDATA[<li><a href="<?php echo $payment;]]></search>\n			<add position="before"><![CDATA[	\n			\n	  <?php //+mod by yp start\n			if ($accc) { ?>\n	  <li><a href="<?php echo $affiliate_info; ?>"><?php echo $text_affiliate_info; ?></a></li>\n	  <li><a href="<?php echo $customer_account; ?>"><?php echo $text_customer_account; ?></a></li>\n	  <?php } else { ?>\n	  \n]]></add>\n		</operation>			\n		<operation>\n			<search><![CDATA[echo $text_payment; ?></a></li>]]></search>\n			<add position="after"><![CDATA[	\n			\n	  <?php } //+mod by yp end\n	  ?>\n	  \n]]></add>\n		</operation>			\n	</file>	\n	<file path="catalog/view/theme/*/template/affiliate/transaction.tpl">\n		<operation>\n			<search><![CDATA[<div class="text-right"><?php echo $pagination; ?>]]></search>\n			<add position="before"><![CDATA[	\n			\n<?php\n	//+mod by yp start\n	if($accc_allow_funds_transfer) {?>\n<form method="post" action="<?php echo $action_funds_transfer;?>" id="funds_transfer_form" class="form-inline">	\n  <div class="form-group">\n	<label for="funds_transfer_amount"><?php echo $entry_funds_transfer_input;?></label>\n	<?php echo $symbol_left;?><input type="text" name="amount" id="funds_transfer_amount" class="form-control" /><?php echo $symbol_right;?> \n	<button type="button" class="btn btn-primary" id="funds_transfer_submit" data-loading-text="<?php echo $text_loading; ?>"><?php echo $button_funds_transfer;?></button>\n	<div id="funds_transfer_error" style="display:none;"></div>\n	<div class="text-info" id="funds_transfer_message" style="display:none;"></div>\n  </div>\n</form>\n<?php }\n	//+mod by yp end\n?>	\n			\n]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[<?php echo $footer]]></search>\n			<add position="before"><![CDATA[	\n			\n<?php\n	//+mod by yp start\n	if($accc_allow_funds_transfer) {?>\n<script type="text/javascript"><!--\n$(document).ready(function() {\n	$(''#funds_transfer_error'').addClass(''text-danger'');\n	var _use_multiplier = <?php echo ($use_multiplier ? ''true'' : ''false'');?>;\n	var _balance = <?php echo $balance_raw;?>;\n	var _error_message = ''<?php echo $error_invalid_transfer_amount_js;?>'';\n	var _credit_message = ''<?php echo $credit_amount_message;?>'';	\n	var _multiplier = <?php echo $transfer_multiplier;?>;\n\n	$(document).on("change blur keyup mouseup", ''#funds_transfer_amount'', function() {\n		var _v = $(this).val();\n		if(_v.length < 1) {\n			$(''#funds_transfer_message'').html('''');\n			$(''#funds_transfer_error'').html('''');\n			return;\n		}\n		if(!/^\\d+(?:\\.\\d+)?$/.test(_v) || (parseFloat(_v) - _balance) > 0.005) {\n			$(''#funds_transfer_message'').hide();\n			$(''#funds_transfer_error'').html(_error_message);			\n			$(''#funds_transfer_error'').show();\n			return;\n		}\n		if(_use_multiplier) {\n			var _msg = _credit_message.replace(''%s'', ''<?php echo $symbol_left;?>''+(parseInt(Math.round(parseFloat(_v) * _multiplier * 100)) / 100)+''<?php echo $symbol_right;?>'');\n			$(''#funds_transfer_error'').hide();\n			$(''#funds_transfer_message'').html(_msg);\n			$(''#funds_transfer_message'').show();\n			return;\n		}\n		$(''#funds_transfer_message'').html('''');\n		$(''#funds_transfer_error'').html('''');\n	});\n	\n	$(''#funds_transfer_submit'').click(function() {\n		var _v = $(''#funds_transfer_amount'').val();\n		if(!/^\\d+(?:\\.\\d+)?$/.test(_v) || (parseFloat(_v) - _balance) > 0.005) {\n			$(''#funds_transfer_message'').hide();\n			$(''#funds_transfer_error'').html(_error_message);\n			$(''#funds_transfer_error'').show();			\n			return;\n		}\n		$(''#funds_transfer_form'').submit();	\n	});\n});\n//-->\n</script>\n<?php }\n	//+mod by yp end\n?>			\n\n]]></add>\n		</operation>\n</file>\n	<file path="catalog/view/theme/*/template/checkout/register.tpl">\n		<operation>\n			<search><![CDATA[<?php if ($text_agree)]]></search>\n			<add position="before"><![CDATA[	\n			\n<?php /* //+mod by yp start */	\n	if($show_affiliate_section) { \n		if($affiliate_choice) { ?>\n    <div class="buttons clearfix">\n      <div>        \n		<div class="checkbox">\n			<label>\n		<?php if ($accc_create_affiliate_account) { ?>\n			<input type="checkbox" name="accc_create_affiliate_account" value="1" checked="checked" id="accc_create_account_checkbox" />\n        <?php } else { ?>\n			<input type="checkbox" name="accc_create_affiliate_account" value="1" id="accc_create_account_checkbox" />\n        <?php } ?><?php echo $text_affiliate_checkbox_confirm; ?></label>\n		</div>\n	  </div>\n	</div>\n	<?php } else {?>\n	<input type="hidden" name="accc_create_affiliate_account" value="1" />\n	<?php }?>    \n    <fieldset id="accc_aff_data">\n	  <legend><?php echo $text_affiliate_information; ?></legend>\n		  <?php if ($use_website) { ?>\n          <div class="form-group<?php if ($website_required) { ?> required<?php } ?>">\n            <label class="control-label" for="input-payment-website"><?php echo $entry_website; ?></label>            \n			<?php if ($website_textarea) { ?>\n			  <textarea name="website" id="input-payment-website" class="form-control"><?php echo $website; ?></textarea>\n			<?php } else { ?>\n              <input type="text" name="website" value="<?php echo $website; ?>" placeholder="<?php echo $entry_website; ?>" id="input-payment-website" class="form-control" />\n			<?php } ?>\n			<?php if ($error_website) { ?><div class="text-danger" id="error_website"><?php echo $error_website; ?></div><?php } ?>            \n          </div>\n		  <?php } ?>\n		  <?php if ($use_tax) { ?>\n          <div class="form-group<?php if ($tax_required) { ?> required<?php } ?>">\n            <label class="control-label" for="input-payment-tax"><?php echo $entry_tax; ?></label>            \n              <input type="text" name="tax" value="<?php echo $tax; ?>" placeholder="<?php echo $entry_tax; ?>" id="input-payment-tax" class="form-control" />\n     		  <?php if ($error_tax) { ?><div class="text-danger" id="error_tax"><?php echo $error_tax; ?></div><?php } ?>            \n          </div>\n		  <?php } ?>\n		  <?php if ($use_payment) { ?>\n          <div class="form-group<?php if ($payment_required) { ?> required<?php } ?>">\n            <label class="control-label" id="input-payment-payment"><?php echo $entry_payment; ?></label>\n			  <?php if ($use_cheque) { ?>\n              <div class="radio">\n                <label>\n                  <?php if ($payment == ''cheque'') { ?>\n                  <input type="radio" name="payment" value="cheque" checked="checked" />\n                  <?php } else { ?>\n                  <input type="radio" name="payment" value="cheque" />\n                  <?php } ?>\n                  <?php echo $text_cheque; ?></label>\n              </div>\n			  <?php } ?>\n			  <?php if ($use_paypal) { ?>\n              <div class="radio">\n                <label>\n                  <?php if ($payment == ''paypal'') { ?>\n                  <input type="radio" name="payment" value="paypal" checked="checked" />\n                  <?php } else { ?>\n                  <input type="radio" name="payment" value="paypal" />\n                  <?php } ?>\n                  <?php echo $text_paypal; ?></label>\n              </div>\n			  <?php } ?>\n			  <?php if ($use_bank) { ?>\n              <div class="radio">\n                <label>\n                  <?php if ($payment == ''bank'') { ?>\n                  <input type="radio" name="payment" value="bank" checked="checked" />\n                  <?php } else { ?>\n                  <input type="radio" name="payment" value="bank" />\n                  <?php } ?>\n                  <?php echo $text_bank; ?></label>\n              </div>\n			  <?php } ?>\n			  <?php if ($error_payment) { ?><div class="text-danger" id="error_payment"><?php echo $error_payment; ?></div><?php } ?>            \n          </div>		  \n		  <?php if ($use_cheque) { ?>\n          <div class="form-group payment<?php if ($payment_required) { ?> required<?php } ?>" id="payment-cheque">\n            <label class="control-label" for="input-payment-cheque"><?php echo $entry_cheque; ?></label>            \n              <input type="text" name="cheque" value="<?php echo $cheque; ?>" placeholder="<?php echo $entry_cheque; ?>" id="input-payment-cheque" class="form-control" />\n			<?php if ($error_cheque) { ?><div class="text-danger" id="error_cheque"><?php echo $error_cheque; ?></div><?php } ?>            \n          </div>\n		  <?php } ?>\n		  <?php if ($use_paypal) { ?>\n          <div class="form-group payment<?php if ($payment_required) { ?> required<?php } ?>" id="payment-paypal">\n            <label class="control-label" for="input-payment-paypal"><?php echo $entry_paypal; ?></label>            \n              <input type="text" name="paypal" value="<?php echo $paypal; ?>" placeholder="<?php echo $entry_paypal; ?>" id="input-payment-paypal" class="form-control" />\n			<?php if ($error_paypal) { ?><div class="text-danger" id="error_paypal"><?php echo $error_paypal; ?></div><?php } ?>			              \n          </div>\n		  <?php } ?>\n		  <?php if ($use_bank) { ?>\n          <div class="payment" id="payment-bank">\n			<?php if ($use_bank_name) { ?>\n            <div class="form-group<?php if ($payment_required) { ?> required<?php } ?>">\n              <label class="control-label" for="input-payment-bank-name"><?php echo $entry_bank_name; ?></label>              \n                <input type="text" name="bank_name" value="<?php echo $bank_name; ?>" placeholder="<?php echo $entry_bank_name; ?>" id="input-payment-bank-name" class="form-control" />\n				<?php if ($error_bank_name) { ?><div class="text-danger" id="error_bank_name"><?php echo $error_bank_name; ?></div><?php } ?>     \n            </div>\n			<?php } ?>\n			<?php if ($use_bank_branch_number) { ?>\n            <div class="form-group<?php if ($payment_required) { ?> required<?php } ?>">\n              <label class="control-label" for="input-payment-bank-branch_number"><?php echo $entry_bank_branch_number; ?></label>              \n                <input type="text" name="bank_branch_number" value="<?php echo $bank_branch_number; ?>" placeholder="<?php echo $entry_bank_branch_number; ?>" id="input-payment-bank-branch_number" class="form-control" />\n				<?php if ($error_bank_branch_number) { ?><div class="text-danger" id="error_bank_branch_number"><?php echo $error_bank_branch_number; ?></div><?php } ?>              \n            </div>\n			<?php } ?>\n			<?php if ($use_bank_swift_code) { ?>\n            <div class="form-group<?php if ($payment_required) { ?> required<?php } ?>">\n              <label class="control-label" for="input-payment-bank-swift_code"><?php echo $entry_bank_swift_code; ?></label>              \n                <input type="text" name="bank_swift_code" value="<?php echo $bank_swift_code; ?>" placeholder="<?php echo $entry_bank_swift_code; ?>" id="input-payment-bank-swift_code" class="form-control" />\n				<?php if ($error_bank_swift_code) { ?><div class="text-danger" id="error_bank_swift_code"><?php echo $error_bank_swift_code; ?></div><?php } ?>\n            </div>\n			<?php } ?>\n			<?php if ($use_bank_account_name) { ?>\n            <div class="form-group<?php if ($payment_required) { ?> required<?php } ?>">\n              <label class="control-label" for="input-payment-bank-account_name"><?php echo $entry_bank_account_name; ?></label>              \n                <input type="text" name="bank_account_name" value="<?php echo $bank_account_name; ?>" placeholder="<?php echo $entry_bank_account_name; ?>" id="input-payment-bank-account_name" class="form-control" />\n				<?php if ($error_bank_account_name) { ?><div class="text-danger" id="error_bank_account_name"><?php echo $error_bank_account_name; ?></div><?php } ?>\n            </div>\n			<?php } ?>\n			<?php if ($use_bank_account_number) { ?>\n            <div class="form-group<?php if ($payment_required) { ?> required<?php } ?>">\n              <label class="control-label" for="input-payment-bank-account_number"><?php echo $entry_bank_account_number; ?></label>              \n                <input type="text" name="bank_account_number" value="<?php echo $bank_account_number; ?>" placeholder="<?php echo $entry_bank_account_number; ?>" id="input-payment-bank-account_number" class="form-control" />\n				<?php if ($error_bank_account_number) { ?><div class="text-danger" id="error_bank_account_number"><?php echo $error_bank_account_number; ?></div><?php } ?>\n            </div>\n			<?php } ?>\n          </div>\n		  <?php } ?>\n		  <?php } ?>\n        </fieldset>\n    <?php if ($text_affiliate_agree) { ?>\n    <div class="buttons clearfix" id="accc_affiliate_agree">\n      <div class="pull-right"><?php echo $text_affiliate_agree; ?>        \n        <input type="checkbox" name="affiliate_agree" value="1" <?php if ($affiliate_agree) { ?>checked="checked"<?php } ?> />\n      </div>\n    </div>\n	<?php } ?>\n<?php } /* //+mod by yp end */ ?>\n\n]]></add>\n		</operation>			\n		<operation>\n			<search regex="true"><![CDATA[/name=.''country_id.''\\]''\\)\\.trigger\\(''change''\\)\\;[\\n\\r\\s]*\\/\\/--><\\/script>/ms]]></search>\n			<add position="replace"><![CDATA[name=\\''country_id\\'']'').trigger(''change'');\n//--></script>\n			\n<?php /* //+mod by yp start */	\n	if($show_affiliate_section) { ?>\n<script type="text/javascript"><!--	\nif($(''#accc_aff_data div'').length < 1) $(''#accc_aff_data'').hide();\n<?php if($affiliate_choice) { ?>\nif($(''#accc_create_account_checkbox'').is('':checked'')) {\n	$(''#accc_aff_data'').show();\n	<?php if ($text_affiliate_agree) { ?>\n	$(''#accc_affiliate_agree'').show();\n	<?php } ?>\n} else {\n	$(''#accc_aff_data'').hide();\n	<?php if ($text_affiliate_agree) { ?>\n	$(''#accc_affiliate_agree'').hide();\n	<?php } ?>	\n}\n\n$(document).on(''click'', ''#accc_create_account_checkbox'', function() {\n	if($(this).is('':checked'')) {\n		$(''#accc_aff_data'').show();\n	<?php if ($text_affiliate_agree) { ?>\n		$(''#accc_affiliate_agree'').show();\n	<?php } ?>		\n	} else {\n		$(''#accc_aff_data'').hide();\n	<?php if ($text_affiliate_agree) { ?>\n		$(''#accc_affiliate_agree'').hide();\n	<?php } ?>		\n	}\n});\n<?php } if ($use_payment) {?>\n\n$(''input[name=\\''payment\\'']'').on(''change'', function() {\n	$(''.payment'').hide();\n	\n	$(''#payment-'' + this.value).show();\n});\n\n$(''input[name=\\''payment\\'']:checked'').trigger(''change'');\n<?php } ?>\n//--></script> \n<?php } /* //+mod by yp end */ ?>			\n\n]]></add>\n		</operation>\n</file>\n</modification>', 1, '2016-01-20 15:25:27');

-- --------------------------------------------------------

--
-- Table structure for table `oc_module`
--

CREATE TABLE IF NOT EXISTS `oc_module` (
  `module_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(32) NOT NULL,
  `setting` text NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_module`
--

INSERT INTO `oc_module` (`module_id`, `name`, `code`, `setting`) VALUES
(30, 'Category', 'banner', '{"name":"Category","banner_id":"7","width":"182","height":"182","status":"1"}'),
(29, 'Home Page', 'carousel', '{"name":"Home Page","banner_id":"8","width":"130","height":"100","status":"1"}'),
(28, 'Home Page', 'featured', '{"name":"Home Page","product":["51","52","50","53"],"limit":"4","width":"200","height":"200","status":"1"}'),
(27, 'Home Page', 'slideshow', '{"name":"Home Page","banner_id":"7","width":"1140","height":"240","status":"1"}'),
(31, 'Banner 1', 'banner', '{"name":"Banner 1","banner_id":"7","width":"182","height":"182","status":"1"}'),
(32, 'Default Column', 'tracking_input', '{"language_id":1,"text_heading":"Referral Code","text":"Were you referred by someone?&lt;br \\/&gt;Enter code here:","text_thankyou":"Thank You!","button":"OK","error_message":"Sorry, this code does not exist !","template":"default_column","name":"Default Column","status":"1"}'),
(33, 'Default Row', 'tracking_input', '{"language_id":1,"text_heading":"","text":"Were you referred by someone? Type-in the code here: ","text_thankyou":"Thank you, your code is accepted !","button":"OK","error_message":"Sorry, this code does not exist !","template":"default_row","name":"Default Row","status":"1"}');

-- --------------------------------------------------------

--
-- Table structure for table `oc_mta_affiliate`
--

CREATE TABLE IF NOT EXISTS `oc_mta_affiliate` (
  `affiliate_id` int(10) unsigned NOT NULL DEFAULT '0',
  `mta_scheme_id` int(6) unsigned DEFAULT NULL,
  `parent_affiliate_id` int(10) unsigned NOT NULL DEFAULT '0',
  `all_parent_ids` text NOT NULL,
  `level_original` smallint(3) unsigned NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_mta_affiliate`
--

INSERT INTO `oc_mta_affiliate` (`affiliate_id`, `mta_scheme_id`, `parent_affiliate_id`, `all_parent_ids`, `level_original`) VALUES
(1, NULL, 0, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_mta_autoapprove`
--

CREATE TABLE IF NOT EXISTS `oc_mta_autoapprove` (
  `mta_autoapprove_id` int(8) unsigned NOT NULL,
  `mta_scheme_id` int(6) unsigned NOT NULL DEFAULT '1',
  `signup_level` smallint(3) unsigned NOT NULL DEFAULT '1',
  `autoapprove` smallint(2) unsigned NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_mta_autoapprove`
--

INSERT INTO `oc_mta_autoapprove` (`mta_autoapprove_id`, `mta_scheme_id`, `signup_level`, `autoapprove`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 1),
(3, 2, 1, 1),
(4, 2, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_mta_order`
--

CREATE TABLE IF NOT EXISTS `oc_mta_order` (
  `mta_order_id` int(11) unsigned NOT NULL,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(10) unsigned DEFAULT NULL,
  `commission` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `commission_added` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `autoadd` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_mta_order`
--

INSERT INTO `oc_mta_order` (`mta_order_id`, `order_id`, `affiliate_id`, `commission`, `commission_added`, `autoadd`) VALUES
(1, 8, 1, 163.8750, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_mta_order_product`
--

CREATE TABLE IF NOT EXISTS `oc_mta_order_product` (
  `mta_order_product_id` int(11) unsigned NOT NULL,
  `mta_order_id` int(11) unsigned DEFAULT NULL,
  `product_id` int(11) unsigned NOT NULL DEFAULT '0',
  `order_product_id` int(11) unsigned NOT NULL DEFAULT '0',
  `affiliate_id` int(10) unsigned DEFAULT NULL,
  `commission` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `mta_scheme_id` int(6) unsigned DEFAULT NULL,
  `num_levels` smallint(3) unsigned NOT NULL DEFAULT '1',
  `level` smallint(3) unsigned NOT NULL DEFAULT '1',
  `autoadd` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_mta_order_product`
--

INSERT INTO `oc_mta_order_product` (`mta_order_product_id`, `mta_order_id`, `product_id`, `order_product_id`, `affiliate_id`, `commission`, `mta_scheme_id`, `num_levels`, `level`, `autoadd`) VALUES
(1, 1, 53, 8, 1, 163.8750, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_mta_product`
--

CREATE TABLE IF NOT EXISTS `oc_mta_product` (
  `mta_product_id` int(11) unsigned NOT NULL,
  `product_id` int(11) unsigned NOT NULL DEFAULT '0',
  `price_mod_type` enum('','coupon','special','discount') NOT NULL DEFAULT '',
  `price_mod_id` int(11) unsigned NOT NULL DEFAULT '0',
  `mta_scheme_id` int(6) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_mta_product_affiliate`
--

CREATE TABLE IF NOT EXISTS `oc_mta_product_affiliate` (
  `mta_product_affiliate_id` int(10) unsigned NOT NULL,
  `product_id` int(11) unsigned NOT NULL DEFAULT '0',
  `affiliate_id` int(10) unsigned NOT NULL DEFAULT '0',
  `price_mod_type` enum('','coupon','special','discount') NOT NULL DEFAULT '',
  `price_mod_id` int(11) unsigned NOT NULL DEFAULT '0',
  `mta_scheme_id` int(6) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_mta_product_default_scheme`
--

CREATE TABLE IF NOT EXISTS `oc_mta_product_default_scheme` (
  `mta_product_default_scheme_id` int(8) unsigned NOT NULL,
  `entity_type` enum('coupon','m','c','m_coupon','m_special','m_discount','c_coupon','c_special','c_discount') NOT NULL DEFAULT 'coupon',
  `entity_id` int(11) unsigned NOT NULL DEFAULT '0',
  `mta_scheme_id` int(6) unsigned NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_mta_scheme`
--

CREATE TABLE IF NOT EXISTS `oc_mta_scheme` (
  `mta_scheme_id` int(6) unsigned NOT NULL,
  `scheme_name` varchar(100) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `max_levels` smallint(3) unsigned NOT NULL DEFAULT '1',
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `all_commissions` text NOT NULL,
  `all_autoadd` text NOT NULL,
  `commission_type` enum('percentage','fixed') NOT NULL DEFAULT 'percentage',
  `before_shipping` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `eternal` smallint(3) unsigned NOT NULL DEFAULT '0',
  `signup_code` char(13) NOT NULL DEFAULT ''
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_mta_scheme`
--

INSERT INTO `oc_mta_scheme` (`mta_scheme_id`, `scheme_name`, `description`, `max_levels`, `is_default`, `all_commissions`, `all_autoadd`, `commission_type`, `before_shipping`, `eternal`, `signup_code`) VALUES
(1, '5 plus 5 percent', '5 plus 5 percent', 2, 1, 'a:2:{i:0;a:1:{i:0;s:6:"5.0000";}i:1;a:2:{i:0;s:6:"5.0000";i:1;s:6:"5.0000";}}', 'a:2:{i:0;a:1:{i:0;b:1;}i:1;a:2:{i:0;b:1;i:1;b:1;}}', 'percentage', 1, 0, '4fc0ee2dd7460'),
(2, 'HTC 2 Tiers, Percentage', 'Hydro Tools Corp 2 Tiers', 2, 0, 'a:2:{i:0;a:1:{i:0;s:6:"1.0000";}i:1;a:2:{i:0;s:6:"0.0000";i:1;s:6:"2.0000";}}', 'a:2:{i:0;a:1:{i:0;b:1;}i:1;a:2:{i:0;b:0;i:1;b:1;}}', 'percentage', 1, 0, '569fff6e23492');

-- --------------------------------------------------------

--
-- Table structure for table `oc_mta_scheme_levels`
--

CREATE TABLE IF NOT EXISTS `oc_mta_scheme_levels` (
  `mta_scheme_level_id` int(8) unsigned NOT NULL,
  `mta_scheme_id` int(6) unsigned NOT NULL DEFAULT '1',
  `num_levels` smallint(3) unsigned NOT NULL DEFAULT '1',
  `level` smallint(3) unsigned NOT NULL DEFAULT '1',
  `commission` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `autoadd` smallint(2) unsigned NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_mta_scheme_levels`
--

INSERT INTO `oc_mta_scheme_levels` (`mta_scheme_level_id`, `mta_scheme_id`, `num_levels`, `level`, `commission`, `autoadd`) VALUES
(1, 1, 2, 1, 5.0000, 1),
(2, 1, 2, 2, 5.0000, 1),
(3, 2, 1, 1, 1.0000, 1),
(4, 2, 2, 1, 0.0000, 0),
(5, 2, 2, 2, 2.0000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_option`
--

CREATE TABLE IF NOT EXISTS `oc_option` (
  `option_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_option`
--

INSERT INTO `oc_option` (`option_id`, `type`, `sort_order`) VALUES
(1, 'radio', 1),
(2, 'checkbox', 2),
(4, 'text', 3),
(5, 'select', 4),
(6, 'textarea', 5),
(7, 'file', 6),
(8, 'date', 7),
(9, 'time', 8),
(10, 'datetime', 9),
(11, 'select', 10),
(12, 'date', 11);

-- --------------------------------------------------------

--
-- Table structure for table `oc_option_description`
--

CREATE TABLE IF NOT EXISTS `oc_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_option_description`
--

INSERT INTO `oc_option_description` (`option_id`, `language_id`, `name`) VALUES
(10, 5, 'Date &amp; Time'),
(9, 5, 'Time'),
(5, 5, 'Select'),
(7, 5, 'File'),
(8, 5, 'Date'),
(6, 5, 'Textarea'),
(4, 5, 'Text'),
(2, 5, 'Checkbox'),
(1, 5, 'Radio'),
(1, 2, 'Radio'),
(2, 2, 'Checkbox'),
(4, 2, 'Text'),
(6, 2, 'Textarea'),
(8, 2, 'Date'),
(7, 2, 'File'),
(5, 2, 'Select'),
(9, 2, 'Time'),
(10, 2, 'Date &amp; Time'),
(12, 2, 'Delivery Date'),
(11, 2, 'Size'),
(5, 6, 'Select'),
(7, 6, 'File'),
(8, 6, 'Date'),
(6, 6, 'Textarea'),
(4, 6, 'Text'),
(2, 6, 'Checkbox'),
(1, 6, 'Radio'),
(11, 5, 'Size'),
(12, 5, 'Delivery Date'),
(9, 6, 'Time'),
(10, 6, 'Date &amp; Time'),
(12, 6, 'Delivery Date'),
(11, 6, 'Size');

-- --------------------------------------------------------

--
-- Table structure for table `oc_option_value`
--

CREATE TABLE IF NOT EXISTS `oc_option_value` (
  `option_value_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_option_value`
--

INSERT INTO `oc_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES
(43, 1, '', 3),
(32, 1, '', 1),
(45, 2, '', 4),
(44, 2, '', 3),
(42, 5, '', 4),
(41, 5, '', 3),
(39, 5, '', 1),
(40, 5, '', 2),
(31, 1, '', 2),
(23, 2, '', 1),
(24, 2, '', 2),
(46, 11, '', 1),
(47, 11, '', 2),
(48, 11, '', 3);

-- --------------------------------------------------------

--
-- Table structure for table `oc_option_value_description`
--

CREATE TABLE IF NOT EXISTS `oc_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_option_value_description`
--

INSERT INTO `oc_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES
(24, 5, 2, 'Checkbox 2'),
(23, 5, 2, 'Checkbox 1'),
(40, 5, 5, 'Blue'),
(39, 5, 5, 'Red'),
(41, 5, 5, 'Green'),
(42, 5, 5, 'Yellow'),
(31, 5, 1, 'Medium'),
(44, 5, 2, 'Checkbox 3'),
(45, 5, 2, 'Checkbox 4'),
(32, 5, 1, 'Small'),
(43, 5, 1, 'Large'),
(43, 2, 1, 'Large'),
(32, 2, 1, 'Small'),
(45, 2, 2, 'Checkbox 4'),
(44, 2, 2, 'Checkbox 3'),
(31, 2, 1, 'Medium'),
(42, 2, 5, 'Yellow'),
(41, 2, 5, 'Green'),
(39, 2, 5, 'Red'),
(40, 2, 5, 'Blue'),
(23, 2, 2, 'Checkbox 1'),
(24, 2, 2, 'Checkbox 2'),
(48, 2, 11, 'Large'),
(47, 2, 11, 'Medium'),
(46, 2, 11, 'Small'),
(40, 6, 5, 'Blue'),
(39, 6, 5, 'Red'),
(41, 6, 5, 'Green'),
(42, 6, 5, 'Yellow'),
(31, 6, 1, 'Medium'),
(44, 6, 2, 'Checkbox 3'),
(45, 6, 2, 'Checkbox 4'),
(32, 6, 1, 'Small'),
(43, 6, 1, 'Large'),
(46, 5, 11, 'Small'),
(47, 5, 11, 'Medium'),
(48, 5, 11, 'Large'),
(23, 6, 2, 'Checkbox 1'),
(24, 6, 2, 'Checkbox 2'),
(48, 6, 11, 'Large'),
(47, 6, 11, 'Medium'),
(46, 6, 11, 'Small');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order`
--

CREATE TABLE IF NOT EXISTS `oc_order` (
  `order_id` int(11) NOT NULL,
  `invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `custom_field` text NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(40) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_custom_field` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(40) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_custom_field` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `marketing_id` int(11) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_order`
--

INSERT INTO `oc_order` (`order_id`, `invoice_no`, `invoice_prefix`, `store_id`, `store_name`, `store_url`, `customer_id`, `customer_group_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `custom_field`, `payment_firstname`, `payment_lastname`, `payment_company`, `payment_address_1`, `payment_address_2`, `payment_city`, `payment_postcode`, `payment_country`, `payment_country_id`, `payment_zone`, `payment_zone_id`, `payment_address_format`, `payment_custom_field`, `payment_method`, `payment_code`, `shipping_firstname`, `shipping_lastname`, `shipping_company`, `shipping_address_1`, `shipping_address_2`, `shipping_city`, `shipping_postcode`, `shipping_country`, `shipping_country_id`, `shipping_zone`, `shipping_zone_id`, `shipping_address_format`, `shipping_custom_field`, `shipping_method`, `shipping_code`, `comment`, `total`, `order_status_id`, `affiliate_id`, `commission`, `marketing_id`, `tracking`, `language_id`, `currency_id`, `currency_code`, `currency_value`, `ip`, `forwarded_ip`, `user_agent`, `accept_language`, `date_added`, `date_modified`) VALUES
(1, 0, 'HTC-2016-00', 0, 'Hydro Tools Corp', 'http://test/', 1, 1, 'buyer', 'htc', 'buyer@hydrotools.com', '780-224.8873', '', '', 'buyer', 'htc', 'htc', '8307 14 ave', '', 'edmonton', 't6k 1x3', 'Canada', 38, 'Alberta', 602, '', '[]', 'Cash On Delivery', 'cod', '', '', '', '', '', '', '', '', 0, '', 0, '', '[]', '', '', '', 125.0000, 0, 0, 0.0000, 0, '', 3, 2, 'USD', 1.00000000, '192.168.1.110', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-18 09:34:14', '2016-01-18 09:34:14'),
(2, 0, 'HTC-2016-00', 0, 'Hydro Tools Corp', 'http://test/', 1, 1, 'buyer', 'htc', 'buyer@hydrotools.com', '780-224.8873', '', '', 'buyer', 'htc', 'htc', '8307 14 ave', '', 'edmonton', 't6k 1x3', 'Canada', 38, 'Alberta', 602, '', '[]', 'PayPal', 'pp_standard', '', '', '', '', '', '', '', '', 0, '', 0, '', '[]', '', '', '', 125.0000, 0, 0, 0.0000, 0, '', 3, 2, 'USD', 1.00000000, '192.168.1.110', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-18 09:38:15', '2016-01-18 09:38:15'),
(3, 0, 'HTC-2016-00', 0, 'Hydro Tools Corp', 'http://test/', 1, 1, 'buyer', 'htc', 'buyer@hydrotools.com', '780-224.8873', '', '', 'buyer', 'htc', 'htc', '8307 14 ave', '', 'edmonton', 't6k 1x3', 'Canada', 38, 'Alberta', 602, '', '[]', 'PayPal', 'pp_standard', '', '', '', '', '', '', '', '', 0, '', 0, '', '[]', '', '', '', 1.0000, 0, 0, 0.0000, 0, '', 3, 2, 'USD', 1.00000000, '192.168.1.110', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-18 09:50:18', '2016-01-18 09:50:18'),
(4, 0, 'HTC-2016-00', 0, 'Hydro Tools Corp', 'http://test/', 1, 1, 'buyer', 'htc', 'buyer@hydrotools.com', '780-224.8873', '', '', 'buyer', 'htc', 'htc', '8307 14 ave', '', 'edmonton', 't6k 1x3', 'Canada', 38, 'Alberta', 602, '', '[]', 'PayPal', 'pp_standard', '', '', '', '', '', '', '', '', 0, '', 0, '', '[]', '', '', '', 1.0000, 0, 0, 0.0000, 0, '', 3, 2, 'USD', 1.00000000, '192.168.1.110', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-18 09:53:12', '2016-01-18 09:53:12'),
(5, 0, 'HTC-2016-00', 0, 'Hydro Tools Corp', 'http://test/', 1, 1, 'buyer', 'htc', 'buyer@hydrotools.com', '780-224.8873', '', '', 'buyer', 'htc', 'htc', '8307 14 ave', '', 'edmonton', 't6k 1x3', 'Canada', 38, 'Alberta', 602, '', '[]', 'PayPal', 'pp_standard', '', '', '', '', '', '', '', '', 0, '', 0, '', '[]', '', '', '', 125.0000, 0, 0, 0.0000, 0, '', 3, 2, 'USD', 1.00000000, '192.168.1.110', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-18 09:54:59', '2016-01-18 09:54:59'),
(7, 0, 'HTC-2016-00', 0, 'Hydro Tools Corp', 'http://test/', 2, 1, 'buyer', 'htc', 'webmaster-buyer@hydrotools.com', '780-2248873', '', '', 'buyer', 'htc', 'hydro tools', '8301 14 av', '', 'edmonton', 't6k', 'Canada', 38, 'Alberta', 602, '', '[]', 'PayPal Express Checkout', 'pp_express', 'buyer', 'htc', 'hydro tools', '8301 14 av', '', 'edmonton', 't6k', 'Canada', 38, 'Alberta', 602, '', '[]', 'Flat Shipping Rate', 'flat.flat', 'expensive shipping', 3475.0000, 0, 0, 0.0000, 0, '', 3, 4, 'CAD', 1.45360005, '192.168.1.110', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-18 11:08:57', '2016-01-18 11:08:57'),
(8, 0, 'HTC-2016-00', 0, 'Hydro Tools Corp', 'http://test/', 1, 1, 'buyer', 'htc', 'buyer@hydrotools.com', '780-224.8873', '', '', 'buyer', 'htc', 'htc', '8307 14 ave', '', 'edmonton', 't6k 1x3', 'Canada', 38, 'Alberta', 602, '', '[]', 'PayPal Express Checkout', 'pp_express', 'buyer', 'htc', 'htc', '8307 14 ave', '', 'edmonton', 't6k 1x3', 'Canada', 38, 'Alberta', 602, '', '[]', 'Flat Shipping Rate', 'flat.flat', '', 3302.5000, 7, 1, 163.8750, 0, '56a00c04ba242', 6, 4, 'CAD', 1.45070004, '192.168.1.110', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-20 15:44:12', '2016-01-20 15:44:59');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_custom_field`
--

CREATE TABLE IF NOT EXISTS `oc_order_custom_field` (
  `order_custom_field_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  `location` varchar(16) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_history`
--

CREATE TABLE IF NOT EXISTS `oc_order_history` (
  `order_history_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_order_history`
--

INSERT INTO `oc_order_history` (`order_history_id`, `order_id`, `order_status_id`, `notify`, `comment`, `date_added`) VALUES
(3, 8, 7, 0, '', '2016-01-20 15:44:59');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_option`
--

CREATE TABLE IF NOT EXISTS `oc_order_option` (
  `order_option_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_product`
--

CREATE TABLE IF NOT EXISTS `oc_order_product` (
  `order_product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_order_product`
--

INSERT INTO `oc_order_product` (`order_product_id`, `order_id`, `product_id`, `name`, `model`, `quantity`, `price`, `total`, `tax`, `reward`) VALUES
(1, 1, 54, 'HTC-ENG_HR', 'HTC-ENG_HR', 1, 125.0000, 125.0000, 0.0000, 0),
(2, 2, 54, 'HTC-ENG_HR', 'HTC-ENG_HR', 1, 125.0000, 125.0000, 0.0000, 0),
(3, 3, 55, 'HTC-SHOP_HR', 'HTC-SHOP_HR', 1, 1.0000, 1.0000, 0.0000, 0),
(4, 4, 55, 'HTC-SHOP_HR', 'HTC-SHOP_HR', 1, 1.0000, 1.0000, 0.0000, 0),
(5, 5, 54, 'HTC-ENG_HR', 'HTC-ENG_HR', 1, 125.0000, 125.0000, 0.0000, 0),
(7, 7, 53, 'Truck Mounted Power Unit', 'HTC-Bed-Mounted-PU-09', 1, 3450.0000, 3450.0000, 0.0000, 0),
(8, 8, 53, 'Truck Mounted Power Unit', 'HTC-Bed-Mounted-PU-09', 1, 3450.0000, 3450.0000, 0.0000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_recurring`
--

CREATE TABLE IF NOT EXISTS `oc_order_recurring` (
  `order_recurring_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `recurring_name` varchar(255) NOT NULL,
  `recurring_description` varchar(255) NOT NULL,
  `recurring_frequency` varchar(25) NOT NULL,
  `recurring_cycle` smallint(6) NOT NULL,
  `recurring_duration` smallint(6) NOT NULL,
  `recurring_price` decimal(10,4) NOT NULL,
  `trial` tinyint(1) NOT NULL,
  `trial_frequency` varchar(25) NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_recurring_transaction`
--

CREATE TABLE IF NOT EXISTS `oc_order_recurring_transaction` (
  `order_recurring_transaction_id` int(11) NOT NULL,
  `order_recurring_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_status`
--

CREATE TABLE IF NOT EXISTS `oc_order_status` (
  `order_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_order_status`
--

INSERT INTO `oc_order_status` (`order_status_id`, `language_id`, `name`) VALUES
(13, 5, 'Chargeback'),
(12, 5, 'Reversed'),
(11, 5, 'Refunded'),
(10, 5, 'Failed'),
(9, 5, 'Canceled Reversal'),
(8, 5, 'Denied'),
(5, 5, 'Complete'),
(7, 5, 'Canceled'),
(3, 5, 'Shipped'),
(2, 5, 'Processing'),
(2, 2, 'Processing'),
(3, 2, 'Shipped'),
(7, 2, 'Canceled'),
(5, 2, 'Complete'),
(8, 2, 'Denied'),
(9, 2, 'Canceled Reversal'),
(10, 2, 'Failed'),
(11, 2, 'Refunded'),
(12, 2, 'Reversed'),
(13, 2, 'Chargeback'),
(1, 2, 'Pending'),
(16, 2, 'Voided'),
(15, 2, 'Processed'),
(14, 2, 'Expired'),
(9, 6, 'Canceled Reversal'),
(8, 6, 'Denied'),
(5, 6, 'Complete'),
(7, 6, 'Canceled'),
(3, 6, 'Shipped'),
(2, 6, 'Processing'),
(14, 5, 'Expired'),
(15, 5, 'Processed'),
(16, 5, 'Voided'),
(1, 5, 'Pending'),
(10, 6, 'Failed'),
(11, 6, 'Refunded'),
(12, 6, 'Reversed'),
(13, 6, 'Chargeback'),
(1, 6, 'Pending'),
(16, 6, 'Voided'),
(15, 6, 'Processed'),
(14, 6, 'Expired');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_total`
--

CREATE TABLE IF NOT EXISTS `oc_order_total` (
  `order_total_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_order_total`
--

INSERT INTO `oc_order_total` (`order_total_id`, `order_id`, `code`, `title`, `value`, `sort_order`) VALUES
(1, 1, 'sub_total', 'Sub-Total', 125.0000, 1),
(2, 1, 'total', 'Total', 125.0000, 9),
(3, 2, 'sub_total', 'Sub-Total', 125.0000, 1),
(4, 2, 'total', 'Total', 125.0000, 9),
(5, 3, 'sub_total', 'Sub-Total', 1.0000, 1),
(6, 3, 'total', 'Total', 1.0000, 9),
(7, 4, 'sub_total', 'Sub-Total', 1.0000, 1),
(8, 4, 'total', 'Total', 1.0000, 9),
(9, 5, 'sub_total', 'Sub-Total', 125.0000, 1),
(10, 5, 'total', 'Total', 125.0000, 9),
(13, 7, 'sub_total', 'Sub-Total', 3450.0000, 1),
(14, 7, 'shipping', 'Flat Shipping Rate', 25.0000, 3),
(15, 7, 'total', 'Total', 3475.0000, 9),
(16, 8, 'sub_total', 'Sub-Total', 3450.0000, 1),
(17, 8, 'tracking_discount', 'Discount Provided by Our Affiliate', -172.5000, 2),
(18, 8, 'shipping', 'Flat Shipping Rate', 25.0000, 3),
(19, 8, 'total', 'Total', 3302.5000, 9);

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_voucher`
--

CREATE TABLE IF NOT EXISTS `oc_order_voucher` (
  `order_voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_paypal_order`
--

CREATE TABLE IF NOT EXISTS `oc_paypal_order` (
  `paypal_order_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `capture_status` enum('Complete','NotComplete') DEFAULT NULL,
  `currency_code` char(3) NOT NULL,
  `authorization_id` varchar(30) NOT NULL,
  `total` decimal(10,2) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_paypal_order`
--

INSERT INTO `oc_paypal_order` (`paypal_order_id`, `order_id`, `date_added`, `date_modified`, `capture_status`, `currency_code`, `authorization_id`, `total`) VALUES
(1, 6, '2016-01-18 10:23:29', '2016-01-18 10:23:29', 'Complete', 'USD', '7GW177406H244762M', 125.00),
(2, 8, '2016-01-20 15:44:59', '2016-01-20 15:44:59', 'Complete', 'CAD', '8SW02140AP6172159', 4790.94);

-- --------------------------------------------------------

--
-- Table structure for table `oc_paypal_order_transaction`
--

CREATE TABLE IF NOT EXISTS `oc_paypal_order_transaction` (
  `paypal_order_transaction_id` int(11) NOT NULL,
  `paypal_order_id` int(11) NOT NULL,
  `transaction_id` char(20) NOT NULL,
  `parent_transaction_id` char(20) NOT NULL,
  `date_added` datetime NOT NULL,
  `note` varchar(255) NOT NULL,
  `msgsubid` char(38) NOT NULL,
  `receipt_id` char(20) NOT NULL,
  `payment_type` enum('none','echeck','instant','refund','void') DEFAULT NULL,
  `payment_status` char(20) NOT NULL,
  `pending_reason` char(50) NOT NULL,
  `transaction_entity` char(50) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `debug_data` text NOT NULL,
  `call_data` text NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_paypal_order_transaction`
--

INSERT INTO `oc_paypal_order_transaction` (`paypal_order_transaction_id`, `paypal_order_id`, `transaction_id`, `parent_transaction_id`, `date_added`, `note`, `msgsubid`, `receipt_id`, `payment_type`, `payment_status`, `pending_reason`, `transaction_entity`, `amount`, `debug_data`, `call_data`) VALUES
(1, 1, '7GW177406H244762M', '', '2016-01-18 10:23:29', '', '', '', 'instant', 'Completed', 'None', 'payment', 125.00, '{"TOKEN":"EC-1ND34314YT7837411","SUCCESSPAGEREDIRECTREQUESTED":"false","TIMESTAMP":"2016-01-18T17:23:28Z","CORRELATIONID":"f5bb792acf564","ACK":"Success","VERSION":"109.0","BUILD":"18308778","INSURANCEOPTIONSELECTED":"false","SHIPPINGOPTIONISDEFAULT":"false","PAYMENTINFO_0_TRANSACTIONID":"7GW177406H244762M","PAYMENTINFO_0_TRANSACTIONTYPE":"cart","PAYMENTINFO_0_PAYMENTTYPE":"instant","PAYMENTINFO_0_ORDERTIME":"2016-01-18T17:23:28Z","PAYMENTINFO_0_AMT":"125.00","PAYMENTINFO_0_FEEAMT":"3.93","PAYMENTINFO_0_TAXAMT":"0.00","PAYMENTINFO_0_CURRENCYCODE":"USD","PAYMENTINFO_0_PAYMENTSTATUS":"Completed","PAYMENTINFO_0_PENDINGREASON":"None","PAYMENTINFO_0_REASONCODE":"None","PAYMENTINFO_0_PROTECTIONELIGIBILITY":"Ineligible","PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE":"None","PAYMENTINFO_0_SECUREMERCHANTACCOUNTID":"V948ACRFFPSZQ","PAYMENTINFO_0_ERRORCODE":"0","PAYMENTINFO_0_ACK":"Success"}', ''),
(2, 2, '8SW02140AP6172159', '', '2016-01-20 15:44:59', '', '', '', 'instant', 'Completed', 'None', 'payment', 4790.94, '{"TOKEN":"EC-2BA67236AR095770C","SUCCESSPAGEREDIRECTREQUESTED":"false","TIMESTAMP":"2016-01-20T22:44:59Z","CORRELATIONID":"733c1fabd7c43","ACK":"Success","VERSION":"109.0","BUILD":"18308778","INSURANCEOPTIONSELECTED":"false","SHIPPINGOPTIONISDEFAULT":"false","PAYMENTINFO_0_TRANSACTIONID":"8SW02140AP6172159","PAYMENTINFO_0_TRANSACTIONTYPE":"cart","PAYMENTINFO_0_PAYMENTTYPE":"instant","PAYMENTINFO_0_ORDERTIME":"2016-01-20T22:44:59Z","PAYMENTINFO_0_AMT":"4790.94","PAYMENTINFO_0_FEEAMT":"139.24","PAYMENTINFO_0_TAXAMT":"0.00","PAYMENTINFO_0_CURRENCYCODE":"CAD","PAYMENTINFO_0_PAYMENTSTATUS":"Completed","PAYMENTINFO_0_PENDINGREASON":"None","PAYMENTINFO_0_REASONCODE":"None","PAYMENTINFO_0_PROTECTIONELIGIBILITY":"Eligible","PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE":"ItemNotReceivedEligible,UnauthorizedPaymentEligible","PAYMENTINFO_0_SECUREMERCHANTACCOUNTID":"V948ACRFFPSZQ","PAYMENTINFO_0_ERRORCODE":"0","PAYMENTINFO_0_ACK":"Success"}', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product`
--

CREATE TABLE IF NOT EXISTS `oc_product` (
  `product_id` int(11) NOT NULL,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(17) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL DEFAULT '0000-00-00',
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `viewed` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product`
--

INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES
(55, 'HTC-SHOP_HR', 'HTC-SHOP_HR', '', '', '', '', '', '', 1, 8, 'catalog/HTC160x135.png', 13, 0, 75.0000, 0, 9, '2016-01-18', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 2, 0, 1, 1, 1, 1, '2016-01-18 09:49:07', '2016-01-19 16:26:44'),
(56, 'HTC-Precision_Worktable', 'HTC-Precision_Worktable', '', '', '', '', '', '', 1, 7, 'catalog/20120806_153609.jpg', 13, 1, 1490.0000, 0, 9, '2016-01-19', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 2, 1, 1, 1, 1, 3, '2016-01-19 16:23:04', '2016-01-19 16:55:34'),
(54, 'HTC-ENG_HR', 'HTC-ENG_HR', '', '', '', '', '', '', 1, 8, 'catalog/HTC160x135.png', 13, 0, 95.0000, 0, 9, '2016-01-18', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 2, 0, 1, 1, 1, 3, '2016-01-18 09:30:46', '2016-01-19 16:11:45'),
(51, '36919', 'trico-36919', '', '', '', '', '', '', 2, 6, 'catalog/Sampling-drum-kit-reservoir.jpg', 16, 1, 0.0000, 0, 9, '2016-01-17', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 2, 1, 1, 1, 1, 9, '2016-01-17 13:49:33', '2016-01-19 16:57:38'),
(52, 'Tri-Nado', 'roots-trinado-825', '', '', '', '', '', '', 0, 6, 'catalog/TriNado-Gallery Image 256x166.jpg', 12, 1, 9000.0000, 0, 9, '2016-01-17', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 2, 1, 1, 1, 1, 2, '2016-01-17 13:52:38', '2016-01-19 16:58:48'),
(53, 'HTC-Bed-Mounted-PU-09', 'HTC-Bed-Mounted-PU-09', '', '', '', '', '', '', 2, 6, 'catalog/20120724_210223.jpg', 13, 1, 3450.0000, 0, 9, '2016-01-17', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 2, 1, 1, 1, 1, 34, '2016-01-17 13:55:03', '2016-01-19 17:02:03'),
(50, 'HP28B01', 'stanley-hp28B02', '', '', '', '', '', '', 0, 6, 'catalog/Twin-8.png', 15, 1, 0.0000, 0, 9, '2016-01-17', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 2, 1, 1, 1, 1, 40, '2016-01-17 13:39:07', '2016-01-19 16:56:54');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_attribute`
--

CREATE TABLE IF NOT EXISTS `oc_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_description`
--

CREATE TABLE IF NOT EXISTS `oc_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_description`
--

INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(56, 6, 'HTC-Precision_Worktable', '&lt;p&gt;Mobile precision worktable. Easy to set-up jigs for welding, cutting or other heavy duty jobs in minutes. load max 400 Lbs&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'rentals, shop tools', 'HTC-Precision_Worktable', '', ''),
(56, 5, 'HTC-Precision_Worktable', '&lt;p&gt;Mesa de trabajos de precision. 3/8&quot; con patron de agujeros de 1/2&quot; x 2&quot; x 2&quot; para facil aplicacion. Resite 400 libras de peso&lt;/p&gt;', '', 'HTC-Precision_Worktable', '', ''),
(56, 2, 'HTC-Precision_Worktable', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'HTC-Precision_Worktable', '', ''),
(50, 5, 'Fuente de Poder- Stanley HP28', '&lt;h3 class=&quot;model-number&quot;&gt;HP28B02&lt;/h3&gt;&lt;div class=&quot;field field-name-body field-type-text-with-summary field-label-hidden&quot;&gt;&lt;div class=&quot;field-items&quot;&gt;&lt;div class=&quot;field-item even&quot; property=&quot;content:encoded&quot;&gt;&lt;br&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', 'hydraulic', 'Power Unit - HP28', '', 'hydraulic, power unit, mobile equipment'),
(50, 2, 'Power Unit - HP28', '&lt;h3 class=&quot;model-number&quot; style=&quot;font-family: ''Open Sans'', sans-serif; color: rgb(102, 102, 102);&quot;&gt;HP28B02&lt;/h3&gt;&lt;div class=&quot;field field-name-body field-type-text-with-summary field-label-hidden&quot; style=&quot;line-height: 17.1428px;&quot;&gt;&lt;div class=&quot;field-items&quot;&gt;&lt;div class=&quot;field-item even&quot; property=&quot;content:encoded&quot;&gt;The HP28 (TWIN8) twin circuit hydraulic power unit offers a&amp;nbsp;&lt;span style=&quot;line-height: 1.53em;&quot;&gt;revolutionary design capable of operating two tools at 8 gpm&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;line-height: 1.53em;&quot;&gt;simultaneously. For the first time running two hydraulic tools at full 8&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;line-height: 1.53em;&quot;&gt;gpm capacity is a reality, increasing productivity and versatility like&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;line-height: 1.53em;&quot;&gt;never before. Experience how the HP28 will change the way hydraulic&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;line-height: 1.53em;&quot;&gt;tools are used and JOIN THE REVOLUTION!&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;line-height: 1.53em;&quot;&gt;Each of the two circuits is optimized to deliver ideal flows and&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;line-height: 1.53em;&quot;&gt;pressures to both Type 1 and Type 2 hydraulic tools.&lt;/span&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;p style=&quot;line-height: 17.1428px;&quot;&gt;&lt;/p&gt;&lt;div class=&quot;field field-name-field-features field-type-text-long field-label-above&quot; style=&quot;line-height: 17.1428px;&quot;&gt;&lt;div class=&quot;field-label&quot;&gt;Features:&amp;nbsp;&lt;/div&gt;&lt;div class=&quot;field-items&quot;&gt;&lt;div class=&quot;field-item even&quot;&gt;&lt;ul&gt;&lt;li&gt;ATM Technology:&amp;nbsp;&lt;span style=&quot;line-height: 1.53em;&quot;&gt;Active Thermal Management (ATM) optimizes performance in extreme weather conditions.&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;line-height: 1.53em;&quot;&gt;By managing oil temperatures, preheat time is decreased and tool runtime increases.&lt;/span&gt;&lt;/li&gt;&lt;li&gt;Side Handles:&amp;nbsp;&lt;span style=&quot;line-height: 1.53em;&quot;&gt;New side handles improve ease of lifting the unit while adding side impact protection&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;line-height: 1.53em;&quot;&gt;and with no moving parts to wear or corrode.&lt;/span&gt;&lt;/li&gt;&lt;li&gt;Solid Tires:&amp;nbsp;&lt;span style=&quot;line-height: 1.53em;&quot;&gt;Eliminates the need to refill flat tires and decreases pull force needed for maneuvering.&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;line-height: 1.53em;&quot;&gt;Tough Grip Multi Position Handle: Special Tough Grip handle surface improves&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;line-height: 1.53em;&quot;&gt;comfort and control with increased durability.&lt;/span&gt;&lt;/li&gt;&lt;li&gt;Lifting Hook&lt;/li&gt;&lt;/ul&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '', 'Power Unit - HP28', '', ''),
(51, 5, 'Respirador de Aceite con puerto toma-muestra', '&lt;div itemprop=&quot;description&quot;&gt;\r\n	&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;/div&gt;', 'Breather, Lubrication', 'Reservoir Breather Kit with Sample Port', 'Reservoir Breather Kit with Sample Port', 'Reservoir Breather Kit with Sample Port'),
(51, 2, 'Reservoir Breather Kit with Sample Port', '&lt;p style=&quot;line-height: 17.1428px;&quot;&gt;Because airborne contaminants can quickly disrupt and negate your sample, Trico offers specially designed Reservoir Breather Kits. These kits feature a two-stage breather system that utilizes a filter to block airborne particles and desiccant to remove, harmful, unwanted moisture. The system ensures a permanent closure on all hydraulic reservoirs and makes sure the lubricating fluid remains closed off from airborne contamination throughout the sampling process.&lt;/p&gt;&lt;p style=&quot;line-height: 17.1428px;&quot;&gt;An optional filter reminder vacuum gauge can be used to indicate when the filter element on the breather has become clogged and needs replacing.&lt;/p&gt;&lt;p style=&quot;line-height: 17.1428px;&quot;&gt;A male quick connect can be plumbed to the 6-bolt adapter plate (this plate replaces the standard filler/breather cap) to fit a down pipe for filling reservoirs with new oil through a filter cart without opening the system to the environment.&lt;/p&gt;&lt;p style=&quot;line-height: 17.1428px;&quot;&gt;For static sampling of the oil from the system reservoir, the 6-bolt adapter plate incorporates a sample port connected to a sample tube. The tube conveniently extends to the middle of the fluid level in the system reservoir to allow samples to be taken from the exact location inside the system every time.&lt;/p&gt;', '', 'Reservoir Breather Kit with Sample Port', '', ''),
(52, 5, 'Ventilador para camiones de aspiracion', '&lt;p style=&quot;line-height: 17.1428px;&quot;&gt;&lt;span style=&quot;line-height: 1.42857;&quot;&gt;The Roots TRI-NADO™ TM Truck-Mount, Tri-Lobe Vacuum Blowers have been redesigned to incorporate the latest technology for reduced noise and vibration. These features include:&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 17.1428px;&quot;&gt;&lt;br&gt;• Cast-Foot Design for Reduced Vibration&lt;br&gt;• Stronger Construction for Minimum Noise and Vibration&lt;br&gt;• Progressive Chamber Design That Reduces Noise and&lt;br&gt;Features Cooler Operation.&lt;br&gt;&lt;br&gt;&lt;strong&gt;Casing&lt;/strong&gt;&amp;nbsp;- The casing is of one piece close-grained cast iron construction. The casing is heavily ribbed to prevent distortion under the most severe operating conditions and incorporates the ROOTS™ WHISPAIR™ feature for reduced pulsation, horsepower and noise levels.&lt;br&gt;&lt;br&gt;&lt;strong&gt;Impellers&lt;/strong&gt;&amp;nbsp;- The closed-end impellers are made from ductile iron with high tensile strength, and operate without liquid&lt;br&gt;sealing or lubrication.&lt;br&gt;&lt;br&gt;&lt;strong&gt;Shafts&lt;/strong&gt;&amp;nbsp;- The shafts are 3” diameter alloy steel forgings flange connected to the impeller body.&lt;br&gt;&lt;br&gt;&lt;strong&gt;Timing Gears&lt;/strong&gt;&amp;nbsp;- The impellers are timed by a pair of alloy steel spur gears that operate in an oil bath.&lt;/p&gt;', 'blowers', 'Truck mounted blowers', 'Truck mounted blowers', 'Truck mounted blowers'),
(52, 2, 'Truck mounted blowers', '&lt;p style=&quot;line-height: 17.1428px;&quot;&gt;&lt;span style=&quot;line-height: 1.42857;&quot;&gt;The Roots TRI-NADO™ TM Truck-Mount, Tri-Lobe Vacuum Blowers have been redesigned to incorporate the latest technology for reduced noise and vibration. These features include:&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 17.1428px;&quot;&gt;&lt;br&gt;• Cast-Foot Design for Reduced Vibration&lt;br&gt;• Stronger Construction for Minimum Noise and Vibration&lt;br&gt;• Progressive Chamber Design That Reduces Noise and&lt;br&gt;Features Cooler Operation.&lt;br&gt;&lt;br&gt;&lt;strong&gt;Casing&lt;/strong&gt;&amp;nbsp;- The casing is of one piece close-grained cast iron construction. The casing is heavily ribbed to prevent distortion under the most severe operating conditions and incorporates the ROOTS™ WHISPAIR™ feature for reduced pulsation, horsepower and noise levels.&lt;br&gt;&lt;br&gt;&lt;strong&gt;Impellers&lt;/strong&gt;&amp;nbsp;- The closed-end impellers are made from ductile iron with high tensile strength, and operate without liquid&lt;br&gt;sealing or lubrication.&lt;br&gt;&lt;br&gt;&lt;strong&gt;Shafts&lt;/strong&gt;&amp;nbsp;- The shafts are 3” diameter alloy steel forgings flange connected to the impeller body.&lt;br&gt;&lt;br&gt;&lt;strong&gt;Timing Gears&lt;/strong&gt;&amp;nbsp;- The impellers are timed by a pair of alloy steel spur gears that operate in an oil bath.&lt;br&gt;&lt;br&gt;&lt;strong&gt;Bearings&lt;/strong&gt;&amp;nbsp;- The impeller/shaft assemblies are supported at each end by antifriction bearings.&lt;br&gt;&lt;br&gt;&lt;strong&gt;Lubrication&lt;/strong&gt;&amp;nbsp;- A patented jet spray oil slinger system provides lubrication to gears and bearings.&lt;/p&gt;', '', 'Truck mounted blowers', '', ''),
(53, 5, 'Sistema Hidráulico para camiones', '&lt;p&gt;Sistema complete de potencia hidráulica que incluye: Bomba, reservorio y válvula de control y conexiones de acceso rápido para herramientas removibles hasta 9 gpm @ 200 psig&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'power unit, hydraulic', 'Truck Mounted Power Unit', 'Truck Mounted Power Unit', 'Truck Mounted Power Unit'),
(53, 2, 'Truck Mounted Power Unit', '&lt;p&gt;Space Saver Power Unit. If you got driving to your work the tools \r\nwill work. Period. Power unit work with truck engine stationary or \r\ndriving. It crank with a remote control on-off plus control valve will \r\nregulate from 0-9 GPM @ 2000 PSIg max&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'Truck Mounted Power Unit', '', ''),
(55, 5, 'HTC-SHOP_HR', '&lt;p&gt;General Rate for our Shop Hour&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'repairs, shop', 'General Rate for our Shop Hour', 'General Rate for our Shop Hour', 'General Rate for our Shop Hour'),
(55, 2, 'HTC-SHOP_HR', '&lt;p&gt;General Rate for our Shop Hour&lt;/p&gt;', '', 'General Rate for our Shop Hour', '', ''),
(50, 6, 'Power Unit - HP28', '&lt;h3 class=&quot;model-number&quot;&gt;HP28B02&lt;/h3&gt;&lt;div class=&quot;field field-name-body field-type-text-with-summary field-label-hidden&quot;&gt;&lt;div class=&quot;field-items&quot;&gt;&lt;div class=&quot;field-item even&quot; property=&quot;content:encoded&quot;&gt;&lt;div&gt;The HP28 (TWIN8) twin circuit hydraulic power unit offers a&amp;nbsp;&lt;span style=&quot;line-height: 1.53em&quot;&gt;revolutionary design capable of operating two tools at 8 gpm&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;line-height: 1.53em&quot;&gt;simultaneously. For the first time running two hydraulic tools at full 8&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;line-height: 1.53em&quot;&gt;gpm capacity is a reality, increasing productivity and versatility like&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;line-height: 1.53em&quot;&gt;never before. Experience how the HP28 will change the way hydraulic&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;line-height: 1.53em&quot;&gt;tools are used and JOIN THE REVOLUTION!&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;line-height: 1.53em&quot;&gt;Each of the two circuits is optimized to deliver ideal flows and&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;line-height: 1.53em&quot;&gt;pressures to both Type 1 and Type 2 hydraulic tools.&lt;/span&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;p&gt;\r\n&lt;/p&gt;&lt;div class=&quot;field field-name-field-features field-type-text-long field-label-above&quot;&gt;&lt;div class=&quot;field-label&quot;&gt;Features:&amp;nbsp;&lt;/div&gt;&lt;div class=&quot;field-items&quot;&gt;&lt;div class=&quot;field-item even&quot;&gt;&lt;ul&gt;&lt;li&gt;ATM Technology:&amp;nbsp;&lt;span style=&quot;line-height: 1.53em&quot;&gt;Active Thermal Management (ATM) optimizes performance in extreme weather conditions.&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;line-height: 1.53em&quot;&gt;By managing oil temperatures, preheat time is decreased and tool runtime increases.&lt;/span&gt;&lt;/li&gt;\r\n&lt;li&gt;Side Handles:&amp;nbsp;&lt;span style=&quot;line-height: 1.53em&quot;&gt;New side handles improve ease of lifting the unit while adding side impact protection&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;line-height: 1.53em&quot;&gt;and with no moving parts to wear or corrode.&lt;/span&gt;&lt;/li&gt;\r\n&lt;li&gt;Solid Tires:&amp;nbsp;&lt;span style=&quot;line-height: 1.53em&quot;&gt;Eliminates the need to refill flat tires and decreases pull force needed for maneuvering.&lt;/span&gt;&lt;/li&gt;\r\n&lt;li&gt;&lt;span style=&quot;line-height: 1.53em&quot;&gt;Tough Grip Multi Position Handle: Special Tough Grip handle surface improves&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;line-height: 1.53em&quot;&gt;comfort and control with increased durability.&lt;/span&gt;&lt;/li&gt;\r\n&lt;li&gt;Lifting Hook&lt;/li&gt;&lt;/ul&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', 'hydraulic', 'Power Unit - HP28', '', 'hydraulic, power unit, mobile equipment'),
(51, 6, 'Reservoir Breather Kit with Sample Port', '&lt;div itemprop=&quot;description&quot;&gt;\r\n	&lt;p&gt;Because airborne contaminants can quickly disrupt and negate your \r\nsample, Trico offers specially designed Reservoir Breather Kits. These \r\nkits feature a two-stage breather system that utilizes a filter to block\r\n airborne particles and desiccant to remove, harmful, unwanted moisture.\r\n The system ensures a permanent closure on all hydraulic reservoirs and \r\nmakes sure the lubricating fluid remains closed off from airborne \r\ncontamination throughout the sampling process.&lt;/p&gt;\r\n&lt;p&gt;An optional filter reminder vacuum gauge can be used to indicate when\r\n the filter element on the breather has become clogged and needs \r\nreplacing.&lt;/p&gt;\r\n&lt;p&gt;A male quick connect can be plumbed to the 6-bolt adapter plate (this\r\n plate replaces the standard filler/breather cap) to fit a down pipe for\r\n filling reservoirs with new oil through a filter cart without opening \r\nthe system to the environment.&lt;/p&gt;\r\n&lt;p&gt;For static sampling of the oil from the system reservoir, the 6-bolt \r\nadapter plate incorporates a sample port connected to a sample tube. The\r\n tube conveniently extends to the middle of the fluid level in the \r\nsystem reservoir to allow samples to be taken from the exact location \r\ninside the system every time.&lt;/p&gt;&lt;/div&gt;', 'Breather, Lubrication', 'Reservoir Breather Kit with Sample Port', 'Reservoir Breather Kit with Sample Port', 'Reservoir Breather Kit with Sample Port'),
(52, 6, 'Truck mounted blowers', '&lt;p&gt;&lt;span style=&quot;line-height: 1.42857;&quot;&gt;The Roots TRI-NADO™ TM Truck-Mount, Tri-Lobe Vacuum Blowers have \r\nbeen redesigned to incorporate the latest technology for reduced noise \r\nand vibration. These features include:&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;\r\n&lt;br&gt;\r\n• Cast-Foot Design for Reduced Vibration&lt;br&gt;\r\n• Stronger Construction for Minimum Noise and Vibration&lt;br&gt;\r\n• Progressive Chamber Design That Reduces Noise and&lt;br&gt;\r\nFeatures Cooler Operation.&lt;br&gt;\r\n&lt;br&gt;\r\n&lt;strong&gt;Casing&lt;/strong&gt; - The casing is of one piece close-grained cast \r\niron construction. The casing is heavily ribbed to prevent distortion \r\nunder the most severe operating conditions and incorporates the ROOTS™ \r\nWHISPAIR™ feature for reduced pulsation, horsepower and noise levels.&lt;br&gt;\r\n&lt;br&gt;\r\n&lt;strong&gt;Impellers&lt;/strong&gt; - The closed-end impellers are made from ductile iron with high tensile strength, and operate without liquid&lt;br&gt;\r\nsealing or lubrication.&lt;br&gt;\r\n&lt;br&gt;\r\n&lt;strong&gt;Shafts&lt;/strong&gt; - The shafts are 3” diameter alloy steel forgings flange connected to the impeller body.&lt;br&gt;\r\n&lt;br&gt;\r\n&lt;strong&gt;Timing Gears&lt;/strong&gt; - The impellers are timed by a pair of alloy steel spur gears that operate in an oil bath.&lt;br&gt;\r\n&lt;br&gt;\r\n&lt;strong&gt;Bearings&lt;/strong&gt; - The impeller/shaft assemblies are supported at each end by antifriction bearings.&lt;br&gt;\r\n&lt;br&gt;\r\n&lt;strong&gt;Lubrication&lt;/strong&gt; - A patented jet spray oil slinger system provides lubrication to gears and bearings.&lt;/p&gt;', 'blowers', 'Truck mounted blowers', 'Truck mounted blowers', 'Truck mounted blowers'),
(53, 6, 'Truck Mounted Power Unit', '&lt;p&gt;Space Saver Power Unit. If you got driving to your work the tools \r\nwill work. Period. Power unit work with truck engine stationary or \r\ndriving. It crank with a remote control on-off plus control valve will \r\nregulate from 0-9 GPM @ 2000 PSIg max&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'power unit, hydraulic', 'Truck Mounted Power Unit', 'Truck Mounted Power Unit', 'Truck Mounted Power Unit'),
(55, 6, 'HTC-SHOP_HR', '&lt;p&gt;General Rate for our Shop Hour&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'repairs, shop', 'General Rate for our Shop Hour', 'General Rate for our Shop Hour', 'General Rate for our Shop Hour'),
(54, 6, 'HTC-ENG_HR', '&lt;p&gt;HTC-ENG_HR&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;', '', 'HTC-ENG_HR', '', ''),
(54, 5, 'HTC-ENG_HR', '&lt;p&gt;Valor de la hora de Ingenieria&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;', '', 'HTC-ENG_HR', '', ''),
(54, 2, 'HTC-ENG_HR', '&lt;p&gt;HTC-ENG_HR&lt;br&gt;&lt;/p&gt;', '', 'HTC-ENG_HR', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_discount`
--

CREATE TABLE IF NOT EXISTS `oc_product_discount` (
  `product_discount_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM AUTO_INCREMENT=441 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_filter`
--

CREATE TABLE IF NOT EXISTS `oc_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_image`
--

CREATE TABLE IF NOT EXISTS `oc_product_image` (
  `product_image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=2370 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_image`
--

INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES
(2368, 53, 'catalog/IMG_1995.jpg', 2),
(2369, 53, 'catalog/IMG_1989.jpg', 3),
(2367, 53, 'catalog/IMG_1990.jpg', 1),
(2366, 51, 'catalog/reservoir_1-90x90.jpg', 0),
(2365, 50, 'catalog/Twin8_app.png', 3),
(2364, 50, 'catalog/twin8_4.png', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_option`
--

CREATE TABLE IF NOT EXISTS `oc_product_option` (
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=227 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_option_value`
--

CREATE TABLE IF NOT EXISTS `oc_product_option_value` (
  `product_option_value_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_recurring`
--

CREATE TABLE IF NOT EXISTS `oc_product_recurring` (
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_related`
--

CREATE TABLE IF NOT EXISTS `oc_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_related`
--

INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES
(50, 53),
(53, 50);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_reward`
--

CREATE TABLE IF NOT EXISTS `oc_product_reward` (
  `product_reward_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=546 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_special`
--

CREATE TABLE IF NOT EXISTS `oc_product_special` (
  `product_special_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM AUTO_INCREMENT=442 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_special`
--

INSERT INTO `oc_product_special` (`product_special_id`, `product_id`, `customer_group_id`, `priority`, `price`, `date_start`, `date_end`) VALUES
(441, 52, 1, 0, 6500.0000, '2016-01-18', '2016-01-29');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_category`
--

CREATE TABLE IF NOT EXISTS `oc_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_to_category`
--

INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES
(50, 88),
(51, 78),
(52, 61),
(52, 90),
(53, 66),
(53, 88),
(54, 71),
(55, 73),
(56, 69);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_download`
--

CREATE TABLE IF NOT EXISTS `oc_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_layout`
--

CREATE TABLE IF NOT EXISTS `oc_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_to_layout`
--

INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES
(50, 0, 0),
(51, 0, 0),
(52, 0, 0),
(53, 0, 0),
(54, 0, 0),
(55, 0, 0),
(56, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_to_store`
--

INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES
(50, 0),
(51, 0),
(52, 0),
(53, 0),
(54, 0),
(55, 0),
(56, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_recurring`
--

CREATE TABLE IF NOT EXISTS `oc_recurring` (
  `recurring_id` int(11) NOT NULL,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int(10) unsigned NOT NULL,
  `cycle` int(10) unsigned NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int(10) unsigned NOT NULL,
  `trial_cycle` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_recurring_description`
--

CREATE TABLE IF NOT EXISTS `oc_recurring_description` (
  `recurring_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_return`
--

CREATE TABLE IF NOT EXISTS `oc_return` (
  `return_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text,
  `date_ordered` date NOT NULL DEFAULT '0000-00-00',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_action`
--

CREATE TABLE IF NOT EXISTS `oc_return_action` (
  `return_action_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_return_action`
--

INSERT INTO `oc_return_action` (`return_action_id`, `language_id`, `name`) VALUES
(3, 5, 'Replacement Sent'),
(2, 5, 'Credit Issued'),
(1, 5, 'Refunded'),
(1, 2, 'Refunded'),
(2, 2, 'Credit Issued'),
(3, 2, 'Replacement Sent'),
(2, 6, 'Credit Issued'),
(1, 6, 'Refunded'),
(3, 6, 'Replacement Sent');

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_history`
--

CREATE TABLE IF NOT EXISTS `oc_return_history` (
  `return_history_id` int(11) NOT NULL,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_reason`
--

CREATE TABLE IF NOT EXISTS `oc_return_reason` (
  `return_reason_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_return_reason`
--

INSERT INTO `oc_return_reason` (`return_reason_id`, `language_id`, `name`) VALUES
(4, 5, 'Faulty, please supply details'),
(3, 5, 'Order Error'),
(2, 5, 'Received Wrong Item'),
(1, 5, 'Dead On Arrival'),
(1, 2, 'Dead On Arrival'),
(2, 2, 'Received Wrong Item'),
(3, 2, 'Order Error'),
(4, 2, 'Faulty, please supply details'),
(5, 2, 'Other, please supply details'),
(3, 6, 'Order Error'),
(2, 6, 'Received Wrong Item'),
(1, 6, 'Dead On Arrival'),
(5, 5, 'Other, please supply details'),
(4, 6, 'Faulty, please supply details'),
(5, 6, 'Other, please supply details');

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_status`
--

CREATE TABLE IF NOT EXISTS `oc_return_status` (
  `return_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_return_status`
--

INSERT INTO `oc_return_status` (`return_status_id`, `language_id`, `name`) VALUES
(2, 5, 'Awaiting Products'),
(3, 5, 'Complete'),
(1, 5, 'Pending'),
(1, 2, 'Pending'),
(3, 2, 'Complete'),
(2, 2, 'Awaiting Products'),
(3, 6, 'Complete'),
(1, 6, 'Pending'),
(2, 6, 'Awaiting Products');

-- --------------------------------------------------------

--
-- Table structure for table `oc_review`
--

CREATE TABLE IF NOT EXISTS `oc_review` (
  `review_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_setting`
--

CREATE TABLE IF NOT EXISTS `oc_setting` (
  `setting_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=1491 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_setting`
--

INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES
(1, 0, 'shipping', 'shipping_sort_order', '3', 0),
(2, 0, 'sub_total', 'sub_total_sort_order', '1', 0),
(3, 0, 'sub_total', 'sub_total_status', '1', 0),
(4, 0, 'tax', 'tax_status', '1', 0),
(5, 0, 'total', 'total_sort_order', '9', 0),
(6, 0, 'total', 'total_status', '1', 0),
(7, 0, 'tax', 'tax_sort_order', '5', 0),
(8, 0, 'free_checkout', 'free_checkout_sort_order', '1', 0),
(9, 0, 'cod', 'cod_sort_order', '5', 0),
(10, 0, 'cod', 'cod_total', '0.01', 0),
(11, 0, 'cod', 'cod_order_status_id', '1', 0),
(12, 0, 'cod', 'cod_geo_zone_id', '0', 0),
(13, 0, 'cod', 'cod_status', '1', 0),
(14, 0, 'shipping', 'shipping_status', '1', 0),
(15, 0, 'shipping', 'shipping_estimator', '1', 0),
(27, 0, 'coupon', 'coupon_sort_order', '4', 0),
(28, 0, 'coupon', 'coupon_status', '1', 0),
(1100, 0, 'flat', 'flat_sort_order', '1', 0),
(1099, 0, 'flat', 'flat_status', '1', 0),
(1098, 0, 'flat', 'flat_geo_zone_id', '0', 0),
(1097, 0, 'flat', 'flat_tax_class_id', '9', 0),
(1096, 0, 'flat', 'flat_cost', '25.00', 0),
(42, 0, 'credit', 'credit_sort_order', '7', 0),
(43, 0, 'credit', 'credit_status', '1', 0),
(53, 0, 'reward', 'reward_sort_order', '2', 0),
(54, 0, 'reward', 'reward_status', '1', 0),
(146, 0, 'category', 'category_status', '1', 0),
(158, 0, 'account', 'account_status', '1', 0),
(1446, 0, 'tracking_input', 'tracking_input_redirect', '0', 0),
(1432, 0, 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai''hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', 0),
(1433, 0, 'config', 'config_compression', '0', 0),
(1434, 0, 'config', 'config_secure', '0', 0),
(1435, 0, 'config', 'config_password', '1', 0),
(1436, 0, 'config', 'config_shared', '0', 0),
(1437, 0, 'config', 'config_encryption', 'ycy6bdNJUafQJnYX4ct6YKq92pPg1b30XaMNrw2Xo5VCV2amTQ2v7hj9nT51P6bAptHx3i1cDe2m4UkpjQzXpMH6NHvzHx1LFRnq0L0MQSQdxnkYi1Q7N8JwhEnpjLQjCr0EQnQ2WoZ8GwvJauhpeqFFjnIzVE4YQsRL5n51owbOhjVupZUZfn5R9qJL5qr3BU3J3RYwcQamM312QDDfXARty2Hut1ELdy8PGBtZ46gZKsRhJF1f7nHMJv03FHkBrzYDWl95GQYrcEuVSspG4I2DbRro3vpapIdhfT24hM8x1f4l0FIkD1tYU5zTE76yjfZpqjosHUmS2omiKln8BgN3oJpZst49An40oznxCWfULyHdcHfxlssHkR0rV00EUbrRUKtmPKKWZYpqrHKH8q88iXLok74JrbNLqm3pPIdDEGad3nAAKV1FzzEqqZ05HJOjxmFRMv2NXbWxqnLyhQzDQc5Lc2bqZHXDbO241gfmrJlmdIbVJIYOJoSGqTO366DBqyfBB0KKMciAvaFStaokcR1dUdoGdE9zCwSt9e3w6JnNlmd8tH8zuvpwp83RMlnytax0Y7RUqhAdcE4yri01vzJhugY6SZloFmTVaIrAsmsW5AsRxGKZMM56Y9BBJENRsr06bUpNg69ajQAnUn15xpAot8c8Z0fy9XJMmWQ4BrkYKk6bsLlSQnUX3qOeeOMhufiJDKMDNZI6GfQIbZM19EW0Id04bxbwi4YpleamUvRgqbD1oC76Gjtpoknj8RlLJsohWIpix8DL45LhOsLY7vPdL0mnZsIjR0rscfgOMCjVgItNjYD3tWNpmdGyUQf3kwDCPMPCNIq6qdkBi8kEMqtwvtCNqE3A2HSRpNKjaDGf8zDbmZaeMfL0dLn3EBTKJs7hLPGLiBjlRpVFSoWG0Feq4qyfGTECiM7vBJ8TeCzC1Mz2HJ4l2oO4iPAzBXjde8Nc4G2vnAnjkalm54lgLTgfDDbq1tAVdeQvtQXlys1y1Lt7pMQkG48etszG', 0),
(1101, 0, 'basic_captcha', 'basic_captcha_status', '1', 0),
(1095, 0, 'pp_standard', 'pp_standard_voided_status_id', '7', 0),
(1438, 0, 'config', 'config_file_max_size', '900000', 0),
(1439, 0, 'config', 'config_file_ext_allowed', 'zip\r\ntxt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc', 0),
(1094, 0, 'pp_standard', 'pp_standard_reversed_status_id', '7', 0),
(1441, 0, 'config', 'config_error_display', '1', 0),
(1442, 0, 'config', 'config_error_log', '1', 0),
(1443, 0, 'config', 'config_error_filename', 'HTC_error.log', 0),
(94, 0, 'voucher', 'voucher_sort_order', '8', 0),
(95, 0, 'voucher', 'voucher_status', '1', 0),
(1440, 0, 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\n&quot;application/zip&quot;\r\napplication/x-zip\r\n&quot;application/x-zip&quot;\r\napplication/x-zip-compressed\r\n&quot;application/x-zip-compressed&quot;\r\napplication/rar\r\n&quot;application/rar&quot;\r\napplication/x-rar\r\n&quot;application/x-rar&quot;\r\napplication/x-rar-compressed\r\n&quot;application/x-rar-compressed&quot;\r\napplication/octet-stream\r\n&quot;application/octet-stream&quot;\r\naudio/mpeg\r\nvideo/quicktime\r\napplication/pdf', 0),
(103, 0, 'free_checkout', 'free_checkout_status', '1', 0),
(104, 0, 'free_checkout', 'free_checkout_order_status_id', '1', 0),
(1431, 0, 'config', 'config_seo_url', '0', 0),
(1430, 0, 'config', 'config_maintenance', '0', 0),
(1428, 0, 'config', 'config_mail_smtp_timeout', '5', 0),
(1429, 0, 'config', 'config_mail_alert', 'pedrocones@gmail.com', 0),
(1427, 0, 'config', 'config_mail_smtp_port', '26', 0),
(1426, 0, 'config', 'config_mail_smtp_password', 'Web867502!', 0),
(1425, 0, 'config', 'config_mail_smtp_username', 'webmaster@hydrotools.com', 0),
(1424, 0, 'config', 'config_mail_smtp_hostname', 'mail.hydrotools.com', 0),
(1423, 0, 'config', 'config_mail_parameter', '-Fwebmaster@hydrotools.com', 0),
(1422, 0, 'config', 'config_mail_protocol', 'mail', 0),
(1421, 0, 'config', 'config_ftp_status', '0', 0),
(1420, 0, 'config', 'config_ftp_root', '', 0),
(1419, 0, 'config', 'config_ftp_password', '', 0),
(1417, 0, 'config', 'config_ftp_port', '21', 0),
(1418, 0, 'config', 'config_ftp_username', '', 0),
(1416, 0, 'config', 'config_ftp_hostname', 'test', 0),
(1415, 0, 'config', 'config_image_location_height', '50', 0),
(1414, 0, 'config', 'config_image_location_width', '268', 0),
(1412, 0, 'config', 'config_image_cart_width', '47', 0),
(1413, 0, 'config', 'config_image_cart_height', '47', 0),
(1411, 0, 'config', 'config_image_wishlist_height', '47', 0),
(1410, 0, 'config', 'config_image_wishlist_width', '47', 0),
(1409, 0, 'config', 'config_image_compare_height', '90', 0),
(1408, 0, 'config', 'config_image_compare_width', '90', 0),
(1407, 0, 'config', 'config_image_related_height', '80', 0),
(1406, 0, 'config', 'config_image_related_width', '80', 0),
(1405, 0, 'config', 'config_image_additional_height', '74', 0),
(1404, 0, 'config', 'config_image_additional_width', '74', 0),
(1403, 0, 'config', 'config_image_product_height', '228', 0),
(1402, 0, 'config', 'config_image_product_width', '228', 0),
(1401, 0, 'config', 'config_image_popup_height', '500', 0),
(1400, 0, 'config', 'config_image_popup_width', '500', 0),
(1399, 0, 'config', 'config_image_thumb_height', '228', 0),
(1398, 0, 'config', 'config_image_thumb_width', '228', 0),
(1397, 0, 'config', 'config_image_category_height', '80', 0),
(1396, 0, 'config', 'config_image_category_width', '80', 0),
(1394, 0, 'config', 'config_logo', 'catalog/HTC160x135.png', 0),
(1395, 0, 'config', 'config_icon', 'catalog/cart.png', 0),
(1393, 0, 'config', 'config_captcha_page', '["review","return","contact"]', 1),
(1392, 0, 'config', 'config_captcha', 'basic_captcha', 0),
(1391, 0, 'config', 'config_return_status_id', '2', 0),
(1390, 0, 'config', 'config_return_id', '0', 0),
(1389, 0, 'config', 'config_affiliate_mail', '0', 0),
(1388, 0, 'config', 'config_affiliate_id', '4', 0),
(1387, 0, 'config', 'config_affiliate_commission', '5', 0),
(1386, 0, 'config', 'config_affiliate_auto', '0', 0),
(1385, 0, 'config', 'config_affiliate_approval', '0', 0),
(1384, 0, 'config', 'config_stock_checkout', '0', 0),
(1383, 0, 'config', 'config_stock_warning', '0', 0),
(1382, 0, 'config', 'config_stock_display', '0', 0),
(1381, 0, 'config', 'config_api_id', '1', 0),
(1380, 0, 'config', 'config_order_mail', '1', 0),
(1379, 0, 'config', 'config_fraud_status_id', '7', 0),
(1378, 0, 'config', 'config_complete_status', '["5","3"]', 1),
(1377, 0, 'config', 'config_processing_status', '["5","1","2","12","3"]', 1),
(1375, 0, 'config', 'config_checkout_id', '5', 0),
(1376, 0, 'config', 'config_order_status_id', '1', 0),
(1374, 0, 'config', 'config_checkout_guest', '1', 0),
(1373, 0, 'config', 'config_cart_weight', '1', 0),
(1372, 0, 'config', 'config_invoice_prefix', 'HTC-2016-00', 0),
(1371, 0, 'config', 'config_account_mail', '0', 0),
(1370, 0, 'config', 'config_account_id', '3', 0),
(1369, 0, 'config', 'config_login_attempts', '5', 0),
(1368, 0, 'config', 'config_customer_price', '0', 0),
(1365, 0, 'config', 'config_customer_online', '0', 0),
(1367, 0, 'config', 'config_customer_group_display', '["1"]', 1),
(1366, 0, 'config', 'config_customer_group_id', '1', 0),
(1364, 0, 'config', 'config_tax_customer', 'shipping', 0),
(1363, 0, 'config', 'config_tax_default', 'shipping', 0),
(1362, 0, 'config', 'config_tax', '0', 0),
(1361, 0, 'config', 'config_voucher_max', '1000', 0),
(1360, 0, 'config', 'config_voucher_min', '1', 0),
(1359, 0, 'config', 'config_review_mail', '1', 0),
(1358, 0, 'config', 'config_review_guest', '0', 0),
(1357, 0, 'config', 'config_review_status', '1', 0),
(1356, 0, 'config', 'config_limit_admin', '20', 0),
(1355, 0, 'config', 'config_product_description_length', '100', 0),
(1354, 0, 'config', 'config_product_limit', '15', 0),
(1353, 0, 'config', 'config_product_count', '1', 0),
(1352, 0, 'config', 'config_weight_class_id', '1', 0),
(1351, 0, 'config', 'config_length_class_id', '2', 0),
(1350, 0, 'config', 'config_currency_auto', '1', 0),
(1349, 0, 'config', 'config_currency', 'USD', 0),
(1348, 0, 'config', 'config_admin_language', 'en', 0),
(1347, 0, 'config', 'config_language', 'en', 0),
(1345, 0, 'config', 'config_country_id', '38', 0),
(1346, 0, 'config', 'config_zone_id', '602', 0),
(1344, 0, 'config', 'config_comment', 'We R - Rent Resell and Refurbish Heavy Duty Tools', 0),
(1338, 0, 'config', 'config_geocode', '53.45, -113.47', 0),
(1339, 0, 'config', 'config_email', 'webmaster@hydrotools.com', 0),
(1340, 0, 'config', 'config_telephone', '+1-780-224.8873', 0),
(1341, 0, 'config', 'config_fax', '+1-425-790.6271', 0),
(1342, 0, 'config', 'config_image', 'catalog/HTC160x135.png', 0),
(1343, 0, 'config', 'config_open', '08:00 - 17:00 UTC - 0700', 0),
(1337, 0, 'config', 'config_address', 'Edmonton, Alberta Canada', 0),
(1336, 0, 'config', 'config_owner', 'Hydro Tools Corp', 0),
(1335, 0, 'config', 'config_name', 'Hydro Tools Corp', 0),
(1334, 0, 'config', 'config_layout_id', '4', 0),
(1333, 0, 'config', 'config_template', 'default', 0),
(1332, 0, 'config', 'config_meta_keyword', 'hydraulic, hydraulic tools, hydraulic components, cylinders, pumps, valves, controllers, lubricators, trico oilers, trico ', 0),
(1093, 0, 'pp_standard', 'pp_standard_refunded_status_id', '7', 0),
(1092, 0, 'pp_standard', 'pp_standard_processed_status_id', '7', 0),
(1089, 0, 'pp_standard', 'pp_standard_expired_status_id', '7', 0),
(1090, 0, 'pp_standard', 'pp_standard_failed_status_id', '7', 0),
(1091, 0, 'pp_standard', 'pp_standard_pending_status_id', '7', 0),
(1087, 0, 'pp_standard', 'pp_standard_completed_status_id', '7', 0),
(1088, 0, 'pp_standard', 'pp_standard_denied_status_id', '7', 0),
(1086, 0, 'pp_standard', 'pp_standard_canceled_reversal_status_id', '7', 0),
(1085, 0, 'pp_standard', 'pp_standard_status', '0', 0),
(1084, 0, 'pp_standard', 'pp_standard_geo_zone_id', '0', 0),
(1083, 0, 'pp_standard', 'pp_standard_sort_order', '', 0),
(1082, 0, 'pp_standard', 'pp_standard_total', '', 0),
(1079, 0, 'pp_standard', 'pp_standard_test', '1', 0),
(1080, 0, 'pp_standard', 'pp_standard_debug', '1', 0),
(1081, 0, 'pp_standard', 'pp_standard_transaction', '0', 0),
(1078, 0, 'pp_standard', 'pp_standard_email', 'webmaster@hydrotools.com', 0),
(1050, 0, 'pp_express', 'pp_express_username', 'webmaster_api1.hydrotools.com', 0),
(1051, 0, 'pp_express', 'pp_express_password', 'QWUJGBGMNZLA8D3D', 0),
(1052, 0, 'pp_express', 'pp_express_signature', 'ApjS7nBX6F6qNthzrq.16bJbpm1fADpXRppQ37MyThvNOCtFmfDzU0Eh', 0),
(1053, 0, 'pp_express', 'pp_express_sandbox_username', 'webmaster-facilitator_api1.hydrotools.com', 0),
(1054, 0, 'pp_express', 'pp_express_sandbox_password', '6GQ648YJ3RR3S6LJ', 0),
(1055, 0, 'pp_express', 'pp_express_sandbox_signature', 'AFcWxV21C7fd0v3bYYYRCpSSRl31A0lHC3-aDyRnnGDLB.Sor9ierbpJ', 0),
(1056, 0, 'pp_express', 'pp_express_test', '1', 0),
(1057, 0, 'pp_express', 'pp_express_debug', '1', 0),
(1058, 0, 'pp_express', 'pp_express_currency', 'AUD', 0),
(1059, 0, 'pp_express', 'pp_express_recurring_cancel_status', '0', 0),
(1060, 0, 'pp_express', 'pp_express_method', 'Sale', 0),
(1061, 0, 'pp_express', 'pp_express_total', '', 0),
(1062, 0, 'pp_express', 'pp_express_sort_order', '', 0),
(1063, 0, 'pp_express', 'pp_express_geo_zone_id', '0', 0),
(1064, 0, 'pp_express', 'pp_express_status', '1', 0),
(1065, 0, 'pp_express', 'pp_express_canceled_reversal_status_id', '7', 0),
(1066, 0, 'pp_express', 'pp_express_completed_status_id', '7', 0),
(1067, 0, 'pp_express', 'pp_express_denied_status_id', '7', 0),
(1068, 0, 'pp_express', 'pp_express_expired_status_id', '7', 0),
(1069, 0, 'pp_express', 'pp_express_failed_status_id', '7', 0),
(1070, 0, 'pp_express', 'pp_express_pending_status_id', '7', 0),
(1071, 0, 'pp_express', 'pp_express_processed_status_id', '7', 0),
(1072, 0, 'pp_express', 'pp_express_refunded_status_id', '7', 0),
(1073, 0, 'pp_express', 'pp_express_reversed_status_id', '7', 0),
(1074, 0, 'pp_express', 'pp_express_voided_status_id', '7', 0),
(1075, 0, 'pp_express', 'pp_express_allow_note', '0', 0),
(1076, 0, 'pp_express', 'pp_express_page_colour', '', 0),
(1077, 0, 'pp_express', 'pp_express_logo', '', 0),
(1331, 0, 'config', 'config_meta_description', 'We R - Rent Resell and Refurbish Heavy Duty Tools', 0),
(1330, 0, 'config', 'config_meta_title', 'Hydro Tools Corp', 0),
(1445, 0, 'mta_version', 'mta_version', '141118', 0),
(1447, 0, 'tracking_input', 'tracking_input_show_close_button', '1', 0),
(1448, 0, 'tracking_input', 'tracking_input_no_cookie_only', '0', 0),
(1449, 0, 'tracking_input', 'tracking_input_show', 'session', 0),
(1450, 0, 'tracking_input', 'tracking_input_status', '0', 0),
(1451, 0, 'tracking_input', 'tracking_input_choose_code', '1', 0),
(1452, 0, 'tracking_input', 'tracking_input_choose_code_checkout', '0', 0),
(1453, 0, 'tracking_input', 'tracking_input_require_code', '1', 0),
(1454, 0, 'tracking_input', 'tracking_input_edit_code', '0', 0),
(1455, 0, 'tracking_input', 'tracking_input_dir_template', '/home/pedrocones/webmaster/Repository/store/upload/catalog/view/theme/', 0),
(1456, 0, 'tracking_input', 'tracking_input_allow_coupon', '0', 0),
(1457, 0, 'tracking_input', 'tracking_input_allow_marketing', '0', 0),
(1458, 0, 'tracking_input', 'tracking_input_module', '{"default_column":{"language_id":1,"text_heading":"Referral Code","text":"Were you referred by someone?&lt;br \\/&gt;Enter code here:","text_thankyou":"Thank You!","button":"OK","error_message":"Sorry, this code does not exist !","template":"default_column"},"default_row":{"language_id":1,"text_heading":"","text":"Were you referred by someone? Type-in the code here: ","text_thankyou":"Thank you, your code is accepted !","button":"OK","error_message":"Sorry, this code does not exist !","template":"default_row"}}', 1),
(1459, 0, 'tracking_discount', 'tracking_discount_amount', '5', 0),
(1460, 0, 'tracking_discount', 'tracking_discount_type', 'percent', 0),
(1461, 0, 'tracking_discount', 'tracking_discount_fixed_max', '5', 0),
(1462, 0, 'tracking_discount', 'tracking_discount_fixed_per_item', '0', 0),
(1463, 0, 'tracking_discount', 'tracking_discount_apply_to', 'a', 0),
(1464, 0, 'tracking_discount', 'tracking_discount_when', 'all', 0),
(1465, 0, 'tracking_discount', 'tracking_discount_period', '', 0),
(1466, 0, 'tracking_discount', 'tracking_discount_what', 'total', 0),
(1467, 0, 'tracking_discount', 'tracking_discount_no_coupon', '0', 0),
(1468, 0, 'tracking_discount', 'tracking_discount_status', '1', 0),
(1469, 0, 'tracking_discount', 'tracking_discount_sort_order', '2', 0),
(1470, 0, 'tracking_discount', 'tracking_discount_per_aff', '1', 0),
(1471, 0, 'cftyp', 'cftyp_status', '1', 0),
(1472, 0, 'cftyp', 'cftyp_always', '0', 0),
(1473, 0, 'cftyp', 'cftyp_session_only', '0', 0),
(1474, 0, 'cftyp', 'cftyp_version', '141217', 0),
(1475, 0, 'account_combine', 'account_combine_version', '20141101', 0),
(1476, 0, 'account_combine', 'account_combine_status', '1', 0),
(1477, 0, 'account_combine', 'account_combine_allow_own_aff', '1', 0),
(1478, 0, 'account_combine', 'account_combine_allow_funds_transfer', '0', 0),
(1479, 0, 'account_combine', 'account_combine_transfer_multiplier', '1', 0),
(1480, 0, 'account_combine', 'account_combine__fields', '["website","tax","payment"]', 1),
(1481, 0, 'account_combine', 'account_combine__payment_methods', '["paypal","cheque","bank"]', 1),
(1482, 0, 'account_combine', 'account_combine__payment_method_fields', '{"bank":["name","branch_number","swift_code","account_name","account_number"]}', 1),
(1483, 0, 'account_combine', 'account_combine_fields', '{"website":"y","tax":"y","payment":"y","use_paypal":1,"use_cheque":1,"use_bank":1,"payment_default":"paypal","bank":{"name":1,"branch_number":1,"swift_code":1,"account_name":1,"account_number":1}}', 1),
(1484, 0, 'account_combine', 'account_combine_rform', '{"affiliate":"c","website_textarea":0,"agreement":0,"show_website":1,"show_tax":1,"show_payment":1}', 1),
(1485, 0, 'account_combine', 'account_combine_cform', '{"affiliate":"n","website_textarea":0,"agreement":0,"show_website":0,"show_tax":0,"show_payment":0}', 1),
(1486, 0, 'account_combine', 'account_combine_customer_group_id', '0', 0),
(1487, 0, 'account_combine', 'account_combine_force_required', '0', 0),
(1488, 0, 'account_combine', 'account_combine_own_parent', '0', 0),
(1489, 0, 'account_combine', 'account_combine_aff_links_in_account', '1', 0),
(1490, 0, 'account_combine', 'account_combine_auto_credit', '0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_stock_status`
--

CREATE TABLE IF NOT EXISTS `oc_stock_status` (
  `stock_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_stock_status`
--

INSERT INTO `oc_stock_status` (`stock_status_id`, `language_id`, `name`) VALUES
(5, 5, 'Out Of Stock'),
(8, 5, 'Pre-Order'),
(7, 5, 'In Stock'),
(7, 2, 'In Stock'),
(8, 2, 'Pre-Order'),
(5, 2, 'Out Of Stock'),
(6, 2, '2-3 Days'),
(5, 6, 'Out Of Stock'),
(8, 6, 'Pre-Order'),
(7, 6, 'In Stock'),
(6, 5, '2-3 Days'),
(6, 6, '2-3 Days');

-- --------------------------------------------------------

--
-- Table structure for table `oc_store`
--

CREATE TABLE IF NOT EXISTS `oc_store` (
  `store_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_class`
--

CREATE TABLE IF NOT EXISTS `oc_tax_class` (
  `tax_class_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_tax_class`
--

INSERT INTO `oc_tax_class` (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`) VALUES
(9, 'Taxable Goods', 'Taxed goods', '2009-01-06 23:21:53', '2011-09-23 14:07:50'),
(10, 'Downloadable Products', 'Downloadable', '2011-09-21 22:19:39', '2011-09-22 10:27:36');

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_rate`
--

CREATE TABLE IF NOT EXISTS `oc_tax_rate` (
  `tax_rate_id` int(11) NOT NULL,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_tax_rate`
--

INSERT INTO `oc_tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`) VALUES
(86, 3, 'VAT (20%)', 20.0000, 'P', '2011-03-09 21:17:10', '2011-09-22 22:24:29'),
(87, 3, 'Eco Tax (-2.00)', 2.0000, 'F', '2011-09-21 21:49:23', '2011-09-23 00:40:19');

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_rate_to_customer_group`
--

CREATE TABLE IF NOT EXISTS `oc_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_tax_rate_to_customer_group`
--

INSERT INTO `oc_tax_rate_to_customer_group` (`tax_rate_id`, `customer_group_id`) VALUES
(86, 1),
(87, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_rule`
--

CREATE TABLE IF NOT EXISTS `oc_tax_rule` (
  `tax_rule_id` int(11) NOT NULL,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_tax_rule`
--

INSERT INTO `oc_tax_rule` (`tax_rule_id`, `tax_class_id`, `tax_rate_id`, `based`, `priority`) VALUES
(121, 10, 86, 'payment', 1),
(120, 10, 87, 'store', 0),
(128, 9, 86, 'shipping', 1),
(127, 9, 87, 'shipping', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oc_upload`
--

CREATE TABLE IF NOT EXISTS `oc_upload` (
  `upload_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_url_alias`
--

CREATE TABLE IF NOT EXISTS `oc_url_alias` (
  `url_alias_id` int(11) NOT NULL,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=895 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_url_alias`
--

INSERT INTO `oc_url_alias` (`url_alias_id`, `query`, `keyword`) VALUES
(888, 'information_id=4', 'about_us'),
(878, 'manufacturer_id=11', ''),
(889, 'information_id=6', 'delivery'),
(890, 'information_id=3', 'privacy'),
(891, 'information_id=5', 'terms'),
(879, 'manufacturer_id=12', ''),
(880, 'manufacturer_id=13', ''),
(881, 'manufacturer_id=14', ''),
(882, 'manufacturer_id=15', ''),
(884, 'manufacturer_id=17', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_user`
--

CREATE TABLE IF NOT EXISTS `oc_user` (
  `user_id` int(11) NOT NULL,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `image` varchar(255) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_user`
--

INSERT INTO `oc_user` (`user_id`, `user_group_id`, `username`, `password`, `salt`, `firstname`, `lastname`, `email`, `image`, `code`, `ip`, `status`, `date_added`) VALUES
(1, 1, 'webmaster', 'a75d6bc83efe6fc9bc8817c7d37d99dc40c10c80', 'LHLbCmv1j', 'John', 'Doe', 'webmaster@hydrotools.com', '', '', '192.168.1.110', 1, '2016-01-17 08:26:49');

-- --------------------------------------------------------

--
-- Table structure for table `oc_user_group`
--

CREATE TABLE IF NOT EXISTS `oc_user_group` (
  `user_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_user_group`
--

INSERT INTO `oc_user_group` (`user_group_id`, `name`, `permission`) VALUES
(1, 'Administrator', '{"access":["analytics\\/google_analytics","captcha\\/basic_captcha","captcha\\/google_captcha","catalog\\/attribute","catalog\\/attribute_group","catalog\\/category","catalog\\/download","catalog\\/filter","catalog\\/information","catalog\\/manufacturer","catalog\\/option","catalog\\/product","catalog\\/recurring","catalog\\/review","common\\/column_left","common\\/filemanager","common\\/menu","common\\/profile","common\\/stats","customer\\/custom_field","customer\\/customer","customer\\/customer_group","design\\/banner","design\\/layout","extension\\/analytics","extension\\/captcha","extension\\/feed","extension\\/fraud","extension\\/installer","extension\\/modification","extension\\/module","extension\\/openbay","extension\\/payment","extension\\/shipping","extension\\/total","feed\\/google_base","feed\\/google_sitemap","feed\\/openbaypro","fraud\\/fraudlabspro","fraud\\/ip","fraud\\/maxmind","localisation\\/country","localisation\\/currency","localisation\\/geo_zone","localisation\\/language","localisation\\/length_class","localisation\\/location","localisation\\/order_status","localisation\\/return_action","localisation\\/return_reason","localisation\\/return_status","localisation\\/stock_status","localisation\\/tax_class","localisation\\/tax_rate","localisation\\/weight_class","localisation\\/zone","marketing\\/affiliate","marketing\\/contact","marketing\\/coupon","marketing\\/marketing","module\\/account","module\\/affiliate","module\\/amazon_login","module\\/amazon_pay","module\\/banner","module\\/bestseller","module\\/carousel","module\\/category","module\\/ebay_listing","module\\/featured","module\\/filter","module\\/google_hangouts","module\\/html","module\\/information","module\\/latest","module\\/pp_button","module\\/pp_login","module\\/slideshow","module\\/special","module\\/store","openbay\\/amazon","openbay\\/amazon_listing","openbay\\/amazon_product","openbay\\/amazonus","openbay\\/amazonus_listing","openbay\\/amazonus_product","openbay\\/ebay","openbay\\/ebay_profile","openbay\\/ebay_template","openbay\\/etsy","openbay\\/etsy_product","openbay\\/etsy_shipping","openbay\\/etsy_shop","payment\\/amazon_login_pay","payment\\/authorizenet_aim","payment\\/authorizenet_sim","payment\\/bank_transfer","payment\\/bluepay_hosted","payment\\/bluepay_redirect","payment\\/cheque","payment\\/cod","payment\\/firstdata","payment\\/firstdata_remote","payment\\/free_checkout","payment\\/g2apay","payment\\/globalpay","payment\\/globalpay_remote","payment\\/klarna_account","payment\\/klarna_invoice","payment\\/liqpay","payment\\/nochex","payment\\/paymate","payment\\/paypoint","payment\\/payza","payment\\/perpetual_payments","payment\\/pp_express","payment\\/pp_payflow","payment\\/pp_payflow_iframe","payment\\/pp_pro","payment\\/pp_pro_iframe","payment\\/pp_standard","payment\\/realex","payment\\/realex_remote","payment\\/sagepay_direct","payment\\/sagepay_server","payment\\/sagepay_us","payment\\/securetrading_pp","payment\\/securetrading_ws","payment\\/skrill","payment\\/twocheckout","payment\\/web_payment_software","payment\\/worldpay","report\\/affiliate","report\\/affiliate_activity","report\\/affiliate_login","report\\/customer_activity","report\\/customer_credit","report\\/customer_login","report\\/customer_online","report\\/customer_order","report\\/customer_reward","report\\/marketing","report\\/product_purchased","report\\/product_viewed","report\\/sale_coupon","report\\/sale_order","report\\/sale_return","report\\/sale_shipping","report\\/sale_tax","sale\\/order","sale\\/recurring","sale\\/return","sale\\/voucher","sale\\/voucher_theme","setting\\/setting","setting\\/store","shipping\\/auspost","shipping\\/citylink","shipping\\/fedex","shipping\\/flat","shipping\\/free","shipping\\/item","shipping\\/parcelforce_48","shipping\\/pickup","shipping\\/royal_mail","shipping\\/ups","shipping\\/usps","shipping\\/weight","tool\\/backup","tool\\/error_log","tool\\/upload","total\\/coupon","total\\/credit","total\\/handling","total\\/klarna_fee","total\\/low_order_fee","total\\/reward","total\\/shipping","total\\/sub_total","total\\/tax","total\\/total","total\\/voucher","user\\/api","user\\/user","user\\/user_permission","payment\\/pp_express","payment\\/pp_standard","module\\/pp_button","payment\\/amazon_login_pay","payment\\/pp_standard","payment\\/amazon_login_pay","shipping\\/fedex","captcha\\/google_captcha","captcha\\/basic_captcha","module\\/affiliate","module\\/mta","module\\/mta","mta\\/mta","mta\\/mta_affiliate_dt","mta\\/mta_pds","mta\\/mta_set_scheme","mta\\/affiliate_downline","mta\\/mta_event","module\\/affiliate","module\\/tracking_input","module\\/tracking_input","total\\/tracking_discount","total\\/tracking_discount","total\\/tracking_discount","total\\/tracking_discount","module\\/coupon_for_tracking","module\\/coupon_for_tracking","module\\/account_combine","module\\/account_combine","module\\/affiliate_payout","module\\/affiliate_payout"],"modify":["analytics\\/google_analytics","captcha\\/basic_captcha","captcha\\/google_captcha","catalog\\/attribute","catalog\\/attribute_group","catalog\\/category","catalog\\/download","catalog\\/filter","catalog\\/information","catalog\\/manufacturer","catalog\\/option","catalog\\/product","catalog\\/recurring","catalog\\/review","common\\/column_left","common\\/filemanager","common\\/menu","common\\/profile","common\\/stats","customer\\/custom_field","customer\\/customer","customer\\/customer_group","design\\/banner","design\\/layout","extension\\/analytics","extension\\/captcha","extension\\/feed","extension\\/fraud","extension\\/installer","extension\\/modification","extension\\/module","extension\\/openbay","extension\\/payment","extension\\/shipping","extension\\/total","feed\\/google_base","feed\\/google_sitemap","feed\\/openbaypro","fraud\\/fraudlabspro","fraud\\/ip","fraud\\/maxmind","localisation\\/country","localisation\\/currency","localisation\\/geo_zone","localisation\\/language","localisation\\/length_class","localisation\\/location","localisation\\/order_status","localisation\\/return_action","localisation\\/return_reason","localisation\\/return_status","localisation\\/stock_status","localisation\\/tax_class","localisation\\/tax_rate","localisation\\/weight_class","localisation\\/zone","marketing\\/affiliate","marketing\\/contact","marketing\\/coupon","marketing\\/marketing","module\\/account","module\\/affiliate","module\\/amazon_login","module\\/amazon_pay","module\\/banner","module\\/bestseller","module\\/carousel","module\\/category","module\\/ebay_listing","module\\/featured","module\\/filter","module\\/google_hangouts","module\\/html","module\\/information","module\\/latest","module\\/pp_button","module\\/pp_login","module\\/slideshow","module\\/special","module\\/store","openbay\\/amazon","openbay\\/amazon_listing","openbay\\/amazon_product","openbay\\/amazonus","openbay\\/amazonus_listing","openbay\\/amazonus_product","openbay\\/ebay","openbay\\/ebay_profile","openbay\\/ebay_template","openbay\\/etsy","openbay\\/etsy_product","openbay\\/etsy_shipping","openbay\\/etsy_shop","payment\\/amazon_login_pay","payment\\/authorizenet_aim","payment\\/authorizenet_sim","payment\\/bank_transfer","payment\\/bluepay_hosted","payment\\/bluepay_redirect","payment\\/cheque","payment\\/cod","payment\\/firstdata","payment\\/firstdata_remote","payment\\/free_checkout","payment\\/g2apay","payment\\/globalpay","payment\\/globalpay_remote","payment\\/klarna_account","payment\\/klarna_invoice","payment\\/liqpay","payment\\/nochex","payment\\/paymate","payment\\/paypoint","payment\\/payza","payment\\/perpetual_payments","payment\\/pp_express","payment\\/pp_payflow","payment\\/pp_payflow_iframe","payment\\/pp_pro","payment\\/pp_pro_iframe","payment\\/pp_standard","payment\\/realex","payment\\/realex_remote","payment\\/sagepay_direct","payment\\/sagepay_server","payment\\/sagepay_us","payment\\/securetrading_pp","payment\\/securetrading_ws","payment\\/skrill","payment\\/twocheckout","payment\\/web_payment_software","payment\\/worldpay","report\\/affiliate","report\\/affiliate_activity","report\\/affiliate_login","report\\/customer_activity","report\\/customer_credit","report\\/customer_login","report\\/customer_online","report\\/customer_order","report\\/customer_reward","report\\/marketing","report\\/product_purchased","report\\/product_viewed","report\\/sale_coupon","report\\/sale_order","report\\/sale_return","report\\/sale_shipping","report\\/sale_tax","sale\\/order","sale\\/recurring","sale\\/return","sale\\/voucher","sale\\/voucher_theme","setting\\/setting","setting\\/store","shipping\\/auspost","shipping\\/citylink","shipping\\/fedex","shipping\\/flat","shipping\\/free","shipping\\/item","shipping\\/parcelforce_48","shipping\\/pickup","shipping\\/royal_mail","shipping\\/ups","shipping\\/usps","shipping\\/weight","tool\\/backup","tool\\/error_log","tool\\/upload","total\\/coupon","total\\/credit","total\\/handling","total\\/klarna_fee","total\\/low_order_fee","total\\/reward","total\\/shipping","total\\/sub_total","total\\/tax","total\\/total","total\\/voucher","user\\/api","user\\/user","user\\/user_permission","payment\\/pp_express","payment\\/pp_standard","module\\/pp_button","payment\\/amazon_login_pay","payment\\/pp_standard","payment\\/amazon_login_pay","shipping\\/fedex","captcha\\/google_captcha","captcha\\/basic_captcha","module\\/affiliate","module\\/mta","module\\/mta","mta\\/mta","mta\\/mta_affiliate_dt","mta\\/mta_pds","mta\\/mta_set_scheme","mta\\/affiliate_downline","mta\\/mta_event","module\\/affiliate","module\\/tracking_input","module\\/tracking_input","total\\/tracking_discount","total\\/tracking_discount","total\\/tracking_discount","total\\/tracking_discount","module\\/coupon_for_tracking","module\\/coupon_for_tracking","module\\/account_combine","module\\/account_combine","module\\/affiliate_payout","module\\/affiliate_payout"]}'),
(10, 'Demonstration', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher`
--

CREATE TABLE IF NOT EXISTS `oc_voucher` (
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher_history`
--

CREATE TABLE IF NOT EXISTS `oc_voucher_history` (
  `voucher_history_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher_theme`
--

CREATE TABLE IF NOT EXISTS `oc_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_voucher_theme`
--

INSERT INTO `oc_voucher_theme` (`voucher_theme_id`, `image`) VALUES
(8, 'catalog/demo/canon_eos_5d_2.jpg'),
(7, 'catalog/demo/gift-voucher-birthday.jpg'),
(6, 'catalog/demo/apple_logo.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher_theme_description`
--

CREATE TABLE IF NOT EXISTS `oc_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_voucher_theme_description`
--

INSERT INTO `oc_voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`) VALUES
(7, 5, 'Birthday'),
(6, 5, 'Christmas'),
(6, 2, 'Christmas'),
(7, 2, 'Birthday'),
(8, 2, 'General'),
(7, 6, 'Birthday'),
(6, 6, 'Christmas'),
(8, 5, 'General'),
(8, 6, 'General');

-- --------------------------------------------------------

--
-- Table structure for table `oc_weight_class`
--

CREATE TABLE IF NOT EXISTS `oc_weight_class` (
  `weight_class_id` int(11) NOT NULL,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000'
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_weight_class`
--

INSERT INTO `oc_weight_class` (`weight_class_id`, `value`) VALUES
(1, 1.00000000),
(2, 1000.00000000),
(5, 2.20460000),
(6, 35.27400000);

-- --------------------------------------------------------

--
-- Table structure for table `oc_weight_class_description`
--

CREATE TABLE IF NOT EXISTS `oc_weight_class_description` (
  `weight_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_weight_class_description`
--

INSERT INTO `oc_weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`) VALUES
(5, 5, 'Pound ', 'lb'),
(2, 5, 'Gram', 'g'),
(1, 5, 'Kilogram', 'kg'),
(1, 2, 'Kilogram', 'kg'),
(2, 2, 'Gram', 'g'),
(5, 2, 'Pound ', 'lb'),
(6, 2, 'Ounce', 'oz'),
(5, 6, 'Pound ', 'lb'),
(2, 6, 'Gram', 'g'),
(1, 6, 'Kilogram', 'kg'),
(6, 5, 'Ounce', 'oz'),
(6, 6, 'Ounce', 'oz');

-- --------------------------------------------------------

--
-- Table structure for table `oc_zone`
--

CREATE TABLE IF NOT EXISTS `oc_zone` (
  `zone_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=4232 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_zone`
--

INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1, 1, 'Badakhshan', 'BDS', 1),
(2, 1, 'Badghis', 'BDG', 1),
(3, 1, 'Baghlan', 'BGL', 1),
(4, 1, 'Balkh', 'BAL', 1),
(5, 1, 'Bamian', 'BAM', 1),
(6, 1, 'Farah', 'FRA', 1),
(7, 1, 'Faryab', 'FYB', 1),
(8, 1, 'Ghazni', 'GHA', 1),
(9, 1, 'Ghowr', 'GHO', 1),
(10, 1, 'Helmand', 'HEL', 1),
(11, 1, 'Herat', 'HER', 1),
(12, 1, 'Jowzjan', 'JOW', 1),
(13, 1, 'Kabul', 'KAB', 1),
(14, 1, 'Kandahar', 'KAN', 1),
(15, 1, 'Kapisa', 'KAP', 1),
(16, 1, 'Khost', 'KHO', 1),
(17, 1, 'Konar', 'KNR', 1),
(18, 1, 'Kondoz', 'KDZ', 1),
(19, 1, 'Laghman', 'LAG', 1),
(20, 1, 'Lowgar', 'LOW', 1),
(21, 1, 'Nangrahar', 'NAN', 1),
(22, 1, 'Nimruz', 'NIM', 1),
(23, 1, 'Nurestan', 'NUR', 1),
(24, 1, 'Oruzgan', 'ORU', 1),
(25, 1, 'Paktia', 'PIA', 1),
(26, 1, 'Paktika', 'PKA', 1),
(27, 1, 'Parwan', 'PAR', 1),
(28, 1, 'Samangan', 'SAM', 1),
(29, 1, 'Sar-e Pol', 'SAR', 1),
(30, 1, 'Takhar', 'TAK', 1),
(31, 1, 'Wardak', 'WAR', 1),
(32, 1, 'Zabol', 'ZAB', 1),
(33, 2, 'Berat', 'BR', 1),
(34, 2, 'Bulqize', 'BU', 1),
(35, 2, 'Delvine', 'DL', 1),
(36, 2, 'Devoll', 'DV', 1),
(37, 2, 'Diber', 'DI', 1),
(38, 2, 'Durres', 'DR', 1),
(39, 2, 'Elbasan', 'EL', 1),
(40, 2, 'Kolonje', 'ER', 1),
(41, 2, 'Fier', 'FR', 1),
(42, 2, 'Gjirokaster', 'GJ', 1),
(43, 2, 'Gramsh', 'GR', 1),
(44, 2, 'Has', 'HA', 1),
(45, 2, 'Kavaje', 'KA', 1),
(46, 2, 'Kurbin', 'KB', 1),
(47, 2, 'Kucove', 'KC', 1),
(48, 2, 'Korce', 'KO', 1),
(49, 2, 'Kruje', 'KR', 1),
(50, 2, 'Kukes', 'KU', 1),
(51, 2, 'Librazhd', 'LB', 1),
(52, 2, 'Lezhe', 'LE', 1),
(53, 2, 'Lushnje', 'LU', 1),
(54, 2, 'Malesi e Madhe', 'MM', 1),
(55, 2, 'Mallakaster', 'MK', 1),
(56, 2, 'Mat', 'MT', 1),
(57, 2, 'Mirdite', 'MR', 1),
(58, 2, 'Peqin', 'PQ', 1),
(59, 2, 'Permet', 'PR', 1),
(60, 2, 'Pogradec', 'PG', 1),
(61, 2, 'Puke', 'PU', 1),
(62, 2, 'Shkoder', 'SH', 1),
(63, 2, 'Skrapar', 'SK', 1),
(64, 2, 'Sarande', 'SR', 1),
(65, 2, 'Tepelene', 'TE', 1),
(66, 2, 'Tropoje', 'TP', 1),
(67, 2, 'Tirane', 'TR', 1),
(68, 2, 'Vlore', 'VL', 1),
(69, 3, 'Adrar', 'ADR', 1),
(70, 3, 'Ain Defla', 'ADE', 1),
(71, 3, 'Ain Temouchent', 'ATE', 1),
(72, 3, 'Alger', 'ALG', 1),
(73, 3, 'Annaba', 'ANN', 1),
(74, 3, 'Batna', 'BAT', 1),
(75, 3, 'Bechar', 'BEC', 1),
(76, 3, 'Bejaia', 'BEJ', 1),
(77, 3, 'Biskra', 'BIS', 1),
(78, 3, 'Blida', 'BLI', 1),
(79, 3, 'Bordj Bou Arreridj', 'BBA', 1),
(80, 3, 'Bouira', 'BOA', 1),
(81, 3, 'Boumerdes', 'BMD', 1),
(82, 3, 'Chlef', 'CHL', 1),
(83, 3, 'Constantine', 'CON', 1),
(84, 3, 'Djelfa', 'DJE', 1),
(85, 3, 'El Bayadh', 'EBA', 1),
(86, 3, 'El Oued', 'EOU', 1),
(87, 3, 'El Tarf', 'ETA', 1),
(88, 3, 'Ghardaia', 'GHA', 1),
(89, 3, 'Guelma', 'GUE', 1),
(90, 3, 'Illizi', 'ILL', 1),
(91, 3, 'Jijel', 'JIJ', 1),
(92, 3, 'Khenchela', 'KHE', 1),
(93, 3, 'Laghouat', 'LAG', 1),
(94, 3, 'Muaskar', 'MUA', 1),
(95, 3, 'Medea', 'MED', 1),
(96, 3, 'Mila', 'MIL', 1),
(97, 3, 'Mostaganem', 'MOS', 1),
(98, 3, 'M''Sila', 'MSI', 1),
(99, 3, 'Naama', 'NAA', 1),
(100, 3, 'Oran', 'ORA', 1),
(101, 3, 'Ouargla', 'OUA', 1),
(102, 3, 'Oum el-Bouaghi', 'OEB', 1),
(103, 3, 'Relizane', 'REL', 1),
(104, 3, 'Saida', 'SAI', 1),
(105, 3, 'Setif', 'SET', 1),
(106, 3, 'Sidi Bel Abbes', 'SBA', 1),
(107, 3, 'Skikda', 'SKI', 1),
(108, 3, 'Souk Ahras', 'SAH', 1),
(109, 3, 'Tamanghasset', 'TAM', 1),
(110, 3, 'Tebessa', 'TEB', 1),
(111, 3, 'Tiaret', 'TIA', 1),
(112, 3, 'Tindouf', 'TIN', 1),
(113, 3, 'Tipaza', 'TIP', 1),
(114, 3, 'Tissemsilt', 'TIS', 1),
(115, 3, 'Tizi Ouzou', 'TOU', 1),
(116, 3, 'Tlemcen', 'TLE', 1),
(117, 4, 'Eastern', 'E', 1),
(118, 4, 'Manu''a', 'M', 1),
(119, 4, 'Rose Island', 'R', 1),
(120, 4, 'Swains Island', 'S', 1),
(121, 4, 'Western', 'W', 1),
(122, 5, 'Andorra la Vella', 'ALV', 1),
(123, 5, 'Canillo', 'CAN', 1),
(124, 5, 'Encamp', 'ENC', 1),
(125, 5, 'Escaldes-Engordany', 'ESE', 1),
(126, 5, 'La Massana', 'LMA', 1),
(127, 5, 'Ordino', 'ORD', 1),
(128, 5, 'Sant Julia de Loria', 'SJL', 1),
(129, 6, 'Bengo', 'BGO', 1),
(130, 6, 'Benguela', 'BGU', 1),
(131, 6, 'Bie', 'BIE', 1),
(132, 6, 'Cabinda', 'CAB', 1),
(133, 6, 'Cuando-Cubango', 'CCU', 1),
(134, 6, 'Cuanza Norte', 'CNO', 1),
(135, 6, 'Cuanza Sul', 'CUS', 1),
(136, 6, 'Cunene', 'CNN', 1),
(137, 6, 'Huambo', 'HUA', 1),
(138, 6, 'Huila', 'HUI', 1),
(139, 6, 'Luanda', 'LUA', 1),
(140, 6, 'Lunda Norte', 'LNO', 1),
(141, 6, 'Lunda Sul', 'LSU', 1),
(142, 6, 'Malange', 'MAL', 1),
(143, 6, 'Moxico', 'MOX', 1),
(144, 6, 'Namibe', 'NAM', 1),
(145, 6, 'Uige', 'UIG', 1),
(146, 6, 'Zaire', 'ZAI', 1),
(147, 9, 'Saint George', 'ASG', 1),
(148, 9, 'Saint John', 'ASJ', 1),
(149, 9, 'Saint Mary', 'ASM', 1),
(150, 9, 'Saint Paul', 'ASL', 1),
(151, 9, 'Saint Peter', 'ASR', 1),
(152, 9, 'Saint Philip', 'ASH', 1),
(153, 9, 'Barbuda', 'BAR', 1),
(154, 9, 'Redonda', 'RED', 1),
(155, 10, 'Antartida e Islas del Atlantico', 'AN', 1),
(156, 10, 'Buenos Aires', 'BA', 1),
(157, 10, 'Catamarca', 'CA', 1),
(158, 10, 'Chaco', 'CH', 1),
(159, 10, 'Chubut', 'CU', 1),
(160, 10, 'Cordoba', 'CO', 1),
(161, 10, 'Corrientes', 'CR', 1),
(162, 10, 'Distrito Federal', 'DF', 1),
(163, 10, 'Entre Rios', 'ER', 1),
(164, 10, 'Formosa', 'FO', 1),
(165, 10, 'Jujuy', 'JU', 1),
(166, 10, 'La Pampa', 'LP', 1),
(167, 10, 'La Rioja', 'LR', 1),
(168, 10, 'Mendoza', 'ME', 1),
(169, 10, 'Misiones', 'MI', 1),
(170, 10, 'Neuquen', 'NE', 1),
(171, 10, 'Rio Negro', 'RN', 1),
(172, 10, 'Salta', 'SA', 1),
(173, 10, 'San Juan', 'SJ', 1),
(174, 10, 'San Luis', 'SL', 1),
(175, 10, 'Santa Cruz', 'SC', 1),
(176, 10, 'Santa Fe', 'SF', 1),
(177, 10, 'Santiago del Estero', 'SD', 1),
(178, 10, 'Tierra del Fuego', 'TF', 1),
(179, 10, 'Tucuman', 'TU', 1),
(180, 11, 'Aragatsotn', 'AGT', 1),
(181, 11, 'Ararat', 'ARR', 1),
(182, 11, 'Armavir', 'ARM', 1),
(183, 11, 'Geghark''unik''', 'GEG', 1),
(184, 11, 'Kotayk''', 'KOT', 1),
(185, 11, 'Lorri', 'LOR', 1),
(186, 11, 'Shirak', 'SHI', 1),
(187, 11, 'Syunik''', 'SYU', 1),
(188, 11, 'Tavush', 'TAV', 1),
(189, 11, 'Vayots'' Dzor', 'VAY', 1),
(190, 11, 'Yerevan', 'YER', 1),
(191, 13, 'Australian Capital Territory', 'ACT', 1),
(192, 13, 'New South Wales', 'NSW', 1),
(193, 13, 'Northern Territory', 'NT', 1),
(194, 13, 'Queensland', 'QLD', 1),
(195, 13, 'South Australia', 'SA', 1),
(196, 13, 'Tasmania', 'TAS', 1),
(197, 13, 'Victoria', 'VIC', 1),
(198, 13, 'Western Australia', 'WA', 1),
(199, 14, 'Burgenland', 'BUR', 1),
(200, 14, 'Kärnten', 'KAR', 1),
(201, 14, 'Nieder&ouml;sterreich', 'NOS', 1),
(202, 14, 'Ober&ouml;sterreich', 'OOS', 1),
(203, 14, 'Salzburg', 'SAL', 1),
(204, 14, 'Steiermark', 'STE', 1),
(205, 14, 'Tirol', 'TIR', 1),
(206, 14, 'Vorarlberg', 'VOR', 1),
(207, 14, 'Wien', 'WIE', 1),
(208, 15, 'Ali Bayramli', 'AB', 1),
(209, 15, 'Abseron', 'ABS', 1),
(210, 15, 'AgcabAdi', 'AGC', 1),
(211, 15, 'Agdam', 'AGM', 1),
(212, 15, 'Agdas', 'AGS', 1),
(213, 15, 'Agstafa', 'AGA', 1),
(214, 15, 'Agsu', 'AGU', 1),
(215, 15, 'Astara', 'AST', 1),
(216, 15, 'Baki', 'BA', 1),
(217, 15, 'BabAk', 'BAB', 1),
(218, 15, 'BalakAn', 'BAL', 1),
(219, 15, 'BArdA', 'BAR', 1),
(220, 15, 'Beylaqan', 'BEY', 1),
(221, 15, 'Bilasuvar', 'BIL', 1),
(222, 15, 'Cabrayil', 'CAB', 1),
(223, 15, 'Calilabab', 'CAL', 1),
(224, 15, 'Culfa', 'CUL', 1),
(225, 15, 'Daskasan', 'DAS', 1),
(226, 15, 'Davaci', 'DAV', 1),
(227, 15, 'Fuzuli', 'FUZ', 1),
(228, 15, 'Ganca', 'GA', 1),
(229, 15, 'Gadabay', 'GAD', 1),
(230, 15, 'Goranboy', 'GOR', 1),
(231, 15, 'Goycay', 'GOY', 1),
(232, 15, 'Haciqabul', 'HAC', 1),
(233, 15, 'Imisli', 'IMI', 1),
(234, 15, 'Ismayilli', 'ISM', 1),
(235, 15, 'Kalbacar', 'KAL', 1),
(236, 15, 'Kurdamir', 'KUR', 1),
(237, 15, 'Lankaran', 'LA', 1),
(238, 15, 'Lacin', 'LAC', 1),
(239, 15, 'Lankaran', 'LAN', 1),
(240, 15, 'Lerik', 'LER', 1),
(241, 15, 'Masalli', 'MAS', 1),
(242, 15, 'Mingacevir', 'MI', 1),
(243, 15, 'Naftalan', 'NA', 1),
(244, 15, 'Neftcala', 'NEF', 1),
(245, 15, 'Oguz', 'OGU', 1),
(246, 15, 'Ordubad', 'ORD', 1),
(247, 15, 'Qabala', 'QAB', 1),
(248, 15, 'Qax', 'QAX', 1),
(249, 15, 'Qazax', 'QAZ', 1),
(250, 15, 'Qobustan', 'QOB', 1),
(251, 15, 'Quba', 'QBA', 1),
(252, 15, 'Qubadli', 'QBI', 1),
(253, 15, 'Qusar', 'QUS', 1),
(254, 15, 'Saki', 'SA', 1),
(255, 15, 'Saatli', 'SAT', 1),
(256, 15, 'Sabirabad', 'SAB', 1),
(257, 15, 'Sadarak', 'SAD', 1),
(258, 15, 'Sahbuz', 'SAH', 1),
(259, 15, 'Saki', 'SAK', 1),
(260, 15, 'Salyan', 'SAL', 1),
(261, 15, 'Sumqayit', 'SM', 1),
(262, 15, 'Samaxi', 'SMI', 1),
(263, 15, 'Samkir', 'SKR', 1),
(264, 15, 'Samux', 'SMX', 1),
(265, 15, 'Sarur', 'SAR', 1),
(266, 15, 'Siyazan', 'SIY', 1),
(267, 15, 'Susa', 'SS', 1),
(268, 15, 'Susa', 'SUS', 1),
(269, 15, 'Tartar', 'TAR', 1),
(270, 15, 'Tovuz', 'TOV', 1),
(271, 15, 'Ucar', 'UCA', 1),
(272, 15, 'Xankandi', 'XA', 1),
(273, 15, 'Xacmaz', 'XAC', 1),
(274, 15, 'Xanlar', 'XAN', 1),
(275, 15, 'Xizi', 'XIZ', 1),
(276, 15, 'Xocali', 'XCI', 1),
(277, 15, 'Xocavand', 'XVD', 1),
(278, 15, 'Yardimli', 'YAR', 1),
(279, 15, 'Yevlax', 'YEV', 1),
(280, 15, 'Zangilan', 'ZAN', 1),
(281, 15, 'Zaqatala', 'ZAQ', 1),
(282, 15, 'Zardab', 'ZAR', 1),
(283, 15, 'Naxcivan', 'NX', 1),
(284, 16, 'Acklins', 'ACK', 1),
(285, 16, 'Berry Islands', 'BER', 1),
(286, 16, 'Bimini', 'BIM', 1),
(287, 16, 'Black Point', 'BLK', 1),
(288, 16, 'Cat Island', 'CAT', 1),
(289, 16, 'Central Abaco', 'CAB', 1),
(290, 16, 'Central Andros', 'CAN', 1),
(291, 16, 'Central Eleuthera', 'CEL', 1),
(292, 16, 'City of Freeport', 'FRE', 1),
(293, 16, 'Crooked Island', 'CRO', 1),
(294, 16, 'East Grand Bahama', 'EGB', 1),
(295, 16, 'Exuma', 'EXU', 1),
(296, 16, 'Grand Cay', 'GRD', 1),
(297, 16, 'Harbour Island', 'HAR', 1),
(298, 16, 'Hope Town', 'HOP', 1),
(299, 16, 'Inagua', 'INA', 1),
(300, 16, 'Long Island', 'LNG', 1),
(301, 16, 'Mangrove Cay', 'MAN', 1),
(302, 16, 'Mayaguana', 'MAY', 1),
(303, 16, 'Moore''s Island', 'MOO', 1),
(304, 16, 'North Abaco', 'NAB', 1),
(305, 16, 'North Andros', 'NAN', 1),
(306, 16, 'North Eleuthera', 'NEL', 1),
(307, 16, 'Ragged Island', 'RAG', 1),
(308, 16, 'Rum Cay', 'RUM', 1),
(309, 16, 'San Salvador', 'SAL', 1),
(310, 16, 'South Abaco', 'SAB', 1),
(311, 16, 'South Andros', 'SAN', 1),
(312, 16, 'South Eleuthera', 'SEL', 1),
(313, 16, 'Spanish Wells', 'SWE', 1),
(314, 16, 'West Grand Bahama', 'WGB', 1),
(315, 17, 'Capital', 'CAP', 1),
(316, 17, 'Central', 'CEN', 1),
(317, 17, 'Muharraq', 'MUH', 1),
(318, 17, 'Northern', 'NOR', 1),
(319, 17, 'Southern', 'SOU', 1),
(320, 18, 'Barisal', 'BAR', 1),
(321, 18, 'Chittagong', 'CHI', 1),
(322, 18, 'Dhaka', 'DHA', 1),
(323, 18, 'Khulna', 'KHU', 1),
(324, 18, 'Rajshahi', 'RAJ', 1),
(325, 18, 'Sylhet', 'SYL', 1),
(326, 19, 'Christ Church', 'CC', 1),
(327, 19, 'Saint Andrew', 'AND', 1),
(328, 19, 'Saint George', 'GEO', 1),
(329, 19, 'Saint James', 'JAM', 1),
(330, 19, 'Saint John', 'JOH', 1),
(331, 19, 'Saint Joseph', 'JOS', 1),
(332, 19, 'Saint Lucy', 'LUC', 1),
(333, 19, 'Saint Michael', 'MIC', 1),
(334, 19, 'Saint Peter', 'PET', 1),
(335, 19, 'Saint Philip', 'PHI', 1),
(336, 19, 'Saint Thomas', 'THO', 1),
(337, 20, 'Brestskaya (Brest)', 'BR', 1),
(338, 20, 'Homyel''skaya (Homyel'')', 'HO', 1),
(339, 20, 'Horad Minsk', 'HM', 1),
(340, 20, 'Hrodzyenskaya (Hrodna)', 'HR', 1),
(341, 20, 'Mahilyowskaya (Mahilyow)', 'MA', 1),
(342, 20, 'Minskaya', 'MI', 1),
(343, 20, 'Vitsyebskaya (Vitsyebsk)', 'VI', 1),
(344, 21, 'Antwerpen', 'VAN', 1),
(345, 21, 'Brabant Wallon', 'WBR', 1),
(346, 21, 'Hainaut', 'WHT', 1),
(347, 21, 'Liège', 'WLG', 1),
(348, 21, 'Limburg', 'VLI', 1),
(349, 21, 'Luxembourg', 'WLX', 1),
(350, 21, 'Namur', 'WNA', 1),
(351, 21, 'Oost-Vlaanderen', 'VOV', 1),
(352, 21, 'Vlaams Brabant', 'VBR', 1),
(353, 21, 'West-Vlaanderen', 'VWV', 1),
(354, 22, 'Belize', 'BZ', 1),
(355, 22, 'Cayo', 'CY', 1),
(356, 22, 'Corozal', 'CR', 1),
(357, 22, 'Orange Walk', 'OW', 1),
(358, 22, 'Stann Creek', 'SC', 1),
(359, 22, 'Toledo', 'TO', 1),
(360, 23, 'Alibori', 'AL', 1),
(361, 23, 'Atakora', 'AK', 1),
(362, 23, 'Atlantique', 'AQ', 1),
(363, 23, 'Borgou', 'BO', 1),
(364, 23, 'Collines', 'CO', 1),
(365, 23, 'Donga', 'DO', 1),
(366, 23, 'Kouffo', 'KO', 1),
(367, 23, 'Littoral', 'LI', 1),
(368, 23, 'Mono', 'MO', 1),
(369, 23, 'Oueme', 'OU', 1),
(370, 23, 'Plateau', 'PL', 1),
(371, 23, 'Zou', 'ZO', 1),
(372, 24, 'Devonshire', 'DS', 1),
(373, 24, 'Hamilton City', 'HC', 1),
(374, 24, 'Hamilton', 'HA', 1),
(375, 24, 'Paget', 'PG', 1),
(376, 24, 'Pembroke', 'PB', 1),
(377, 24, 'Saint George City', 'GC', 1),
(378, 24, 'Saint George''s', 'SG', 1),
(379, 24, 'Sandys', 'SA', 1),
(380, 24, 'Smith''s', 'SM', 1),
(381, 24, 'Southampton', 'SH', 1),
(382, 24, 'Warwick', 'WA', 1),
(383, 25, 'Bumthang', 'BUM', 1),
(384, 25, 'Chukha', 'CHU', 1),
(385, 25, 'Dagana', 'DAG', 1),
(386, 25, 'Gasa', 'GAS', 1),
(387, 25, 'Haa', 'HAA', 1),
(388, 25, 'Lhuntse', 'LHU', 1),
(389, 25, 'Mongar', 'MON', 1),
(390, 25, 'Paro', 'PAR', 1),
(391, 25, 'Pemagatshel', 'PEM', 1),
(392, 25, 'Punakha', 'PUN', 1),
(393, 25, 'Samdrup Jongkhar', 'SJO', 1),
(394, 25, 'Samtse', 'SAT', 1),
(395, 25, 'Sarpang', 'SAR', 1),
(396, 25, 'Thimphu', 'THI', 1),
(397, 25, 'Trashigang', 'TRG', 1),
(398, 25, 'Trashiyangste', 'TRY', 1),
(399, 25, 'Trongsa', 'TRO', 1),
(400, 25, 'Tsirang', 'TSI', 1),
(401, 25, 'Wangdue Phodrang', 'WPH', 1),
(402, 25, 'Zhemgang', 'ZHE', 1),
(403, 26, 'Beni', 'BEN', 1),
(404, 26, 'Chuquisaca', 'CHU', 1),
(405, 26, 'Cochabamba', 'COC', 1),
(406, 26, 'La Paz', 'LPZ', 1),
(407, 26, 'Oruro', 'ORU', 1),
(408, 26, 'Pando', 'PAN', 1),
(409, 26, 'Potosi', 'POT', 1),
(410, 26, 'Santa Cruz', 'SCZ', 1),
(411, 26, 'Tarija', 'TAR', 1),
(412, 27, 'Brcko district', 'BRO', 1),
(413, 27, 'Unsko-Sanski Kanton', 'FUS', 1),
(414, 27, 'Posavski Kanton', 'FPO', 1),
(415, 27, 'Tuzlanski Kanton', 'FTU', 1),
(416, 27, 'Zenicko-Dobojski Kanton', 'FZE', 1),
(417, 27, 'Bosanskopodrinjski Kanton', 'FBP', 1),
(418, 27, 'Srednjebosanski Kanton', 'FSB', 1),
(419, 27, 'Hercegovacko-neretvanski Kanton', 'FHN', 1),
(420, 27, 'Zapadnohercegovacka Zupanija', 'FZH', 1),
(421, 27, 'Kanton Sarajevo', 'FSA', 1),
(422, 27, 'Zapadnobosanska', 'FZA', 1),
(423, 27, 'Banja Luka', 'SBL', 1),
(424, 27, 'Doboj', 'SDO', 1),
(425, 27, 'Bijeljina', 'SBI', 1),
(426, 27, 'Vlasenica', 'SVL', 1),
(427, 27, 'Sarajevo-Romanija or Sokolac', 'SSR', 1),
(428, 27, 'Foca', 'SFO', 1),
(429, 27, 'Trebinje', 'STR', 1),
(430, 28, 'Central', 'CE', 1),
(431, 28, 'Ghanzi', 'GH', 1),
(432, 28, 'Kgalagadi', 'KD', 1),
(433, 28, 'Kgatleng', 'KT', 1),
(434, 28, 'Kweneng', 'KW', 1),
(435, 28, 'Ngamiland', 'NG', 1),
(436, 28, 'North East', 'NE', 1),
(437, 28, 'North West', 'NW', 1),
(438, 28, 'South East', 'SE', 1),
(439, 28, 'Southern', 'SO', 1),
(440, 30, 'Acre', 'AC', 1),
(441, 30, 'Alagoas', 'AL', 1),
(442, 30, 'Amapá', 'AP', 1),
(443, 30, 'Amazonas', 'AM', 1),
(444, 30, 'Bahia', 'BA', 1),
(445, 30, 'Ceará', 'CE', 1),
(446, 30, 'Distrito Federal', 'DF', 1),
(447, 30, 'Espírito Santo', 'ES', 1),
(448, 30, 'Goiás', 'GO', 1),
(449, 30, 'Maranhão', 'MA', 1),
(450, 30, 'Mato Grosso', 'MT', 1),
(451, 30, 'Mato Grosso do Sul', 'MS', 1),
(452, 30, 'Minas Gerais', 'MG', 1),
(453, 30, 'Pará', 'PA', 1),
(454, 30, 'Paraíba', 'PB', 1),
(455, 30, 'Paraná', 'PR', 1),
(456, 30, 'Pernambuco', 'PE', 1),
(457, 30, 'Piauí', 'PI', 1),
(458, 30, 'Rio de Janeiro', 'RJ', 1),
(459, 30, 'Rio Grande do Norte', 'RN', 1),
(460, 30, 'Rio Grande do Sul', 'RS', 1),
(461, 30, 'Rondônia', 'RO', 1),
(462, 30, 'Roraima', 'RR', 1),
(463, 30, 'Santa Catarina', 'SC', 1),
(464, 30, 'São Paulo', 'SP', 1),
(465, 30, 'Sergipe', 'SE', 1),
(466, 30, 'Tocantins', 'TO', 1),
(467, 31, 'Peros Banhos', 'PB', 1),
(468, 31, 'Salomon Islands', 'SI', 1),
(469, 31, 'Nelsons Island', 'NI', 1),
(470, 31, 'Three Brothers', 'TB', 1),
(471, 31, 'Eagle Islands', 'EA', 1),
(472, 31, 'Danger Island', 'DI', 1),
(473, 31, 'Egmont Islands', 'EG', 1),
(474, 31, 'Diego Garcia', 'DG', 1),
(475, 32, 'Belait', 'BEL', 1),
(476, 32, 'Brunei and Muara', 'BRM', 1),
(477, 32, 'Temburong', 'TEM', 1),
(478, 32, 'Tutong', 'TUT', 1),
(479, 33, 'Blagoevgrad', '', 1),
(480, 33, 'Burgas', '', 1),
(481, 33, 'Dobrich', '', 1),
(482, 33, 'Gabrovo', '', 1),
(483, 33, 'Haskovo', '', 1),
(484, 33, 'Kardjali', '', 1),
(485, 33, 'Kyustendil', '', 1),
(486, 33, 'Lovech', '', 1),
(487, 33, 'Montana', '', 1),
(488, 33, 'Pazardjik', '', 1),
(489, 33, 'Pernik', '', 1),
(490, 33, 'Pleven', '', 1),
(491, 33, 'Plovdiv', '', 1),
(492, 33, 'Razgrad', '', 1),
(493, 33, 'Shumen', '', 1),
(494, 33, 'Silistra', '', 1),
(495, 33, 'Sliven', '', 1),
(496, 33, 'Smolyan', '', 1),
(497, 33, 'Sofia', '', 1),
(498, 33, 'Sofia - town', '', 1),
(499, 33, 'Stara Zagora', '', 1),
(500, 33, 'Targovishte', '', 1),
(501, 33, 'Varna', '', 1),
(502, 33, 'Veliko Tarnovo', '', 1),
(503, 33, 'Vidin', '', 1),
(504, 33, 'Vratza', '', 1),
(505, 33, 'Yambol', '', 1),
(506, 34, 'Bale', 'BAL', 1),
(507, 34, 'Bam', 'BAM', 1),
(508, 34, 'Banwa', 'BAN', 1),
(509, 34, 'Bazega', 'BAZ', 1),
(510, 34, 'Bougouriba', 'BOR', 1),
(511, 34, 'Boulgou', 'BLG', 1),
(512, 34, 'Boulkiemde', 'BOK', 1),
(513, 34, 'Comoe', 'COM', 1),
(514, 34, 'Ganzourgou', 'GAN', 1),
(515, 34, 'Gnagna', 'GNA', 1),
(516, 34, 'Gourma', 'GOU', 1),
(517, 34, 'Houet', 'HOU', 1),
(518, 34, 'Ioba', 'IOA', 1),
(519, 34, 'Kadiogo', 'KAD', 1),
(520, 34, 'Kenedougou', 'KEN', 1),
(521, 34, 'Komondjari', 'KOD', 1),
(522, 34, 'Kompienga', 'KOP', 1),
(523, 34, 'Kossi', 'KOS', 1),
(524, 34, 'Koulpelogo', 'KOL', 1),
(525, 34, 'Kouritenga', 'KOT', 1),
(526, 34, 'Kourweogo', 'KOW', 1),
(527, 34, 'Leraba', 'LER', 1),
(528, 34, 'Loroum', 'LOR', 1),
(529, 34, 'Mouhoun', 'MOU', 1),
(530, 34, 'Nahouri', 'NAH', 1),
(531, 34, 'Namentenga', 'NAM', 1),
(532, 34, 'Nayala', 'NAY', 1),
(533, 34, 'Noumbiel', 'NOU', 1),
(534, 34, 'Oubritenga', 'OUB', 1),
(535, 34, 'Oudalan', 'OUD', 1),
(536, 34, 'Passore', 'PAS', 1),
(537, 34, 'Poni', 'PON', 1),
(538, 34, 'Sanguie', 'SAG', 1),
(539, 34, 'Sanmatenga', 'SAM', 1),
(540, 34, 'Seno', 'SEN', 1),
(541, 34, 'Sissili', 'SIS', 1),
(542, 34, 'Soum', 'SOM', 1),
(543, 34, 'Sourou', 'SOR', 1),
(544, 34, 'Tapoa', 'TAP', 1),
(545, 34, 'Tuy', 'TUY', 1),
(546, 34, 'Yagha', 'YAG', 1),
(547, 34, 'Yatenga', 'YAT', 1),
(548, 34, 'Ziro', 'ZIR', 1),
(549, 34, 'Zondoma', 'ZOD', 1),
(550, 34, 'Zoundweogo', 'ZOW', 1),
(551, 35, 'Bubanza', 'BB', 1),
(552, 35, 'Bujumbura', 'BJ', 1),
(553, 35, 'Bururi', 'BR', 1),
(554, 35, 'Cankuzo', 'CA', 1),
(555, 35, 'Cibitoke', 'CI', 1),
(556, 35, 'Gitega', 'GI', 1),
(557, 35, 'Karuzi', 'KR', 1),
(558, 35, 'Kayanza', 'KY', 1),
(559, 35, 'Kirundo', 'KI', 1),
(560, 35, 'Makamba', 'MA', 1),
(561, 35, 'Muramvya', 'MU', 1),
(562, 35, 'Muyinga', 'MY', 1),
(563, 35, 'Mwaro', 'MW', 1),
(564, 35, 'Ngozi', 'NG', 1),
(565, 35, 'Rutana', 'RT', 1),
(566, 35, 'Ruyigi', 'RY', 1),
(567, 36, 'Phnom Penh', 'PP', 1),
(568, 36, 'Preah Seihanu (Kompong Som or Sihanoukville)', 'PS', 1),
(569, 36, 'Pailin', 'PA', 1),
(570, 36, 'Keb', 'KB', 1),
(571, 36, 'Banteay Meanchey', 'BM', 1),
(572, 36, 'Battambang', 'BA', 1),
(573, 36, 'Kampong Cham', 'KM', 1),
(574, 36, 'Kampong Chhnang', 'KN', 1),
(575, 36, 'Kampong Speu', 'KU', 1),
(576, 36, 'Kampong Som', 'KO', 1),
(577, 36, 'Kampong Thom', 'KT', 1),
(578, 36, 'Kampot', 'KP', 1),
(579, 36, 'Kandal', 'KL', 1),
(580, 36, 'Kaoh Kong', 'KK', 1),
(581, 36, 'Kratie', 'KR', 1),
(582, 36, 'Mondul Kiri', 'MK', 1),
(583, 36, 'Oddar Meancheay', 'OM', 1),
(584, 36, 'Pursat', 'PU', 1),
(585, 36, 'Preah Vihear', 'PR', 1),
(586, 36, 'Prey Veng', 'PG', 1),
(587, 36, 'Ratanak Kiri', 'RK', 1),
(588, 36, 'Siemreap', 'SI', 1),
(589, 36, 'Stung Treng', 'ST', 1),
(590, 36, 'Svay Rieng', 'SR', 1),
(591, 36, 'Takeo', 'TK', 1),
(592, 37, 'Adamawa (Adamaoua)', 'ADA', 1),
(593, 37, 'Centre', 'CEN', 1),
(594, 37, 'East (Est)', 'EST', 1),
(595, 37, 'Extreme North (Extreme-Nord)', 'EXN', 1),
(596, 37, 'Littoral', 'LIT', 1),
(597, 37, 'North (Nord)', 'NOR', 1),
(598, 37, 'Northwest (Nord-Ouest)', 'NOT', 1),
(599, 37, 'West (Ouest)', 'OUE', 1),
(600, 37, 'South (Sud)', 'SUD', 1),
(601, 37, 'Southwest (Sud-Ouest).', 'SOU', 1),
(602, 38, 'Alberta', 'AB', 1),
(603, 38, 'British Columbia', 'BC', 1),
(604, 38, 'Manitoba', 'MB', 1),
(605, 38, 'New Brunswick', 'NB', 1),
(606, 38, 'Newfoundland and Labrador', 'NL', 1),
(607, 38, 'Northwest Territories', 'NT', 1),
(608, 38, 'Nova Scotia', 'NS', 1),
(609, 38, 'Nunavut', 'NU', 1),
(610, 38, 'Ontario', 'ON', 1),
(611, 38, 'Prince Edward Island', 'PE', 1),
(612, 38, 'Qu&eacute;bec', 'QC', 1),
(613, 38, 'Saskatchewan', 'SK', 1),
(614, 38, 'Yukon Territory', 'YT', 1),
(615, 39, 'Boa Vista', 'BV', 1),
(616, 39, 'Brava', 'BR', 1),
(617, 39, 'Calheta de Sao Miguel', 'CS', 1),
(618, 39, 'Maio', 'MA', 1),
(619, 39, 'Mosteiros', 'MO', 1),
(620, 39, 'Paul', 'PA', 1),
(621, 39, 'Porto Novo', 'PN', 1),
(622, 39, 'Praia', 'PR', 1),
(623, 39, 'Ribeira Grande', 'RG', 1),
(624, 39, 'Sal', 'SL', 1),
(625, 39, 'Santa Catarina', 'CA', 1),
(626, 39, 'Santa Cruz', 'CR', 1),
(627, 39, 'Sao Domingos', 'SD', 1),
(628, 39, 'Sao Filipe', 'SF', 1),
(629, 39, 'Sao Nicolau', 'SN', 1),
(630, 39, 'Sao Vicente', 'SV', 1),
(631, 39, 'Tarrafal', 'TA', 1),
(632, 40, 'Creek', 'CR', 1),
(633, 40, 'Eastern', 'EA', 1),
(634, 40, 'Midland', 'ML', 1),
(635, 40, 'South Town', 'ST', 1),
(636, 40, 'Spot Bay', 'SP', 1),
(637, 40, 'Stake Bay', 'SK', 1),
(638, 40, 'West End', 'WD', 1),
(639, 40, 'Western', 'WN', 1),
(640, 41, 'Bamingui-Bangoran', 'BBA', 1),
(641, 41, 'Basse-Kotto', 'BKO', 1),
(642, 41, 'Haute-Kotto', 'HKO', 1),
(643, 41, 'Haut-Mbomou', 'HMB', 1),
(644, 41, 'Kemo', 'KEM', 1),
(645, 41, 'Lobaye', 'LOB', 1),
(646, 41, 'Mambere-KadeÔ', 'MKD', 1),
(647, 41, 'Mbomou', 'MBO', 1),
(648, 41, 'Nana-Mambere', 'NMM', 1),
(649, 41, 'Ombella-M''Poko', 'OMP', 1),
(650, 41, 'Ouaka', 'OUK', 1),
(651, 41, 'Ouham', 'OUH', 1),
(652, 41, 'Ouham-Pende', 'OPE', 1),
(653, 41, 'Vakaga', 'VAK', 1),
(654, 41, 'Nana-Grebizi', 'NGR', 1),
(655, 41, 'Sangha-Mbaere', 'SMB', 1),
(656, 41, 'Bangui', 'BAN', 1),
(657, 42, 'Batha', 'BA', 1),
(658, 42, 'Biltine', 'BI', 1),
(659, 42, 'Borkou-Ennedi-Tibesti', 'BE', 1),
(660, 42, 'Chari-Baguirmi', 'CB', 1),
(661, 42, 'Guera', 'GU', 1),
(662, 42, 'Kanem', 'KA', 1),
(663, 42, 'Lac', 'LA', 1),
(664, 42, 'Logone Occidental', 'LC', 1),
(665, 42, 'Logone Oriental', 'LR', 1),
(666, 42, 'Mayo-Kebbi', 'MK', 1),
(667, 42, 'Moyen-Chari', 'MC', 1),
(668, 42, 'Ouaddai', 'OU', 1),
(669, 42, 'Salamat', 'SA', 1),
(670, 42, 'Tandjile', 'TA', 1),
(671, 43, 'Aisen del General Carlos Ibanez', 'AI', 1),
(672, 43, 'Antofagasta', 'AN', 1),
(673, 43, 'Araucania', 'AR', 1),
(674, 43, 'Atacama', 'AT', 1),
(675, 43, 'Bio-Bio', 'BI', 1),
(676, 43, 'Coquimbo', 'CO', 1),
(677, 43, 'Libertador General Bernardo O''Higgins', 'LI', 1),
(678, 43, 'Los Lagos', 'LL', 1),
(679, 43, 'Magallanes y de la Antartica Chilena', 'MA', 1),
(680, 43, 'Maule', 'ML', 1),
(681, 43, 'Region Metropolitana', 'RM', 1),
(682, 43, 'Tarapaca', 'TA', 1),
(683, 43, 'Valparaiso', 'VS', 1),
(684, 44, 'Anhui', 'AN', 1),
(685, 44, 'Beijing', 'BE', 1),
(686, 44, 'Chongqing', 'CH', 1),
(687, 44, 'Fujian', 'FU', 1),
(688, 44, 'Gansu', 'GA', 1),
(689, 44, 'Guangdong', 'GU', 1),
(690, 44, 'Guangxi', 'GX', 1),
(691, 44, 'Guizhou', 'GZ', 1),
(692, 44, 'Hainan', 'HA', 1),
(693, 44, 'Hebei', 'HB', 1),
(694, 44, 'Heilongjiang', 'HL', 1),
(695, 44, 'Henan', 'HE', 1),
(696, 44, 'Hong Kong', 'HK', 1),
(697, 44, 'Hubei', 'HU', 1),
(698, 44, 'Hunan', 'HN', 1),
(699, 44, 'Inner Mongolia', 'IM', 1),
(700, 44, 'Jiangsu', 'JI', 1),
(701, 44, 'Jiangxi', 'JX', 1),
(702, 44, 'Jilin', 'JL', 1),
(703, 44, 'Liaoning', 'LI', 1),
(704, 44, 'Macau', 'MA', 1),
(705, 44, 'Ningxia', 'NI', 1),
(706, 44, 'Shaanxi', 'SH', 1),
(707, 44, 'Shandong', 'SA', 1),
(708, 44, 'Shanghai', 'SG', 1),
(709, 44, 'Shanxi', 'SX', 1),
(710, 44, 'Sichuan', 'SI', 1),
(711, 44, 'Tianjin', 'TI', 1),
(712, 44, 'Xinjiang', 'XI', 1),
(713, 44, 'Yunnan', 'YU', 1),
(714, 44, 'Zhejiang', 'ZH', 1),
(715, 46, 'Direction Island', 'D', 1),
(716, 46, 'Home Island', 'H', 1),
(717, 46, 'Horsburgh Island', 'O', 1),
(718, 46, 'South Island', 'S', 1),
(719, 46, 'West Island', 'W', 1),
(720, 47, 'Amazonas', 'AMZ', 1),
(721, 47, 'Antioquia', 'ANT', 1),
(722, 47, 'Arauca', 'ARA', 1),
(723, 47, 'Atlantico', 'ATL', 1),
(724, 47, 'Bogota D.C.', 'BDC', 1),
(725, 47, 'Bolivar', 'BOL', 1),
(726, 47, 'Boyaca', 'BOY', 1),
(727, 47, 'Caldas', 'CAL', 1),
(728, 47, 'Caqueta', 'CAQ', 1),
(729, 47, 'Casanare', 'CAS', 1),
(730, 47, 'Cauca', 'CAU', 1),
(731, 47, 'Cesar', 'CES', 1),
(732, 47, 'Choco', 'CHO', 1),
(733, 47, 'Cordoba', 'COR', 1),
(734, 47, 'Cundinamarca', 'CAM', 1),
(735, 47, 'Guainia', 'GNA', 1),
(736, 47, 'Guajira', 'GJR', 1),
(737, 47, 'Guaviare', 'GVR', 1),
(738, 47, 'Huila', 'HUI', 1),
(739, 47, 'Magdalena', 'MAG', 1),
(740, 47, 'Meta', 'MET', 1),
(741, 47, 'Narino', 'NAR', 1),
(742, 47, 'Norte de Santander', 'NDS', 1),
(743, 47, 'Putumayo', 'PUT', 1),
(744, 47, 'Quindio', 'QUI', 1),
(745, 47, 'Risaralda', 'RIS', 1),
(746, 47, 'San Andres y Providencia', 'SAP', 1),
(747, 47, 'Santander', 'SAN', 1),
(748, 47, 'Sucre', 'SUC', 1),
(749, 47, 'Tolima', 'TOL', 1),
(750, 47, 'Valle del Cauca', 'VDC', 1),
(751, 47, 'Vaupes', 'VAU', 1),
(752, 47, 'Vichada', 'VIC', 1),
(753, 48, 'Grande Comore', 'G', 1),
(754, 48, 'Anjouan', 'A', 1),
(755, 48, 'Moheli', 'M', 1),
(756, 49, 'Bouenza', 'BO', 1),
(757, 49, 'Brazzaville', 'BR', 1),
(758, 49, 'Cuvette', 'CU', 1),
(759, 49, 'Cuvette-Ouest', 'CO', 1),
(760, 49, 'Kouilou', 'KO', 1),
(761, 49, 'Lekoumou', 'LE', 1),
(762, 49, 'Likouala', 'LI', 1),
(763, 49, 'Niari', 'NI', 1),
(764, 49, 'Plateaux', 'PL', 1),
(765, 49, 'Pool', 'PO', 1),
(766, 49, 'Sangha', 'SA', 1),
(767, 50, 'Pukapuka', 'PU', 1),
(768, 50, 'Rakahanga', 'RK', 1),
(769, 50, 'Manihiki', 'MK', 1),
(770, 50, 'Penrhyn', 'PE', 1),
(771, 50, 'Nassau Island', 'NI', 1),
(772, 50, 'Surwarrow', 'SU', 1),
(773, 50, 'Palmerston', 'PA', 1),
(774, 50, 'Aitutaki', 'AI', 1),
(775, 50, 'Manuae', 'MA', 1),
(776, 50, 'Takutea', 'TA', 1),
(777, 50, 'Mitiaro', 'MT', 1),
(778, 50, 'Atiu', 'AT', 1),
(779, 50, 'Mauke', 'MU', 1),
(780, 50, 'Rarotonga', 'RR', 1),
(781, 50, 'Mangaia', 'MG', 1),
(782, 51, 'Alajuela', 'AL', 1),
(783, 51, 'Cartago', 'CA', 1),
(784, 51, 'Guanacaste', 'GU', 1),
(785, 51, 'Heredia', 'HE', 1),
(786, 51, 'Limon', 'LI', 1),
(787, 51, 'Puntarenas', 'PU', 1),
(788, 51, 'San Jose', 'SJ', 1),
(789, 52, 'Abengourou', 'ABE', 1),
(790, 52, 'Abidjan', 'ABI', 1),
(791, 52, 'Aboisso', 'ABO', 1),
(792, 52, 'Adiake', 'ADI', 1),
(793, 52, 'Adzope', 'ADZ', 1),
(794, 52, 'Agboville', 'AGB', 1),
(795, 52, 'Agnibilekrou', 'AGN', 1),
(796, 52, 'Alepe', 'ALE', 1),
(797, 52, 'Bocanda', 'BOC', 1),
(798, 52, 'Bangolo', 'BAN', 1),
(799, 52, 'Beoumi', 'BEO', 1),
(800, 52, 'Biankouma', 'BIA', 1),
(801, 52, 'Bondoukou', 'BDK', 1),
(802, 52, 'Bongouanou', 'BGN', 1),
(803, 52, 'Bouafle', 'BFL', 1),
(804, 52, 'Bouake', 'BKE', 1),
(805, 52, 'Bouna', 'BNA', 1),
(806, 52, 'Boundiali', 'BDL', 1),
(807, 52, 'Dabakala', 'DKL', 1),
(808, 52, 'Dabou', 'DBU', 1),
(809, 52, 'Daloa', 'DAL', 1),
(810, 52, 'Danane', 'DAN', 1),
(811, 52, 'Daoukro', 'DAO', 1),
(812, 52, 'Dimbokro', 'DIM', 1),
(813, 52, 'Divo', 'DIV', 1),
(814, 52, 'Duekoue', 'DUE', 1),
(815, 52, 'Ferkessedougou', 'FER', 1),
(816, 52, 'Gagnoa', 'GAG', 1),
(817, 52, 'Grand-Bassam', 'GBA', 1),
(818, 52, 'Grand-Lahou', 'GLA', 1),
(819, 52, 'Guiglo', 'GUI', 1),
(820, 52, 'Issia', 'ISS', 1),
(821, 52, 'Jacqueville', 'JAC', 1),
(822, 52, 'Katiola', 'KAT', 1),
(823, 52, 'Korhogo', 'KOR', 1),
(824, 52, 'Lakota', 'LAK', 1),
(825, 52, 'Man', 'MAN', 1),
(826, 52, 'Mankono', 'MKN', 1),
(827, 52, 'Mbahiakro', 'MBA', 1),
(828, 52, 'Odienne', 'ODI', 1),
(829, 52, 'Oume', 'OUM', 1),
(830, 52, 'Sakassou', 'SAK', 1),
(831, 52, 'San-Pedro', 'SPE', 1),
(832, 52, 'Sassandra', 'SAS', 1),
(833, 52, 'Seguela', 'SEG', 1),
(834, 52, 'Sinfra', 'SIN', 1),
(835, 52, 'Soubre', 'SOU', 1),
(836, 52, 'Tabou', 'TAB', 1),
(837, 52, 'Tanda', 'TAN', 1),
(838, 52, 'Tiebissou', 'TIE', 1),
(839, 52, 'Tingrela', 'TIN', 1),
(840, 52, 'Tiassale', 'TIA', 1),
(841, 52, 'Touba', 'TBA', 1),
(842, 52, 'Toulepleu', 'TLP', 1),
(843, 52, 'Toumodi', 'TMD', 1),
(844, 52, 'Vavoua', 'VAV', 1),
(845, 52, 'Yamoussoukro', 'YAM', 1),
(846, 52, 'Zuenoula', 'ZUE', 1),
(847, 53, 'Bjelovarsko-bilogorska', 'BB', 1),
(848, 53, 'Grad Zagreb', 'GZ', 1),
(849, 53, 'Dubrovačko-neretvanska', 'DN', 1),
(850, 53, 'Istarska', 'IS', 1),
(851, 53, 'Karlovačka', 'KA', 1),
(852, 53, 'Koprivničko-križevačka', 'KK', 1),
(853, 53, 'Krapinsko-zagorska', 'KZ', 1),
(854, 53, 'Ličko-senjska', 'LS', 1),
(855, 53, 'Međimurska', 'ME', 1),
(856, 53, 'Osječko-baranjska', 'OB', 1),
(857, 53, 'Požeško-slavonska', 'PS', 1),
(858, 53, 'Primorsko-goranska', 'PG', 1),
(859, 53, 'Šibensko-kninska', 'SK', 1),
(860, 53, 'Sisačko-moslavačka', 'SM', 1),
(861, 53, 'Brodsko-posavska', 'BP', 1),
(862, 53, 'Splitsko-dalmatinska', 'SD', 1),
(863, 53, 'Varaždinska', 'VA', 1),
(864, 53, 'Virovitičko-podravska', 'VP', 1),
(865, 53, 'Vukovarsko-srijemska', 'VS', 1),
(866, 53, 'Zadarska', 'ZA', 1),
(867, 53, 'Zagrebačka', 'ZG', 1),
(868, 54, 'Camaguey', 'CA', 1),
(869, 54, 'Ciego de Avila', 'CD', 1),
(870, 54, 'Cienfuegos', 'CI', 1),
(871, 54, 'Ciudad de La Habana', 'CH', 1),
(872, 54, 'Granma', 'GR', 1),
(873, 54, 'Guantanamo', 'GU', 1),
(874, 54, 'Holguin', 'HO', 1),
(875, 54, 'Isla de la Juventud', 'IJ', 1),
(876, 54, 'La Habana', 'LH', 1),
(877, 54, 'Las Tunas', 'LT', 1),
(878, 54, 'Matanzas', 'MA', 1),
(879, 54, 'Pinar del Rio', 'PR', 1),
(880, 54, 'Sancti Spiritus', 'SS', 1),
(881, 54, 'Santiago de Cuba', 'SC', 1),
(882, 54, 'Villa Clara', 'VC', 1),
(883, 55, 'Famagusta', 'F', 1),
(884, 55, 'Kyrenia', 'K', 1),
(885, 55, 'Larnaca', 'A', 1),
(886, 55, 'Limassol', 'I', 1),
(887, 55, 'Nicosia', 'N', 1),
(888, 55, 'Paphos', 'P', 1),
(889, 56, 'Ústecký', 'U', 1),
(890, 56, 'Jihočeský', 'C', 1),
(891, 56, 'Jihomoravský', 'B', 1),
(892, 56, 'Karlovarský', 'K', 1),
(893, 56, 'Královehradecký', 'H', 1),
(894, 56, 'Liberecký', 'L', 1),
(895, 56, 'Moravskoslezský', 'T', 1),
(896, 56, 'Olomoucký', 'M', 1),
(897, 56, 'Pardubický', 'E', 1),
(898, 56, 'Plzeňský', 'P', 1),
(899, 56, 'Praha', 'A', 1),
(900, 56, 'Středočeský', 'S', 1),
(901, 56, 'Vysočina', 'J', 1),
(902, 56, 'Zlínský', 'Z', 1),
(903, 57, 'Arhus', 'AR', 1),
(904, 57, 'Bornholm', 'BH', 1),
(905, 57, 'Copenhagen', 'CO', 1),
(906, 57, 'Faroe Islands', 'FO', 1),
(907, 57, 'Frederiksborg', 'FR', 1),
(908, 57, 'Fyn', 'FY', 1),
(909, 57, 'Kobenhavn', 'KO', 1),
(910, 57, 'Nordjylland', 'NO', 1),
(911, 57, 'Ribe', 'RI', 1),
(912, 57, 'Ringkobing', 'RK', 1),
(913, 57, 'Roskilde', 'RO', 1),
(914, 57, 'Sonderjylland', 'SO', 1),
(915, 57, 'Storstrom', 'ST', 1),
(916, 57, 'Vejle', 'VK', 1),
(917, 57, 'Vestj&aelig;lland', 'VJ', 1),
(918, 57, 'Viborg', 'VB', 1),
(919, 58, '''Ali Sabih', 'S', 1),
(920, 58, 'Dikhil', 'K', 1),
(921, 58, 'Djibouti', 'J', 1),
(922, 58, 'Obock', 'O', 1),
(923, 58, 'Tadjoura', 'T', 1),
(924, 59, 'Saint Andrew Parish', 'AND', 1),
(925, 59, 'Saint David Parish', 'DAV', 1),
(926, 59, 'Saint George Parish', 'GEO', 1),
(927, 59, 'Saint John Parish', 'JOH', 1),
(928, 59, 'Saint Joseph Parish', 'JOS', 1),
(929, 59, 'Saint Luke Parish', 'LUK', 1),
(930, 59, 'Saint Mark Parish', 'MAR', 1),
(931, 59, 'Saint Patrick Parish', 'PAT', 1),
(932, 59, 'Saint Paul Parish', 'PAU', 1),
(933, 59, 'Saint Peter Parish', 'PET', 1),
(934, 60, 'Distrito Nacional', 'DN', 1),
(935, 60, 'Azua', 'AZ', 1),
(936, 60, 'Baoruco', 'BC', 1),
(937, 60, 'Barahona', 'BH', 1),
(938, 60, 'Dajabon', 'DJ', 1),
(939, 60, 'Duarte', 'DU', 1),
(940, 60, 'Elias Pina', 'EL', 1),
(941, 60, 'El Seybo', 'SY', 1),
(942, 60, 'Espaillat', 'ET', 1),
(943, 60, 'Hato Mayor', 'HM', 1),
(944, 60, 'Independencia', 'IN', 1),
(945, 60, 'La Altagracia', 'AL', 1),
(946, 60, 'La Romana', 'RO', 1),
(947, 60, 'La Vega', 'VE', 1),
(948, 60, 'Maria Trinidad Sanchez', 'MT', 1),
(949, 60, 'Monsenor Nouel', 'MN', 1),
(950, 60, 'Monte Cristi', 'MC', 1),
(951, 60, 'Monte Plata', 'MP', 1),
(952, 60, 'Pedernales', 'PD', 1),
(953, 60, 'Peravia (Bani)', 'PR', 1),
(954, 60, 'Puerto Plata', 'PP', 1),
(955, 60, 'Salcedo', 'SL', 1),
(956, 60, 'Samana', 'SM', 1),
(957, 60, 'Sanchez Ramirez', 'SH', 1),
(958, 60, 'San Cristobal', 'SC', 1),
(959, 60, 'San Jose de Ocoa', 'JO', 1),
(960, 60, 'San Juan', 'SJ', 1),
(961, 60, 'San Pedro de Macoris', 'PM', 1),
(962, 60, 'Santiago', 'SA', 1),
(963, 60, 'Santiago Rodriguez', 'ST', 1),
(964, 60, 'Santo Domingo', 'SD', 1),
(965, 60, 'Valverde', 'VA', 1),
(966, 61, 'Aileu', 'AL', 1),
(967, 61, 'Ainaro', 'AN', 1),
(968, 61, 'Baucau', 'BA', 1),
(969, 61, 'Bobonaro', 'BO', 1),
(970, 61, 'Cova Lima', 'CO', 1),
(971, 61, 'Dili', 'DI', 1),
(972, 61, 'Ermera', 'ER', 1),
(973, 61, 'Lautem', 'LA', 1),
(974, 61, 'Liquica', 'LI', 1),
(975, 61, 'Manatuto', 'MT', 1),
(976, 61, 'Manufahi', 'MF', 1),
(977, 61, 'Oecussi', 'OE', 1),
(978, 61, 'Viqueque', 'VI', 1),
(979, 62, 'Azuay', 'AZU', 1),
(980, 62, 'Bolivar', 'BOL', 1),
(981, 62, 'Ca&ntilde;ar', 'CAN', 1),
(982, 62, 'Carchi', 'CAR', 1),
(983, 62, 'Chimborazo', 'CHI', 1),
(984, 62, 'Cotopaxi', 'COT', 1),
(985, 62, 'El Oro', 'EOR', 1),
(986, 62, 'Esmeraldas', 'ESM', 1),
(987, 62, 'Gal&aacute;pagos', 'GPS', 1),
(988, 62, 'Guayas', 'GUA', 1),
(989, 62, 'Imbabura', 'IMB', 1),
(990, 62, 'Loja', 'LOJ', 1),
(991, 62, 'Los Rios', 'LRO', 1),
(992, 62, 'Manab&iacute;', 'MAN', 1),
(993, 62, 'Morona Santiago', 'MSA', 1),
(994, 62, 'Napo', 'NAP', 1),
(995, 62, 'Orellana', 'ORE', 1),
(996, 62, 'Pastaza', 'PAS', 1),
(997, 62, 'Pichincha', 'PIC', 1),
(998, 62, 'Sucumb&iacute;os', 'SUC', 1),
(999, 62, 'Tungurahua', 'TUN', 1),
(1000, 62, 'Zamora Chinchipe', 'ZCH', 1),
(1001, 63, 'Ad Daqahliyah', 'DHY', 1),
(1002, 63, 'Al Bahr al Ahmar', 'BAM', 1),
(1003, 63, 'Al Buhayrah', 'BHY', 1),
(1004, 63, 'Al Fayyum', 'FYM', 1),
(1005, 63, 'Al Gharbiyah', 'GBY', 1),
(1006, 63, 'Al Iskandariyah', 'IDR', 1),
(1007, 63, 'Al Isma''iliyah', 'IML', 1),
(1008, 63, 'Al Jizah', 'JZH', 1),
(1009, 63, 'Al Minufiyah', 'MFY', 1),
(1010, 63, 'Al Minya', 'MNY', 1),
(1011, 63, 'Al Qahirah', 'QHR', 1),
(1012, 63, 'Al Qalyubiyah', 'QLY', 1),
(1013, 63, 'Al Wadi al Jadid', 'WJD', 1),
(1014, 63, 'Ash Sharqiyah', 'SHQ', 1),
(1015, 63, 'As Suways', 'SWY', 1),
(1016, 63, 'Aswan', 'ASW', 1),
(1017, 63, 'Asyut', 'ASY', 1),
(1018, 63, 'Bani Suwayf', 'BSW', 1),
(1019, 63, 'Bur Sa''id', 'BSD', 1),
(1020, 63, 'Dumyat', 'DMY', 1),
(1021, 63, 'Janub Sina''', 'JNS', 1),
(1022, 63, 'Kafr ash Shaykh', 'KSH', 1),
(1023, 63, 'Matruh', 'MAT', 1),
(1024, 63, 'Qina', 'QIN', 1),
(1025, 63, 'Shamal Sina''', 'SHS', 1),
(1026, 63, 'Suhaj', 'SUH', 1),
(1027, 64, 'Ahuachapan', 'AH', 1),
(1028, 64, 'Cabanas', 'CA', 1),
(1029, 64, 'Chalatenango', 'CH', 1),
(1030, 64, 'Cuscatlan', 'CU', 1),
(1031, 64, 'La Libertad', 'LB', 1),
(1032, 64, 'La Paz', 'PZ', 1),
(1033, 64, 'La Union', 'UN', 1),
(1034, 64, 'Morazan', 'MO', 1),
(1035, 64, 'San Miguel', 'SM', 1),
(1036, 64, 'San Salvador', 'SS', 1),
(1037, 64, 'San Vicente', 'SV', 1),
(1038, 64, 'Santa Ana', 'SA', 1),
(1039, 64, 'Sonsonate', 'SO', 1),
(1040, 64, 'Usulutan', 'US', 1),
(1041, 65, 'Provincia Annobon', 'AN', 1),
(1042, 65, 'Provincia Bioko Norte', 'BN', 1),
(1043, 65, 'Provincia Bioko Sur', 'BS', 1),
(1044, 65, 'Provincia Centro Sur', 'CS', 1),
(1045, 65, 'Provincia Kie-Ntem', 'KN', 1),
(1046, 65, 'Provincia Litoral', 'LI', 1),
(1047, 65, 'Provincia Wele-Nzas', 'WN', 1),
(1048, 66, 'Central (Maekel)', 'MA', 1),
(1049, 66, 'Anseba (Keren)', 'KE', 1),
(1050, 66, 'Southern Red Sea (Debub-Keih-Bahri)', 'DK', 1),
(1051, 66, 'Northern Red Sea (Semien-Keih-Bahri)', 'SK', 1),
(1052, 66, 'Southern (Debub)', 'DE', 1),
(1053, 66, 'Gash-Barka (Barentu)', 'BR', 1),
(1054, 67, 'Harjumaa (Tallinn)', 'HA', 1),
(1055, 67, 'Hiiumaa (Kardla)', 'HI', 1),
(1056, 67, 'Ida-Virumaa (Johvi)', 'IV', 1),
(1057, 67, 'Jarvamaa (Paide)', 'JA', 1),
(1058, 67, 'Jogevamaa (Jogeva)', 'JO', 1),
(1059, 67, 'Laane-Virumaa (Rakvere)', 'LV', 1),
(1060, 67, 'Laanemaa (Haapsalu)', 'LA', 1),
(1061, 67, 'Parnumaa (Parnu)', 'PA', 1),
(1062, 67, 'Polvamaa (Polva)', 'PO', 1),
(1063, 67, 'Raplamaa (Rapla)', 'RA', 1),
(1064, 67, 'Saaremaa (Kuessaare)', 'SA', 1),
(1065, 67, 'Tartumaa (Tartu)', 'TA', 1),
(1066, 67, 'Valgamaa (Valga)', 'VA', 1),
(1067, 67, 'Viljandimaa (Viljandi)', 'VI', 1),
(1068, 67, 'Vorumaa (Voru)', 'VO', 1),
(1069, 68, 'Afar', 'AF', 1),
(1070, 68, 'Amhara', 'AH', 1),
(1071, 68, 'Benishangul-Gumaz', 'BG', 1),
(1072, 68, 'Gambela', 'GB', 1),
(1073, 68, 'Hariai', 'HR', 1),
(1074, 68, 'Oromia', 'OR', 1),
(1075, 68, 'Somali', 'SM', 1),
(1076, 68, 'Southern Nations - Nationalities and Peoples Region', 'SN', 1),
(1077, 68, 'Tigray', 'TG', 1),
(1078, 68, 'Addis Ababa', 'AA', 1),
(1079, 68, 'Dire Dawa', 'DD', 1),
(1080, 71, 'Central Division', 'C', 1),
(1081, 71, 'Northern Division', 'N', 1),
(1082, 71, 'Eastern Division', 'E', 1),
(1083, 71, 'Western Division', 'W', 1),
(1084, 71, 'Rotuma', 'R', 1),
(1085, 72, 'Ahvenanmaan lääni', 'AL', 1),
(1086, 72, 'Etelä-Suomen lääni', 'ES', 1),
(1087, 72, 'Itä-Suomen lääni', 'IS', 1),
(1088, 72, 'Länsi-Suomen lääni', 'LS', 1),
(1089, 72, 'Lapin lääni', 'LA', 1),
(1090, 72, 'Oulun lääni', 'OU', 1),
(1114, 74, 'Ain', '01', 1),
(1115, 74, 'Aisne', '02', 1),
(1116, 74, 'Allier', '03', 1),
(1117, 74, 'Alpes de Haute Provence', '04', 1),
(1118, 74, 'Hautes-Alpes', '05', 1),
(1119, 74, 'Alpes Maritimes', '06', 1),
(1120, 74, 'Ard&egrave;che', '07', 1),
(1121, 74, 'Ardennes', '08', 1),
(1122, 74, 'Ari&egrave;ge', '09', 1),
(1123, 74, 'Aube', '10', 1),
(1124, 74, 'Aude', '11', 1),
(1125, 74, 'Aveyron', '12', 1),
(1126, 74, 'Bouches du Rh&ocirc;ne', '13', 1),
(1127, 74, 'Calvados', '14', 1),
(1128, 74, 'Cantal', '15', 1),
(1129, 74, 'Charente', '16', 1),
(1130, 74, 'Charente Maritime', '17', 1),
(1131, 74, 'Cher', '18', 1),
(1132, 74, 'Corr&egrave;ze', '19', 1),
(1133, 74, 'Corse du Sud', '2A', 1),
(1134, 74, 'Haute Corse', '2B', 1),
(1135, 74, 'C&ocirc;te d&#039;or', '21', 1),
(1136, 74, 'C&ocirc;tes d&#039;Armor', '22', 1),
(1137, 74, 'Creuse', '23', 1),
(1138, 74, 'Dordogne', '24', 1),
(1139, 74, 'Doubs', '25', 1),
(1140, 74, 'Dr&ocirc;me', '26', 1),
(1141, 74, 'Eure', '27', 1),
(1142, 74, 'Eure et Loir', '28', 1),
(1143, 74, 'Finist&egrave;re', '29', 1),
(1144, 74, 'Gard', '30', 1),
(1145, 74, 'Haute Garonne', '31', 1),
(1146, 74, 'Gers', '32', 1),
(1147, 74, 'Gironde', '33', 1),
(1148, 74, 'H&eacute;rault', '34', 1),
(1149, 74, 'Ille et Vilaine', '35', 1),
(1150, 74, 'Indre', '36', 1),
(1151, 74, 'Indre et Loire', '37', 1),
(1152, 74, 'Is&eacute;re', '38', 1),
(1153, 74, 'Jura', '39', 1),
(1154, 74, 'Landes', '40', 1),
(1155, 74, 'Loir et Cher', '41', 1),
(1156, 74, 'Loire', '42', 1),
(1157, 74, 'Haute Loire', '43', 1),
(1158, 74, 'Loire Atlantique', '44', 1),
(1159, 74, 'Loiret', '45', 1),
(1160, 74, 'Lot', '46', 1),
(1161, 74, 'Lot et Garonne', '47', 1),
(1162, 74, 'Loz&egrave;re', '48', 1),
(1163, 74, 'Maine et Loire', '49', 1),
(1164, 74, 'Manche', '50', 1),
(1165, 74, 'Marne', '51', 1),
(1166, 74, 'Haute Marne', '52', 1),
(1167, 74, 'Mayenne', '53', 1),
(1168, 74, 'Meurthe et Moselle', '54', 1),
(1169, 74, 'Meuse', '55', 1),
(1170, 74, 'Morbihan', '56', 1),
(1171, 74, 'Moselle', '57', 1),
(1172, 74, 'Ni&egrave;vre', '58', 1),
(1173, 74, 'Nord', '59', 1),
(1174, 74, 'Oise', '60', 1),
(1175, 74, 'Orne', '61', 1),
(1176, 74, 'Pas de Calais', '62', 1),
(1177, 74, 'Puy de D&ocirc;me', '63', 1),
(1178, 74, 'Pyr&eacute;n&eacute;es Atlantiques', '64', 1),
(1179, 74, 'Hautes Pyr&eacute;n&eacute;es', '65', 1),
(1180, 74, 'Pyr&eacute;n&eacute;es Orientales', '66', 1),
(1181, 74, 'Bas Rhin', '67', 1),
(1182, 74, 'Haut Rhin', '68', 1),
(1183, 74, 'Rh&ocirc;ne', '69', 1),
(1184, 74, 'Haute Sa&ocirc;ne', '70', 1),
(1185, 74, 'Sa&ocirc;ne et Loire', '71', 1),
(1186, 74, 'Sarthe', '72', 1),
(1187, 74, 'Savoie', '73', 1),
(1188, 74, 'Haute Savoie', '74', 1),
(1189, 74, 'Paris', '75', 1),
(1190, 74, 'Seine Maritime', '76', 1),
(1191, 74, 'Seine et Marne', '77', 1),
(1192, 74, 'Yvelines', '78', 1),
(1193, 74, 'Deux S&egrave;vres', '79', 1),
(1194, 74, 'Somme', '80', 1),
(1195, 74, 'Tarn', '81', 1),
(1196, 74, 'Tarn et Garonne', '82', 1),
(1197, 74, 'Var', '83', 1),
(1198, 74, 'Vaucluse', '84', 1),
(1199, 74, 'Vend&eacute;e', '85', 1),
(1200, 74, 'Vienne', '86', 1),
(1201, 74, 'Haute Vienne', '87', 1),
(1202, 74, 'Vosges', '88', 1),
(1203, 74, 'Yonne', '89', 1),
(1204, 74, 'Territoire de Belfort', '90', 1),
(1205, 74, 'Essonne', '91', 1),
(1206, 74, 'Hauts de Seine', '92', 1),
(1207, 74, 'Seine St-Denis', '93', 1),
(1208, 74, 'Val de Marne', '94', 1),
(1209, 74, 'Val d''Oise', '95', 1),
(1210, 76, 'Archipel des Marquises', 'M', 1),
(1211, 76, 'Archipel des Tuamotu', 'T', 1),
(1212, 76, 'Archipel des Tubuai', 'I', 1),
(1213, 76, 'Iles du Vent', 'V', 1),
(1214, 76, 'Iles Sous-le-Vent', 'S', 1),
(1215, 77, 'Iles Crozet', 'C', 1),
(1216, 77, 'Iles Kerguelen', 'K', 1),
(1217, 77, 'Ile Amsterdam', 'A', 1),
(1218, 77, 'Ile Saint-Paul', 'P', 1),
(1219, 77, 'Adelie Land', 'D', 1),
(1220, 78, 'Estuaire', 'ES', 1),
(1221, 78, 'Haut-Ogooue', 'HO', 1),
(1222, 78, 'Moyen-Ogooue', 'MO', 1),
(1223, 78, 'Ngounie', 'NG', 1),
(1224, 78, 'Nyanga', 'NY', 1),
(1225, 78, 'Ogooue-Ivindo', 'OI', 1),
(1226, 78, 'Ogooue-Lolo', 'OL', 1),
(1227, 78, 'Ogooue-Maritime', 'OM', 1),
(1228, 78, 'Woleu-Ntem', 'WN', 1),
(1229, 79, 'Banjul', 'BJ', 1),
(1230, 79, 'Basse', 'BS', 1),
(1231, 79, 'Brikama', 'BR', 1),
(1232, 79, 'Janjangbure', 'JA', 1),
(1233, 79, 'Kanifeng', 'KA', 1),
(1234, 79, 'Kerewan', 'KE', 1),
(1235, 79, 'Kuntaur', 'KU', 1),
(1236, 79, 'Mansakonko', 'MA', 1),
(1237, 79, 'Lower River', 'LR', 1),
(1238, 79, 'Central River', 'CR', 1),
(1239, 79, 'North Bank', 'NB', 1),
(1240, 79, 'Upper River', 'UR', 1),
(1241, 79, 'Western', 'WE', 1),
(1242, 80, 'Abkhazia', 'AB', 1),
(1243, 80, 'Ajaria', 'AJ', 1),
(1244, 80, 'Tbilisi', 'TB', 1),
(1245, 80, 'Guria', 'GU', 1),
(1246, 80, 'Imereti', 'IM', 1),
(1247, 80, 'Kakheti', 'KA', 1),
(1248, 80, 'Kvemo Kartli', 'KK', 1),
(1249, 80, 'Mtskheta-Mtianeti', 'MM', 1),
(1250, 80, 'Racha Lechkhumi and Kvemo Svanet', 'RL', 1),
(1251, 80, 'Samegrelo-Zemo Svaneti', 'SZ', 1),
(1252, 80, 'Samtskhe-Javakheti', 'SJ', 1),
(1253, 80, 'Shida Kartli', 'SK', 1),
(1254, 81, 'Baden-W&uuml;rttemberg', 'BAW', 1),
(1255, 81, 'Bayern', 'BAY', 1),
(1256, 81, 'Berlin', 'BER', 1),
(1257, 81, 'Brandenburg', 'BRG', 1),
(1258, 81, 'Bremen', 'BRE', 1),
(1259, 81, 'Hamburg', 'HAM', 1),
(1260, 81, 'Hessen', 'HES', 1),
(1261, 81, 'Mecklenburg-Vorpommern', 'MEC', 1),
(1262, 81, 'Niedersachsen', 'NDS', 1),
(1263, 81, 'Nordrhein-Westfalen', 'NRW', 1),
(1264, 81, 'Rheinland-Pfalz', 'RHE', 1),
(1265, 81, 'Saarland', 'SAR', 1),
(1266, 81, 'Sachsen', 'SAS', 1),
(1267, 81, 'Sachsen-Anhalt', 'SAC', 1),
(1268, 81, 'Schleswig-Holstein', 'SCN', 1),
(1269, 81, 'Th&uuml;ringen', 'THE', 1),
(1270, 82, 'Ashanti Region', 'AS', 1),
(1271, 82, 'Brong-Ahafo Region', 'BA', 1),
(1272, 82, 'Central Region', 'CE', 1),
(1273, 82, 'Eastern Region', 'EA', 1),
(1274, 82, 'Greater Accra Region', 'GA', 1),
(1275, 82, 'Northern Region', 'NO', 1),
(1276, 82, 'Upper East Region', 'UE', 1),
(1277, 82, 'Upper West Region', 'UW', 1),
(1278, 82, 'Volta Region', 'VO', 1),
(1279, 82, 'Western Region', 'WE', 1),
(1280, 84, 'Attica', 'AT', 1),
(1281, 84, 'Central Greece', 'CN', 1),
(1282, 84, 'Central Macedonia', 'CM', 1),
(1283, 84, 'Crete', 'CR', 1),
(1284, 84, 'East Macedonia and Thrace', 'EM', 1),
(1285, 84, 'Epirus', 'EP', 1),
(1286, 84, 'Ionian Islands', 'II', 1),
(1287, 84, 'North Aegean', 'NA', 1),
(1288, 84, 'Peloponnesos', 'PP', 1),
(1289, 84, 'South Aegean', 'SA', 1),
(1290, 84, 'Thessaly', 'TH', 1),
(1291, 84, 'West Greece', 'WG', 1),
(1292, 84, 'West Macedonia', 'WM', 1),
(1293, 85, 'Avannaa', 'A', 1),
(1294, 85, 'Tunu', 'T', 1),
(1295, 85, 'Kitaa', 'K', 1),
(1296, 86, 'Saint Andrew', 'A', 1),
(1297, 86, 'Saint David', 'D', 1),
(1298, 86, 'Saint George', 'G', 1),
(1299, 86, 'Saint John', 'J', 1),
(1300, 86, 'Saint Mark', 'M', 1),
(1301, 86, 'Saint Patrick', 'P', 1),
(1302, 86, 'Carriacou', 'C', 1),
(1303, 86, 'Petit Martinique', 'Q', 1),
(1304, 89, 'Alta Verapaz', 'AV', 1),
(1305, 89, 'Baja Verapaz', 'BV', 1),
(1306, 89, 'Chimaltenango', 'CM', 1),
(1307, 89, 'Chiquimula', 'CQ', 1),
(1308, 89, 'El Peten', 'PE', 1),
(1309, 89, 'El Progreso', 'PR', 1),
(1310, 89, 'El Quiche', 'QC', 1),
(1311, 89, 'Escuintla', 'ES', 1),
(1312, 89, 'Guatemala', 'GU', 1),
(1313, 89, 'Huehuetenango', 'HU', 1),
(1314, 89, 'Izabal', 'IZ', 1),
(1315, 89, 'Jalapa', 'JA', 1),
(1316, 89, 'Jutiapa', 'JU', 1),
(1317, 89, 'Quetzaltenango', 'QZ', 1),
(1318, 89, 'Retalhuleu', 'RE', 1),
(1319, 89, 'Sacatepequez', 'ST', 1),
(1320, 89, 'San Marcos', 'SM', 1),
(1321, 89, 'Santa Rosa', 'SR', 1),
(1322, 89, 'Solola', 'SO', 1),
(1323, 89, 'Suchitepequez', 'SU', 1),
(1324, 89, 'Totonicapan', 'TO', 1),
(1325, 89, 'Zacapa', 'ZA', 1),
(1326, 90, 'Conakry', 'CNK', 1),
(1327, 90, 'Beyla', 'BYL', 1),
(1328, 90, 'Boffa', 'BFA', 1),
(1329, 90, 'Boke', 'BOK', 1),
(1330, 90, 'Coyah', 'COY', 1),
(1331, 90, 'Dabola', 'DBL', 1),
(1332, 90, 'Dalaba', 'DLB', 1),
(1333, 90, 'Dinguiraye', 'DGR', 1),
(1334, 90, 'Dubreka', 'DBR', 1),
(1335, 90, 'Faranah', 'FRN', 1),
(1336, 90, 'Forecariah', 'FRC', 1),
(1337, 90, 'Fria', 'FRI', 1),
(1338, 90, 'Gaoual', 'GAO', 1),
(1339, 90, 'Gueckedou', 'GCD', 1),
(1340, 90, 'Kankan', 'KNK', 1),
(1341, 90, 'Kerouane', 'KRN', 1),
(1342, 90, 'Kindia', 'KND', 1),
(1343, 90, 'Kissidougou', 'KSD', 1),
(1344, 90, 'Koubia', 'KBA', 1),
(1345, 90, 'Koundara', 'KDA', 1),
(1346, 90, 'Kouroussa', 'KRA', 1),
(1347, 90, 'Labe', 'LAB', 1),
(1348, 90, 'Lelouma', 'LLM', 1),
(1349, 90, 'Lola', 'LOL', 1),
(1350, 90, 'Macenta', 'MCT', 1),
(1351, 90, 'Mali', 'MAL', 1),
(1352, 90, 'Mamou', 'MAM', 1),
(1353, 90, 'Mandiana', 'MAN', 1),
(1354, 90, 'Nzerekore', 'NZR', 1),
(1355, 90, 'Pita', 'PIT', 1),
(1356, 90, 'Siguiri', 'SIG', 1),
(1357, 90, 'Telimele', 'TLM', 1),
(1358, 90, 'Tougue', 'TOG', 1),
(1359, 90, 'Yomou', 'YOM', 1),
(1360, 91, 'Bafata Region', 'BF', 1),
(1361, 91, 'Biombo Region', 'BB', 1),
(1362, 91, 'Bissau Region', 'BS', 1),
(1363, 91, 'Bolama Region', 'BL', 1),
(1364, 91, 'Cacheu Region', 'CA', 1),
(1365, 91, 'Gabu Region', 'GA', 1),
(1366, 91, 'Oio Region', 'OI', 1),
(1367, 91, 'Quinara Region', 'QU', 1),
(1368, 91, 'Tombali Region', 'TO', 1),
(1369, 92, 'Barima-Waini', 'BW', 1),
(1370, 92, 'Cuyuni-Mazaruni', 'CM', 1),
(1371, 92, 'Demerara-Mahaica', 'DM', 1),
(1372, 92, 'East Berbice-Corentyne', 'EC', 1),
(1373, 92, 'Essequibo Islands-West Demerara', 'EW', 1),
(1374, 92, 'Mahaica-Berbice', 'MB', 1),
(1375, 92, 'Pomeroon-Supenaam', 'PM', 1),
(1376, 92, 'Potaro-Siparuni', 'PI', 1),
(1377, 92, 'Upper Demerara-Berbice', 'UD', 1),
(1378, 92, 'Upper Takutu-Upper Essequibo', 'UT', 1),
(1379, 93, 'Artibonite', 'AR', 1),
(1380, 93, 'Centre', 'CE', 1),
(1381, 93, 'Grand''Anse', 'GA', 1),
(1382, 93, 'Nord', 'ND', 1),
(1383, 93, 'Nord-Est', 'NE', 1),
(1384, 93, 'Nord-Ouest', 'NO', 1),
(1385, 93, 'Ouest', 'OU', 1),
(1386, 93, 'Sud', 'SD', 1),
(1387, 93, 'Sud-Est', 'SE', 1),
(1388, 94, 'Flat Island', 'F', 1),
(1389, 94, 'McDonald Island', 'M', 1),
(1390, 94, 'Shag Island', 'S', 1),
(1391, 94, 'Heard Island', 'H', 1),
(1392, 95, 'Atlantida', 'AT', 1),
(1393, 95, 'Choluteca', 'CH', 1),
(1394, 95, 'Colon', 'CL', 1),
(1395, 95, 'Comayagua', 'CM', 1),
(1396, 95, 'Copan', 'CP', 1),
(1397, 95, 'Cortes', 'CR', 1),
(1398, 95, 'El Paraiso', 'PA', 1),
(1399, 95, 'Francisco Morazan', 'FM', 1),
(1400, 95, 'Gracias a Dios', 'GD', 1),
(1401, 95, 'Intibuca', 'IN', 1),
(1402, 95, 'Islas de la Bahia (Bay Islands)', 'IB', 1),
(1403, 95, 'La Paz', 'PZ', 1),
(1404, 95, 'Lempira', 'LE', 1),
(1405, 95, 'Ocotepeque', 'OC', 1),
(1406, 95, 'Olancho', 'OL', 1),
(1407, 95, 'Santa Barbara', 'SB', 1),
(1408, 95, 'Valle', 'VA', 1),
(1409, 95, 'Yoro', 'YO', 1),
(1410, 96, 'Central and Western Hong Kong Island', 'HCW', 1),
(1411, 96, 'Eastern Hong Kong Island', 'HEA', 1),
(1412, 96, 'Southern Hong Kong Island', 'HSO', 1),
(1413, 96, 'Wan Chai Hong Kong Island', 'HWC', 1),
(1414, 96, 'Kowloon City Kowloon', 'KKC', 1),
(1415, 96, 'Kwun Tong Kowloon', 'KKT', 1),
(1416, 96, 'Sham Shui Po Kowloon', 'KSS', 1),
(1417, 96, 'Wong Tai Sin Kowloon', 'KWT', 1),
(1418, 96, 'Yau Tsim Mong Kowloon', 'KYT', 1),
(1419, 96, 'Islands New Territories', 'NIS', 1),
(1420, 96, 'Kwai Tsing New Territories', 'NKT', 1),
(1421, 96, 'North New Territories', 'NNO', 1),
(1422, 96, 'Sai Kung New Territories', 'NSK', 1),
(1423, 96, 'Sha Tin New Territories', 'NST', 1),
(1424, 96, 'Tai Po New Territories', 'NTP', 1),
(1425, 96, 'Tsuen Wan New Territories', 'NTW', 1),
(1426, 96, 'Tuen Mun New Territories', 'NTM', 1),
(1427, 96, 'Yuen Long New Territories', 'NYL', 1),
(1467, 98, 'Austurland', 'AL', 1),
(1468, 98, 'Hofuoborgarsvaeoi', 'HF', 1),
(1469, 98, 'Norourland eystra', 'NE', 1),
(1470, 98, 'Norourland vestra', 'NV', 1),
(1471, 98, 'Suourland', 'SL', 1),
(1472, 98, 'Suournes', 'SN', 1),
(1473, 98, 'Vestfiroir', 'VF', 1),
(1474, 98, 'Vesturland', 'VL', 1),
(1475, 99, 'Andaman and Nicobar Islands', 'AN', 1),
(1476, 99, 'Andhra Pradesh', 'AP', 1),
(1477, 99, 'Arunachal Pradesh', 'AR', 1),
(1478, 99, 'Assam', 'AS', 1),
(1479, 99, 'Bihar', 'BI', 1),
(1480, 99, 'Chandigarh', 'CH', 1),
(1481, 99, 'Dadra and Nagar Haveli', 'DA', 1),
(1482, 99, 'Daman and Diu', 'DM', 1),
(1483, 99, 'Delhi', 'DE', 1),
(1484, 99, 'Goa', 'GO', 1),
(1485, 99, 'Gujarat', 'GU', 1),
(1486, 99, 'Haryana', 'HA', 1),
(1487, 99, 'Himachal Pradesh', 'HP', 1),
(1488, 99, 'Jammu and Kashmir', 'JA', 1),
(1489, 99, 'Karnataka', 'KA', 1),
(1490, 99, 'Kerala', 'KE', 1),
(1491, 99, 'Lakshadweep Islands', 'LI', 1),
(1492, 99, 'Madhya Pradesh', 'MP', 1),
(1493, 99, 'Maharashtra', 'MA', 1),
(1494, 99, 'Manipur', 'MN', 1),
(1495, 99, 'Meghalaya', 'ME', 1),
(1496, 99, 'Mizoram', 'MI', 1),
(1497, 99, 'Nagaland', 'NA', 1),
(1498, 99, 'Orissa', 'OR', 1),
(1499, 99, 'Puducherry', 'PO', 1),
(1500, 99, 'Punjab', 'PU', 1),
(1501, 99, 'Rajasthan', 'RA', 1),
(1502, 99, 'Sikkim', 'SI', 1),
(1503, 99, 'Tamil Nadu', 'TN', 1),
(1504, 99, 'Tripura', 'TR', 1),
(1505, 99, 'Uttar Pradesh', 'UP', 1),
(1506, 99, 'West Bengal', 'WB', 1),
(1507, 100, 'Aceh', 'AC', 1),
(1508, 100, 'Bali', 'BA', 1),
(1509, 100, 'Banten', 'BT', 1),
(1510, 100, 'Bengkulu', 'BE', 1),
(1511, 100, 'BoDeTaBek', 'BD', 1),
(1512, 100, 'Gorontalo', 'GO', 1),
(1513, 100, 'Jakarta Raya', 'JK', 1),
(1514, 100, 'Jambi', 'JA', 1),
(1515, 100, 'Jawa Barat', 'JB', 1),
(1516, 100, 'Jawa Tengah', 'JT', 1),
(1517, 100, 'Jawa Timur', 'JI', 1),
(1518, 100, 'Kalimantan Barat', 'KB', 1),
(1519, 100, 'Kalimantan Selatan', 'KS', 1),
(1520, 100, 'Kalimantan Tengah', 'KT', 1),
(1521, 100, 'Kalimantan Timur', 'KI', 1),
(1522, 100, 'Kepulauan Bangka Belitung', 'BB', 1),
(1523, 100, 'Lampung', 'LA', 1),
(1524, 100, 'Maluku', 'MA', 1),
(1525, 100, 'Maluku Utara', 'MU', 1),
(1526, 100, 'Nusa Tenggara Barat', 'NB', 1),
(1527, 100, 'Nusa Tenggara Timur', 'NT', 1),
(1528, 100, 'Papua', 'PA', 1),
(1529, 100, 'Riau', 'RI', 1),
(1530, 100, 'Sulawesi Selatan', 'SN', 1),
(1531, 100, 'Sulawesi Tengah', 'ST', 1),
(1532, 100, 'Sulawesi Tenggara', 'SG', 1),
(1533, 100, 'Sulawesi Utara', 'SA', 1),
(1534, 100, 'Sumatera Barat', 'SB', 1),
(1535, 100, 'Sumatera Selatan', 'SS', 1),
(1536, 100, 'Sumatera Utara', 'SU', 1),
(1537, 100, 'Yogyakarta', 'YO', 1),
(1538, 101, 'Tehran', 'TEH', 1),
(1539, 101, 'Qom', 'QOM', 1),
(1540, 101, 'Markazi', 'MKZ', 1),
(1541, 101, 'Qazvin', 'QAZ', 1),
(1542, 101, 'Gilan', 'GIL', 1),
(1543, 101, 'Ardabil', 'ARD', 1),
(1544, 101, 'Zanjan', 'ZAN', 1),
(1545, 101, 'East Azarbaijan', 'EAZ', 1),
(1546, 101, 'West Azarbaijan', 'WEZ', 1),
(1547, 101, 'Kurdistan', 'KRD', 1),
(1548, 101, 'Hamadan', 'HMD', 1),
(1549, 101, 'Kermanshah', 'KRM', 1),
(1550, 101, 'Ilam', 'ILM', 1),
(1551, 101, 'Lorestan', 'LRS', 1),
(1552, 101, 'Khuzestan', 'KZT', 1),
(1553, 101, 'Chahar Mahaal and Bakhtiari', 'CMB', 1),
(1554, 101, 'Kohkiluyeh and Buyer Ahmad', 'KBA', 1),
(1555, 101, 'Bushehr', 'BSH', 1),
(1556, 101, 'Fars', 'FAR', 1),
(1557, 101, 'Hormozgan', 'HRM', 1),
(1558, 101, 'Sistan and Baluchistan', 'SBL', 1),
(1559, 101, 'Kerman', 'KRB', 1),
(1560, 101, 'Yazd', 'YZD', 1),
(1561, 101, 'Esfahan', 'EFH', 1),
(1562, 101, 'Semnan', 'SMN', 1),
(1563, 101, 'Mazandaran', 'MZD', 1),
(1564, 101, 'Golestan', 'GLS', 1),
(1565, 101, 'North Khorasan', 'NKH', 1),
(1566, 101, 'Razavi Khorasan', 'RKH', 1),
(1567, 101, 'South Khorasan', 'SKH', 1),
(1568, 102, 'Baghdad', 'BD', 1),
(1569, 102, 'Salah ad Din', 'SD', 1),
(1570, 102, 'Diyala', 'DY', 1),
(1571, 102, 'Wasit', 'WS', 1),
(1572, 102, 'Maysan', 'MY', 1),
(1573, 102, 'Al Basrah', 'BA', 1),
(1574, 102, 'Dhi Qar', 'DQ', 1),
(1575, 102, 'Al Muthanna', 'MU', 1),
(1576, 102, 'Al Qadisyah', 'QA', 1),
(1577, 102, 'Babil', 'BB', 1),
(1578, 102, 'Al Karbala', 'KB', 1),
(1579, 102, 'An Najaf', 'NJ', 1),
(1580, 102, 'Al Anbar', 'AB', 1),
(1581, 102, 'Ninawa', 'NN', 1),
(1582, 102, 'Dahuk', 'DH', 1),
(1583, 102, 'Arbil', 'AL', 1),
(1584, 102, 'At Ta''mim', 'TM', 1),
(1585, 102, 'As Sulaymaniyah', 'SL', 1),
(1586, 103, 'Carlow', 'CA', 1),
(1587, 103, 'Cavan', 'CV', 1),
(1588, 103, 'Clare', 'CL', 1),
(1589, 103, 'Cork', 'CO', 1),
(1590, 103, 'Donegal', 'DO', 1),
(1591, 103, 'Dublin', 'DU', 1),
(1592, 103, 'Galway', 'GA', 1),
(1593, 103, 'Kerry', 'KE', 1),
(1594, 103, 'Kildare', 'KI', 1),
(1595, 103, 'Kilkenny', 'KL', 1),
(1596, 103, 'Laois', 'LA', 1);
INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1597, 103, 'Leitrim', 'LE', 1),
(1598, 103, 'Limerick', 'LI', 1),
(1599, 103, 'Longford', 'LO', 1),
(1600, 103, 'Louth', 'LU', 1),
(1601, 103, 'Mayo', 'MA', 1),
(1602, 103, 'Meath', 'ME', 1),
(1603, 103, 'Monaghan', 'MO', 1),
(1604, 103, 'Offaly', 'OF', 1),
(1605, 103, 'Roscommon', 'RO', 1),
(1606, 103, 'Sligo', 'SL', 1),
(1607, 103, 'Tipperary', 'TI', 1),
(1608, 103, 'Waterford', 'WA', 1),
(1609, 103, 'Westmeath', 'WE', 1),
(1610, 103, 'Wexford', 'WX', 1),
(1611, 103, 'Wicklow', 'WI', 1),
(1612, 104, 'Be''er Sheva', 'BS', 1),
(1613, 104, 'Bika''at Hayarden', 'BH', 1),
(1614, 104, 'Eilat and Arava', 'EA', 1),
(1615, 104, 'Galil', 'GA', 1),
(1616, 104, 'Haifa', 'HA', 1),
(1617, 104, 'Jehuda Mountains', 'JM', 1),
(1618, 104, 'Jerusalem', 'JE', 1),
(1619, 104, 'Negev', 'NE', 1),
(1620, 104, 'Semaria', 'SE', 1),
(1621, 104, 'Sharon', 'SH', 1),
(1622, 104, 'Tel Aviv (Gosh Dan)', 'TA', 1),
(3860, 105, 'Caltanissetta', 'CL', 1),
(3842, 105, 'Agrigento', 'AG', 1),
(3843, 105, 'Alessandria', 'AL', 1),
(3844, 105, 'Ancona', 'AN', 1),
(3845, 105, 'Aosta', 'AO', 1),
(3846, 105, 'Arezzo', 'AR', 1),
(3847, 105, 'Ascoli Piceno', 'AP', 1),
(3848, 105, 'Asti', 'AT', 1),
(3849, 105, 'Avellino', 'AV', 1),
(3850, 105, 'Bari', 'BA', 1),
(3851, 105, 'Belluno', 'BL', 1),
(3852, 105, 'Benevento', 'BN', 1),
(3853, 105, 'Bergamo', 'BG', 1),
(3854, 105, 'Biella', 'BI', 1),
(3855, 105, 'Bologna', 'BO', 1),
(3856, 105, 'Bolzano', 'BZ', 1),
(3857, 105, 'Brescia', 'BS', 1),
(3858, 105, 'Brindisi', 'BR', 1),
(3859, 105, 'Cagliari', 'CA', 1),
(1643, 106, 'Clarendon Parish', 'CLA', 1),
(1644, 106, 'Hanover Parish', 'HAN', 1),
(1645, 106, 'Kingston Parish', 'KIN', 1),
(1646, 106, 'Manchester Parish', 'MAN', 1),
(1647, 106, 'Portland Parish', 'POR', 1),
(1648, 106, 'Saint Andrew Parish', 'AND', 1),
(1649, 106, 'Saint Ann Parish', 'ANN', 1),
(1650, 106, 'Saint Catherine Parish', 'CAT', 1),
(1651, 106, 'Saint Elizabeth Parish', 'ELI', 1),
(1652, 106, 'Saint James Parish', 'JAM', 1),
(1653, 106, 'Saint Mary Parish', 'MAR', 1),
(1654, 106, 'Saint Thomas Parish', 'THO', 1),
(1655, 106, 'Trelawny Parish', 'TRL', 1),
(1656, 106, 'Westmoreland Parish', 'WML', 1),
(1657, 107, 'Aichi', 'AI', 1),
(1658, 107, 'Akita', 'AK', 1),
(1659, 107, 'Aomori', 'AO', 1),
(1660, 107, 'Chiba', 'CH', 1),
(1661, 107, 'Ehime', 'EH', 1),
(1662, 107, 'Fukui', 'FK', 1),
(1663, 107, 'Fukuoka', 'FU', 1),
(1664, 107, 'Fukushima', 'FS', 1),
(1665, 107, 'Gifu', 'GI', 1),
(1666, 107, 'Gumma', 'GU', 1),
(1667, 107, 'Hiroshima', 'HI', 1),
(1668, 107, 'Hokkaido', 'HO', 1),
(1669, 107, 'Hyogo', 'HY', 1),
(1670, 107, 'Ibaraki', 'IB', 1),
(1671, 107, 'Ishikawa', 'IS', 1),
(1672, 107, 'Iwate', 'IW', 1),
(1673, 107, 'Kagawa', 'KA', 1),
(1674, 107, 'Kagoshima', 'KG', 1),
(1675, 107, 'Kanagawa', 'KN', 1),
(1676, 107, 'Kochi', 'KO', 1),
(1677, 107, 'Kumamoto', 'KU', 1),
(1678, 107, 'Kyoto', 'KY', 1),
(1679, 107, 'Mie', 'MI', 1),
(1680, 107, 'Miyagi', 'MY', 1),
(1681, 107, 'Miyazaki', 'MZ', 1),
(1682, 107, 'Nagano', 'NA', 1),
(1683, 107, 'Nagasaki', 'NG', 1),
(1684, 107, 'Nara', 'NR', 1),
(1685, 107, 'Niigata', 'NI', 1),
(1686, 107, 'Oita', 'OI', 1),
(1687, 107, 'Okayama', 'OK', 1),
(1688, 107, 'Okinawa', 'ON', 1),
(1689, 107, 'Osaka', 'OS', 1),
(1690, 107, 'Saga', 'SA', 1),
(1691, 107, 'Saitama', 'SI', 1),
(1692, 107, 'Shiga', 'SH', 1),
(1693, 107, 'Shimane', 'SM', 1),
(1694, 107, 'Shizuoka', 'SZ', 1),
(1695, 107, 'Tochigi', 'TO', 1),
(1696, 107, 'Tokushima', 'TS', 1),
(1697, 107, 'Tokyo', 'TK', 1),
(1698, 107, 'Tottori', 'TT', 1),
(1699, 107, 'Toyama', 'TY', 1),
(1700, 107, 'Wakayama', 'WA', 1),
(1701, 107, 'Yamagata', 'YA', 1),
(1702, 107, 'Yamaguchi', 'YM', 1),
(1703, 107, 'Yamanashi', 'YN', 1),
(1704, 108, '''Amman', 'AM', 1),
(1705, 108, 'Ajlun', 'AJ', 1),
(1706, 108, 'Al ''Aqabah', 'AA', 1),
(1707, 108, 'Al Balqa''', 'AB', 1),
(1708, 108, 'Al Karak', 'AK', 1),
(1709, 108, 'Al Mafraq', 'AL', 1),
(1710, 108, 'At Tafilah', 'AT', 1),
(1711, 108, 'Az Zarqa''', 'AZ', 1),
(1712, 108, 'Irbid', 'IR', 1),
(1713, 108, 'Jarash', 'JA', 1),
(1714, 108, 'Ma''an', 'MA', 1),
(1715, 108, 'Madaba', 'MD', 1),
(1716, 109, 'Almaty', 'AL', 1),
(1717, 109, 'Almaty City', 'AC', 1),
(1718, 109, 'Aqmola', 'AM', 1),
(1719, 109, 'Aqtobe', 'AQ', 1),
(1720, 109, 'Astana City', 'AS', 1),
(1721, 109, 'Atyrau', 'AT', 1),
(1722, 109, 'Batys Qazaqstan', 'BA', 1),
(1723, 109, 'Bayqongyr City', 'BY', 1),
(1724, 109, 'Mangghystau', 'MA', 1),
(1725, 109, 'Ongtustik Qazaqstan', 'ON', 1),
(1726, 109, 'Pavlodar', 'PA', 1),
(1727, 109, 'Qaraghandy', 'QA', 1),
(1728, 109, 'Qostanay', 'QO', 1),
(1729, 109, 'Qyzylorda', 'QY', 1),
(1730, 109, 'Shyghys Qazaqstan', 'SH', 1),
(1731, 109, 'Soltustik Qazaqstan', 'SO', 1),
(1732, 109, 'Zhambyl', 'ZH', 1),
(1733, 110, 'Central', 'CE', 1),
(1734, 110, 'Coast', 'CO', 1),
(1735, 110, 'Eastern', 'EA', 1),
(1736, 110, 'Nairobi Area', 'NA', 1),
(1737, 110, 'North Eastern', 'NE', 1),
(1738, 110, 'Nyanza', 'NY', 1),
(1739, 110, 'Rift Valley', 'RV', 1),
(1740, 110, 'Western', 'WE', 1),
(1741, 111, 'Abaiang', 'AG', 1),
(1742, 111, 'Abemama', 'AM', 1),
(1743, 111, 'Aranuka', 'AK', 1),
(1744, 111, 'Arorae', 'AO', 1),
(1745, 111, 'Banaba', 'BA', 1),
(1746, 111, 'Beru', 'BE', 1),
(1747, 111, 'Butaritari', 'bT', 1),
(1748, 111, 'Kanton', 'KA', 1),
(1749, 111, 'Kiritimati', 'KR', 1),
(1750, 111, 'Kuria', 'KU', 1),
(1751, 111, 'Maiana', 'MI', 1),
(1752, 111, 'Makin', 'MN', 1),
(1753, 111, 'Marakei', 'ME', 1),
(1754, 111, 'Nikunau', 'NI', 1),
(1755, 111, 'Nonouti', 'NO', 1),
(1756, 111, 'Onotoa', 'ON', 1),
(1757, 111, 'Tabiteuea', 'TT', 1),
(1758, 111, 'Tabuaeran', 'TR', 1),
(1759, 111, 'Tamana', 'TM', 1),
(1760, 111, 'Tarawa', 'TW', 1),
(1761, 111, 'Teraina', 'TE', 1),
(1762, 112, 'Chagang-do', 'CHA', 1),
(1763, 112, 'Hamgyong-bukto', 'HAB', 1),
(1764, 112, 'Hamgyong-namdo', 'HAN', 1),
(1765, 112, 'Hwanghae-bukto', 'HWB', 1),
(1766, 112, 'Hwanghae-namdo', 'HWN', 1),
(1767, 112, 'Kangwon-do', 'KAN', 1),
(1768, 112, 'P''yongan-bukto', 'PYB', 1),
(1769, 112, 'P''yongan-namdo', 'PYN', 1),
(1770, 112, 'Ryanggang-do (Yanggang-do)', 'YAN', 1),
(1771, 112, 'Rason Directly Governed City', 'NAJ', 1),
(1772, 112, 'P''yongyang Special City', 'PYO', 1),
(1773, 113, 'Ch''ungch''ong-bukto', 'CO', 1),
(1774, 113, 'Ch''ungch''ong-namdo', 'CH', 1),
(1775, 113, 'Cheju-do', 'CD', 1),
(1776, 113, 'Cholla-bukto', 'CB', 1),
(1777, 113, 'Cholla-namdo', 'CN', 1),
(1778, 113, 'Inch''on-gwangyoksi', 'IG', 1),
(1779, 113, 'Kangwon-do', 'KA', 1),
(1780, 113, 'Kwangju-gwangyoksi', 'KG', 1),
(1781, 113, 'Kyonggi-do', 'KD', 1),
(1782, 113, 'Kyongsang-bukto', 'KB', 1),
(1783, 113, 'Kyongsang-namdo', 'KN', 1),
(1784, 113, 'Pusan-gwangyoksi', 'PG', 1),
(1785, 113, 'Soul-t''ukpyolsi', 'SO', 1),
(1786, 113, 'Taegu-gwangyoksi', 'TA', 1),
(1787, 113, 'Taejon-gwangyoksi', 'TG', 1),
(1788, 114, 'Al ''Asimah', 'AL', 1),
(1789, 114, 'Al Ahmadi', 'AA', 1),
(1790, 114, 'Al Farwaniyah', 'AF', 1),
(1791, 114, 'Al Jahra''', 'AJ', 1),
(1792, 114, 'Hawalli', 'HA', 1),
(1793, 115, 'Bishkek', 'GB', 1),
(1794, 115, 'Batken', 'B', 1),
(1795, 115, 'Chu', 'C', 1),
(1796, 115, 'Jalal-Abad', 'J', 1),
(1797, 115, 'Naryn', 'N', 1),
(1798, 115, 'Osh', 'O', 1),
(1799, 115, 'Talas', 'T', 1),
(1800, 115, 'Ysyk-Kol', 'Y', 1),
(1801, 116, 'Vientiane', 'VT', 1),
(1802, 116, 'Attapu', 'AT', 1),
(1803, 116, 'Bokeo', 'BK', 1),
(1804, 116, 'Bolikhamxai', 'BL', 1),
(1805, 116, 'Champasak', 'CH', 1),
(1806, 116, 'Houaphan', 'HO', 1),
(1807, 116, 'Khammouan', 'KH', 1),
(1808, 116, 'Louang Namtha', 'LM', 1),
(1809, 116, 'Louangphabang', 'LP', 1),
(1810, 116, 'Oudomxai', 'OU', 1),
(1811, 116, 'Phongsali', 'PH', 1),
(1812, 116, 'Salavan', 'SL', 1),
(1813, 116, 'Savannakhet', 'SV', 1),
(1814, 116, 'Vientiane', 'VI', 1),
(1815, 116, 'Xaignabouli', 'XA', 1),
(1816, 116, 'Xekong', 'XE', 1),
(1817, 116, 'Xiangkhoang', 'XI', 1),
(1818, 116, 'Xaisomboun', 'XN', 1),
(1852, 119, 'Berea', 'BE', 1),
(1853, 119, 'Butha-Buthe', 'BB', 1),
(1854, 119, 'Leribe', 'LE', 1),
(1855, 119, 'Mafeteng', 'MF', 1),
(1856, 119, 'Maseru', 'MS', 1),
(1857, 119, 'Mohale''s Hoek', 'MH', 1),
(1858, 119, 'Mokhotlong', 'MK', 1),
(1859, 119, 'Qacha''s Nek', 'QN', 1),
(1860, 119, 'Quthing', 'QT', 1),
(1861, 119, 'Thaba-Tseka', 'TT', 1),
(1862, 120, 'Bomi', 'BI', 1),
(1863, 120, 'Bong', 'BG', 1),
(1864, 120, 'Grand Bassa', 'GB', 1),
(1865, 120, 'Grand Cape Mount', 'CM', 1),
(1866, 120, 'Grand Gedeh', 'GG', 1),
(1867, 120, 'Grand Kru', 'GK', 1),
(1868, 120, 'Lofa', 'LO', 1),
(1869, 120, 'Margibi', 'MG', 1),
(1870, 120, 'Maryland', 'ML', 1),
(1871, 120, 'Montserrado', 'MS', 1),
(1872, 120, 'Nimba', 'NB', 1),
(1873, 120, 'River Cess', 'RC', 1),
(1874, 120, 'Sinoe', 'SN', 1),
(1875, 121, 'Ajdabiya', 'AJ', 1),
(1876, 121, 'Al ''Aziziyah', 'AZ', 1),
(1877, 121, 'Al Fatih', 'FA', 1),
(1878, 121, 'Al Jabal al Akhdar', 'JA', 1),
(1879, 121, 'Al Jufrah', 'JU', 1),
(1880, 121, 'Al Khums', 'KH', 1),
(1881, 121, 'Al Kufrah', 'KU', 1),
(1882, 121, 'An Nuqat al Khams', 'NK', 1),
(1883, 121, 'Ash Shati''', 'AS', 1),
(1884, 121, 'Awbari', 'AW', 1),
(1885, 121, 'Az Zawiyah', 'ZA', 1),
(1886, 121, 'Banghazi', 'BA', 1),
(1887, 121, 'Darnah', 'DA', 1),
(1888, 121, 'Ghadamis', 'GD', 1),
(1889, 121, 'Gharyan', 'GY', 1),
(1890, 121, 'Misratah', 'MI', 1),
(1891, 121, 'Murzuq', 'MZ', 1),
(1892, 121, 'Sabha', 'SB', 1),
(1893, 121, 'Sawfajjin', 'SW', 1),
(1894, 121, 'Surt', 'SU', 1),
(1895, 121, 'Tarabulus (Tripoli)', 'TL', 1),
(1896, 121, 'Tarhunah', 'TH', 1),
(1897, 121, 'Tubruq', 'TU', 1),
(1898, 121, 'Yafran', 'YA', 1),
(1899, 121, 'Zlitan', 'ZL', 1),
(1900, 122, 'Vaduz', 'V', 1),
(1901, 122, 'Schaan', 'A', 1),
(1902, 122, 'Balzers', 'B', 1),
(1903, 122, 'Triesen', 'N', 1),
(1904, 122, 'Eschen', 'E', 1),
(1905, 122, 'Mauren', 'M', 1),
(1906, 122, 'Triesenberg', 'T', 1),
(1907, 122, 'Ruggell', 'R', 1),
(1908, 122, 'Gamprin', 'G', 1),
(1909, 122, 'Schellenberg', 'L', 1),
(1910, 122, 'Planken', 'P', 1),
(1911, 123, 'Alytus', 'AL', 1),
(1912, 123, 'Kaunas', 'KA', 1),
(1913, 123, 'Klaipeda', 'KL', 1),
(1914, 123, 'Marijampole', 'MA', 1),
(1915, 123, 'Panevezys', 'PA', 1),
(1916, 123, 'Siauliai', 'SI', 1),
(1917, 123, 'Taurage', 'TA', 1),
(1918, 123, 'Telsiai', 'TE', 1),
(1919, 123, 'Utena', 'UT', 1),
(1920, 123, 'Vilnius', 'VI', 1),
(1921, 124, 'Diekirch', 'DD', 1),
(1922, 124, 'Clervaux', 'DC', 1),
(1923, 124, 'Redange', 'DR', 1),
(1924, 124, 'Vianden', 'DV', 1),
(1925, 124, 'Wiltz', 'DW', 1),
(1926, 124, 'Grevenmacher', 'GG', 1),
(1927, 124, 'Echternach', 'GE', 1),
(1928, 124, 'Remich', 'GR', 1),
(1929, 124, 'Luxembourg', 'LL', 1),
(1930, 124, 'Capellen', 'LC', 1),
(1931, 124, 'Esch-sur-Alzette', 'LE', 1),
(1932, 124, 'Mersch', 'LM', 1),
(1933, 125, 'Our Lady Fatima Parish', 'OLF', 1),
(1934, 125, 'St. Anthony Parish', 'ANT', 1),
(1935, 125, 'St. Lazarus Parish', 'LAZ', 1),
(1936, 125, 'Cathedral Parish', 'CAT', 1),
(1937, 125, 'St. Lawrence Parish', 'LAW', 1),
(1938, 127, 'Antananarivo', 'AN', 1),
(1939, 127, 'Antsiranana', 'AS', 1),
(1940, 127, 'Fianarantsoa', 'FN', 1),
(1941, 127, 'Mahajanga', 'MJ', 1),
(1942, 127, 'Toamasina', 'TM', 1),
(1943, 127, 'Toliara', 'TL', 1),
(1944, 128, 'Balaka', 'BLK', 1),
(1945, 128, 'Blantyre', 'BLT', 1),
(1946, 128, 'Chikwawa', 'CKW', 1),
(1947, 128, 'Chiradzulu', 'CRD', 1),
(1948, 128, 'Chitipa', 'CTP', 1),
(1949, 128, 'Dedza', 'DDZ', 1),
(1950, 128, 'Dowa', 'DWA', 1),
(1951, 128, 'Karonga', 'KRG', 1),
(1952, 128, 'Kasungu', 'KSG', 1),
(1953, 128, 'Likoma', 'LKM', 1),
(1954, 128, 'Lilongwe', 'LLG', 1),
(1955, 128, 'Machinga', 'MCG', 1),
(1956, 128, 'Mangochi', 'MGC', 1),
(1957, 128, 'Mchinji', 'MCH', 1),
(1958, 128, 'Mulanje', 'MLJ', 1),
(1959, 128, 'Mwanza', 'MWZ', 1),
(1960, 128, 'Mzimba', 'MZM', 1),
(1961, 128, 'Ntcheu', 'NTU', 1),
(1962, 128, 'Nkhata Bay', 'NKB', 1),
(1963, 128, 'Nkhotakota', 'NKH', 1),
(1964, 128, 'Nsanje', 'NSJ', 1),
(1965, 128, 'Ntchisi', 'NTI', 1),
(1966, 128, 'Phalombe', 'PHL', 1),
(1967, 128, 'Rumphi', 'RMP', 1),
(1968, 128, 'Salima', 'SLM', 1),
(1969, 128, 'Thyolo', 'THY', 1),
(1970, 128, 'Zomba', 'ZBA', 1),
(1971, 129, 'Johor', 'MY-01', 1),
(1972, 129, 'Kedah', 'MY-02', 1),
(1973, 129, 'Kelantan', 'MY-03', 1),
(1974, 129, 'Labuan', 'MY-15', 1),
(1975, 129, 'Melaka', 'MY-04', 1),
(1976, 129, 'Negeri Sembilan', 'MY-05', 1),
(1977, 129, 'Pahang', 'MY-06', 1),
(1978, 129, 'Perak', 'MY-08', 1),
(1979, 129, 'Perlis', 'MY-09', 1),
(1980, 129, 'Pulau Pinang', 'MY-07', 1),
(1981, 129, 'Sabah', 'MY-12', 1),
(1982, 129, 'Sarawak', 'MY-13', 1),
(1983, 129, 'Selangor', 'MY-10', 1),
(1984, 129, 'Terengganu', 'MY-11', 1),
(1985, 129, 'Kuala Lumpur', 'MY-14', 1),
(4035, 129, 'Putrajaya', 'MY-16', 1),
(1986, 130, 'Thiladhunmathi Uthuru', 'THU', 1),
(1987, 130, 'Thiladhunmathi Dhekunu', 'THD', 1),
(1988, 130, 'Miladhunmadulu Uthuru', 'MLU', 1),
(1989, 130, 'Miladhunmadulu Dhekunu', 'MLD', 1),
(1990, 130, 'Maalhosmadulu Uthuru', 'MAU', 1),
(1991, 130, 'Maalhosmadulu Dhekunu', 'MAD', 1),
(1992, 130, 'Faadhippolhu', 'FAA', 1),
(1993, 130, 'Male Atoll', 'MAA', 1),
(1994, 130, 'Ari Atoll Uthuru', 'AAU', 1),
(1995, 130, 'Ari Atoll Dheknu', 'AAD', 1),
(1996, 130, 'Felidhe Atoll', 'FEA', 1),
(1997, 130, 'Mulaku Atoll', 'MUA', 1),
(1998, 130, 'Nilandhe Atoll Uthuru', 'NAU', 1),
(1999, 130, 'Nilandhe Atoll Dhekunu', 'NAD', 1),
(2000, 130, 'Kolhumadulu', 'KLH', 1),
(2001, 130, 'Hadhdhunmathi', 'HDH', 1),
(2002, 130, 'Huvadhu Atoll Uthuru', 'HAU', 1),
(2003, 130, 'Huvadhu Atoll Dhekunu', 'HAD', 1),
(2004, 130, 'Fua Mulaku', 'FMU', 1),
(2005, 130, 'Addu', 'ADD', 1),
(2006, 131, 'Gao', 'GA', 1),
(2007, 131, 'Kayes', 'KY', 1),
(2008, 131, 'Kidal', 'KD', 1),
(2009, 131, 'Koulikoro', 'KL', 1),
(2010, 131, 'Mopti', 'MP', 1),
(2011, 131, 'Segou', 'SG', 1),
(2012, 131, 'Sikasso', 'SK', 1),
(2013, 131, 'Tombouctou', 'TB', 1),
(2014, 131, 'Bamako Capital District', 'CD', 1),
(2015, 132, 'Attard', 'ATT', 1),
(2016, 132, 'Balzan', 'BAL', 1),
(2017, 132, 'Birgu', 'BGU', 1),
(2018, 132, 'Birkirkara', 'BKK', 1),
(2019, 132, 'Birzebbuga', 'BRZ', 1),
(2020, 132, 'Bormla', 'BOR', 1),
(2021, 132, 'Dingli', 'DIN', 1),
(2022, 132, 'Fgura', 'FGU', 1),
(2023, 132, 'Floriana', 'FLO', 1),
(2024, 132, 'Gudja', 'GDJ', 1),
(2025, 132, 'Gzira', 'GZR', 1),
(2026, 132, 'Gargur', 'GRG', 1),
(2027, 132, 'Gaxaq', 'GXQ', 1),
(2028, 132, 'Hamrun', 'HMR', 1),
(2029, 132, 'Iklin', 'IKL', 1),
(2030, 132, 'Isla', 'ISL', 1),
(2031, 132, 'Kalkara', 'KLK', 1),
(2032, 132, 'Kirkop', 'KRK', 1),
(2033, 132, 'Lija', 'LIJ', 1),
(2034, 132, 'Luqa', 'LUQ', 1),
(2035, 132, 'Marsa', 'MRS', 1),
(2036, 132, 'Marsaskala', 'MKL', 1),
(2037, 132, 'Marsaxlokk', 'MXL', 1),
(2038, 132, 'Mdina', 'MDN', 1),
(2039, 132, 'Melliea', 'MEL', 1),
(2040, 132, 'Mgarr', 'MGR', 1),
(2041, 132, 'Mosta', 'MST', 1),
(2042, 132, 'Mqabba', 'MQA', 1),
(2043, 132, 'Msida', 'MSI', 1),
(2044, 132, 'Mtarfa', 'MTF', 1),
(2045, 132, 'Naxxar', 'NAX', 1),
(2046, 132, 'Paola', 'PAO', 1),
(2047, 132, 'Pembroke', 'PEM', 1),
(2048, 132, 'Pieta', 'PIE', 1),
(2049, 132, 'Qormi', 'QOR', 1),
(2050, 132, 'Qrendi', 'QRE', 1),
(2051, 132, 'Rabat', 'RAB', 1),
(2052, 132, 'Safi', 'SAF', 1),
(2053, 132, 'San Giljan', 'SGI', 1),
(2054, 132, 'Santa Lucija', 'SLU', 1),
(2055, 132, 'San Pawl il-Bahar', 'SPB', 1),
(2056, 132, 'San Gwann', 'SGW', 1),
(2057, 132, 'Santa Venera', 'SVE', 1),
(2058, 132, 'Siggiewi', 'SIG', 1),
(2059, 132, 'Sliema', 'SLM', 1),
(2060, 132, 'Swieqi', 'SWQ', 1),
(2061, 132, 'Ta Xbiex', 'TXB', 1),
(2062, 132, 'Tarxien', 'TRX', 1),
(2063, 132, 'Valletta', 'VLT', 1),
(2064, 132, 'Xgajra', 'XGJ', 1),
(2065, 132, 'Zabbar', 'ZBR', 1),
(2066, 132, 'Zebbug', 'ZBG', 1),
(2067, 132, 'Zejtun', 'ZJT', 1),
(2068, 132, 'Zurrieq', 'ZRQ', 1),
(2069, 132, 'Fontana', 'FNT', 1),
(2070, 132, 'Ghajnsielem', 'GHJ', 1),
(2071, 132, 'Gharb', 'GHR', 1),
(2072, 132, 'Ghasri', 'GHS', 1),
(2073, 132, 'Kercem', 'KRC', 1),
(2074, 132, 'Munxar', 'MUN', 1),
(2075, 132, 'Nadur', 'NAD', 1),
(2076, 132, 'Qala', 'QAL', 1),
(2077, 132, 'Victoria', 'VIC', 1),
(2078, 132, 'San Lawrenz', 'SLA', 1),
(2079, 132, 'Sannat', 'SNT', 1),
(2080, 132, 'Xagra', 'ZAG', 1),
(2081, 132, 'Xewkija', 'XEW', 1),
(2082, 132, 'Zebbug', 'ZEB', 1),
(2083, 133, 'Ailinginae', 'ALG', 1),
(2084, 133, 'Ailinglaplap', 'ALL', 1),
(2085, 133, 'Ailuk', 'ALK', 1),
(2086, 133, 'Arno', 'ARN', 1),
(2087, 133, 'Aur', 'AUR', 1),
(2088, 133, 'Bikar', 'BKR', 1),
(2089, 133, 'Bikini', 'BKN', 1),
(2090, 133, 'Bokak', 'BKK', 1),
(2091, 133, 'Ebon', 'EBN', 1),
(2092, 133, 'Enewetak', 'ENT', 1),
(2093, 133, 'Erikub', 'EKB', 1),
(2094, 133, 'Jabat', 'JBT', 1),
(2095, 133, 'Jaluit', 'JLT', 1),
(2096, 133, 'Jemo', 'JEM', 1),
(2097, 133, 'Kili', 'KIL', 1),
(2098, 133, 'Kwajalein', 'KWJ', 1),
(2099, 133, 'Lae', 'LAE', 1),
(2100, 133, 'Lib', 'LIB', 1),
(2101, 133, 'Likiep', 'LKP', 1),
(2102, 133, 'Majuro', 'MJR', 1),
(2103, 133, 'Maloelap', 'MLP', 1),
(2104, 133, 'Mejit', 'MJT', 1),
(2105, 133, 'Mili', 'MIL', 1),
(2106, 133, 'Namorik', 'NMK', 1),
(2107, 133, 'Namu', 'NAM', 1),
(2108, 133, 'Rongelap', 'RGL', 1),
(2109, 133, 'Rongrik', 'RGK', 1),
(2110, 133, 'Toke', 'TOK', 1),
(2111, 133, 'Ujae', 'UJA', 1),
(2112, 133, 'Ujelang', 'UJL', 1),
(2113, 133, 'Utirik', 'UTK', 1),
(2114, 133, 'Wotho', 'WTH', 1),
(2115, 133, 'Wotje', 'WTJ', 1),
(2116, 135, 'Adrar', 'AD', 1),
(2117, 135, 'Assaba', 'AS', 1),
(2118, 135, 'Brakna', 'BR', 1),
(2119, 135, 'Dakhlet Nouadhibou', 'DN', 1),
(2120, 135, 'Gorgol', 'GO', 1),
(2121, 135, 'Guidimaka', 'GM', 1),
(2122, 135, 'Hodh Ech Chargui', 'HC', 1),
(2123, 135, 'Hodh El Gharbi', 'HG', 1),
(2124, 135, 'Inchiri', 'IN', 1),
(2125, 135, 'Tagant', 'TA', 1),
(2126, 135, 'Tiris Zemmour', 'TZ', 1),
(2127, 135, 'Trarza', 'TR', 1),
(2128, 135, 'Nouakchott', 'NO', 1),
(2129, 136, 'Beau Bassin-Rose Hill', 'BR', 1),
(2130, 136, 'Curepipe', 'CU', 1),
(2131, 136, 'Port Louis', 'PU', 1),
(2132, 136, 'Quatre Bornes', 'QB', 1),
(2133, 136, 'Vacoas-Phoenix', 'VP', 1),
(2134, 136, 'Agalega Islands', 'AG', 1),
(2135, 136, 'Cargados Carajos Shoals (Saint Brandon Islands)', 'CC', 1),
(2136, 136, 'Rodrigues', 'RO', 1),
(2137, 136, 'Black River', 'BL', 1),
(2138, 136, 'Flacq', 'FL', 1),
(2139, 136, 'Grand Port', 'GP', 1),
(2140, 136, 'Moka', 'MO', 1),
(2141, 136, 'Pamplemousses', 'PA', 1),
(2142, 136, 'Plaines Wilhems', 'PW', 1),
(2143, 136, 'Port Louis', 'PL', 1),
(2144, 136, 'Riviere du Rempart', 'RR', 1),
(2145, 136, 'Savanne', 'SA', 1),
(2146, 138, 'Baja California Norte', 'BN', 1),
(2147, 138, 'Baja California Sur', 'BS', 1),
(2148, 138, 'Campeche', 'CA', 1),
(2149, 138, 'Chiapas', 'CI', 1),
(2150, 138, 'Chihuahua', 'CH', 1),
(2151, 138, 'Coahuila de Zaragoza', 'CZ', 1),
(2152, 138, 'Colima', 'CL', 1),
(2153, 138, 'Distrito Federal', 'DF', 1),
(2154, 138, 'Durango', 'DU', 1),
(2155, 138, 'Guanajuato', 'GA', 1),
(2156, 138, 'Guerrero', 'GE', 1),
(2157, 138, 'Hidalgo', 'HI', 1),
(2158, 138, 'Jalisco', 'JA', 1),
(2159, 138, 'Mexico', 'ME', 1),
(2160, 138, 'Michoacan de Ocampo', 'MI', 1),
(2161, 138, 'Morelos', 'MO', 1),
(2162, 138, 'Nayarit', 'NA', 1),
(2163, 138, 'Nuevo Leon', 'NL', 1),
(2164, 138, 'Oaxaca', 'OA', 1),
(2165, 138, 'Puebla', 'PU', 1),
(2166, 138, 'Queretaro de Arteaga', 'QA', 1),
(2167, 138, 'Quintana Roo', 'QR', 1),
(2168, 138, 'San Luis Potosi', 'SA', 1),
(2169, 138, 'Sinaloa', 'SI', 1),
(2170, 138, 'Sonora', 'SO', 1),
(2171, 138, 'Tabasco', 'TB', 1),
(2172, 138, 'Tamaulipas', 'TM', 1),
(2173, 138, 'Tlaxcala', 'TL', 1),
(2174, 138, 'Veracruz-Llave', 'VE', 1),
(2175, 138, 'Yucatan', 'YU', 1),
(2176, 138, 'Zacatecas', 'ZA', 1),
(2177, 139, 'Chuuk', 'C', 1),
(2178, 139, 'Kosrae', 'K', 1),
(2179, 139, 'Pohnpei', 'P', 1),
(2180, 139, 'Yap', 'Y', 1),
(2181, 140, 'Gagauzia', 'GA', 1),
(2182, 140, 'Chisinau', 'CU', 1),
(2183, 140, 'Balti', 'BA', 1),
(2184, 140, 'Cahul', 'CA', 1),
(2185, 140, 'Edinet', 'ED', 1),
(2186, 140, 'Lapusna', 'LA', 1),
(2187, 140, 'Orhei', 'OR', 1),
(2188, 140, 'Soroca', 'SO', 1),
(2189, 140, 'Tighina', 'TI', 1),
(2190, 140, 'Ungheni', 'UN', 1),
(2191, 140, 'St‚nga Nistrului', 'SN', 1),
(2192, 141, 'Fontvieille', 'FV', 1),
(2193, 141, 'La Condamine', 'LC', 1),
(2194, 141, 'Monaco-Ville', 'MV', 1),
(2195, 141, 'Monte-Carlo', 'MC', 1),
(2196, 142, 'Ulanbaatar', '1', 1),
(2197, 142, 'Orhon', '035', 1),
(2198, 142, 'Darhan uul', '037', 1),
(2199, 142, 'Hentiy', '039', 1),
(2200, 142, 'Hovsgol', '041', 1),
(2201, 142, 'Hovd', '043', 1),
(2202, 142, 'Uvs', '046', 1),
(2203, 142, 'Tov', '047', 1),
(2204, 142, 'Selenge', '049', 1),
(2205, 142, 'Suhbaatar', '051', 1),
(2206, 142, 'Omnogovi', '053', 1),
(2207, 142, 'Ovorhangay', '055', 1),
(2208, 142, 'Dzavhan', '057', 1),
(2209, 142, 'DundgovL', '059', 1),
(2210, 142, 'Dornod', '061', 1),
(2211, 142, 'Dornogov', '063', 1),
(2212, 142, 'Govi-Sumber', '064', 1),
(2213, 142, 'Govi-Altay', '065', 1),
(2214, 142, 'Bulgan', '067', 1),
(2215, 142, 'Bayanhongor', '069', 1),
(2216, 142, 'Bayan-Olgiy', '071', 1),
(2217, 142, 'Arhangay', '073', 1),
(2218, 143, 'Saint Anthony', 'A', 1),
(2219, 143, 'Saint Georges', 'G', 1),
(2220, 143, 'Saint Peter', 'P', 1),
(2221, 144, 'Agadir', 'AGD', 1),
(2222, 144, 'Al Hoceima', 'HOC', 1),
(2223, 144, 'Azilal', 'AZI', 1),
(2224, 144, 'Beni Mellal', 'BME', 1),
(2225, 144, 'Ben Slimane', 'BSL', 1),
(2226, 144, 'Boulemane', 'BLM', 1),
(2227, 144, 'Casablanca', 'CBL', 1),
(2228, 144, 'Chaouen', 'CHA', 1),
(2229, 144, 'El Jadida', 'EJA', 1),
(2230, 144, 'El Kelaa des Sraghna', 'EKS', 1),
(2231, 144, 'Er Rachidia', 'ERA', 1),
(2232, 144, 'Essaouira', 'ESS', 1),
(2233, 144, 'Fes', 'FES', 1),
(2234, 144, 'Figuig', 'FIG', 1),
(2235, 144, 'Guelmim', 'GLM', 1),
(2236, 144, 'Ifrane', 'IFR', 1),
(2237, 144, 'Kenitra', 'KEN', 1),
(2238, 144, 'Khemisset', 'KHM', 1),
(2239, 144, 'Khenifra', 'KHN', 1),
(2240, 144, 'Khouribga', 'KHO', 1),
(2241, 144, 'Laayoune', 'LYN', 1),
(2242, 144, 'Larache', 'LAR', 1),
(2243, 144, 'Marrakech', 'MRK', 1),
(2244, 144, 'Meknes', 'MKN', 1),
(2245, 144, 'Nador', 'NAD', 1),
(2246, 144, 'Ouarzazate', 'ORZ', 1),
(2247, 144, 'Oujda', 'OUJ', 1),
(2248, 144, 'Rabat-Sale', 'RSA', 1),
(2249, 144, 'Safi', 'SAF', 1),
(2250, 144, 'Settat', 'SET', 1),
(2251, 144, 'Sidi Kacem', 'SKA', 1),
(2252, 144, 'Tangier', 'TGR', 1),
(2253, 144, 'Tan-Tan', 'TAN', 1),
(2254, 144, 'Taounate', 'TAO', 1),
(2255, 144, 'Taroudannt', 'TRD', 1),
(2256, 144, 'Tata', 'TAT', 1),
(2257, 144, 'Taza', 'TAZ', 1),
(2258, 144, 'Tetouan', 'TET', 1),
(2259, 144, 'Tiznit', 'TIZ', 1),
(2260, 144, 'Ad Dakhla', 'ADK', 1),
(2261, 144, 'Boujdour', 'BJD', 1),
(2262, 144, 'Es Smara', 'ESM', 1),
(2263, 145, 'Cabo Delgado', 'CD', 1),
(2264, 145, 'Gaza', 'GZ', 1),
(2265, 145, 'Inhambane', 'IN', 1),
(2266, 145, 'Manica', 'MN', 1),
(2267, 145, 'Maputo (city)', 'MC', 1),
(2268, 145, 'Maputo', 'MP', 1),
(2269, 145, 'Nampula', 'NA', 1),
(2270, 145, 'Niassa', 'NI', 1),
(2271, 145, 'Sofala', 'SO', 1),
(2272, 145, 'Tete', 'TE', 1),
(2273, 145, 'Zambezia', 'ZA', 1),
(2274, 146, 'Ayeyarwady', 'AY', 1),
(2275, 146, 'Bago', 'BG', 1),
(2276, 146, 'Magway', 'MG', 1),
(2277, 146, 'Mandalay', 'MD', 1),
(2278, 146, 'Sagaing', 'SG', 1),
(2279, 146, 'Tanintharyi', 'TN', 1),
(2280, 146, 'Yangon', 'YG', 1),
(2281, 146, 'Chin State', 'CH', 1),
(2282, 146, 'Kachin State', 'KC', 1),
(2283, 146, 'Kayah State', 'KH', 1),
(2284, 146, 'Kayin State', 'KN', 1),
(2285, 146, 'Mon State', 'MN', 1),
(2286, 146, 'Rakhine State', 'RK', 1),
(2287, 146, 'Shan State', 'SH', 1),
(2288, 147, 'Caprivi', 'CA', 1),
(2289, 147, 'Erongo', 'ER', 1),
(2290, 147, 'Hardap', 'HA', 1),
(2291, 147, 'Karas', 'KR', 1),
(2292, 147, 'Kavango', 'KV', 1),
(2293, 147, 'Khomas', 'KH', 1),
(2294, 147, 'Kunene', 'KU', 1),
(2295, 147, 'Ohangwena', 'OW', 1),
(2296, 147, 'Omaheke', 'OK', 1),
(2297, 147, 'Omusati', 'OT', 1),
(2298, 147, 'Oshana', 'ON', 1),
(2299, 147, 'Oshikoto', 'OO', 1),
(2300, 147, 'Otjozondjupa', 'OJ', 1),
(2301, 148, 'Aiwo', 'AO', 1),
(2302, 148, 'Anabar', 'AA', 1),
(2303, 148, 'Anetan', 'AT', 1),
(2304, 148, 'Anibare', 'AI', 1),
(2305, 148, 'Baiti', 'BA', 1),
(2306, 148, 'Boe', 'BO', 1),
(2307, 148, 'Buada', 'BU', 1),
(2308, 148, 'Denigomodu', 'DE', 1),
(2309, 148, 'Ewa', 'EW', 1),
(2310, 148, 'Ijuw', 'IJ', 1),
(2311, 148, 'Meneng', 'ME', 1),
(2312, 148, 'Nibok', 'NI', 1),
(2313, 148, 'Uaboe', 'UA', 1),
(2314, 148, 'Yaren', 'YA', 1),
(2315, 149, 'Bagmati', 'BA', 1),
(2316, 149, 'Bheri', 'BH', 1),
(2317, 149, 'Dhawalagiri', 'DH', 1),
(2318, 149, 'Gandaki', 'GA', 1),
(2319, 149, 'Janakpur', 'JA', 1),
(2320, 149, 'Karnali', 'KA', 1),
(2321, 149, 'Kosi', 'KO', 1),
(2322, 149, 'Lumbini', 'LU', 1),
(2323, 149, 'Mahakali', 'MA', 1),
(2324, 149, 'Mechi', 'ME', 1),
(2325, 149, 'Narayani', 'NA', 1),
(2326, 149, 'Rapti', 'RA', 1),
(2327, 149, 'Sagarmatha', 'SA', 1),
(2328, 149, 'Seti', 'SE', 1),
(2329, 150, 'Drenthe', 'DR', 1),
(2330, 150, 'Flevoland', 'FL', 1),
(2331, 150, 'Friesland', 'FR', 1),
(2332, 150, 'Gelderland', 'GE', 1),
(2333, 150, 'Groningen', 'GR', 1),
(2334, 150, 'Limburg', 'LI', 1),
(2335, 150, 'Noord Brabant', 'NB', 1),
(2336, 150, 'Noord Holland', 'NH', 1),
(2337, 150, 'Overijssel', 'OV', 1),
(2338, 150, 'Utrecht', 'UT', 1),
(2339, 150, 'Zeeland', 'ZE', 1),
(2340, 150, 'Zuid Holland', 'ZH', 1),
(2341, 152, 'Iles Loyaute', 'L', 1),
(2342, 152, 'Nord', 'N', 1),
(2343, 152, 'Sud', 'S', 1),
(2344, 153, 'Auckland', 'AUK', 1),
(2345, 153, 'Bay of Plenty', 'BOP', 1),
(2346, 153, 'Canterbury', 'CAN', 1),
(2347, 153, 'Coromandel', 'COR', 1),
(2348, 153, 'Gisborne', 'GIS', 1),
(2349, 153, 'Fiordland', 'FIO', 1),
(2350, 153, 'Hawke''s Bay', 'HKB', 1),
(2351, 153, 'Marlborough', 'MBH', 1),
(2352, 153, 'Manawatu-Wanganui', 'MWT', 1),
(2353, 153, 'Mt Cook-Mackenzie', 'MCM', 1),
(2354, 153, 'Nelson', 'NSN', 1),
(2355, 153, 'Northland', 'NTL', 1),
(2356, 153, 'Otago', 'OTA', 1),
(2357, 153, 'Southland', 'STL', 1),
(2358, 153, 'Taranaki', 'TKI', 1),
(2359, 153, 'Wellington', 'WGN', 1),
(2360, 153, 'Waikato', 'WKO', 1),
(2361, 153, 'Wairarapa', 'WAI', 1),
(2362, 153, 'West Coast', 'WTC', 1),
(2363, 154, 'Atlantico Norte', 'AN', 1),
(2364, 154, 'Atlantico Sur', 'AS', 1),
(2365, 154, 'Boaco', 'BO', 1),
(2366, 154, 'Carazo', 'CA', 1),
(2367, 154, 'Chinandega', 'CI', 1),
(2368, 154, 'Chontales', 'CO', 1),
(2369, 154, 'Esteli', 'ES', 1),
(2370, 154, 'Granada', 'GR', 1),
(2371, 154, 'Jinotega', 'JI', 1),
(2372, 154, 'Leon', 'LE', 1),
(2373, 154, 'Madriz', 'MD', 1),
(2374, 154, 'Managua', 'MN', 1),
(2375, 154, 'Masaya', 'MS', 1),
(2376, 154, 'Matagalpa', 'MT', 1),
(2377, 154, 'Nuevo Segovia', 'NS', 1),
(2378, 154, 'Rio San Juan', 'RS', 1),
(2379, 154, 'Rivas', 'RI', 1),
(2380, 155, 'Agadez', 'AG', 1),
(2381, 155, 'Diffa', 'DF', 1),
(2382, 155, 'Dosso', 'DS', 1),
(2383, 155, 'Maradi', 'MA', 1),
(2384, 155, 'Niamey', 'NM', 1),
(2385, 155, 'Tahoua', 'TH', 1),
(2386, 155, 'Tillaberi', 'TL', 1),
(2387, 155, 'Zinder', 'ZD', 1),
(2388, 156, 'Abia', 'AB', 1),
(2389, 156, 'Abuja Federal Capital Territory', 'CT', 1),
(2390, 156, 'Adamawa', 'AD', 1),
(2391, 156, 'Akwa Ibom', 'AK', 1),
(2392, 156, 'Anambra', 'AN', 1),
(2393, 156, 'Bauchi', 'BC', 1),
(2394, 156, 'Bayelsa', 'BY', 1),
(2395, 156, 'Benue', 'BN', 1),
(2396, 156, 'Borno', 'BO', 1),
(2397, 156, 'Cross River', 'CR', 1),
(2398, 156, 'Delta', 'DE', 1),
(2399, 156, 'Ebonyi', 'EB', 1),
(2400, 156, 'Edo', 'ED', 1),
(2401, 156, 'Ekiti', 'EK', 1),
(2402, 156, 'Enugu', 'EN', 1),
(2403, 156, 'Gombe', 'GO', 1),
(2404, 156, 'Imo', 'IM', 1),
(2405, 156, 'Jigawa', 'JI', 1),
(2406, 156, 'Kaduna', 'KD', 1),
(2407, 156, 'Kano', 'KN', 1),
(2408, 156, 'Katsina', 'KT', 1),
(2409, 156, 'Kebbi', 'KE', 1),
(2410, 156, 'Kogi', 'KO', 1),
(2411, 156, 'Kwara', 'KW', 1),
(2412, 156, 'Lagos', 'LA', 1),
(2413, 156, 'Nassarawa', 'NA', 1),
(2414, 156, 'Niger', 'NI', 1),
(2415, 156, 'Ogun', 'OG', 1),
(2416, 156, 'Ondo', 'ONG', 1),
(2417, 156, 'Osun', 'OS', 1),
(2418, 156, 'Oyo', 'OY', 1),
(2419, 156, 'Plateau', 'PL', 1),
(2420, 156, 'Rivers', 'RI', 1),
(2421, 156, 'Sokoto', 'SO', 1),
(2422, 156, 'Taraba', 'TA', 1),
(2423, 156, 'Yobe', 'YO', 1),
(2424, 156, 'Zamfara', 'ZA', 1),
(2425, 159, 'Northern Islands', 'N', 1),
(2426, 159, 'Rota', 'R', 1),
(2427, 159, 'Saipan', 'S', 1),
(2428, 159, 'Tinian', 'T', 1),
(2429, 160, 'Akershus', 'AK', 1),
(2430, 160, 'Aust-Agder', 'AA', 1),
(2431, 160, 'Buskerud', 'BU', 1),
(2432, 160, 'Finnmark', 'FM', 1),
(2433, 160, 'Hedmark', 'HM', 1),
(2434, 160, 'Hordaland', 'HL', 1),
(2435, 160, 'More og Romdal', 'MR', 1),
(2436, 160, 'Nord-Trondelag', 'NT', 1),
(2437, 160, 'Nordland', 'NL', 1),
(2438, 160, 'Ostfold', 'OF', 1),
(2439, 160, 'Oppland', 'OP', 1),
(2440, 160, 'Oslo', 'OL', 1),
(2441, 160, 'Rogaland', 'RL', 1),
(2442, 160, 'Sor-Trondelag', 'ST', 1),
(2443, 160, 'Sogn og Fjordane', 'SJ', 1),
(2444, 160, 'Svalbard', 'SV', 1),
(2445, 160, 'Telemark', 'TM', 1),
(2446, 160, 'Troms', 'TR', 1),
(2447, 160, 'Vest-Agder', 'VA', 1),
(2448, 160, 'Vestfold', 'VF', 1),
(2449, 161, 'Ad Dakhiliyah', 'DA', 1),
(2450, 161, 'Al Batinah', 'BA', 1),
(2451, 161, 'Al Wusta', 'WU', 1),
(2452, 161, 'Ash Sharqiyah', 'SH', 1),
(2453, 161, 'Az Zahirah', 'ZA', 1),
(2454, 161, 'Masqat', 'MA', 1),
(2455, 161, 'Musandam', 'MU', 1),
(2456, 161, 'Zufar', 'ZU', 1),
(2457, 162, 'Balochistan', 'B', 1),
(2458, 162, 'Federally Administered Tribal Areas', 'T', 1),
(2459, 162, 'Islamabad Capital Territory', 'I', 1),
(2460, 162, 'North-West Frontier', 'N', 1),
(2461, 162, 'Punjab', 'P', 1),
(2462, 162, 'Sindh', 'S', 1),
(2463, 163, 'Aimeliik', 'AM', 1),
(2464, 163, 'Airai', 'AR', 1),
(2465, 163, 'Angaur', 'AN', 1),
(2466, 163, 'Hatohobei', 'HA', 1),
(2467, 163, 'Kayangel', 'KA', 1),
(2468, 163, 'Koror', 'KO', 1),
(2469, 163, 'Melekeok', 'ME', 1),
(2470, 163, 'Ngaraard', 'NA', 1),
(2471, 163, 'Ngarchelong', 'NG', 1),
(2472, 163, 'Ngardmau', 'ND', 1),
(2473, 163, 'Ngatpang', 'NT', 1),
(2474, 163, 'Ngchesar', 'NC', 1),
(2475, 163, 'Ngeremlengui', 'NR', 1),
(2476, 163, 'Ngiwal', 'NW', 1),
(2477, 163, 'Peleliu', 'PE', 1),
(2478, 163, 'Sonsorol', 'SO', 1),
(2479, 164, 'Bocas del Toro', 'BT', 1),
(2480, 164, 'Chiriqui', 'CH', 1),
(2481, 164, 'Cocle', 'CC', 1),
(2482, 164, 'Colon', 'CL', 1),
(2483, 164, 'Darien', 'DA', 1),
(2484, 164, 'Herrera', 'HE', 1),
(2485, 164, 'Los Santos', 'LS', 1),
(2486, 164, 'Panama', 'PA', 1),
(2487, 164, 'San Blas', 'SB', 1),
(2488, 164, 'Veraguas', 'VG', 1),
(2489, 165, 'Bougainville', 'BV', 1),
(2490, 165, 'Central', 'CE', 1),
(2491, 165, 'Chimbu', 'CH', 1),
(2492, 165, 'Eastern Highlands', 'EH', 1),
(2493, 165, 'East New Britain', 'EB', 1),
(2494, 165, 'East Sepik', 'ES', 1),
(2495, 165, 'Enga', 'EN', 1),
(2496, 165, 'Gulf', 'GU', 1),
(2497, 165, 'Madang', 'MD', 1),
(2498, 165, 'Manus', 'MN', 1),
(2499, 165, 'Milne Bay', 'MB', 1),
(2500, 165, 'Morobe', 'MR', 1),
(2501, 165, 'National Capital', 'NC', 1),
(2502, 165, 'New Ireland', 'NI', 1),
(2503, 165, 'Northern', 'NO', 1),
(2504, 165, 'Sandaun', 'SA', 1),
(2505, 165, 'Southern Highlands', 'SH', 1),
(2506, 165, 'Western', 'WE', 1),
(2507, 165, 'Western Highlands', 'WH', 1),
(2508, 165, 'West New Britain', 'WB', 1),
(2509, 166, 'Alto Paraguay', 'AG', 1),
(2510, 166, 'Alto Parana', 'AN', 1),
(2511, 166, 'Amambay', 'AM', 1),
(2512, 166, 'Asuncion', 'AS', 1),
(2513, 166, 'Boqueron', 'BO', 1),
(2514, 166, 'Caaguazu', 'CG', 1),
(2515, 166, 'Caazapa', 'CZ', 1),
(2516, 166, 'Canindeyu', 'CN', 1),
(2517, 166, 'Central', 'CE', 1),
(2518, 166, 'Concepcion', 'CC', 1),
(2519, 166, 'Cordillera', 'CD', 1),
(2520, 166, 'Guaira', 'GU', 1),
(2521, 166, 'Itapua', 'IT', 1),
(2522, 166, 'Misiones', 'MI', 1),
(2523, 166, 'Neembucu', 'NE', 1),
(2524, 166, 'Paraguari', 'PA', 1),
(2525, 166, 'Presidente Hayes', 'PH', 1),
(2526, 166, 'San Pedro', 'SP', 1),
(2527, 167, 'Amazonas', 'AM', 1),
(2528, 167, 'Ancash', 'AN', 1),
(2529, 167, 'Apurimac', 'AP', 1),
(2530, 167, 'Arequipa', 'AR', 1),
(2531, 167, 'Ayacucho', 'AY', 1),
(2532, 167, 'Cajamarca', 'CJ', 1),
(2533, 167, 'Callao', 'CL', 1),
(2534, 167, 'Cusco', 'CU', 1),
(2535, 167, 'Huancavelica', 'HV', 1),
(2536, 167, 'Huanuco', 'HO', 1),
(2537, 167, 'Ica', 'IC', 1),
(2538, 167, 'Junin', 'JU', 1),
(2539, 167, 'La Libertad', 'LD', 1),
(2540, 167, 'Lambayeque', 'LY', 1),
(2541, 167, 'Lima', 'LI', 1),
(2542, 167, 'Loreto', 'LO', 1),
(2543, 167, 'Madre de Dios', 'MD', 1),
(2544, 167, 'Moquegua', 'MO', 1),
(2545, 167, 'Pasco', 'PA', 1),
(2546, 167, 'Piura', 'PI', 1),
(2547, 167, 'Puno', 'PU', 1),
(2548, 167, 'San Martin', 'SM', 1),
(2549, 167, 'Tacna', 'TA', 1),
(2550, 167, 'Tumbes', 'TU', 1),
(2551, 167, 'Ucayali', 'UC', 1),
(2552, 168, 'Abra', 'ABR', 1),
(2553, 168, 'Agusan del Norte', 'ANO', 1),
(2554, 168, 'Agusan del Sur', 'ASU', 1),
(2555, 168, 'Aklan', 'AKL', 1),
(2556, 168, 'Albay', 'ALB', 1),
(2557, 168, 'Antique', 'ANT', 1),
(2558, 168, 'Apayao', 'APY', 1),
(2559, 168, 'Aurora', 'AUR', 1),
(2560, 168, 'Basilan', 'BAS', 1),
(2561, 168, 'Bataan', 'BTA', 1),
(2562, 168, 'Batanes', 'BTE', 1),
(2563, 168, 'Batangas', 'BTG', 1),
(2564, 168, 'Biliran', 'BLR', 1),
(2565, 168, 'Benguet', 'BEN', 1),
(2566, 168, 'Bohol', 'BOL', 1),
(2567, 168, 'Bukidnon', 'BUK', 1),
(2568, 168, 'Bulacan', 'BUL', 1),
(2569, 168, 'Cagayan', 'CAG', 1),
(2570, 168, 'Camarines Norte', 'CNO', 1),
(2571, 168, 'Camarines Sur', 'CSU', 1),
(2572, 168, 'Camiguin', 'CAM', 1),
(2573, 168, 'Capiz', 'CAP', 1),
(2574, 168, 'Catanduanes', 'CAT', 1),
(2575, 168, 'Cavite', 'CAV', 1),
(2576, 168, 'Cebu', 'CEB', 1),
(2577, 168, 'Compostela', 'CMP', 1),
(2578, 168, 'Davao del Norte', 'DNO', 1),
(2579, 168, 'Davao del Sur', 'DSU', 1),
(2580, 168, 'Davao Oriental', 'DOR', 1),
(2581, 168, 'Eastern Samar', 'ESA', 1),
(2582, 168, 'Guimaras', 'GUI', 1),
(2583, 168, 'Ifugao', 'IFU', 1),
(2584, 168, 'Ilocos Norte', 'INO', 1),
(2585, 168, 'Ilocos Sur', 'ISU', 1),
(2586, 168, 'Iloilo', 'ILO', 1),
(2587, 168, 'Isabela', 'ISA', 1),
(2588, 168, 'Kalinga', 'KAL', 1),
(2589, 168, 'Laguna', 'LAG', 1),
(2590, 168, 'Lanao del Norte', 'LNO', 1),
(2591, 168, 'Lanao del Sur', 'LSU', 1),
(2592, 168, 'La Union', 'UNI', 1),
(2593, 168, 'Leyte', 'LEY', 1),
(2594, 168, 'Maguindanao', 'MAG', 1),
(2595, 168, 'Marinduque', 'MRN', 1),
(2596, 168, 'Masbate', 'MSB', 1),
(2597, 168, 'Mindoro Occidental', 'MIC', 1),
(2598, 168, 'Mindoro Oriental', 'MIR', 1),
(2599, 168, 'Misamis Occidental', 'MSC', 1),
(2600, 168, 'Misamis Oriental', 'MOR', 1),
(2601, 168, 'Mountain', 'MOP', 1),
(2602, 168, 'Negros Occidental', 'NOC', 1),
(2603, 168, 'Negros Oriental', 'NOR', 1),
(2604, 168, 'North Cotabato', 'NCT', 1),
(2605, 168, 'Northern Samar', 'NSM', 1),
(2606, 168, 'Nueva Ecija', 'NEC', 1),
(2607, 168, 'Nueva Vizcaya', 'NVZ', 1),
(2608, 168, 'Palawan', 'PLW', 1),
(2609, 168, 'Pampanga', 'PMP', 1),
(2610, 168, 'Pangasinan', 'PNG', 1),
(2611, 168, 'Quezon', 'QZN', 1),
(2612, 168, 'Quirino', 'QRN', 1),
(2613, 168, 'Rizal', 'RIZ', 1),
(2614, 168, 'Romblon', 'ROM', 1),
(2615, 168, 'Samar', 'SMR', 1),
(2616, 168, 'Sarangani', 'SRG', 1),
(2617, 168, 'Siquijor', 'SQJ', 1),
(2618, 168, 'Sorsogon', 'SRS', 1),
(2619, 168, 'South Cotabato', 'SCO', 1),
(2620, 168, 'Southern Leyte', 'SLE', 1),
(2621, 168, 'Sultan Kudarat', 'SKU', 1),
(2622, 168, 'Sulu', 'SLU', 1),
(2623, 168, 'Surigao del Norte', 'SNO', 1),
(2624, 168, 'Surigao del Sur', 'SSU', 1),
(2625, 168, 'Tarlac', 'TAR', 1),
(2626, 168, 'Tawi-Tawi', 'TAW', 1),
(2627, 168, 'Zambales', 'ZBL', 1),
(2628, 168, 'Zamboanga del Norte', 'ZNO', 1),
(2629, 168, 'Zamboanga del Sur', 'ZSU', 1),
(2630, 168, 'Zamboanga Sibugay', 'ZSI', 1),
(2631, 170, 'Dolnoslaskie', 'DO', 1),
(2632, 170, 'Kujawsko-Pomorskie', 'KP', 1),
(2633, 170, 'Lodzkie', 'LO', 1),
(2634, 170, 'Lubelskie', 'LL', 1),
(2635, 170, 'Lubuskie', 'LU', 1),
(2636, 170, 'Malopolskie', 'ML', 1),
(2637, 170, 'Mazowieckie', 'MZ', 1),
(2638, 170, 'Opolskie', 'OP', 1),
(2639, 170, 'Podkarpackie', 'PP', 1),
(2640, 170, 'Podlaskie', 'PL', 1),
(2641, 170, 'Pomorskie', 'PM', 1),
(2642, 170, 'Slaskie', 'SL', 1),
(2643, 170, 'Swietokrzyskie', 'SW', 1),
(2644, 170, 'Warminsko-Mazurskie', 'WM', 1),
(2645, 170, 'Wielkopolskie', 'WP', 1),
(2646, 170, 'Zachodniopomorskie', 'ZA', 1),
(2647, 198, 'Saint Pierre', 'P', 1),
(2648, 198, 'Miquelon', 'M', 1),
(2649, 171, 'A&ccedil;ores', 'AC', 1),
(2650, 171, 'Aveiro', 'AV', 1),
(2651, 171, 'Beja', 'BE', 1),
(2652, 171, 'Braga', 'BR', 1),
(2653, 171, 'Bragan&ccedil;a', 'BA', 1),
(2654, 171, 'Castelo Branco', 'CB', 1),
(2655, 171, 'Coimbra', 'CO', 1),
(2656, 171, '&Eacute;vora', 'EV', 1),
(2657, 171, 'Faro', 'FA', 1),
(2658, 171, 'Guarda', 'GU', 1),
(2659, 171, 'Leiria', 'LE', 1),
(2660, 171, 'Lisboa', 'LI', 1),
(2661, 171, 'Madeira', 'ME', 1),
(2662, 171, 'Portalegre', 'PO', 1),
(2663, 171, 'Porto', 'PR', 1),
(2664, 171, 'Santar&eacute;m', 'SA', 1),
(2665, 171, 'Set&uacute;bal', 'SE', 1),
(2666, 171, 'Viana do Castelo', 'VC', 1),
(2667, 171, 'Vila Real', 'VR', 1),
(2668, 171, 'Viseu', 'VI', 1),
(2669, 173, 'Ad Dawhah', 'DW', 1),
(2670, 173, 'Al Ghuwayriyah', 'GW', 1),
(2671, 173, 'Al Jumayliyah', 'JM', 1),
(2672, 173, 'Al Khawr', 'KR', 1),
(2673, 173, 'Al Wakrah', 'WK', 1),
(2674, 173, 'Ar Rayyan', 'RN', 1),
(2675, 173, 'Jarayan al Batinah', 'JB', 1),
(2676, 173, 'Madinat ash Shamal', 'MS', 1),
(2677, 173, 'Umm Sa''id', 'UD', 1),
(2678, 173, 'Umm Salal', 'UL', 1),
(2679, 175, 'Alba', 'AB', 1),
(2680, 175, 'Arad', 'AR', 1),
(2681, 175, 'Arges', 'AG', 1),
(2682, 175, 'Bacau', 'BC', 1),
(2683, 175, 'Bihor', 'BH', 1),
(2684, 175, 'Bistrita-Nasaud', 'BN', 1),
(2685, 175, 'Botosani', 'BT', 1),
(2686, 175, 'Brasov', 'BV', 1),
(2687, 175, 'Braila', 'BR', 1),
(2688, 175, 'Bucuresti', 'B', 1),
(2689, 175, 'Buzau', 'BZ', 1),
(2690, 175, 'Caras-Severin', 'CS', 1),
(2691, 175, 'Calarasi', 'CL', 1),
(2692, 175, 'Cluj', 'CJ', 1),
(2693, 175, 'Constanta', 'CT', 1),
(2694, 175, 'Covasna', 'CV', 1),
(2695, 175, 'Dimbovita', 'DB', 1),
(2696, 175, 'Dolj', 'DJ', 1),
(2697, 175, 'Galati', 'GL', 1),
(2698, 175, 'Giurgiu', 'GR', 1),
(2699, 175, 'Gorj', 'GJ', 1),
(2700, 175, 'Harghita', 'HR', 1),
(2701, 175, 'Hunedoara', 'HD', 1),
(2702, 175, 'Ialomita', 'IL', 1),
(2703, 175, 'Iasi', 'IS', 1),
(2704, 175, 'Ilfov', 'IF', 1),
(2705, 175, 'Maramures', 'MM', 1),
(2706, 175, 'Mehedinti', 'MH', 1),
(2707, 175, 'Mures', 'MS', 1),
(2708, 175, 'Neamt', 'NT', 1),
(2709, 175, 'Olt', 'OT', 1),
(2710, 175, 'Prahova', 'PH', 1),
(2711, 175, 'Satu-Mare', 'SM', 1),
(2712, 175, 'Salaj', 'SJ', 1),
(2713, 175, 'Sibiu', 'SB', 1),
(2714, 175, 'Suceava', 'SV', 1),
(2715, 175, 'Teleorman', 'TR', 1),
(2716, 175, 'Timis', 'TM', 1),
(2717, 175, 'Tulcea', 'TL', 1),
(2718, 175, 'Vaslui', 'VS', 1),
(2719, 175, 'Valcea', 'VL', 1),
(2720, 175, 'Vrancea', 'VN', 1),
(2721, 176, 'Abakan', 'AB', 1),
(2722, 176, 'Aginskoye', 'AG', 1),
(2723, 176, 'Anadyr', 'AN', 1),
(2724, 176, 'Arkahangelsk', 'AR', 1),
(2725, 176, 'Astrakhan', 'AS', 1),
(2726, 176, 'Barnaul', 'BA', 1),
(2727, 176, 'Belgorod', 'BE', 1),
(2728, 176, 'Birobidzhan', 'BI', 1),
(2729, 176, 'Blagoveshchensk', 'BL', 1),
(2730, 176, 'Bryansk', 'BR', 1),
(2731, 176, 'Cheboksary', 'CH', 1),
(2732, 176, 'Chelyabinsk', 'CL', 1),
(2733, 176, 'Cherkessk', 'CR', 1),
(2734, 176, 'Chita', 'CI', 1),
(2735, 176, 'Dudinka', 'DU', 1),
(2736, 176, 'Elista', 'EL', 1),
(2737, 176, 'Gomo-Altaysk', 'GO', 1),
(2738, 176, 'Gorno-Altaysk', 'GA', 1),
(2739, 176, 'Groznyy', 'GR', 1),
(2740, 176, 'Irkutsk', 'IR', 1),
(2741, 176, 'Ivanovo', 'IV', 1),
(2742, 176, 'Izhevsk', 'IZ', 1),
(2743, 176, 'Kalinigrad', 'KA', 1),
(2744, 176, 'Kaluga', 'KL', 1),
(2745, 176, 'Kasnodar', 'KS', 1),
(2746, 176, 'Kazan', 'KZ', 1),
(2747, 176, 'Kemerovo', 'KE', 1),
(2748, 176, 'Khabarovsk', 'KH', 1),
(2749, 176, 'Khanty-Mansiysk', 'KM', 1),
(2750, 176, 'Kostroma', 'KO', 1),
(2751, 176, 'Krasnodar', 'KR', 1),
(2752, 176, 'Krasnoyarsk', 'KN', 1),
(2753, 176, 'Kudymkar', 'KU', 1),
(2754, 176, 'Kurgan', 'KG', 1),
(2755, 176, 'Kursk', 'KK', 1),
(2756, 176, 'Kyzyl', 'KY', 1),
(2757, 176, 'Lipetsk', 'LI', 1),
(2758, 176, 'Magadan', 'MA', 1),
(2759, 176, 'Makhachkala', 'MK', 1),
(2760, 176, 'Maykop', 'MY', 1),
(2761, 176, 'Moscow', 'MO', 1),
(2762, 176, 'Murmansk', 'MU', 1),
(2763, 176, 'Nalchik', 'NA', 1),
(2764, 176, 'Naryan Mar', 'NR', 1),
(2765, 176, 'Nazran', 'NZ', 1),
(2766, 176, 'Nizhniy Novgorod', 'NI', 1),
(2767, 176, 'Novgorod', 'NO', 1),
(2768, 176, 'Novosibirsk', 'NV', 1),
(2769, 176, 'Omsk', 'OM', 1),
(2770, 176, 'Orel', 'OR', 1),
(2771, 176, 'Orenburg', 'OE', 1),
(2772, 176, 'Palana', 'PA', 1),
(2773, 176, 'Penza', 'PE', 1),
(2774, 176, 'Perm', 'PR', 1),
(2775, 176, 'Petropavlovsk-Kamchatskiy', 'PK', 1),
(2776, 176, 'Petrozavodsk', 'PT', 1),
(2777, 176, 'Pskov', 'PS', 1),
(2778, 176, 'Rostov-na-Donu', 'RO', 1),
(2779, 176, 'Ryazan', 'RY', 1),
(2780, 176, 'Salekhard', 'SL', 1),
(2781, 176, 'Samara', 'SA', 1),
(2782, 176, 'Saransk', 'SR', 1),
(2783, 176, 'Saratov', 'SV', 1),
(2784, 176, 'Smolensk', 'SM', 1),
(2785, 176, 'St. Petersburg', 'SP', 1),
(2786, 176, 'Stavropol', 'ST', 1),
(2787, 176, 'Syktyvkar', 'SY', 1),
(2788, 176, 'Tambov', 'TA', 1),
(2789, 176, 'Tomsk', 'TO', 1),
(2790, 176, 'Tula', 'TU', 1),
(2791, 176, 'Tura', 'TR', 1),
(2792, 176, 'Tver', 'TV', 1),
(2793, 176, 'Tyumen', 'TY', 1),
(2794, 176, 'Ufa', 'UF', 1),
(2795, 176, 'Ul''yanovsk', 'UL', 1),
(2796, 176, 'Ulan-Ude', 'UU', 1),
(2797, 176, 'Ust''-Ordynskiy', 'US', 1),
(2798, 176, 'Vladikavkaz', 'VL', 1),
(2799, 176, 'Vladimir', 'VA', 1),
(2800, 176, 'Vladivostok', 'VV', 1),
(2801, 176, 'Volgograd', 'VG', 1),
(2802, 176, 'Vologda', 'VD', 1),
(2803, 176, 'Voronezh', 'VO', 1),
(2804, 176, 'Vyatka', 'VY', 1),
(2805, 176, 'Yakutsk', 'YA', 1),
(2806, 176, 'Yaroslavl', 'YR', 1),
(2807, 176, 'Yekaterinburg', 'YE', 1),
(2808, 176, 'Yoshkar-Ola', 'YO', 1),
(2809, 177, 'Butare', 'BU', 1),
(2810, 177, 'Byumba', 'BY', 1),
(2811, 177, 'Cyangugu', 'CY', 1),
(2812, 177, 'Gikongoro', 'GK', 1),
(2813, 177, 'Gisenyi', 'GS', 1),
(2814, 177, 'Gitarama', 'GT', 1),
(2815, 177, 'Kibungo', 'KG', 1),
(2816, 177, 'Kibuye', 'KY', 1),
(2817, 177, 'Kigali Rurale', 'KR', 1),
(2818, 177, 'Kigali-ville', 'KV', 1),
(2819, 177, 'Ruhengeri', 'RU', 1),
(2820, 177, 'Umutara', 'UM', 1),
(2821, 178, 'Christ Church Nichola Town', 'CCN', 1),
(2822, 178, 'Saint Anne Sandy Point', 'SAS', 1),
(2823, 178, 'Saint George Basseterre', 'SGB', 1),
(2824, 178, 'Saint George Gingerland', 'SGG', 1),
(2825, 178, 'Saint James Windward', 'SJW', 1),
(2826, 178, 'Saint John Capesterre', 'SJC', 1),
(2827, 178, 'Saint John Figtree', 'SJF', 1),
(2828, 178, 'Saint Mary Cayon', 'SMC', 1),
(2829, 178, 'Saint Paul Capesterre', 'CAP', 1),
(2830, 178, 'Saint Paul Charlestown', 'CHA', 1),
(2831, 178, 'Saint Peter Basseterre', 'SPB', 1),
(2832, 178, 'Saint Thomas Lowland', 'STL', 1),
(2833, 178, 'Saint Thomas Middle Island', 'STM', 1),
(2834, 178, 'Trinity Palmetto Point', 'TPP', 1),
(2835, 179, 'Anse-la-Raye', 'AR', 1),
(2836, 179, 'Castries', 'CA', 1),
(2837, 179, 'Choiseul', 'CH', 1),
(2838, 179, 'Dauphin', 'DA', 1),
(2839, 179, 'Dennery', 'DE', 1),
(2840, 179, 'Gros-Islet', 'GI', 1),
(2841, 179, 'Laborie', 'LA', 1),
(2842, 179, 'Micoud', 'MI', 1),
(2843, 179, 'Praslin', 'PR', 1),
(2844, 179, 'Soufriere', 'SO', 1),
(2845, 179, 'Vieux-Fort', 'VF', 1),
(2846, 180, 'Charlotte', 'C', 1),
(2847, 180, 'Grenadines', 'R', 1),
(2848, 180, 'Saint Andrew', 'A', 1),
(2849, 180, 'Saint David', 'D', 1),
(2850, 180, 'Saint George', 'G', 1),
(2851, 180, 'Saint Patrick', 'P', 1),
(2852, 181, 'A''ana', 'AN', 1),
(2853, 181, 'Aiga-i-le-Tai', 'AI', 1),
(2854, 181, 'Atua', 'AT', 1),
(2855, 181, 'Fa''asaleleaga', 'FA', 1),
(2856, 181, 'Gaga''emauga', 'GE', 1),
(2857, 181, 'Gagaifomauga', 'GF', 1),
(2858, 181, 'Palauli', 'PA', 1),
(2859, 181, 'Satupa''itea', 'SA', 1),
(2860, 181, 'Tuamasaga', 'TU', 1),
(2861, 181, 'Va''a-o-Fonoti', 'VF', 1),
(2862, 181, 'Vaisigano', 'VS', 1),
(2863, 182, 'Acquaviva', 'AC', 1),
(2864, 182, 'Borgo Maggiore', 'BM', 1),
(2865, 182, 'Chiesanuova', 'CH', 1),
(2866, 182, 'Domagnano', 'DO', 1),
(2867, 182, 'Faetano', 'FA', 1),
(2868, 182, 'Fiorentino', 'FI', 1),
(2869, 182, 'Montegiardino', 'MO', 1),
(2870, 182, 'Citta di San Marino', 'SM', 1),
(2871, 182, 'Serravalle', 'SE', 1),
(2872, 183, 'Sao Tome', 'S', 1),
(2873, 183, 'Principe', 'P', 1),
(2874, 184, 'Al Bahah', 'BH', 1),
(2875, 184, 'Al Hudud ash Shamaliyah', 'HS', 1),
(2876, 184, 'Al Jawf', 'JF', 1),
(2877, 184, 'Al Madinah', 'MD', 1),
(2878, 184, 'Al Qasim', 'QS', 1),
(2879, 184, 'Ar Riyad', 'RD', 1),
(2880, 184, 'Ash Sharqiyah (Eastern)', 'AQ', 1),
(2881, 184, '''Asir', 'AS', 1),
(2882, 184, 'Ha''il', 'HL', 1),
(2883, 184, 'Jizan', 'JZ', 1),
(2884, 184, 'Makkah', 'ML', 1),
(2885, 184, 'Najran', 'NR', 1),
(2886, 184, 'Tabuk', 'TB', 1),
(2887, 185, 'Dakar', 'DA', 1),
(2888, 185, 'Diourbel', 'DI', 1),
(2889, 185, 'Fatick', 'FA', 1),
(2890, 185, 'Kaolack', 'KA', 1),
(2891, 185, 'Kolda', 'KO', 1),
(2892, 185, 'Louga', 'LO', 1),
(2893, 185, 'Matam', 'MA', 1),
(2894, 185, 'Saint-Louis', 'SL', 1),
(2895, 185, 'Tambacounda', 'TA', 1),
(2896, 185, 'Thies', 'TH', 1),
(2897, 185, 'Ziguinchor', 'ZI', 1),
(2898, 186, 'Anse aux Pins', 'AP', 1),
(2899, 186, 'Anse Boileau', 'AB', 1),
(2900, 186, 'Anse Etoile', 'AE', 1),
(2901, 186, 'Anse Louis', 'AL', 1),
(2902, 186, 'Anse Royale', 'AR', 1),
(2903, 186, 'Baie Lazare', 'BL', 1),
(2904, 186, 'Baie Sainte Anne', 'BS', 1),
(2905, 186, 'Beau Vallon', 'BV', 1),
(2906, 186, 'Bel Air', 'BA', 1),
(2907, 186, 'Bel Ombre', 'BO', 1),
(2908, 186, 'Cascade', 'CA', 1),
(2909, 186, 'Glacis', 'GL', 1),
(2910, 186, 'Grand'' Anse (on Mahe)', 'GM', 1),
(2911, 186, 'Grand'' Anse (on Praslin)', 'GP', 1),
(2912, 186, 'La Digue', 'DG', 1),
(2913, 186, 'La Riviere Anglaise', 'RA', 1),
(2914, 186, 'Mont Buxton', 'MB', 1),
(2915, 186, 'Mont Fleuri', 'MF', 1),
(2916, 186, 'Plaisance', 'PL', 1),
(2917, 186, 'Pointe La Rue', 'PR', 1),
(2918, 186, 'Port Glaud', 'PG', 1),
(2919, 186, 'Saint Louis', 'SL', 1),
(2920, 186, 'Takamaka', 'TA', 1),
(2921, 187, 'Eastern', 'E', 1),
(2922, 187, 'Northern', 'N', 1),
(2923, 187, 'Southern', 'S', 1),
(2924, 187, 'Western', 'W', 1),
(2925, 189, 'Banskobystrický', 'BA', 1),
(2926, 189, 'Bratislavský', 'BR', 1),
(2927, 189, 'Košický', 'KO', 1),
(2928, 189, 'Nitriansky', 'NI', 1),
(2929, 189, 'Prešovský', 'PR', 1),
(2930, 189, 'Trenčiansky', 'TC', 1),
(2931, 189, 'Trnavský', 'TV', 1),
(2932, 189, 'Žilinský', 'ZI', 1),
(2933, 191, 'Central', 'CE', 1),
(2934, 191, 'Choiseul', 'CH', 1),
(2935, 191, 'Guadalcanal', 'GC', 1),
(2936, 191, 'Honiara', 'HO', 1),
(2937, 191, 'Isabel', 'IS', 1),
(2938, 191, 'Makira', 'MK', 1),
(2939, 191, 'Malaita', 'ML', 1),
(2940, 191, 'Rennell and Bellona', 'RB', 1),
(2941, 191, 'Temotu', 'TM', 1),
(2942, 191, 'Western', 'WE', 1),
(2943, 192, 'Awdal', 'AW', 1),
(2944, 192, 'Bakool', 'BK', 1),
(2945, 192, 'Banaadir', 'BN', 1),
(2946, 192, 'Bari', 'BR', 1),
(2947, 192, 'Bay', 'BY', 1),
(2948, 192, 'Galguduud', 'GA', 1),
(2949, 192, 'Gedo', 'GE', 1),
(2950, 192, 'Hiiraan', 'HI', 1),
(2951, 192, 'Jubbada Dhexe', 'JD', 1),
(2952, 192, 'Jubbada Hoose', 'JH', 1),
(2953, 192, 'Mudug', 'MU', 1),
(2954, 192, 'Nugaal', 'NU', 1),
(2955, 192, 'Sanaag', 'SA', 1),
(2956, 192, 'Shabeellaha Dhexe', 'SD', 1),
(2957, 192, 'Shabeellaha Hoose', 'SH', 1),
(2958, 192, 'Sool', 'SL', 1),
(2959, 192, 'Togdheer', 'TO', 1),
(2960, 192, 'Woqooyi Galbeed', 'WG', 1),
(2961, 193, 'Eastern Cape', 'EC', 1),
(2962, 193, 'Free State', 'FS', 1),
(2963, 193, 'Gauteng', 'GT', 1),
(2964, 193, 'KwaZulu-Natal', 'KN', 1),
(2965, 193, 'Limpopo', 'LP', 1),
(2966, 193, 'Mpumalanga', 'MP', 1),
(2967, 193, 'North West', 'NW', 1),
(2968, 193, 'Northern Cape', 'NC', 1),
(2969, 193, 'Western Cape', 'WC', 1),
(2970, 195, 'La Coru&ntilde;a', 'CA', 1),
(2971, 195, '&Aacute;lava', 'AL', 1),
(2972, 195, 'Albacete', 'AB', 1),
(2973, 195, 'Alicante', 'AC', 1),
(2974, 195, 'Almeria', 'AM', 1),
(2975, 195, 'Asturias', 'AS', 1),
(2976, 195, '&Aacute;vila', 'AV', 1),
(2977, 195, 'Badajoz', 'BJ', 1),
(2978, 195, 'Baleares', 'IB', 1),
(2979, 195, 'Barcelona', 'BA', 1),
(2980, 195, 'Burgos', 'BU', 1),
(2981, 195, 'C&aacute;ceres', 'CC', 1),
(2982, 195, 'C&aacute;diz', 'CZ', 1),
(2983, 195, 'Cantabria', 'CT', 1),
(2984, 195, 'Castell&oacute;n', 'CL', 1),
(2985, 195, 'Ceuta', 'CE', 1),
(2986, 195, 'Ciudad Real', 'CR', 1),
(2987, 195, 'C&oacute;rdoba', 'CD', 1),
(2988, 195, 'Cuenca', 'CU', 1),
(2989, 195, 'Girona', 'GI', 1),
(2990, 195, 'Granada', 'GD', 1),
(2991, 195, 'Guadalajara', 'GJ', 1),
(2992, 195, 'Guip&uacute;zcoa', 'GP', 1),
(2993, 195, 'Huelva', 'HL', 1),
(2994, 195, 'Huesca', 'HS', 1),
(2995, 195, 'Ja&eacute;n', 'JN', 1),
(2996, 195, 'La Rioja', 'RJ', 1),
(2997, 195, 'Las Palmas', 'PM', 1),
(2998, 195, 'Leon', 'LE', 1),
(2999, 195, 'Lleida', 'LL', 1),
(3000, 195, 'Lugo', 'LG', 1),
(3001, 195, 'Madrid', 'MD', 1),
(3002, 195, 'Malaga', 'MA', 1),
(3003, 195, 'Melilla', 'ML', 1),
(3004, 195, 'Murcia', 'MU', 1),
(3005, 195, 'Navarra', 'NV', 1),
(3006, 195, 'Ourense', 'OU', 1),
(3007, 195, 'Palencia', 'PL', 1),
(3008, 195, 'Pontevedra', 'PO', 1),
(3009, 195, 'Salamanca', 'SL', 1),
(3010, 195, 'Santa Cruz de Tenerife', 'SC', 1),
(3011, 195, 'Segovia', 'SG', 1),
(3012, 195, 'Sevilla', 'SV', 1),
(3013, 195, 'Soria', 'SO', 1),
(3014, 195, 'Tarragona', 'TA', 1),
(3015, 195, 'Teruel', 'TE', 1),
(3016, 195, 'Toledo', 'TO', 1),
(3017, 195, 'Valencia', 'VC', 1),
(3018, 195, 'Valladolid', 'VD', 1),
(3019, 195, 'Vizcaya', 'VZ', 1),
(3020, 195, 'Zamora', 'ZM', 1),
(3021, 195, 'Zaragoza', 'ZR', 1),
(3022, 196, 'Central', 'CE', 1),
(3023, 196, 'Eastern', 'EA', 1),
(3024, 196, 'North Central', 'NC', 1),
(3025, 196, 'Northern', 'NO', 1),
(3026, 196, 'North Western', 'NW', 1),
(3027, 196, 'Sabaragamuwa', 'SA', 1),
(3028, 196, 'Southern', 'SO', 1),
(3029, 196, 'Uva', 'UV', 1),
(3030, 196, 'Western', 'WE', 1),
(3032, 197, 'Saint Helena', 'S', 1),
(3034, 199, 'A''ali an Nil', 'ANL', 1),
(3035, 199, 'Al Bahr al Ahmar', 'BAM', 1),
(3036, 199, 'Al Buhayrat', 'BRT', 1),
(3037, 199, 'Al Jazirah', 'JZR', 1),
(3038, 199, 'Al Khartum', 'KRT', 1),
(3039, 199, 'Al Qadarif', 'QDR', 1),
(3040, 199, 'Al Wahdah', 'WDH', 1),
(3041, 199, 'An Nil al Abyad', 'ANB', 1),
(3042, 199, 'An Nil al Azraq', 'ANZ', 1),
(3043, 199, 'Ash Shamaliyah', 'ASH', 1),
(3044, 199, 'Bahr al Jabal', 'BJA', 1),
(3045, 199, 'Gharb al Istiwa''iyah', 'GIS', 1),
(3046, 199, 'Gharb Bahr al Ghazal', 'GBG', 1),
(3047, 199, 'Gharb Darfur', 'GDA', 1),
(3048, 199, 'Gharb Kurdufan', 'GKU', 1),
(3049, 199, 'Janub Darfur', 'JDA', 1),
(3050, 199, 'Janub Kurdufan', 'JKU', 1),
(3051, 199, 'Junqali', 'JQL', 1),
(3052, 199, 'Kassala', 'KSL', 1),
(3053, 199, 'Nahr an Nil', 'NNL', 1),
(3054, 199, 'Shamal Bahr al Ghazal', 'SBG', 1),
(3055, 199, 'Shamal Darfur', 'SDA', 1),
(3056, 199, 'Shamal Kurdufan', 'SKU', 1),
(3057, 199, 'Sharq al Istiwa''iyah', 'SIS', 1),
(3058, 199, 'Sinnar', 'SNR', 1),
(3059, 199, 'Warab', 'WRB', 1),
(3060, 200, 'Brokopondo', 'BR', 1),
(3061, 200, 'Commewijne', 'CM', 1),
(3062, 200, 'Coronie', 'CR', 1),
(3063, 200, 'Marowijne', 'MA', 1),
(3064, 200, 'Nickerie', 'NI', 1),
(3065, 200, 'Para', 'PA', 1),
(3066, 200, 'Paramaribo', 'PM', 1),
(3067, 200, 'Saramacca', 'SA', 1),
(3068, 200, 'Sipaliwini', 'SI', 1),
(3069, 200, 'Wanica', 'WA', 1),
(3070, 202, 'Hhohho', 'H', 1),
(3071, 202, 'Lubombo', 'L', 1),
(3072, 202, 'Manzini', 'M', 1),
(3073, 202, 'Shishelweni', 'S', 1),
(3074, 203, 'Blekinge', 'K', 1),
(3075, 203, 'Dalarna', 'W', 1),
(3076, 203, 'G&auml;vleborg', 'X', 1),
(3077, 203, 'Gotland', 'I', 1),
(3078, 203, 'Halland', 'N', 1),
(3079, 203, 'J&auml;mtland', 'Z', 1),
(3080, 203, 'J&ouml;nk&ouml;ping', 'F', 1),
(3081, 203, 'Kalmar', 'H', 1),
(3082, 203, 'Kronoberg', 'G', 1),
(3083, 203, 'Norrbotten', 'BD', 1),
(3084, 203, '&Ouml;rebro', 'T', 1),
(3085, 203, '&Ouml;sterg&ouml;tland', 'E', 1),
(3086, 203, 'Sk&aring;ne', 'M', 1),
(3087, 203, 'S&ouml;dermanland', 'D', 1),
(3088, 203, 'Stockholm', 'AB', 1),
(3089, 203, 'Uppsala', 'C', 1),
(3090, 203, 'V&auml;rmland', 'S', 1),
(3091, 203, 'V&auml;sterbotten', 'AC', 1),
(3092, 203, 'V&auml;sternorrland', 'Y', 1),
(3093, 203, 'V&auml;stmanland', 'U', 1),
(3094, 203, 'V&auml;stra G&ouml;taland', 'O', 1),
(3095, 204, 'Aargau', 'AG', 1),
(3096, 204, 'Appenzell Ausserrhoden', 'AR', 1),
(3097, 204, 'Appenzell Innerrhoden', 'AI', 1),
(3098, 204, 'Basel-Stadt', 'BS', 1),
(3099, 204, 'Basel-Landschaft', 'BL', 1),
(3100, 204, 'Bern', 'BE', 1),
(3101, 204, 'Fribourg', 'FR', 1),
(3102, 204, 'Gen&egrave;ve', 'GE', 1),
(3103, 204, 'Glarus', 'GL', 1),
(3104, 204, 'Graub&uuml;nden', 'GR', 1),
(3105, 204, 'Jura', 'JU', 1),
(3106, 204, 'Luzern', 'LU', 1),
(3107, 204, 'Neuch&acirc;tel', 'NE', 1),
(3108, 204, 'Nidwald', 'NW', 1),
(3109, 204, 'Obwald', 'OW', 1),
(3110, 204, 'St. Gallen', 'SG', 1),
(3111, 204, 'Schaffhausen', 'SH', 1),
(3112, 204, 'Schwyz', 'SZ', 1),
(3113, 204, 'Solothurn', 'SO', 1),
(3114, 204, 'Thurgau', 'TG', 1),
(3115, 204, 'Ticino', 'TI', 1),
(3116, 204, 'Uri', 'UR', 1),
(3117, 204, 'Valais', 'VS', 1),
(3118, 204, 'Vaud', 'VD', 1),
(3119, 204, 'Zug', 'ZG', 1),
(3120, 204, 'Z&uuml;rich', 'ZH', 1),
(3121, 205, 'Al Hasakah', 'HA', 1),
(3122, 205, 'Al Ladhiqiyah', 'LA', 1),
(3123, 205, 'Al Qunaytirah', 'QU', 1),
(3124, 205, 'Ar Raqqah', 'RQ', 1),
(3125, 205, 'As Suwayda', 'SU', 1),
(3126, 205, 'Dara', 'DA', 1),
(3127, 205, 'Dayr az Zawr', 'DZ', 1),
(3128, 205, 'Dimashq', 'DI', 1),
(3129, 205, 'Halab', 'HL', 1),
(3130, 205, 'Hamah', 'HM', 1),
(3131, 205, 'Hims', 'HI', 1),
(3132, 205, 'Idlib', 'ID', 1);
INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(3133, 205, 'Rif Dimashq', 'RD', 1),
(3134, 205, 'Tartus', 'TA', 1),
(3135, 206, 'Chang-hua', 'CH', 1),
(3136, 206, 'Chia-i', 'CI', 1),
(3137, 206, 'Hsin-chu', 'HS', 1),
(3138, 206, 'Hua-lien', 'HL', 1),
(3139, 206, 'I-lan', 'IL', 1),
(3140, 206, 'Kao-hsiung county', 'KH', 1),
(3141, 206, 'Kin-men', 'KM', 1),
(3142, 206, 'Lien-chiang', 'LC', 1),
(3143, 206, 'Miao-li', 'ML', 1),
(3144, 206, 'Nan-t''ou', 'NT', 1),
(3145, 206, 'P''eng-hu', 'PH', 1),
(3146, 206, 'P''ing-tung', 'PT', 1),
(3147, 206, 'T''ai-chung', 'TG', 1),
(3148, 206, 'T''ai-nan', 'TA', 1),
(3149, 206, 'T''ai-pei county', 'TP', 1),
(3150, 206, 'T''ai-tung', 'TT', 1),
(3151, 206, 'T''ao-yuan', 'TY', 1),
(3152, 206, 'Yun-lin', 'YL', 1),
(3153, 206, 'Chia-i city', 'CC', 1),
(3154, 206, 'Chi-lung', 'CL', 1),
(3155, 206, 'Hsin-chu', 'HC', 1),
(3156, 206, 'T''ai-chung', 'TH', 1),
(3157, 206, 'T''ai-nan', 'TN', 1),
(3158, 206, 'Kao-hsiung city', 'KC', 1),
(3159, 206, 'T''ai-pei city', 'TC', 1),
(3160, 207, 'Gorno-Badakhstan', 'GB', 1),
(3161, 207, 'Khatlon', 'KT', 1),
(3162, 207, 'Sughd', 'SU', 1),
(3163, 208, 'Arusha', 'AR', 1),
(3164, 208, 'Dar es Salaam', 'DS', 1),
(3165, 208, 'Dodoma', 'DO', 1),
(3166, 208, 'Iringa', 'IR', 1),
(3167, 208, 'Kagera', 'KA', 1),
(3168, 208, 'Kigoma', 'KI', 1),
(3169, 208, 'Kilimanjaro', 'KJ', 1),
(3170, 208, 'Lindi', 'LN', 1),
(3171, 208, 'Manyara', 'MY', 1),
(3172, 208, 'Mara', 'MR', 1),
(3173, 208, 'Mbeya', 'MB', 1),
(3174, 208, 'Morogoro', 'MO', 1),
(3175, 208, 'Mtwara', 'MT', 1),
(3176, 208, 'Mwanza', 'MW', 1),
(3177, 208, 'Pemba North', 'PN', 1),
(3178, 208, 'Pemba South', 'PS', 1),
(3179, 208, 'Pwani', 'PW', 1),
(3180, 208, 'Rukwa', 'RK', 1),
(3181, 208, 'Ruvuma', 'RV', 1),
(3182, 208, 'Shinyanga', 'SH', 1),
(3183, 208, 'Singida', 'SI', 1),
(3184, 208, 'Tabora', 'TB', 1),
(3185, 208, 'Tanga', 'TN', 1),
(3186, 208, 'Zanzibar Central/South', 'ZC', 1),
(3187, 208, 'Zanzibar North', 'ZN', 1),
(3188, 208, 'Zanzibar Urban/West', 'ZU', 1),
(3189, 209, 'Amnat Charoen', 'Amnat Charoen', 1),
(3190, 209, 'Ang Thong', 'Ang Thong', 1),
(3191, 209, 'Ayutthaya', 'Ayutthaya', 1),
(3192, 209, 'Bangkok', 'Bangkok', 1),
(3193, 209, 'Buriram', 'Buriram', 1),
(3194, 209, 'Chachoengsao', 'Chachoengsao', 1),
(3195, 209, 'Chai Nat', 'Chai Nat', 1),
(3196, 209, 'Chaiyaphum', 'Chaiyaphum', 1),
(3197, 209, 'Chanthaburi', 'Chanthaburi', 1),
(3198, 209, 'Chiang Mai', 'Chiang Mai', 1),
(3199, 209, 'Chiang Rai', 'Chiang Rai', 1),
(3200, 209, 'Chon Buri', 'Chon Buri', 1),
(3201, 209, 'Chumphon', 'Chumphon', 1),
(3202, 209, 'Kalasin', 'Kalasin', 1),
(3203, 209, 'Kamphaeng Phet', 'Kamphaeng Phet', 1),
(3204, 209, 'Kanchanaburi', 'Kanchanaburi', 1),
(3205, 209, 'Khon Kaen', 'Khon Kaen', 1),
(3206, 209, 'Krabi', 'Krabi', 1),
(3207, 209, 'Lampang', 'Lampang', 1),
(3208, 209, 'Lamphun', 'Lamphun', 1),
(3209, 209, 'Loei', 'Loei', 1),
(3210, 209, 'Lop Buri', 'Lop Buri', 1),
(3211, 209, 'Mae Hong Son', 'Mae Hong Son', 1),
(3212, 209, 'Maha Sarakham', 'Maha Sarakham', 1),
(3213, 209, 'Mukdahan', 'Mukdahan', 1),
(3214, 209, 'Nakhon Nayok', 'Nakhon Nayok', 1),
(3215, 209, 'Nakhon Pathom', 'Nakhon Pathom', 1),
(3216, 209, 'Nakhon Phanom', 'Nakhon Phanom', 1),
(3217, 209, 'Nakhon Ratchasima', 'Nakhon Ratchasima', 1),
(3218, 209, 'Nakhon Sawan', 'Nakhon Sawan', 1),
(3219, 209, 'Nakhon Si Thammarat', 'Nakhon Si Thammarat', 1),
(3220, 209, 'Nan', 'Nan', 1),
(3221, 209, 'Narathiwat', 'Narathiwat', 1),
(3222, 209, 'Nong Bua Lamphu', 'Nong Bua Lamphu', 1),
(3223, 209, 'Nong Khai', 'Nong Khai', 1),
(3224, 209, 'Nonthaburi', 'Nonthaburi', 1),
(3225, 209, 'Pathum Thani', 'Pathum Thani', 1),
(3226, 209, 'Pattani', 'Pattani', 1),
(3227, 209, 'Phangnga', 'Phangnga', 1),
(3228, 209, 'Phatthalung', 'Phatthalung', 1),
(3229, 209, 'Phayao', 'Phayao', 1),
(3230, 209, 'Phetchabun', 'Phetchabun', 1),
(3231, 209, 'Phetchaburi', 'Phetchaburi', 1),
(3232, 209, 'Phichit', 'Phichit', 1),
(3233, 209, 'Phitsanulok', 'Phitsanulok', 1),
(3234, 209, 'Phrae', 'Phrae', 1),
(3235, 209, 'Phuket', 'Phuket', 1),
(3236, 209, 'Prachin Buri', 'Prachin Buri', 1),
(3237, 209, 'Prachuap Khiri Khan', 'Prachuap Khiri Khan', 1),
(3238, 209, 'Ranong', 'Ranong', 1),
(3239, 209, 'Ratchaburi', 'Ratchaburi', 1),
(3240, 209, 'Rayong', 'Rayong', 1),
(3241, 209, 'Roi Et', 'Roi Et', 1),
(3242, 209, 'Sa Kaeo', 'Sa Kaeo', 1),
(3243, 209, 'Sakon Nakhon', 'Sakon Nakhon', 1),
(3244, 209, 'Samut Prakan', 'Samut Prakan', 1),
(3245, 209, 'Samut Sakhon', 'Samut Sakhon', 1),
(3246, 209, 'Samut Songkhram', 'Samut Songkhram', 1),
(3247, 209, 'Sara Buri', 'Sara Buri', 1),
(3248, 209, 'Satun', 'Satun', 1),
(3249, 209, 'Sing Buri', 'Sing Buri', 1),
(3250, 209, 'Sisaket', 'Sisaket', 1),
(3251, 209, 'Songkhla', 'Songkhla', 1),
(3252, 209, 'Sukhothai', 'Sukhothai', 1),
(3253, 209, 'Suphan Buri', 'Suphan Buri', 1),
(3254, 209, 'Surat Thani', 'Surat Thani', 1),
(3255, 209, 'Surin', 'Surin', 1),
(3256, 209, 'Tak', 'Tak', 1),
(3257, 209, 'Trang', 'Trang', 1),
(3258, 209, 'Trat', 'Trat', 1),
(3259, 209, 'Ubon Ratchathani', 'Ubon Ratchathani', 1),
(3260, 209, 'Udon Thani', 'Udon Thani', 1),
(3261, 209, 'Uthai Thani', 'Uthai Thani', 1),
(3262, 209, 'Uttaradit', 'Uttaradit', 1),
(3263, 209, 'Yala', 'Yala', 1),
(3264, 209, 'Yasothon', 'Yasothon', 1),
(3265, 210, 'Kara', 'K', 1),
(3266, 210, 'Plateaux', 'P', 1),
(3267, 210, 'Savanes', 'S', 1),
(3268, 210, 'Centrale', 'C', 1),
(3269, 210, 'Maritime', 'M', 1),
(3270, 211, 'Atafu', 'A', 1),
(3271, 211, 'Fakaofo', 'F', 1),
(3272, 211, 'Nukunonu', 'N', 1),
(3273, 212, 'Ha''apai', 'H', 1),
(3274, 212, 'Tongatapu', 'T', 1),
(3275, 212, 'Vava''u', 'V', 1),
(3276, 213, 'Couva/Tabaquite/Talparo', 'CT', 1),
(3277, 213, 'Diego Martin', 'DM', 1),
(3278, 213, 'Mayaro/Rio Claro', 'MR', 1),
(3279, 213, 'Penal/Debe', 'PD', 1),
(3280, 213, 'Princes Town', 'PT', 1),
(3281, 213, 'Sangre Grande', 'SG', 1),
(3282, 213, 'San Juan/Laventille', 'SL', 1),
(3283, 213, 'Siparia', 'SI', 1),
(3284, 213, 'Tunapuna/Piarco', 'TP', 1),
(3285, 213, 'Port of Spain', 'PS', 1),
(3286, 213, 'San Fernando', 'SF', 1),
(3287, 213, 'Arima', 'AR', 1),
(3288, 213, 'Point Fortin', 'PF', 1),
(3289, 213, 'Chaguanas', 'CH', 1),
(3290, 213, 'Tobago', 'TO', 1),
(3291, 214, 'Ariana', 'AR', 1),
(3292, 214, 'Beja', 'BJ', 1),
(3293, 214, 'Ben Arous', 'BA', 1),
(3294, 214, 'Bizerte', 'BI', 1),
(3295, 214, 'Gabes', 'GB', 1),
(3296, 214, 'Gafsa', 'GF', 1),
(3297, 214, 'Jendouba', 'JE', 1),
(3298, 214, 'Kairouan', 'KR', 1),
(3299, 214, 'Kasserine', 'KS', 1),
(3300, 214, 'Kebili', 'KB', 1),
(3301, 214, 'Kef', 'KF', 1),
(3302, 214, 'Mahdia', 'MH', 1),
(3303, 214, 'Manouba', 'MN', 1),
(3304, 214, 'Medenine', 'ME', 1),
(3305, 214, 'Monastir', 'MO', 1),
(3306, 214, 'Nabeul', 'NA', 1),
(3307, 214, 'Sfax', 'SF', 1),
(3308, 214, 'Sidi', 'SD', 1),
(3309, 214, 'Siliana', 'SL', 1),
(3310, 214, 'Sousse', 'SO', 1),
(3311, 214, 'Tataouine', 'TA', 1),
(3312, 214, 'Tozeur', 'TO', 1),
(3313, 214, 'Tunis', 'TU', 1),
(3314, 214, 'Zaghouan', 'ZA', 1),
(3315, 215, 'Adana', 'ADA', 1),
(3316, 215, 'Adıyaman', 'ADI', 1),
(3317, 215, 'Afyonkarahisar', 'AFY', 1),
(3318, 215, 'Ağrı', 'AGR', 1),
(3319, 215, 'Aksaray', 'AKS', 1),
(3320, 215, 'Amasya', 'AMA', 1),
(3321, 215, 'Ankara', 'ANK', 1),
(3322, 215, 'Antalya', 'ANT', 1),
(3323, 215, 'Ardahan', 'ARD', 1),
(3324, 215, 'Artvin', 'ART', 1),
(3325, 215, 'Aydın', 'AYI', 1),
(3326, 215, 'Balıkesir', 'BAL', 1),
(3327, 215, 'Bartın', 'BAR', 1),
(3328, 215, 'Batman', 'BAT', 1),
(3329, 215, 'Bayburt', 'BAY', 1),
(3330, 215, 'Bilecik', 'BIL', 1),
(3331, 215, 'Bingöl', 'BIN', 1),
(3332, 215, 'Bitlis', 'BIT', 1),
(3333, 215, 'Bolu', 'BOL', 1),
(3334, 215, 'Burdur', 'BRD', 1),
(3335, 215, 'Bursa', 'BRS', 1),
(3336, 215, 'Çanakkale', 'CKL', 1),
(3337, 215, 'Çankırı', 'CKR', 1),
(3338, 215, 'Çorum', 'COR', 1),
(3339, 215, 'Denizli', 'DEN', 1),
(3340, 215, 'Diyarbakır', 'DIY', 1),
(3341, 215, 'Düzce', 'DUZ', 1),
(3342, 215, 'Edirne', 'EDI', 1),
(3343, 215, 'Elazığ', 'ELA', 1),
(3344, 215, 'Erzincan', 'EZC', 1),
(3345, 215, 'Erzurum', 'EZR', 1),
(3346, 215, 'Eskişehir', 'ESK', 1),
(3347, 215, 'Gaziantep', 'GAZ', 1),
(3348, 215, 'Giresun', 'GIR', 1),
(3349, 215, 'Gümüşhane', 'GMS', 1),
(3350, 215, 'Hakkari', 'HKR', 1),
(3351, 215, 'Hatay', 'HTY', 1),
(3352, 215, 'Iğdır', 'IGD', 1),
(3353, 215, 'Isparta', 'ISP', 1),
(3354, 215, 'İstanbul', 'IST', 1),
(3355, 215, 'İzmir', 'IZM', 1),
(3356, 215, 'Kahramanmaraş', 'KAH', 1),
(3357, 215, 'Karabük', 'KRB', 1),
(3358, 215, 'Karaman', 'KRM', 1),
(3359, 215, 'Kars', 'KRS', 1),
(3360, 215, 'Kastamonu', 'KAS', 1),
(3361, 215, 'Kayseri', 'KAY', 1),
(3362, 215, 'Kilis', 'KLS', 1),
(3363, 215, 'Kırıkkale', 'KRK', 1),
(3364, 215, 'Kırklareli', 'KLR', 1),
(3365, 215, 'Kırşehir', 'KRH', 1),
(3366, 215, 'Kocaeli', 'KOC', 1),
(3367, 215, 'Konya', 'KON', 1),
(3368, 215, 'Kütahya', 'KUT', 1),
(3369, 215, 'Malatya', 'MAL', 1),
(3370, 215, 'Manisa', 'MAN', 1),
(3371, 215, 'Mardin', 'MAR', 1),
(3372, 215, 'Mersin', 'MER', 1),
(3373, 215, 'Muğla', 'MUG', 1),
(3374, 215, 'Muş', 'MUS', 1),
(3375, 215, 'Nevşehir', 'NEV', 1),
(3376, 215, 'Niğde', 'NIG', 1),
(3377, 215, 'Ordu', 'ORD', 1),
(3378, 215, 'Osmaniye', 'OSM', 1),
(3379, 215, 'Rize', 'RIZ', 1),
(3380, 215, 'Sakarya', 'SAK', 1),
(3381, 215, 'Samsun', 'SAM', 1),
(3382, 215, 'Şanlıurfa', 'SAN', 1),
(3383, 215, 'Siirt', 'SII', 1),
(3384, 215, 'Sinop', 'SIN', 1),
(3385, 215, 'Şırnak', 'SIR', 1),
(3386, 215, 'Sivas', 'SIV', 1),
(3387, 215, 'Tekirdağ', 'TEL', 1),
(3388, 215, 'Tokat', 'TOK', 1),
(3389, 215, 'Trabzon', 'TRA', 1),
(3390, 215, 'Tunceli', 'TUN', 1),
(3391, 215, 'Uşak', 'USK', 1),
(3392, 215, 'Van', 'VAN', 1),
(3393, 215, 'Yalova', 'YAL', 1),
(3394, 215, 'Yozgat', 'YOZ', 1),
(3395, 215, 'Zonguldak', 'ZON', 1),
(3396, 216, 'Ahal Welayaty', 'A', 1),
(3397, 216, 'Balkan Welayaty', 'B', 1),
(3398, 216, 'Dashhowuz Welayaty', 'D', 1),
(3399, 216, 'Lebap Welayaty', 'L', 1),
(3400, 216, 'Mary Welayaty', 'M', 1),
(3401, 217, 'Ambergris Cays', 'AC', 1),
(3402, 217, 'Dellis Cay', 'DC', 1),
(3403, 217, 'French Cay', 'FC', 1),
(3404, 217, 'Little Water Cay', 'LW', 1),
(3405, 217, 'Parrot Cay', 'RC', 1),
(3406, 217, 'Pine Cay', 'PN', 1),
(3407, 217, 'Salt Cay', 'SL', 1),
(3408, 217, 'Grand Turk', 'GT', 1),
(3409, 217, 'South Caicos', 'SC', 1),
(3410, 217, 'East Caicos', 'EC', 1),
(3411, 217, 'Middle Caicos', 'MC', 1),
(3412, 217, 'North Caicos', 'NC', 1),
(3413, 217, 'Providenciales', 'PR', 1),
(3414, 217, 'West Caicos', 'WC', 1),
(3415, 218, 'Nanumanga', 'NMG', 1),
(3416, 218, 'Niulakita', 'NLK', 1),
(3417, 218, 'Niutao', 'NTO', 1),
(3418, 218, 'Funafuti', 'FUN', 1),
(3419, 218, 'Nanumea', 'NME', 1),
(3420, 218, 'Nui', 'NUI', 1),
(3421, 218, 'Nukufetau', 'NFT', 1),
(3422, 218, 'Nukulaelae', 'NLL', 1),
(3423, 218, 'Vaitupu', 'VAI', 1),
(3424, 219, 'Kalangala', 'KAL', 1),
(3425, 219, 'Kampala', 'KMP', 1),
(3426, 219, 'Kayunga', 'KAY', 1),
(3427, 219, 'Kiboga', 'KIB', 1),
(3428, 219, 'Luwero', 'LUW', 1),
(3429, 219, 'Masaka', 'MAS', 1),
(3430, 219, 'Mpigi', 'MPI', 1),
(3431, 219, 'Mubende', 'MUB', 1),
(3432, 219, 'Mukono', 'MUK', 1),
(3433, 219, 'Nakasongola', 'NKS', 1),
(3434, 219, 'Rakai', 'RAK', 1),
(3435, 219, 'Sembabule', 'SEM', 1),
(3436, 219, 'Wakiso', 'WAK', 1),
(3437, 219, 'Bugiri', 'BUG', 1),
(3438, 219, 'Busia', 'BUS', 1),
(3439, 219, 'Iganga', 'IGA', 1),
(3440, 219, 'Jinja', 'JIN', 1),
(3441, 219, 'Kaberamaido', 'KAB', 1),
(3442, 219, 'Kamuli', 'KML', 1),
(3443, 219, 'Kapchorwa', 'KPC', 1),
(3444, 219, 'Katakwi', 'KTK', 1),
(3445, 219, 'Kumi', 'KUM', 1),
(3446, 219, 'Mayuge', 'MAY', 1),
(3447, 219, 'Mbale', 'MBA', 1),
(3448, 219, 'Pallisa', 'PAL', 1),
(3449, 219, 'Sironko', 'SIR', 1),
(3450, 219, 'Soroti', 'SOR', 1),
(3451, 219, 'Tororo', 'TOR', 1),
(3452, 219, 'Adjumani', 'ADJ', 1),
(3453, 219, 'Apac', 'APC', 1),
(3454, 219, 'Arua', 'ARU', 1),
(3455, 219, 'Gulu', 'GUL', 1),
(3456, 219, 'Kitgum', 'KIT', 1),
(3457, 219, 'Kotido', 'KOT', 1),
(3458, 219, 'Lira', 'LIR', 1),
(3459, 219, 'Moroto', 'MRT', 1),
(3460, 219, 'Moyo', 'MOY', 1),
(3461, 219, 'Nakapiripirit', 'NAK', 1),
(3462, 219, 'Nebbi', 'NEB', 1),
(3463, 219, 'Pader', 'PAD', 1),
(3464, 219, 'Yumbe', 'YUM', 1),
(3465, 219, 'Bundibugyo', 'BUN', 1),
(3466, 219, 'Bushenyi', 'BSH', 1),
(3467, 219, 'Hoima', 'HOI', 1),
(3468, 219, 'Kabale', 'KBL', 1),
(3469, 219, 'Kabarole', 'KAR', 1),
(3470, 219, 'Kamwenge', 'KAM', 1),
(3471, 219, 'Kanungu', 'KAN', 1),
(3472, 219, 'Kasese', 'KAS', 1),
(3473, 219, 'Kibaale', 'KBA', 1),
(3474, 219, 'Kisoro', 'KIS', 1),
(3475, 219, 'Kyenjojo', 'KYE', 1),
(3476, 219, 'Masindi', 'MSN', 1),
(3477, 219, 'Mbarara', 'MBR', 1),
(3478, 219, 'Ntungamo', 'NTU', 1),
(3479, 219, 'Rukungiri', 'RUK', 1),
(3480, 220, 'Cherkas''ka Oblast''', '71', 1),
(3481, 220, 'Chernihivs''ka Oblast''', '74', 1),
(3482, 220, 'Chernivets''ka Oblast''', '77', 1),
(3483, 220, 'Crimea', '43', 1),
(3484, 220, 'Dnipropetrovs''ka Oblast''', '12', 1),
(3485, 220, 'Donets''ka Oblast''', '14', 1),
(3486, 220, 'Ivano-Frankivs''ka Oblast''', '26', 1),
(3487, 220, 'Khersons''ka Oblast''', '65', 1),
(3488, 220, 'Khmel''nyts''ka Oblast''', '68', 1),
(3489, 220, 'Kirovohrads''ka Oblast''', '35', 1),
(3490, 220, 'Kyiv', '30', 1),
(3491, 220, 'Kyivs''ka Oblast''', '32', 1),
(3492, 220, 'Luhans''ka Oblast''', '09', 1),
(3493, 220, 'L''vivs''ka Oblast''', '46', 1),
(3494, 220, 'Mykolayivs''ka Oblast''', '48', 1),
(3495, 220, 'Odes''ka Oblast''', '51', 1),
(3496, 220, 'Poltavs''ka Oblast''', '53', 1),
(3497, 220, 'Rivnens''ka Oblast''', '56', 1),
(3498, 220, 'Sevastopol''', '40', 1),
(3499, 220, 'Sums''ka Oblast''', '59', 1),
(3500, 220, 'Ternopil''s''ka Oblast''', '61', 1),
(3501, 220, 'Vinnyts''ka Oblast''', '05', 1),
(3502, 220, 'Volyns''ka Oblast''', '07', 1),
(3503, 220, 'Zakarpats''ka Oblast''', '21', 1),
(3504, 220, 'Zaporiz''ka Oblast''', '23', 1),
(3505, 220, 'Zhytomyrs''ka oblast''', '18', 1),
(3506, 221, 'Abu Dhabi', 'ADH', 1),
(3507, 221, '''Ajman', 'AJ', 1),
(3508, 221, 'Al Fujayrah', 'FU', 1),
(3509, 221, 'Ash Shariqah', 'SH', 1),
(3510, 221, 'Dubai', 'DU', 1),
(3511, 221, 'R''as al Khaymah', 'RK', 1),
(3512, 221, 'Umm al Qaywayn', 'UQ', 1),
(3513, 222, 'Aberdeen', 'ABN', 1),
(3514, 222, 'Aberdeenshire', 'ABNS', 1),
(3515, 222, 'Anglesey', 'ANG', 1),
(3516, 222, 'Angus', 'AGS', 1),
(3517, 222, 'Argyll and Bute', 'ARY', 1),
(3518, 222, 'Bedfordshire', 'BEDS', 1),
(3519, 222, 'Berkshire', 'BERKS', 1),
(3520, 222, 'Blaenau Gwent', 'BLA', 1),
(3521, 222, 'Bridgend', 'BRI', 1),
(3522, 222, 'Bristol', 'BSTL', 1),
(3523, 222, 'Buckinghamshire', 'BUCKS', 1),
(3524, 222, 'Caerphilly', 'CAE', 1),
(3525, 222, 'Cambridgeshire', 'CAMBS', 1),
(3526, 222, 'Cardiff', 'CDF', 1),
(3527, 222, 'Carmarthenshire', 'CARM', 1),
(3528, 222, 'Ceredigion', 'CDGN', 1),
(3529, 222, 'Cheshire', 'CHES', 1),
(3530, 222, 'Clackmannanshire', 'CLACK', 1),
(3531, 222, 'Conwy', 'CON', 1),
(3532, 222, 'Cornwall', 'CORN', 1),
(3533, 222, 'Denbighshire', 'DNBG', 1),
(3534, 222, 'Derbyshire', 'DERBY', 1),
(3535, 222, 'Devon', 'DVN', 1),
(3536, 222, 'Dorset', 'DOR', 1),
(3537, 222, 'Dumfries and Galloway', 'DGL', 1),
(3538, 222, 'Dundee', 'DUND', 1),
(3539, 222, 'Durham', 'DHM', 1),
(3540, 222, 'East Ayrshire', 'ARYE', 1),
(3541, 222, 'East Dunbartonshire', 'DUNBE', 1),
(3542, 222, 'East Lothian', 'LOTE', 1),
(3543, 222, 'East Renfrewshire', 'RENE', 1),
(3544, 222, 'East Riding of Yorkshire', 'ERYS', 1),
(3545, 222, 'East Sussex', 'SXE', 1),
(3546, 222, 'Edinburgh', 'EDIN', 1),
(3547, 222, 'Essex', 'ESX', 1),
(3548, 222, 'Falkirk', 'FALK', 1),
(3549, 222, 'Fife', 'FFE', 1),
(3550, 222, 'Flintshire', 'FLINT', 1),
(3551, 222, 'Glasgow', 'GLAS', 1),
(3552, 222, 'Gloucestershire', 'GLOS', 1),
(3553, 222, 'Greater London', 'LDN', 1),
(3554, 222, 'Greater Manchester', 'MCH', 1),
(3555, 222, 'Gwynedd', 'GDD', 1),
(3556, 222, 'Hampshire', 'HANTS', 1),
(3557, 222, 'Herefordshire', 'HWR', 1),
(3558, 222, 'Hertfordshire', 'HERTS', 1),
(3559, 222, 'Highlands', 'HLD', 1),
(3560, 222, 'Inverclyde', 'IVER', 1),
(3561, 222, 'Isle of Wight', 'IOW', 1),
(3562, 222, 'Kent', 'KNT', 1),
(3563, 222, 'Lancashire', 'LANCS', 1),
(3564, 222, 'Leicestershire', 'LEICS', 1),
(3565, 222, 'Lincolnshire', 'LINCS', 1),
(3566, 222, 'Merseyside', 'MSY', 1),
(3567, 222, 'Merthyr Tydfil', 'MERT', 1),
(3568, 222, 'Midlothian', 'MLOT', 1),
(3569, 222, 'Monmouthshire', 'MMOUTH', 1),
(3570, 222, 'Moray', 'MORAY', 1),
(3571, 222, 'Neath Port Talbot', 'NPRTAL', 1),
(3572, 222, 'Newport', 'NEWPT', 1),
(3573, 222, 'Norfolk', 'NOR', 1),
(3574, 222, 'North Ayrshire', 'ARYN', 1),
(3575, 222, 'North Lanarkshire', 'LANN', 1),
(3576, 222, 'North Yorkshire', 'YSN', 1),
(3577, 222, 'Northamptonshire', 'NHM', 1),
(3578, 222, 'Northumberland', 'NLD', 1),
(3579, 222, 'Nottinghamshire', 'NOT', 1),
(3580, 222, 'Orkney Islands', 'ORK', 1),
(3581, 222, 'Oxfordshire', 'OFE', 1),
(3582, 222, 'Pembrokeshire', 'PEM', 1),
(3583, 222, 'Perth and Kinross', 'PERTH', 1),
(3584, 222, 'Powys', 'PWS', 1),
(3585, 222, 'Renfrewshire', 'REN', 1),
(3586, 222, 'Rhondda Cynon Taff', 'RHON', 1),
(3587, 222, 'Rutland', 'RUT', 1),
(3588, 222, 'Scottish Borders', 'BOR', 1),
(3589, 222, 'Shetland Islands', 'SHET', 1),
(3590, 222, 'Shropshire', 'SPE', 1),
(3591, 222, 'Somerset', 'SOM', 1),
(3592, 222, 'South Ayrshire', 'ARYS', 1),
(3593, 222, 'South Lanarkshire', 'LANS', 1),
(3594, 222, 'South Yorkshire', 'YSS', 1),
(3595, 222, 'Staffordshire', 'SFD', 1),
(3596, 222, 'Stirling', 'STIR', 1),
(3597, 222, 'Suffolk', 'SFK', 1),
(3598, 222, 'Surrey', 'SRY', 1),
(3599, 222, 'Swansea', 'SWAN', 1),
(3600, 222, 'Torfaen', 'TORF', 1),
(3601, 222, 'Tyne and Wear', 'TWR', 1),
(3602, 222, 'Vale of Glamorgan', 'VGLAM', 1),
(3603, 222, 'Warwickshire', 'WARKS', 1),
(3604, 222, 'West Dunbartonshire', 'WDUN', 1),
(3605, 222, 'West Lothian', 'WLOT', 1),
(3606, 222, 'West Midlands', 'WMD', 1),
(3607, 222, 'West Sussex', 'SXW', 1),
(3608, 222, 'West Yorkshire', 'YSW', 1),
(3609, 222, 'Western Isles', 'WIL', 1),
(3610, 222, 'Wiltshire', 'WLT', 1),
(3611, 222, 'Worcestershire', 'WORCS', 1),
(3612, 222, 'Wrexham', 'WRX', 1),
(3613, 223, 'Alabama', 'AL', 1),
(3614, 223, 'Alaska', 'AK', 1),
(3615, 223, 'American Samoa', 'AS', 1),
(3616, 223, 'Arizona', 'AZ', 1),
(3617, 223, 'Arkansas', 'AR', 1),
(3618, 223, 'Armed Forces Africa', 'AF', 1),
(3619, 223, 'Armed Forces Americas', 'AA', 1),
(3620, 223, 'Armed Forces Canada', 'AC', 1),
(3621, 223, 'Armed Forces Europe', 'AE', 1),
(3622, 223, 'Armed Forces Middle East', 'AM', 1),
(3623, 223, 'Armed Forces Pacific', 'AP', 1),
(3624, 223, 'California', 'CA', 1),
(3625, 223, 'Colorado', 'CO', 1),
(3626, 223, 'Connecticut', 'CT', 1),
(3627, 223, 'Delaware', 'DE', 1),
(3628, 223, 'District of Columbia', 'DC', 1),
(3629, 223, 'Federated States Of Micronesia', 'FM', 1),
(3630, 223, 'Florida', 'FL', 1),
(3631, 223, 'Georgia', 'GA', 1),
(3632, 223, 'Guam', 'GU', 1),
(3633, 223, 'Hawaii', 'HI', 1),
(3634, 223, 'Idaho', 'ID', 1),
(3635, 223, 'Illinois', 'IL', 1),
(3636, 223, 'Indiana', 'IN', 1),
(3637, 223, 'Iowa', 'IA', 1),
(3638, 223, 'Kansas', 'KS', 1),
(3639, 223, 'Kentucky', 'KY', 1),
(3640, 223, 'Louisiana', 'LA', 1),
(3641, 223, 'Maine', 'ME', 1),
(3642, 223, 'Marshall Islands', 'MH', 1),
(3643, 223, 'Maryland', 'MD', 1),
(3644, 223, 'Massachusetts', 'MA', 1),
(3645, 223, 'Michigan', 'MI', 1),
(3646, 223, 'Minnesota', 'MN', 1),
(3647, 223, 'Mississippi', 'MS', 1),
(3648, 223, 'Missouri', 'MO', 1),
(3649, 223, 'Montana', 'MT', 1),
(3650, 223, 'Nebraska', 'NE', 1),
(3651, 223, 'Nevada', 'NV', 1),
(3652, 223, 'New Hampshire', 'NH', 1),
(3653, 223, 'New Jersey', 'NJ', 1),
(3654, 223, 'New Mexico', 'NM', 1),
(3655, 223, 'New York', 'NY', 1),
(3656, 223, 'North Carolina', 'NC', 1),
(3657, 223, 'North Dakota', 'ND', 1),
(3658, 223, 'Northern Mariana Islands', 'MP', 1),
(3659, 223, 'Ohio', 'OH', 1),
(3660, 223, 'Oklahoma', 'OK', 1),
(3661, 223, 'Oregon', 'OR', 1),
(3662, 223, 'Palau', 'PW', 1),
(3663, 223, 'Pennsylvania', 'PA', 1),
(3664, 223, 'Puerto Rico', 'PR', 1),
(3665, 223, 'Rhode Island', 'RI', 1),
(3666, 223, 'South Carolina', 'SC', 1),
(3667, 223, 'South Dakota', 'SD', 1),
(3668, 223, 'Tennessee', 'TN', 1),
(3669, 223, 'Texas', 'TX', 1),
(3670, 223, 'Utah', 'UT', 1),
(3671, 223, 'Vermont', 'VT', 1),
(3672, 223, 'Virgin Islands', 'VI', 1),
(3673, 223, 'Virginia', 'VA', 1),
(3674, 223, 'Washington', 'WA', 1),
(3675, 223, 'West Virginia', 'WV', 1),
(3676, 223, 'Wisconsin', 'WI', 1),
(3677, 223, 'Wyoming', 'WY', 1),
(3678, 224, 'Baker Island', 'BI', 1),
(3679, 224, 'Howland Island', 'HI', 1),
(3680, 224, 'Jarvis Island', 'JI', 1),
(3681, 224, 'Johnston Atoll', 'JA', 1),
(3682, 224, 'Kingman Reef', 'KR', 1),
(3683, 224, 'Midway Atoll', 'MA', 1),
(3684, 224, 'Navassa Island', 'NI', 1),
(3685, 224, 'Palmyra Atoll', 'PA', 1),
(3686, 224, 'Wake Island', 'WI', 1),
(3687, 225, 'Artigas', 'AR', 1),
(3688, 225, 'Canelones', 'CA', 1),
(3689, 225, 'Cerro Largo', 'CL', 1),
(3690, 225, 'Colonia', 'CO', 1),
(3691, 225, 'Durazno', 'DU', 1),
(3692, 225, 'Flores', 'FS', 1),
(3693, 225, 'Florida', 'FA', 1),
(3694, 225, 'Lavalleja', 'LA', 1),
(3695, 225, 'Maldonado', 'MA', 1),
(3696, 225, 'Montevideo', 'MO', 1),
(3697, 225, 'Paysandu', 'PA', 1),
(3698, 225, 'Rio Negro', 'RN', 1),
(3699, 225, 'Rivera', 'RV', 1),
(3700, 225, 'Rocha', 'RO', 1),
(3701, 225, 'Salto', 'SL', 1),
(3702, 225, 'San Jose', 'SJ', 1),
(3703, 225, 'Soriano', 'SO', 1),
(3704, 225, 'Tacuarembo', 'TA', 1),
(3705, 225, 'Treinta y Tres', 'TT', 1),
(3706, 226, 'Andijon', 'AN', 1),
(3707, 226, 'Buxoro', 'BU', 1),
(3708, 226, 'Farg''ona', 'FA', 1),
(3709, 226, 'Jizzax', 'JI', 1),
(3710, 226, 'Namangan', 'NG', 1),
(3711, 226, 'Navoiy', 'NW', 1),
(3712, 226, 'Qashqadaryo', 'QA', 1),
(3713, 226, 'Qoraqalpog''iston Republikasi', 'QR', 1),
(3714, 226, 'Samarqand', 'SA', 1),
(3715, 226, 'Sirdaryo', 'SI', 1),
(3716, 226, 'Surxondaryo', 'SU', 1),
(3717, 226, 'Toshkent City', 'TK', 1),
(3718, 226, 'Toshkent Region', 'TO', 1),
(3719, 226, 'Xorazm', 'XO', 1),
(3720, 227, 'Malampa', 'MA', 1),
(3721, 227, 'Penama', 'PE', 1),
(3722, 227, 'Sanma', 'SA', 1),
(3723, 227, 'Shefa', 'SH', 1),
(3724, 227, 'Tafea', 'TA', 1),
(3725, 227, 'Torba', 'TO', 1),
(3726, 229, 'Amazonas', 'AM', 1),
(3727, 229, 'Anzoategui', 'AN', 1),
(3728, 229, 'Apure', 'AP', 1),
(3729, 229, 'Aragua', 'AR', 1),
(3730, 229, 'Barinas', 'BA', 1),
(3731, 229, 'Bolivar', 'BO', 1),
(3732, 229, 'Carabobo', 'CA', 1),
(3733, 229, 'Cojedes', 'CO', 1),
(3734, 229, 'Delta Amacuro', 'DA', 1),
(3735, 229, 'Dependencias Federales', 'DF', 1),
(3736, 229, 'Distrito Federal', 'DI', 1),
(3737, 229, 'Falcon', 'FA', 1),
(3738, 229, 'Guarico', 'GU', 1),
(3739, 229, 'Lara', 'LA', 1),
(3740, 229, 'Merida', 'ME', 1),
(3741, 229, 'Miranda', 'MI', 1),
(3742, 229, 'Monagas', 'MO', 1),
(3743, 229, 'Nueva Esparta', 'NE', 1),
(3744, 229, 'Portuguesa', 'PO', 1),
(3745, 229, 'Sucre', 'SU', 1),
(3746, 229, 'Tachira', 'TA', 1),
(3747, 229, 'Trujillo', 'TR', 1),
(3748, 229, 'Vargas', 'VA', 1),
(3749, 229, 'Yaracuy', 'YA', 1),
(3750, 229, 'Zulia', 'ZU', 1),
(3751, 230, 'An Giang', 'AG', 1),
(3752, 230, 'Bac Giang', 'BG', 1),
(3753, 230, 'Bac Kan', 'BK', 1),
(3754, 230, 'Bac Lieu', 'BL', 1),
(3755, 230, 'Bac Ninh', 'BC', 1),
(3756, 230, 'Ba Ria-Vung Tau', 'BR', 1),
(3757, 230, 'Ben Tre', 'BN', 1),
(3758, 230, 'Binh Dinh', 'BH', 1),
(3759, 230, 'Binh Duong', 'BU', 1),
(3760, 230, 'Binh Phuoc', 'BP', 1),
(3761, 230, 'Binh Thuan', 'BT', 1),
(3762, 230, 'Ca Mau', 'CM', 1),
(3763, 230, 'Can Tho', 'CT', 1),
(3764, 230, 'Cao Bang', 'CB', 1),
(3765, 230, 'Dak Lak', 'DL', 1),
(3766, 230, 'Dak Nong', 'DG', 1),
(3767, 230, 'Da Nang', 'DN', 1),
(3768, 230, 'Dien Bien', 'DB', 1),
(3769, 230, 'Dong Nai', 'DI', 1),
(3770, 230, 'Dong Thap', 'DT', 1),
(3771, 230, 'Gia Lai', 'GL', 1),
(3772, 230, 'Ha Giang', 'HG', 1),
(3773, 230, 'Hai Duong', 'HD', 1),
(3774, 230, 'Hai Phong', 'HP', 1),
(3775, 230, 'Ha Nam', 'HM', 1),
(3776, 230, 'Ha Noi', 'HI', 1),
(3777, 230, 'Ha Tay', 'HT', 1),
(3778, 230, 'Ha Tinh', 'HH', 1),
(3779, 230, 'Hoa Binh', 'HB', 1),
(3780, 230, 'Ho Chi Minh City', 'HC', 1),
(3781, 230, 'Hau Giang', 'HU', 1),
(3782, 230, 'Hung Yen', 'HY', 1),
(3783, 232, 'Saint Croix', 'C', 1),
(3784, 232, 'Saint John', 'J', 1),
(3785, 232, 'Saint Thomas', 'T', 1),
(3786, 233, 'Alo', 'A', 1),
(3787, 233, 'Sigave', 'S', 1),
(3788, 233, 'Wallis', 'W', 1),
(3789, 235, 'Abyan', 'AB', 1),
(3790, 235, 'Adan', 'AD', 1),
(3791, 235, 'Amran', 'AM', 1),
(3792, 235, 'Al Bayda', 'BA', 1),
(3793, 235, 'Ad Dali', 'DA', 1),
(3794, 235, 'Dhamar', 'DH', 1),
(3795, 235, 'Hadramawt', 'HD', 1),
(3796, 235, 'Hajjah', 'HJ', 1),
(3797, 235, 'Al Hudaydah', 'HU', 1),
(3798, 235, 'Ibb', 'IB', 1),
(3799, 235, 'Al Jawf', 'JA', 1),
(3800, 235, 'Lahij', 'LA', 1),
(3801, 235, 'Ma''rib', 'MA', 1),
(3802, 235, 'Al Mahrah', 'MR', 1),
(3803, 235, 'Al Mahwit', 'MW', 1),
(3804, 235, 'Sa''dah', 'SD', 1),
(3805, 235, 'San''a', 'SN', 1),
(3806, 235, 'Shabwah', 'SH', 1),
(3807, 235, 'Ta''izz', 'TA', 1),
(3812, 237, 'Bas-Congo', 'BC', 1),
(3813, 237, 'Bandundu', 'BN', 1),
(3814, 237, 'Equateur', 'EQ', 1),
(3815, 237, 'Katanga', 'KA', 1),
(3816, 237, 'Kasai-Oriental', 'KE', 1),
(3817, 237, 'Kinshasa', 'KN', 1),
(3818, 237, 'Kasai-Occidental', 'KW', 1),
(3819, 237, 'Maniema', 'MA', 1),
(3820, 237, 'Nord-Kivu', 'NK', 1),
(3821, 237, 'Orientale', 'OR', 1),
(3822, 237, 'Sud-Kivu', 'SK', 1),
(3823, 238, 'Central', 'CE', 1),
(3824, 238, 'Copperbelt', 'CB', 1),
(3825, 238, 'Eastern', 'EA', 1),
(3826, 238, 'Luapula', 'LP', 1),
(3827, 238, 'Lusaka', 'LK', 1),
(3828, 238, 'Northern', 'NO', 1),
(3829, 238, 'North-Western', 'NW', 1),
(3830, 238, 'Southern', 'SO', 1),
(3831, 238, 'Western', 'WE', 1),
(3832, 239, 'Bulawayo', 'BU', 1),
(3833, 239, 'Harare', 'HA', 1),
(3834, 239, 'Manicaland', 'ML', 1),
(3835, 239, 'Mashonaland Central', 'MC', 1),
(3836, 239, 'Mashonaland East', 'ME', 1),
(3837, 239, 'Mashonaland West', 'MW', 1),
(3838, 239, 'Masvingo', 'MV', 1),
(3839, 239, 'Matabeleland North', 'MN', 1),
(3840, 239, 'Matabeleland South', 'MS', 1),
(3841, 239, 'Midlands', 'MD', 1),
(3861, 105, 'Campobasso', 'CB', 1),
(3862, 105, 'Carbonia-Iglesias', 'CI', 1),
(3863, 105, 'Caserta', 'CE', 1),
(3864, 105, 'Catania', 'CT', 1),
(3865, 105, 'Catanzaro', 'CZ', 1),
(3866, 105, 'Chieti', 'CH', 1),
(3867, 105, 'Como', 'CO', 1),
(3868, 105, 'Cosenza', 'CS', 1),
(3869, 105, 'Cremona', 'CR', 1),
(3870, 105, 'Crotone', 'KR', 1),
(3871, 105, 'Cuneo', 'CN', 1),
(3872, 105, 'Enna', 'EN', 1),
(3873, 105, 'Ferrara', 'FE', 1),
(3874, 105, 'Firenze', 'FI', 1),
(3875, 105, 'Foggia', 'FG', 1),
(3876, 105, 'Forli-Cesena', 'FC', 1),
(3877, 105, 'Frosinone', 'FR', 1),
(3878, 105, 'Genova', 'GE', 1),
(3879, 105, 'Gorizia', 'GO', 1),
(3880, 105, 'Grosseto', 'GR', 1),
(3881, 105, 'Imperia', 'IM', 1),
(3882, 105, 'Isernia', 'IS', 1),
(3883, 105, 'L&#39;Aquila', 'AQ', 1),
(3884, 105, 'La Spezia', 'SP', 1),
(3885, 105, 'Latina', 'LT', 1),
(3886, 105, 'Lecce', 'LE', 1),
(3887, 105, 'Lecco', 'LC', 1),
(3888, 105, 'Livorno', 'LI', 1),
(3889, 105, 'Lodi', 'LO', 1),
(3890, 105, 'Lucca', 'LU', 1),
(3891, 105, 'Macerata', 'MC', 1),
(3892, 105, 'Mantova', 'MN', 1),
(3893, 105, 'Massa-Carrara', 'MS', 1),
(3894, 105, 'Matera', 'MT', 1),
(3895, 105, 'Medio Campidano', 'VS', 1),
(3896, 105, 'Messina', 'ME', 1),
(3897, 105, 'Milano', 'MI', 1),
(3898, 105, 'Modena', 'MO', 1),
(3899, 105, 'Napoli', 'NA', 1),
(3900, 105, 'Novara', 'NO', 1),
(3901, 105, 'Nuoro', 'NU', 1),
(3902, 105, 'Ogliastra', 'OG', 1),
(3903, 105, 'Olbia-Tempio', 'OT', 1),
(3904, 105, 'Oristano', 'OR', 1),
(3905, 105, 'Padova', 'PD', 1),
(3906, 105, 'Palermo', 'PA', 1),
(3907, 105, 'Parma', 'PR', 1),
(3908, 105, 'Pavia', 'PV', 1),
(3909, 105, 'Perugia', 'PG', 1),
(3910, 105, 'Pesaro e Urbino', 'PU', 1),
(3911, 105, 'Pescara', 'PE', 1),
(3912, 105, 'Piacenza', 'PC', 1),
(3913, 105, 'Pisa', 'PI', 1),
(3914, 105, 'Pistoia', 'PT', 1),
(3915, 105, 'Pordenone', 'PN', 1),
(3916, 105, 'Potenza', 'PZ', 1),
(3917, 105, 'Prato', 'PO', 1),
(3918, 105, 'Ragusa', 'RG', 1),
(3919, 105, 'Ravenna', 'RA', 1),
(3920, 105, 'Reggio Calabria', 'RC', 1),
(3921, 105, 'Reggio Emilia', 'RE', 1),
(3922, 105, 'Rieti', 'RI', 1),
(3923, 105, 'Rimini', 'RN', 1),
(3924, 105, 'Roma', 'RM', 1),
(3925, 105, 'Rovigo', 'RO', 1),
(3926, 105, 'Salerno', 'SA', 1),
(3927, 105, 'Sassari', 'SS', 1),
(3928, 105, 'Savona', 'SV', 1),
(3929, 105, 'Siena', 'SI', 1),
(3930, 105, 'Siracusa', 'SR', 1),
(3931, 105, 'Sondrio', 'SO', 1),
(3932, 105, 'Taranto', 'TA', 1),
(3933, 105, 'Teramo', 'TE', 1),
(3934, 105, 'Terni', 'TR', 1),
(3935, 105, 'Torino', 'TO', 1),
(3936, 105, 'Trapani', 'TP', 1),
(3937, 105, 'Trento', 'TN', 1),
(3938, 105, 'Treviso', 'TV', 1),
(3939, 105, 'Trieste', 'TS', 1),
(3940, 105, 'Udine', 'UD', 1),
(3941, 105, 'Varese', 'VA', 1),
(3942, 105, 'Venezia', 'VE', 1),
(3943, 105, 'Verbano-Cusio-Ossola', 'VB', 1),
(3944, 105, 'Vercelli', 'VC', 1),
(3945, 105, 'Verona', 'VR', 1),
(3946, 105, 'Vibo Valentia', 'VV', 1),
(3947, 105, 'Vicenza', 'VI', 1),
(3948, 105, 'Viterbo', 'VT', 1),
(3949, 222, 'County Antrim', 'ANT', 1),
(3950, 222, 'County Armagh', 'ARM', 1),
(3951, 222, 'County Down', 'DOW', 1),
(3952, 222, 'County Fermanagh', 'FER', 1),
(3953, 222, 'County Londonderry', 'LDY', 1),
(3954, 222, 'County Tyrone', 'TYR', 1),
(3955, 222, 'Cumbria', 'CMA', 1),
(3956, 190, 'Pomurska', '1', 1),
(3957, 190, 'Podravska', '2', 1),
(3958, 190, 'Koroška', '3', 1),
(3959, 190, 'Savinjska', '4', 1),
(3960, 190, 'Zasavska', '5', 1),
(3961, 190, 'Spodnjeposavska', '6', 1),
(3962, 190, 'Jugovzhodna Slovenija', '7', 1),
(3963, 190, 'Osrednjeslovenska', '8', 1),
(3964, 190, 'Gorenjska', '9', 1),
(3965, 190, 'Notranjsko-kraška', '10', 1),
(3966, 190, 'Goriška', '11', 1),
(3967, 190, 'Obalno-kraška', '12', 1),
(3968, 33, 'Ruse', '', 1),
(3969, 101, 'Alborz', 'ALB', 1),
(3970, 21, 'Brussels-Capital Region', 'BRU', 1),
(3971, 138, 'Aguascalientes', 'AG', 1),
(3973, 242, 'Andrijevica', '01', 1),
(3974, 242, 'Bar', '02', 1),
(3975, 242, 'Berane', '03', 1),
(3976, 242, 'Bijelo Polje', '04', 1),
(3977, 242, 'Budva', '05', 1),
(3978, 242, 'Cetinje', '06', 1),
(3979, 242, 'Danilovgrad', '07', 1),
(3980, 242, 'Herceg-Novi', '08', 1),
(3981, 242, 'Kolašin', '09', 1),
(3982, 242, 'Kotor', '10', 1),
(3983, 242, 'Mojkovac', '11', 1),
(3984, 242, 'Nikšić', '12', 1),
(3985, 242, 'Plav', '13', 1),
(3986, 242, 'Pljevlja', '14', 1),
(3987, 242, 'Plužine', '15', 1),
(3988, 242, 'Podgorica', '16', 1),
(3989, 242, 'Rožaje', '17', 1),
(3990, 242, 'Šavnik', '18', 1),
(3991, 242, 'Tivat', '19', 1),
(3992, 242, 'Ulcinj', '20', 1),
(3993, 242, 'Žabljak', '21', 1),
(3994, 243, 'Belgrade', '00', 1),
(3995, 243, 'North Bačka', '01', 1),
(3996, 243, 'Central Banat', '02', 1),
(3997, 243, 'North Banat', '03', 1),
(3998, 243, 'South Banat', '04', 1),
(3999, 243, 'West Bačka', '05', 1),
(4000, 243, 'South Bačka', '06', 1),
(4001, 243, 'Srem', '07', 1),
(4002, 243, 'Mačva', '08', 1),
(4003, 243, 'Kolubara', '09', 1),
(4004, 243, 'Podunavlje', '10', 1),
(4005, 243, 'Braničevo', '11', 1),
(4006, 243, 'Šumadija', '12', 1),
(4007, 243, 'Pomoravlje', '13', 1),
(4008, 243, 'Bor', '14', 1),
(4009, 243, 'Zaječar', '15', 1),
(4010, 243, 'Zlatibor', '16', 1),
(4011, 243, 'Moravica', '17', 1),
(4012, 243, 'Raška', '18', 1),
(4013, 243, 'Rasina', '19', 1),
(4014, 243, 'Nišava', '20', 1),
(4015, 243, 'Toplica', '21', 1),
(4016, 243, 'Pirot', '22', 1),
(4017, 243, 'Jablanica', '23', 1),
(4018, 243, 'Pčinja', '24', 1),
(4020, 245, 'Bonaire', 'BO', 1),
(4021, 245, 'Saba', 'SA', 1),
(4022, 245, 'Sint Eustatius', 'SE', 1),
(4023, 248, 'Central Equatoria', 'EC', 1),
(4024, 248, 'Eastern Equatoria', 'EE', 1),
(4025, 248, 'Jonglei', 'JG', 1),
(4026, 248, 'Lakes', 'LK', 1),
(4027, 248, 'Northern Bahr el-Ghazal', 'BN', 1),
(4028, 248, 'Unity', 'UY', 1),
(4029, 248, 'Upper Nile', 'NU', 1),
(4030, 248, 'Warrap', 'WR', 1),
(4031, 248, 'Western Bahr el-Ghazal', 'BW', 1),
(4032, 248, 'Western Equatoria', 'EW', 1),
(4036, 117, 'Ainaži, Salacgrīvas novads', '0661405', 1),
(4037, 117, 'Aizkraukle, Aizkraukles novads', '0320201', 1),
(4038, 117, 'Aizkraukles novads', '0320200', 1),
(4039, 117, 'Aizpute, Aizputes novads', '0640605', 1),
(4040, 117, 'Aizputes novads', '0640600', 1),
(4041, 117, 'Aknīste, Aknīstes novads', '0560805', 1),
(4042, 117, 'Aknīstes novads', '0560800', 1),
(4043, 117, 'Aloja, Alojas novads', '0661007', 1),
(4044, 117, 'Alojas novads', '0661000', 1),
(4045, 117, 'Alsungas novads', '0624200', 1),
(4046, 117, 'Alūksne, Alūksnes novads', '0360201', 1),
(4047, 117, 'Alūksnes novads', '0360200', 1),
(4048, 117, 'Amatas novads', '0424701', 1),
(4049, 117, 'Ape, Apes novads', '0360805', 1),
(4050, 117, 'Apes novads', '0360800', 1),
(4051, 117, 'Auce, Auces novads', '0460805', 1),
(4052, 117, 'Auces novads', '0460800', 1),
(4053, 117, 'Ādažu novads', '0804400', 1),
(4054, 117, 'Babītes novads', '0804900', 1),
(4055, 117, 'Baldone, Baldones novads', '0800605', 1),
(4056, 117, 'Baldones novads', '0800600', 1),
(4057, 117, 'Baloži, Ķekavas novads', '0800807', 1),
(4058, 117, 'Baltinavas novads', '0384400', 1),
(4059, 117, 'Balvi, Balvu novads', '0380201', 1),
(4060, 117, 'Balvu novads', '0380200', 1),
(4061, 117, 'Bauska, Bauskas novads', '0400201', 1),
(4062, 117, 'Bauskas novads', '0400200', 1),
(4063, 117, 'Beverīnas novads', '0964700', 1),
(4064, 117, 'Brocēni, Brocēnu novads', '0840605', 1),
(4065, 117, 'Brocēnu novads', '0840601', 1),
(4066, 117, 'Burtnieku novads', '0967101', 1),
(4067, 117, 'Carnikavas novads', '0805200', 1),
(4068, 117, 'Cesvaine, Cesvaines novads', '0700807', 1),
(4069, 117, 'Cesvaines novads', '0700800', 1),
(4070, 117, 'Cēsis, Cēsu novads', '0420201', 1),
(4071, 117, 'Cēsu novads', '0420200', 1),
(4072, 117, 'Ciblas novads', '0684901', 1),
(4073, 117, 'Dagda, Dagdas novads', '0601009', 1),
(4074, 117, 'Dagdas novads', '0601000', 1),
(4075, 117, 'Daugavpils', '0050000', 1),
(4076, 117, 'Daugavpils novads', '0440200', 1),
(4077, 117, 'Dobele, Dobeles novads', '0460201', 1),
(4078, 117, 'Dobeles novads', '0460200', 1),
(4079, 117, 'Dundagas novads', '0885100', 1),
(4080, 117, 'Durbe, Durbes novads', '0640807', 1),
(4081, 117, 'Durbes novads', '0640801', 1),
(4082, 117, 'Engures novads', '0905100', 1),
(4083, 117, 'Ērgļu novads', '0705500', 1),
(4084, 117, 'Garkalnes novads', '0806000', 1),
(4085, 117, 'Grobiņa, Grobiņas novads', '0641009', 1),
(4086, 117, 'Grobiņas novads', '0641000', 1),
(4087, 117, 'Gulbene, Gulbenes novads', '0500201', 1),
(4088, 117, 'Gulbenes novads', '0500200', 1),
(4089, 117, 'Iecavas novads', '0406400', 1),
(4090, 117, 'Ikšķile, Ikšķiles novads', '0740605', 1),
(4091, 117, 'Ikšķiles novads', '0740600', 1),
(4092, 117, 'Ilūkste, Ilūkstes novads', '0440807', 1),
(4093, 117, 'Ilūkstes novads', '0440801', 1),
(4094, 117, 'Inčukalna novads', '0801800', 1),
(4095, 117, 'Jaunjelgava, Jaunjelgavas novads', '0321007', 1),
(4096, 117, 'Jaunjelgavas novads', '0321000', 1),
(4097, 117, 'Jaunpiebalgas novads', '0425700', 1),
(4098, 117, 'Jaunpils novads', '0905700', 1),
(4099, 117, 'Jelgava', '0090000', 1),
(4100, 117, 'Jelgavas novads', '0540200', 1),
(4101, 117, 'Jēkabpils', '0110000', 1),
(4102, 117, 'Jēkabpils novads', '0560200', 1),
(4103, 117, 'Jūrmala', '0130000', 1),
(4104, 117, 'Kalnciems, Jelgavas novads', '0540211', 1),
(4105, 117, 'Kandava, Kandavas novads', '0901211', 1),
(4106, 117, 'Kandavas novads', '0901201', 1),
(4107, 117, 'Kārsava, Kārsavas novads', '0681009', 1),
(4108, 117, 'Kārsavas novads', '0681000', 1),
(4109, 117, 'Kocēnu novads ,bij. Valmieras)', '0960200', 1),
(4110, 117, 'Kokneses novads', '0326100', 1),
(4111, 117, 'Krāslava, Krāslavas novads', '0600201', 1),
(4112, 117, 'Krāslavas novads', '0600202', 1),
(4113, 117, 'Krimuldas novads', '0806900', 1),
(4114, 117, 'Krustpils novads', '0566900', 1),
(4115, 117, 'Kuldīga, Kuldīgas novads', '0620201', 1),
(4116, 117, 'Kuldīgas novads', '0620200', 1),
(4117, 117, 'Ķeguma novads', '0741001', 1),
(4118, 117, 'Ķegums, Ķeguma novads', '0741009', 1),
(4119, 117, 'Ķekavas novads', '0800800', 1),
(4120, 117, 'Lielvārde, Lielvārdes novads', '0741413', 1),
(4121, 117, 'Lielvārdes novads', '0741401', 1),
(4122, 117, 'Liepāja', '0170000', 1),
(4123, 117, 'Limbaži, Limbažu novads', '0660201', 1),
(4124, 117, 'Limbažu novads', '0660200', 1),
(4125, 117, 'Līgatne, Līgatnes novads', '0421211', 1),
(4126, 117, 'Līgatnes novads', '0421200', 1),
(4127, 117, 'Līvāni, Līvānu novads', '0761211', 1),
(4128, 117, 'Līvānu novads', '0761201', 1),
(4129, 117, 'Lubāna, Lubānas novads', '0701413', 1),
(4130, 117, 'Lubānas novads', '0701400', 1),
(4131, 117, 'Ludza, Ludzas novads', '0680201', 1),
(4132, 117, 'Ludzas novads', '0680200', 1),
(4133, 117, 'Madona, Madonas novads', '0700201', 1),
(4134, 117, 'Madonas novads', '0700200', 1),
(4135, 117, 'Mazsalaca, Mazsalacas novads', '0961011', 1),
(4136, 117, 'Mazsalacas novads', '0961000', 1),
(4137, 117, 'Mālpils novads', '0807400', 1),
(4138, 117, 'Mārupes novads', '0807600', 1),
(4139, 117, 'Mērsraga novads', '0887600', 1),
(4140, 117, 'Naukšēnu novads', '0967300', 1),
(4141, 117, 'Neretas novads', '0327100', 1),
(4142, 117, 'Nīcas novads', '0647900', 1),
(4143, 117, 'Ogre, Ogres novads', '0740201', 1),
(4144, 117, 'Ogres novads', '0740202', 1),
(4145, 117, 'Olaine, Olaines novads', '0801009', 1),
(4146, 117, 'Olaines novads', '0801000', 1),
(4147, 117, 'Ozolnieku novads', '0546701', 1),
(4148, 117, 'Pārgaujas novads', '0427500', 1),
(4149, 117, 'Pāvilosta, Pāvilostas novads', '0641413', 1),
(4150, 117, 'Pāvilostas novads', '0641401', 1),
(4151, 117, 'Piltene, Ventspils novads', '0980213', 1),
(4152, 117, 'Pļaviņas, Pļaviņu novads', '0321413', 1),
(4153, 117, 'Pļaviņu novads', '0321400', 1),
(4154, 117, 'Preiļi, Preiļu novads', '0760201', 1),
(4155, 117, 'Preiļu novads', '0760202', 1),
(4156, 117, 'Priekule, Priekules novads', '0641615', 1),
(4157, 117, 'Priekules novads', '0641600', 1),
(4158, 117, 'Priekuļu novads', '0427300', 1),
(4159, 117, 'Raunas novads', '0427700', 1),
(4160, 117, 'Rēzekne', '0210000', 1),
(4161, 117, 'Rēzeknes novads', '0780200', 1),
(4162, 117, 'Riebiņu novads', '0766300', 1),
(4163, 117, 'Rīga', '0010000', 1),
(4164, 117, 'Rojas novads', '0888300', 1),
(4165, 117, 'Ropažu novads', '0808400', 1),
(4166, 117, 'Rucavas novads', '0648500', 1),
(4167, 117, 'Rugāju novads', '0387500', 1),
(4168, 117, 'Rundāles novads', '0407700', 1),
(4169, 117, 'Rūjiena, Rūjienas novads', '0961615', 1),
(4170, 117, 'Rūjienas novads', '0961600', 1),
(4171, 117, 'Sabile, Talsu novads', '0880213', 1),
(4172, 117, 'Salacgrīva, Salacgrīvas novads', '0661415', 1),
(4173, 117, 'Salacgrīvas novads', '0661400', 1),
(4174, 117, 'Salas novads', '0568700', 1),
(4175, 117, 'Salaspils novads', '0801200', 1),
(4176, 117, 'Salaspils, Salaspils novads', '0801211', 1),
(4177, 117, 'Saldus novads', '0840200', 1),
(4178, 117, 'Saldus, Saldus novads', '0840201', 1),
(4179, 117, 'Saulkrasti, Saulkrastu novads', '0801413', 1),
(4180, 117, 'Saulkrastu novads', '0801400', 1),
(4181, 117, 'Seda, Strenču novads', '0941813', 1),
(4182, 117, 'Sējas novads', '0809200', 1),
(4183, 117, 'Sigulda, Siguldas novads', '0801615', 1),
(4184, 117, 'Siguldas novads', '0801601', 1),
(4185, 117, 'Skrīveru novads', '0328200', 1),
(4186, 117, 'Skrunda, Skrundas novads', '0621209', 1),
(4187, 117, 'Skrundas novads', '0621200', 1),
(4188, 117, 'Smiltene, Smiltenes novads', '0941615', 1),
(4189, 117, 'Smiltenes novads', '0941600', 1),
(4190, 117, 'Staicele, Alojas novads', '0661017', 1),
(4191, 117, 'Stende, Talsu novads', '0880215', 1),
(4192, 117, 'Stopiņu novads', '0809600', 1),
(4193, 117, 'Strenči, Strenču novads', '0941817', 1),
(4194, 117, 'Strenču novads', '0941800', 1),
(4195, 117, 'Subate, Ilūkstes novads', '0440815', 1),
(4196, 117, 'Talsi, Talsu novads', '0880201', 1),
(4197, 117, 'Talsu novads', '0880200', 1),
(4198, 117, 'Tērvetes novads', '0468900', 1),
(4199, 117, 'Tukuma novads', '0900200', 1),
(4200, 117, 'Tukums, Tukuma novads', '0900201', 1),
(4201, 117, 'Vaiņodes novads', '0649300', 1),
(4202, 117, 'Valdemārpils, Talsu novads', '0880217', 1),
(4203, 117, 'Valka, Valkas novads', '0940201', 1),
(4204, 117, 'Valkas novads', '0940200', 1),
(4205, 117, 'Valmiera', '0250000', 1),
(4206, 117, 'Vangaži, Inčukalna novads', '0801817', 1),
(4207, 117, 'Varakļāni, Varakļānu novads', '0701817', 1),
(4208, 117, 'Varakļānu novads', '0701800', 1),
(4209, 117, 'Vārkavas novads', '0769101', 1),
(4210, 117, 'Vecpiebalgas novads', '0429300', 1),
(4211, 117, 'Vecumnieku novads', '0409500', 1),
(4212, 117, 'Ventspils', '0270000', 1),
(4213, 117, 'Ventspils novads', '0980200', 1),
(4214, 117, 'Viesīte, Viesītes novads', '0561815', 1),
(4215, 117, 'Viesītes novads', '0561800', 1),
(4216, 117, 'Viļaka, Viļakas novads', '0381615', 1),
(4217, 117, 'Viļakas novads', '0381600', 1),
(4218, 117, 'Viļāni, Viļānu novads', '0781817', 1),
(4219, 117, 'Viļānu novads', '0781800', 1),
(4220, 117, 'Zilupe, Zilupes novads', '0681817', 1),
(4221, 117, 'Zilupes novads', '0681801', 1),
(4222, 43, 'Arica y Parinacota', 'AP', 1),
(4223, 43, 'Los Rios', 'LR', 1),
(4224, 220, 'Kharkivs''ka Oblast''', '63', 1),
(4225, 118, 'Beirut', 'LB-BR', 1),
(4226, 118, 'Bekaa', 'LB-BE', 1),
(4227, 118, 'Mount Lebanon', 'LB-ML', 1),
(4228, 118, 'Nabatieh', 'LB-NB', 1),
(4229, 118, 'North', 'LB-NR', 1),
(4230, 118, 'South', 'LB-ST', 1),
(4231, 99, 'Telangana', 'TS', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_zone_to_geo_zone`
--

CREATE TABLE IF NOT EXISTS `oc_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_zone_to_geo_zone`
--

INSERT INTO `oc_zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`) VALUES
(1, 222, 0, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 222, 3513, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 222, 3514, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 222, 3515, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 222, 3516, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 222, 3517, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 222, 3518, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 222, 3519, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 222, 3520, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 222, 3521, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 222, 3522, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 222, 3523, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 222, 3524, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 222, 3525, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 222, 3526, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 222, 3527, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 222, 3528, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 222, 3529, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 222, 3530, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 222, 3531, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 222, 3532, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 222, 3533, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 222, 3534, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 222, 3535, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 222, 3536, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 222, 3537, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 222, 3538, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 222, 3539, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 222, 3540, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 222, 3541, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 222, 3542, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 222, 3543, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 222, 3544, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 222, 3545, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 222, 3546, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 222, 3547, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 222, 3548, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 222, 3549, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 222, 3550, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 222, 3551, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 222, 3552, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 222, 3553, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 222, 3554, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 222, 3555, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 222, 3556, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 222, 3557, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 222, 3558, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 222, 3559, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 222, 3560, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 222, 3561, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 222, 3562, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 222, 3563, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 222, 3564, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 222, 3565, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 222, 3566, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 222, 3567, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 222, 3568, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 222, 3569, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 222, 3570, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 222, 3571, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 222, 3572, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 222, 3573, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 222, 3574, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 222, 3575, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 222, 3576, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 222, 3577, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 222, 3578, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 222, 3579, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 222, 3580, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 222, 3581, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 222, 3582, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 222, 3583, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 222, 3584, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 222, 3585, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 222, 3586, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 222, 3587, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 222, 3588, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 222, 3589, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 222, 3590, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 222, 3591, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 222, 3592, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 222, 3593, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 222, 3594, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 222, 3595, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 222, 3596, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 222, 3597, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 222, 3598, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 222, 3599, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 222, 3600, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 222, 3601, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 222, 3602, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 222, 3603, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 222, 3604, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 222, 3605, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 222, 3606, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 222, 3607, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 222, 3608, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 222, 3609, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 222, 3610, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 222, 3611, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 222, 3612, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 222, 3949, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 222, 3950, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 222, 3951, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 222, 3952, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 222, 3953, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 222, 3954, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 222, 3955, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 222, 3972, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `oc_accc_customer_affiliate`
--
ALTER TABLE `oc_accc_customer_affiliate`
  ADD PRIMARY KEY (`accc_customer_affiliate_id`),
  ADD UNIQUE KEY `customer_affiliate_id` (`customer_id`,`affiliate_id`);

--
-- Indexes for table `oc_address`
--
ALTER TABLE `oc_address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `oc_affiliate`
--
ALTER TABLE `oc_affiliate`
  ADD PRIMARY KEY (`affiliate_id`);

--
-- Indexes for table `oc_affiliate_activity`
--
ALTER TABLE `oc_affiliate_activity`
  ADD PRIMARY KEY (`activity_id`);

--
-- Indexes for table `oc_affiliate_login`
--
ALTER TABLE `oc_affiliate_login`
  ADD PRIMARY KEY (`affiliate_login_id`),
  ADD KEY `email` (`email`),
  ADD KEY `ip` (`ip`);

--
-- Indexes for table `oc_affiliate_tracking_discount`
--
ALTER TABLE `oc_affiliate_tracking_discount`
  ADD PRIMARY KEY (`affiliate_id`);

--
-- Indexes for table `oc_affiliate_transaction`
--
ALTER TABLE `oc_affiliate_transaction`
  ADD PRIMARY KEY (`affiliate_transaction_id`);

--
-- Indexes for table `oc_api`
--
ALTER TABLE `oc_api`
  ADD PRIMARY KEY (`api_id`);

--
-- Indexes for table `oc_api_ip`
--
ALTER TABLE `oc_api_ip`
  ADD PRIMARY KEY (`api_ip_id`);

--
-- Indexes for table `oc_api_session`
--
ALTER TABLE `oc_api_session`
  ADD PRIMARY KEY (`api_session_id`);

--
-- Indexes for table `oc_attribute`
--
ALTER TABLE `oc_attribute`
  ADD PRIMARY KEY (`attribute_id`);

--
-- Indexes for table `oc_attribute_description`
--
ALTER TABLE `oc_attribute_description`
  ADD PRIMARY KEY (`attribute_id`,`language_id`);

--
-- Indexes for table `oc_attribute_group`
--
ALTER TABLE `oc_attribute_group`
  ADD PRIMARY KEY (`attribute_group_id`);

--
-- Indexes for table `oc_attribute_group_description`
--
ALTER TABLE `oc_attribute_group_description`
  ADD PRIMARY KEY (`attribute_group_id`,`language_id`);

--
-- Indexes for table `oc_banner`
--
ALTER TABLE `oc_banner`
  ADD PRIMARY KEY (`banner_id`);

--
-- Indexes for table `oc_banner_image`
--
ALTER TABLE `oc_banner_image`
  ADD PRIMARY KEY (`banner_image_id`);

--
-- Indexes for table `oc_banner_image_description`
--
ALTER TABLE `oc_banner_image_description`
  ADD PRIMARY KEY (`banner_image_id`,`language_id`);

--
-- Indexes for table `oc_cart`
--
ALTER TABLE `oc_cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `cart_id` (`customer_id`,`session_id`,`product_id`,`recurring_id`);

--
-- Indexes for table `oc_category`
--
ALTER TABLE `oc_category`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `oc_category_description`
--
ALTER TABLE `oc_category_description`
  ADD PRIMARY KEY (`category_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `oc_category_filter`
--
ALTER TABLE `oc_category_filter`
  ADD PRIMARY KEY (`category_id`,`filter_id`);

--
-- Indexes for table `oc_category_path`
--
ALTER TABLE `oc_category_path`
  ADD PRIMARY KEY (`category_id`,`path_id`);

--
-- Indexes for table `oc_category_to_layout`
--
ALTER TABLE `oc_category_to_layout`
  ADD PRIMARY KEY (`category_id`,`store_id`);

--
-- Indexes for table `oc_category_to_store`
--
ALTER TABLE `oc_category_to_store`
  ADD PRIMARY KEY (`category_id`,`store_id`);

--
-- Indexes for table `oc_cftyp_coupon_affiliate`
--
ALTER TABLE `oc_cftyp_coupon_affiliate`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Indexes for table `oc_country`
--
ALTER TABLE `oc_country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `oc_coupon`
--
ALTER TABLE `oc_coupon`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Indexes for table `oc_coupon_category`
--
ALTER TABLE `oc_coupon_category`
  ADD PRIMARY KEY (`coupon_id`,`category_id`);

--
-- Indexes for table `oc_coupon_history`
--
ALTER TABLE `oc_coupon_history`
  ADD PRIMARY KEY (`coupon_history_id`);

--
-- Indexes for table `oc_coupon_product`
--
ALTER TABLE `oc_coupon_product`
  ADD PRIMARY KEY (`coupon_product_id`);

--
-- Indexes for table `oc_currency`
--
ALTER TABLE `oc_currency`
  ADD PRIMARY KEY (`currency_id`);

--
-- Indexes for table `oc_customer`
--
ALTER TABLE `oc_customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `oc_customer_activity`
--
ALTER TABLE `oc_customer_activity`
  ADD PRIMARY KEY (`activity_id`);

--
-- Indexes for table `oc_customer_group`
--
ALTER TABLE `oc_customer_group`
  ADD PRIMARY KEY (`customer_group_id`);

--
-- Indexes for table `oc_customer_group_description`
--
ALTER TABLE `oc_customer_group_description`
  ADD PRIMARY KEY (`customer_group_id`,`language_id`);

--
-- Indexes for table `oc_customer_history`
--
ALTER TABLE `oc_customer_history`
  ADD PRIMARY KEY (`customer_history_id`);

--
-- Indexes for table `oc_customer_ip`
--
ALTER TABLE `oc_customer_ip`
  ADD PRIMARY KEY (`customer_ip_id`),
  ADD KEY `ip` (`ip`);

--
-- Indexes for table `oc_customer_login`
--
ALTER TABLE `oc_customer_login`
  ADD PRIMARY KEY (`customer_login_id`),
  ADD KEY `email` (`email`),
  ADD KEY `ip` (`ip`);

--
-- Indexes for table `oc_customer_online`
--
ALTER TABLE `oc_customer_online`
  ADD PRIMARY KEY (`ip`);

--
-- Indexes for table `oc_customer_reward`
--
ALTER TABLE `oc_customer_reward`
  ADD PRIMARY KEY (`customer_reward_id`);

--
-- Indexes for table `oc_customer_transaction`
--
ALTER TABLE `oc_customer_transaction`
  ADD PRIMARY KEY (`customer_transaction_id`);

--
-- Indexes for table `oc_customer_wishlist`
--
ALTER TABLE `oc_customer_wishlist`
  ADD PRIMARY KEY (`customer_id`,`product_id`);

--
-- Indexes for table `oc_custom_field`
--
ALTER TABLE `oc_custom_field`
  ADD PRIMARY KEY (`custom_field_id`);

--
-- Indexes for table `oc_custom_field_customer_group`
--
ALTER TABLE `oc_custom_field_customer_group`
  ADD PRIMARY KEY (`custom_field_id`,`customer_group_id`);

--
-- Indexes for table `oc_custom_field_description`
--
ALTER TABLE `oc_custom_field_description`
  ADD PRIMARY KEY (`custom_field_id`,`language_id`);

--
-- Indexes for table `oc_custom_field_value`
--
ALTER TABLE `oc_custom_field_value`
  ADD PRIMARY KEY (`custom_field_value_id`);

--
-- Indexes for table `oc_custom_field_value_description`
--
ALTER TABLE `oc_custom_field_value_description`
  ADD PRIMARY KEY (`custom_field_value_id`,`language_id`);

--
-- Indexes for table `oc_download`
--
ALTER TABLE `oc_download`
  ADD PRIMARY KEY (`download_id`);

--
-- Indexes for table `oc_download_description`
--
ALTER TABLE `oc_download_description`
  ADD PRIMARY KEY (`download_id`,`language_id`);

--
-- Indexes for table `oc_event`
--
ALTER TABLE `oc_event`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `oc_extension`
--
ALTER TABLE `oc_extension`
  ADD PRIMARY KEY (`extension_id`);

--
-- Indexes for table `oc_filter`
--
ALTER TABLE `oc_filter`
  ADD PRIMARY KEY (`filter_id`);

--
-- Indexes for table `oc_filter_description`
--
ALTER TABLE `oc_filter_description`
  ADD PRIMARY KEY (`filter_id`,`language_id`);

--
-- Indexes for table `oc_filter_group`
--
ALTER TABLE `oc_filter_group`
  ADD PRIMARY KEY (`filter_group_id`);

--
-- Indexes for table `oc_filter_group_description`
--
ALTER TABLE `oc_filter_group_description`
  ADD PRIMARY KEY (`filter_group_id`,`language_id`);

--
-- Indexes for table `oc_geo_zone`
--
ALTER TABLE `oc_geo_zone`
  ADD PRIMARY KEY (`geo_zone_id`);

--
-- Indexes for table `oc_information`
--
ALTER TABLE `oc_information`
  ADD PRIMARY KEY (`information_id`);

--
-- Indexes for table `oc_information_description`
--
ALTER TABLE `oc_information_description`
  ADD PRIMARY KEY (`information_id`,`language_id`);

--
-- Indexes for table `oc_information_to_layout`
--
ALTER TABLE `oc_information_to_layout`
  ADD PRIMARY KEY (`information_id`,`store_id`);

--
-- Indexes for table `oc_information_to_store`
--
ALTER TABLE `oc_information_to_store`
  ADD PRIMARY KEY (`information_id`,`store_id`);

--
-- Indexes for table `oc_language`
--
ALTER TABLE `oc_language`
  ADD PRIMARY KEY (`language_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `oc_layout`
--
ALTER TABLE `oc_layout`
  ADD PRIMARY KEY (`layout_id`);

--
-- Indexes for table `oc_layout_module`
--
ALTER TABLE `oc_layout_module`
  ADD PRIMARY KEY (`layout_module_id`);

--
-- Indexes for table `oc_layout_route`
--
ALTER TABLE `oc_layout_route`
  ADD PRIMARY KEY (`layout_route_id`);

--
-- Indexes for table `oc_length_class`
--
ALTER TABLE `oc_length_class`
  ADD PRIMARY KEY (`length_class_id`);

--
-- Indexes for table `oc_length_class_description`
--
ALTER TABLE `oc_length_class_description`
  ADD PRIMARY KEY (`length_class_id`,`language_id`);

--
-- Indexes for table `oc_location`
--
ALTER TABLE `oc_location`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `oc_manufacturer`
--
ALTER TABLE `oc_manufacturer`
  ADD PRIMARY KEY (`manufacturer_id`);

--
-- Indexes for table `oc_manufacturer_to_store`
--
ALTER TABLE `oc_manufacturer_to_store`
  ADD PRIMARY KEY (`manufacturer_id`,`store_id`);

--
-- Indexes for table `oc_marketing`
--
ALTER TABLE `oc_marketing`
  ADD PRIMARY KEY (`marketing_id`);

--
-- Indexes for table `oc_modification`
--
ALTER TABLE `oc_modification`
  ADD PRIMARY KEY (`modification_id`);

--
-- Indexes for table `oc_module`
--
ALTER TABLE `oc_module`
  ADD PRIMARY KEY (`module_id`);

--
-- Indexes for table `oc_mta_affiliate`
--
ALTER TABLE `oc_mta_affiliate`
  ADD PRIMARY KEY (`affiliate_id`),
  ADD KEY `FK_mta_scheme_id` (`mta_scheme_id`);

--
-- Indexes for table `oc_mta_autoapprove`
--
ALTER TABLE `oc_mta_autoapprove`
  ADD PRIMARY KEY (`mta_autoapprove_id`),
  ADD UNIQUE KEY `mta_scheme_id` (`mta_scheme_id`,`signup_level`);

--
-- Indexes for table `oc_mta_order`
--
ALTER TABLE `oc_mta_order`
  ADD PRIMARY KEY (`mta_order_id`),
  ADD UNIQUE KEY `affiliate_id` (`affiliate_id`,`order_id`);

--
-- Indexes for table `oc_mta_order_product`
--
ALTER TABLE `oc_mta_order_product`
  ADD PRIMARY KEY (`mta_order_product_id`),
  ADD UNIQUE KEY `affiliate_id` (`affiliate_id`,`order_product_id`),
  ADD KEY `FK_mta_order_id` (`mta_order_id`);

--
-- Indexes for table `oc_mta_product`
--
ALTER TABLE `oc_mta_product`
  ADD PRIMARY KEY (`mta_product_id`),
  ADD UNIQUE KEY `product_id` (`product_id`,`price_mod_type`,`price_mod_id`),
  ADD KEY `FK_mta_product_mta_scheme_id` (`mta_scheme_id`);

--
-- Indexes for table `oc_mta_product_affiliate`
--
ALTER TABLE `oc_mta_product_affiliate`
  ADD PRIMARY KEY (`mta_product_affiliate_id`),
  ADD UNIQUE KEY `product_id` (`product_id`,`affiliate_id`,`price_mod_type`,`price_mod_id`),
  ADD KEY `mta_product_affiliate_ibfk_1` (`affiliate_id`),
  ADD KEY `mta_product_affiliate_ibfk_2` (`mta_scheme_id`);

--
-- Indexes for table `oc_mta_product_default_scheme`
--
ALTER TABLE `oc_mta_product_default_scheme`
  ADD PRIMARY KEY (`mta_product_default_scheme_id`),
  ADD UNIQUE KEY `enitity` (`entity_id`,`entity_type`),
  ADD KEY `mta_product_default_scheme_ibfk_1` (`mta_scheme_id`);

--
-- Indexes for table `oc_mta_scheme`
--
ALTER TABLE `oc_mta_scheme`
  ADD PRIMARY KEY (`mta_scheme_id`),
  ADD UNIQUE KEY `scheme_name` (`scheme_name`),
  ADD UNIQUE KEY `signup_code` (`signup_code`);

--
-- Indexes for table `oc_mta_scheme_levels`
--
ALTER TABLE `oc_mta_scheme_levels`
  ADD PRIMARY KEY (`mta_scheme_level_id`),
  ADD UNIQUE KEY `mta_scheme_id` (`mta_scheme_id`,`num_levels`,`level`);

--
-- Indexes for table `oc_option`
--
ALTER TABLE `oc_option`
  ADD PRIMARY KEY (`option_id`);

--
-- Indexes for table `oc_option_description`
--
ALTER TABLE `oc_option_description`
  ADD PRIMARY KEY (`option_id`,`language_id`);

--
-- Indexes for table `oc_option_value`
--
ALTER TABLE `oc_option_value`
  ADD PRIMARY KEY (`option_value_id`);

--
-- Indexes for table `oc_option_value_description`
--
ALTER TABLE `oc_option_value_description`
  ADD PRIMARY KEY (`option_value_id`,`language_id`);

--
-- Indexes for table `oc_order`
--
ALTER TABLE `oc_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `oc_order_custom_field`
--
ALTER TABLE `oc_order_custom_field`
  ADD PRIMARY KEY (`order_custom_field_id`);

--
-- Indexes for table `oc_order_history`
--
ALTER TABLE `oc_order_history`
  ADD PRIMARY KEY (`order_history_id`);

--
-- Indexes for table `oc_order_option`
--
ALTER TABLE `oc_order_option`
  ADD PRIMARY KEY (`order_option_id`);

--
-- Indexes for table `oc_order_product`
--
ALTER TABLE `oc_order_product`
  ADD PRIMARY KEY (`order_product_id`);

--
-- Indexes for table `oc_order_recurring`
--
ALTER TABLE `oc_order_recurring`
  ADD PRIMARY KEY (`order_recurring_id`);

--
-- Indexes for table `oc_order_recurring_transaction`
--
ALTER TABLE `oc_order_recurring_transaction`
  ADD PRIMARY KEY (`order_recurring_transaction_id`);

--
-- Indexes for table `oc_order_status`
--
ALTER TABLE `oc_order_status`
  ADD PRIMARY KEY (`order_status_id`,`language_id`);

--
-- Indexes for table `oc_order_total`
--
ALTER TABLE `oc_order_total`
  ADD PRIMARY KEY (`order_total_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `oc_order_voucher`
--
ALTER TABLE `oc_order_voucher`
  ADD PRIMARY KEY (`order_voucher_id`);

--
-- Indexes for table `oc_paypal_order`
--
ALTER TABLE `oc_paypal_order`
  ADD PRIMARY KEY (`paypal_order_id`);

--
-- Indexes for table `oc_paypal_order_transaction`
--
ALTER TABLE `oc_paypal_order_transaction`
  ADD PRIMARY KEY (`paypal_order_transaction_id`);

--
-- Indexes for table `oc_product`
--
ALTER TABLE `oc_product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `oc_product_attribute`
--
ALTER TABLE `oc_product_attribute`
  ADD PRIMARY KEY (`product_id`,`attribute_id`,`language_id`);

--
-- Indexes for table `oc_product_description`
--
ALTER TABLE `oc_product_description`
  ADD PRIMARY KEY (`product_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `oc_product_discount`
--
ALTER TABLE `oc_product_discount`
  ADD PRIMARY KEY (`product_discount_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `oc_product_filter`
--
ALTER TABLE `oc_product_filter`
  ADD PRIMARY KEY (`product_id`,`filter_id`);

--
-- Indexes for table `oc_product_image`
--
ALTER TABLE `oc_product_image`
  ADD PRIMARY KEY (`product_image_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `oc_product_option`
--
ALTER TABLE `oc_product_option`
  ADD PRIMARY KEY (`product_option_id`);

--
-- Indexes for table `oc_product_option_value`
--
ALTER TABLE `oc_product_option_value`
  ADD PRIMARY KEY (`product_option_value_id`);

--
-- Indexes for table `oc_product_recurring`
--
ALTER TABLE `oc_product_recurring`
  ADD PRIMARY KEY (`product_id`,`recurring_id`,`customer_group_id`);

--
-- Indexes for table `oc_product_related`
--
ALTER TABLE `oc_product_related`
  ADD PRIMARY KEY (`product_id`,`related_id`);

--
-- Indexes for table `oc_product_reward`
--
ALTER TABLE `oc_product_reward`
  ADD PRIMARY KEY (`product_reward_id`);

--
-- Indexes for table `oc_product_special`
--
ALTER TABLE `oc_product_special`
  ADD PRIMARY KEY (`product_special_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `oc_product_to_category`
--
ALTER TABLE `oc_product_to_category`
  ADD PRIMARY KEY (`product_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `oc_product_to_download`
--
ALTER TABLE `oc_product_to_download`
  ADD PRIMARY KEY (`product_id`,`download_id`);

--
-- Indexes for table `oc_product_to_layout`
--
ALTER TABLE `oc_product_to_layout`
  ADD PRIMARY KEY (`product_id`,`store_id`);

--
-- Indexes for table `oc_product_to_store`
--
ALTER TABLE `oc_product_to_store`
  ADD PRIMARY KEY (`product_id`,`store_id`);

--
-- Indexes for table `oc_recurring`
--
ALTER TABLE `oc_recurring`
  ADD PRIMARY KEY (`recurring_id`);

--
-- Indexes for table `oc_recurring_description`
--
ALTER TABLE `oc_recurring_description`
  ADD PRIMARY KEY (`recurring_id`,`language_id`);

--
-- Indexes for table `oc_return`
--
ALTER TABLE `oc_return`
  ADD PRIMARY KEY (`return_id`);

--
-- Indexes for table `oc_return_action`
--
ALTER TABLE `oc_return_action`
  ADD PRIMARY KEY (`return_action_id`,`language_id`);

--
-- Indexes for table `oc_return_history`
--
ALTER TABLE `oc_return_history`
  ADD PRIMARY KEY (`return_history_id`);

--
-- Indexes for table `oc_return_reason`
--
ALTER TABLE `oc_return_reason`
  ADD PRIMARY KEY (`return_reason_id`,`language_id`);

--
-- Indexes for table `oc_return_status`
--
ALTER TABLE `oc_return_status`
  ADD PRIMARY KEY (`return_status_id`,`language_id`);

--
-- Indexes for table `oc_review`
--
ALTER TABLE `oc_review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `oc_setting`
--
ALTER TABLE `oc_setting`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `oc_stock_status`
--
ALTER TABLE `oc_stock_status`
  ADD PRIMARY KEY (`stock_status_id`,`language_id`);

--
-- Indexes for table `oc_store`
--
ALTER TABLE `oc_store`
  ADD PRIMARY KEY (`store_id`);

--
-- Indexes for table `oc_tax_class`
--
ALTER TABLE `oc_tax_class`
  ADD PRIMARY KEY (`tax_class_id`);

--
-- Indexes for table `oc_tax_rate`
--
ALTER TABLE `oc_tax_rate`
  ADD PRIMARY KEY (`tax_rate_id`);

--
-- Indexes for table `oc_tax_rate_to_customer_group`
--
ALTER TABLE `oc_tax_rate_to_customer_group`
  ADD PRIMARY KEY (`tax_rate_id`,`customer_group_id`);

--
-- Indexes for table `oc_tax_rule`
--
ALTER TABLE `oc_tax_rule`
  ADD PRIMARY KEY (`tax_rule_id`);

--
-- Indexes for table `oc_upload`
--
ALTER TABLE `oc_upload`
  ADD PRIMARY KEY (`upload_id`);

--
-- Indexes for table `oc_url_alias`
--
ALTER TABLE `oc_url_alias`
  ADD PRIMARY KEY (`url_alias_id`),
  ADD KEY `query` (`query`),
  ADD KEY `keyword` (`keyword`);

--
-- Indexes for table `oc_user`
--
ALTER TABLE `oc_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `oc_user_group`
--
ALTER TABLE `oc_user_group`
  ADD PRIMARY KEY (`user_group_id`);

--
-- Indexes for table `oc_voucher`
--
ALTER TABLE `oc_voucher`
  ADD PRIMARY KEY (`voucher_id`);

--
-- Indexes for table `oc_voucher_history`
--
ALTER TABLE `oc_voucher_history`
  ADD PRIMARY KEY (`voucher_history_id`);

--
-- Indexes for table `oc_voucher_theme`
--
ALTER TABLE `oc_voucher_theme`
  ADD PRIMARY KEY (`voucher_theme_id`);

--
-- Indexes for table `oc_voucher_theme_description`
--
ALTER TABLE `oc_voucher_theme_description`
  ADD PRIMARY KEY (`voucher_theme_id`,`language_id`);

--
-- Indexes for table `oc_weight_class`
--
ALTER TABLE `oc_weight_class`
  ADD PRIMARY KEY (`weight_class_id`);

--
-- Indexes for table `oc_weight_class_description`
--
ALTER TABLE `oc_weight_class_description`
  ADD PRIMARY KEY (`weight_class_id`,`language_id`);

--
-- Indexes for table `oc_zone`
--
ALTER TABLE `oc_zone`
  ADD PRIMARY KEY (`zone_id`);

--
-- Indexes for table `oc_zone_to_geo_zone`
--
ALTER TABLE `oc_zone_to_geo_zone`
  ADD PRIMARY KEY (`zone_to_geo_zone_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `oc_accc_customer_affiliate`
--
ALTER TABLE `oc_accc_customer_affiliate`
  MODIFY `accc_customer_affiliate_id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `oc_address`
--
ALTER TABLE `oc_address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `oc_affiliate`
--
ALTER TABLE `oc_affiliate`
  MODIFY `affiliate_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `oc_affiliate_activity`
--
ALTER TABLE `oc_affiliate_activity`
  MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_affiliate_login`
--
ALTER TABLE `oc_affiliate_login`
  MODIFY `affiliate_login_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_affiliate_transaction`
--
ALTER TABLE `oc_affiliate_transaction`
  MODIFY `affiliate_transaction_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_api`
--
ALTER TABLE `oc_api`
  MODIFY `api_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `oc_api_ip`
--
ALTER TABLE `oc_api_ip`
  MODIFY `api_ip_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `oc_api_session`
--
ALTER TABLE `oc_api_session`
  MODIFY `api_session_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `oc_attribute`
--
ALTER TABLE `oc_attribute`
  MODIFY `attribute_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `oc_attribute_group`
--
ALTER TABLE `oc_attribute_group`
  MODIFY `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `oc_banner`
--
ALTER TABLE `oc_banner`
  MODIFY `banner_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `oc_banner_image`
--
ALTER TABLE `oc_banner_image`
  MODIFY `banner_image_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=144;
--
-- AUTO_INCREMENT for table `oc_cart`
--
ALTER TABLE `oc_cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `oc_category`
--
ALTER TABLE `oc_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=92;
--
-- AUTO_INCREMENT for table `oc_country`
--
ALTER TABLE `oc_country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=258;
--
-- AUTO_INCREMENT for table `oc_coupon`
--
ALTER TABLE `oc_coupon`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `oc_coupon_history`
--
ALTER TABLE `oc_coupon_history`
  MODIFY `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_coupon_product`
--
ALTER TABLE `oc_coupon_product`
  MODIFY `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_currency`
--
ALTER TABLE `oc_currency`
  MODIFY `currency_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `oc_customer`
--
ALTER TABLE `oc_customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `oc_customer_activity`
--
ALTER TABLE `oc_customer_activity`
  MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `oc_customer_group`
--
ALTER TABLE `oc_customer_group`
  MODIFY `customer_group_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `oc_customer_history`
--
ALTER TABLE `oc_customer_history`
  MODIFY `customer_history_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_customer_ip`
--
ALTER TABLE `oc_customer_ip`
  MODIFY `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `oc_customer_login`
--
ALTER TABLE `oc_customer_login`
  MODIFY `customer_login_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `oc_customer_reward`
--
ALTER TABLE `oc_customer_reward`
  MODIFY `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_customer_transaction`
--
ALTER TABLE `oc_customer_transaction`
  MODIFY `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_custom_field`
--
ALTER TABLE `oc_custom_field`
  MODIFY `custom_field_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_custom_field_value`
--
ALTER TABLE `oc_custom_field_value`
  MODIFY `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_download`
--
ALTER TABLE `oc_download`
  MODIFY `download_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_event`
--
ALTER TABLE `oc_event`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=69;
--
-- AUTO_INCREMENT for table `oc_extension`
--
ALTER TABLE `oc_extension`
  MODIFY `extension_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `oc_filter`
--
ALTER TABLE `oc_filter`
  MODIFY `filter_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_filter_group`
--
ALTER TABLE `oc_filter_group`
  MODIFY `filter_group_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_geo_zone`
--
ALTER TABLE `oc_geo_zone`
  MODIFY `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `oc_information`
--
ALTER TABLE `oc_information`
  MODIFY `information_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `oc_language`
--
ALTER TABLE `oc_language`
  MODIFY `language_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `oc_layout`
--
ALTER TABLE `oc_layout`
  MODIFY `layout_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `oc_layout_module`
--
ALTER TABLE `oc_layout_module`
  MODIFY `layout_module_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=74;
--
-- AUTO_INCREMENT for table `oc_layout_route`
--
ALTER TABLE `oc_layout_route`
  MODIFY `layout_route_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT for table `oc_length_class`
--
ALTER TABLE `oc_length_class`
  MODIFY `length_class_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `oc_length_class_description`
--
ALTER TABLE `oc_length_class_description`
  MODIFY `length_class_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `oc_location`
--
ALTER TABLE `oc_location`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_manufacturer`
--
ALTER TABLE `oc_manufacturer`
  MODIFY `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `oc_marketing`
--
ALTER TABLE `oc_marketing`
  MODIFY `marketing_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_modification`
--
ALTER TABLE `oc_modification`
  MODIFY `modification_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `oc_module`
--
ALTER TABLE `oc_module`
  MODIFY `module_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `oc_mta_autoapprove`
--
ALTER TABLE `oc_mta_autoapprove`
  MODIFY `mta_autoapprove_id` int(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `oc_mta_order`
--
ALTER TABLE `oc_mta_order`
  MODIFY `mta_order_id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `oc_mta_order_product`
--
ALTER TABLE `oc_mta_order_product`
  MODIFY `mta_order_product_id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `oc_mta_product`
--
ALTER TABLE `oc_mta_product`
  MODIFY `mta_product_id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_mta_product_affiliate`
--
ALTER TABLE `oc_mta_product_affiliate`
  MODIFY `mta_product_affiliate_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_mta_product_default_scheme`
--
ALTER TABLE `oc_mta_product_default_scheme`
  MODIFY `mta_product_default_scheme_id` int(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_mta_scheme`
--
ALTER TABLE `oc_mta_scheme`
  MODIFY `mta_scheme_id` int(6) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `oc_mta_scheme_levels`
--
ALTER TABLE `oc_mta_scheme_levels`
  MODIFY `mta_scheme_level_id` int(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `oc_option`
--
ALTER TABLE `oc_option`
  MODIFY `option_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `oc_option_value`
--
ALTER TABLE `oc_option_value`
  MODIFY `option_value_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `oc_order`
--
ALTER TABLE `oc_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `oc_order_custom_field`
--
ALTER TABLE `oc_order_custom_field`
  MODIFY `order_custom_field_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_order_history`
--
ALTER TABLE `oc_order_history`
  MODIFY `order_history_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `oc_order_option`
--
ALTER TABLE `oc_order_option`
  MODIFY `order_option_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_order_product`
--
ALTER TABLE `oc_order_product`
  MODIFY `order_product_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `oc_order_recurring`
--
ALTER TABLE `oc_order_recurring`
  MODIFY `order_recurring_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_order_recurring_transaction`
--
ALTER TABLE `oc_order_recurring_transaction`
  MODIFY `order_recurring_transaction_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_order_status`
--
ALTER TABLE `oc_order_status`
  MODIFY `order_status_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `oc_order_total`
--
ALTER TABLE `oc_order_total`
  MODIFY `order_total_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `oc_order_voucher`
--
ALTER TABLE `oc_order_voucher`
  MODIFY `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_paypal_order`
--
ALTER TABLE `oc_paypal_order`
  MODIFY `paypal_order_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `oc_paypal_order_transaction`
--
ALTER TABLE `oc_paypal_order_transaction`
  MODIFY `paypal_order_transaction_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `oc_product`
--
ALTER TABLE `oc_product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT for table `oc_product_discount`
--
ALTER TABLE `oc_product_discount`
  MODIFY `product_discount_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=441;
--
-- AUTO_INCREMENT for table `oc_product_image`
--
ALTER TABLE `oc_product_image`
  MODIFY `product_image_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2370;
--
-- AUTO_INCREMENT for table `oc_product_option`
--
ALTER TABLE `oc_product_option`
  MODIFY `product_option_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=227;
--
-- AUTO_INCREMENT for table `oc_product_option_value`
--
ALTER TABLE `oc_product_option_value`
  MODIFY `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `oc_product_reward`
--
ALTER TABLE `oc_product_reward`
  MODIFY `product_reward_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=546;
--
-- AUTO_INCREMENT for table `oc_product_special`
--
ALTER TABLE `oc_product_special`
  MODIFY `product_special_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=442;
--
-- AUTO_INCREMENT for table `oc_recurring`
--
ALTER TABLE `oc_recurring`
  MODIFY `recurring_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_return`
--
ALTER TABLE `oc_return`
  MODIFY `return_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_return_action`
--
ALTER TABLE `oc_return_action`
  MODIFY `return_action_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `oc_return_history`
--
ALTER TABLE `oc_return_history`
  MODIFY `return_history_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_return_reason`
--
ALTER TABLE `oc_return_reason`
  MODIFY `return_reason_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `oc_return_status`
--
ALTER TABLE `oc_return_status`
  MODIFY `return_status_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `oc_review`
--
ALTER TABLE `oc_review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_setting`
--
ALTER TABLE `oc_setting`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1491;
--
-- AUTO_INCREMENT for table `oc_stock_status`
--
ALTER TABLE `oc_stock_status`
  MODIFY `stock_status_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `oc_store`
--
ALTER TABLE `oc_store`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_tax_class`
--
ALTER TABLE `oc_tax_class`
  MODIFY `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `oc_tax_rate`
--
ALTER TABLE `oc_tax_rate`
  MODIFY `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=88;
--
-- AUTO_INCREMENT for table `oc_tax_rule`
--
ALTER TABLE `oc_tax_rule`
  MODIFY `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=129;
--
-- AUTO_INCREMENT for table `oc_upload`
--
ALTER TABLE `oc_upload`
  MODIFY `upload_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_url_alias`
--
ALTER TABLE `oc_url_alias`
  MODIFY `url_alias_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=895;
--
-- AUTO_INCREMENT for table `oc_user`
--
ALTER TABLE `oc_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `oc_user_group`
--
ALTER TABLE `oc_user_group`
  MODIFY `user_group_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `oc_voucher`
--
ALTER TABLE `oc_voucher`
  MODIFY `voucher_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_voucher_history`
--
ALTER TABLE `oc_voucher_history`
  MODIFY `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_voucher_theme`
--
ALTER TABLE `oc_voucher_theme`
  MODIFY `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `oc_weight_class`
--
ALTER TABLE `oc_weight_class`
  MODIFY `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `oc_weight_class_description`
--
ALTER TABLE `oc_weight_class_description`
  MODIFY `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `oc_zone`
--
ALTER TABLE `oc_zone`
  MODIFY `zone_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4232;
--
-- AUTO_INCREMENT for table `oc_zone_to_geo_zone`
--
ALTER TABLE `oc_zone_to_geo_zone`
  MODIFY `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=110;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `oc_mta_affiliate`
--
ALTER TABLE `oc_mta_affiliate`
  ADD CONSTRAINT `mta_affiliate_ibfk_1` FOREIGN KEY (`mta_scheme_id`) REFERENCES `oc_mta_scheme` (`mta_scheme_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `oc_mta_autoapprove`
--
ALTER TABLE `oc_mta_autoapprove`
  ADD CONSTRAINT `mta_autoapprove_ibfk_1` FOREIGN KEY (`mta_scheme_id`) REFERENCES `oc_mta_scheme` (`mta_scheme_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `oc_mta_order`
--
ALTER TABLE `oc_mta_order`
  ADD CONSTRAINT `mta_order_ibfk_1` FOREIGN KEY (`affiliate_id`) REFERENCES `oc_mta_affiliate` (`affiliate_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `oc_mta_order_product`
--
ALTER TABLE `oc_mta_order_product`
  ADD CONSTRAINT `mta_order_product_ibfk_1` FOREIGN KEY (`mta_order_id`) REFERENCES `oc_mta_order` (`mta_order_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `oc_mta_product`
--
ALTER TABLE `oc_mta_product`
  ADD CONSTRAINT `mta_product_ibfk_1` FOREIGN KEY (`mta_scheme_id`) REFERENCES `oc_mta_scheme` (`mta_scheme_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `oc_mta_product_affiliate`
--
ALTER TABLE `oc_mta_product_affiliate`
  ADD CONSTRAINT `mta_product_affiliate_ibfk_1` FOREIGN KEY (`affiliate_id`) REFERENCES `oc_mta_affiliate` (`affiliate_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mta_product_affiliate_ibfk_2` FOREIGN KEY (`mta_scheme_id`) REFERENCES `oc_mta_scheme` (`mta_scheme_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `oc_mta_product_default_scheme`
--
ALTER TABLE `oc_mta_product_default_scheme`
  ADD CONSTRAINT `mta_product_default_scheme_ibfk_1` FOREIGN KEY (`mta_scheme_id`) REFERENCES `oc_mta_scheme` (`mta_scheme_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `oc_mta_scheme_levels`
--
ALTER TABLE `oc_mta_scheme_levels`
  ADD CONSTRAINT `mta_scheme_level_ibfk_1` FOREIGN KEY (`mta_scheme_id`) REFERENCES `oc_mta_scheme` (`mta_scheme_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
