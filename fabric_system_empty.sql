-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 28, 2024 at 08:50 AM
-- Server version: 5.7.17-log
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fabric_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `client_code` int(120) NOT NULL,
  `client_name` varchar(250) NOT NULL,
  `client_address` varchar(250) NOT NULL DEFAULT ' ',
  `client_phone` varchar(250) NOT NULL DEFAULT ' ',
  `client_current_balance` double NOT NULL DEFAULT '0',
  `client_balance_received` double NOT NULL DEFAULT '0',
  `client_balance_remaining` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `company_code` int(120) NOT NULL,
  `company_name` varchar(250) NOT NULL,
  `company_address` varchar(250) NOT NULL DEFAULT ' ',
  `company_phone` varchar(250) NOT NULL DEFAULT ' ',
  `company_current_balance` double NOT NULL DEFAULT '0',
  `company_balance_paid` double NOT NULL DEFAULT '0',
  `company_balance_remaining` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `earn_and_spend_money`
--

CREATE TABLE `earn_and_spend_money` (
  `bill_operation_code` int(120) NOT NULL,
  `bill_code` int(120) NOT NULL,
  `bill_kind` varchar(250) NOT NULL,
  `bill_name` varchar(250) NOT NULL,
  `bill_value` double NOT NULL,
  `bill_total` double NOT NULL,
  `bill_date` date NOT NULL,
  `bill_notes` varchar(250) NOT NULL DEFAULT ' '
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `export_client_bills`
--

CREATE TABLE `export_client_bills` (
  `export_id` int(120) NOT NULL,
  `export_code` int(120) NOT NULL,
  `export_item_count` double NOT NULL,
  `export_item_code` int(120) NOT NULL,
  `export_bill_kind` varchar(250) NOT NULL,
  `export_item_name` varchar(250) NOT NULL,
  `export_item_model` varchar(250) NOT NULL,
  `export_bill_client_code` int(11) NOT NULL,
  `export_bill_client_name` varchar(250) NOT NULL,
  `export_bill_seller_name` varchar(250) NOT NULL,
  `export_item_buy_price` double NOT NULL,
  `export_item_price` double NOT NULL,
  `export_item_total_price` double NOT NULL,
  `export_bill_paymentMethod` varchar(255) NOT NULL,
  `export_bill_total_price` double NOT NULL,
  `export_bill_total_discount` double NOT NULL,
  `export_bill_total_received` double NOT NULL,
  `export_bill_final_total` double NOT NULL,
  `export_bill_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `import_company_bills`
--

CREATE TABLE `import_company_bills` (
  `import_bill_item_code` int(120) NOT NULL,
  `import_code` int(120) NOT NULL,
  `import_bill_kind` varchar(250) NOT NULL,
  `import_pay_kind` varchar(250) NOT NULL,
  `import_date` date NOT NULL,
  `import_company_code` int(120) NOT NULL,
  `import_company_name` varchar(250) NOT NULL,
  `import_item_code` int(120) NOT NULL,
  `import_item_name` varchar(250) NOT NULL,
  `import_item_model` varchar(250) NOT NULL,
  `import_item_unit` varchar(255) NOT NULL,
  `import_item_count` double NOT NULL,
  `import_item_price` double NOT NULL,
  `import_item_total_price` double NOT NULL,
  `import_bill_total_price` double NOT NULL,
  `import_bill_total_discount` double NOT NULL,
  `import_bill_total_paid` double NOT NULL,
  `import_bill_final_total` double NOT NULL,
  `import_bill_receipt_number` varchar(250) NOT NULL DEFAULT ' '
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `item_code` int(120) NOT NULL,
  `item_barcode` varchar(255) NOT NULL,
  `item_model` varchar(250) NOT NULL,
  `item_name` varchar(250) NOT NULL,
  `item_unit` varchar(350) NOT NULL,
  `item_count` double NOT NULL,
  `item_buy_price` double NOT NULL,
  `item_main_price` double NOT NULL,
  `item_limit` int(120) NOT NULL DEFAULT '0',
  `item_notes` varchar(250) NOT NULL DEFAULT '',
  `item_img_src` varchar(600) NOT NULL DEFAULT '..\\..\\Assets\\icons\\public_icons\\no_image.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(120) NOT NULL,
  `timing` varchar(250) NOT NULL,
  `user_name` varchar(250) NOT NULL,
  `log_type` varchar(250) NOT NULL,
  `log_details` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `models`
--

CREATE TABLE `models` (
  `code` int(120) NOT NULL,
  `name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `money_drawer`
--

CREATE TABLE `money_drawer` (
  `drawer_code` int(120) NOT NULL,
  `drawer_start_timing` varchar(250) NOT NULL,
  `drawer_current_value` double NOT NULL,
  `drawer_next_value` double NOT NULL,
  `drawer_spending_value` double NOT NULL,
  `drawer_user_name` varchar(250) NOT NULL,
  `drawer_notes` varchar(250) NOT NULL DEFAULT '  ',
  `drawer_end_timing` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE `partners` (
  `partner_code` int(120) NOT NULL,
  `partner_name` varchar(250) NOT NULL,
  `partner_phone` varchar(250) NOT NULL,
  `partner_partnership_ratio` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `code` int(120) NOT NULL,
  `partition_src` varchar(250) NOT NULL,
  `default_des` varchar(250) NOT NULL,
  `report_company_name` varchar(255) NOT NULL,
  `report_company_phone` varchar(255) NOT NULL,
  `report_company_address` varchar(255) NOT NULL,
  `report_company_slogan` varchar(255) NOT NULL,
  `copyrights_company_name` varchar(255) NOT NULL,
  `barcode_prefix` varchar(255) NOT NULL,
  `sell_profit_value` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`code`, `partition_src`, `default_des`, `report_company_name`, `report_company_phone`, `report_company_address`, `report_company_slogan`, `copyrights_company_name`, `barcode_prefix`, `sell_profit_value`) VALUES
(1, 'D:/FABRIC_BACKUPS/ELECTRICALSHOP_', 'D:/FABRIC_BACKUPS/Item_Images_Backups/', 'Company_name', 'Company_phone', 'Company_address', 'Company_slogan', 'Fabric', 'fabric', 25);

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `code` int(120) NOT NULL,
  `name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(120) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `user_type` varchar(250) NOT NULL DEFAULT 'manager',
  `user_export` varchar(250) NOT NULL,
  `user_items` varchar(250) NOT NULL,
  `user_import` varchar(250) NOT NULL,
  `user_users` varchar(250) NOT NULL,
  `user_review` varchar(250) NOT NULL,
  `user_settings` varchar(250) NOT NULL,
  `user_earn` varchar(250) NOT NULL,
  `user_partners` varchar(250) NOT NULL,
  `user_drawer` varchar(250) NOT NULL,
  `user_bank` varchar(250) NOT NULL,
  `user_buy` varchar(250) NOT NULL,
  `user_delete` varchar(250) NOT NULL,
  `user_edit` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `user_name`, `password`, `user_type`, `user_export`, `user_items`, `user_import`, `user_users`, `user_review`, `user_settings`, `user_earn`, `user_partners`, `user_drawer`, `user_bank`, `user_buy`, `user_delete`, `user_edit`) VALUES
(1, 'Admin', '1234', 'مدير', 'نعم', 'نعم', 'نعم', 'نعم', 'نعم', 'نعم', 'نعم', 'نعم', 'نعم', 'نعم', 'نعم', 'نعم', 'نعم');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`client_code`),
  ADD UNIQUE KEY `client_name` (`client_name`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`company_code`),
  ADD UNIQUE KEY `company_name` (`company_name`);

--
-- Indexes for table `earn_and_spend_money`
--
ALTER TABLE `earn_and_spend_money`
  ADD PRIMARY KEY (`bill_operation_code`);

--
-- Indexes for table `export_client_bills`
--
ALTER TABLE `export_client_bills`
  ADD PRIMARY KEY (`export_id`);

--
-- Indexes for table `import_company_bills`
--
ALTER TABLE `import_company_bills`
  ADD PRIMARY KEY (`import_bill_item_code`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`item_code`),
  ADD UNIQUE KEY `item_name` (`item_name`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `models`
--
ALTER TABLE `models`
  ADD PRIMARY KEY (`code`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `money_drawer`
--
ALTER TABLE `money_drawer`
  ADD PRIMARY KEY (`drawer_code`);

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`partner_code`),
  ADD UNIQUE KEY `envoy_name` (`partner_name`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`code`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userName` (`user_name`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `client_code` int(120) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `company_code` int(120) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `earn_and_spend_money`
--
ALTER TABLE `earn_and_spend_money`
  MODIFY `bill_operation_code` int(120) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `export_client_bills`
--
ALTER TABLE `export_client_bills`
  MODIFY `export_id` int(120) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `import_company_bills`
--
ALTER TABLE `import_company_bills`
  MODIFY `import_bill_item_code` int(120) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `item_code` int(120) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(120) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `models`
--
ALTER TABLE `models`
  MODIFY `code` int(120) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `money_drawer`
--
ALTER TABLE `money_drawer`
  MODIFY `drawer_code` int(120) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `partner_code` int(120) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `code` int(120) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `code` int(120) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(120) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
