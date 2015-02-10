-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 08, 2014 at 05:05 PM
-- Server version: 5.5.37
-- PHP Version: 5.4.6-1ubuntu1.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `odoothai`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add business', 7, 'add_business'),
(20, 'Can change business', 7, 'change_business'),
(21, 'Can delete business', 7, 'delete_business'),
(22, 'Can add contact', 8, 'add_contact'),
(23, 'Can change contact', 8, 'change_contact'),
(24, 'Can delete contact', 8, 'delete_contact'),
(25, 'Can add content_index', 9, 'add_content_index'),
(26, 'Can change content_index', 9, 'change_content_index'),
(27, 'Can delete content_index', 9, 'delete_content_index'),
(28, 'Can add image_slogan', 10, 'add_image_slogan'),
(29, 'Can change image_slogan', 10, 'change_image_slogan'),
(30, 'Can delete image_slogan', 10, 'delete_image_slogan'),
(31, 'Can add services', 11, 'add_services'),
(32, 'Can change services', 11, 'change_services'),
(33, 'Can delete services', 11, 'delete_services');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$12000$NKidB3SJN58t$NBu+O0MXkyGxhuwyNshOEf0ocAYolhVKObOX4bb/T7U=', '2014-08-08 06:18:17', 1, 'admin', '', '', 'jenneth.cha@gmail.com', 1, 1, '2014-08-07 08:13:48');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `business_business`
--

CREATE TABLE IF NOT EXISTS `business_business` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `short_desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `meta_keyword` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `meta_des` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `business_business`
--

INSERT INTO `business_business` (`id`, `name`, `description`, `short_desc`, `image`, `status`, `url`, `create_date`, `update_date`, `meta_keyword`, `meta_des`) VALUES
(2, 'Online shopping', '     การค้าขายผ่านทางเครือข่ายอินเทอร์เน็ต อินเทอร์เน็ตจะเปลี่ยนวิถีทางการดำรงชีวิตของทุกคน อินเทอร์เน็ต จะเปลี่ยนวิธีการศึกษาหาความรู้ อินเทอร์เน็ตจะเปลี่ยนวิธีการทำมาค้าขาย อินเทอร์เน็ตจะเปลี่ยนวิธีการหาความสุขสนุกสนาน อินเทอร์เน็ตจะเปลี่ยนทุกสิ่งทุกอย่าง และทุกสิ่งทุกอย่างจะรวมกันเข้ามาหาอินเทอร์เน็ต ', 'd', 'biz/None/image4_1.png', 'ACTIVE', 'onlineshopping', '2014-08-08 05:12:39', '2014-08-08 05:12:39', 'keyword', 'des'),
(3, 'Manufacturer', 'ระบบบริหารจัดการด้านการผลิตให้สอดคล้องกับความต้องการของลูกค้าแบบทันที โดยเน้นสร้างประสิทธิผลสูงสุด และลดการสูญเสียในวงจรการผลิตน้อยที่ระบบการผลิตแบบลีน (Lean Manufacturing System) คือ “ระบบการผลิตที่มุ่งเน้นในเรื่องการไหล (Flow) ของงานเป็นหลัก โดยทำการกำจัดความสูญเปล่า (Waste) ต่าง ๆ ของงาน และ เพิ่มคุณค่า (Value) ให้กับตัวสินค้าอย่างต่อเนื่อง เพื่อให้ลูกค้าเกิดความพึงพอใจสูงสุด (Customer Satisfaction)', 'ก', 'biz/None/image2.png', 'ACTIVE', 'manufacture', '2014-08-08 05:23:14', '2014-08-08 05:23:14', 'กก', 'หห'),
(4, 'd', 'd', 'd', 'biz/None/contact.jpg', 'ACTIVE', 'd', '2014-08-08 10:00:53', '2014-08-08 10:00:53', 'dd', 'des');

-- --------------------------------------------------------

--
-- Table structure for table `business_business_biz_ser`
--

CREATE TABLE IF NOT EXISTS `business_business_biz_ser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `services_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `business_id` (`business_id`,`services_id`),
  KEY `business_business_biz_ser_311726d6` (`business_id`),
  KEY `business_business_biz_ser_52f10e7c` (`services_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `business_business_biz_ser`
--

INSERT INTO `business_business_biz_ser` (`id`, `business_id`, `services_id`) VALUES
(6, 2, 5),
(7, 2, 6),
(12, 3, 6),
(13, 3, 7),
(14, 4, 5),
(15, 4, 6),
(16, 4, 7);

-- --------------------------------------------------------

--
-- Table structure for table `contact_contact`
--

CREATE TABLE IF NOT EXISTS `contact_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `Tel` varchar(50) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `business_id` int(11) NOT NULL,
  `message` varchar(500) NOT NULL,
  `status` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contact_contact_311726d6` (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `content_index_content_index`
--

CREATE TABLE IF NOT EXISTS `content_index_content_index` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Topic` varchar(300) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` varchar(8) NOT NULL,
  `type_topic` varchar(8) NOT NULL,
  `description` longtext NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `meta_keyword` varchar(500) NOT NULL,
  `meta_des` varchar(500) NOT NULL,
  `order` decimal(65,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `content_index_content_index`
--

INSERT INTO `content_index_content_index` (`id`, `Topic`, `image`, `status`, `type_topic`, `description`, `create_date`, `update_date`, `meta_keyword`, `meta_des`, `order`) VALUES
(1, 'What is Odoo', 'content/1/1.jpg', 'ACTIVE', 'What', 'Odoo is the fastest evolving business software in the world. Odoo has now a complete suite of business applications covering all business needs, from Website/Ecommerce down to manufacturing, inventory and accounting, all seamlessly integrated. It is the first time ever a software editor managed to reach such a functional coverage.', '2014-08-08 09:32:33', '2014-08-08 09:32:33', 'keyword', 'desc', 1),
(2, 'Benefit', 'content/2/2.jpg', 'ACTIVE', 'Benefit', 'Odoo is the fastest evolving business software in the world. Odoo has now a complete suite of business applications covering all business needs, from Website/Ecommerce down to manufacturing, inventory and accounting, all seamlessly integrated. It is the first time ever a software editor managed to reach such a functional coverage. ', '2014-08-08 09:42:46', '2014-08-08 09:42:46', 'keyword', 'desc', 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `user_id`, `content_type_id`, `object_id`, `object_repr`, `action_flag`, `change_message`) VALUES
(1, '2014-08-08 05:01:37', 1, 11, '5', 'd', 1, ''),
(2, '2014-08-08 05:10:09', 1, 11, '6', 'd', 1, ''),
(3, '2014-08-08 05:12:39', 1, 7, '2', 'business object', 1, ''),
(4, '2014-08-08 05:23:09', 1, 11, '7', 'Website Builder', 1, ''),
(5, '2014-08-08 05:23:14', 1, 7, '3', 'business object', 1, ''),
(6, '2014-08-08 06:18:32', 1, 7, '2', 'business object', 2, 'Changed url.'),
(7, '2014-08-08 06:27:23', 1, 11, '7', 'Website Builder', 2, 'Changed description and short_desc.'),
(8, '2014-08-08 06:28:32', 1, 11, '6', 'e-Commerce', 2, 'Changed name, description and short_desc.'),
(9, '2014-08-08 06:29:07', 1, 11, '5', 'Blogs', 2, 'Changed name and description.'),
(10, '2014-08-08 06:30:37', 1, 11, '5', 'Blogs', 2, 'Changed short_desc.'),
(11, '2014-08-08 06:32:46', 1, 7, '3', 'business object', 2, 'Changed url.'),
(12, '2014-08-08 06:33:28', 1, 7, '3', 'business object', 2, 'Changed biz_ser.'),
(13, '2014-08-08 06:33:48', 1, 7, '3', 'business object', 2, 'Changed biz_ser.'),
(14, '2014-08-08 09:23:35', 1, 11, '5', 'Blogs', 2, 'Changed category and url.'),
(15, '2014-08-08 09:23:47', 1, 11, '6', 'e-Commerce', 2, 'Changed category and url.'),
(16, '2014-08-08 09:24:00', 1, 11, '7', 'Website Builder', 2, 'Changed category and url.'),
(17, '2014-08-08 09:26:40', 1, 11, '5', 'Blogs', 2, 'Changed image_ss.'),
(18, '2014-08-08 09:26:47', 1, 11, '5', 'Blogs', 2, 'Changed image.'),
(19, '2014-08-08 09:26:55', 1, 11, '5', 'Blogs', 2, 'Changed image and image_ss.'),
(20, '2014-08-08 09:28:02', 1, 11, '5', 'Blogs', 2, 'Changed image.'),
(21, '2014-08-08 09:28:07', 1, 11, '5', 'Blogs', 2, 'Changed image.'),
(22, '2014-08-08 09:28:49', 1, 11, '5', 'Blogs', 2, 'Changed image and image_ss.'),
(23, '2014-08-08 09:28:58', 1, 11, '5', 'Blogs', 2, 'Changed image and image_ss.'),
(24, '2014-08-08 09:32:33', 1, 9, '1', 'content_index object', 1, ''),
(25, '2014-08-08 09:42:46', 1, 9, '2', 'content_index object', 1, ''),
(26, '2014-08-08 09:43:42', 1, 9, '1', 'content_index object', 2, 'Changed image.'),
(27, '2014-08-08 09:43:46', 1, 9, '1', 'content_index object', 2, 'Changed image.'),
(28, '2014-08-08 09:43:50', 1, 9, '2', 'content_index object', 2, 'Changed image.'),
(29, '2014-08-08 09:43:53', 1, 9, '2', 'content_index object', 2, 'Changed image.'),
(30, '2014-08-08 09:47:46', 1, 10, '1', 'image_slogan object', 1, ''),
(31, '2014-08-08 10:00:53', 1, 7, '4', 'business object', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `name`, `app_label`, `model`) VALUES
(1, 'log entry', 'admin', 'logentry'),
(2, 'permission', 'auth', 'permission'),
(3, 'group', 'auth', 'group'),
(4, 'user', 'auth', 'user'),
(5, 'content type', 'contenttypes', 'contenttype'),
(6, 'session', 'sessions', 'session'),
(7, 'business', 'business', 'business'),
(8, 'contact', 'contact', 'contact'),
(9, 'content_index', 'content_index', 'content_index'),
(10, 'image_slogan', 'image_slogan', 'image_slogan'),
(11, 'services', 'services', 'services');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('4ky5tvfdh5ea5nqya0ochb82mpu4264h', 'MmU1MDY1ZWNjN2UxMjczOTM3YTM2ZjY3ZTI0MWRhNDM0YTk5YTYwYzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=', '2014-08-22 04:50:38'),
('s4zmlcggd1h8ppo7huawlsvz395q6c7l', 'MmU1MDY1ZWNjN2UxMjczOTM3YTM2ZjY3ZTI0MWRhNDM0YTk5YTYwYzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=', '2014-08-22 06:18:17');

-- --------------------------------------------------------

--
-- Table structure for table `image_slogan_image_slogan`
--

CREATE TABLE IF NOT EXISTS `image_slogan_image_slogan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `images` varchar(255) DEFAULT NULL,
  `slogan` varchar(200) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `status` varchar(8) NOT NULL,
  `meta_keyword` varchar(500) NOT NULL,
  `meta_desc` varchar(500) NOT NULL,
  `order` decimal(65,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `image_slogan_image_slogan`
--

INSERT INTO `image_slogan_image_slogan` (`id`, `images`, `slogan`, `create_date`, `modified_date`, `status`, `meta_keyword`, `meta_desc`, `order`) VALUES
(1, 'news/None/slide_1.jpg', 'Odoo', '2014-08-08 16:47:42', '2014-08-08 16:47:43', 'ACTIVE', 'd', 'd', 2);

-- --------------------------------------------------------

--
-- Table structure for table `services_services`
--

CREATE TABLE IF NOT EXISTS `services_services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `image_ss` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `short_desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `meta_keyword` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `meta_des` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `services_services`
--

INSERT INTO `services_services` (`id`, `name`, `category`, `image`, `image_ss`, `description`, `short_desc`, `status`, `url`, `create_date`, `update_date`, `meta_keyword`, `meta_des`) VALUES
(5, 'Blogs', 'Apps to build stunning website', 'service/5/contact.jpg', 'ss/5/image2.png', '\r\n\r\nAwesome Open Source Blogging Platform\r\nWrite, design, promote, engage\r\n\r\nOdoo มีระบบ Blogging platform ให้คุณสามารถสร้าง Blog สำหรับธุรกิจของคุณได้\r\nคุณสามารถออกแบบ Blog ที่สวยงามเพื่อดึงดูดลูกค้าของคุณได้ง่ายดาย เพียงแค่ edit เท่านั้น\r\nอีกทั้งยังสามารถแปลไปเป็นภาษาอื่นๆอีกหลายภาษาโดยอัตโนมัติอีกด้วย		\r\n\r\nระบบ Blogging ของ Odoo รองรับระบบ Live chat ที่ทำให้คุณสามารถติดต่อสื่อสารกับลูกค้าของคุณได้ในแบบ real time \r\nมีการเชื่อมต่อกับ Social network เช่น Twitter ทำให้การติดต่อกับผู้เข้าเยี่ยมชม Blog เป็นเรื่องที่ง่ายขึ้นไปอีก\r\nอีกทั้งยังมีระบบ SEO ทำให้ Blog ของคุณจะได้รับการออกแบบให้รองรับผู้เข้าเยี่ยมได้อย่างเต็มประสิทธิภาพ', 'ดึงดูดกลุ่มลูกค้าด้วยกลยุทธ์ทางการตลาดที่มีประสิทธิภาพ', 'ACTIVE', 'Blogs', '2014-08-08 05:01:37', '2014-08-08 05:01:37', 'dd', 'd'),
(6, 'e-Commerce', 'Apps to boost your sale', 'service/None/bg_1.jpg', 'ss/None/1.jpg', 'e-commerces\r\n\r\nFull-featured e-Commerce\r\nOptimize sales with an awesome online store\r\nด้วยระบบ e-Commerce ของ Odoo จะทำให้การทำงานเกี่ยวกับ e-Commerce ของคุณง่ายดายมากขึ้น\r\nคุณไม่จำเป็นต้องลงโปรแกรมใดๆเพิ่มเติม เพื่อจัดการกับ คลังสินค้า, การขายสินค้า หรือ ระบบบัญชี\r\nทุกๆอย่างได้ถุกรวบรวมมาไว้ในระบบของ Odoo แล้ว คุณสามารถจัดการงานทุกอย่างได้ที่จุดทำงานเพียงจุดเดียว \r\n\r\nด้วย Interface ที่ใช้งานได้ง่าย ทำให้คุณไม่จำเป็นต้องเรียนรู้อะไรเพิ่มเติม คุณสามารถจัดการ content ในเว็บไซต์ของคุณได้อย่างง่ายดาย\r\n\r\nระบบ e-Commerce ของ Odoo ได้มีการ  integrate Google Analytics เพื่อที่คุณจะได้วิเคราะห์กลยุทธิ์ทางการตลาด \r\nและยังเข้าถึง Social Media ต่างๆได้อย่างรวดเร็วอีกด้วย', 'เพิ่มยอดขายออนไลน์ด้วยเพจขายสินค้า', 'ACTIVE', 'eCommerce', '2014-08-08 05:10:09', '2014-08-08 05:10:09', 'ก', 'ก'),
(7, 'Website Builder', 'Apps to run your business', 'service/None/contact.jpg', 'ss/None/4.jpg', '\r\nEdit Anything Inline\r\nWhat you see is what you get. Really!\r\n\r\nCreate beautiful websites with no technical knowledge. Odoo''s unique ''edit inline'' approach makes creating a website surprisingly easy. No more complex backend; just click and change any content anywhere you need.\r\nสร้างเว็บไซต์ที่สวยงามโดยไม่จำเป็นต้องมีความรู้มาก่อน \r\nOdoo ใช้เทคนิค edit inline ทำให้สามารถสร้างเว็บไซต์ได้ง่าย\r\nเพียงแค่คลิก และเปลี่ยนเนื้อหาของเว็บไซต์ตามที่คุณต้องการ\r\n\r\nChange the price of a product. Put a title in bold. Come up with a blog subtitle. Do all of these on the go by just clicking and changing. It''s that simple.\r\nการเปลี่ยนราคาสินค้า, สร้าง title หรือ สร้าง blog \r\nสามารถทำได้โดยง่าย เพียงแค่คลิก และเปลี่ยนเนื้อหาเว็บไซต์\r\n\r\n\r\n\r\nAwesome. Astonishingly Beautiful.\r\nSimple design using clean building blocks\r\n\r\nOdoo''s building blocks allow you to design modern websites from scratch. It''s extremely simple compared to the way other website builders work.\r\nOdoo''s building blocks มีเครื่องมือที่ช่วยให้คุณสามารถออกแบบเว็บไซต์ได้อย่างสวยงาม และง่ายต่อการใช้งานเปรียบเทียบกับการสร้างเว็บไซต์แบบอื่นๆ \r\n\r\nWhether it''s for products descriptions, blogs or static pages, you don''t need to be a professional designer to create clean content when using Odoo.\r\nไม่ว่าจะเป็นการสร้างคำอธิบายสินค้า, blogs หรือหน้าเว็บเพจแบบ static  ก็สามารถทำได้อย่างง่ายดาย\r\n\r\nJust drag, drop and customize default building blocks.\r\nเพียงแค่ลาก, ดรอป และ ปรับเปลี่ยนเนื้อหาภายใน default building blocks เท่านั้น\r\n\r\n\r\n\r\n\r\nNo synchronization. Full integration.\r\nEnterprise-ready, out-of-the-box\r\n\r\nActivate ready-to-use enterprise features in just a click; e-commerce, call-to-actions, job announcements, events, customer references, blogs, newsletter registration, etc.\r\nEnterprise Features พร้อมใช้งานมากมาย ใช้ง่ายเพียงแค่คลิก เช่น e-commerce, call-to-actions, job annoucements, events, customer references, blogs, newsleltter registration และอื่นๆมากมาย\r\n\r\nTraditional eCommerce and CMS provide little integration with other systems because it''s not their core focus. With Odoo''s integration, you benefit from the best management software to follow up on your orders, job applicants, leads and much more - all in an instant. \r\neCommerce และ CMS \r\nระบบ eCommerce และ CMS มีการอินทิเกรตกับระบบอื่น เพียงเล็กน้อยเท่านั้น   \r\nOdoo เป็น software สำหรับการบริหารจัดการที่ดีกว่า มีประสิทธิภาพมากกว่า สำหรับการจัดการ orders, job apllicants, leads และอื่นๆอีกมากมาย\r\n\r\n\r\n\r\nGreat Mobile Experience\r\nResponsive content on all pages\r\n\r\nGet a mobile friendly website thanks to our responsive design. All your pages adapt automatically to the screen size on a mobile phone, tablet or desktop computer.\r\nสร้างเว็บไซต์ที่เหมาะสมกับทุก platform (โทรศัพท์มือถือ, tablet) โดยใช้ responsive design  \r\nทุกหน้าเพจเว็บไซต์ของคุณ จะถูกปรับไซส์ขนาดหน้าจอให้พอดี ไม่ว่าจะเป็นบนโทรศัพท์มือถือ, tablet หรือ คอมพิวเตอร์ desktop \r\n\r\nYou don''t have to worry about if your website works when it''s not being accessed from a desktop computer. With Odoo, your website and all the changes you make to it are instantly mobile friendly.\r\nคุณไม่ต้องกังวลว่าเว็บไซต์ของคุณจะใช้งานไม่ได้ หากไม่ได้เปิดบนคอมพิวเตอร์ desktop \r\nด้วยการใช้ Odoo เว็บไซต์ของคุณจะสามารถเปิดได้บนทุก platform \r\n\r\n\r\n\r\nAttract More Visitors\r\nSEO tools at your fingertips\r\nOdoo''s "Promote" tool suggests keywords according to the most searched terms on Google. Search Engine Optimization tools are ready-to-use, with no configuration required.\r\nOdoo''s "Promote" tool สามารถแนะนำ keywords ที่ได้รับการค้นหาบ่อยบน Google ให้กับเว็บไซต์ของคุณ เพื่อการทำ Seacrh Engine Optimization ที่มีประสิทธิภาพ และไม่จำเป็นต้องทำการติดตั้งใดๆ  \r\n\r\nGoogle Analytics tracks your shopping carts by default. Sitemap and structured content are created automatically for Google indexing.\r\nSitemap และเนื้อหาภายในเว็บไซต์ของคุณ จะถูกสร้างให้เหมาะสมกับ Google indexing โดยอัตโนมัติ \r\n\r\n\r\n\r\nMulti Language Made Easy\r\nRapid automatic translations\r\n\r\nGet your website translated to a professional standard in multiple languages with no effort. Benefit from professional translators to translate all your content automatically with the Gengo integration.\r\nเนื้อหาบนเว็บไซต์ของคุณสามารถแปลได้หลายภาษา และอยู่ในระดับภาษาทีมีมาตรฐานโดยอัตโนมัติ \r\n\r\nWhen you edit the master page, Odoo makes the same changes in all other languages in just a few hours.\r\nเมื่อคุณทำการแก้ไขเนื้อหาในเว็บไซต์ของคุณ เนื้อหาในเว็บไซต์ในภาษาอื่นทั้งหมด จะถูกแก้ไขด้วยเช่นกันภายในเวลาไม่กี่ชั่วโมง \r\n\r\n\r\n\r\n\r\nTemplates Fully Based on Bootstrap\r\nDesigners love working with Odoo\r\nOdoo templates are easy to design. You don''t need to develop anything to create new pages, banners, themes or building blocks. We use a clean HTML structure, a bootstrap CSS.\r\nOdoo templates ง่ายต่อการออกแบบ คุณไม่จำเป็นต้องใช้โปรแกรมยุ่งยากในการสร้าง หน้าเพจใหม่, banners, themes หรือ building blocks \r\nใช้เพียงแค่ HTML structure และ bootstrap CSS เท่านั้น\r\n\r\nCustomize every page on the fly with the integrated template editor. Distribute your work easily as an Odoo module.\r\nออกแบบและแก้ไขหน้าเพจทุกหน้าอย่างง่ายดาย โดยใช้ integrated template editor  \r\n\r\n\r\n\r\n\r\n\r\n\r\nFluid Grid Layout\r\nOrganize building blocks easily\r\n\r\nDesign perfect pages by using drag and drop building blocks. Move and scale them to fit into the layout you want.\r\nออกแบบหน้าเว็บไซต์ที่สวยงาม โดยการ drag และ drop ปรับ scale ให้ตรงกับขนาดที่คุณต้องการ \r\n\r\nBuilding blocks are based on a responsive, mobile friendly fluid grid system that appropriately scales up to 12 columns as the device or viewport size increases.\r\nBuilding blocks ถูกออกแบบมาแบบ responsive ทำให้เหมาะสมกับการใช้งานบนโทรศัพท์มือถือ และอุปกรณ์พกพา ทุก platform\r\n\r\n\r\n\r\nProfessional Themes\r\nChange themes in just a click\r\nDesign a customized theme or go for one of the ready-to-use themes to achieve the look and feel you want for your website. Any changes you want are just a click away.\r\nออกแบบ theme ใหม่ หรือเลือก theme ที่มีให้อยู่แล้ว เพื่อตกแต่งและสร้างบรรยากาศให้เว็บไซต์ของคุณ เพียงแค่คลิกเท่านั้น\r\n\r\n', 'สร้างเว็บไซต์คุณภาพ ดัดแปลงได้ตามความต้องการ เหมาะสมกับ SEO  (Search Engine Optimization)', 'ACTIVE', 'WebsiteBuilder', '2014-08-08 05:23:09', '2014-08-08 05:23:09', 'ก', 'ก');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `business_business_biz_ser`
--
ALTER TABLE `business_business_biz_ser`
  ADD CONSTRAINT `business_id_refs_id_08869545` FOREIGN KEY (`business_id`) REFERENCES `business_business` (`id`),
  ADD CONSTRAINT `services_id_refs_id_d7b14a07` FOREIGN KEY (`services_id`) REFERENCES `services_services` (`id`);

--
-- Constraints for table `contact_contact`
--
ALTER TABLE `contact_contact`
  ADD CONSTRAINT `business_id_refs_id_b8f2b660` FOREIGN KEY (`business_id`) REFERENCES `business_business` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `user_id_refs_id_c0d12874` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
