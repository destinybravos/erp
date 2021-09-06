-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 24, 2019 at 08:46 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `erp`
--
CREATE DATABASE IF NOT EXISTS `erp` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `erp`;

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
(5, 'destinyb', 'attendance1', 'Resumption time and date : ', '2019-07-24 09:20:12', '2019-07-24 09:20:12');

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
(1, 'OKIGWE ROAD', '69 Okigwe Road, Beside old PDP office, Owerri', '08033858041', 'red');

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
(8, 1, 1, ' accepted payment for  sales in respect to invoice with saled id <strong>#5448498</strong> from ', 'payment', '2019-07-24 19:25:51');

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
(4, 1, 5448498, 'Payment made for product sales with invoice number <strong>#5448498</strong> on Wednesday 24th July, 2019', 4000, '2019-07-24 19:25:51', 'Mobile Transfer', 1, 1, 'Sales', '-3000', 'Paid', NULL);

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
  `prod_pic` varchar(300) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `prod_qty` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `reorder` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `serial` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`prod_id`, `prod_name`, `prod_desc`, `prod_cost_price`, `prod_price`, `exp_date`, `prod_pic`, `cat_id`, `prod_qty`, `branch_id`, `reorder`, `supplier_id`, `serial`) VALUES
(18, 'rhinathiol adult', 'adult', '850.00', '1100.00', '2020-05-01', 'default.gif', 15, 2, 1, 2, 8, '3582910032892'),
(19, 'rhinathiol', 'infant', '850.00', '1100.00', '2020-02-01', 'default.gif', 15, 2, 1, 2, 8, '3582910061397'),
(20, 'chericof', 'cough formular', '250.00', '350.00', '2020-04-01i', 'default.gif', 15, 6, 1, 6, 8, '6788766'),
(21, 'avrocof infant', 'cough', '170.00', '250.00', '2021-02-01', 'default.gif', 15, 3, 1, 3, 8, '6788709'),
(22, 'ascorex', 'expectorant', '370.00', '550.00', '2019-10-01', 'default.gif', 15, 7, 1, 9, 8, '8904091116201'),
(23, 'avrocof adult', 'cough', '170.00', '350.00', '2020-03-01', 'default.gif', 15, 3, 1, 3, 8, '9453e78'),
(24, 'novalyn child', 'infant', '400.00', '250.00', '2020-09-01', 'default.gif', 15, 3, 1, 3, 8, '67450ui'),
(25, 'novalyn lintus', 'adult', '200.00', '400.00', '2020-12-01', 'default.gif', 15, 3, 1, 3, 8, '867876544'),
(26, 'neofylin', 'sirop', '250.00', '350.00', '2021-04-01', 'default.gif', 15, 3, 1, 3, 8, '567888'),
(27, 'salbutamol', 'tablet', '0.90', '5.00', '2021-09-01', 'default.gif', 14, 932, 1, 1000, 8, '8904181402719'),
(28, 'asmalyn', 'syrup', '280.00', '400.00', '2021-04-01', 'default.gif', 15, 3, 1, 3, 8, '659436289901'),
(29, 'ventolin inhaler', 'inhaler', '1150.00', '1500.00', '2010-11-01', 'default.gif', 33, 1, 1, 3, 8, '8907676'),
(30, 'rophegan', 'elixir', '160.00', '330.00', '2020-11-01', 'default.gif', 15, 3, 1, 3, 8, '6766677'),
(31, 'floxapen', 'flucloxacillin', '800.00', '1200.00', '2020-12-01', 'default.gif', 16, 2, 1, 2, 8, '8901040122092'),
(32, 'mextil', 'suspension', '900.00', '1400.00', '2019-08-01', 'default.gif', 16, 2, 1, 2, 8, '23rejj8'),
(33, 'cefuroxime', 'cefuroxime', '1000.00', '1500.00', '2019-11-01', 'default.gif', 16, 2, 1, 2, 8, '6759877'),
(34, 'doxycap 100mg', 'capsules 100mg', '180.00', '270.00', '2020-12-31', 'default.gif', 20, 7, 1, 10, 8, 'UDOX06'),
(35, 'rexifen susp', 'suspension', '200.00', '350.00', '2020-06-01', 'default.gif', 16, 3, 1, 3, 8, '098098'),
(36, 'sureclofen forte', 'sodium caplet', '25.00', '100.00', '2021-02-01', 'default.gif', 14, 7, 1, 10, 8, '67576888'),
(37, 'ciprogem', 'ciprofloxacin', '1100.00', '1850.00', '2023-02-01', 'default.gif', 14, 1, 1, 2, 8, '7y6789'),
(38, 'cloflam 50', 'cloflam', '50.00', '200.00', '2020-10-01', 'default.gif', 14, 6, 1, 10, 8, '5647455'),
(39, 'panda syrup', 'sirop', '130.00', '250.00', '2021-03-01', 'default.gif', 15, 6, 1, 6, 8, 'ghghgh56'),
(40, 'paracetamol', 'emzor', '120.00', '250.00', '2021-03-01', 'default.gif', 15, 9, 1, 10, 8, '6154000033026'),
(41, 'M&B paracetamol syrup', 'm&B', '120.00', '250.00', '2020-5-1', 'default.gif', 15, 8, 1, 10, 8, '6034000062021'),
(43, 'lofnac 100', 'lofnac', '60.00', '200.00', '2019-09-01', 'default.gif', 14, 19, 1, 20, 8, '8906009232225'),
(44, 'panda drop', 'panda drop', '130.00', '200.00', '2021-03-01', 'default.gif', 40, 4, 1, 6, 8, '67ytyj'),
(45, 'mixadin', 'cough tablet', '48.00', '100.00', '2021-05-01', 'default.gif', 14, 21, 1, 25, 8, '8995858190756'),
(46, 'neurovit forte', 'vitamin B1', '540.00', '650.00', '2020-10-01', 'default.gif', 14, 4, 1, 10, 8, 'UNEU02'),
(47, 'procold', 'procold', '54.00', '100.00', '2020-08-01', 'default.gif', 14, 40, 1, 50, 8, 'y675766'),
(48, 'co-diovan 160/12,5', '160/12,5', '2850.00', '3500.00', '2020-02-01', 'default.gif', 14, 2, 1, 2, 8, '234556'),
(49, 'co-diovan 80/12,5', '80/12,5', '2350.00', '2850.00', '2020-12-01', 'default.gif', 14, 2, 1, 2, 8, '8976'),
(50, 'diovan', '160', '2850.00', '3450.00', '2020-08-01', 'default.gif', 14, 2, 1, 2, 8, '566778'),
(51, 'diovan 80', '80', '2350.00', '2800.00', '2020-04-01', 'default.gif', 14, 2, 1, 2, 8, '34216'),
(52, 'voltaren retard', 'voltaren100', '780.00', '1000.00', '2022-05-01', 'default.gif', 14, 9, 1, 10, 8, '256547'),
(53, 'normoretic', 'norm', '125.00', '300.00', '2020-02-01', 'default.gif', 14, 7, 1, 10, 8, 'hjj8776'),
(54, 'norvasc 5MG', '5mg', '1400.00', '1050.00', '2019-08-01', 'default.gif', 14, 6, 1, 6, 8, '111234'),
(55, 'norvasc tm 10MG', '10mg', '1480.00', '1750.00', '2020-05-01', 'default.gif', 14, 9, 1, 10, 8, '5437865'),
(56, 'aldactone', '25mg', '600.00', '800.00', '2020-11-01', 'default.gif', 14, 2, 1, 6, 8, '564789'),
(57, 'vasoprin', '75mg', '18.00', '30.00', '2021-03-01', 'default.gif', 14, 5, 1, 30, 8, '6156000045627'),
(58, 'Dopatab m250', '250mg', '280.00', '400.00', '2020-11-01', 'default.gif', 14, 10, 1, 10, 8, '54361239'),
(59, 'tenoric', 'atenolo100', '575.00', '800.00', '2020--11-01', 'default.gif', 14, 4, 1, 4, 8, '8901079006189'),
(60, 'tenoric-50', 'co-tenidone', '475.00', '700.00', '2020-07-01', 'default.gif', 14, 4, 1, 4, 8, '8901079006172'),
(61, 'aldoment250', '250mg', '250.00', '400.00', '2020-09-01', 'default.gif', 14, 5, 1, 10, 8, '98776543'),
(62, 'clopidogrel teva75', 'teva75m', '300.00', '500.00', '2019-11-01', 'default.gif', 14, 4, 1, 4, 8, '5017007047810'),
(63, 'almodipine5mg', '5mg', '160.00', '350.00', '2022-03-01', 'default.gif', 14, 2, 1, 6, 8, '5017007023364'),
(64, 'almodipine10m', '10mg', '190.00', '350.00', '2020-01-01', 'default.gif', 14, 0, 1, 10, 8, '5017007023371'),
(65, 'aciclovir 400mg ', '400mg tablet', '2000.00', '2700.00', '2020-05-01', 'default.gif', 14, 4, 1, 4, 8, '5015525016028'),
(66, 'tarivid 200mg', '200mg', '1850.00', '2200.00', '2019-12-01', 'default.gif', 14, 2, 1, 2, 8, '3582910029250'),
(67, 'L-FLOX 500mg', '500mg', '480.00', '650.00', '2020-04-01', 'default.gif', 14, 6, 1, 10, 8, '8906007519014'),
(68, 'sporidex 250', '250mg', '550.00', '800.00', '2019-07-01', 'default.gif', 16, 2, 1, 2, 8, '8901296107546'),
(69, 'sporidex 125mg', '125mg', '450.00', '700.00', '2019-10-01', 'default.gif', 16, 2, 1, 2, 8, '8901296105986'),
(70, 'zinnat 500mg', '500mg', '2800.00', '3500.00', '2020-11-01', 'default.gif', 14, 0, 1, 2, 8, '5582736'),
(71, 'zinnat 250mg', '250mg', '2000.00', '2600.00', '2020-11-01', 'default.gif', 14, 2, 1, 2, 8, '85692769'),
(72, 'biocine250mg', 'lincomycine', '850.00', '1000.00', '2020-12-01', 'default.gif', 15, 2, 1, 2, 8, '6156000127545'),
(73, 'pemcocin 500mg', 'lincomycin', '300.00', '500.00', '2020-08-01', 'default.gif', 20, 1, 1, 4, 8, '859627524'),
(74, 'Tetracycline 250mg', 'hetrac', '60.00', '100.00', '2020-03-01', 'default.gif', 20, 13, 1, 20, 8, '582694738'),
(76, 'zithromax 250mg', 'azithromycin', '2800.00', '3900.00', '2020-08-01', 'default.gif', 20, 1, 1, 1, 8, '85639710'),
(77, 'Aciclovir200mg', 'Aciclovir', '1200.00', '1600.00', '2019-11-01', 'default.gif', 14, 4, 1, 5, 8, '5015525016011'),
(78, 'sporidex 500mg', 'cefalexin capsule', '550.00', '800.00', '2019-09-01', 'default.gif', 20, 3, 1, 3, 8, '8901296109236'),
(79, 'Emzoclox 100ml', 'emzoclox', '280.00', '450.00', '2020-11-01', 'default.gif', 16, 4, 1, 5, 8, '6154000034375'),
(80, 'Emmox 100ml', 'Emmox', '220.00', '450.00', '2021-04-04', 'default.gif', 16, 5, 1, 5, 8, '6154000034412'),
(81, 'Cefirat 400mg', 'Cefirat', '900.00', '1500.00', '2020-01-01', 'default.gif', 14, 1, 1, 2, 8, '8906035499111'),
(82, 'Virest 400mg', 'Aciclovir', '3700.00', '4200.00', '2020-11-30', 'default.gif', 14, 0, 1, 1, 8, 'UVIR12'),
(83, 'Virest 200mg', 'Aciclovir', '2200.00', '2700.00', '2020-9-30', 'default.gif', 14, 1, 1, 1, 8, 'UVIR11'),
(84, 'Cipro-S ', 'Hcl 500mg', '200.00', '500.00', '2020-09-01', 'default.gif', 14, 0, 1, 3, 8, '22254718'),
(85, 'Cenox', 'Cenox 500mg', '270.00', '500.00', '2020-03-01', 'default.gif', 14, 2, 1, 10, 8, '582888471'),
(86, 'Ocefix .SUSP. 100ml', 'ocefix  SUSP', '1300.00', '1600.00', '2020-10-01', 'default.gif', 16, 2, 1, 2, 8, '8906035499234'),
(87, 'Ocefix .SUSP. 60ml', 'Ocefix s/s', '900.00', '1200.00', '2020-08-01', 'default.gif', 16, 1, 1, 2, 8, '8906035499227'),
(88, 'ciproxamed 500mg', 'Emba', '150.00', '300.00', '2020-12-01', 'default.gif', 14, 4, 1, 5, 8, '58247496'),
(89, 'Cefuroxime 250mg', 'cefuroxime tablet', '600.00', '1500.00', '2019-07-01', 'default.gif', 14, 2, 1, 2, 8, '74852856'),
(90, 'Cefuroxime 500mg', 'cefuroxime tablet', '800.00', '1300.00', '2020-03-01', 'default.gif', 14, 0, 1, 2, 8, '58742558'),
(91, 'Jawamox 125mg', 'Amoxycillin125mg', '320.00', '550.00', '2021-02-01', 'default.gif', 16, 3, 1, 3, 8, '6154000056117'),
(92, 'Erythromax 500mg', 'Erythromycin tablet', '260.00', '600.00', '2020-10-01', 'default.gif', 14, 1, 1, 5, 8, '528369471'),
(93, 'jawaclox 250mg', 'cloxacilline', '320.00', '600.00', '2020-08-01', 'default.gif', 16, 3, 1, 3, 8, '6154000056070'),
(94, 'Orelox', '40mg/5ml', '2600.00', '3300.00', '2019-08-01', 'default.gif', 16, 2, 1, 2, 8, '3582910026198'),
(95, 'Primpex', 'co-trimoxazole tablet', '75.00', '100.00', '2023-02-01', 'default.gif', 14, 12, 1, 20, 8, '9685387127'),
(96, 'primpex 50ml', 'co-trimoxazole suspension', '250.00', '550.00', '2020-09-01', 'default.gif', 16, 4, 1, 6, 8, '96853547'),
(97, 'Rocephin', '1g i.v.', '2850.00', '3850.00', '2020-11-01', 'default.gif', 34, 4, 1, 4, 8, '7640128012184'),
(98, 'Reichlox 500mg', 'Zentiva', '280.00', '450.00', '2020-02-01', 'default.gif', 20, 4, 1, 10, 8, '5036853000640'),
(99, 'Reichamox 500mg', 'Amoxicillin', '280.00', '400.00', '2022-01-01', 'default.gif', 20, 10, 1, 10, 8, '5036853000602'),
(100, 'Fleming ', '625mg', '1150.00', '1600.00', '2019-06-01', 'default.gif', 14, 1, 1, 2, 8, '8901040300025'),
(101, 'Fleming 228.5mg', 'Amoxicillin + Clavulanic acid', '700.00', '950.00', '2019-10-1', 'default.gif', 16, 8, 1, 8, 8, '8901040256063'),
(102, 'Curclav', '625mg', '800.00', '1500.00', '2020-01-01', 'default.gif', 14, 1, 1, 3, 8, '6985347'),
(103, 'Aquaclav 625mg', '625mg', '750.00', '1400.00', '2019-09-01', 'default.gif', 14, 1, 1, 4, 8, '8904097380620'),
(104, 'Cafcol 250mg', 'Chloramphenicol', '350.00', '200.00', '2019-11-01', 'default.gif', 20, 20, 1, 20, 8, '2583694'),
(105, 'Ampiclox beecham', '500mg', '600.00', '800.00', '2020-10-01', 'default.gif', 20, 5, 1, 30, 8, '85712369'),
(106, 'Ampiclox suspension 250mg', '250mg', '1080.00', '1400.00', '2019-11-01', 'default.gif', 16, 6, 1, 6, 8, '528314763'),
(107, 'Ampiclox 90mg drop', '90mg', '650.00', '1050.00', '2020-10-01', 'default.gif', 40, 2, 1, 3, 8, '14763981'),
(108, 'Amoxil 500mg', '500mg', '400.00', '600.00', '2022-06-01', 'default.gif', 20, 10, 1, 20, 8, '8901040105231'),
(109, 'Amoxil 250mg', '250mg', '195.00', '400.00', '2023-02-01', 'default.gif', 20, 19, 1, 20, 8, '8901040105248'),
(110, 'amoxil 125mg', '125mg', '650.00', '800.00', '2022-10-01', 'default.gif', 16, 8, 1, 10, 8, '69824732'),
(111, 'augmentin 625mg', '625mg', '2700.00', '3500.00', '2020-11-01', 'default.gif', 14, 0, 1, 5, 8, '5476898'),
(112, 'augmentin 1g', '1g', '3100.00', '3900.00', '2019-11-01', 'default.gif', 14, 4, 1, 5, 8, '25831793'),
(113, 'augmentin 375mg', '375mg', '2100.00', '2700.00', '2020-10-01', 'default.gif', 14, 1, 1, 3, 8, '666528347'),
(114, 'Ciprotab 10 soflets', '10 soflets', '900.00', '1300.00', '2021-01-01', 'default.gif', 14, 6, 1, 11, 8, '8906001820499'),
(115, 'Ciprotab 14 soflets', '14 soflets', '1150.00', '1600.00', '2020-12-01', 'default.gif', 14, 1, 1, 11, 8, '8906001820499'),
(116, 'Clavulin 625mg', '625mg', '1000.00', '1500.00', '2020-04-01', 'default.gif', 14, 3, 1, 4, 8, '58234769'),
(117, 'Betadrone-N 10ml', 'eye and ear drop ', '250.00', '550.00', '2021-03-01', 'default.gif', 31, 2, 1, 3, 8, '6156000127552'),
(118, 'Sudocrem S/S', 'Sudocrem ', '1400.00', '1650.00', '2020-01-13', 'default.gif', 23, 1, 1, 1, 8, '50953349'),
(119, 'Sudocrem m/s', 'sudocrem ', '1900.00', '2200.00', '2020-03-13', 'default.gif', 23, 1, 1, 1, 8, '5011025014007'),
(120, 'azopteyedrop', 'eye drop', '3000.00', '4500.00', '2020-01-01', 'default.gif', 31, 1, 1, 1, 8, '8699504710113'),
(121, 'xanap gel', 'gel', '17.00', '350.00', '2020-05-01', 'default.gif', 23, 10, 1, 10, 8, '54112277'),
(122, 'robb b/s', 'b/s', '141.70', '250.00', '2020-12-01', 'default.gif', 36, 10, 1, 12, 8, '6033000102584'),
(123, 'Ivysolone eyedrop 5ml', 'eyedrop 5ml', '600.00', '700.00', '2019-05-01', 'default.gif', 31, 2, 1, 2, 8, '56765765'),
(124, 'catarest eyedrop 10ml', '10ml eyedrop', '750.00', '1100.00', '2020-05-01', 'default.gif', 31, 1, 1, 1, 8, '8906013145191'),
(125, 'hypromllose eyedrop 0.3', '0.3 drop', '450.00', '900.00', '2020-05-01', 'default.gif', 31, 1, 1, 1, 8, '5026468744169'),
(126, 'Alphagan eyedrop 5ml', '0.2 sterile', '1700.00', '3300.00', '2020-08-13', 'default.gif', 31, 1, 1, 1, 8, '4897000501585'),
(127, 'tricuten cream', 'cream', '300.00', '400.00', '2020-07-01', 'default.gif', 23, 2, 1, 2, 8, '6567899'),
(128, 'tiococid dermal cream', 'dermal cream', '1300.00', '1600.00', '2022-03-03', 'default.gif', 23, 2, 1, 2, 8, '7654543986'),
(129, 'betopticeyedrop 5ml', '0.5 base', '1400.00', '1600.00', '2020-08-01', 'default.gif', 31, 1, 1, 1, 8, '5413895039300'),
(130, 'maxitrol eyedrop', '5ml', '1050.00', '1300.00', '2020-05-01', 'default.gif', 31, 1, 1, 2, 8, '5413895039331'),
(131, 'tears naturale eyedrop', 'artificial tears', '1100.00', '1800.00', '2019-03-01', 'default.gif', 31, 1, 1, 1, 8, '7665544'),
(132, 'ocullerg eyedrop 10ml', 'antazoline', '450.00', '600.00', '2019-12-01', 'default.gif', 31, 2, 1, 2, 8, '8904151830634'),
(133, 'mepisan cream', 'cream 20g', '300.00', '400.00', '2022-02-01', 'default.gif', 28, 2, 1, 2, 8, '5648900 '),
(134, 'neo-presol25ml', 'acne/after shave lotion', '750.00', '1100.00', '2022-02-01', 'default.gif', 23, 2, 1, 2, 8, '6156000081359'),
(135, 'neo-medrol', 'acne lotion', '1200.00', '1600.00', '2019-09-01', 'default.gif', 23, 1, 1, 2, 8, '212132132'),
(136, 'neurogesic extra35mg', 'greaseless ointment', '400.00', '700.00', '2022-02-01', 'default.gif', 36, 3, 1, 3, 8, '6156000127590'),
(137, 'nerve/bone liniment180ml', 'cartwright', '320.00', '500.00', '2021-04-01', 'default.gif', 44, 1, 1, 3, 8, '90876565'),
(138, 'calamine lotion[ boot]', '100ml', '180.00', '300.00', '2020-11-01', 'default.gif', 12, 3, 1, 3, 8, '76654986'),
(139, 'vistulent eyedrop 10ml', '10ml', '750.00', '1000.00', '2021-04-01', 'default.gif', 31, 2, 1, 2, 8, '6156000158150'),
(140, 'lofnac gel', 'gel', '220.00', '350.00', '2019-10-01', 'default.gif', 41, 12, 1, 12, 8, '8906009234090'),
(141, 'Aboniki balm', 'balm25mg', '162.50', '250.00', '2021-03-15', 'default.gif', 36, 7, 1, 12, 8, '6156000046105'),
(142, 'mentholatum', 'skin irritation', '220.00', '300.00', '2022-03-01', 'default.gif', 36, 2, 1, 6, 8, '67878766'),
(143, 'canesten cream', '20g clotrimazole', '1100.00', '1750.00', '2020-02-01', 'default.gif', 23, 2, 1, 2, 8, '5010605106026'),
(144, 'VOLINI GEL', 'GEL', '500.00', '750.00', '2019-05-01', 'default.gif', 41, 1, 1, 2, 8, '8901296110829'),
(145, 'ABF-3 CREAM', 'ANTI-ALLERGIC', '150.00', '300.00', '2021-02-01', 'default.gif', 23, 11, 1, 12, 8, '75477887'),
(146, 'NIXODERM TIN', 'SKIN PROBLM', '208.40', '350.00', '2019-05-01', 'default.gif', 36, 12, 1, 12, 8, '5010182974438'),
(147, 'ODOMOS CREAM S/S', 'SMALL SIZE 25G', '120.00', '250.00', '2021-11-01', 'default.gif', 23, 3, 1, 3, 8, '8901207801068'),
(148, 'ODOMOS CREAM B/S', 'BIG SIZE50G', '200.00', '350.00', '2022-12-01', 'default.gif', 23, 2, 1, 3, 8, '8901207801051'),
(150, 'BENZOATE DE BENZYLE', 'MOKO LOTION', '250.00', '400.00', '2021-01-01', 'default.gif', 42, 8, 1, 8, 8, '6156000058856'),
(151, 'tribact creamI', 'triple action', '183.40', '300.00', '2020-08-01', 'default.gif', 23, 11, 1, 12, 8, '655555554'),
(152, 'Endix-G cream', '20g cream', '320.00', '480.00', '2020-04-01', 'default.gif', 23, 0, 1, 5, 8, '66778769'),
(153, 'fungusol powder20g', 'powder', '250.00', '400.00', '2020-04-04', 'default.gif', 43, 2, 1, 3, 8, '443434343'),
(154, 'fungusol lotin', '50ml lotion', '250.00', '400.00', '2021-05-01', 'default.gif', 42, 3, 1, 3, 8, '676787987'),
(155, 'nizoral 15g cream', '15g topical cream', '1150.00', '1700.00', '2020-04-01', 'default.gif', 23, 2, 1, 2, 8, '980908760'),
(156, 'Daktacort cream', '15mg cream', '1350.00', '2100.00', '2020-04-01', 'default.gif', 23, 2, 1, 2, 8, '87876676'),
(157, 'nizoral shampoo 60ml', 'shampoo', '1900.00', '2850.00', '2019-02-01', 'default.gif', 24, 1, 1, 1, 8, '43578900'),
(158, 'Aquasulf ointment', 'sulfur ointment', '150.00', '300.00', '2023-02-01', 'default.gif', 36, 5, 1, 12, 8, '6587766776'),
(159, 'ANUSOL SUPPOSITORIES', '3WAYS ACTION', '150.00', '200.00', '2020-07-01', 'default.gif', 41, 10, 1, 12, 8, '5010123729004'),
(160, 'Kenecomb cream', '10g cream', '500.00', '700.00', '2019-10-01', 'default.gif', 23, 2, 1, 2, 8, '5999989'),
(161, 'Quadriderm topical cream', 'topical cream', '700.00', '1000.00', '2020-12-01', 'default.gif', 23, 2, 1, 2, 8, '6221050130118'),
(162, 'daktarin 15g', '15g topical cream', '1350.00', '1900.00', '2019-08-01', 'default.gif', 23, 2, 1, 2, 8, '65767676'),
(163, 'antallerge eyedrop', 'eyedrop', '480.00', '700.00', '2021-02-01', 'default.gif', 31, 3, 1, 3, 8, '6156000132600'),
(164, 'gentalab eyedrop', 'gentamicin  eye/ear drop', '100.00', '300.00', '2020-05-01', 'default.gif', 31, 7, 1, 10, 8, '8906045940641'),
(165, 'visine eyedrop', 'original', '450.00', '650.00', '2022-06-01', 'default.gif', 31, 4, 1, 5, 8, '8993212100069'),
(166, 'Atropine eyedrop', 'eyedrop10ml', '1200.00', '1800.00', '2019-04-01', 'default.gif', 31, 1, 1, 1, 8, '9588800180494'),
(167, 'Ivyfur eyedrop', 'flurbiprofen eyedrop', '700.00', '1100.00', '2019-09-01', 'default.gif', 31, 0, 1, 2, 8, '000999889'),
(168, 'Ivymoicell eyedrop', 'eyedrop', '750.00', '1100.00', '2020-03-01', 'default.gif', 31, 2, 1, 2, 8, '77777766'),
(169, 'dextracin eyedrop', 'dexamethasne/neomycin', '700.00', '1050.00', '2019-02-01', 'default.gif', 31, 2, 1, 2, 8, '9556492002707'),
(170, 'ivycrom eyedrop', 'eyedrop', '650.00', '900.00', '2019-10-01', 'default.gif', 31, 2, 1, 2, 8, '78789877'),
(171, 'la-lid ofloxacin eyedrop', '5ml eyedrop', '0.00', '500.00', '', 'default.gif', 31, 2, 1, 2, 8, '8906018278559'),
(174, 'eyesaxolin10ml', 'eyedrop', '900.00', '1300.00', '2019-07-25', 'default.gif', 31, 2, 1, 2, 8, '8806453001722'),
(175, 'Cerumol ear drop', 'removal ear wax', '900.00', '1350.00', '2022-11-01', 'default.gif', 46, 2, 1, 2, 8, '5012778001412'),
(176, 'Elisca eyedrop', 'chloramphenicol eyedrop', '200.00', '400.00', '2020-08-01', 'default.gif', 31, 8, 1, 10, 8, '409067'),
(177, 'eyetreolent eye', 'eyedrop', '1100.00', '1650.00', '2020-05-28', 'default.gif', 31, 2, 1, 2, 8, '8806453021225'),
(178, 'mupiderm oinment15g', 'mupirocin 2', '1600.00', '2100.00', '2020-02-01', 'default.gif', 36, 1, 1, 2, 8, '6587454'),
(179, 'acneawaycream', '20g', '216.70', '400.00', '2020-06-01', 'default.gif', 23, 11, 1, 12, 8, '4111222'),
(180, 'Biocoten2og cream', 'anti-eczematous', '320.00', '400.00', '2022-03-01', 'default.gif', 23, 7, 1, 10, 8, '6156000081328'),
(181, 'Dermazin 25g', 'burn ', '650.00', '850.00', '2020-09-01', 'default.gif', 36, 4, 1, 5, 8, '432156543'),
(182, 'gynaemed v cream', 'clotrimazole', '450.00', '750.00', '2022-04-01', 'default.gif', 23, 5, 1, 5, 8, '8901397010769'),
(183, 'epiderm cream', 'triple action', '210.00', '400.00', '2020-03-01', 'default.gif', 23, 5, 1, 5, 8, '8902292002323'),
(184, 'hydrocortisone cream', 'cream', '290.00', '400.00', '2022-04-01', 'default.gif', 23, 4, 1, 5, 8, '544377654'),
(185, 'neurogesic ', 'methyl sailcylate', '400.00', '600.00', '2021-09-01', 'default.gif', 36, 10, 1, 10, 8, '6156000081335'),
(186, 'mycoten cream', '20g', '290.00', '400.00', '2020-04-01', 'default.gif', 23, 8, 1, 10, 8, '7765509988'),
(187, 'sabresten cream20g', '20g', '470.00', '700.00', '2020-07-01', 'default.gif', 23, 3, 1, 3, 8, '765509876'),
(188, 'penicillin ointment tube', '20g', '140.00', '250.00', '2022-06-01', 'default.gif', 36, 6, 1, 10, 8, '544e456'),
(189, 'funbact-a cream 30g', 'triple action', '258.34', '350.00', '2020-11-01', 'default.gif', 23, 1, 1, 12, 8, '8906009234083'),
(190, 'Skineal cream15g', 'skin cream', '360.00', '500.00', '2021-01-12', 'default.gif', 23, 0, 1, 10, 8, '15000913389375813615'),
(191, 'visita plus', 'visita', '280.00', '400.00', '2020-11-01', 'default.gif', 23, 7, 1, 10, 8, '776657865654'),
(192, 'nixoderm tube15g', 'derm', '250.00', '350.00', '2020-03-01', 'default.gif', 36, 2, 1, 6, 8, '5010182974421'),
(193, 'neoskin cream', 'tube', '183.34', '400.00', '2020-09-01', 'default.gif', 23, 12, 1, 12, 8, '8904220602056'),
(194, 'Tribotan baby cream', 'baby cream', '390.00', '500.00', '2020-02-01', 'default.gif', 23, 6, 1, 10, 8, '6034000231465'),
(195, 'ketoral cream', '30g', '210.00', '400.00', '2020-07-01', 'default.gif', 23, 9, 1, 10, 8, '777666888999'),
(196, 'vecuten15g', '15gcream', '500.00', '700.00', '2019-01-01', 'default.gif', 23, 3, 1, 3, 8, '8898787'),
(197, 'ketofung cream', 'ketoconazole2', '360.00', '5.00', '2022-02-01', 'default.gif', 23, 3, 1, 3, 8, '6156000127507'),
(198, 'Lamisl cream', 'treatment skin infection', '2500.00', '3300.00', '2020-01-01', 'default.gif', 23, 1, 1, 1, 8, '8875654432'),
(199, 'tydineal20g', 'cream', '280.00', '450.00', '2021-04-01', 'default.gif', 23, 1, 1, 3, 8, '6928623097006'),
(200, 'mycoten vaginal cream', 'vaginal cream', '600.00', '800.00', '2022-01-01', 'default.gif', 23, 2, 1, 3, 8, '6655446755'),
(201, 'sabresten vaginal cream 35g', '35g', '800.00', '1100.00', '2020-10-01', 'default.gif', 23, 0, 1, 3, 8, '65445678'),
(202, 'visionace', 'healthy eyes/gud vision', '1250.00', '1500.00', '2019-09-01', 'default.gif', 20, 2, 1, 2, 8, '5021265224128'),
(203, 'jointace', 'omega-3', '1350.00', '2000.00', '2021-01-01', 'default.gif', 20, 4, 1, 4, 8, '5021265221806'),
(204, 'osteocare original', 'strong bones', '800.00', '1200.00', '2020-02-01', 'default.gif', 20, 2, 1, 2, 8, '5021265227075'),
(205, 'ferogain ', 'haemoglobin', '650.00', '850.00', '2021-05-01', 'default.gif', 20, 0, 1, 2, 8, '4771316309922'),
(206, 'FeroglobinB12', 'VITABIOTICS', '1000.00', '1300.00', '2020-12-01', 'default.gif', 20, 4, 1, 4, 8, '5021265220076'),
(207, 'IMMUNACE', 'IMMUME SYSTEM', '1150.00', '1350.00', '2021-02-01', 'default.gif', 20, 2, 1, 2, 8, '5021265221400'),
(208, 'WELLMAN50+', '50+', '1300.00', '1600.00', '2020-12-01', 'default.gif', 14, 2, 1, 2, 8, '5021265247691'),
(209, 'WELLW0MAN CAPS', ' ORIGINAL CAPSULES', '1250.00', '1650.00', '2020-09-01', 'default.gif', 20, 4, 1, 4, 8, '5021265247714'),
(210, 'WELLW0MAN 50+', 'VITABIOTICS 50+', '1300.00', '1550.00', '2020-11-01', 'default.gif', 14, 2, 1, 2, 8, '5021265247721'),
(211, 'WELLMAN CONCEPTION', 'CONCEPTION', '1600.00', '2000.00', '2021-01-01', 'default.gif', 20, 2, 1, 2, 8, '5021265248407'),
(212, 'WELLMAN original', 'CAPSULES', '1250.00', '1700.00', '2020-08-01', 'default.gif', 20, 2, 1, 4, 8, '5021265247684'),
(213, 'PREGNACARE PLUS', 'OMEGA3', '2200.00', '3000.00', '2019-11-01', 'default.gif', 20, 9, 1, 10, 8, '5021265246434'),
(214, 'JAWARON BLOOD TONIC', 'BLOOD TOINC', '350.00', '500.00', '2019-09-01', 'default.gif', 15, 2, 1, 2, 8, '55666776655J'),
(215, 'Abidec multivitamin25ml', '25ml', '750.00', '1200.00', '2019-06-01', 'default.gif', 40, 4, 1, 6, 8, '6545778'),
(216, 'emivte syrup', 'multivitamin', '0.00', '250.00', '', 'default.gif', 15, 5, 1, 5, 8, '6154000033392'),
(217, 'em-vit-c SYRUP', 'vitamne c syrup', '170.00', '250.00', '2021-05-01', 'default.gif', 15, 6, 1, 10, 8, '6154000033354'),
(218, 'vitamin c white1000mg', 'emvite 1000mg', '0.75', '2.00', '2021-05-01', 'default.gif', 14, 1188, 1, 2000, 8, '6154000033330'),
(219, 'vitamin c orange 1000mg', 'emvite1000tab', '0.80', '2.00', '2021-03-01', 'default.gif', 14, 1345, 1, 2000, 8, '6154000033439'),
(220, 'emzoron tonic200ml', '200lml', '300.00', '500.00', '2019-09-01', 'default.gif', 30, 2, 1, 2, 8, '6154000033637'),
(221, 'em-b-plex 100ml syrup', 'vitamin b complex', '160.00', '250.00', '2021-05-01', 'default.gif', 15, 4, 1, 5, 8, '6154000033316'),
(222, 'emvit-c white100mg', 'white', '180.00', '250.00', '2021-04-01', 'default.gif', 14, 0, 1, 10, 8, '6154000033347'),
(223, 'em-vit-c drop', 'drop', '160.00', '200.00', '2019-12-01', 'default.gif', 40, 10, 1, 10, 8, '8765444'),
(224, 'UPTAMIN SYRUP200ML', '200ML', '500.00', '800.00', '2020-01-01', 'default.gif', 15, 3, 1, 3, 8, '66554443'),
(225, 'Avromult100ml', 'syrup', '200.00', '400.00', '2021-06-01', 'default.gif', 15, 5, 1, 5, 8, '554444556'),
(226, 'ginsomin cap', 'mega', '616.70', '900.00', '2019-04-28', 'default.gif', 20, 5, 1, 6, 8, '8850769013252'),
(227, 'AvroHB TONIC200ml', 'tonic', '0.00', '800.00', '', 'default.gif', 30, 3, 1, 3, 8, '44333455'),
(228, 'complan milk', 'milk', '2100.00', '2500.00', '2019-04-01', 'default.gif', 29, 2, 1, 3, 8, '5000218003201'),
(229, 'tacorange syrup100ml', 'galways', '160.00', '250.00', '2019-02-01', 'default.gif', 15, 6, 1, 6, 8, '4334556786542'),
(230, 'Avroton200ml', 'blood t0nic', '350.00', '600.00', '2020-06-01', 'default.gif', 30, 3, 1, 3, 8, '65877543'),
(231, 'Ciklavit 200mlsyrup', 'nutritional supplement', '1100.00', '1400.00', '2019-05-01', 'default.gif', 15, 1, 1, 1, 8, '6156000090757'),
(232, 'ferobin ', 'TOINC', '400.00', '600.00', '2020-05-01', 'default.gif', 30, 3, 1, 3, 8, '6034000140606'),
(233, 'pregncare original', 'vitabiotc', '1375.00', '1600.00', '2020-09-01', 'default.gif', 20, 4, 1, 4, 8, '5021265245727'),
(234, 'PREGNACARE conception', 'conception', '1650.00', '2200.00', '2020-04-01', 'default.gif', 14, 2, 1, 3, 8, '5021265221585'),
(235, 'Omega-H3 CAP', 'BIO-TONIC', '360.00', '500.00', '2020-12-01', 'default.gif', 30, 19, 1, 25, 8, '342132344'),
(236, 'Obron-6', 'capsule', '213.00', '500.00', '2019-08-01', 'default.gif', 20, 15, 1, 15, 8, '6156000084459'),
(237, 'Eggovin S/S', 'SIZE SMALL', '850.00', '1300.00', '2020-5-1', 'default.gif', 29, 1, 1, 2, 8, '5434565677'),
(238, 'Eggovin m/S', 'medium size', '1350.00', '1800.00', '2020-5-1', 'default.gif', 29, 2, 1, 2, 8, '9887765'),
(239, 'glycinorm-m80', 'm-80', '500.00', '700.00', '2020-06-01', 'default.gif', 14, 2, 1, 3, 8, '8901079007124'),
(240, 'glucophage1000mg', '1000mg', '633.34', '1250.00', '2022-12-1', 'default.gif', 14, 7, 1, 8, 8, '78767'),
(241, 'AMARYL 4 MG', '4MG', '2100.00', '2750.00', '2020-11-01', 'default.gif', 14, 1, 1, 2, 8, '3582910015062'),
(242, 'AMARYL 2MG', '2MG', '1500.00', '1950.00', '2020-12-01', 'default.gif', 28, 2, 1, 2, 8, '3582910015048'),
(243, 'GLUCOPHAGE500MG', '500MG', '700.00', '920.00', '2020-9-1', 'default.gif', 14, 12, 1, 16, 8, '98776565679'),
(244, 'Glanil 5mg', '5mg', '85.00', '200.00', '2020-04-01', 'default.gif', 20, 5, 1, 10, 8, '6156000067667'),
(245, 'daonil 5mg', '5mg', '200.00', '300.00', '2021-02-01', 'default.gif', 14, 6, 1, 10, 8, '565uy'),
(246, 'Eggovin B/S', 'BIG SIZE', '2500.00', '2900.00', '2020-5-1', 'default.gif', 29, 1, 1, 1, 8, '12321'),
(247, 'OCEANIC COD LIVER OIL 300MG', '300MG', '150.00', '400.00', '2019-06-01', 'default.gif', 20, 10, 1, 10, 8, '8906044910539'),
(248, 'OCEANIC COD LIVER OIL 1000MG', '1000MG', '200.00', '700.00', '2019-08-01', 'default.gif', 20, 8, 1, 10, 8, '8906044910522'),
(249, 'Cyprigold100ml s/s', '1ooml', '150.00', '300.00', '2021-02-01', 'default.gif', 15, 5, 1, 5, 8, '12321111Cy'),
(250, 'Cyprigold 200ml syrup b/s', '200ml', '150.00', '400.00', '2021-01-01', 'default.gif', 15, 3, 1, 5, 8, '5432217'),
(251, 'cyprivit 200ml b/s', '200ml', '250.00', '400.00', '2021-01-01', 'default.gif', 15, 5, 1, 5, 8, '6776555'),
(252, 'cyprivit syrup 100ml s/s', '100ml', '150.00', '300.00', '2019-10-01', 'default.gif', 15, 3, 1, 5, 8, '76689'),
(253, 'de-deons Hemoglobine syrup 280ml b/s', 'hemoglobine 280ml', '1100.00', '1500.00', '2021-04-01', 'default.gif', 15, 4, 1, 4, 8, '6156000006512'),
(254, 'de-deons hemoglobine 150ml s/s', 'Hemoglobine 150ml', '650.00', '850.00', '2021-05-01', 'default.gif', 15, 2, 1, 2, 8, '6156000006505'),
(255, 'citramin 15ml drop', '15ml', '160.00', '250.00', '2019-10-01', 'default.gif', 40, 5, 1, 6, 8, '6544343'),
(256, 'citramin 100ml syrup', '100ml vitamin c', '160.00', '300.00', '2018-10-01', 'default.gif', 15, 5, 1, 5, 8, '6798'),
(257, 'Afrabvite 1ooml syrup', 'multivitamin syrup 100ml', '190.00', '300.00', '2020-03-01', 'default.gif', 15, 6, 1, 6, 8, '098765'),
(258, 'Angle c vitamin c', 'vitamin c', '60.00', '100.00', '2019-09-01', 'default.gif', 14, 0, 1, 20, 8, '8904185706264'),
(259, 'Afrab vite 15ml drop', '15ml', '160.00', '250.00', '2019-10-01', 'default.gif', 40, 6, 1, 6, 8, '666554676554'),
(260, 'Lixyped 100ml', 'cough syrup', '230.00', '400.00', '2019-06-01', 'default.gif', 15, 8, 1, 8, 8, '6034000062090'),
(261, 'Kings tonic 200ml', 'tonics 200ml', '320.00', '550.00', '2020-09-01', 'default.gif', 30, 5, 1, 5, 8, '5555698'),
(263, 'Riconia liquid 200ml', 'Riconia 200ml', '400.00', '600.00', '2019-10-01', 'default.gif', 30, 3, 1, 3, 8, '45871297'),
(264, 'Ranferon-12 capsule', 'Ranferon -12', '91.67', '150.00', '2019-10-01', 'default.gif', 20, 11, 1, 12, 8, '8901296107591'),
(265, 'Reload for kids 80', 'reload for kids', '3500.00', '4550.00', '2021-02-01', 'default.gif', 14, 1, 1, 1, 8, '615225000188'),
(266, 'reload men formular 30', 'men formular', '2000.00', '2600.00', '2020-11-01', 'default.gif', 14, 2, 1, 2, 8, '615225000195'),
(267, 'Reload women 50+ formular', 'Reload women formular', '2000.00', '2600.00', '2020-02-01', 'default.gif', 14, 1, 1, 2, 8, '615225000348'),
(268, 'Reload women formular ', 'Reload woman formular', '2000.00', '2600.00', '2020-06-01', 'default.gif', 14, 2, 1, 2, 8, '615225000201'),
(269, 'Reload men 50+ formular', 'Reload men 50+ formular', '2000.00', '2600.00', '2019-10-01', 'default.gif', 14, 2, 1, 2, 8, '615225000355'),
(270, 'Ginoforce capsule 30', 'Ginoforce capsule 30', '115.00', '500.00', '2020-10-01', 'default.gif', 20, 9, 1, 10, 8, '8906047361734'),
(271, 'Ginovera', 'ginovera aloe vera and ginseng', '115.00', '500.00', '2020-11-01', 'default.gif', 20, 6, 1, 10, 8, '8906047361659'),
(272, 'HB12 plus', 'HB12 plus caplet', '300.00', '500.00', '2019-03-01', 'default.gif', 20, 2, 1, 6, 8, '25856901'),
(273, 'Astyfer capsule', 'Astyfer capsule', '550.00', '750.00', '2020-01-01', 'default.gif', 20, 17, 1, 20, 8, '8908002671803'),
(274, 'Astymin capsule', 'Astymin capsule', '550.00', '750.00', '2019-01-01', 'default.gif', 20, 16, 1, 20, 8, '8908002671452'),
(275, 'Astyfer liquid 200ml', 'blood tonic', '1100.00', '1500.00', '2020-02-01', 'default.gif', 30, 2, 1, 4, 8, '8908002671131'),
(276, 'Astymin liquid 200ml', 'multivitamin syrup', '1100.00', '1500.00', '2019-10-01', 'default.gif', 30, 1, 1, 6, 8, '8908002671032'),
(277, 'Winofit capsule', 'winofit dietary supplement', '350.00', '600.00', '2019-02-01', 'default.gif', 20, 1, 1, 2, 8, '4568309'),
(278, 'Bunto 100ml', 'bunto blood tonic', '200.00', '400.00', '2020-05-17', 'default.gif', 30, 2, 1, 3, 8, '58471236'),
(279, 'Bunto 1Litre', 'Bunto blood tonic', '700.00', '900.00', '2020-05-01', 'default.gif', 30, 2, 1, 2, 8, '222963417'),
(280, 'Bunto 300ml', 'Bunto blood tonic', '330.00', '500.00', '2020-01-04', 'default.gif', 30, 3, 1, 3, 8, '14706933'),
(281, 'Kunimed yeast powder', 'Kunimed yeast powder', '400.00', '550.00', '2020-01-01', 'default.gif', 38, 1, 1, 2, 8, '6152110057024'),
(282, 'HB12 blood tonic 200ml', 'HB12 blood tonic 200ml', '750.00', '1000.00', '2020-04-01', 'default.gif', 30, 6, 1, 6, 8, '85639852'),
(283, 'HB12 forte tonic', ' HB12 forte 200ml', '950.00', '1200.00', '2020-02-01', 'default.gif', 30, 3, 1, 3, 8, '5099186004099'),
(284, 'HS 12 200ml', 'HS 12 200ml', '1000.00', '1300.00', '2022-01-01', 'default.gif', 30, 3, 1, 3, 8, '5099186003436'),
(285, 'WATE-ON 450ML', 'WATE-ON 450ML', '1850.00', '2300.00', '2020-06-01', 'default.gif', 30, 2, 1, 2, 8, '652223841'),
(287, 'Liquid IRON 100ml S/S', 'Liquid IRON 100ml S/S', '180.00', '300.00', '2020-03-01', 'default.gif', 30, 3, 1, 3, 8, '7586934'),
(288, 'MIM 300ML B/S', 'MIM 300ML B/S', '320.00', '500.00', '2020-03-01', 'default.gif', 30, 3, 1, 3, 8, '4759683'),
(289, 'MIM Drops 30ml', 'MIM Drops 30ml', '200.00', '350.00', '2020-02-01', 'default.gif', 40, 3, 1, 3, 8, '8904008410033'),
(290, 'Chemiron Blood capsule', 'Chemiron Blood capsule', '100.00', '150.00', '2019-07-01', 'default.gif', 20, 6, 1, 12, 8, '859674632'),
(291, 'Chemiron Blood tonic 200ml', 'Chemiron Blood tonic 200ml', '380.00', '500.00', '2020-08-01', 'default.gif', 30, 3, 1, 3, 8, '63985347'),
(292, 'Ranferon-12 tonic 200ml', 'Ranferon-12 tonic 200ml', '270.00', '500.00', '2020-11-01', 'default.gif', 30, 4, 1, 5, 8, '5239472'),
(293, 'Kunimed natural YEAST 1000', 'Kunimed natural yeastar tablet', '0.85', '5.00', '2020-05-01', 'default.gif', 14, 990, 1, 1000, 8, '85742693'),
(294, 'Natural yeastar tablet', 'Natural yeastar tablet', '180.00', '250.00', '2020-05-01', 'default.gif', 14, 5, 1, 6, 8, '6152110063025'),
(295, 'Passion energy drink', 'Passion energy drink', '76.70', '150.00', '2020-07-01', 'default.gif', 47, 12, 1, 30, 8, '8994757000012'),
(296, 'Supramult syrup 100ml', 'Supramult syrup 100ml', '260.00', '450.00', '2020-12-01', 'default.gif', 15, 2, 1, 2, 8, '8806044013981'),
(297, 'Orheptal blood tonic 300ml', 'Orheptal blood tonic 300ml', '350.00', '500.00', '2020-03-01', 'default.gif', 30, 2, 1, 2, 8, '52836941'),
(298, 'Liquid Iron 200ml B/S', 'Liquid Iron 200ml', '230.00', '450.00', '2020-03-01', 'default.gif', 30, 3, 1, 3, 8, '39852647'),
(299, 'MIM 100ML', 'MIM 100ML', '0.00', '300.00', '', 'default.gif', 15, 3, 1, 3, 8, '847556924'),
(300, 'Robb s/s', 'Robb s/s', '25.00', '50.00', '2021-04-01', 'default.gif', 36, 38, 1, 40, 8, '6033000102669'),
(301, 'M&B paracetamol tab', 'm&b', '31.25', '50.00', '2023-05-1', 'default.gif', 14, 35, 1, 120, 8, '6034000062007'),
(302, 'Emzor paracetamol ', 'emzor', '26.25', '50.00', '2023-02-01', 'default.gif', 14, 82, 1, 120, 8, '6154000033002'),
(303, 'panadol for pain/fever', 'pain&fever', '95.00', '120.00', '2021-04-01', 'default.gif', 48, 11, 1, 30, 8, '6161105661993'),
(304, 'panadol extra', 'extra', '95.00', '130.00', '2021-05-01', 'default.gif', 48, 5, 1, 20, 8, '6161105661986'),
(305, 'clofenac SR 100MG', '100MG', '200.00', '300.00', '2020-12-31', 'default.gif', 14, 9, 1, 10, 8, 'UCLO55'),
(306, 'SUDREX', 'SUDREX', '75.00', '100.00', '2022-09-01', 'default.gif', 14, 17, 1, 44, 8, 'S987666'),
(307, 'ARTHROTEC 75MG', '75MG 200MCG', '550.00', '750.00', '2020-01-01', 'default.gif', 14, 11, 1, 20, 8, '768996'),
(308, 'BRUSTAN -N TAB', 'IBUPROFDEN TAB', '102.00', '200.00', '2021-01-01', 'default.gif', 14, 8, 1, 24, 8, '8901296108284'),
(309, 'BRUSTAN -N SUSPENSION 100ML', 'ORAL SUSPENSION', '240.00', '350.00', '2020-04-01', 'default.gif', 16, 5, 1, 11, 8, '7876654'),
(310, 'B0SKA TAB', 'TAB', '0.00', '100.00', '', 'default.gif', 14, 20, 1, 20, 8, '769988667'),
(311, 'CATAFLAM 50MG', '50MG', '500.00', '700.00', '2019-07-01', 'default.gif', 14, 3, 1, 10, 8, '098965'),
(312, 'CELEBREX 200MG', '200MG', '1700.00', '2300.00', '2020-04-01', 'default.gif', 14, 2, 1, 2, 8, 'JU765444'),
(313, 'CANNON 500MG ORDINARY', '500MG', '27.00', '100.00', '2021-07-01', 'default.gif', 14, 15, 1, 20, 8, '4121B'),
(314, 'CANNON EXTRA', 'EXTRA', '145.00', '200.00', '2023-01-01', 'default.gif', 14, 10, 1, 20, 8, '766545678'),
(315, 'clofenac 50MG', '50MG', '100.00', '200.00', '2021-01-31', 'default.gif', 14, 10, 1, 10, 8, 'UCLO53'),
(316, 'FELXODENE 20MG', '20MG', '0.00', '650.00', '', 'default.gif', 20, 5, 1, 5, 8, '65458'),
(317, 'FELXICAM 20MG', '20MG', '160.00', '200.00', '2020-12-31', 'default.gif', 20, 5, 1, 10, 8, 'UFEL11'),
(318, 'FORPAIN TAB', 'FORPAIN', '85.00', '120.00', '2021-06-01', 'default.gif', 14, 17, 1, 20, 8, 'T443355'),
(319, 'KACHAM TABLET', 'TAB', '120.00', '150.00', '2021-05-01', 'default.gif', 14, 7, 1, 20, 8, '6152110057017'),
(320, 'MIXAGRIP CAPLET', 'CAPLET', '64.00', '100.00', '2022-08-01', 'default.gif', 48, 13, 1, 25, 8, '8995858187558'),
(321, 'NGC BENYLIN SYRUP 100L', 'CHILREN SURUP', '190.00', '250.00', '2021-04-01', 'default.gif', 15, 8, 1, 8, 8, '6156000215617'),
(322, 'COFLIN LINCTUS100ML', '100ML LINCTUS', '180.00', '300.00', '2020-05-01', 'default.gif', 15, 3, 1, 3, 8, '01232'),
(323, 'D-KOFF EXPECTORANT 100ML', 'EXPECTORANT', '260.00', '400.00', '2021-01-01', 'default.gif', 15, 0, 1, 3, 8, '6154000056001'),
(324, 'RETIN-A 0.05% CREAM', '30G CREAM', '2100.00', '2750.00', '2019-09-01', 'default.gif', 23, 1, 1, 1, 8, '655447'),
(325, 'NGC EXPECTORAN 100ML', 'EXPECTORANT', '0.00', '300.00', '', 'default.gif', 15, 3, 1, 3, 8, '6156000215600'),
(326, 'ACTIFED COLD SYRUP 60ML', 'SYRUP 60ML', '600.00', '800.00', '2019-08-01', 'default.gif', 15, 3, 1, 3, 8, '6221045008484'),
(327, 'BEEHIVE BALSAM 200ML', 'AYRTONS', '800.00', '1150.00', '2022-11-01', 'default.gif', 15, 0, 1, 8, 8, '5028268050358'),
(328, 'BRONCHOLYTE SYRUP 100ML', 'SYRUP', '190.00', '400.00', '2021-02-01', 'default.gif', 15, 2, 1, 3, 8, '6156000067636'),
(329, 'COFLIN EXPECTORANT 100ML', 'EXPECTORANT', '220.00', '350.00', '2020-01-01', 'default.gif', 15, 3, 1, 3, 8, 'CO766555'),
(330, 'TUXIL-N  EXPECTORANT 100ML', '100ML', '240.00', '360.00', '2020-05-01', 'default.gif', 15, 1, 1, 2, 8, '6034000140859'),
(331, 'COFEX A/CHILDREN', 'ADULT/C', '180.00', '250.00', '2021-03-01', 'default.gif', 15, 7, 1, 9, 8, '89754645'),
(332, 'TUXIL-D SYRUP 2-12YRS', 'EXPECTORAN', '240.00', '360.00', '2020-05-01', 'default.gif', 15, 2, 1, 2, 8, '6034000140842'),
(333, 'MENTHODEX COUGH MIX 100ML', 'COUGH MIXTURE', '550.00', '700.00', '2021-4-1', 'default.gif', 15, 3, 1, 5, 8, '5017848248032'),
(334, 'COFMIX EXPECTORANT', 'EXPECTORANT', '150.00', '250.00', '2019-12-01', 'default.gif', 15, 2, 1, 2, 8, '6554453345'),
(335, 'COFMIX JUNIOR 100ML', 'JUNIOR', '150.00', '250.00', '2020-01-01', 'default.gif', 15, 2, 1, 2, 8, '998787654'),
(337, 'COFLAX CHILDREN 1OOML', 'CHILDREN', '220.00', '350.00', '2020-12-01', 'default.gif', 15, 2, 1, 3, 8, '6156000081373'),
(338, 'kiss codom', 'kiss', '35.00', '100.00', '2020-07-01', 'default.gif', 49, 35, 1, 72, 8, '76654409'),
(339, 'postinor 2', 'postinor 2', '309.71', '450.00', '2021-06-01', 'default.gif', 14, 4, 1, 22, 8, '5997001359235'),
(340, 'vega* asia', 'asia', '140.00', '300.00', '2020-08-01', 'default.gif', 14, 12, 1, 20, 8, '8906009033563'),
(341, 'proviron tab', 'tab', '1000.00', '1350.00', '2022-04-01', 'default.gif', 14, 2, 1, 2, 8, '4008500115107'),
(342, 'vega plus', 'plus', '140.00', '350.00', '2021-04-01', 'default.gif', 14, 8, 1, 10, 8, '87776hg'),
(343, 'bromergon 2.5mg tab', '2.5mg', '1750.00', '2400.00', '2020-03-01', 'default.gif', 14, 1, 1, 1, 8, '89776555'),
(344, 'Re-vive capsule 400mg', 'cap 400mg', '2800.00', '4300.00', '2019-12-01', 'default.gif', 20, 2, 1, 2, 8, '0076544g'),
(345, 'parlodel 2.5mg', '2.5mg tab', '2550.00', '3000.00', '2019-08-01', 'default.gif', 14, 1, 1, 2, 8, '8698856010032'),
(346, 'Emgyl emzor 200mg', '200mg/5ml/60ml', '150.00', '400.00', '2021-03-01', 'default.gif', 16, 5, 1, 5, 8, '6154000034368'),
(347, 'ORS 27.9MG', '27.9MG', '43.34', '80.00', '2020-12-01', 'default.gif', 16, 11, 1, 15, 8, 'o88776655'),
(348, 'TALEN 3MG', '3MG', '23.34', '50.00', '2022-10-01', 'default.gif', 14, 30, 1, 30, 8, '876543'),
(349, 'TALEN 1.5MG', '1.5MG', '16.67', '30.00', '2020-08-01', 'default.gif', 14, 30, 1, 30, 8, 'H886765544'),
(350, 'FUNGRAL TAB', '200MG', '500.00', '750.00', '2020-06-01', 'default.gif', 14, 3, 1, 3, 8, '8901040210034'),
(351, 'ALABUKUN', 'ALABUKUN', '46.00', '100.00', '2020-05-01', 'default.gif', 43, 81, 1, 100, 8, 'AH66544'),
(352, 'BIOMESTATINE 30ML', 'SUSPENSION', '370.00', '600.00', '2020-03-01', 'default.gif', 16, 3, 1, 3, 8, '8906036360939'),
(353, 'COTTON WOOL 50MG', '50MG', '50.00', '100.00', '2020-01-01', 'default.gif', 22, 10, 1, 10, 8, 'C9876554'),
(354, 'Cotton wooL 200mg', '200mg', '160.00', '250.00', '2020-03-01', 'default.gif', 22, 3, 1, 5, 8, '3EE4556677C'),
(355, 'cotton wool 300mg', '300mg', '280.00', '500.00', '2022-01-01', 'default.gif', 22, 3, 1, 3, 8, '7555443'),
(356, 'cotton wool 50mg', '50mg', '50.00', '100.00', '2020-01-01', 'default.gif', 22, 5, 1, 10, 8, '7654433'),
(357, 'moko liquid 200ml', '200ml', '350.00', '500.00', '2022-03-01', 'default.gif', 50, 2, 1, 2, 8, 'mo76543'),
(358, 'Gripe water 100ml', 'gripe water 100ml', '250.00', '400.00', '2021-3-1', 'default.gif', 50, 3, 1, 6, 8, '5684712'),
(359, 'imodium 6 oral capsule', 'imodium 6 oral capsule', '750.00', '1000.00', '2022-02-01', 'default.gif', 20, 2, 1, 3, 8, '25741896'),
(360, 'Flu-j sirop 100ml', 'Flu-j sirop 100ml', '180.00', '250.00', '2020-02-01', 'default.gif', 15, 4, 1, 5, 8, '6156000045641'),
(361, 'flagyll 200mg', 'Loxagyl 200mg', '40.00', '80.00', '2020-06-01', 'default.gif', 14, 7, 1, 20, 8, '6034000062021'),
(362, 'flagyl 400mg', 'Loxagyl 400mg', '60.00', '100.00', '2020-06-01', 'default.gif', 14, 0, 1, 30, 8, '6034000062038'),
(363, 'Candid-v6 100mg', 'Candid-v6 100mg', '600.00', '850.00', '2021-10-01', 'default.gif', 14, 1, 1, 1, 8, '8904091105816'),
(364, 'Refucil 100ml', 'refucil oral suspension', '450.00', '700.00', '2021-05-01', 'default.gif', 16, 2, 1, 2, 8, '7415632'),
(365, 'COLIPAN 60ML', 'COLIPAN 60ML', '450.00', '650.00', '2021-04-01', 'default.gif', 15, 3, 1, 3, 8, '6156000067643'),
(366, 'NCP 200ML B/S', 'NCP 200ML', '650.00', '800.00', '2022-12-01', 'default.gif', 50, 1, 1, 1, 8, '6156000052311'),
(367, 'Ketoral 200mg tablet', 'Ketoral 200mg tablet', '240.00', '500.00', '2020-10-1', 'default.gif', 14, 10, 1, 10, 8, '12583658'),
(368, 'Gold circle ', 'Gold circle ', '35.50', '100.00', '2021-01-01', 'default.gif', 49, 28, 1, 48, 8, '42589763'),
(369, 'NCP 100ML M/S', 'NCP 100ML M/S', '450.00', '650.00', '2023-01-01', 'default.gif', 50, 2, 1, 3, 8, '6156000052359'),
(370, 'NCP 50ML S/S', 'NCP 50ML S/S', '290.00', '500.00', '2023-03-01', 'default.gif', 50, 3, 1, 3, 8, '6156000090689'),
(371, 'Bonababe syrup 60ml', 'Bonababe syrup 60ml', '160.00', '300.00', '2021-05-01', 'default.gif', 15, 4, 1, 5, 8, '55528634'),
(372, 'Babyrex 60ml', 'Babyrex 60ml', '180.00', '300.00', '2020-03-18', 'default.gif', 15, 4, 1, 5, 8, '25863741'),
(373, 'Piccan teething remedy 100ml', 'Piccan teething remedy 100ml', '2000.00', '2700.00', '2020-11-01', 'default.gif', 15, 2, 1, 2, 8, '5060167870408'),
(374, 'combatrin oral 15ml', 'pyrantrin suspension', '420.00', '600.00', '2021-07-01', 'default.gif', 16, 2, 1, 3, 8, '6156000052373'),
(375, 'Ca-c 1000mg sandoz', 'Ca-c 1000mg sandoz', '1285.00', '1750.00', '2020-05-01', 'default.gif', 43, 3, 1, 5, 8, '36985247'),
(376, 'combatrin tab 125mg', 'Pyrantrin 125mg', '380.00', '480.00', '2021-07-01', 'default.gif', 14, 7, 1, 10, 8, '8547269'),
(377, 'Galways 100ml skg', 'Galways 100ml', '160.00', '300.00', '2019-02-01', 'default.gif', 15, 6, 1, 6, 8, '52741934'),
(378, '7 KEYS HERBAL MIXTURE 200L', '7 KEYS HERBAL MIXTURE 200L', '450.00', '600.00', '2020-05-01', 'default.gif', 28, 5, 1, 7, 8, '6152110041627'),
(379, 'Flucamed 50mg', 'Flucamed 50mg', '750.00', '950.00', '2021-11-01', 'default.gif', 20, 2, 1, 2, 8, '6156000127569'),
(380, 'Predicure 5mg', 'Predicure 5mg', '25.00', '100.00', '2021-04-01', 'default.gif', 14, 13, 1, 20, 8, '6156000152639'),
(381, 'Diastop suspension 200mg', 'Diastop suspension 200mg', '150.00', '250.00', '2020-08-01', 'default.gif', 16, 5, 1, 5, 8, '25416398'),
(382, 'Stugeron 50 tabletas orals', 'Stugeron 50 tabletas orals', '220.00', '400.00', '2020-04-01', 'default.gif', 14, 4, 1, 5, 8, '8523741'),
(383, 'Ayrtons touch and go', 'Ayrtons touch and go', '400.00', '550.00', '2022-07-01', 'default.gif', 43, 0, 1, 3, 8, '63547125'),
(384, 'Vermox 500mg', 'Vermox 500mg', '420.00', '600.00', '2020-02-01', 'default.gif', 14, 0, 1, 6, 8, '5682471'),
(385, 'Belax tablets', 'Belax tablets', '35.00', '70.00', '2019-11-01', 'default.gif', 14, 10, 1, 10, 8, '2514963'),
(386, 'osymoral ', 'chymoral', '183.34', '200.00', '2020-7-1', 'default.gif', 14, 1, 1, 9, 8, '8904185704642'),
(387, 'zentel albendazol', 'abendazole', '315.00', '450.00', '2021-09-01', 'default.gif', 14, 2, 1, 10, 8, '765444332'),
(388, 'silver bird 28ml', '28ml', '700.00', '900.00', '2022-5-1', 'default.gif', 33, 1, 1, 2, 8, '5017848251537'),
(389, 'meko brand inhaler', 'inhaler', '116.67', '200.00', '2021-01-21', 'default.gif', 33, 3, 1, 6, 8, '87u766554'),
(390, 'strepsil comfort', 'comfort', '193.34', '500.00', '2019-10-01', 'default.gif', 14, 10, 1, 15, 8, '6295120023051'),
(391, 'strepsils original', 'original', '600.00', '750.00', '2020-05-01', 'default.gif', 28, 2, 1, 2, 8, '5000158103764'),
(392, 'pectol 36st', 'pectol', '40.27', '50.00', '2020-04-01', 'default.gif', 14, 25, 1, 72, 8, 'u7y76564e4'),
(393, 'meprasil 20m', 'omeprazole 20mg', '450.00', '600.00', '2020-03-01', 'default.gif', 20, 3, 1, 6, 8, '9o989896767'),
(394, 'Danacid 12*8', 'danacid', '23.34', '50.00', '2021-06-01', 'default.gif', 14, 17, 1, 36, 8, '6154000040239'),
(395, 'Danacid 1000 tab', '1000tab', '1.80', '5.00', '2021-05-01', 'default.gif', 28, 984, 1, 1000, 8, '6154000040246'),
(396, 'paucodine cimetidine 200mg', 'cimetidine', '110.00', '300.00', '2020-03-01', 'default.gif', 48, 5, 1, 5, 8, '875rtr4'),
(397, 'nkoyo cimetidine 400mg', '400m4', '150.00', '350.00', '2020-11-01', 'default.gif', 14, 3, 1, 5, 8, 'ki7766554'),
(398, 'Gestid tasty chewable tab', 'chweable', '190.00', '250.00', '2021-01-01', 'default.gif', 14, 0, 1, 5, 8, '8901296107515'),
(399, 'Gascol antacid', 'antacid', '530.00', '700.00', '2021-04-01', 'default.gif', 16, 2, 1, 3, 8, '6034000140767'),
(400, 'jawasil antacid 200ml', 'antacid suspension', '400.00', '1600.00', '2020-2-1', 'default.gif', 16, 2, 1, 3, 8, 'bt54433'),
(401, 'stopacid 200ml', '200ml', '320.00', '520.00', '2021-04-01', 'default.gif', 16, 2, 1, 2, 8, '987665'),
(402, 'sivocid omeprazole 20mg', 'ordinary omep', '130.00', '450.00', '2020-01-01', 'default.gif', 14, 0, 1, 3, 8, 'vvcyu776r'),
(403, 'magsil suspension', 'suspensiopn', '180.00', '500.00', '2020-04-01', 'default.gif', 16, 3, 1, 3, 8, '989nnbb'),
(404, 'ULGICID ANTACID 200ML', 'ANTACID 200ML', '600.00', '850.00', '2020-12-01', 'default.gif', 16, 2, 1, 4, 8, 'bx453356'),
(405, 'RELCER GEL 100ML', 'RELCER 100ML', '220.00', '400.00', '2019-03-01', 'default.gif', 41, 4, 1, 7, 8, '8904091117734'),
(406, 'GESTID SUSPENSION 200ML', '200ML', '420.00', '600.00', '2020-04-01', 'default.gif', 16, 2, 1, 5, 8, 'YTTFFT788876'),
(407, 'GESTID SUSPENSION 100ML', '100ML', '300.00', '450.00', '2019-05-01', 'default.gif', 16, 2, 1, 2, 8, '876587'),
(408, 'P-ALAXIN tab', 'P-ALAXIN', '630.00', '800.00', '2018-11-1', 'default.gif', 14, 2, 1, 7, 9, '8906009234649'),
(409, 'FYNALE FORTE TABLET', 'ANTI-MALARIA', '450.00', '750.00', '2020-03-01', 'default.gif', 14, 5, 1, 8, 9, 'YT777987'),
(410, 'LONART-DS MALARIA TAB', 'ARTEMETHER ', '900.00', '1200.00', '2020-12-01', 'default.gif', 14, 0, 1, 12, 9, '8906009238180'),
(411, 'COMBISUNATE 80/480', '80/40', '3900.00', '600.00', '2019-08-01', 'default.gif', 14, 12, 1, 12, 8, '8901111006818'),
(412, 'WHITFIELDS OINTMENT', '20G', '220.00', '350.00', '2021-02-01', 'default.gif', 36, 3, 1, 5, 8, '6575444'),
(413, 'QUADRICLEAR CREAM', 'CREAM', '600.00', '800.00', '2020-07-01', 'default.gif', 23, 2, 1, 2, 8, 'YU87GT6'),
(414, 'OLFEN GEL 50G', 'GEL', '1250.00', '1750.00', '2019-09-01', 'default.gif', 41, 1, 1, 2, 8, '7640153080561'),
(415, 'SIVOROMYCIN 30 0RAL SUSP', 'AZITHROMYCIN', '0.00', '0.00', '00000', 'default.gif', 16, 0, 1, 0, 8, '09876432'),
(416, 'ULSAKIT ', 'ULSAKIT', '2650.00', '3700.00', '2020-06-01', 'default.gif', 41, 2, 1, 2, 8, '98777665'),
(417, 'ANACIN', 'TAB', '6.25', '100.00', '2021-05-01', 'default.gif', 14, 65, 1, 73, 8, '4Y9877656'),
(418, 'BIOBETIC CAP', 'CAP', '833.34', '1100.00', '2019-08-01', 'default.gif', 20, 3, 1, 3, 8, 'TRE56667'),
(419, 'PYTHROCIN 500MG', 'AZITHROMYCIN', '550.00', '1000.00', '2020-11-01', 'default.gif', 14, 1, 1, 2, 8, 'U76GFT6'),
(420, 'em-vit-c orange 100mg', '100mg', '230.00', '300.00', '2021-04-01', 'default.gif', 14, 8, 1, 10, 8, '6154000033422'),
(421, 'flex condom', 'stamina', '100.00', '200.00', '2020-05-01', 'default.gif', 49, 25, 1, 48, 8, '8852961011081'),
(422, 'Clofencol susp 125mg', '100ml', '400.00', '550.00', '2020-06-01', 'default.gif', 16, 2, 1, 2, 8, '67655444'),
(423, 'calpol syrup', 'calpol paracetamol', '270.00', '350.00', '2020-01-01', 'default.gif', 15, 5, 1, 5, 8, '6161105660194'),
(424, 'lofnac tab 100mg', '100mg', '60.00', '200.00', '2019-09-01', 'default.gif', 14, 19, 1, 20, 8, '776rr4f6'),
(425, 'Rexifen cap 400mg', 'cap400mg', '75.00', '150.00', '2020-12-01', 'default.gif', 20, 0, 1, 10, 8, '7654d4f'),
(426, 'Durex unicon condom', 'condom', '81.25', '100.00', '2020-05-01', 'default.gif', 49, 8, 1, 24, 8, '05052197044409'),
(427, 'Nurofen express 200mg', '200mg', '938.34', '1100.00', '2019-07-01', 'default.gif', 20, 0, 1, 3, 8, '6009695933444'),
(428, 'nurofen 400mg', '400mg', '933.34', '1150.00', '2019-12-01', 'default.gif', 14, 1, 1, 3, 8, '6009695933499'),
(429, 'Gaviscon liquid', 'liquid peppermint', '1413.34', '1600.00', '2020-04-01', 'default.gif', 15, 2, 1, 3, 8, '5000158068766'),
(430, 'Dettol 250ml', '250ml', '718.34', '850.00', '2021-05-01', 'default.gif', 51, 1, 1, 3, 10, '50158911'),
(431, 'Harpic pwer plus', 'power plus', '526.67', '650.00', '2020-07-01', 'default.gif', 51, 3, 1, 3, 10, 'h96555444'),
(432, 'dettol soap skincare', 'skincare', '243.34', '300.00', '2021-04-01', 'default.gif', 24, 4, 1, 6, 10, '6009695934458'),
(433, 'Dettol 100x cool', '100xcool', '148.34', '170.00', '2019-11-01', 'default.gif', 24, 2, 1, 6, 10, '6009695931044'),
(434, 'Dettol soap original', 'original', '148.34', '170.00', '2020-05-01', 'default.gif', 24, 5, 1, 6, 10, '6009695931006'),
(435, 'Dettol 125ml', '125ml', '390.00', '500.00', '2021-05-01', 'default.gif', 51, 1, 1, 3, 10, '50158904'),
(436, 'Jik 101 stains 475ml', '101 stains  475ml', '280.00', '350.00', '2020-07-01', 'default.gif', 51, 3, 1, 3, 10, '6009695934649'),
(437, 'MORTEIN POWERGRD', 'POWERGARD', '750.00', '800.00', '2019-04-01', 'default.gif', 51, 2, 1, 6, 8, '6009695930764'),
(438, 'V-TAB SALBUTAMOL 2MG', '2MG', '75.00', '150.00', '2020-11-01', 'default.gif', 14, 10, 1, 10, 8, '7654433U'),
(439, 'MORTEIN INSTA 400ML', 'MULTI INSECT KILLER', '656.67', '800.00', '2020-06-01', 'default.gif', 52, 2, 1, 3, 10, '6009695934526'),
(440, 'Amlodipine 10mg', '10mg', '190.00', '400.00', '2022-09-01', 'default.gif', 14, 1, 1, 12, 8, '5017007023371'),
(441, 'Amlodipine 5mg', '5mg', '160.00', '350.00', '2022-03-01', 'default.gif', 14, 3, 1, 8, 8, '5017007023364'),
(442, 'DARTEMAL ARTEMETHER', 'ARTEMETHER', '300.00', '800.00', '2020-08-01', 'default.gif', 14, 4, 1, 10, 8, '887667655'),
(443, 'VEET HAIR REM0VAL', 'SENSITIVE SKIN', '796.67', '1500.00', '2020-02-01', 'default.gif', 23, 3, 1, 3, 8, '6009695935127'),
(444, 'STREPSILS INTENSIVE', 'INTENSIVE', '664.17', '850.00', '2020-11-01', 'default.gif', 14, 1, 1, 6, 8, '5000158106611'),
(445, 'VEET HAIR REM0VAL LOTUS MILK', 'NORMAL SKIN', '796.67', '1300.00', '2021-02-01', 'default.gif', 23, 3, 1, 3, 10, '6009695935134');
INSERT INTO `product` (`prod_id`, `prod_name`, `prod_desc`, `prod_cost_price`, `prod_price`, `exp_date`, `prod_pic`, `cat_id`, `prod_qty`, `branch_id`, `reorder`, `supplier_id`, `serial`) VALUES
(446, 'DUREX FETNERLITE', 'FETHERLITE', '520.83', '800.00', '2022-10-01', 'default.gif', 49, 5, 1, 12, 8, '5010232953994'),
(447, 'RE-VIVE CAP SMALL', 'SMALL', '19650.00', '2200.00', '2019-12-01', 'default.gif', 20, 10, 1, 10, 8, '908655444'),
(448, 'JIK 950ML', 'JIK950ML', '481.67', '600.00', '2020-07-01', 'default.gif', 51, 2, 1, 3, 8, 'I98977766'),
(449, 'Piroxicam capsule 20mg', 'cap 20mg', '25.00', '70.00', '2022-2-1', 'default.gif', 20, 10, 1, 20, 8, 'k99877665'),
(450, 'siprosan 500mg', '500mg', '69.00', '800.00', '2020-09-1', 'default.gif', 14, 1, 1, 2, 8, '90776654'),
(451, 'Amatem forte softgel', 'softgel', '800.00', '1100.00', '2020-10-01', 'default.gif', 20, 2, 1, 8, 8, '8906044917507'),
(452, 'lornat ds', 'lonart ds', '800.00', '1200.00', '2020-12-1', 'default.gif', 14, 5, 1, 6, 8, '87876665'),
(453, 'L-flox-750', '750mg', '800.00', '1000.00', '2020-12-1', 'default.gif', 14, 4, 1, 5, 8, '1586723964786'),
(454, 'Artesunat 160MG/80ML', '160MG/80ML', '700.00', '850.00', '2021-3-1', 'default.gif', 16, 4, 1, 5, 8, '8934574320122'),
(455, 'Malanter DS', '6TABLE ANTI-MALARIA', '260.00', '500.00', '2020-12-1', 'default.gif', 14, 2, 1, 5, 8, '8904185703430'),
(456, 'COMBIART 24 ACTM ', 'ANTI-MALARIA', '400.00', '500.00', '2019-6-1', 'default.gif', 14, 5, 1, 5, 8, '8902501015304'),
(457, 'Bcomplex 1000 TAB', 'EM-B-PLEX1000 TAB', '0.55', '1.00', '2021-06-01', 'default.gif', 14, 680, 1, 1000, 8, '6154000033309'),
(458, 'AMINOPHYLLINE .INJ. 250MG', 'SIVOLLINE', '30.00', '50.00', '2020-08-01', 'default.gif', 34, 50, 1, 50, 8, '334456T7789'),
(459, 'AMINOPHYLLINE TAB', 'TAB', '1.80', '3.00', '2021-01-01', 'default.gif', 14, 929, 1, 1000, 8, '18906062950804'),
(460, 'WATER FOR INJECTION', '50 WATER', '1500.00', '70.00', '2020-1-1', 'default.gif', 32, 49, 1, 50, 8, '443342324'),
(461, 'EXAMINATION GLOVE', 'GLOVE', '12.00', '50.00', '2022-12-1', 'default.gif', 27, 100, 1, 100, 8, '680577895225'),
(462, 'NORMAL SALINE 0.9', '0.9', '140.00', '200.00', '2021-4-1', 'default.gif', 32, 10, 1, 10, 8, 'NS5454343'),
(463, 'DEXTROSE 5%', '5%', '140.00', '200.00', '2021-4-1', 'default.gif', 14, 10, 1, 10, 8, '5443328'),
(464, 'DEXTROSE SALINE 5%', '5%', '140.00', '200.00', '2021-5-1', 'default.gif', 14, 10, 1, 10, 8, '6544409'),
(465, 'OSYMAL FORTE', '6TAB', '260.00', '800.00', '2020-7-1', 'default.gif', 14, 10, 1, 10, 8, '8904185706462'),
(466, 'EXAMINATION GLOVE BOX', 'BOX', '1200.00', '1300.00', '3030-1-1', 'default.gif', 27, 1, 1, 1, 8, '680577895225'),
(467, 'AQUAMAL QS 80/480', '80/480', '260.00', '500.00', '2020-10-1', 'default.gif', 14, 4, 1, 10, 8, '347777'),
(468, 'LORATADINE AFRAB SYRUP', '5MG/5ML', '350.00', '450.00', '2021-6-1', 'default.gif', 15, 4, 1, 5, 8, '4533333'),
(469, 'CATHETER 16', '16', '2200.00', '300.00', '2021-11-1', 'default.gif', 21, 10, 1, 10, 8, '4032855109665'),
(470, 'CREPE BANDAGE 4', 'SIZE 4', '141.67', '200.00', '2021-8-1', 'default.gif', 28, 12, 1, 12, 8, '788989986'),
(471, 'METRONE IV 500MG', 'METRONIDAZOLE INF', '1100.00', '200.00', '2020-5-1', 'default.gif', 32, 10, 1, 10, 8, '55533M77'),
(472, 'CIPROFLOXACIN INFUSION', '200MG/100ML', '150.00', '250.00', '2019-10-1', 'default.gif', 32, 10, 1, 10, 8, '8901086030559'),
(473, '2ML SYRINGES', '2ML', '12.00', '30.00', '2022-11-01', 'default.gif', 25, 96, 1, 100, 8, '7865534322'),
(474, '5ML SYRINGES', '5ML', '15.00', '40.00', '2022-09-01', 'default.gif', 25, 95, 1, 100, 8, '5ML876544'),
(475, 'EMZOLYN EXPECTORANT', '100ML', '170.00', '250.00', '2021-6-1', 'default.gif', 14, 3, 1, 5, 8, '6154000034139'),
(476, 'LONART TAB 24', '24', '350.00', '600.00', '2020-9-1', 'default.gif', 14, 0, 1, 5, 8, '8906009233482'),
(477, 'LEVER ARTESUNATE', 'ARTESUNATE 50MG', '480.00', '700.00', '2020-1-1', 'default.gif', 14, 5, 1, 5, 8, '6928623000013'),
(478, 'EMVITE MULTIVIT 100', '100 TAB', '180.00', '250.00', '2021-2-1', 'default.gif', 14, 3, 1, 3, 8, '6154000033507'),
(479, 'FOLIC ACID 5MG', 'ACID 5MG', '200.00', '300.00', '2020-12-1', 'default.gif', 14, 1, 1, 3, 8, '6154000033521'),
(480, 'EM-B-PLEX 100ML TAB', '100ML TAB', '150.00', '250.00', '2021-4-1', 'default.gif', 14, 2, 1, 3, 8, '6154000033514'),
(481, 'EMAL INJECTION 150MG', '150MG/2ML', '1800.00', '2350.00', '2021-2-1', 'default.gif', 34, 3, 1, 4, 8, '5443332'),
(482, 'LONART DISPERSIBLE', '120MG DISPERSIBLE', '180.00', '250.00', '2019-12-1', 'default.gif', 14, 1, 1, 3, 8, '8766556445'),
(483, 'DIABETMIN 500MG', 'METFORMIN', '150.00', '250.00', '2029-7-31', 'default.gif', 14, 29, 1, 30, 8, 'UDIA77'),
(484, 'AMALAR ', 'AMALAR 50X3', '110.00', '200.00', '2022-02-01', 'default.gif', 14, 48, 1, 50, 8, 'AM44333'),
(485, 'ARTESUNAT TAB 50MG ', 'TAB 50MG', '550.00', '750.00', '2020-10-12', 'default.gif', 14, 8, 1, 10, 8, '8934574010511'),
(486, 'AMATEM FORTE 1X6', 'FORTE', '650.00', '900.00', '2019-09-01', 'default.gif', 14, 2, 1, 10, 8, '8906016837604'),
(487, 'TUXIL-N FOR ADULT', 'COUGH & COLD', '250.00', '360.00', '2020-5-1', 'default.gif', 15, 4, 1, 5, 8, '6034000140521'),
(488, 'CYPRON 30CAPLET', '30CAPLET', '250.00', '250.00', '2021-10-1', 'default.gif', 14, 13, 1, 15, 8, '789000'),
(489, 'SYNRIAM 150+750MG', '150+750MG 3 TAB', '670.00', '900.00', '2020-1-1', 'default.gif', 14, 0, 1, 5, 8, '8901296040393'),
(490, 'THALAZOLE 500MG', '500MG', '13.40', '20.00', '2022-10-1', 'default.gif', 14, 497, 1, 500, 8, '544332111'),
(491, 'SULPHATRIAD 500MG', '500MG', '14.00', '20.00', '2023-1-1', 'default.gif', 14, 500, 1, 500, 8, '787YY7665'),
(492, 'CIPROTAB-TN 10SOFLETS', '10 SOFLETS', '1100.00', '1500.00', '2020-3-1', 'default.gif', 14, 3, 1, 6, 8, '8906001822035'),
(493, 'Camosunate Adult ', 'Camosunate 300mg/100mg', '470.00', '600.00', '2020-05-01', 'default.gif', 14, 4, 1, 5, 8, '6928623000419'),
(494, 'Camosunate junior(7-13years)', '300mg-100mg', '450.00', '600.00', '2020-8-1', 'default.gif', 14, 3, 1, 5, 8, '6928623000082'),
(495, 'Camosunate children powder', '150mg/50mg', '430.00', '600.00', '2020-10-1', 'default.gif', 14, 4, 1, 5, 8, '6928623000341'),
(496, 'Moko mist.mag trisilicate', '200ml', '180.00', '250.00', '2021-06-01', 'default.gif', 16, 4, 1, 5, 8, '741036958'),
(497, 'Coatal-forte 80/480', '80/480', '390.00', '600.00', '2020-12-1', 'default.gif', 14, 0, 1, 10, 8, '25496327'),
(498, ' Waipa Act comprimes', '12 comprimes', '430.00', '600.00', '2022-01-01', 'default.gif', 14, 8, 1, 10, 8, '6152110056980'),
(499, 'Ngc expectorant cough syrup 100ml', 'Ngc expectorant cough syrup', '200.00', '300.00', '2021-3-1', 'default.gif', 15, 2, 1, 3, 8, '6156000215600'),
(500, 'avonum 25mg', '25mg', '90.00', '200.00', '2020-12-01', 'default.gif', 14, 8, 1, 10, 8, '12387656'),
(501, 'robinax 500mg', '500mg', '320.00', '500.00', '2020-10-1', 'default.gif', 14, 6, 1, 10, 8, '23165498'),
(502, 'atadyn 10mg', '10mg', '94.00', '150.00', '2019-12-01', 'default.gif', 14, 18, 1, 30, 8, '945300987'),
(503, 'accu-chek active', 'test strip', '4200.00', '5700.00', '2019-08-01', 'default.gif', 53, 1, 1, 1, 8, '4015630064007'),
(504, 'asomex-5', '5mg', '933.40', '1200.00', '2021-01-01', 'default.gif', 14, 6, 1, 6, 8, '8902319010607'),
(505, 'swibetic 5/500mg', '500mg', '200.00', '300.00', '2020-05-1', 'default.gif', 14, 9, 1, 9, 8, '8906035499326'),
(506, 'swidar', 'tab', '220.00', '300.00', '2022-11-1', 'default.gif', 14, 7, 1, 10, 8, '432789032'),
(507, 'tutolin children cough syrup', 'tutolin children cough syrup', '150.00', '300.00', '2019-7-23', 'default.gif', 15, 5, 1, 5, 8, '3765982098'),
(508, 'tutolin expectorant', 'tutolin expectorant', '150.00', '300.00', '2020-3-22', 'default.gif', 15, 5, 1, 5, 8, '43218765'),
(509, 'hydrogen peroxide', 'hydrogen peroxide', '130.00', '200.00', '2020-12-1', 'default.gif', 51, 7, 1, 10, 8, '324561276'),
(510, 'mavin 500mg', 'mavin 500mg', '480.00', '700.00', '2020-07-01', 'default.gif', 14, 0, 1, 2, 8, '354210987'),
(511, 'andrews liver salts', 'andrews liver salts', '36.00', '100.00', '2019-07-01', 'default.gif', 16, 41, 1, 50, 8, '6161105660286'),
(512, 'moko iodin 15ml', 'moko iodin 15ml', '180.00', '300.00', '2021-4-1', 'default.gif', 54, 9, 1, 10, 8, '22334543'),
(513, 'nemether injection 80ml', 'nemether injection 80ml', '240.00', '400.00', '2020-5-1', 'default.gif', 34, 4, 1, 5, 8, '65432211'),
(514, 'moko gentian paint 60ml', 'moko gentian paint 60ml', '80.00', '200.00', '2021-2-1', 'default.gif', 54, 10, 1, 10, 8, '765432'),
(515, 'agaryplast', 'agaryplast', '500.00', '700.00', '2020-09-01', 'default.gif', 37, 1, 1, 4, 8, '765434221'),
(516, 'urine bag', 'urine bag', '120.00', '300.00', '2021-06-1', 'default.gif', 26, 10, 1, 10, 8, '32117665544'),
(517, 'moko alcool isopropylique', 'moko alcool isopropylique', '270.00', '370.00', '2021-5-1', 'default.gif', 18, 1, 1, 3, 8, '6156000058719'),
(518, '23G NEEDLES', '23G NEEDLES', '4.50', '10.00', '2022-11-01', 'default.gif', 35, 200, 1, 200, 8, '8776656543'),
(519, '22G NEEDLES', '22G NEEDLES', '4.50', '10.00', '2021-09-01', 'default.gif', 35, 197, 1, 200, 8, '65544321'),
(520, 'FESULF 1000', 'FERROUS', '0.60', '2.00', '2021=5-1', 'default.gif', 14, 900, 1, 1000, 8, '35544227'),
(521, 'LONART 20/120', 'LONART 20/120', '700.00', '1000.00', '2020-07-01', 'default.gif', 16, 2, 1, 3, 8, '6554432876'),
(522, 'EVA WATER 100ML', '100ML', '90.00', '100.00', '2020-12-1', 'default.gif', 29, 9, 1, 72, 8, '346789'),
(523, 'EVA WATER 150ML', '15OML', '108.50', '150.00', '2020-12-1', 'default.gif', 29, 10, 1, 36, 8, 'EV232144'),
(524, 'MODURETIC 100 TAB', '100 TAB', '140.00', '250.00', '2020-10-1', 'default.gif', 14, 6, 1, 10, 8, '87654543'),
(525, 'BOSKA ', 'BOSKA tab', '80.00', '100.00', '2021-10-01', 'default.gif', 14, 12, 1, 20, 8, '8776666543'),
(526, 'p-alaxin suspension 24g', 'suspension 24g', '600.00', '900.00', '2019-10-1', 'default.gif', 16, 3, 1, 3, 8, '8906009238227'),
(527, 'pregnancy test strip', 'p strip', '16.00', '100.00', '2021-10-1', 'default.gif', 53, 32, 1, 50, 8, '099877666'),
(528, 'buscopam tab', 'tab', '150.00', '250.00', '2020-9-1', 'default.gif', 14, 13, 1, 23, 8, '655544443'),
(529, 'emzor syrup 60ml', '60ml', '120.00', '250.00', '2021-3-1', 'default.gif', 15, 0, 1, 10, 8, '3773653'),
(530, 'LADY CARE', 'LADY CARE', '225.00', '300.00', '2020-6-1', 'default.gif', 55, 2, 1, 6, 13, '6951794143234'),
(531, 'COMFIT PAD', 'NEW COMFIT', '375.00', '500.00', '2020-6-1', 'default.gif', 55, 24, 1, 30, 13, '616932101021'),
(532, 'MOLFIX WIPE', 'WIPE', '375.00', '450.00', '2020-5-1', 'default.gif', 57, 1, 1, 2, 13, '8690536855100'),
(533, 'FAMILIA TISSUE', 'TISSUE', '95.41', '100.00', '2021-9-1', 'default.gif', 56, 5, 1, 24, 13, '8690536023127'),
(534, 'MOLFIX DIAPER MIDI', '3 midi 4-9kg', '375.00', '500.00', '2021-7-1', 'default.gif', 58, 0, 1, 2, 13, '8690536816477'),
(535, 'RAVIMAL CAPLET', 'ADULT CAPLET', '350.00', '800.00', '2019-12-1', 'default.gif', 48, 6, 1, 30, 8, '544456778'),
(536, 'molfix mini 40pcs', '2mini 3-6kg 40', '1600.00', '1850.00', '2021-6-1', 'default.gif', 58, 2, 1, 2, 13, '8690536816453'),
(537, 'molfix 3midi 36pcs', '3midi', '1600.00', '1850.00', '2021-8-1', 'default.gif', 58, 2, 1, 2, 13, '8690536816484'),
(538, 'augmentin susp 228,5mg', '5ml', '1600.00', '2300.00', '2019-12-1', 'default.gif', 16, 2, 1, 3, 8, '55677876'),
(540, 'ampicilin 500mg', 'ampicilin 500mg', '110.00', '200.00', '2021-02-01', 'default.gif', 20, 8, 1, 10, 8, '90878678'),
(541, 'ampicilin 250mg', 'ampicilin 250 mg', '60.00', '100.00', '2020-10-01', 'default.gif', 51, 10, 1, 10, 8, '768778'),
(542, 'spex inhaler', 'inhaler', '78.00', '300.00', '2020-03-13', 'default.gif', 33, 7, 1, 18, 8, '8851467503618'),
(543, 'penicillin ointiment Ophthalimic', 'penicillin Ophthalimic', '150.00', '300.00', '2021-07-01', 'default.gif', 51, 5, 1, 5, 8, '23154321'),
(544, 'EMVITE SYRUP', 'MULTIVIATAMIN ', '170.00', '250.00', '2021-05-01', 'default.gif', 15, 5, 1, 5, 8, '6154000033392'),
(545, 'Ferobin plus syrup  ', 'frerobin 200ml syrup', '420.00', '650.00', '2020-10-01', 'default.gif', 15, 3, 1, 3, 8, '5430987'),
(546, 'pregnacare original ', 'pregnacare original', '1375.00', '1900.00', '2020-09-01', 'default.gif', 48, 7, 1, 8, 8, '5021265245727'),
(547, 'liquid Bcomplex', 'liquid bcomplex caps', '1900.00', '2650.00', '2019-08-01', 'default.gif', 48, 1, 1, 1, 8, '311845060112'),
(548, 'diarrex loperamide', 'diarrex loperamide bp 2mg', '50.00', '200.00', '2029-05-01', 'default.gif', 20, 2, 1, 10, 8, '4321765'),
(549, 'vitamin c 1000mg', 'vitamin c 1000mg', '25.00', '50.00', '2020-02-01', 'default.gif', 48, 0, 1, 100, 9, '713757084802'),
(550, 'paracetamolinjection', 'paracetamol injection', '25.00', '100.00', '2020-02-01', 'default.gif', 34, 8, 1, 10, 9, '6906900203258'),
(551, 'lyntriaxone ceftriaxone inj', 'ceftriaxone inj', '550.00', '8000.00', '2020-10-01', 'default.gif', 34, 12, 1, 12, 9, '6554444f55'),
(552, 'Cafergot 1/100mg', 'cafergot 100mg', '550.00', '800.00', '2021-01-01', 'default.gif', 14, 0, 1, 2, 9, '23456789'),
(553, 'Actifed tab', 'actifed tab', '83.34', '100.00', '2021-04-01', 'default.gif', 14, 10, 1, 12, 14, '6221045010159'),
(554, 'KENACIN CIPROFLOXACIN ', 'TAB', '350.00', '800.00', '2020-09-01', 'default.gif', 14, 2, 1, 10, 15, '434465688998'),
(555, 'CIFRAN 500MG', 'CIFRAN 500MG', '1400.00', '1800.00', '2021-04-01', 'default.gif', 14, 1, 1, 5, 8, '8901296103937'),
(556, 'NIFEGEM RETARD20MG', 'NIFEGEM RETARD', '250.00', '400.00', '2020-03-01', 'default.gif', 14, 9, 1, 10, 8, '543210987'),
(557, 'NIFEDIN DEXCEL 20 RETARD', '20 RETARD', '275.00', '400.00', '2020-01-01', 'default.gif', 14, 4, 1, 6, 8, '454333335'),
(558, 'flexodene 20mg', 'piroxicam', '500.00', '650.00', '2020-08-01', 'default.gif', 14, 5, 1, 5, 8, '65544443'),
(559, 'tatanus injection', 'injection', '50.00', '100.00', '2020-05-01', 'default.gif', 34, 2, 1, 3, 8, '23145434'),
(560, 'vitamin E Softgels', 'vitamin E jiangang', '16.00', '25.00', '2020-06-06', 'default.gif', 20, 29, 1, 100, 8, '6945654106071'),
(561, 'contiflo xl', 'contiflo xl 400 micrograms', '800.00', '1200.00', '2019-12-01', 'default.gif', 14, 1, 1, 1, 14, '5015525030512'),
(562, 'lisinopril 10mg', 'lisinopril', '175.00', '290.00', '2021-01-01', 'default.gif', 14, 0, 1, 2, 14, '8904159401058'),
(563, 'lisinopril 5mg', 'lisinopril5mg', '175.00', '250.00', '2020-11-01', 'default.gif', 14, 0, 1, 2, 14, '8904159401041'),
(564, 'ibex capsules', 'ibex capsules', '150.00', '250.00', '2020-07-01', 'default.gif', 14, 2, 1, 10, 14, '8901040217088'),
(565, 'livolin fort softgel capsules', 'livolin fort ', '650.00', '920.00', '2020-03-04', 'default.gif', 20, 3, 1, 3, 14, '8850769013207'),
(566, 'ampiclox unbranded', 'ampiclox unbranded', '105.00', '200.00', '2021-04-01', 'default.gif', 20, 6, 1, 10, 14, '65432876'),
(567, 'simvastatin 20mg talets', 'simvastatin 20mg tablets', '680.00', '900.00', '2020-10-01', 'default.gif', 14, 0, 1, 1, 14, '5017123300233'),
(568, 'simvastatin 10mg talets', 'simvastatin10mg', '500.00', '700.00', '2020-09-01', 'default.gif', 14, 1, 1, 1, 14, '5017123299230'),
(569, 'losargen 50mg', 'losargen 50mg', '150.00', '300.00', '2021-01-01', 'default.gif', 14, 20, 1, 20, 14, '4327654'),
(570, 'tribinat cefuroxime 500mg', 'cefuroxime  500mg tribinat tablets', '1300.00', '1800.00', '2020-04-01', 'default.gif', 48, 2, 1, 2, 14, '43265544'),
(573, 'ERYTHROMYCINE ETHY 125/5ML', 'TUYIL PHARM', '250.00', '800.00', '2020-05-06', 'default.gif', 16, 4, 1, 5, 8, '5678345'),
(575, 'Dettol 75ml', 'dettol 75', '220.00', '300.00', '2021-06-01', 'default.gif', 51, 2, 1, 6, 8, '60050267'),
(576, 'cefsafe-500', 'cefuroxime axetil', '800.00', '1350.00', '2019-11-01', 'default.gif', 14, 3, 1, 3, 8, '776544678'),
(577, 'pregnacare max', ' max', '3250.00', '4700.00', '2019-09-01', 'default.gif', 48, 2, 1, 2, 8, '5021265244843'),
(578, 'pregncare bf', 'breastfeeding', '2750.00', '3800.00', '2020-02-01', 'default.gif', 48, 1, 1, 1, 8, '5021265232062'),
(579, 'viskodine loratadine', 'visk loratadine', '90.00', '130.00', '2021-02-01', 'default.gif', 14, 23, 1, 30, 8, '8904176818099'),
(580, 'MANGERO WATER', 'WATER', '50.00', '100.00', '2019-07-23', 'default.gif', 59, 28, 1, 84, 8, '705632635353'),
(581, 'Reload Immunity', 'Reload Immunity', '3970.00', '5300.00', '2021-04-01', 'default.gif', 48, 2, 1, 2, 8, '615225000287'),
(582, 'Reload infant drop', 'Reload infant drop', '2510.00', '3750.00', '2021-01-01', 'default.gif', 40, 2, 1, 2, 16, '615225000393'),
(583, 'setral - 50', 'setral - 50', '890.00', '1200.00', '2019-08-01', 'default.gif', 14, 2, 1, 2, 16, '8902305003255 '),
(584, 'Atadyn syrup loratadine oral', 'atadyn oral solution', '575.00', '800.00', '2020-10-01', 'default.gif', 16, 3, 1, 3, 8, '4329876'),
(585, 'vision plus eye vitamin pk', 'vision plus eye vitamin pk', '6480.00', '9200.00', '2020-11-01', 'default.gif', 20, 0, 1, 1, 16, '615225000003'),
(586, 'vision plus eye counting', 'vision plus counting', '54.00', '80.00', '2020-11-01', 'default.gif', 48, 108, 1, 120, 16, '615225000003'),
(587, 'reproaid women', 'reproaid women', '5435.00', '7500.00', '2021-10-01', 'default.gif', 20, 1, 1, 1, 16, '765456743'),
(588, 'reproaid man ', 'reproaid man', '5435.00', '7500.00', '2021-06-01', 'default.gif', 20, 1, 1, 1, 16, '321565432'),
(589, 'moist lubricant jelly', 'most jelly', '920.00', '2500.00', '2021-05-01', 'default.gif', 36, 2, 1, 2, 16, '615225000300'),
(590, 'finsal-5 tan', 'finstal -5', '1775.00', '2500.00', '2020-10-01', 'default.gif', 14, 1, 1, 1, 16, '8906007519045'),
(591, 'Ample of injection', 'injection fee', '100.00', '500.00', '20-20-01-01', 'default.gif', 51, 1, 1, 4, 8, '324321'),
(592, 'clotriderm cream', 'clotriderm cream', '120.00', '400.00', '2019-11-01', 'default.gif', 23, 5, 1, 5, 8, '6034000140699'),
(593, 'Benylin original S/A', 'original south africa', '600.00', '900.00', '2019-04-01', 'default.gif', 15, 2, 1, 2, 19, '6001135505433'),
(594, 'Benylin wet cough S/A', 'wet cough south africa', '700.00', '1000.00', '2019-10-01', 'default.gif', 15, 1, 1, 2, 19, '6003001017712'),
(595, 'zithromax 200 susp15ml', 'zithromax susp 15ml', '1900.00', '2500.00', '2020-01-01', 'default.gif', 16, 0, 1, 3, 8, '2321454'),
(596, 'gentamycin injction', 'greenlife', '20.00', '50.00', '2019-11-01', 'default.gif', 34, 30, 1, 40, 8, '12321654'),
(597, 'M2-TONE', 'HABAL TAB', '1400.00', '2000.00', '2019-09-01`', 'default.gif', 14, 2, 1, 2, 8, '8901082005315'),
(598, 'MOSEGOR TAB', 'MOSEGOR', '833.34', '1250.00', '2020-06-01', 'default.gif', 14, 3, 1, 3, 8, '6549876'),
(599, 'NOSPAMIN DROP 15ML', 'NOSPAMIN DROP', '180.00', '250.00', '2021-07-01', 'default.gif', 40, 5, 1, 5, 8, '098567'),
(600, 'augmentin SUSPENSION 457,5mg', 'SUSPENSION', '2600.00', '3950.00', '2019-11-01', 'default.gif', 16, 2, 1, 2, 8, '5476523'),
(601, 'AMOKSIKLAV 625 MG ', 'AMOKSIKLAV', '1350.00', '2100.00', '2019-03-01', 'default.gif', 14, 1, 1, 2, 8, '3838957395842'),
(602, 'GALCIPRO TN 500MG', 'GALCIPRO TN', '350.00', '1000.00', '2021-07-01', 'default.gif', 14, 3, 1, 3, 8, '6548765654'),
(603, 'HYDREX TAB ', 'HYDREX TAB', '75.00', '100.00', '2021-01-01', 'default.gif', 14, 10, 1, 10, 8, '32454321'),
(604, 'SPEMAN TAB', 'SPEMAN TAB', '1300.00', '2500.00', '2020-12=-01', 'default.gif', 14, 1, 1, 1, 8, '8901138500818'),
(605, 'ENHANZ SOFTGEL CAP', 'ENHANZ SOFTGEL', '933.34', '1200.00', '2019-10-13', 'default.gif', 20, 3, 1, 3, 8, '8850769011630'),
(606, 'ORNIOLOX 200MG', 'ORNILOX 200MG', '1250.00', '1800.00', '2020-07-01', 'default.gif', 14, 2, 1, 3, 8, '54123876'),
(607, 'CLARITHROMYCIN TAB', 'CEEMACIN 500MG', '950.00', '1350.00', '2020-11-01', 'default.gif', 14, 5, 1, 5, 8, '8876668'),
(608, 'DOLO-META B', 'DOLO-META B', '100.00', '150.00', '2021-01-01', 'default.gif', 14, 7, 1, 10, 8, '6971161600016'),
(609, 'CALCIMAX SUSP', 'CALCIMAX SUSPENSION', '180.00', '250.00', '2020-07-01', 'default.gif', 16, 3, 1, 3, 8, 'C443334'),
(610, 'BETALOC ZOK 50MG', 'BETALOC 50MG', '1600.00', '2400.00', '2020-07-01', 'default.gif', 14, 1, 1, 1, 8, '7321839720185'),
(611, 'FUROSEMIDE 20MG', 'FUROSEMIDE TEVA', '175.00', '250.00', '2021-01-01', 'default.gif', 14, 2, 1, 6, 8, '5017007016403'),
(612, 'IVYTIMOL EYE DROP 0.5', 'IVYTIMOL EYE DROP', '600.00', '850.00', '2019-10-01', 'default.gif', 31, 3, 1, 3, 8, 'IV655444'),
(613, 'FORTUM INJ  1 GRAM', 'CEFTAZIDIME ', '2400.00', '3500.00', '2020-09-01', 'default.gif', 34, 2, 1, 2, 8, 'F7665544'),
(614, 'GRIPE WATER B/S', 'GRIPE WATER 148ML', '400.00', '600.00', '2021-01-01', 'default.gif', 15, 3, 1, 3, 8, 'B78876654'),
(615, 'OMEPRAZOLE 20 MG', 'OMEPRAZOLE TEVA', '500.00', '800.00', '2019-01-01', 'default.gif', 20, 2, 1, 3, 8, '5017007024262'),
(616, 'OCEFIX-400 TAB', '0CEFIX TAB', '2100.00', '2950.00', '2020-03-01', 'default.gif', 14, 1, 1, 2, 8, '8906035499210'),
(617, '0XYTETRACYCLING CAP', 'LY MPHSHAMEI 250MG', '200.00', '500.00', '2019-01-01', 'default.gif', 20, 6, 1, 6, 8, 'LY6655444'),
(618, 'FORTWIN INJ', 'PENTAZOCINE INJ', '140.00', '200.00', '2022-04-01', 'default.gif', 34, 10, 1, 10, 8, 'FO766544'),
(619, 'OCEFIX- 200', 'OCEFIX-200', '1350.00', '2000.00', '2020-03-01', 'default.gif', 14, 1, 1, 2, 8, '877666554'),
(620, 'CALCIMAX TAB', 'CALICIMAX TAB', '230.00', '350.00', '2020-10-01', 'default.gif', 14, 5, 1, 6, 8, '8904008410620'),
(621, 'ARTOCARE FORTE', 'ARTOCARE FORTE', '2850.00', '3950.00', '2019-06-01', 'default.gif', 51, 2, 1, 2, 8, '8908005958413'),
(622, 'evergreen men formular USA', 'supplement for dads-to be', '6300.00', '8000.00', '2019-09-01', 'default.gif', 20, 1, 1, 1, 8, '6156000081267'),
(623, 'ADDYZOA HERBAL CAP', 'HERBAL CAP', '2500.00', '3500.00', '2020-04-01', 'default.gif', 20, 2, 1, 2, 8, '8901082010562'),
(624, 'CANESTEN V6', 'CLOTRIMAZOLE V TAB', '600.00', '900.00', '2021-04-01', 'default.gif', 14, 1, 1, 2, 8, '7669999'),
(625, 'ZINCHLOR 10ML', 'ZINCHLOR', '0.00', '1450.00', '', 'default.gif', 31, 0, 1, 2, 8, '567899876'),
(626, 'DIFLUCAN 50MG', 'FLUCONAZOLE', '1600.00', '2100.00', '2021-04-01', 'default.gif', 20, 3, 1, 3, 8, '67899990'),
(627, 'TOPCONAZOLE-200', 'FLUCONAZOLE', '400.00', '800.00', '2019-12-01', 'default.gif', 20, 2, 1, 2, 8, '8904176811410'),
(628, 'NYSTATIN 100.000UL', 'NYSTATIN 100.000UL', '0.00', '700.00', '2019-10-01', 'default.gif', 14, 3, 1, 3, 8, '8934748300738'),
(629, 'NYSTATIN 500000.IU', 'NYSTATIN 500000.IU', '400.00', '600.00', '2020-11-03', 'default.gif', 14, 3, 1, 3, 8, '8934574100175'),
(630, 'XASTEN TAB', 'DEXAMETHASONE', '30.00', '100.00', '2021-02-01', 'default.gif', 14, 9, 1, 10, 8, '43356788'),
(631, 'DEXACURE 0.5MG', 'DEXAMETHASONE', '250.00', '350.00', '2020-01-01', 'default.gif', 14, 10, 1, 10, 8, '6156000152608'),
(632, 'OXYTOCIN. INJ.', 'LABTOCIN', '40.00', '100.00', '2020-03-01', 'default.gif', 34, 10, 1, 10, 8, 'O76544333'),
(633, 'ROLITEN TAB', 'TOLTERODINE TAB', '1600.00', '2300.00', '2019-02-01', 'default.gif', 14, 2, 1, 2, 8, '8901296104002'),
(634, 'TAMSULON-XL CAP', 'TAMSULON-XL 400MCG', '2150.00', '2700.00', '2020-10-01', 'default.gif', 20, 2, 1, 2, 8, '69807665'),
(635, 'DRIP SET', 'DRIP SET', '50.00', '100.00', '2020-11-01', 'default.gif', 39, 12, 1, 12, 8, '5643211'),
(636, 'OVULATION PREDICTION', 'PREDICTE', '1800.00', '2500.00', '2020-09-01', 'default.gif', 53, 1, 1, 1, 8, '6156000081205'),
(637, 'Rhinathiol promethazine', 'promethazine ', '850.00', '1150.00', '2019-07-01', 'default.gif', 15, 2, 1, 2, 8, '3582910020967'),
(638, 'vitamin k tablet', 'vitamin k tab ', '350.00', '5.00', '2021-04-01', 'default.gif', 14, 100, 1, 100, 8, 'd5544333'),
(639, 'plasil injection 10mg/2ml', 'metoclopramide', '20.00', '50.00', '2020-11-01', 'default.gif', 34, 100, 1, 100, 8, 'pla988766'),
(640, 'losartan potassium 50mg', 'losartan teva', '325.00', '450.00', '2020-01-01', 'default.gif', 14, 6, 1, 6, 8, '5017007043294'),
(641, 'yoyo cleanser', 'yoyo bitters', '680.00', '900.00', '200-06-012', 'default.gif', 15, 2, 1, 3, 8, '445937180003'),
(642, 'yoyo cleanser cap', 'yoyo bitters softgel cap', '650.00', '900.00', '2019-06-01', 'default.gif', 20, 2, 1, 2, 8, '0445937182'),
(643, 'diazepam injection', 'zupam injection', '100.00', '150.00', '2019-10-01', 'default.gif', 34, 10, 1, 10, 8, 'di3322234'),
(644, 'betnesol-n 5ml', 'betamethasone sodium', '250.00', '500.00', '2019-03-01', 'default.gif', 31, 3, 1, 3, 8, '5678899'),
(645, 'RAMIPRIL 10MG', 'RAMIPRIL TEVA', '375.00', '500.00', '2019-12-01', 'default.gif', 14, 4, 1, 4, 8, '5017007023753'),
(646, 'SIRDALUD 2MG TAB', 'SIRDALUD 2MG', '466.67', '750.00', '2022-01-01', 'default.gif', 14, 3, 1, 3, 8, 'SI5433322'),
(647, 'SIRDALUD 4MG TAB', 'SIRDALUD 4MG', '900.00', '1500.00', '2020-01-01', 'default.gif', 14, 2, 1, 2, 8, '6223002641918'),
(648, 'ZINC SULPHATE', 'EMZOR ZINC', '70.00', '100.00', '2021-01-01', 'default.gif', 14, 8, 1, 10, 8, '6154000035761'),
(649, 'ESIDREX 25MG', 'ESIDREX NOVARTIS', '250.00', '400.00', '2020-08-01', 'default.gif', 14, 3, 1, 4, 8, '7680249580438'),
(650, 'PANDA COLD ', 'PANDA COLD', '220.00', '300.00', '2021-04-01', 'default.gif', 40, 5, 1, 5, 8, '6T65443'),
(651, 'MOKO MIST POT.CIT', 'MOKO MIST POT.CIT', '400.00', '600.00', '2019-06-01', 'default.gif', 51, 3, 1, 3, 8, '6156000058825'),
(652, 'DICLOFENAC INJECTION', 'DICLO 75MG/3ML', '25.00', '50.00', '2020-11-01', 'default.gif', 34, 9, 1, 10, 8, 'DTR5R5555'),
(653, 'BUSCOPAM .INJ.', 'HYOSCINE INJ', '25.00', '50.00', '2020-03-01', 'default.gif', 34, 10, 1, 10, 8, '65544400'),
(654, 'DACIN-F 150', 'CLINDAMYCIN', '500.00', '750.00', '2021-06-17', 'default.gif', 20, 10, 1, 10, 8, '8853348003231'),
(655, 'DACIN-F 300', 'CLINDAMYCIN 300', '650.00', '900.00', '2021-02-25', 'default.gif', 20, 10, 1, 10, 8, '8853348003248'),
(656, 'MOBOZAN POWDER', 'SORBITOL 5MG', '60.00', '100.00', '2020-08-01', 'default.gif', 43, 9, 1, 10, 8, '6223004197048'),
(657, 'SUPRAMULT PLUS', 'SUPRAMULT PLUS', '250.00', '400.00', '2019-08-16', 'default.gif', 20, 6, 1, 6, 8, '8806044020934'),
(658, 'COGNITOL 5MG', 'VINPOCETINE 5MG', '366.67', '550.00', '2020-10-01', 'default.gif', 14, 6, 1, 6, 8, '68877665'),
(659, 'SUPRAMULT CAP', 'SUPRAMULT ', '191.67', '300.00', '2021-01-18', 'default.gif', 20, 6, 1, 6, 8, '8806044008550'),
(660, 'KY GEL', 'LUBRICANT', '500.00', '700.00', '2021-02-15', 'default.gif', 36, 2, 1, 2, 8, '8850007400462'),
(661, 'QUININE INJECTION ', 'PENINE 600MG/2ML', '75.00', '100.00', '2020-12-01', 'default.gif', 34, 20, 1, 20, 8, 'Q45677878'),
(662, 'GALVUS MET 50MG/100MG', 'GALVUS MET', '1633.33', '2200.00', '2019-08-01', 'default.gif', 48, 5, 1, 6, 8, '24567777'),
(663, 'FRANOL TAB', 'THEOPHYLLINE', '150.00', '200.00', '2022-03-01', 'default.gif', 14, 10, 1, 10, 8, '345667'),
(664, 'MYCOTA CREAM', 'ATHLETE FOOT', '850.00', '1200.00', '2020-01-01', 'default.gif', 23, 1, 1, 1, 8, '5011309893014'),
(665, 'POLYFORT 200ML', 'PEPPERMINT FLAVOUR', '450.00', '650.00', '2021-04-01', 'default.gif', 60, 1, 1, 3, 8, '6565444'),
(666, 'OFLOXACIN TAB 200MG', '0FLOMED', '750.00', '1150.00', '2022-04-10', 'default.gif', 14, 5, 1, 5, 8, '8906036361745'),
(667, 'CHYMORAL 50,000', 'MEDMORAL TRYPSIN', '83.33', '200.00', '2020-04-01', 'default.gif', 14, 0, 1, 15, 8, '08906045943789'),
(668, 'NISE SYRUP 2MG/5ML', 'CHLORPHENIRAMINE', '160.00', '250.00', '2021-02-01', 'default.gif', 14, 4, 1, 5, 8, '6154000056339'),
(669, 'ZINC 50MG COUNTING', 'MASON ', '17.00', '25.00', '2020-06-01', 'default.gif', 14, 997, 1, 100, 8, '311845069115'),
(670, 'ZINC MASON', '50MG SUPPLMENT', '1700.00', '2500.00', '2020-06-01', 'default.gif', 14, 1, 1, 1, 8, '311845069115'),
(671, 'CASILAN 90', 'MUSCLE BUILDER', '4500.00', '5800.00', '2019-08-01', 'default.gif', 43, 3, 1, 3, 8, '5000218004963'),
(672, 'FLORANORM', 'FLORANORM', '350.00', '450.00', '2019-12-01', 'default.gif', 54, 19, 1, 20, 8, '676658767'),
(673, 'calcium 1000 tab', 'calctabition', '1.50', '3.00', '2022-01-01', 'default.gif', 14, 953, 1, 1000, 8, '87612324'),
(674, 'Dettol sarchet', '15ml', '35.00', '50.00', '2021-08-01', 'default.gif', 51, 6, 1, 10, 8, '6009695934342'),
(675, 'STREPSILS VIT. C', 'STREPSIL SARCHET', '298.76', '400.00', '2021-04-01', 'default.gif', 29, 24, 1, 24, 8, '9556108211073'),
(676, 'SENSODYNE ', 'RAPID ACTION', '850.00', '1000.00', '2019-12-01', 'default.gif', 51, 4, 1, 6, 8, '6161105660767'),
(677, 'MOVE FREE JOINT HEALTH', 'MOVE FREE JOINT HEALTH ', '2500.00', '12000.00', '2020-11-01', 'default.gif', 48, 1, 1, 1, 20, '87650987'),
(678, 'ALIVE MEN 50 PLUS', 'MALIVE MEN50 PLUS', '1500.00', '5000.00', '2019-05-01', 'default.gif', 48, 1, 1, 1, 20, '4532187909'),
(679, 'ALIVE WOMAN 50 PLUS', 'ALIVE WOMAN 50 PLUS', '1500.00', '5000.00', '2019-05-01', 'default.gif', 48, 1, 1, 1, 20, '872341'),
(680, 'OSTEO BI-FLEX', 'OSTEO BI-FLEX', '2500.00', '9000.00', '2020-04-01', 'default.gif', 48, 1, 1, 1, 20, '030768031213'),
(681, 'SUBLINGUAL B 12', 'NATURE MADE', '1500.00', '3700.00', '2019-05-01', 'default.gif', 48, 1, 1, 1, 20, '031604027193'),
(682, 'D 3 5000', 'NATURE MADE D3 5000', '1500.00', '4000.00', '2019-11-11', 'default.gif', 48, 1, 1, 1, 20, '031604026219'),
(683, 'MEGA RED OMEGA-3', 'OMEGA-3 KRILL OIL', '1500.00', '4500.00', '2919-01-01', 'default.gif', 48, 1, 1, 1, 20, '65439876'),
(684, 'MAGNESIUM 250MG', 'NATURE MADE ', '1500.00', '4500.00', '2020-06-01', 'default.gif', 48, 1, 1, 1, 20, '031604012694'),
(685, 'POTASSIUM GLUCONATE 550MG', 'NATURE MADE', '1500.00', '4500.00', '2021-10-01', 'default.gif', 48, 1, 1, 1, 20, '031604013585'),
(686, 'BIOTIN 2500MCG', 'NATURE MADE', '1500.00', '2700.00', '2019-12-01', 'default.gif', 48, 1, 1, 1, 20, '031604425463'),
(687, 'TYLENOL PAIN / FEVER', 'PAIN /FEVER', '1500.00', '2000.00', '2019-01-01', 'default.gif', 15, 1, 1, 1, 20, '43265476'),
(689, 'NICOTINE GUM', 'NICOTINE GUM', '90.91', '800.00', '2020-08-01', 'default.gif', 14, 22, 1, 22, 20, '601351676809'),
(690, 'MUCINEX', 'FAST-MAX', '500.00', '1500.00', '2020-10-01', 'default.gif', 14, 1, 1, 2, 20, '363824193205'),
(691, 'tinifloxacin tab', 'ciprofloxacin', '650.00', '1200.00', '2020-08-01', 'default.gif', 14, 10, 1, 10, 21, '654765'),
(692, 'ORAL B TOOTH PAST', 'TOOTH PAST ', '283.34', '400.00', '2020-05-01', 'default.gif', 62, 3, 1, 6, 22, '5013965698811'),
(693, 'GOLDEN MORN 500GM', 'GOLDEN MORN 500GM', '650.00', '750.00', '2019-10-01', 'default.gif', 63, 3, 1, 6, 22, '6151100030269 '),
(694, 'MILO 500GM', 'MILO 500GM', '850.00', '1050.00', '2019-11-01', 'default.gif', 28, 3, 1, 3, 22, '6151100031518'),
(695, 'MIKSI 380 GM', 'MIKSI 380 GM', '633.34', '750.00', '2019-12-=01', 'default.gif', 23, 1, 1, 3, 22, '6008155008814'),
(696, 'ORAL B TOOTH BRUSH', 'ORAL B TOOTH BRUSH', '150.00', '200.00', '2019-10-01', 'default.gif', 12, 6, 1, 12, 22, '3014260807214'),
(697, 'MYMY ACTIVE FOAM', 'DETERGENT', '450.00', '600.00', '2020-05-01', 'default.gif', 43, 2, 1, 3, 22, '8765444333'),
(698, 'RANA DETERGENT', 'RANA DETERGENT', '450.00', '600.00', '2020-01-05', 'default.gif', 43, 3, 1, 3, 22, '6543289786'),
(699, 'treatment', 'dressing of wound', '100.00', '500.00', '2020-11-01', 'default.gif', 60, 1, 1, 4, 8, '454321887'),
(700, 'optimol eye', 'optimol', '850.00', '1200.00', '2020-03-01', 'default.gif', 31, 1, 1, 3, 8, '65432876'),
(701, 'plasil 10mg tab', 'metoclopramide', '100.00', '200.00', '2020-07-01', 'default.gif', 14, 9, 1, 10, 8, '544376809'),
(702, 'EURAX CREAM', 'EURAX CROTAMITION', '1500.00', '1900.00', '2020-12-01', 'default.gif', 23, 0, 1, 1, 24, '766554098'),
(703, 'COARTEM 80/480', '80/480', '1200.00', '1500.00', '2019-08-01', 'default.gif', 14, 2, 1, 2, 8, 'CO76654'),
(704, 'COARTEM 12 DPD', 'DISPERSIBLE', '400.00', '550.00', '2019-10-01', 'default.gif', 14, 1, 1, 4, 24, '3467801'),
(705, 'COARTEM 18', '20/120MG', '400.00', '600.00', '2019-08-01', 'default.gif', 14, 2, 1, 2, 24, 'COT66555'),
(706, 'COARTEM 24', '20/120MG', '500.00', '700.00', '2019-10-01', 'default.gif', 14, 2, 1, 2, 24, '877TTTF'),
(707, 'DEEP HEAT RUB', 'RUB', '330.00', '600.00', '2019-10-01', 'default.gif', 23, 1, 1, 1, 24, '5011501004560'),
(708, 'FYNALE SUSPENSION', 'SUSPENSION', '500.00', '700.00', '2021-03-01', 'default.gif', 16, 2, 1, 2, 24, 'FY7766665'),
(709, 'HONNIHILL 20MG', 'TADALAFIL', '1300.00', '1800.00', '2021-02-01', 'default.gif', 14, 2, 1, 2, 24, 'HO77665'),
(710, 'DIPROSALIC OINTMENT', 'OINTMENT', '600.00', '1200.00', '2020-01-01', 'default.gif', 36, 1, 1, 1, 8, '6221050120034'),
(711, 'KLINFAST', 'VAGINAL SUPPOSITORIES', '750.00', '1300.00', '202012-01', 'default.gif', 14, 1, 1, 2, 24, '8906044918467'),
(712, 'NAPROXEN 500MG', 'NAPROXEN', '400.00', '700.00', '2020-08-01', 'default.gif', 14, 2, 1, 2, 24, '5012727902944'),
(713, 'VIREST CREAM', 'ACICLOVIR', '700.00', '900.00', '2020-12-01', 'default.gif', 23, 1, 1, 1, 24, 'UVIR18'),
(714, 'ZINNAT SUSP.', 'CEFUROXIME AXETIL', '2150.00', '2800.00', '2019-09-01', 'default.gif', 16, 0, 1, 1, 24, 'Z233445'),
(715, 'ZOLAT ALBENDAZOLE', 'ALBENDAZOLE', '105.00', '200.00', '2021-05-01', 'default.gif', 16, 3, 1, 5, 24, '6154000034009'),
(716, 'DEXAMETHASONE .INJ.', 'INJECTION', '15.00', '50.00', '2020-08-01', 'default.gif', 34, 20, 1, 20, 9, 'd55444334'),
(717, 'CICATRIN POWDER', 'POWEDER', '330.00', '500.00', '2020-02017', 'default.gif', 43, 0, 1, 1, 9, '8765443330'),
(718, 'FUROSEMIDE INJECTION', 'INJECTION', '15.00', '50.00', '2019-03-01', 'default.gif', 34, 10, 1, 10, 9, 'Y764444'),
(719, 'SPRITE 35 CL', 'SPRITE 35 CL', '79.17', '100.00', '2020-08-01', 'default.gif', 29, 4, 1, 12, 8, '456778765'),
(720, 'ZERO COKE 35CL', 'ZERO', '79.17', '100.00', '2020-08-01', 'default.gif', 29, 0, 1, 6, 8, '09898766'),
(721, 'COKE 50CL', 'COKE 50CL', '116.67', '150.00', '2020-08-01', 'default.gif', 29, 9, 1, 12, 8, 'R54433'),
(722, 'FANTA 50CL', 'FANTA 50CL', '116.67', '150.00', '2021-01-01', 'default.gif', 29, 7, 1, 12, 8, 'FA43322'),
(723, 'amstel malta', 'amstel ', '125.08', '150.00', '2019-08-31', 'default.gif', 29, 6, 1, 24, 8, '3567889i'),
(724, 'molfix 2 mini 10pcs', 'molfix2mini 10 pic', '375.00', '500.00', '2021-09-01', 'default.gif', 58, 2, 1, 2, 13, '23214321'),
(725, 'CYPRIGOLD PLUS', 'CAPLET', '166.67', '250.00', '2019-10-01', 'default.gif', 48, 5, 1, 6, 24, 'CY543332'),
(726, 'CONTIFLO OD', 'TAMUSLOSIN HYDR', '1400.00', '1900.00', '2019-02-01', 'default.gif', 20, 1, 1, 1, 24, '8901296105276'),
(727, 'COMBINATION 3', 'FAMILY PLANNING PILL', '30.00', '100.00', '2019-06-01', 'default.gif', 14, 25, 1, 25, 24, '665890-00'),
(728, 'EXIPLON EXPECTORANT', 'ADULT', '160.00', '300.00', '2021-07-01', 'default.gif', 15, 2, 1, 2, 14, 'EXIP877665E'),
(729, 'EXIPLON CHILDREN', 'CHILDREN COUGH', '135.00', '250.00', '2021-07-01', 'default.gif', 15, 2, 1, 2, 24, '776555433'),
(730, 'COARTEM DISERSIBLE', 'DISPERSIBLE', '350.00', '500.00', '2019-09-01', 'default.gif', 14, 0, 1, 4, 24, '32223445566'),
(731, 'FIESTA CONDOM', 'FISTA CONDOM', '75.00', '300.00', '2919-04-01', 'default.gif', 49, 19, 1, 24, 25, '8765465465'),
(732, 'MISO-FEM', 'MISO-FEM', '780.00', '1100.00', '2019-11-01', 'default.gif', 14, 6, 1, 6, 25, '8906088660216'),
(733, 'ARCOGIN SOFTGEL', 'MULTIVITA & MULTIMIN', '166.67', '250.00', '2019-02-01', 'default.gif', 20, 6, 1, 6, 17, '6555556677'),
(734, 'MARINA 1000', 'OMEGA 3 FISH OIL', '500.00', '750.00', '2021-02-01', 'default.gif', 20, 10, 1, 10, 17, '8902501004117'),
(735, 'EVE 500MG OIL', 'EVENIN PRIMROSE ', '400.00', '600.00', '202008-01', 'default.gif', 20, 3, 1, 3, 19, '8902501005336'),
(736, 'NAT-E400', 'VITAMIN E', '1500.00', '2100.00', '1500', 'default.gif', 20, 1, 1, 1, 17, '08906047361185'),
(737, 'FORMET 500MG', 'METFORMIN', '3.61', '5.00', '2020-11-01', 'default.gif', 14, 500, 1, 500, 17, '11111233M'),
(738, 'STRICIN-250MG', 'ERTHROMYCINE250', '180.00', '300.00', '2020-10-01', 'default.gif', 14, 20, 1, 20, 17, '9090987'),
(739, 'CELOZOL-50', 'FLUCONAZOLE', '180.00', '250.00', '2021-05-01', 'default.gif', 14, 10, 1, 10, 19, 'F766587'),
(740, 'CELOZOL-200MG', 'FLUCONAZOLE', '350.00', '500.00', '2021-03-01', 'default.gif', 14, 10, 1, 10, 17, 'CLO76666'),
(741, 'SALOPED 2MG', 'LOPERAMIDE', '60.00', '200.00', '2019-05-01', 'default.gif', 20, 14, 1, 15, 17, 'SA546433'),
(742, 'RENERVE PLUS', 'MULTIVITAMIN ', '1300.00', '1600.00', '2019-10-01', 'default.gif', 20, 2, 1, 2, 17, 're43322'),
(743, 'COWBELL MILK', '380gm', '666.67', '750.00', '2019-09-01', 'default.gif', 43, 3, 1, 3, 22, '5432765'),
(744, 'lactogen 1', 'lactogen 1', '1416.67', '1600.00', '2019-05-01', 'default.gif', 43, 2, 1, 2, 22, '7501058625915'),
(745, 'lactogen 2', 'lactoge 2', '1416.67', '1600.00', '2019-09-01', 'default.gif', 43, 1, 1, 1, 22, '7501058625922'),
(746, 'NAN OPTIPRO 2', 'OPT 2', '1983.34', '2200.00', '2019-06-01', 'default.gif', 43, 1, 1, 1, 8, '7501058625939'),
(747, 'PEAK 123', '123', '666.67', '1150.00', '2019-10-01', 'default.gif', 43, 2, 1, 2, 22, '8716200438155'),
(748, 'NAN OPTIPRO 1', 'OPTIPRO 1', '1983.34', '2200.00', '2020-05-01', 'default.gif', 43, 2, 1, 2, 22, '7613035502727'),
(749, 'ALWAYS PAD', 'ULTRA 8HRS', '306.26', '350.00', '2020-08-29', 'default.gif', 55, 4, 1, 4, 22, '4015400074366'),
(750, 'sprite 50cl', '50cl', '116.00', '150.00', '2018-12-28', 'default.gif', 29, 12, 1, 12, 8, '87665544');

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
(5448498, 1, 1, '10000', 'Paid', '-3000', NULL, '2019-07-23 15:59:27', 1, '13000'),
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
(2, 'prettygal', 'b35664dbfc43cff24a2e39d10535a9ff', 'Silver', 'Pretty', 1, '08056453454', 'prettygal@gmail.com', 'Sales Person', 1);

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
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `branch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `budget`
--
ALTER TABLE `budget`
  MODIFY `id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `order_cart`
--
ALTER TABLE `order_cart`
  MODIFY `cart_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `prod_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=751;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
