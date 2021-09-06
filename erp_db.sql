-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 05, 2021 at 10:13 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project2021_erp`
--
CREATE DATABASE IF NOT EXISTS `project2021_erp` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `project2021_erp`;

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` int(20) NOT NULL,
  `employee_id` varchar(200) NOT NULL,
  `activity` varchar(100) NOT NULL,
  `activity_details` varchar(500) NOT NULL,
  `activity_time_update` datetime NOT NULL,
  `activity_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `employee_id`, `activity`, `activity_details`, `activity_time_update`, `activity_date`) VALUES
(1, 'destinyb', 'attendance2', 'Resumption time and date : ', '2019-07-20 11:14:17', '2019-07-20 11:14:17'),
(2, 'destinyb', 'login', 'Your Last Login was ', '2019-07-21 09:42:46', '2019-07-20 11:22:20'),
(3, 'destinyb', 'attendance1', 'Resumption time and date : ', '2019-07-21 06:49:15', '2019-07-21 06:49:15'),
(4, 'destinyb', 'login', 'Your Last Login was ', '2019-07-21 09:42:46', '2019-07-21 09:31:14'),
(5, 'destinyb', 'attendance1', 'Resumption time and date : ', '2019-07-24 09:20:12', '2019-07-24 09:20:12'),
(6, 'destinyb', 'attendance1', 'Resumption time and date : ', '2019-08-02 15:16:19', '2019-08-02 15:16:19'),
(7, 'destinyb', 'attendance1', 'Resumption time and date : ', '2019-08-19 15:56:55', '2019-08-19 15:56:55'),
(8, 'destinyb', 'attendance1', 'Resumption time and date : ', '2019-09-02 16:33:57', '2019-09-02 16:33:57'),
(9, 'destinyb', 'attendance1', 'Resumption time and date : ', '2019-09-19 19:56:44', '2019-09-19 19:56:44'),
(10, 'destinyb', 'attendance1', 'Resumption time and date : ', '2019-10-02 13:25:34', '2019-10-02 13:25:34'),
(11, 'ebube', 'attendance2', 'Resumption time and date : ', '2021-09-05 16:50:35', '2021-09-05 16:50:35');

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `branch_id` int(11) NOT NULL,
  `branch_name` varchar(50) NOT NULL,
  `branch_address` varchar(100) NOT NULL,
  `branch_contact` varchar(50) NOT NULL,
  `skin` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`branch_id`, `branch_name`, `branch_address`, `branch_contact`, `skin`) VALUES
(1, 'OKIGWE ROAD', '69 Okigwe Road, Beside old PDP office, Owerri', '08033858041', 'red'),
(2, 'sdfv', 'sfv', 'dfv', 'dv');

-- --------------------------------------------------------

--
-- Table structure for table `budget`
--

CREATE TABLE `budget` (
  `id` int(200) NOT NULL,
  `budget` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL,
  `category` varchar(100) NOT NULL,
  `amount` varchar(80) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `budget`
--

INSERT INTO `budget` (`id`, `budget`, `description`, `category`, `amount`, `date_added`) VALUES
(1, 'Buying of Drugs', 'Testing Budgets', 'Purchase', '200000', '2019-07-23 20:09:33');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(20) NOT NULL,
  `sales_id` int(20) NOT NULL,
  `item_id` int(30) NOT NULL,
  `item` varchar(500) NOT NULL,
  `qty` int(20) NOT NULL DEFAULT 1,
  `unit_price` int(20) NOT NULL,
  `amount` int(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `sales_id`, `item_id`, `item`, `qty`, `unit_price`, `amount`) VALUES
(5, 7954498, 498, ' Waipa Act comprimes', 8, 600, 600);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cat_id`, `cat_name`) VALUES
(12, 'Cosmetics'),
(13, 'Paracetamol'),
(14, 'tablet'),
(15, 'syrup'),
(16, 'suspension'),
(17, 'supository'),
(18, 'spirit'),
(19, 'sanitary'),
(20, 'capsule'),
(21, 'cartheter'),
(22, 'cotton'),
(23, 'cream'),
(24, 'soap'),
(25, 'syringe'),
(26, 'urinebag'),
(27, 'gloves'),
(28, 'bandage'),
(29, 'beaverages'),
(30, 'blood tonic'),
(31, 'eye drop'),
(32, 'infusion'),
(33, 'inhaler'),
(34, 'injection'),
(35, 'needle'),
(36, 'ointment'),
(37, 'plaster'),
(38, 'yeast powder'),
(39, 'dripset'),
(40, 'drop'),
(41, 'gel'),
(42, 'lotion'),
(43, 'powder'),
(44, 'liniment'),
(45, 'shampoo'),
(46, 'ear drop'),
(47, 'Energy booster drink'),
(48, 'caplets'),
(49, 'codom'),
(50, 'liquid'),
(51, 'Antiseptic'),
(52, 'INSECTICID'),
(53, 'test strip'),
(54, 'disinfectant'),
(55, 'pad'),
(56, 'tissue'),
(57, 'wipes'),
(58, 'pampers'),
(59, 'water'),
(60, 'ANTACID'),
(61, 'GUM'),
(62, 'TOOTH PAST'),
(63, 'CEREAL'),
(64, 'baby milk'),
(65, 'liquid milk');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cust_id` int(11) NOT NULL,
  `cust_first` varchar(50) NOT NULL,
  `cust_last` varchar(30) NOT NULL,
  `cust_address` varchar(100) NOT NULL,
  `cust_contact` varchar(30) NOT NULL,
  `cust_email` varchar(200) NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `cust_pic` varchar(300) NOT NULL DEFAULT 'default_pix.png',
  `credit_status` varchar(10) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cust_id`, `cust_first`, `cust_last`, `cust_address`, `cust_contact`, `cust_email`, `balance`, `cust_pic`, `credit_status`) VALUES
(1, 'Christopher', 'Micheal', 'Los Angelos', '+41234323', 'chrismike@hotmail.com', '0.00', 'default_pix.png', '1'),
(2, 'Thedius', 'Boy', 'Imo State', '09083245337', 'babat@gmail.com', '0.00', 'default_pix.png', '1');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `exp_id` int(11) NOT NULL,
  `expenses_name` varchar(255) NOT NULL,
  `expenses_by` varchar(255) NOT NULL,
  `exp_amt` varchar(255) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `exp_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`exp_id`, `expenses_name`, `expenses_by`, `exp_amt`, `branch_id`, `exp_date`) VALUES
(3, 'trans from aba&fuel', 'chioma ahazie', '4100', 1, '2018-08-17 20:18:36'),
(4, 'By of Fuel', 'victor eze', '1000.00', 1, '2018-09-13 10:02:31'),
(5, 'staff trans', 'victor eze', '400.00', 1, '2018-09-13 10:03:37'),
(6, 'fedding', 'victor eze', '500.00', 1, '2018-09-13 10:04:09'),
(7, 'fuel', 'victor eze', '1500', 1, '2018-09-14 20:25:32'),
(8, 'staff trans', 'victor eze', '1000.00', 1, '2018-09-14 20:25:59'),
(9, 'office rent', 'victor eze', '25,000.00', 1, '2018-09-28 09:20:00'),
(10, 'printing of recipt ang stamp', 'victor eze', '9500.00', 1, '2018-09-28 09:21:13'),
(11, 'fuel for 10days', 'victor eze', '3,000.00', 1, '2018-09-28 09:22:30');

-- --------------------------------------------------------

--
-- Table structure for table `history_log`
--

CREATE TABLE `history_log` (
  `log_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) DEFAULT 0,
  `action` varchar(100) NOT NULL,
  `tag` varchar(100) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `history_log`
--

INSERT INTO `history_log` (`log_id`, `user_id`, `client_id`, `action`, `tag`, `date`) VALUES
(1, 1, 1, ' recorded sales invoice with number <strong>5448498</strong> for ', 'sales', '2019-07-23 15:59:30'),
(2, 1, 1, ' accepted payment for  sales in respect to invoice with saled id <strong>#5448498</strong> from ', 'payment', '2019-07-23 16:04:10'),
(3, 0, 0, ' : logged out of the system', 'login', '2019-07-24 09:20:05'),
(4, 1, 0, ' : logged in the system', 'login', '2019-07-24 09:20:12'),
(5, 1, 2, ' recorded sales invoice with number <strong>7595498</strong> for ', 'sales', '2019-07-24 19:23:03'),
(6, 1, 2, ' accepted payment for  sales in respect to invoice with saled id <strong>#7595498</strong> from ', 'payment', '2019-07-24 19:25:07'),
(7, 1, 2, ' accepted payment for  sales in respect to invoice with saled id <strong>#7595498</strong> from ', 'payment', '2019-07-24 19:25:07'),
(8, 1, 1, ' accepted payment for  sales in respect to invoice with saled id <strong>#5448498</strong> from ', 'payment', '2019-07-24 19:25:51'),
(9, 0, 0, ' : logged out of the system', 'login', '2019-08-02 15:16:12'),
(10, 1, 0, ' : logged in the system', 'login', '2019-08-02 15:16:19'),
(11, 0, 0, ' : logged out of the system', 'login', '2019-08-06 23:47:25'),
(12, 0, 0, ' : logged out of the system', 'login', '2019-08-19 15:56:47'),
(13, 1, 0, ' : logged in the system', 'login', '2019-08-19 15:56:55'),
(14, 1, 0, ' : logged out of the system', 'login', '2019-08-19 15:59:41'),
(15, 0, 0, ' : logged out of the system', 'login', '2019-09-02 16:33:49'),
(16, 1, 0, ' : logged in the system', 'login', '2019-09-02 16:33:58'),
(17, 0, 0, ' : logged out of the system', 'login', '2019-09-19 19:56:37'),
(18, 1, 0, ' : logged in the system', 'login', '2019-09-19 19:56:44'),
(19, 1, 0, ' : logged out of the system', 'login', '2019-09-19 19:56:54'),
(20, 0, 0, ' : logged out of the system', 'login', '2019-09-19 20:26:25'),
(21, 0, 0, ' : logged out of the system', 'login', '2019-09-19 20:30:17'),
(22, 0, 0, ' : logged out of the system', 'login', '2019-09-19 20:49:24'),
(23, 0, 0, ' : logged out of the system', 'login', '2019-10-02 13:25:24'),
(24, 1, 0, ' : logged in the system', 'login', '2019-10-02 13:25:34'),
(25, 0, 0, ' : logged out of the system', 'login', '2019-10-09 11:37:37'),
(26, 3, 0, ' : logged in the system', 'login', '2021-09-05 16:50:35'),
(27, 0, 0, ' : logged out of the system', 'login', '2021-09-05 18:04:53'),
(28, 3, 1, ' accepted payment for  sales in respect to invoice with saled id <strong>#5448498</strong> from ', 'payment', '2021-09-05 18:56:50');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(223) NOT NULL,
  `no_items` int(24) NOT NULL,
  `amount` int(233) NOT NULL,
  `order_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `no_items`, `amount`, `order_date`) VALUES
(548418, 2, 25500, '2019-07-24 19:18:44');

-- --------------------------------------------------------

--
-- Table structure for table `order_cart`
--

CREATE TABLE `order_cart` (
  `cart_id` int(20) NOT NULL,
  `order_id` int(20) NOT NULL,
  `item_id` int(30) NOT NULL,
  `item` varchar(500) NOT NULL,
  `qty` int(20) NOT NULL DEFAULT 1,
  `unit_price` int(20) NOT NULL,
  `amount` int(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `sales_id` int(11) DEFAULT NULL,
  `payment` varchar(255) NOT NULL,
  `amount` int(200) NOT NULL DEFAULT 0,
  `payment_date` datetime NOT NULL DEFAULT current_timestamp(),
  `modeofpayment` varchar(100) NOT NULL DEFAULT 'Cash <small>(Office Paypoint)</small>',
  `user_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL DEFAULT 1,
  `payment_type` varchar(100) DEFAULT 'Sales',
  `remaining` varchar(255) NOT NULL DEFAULT '0',
  `status` varchar(20) DEFAULT 'Paid',
  `or_no` int(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `cust_id`, `sales_id`, `payment`, `amount`, `payment_date`, `modeofpayment`, `user_id`, `branch_id`, `payment_type`, `remaining`, `status`, `or_no`) VALUES
(1, 1, 5448498, 'Payment made for product sales with invoice number <strong>#5448498</strong> on Tuesday 23rd July, 2019', 6000, '2019-07-23 16:04:10', 'Credit Card', 1, 1, 'Sales', '-7000', 'Paid', NULL),
(2, 2, 7595498, 'Payment made for product sales with invoice number <strong>#7595498</strong> on Wednesday 24th July, 2019', 9800, '2019-07-24 19:25:07', 'Cash <small>(Office Paypoint)</small>', 1, 1, 'Sales', '0', 'Paid', NULL),
(3, 2, 7595498, 'Payment made for product sales with invoice number <strong>#7595498</strong> on Wednesday 24th July, 2019', 9800, '2019-07-24 19:25:07', 'Cash <small>(Office Paypoint)</small>', 1, 1, 'Sales', '0', 'Paid', NULL),
(4, 1, 5448498, 'Payment made for product sales with invoice number <strong>#5448498</strong> on Wednesday 24th July, 2019', 4000, '2019-07-24 19:25:51', 'Mobile Transfer', 1, 1, 'Sales', '-3000', 'Paid', NULL),
(5, 1, 5448498, 'Payment made for product sales with invoice number <strong>#5448498</strong> on Sunday 5th September, 2021', 3000, '2021-09-05 18:56:50', 'Cash <small>(Office Paypoint)</small>', 3, 1, 'Sales', '0', 'Paid', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `prod_id` int(11) NOT NULL,
  `prod_name` varchar(100) NOT NULL,
  `prod_desc` varchar(500) NOT NULL,
  `prod_cost_price` decimal(10,2) NOT NULL,
  `prod_price` decimal(10,2) NOT NULL,
  `exp_date` varchar(100) NOT NULL,
  `prod_pic` varchar(300) NOT NULL DEFAULT 'default.png',
  `cat_id` int(11) NOT NULL,
  `prod_qty` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `reorder` int(11) NOT NULL DEFAULT 10,
  `supplier_id` int(11) NOT NULL,
  `serial` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`prod_id`, `prod_name`, `prod_desc`, `prod_cost_price`, `prod_price`, `exp_date`, `prod_pic`, `cat_id`, `prod_qty`, `branch_id`, `reorder`, `supplier_id`, `serial`) VALUES
(1, 'dfvdf rfbf', 'fdbfgdfbfb', '3456.00', '2356.00', '2021-09-14', 'default.png', 14, 356, 1, 10, 17, '356734');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_request`
--

CREATE TABLE `purchase_request` (
  `pr_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `order_id` int(200) NOT NULL,
  `qty` int(11) NOT NULL,
  `request_date` datetime NOT NULL DEFAULT current_timestamp(),
  `branch_id` int(11) NOT NULL DEFAULT 1,
  `purchase_status` varchar(10) NOT NULL DEFAULT 'ordered'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase_request`
--

INSERT INTO `purchase_request` (`pr_id`, `prod_id`, `order_id`, `qty`, `request_date`, `branch_id`, `purchase_status`) VALUES
(1, 18, 548418, 10, '2019-07-24 19:18:44', 1, 'ordered'),
(2, 19, 548418, 20, '2019-07-24 19:18:44', 1, 'ordered');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `sales_id` int(50) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cash_tendered` varchar(255) DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT 'Not Paid',
  `amount_due` varchar(255) NOT NULL,
  `cash_change` varchar(255) DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `branch_id` int(11) NOT NULL DEFAULT 1,
  `total` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`sales_id`, `cust_id`, `user_id`, `cash_tendered`, `payment_status`, `amount_due`, `cash_change`, `date_added`, `branch_id`, `total`) VALUES
(5448498, 1, 1, '13000', 'Paid', '0', NULL, '2019-07-23 15:59:27', 1, '13000'),
(7595498, 2, 1, '9800', 'Paid', '0', NULL, '2019-07-24 19:23:03', 1, '9800');

-- --------------------------------------------------------

--
-- Table structure for table `sales_details`
--

CREATE TABLE `sales_details` (
  `sales_details_id` int(11) NOT NULL,
  `sales_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales_details`
--

INSERT INTO `sales_details` (`sales_details_id`, `sales_id`, `prod_id`, `price`, `qty`) VALUES
(1, 5448498, 498, '600.00', 8),
(2, 5448498, 228, '2500.00', 2),
(3, 5448498, 208, '1600.00', 2),
(4, 7595498, 498, '600.00', 8),
(5, 7595498, 228, '2500.00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `stockin`
--

CREATE TABLE `stockin` (
  `stockin_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `qty` int(6) NOT NULL,
  `date` datetime NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stockin`
--

INSERT INTO `stockin` (`stockin_id`, `prod_id`, `qty`, `date`, `branch_id`) VALUES
(5, 28, 3, '2018-08-09 19:19:52', 1),
(6, 30, 3, '2018-08-09 19:22:26', 1),
(7, 22, 3, '2018-08-09 19:23:21', 1),
(8, 31, 2, '2018-08-09 19:24:45', 1),
(9, 32, 2, '2018-08-09 19:26:03', 1),
(10, 23, 3, '2018-08-09 19:26:21', 1),
(11, 33, 2, '2018-08-09 19:27:46', 1),
(12, 34, 10, '2018-08-09 19:29:42', 1),
(13, 35, 3, '2018-08-09 19:31:08', 1),
(14, 36, 10, '2018-08-09 19:33:00', 1),
(15, 37, 2, '2018-08-09 19:35:12', 1),
(16, 38, 10, '2018-08-09 19:36:44', 1),
(17, 21, 3, '2018-08-09 19:37:07', 1),
(18, 20, 6, '2018-08-09 19:37:44', 1),
(19, 39, 6, '2018-08-09 19:39:21', 1),
(20, 41, 10, '2018-08-09 19:42:09', 1),
(21, 40, 10, '2018-08-09 19:42:21', 1),
(22, 42, 5, '2018-08-09 19:46:18', 1),
(23, 43, 20, '2018-08-09 19:47:57', 1),
(24, 44, 6, '2018-08-09 19:50:04', 1),
(25, 45, 25, '2018-08-09 19:51:09', 1),
(26, 46, 10, '2018-08-09 19:54:02', 1),
(27, 47, 50, '2018-08-09 19:56:28', 1),
(28, 47, 50, '2018-08-09 19:57:24', 1),
(29, 22, 1, '2018-08-09 20:31:52', 1),
(30, 22, 1, '2018-08-09 20:33:20', 1),
(31, 48, 1, '2018-08-09 21:05:26', 1),
(32, 49, 1, '2018-08-09 21:05:52', 1),
(33, 50, 1, '2018-08-09 21:06:28', 1),
(34, 51, 1, '2018-08-09 21:22:08', 1),
(35, 51, 1, '2018-08-09 21:23:32', 1),
(36, 29, 3, '2018-08-09 21:34:52', 1),
(37, 24, 3, '2018-08-09 21:35:37', 1),
(38, 25, 3, '2018-08-09 21:37:18', 1),
(39, 52, 10, '2018-08-09 21:40:02', 1),
(40, 26, 3, '2018-08-09 21:45:47', 1),
(41, 42, 5, '2018-08-09 21:50:56', 1),
(42, 18, 2, '2018-08-09 21:52:57', 1),
(43, 19, 2, '2018-08-09 21:54:06', 1),
(44, 22, 50, '2018-08-09 22:24:02', 1),
(45, 53, 10, '2018-08-09 22:32:00', 1),
(46, 55, 10, '2018-08-09 22:50:33', 1),
(47, 54, 1, '2018-08-09 22:54:35', 1),
(48, 54, 1, '2018-08-09 22:55:57', 1),
(49, 56, 2, '2018-08-09 23:01:38', 1),
(50, 57, 30, '2018-08-09 23:51:18', 1),
(51, 58, 10, '2018-08-09 23:55:20', 1),
(52, 59, 4, '2018-08-10 00:04:31', 1),
(53, 60, 4, '2018-08-10 00:12:30', 1),
(54, 61, 10, '2018-08-10 00:16:30', 1),
(55, 62, 4, '2018-08-10 00:20:39', 1),
(56, 63, 6, '2018-08-10 00:24:12', 1),
(57, 64, 10, '2018-08-10 00:26:39', 1),
(58, 65, 4, '2018-08-10 00:34:10', 1),
(59, 66, 2, '2018-08-10 00:38:08', 1),
(60, 67, 2, '2018-08-10 00:42:11', 1),
(61, 68, 2, '2018-08-10 00:45:33', 1),
(62, 69, 2, '2018-08-10 00:48:04', 1),
(63, 70, 2, '2018-08-10 00:50:31', 1),
(64, 71, 2, '2018-08-10 00:52:32', 1),
(65, 72, 2, '2018-08-10 00:55:18', 1),
(66, 73, 1, '2018-08-10 00:59:44', 1),
(67, 74, 20, '2018-08-10 01:03:22', 1),
(68, 75, 2, '2018-08-10 01:06:54', 1),
(69, 76, 1, '2018-08-10 01:10:06', 1),
(70, 77, 5, '2018-08-10 01:15:44', 1),
(71, 78, 2, '2018-08-10 01:20:39', 1),
(72, 79, 5, '2018-08-10 01:24:48', 1),
(73, 80, 5, '2018-08-10 01:27:20', 1),
(74, 81, 3, '2018-08-10 01:32:10', 1),
(75, 82, 1, '2018-08-10 01:37:02', 1),
(76, 83, 1, '2018-08-10 01:40:29', 1),
(77, 84, 3, '2018-08-10 01:46:04', 1),
(78, 85, 5, '2018-08-10 01:49:38', 1),
(79, 86, 2, '2018-08-10 01:53:31', 1),
(80, 87, 2, '2018-08-10 01:55:49', 1),
(81, 88, 5, '2018-08-10 02:00:22', 1),
(82, 89, 2, '2018-08-10 02:07:59', 1),
(83, 90, 2, '2018-08-10 02:13:02', 1),
(84, 91, 3, '2018-08-10 02:21:18', 1),
(85, 92, 5, '2018-08-10 02:26:20', 1),
(86, 93, 3, '2018-08-10 02:29:58', 1),
(87, 94, 2, '2018-08-10 02:32:49', 1),
(88, 95, 20, '2018-08-10 02:36:47', 1),
(89, 96, 6, '2018-08-10 02:41:33', 1),
(90, 97, 4, '2018-08-10 02:44:49', 1),
(91, 98, 10, '2018-08-10 02:50:09', 1),
(92, 99, 10, '2018-08-10 02:53:21', 1),
(93, 100, 2, '2018-08-10 02:56:12', 1),
(94, 101, 3, '2018-08-10 03:02:37', 1),
(95, 102, 3, '2018-08-10 03:05:05', 1),
(96, 103, 3, '2018-08-10 03:07:35', 1),
(97, 104, 20, '2018-08-10 03:10:33', 1),
(98, 105, 30, '2018-08-10 03:15:54', 1),
(99, 106, 6, '2018-08-10 03:21:07', 1),
(100, 107, 3, '2018-08-10 03:24:26', 1),
(101, 108, 20, '2018-08-10 03:27:39', 1),
(102, 109, 20, '2018-08-10 03:30:36', 1),
(103, 109, 10, '2018-08-10 03:36:13', 1),
(104, 111, 5, '2018-08-10 03:41:15', 1),
(105, 112, 2, '2018-08-10 03:44:41', 1),
(106, 113, 2, '2018-08-10 03:50:38', 1),
(107, 114, 5, '2018-08-10 03:55:51', 1),
(108, 115, 5, '2018-08-10 03:58:47', 1),
(109, 116, 4, '2018-08-10 04:01:35', 1),
(110, 117, 3, '2018-08-10 17:06:42', 1),
(111, 118, 1, '2018-08-10 17:10:26', 1),
(112, 119, 1, '2018-08-10 17:13:33', 1),
(113, 120, 1, '2018-08-10 17:32:31', 1),
(114, 121, 10, '2018-08-10 17:37:14', 1),
(115, 122, 12, '2018-08-10 17:46:32', 1),
(116, 123, 2, '2018-08-10 17:51:25', 1),
(117, 124, 1, '2018-08-10 17:54:06', 1),
(118, 125, 1, '2018-08-10 17:57:04', 1),
(119, 126, 1, '2018-08-10 18:00:36', 1),
(120, 127, 2, '2018-08-10 18:03:06', 1),
(121, 128, 2, '2018-08-10 18:07:46', 1),
(122, 129, 1, '2018-08-10 18:18:44', 1),
(123, 130, 1, '2018-08-10 18:20:47', 1),
(124, 131, 1, '2018-08-10 18:23:47', 1),
(125, 132, 2, '2018-08-10 18:29:58', 1),
(126, 133, 2, '2018-08-10 18:34:55', 1),
(127, 134, 2, '2018-08-10 18:38:41', 1),
(128, 136, 3, '2018-08-10 18:43:55', 1),
(129, 137, 3, '2018-08-10 18:48:50', 1),
(130, 138, 3, '2018-08-10 18:52:51', 1),
(131, 139, 2, '2018-08-10 18:56:09', 1),
(132, 140, 12, '2018-08-10 19:17:18', 1),
(133, 141, 12, '2018-08-10 19:20:26', 1),
(134, 142, 6, '2018-08-10 19:24:12', 1),
(135, 143, 2, '2018-08-10 19:27:43', 1),
(136, 144, 2, '2018-08-10 19:30:49', 1),
(137, 145, 12, '2018-08-10 19:33:44', 1),
(138, 146, 24, '2018-08-10 19:41:19', 1),
(139, 147, 3, '2018-08-10 19:44:41', 1),
(140, 148, 3, '2018-08-10 19:48:18', 1),
(141, 149, 2, '2018-08-10 20:06:10', 1),
(142, 150, 3, '2018-08-10 20:08:58', 1),
(143, 151, 12, '2018-08-10 20:15:29', 1),
(144, 152, 5, '2018-08-10 20:19:52', 1),
(145, 153, 3, '2018-08-10 20:27:11', 1),
(146, 154, 3, '2018-08-10 20:32:25', 1),
(147, 155, 2, '2018-08-10 20:35:49', 1),
(148, 156, 2, '2018-08-10 20:39:26', 1),
(149, 157, 1, '2018-08-10 20:43:40', 1),
(150, 158, 12, '2018-08-10 20:48:08', 1),
(151, 159, 12, '2018-08-10 20:55:16', 1),
(152, 160, 2, '2018-08-10 21:02:11', 1),
(153, 161, 2, '2018-08-10 21:07:37', 1),
(154, 162, 2, '2018-08-10 21:22:28', 1),
(155, 163, 3, '2018-08-10 21:27:32', 1),
(156, 164, 10, '2018-08-10 21:36:24', 1),
(157, 165, 5, '2018-08-10 21:41:14', 1),
(158, 166, 1, '2018-08-10 21:44:53', 1),
(159, 167, 2, '2018-08-10 21:48:11', 1),
(160, 168, 2, '2018-08-10 21:52:53', 1),
(161, 169, 2, '2018-08-10 21:57:13', 1),
(162, 170, 2, '2018-08-10 22:01:39', 1),
(163, 171, 2, '2018-08-10 22:05:05', 1),
(164, 172, 2, '2018-08-10 22:08:09', 1),
(165, 173, 2, '2018-08-10 22:13:28', 1),
(166, 174, 2, '2018-08-10 22:16:34', 1),
(167, 175, 2, '2018-08-10 22:34:21', 1),
(168, 176, 10, '2018-08-10 22:37:35', 1),
(169, 177, 2, '2018-08-10 22:41:24', 1),
(170, 178, 2, '2018-08-10 23:03:35', 1),
(171, 179, 10, '2018-08-10 23:07:09', 1),
(172, 180, 10, '2018-08-10 23:10:05', 1),
(173, 181, 5, '2018-08-10 23:13:42', 1),
(174, 182, 5, '2018-08-10 23:17:48', 1),
(175, 183, 5, '2018-08-10 23:20:41', 1),
(176, 184, 5, '2018-08-10 23:24:18', 1),
(177, 185, 10, '2018-08-10 23:26:44', 1),
(178, 186, 10, '2018-08-10 23:28:31', 1),
(179, 187, 3, '2018-08-10 23:30:40', 1),
(180, 188, 10, '2018-08-10 23:33:17', 1),
(181, 189, 12, '2018-08-10 23:35:46', 1),
(182, 190, 10, '2018-08-10 23:38:31', 1),
(183, 191, 11, '2018-08-10 23:41:05', 1),
(184, 192, 6, '2018-08-10 23:43:48', 1),
(185, 193, 12, '2018-08-10 23:45:42', 1),
(186, 194, 10, '2018-08-10 23:48:21', 1),
(187, 195, 10, '2018-08-11 00:04:12', 1),
(188, 196, 3, '2018-08-11 00:08:23', 1),
(189, 197, 3, '2018-08-11 00:12:05', 1),
(190, 198, 1, '2018-08-11 00:16:15', 1),
(191, 199, 3, '2018-08-11 00:18:49', 1),
(192, 200, 3, '2018-08-11 00:20:52', 1),
(193, 201, 1, '2018-08-11 00:26:49', 1),
(194, 202, 2, '2018-08-11 00:30:42', 1),
(195, 203, 2, '2018-08-11 00:35:46', 1),
(196, 204, 2, '2018-08-11 00:38:14', 1),
(197, 205, 2, '2018-08-11 00:42:14', 1),
(198, 206, 4, '2018-08-11 00:44:56', 1),
(199, 207, 2, '2018-08-11 00:47:14', 1),
(200, 208, 2, '2018-08-11 00:50:10', 1),
(201, 209, 4, '2018-08-11 00:53:39', 1),
(202, 210, 2, '2018-08-11 00:57:56', 1),
(203, 211, 2, '2018-08-11 01:00:10', 1),
(204, 212, 4, '2018-08-11 01:03:20', 1),
(205, 213, 16, '2018-08-11 01:09:25', 1),
(206, 214, 2, '2018-08-11 01:12:22', 1),
(207, 215, 3, '2018-08-11 01:15:01', 1),
(208, 216, 5, '2018-08-11 01:17:52', 1),
(209, 217, 10, '2018-08-11 01:21:47', 1),
(210, 218, 2000, '2018-08-11 01:32:45', 1),
(211, 219, 4000, '2018-08-11 01:37:47', 1),
(212, 220, 12, '2018-08-11 01:41:10', 1),
(213, 222, 5, '2018-08-11 01:46:53', 1),
(214, 223, 10, '2018-08-11 01:55:42', 1),
(215, 224, 3, '2018-08-11 01:56:08', 1),
(216, 225, 5, '2018-08-11 02:01:09', 1),
(217, 226, 20, '2018-08-11 02:03:57', 1),
(218, 227, 3, '2018-08-11 02:07:47', 1),
(219, 228, 1, '2018-08-11 02:09:53', 1),
(220, 229, 6, '2018-08-11 02:12:19', 1),
(221, 230, 3, '2018-08-11 02:15:22', 1),
(222, 231, 1, '2018-08-11 02:19:07', 1),
(223, 232, 3, '2018-08-11 02:22:13', 1),
(224, 233, 4, '2018-08-11 02:26:17', 1),
(225, 234, 2, '2018-08-11 02:28:15', 1),
(226, 235, 10, '2018-08-11 02:34:45', 1),
(227, 236, 15, '2018-08-11 02:39:26', 1),
(228, 237, 2, '2018-08-11 02:44:16', 1),
(229, 238, 2, '2018-08-11 02:46:30', 1),
(230, 239, 3, '2018-08-11 02:50:27', 1),
(231, 240, 2, '2018-08-11 02:53:47', 1),
(232, 241, 2, '2018-08-11 02:57:14', 1),
(233, 242, 2, '2018-08-11 03:00:32', 1),
(234, 243, 8, '2018-08-11 03:05:10', 1),
(235, 145, 10, '2018-08-11 03:08:10', 1),
(236, 245, 10, '2018-08-11 03:12:34', 1),
(237, 246, 1, '2018-08-11 03:14:31', 1),
(238, 247, 10, '2018-08-11 03:22:27', 1),
(239, 248, 10, '2018-08-11 03:24:52', 1),
(240, 249, 5, '2018-08-11 03:28:44', 1),
(241, 250, 5, '2018-08-11 03:32:18', 1),
(242, 251, 5, '2018-08-11 03:36:33', 1),
(243, 252, 5, '2018-08-11 03:39:54', 1),
(244, 253, 4, '2018-08-11 03:44:22', 1),
(245, 254, 2, '2018-08-11 03:47:43', 1),
(246, 255, 6, '2018-08-11 03:52:08', 1),
(247, 257, 6, '2018-08-11 03:58:54', 1),
(248, 258, 20, '2018-08-11 04:02:57', 1),
(249, 259, 6, '2018-08-11 17:06:52', 1),
(250, 260, 6, '2018-08-11 17:10:47', 1),
(251, 261, 5, '2018-08-11 17:15:41', 1),
(252, 262, 3, '2018-08-11 17:18:58', 1),
(253, 263, 3, '2018-08-11 17:23:33', 1),
(254, 264, 12, '2018-08-11 17:28:42', 1),
(255, 22, 3, '2018-08-11 17:34:18', 1),
(256, 265, 1, '2018-08-11 17:45:38', 1),
(257, 266, 2, '2018-08-11 18:01:32', 1),
(258, 267, 2, '2018-08-11 18:04:28', 1),
(259, 268, 2, '2018-08-11 18:08:05', 1),
(260, 269, 2, '2018-08-11 18:15:22', 1),
(261, 270, 10, '2018-08-11 18:21:42', 1),
(262, 271, 10, '2018-08-11 18:25:36', 1),
(263, 272, 6, '2018-08-11 18:33:32', 1),
(264, 273, 10, '2018-08-11 18:40:00', 1),
(265, 274, 10, '2018-08-11 18:42:52', 1),
(266, 275, 4, '2018-08-11 18:45:53', 1),
(267, 276, 6, '2018-08-11 18:50:55', 1),
(268, 277, 2, '2018-08-11 18:55:01', 1),
(269, 278, 3, '2018-08-11 18:59:05', 1),
(270, 279, 2, '2018-08-11 19:01:53', 1),
(271, 280, 3, '2018-08-11 19:05:32', 1),
(272, 281, 2, '2018-08-11 19:08:39', 1),
(273, 282, 6, '2018-08-11 19:12:50', 1),
(274, 283, 3, '2018-08-11 19:17:32', 1),
(275, 284, 3, '2018-08-11 19:19:56', 1),
(276, 285, 2, '2018-08-11 19:23:33', 1),
(277, 286, 3, '2018-08-11 19:27:24', 1),
(278, 287, 3, '2018-08-11 19:30:58', 1),
(279, 288, 5, '2018-08-11 19:34:03', 1),
(280, 289, 3, '2018-08-11 19:36:33', 1),
(281, 290, 12, '2018-08-11 19:41:25', 1),
(282, 291, 3, '2018-08-11 19:45:21', 1),
(283, 292, 10, '2018-08-11 19:48:24', 1),
(284, 293, 1000, '2018-08-11 19:57:20', 1),
(285, 294, 6, '2018-08-11 20:03:10', 1),
(286, 295, 30, '2018-08-11 20:11:36', 1),
(287, 296, 2, '2018-08-11 20:21:40', 1),
(288, 297, 2, '2018-08-11 20:25:04', 1),
(289, 298, 5, '2018-08-11 20:30:47', 1),
(290, 299, 3, '2018-08-11 20:34:52', 1),
(291, 300, 40, '2018-08-11 20:40:08', 1),
(292, 301, 150, '2018-08-11 21:02:45', 1),
(293, 302, 150, '2018-08-11 21:05:21', 1),
(294, 303, 20, '2018-08-11 21:18:19', 1),
(295, 304, 20, '2018-08-11 21:20:27', 1),
(296, 305, 10, '2018-08-11 21:23:50', 1),
(297, 306, 20, '2018-08-11 21:29:21', 1),
(298, 307, 10, '2018-08-11 21:34:09', 1),
(299, 308, 12, '2018-08-11 21:40:16', 1),
(300, 309, 5, '2018-08-11 21:44:26', 1),
(301, 310, 20, '2018-08-11 21:49:42', 1),
(302, 311, 10, '2018-08-11 21:55:40', 1),
(303, 312, 2, '2018-08-11 21:58:51', 1),
(304, 313, 20, '2018-08-11 22:03:27', 1),
(305, 314, 20, '2018-08-11 22:12:20', 1),
(306, 315, 10, '2018-08-11 22:16:18', 1),
(307, 316, 5, '2018-08-11 22:20:26', 1),
(308, 317, 10, '2018-08-11 22:26:13', 1),
(309, 318, 20, '2018-08-11 22:34:58', 1),
(310, 319, 20, '2018-08-11 22:39:11', 1),
(311, 320, 25, '2018-08-11 22:43:28', 1),
(312, 321, 3, '2018-08-11 22:46:47', 1),
(313, 322, 3, '2018-08-11 22:53:32', 1),
(314, 323, 3, '2018-08-11 22:56:57', 1),
(315, 324, 1, '2018-08-11 23:00:13', 1),
(316, 325, 3, '2018-08-11 23:04:09', 1),
(317, 326, 3, '2018-08-11 23:09:46', 1),
(318, 327, 2, '2018-08-11 23:13:02', 1),
(319, 328, 3, '2018-08-11 23:15:52', 1),
(320, 329, 3, '2018-08-11 23:18:48', 1),
(321, 330, 2, '2018-08-11 23:23:25', 1),
(322, 331, 3, '2018-08-11 23:27:12', 1),
(323, 332, 2, '2018-08-11 23:30:44', 1),
(324, 334, 2, '2018-08-11 23:35:44', 1),
(325, 336, 3, '2018-08-11 23:40:51', 1),
(326, 337, 3, '2018-08-11 23:42:57', 1),
(327, 338, 36, '2018-08-11 23:49:39', 1),
(328, 339, 10, '2018-08-11 23:51:30', 1),
(329, 340, 10, '2018-08-11 23:57:05', 1),
(330, 341, 2, '2018-08-11 23:59:23', 1),
(331, 342, 10, '2018-08-12 00:01:19', 1),
(332, 343, 1, '2018-08-12 00:04:10', 1),
(333, 344, 2, '2018-08-12 00:07:00', 1),
(334, 345, 1, '2018-08-12 00:10:04', 1),
(335, 346, 5, '2018-08-12 00:14:52', 1),
(336, 347, 15, '2018-08-12 00:22:53', 1),
(337, 348, 30, '2018-08-12 00:26:10', 1),
(338, 349, 30, '2018-08-12 00:28:11', 1),
(339, 352, 3, '2018-08-12 00:40:14', 1),
(340, 351, 100, '2018-08-12 00:43:55', 1),
(341, 354, 5, '2018-08-12 00:51:24', 1),
(342, 355, 3, '2018-08-12 00:51:47', 1),
(343, 356, 10, '2018-08-12 00:54:14', 1),
(344, 357, 2, '2018-08-12 00:58:50', 1),
(345, 358, 3, '2018-08-12 01:02:41', 1),
(346, 359, 1, '2018-08-12 01:05:56', 1),
(347, 360, 5, '2018-08-12 01:08:26', 1),
(348, 361, 20, '2018-08-12 01:11:18', 1),
(349, 362, 20, '2018-08-12 01:13:38', 1),
(350, 363, 1, '2018-08-12 01:19:12', 1),
(351, 364, 2, '2018-08-12 01:22:44', 1),
(352, 365, 3, '2018-08-12 01:26:35', 1),
(353, 366, 1, '2018-08-12 01:29:22', 1),
(354, 367, 10, '2018-08-12 01:34:21', 1),
(355, 368, 24, '2018-08-12 01:38:26', 1),
(356, 369, 3, '2018-08-12 01:42:30', 1),
(357, 370, 3, '2018-08-12 01:45:12', 1),
(358, 371, 5, '2018-08-12 01:48:57', 1),
(359, 372, 5, '2018-08-12 01:52:39', 1),
(360, 373, 2, '2018-08-12 01:55:45', 1),
(361, 374, 3, '2018-08-12 01:57:42', 1),
(362, 375, 1, '2018-08-12 02:02:04', 1),
(363, 376, 10, '2018-08-12 02:06:55', 1),
(364, 377, 5, '2018-08-12 02:13:04', 1),
(365, 378, 4, '2018-08-12 02:15:22', 1),
(366, 379, 2, '2018-08-12 02:18:38', 1),
(367, 380, 20, '2018-08-12 02:25:40', 1),
(368, 381, 5, '2018-08-12 02:28:05', 1),
(369, 382, 5, '2018-08-12 02:32:31', 1),
(370, 383, 3, '2018-08-12 02:35:31', 1),
(371, 384, 3, '2018-08-12 02:38:22', 1),
(372, 385, 30, '2018-08-12 02:40:32', 1),
(373, 386, 9, '2018-08-12 02:44:22', 1),
(374, 387, 7, '2018-08-12 02:47:16', 1),
(375, 388, 2, '2018-08-12 02:48:56', 1),
(376, 389, 6, '2018-08-12 02:51:17', 1),
(377, 390, 15, '2018-08-12 02:53:37', 1),
(378, 391, 2, '2018-08-12 02:56:37', 1),
(379, 392, 36, '2018-08-12 02:58:52', 1),
(380, 393, 4, '2018-08-12 03:01:24', 1),
(381, 394, 36, '2018-08-12 03:04:37', 1),
(382, 395, 1000, '2018-08-12 03:06:30', 1),
(383, 396, 5, '2018-08-12 03:09:04', 1),
(384, 397, 5, '2018-08-12 03:11:50', 1),
(385, 398, 5, '2018-08-12 03:15:37', 1),
(386, 399, 3, '2018-08-12 03:17:30', 1),
(387, 400, 3, '2018-08-12 03:19:56', 1),
(388, 381, 2, '2018-08-12 03:22:10', 1),
(389, 402, 10, '2018-08-12 03:25:01', 1),
(390, 403, 3, '2018-08-12 03:27:02', 1),
(391, 405, 3, '2018-08-12 03:31:18', 1),
(392, 406, 4, '2018-08-12 03:34:28', 1),
(393, 407, 2, '2018-08-12 03:36:24', 1),
(394, 408, 1, '2018-08-12 03:42:34', 1),
(395, 409, 3, '2018-08-12 03:44:28', 1),
(396, 410, 1, '2018-08-12 03:46:42', 1),
(397, 411, 2, '2018-08-12 03:49:03', 1),
(398, 412, 5, '2018-08-12 03:51:57', 1),
(399, 413, 2, '2018-08-12 03:53:53', 1),
(400, 414, 2, '2018-08-12 03:55:53', 1),
(401, 415, 2, '2018-08-12 04:01:19', 1),
(402, 417, 73, '2018-08-12 04:08:53', 1),
(403, 418, 3, '2018-08-13 17:28:07', 1),
(404, 419, 2, '2018-08-13 17:46:33', 1),
(405, 420, 10, '2018-08-13 19:16:09', 1),
(406, 421, 12, '2018-08-13 20:09:02', 1),
(407, 141, 2, '2018-08-13 20:46:52', 1),
(408, 221, 5, '2018-08-13 21:01:52', 1),
(409, 350, 3, '2018-08-13 21:02:36', 1),
(410, 353, 10, '2018-08-13 21:08:47', 1),
(411, 335, 2, '2018-08-13 21:09:32', 1),
(412, 422, 2, '2018-08-13 21:40:08', 1),
(413, 145, 1, '2018-08-13 22:30:03', 1),
(414, 215, 1, '2018-08-13 22:30:59', 1),
(415, 110, 10, '2018-08-13 22:36:41', 1),
(416, 244, 10, '2018-08-13 22:41:02', 1),
(417, 423, 5, '2018-08-13 23:00:35', 1),
(418, 424, 20, '2018-08-13 23:20:08', 1),
(419, 406, 1, '2018-08-13 23:35:25', 1),
(420, 256, 5, '2018-08-14 00:13:41', 1),
(421, 425, 10, '2018-08-14 00:23:27', 1),
(422, 260, 2, '2018-08-14 00:27:50', 1),
(423, 404, 2, '2018-08-14 00:38:07', 1),
(424, 416, 2, '2018-08-14 00:38:40', 1),
(425, 401, 2, '2018-08-14 00:41:21', 1),
(426, 27, 1000, '2018-08-14 01:40:26', 1),
(427, 426, 24, '2018-08-14 03:01:18', 1),
(428, 427, 3, '2018-08-14 03:03:27', 1),
(429, 428, 3, '2018-08-14 03:05:34', 1),
(430, 429, 3, '2018-08-14 03:08:16', 1),
(431, 430, 3, '2018-08-14 03:16:10', 1),
(432, 431, 3, '2018-08-14 03:20:19', 1),
(433, 432, 6, '2018-08-14 03:22:37', 1),
(434, 433, 6, '2018-08-14 03:27:59', 1),
(435, 434, 6, '2018-08-14 03:28:16', 1),
(436, 435, 3, '2018-08-14 03:32:40', 1),
(437, 436, 3, '2018-08-14 03:37:13', 1),
(438, 437, 3, '2018-08-14 03:50:53', 1),
(439, 438, 10, '2018-08-14 03:57:52', 1),
(440, 439, 3, '2018-08-14 04:01:01', 1),
(441, 440, 5, '2018-08-14 18:50:31', 1),
(442, 440, 5, '2018-08-14 18:51:22', 1),
(443, 441, 6, '2018-08-14 18:55:30', 1),
(444, 442, 10, '2018-08-15 20:09:10', 1),
(445, 443, 3, '2018-08-16 18:50:23', 1),
(446, 445, 3, '2018-08-16 18:56:21', 1),
(447, 446, 12, '2018-08-16 19:03:28', 1),
(448, 444, 6, '2018-08-16 19:04:52', 1),
(449, 447, 10, '2018-08-17 00:20:13', 1),
(450, 449, 20, '2018-08-17 18:11:14', 1),
(451, 452, 6, '2018-08-19 10:51:13', 1),
(452, 494, 5, '2018-08-21 07:03:23', 1),
(453, 495, 5, '2018-08-21 07:10:24', 1),
(454, 496, 5, '2018-08-21 07:16:28', 1),
(455, 497, 5, '2018-08-21 07:27:02', 1),
(456, 498, 10, '2018-08-21 07:38:08', 1),
(457, 321, 5, '2018-08-21 07:44:47', 1),
(458, 497, 5, '2018-08-21 10:56:25', 1),
(459, 571, 2, '2018-09-01 18:11:27', 1),
(460, 573, 5, '2018-09-01 18:25:39', 1),
(461, 572, 2, '2018-09-01 18:32:31', 1),
(462, 574, 2, '2018-09-01 18:44:23', 1),
(463, 152, 1, '2018-09-11 01:41:10', 1),
(464, 521, 1, '2018-09-11 01:44:16', 1),
(465, 410, 1, '2018-09-11 01:46:45', 1),
(466, 450, 1, '2018-09-11 01:48:11', 1);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplier_id` int(11) NOT NULL,
  `supplier_name` varchar(100) NOT NULL,
  `supplier_address` varchar(300) NOT NULL,
  `supplier_contact` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplier_id`, `supplier_name`, `supplier_address`, `supplier_contact`) VALUES
(8, 'JAYMORR PHARMACY LTD', '7A OGBONNA RD, OFF 32 UMUODE RD ABA ABIA STATE', '08093714016'),
(9, 'STAMFORD PHARMACY LTD', '9A R0YCE ROAD OWERRI IMO STATE', '081856335333'),
(10, 'RECKITT BENCKISER NIG. LTD', '142 royce road owerri imo state', '0703603184'),
(11, 'DON HELEN PHARMACEUTICAL COMP. LTD', '41,JUBRILA STREET, IJESHATEDO, SURULERE LAGOS', '08035403037, 08033317340'),
(12, 'sons of the king', '16 g0spel line 0werri main market', '08064319443'),
(13, 'OLIVE&OLIVE MULTI SERVICES LTD.', '16 FREEDOM LINE OWERRI MAIN MARKET', '08037963071'),
(14, 'GRAMS PHARMACEUTICALS', '76 ROYCE ROAD OWERRI, IMO STATE', '083233251,08033303349'),
(15, 'KINGZY PHARAMACEUTICALS LTD', 'CORPORATE OFFICE;500 EASTWEST ROAD, RUMUODARA PH', '08034946900 08059013884'),
(16, 'PHARMACY PLUS', '18, MOJIDI STREET, OFF TOYIN STREET IKEJA LAGOS', '08036793239'),
(17, 'world wide commercial ventures', '13,fatai atere way, matori lagos', '08033710461 and GLORIA NDUBUIS 09053975324'),
(18, 'society for family health', 'owerri', '07037283106'),
(19, 'world wide commercial ventures', '13, fatai atere way, matori, lagos', '08056348029'),
(20, 'MRS. CHIYERE NURSE', 'OWERRI', '08062949863'),
(21, 'miral pharm ltd', 'owerri', '07086665350'),
(22, 'KK INVESTMENT', 'DOUGLAS MARKET', '08035757336'),
(23, 'sunsona pharmacy ltd', '10 mbari/item street ikenegbu- owerri', '1234'),
(24, 'GRAMS PHARMACEUTICALS', 'UDOBA FOUNDATION COMPLEX MCC ROAD BY METHODIS B/S OWERRI', '0803321790'),
(25, 'CKT INTERNATIONAL', 'OWERRI', '08162476131');

-- --------------------------------------------------------

--
-- Table structure for table `temp_trans`
--

CREATE TABLE `temp_trans` (
  `temp_trans_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `qty` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `term`
--

CREATE TABLE `term` (
  `term_id` int(11) NOT NULL,
  `sales_id` int(11) DEFAULT NULL,
  `payable_for` varchar(10) NOT NULL,
  `term` varchar(11) NOT NULL,
  `due` decimal(10,2) NOT NULL,
  `payment_start` date NOT NULL,
  `down` decimal(10,2) NOT NULL,
  `due_date` date NOT NULL,
  `interest` decimal(10,2) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `term`
--

INSERT INTO `term` (`term_id`, `sales_id`, `payable_for`, `term`, `due`, `payment_start`, `down`, `due_date`, `interest`, `status`) VALUES
(1, 8, '4', 'monthly', '113.30', '2017-02-21', '113.30', '2017-06-21', '16.50', ''),
(2, 9, '4', 'monthly', '113.30', '2017-02-21', '113.30', '2017-06-21', '16.50', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `branch_id` int(11) NOT NULL DEFAULT 1,
  `phone` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `designation` varchar(50) NOT NULL DEFAULT 'Sales Person',
  `asses_level` int(10) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_name`, `password`, `firstname`, `lastname`, `branch_id`, `phone`, `email`, `designation`, `asses_level`) VALUES
(1, 'destinyb', 'df29fc2e159bd79a6f43cd5b85a56206', 'Destiny', 'Brotobor', 1, '08163875505', 'destinybravos@gmail.com', 'Account Manager', 1),
(2, 'prettygal', 'b35664dbfc43cff24a2e39d10535a9ff', 'Silver', 'Pretty', 1, '08056453454', 'prettygal@gmail.com', 'Sales Person', 1),
(3, 'ebube', '25d55ad283aa400af464c76d713c07ad', 'ebube', 'ebube', 1, '08130075358', 'ebuberoderick2@gmail.com', 'sales person', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`branch_id`);

--
-- Indexes for table `budget`
--
ALTER TABLE `budget`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cust_id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`exp_id`);

--
-- Indexes for table `history_log`
--
ALTER TABLE `history_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_cart`
--
ALTER TABLE `order_cart`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`prod_id`);

--
-- Indexes for table `purchase_request`
--
ALTER TABLE `purchase_request`
  ADD PRIMARY KEY (`pr_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sales_id`);

--
-- Indexes for table `sales_details`
--
ALTER TABLE `sales_details`
  ADD PRIMARY KEY (`sales_details_id`);

--
-- Indexes for table `stockin`
--
ALTER TABLE `stockin`
  ADD PRIMARY KEY (`stockin_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `temp_trans`
--
ALTER TABLE `temp_trans`
  ADD PRIMARY KEY (`temp_trans_id`);

--
-- Indexes for table `term`
--
ALTER TABLE `term`
  ADD PRIMARY KEY (`term_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `branch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `budget`
--
ALTER TABLE `budget`
  MODIFY `id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `cust_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `exp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `history_log`
--
ALTER TABLE `history_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `order_cart`
--
ALTER TABLE `order_cart`
  MODIFY `cart_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `prod_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `purchase_request`
--
ALTER TABLE `purchase_request`
  MODIFY `pr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sales_details`
--
ALTER TABLE `sales_details`
  MODIFY `sales_details_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `stockin`
--
ALTER TABLE `stockin`
  MODIFY `stockin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=467;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `temp_trans`
--
ALTER TABLE `temp_trans`
  MODIFY `temp_trans_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `term`
--
ALTER TABLE `term`
  MODIFY `term_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
