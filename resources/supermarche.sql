-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 03 nov. 2026 à 08:41
-- Version du serveur : 8.0.46
-- Version de PHP : 8.5.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `supermarche`
--
CREATE DATABASE IF NOT EXISTS `supermarche` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `supermarche`;

-- --------------------------------------------------------

--
-- Structure de la table `ospos_app_config`
--

DROP TABLE IF EXISTS `ospos_app_config`;
CREATE TABLE IF NOT EXISTS `ospos_app_config` (
  `key` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `value` varchar(500) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `ospos_app_config`
--

INSERT INTO `ospos_app_config` (`key`, `value`) VALUES
('account_number', ''),
('address', 'Cocody Palmeraie'),
('allow_duplicate_barcodes', '0'),
('barcode_content', 'id'),
('barcode_first_row', 'category'),
('barcode_font', 'Arial'),
('barcode_font_size', '10'),
('barcode_formats', '[]'),
('barcode_generate_if_empty', '0'),
('barcode_height', '50'),
('barcode_num_in_row', '2'),
('barcode_page_cellspacing', '20'),
('barcode_page_width', '100'),
('barcode_second_row', 'item_code'),
('barcode_third_row', 'unit_price'),
('barcode_type', 'C39'),
('barcode_width', '250'),
('cash_decimals', '0'),
('cash_rounding_code', '6'),
('category_dropdown', ''),
('company', 'SuperMarket'),
('company_logo', 'images.png'),
('country_codes', 'CI'),
('currency_code', 'XOF'),
('currency_decimals', '0'),
('currency_symbol', 'FCFA'),
('customer_reward_enable', '0'),
('date_or_time_format', '0'),
('dateformat', 'd/m/Y'),
('default_receivings_discount', '0'),
('default_receivings_discount_type', '0'),
('default_register_mode', 'sale'),
('default_sales_discount', '0'),
('default_sales_discount_type', '0'),
('default_tax_1_name', ''),
('default_tax_1_rate', ''),
('default_tax_2_name', ''),
('default_tax_2_rate', ''),
('default_tax_category', ''),
('default_tax_code', ''),
('default_tax_jurisdiction', ''),
('default_tax_rate', '8'),
('derive_sale_quantity', '0'),
('dinner_table_enable', '0'),
('email', 'supermarket@gmail.com'),
('email_receipt_check_behaviour', 'last'),
('enforce_privacy', '0'),
('fax', ''),
('financial_year', '1'),
('gcaptcha_enable', '0'),
('gcaptcha_secret_key', ''),
('gcaptcha_site_key', ''),
('giftcard_number', 'series'),
('image_allowed_types', 'gif,jpg,png'),
('image_max_height', '480'),
('image_max_size', '128'),
('image_max_width', '640'),
('include_hsn', '0'),
('invoice_default_comments', 'This is a default comment'),
('invoice_email_message', 'Dear {CU}, In attachment the receipt for sale {ISEQ}'),
('invoice_enable', '1'),
('invoice_type', 'invoice'),
('key_amount', '53 | ALT + 5'),
('key_cancel', '27 | ESC'),
('key_complete', '55 | ALT + 7'),
('key_customers', '50 | ALT + 2'),
('key_finish', '56 | ALT + 8'),
('key_help', '57 | ALT + 9'),
('key_items', '49 | ALT + 1'),
('key_payment', '54 | ALT + 6'),
('key_suspend', '51 | ALT + 3'),
('key_suspended', '52 | ALT + 4'),
('language', 'french'),
('language_code', 'fr'),
('last_used_invoice_number', '0'),
('last_used_quote_number', '0'),
('last_used_work_order_number', '0'),
('line_sequence', '0'),
('lines_per_page', '25'),
('login_form', ''),
('mailpath', '/usr/sbin/sendmail'),
('msg_msg', ''),
('msg_pwd', ''),
('msg_src', ''),
('msg_uid', ''),
('multi_pack_enabled', '0'),
('notify_horizontal_position', 'center'),
('notify_vertical_position', 'bottom'),
('number_locale', 'fr_FR'),
('payment_message', ''),
('payment_options_order', 'cashdebitcredit'),
('payment_reference_code_max', '40'),
('payment_reference_code_min', '3'),
('phone', '00 00 00 00 00'),
('print_bottom_margin', '0'),
('print_delay_autoreturn', '0'),
('print_footer', '0'),
('print_header', '0'),
('print_left_margin', '0'),
('print_receipt_check_behaviour', 'last'),
('print_right_margin', '0'),
('print_silently', '1'),
('print_top_margin', '0'),
('protocol', 'mail'),
('quantity_decimals', '0'),
('quote_default_comments', 'This is a default quote comment'),
('receipt_font_size', '12'),
('receipt_show_company_name', '1'),
('receipt_show_description', '1'),
('receipt_show_serialnumber', '1'),
('receipt_show_tax_ind', '0'),
('receipt_show_taxes', '0'),
('receipt_show_total_discount', '1'),
('receipt_template', 'receipt_default'),
('receiving_calculate_average_price', ''),
('recv_invoice_format', '{CO}'),
('return_policy', '**Aucun retour ni échange après sortie du magasin, sous réserve des obligations légales applicables. Merci de votre confiance !**'),
('sales_invoice_format', '{CO}'),
('sales_quote_format', 'Q%y{QSEQ:6}'),
('smtp_crypto', 'ssl'),
('smtp_host', ''),
('smtp_pass', 'f68e64b7d69366b280ec9f26ad5f0a219126d1461295ff6e75b8b3b0aa7ca195a42934d4101358590205899b52284861d1167afa2310844c3ff0cfab72b2df9a7Y9sC2lAO38iEuZyyBiP79ZEn5bSiFSX4egC'),
('smtp_port', '465'),
('smtp_timeout', '5'),
('smtp_user', 'admin'),
('statistics', '1'),
('suggestions_first_column', 'name'),
('suggestions_second_column', ''),
('suggestions_third_column', ''),
('tax_decimals', '0'),
('tax_id', ''),
('tax_included', '0'),
('theme', 'flatly'),
('thousands_separator', '1'),
('timeformat', 'H:i:s'),
('timezone', 'Africa/Abidjan'),
('use_destination_based_tax', '0'),
('website', ''),
('work_order_enable', '0'),
('work_order_format', 'W%y{WSEQ:6}');

-- --------------------------------------------------------

--
-- Structure de la table `ospos_attribute_definitions`
--

DROP TABLE IF EXISTS `ospos_attribute_definitions`;
CREATE TABLE IF NOT EXISTS `ospos_attribute_definitions` (
  `definition_id` int NOT NULL AUTO_INCREMENT,
  `definition_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `definition_type` varchar(45) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `definition_unit` varchar(16) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `definition_flags` tinyint(1) NOT NULL,
  `definition_fk` int DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`definition_id`),
  KEY `definition_fk` (`definition_fk`),
  KEY `definition_name` (`definition_name`),
  KEY `definition_type` (`definition_type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `ospos_attribute_definitions`
--

INSERT INTO `ospos_attribute_definitions` (`definition_id`, `definition_name`, `definition_type`, `definition_unit`, `definition_flags`, `definition_fk`, `deleted`) VALUES
(1, 'Marque', 'TEXT', NULL, 15, NULL, 0),
(2, 'Date de péremption', 'DATE', NULL, 15, NULL, 0),
(3, 'Poids (kg)', 'DECIMAL', 'kg', 15, NULL, 0),
(4, 'Produit local', 'CHECKBOX', NULL, 15, NULL, 0),
(5, 'Conditionnement', 'DROPDOWN', NULL, 15, NULL, 0),
(6, 'Marque', 'TEXT', NULL, 15, NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `ospos_attribute_links`
--

DROP TABLE IF EXISTS `ospos_attribute_links`;
CREATE TABLE IF NOT EXISTS `ospos_attribute_links` (
  `attribute_id` int DEFAULT NULL,
  `definition_id` int NOT NULL,
  `item_id` int DEFAULT NULL,
  `sale_id` int DEFAULT NULL,
  `receiving_id` int DEFAULT NULL,
  `generated_unique_column` varchar(255) COLLATE utf8mb4_unicode_520_ci GENERATED ALWAYS AS ((case when ((`sale_id` is null) and (`receiving_id` is null) and (`item_id` is not null)) then concat(`definition_id`,_utf8mb4'-',`item_id`) else NULL end)) STORED,
  UNIQUE KEY `attribute_links_uq1` (`attribute_id`,`definition_id`,`item_id`,`sale_id`,`receiving_id`),
  UNIQUE KEY `attribute_links_uq2` (`item_id`,`receiving_id`,`sale_id`,`definition_id`,`attribute_id`),
  UNIQUE KEY `attribute_links_uq3` (`generated_unique_column`),
  KEY `attribute_id` (`attribute_id`),
  KEY `definition_id` (`definition_id`),
  KEY `item_id` (`item_id`),
  KEY `sale_id` (`sale_id`),
  KEY `receiving_id` (`receiving_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `ospos_attribute_links`
--

INSERT INTO `ospos_attribute_links` (`attribute_id`, `definition_id`, `item_id`, `sale_id`, `receiving_id`) VALUES
(1, 5, NULL, NULL, NULL),
(2, 5, NULL, NULL, NULL),
(3, 5, NULL, NULL, NULL),
(4, 5, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `ospos_attribute_values`
--

DROP TABLE IF EXISTS `ospos_attribute_values`;
CREATE TABLE IF NOT EXISTS `ospos_attribute_values` (
  `attribute_id` int NOT NULL AUTO_INCREMENT,
  `attribute_value` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `attribute_date` date DEFAULT NULL,
  `attribute_decimal` decimal(7,3) DEFAULT NULL,
  PRIMARY KEY (`attribute_id`),
  UNIQUE KEY `attribute_value` (`attribute_value`),
  UNIQUE KEY `attribute_date` (`attribute_date`),
  UNIQUE KEY `attribute_decimal` (`attribute_decimal`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `ospos_attribute_values`
--

INSERT INTO `ospos_attribute_values` (`attribute_id`, `attribute_value`, `attribute_date`, `attribute_decimal`) VALUES
(1, 'Unité', NULL, NULL),
(2, 'Carton', NULL, NULL),
(3, 'Pack', NULL, NULL),
(4, 'Sachet', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `ospos_cash_up`
--

DROP TABLE IF EXISTS `ospos_cash_up`;
CREATE TABLE IF NOT EXISTS `ospos_cash_up` (
  `cashup_id` int NOT NULL AUTO_INCREMENT,
  `open_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `close_date` timestamp NULL DEFAULT NULL,
  `open_amount_cash` decimal(15,2) NOT NULL,
  `transfer_amount_cash` decimal(15,2) NOT NULL,
  `note` tinyint NOT NULL DEFAULT '0',
  `closed_amount_cash` decimal(15,2) NOT NULL,
  `closed_amount_card` decimal(15,2) NOT NULL,
  `closed_amount_check` decimal(15,2) NOT NULL,
  `closed_amount_total` decimal(15,2) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `open_employee_id` int NOT NULL,
  `close_employee_id` int DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `closed_amount_due` decimal(15,2) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`cashup_id`),
  KEY `open_employee_id` (`open_employee_id`),
  KEY `close_employee_id` (`close_employee_id`),
  KEY `idx_cash_up_status_employee` (`open_employee_id`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `ospos_cash_up`
--

INSERT INTO `ospos_cash_up` (`cashup_id`, `open_date`, `close_date`, `open_amount_cash`, `transfer_amount_cash`, `note`, `closed_amount_cash`, `closed_amount_card`, `closed_amount_check`, `closed_amount_total`, `description`, `open_employee_id`, `close_employee_id`, `deleted`, `closed_amount_due`, `status`) VALUES
(5, '2026-10-30 09:24:27', '2026-10-30 09:24:27', 40000.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, '', 25, 25, 1, 0.00, 0),
(6, '2026-10-30 09:29:38', '2026-10-30 09:29:38', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, '', 25, 25, 1, 0.00, 0),
(8, '0000-00-00 00:00:00', '2026-10-30 10:36:20', 45000.00, 0.00, 0, 200000.00, 0.00, 0.00, 155000.00, '', 25, 1, 0, 0.00, 1),
(9, '0000-00-00 00:00:00', '2026-10-30 10:44:32', 50000.00, 0.00, 0, 500000.00, 0.00, 0.00, 450000.00, '', 25, 25, 0, 0.00, 1),
(10, '2026-10-30 10:45:54', '2026-10-30 10:46:32', 75000.00, 0.00, 1, 750000.00, 0.00, 0.00, 675000.00, '', 25, 25, 0, 0.00, 1),
(11, '0000-00-00 00:00:00', '2026-10-30 16:40:28', 50000.00, 0.00, 0, 345000.00, 0.00, 0.00, 295000.00, '', 25, 1, 0, 0.00, 1),
(12, '2030-11-01 00:00:00', '2026-10-30 16:43:14', 45000.00, 0.00, 1, 700000.00, 0.00, 0.00, 655000.00, '', 1, 1, 0, 0.00, 1),
(13, '0000-00-00 00:00:00', '2026-10-30 16:46:09', 80000.00, 0.00, 1, 80000.00, 0.00, 0.00, 0.00, '', 1, 1, 0, 0.00, 1);

-- --------------------------------------------------------

--
-- Structure de la table `ospos_cash_up_backup_20261029_171932`
--

DROP TABLE IF EXISTS `ospos_cash_up_backup_20261029_171932`;
CREATE TABLE IF NOT EXISTS `ospos_cash_up_backup_20261029_171932` (
  `cashup_id` int NOT NULL DEFAULT '0',
  `open_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `close_date` timestamp NULL DEFAULT NULL,
  `open_amount_cash` decimal(15,2) NOT NULL,
  `transfer_amount_cash` decimal(15,2) NOT NULL,
  `note` tinyint NOT NULL DEFAULT '0',
  `closed_amount_cash` decimal(15,2) NOT NULL,
  `closed_amount_card` decimal(15,2) NOT NULL,
  `closed_amount_check` decimal(15,2) NOT NULL,
  `closed_amount_total` decimal(15,2) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `open_employee_id` int NOT NULL,
  `close_employee_id` int NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `closed_amount_due` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ospos_customers`
--

DROP TABLE IF EXISTS `ospos_customers`;
CREATE TABLE IF NOT EXISTS `ospos_customers` (
  `person_id` int NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `account_number` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `taxable` tinyint(1) NOT NULL DEFAULT '1',
  `tax_id` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `sales_tax_code_id` int DEFAULT NULL,
  `package_id` int DEFAULT NULL,
  `points` int DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `discount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `discount_type` tinyint(1) NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `employee_id` int NOT NULL,
  `consent` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`person_id`),
  KEY `package_id` (`package_id`),
  KEY `sales_tax_code_id` (`sales_tax_code_id`),
  KEY `account_number` (`account_number`),
  KEY `company_name` (`company_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `ospos_customers`
--

INSERT INTO `ospos_customers` (`person_id`, `company_name`, `account_number`, `taxable`, `tax_id`, `sales_tax_code_id`, `package_id`, `points`, `deleted`, `discount`, `discount_type`, `date`, `employee_id`, `consent`) VALUES
(9, NULL, NULL, 1, '', NULL, NULL, NULL, 0, 0.00, 0, '2026-10-28 12:45:19', 1, 0),
(10, NULL, NULL, 1, '', NULL, NULL, NULL, 0, 0.00, 0, '2026-10-28 12:45:19', 1, 0),
(11, NULL, NULL, 1, '', NULL, NULL, NULL, 0, 0.00, 0, '2026-10-28 12:45:19', 1, 0),
(12, NULL, NULL, 1, '', NULL, NULL, NULL, 0, 0.00, 0, '2026-10-28 12:45:19', 1, 0),
(13, NULL, NULL, 1, '', NULL, NULL, NULL, 0, 0.00, 0, '2026-10-28 12:45:19', 1, 0),
(14, NULL, NULL, 1, '', NULL, NULL, NULL, 0, 0.00, 0, '2026-10-28 12:45:19', 1, 0),
(15, NULL, NULL, 1, '', NULL, NULL, NULL, 0, 0.00, 0, '2026-10-28 12:45:19', 1, 0),
(16, NULL, NULL, 1, '', NULL, NULL, NULL, 0, 0.00, 0, '2026-10-28 12:45:19', 1, 0),
(17, NULL, NULL, 1, '', NULL, NULL, NULL, 0, 0.00, 0, '2026-10-28 12:45:19', 1, 0),
(18, NULL, NULL, 1, '', NULL, NULL, NULL, 0, 0.00, 0, '2026-10-28 12:45:19', 1, 0),
(24, NULL, NULL, 0, '', NULL, NULL, NULL, 0, 0.00, 0, '2026-10-28 15:40:46', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `ospos_customers_packages`
--

DROP TABLE IF EXISTS `ospos_customers_packages`;
CREATE TABLE IF NOT EXISTS `ospos_customers_packages` (
  `package_id` int NOT NULL AUTO_INCREMENT,
  `package_name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `points_percent` float NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`package_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `ospos_customers_packages`
--

INSERT INTO `ospos_customers_packages` (`package_id`, `package_name`, `points_percent`, `deleted`) VALUES
(1, 'Default', 0, 0),
(2, 'Bronze', 10, 0),
(3, 'Silver', 20, 0),
(4, 'Gold', 30, 0),
(5, 'Premium', 50, 0);

-- --------------------------------------------------------

--
-- Structure de la table `ospos_customers_points`
--

DROP TABLE IF EXISTS `ospos_customers_points`;
CREATE TABLE IF NOT EXISTS `ospos_customers_points` (
  `id` int NOT NULL AUTO_INCREMENT,
  `person_id` int NOT NULL,
  `package_id` int NOT NULL,
  `sale_id` int NOT NULL,
  `points_earned` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `person_id` (`person_id`),
  KEY `package_id` (`package_id`),
  KEY `sale_id` (`sale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ospos_dinner_tables`
--

DROP TABLE IF EXISTS `ospos_dinner_tables`;
CREATE TABLE IF NOT EXISTS `ospos_dinner_tables` (
  `dinner_table_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dinner_table_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `ospos_dinner_tables`
--

INSERT INTO `ospos_dinner_tables` (`dinner_table_id`, `name`, `status`, `deleted`) VALUES
(1, 'Delivery', 0, 0),
(2, 'Take Away', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `ospos_employees`
--

DROP TABLE IF EXISTS `ospos_employees`;
CREATE TABLE IF NOT EXISTS `ospos_employees` (
  `username` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `person_id` int NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `hash_version` tinyint(1) NOT NULL DEFAULT '2',
  `language` varchar(48) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `language_code` varchar(8) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`person_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `ospos_employees`
--

INSERT INTO `ospos_employees` (`username`, `password`, `person_id`, `deleted`, `hash_version`, `language`, `language_code`) VALUES
('admin', '$2y$10$vJBSMlD02EC7ENSrKfVQXuvq9tNRHMtcOA8MSK2NYS748HHWm.gcG', 1, 0, 2, NULL, NULL),
('sephora', '$2y$12$xQGaHJ4VkbOdNd3qp/0zIu1WtRz/84Fle5rT1zRyhEHBBG.BLXIG2', 25, 0, 2, '', '');

-- --------------------------------------------------------

--
-- Structure de la table `ospos_expenses`
--

DROP TABLE IF EXISTS `ospos_expenses`;
CREATE TABLE IF NOT EXISTS `ospos_expenses` (
  `expense_id` int NOT NULL AUTO_INCREMENT,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `amount` decimal(15,2) NOT NULL,
  `payment_type` varchar(40) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `expense_category_id` int NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `employee_id` int NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `supplier_tax_code` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `tax_amount` decimal(15,2) DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  PRIMARY KEY (`expense_id`),
  KEY `expense_category_id` (`expense_category_id`),
  KEY `employee_id` (`employee_id`),
  KEY `date` (`date`),
  KEY `payment_type` (`payment_type`),
  KEY `amount` (`amount`),
  KEY `ospos_expenses_ibfk_3` (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `ospos_expenses`
--

INSERT INTO `ospos_expenses` (`expense_id`, `date`, `amount`, `payment_type`, `expense_category_id`, `description`, `employee_id`, `deleted`, `supplier_tax_code`, `tax_amount`, `supplier_id`) VALUES
(1, '2026-10-28 12:47:49', 25000.00, 'Cash', 1, 'Facture électrique de test', 1, 0, NULL, NULL, NULL),
(2, '2026-10-28 12:47:49', 12000.00, 'Cash', 2, 'Frais de livraison de test', 1, 0, NULL, NULL, NULL),
(3, '2026-10-28 12:47:49', 8000.00, 'Cash', 3, 'Entretien du magasin de test', 1, 0, NULL, NULL, NULL),
(4, '2026-10-28 12:47:49', 6500.00, 'Cash', 4, 'Fournitures de bureau de test', 1, 0, NULL, NULL, NULL),
(5, '2026-10-28 12:47:49', 5000.00, 'Cash', 5, 'Dépense diverse de test', 1, 0, NULL, NULL, NULL),
(8, '2026-10-29 08:34:41', 500000.00, 'Espèce', 1, 'Paiement de la facture d\'électricité du supermarché - octobre 2026.', 1, 0, '', 0.00, NULL),
(9, '2026-10-29 08:41:59', 25000.00, 'Espèce', 5, 'FACTURE D\'EAU', 1, 0, '', 0.00, NULL),
(10, '2026-10-29 10:59:16', 45000.00, 'Espèce', 5, 'FACTURE D\'INVENTAIRE Démandé', 1, 0, '', 0.00, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `ospos_expenses_backup_20261029_171932`
--

DROP TABLE IF EXISTS `ospos_expenses_backup_20261029_171932`;
CREATE TABLE IF NOT EXISTS `ospos_expenses_backup_20261029_171932` (
  `expense_id` int NOT NULL DEFAULT '0',
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `amount` decimal(15,2) NOT NULL,
  `payment_type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `expense_category_id` int NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `employee_id` int NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `supplier_tax_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `tax_amount` decimal(15,2) DEFAULT NULL,
  `supplier_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ospos_expenses_backup_20261029_171932`
--

INSERT INTO `ospos_expenses_backup_20261029_171932` (`expense_id`, `date`, `amount`, `payment_type`, `expense_category_id`, `description`, `employee_id`, `deleted`, `supplier_tax_code`, `tax_amount`, `supplier_id`) VALUES
(1, '2026-10-28 12:47:49', 25000.00, 'Cash', 1, 'Facture électrique de test', 1, 0, NULL, NULL, NULL),
(2, '2026-10-28 12:47:49', 12000.00, 'Cash', 2, 'Frais de livraison de test', 1, 0, NULL, NULL, NULL),
(3, '2026-10-28 12:47:49', 8000.00, 'Cash', 3, 'Entretien du magasin de test', 1, 0, NULL, NULL, NULL),
(4, '2026-10-28 12:47:49', 6500.00, 'Cash', 4, 'Fournitures de bureau de test', 1, 0, NULL, NULL, NULL),
(5, '2026-10-28 12:47:49', 5000.00, 'Cash', 5, 'Dépense diverse de test', 1, 0, NULL, NULL, NULL),
(8, '2026-10-29 08:34:41', 500000.00, 'Espèce', 1, 'Paiement de la facture d\'électricité du supermarché - octobre 2026.', 1, 0, '', 0.00, NULL),
(9, '2026-10-29 08:41:59', 25000.00, 'Espèce', 5, 'FACTURE D\'EAU', 1, 0, '', 0.00, NULL),
(10, '2026-10-29 10:59:16', 45000.00, 'Espèce', 5, 'FACTURE D\'INVENTAIRE Démandé', 1, 0, '', 0.00, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `ospos_expense_categories`
--

DROP TABLE IF EXISTS `ospos_expense_categories`;
CREATE TABLE IF NOT EXISTS `ospos_expense_categories` (
  `expense_category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `category_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`expense_category_id`),
  UNIQUE KEY `category_name` (`category_name`),
  KEY `category_description` (`category_description`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `ospos_expense_categories`
--

INSERT INTO `ospos_expense_categories` (`expense_category_id`, `category_name`, `category_description`, `deleted`) VALUES
(1, 'Électricité', 'Factures et consommation électrique', 0),
(2, 'Transport', 'Transport et livraison', 0),
(3, 'Entretien', 'Entretien du magasin', 0),
(4, 'Fournitures', 'Fournitures et consommables', 0),
(5, 'Divers', 'Autres dépenses courantes', 0),
(23, 'Eau', 'Facture d\'Eau', 0);

-- --------------------------------------------------------

--
-- Structure de la table `ospos_giftcards`
--

DROP TABLE IF EXISTS `ospos_giftcards`;
CREATE TABLE IF NOT EXISTS `ospos_giftcards` (
  `record_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `giftcard_id` int NOT NULL AUTO_INCREMENT,
  `giftcard_number` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `value` decimal(15,2) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `person_id` int DEFAULT NULL,
  PRIMARY KEY (`giftcard_id`),
  UNIQUE KEY `giftcard_number` (`giftcard_number`),
  KEY `person_id` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `ospos_giftcards`
--

INSERT INTO `ospos_giftcards` (`record_time`, `giftcard_id`, `giftcard_number`, `value`, `deleted`, `person_id`) VALUES
('2026-10-29 08:22:23', 1, '1', 9550.00, 0, 24),
('2026-10-29 09:23:24', 2, '2', 50000.00, 0, 13);

-- --------------------------------------------------------

--
-- Structure de la table `ospos_grants`
--

DROP TABLE IF EXISTS `ospos_grants`;
CREATE TABLE IF NOT EXISTS `ospos_grants` (
  `permission_id` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `person_id` int NOT NULL,
  `menu_group` varchar(32) COLLATE utf8mb4_unicode_520_ci DEFAULT 'home',
  PRIMARY KEY (`permission_id`,`person_id`),
  KEY `ospos_grants_ibfk_2` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `ospos_grants`
--

INSERT INTO `ospos_grants` (`permission_id`, `person_id`, `menu_group`) VALUES
('attributes', 1, 'office'),
('cashups', 1, 'home'),
('cashups', 25, 'home'),
('config', 1, 'office'),
('customers', 1, 'home'),
('employees', 1, 'office'),
('expenses', 1, 'home'),
('expenses_categories', 1, 'office'),
('giftcards', 1, 'home'),
('home', 1, 'office'),
('home', 25, 'home'),
('item_kits', 1, 'home'),
('items', 1, 'home'),
('items_stock', 1, 'home'),
('messages', 1, 'home'),
('office', 1, 'home'),
('receivings', 1, 'home'),
('receivings_stock', 1, 'home'),
('reports', 1, 'home'),
('reports_categories', 1, 'home'),
('reports_customers', 1, 'home'),
('reports_discounts', 1, 'home'),
('reports_employees', 1, 'home'),
('reports_expenses_categories', 1, 'home'),
('reports_inventory', 1, 'home'),
('reports_items', 1, 'home'),
('reports_payments', 1, 'home'),
('reports_receivings', 1, 'home'),
('reports_sales', 1, 'home'),
('reports_sales_taxes', 1, 'home'),
('reports_suppliers', 1, 'home'),
('reports_taxes', 1, 'home'),
('sales', 1, 'home'),
('sales', 25, 'home'),
('sales_change_price', 1, '--'),
('sales_delete', 1, '--'),
('sales_stock', 1, 'home'),
('sales_stock', 25, '--'),
('suppliers', 1, 'home');

-- --------------------------------------------------------

--
-- Structure de la table `ospos_inventory`
--

DROP TABLE IF EXISTS `ospos_inventory`;
CREATE TABLE IF NOT EXISTS `ospos_inventory` (
  `trans_id` int NOT NULL AUTO_INCREMENT,
  `trans_items` int NOT NULL DEFAULT '0',
  `trans_user` int NOT NULL DEFAULT '0',
  `trans_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trans_comment` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `trans_location` int NOT NULL,
  `trans_inventory` decimal(15,3) NOT NULL DEFAULT '0.000',
  PRIMARY KEY (`trans_id`),
  KEY `trans_items` (`trans_items`),
  KEY `trans_user` (`trans_user`),
  KEY `trans_location` (`trans_location`),
  KEY `trans_date` (`trans_date`),
  KEY `trans_items_trans_date` (`trans_items`,`trans_date`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `ospos_inventory`
--

INSERT INTO `ospos_inventory` (`trans_id`, `trans_items`, `trans_user`, `trans_date`, `trans_comment`, `trans_location`, `trans_inventory`) VALUES
(1, 1, 1, '2026-10-28 12:47:49', 'Approvisionnement test TEST-REC-001', 1, 10.000),
(2, 3, 1, '2026-10-28 12:47:49', 'Approvisionnement test TEST-REC-001', 1, 10.000),
(3, 6, 1, '2026-10-28 12:47:49', 'Approvisionnement test TEST-REC-001', 1, 10.000),
(4, 19, 1, '2026-10-28 12:47:49', 'Approvisionnement test TEST-REC-001', 1, 10.000),
(5, 2, 1, '2026-10-28 12:47:49', 'Approvisionnement test TEST-REC-002', 1, 10.000),
(6, 4, 1, '2026-10-28 12:47:49', 'Approvisionnement test TEST-REC-002', 1, 10.000),
(7, 5, 1, '2026-10-28 12:47:49', 'Approvisionnement test TEST-REC-002', 1, 10.000),
(8, 7, 1, '2026-10-28 12:47:49', 'Approvisionnement test TEST-REC-002', 1, 10.000),
(9, 20, 1, '2026-10-28 12:47:49', 'Approvisionnement test TEST-REC-002', 1, 10.000),
(10, 8, 1, '2026-10-28 12:47:49', 'Approvisionnement test TEST-REC-003', 1, 10.000),
(11, 9, 1, '2026-10-28 12:47:49', 'Approvisionnement test TEST-REC-003', 1, 10.000),
(12, 10, 1, '2026-10-28 12:47:49', 'Approvisionnement test TEST-REC-003', 1, 10.000),
(13, 11, 1, '2026-10-28 12:47:49', 'Approvisionnement test TEST-REC-003', 1, 10.000),
(14, 12, 1, '2026-10-28 12:47:49', 'Approvisionnement test TEST-REC-004', 1, 10.000),
(15, 13, 1, '2026-10-28 12:47:49', 'Approvisionnement test TEST-REC-004', 1, 10.000),
(16, 14, 1, '2026-10-28 12:47:49', 'Approvisionnement test TEST-REC-004', 1, 10.000),
(17, 18, 1, '2026-10-28 12:47:49', 'Approvisionnement test TEST-REC-004', 1, 10.000),
(18, 15, 1, '2026-10-28 12:47:49', 'Approvisionnement test TEST-REC-005', 1, 10.000),
(19, 16, 1, '2026-10-28 12:47:49', 'Approvisionnement test TEST-REC-005', 1, 10.000),
(20, 17, 1, '2026-10-28 12:47:49', 'Approvisionnement test TEST-REC-005', 1, 10.000),
(32, 11, 1, '2026-10-28 12:56:16', 'POS 1', 1, -4.000),
(33, 15, 1, '2026-10-28 13:01:22', 'POS 4', 1, -2.000),
(34, 19, 1, '2026-10-28 14:09:05', 'RECV 8', 1, 1.000),
(35, 11, 1, '2026-10-28 14:09:05', 'RECV 8', 1, -1.000),
(36, 16, 1, '2026-10-28 14:20:12', 'POS 5', 1, -1.000),
(37, 5, 1, '2026-10-28 14:30:22', 'POS 6', 1, -1.000),
(38, 2, 1, '2026-10-28 14:31:22', 'POS 7', 1, -1.000),
(39, 10, 1, '2026-10-28 14:45:19', 'POS 8', 1, -1.000),
(40, 20, 1, '2026-10-28 14:52:20', 'POS 9', 1, -1.000),
(41, 12, 1, '2026-10-28 15:02:36', 'POS 10', 1, -1.000),
(42, 18, 1, '2026-10-28 15:10:38', 'POS 11', 1, -2.000),
(43, 2, 1, '2026-10-28 15:39:51', 'POS 12', 1, -6.000),
(44, 32, 1, '2026-10-28 15:57:32', 'Édition de quantité manuelle', 1, 20.000),
(45, 32, 1, '2026-10-28 16:04:13', 'POS 13', 1, -5.000),
(46, 33, 1, '2026-10-28 17:17:54', 'Édition de quantité manuelle', 1, 80.000),
(47, 8, 1, '2026-10-28 17:56:01', 'RECV 9', 1, 20.000),
(48, 13, 1, '2026-10-28 18:19:08', 'RECV 10', 1, 5.000),
(49, 5, 1, '2026-10-29 08:30:10', 'POS 14', 1, -4.000),
(50, 7, 1, '2026-10-29 08:30:10', 'POS 14', 1, -1.000),
(51, 9, 1, '2026-10-29 08:30:10', 'POS 14', 1, -1.000),
(52, 5, 25, '2026-10-29 11:50:06', 'POS 15', 1, -3.000),
(53, 1, 25, '2026-10-29 11:55:31', 'POS 16', 1, -50.000),
(54, 32, 25, '2026-10-29 11:57:41', 'POS 17', 1, -14.000),
(55, 32, 25, '2026-10-29 11:58:06', 'POS 18', 1, -2.000),
(56, 32, 1, '2026-10-29 11:59:06', 'RECV 11', 1, 20.000),
(57, 32, 1, '2026-10-29 12:13:38', 'Supprimé', 1, -19.000),
(58, 1, 1, '2026-10-29 15:43:07', 'Édition de quantité manuelle', 1, -10.000),
(59, 1, 1, '2026-10-29 15:52:49', 'RECV 12', 1, 20.000),
(60, 33, 1, '2026-10-29 15:56:01', 'Supprimé', 1, -80.000),
(62, 1, 25, '2026-10-29 16:44:19', 'POS 21', 1, -15.000),
(63, 1, 25, '2026-10-30 08:36:59', 'POS 22', 1, -1.000),
(64, 1, 25, '2026-10-30 08:40:20', 'POS 23', 1, -1.000),
(65, 5, 25, '2026-10-30 09:30:14', 'POS 24', 1, -1.000),
(66, 5, 1, '2026-10-30 16:36:30', 'RECV 13', 1, 45.000),
(67, 11, 1, '2026-10-30 16:37:36', 'RECV 14', 1, 50.000),
(68, 14, 1, '2026-10-30 17:14:06', 'RECV 15', 1, 45.000);

-- --------------------------------------------------------

--
-- Structure de la table `ospos_items`
--

DROP TABLE IF EXISTS `ospos_items`;
CREATE TABLE IF NOT EXISTS `ospos_items` (
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `supplier_id` int DEFAULT NULL,
  `item_number` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `cost_price` decimal(15,2) NOT NULL,
  `unit_price` decimal(15,2) NOT NULL,
  `reorder_level` decimal(15,3) NOT NULL DEFAULT '0.000',
  `receiving_quantity` decimal(15,3) NOT NULL DEFAULT '1.000',
  `item_id` int NOT NULL AUTO_INCREMENT,
  `pic_filename` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `allow_alt_description` tinyint(1) NOT NULL,
  `is_serialized` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `stock_type` tinyint(1) NOT NULL DEFAULT '0',
  `item_type` tinyint(1) NOT NULL DEFAULT '0',
  `tax_category_id` int DEFAULT NULL,
  `qty_per_pack` decimal(15,3) NOT NULL DEFAULT '1.000',
  `pack_name` varchar(8) COLLATE utf8mb4_unicode_520_ci DEFAULT 'Each',
  `low_sell_item_id` int DEFAULT '0',
  `hsn_code` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `items_uq1` (`supplier_id`,`item_id`,`deleted`,`item_type`),
  KEY `supplier_id` (`supplier_id`),
  KEY `item_number` (`item_number`),
  KEY `deleted` (`deleted`,`item_type`),
  KEY `item_id` (`item_id`,`deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `ospos_items`
--

INSERT INTO `ospos_items` (`name`, `category`, `supplier_id`, `item_number`, `description`, `cost_price`, `unit_price`, `reorder_level`, `receiving_quantity`, `item_id`, `pic_filename`, `allow_alt_description`, `is_serialized`, `deleted`, `stock_type`, `item_type`, `tax_category_id`, `qty_per_pack`, `pack_name`, `low_sell_item_id`, `hsn_code`) VALUES
('Riz parfumé 5 kg', 'Épicerie', 2, 'RIZ001', 'Sac de riz parfumé 5 kg', 3500.00, 4500.00, 2.000, 2.000, 1, NULL, 0, 0, 0, 0, 0, NULL, 1.000, 'Chacun', 1, ''),
('Riz local 1 kg', 'Épicerie', 3, 'RIZ002', 'Sac de riz local 1 kg', 650.00, 850.00, 15.000, 1.000, 2, NULL, 0, 0, 0, 0, 0, NULL, 1.000, 'Each', 0, ''),
('Huile végétale 1 L', 'Épicerie', 2, 'HUI001', 'Bouteille huile végétale 1 litre', 900.00, 1200.00, 10.000, 1.000, 3, NULL, 0, 0, 0, 0, 0, NULL, 1.000, 'Each', 0, ''),
('Sucre 1 kg', 'Épicerie', 3, 'SUC001', 'Paquet de sucre 1 kg', 600.00, 800.00, 10.000, 1.000, 4, NULL, 0, 0, 0, 0, 0, NULL, 1.000, 'Each', 0, ''),
('Farine 1 kg', 'Épicerie', 3, 'FAR001', 'Paquet de farine 1 kg', 500.00, 700.00, 10.000, 1.000, 5, NULL, 0, 0, 0, 0, 0, NULL, 1.000, 'Each', 0, ''),
('Spaghetti 500 g', 'Épicerie', 2, 'PST001', 'Paquet de spaghetti 500 g', 350.00, 500.00, 15.000, 1.000, 6, NULL, 0, 0, 0, 0, 0, NULL, 1.000, 'Each', 0, ''),
('Lait en poudre 400 g', 'Produits laitiers', 3, 'LAI001', 'Boîte de lait en poudre 400 g', 1800.00, 2300.00, 8.000, 1.000, 7, NULL, 0, 0, 0, 0, 0, NULL, 1.000, 'Each', 0, ''),
('Café 100 g', 'Boissons', 4, 'CAF001', 'Paquet de café 100 g', 700.00, 950.00, 8.000, 1.000, 8, NULL, 0, 0, 0, 0, 0, NULL, 1.000, 'Each', 0, ''),
('Eau minérale 1,5 L', 'Boissons', 4, 'EAU001', 'Bouteille eau minérale 1,5 litre', 250.00, 350.00, 24.000, 1.000, 9, NULL, 0, 0, 0, 0, 0, NULL, 1.000, 'Each', 0, ''),
('Jus de fruits 1 L', 'Boissons', 4, 'JUS001', 'Brique de jus de fruits 1 litre', 650.00, 900.00, 12.000, 1.000, 10, NULL, 0, 0, 0, 0, 0, NULL, 1.000, 'Each', 0, ''),
('Soda  bouteille 1,5 L', 'Boissons', 4, 'SOD001', 'Bouteille de soda 1,5 litre', 600.00, 850.00, 12.000, 1.000, 11, NULL, 0, 0, 0, 0, 0, NULL, 1.000, 'Each', 0, ''),
('Savon de toilette', 'Hygiène', 5, 'SAV001', 'Savon de toilette unité', 250.00, 400.00, 20.000, 1.000, 12, NULL, 0, 0, 0, 0, 0, NULL, 1.000, 'Each', 0, ''),
('Dentifrice 100 ml', 'Hygiène', 5, 'DEN001', 'Tube de dentifrice 100 ml', 700.00, 1000.00, 8.000, 1.000, 13, NULL, 0, 0, 0, 0, 0, NULL, 1.000, 'Each', 0, ''),
('Shampooing 250 ml', 'Hygiène', 5, 'SHA001', 'Flacon de shampooing 250 ml', 1000.00, 1500.00, 6.000, 1.000, 14, NULL, 0, 0, 0, 0, 0, NULL, 1.000, 'Each', 0, ''),
('Eau de Javel 1 L', 'Entretien', 6, 'JAV001', 'Bouteille eau de Javel 1 litre', 400.00, 600.00, 10.000, 1.000, 15, NULL, 0, 0, 0, 0, 0, NULL, 1.000, 'Each', 0, ''),
('Liquide vaisselle', 'Entretien', 6, 'LIQ001', 'Flacon de liquide vaisselle', 650.00, 950.00, 8.000, 1.000, 16, NULL, 0, 0, 0, 0, 0, NULL, 1.000, 'Each', 0, ''),
('Lessive 1 kg', 'Entretien', 6, 'LES001', 'Paquet de lessive 1 kg', 1200.00, 1700.00, 8.000, 1.000, 17, NULL, 0, 0, 0, 0, 0, NULL, 1.000, 'Each', 0, ''),
('Papier hygiénique', 'Hygiène', 5, 'PAP001', 'Lot de papier hygiénique', 800.00, 1200.00, 10.000, 1.000, 18, NULL, 0, 0, 0, 0, 0, NULL, 1.000, 'Each', 0, ''),
('Biscuits', 'Snacks', 2, 'BIS001', 'Paquet de biscuits', 300.00, 500.00, 15.000, 1.000, 19, NULL, 0, 0, 0, 0, 0, NULL, 1.000, 'Each', 0, ''),
('Conserves de tomate', 'Épicerie', 3, 'TOM001', 'Boîte de concentré de tomate', 400.00, 600.00, 12.000, 1.000, 20, NULL, 0, 0, 0, 0, 0, NULL, 1.000, 'Each', 0, '');

-- --------------------------------------------------------

--
-- Structure de la table `ospos_items_taxes`
--

DROP TABLE IF EXISTS `ospos_items_taxes`;
CREATE TABLE IF NOT EXISTS `ospos_items_taxes` (
  `item_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `percent` decimal(15,3) NOT NULL,
  PRIMARY KEY (`item_id`,`name`,`percent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `ospos_items_taxes`
--

INSERT INTO `ospos_items_taxes` (`item_id`, `name`, `percent`) VALUES
(1, 'TVA1', 0.000),
(33, 'TVA1', 0.000),
(33, 'TVA2', 0.000);

-- --------------------------------------------------------

--
-- Structure de la table `ospos_item_kits`
--

DROP TABLE IF EXISTS `ospos_item_kits`;
CREATE TABLE IF NOT EXISTS `ospos_item_kits` (
  `item_kit_id` int NOT NULL AUTO_INCREMENT,
  `item_kit_number` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `item_id` int NOT NULL DEFAULT '0',
  `kit_discount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `kit_discount_type` tinyint(1) NOT NULL DEFAULT '0',
  `price_option` tinyint(1) NOT NULL DEFAULT '0',
  `print_option` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_kit_id`),
  KEY `item_kit_number` (`item_kit_number`),
  KEY `name` (`name`,`description`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `ospos_item_kits`
--

INSERT INTO `ospos_item_kits` (`item_kit_id`, `item_kit_number`, `name`, `description`, `item_id`, `kit_discount`, `kit_discount_type`, `price_option`, `print_option`) VALUES
(1, 'KIT-PDJ-001', 'Kit petit-déjeuner', 'Pack comprenant du café, du sucre et du lait pour le petit-déjeuner.', 0, 5.00, 1, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `ospos_item_kit_items`
--

DROP TABLE IF EXISTS `ospos_item_kit_items`;
CREATE TABLE IF NOT EXISTS `ospos_item_kit_items` (
  `item_kit_id` int NOT NULL,
  `item_id` int NOT NULL,
  `quantity` decimal(15,3) NOT NULL,
  `kit_sequence` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_kit_id`,`item_id`,`quantity`),
  KEY `ospos_item_kit_items_ibfk_2` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `ospos_item_kit_items`
--

INSERT INTO `ospos_item_kit_items` (`item_kit_id`, `item_id`, `quantity`, `kit_sequence`) VALUES
(1, 8, 1.000, 0),
(1, 11, 1.000, 0),
(1, 19, 1.000, 0);

-- --------------------------------------------------------

--
-- Structure de la table `ospos_item_quantities`
--

DROP TABLE IF EXISTS `ospos_item_quantities`;
CREATE TABLE IF NOT EXISTS `ospos_item_quantities` (
  `item_id` int NOT NULL,
  `location_id` int NOT NULL,
  `quantity` decimal(15,3) NOT NULL DEFAULT '0.000',
  PRIMARY KEY (`item_id`,`location_id`),
  KEY `item_id` (`item_id`),
  KEY `location_id` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `ospos_item_quantities`
--

INSERT INTO `ospos_item_quantities` (`item_id`, `location_id`, `quantity`) VALUES
(1, 1, 2.000),
(2, 1, 43.000),
(3, 1, 45.000),
(4, 1, 55.000),
(5, 1, 76.000),
(6, 1, 70.000),
(7, 1, 34.000),
(8, 1, 60.000),
(9, 1, 109.000),
(10, 1, 49.000),
(11, 1, 105.000),
(12, 1, 69.000),
(13, 1, 40.000),
(14, 1, 75.000),
(15, 1, 38.000),
(16, 1, 34.000),
(17, 1, 30.000),
(18, 1, 43.000),
(19, 1, 61.000),
(20, 1, 49.000),
(32, 1, 0.000),
(33, 1, 0.000);

-- --------------------------------------------------------

--
-- Structure de la table `ospos_migrations`
--

DROP TABLE IF EXISTS `ospos_migrations`;
CREATE TABLE IF NOT EXISTS `ospos_migrations` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `version` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `class` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `group` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `namespace` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `time` int NOT NULL,
  `batch` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `ospos_migrations`
--

INSERT INTO `ospos_migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '20170501000000', 'App\\Database\\Migrations\\Migration_Initial_Schema', 'development', 'App', 1793116640, 1),
(2, '20170501150000', 'App\\Database\\Migrations\\Migration_Upgrade_To_3_1_1', 'development', 'App', 1793116643, 1),
(3, '20170502221506', 'App\\Database\\Migrations\\Migration_Sales_Tax_Data', 'development', 'App', 1793116643, 1),
(4, '20180225100000', 'App\\Database\\Migrations\\Migration_Upgrade_To_3_2_0', 'development', 'App', 1793116643, 1),
(5, '20180501100000', 'App\\Database\\Migrations\\Migration_Upgrade_To_3_2_1', 'development', 'App', 1793116644, 1),
(6, '20181015100000', 'App\\Database\\Migrations\\Migration_Attributes', 'development', 'App', 1793116644, 1),
(7, '20190111270000', 'App\\Database\\Migrations\\Migration_Upgrade_To_3_3_0', 'development', 'App', 1793116644, 1),
(8, '20190129212600', 'App\\Database\\Migrations\\Migration_IndiaGST', 'development', 'App', 1793116645, 1),
(9, '20190213210000', 'App\\Database\\Migrations\\Migration_IndiaGST1', 'development', 'App', 1793116645, 1),
(10, '20190220210000', 'App\\Database\\Migrations\\Migration_IndiaGST2', 'development', 'App', 1793116645, 1),
(11, '20190301124900', 'App\\Database\\Migrations\\Migration_decimal_attribute_type', 'development', 'App', 1793116645, 1),
(12, '20190317102600', 'App\\Database\\Migrations\\Migration_add_iso_4217', 'development', 'App', 1793116645, 1),
(13, '20190427100000', 'App\\Database\\Migrations\\Migration_PaymentTracking', 'development', 'App', 1793116645, 1),
(14, '20190502100000', 'App\\Database\\Migrations\\Migration_RefundTracking', 'development', 'App', 1793116645, 1),
(15, '20190612100000', 'App\\Database\\Migrations\\Migration_DBFix', 'development', 'App', 1793116645, 1),
(16, '20190615100000', 'App\\Database\\Migrations\\Migration_fix_attribute_datetime', 'development', 'App', 1793116645, 1),
(17, '20190712150200', 'App\\Database\\Migrations\\Migration_fix_empty_reports', 'development', 'App', 1793116645, 1),
(18, '20191008100000', 'App\\Database\\Migrations\\Migration_receipttaxindicator', 'development', 'App', 1793116645, 1),
(19, '20191231100000', 'App\\Database\\Migrations\\Migration_PaymentDateFix', 'development', 'App', 1793116645, 1),
(20, '20200125100000', 'App\\Database\\Migrations\\Migration_SalesChangePrice', 'development', 'App', 1793116645, 1),
(21, '20200202000000', 'App\\Database\\Migrations\\Migration_TaxAmount', 'development', 'App', 1793116645, 1),
(22, '20200215100000', 'App\\Database\\Migrations\\Migration_taxgroupconstraint', 'development', 'App', 1793116646, 1),
(23, '20200508000000', 'App\\Database\\Migrations\\Migration_image_upload_defaults', 'development', 'App', 1793116646, 1),
(24, '20200819000000', 'App\\Database\\Migrations\\Migration_modify_attr_links_constraint', 'development', 'App', 1793116646, 1),
(25, '20201108100000', 'App\\Database\\Migrations\\Migration_cashrounding', 'development', 'App', 1793116646, 1),
(26, '20201110000000', 'App\\Database\\Migrations\\Migration_add_item_kit_number', 'development', 'App', 1793116646, 1),
(27, '20210103000000', 'App\\Database\\Migrations\\Migration_modify_session_datatype', 'development', 'App', 1793116646, 1),
(28, '20210422000000', 'App\\Database\\Migrations\\Migration_database_optimizations', 'development', 'App', 1793116648, 1),
(29, '20210422000001', 'App\\Database\\Migrations\\Migration_remove_duplicate_links', 'development', 'App', 1793116648, 1),
(30, '20210714140000', 'App\\Database\\Migrations\\Migration_move_expenses_categories', 'development', 'App', 1793116648, 1),
(31, '20220127000000', 'App\\Database\\Migrations\\ConvertToCI4', 'development', 'App', 1793116648, 1),
(32, '20230307000000', 'App\\Database\\Migrations\\IntToTinyint', 'development', 'App', 1793116648, 1),
(33, '20230412000000', 'App\\Database\\Migrations\\Migration_add_missing_config', 'development', 'App', 1793116648, 1),
(34, '20230412000001', 'App\\Database\\Migrations\\Migration_drop_account_number_index', 'development', 'App', 1793116648, 1),
(35, '20240319000000', 'App\\Database\\Migrations\\Migration_Convert_Barcode_Types', 'development', 'App', 1793116648, 1),
(36, '20240630000001', 'App\\Database\\Migrations\\Migration_fix_keys_for_db_upgrade', 'development', 'App', 1793116648, 1),
(37, '20240826000000', 'App\\Database\\Migrations\\fix_duplicate_attributes', 'development', 'App', 1793116649, 1),
(38, '20250213000000', 'App\\Database\\Migrations\\Migration_Attributes_fix_cascading_delete', 'development', 'App', 1793116649, 1),
(39, '20250425000000', 'App\\Database\\Migrations\\Migration_sessions_migration', 'development', 'App', 1793116649, 1),
(40, '20250519000000', 'App\\Database\\Migrations\\MigrationOptimizationIndices', 'development', 'App', 1793116649, 1),
(41, '20250521000000', 'App\\Database\\Migrations\\FixImageFilenameSpaces', 'development', 'App', 1793116649, 1),
(42, '20250522000000', 'App\\Database\\Migrations\\AttributeLinksUniqueConstraint', 'development', 'App', 1793116649, 1),
(43, '20250716170000', 'App\\Database\\Migrations\\Migration_MissingConfigKeys', 'development', 'App', 1793116649, 1),
(44, '20250729170000', 'App\\Database\\Migrations\\Migration_NullableTaxCategoryId', 'development', 'App', 1793116649, 1),
(45, '20260405000000', 'App\\Database\\Migrations\\Migration_Mysql84Utf8mb4Conversion', 'development', 'App', 1793116654, 1),
(46, '20260506000000', 'App\\Database\\Migrations\\AddShortcutKeys', 'development', 'App', 1793116654, 1),
(47, '20170501000000', 'App\\Database\\Migrations\\Migration_Initial_Schema', 'tests', 'App', 1793211190, 2),
(48, '20261029172000', 'AddCashupSessionStatusAndLinks', 'development', 'App', 1793296081, 47);

-- --------------------------------------------------------

--
-- Structure de la table `ospos_modules`
--

DROP TABLE IF EXISTS `ospos_modules`;
CREATE TABLE IF NOT EXISTS `ospos_modules` (
  `name_lang_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `desc_lang_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `sort` int NOT NULL,
  `module_id` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`module_id`),
  UNIQUE KEY `desc_lang_key` (`desc_lang_key`),
  UNIQUE KEY `name_lang_key` (`name_lang_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `ospos_modules`
--

INSERT INTO `ospos_modules` (`name_lang_key`, `desc_lang_key`, `sort`, `module_id`) VALUES
('module_attributes', 'module_attributes_desc', 107, 'attributes'),
('module_cashups', 'module_cashups_desc', 110, 'cashups'),
('module_config', 'module_config_desc', 900, 'config'),
('module_customers', 'module_customers_desc', 10, 'customers'),
('module_employees', 'module_employees_desc', 80, 'employees'),
('module_expenses', 'module_expenses_desc', 108, 'expenses'),
('module_expenses_categories', 'module_expenses_categories_desc', 109, 'expenses_categories'),
('module_giftcards', 'module_giftcards_desc', 90, 'giftcards'),
('module_home', 'module_home_desc', 1, 'home'),
('module_item_kits', 'module_item_kits_desc', 30, 'item_kits'),
('module_items', 'module_items_desc', 20, 'items'),
('module_messages', 'module_messages_desc', 98, 'messages'),
('module_office', 'module_office_desc', 999, 'office'),
('module_receivings', 'module_receivings_desc', 60, 'receivings'),
('module_reports', 'module_reports_desc', 50, 'reports'),
('module_sales', 'module_sales_desc', 70, 'sales'),
('module_suppliers', 'module_suppliers_desc', 40, 'suppliers'),
('module_taxes', 'module_taxes_desc', 105, 'taxes');

-- --------------------------------------------------------

--
-- Structure de la table `ospos_people`
--

DROP TABLE IF EXISTS `ospos_people`;
CREATE TABLE IF NOT EXISTS `ospos_people` (
  `first_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `gender` int DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `address_1` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `address_2` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `zip` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comments` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `person_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`person_id`),
  KEY `email` (`email`),
  KEY `first_name` (`first_name`(191),`last_name`(191),`email`(191),`phone_number`(191))
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `ospos_people`
--

INSERT INTO `ospos_people` (`first_name`, `last_name`, `gender`, `phone_number`, `email`, `address_1`, `address_2`, `city`, `state`, `zip`, `country`, `comments`, `person_id`) VALUES
('Regis', 'Kouame', NULL, '0717873421', 'regis@test.com', 'Address 1', '', '', '', '', '', '', 1),
('Koffi', 'Distribution', NULL, '0700000001', 'distribution@example.com', 'Cocody', '', 'Abidjan', 'Abidjan', '', 'Côte d’Ivoire', 'Fournisseur de test SuperMarche.CI', 2),
('Awa', 'Agroalimentaire', NULL, '0700000002', 'agro@example.com', 'Yopougon', '', 'Abidjan', 'Abidjan', '', 'Côte d’Ivoire', 'Fournisseur de test SuperMarche.CI', 3),
('Jean', 'Boissons', NULL, '0700000003', 'boissons@example.com', 'Treichville', '', 'Abidjan', 'Abidjan', '', 'Côte d’Ivoire', 'Fournisseur de test SuperMarche.CI', 4),
('Marie', 'Hygiène', NULL, '0700000004', 'hygiene@example.com', 'Marcory', '', 'Abidjan', 'Abidjan', '', 'Côte d’Ivoire', 'Fournisseur de test SuperMarche.CI', 5),
('Paul', 'Produits ménagers', NULL, '0700000005', 'menager@example.com', 'Adjamé', '', 'Abidjan', 'Abidjan', '', 'Côte d’Ivoire', 'Fournisseur de test SuperMarche.CI', 6),
('Aminata', 'Koné', NULL, '0500000011', 'client01@example.com', 'Cocody', '', 'Abidjan', 'Abidjan', '', 'Côte d’Ivoire', 'Client de test SuperMarche.CI', 9),
('Moussa', 'Traoré', NULL, '0500000012', 'client02@example.com', 'Yopougon', '', 'Abidjan', 'Abidjan', '', 'Côte d’Ivoire', 'Client de test SuperMarche.CI', 10),
('Fatou', 'Diallo', NULL, '0500000013', 'client03@example.com', 'Marcory', '', 'Abidjan', 'Abidjan', '', 'Côte d’Ivoire', 'Client de test SuperMarche.CI', 11),
('Yao', 'Kouassi', NULL, '0500000014', 'client04@example.com', 'Treichville', '', 'Abidjan', 'Abidjan', '', 'Côte d’Ivoire', 'Client de test SuperMarche.CI', 12),
('Aya', 'Bamba', NULL, '0500000015', 'client05@example.com', 'Abobo', '', 'Abidjan', 'Abidjan', '', 'Côte d’Ivoire', 'Client de test SuperMarche.CI', 13),
('Ibrahim', 'Coulibaly', NULL, '0500000016', 'client06@example.com', 'Plateau', '', 'Abidjan', 'Abidjan', '', 'Côte d’Ivoire', 'Client de test SuperMarche.CI', 14),
('Marie', 'N’Guessan', NULL, '0500000017', 'client07@example.com', 'Angré', '', 'Abidjan', 'Abidjan', '', 'Côte d’Ivoire', 'Client de test SuperMarche.CI', 15),
('Serge', 'Koffi', NULL, '0500000018', 'client08@example.com', 'Riviera', '', 'Abidjan', 'Abidjan', '', 'Côte d’Ivoire', 'Client de test SuperMarche.CI', 16),
('Adjoua', 'Kouamé', NULL, '0500000019', 'client09@example.com', 'Bingerville', '', 'Abidjan', 'Abidjan', '', 'Côte d’Ivoire', 'Client de test SuperMarche.CI', 17),
('Kader', 'Ouattara', NULL, '0500000020', 'client10@example.com', 'Port-Bouët', '', 'Abidjan', 'Abidjan', '', 'Côte d’Ivoire', 'Client de test SuperMarche.CI', 18),
('Jean-Marc', 'Kouassi', 1, '0700000001', 'jean-marc.kouassi.test@example.com', 'Cocody Angré, voie principale', 'Appartement 12', 'Abidjan', 'Abidjan', '00225', 'Côte d’Ivoire', 'Client créé pour tester le formulaire et l’enregistrement.', 24),
('Séphora', 'Atse', 0, '0707889890', 'atse@gmail.com', 'ABOBO', '', 'Abidjan', 'Abidjan', '00000', 'Côte d&#38;#38;#38;#38;#38;#38;#38;#38;#38;#38;#39;Ivoire', 'Employé de caisse', 25);

-- --------------------------------------------------------

--
-- Structure de la table `ospos_permissions`
--

DROP TABLE IF EXISTS `ospos_permissions`;
CREATE TABLE IF NOT EXISTS `ospos_permissions` (
  `permission_id` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `module_id` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `location_id` int DEFAULT NULL,
  PRIMARY KEY (`permission_id`),
  KEY `module_id` (`module_id`),
  KEY `ospos_permissions_ibfk_2` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `ospos_permissions`
--

INSERT INTO `ospos_permissions` (`permission_id`, `module_id`, `location_id`) VALUES
('attributes', 'attributes', NULL),
('cashups', 'cashups', NULL),
('config', 'config', NULL),
('customers', 'customers', NULL),
('employees', 'employees', NULL),
('expenses', 'expenses', NULL),
('expenses_categories', 'expenses_categories', NULL),
('giftcards', 'giftcards', NULL),
('home', 'home', NULL),
('item_kits', 'item_kits', NULL),
('items', 'items', NULL),
('items_stock', 'items', 1),
('messages', 'messages', NULL),
('office', 'office', NULL),
('receivings', 'receivings', NULL),
('receivings_stock', 'receivings', 1),
('reports', 'reports', NULL),
('reports_categories', 'reports', NULL),
('reports_customers', 'reports', NULL),
('reports_discounts', 'reports', NULL),
('reports_employees', 'reports', NULL),
('reports_expenses_categories', 'reports', NULL),
('reports_inventory', 'reports', NULL),
('reports_items', 'reports', NULL),
('reports_payments', 'reports', NULL),
('reports_receivings', 'reports', NULL),
('reports_sales', 'reports', NULL),
('reports_sales_taxes', 'reports', NULL),
('reports_suppliers', 'reports', NULL),
('reports_taxes', 'reports', NULL),
('sales', 'sales', NULL),
('sales_change_price', 'sales', NULL),
('sales_delete', 'sales', NULL),
('sales_stock', 'sales', 1),
('suppliers', 'suppliers', NULL),
('taxes', 'taxes', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `ospos_receivings`
--

DROP TABLE IF EXISTS `ospos_receivings`;
CREATE TABLE IF NOT EXISTS `ospos_receivings` (
  `receiving_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `supplier_id` int DEFAULT NULL,
  `employee_id` int NOT NULL DEFAULT '0',
  `comment` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `receiving_id` int NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `reference` varchar(32) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`receiving_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `employee_id` (`employee_id`),
  KEY `reference` (`reference`),
  KEY `receiving_time` (`receiving_time`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `ospos_receivings`
--

INSERT INTO `ospos_receivings` (`receiving_time`, `supplier_id`, `employee_id`, `comment`, `receiving_id`, `payment_type`, `reference`) VALUES
('2026-10-28 12:47:49', 2, 1, 'Approvisionnement de test SuperMarche.CI', 1, 'Cash', 'TEST-REC-001'),
('2026-10-28 12:47:49', 3, 1, 'Approvisionnement de test SuperMarche.CI', 2, 'Cash', 'TEST-REC-002'),
('2026-10-28 12:47:49', 4, 1, 'Approvisionnement de test SuperMarche.CI', 3, 'Cash', 'TEST-REC-003'),
('2026-10-28 12:47:49', 5, 1, 'Approvisionnement de test SuperMarche.CI', 4, 'Cash', 'TEST-REC-004'),
('2026-10-28 12:47:49', 6, 1, 'Approvisionnement de test SuperMarche.CI', 5, 'Cash', 'TEST-REC-005'),
('2026-10-28 14:09:05', NULL, 1, '', 8, 'Esp&egrave;ce', ''),
('2026-10-28 17:56:01', NULL, 1, '', 9, 'Esp&egrave;ce', ''),
('2026-10-28 18:19:08', NULL, 1, '', 10, 'Espèce', ''),
('2026-10-29 11:59:06', 2, 1, '', 11, 'Espèce', ''),
('2026-10-29 15:52:49', NULL, 1, '', 12, 'Espèce', ''),
('2026-10-30 16:36:30', NULL, 1, '', 13, 'Espèce', ''),
('2026-10-30 16:37:36', NULL, 1, '', 14, 'Espèce', ''),
('2026-10-30 17:14:06', NULL, 1, '', 15, 'Espèce', '');

-- --------------------------------------------------------

--
-- Structure de la table `ospos_receivings_items`
--

DROP TABLE IF EXISTS `ospos_receivings_items`;
CREATE TABLE IF NOT EXISTS `ospos_receivings_items` (
  `receiving_id` int NOT NULL DEFAULT '0',
  `item_id` int NOT NULL DEFAULT '0',
  `description` varchar(30) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `serialnumber` varchar(30) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `line` int NOT NULL,
  `quantity_purchased` decimal(15,3) NOT NULL DEFAULT '0.000',
  `item_cost_price` decimal(15,2) NOT NULL,
  `item_unit_price` decimal(15,2) NOT NULL,
  `discount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `discount_type` tinyint(1) NOT NULL DEFAULT '0',
  `item_location` int NOT NULL,
  `receiving_quantity` decimal(15,3) NOT NULL DEFAULT '1.000',
  PRIMARY KEY (`receiving_id`,`item_id`,`line`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `ospos_receivings_items`
--

INSERT INTO `ospos_receivings_items` (`receiving_id`, `item_id`, `description`, `serialnumber`, `line`, `quantity_purchased`, `item_cost_price`, `item_unit_price`, `discount`, `discount_type`, `item_location`, `receiving_quantity`) VALUES
(1, 1, 'Riz parfumé 5 kg', NULL, 1, 10.000, 3500.00, 4500.00, 0.00, 0, 1, 1.000),
(1, 3, 'Huile végétale 1 L', NULL, 1, 10.000, 900.00, 1200.00, 0.00, 0, 1, 1.000),
(1, 6, 'Spaghetti 500 g', NULL, 1, 10.000, 350.00, 500.00, 0.00, 0, 1, 1.000),
(1, 19, 'Biscuits', NULL, 1, 10.000, 300.00, 500.00, 0.00, 0, 1, 1.000),
(2, 2, 'Riz local 1 kg', NULL, 1, 10.000, 650.00, 850.00, 0.00, 0, 1, 1.000),
(2, 4, 'Sucre 1 kg', NULL, 1, 10.000, 600.00, 800.00, 0.00, 0, 1, 1.000),
(2, 5, 'Farine 1 kg', NULL, 1, 10.000, 500.00, 700.00, 0.00, 0, 1, 1.000),
(2, 7, 'Lait en poudre 400 g', NULL, 1, 10.000, 1800.00, 2300.00, 0.00, 0, 1, 1.000),
(2, 20, 'Conserves de tomate', NULL, 1, 10.000, 400.00, 600.00, 0.00, 0, 1, 1.000),
(3, 8, 'Café 100 g', NULL, 1, 10.000, 700.00, 950.00, 0.00, 0, 1, 1.000),
(3, 9, 'Eau minérale 1,5 L', NULL, 1, 10.000, 250.00, 350.00, 0.00, 0, 1, 1.000),
(3, 10, 'Jus de fruits 1 L', NULL, 1, 10.000, 650.00, 900.00, 0.00, 0, 1, 1.000),
(3, 11, 'Soda  bouteille 1,5 L', NULL, 1, 10.000, 600.00, 850.00, 0.00, 0, 1, 1.000),
(4, 12, 'Savon de toilette', NULL, 1, 10.000, 250.00, 400.00, 0.00, 0, 1, 1.000),
(4, 13, 'Dentifrice 100 ml', NULL, 1, 10.000, 700.00, 1000.00, 0.00, 0, 1, 1.000),
(4, 14, 'Shampooing 250 ml', NULL, 1, 10.000, 1000.00, 1500.00, 0.00, 0, 1, 1.000),
(4, 18, 'Papier hygiénique', NULL, 1, 10.000, 800.00, 1200.00, 0.00, 0, 1, 1.000),
(5, 15, 'Eau de Javel 1 L', NULL, 1, 10.000, 400.00, 600.00, 0.00, 0, 1, 1.000),
(5, 16, 'Liquide vaisselle', NULL, 1, 10.000, 650.00, 950.00, 0.00, 0, 1, 1.000),
(5, 17, 'Lessive 1 kg', NULL, 1, 10.000, 1200.00, 1700.00, 0.00, 0, 1, 1.000),
(8, 11, 'Bouteille de soda 1,5 litre', '', 2, -1.000, 600.00, 600.00, 0.00, 0, 1, 1.000),
(8, 19, 'Paquet de biscuits', '', 1, 1.000, 300.00, 300.00, 0.00, 0, 1, 1.000),
(9, 8, 'Paquet de café 100 g', '', 1, 20.000, 700.00, 700.00, 0.00, 0, 1, 1.000),
(10, 13, 'Tube de dentifrice 100 ml', '', 1, 5.000, 700.00, 700.00, 0.00, 0, 1, 1.000),
(11, 32, 'Sac de riz local de 5 kg &#38;', '', 2, 20.000, 4000.00, 4000.00, 0.00, 0, 1, 1.000),
(12, 1, 'Sac de riz parfumé 5 kg', '', 1, 10.000, 3500.00, 3500.00, 0.00, 0, 1, 2.000),
(13, 5, 'Paquet de farine 1 kg', '', 1, 45.000, 500.00, 500.00, 0.00, 0, 1, 1.000),
(14, 11, 'Bouteille de soda 1,5 litre', '', 1, 50.000, 600.00, 600.00, 0.00, 0, 1, 1.000),
(15, 14, 'Flacon de shampooing 250 ml', '', 1, 45.000, 1000.00, 1000.00, 0.00, 0, 1, 1.000);

-- --------------------------------------------------------

--
-- Structure de la table `ospos_sales`
--

DROP TABLE IF EXISTS `ospos_sales`;
CREATE TABLE IF NOT EXISTS `ospos_sales` (
  `sale_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int DEFAULT NULL,
  `employee_id` int NOT NULL DEFAULT '0',
  `comment` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `invoice_number` varchar(32) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `dinner_table_id` int DEFAULT NULL,
  `sale_id` int NOT NULL AUTO_INCREMENT,
  `quote_number` varchar(32) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sale_status` tinyint(1) NOT NULL DEFAULT '0',
  `work_order_number` varchar(32) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sale_type` tinyint(1) NOT NULL DEFAULT '0',
  `cashup_id` int DEFAULT NULL,
  PRIMARY KEY (`sale_id`),
  UNIQUE KEY `invoice_number` (`invoice_number`),
  KEY `customer_id` (`customer_id`),
  KEY `employee_id` (`employee_id`),
  KEY `sale_time` (`sale_time`),
  KEY `dinner_table_id` (`dinner_table_id`),
  KEY `idx_sales_cashup` (`cashup_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `ospos_sales`
--

INSERT INTO `ospos_sales` (`sale_time`, `customer_id`, `employee_id`, `comment`, `invoice_number`, `dinner_table_id`, `sale_id`, `quote_number`, `sale_status`, `work_order_number`, `sale_type`, `cashup_id`) VALUES
('2026-10-28 12:56:16', NULL, 1, '', NULL, NULL, 1, NULL, 0, NULL, 0, NULL),
('2026-10-28 13:01:22', NULL, 1, '', NULL, NULL, 4, NULL, 0, NULL, 0, NULL),
('2026-10-28 14:20:12', NULL, 1, '', NULL, NULL, 5, NULL, 0, NULL, 0, NULL),
('2026-10-28 14:30:21', NULL, 1, '', NULL, NULL, 6, NULL, 0, NULL, 0, NULL),
('2026-10-28 14:31:22', NULL, 1, '', NULL, NULL, 7, NULL, 0, NULL, 0, NULL),
('2026-10-28 14:45:19', NULL, 1, '', NULL, NULL, 8, NULL, 0, NULL, 0, NULL),
('2026-10-28 14:52:20', NULL, 1, '', NULL, NULL, 9, NULL, 0, NULL, 0, NULL),
('2026-10-28 15:02:36', NULL, 1, '', NULL, NULL, 10, NULL, 0, NULL, 0, NULL),
('2026-10-28 15:10:38', NULL, 1, '', NULL, NULL, 11, NULL, 0, NULL, 0, NULL),
('2026-10-28 15:39:51', NULL, 1, '', NULL, NULL, 12, NULL, 0, NULL, 0, NULL),
('2026-10-28 16:04:13', NULL, 1, '', NULL, NULL, 13, NULL, 0, NULL, 0, NULL),
('2026-10-29 08:30:10', 24, 1, '', NULL, NULL, 14, NULL, 0, NULL, 0, NULL),
('2026-10-29 11:50:06', NULL, 25, '', NULL, NULL, 15, NULL, 0, NULL, 0, NULL),
('2026-10-29 11:55:31', NULL, 25, '', NULL, NULL, 16, NULL, 0, NULL, 0, NULL),
('2026-10-29 11:57:41', NULL, 25, '', NULL, NULL, 17, NULL, 0, NULL, 0, NULL),
('2026-10-29 11:58:06', NULL, 25, '', NULL, NULL, 18, NULL, 0, NULL, 0, NULL),
('2026-10-29 16:44:19', NULL, 25, '', NULL, NULL, 21, NULL, 0, NULL, 0, NULL),
('2026-10-30 08:36:59', NULL, 25, '', NULL, NULL, 22, NULL, 0, NULL, 0, 4),
('2026-10-30 08:40:20', NULL, 25, '', NULL, NULL, 23, NULL, 0, NULL, 0, 4),
('2026-10-30 09:30:14', NULL, 25, '', NULL, NULL, 24, NULL, 0, NULL, 0, 6);

-- --------------------------------------------------------

--
-- Structure de la table `ospos_sales_backup_20261029_171932`
--

DROP TABLE IF EXISTS `ospos_sales_backup_20261029_171932`;
CREATE TABLE IF NOT EXISTS `ospos_sales_backup_20261029_171932` (
  `sale_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int DEFAULT NULL,
  `employee_id` int NOT NULL DEFAULT '0',
  `comment` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `invoice_number` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `dinner_table_id` int DEFAULT NULL,
  `sale_id` int NOT NULL DEFAULT '0',
  `quote_number` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sale_status` tinyint(1) NOT NULL DEFAULT '0',
  `work_order_number` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sale_type` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ospos_sales_backup_20261029_171932`
--

INSERT INTO `ospos_sales_backup_20261029_171932` (`sale_time`, `customer_id`, `employee_id`, `comment`, `invoice_number`, `dinner_table_id`, `sale_id`, `quote_number`, `sale_status`, `work_order_number`, `sale_type`) VALUES
('2026-10-28 12:56:16', NULL, 1, '', NULL, NULL, 1, NULL, 0, NULL, 0),
('2026-10-28 13:01:22', NULL, 1, '', NULL, NULL, 4, NULL, 0, NULL, 0),
('2026-10-28 14:20:12', NULL, 1, '', NULL, NULL, 5, NULL, 0, NULL, 0),
('2026-10-28 14:30:21', NULL, 1, '', NULL, NULL, 6, NULL, 0, NULL, 0),
('2026-10-28 14:31:22', NULL, 1, '', NULL, NULL, 7, NULL, 0, NULL, 0),
('2026-10-28 14:45:19', NULL, 1, '', NULL, NULL, 8, NULL, 0, NULL, 0),
('2026-10-28 14:52:20', NULL, 1, '', NULL, NULL, 9, NULL, 0, NULL, 0),
('2026-10-28 15:02:36', NULL, 1, '', NULL, NULL, 10, NULL, 0, NULL, 0),
('2026-10-28 15:10:38', NULL, 1, '', NULL, NULL, 11, NULL, 0, NULL, 0),
('2026-10-28 15:39:51', NULL, 1, '', NULL, NULL, 12, NULL, 0, NULL, 0),
('2026-10-28 16:04:13', NULL, 1, '', NULL, NULL, 13, NULL, 0, NULL, 0),
('2026-10-29 08:30:10', 24, 1, '', NULL, NULL, 14, NULL, 0, NULL, 0),
('2026-10-29 11:50:06', NULL, 25, '', NULL, NULL, 15, NULL, 0, NULL, 0),
('2026-10-29 11:55:31', NULL, 25, '', NULL, NULL, 16, NULL, 0, NULL, 0),
('2026-10-29 11:57:41', NULL, 25, '', NULL, NULL, 17, NULL, 0, NULL, 0),
('2026-10-29 11:58:06', NULL, 25, '', NULL, NULL, 18, NULL, 0, NULL, 0),
('2026-10-29 16:44:19', NULL, 25, '', NULL, NULL, 21, NULL, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `ospos_sales_items`
--

DROP TABLE IF EXISTS `ospos_sales_items`;
CREATE TABLE IF NOT EXISTS `ospos_sales_items` (
  `sale_id` int NOT NULL DEFAULT '0',
  `item_id` int NOT NULL DEFAULT '0',
  `description` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `serialnumber` varchar(30) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `line` int NOT NULL DEFAULT '0',
  `quantity_purchased` decimal(15,3) NOT NULL DEFAULT '0.000',
  `item_cost_price` decimal(15,2) NOT NULL,
  `item_unit_price` decimal(15,2) NOT NULL,
  `discount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `discount_type` tinyint(1) NOT NULL DEFAULT '0',
  `item_location` int NOT NULL,
  `print_option` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sale_id`,`item_id`,`line`),
  KEY `sale_id` (`sale_id`),
  KEY `item_id` (`item_id`),
  KEY `item_location` (`item_location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `ospos_sales_items`
--

INSERT INTO `ospos_sales_items` (`sale_id`, `item_id`, `description`, `serialnumber`, `line`, `quantity_purchased`, `item_cost_price`, `item_unit_price`, `discount`, `discount_type`, `item_location`, `print_option`) VALUES
(1, 11, 'Bouteille de soda 1,5 litre', '', 1, 4.000, 600.00, 850.00, 0.00, 0, 1, 0),
(4, 15, 'Bouteille eau de Javel 1 litre', '', 1, 2.000, 400.00, 600.00, 0.00, 0, 1, 0),
(5, 16, 'Flacon de liquide vaisselle', '', 1, 1.000, 650.00, 950.00, 0.00, 0, 1, 0),
(6, 5, 'Paquet de farine 1 kg', '', 1, 1.000, 500.00, 700.00, 0.00, 0, 1, 0),
(7, 2, 'Sac de riz local 1 kg', '', 1, 1.000, 650.00, 850.00, 0.00, 0, 1, 0),
(8, 10, 'Brique de jus de fruits 1 litre', '', 1, 1.000, 650.00, 900.00, 0.00, 0, 1, 0),
(9, 20, 'Boîte de concentré de tomate', '', 1, 1.000, 400.00, 600.00, 0.00, 0, 1, 0),
(10, 12, 'Savon de toilette unité', '', 1, 1.000, 250.00, 400.00, 0.00, 0, 1, 0),
(11, 18, 'Lot de papier hygiénique', '', 1, 2.000, 800.00, 1200.00, 0.00, 0, 1, 0),
(12, 2, 'Sac de riz local 1 kg', '', 1, 6.000, 650.00, 850.00, 0.00, 0, 1, 0),
(13, 32, 'Sac de riz local de 5 kg &mdash; article fictif de test.', '', 1, 5.000, 4000.00, 5000.00, 0.00, 0, 1, 0),
(14, 5, 'Paquet de farine 1 kg', '', 1, 4.000, 500.00, 700.00, 0.00, 0, 1, 0),
(14, 7, 'Boîte de lait en poudre 400 g', '', 2, 1.000, 1800.00, 2300.00, 0.00, 0, 1, 0),
(14, 9, 'Bouteille eau minérale 1,5 litre', '', 3, 1.000, 250.00, 350.00, 0.00, 0, 1, 0),
(15, 5, 'Paquet de farine 1 kg', '', 1, 3.000, 500.00, 700.00, 0.00, 0, 1, 0),
(16, 1, 'Sac de riz parfumé 5 kg', '', 1, 50.000, 3500.00, 4500.00, 0.00, 0, 1, 0),
(17, 32, 'Sac de riz local de 5 kg &#38;#38;#38;#38;mdash; article fictif de test.', '', 1, 14.000, 4000.00, 5000.00, 0.00, 0, 1, 0),
(18, 32, 'Sac de riz local de 5 kg &#38;mdash; article fictif de test.', '', 1, 2.000, 4000.00, 5000.00, 0.00, 0, 1, 0),
(21, 1, 'Sac de riz parfumé 5 kg', '', 1, 15.000, 3500.00, 4500.00, 0.00, 0, 1, 0),
(22, 1, 'Sac de riz parfumé 5 kg', '', 1, 1.000, 3500.00, 4500.00, 0.00, 0, 1, 0),
(23, 1, 'Sac de riz parfumé 5 kg', '', 1, 1.000, 3500.00, 4500.00, 0.00, 0, 1, 0),
(24, 5, 'Paquet de farine 1 kg', '', 1, 1.000, 500.00, 700.00, 0.00, 0, 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `ospos_sales_items_taxes`
--

DROP TABLE IF EXISTS `ospos_sales_items_taxes`;
CREATE TABLE IF NOT EXISTS `ospos_sales_items_taxes` (
  `sale_id` int NOT NULL,
  `item_id` int NOT NULL,
  `line` int NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `percent` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax_type` tinyint(1) NOT NULL DEFAULT '0',
  `rounding_code` tinyint(1) NOT NULL DEFAULT '0',
  `cascade_sequence` tinyint(1) NOT NULL DEFAULT '0',
  `item_tax_amount` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sales_tax_code_id` int DEFAULT NULL,
  `jurisdiction_id` int DEFAULT NULL,
  `tax_category_id` int DEFAULT NULL,
  PRIMARY KEY (`sale_id`,`item_id`,`line`,`name`,`percent`),
  KEY `sale_id` (`sale_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `ospos_sales_items_taxes`
--

INSERT INTO `ospos_sales_items_taxes` (`sale_id`, `item_id`, `line`, `name`, `percent`, `tax_type`, `rounding_code`, `cascade_sequence`, `item_tax_amount`, `sales_tax_code_id`, `jurisdiction_id`, `tax_category_id`) VALUES
(21, 1, 1, 'TVA1', 0.0000, 1, 1, 0, 0.0000, NULL, NULL, NULL),
(22, 1, 1, 'TVA1', 0.0000, 1, 1, 0, 0.0000, NULL, NULL, NULL),
(23, 1, 1, 'TVA1', 0.0000, 1, 1, 0, 0.0000, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `ospos_sales_payments`
--

DROP TABLE IF EXISTS `ospos_sales_payments`;
CREATE TABLE IF NOT EXISTS `ospos_sales_payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `sale_id` int NOT NULL,
  `payment_type` varchar(40) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `payment_amount` decimal(15,2) NOT NULL,
  `cash_refund` decimal(15,2) NOT NULL DEFAULT '0.00',
  `cash_adjustment` tinyint NOT NULL DEFAULT '0',
  `employee_id` int DEFAULT NULL,
  `payment_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_code` varchar(40) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `cashup_id` int DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `payment_sale` (`sale_id`,`payment_type`),
  KEY `employee_id` (`employee_id`),
  KEY `payment_time` (`payment_time`),
  KEY `idx_sales_payments_cashup` (`cashup_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `ospos_sales_payments`
--

INSERT INTO `ospos_sales_payments` (`payment_id`, `sale_id`, `payment_type`, `payment_amount`, `cash_refund`, `cash_adjustment`, `employee_id`, `payment_time`, `reference_code`, `cashup_id`) VALUES
(1, 1, 'Espèce', 3400.00, 0.00, 0, 1, '2026-10-28 12:56:16', '', NULL),
(4, 4, 'Espèce', 5000.00, 0.00, 0, 1, '2026-10-28 13:01:22', '', NULL),
(5, 4, 'Espèce', 0.00, 3800.00, 0, 1, '2026-10-28 13:01:22', '', NULL),
(6, 5, 'Espèce', 1000.00, 0.00, 0, 1, '2026-10-28 14:20:12', '', NULL),
(7, 5, 'Espèce', 0.00, 50.00, 0, 1, '2026-10-28 14:20:12', '', NULL),
(9, 6, 'Espèce', 5000.00, 0.00, 0, 1, '2026-10-28 14:30:22', '', NULL),
(10, 6, 'Espèce', 0.00, 4300.00, 0, 1, '2026-10-28 14:30:22', '', NULL),
(11, 7, 'Espèce', 1000.00, 0.00, 0, 1, '2026-10-28 14:31:22', '', NULL),
(12, 7, 'Espèce', 0.00, 150.00, 0, 1, '2026-10-28 14:31:22', '', NULL),
(13, 8, 'Espèce', 1000.00, 0.00, 0, 1, '2026-10-28 14:45:19', '', NULL),
(14, 8, 'Espèce', 0.00, 100.00, 0, 1, '2026-10-28 14:45:19', '', NULL),
(15, 9, 'Espèce', 1000.00, 0.00, 0, 1, '2026-10-28 14:52:20', '', NULL),
(16, 9, 'Espèce', 0.00, 400.00, 0, 1, '2026-10-28 14:52:20', '', NULL),
(17, 10, 'Esp&egrave;ce', 900.00, 0.00, 0, 1, '2026-10-28 15:02:36', '', NULL),
(18, 10, 'Espèce', 0.00, 500.00, 0, 1, '2026-10-28 15:02:36', '', NULL),
(19, 11, 'Esp&egrave;ce', 5000.00, 0.00, 0, 1, '2026-10-28 15:10:38', '', NULL),
(20, 11, 'Espèce', 0.00, 2600.00, 0, 1, '2026-10-28 15:10:38', '', NULL),
(21, 12, 'Esp&egrave;ce', 10000.00, 0.00, 0, 1, '2026-10-28 15:39:51', '', NULL),
(22, 12, 'Espèce', 0.00, 4900.00, 0, 1, '2026-10-28 15:39:51', '', NULL),
(23, 13, 'Esp&egrave;ce', 50000.00, 0.00, 0, 1, '2026-10-28 16:04:13', '', NULL),
(24, 13, 'Espèce', 0.00, 25000.00, 0, 1, '2026-10-28 16:04:13', '', NULL),
(25, 14, 'Carte Cadeau:1', 5450.00, 0.00, 0, 1, '2026-10-29 08:30:10', '', NULL),
(26, 15, 'Espèce', 2500.00, 400.00, 0, 25, '2026-10-29 11:50:06', '', NULL),
(27, 16, 'Espèce', 500000.00, 275000.00, 0, 25, '2026-10-29 11:55:31', '', NULL),
(28, 17, 'Espèce', 70000.00, 0.00, 0, 25, '2026-10-29 11:57:41', '', NULL),
(29, 18, 'Espèce', 10000.00, 0.00, 0, 25, '2026-10-29 11:58:06', '', NULL),
(32, 21, 'Espèce', 67500.00, 0.00, 0, 25, '2026-10-29 16:44:19', '', NULL),
(33, 22, 'Espèce', 5000.00, 500.00, 0, 25, '2026-10-30 08:36:59', '', 4),
(34, 23, 'Espèce', 5000.00, 500.00, 0, 25, '2026-10-30 08:40:20', '', 4),
(35, 24, 'Espèce', 1000.00, 300.00, 0, 25, '2026-10-30 09:30:14', '', 6);

-- --------------------------------------------------------

--
-- Structure de la table `ospos_sales_payments_backup_20261029_171932`
--

DROP TABLE IF EXISTS `ospos_sales_payments_backup_20261029_171932`;
CREATE TABLE IF NOT EXISTS `ospos_sales_payments_backup_20261029_171932` (
  `payment_id` int NOT NULL DEFAULT '0',
  `sale_id` int NOT NULL,
  `payment_type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `payment_amount` decimal(15,2) NOT NULL,
  `cash_refund` decimal(15,2) NOT NULL DEFAULT '0.00',
  `cash_adjustment` tinyint NOT NULL DEFAULT '0',
  `employee_id` int DEFAULT NULL,
  `payment_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ospos_sales_payments_backup_20261029_171932`
--

INSERT INTO `ospos_sales_payments_backup_20261029_171932` (`payment_id`, `sale_id`, `payment_type`, `payment_amount`, `cash_refund`, `cash_adjustment`, `employee_id`, `payment_time`, `reference_code`) VALUES
(1, 1, 'Espèce', 3400.00, 0.00, 0, 1, '2026-10-28 12:56:16', ''),
(4, 4, 'Espèce', 5000.00, 0.00, 0, 1, '2026-10-28 13:01:22', ''),
(5, 4, 'Espèce', 0.00, 3800.00, 0, 1, '2026-10-28 13:01:22', ''),
(6, 5, 'Espèce', 1000.00, 0.00, 0, 1, '2026-10-28 14:20:12', ''),
(7, 5, 'Espèce', 0.00, 50.00, 0, 1, '2026-10-28 14:20:12', ''),
(9, 6, 'Espèce', 5000.00, 0.00, 0, 1, '2026-10-28 14:30:22', ''),
(10, 6, 'Espèce', 0.00, 4300.00, 0, 1, '2026-10-28 14:30:22', ''),
(11, 7, 'Espèce', 1000.00, 0.00, 0, 1, '2026-10-28 14:31:22', ''),
(12, 7, 'Espèce', 0.00, 150.00, 0, 1, '2026-10-28 14:31:22', ''),
(13, 8, 'Espèce', 1000.00, 0.00, 0, 1, '2026-10-28 14:45:19', ''),
(14, 8, 'Espèce', 0.00, 100.00, 0, 1, '2026-10-28 14:45:19', ''),
(15, 9, 'Espèce', 1000.00, 0.00, 0, 1, '2026-10-28 14:52:20', ''),
(16, 9, 'Espèce', 0.00, 400.00, 0, 1, '2026-10-28 14:52:20', ''),
(17, 10, 'Esp&egrave;ce', 900.00, 0.00, 0, 1, '2026-10-28 15:02:36', ''),
(18, 10, 'Espèce', 0.00, 500.00, 0, 1, '2026-10-28 15:02:36', ''),
(19, 11, 'Esp&egrave;ce', 5000.00, 0.00, 0, 1, '2026-10-28 15:10:38', ''),
(20, 11, 'Espèce', 0.00, 2600.00, 0, 1, '2026-10-28 15:10:38', ''),
(21, 12, 'Esp&egrave;ce', 10000.00, 0.00, 0, 1, '2026-10-28 15:39:51', ''),
(22, 12, 'Espèce', 0.00, 4900.00, 0, 1, '2026-10-28 15:39:51', ''),
(23, 13, 'Esp&egrave;ce', 50000.00, 0.00, 0, 1, '2026-10-28 16:04:13', ''),
(24, 13, 'Espèce', 0.00, 25000.00, 0, 1, '2026-10-28 16:04:13', ''),
(25, 14, 'Carte Cadeau:1', 5450.00, 0.00, 0, 1, '2026-10-29 08:30:10', ''),
(26, 15, 'Espèce', 2500.00, 400.00, 0, 25, '2026-10-29 11:50:06', ''),
(27, 16, 'Espèce', 500000.00, 275000.00, 0, 25, '2026-10-29 11:55:31', ''),
(28, 17, 'Espèce', 70000.00, 0.00, 0, 25, '2026-10-29 11:57:41', ''),
(29, 18, 'Espèce', 10000.00, 0.00, 0, 25, '2026-10-29 11:58:06', ''),
(32, 21, 'Espèce', 67500.00, 0.00, 0, 25, '2026-10-29 16:44:19', '');

-- --------------------------------------------------------

--
-- Structure de la table `ospos_sales_reward_points`
--

DROP TABLE IF EXISTS `ospos_sales_reward_points`;
CREATE TABLE IF NOT EXISTS `ospos_sales_reward_points` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sale_id` int NOT NULL,
  `earned` float NOT NULL,
  `used` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sale_id` (`sale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ospos_sales_taxes`
--

DROP TABLE IF EXISTS `ospos_sales_taxes`;
CREATE TABLE IF NOT EXISTS `ospos_sales_taxes` (
  `sales_taxes_id` int NOT NULL AUTO_INCREMENT,
  `sale_id` int NOT NULL,
  `jurisdiction_id` int DEFAULT NULL,
  `tax_category_id` int DEFAULT NULL,
  `tax_type` smallint NOT NULL,
  `tax_group` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `sale_tax_basis` decimal(15,4) NOT NULL,
  `sale_tax_amount` decimal(15,4) NOT NULL,
  `print_sequence` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `tax_rate` decimal(15,4) NOT NULL,
  `sales_tax_code_id` int DEFAULT NULL,
  `rounding_code` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sales_taxes_id`),
  KEY `print_sequence` (`sale_id`,`print_sequence`,`tax_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ospos_sessions`
--

DROP TABLE IF EXISTS `ospos_sessions`;
CREATE TABLE IF NOT EXISTS `ospos_sessions` (
  `id` varchar(128) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data` blob NOT NULL,
  PRIMARY KEY (`id`,`ip_address`),
  KEY `ospos_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `ospos_sessions`
--

INSERT INTO `ospos_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('ospos_session:18dbd464dc66c6cf2d89ad091bf47455', '127.0.0.1', '2026-10-30 15:44:39', 0x5f5f63695f6c6173745f726567656e65726174657c693a313739333337353037383b637372665f6f73706f735f76347c733a33323a226238653863396165306161356263633834643237636661633465336538353438223b5f63695f70726576696f75735f75726c7c733a32373a22687474703a2f2f3132372e302e302e313a383038302f6c6f67696e223b),
('ospos_session:1c6e0e3ced52abe2583da5bdbb33800d', '127.0.0.1', '2026-11-02 08:10:32', 0x5f5f63695f6c6173745f726567656e65726174657c693a313739333630373033323b637372665f6f73706f735f76347c733a33323a223239656366386534333237336266326361383230343164636331336663633434223b5f63695f70726576696f75735f75726c7c733a32363a22687474703a2f2f3132372e302e302e313a383038302f686f6d65223b706572736f6e5f69647c733a313a2231223b6d656e755f67726f75707c733a343a22686f6d65223b),
('ospos_session:28d7665ba901c1cf65714ae243b2dcf3', '127.0.0.1', '2026-10-30 16:51:43', 0x5f5f63695f6c6173745f726567656e65726174657c693a313739333337383835353b637372665f6f73706f735f76347c733a33323a223164613537323963633136333466346464646338306538333163333939376332223b5f63695f70726576696f75735f75726c7c733a32393a22687474703a2f2f3132372e302e302e313a383038302f63617368757073223b706572736f6e5f69647c733a313a2231223b6d656e755f67726f75707c733a343a22686f6d65223b),
('ospos_session:2ad4c001d29b9152af29f3264c80ec78', '::1', '2026-11-03 08:09:35', 0x5f5f63695f6c6173745f726567656e65726174657c693a313739333639333331333b637372665f6f73706f735f76347c733a33323a223463393431646232393133353235663930323937323765363738333533373162223b5f63695f70726576696f75735f75726c7c733a33313a22687474703a2f2f6c6f63616c686f73743a383038302f637573746f6d657273223b706572736f6e5f69647c733a313a2231223b6d656e755f67726f75707c733a343a22686f6d65223b616c6c6f775f74656d705f6974656d737c693a303b73616c655f69647c693a2d313b636173685f726f756e64696e677c693a303b636173685f6d6f64657c693a303b73616c65735f636172747c613a303a7b7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c693a313b73616c65735f7061796d656e74737c613a303a7b7d726563765f636172747c613a303a7b7d726563765f6d6f64657c733a373a2272656365697665223b726563765f737570706c6965727c693a2d313b6974656d5f6c6f636174696f6e7c733a313a2231223b),
('ospos_session:2e7c085fd620327b0c72e50c71d431d3', '127.0.0.1', '2026-10-30 15:44:48', 0x5f5f63695f6c6173745f726567656e65726174657c693a313739333337353038383b637372665f6f73706f735f76347c733a33323a226632663834306233366361663563373938623864323062633165353630313134223b5f63695f70726576696f75735f75726c7c733a32373a22687474703a2f2f3132372e302e302e313a383038302f6c6f67696e223b),
('ospos_session:36d39ccd227e5cd80e8c37f7c4d3b59b', '127.0.0.1', '2026-10-30 22:23:15', 0x5f5f63695f6c6173745f726567656e65726174657c693a313739333339383939343b637372665f6f73706f735f76347c733a33323a223262323263366562303732363161313164633964306464353661333636333665223b5f63695f70726576696f75735f75726c7c733a32373a22687474703a2f2f3132372e302e302e313a383038302f6c6f67696e223b),
('ospos_session:412545841971978d93c992d75f1aeb54', '172.18.0.1', '2026-10-30 16:47:03', 0x5f5f63695f6c6173745f726567656e65726174657c693a313739333337383832313b637372665f6f73706f735f76347c733a33323a223134613539633631613536633162343163353030396265363933626237373332223b5f63695f70726576696f75735f75726c7c733a32393a22687474703a2f2f3132372e302e302e313a383038312f63617368757073223b706572736f6e5f69647c733a313a2231223b6d656e755f67726f75707c733a343a22686f6d65223b),
('ospos_session:460d541a19d7f7a78948dac2b3058e2b', '127.0.0.1', '2026-10-30 16:34:38', 0x5f5f63695f6c6173745f726567656e65726174657c693a313739333337383037303b637372665f6f73706f735f76347c733a33323a223839346338663838633764373539366662613430363836366135373865626563223b5f63695f70726576696f75735f75726c7c733a32393a22687474703a2f2f3132372e302e302e313a383038302f63617368757073223b706572736f6e5f69647c733a313a2231223b6d656e755f67726f75707c733a343a22686f6d65223b),
('ospos_session:53601b97d3f1778a7715407f6d1b0986', '172.18.0.1', '2026-10-30 16:34:40', 0x5f5f63695f6c6173745f726567656e65726174657c693a313739333337373936343b637372665f6f73706f735f76347c733a33323a223437613266333261666134356566326165613030356163616631646536666532223b5f63695f70726576696f75735f75726c7c733a33313a22687474703a2f2f3132372e302e302e313a383038312f676966746361726473223b706572736f6e5f69647c733a313a2231223b6d656e755f67726f75707c733a343a22686f6d65223b616c6c6f775f74656d705f6974656d737c693a313b6974656d5f6c6f636174696f6e7c733a313a2231223b726563765f636172747c613a303a7b7d726563765f6d6f64657c733a373a2272656365697665223b726563765f737570706c6965727c693a2d313b73616c655f69647c693a2d313b636173685f726f756e64696e677c693a303b636173685f6d6f64657c693a303b73616c65735f636172747c613a303a7b7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c693a313b73616c65735f7061796d656e74737c613a303a7b7d),
('ospos_session:5f1a8cfc5c4be12a358223013b2e7a8b', '127.0.0.1', '2026-10-30 16:10:48', 0x5f5f63695f6c6173745f726567656e65726174657c693a313739333337363634383b637372665f6f73706f735f76347c733a33323a223363383433363931383435333538633534653663353235353032373030333530223b5f63695f70726576696f75735f75726c7c733a32363a22687474703a2f2f3132372e302e302e313a383038302f686f6d65223b706572736f6e5f69647c733a313a2231223b6d656e755f67726f75707c733a343a22686f6d65223b),
('ospos_session:60a869817904b8955026ce4ec4f94f81', '172.18.0.1', '2026-10-30 16:46:19', 0x5f5f63695f6c6173745f726567656e65726174657c693a313739333337383633373b637372665f6f73706f735f76347c733a33323a226534623761343066656530636362656430383239346564343666653466356536223b5f63695f70726576696f75735f75726c7c733a32393a22687474703a2f2f3132372e302e302e313a383038312f63617368757073223b706572736f6e5f69647c733a313a2231223b6d656e755f67726f75707c733a343a22686f6d65223b616c6c6f775f74656d705f6974656d737c693a313b73616c655f69647c693a2d313b636173685f726f756e64696e677c693a303b636173685f6d6f64657c693a303b73616c65735f636172747c613a303a7b7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c693a313b73616c65735f7061796d656e74737c613a303a7b7d),
('ospos_session:61424b9576ba7060c3e247d59570d7b6', '127.0.0.1', '2026-10-30 15:48:45', 0x5f5f63695f6c6173745f726567656e65726174657c693a313739333337353332353b637372665f6f73706f735f76347c733a33323a226536646432343566643862366363363437396561386233346535306233386331223b5f63695f70726576696f75735f75726c7c733a32373a22687474703a2f2f3132372e302e302e313a383038302f6c6f67696e223b),
('ospos_session:a9f246b61a03992fc87243b800048cd2', '127.0.0.1', '2026-10-30 16:35:06', 0x5f5f63695f6c6173745f726567656e65726174657c693a313739333337383130353b637372665f6f73706f735f76347c733a33323a223662363531613732303633363530363430636537366262663639623535323664223b5f63695f70726576696f75735f75726c7c733a32373a22687474703a2f2f3132372e302e302e313a383038302f6c6f67696e223b),
('ospos_session:b6277d5c4fdab82f071d7329e2754e3d', '127.0.0.1', '2026-10-30 17:39:53', 0x5f5f63695f6c6173745f726567656e65726174657c693a313739333338313937353b637372665f6f73706f735f76347c733a33323a223039306264656461326539313032396631666234336237316465306466643833223b5f63695f70726576696f75735f75726c7c733a32363a22687474703a2f2f3132372e302e302e313a383038302f686f6d65223b706572736f6e5f69647c733a313a2231223b6d656e755f67726f75707c733a343a22686f6d65223b616c6c6f775f74656d705f6974656d737c693a303b6974656d5f6c6f636174696f6e7c733a313a2231223b73616c655f69647c693a2d313b636173685f726f756e64696e677c693a303b636173685f6d6f64657c693a303b73616c65735f636172747c613a303a7b7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c693a313b73616c65735f7061796d656e74737c613a303a7b7d726563765f73746f636b5f736f757263657c693a313b),
('ospos_session:c488aac3607e584e1f5b3eedc2fc8c85', '172.18.0.1', '2026-10-30 16:41:49', 0x5f5f63695f6c6173745f726567656e65726174657c693a313739333337383433363b637372665f6f73706f735f76347c733a33323a223935396137333762326264346536663363353066636539353962656336356632223b5f63695f70726576696f75735f75726c7c733a32393a22687474703a2f2f3132372e302e302e313a383038312f63617368757073223b706572736f6e5f69647c733a313a2231223b6d656e755f67726f75707c733a363a226f6666696365223b726563765f73746f636b5f736f757263657c693a313b726563765f7072696e745f61667465725f73616c657c623a313b616c6c6f775f74656d705f6974656d737c693a313b73616c655f69647c693a2d313b636173685f726f756e64696e677c693a303b636173685f6d6f64657c693a303b73616c65735f636172747c613a303a7b7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c693a313b73616c65735f7061796d656e74737c613a303a7b7d726563765f636172747c613a303a7b7d726563765f6d6f64657c733a373a2272656365697665223b726563765f737570706c6965727c693a2d313b),
('ospos_session:d8e7ef8d1d9d2819f95484e6720da795', '172.18.0.1', '2026-10-30 17:04:20', 0x5f5f63695f6c6173745f726567656e65726174657c693a313739333337393537383b637372665f6f73706f735f76347c733a33323a223130303034623932393465306539383932383631313665653435323461646664223b5f63695f70726576696f75735f75726c7c733a32393a22687474703a2f2f3132372e302e302e313a383038312f63617368757073223b706572736f6e5f69647c733a313a2231223b6d656e755f67726f75707c733a343a22686f6d65223b),
('ospos_session:e4e87c8df42fe014ab5e1c6bfb7218b8', '127.0.0.1', '2026-10-30 16:43:47', 0x5f5f63695f6c6173745f726567656e65726174657c693a313739333337383533303b637372665f6f73706f735f76347c733a33323a226638643235303563376362343730326365303362393964643039323137373265223b5f63695f70726576696f75735f75726c7c733a32393a22687474703a2f2f3132372e302e302e313a383038302f63617368757073223b706572736f6e5f69647c733a313a2231223b6d656e755f67726f75707c733a343a22686f6d65223b616c6c6f775f74656d705f6974656d737c693a313b73616c655f69647c693a2d313b636173685f726f756e64696e677c693a303b636173685f6d6f64657c693a303b73616c65735f636172747c613a303a7b7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c693a313b73616c65735f7061796d656e74737c613a303a7b7d),
('ospos_session:eedf2254e1ffba1e0d1a4553ac4b9200', '127.0.0.1', '2026-10-30 16:46:48', 0x5f5f63695f6c6173745f726567656e65726174657c693a313739333337383738393b637372665f6f73706f735f76347c733a33323a226534653534333031653031636435333534353335353836316365343266393734223b5f63695f70726576696f75735f75726c7c733a32393a22687474703a2f2f3132372e302e302e313a383038302f63617368757073223b706572736f6e5f69647c733a313a2231223b6d656e755f67726f75707c733a343a22686f6d65223b);

-- --------------------------------------------------------

--
-- Structure de la table `ospos_stock_locations`
--

DROP TABLE IF EXISTS `ospos_stock_locations`;
CREATE TABLE IF NOT EXISTS `ospos_stock_locations` (
  `location_id` int NOT NULL AUTO_INCREMENT,
  `location_name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `ospos_stock_locations`
--

INSERT INTO `ospos_stock_locations` (`location_id`, `location_name`, `deleted`) VALUES
(1, 'stock', 0);

-- --------------------------------------------------------

--
-- Structure de la table `ospos_suppliers`
--

DROP TABLE IF EXISTS `ospos_suppliers`;
CREATE TABLE IF NOT EXISTS `ospos_suppliers` (
  `person_id` int NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `agency_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `account_number` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `tax_id` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `category` tinyint(1) NOT NULL,
  PRIMARY KEY (`person_id`),
  UNIQUE KEY `account_number` (`account_number`),
  KEY `category` (`category`),
  KEY `company_name` (`company_name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `ospos_suppliers`
--

INSERT INTO `ospos_suppliers` (`person_id`, `company_name`, `agency_name`, `account_number`, `tax_id`, `deleted`, `category`) VALUES
(2, 'Distribution Ivoire', 'Dépôt Cocody', NULL, '', 0, 0),
(3, 'Agro Ivoire', 'Dépôt Yopougon', NULL, '', 0, 0),
(4, 'Boissons CI', 'Dépôt Treichville', NULL, '', 0, 0),
(5, 'Hygiène Plus', 'Dépôt Marcory', NULL, '', 0, 0),
(6, 'Maison Propre', 'Dépôt Adjamé', NULL, '', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `ospos_tax_categories`
--

DROP TABLE IF EXISTS `ospos_tax_categories`;
CREATE TABLE IF NOT EXISTS `ospos_tax_categories` (
  `tax_category_id` int NOT NULL AUTO_INCREMENT,
  `tax_category` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `tax_group_sequence` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tax_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ospos_tax_codes`
--

DROP TABLE IF EXISTS `ospos_tax_codes`;
CREATE TABLE IF NOT EXISTS `ospos_tax_codes` (
  `tax_code_id` int NOT NULL AUTO_INCREMENT,
  `tax_code` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `tax_code_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `city` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `state` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tax_code_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ospos_tax_jurisdictions`
--

DROP TABLE IF EXISTS `ospos_tax_jurisdictions`;
CREATE TABLE IF NOT EXISTS `ospos_tax_jurisdictions` (
  `jurisdiction_id` int NOT NULL AUTO_INCREMENT,
  `jurisdiction_name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `tax_group` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `tax_type` smallint NOT NULL,
  `reporting_authority` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `tax_group_sequence` tinyint(1) NOT NULL DEFAULT '0',
  `cascade_sequence` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`jurisdiction_id`),
  UNIQUE KEY `tax_jurisdictions_uq1` (`tax_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ospos_tax_rates`
--

DROP TABLE IF EXISTS `ospos_tax_rates`;
CREATE TABLE IF NOT EXISTS `ospos_tax_rates` (
  `tax_rate_id` int NOT NULL AUTO_INCREMENT,
  `rate_tax_code_id` int NOT NULL,
  `rate_tax_category_id` int NOT NULL,
  `rate_jurisdiction_id` int NOT NULL,
  `tax_rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax_rounding_code` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tax_rate_id`),
  KEY `rate_tax_category_id` (`rate_tax_category_id`),
  KEY `rate_tax_code_id` (`rate_tax_code_id`),
  KEY `rate_jurisdiction_id` (`rate_jurisdiction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `ospos_attribute_definitions`
--
ALTER TABLE `ospos_attribute_definitions`
  ADD CONSTRAINT `fk_ospos_attribute_definitions_ibfk_1` FOREIGN KEY (`definition_fk`) REFERENCES `ospos_attribute_definitions` (`definition_id`);

--
-- Contraintes pour la table `ospos_attribute_links`
--
ALTER TABLE `ospos_attribute_links`
  ADD CONSTRAINT `ospos_attribute_links_ibfk_1` FOREIGN KEY (`definition_id`) REFERENCES `ospos_attribute_definitions` (`definition_id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `ospos_attribute_links_ibfk_2` FOREIGN KEY (`attribute_id`) REFERENCES `ospos_attribute_values` (`attribute_id`) ON DELETE RESTRICT;

--
-- Contraintes pour la table `ospos_cash_up`
--
ALTER TABLE `ospos_cash_up`
  ADD CONSTRAINT `ospos_cash_up_ibfk_1` FOREIGN KEY (`open_employee_id`) REFERENCES `ospos_employees` (`person_id`),
  ADD CONSTRAINT `ospos_cash_up_ibfk_2` FOREIGN KEY (`close_employee_id`) REFERENCES `ospos_employees` (`person_id`);

--
-- Contraintes pour la table `ospos_customers`
--
ALTER TABLE `ospos_customers`
  ADD CONSTRAINT `ospos_customers_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `ospos_customers_packages` (`package_id`),
  ADD CONSTRAINT `ospos_customers_ibfk_3` FOREIGN KEY (`sales_tax_code_id`) REFERENCES `ospos_tax_codes` (`tax_code_id`);

--
-- Contraintes pour la table `ospos_customers_points`
--
ALTER TABLE `ospos_customers_points`
  ADD CONSTRAINT `ospos_customers_points_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `ospos_customers_packages` (`package_id`);

--
-- Contraintes pour la table `ospos_expenses`
--
ALTER TABLE `ospos_expenses`
  ADD CONSTRAINT `ospos_expenses_ibfk_1` FOREIGN KEY (`expense_category_id`) REFERENCES `ospos_expense_categories` (`expense_category_id`),
  ADD CONSTRAINT `ospos_expenses_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `ospos_employees` (`person_id`),
  ADD CONSTRAINT `ospos_expenses_ibfk_3` FOREIGN KEY (`supplier_id`) REFERENCES `ospos_suppliers` (`person_id`);

--
-- Contraintes pour la table `ospos_grants`
--
ALTER TABLE `ospos_grants`
  ADD CONSTRAINT `ospos_grants_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `ospos_employees` (`person_id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `ospos_inventory`
--
ALTER TABLE `ospos_inventory`
  ADD CONSTRAINT `ospos_inventory_ibfk_2` FOREIGN KEY (`trans_user`) REFERENCES `ospos_employees` (`person_id`);

--
-- Contraintes pour la table `ospos_items`
--
ALTER TABLE `ospos_items`
  ADD CONSTRAINT `ospos_items_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `ospos_suppliers` (`person_id`);

--
-- Contraintes pour la table `ospos_receivings`
--
ALTER TABLE `ospos_receivings`
  ADD CONSTRAINT `ospos_receivings_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `ospos_employees` (`person_id`),
  ADD CONSTRAINT `ospos_receivings_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `ospos_suppliers` (`person_id`);

--
-- Contraintes pour la table `ospos_sales`
--
ALTER TABLE `ospos_sales`
  ADD CONSTRAINT `ospos_sales_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `ospos_employees` (`person_id`),
  ADD CONSTRAINT `ospos_sales_ibfk_3` FOREIGN KEY (`dinner_table_id`) REFERENCES `ospos_dinner_tables` (`dinner_table_id`);

--
-- Contraintes pour la table `ospos_sales_items_taxes`
--
ALTER TABLE `ospos_sales_items_taxes`
  ADD CONSTRAINT `ospos_sales_items_taxes_ibfk_1` FOREIGN KEY (`sale_id`,`item_id`,`line`) REFERENCES `ospos_sales_items` (`sale_id`, `item_id`, `line`);

--
-- Contraintes pour la table `ospos_sales_payments`
--
ALTER TABLE `ospos_sales_payments`
  ADD CONSTRAINT `ospos_sales_payments_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `ospos_employees` (`person_id`);

--
-- Contraintes pour la table `ospos_tax_rates`
--
ALTER TABLE `ospos_tax_rates`
  ADD CONSTRAINT `ospos_tax_rates_ibfk_1` FOREIGN KEY (`rate_tax_category_id`) REFERENCES `ospos_tax_categories` (`tax_category_id`),
  ADD CONSTRAINT `ospos_tax_rates_ibfk_2` FOREIGN KEY (`rate_tax_code_id`) REFERENCES `ospos_tax_codes` (`tax_code_id`),
  ADD CONSTRAINT `ospos_tax_rates_ibfk_3` FOREIGN KEY (`rate_jurisdiction_id`) REFERENCES `ospos_tax_jurisdictions` (`jurisdiction_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
