-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: localhost    Database: s_data
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_stats`
--

DROP TABLE IF EXISTS `account_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_stats` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `input_money` float DEFAULT NULL,
  `trader_name` varchar(128) DEFAULT NULL,
  `cash` float DEFAULT NULL,
  `value` float DEFAULT NULL,
  `all_value` float DEFAULT NULL,
  `profit` float DEFAULT NULL,
  `profit_rate` float DEFAULT NULL,
  `closing` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_stats_timestamp_index` (`timestamp`),
  KEY `account_stats_entity_id_index` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `actor_meta`
--

DROP TABLE IF EXISTS `actor_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actor_meta` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `entity_type` varchar(64) DEFAULT NULL,
  `exchange` varchar(32) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `list_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `actor_meta_timestamp_index` (`timestamp`),
  KEY `actor_meta_entity_id_index` (`entity_id`),
  KEY `actor_meta_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `balance_sheet`
--

DROP TABLE IF EXISTS `balance_sheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `balance_sheet` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `report_period` varchar(32) DEFAULT NULL,
  `report_date` datetime DEFAULT NULL,
  `cash_and_cash_equivalents` float DEFAULT NULL,
  `note_receivable` float DEFAULT NULL,
  `accounts_receivable` float DEFAULT NULL,
  `advances_to_suppliers` float DEFAULT NULL,
  `other_receivables` float DEFAULT NULL,
  `inventories` float DEFAULT NULL,
  `current_portion_of_non_current_assets` float DEFAULT NULL,
  `other_current_assets` float DEFAULT NULL,
  `total_current_assets` float DEFAULT NULL,
  `fi_assets_saleable` float DEFAULT NULL,
  `long_term_receivables` float DEFAULT NULL,
  `long_term_equity_investment` float DEFAULT NULL,
  `real_estate_investment` float DEFAULT NULL,
  `fixed_assets` float DEFAULT NULL,
  `construction_in_process` float DEFAULT NULL,
  `intangible_assets` float DEFAULT NULL,
  `goodwill` float DEFAULT NULL,
  `long_term_prepaid_expenses` float DEFAULT NULL,
  `deferred_tax_assets` float DEFAULT NULL,
  `other_non_current_assets` float DEFAULT NULL,
  `total_non_current_assets` float DEFAULT NULL,
  `total_assets` float DEFAULT NULL,
  `short_term_borrowing` float DEFAULT NULL,
  `accept_money_deposits` float DEFAULT NULL,
  `accounts_payable` float DEFAULT NULL,
  `advances_from_customers` float DEFAULT NULL,
  `employee_benefits_payable` float DEFAULT NULL,
  `taxes_payable` float DEFAULT NULL,
  `interest_payable` float DEFAULT NULL,
  `other_payable` float DEFAULT NULL,
  `current_portion_of_non_current_liabilities` float DEFAULT NULL,
  `other_current_liabilities` float DEFAULT NULL,
  `total_current_liabilities` float DEFAULT NULL,
  `long_term_borrowing` float DEFAULT NULL,
  `long_term_payable` float DEFAULT NULL,
  `deferred_revenue` float DEFAULT NULL,
  `deferred_tax_liabilities` float DEFAULT NULL,
  `other_non_current_liabilities` float DEFAULT NULL,
  `total_non_current_liabilities` float DEFAULT NULL,
  `total_liabilities` float DEFAULT NULL,
  `capital` float DEFAULT NULL,
  `capital_reserve` float DEFAULT NULL,
  `special_reserve` float DEFAULT NULL,
  `surplus_reserve` float DEFAULT NULL,
  `undistributed_profits` float DEFAULT NULL,
  `equity` float DEFAULT NULL,
  `equity_as_minority_interest` float DEFAULT NULL,
  `total_equity` float DEFAULT NULL,
  `total_liabilities_and_equity` float DEFAULT NULL,
  `fi_cash_and_deposit_in_central_bank` float DEFAULT NULL,
  `fi_deposit_in_other_fi` float DEFAULT NULL,
  `fi_expensive_metals` float DEFAULT NULL,
  `fi_lending_to_other_fi` float DEFAULT NULL,
  `fi_financial_assets_effect_current_income` float DEFAULT NULL,
  `fi_financial_derivative_asset` float DEFAULT NULL,
  `fi_buying_sell_back_fi__asset` float DEFAULT NULL,
  `fi_interest_receivable` float DEFAULT NULL,
  `fi_disbursing_loans_and_advances` float DEFAULT NULL,
  `fi_held_to_maturity_investment` float DEFAULT NULL,
  `fi_account_receivable_investment` float DEFAULT NULL,
  `fi_other_asset` float DEFAULT NULL,
  `fi_borrowings_from_central_bank` float DEFAULT NULL,
  `fi_deposit_from_other_fi` float DEFAULT NULL,
  `fi_borrowings_from_fi` float DEFAULT NULL,
  `fi_financial_liability_effect_current_income` float DEFAULT NULL,
  `fi_financial_derivative_liability` float DEFAULT NULL,
  `fi_sell_buy_back_fi_asset` float DEFAULT NULL,
  `fi_savings_absorption` float DEFAULT NULL,
  `fi_notes_payable` float DEFAULT NULL,
  `fi_estimated_liabilities` float DEFAULT NULL,
  `fi_bond_payable` float DEFAULT NULL,
  `fi_other_liability` float DEFAULT NULL,
  `fi_capital` float DEFAULT NULL,
  `fi_other_equity_instruments` float DEFAULT NULL,
  `fi_preferred_stock` float DEFAULT NULL,
  `fi_generic_risk_reserve` float DEFAULT NULL,
  `fi_client_fund` float DEFAULT NULL,
  `fi_deposit_reservation_for_balance` float DEFAULT NULL,
  `fi_client_deposit_reservation_for_balance` float DEFAULT NULL,
  `fi_margin_out_fund` float DEFAULT NULL,
  `fi_receivables` float DEFAULT NULL,
  `fi_deposit_for_recognizance` float DEFAULT NULL,
  `fi_receiving_as_agent` float DEFAULT NULL,
  `fi_short_financing_payable` float DEFAULT NULL,
  `fi_trade_risk_reserve` float DEFAULT NULL,
  `fi_premiums_receivable` float DEFAULT NULL,
  `fi_reinsurance_premium_receivable` float DEFAULT NULL,
  `fi_reinsurance_contract_reserve` float DEFAULT NULL,
  `fi_policy_pledge_loans` float DEFAULT NULL,
  `fi_time_deposit` float DEFAULT NULL,
  `fi_deposit_for_capital_recognizance` float DEFAULT NULL,
  `fi_capital_in_independent_accounts` float DEFAULT NULL,
  `fi_advance_from_customers` float DEFAULT NULL,
  `fi_advance_premium` float DEFAULT NULL,
  `fi_fees_and_commissions_payable` float DEFAULT NULL,
  `fi_dividend_payable_for_reinsurance` float DEFAULT NULL,
  `fi_claims_payable` float DEFAULT NULL,
  `fi_policy_holder_dividend_payable` float DEFAULT NULL,
  `fi_policy_holder_deposits_and_investment_funds` float DEFAULT NULL,
  `fi_contract_reserve` float DEFAULT NULL,
  `fi_independent_liability` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `balance_sheet_timestamp_index` (`timestamp`),
  KEY `balance_sheet_entity_id_index` (`entity_id`),
  KEY `balance_sheet_code_index` (`code`),
  KEY `balance_sheet_report_period_index` (`report_period`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `big_deal_trading`
--

DROP TABLE IF EXISTS `big_deal_trading`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `big_deal_trading` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `price` float DEFAULT NULL,
  `sell_broker` varchar(128) DEFAULT NULL,
  `buy_broker` varchar(128) DEFAULT NULL,
  `compare_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `big_deal_trading_timestamp_index` (`timestamp`),
  KEY `big_deal_trading_entity_id_index` (`entity_id`),
  KEY `big_deal_trading_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `block`
--

DROP TABLE IF EXISTS `block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `block` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `entity_type` varchar(64) DEFAULT NULL,
  `exchange` varchar(32) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `list_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `category` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `block_timestamp_index` (`timestamp`),
  KEY `block_entity_id_index` (`entity_id`),
  KEY `block_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `block_1d_kdata`
--

DROP TABLE IF EXISTS `block_1d_kdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `block_1d_kdata` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `block_1d_kdata_timestamp_index` (`timestamp`),
  KEY `block_1d_kdata_entity_id_index` (`entity_id`),
  KEY `block_1d_kdata_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `block_1mon_kdata`
--

DROP TABLE IF EXISTS `block_1mon_kdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `block_1mon_kdata` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `block_1mon_kdata_timestamp_index` (`timestamp`),
  KEY `block_1mon_kdata_entity_id_index` (`entity_id`),
  KEY `block_1mon_kdata_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `block_1wk_kdata`
--

DROP TABLE IF EXISTS `block_1wk_kdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `block_1wk_kdata` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `block_1wk_kdata_timestamp_index` (`timestamp`),
  KEY `block_1wk_kdata_entity_id_index` (`entity_id`),
  KEY `block_1wk_kdata_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `block_money_flow`
--

DROP TABLE IF EXISTS `block_money_flow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `block_money_flow` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `close` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  `net_inflows` float DEFAULT NULL,
  `net_inflow_rate` float DEFAULT NULL,
  `net_main_inflows` float DEFAULT NULL,
  `net_main_inflow_rate` float DEFAULT NULL,
  `net_huge_inflows` float DEFAULT NULL,
  `net_huge_inflow_rate` float DEFAULT NULL,
  `net_big_inflows` float DEFAULT NULL,
  `net_big_inflow_rate` float DEFAULT NULL,
  `net_medium_inflows` float DEFAULT NULL,
  `net_medium_inflow_rate` float DEFAULT NULL,
  `net_small_inflows` float DEFAULT NULL,
  `net_small_inflow_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `block_money_flow_timestamp_index` (`timestamp`),
  KEY `block_money_flow_entity_id_index` (`entity_id`),
  KEY `block_money_flow_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `block_sina`
--

DROP TABLE IF EXISTS `block_sina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `block_sina` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `entity_type` varchar(64) DEFAULT NULL,
  `exchange` varchar(32) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `list_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `category` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `block_sina_timestamp_index` (`timestamp`),
  KEY `block_sina_entity_id_index` (`entity_id`),
  KEY `block_sina_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `block_sina_stock`
--

DROP TABLE IF EXISTS `block_sina_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `block_sina_stock` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `entity_type` varchar(64) DEFAULT NULL,
  `exchange` varchar(32) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `stock_id` varchar(64) DEFAULT NULL,
  `stock_code` varchar(64) DEFAULT NULL,
  `stock_name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `block_sina_stock_timestamp_index` (`timestamp`),
  KEY `block_sina_stock_entity_id_index` (`entity_id`),
  KEY `block_sina_stock_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `block_stat_data`
--

DROP TABLE IF EXISTS `block_stat_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `block_stat_data` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `stock_rise_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `block_stat_data_timestamp_index` (`timestamp`),
  KEY `block_stat_data_entity_id_index` (`entity_id`),
  KEY `block_stat_data_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `block_stock`
--

DROP TABLE IF EXISTS `block_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `block_stock` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `entity_type` varchar(64) DEFAULT NULL,
  `exchange` varchar(32) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `stock_id` varchar(64) DEFAULT NULL,
  `stock_code` varchar(64) DEFAULT NULL,
  `stock_name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `block_stock_timestamp_index` (`timestamp`),
  KEY `block_stock_entity_id_index` (`entity_id`),
  KEY `block_stock_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cash_flow_statement`
--

DROP TABLE IF EXISTS `cash_flow_statement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cash_flow_statement` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `report_period` varchar(32) DEFAULT NULL,
  `report_date` datetime DEFAULT NULL,
  `cash_from_selling` float DEFAULT NULL,
  `tax_refund` float DEFAULT NULL,
  `cash_from_other_op` float DEFAULT NULL,
  `total_op_cash_inflows` float DEFAULT NULL,
  `cash_to_goods_services` float DEFAULT NULL,
  `cash_to_employees` float DEFAULT NULL,
  `taxes_and_surcharges` float DEFAULT NULL,
  `cash_to_other_related_op` float DEFAULT NULL,
  `total_op_cash_outflows` float DEFAULT NULL,
  `net_op_cash_flows` float DEFAULT NULL,
  `cash_from_disposal_of_investments` float DEFAULT NULL,
  `cash_from_returns_on_investments` float DEFAULT NULL,
  `cash_from_disposal_fixed_intangible_assets` float DEFAULT NULL,
  `cash_from_disposal_subsidiaries` float DEFAULT NULL,
  `cash_from_other_investing` float DEFAULT NULL,
  `total_investing_cash_inflows` float DEFAULT NULL,
  `cash_to_acquire_fixed_intangible_assets` float DEFAULT NULL,
  `cash_to_investments` float DEFAULT NULL,
  `cash_to_acquire_subsidiaries` float DEFAULT NULL,
  `cash_to_other_investing` float DEFAULT NULL,
  `total_investing_cash_outflows` float DEFAULT NULL,
  `net_investing_cash_flows` float DEFAULT NULL,
  `cash_from_accepting_investment` float DEFAULT NULL,
  `cash_from_subsidiaries_accepting_minority_interest` float DEFAULT NULL,
  `cash_from_borrowings` float DEFAULT NULL,
  `cash_from_issuing_bonds` float DEFAULT NULL,
  `cash_from_other_financing` float DEFAULT NULL,
  `total_financing_cash_inflows` float DEFAULT NULL,
  `cash_to_repay_borrowings` float DEFAULT NULL,
  `cash_to_pay_interest_dividend` float DEFAULT NULL,
  `cash_to_pay_subsidiaries_minority_interest` float DEFAULT NULL,
  `cash_to_other_financing` float DEFAULT NULL,
  `total_financing_cash_outflows` float DEFAULT NULL,
  `net_financing_cash_flows` float DEFAULT NULL,
  `foreign_exchange_rate_effect` float DEFAULT NULL,
  `net_cash_increase` float DEFAULT NULL,
  `cash_at_beginning` float DEFAULT NULL,
  `cash` float DEFAULT NULL,
  `fi_deposit_increase` float DEFAULT NULL,
  `fi_borrow_from_central_bank_increase` float DEFAULT NULL,
  `fi_deposit_in_others_decrease` float DEFAULT NULL,
  `fi_borrowing_and_sell_repurchase_increase` float DEFAULT NULL,
  `fi_sell_repurchase_increase` float DEFAULT NULL,
  `fi_lending_and_buy_repurchase_decrease` float DEFAULT NULL,
  `fi_buy_repurchase_decrease` float DEFAULT NULL,
  `fi_cash_from_interest_commission` float DEFAULT NULL,
  `fi_loan_advance_increase` float DEFAULT NULL,
  `fi_deposit_in_others_increase` float DEFAULT NULL,
  `fi_lending_and_buy_repurchase_increase` float DEFAULT NULL,
  `fi_lending_increase` float DEFAULT NULL,
  `fi_borrowing_and_sell_repurchase_decrease` float DEFAULT NULL,
  `fi_borrowing_decrease` float DEFAULT NULL,
  `fi_sell_repurchase_decrease` float DEFAULT NULL,
  `fi_cash_to_interest_commission` float DEFAULT NULL,
  `fi_account_receivable_increase` float DEFAULT NULL,
  `fi_cash_to_pay_interest` float DEFAULT NULL,
  `fi_cash_from_premium_of_original` float DEFAULT NULL,
  `fi_insured_deposit_increase` float DEFAULT NULL,
  `fi_bank_broker_sell_repurchase_increase` float DEFAULT NULL,
  `fi_bank_broker_buy_repurchase_decrease` float DEFAULT NULL,
  `fi_cash_to_insurance_claim` float DEFAULT NULL,
  `fi_cash_to_reinsurance` float DEFAULT NULL,
  `fi_lending_decrease` float DEFAULT NULL,
  `fi_bank_broker_sell_repurchase_decrease` float DEFAULT NULL,
  `fi_cash_to_dividends` float DEFAULT NULL,
  `fi_insured_pledge_loans_increase` float DEFAULT NULL,
  `fi_cash_to_acquire_subsidiaries` float DEFAULT NULL,
  `fi_cash_to_disposal_subsidiaries` float DEFAULT NULL,
  `fi_cash_to_sell_repurchase` float DEFAULT NULL,
  `fi_borrowing_increase` float DEFAULT NULL,
  `fi_cash_from_trading_agent` float DEFAULT NULL,
  `fi_cash_from_repurchase_increase` float DEFAULT NULL,
  `fi_disposal_trade_asset_decrease` float DEFAULT NULL,
  `fi_repurchase_decrease` float DEFAULT NULL,
  `fi_cash_to_agent_trade` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cash_flow_statement_timestamp_index` (`timestamp`),
  KEY `cash_flow_statement_entity_id_index` (`entity_id`),
  KEY `cash_flow_statement_code_index` (`code`),
  KEY `cash_flow_statement_report_period_index` (`report_period`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `entity_type` varchar(64) DEFAULT NULL,
  `exchange` varchar(32) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `list_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `region` varchar(128) DEFAULT NULL,
  `capital_city` varchar(128) DEFAULT NULL,
  `income_level` varchar(64) DEFAULT NULL,
  `lending_type` varchar(64) DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_timestamp_index` (`timestamp`),
  KEY `country_entity_id_index` (`entity_id`),
  KEY `country_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cross_market_summary`
--

DROP TABLE IF EXISTS `cross_market_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cross_market_summary` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `buy_amount` float DEFAULT NULL,
  `buy_volume` float DEFAULT NULL,
  `sell_amount` float DEFAULT NULL,
  `sell_volume` float DEFAULT NULL,
  `quota_daily` float DEFAULT NULL,
  `quota_daily_balance` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cross_market_summary_timestamp_index` (`timestamp`),
  KEY `cross_market_summary_entity_id_index` (`entity_id`),
  KEY `cross_market_summary_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `entity_type` varchar(64) DEFAULT NULL,
  `exchange` varchar(32) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `list_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `currency_timestamp_index` (`timestamp`),
  KEY `currency_entity_id_index` (`entity_id`),
  KEY `currency_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `currency_1d_kdata`
--

DROP TABLE IF EXISTS `currency_1d_kdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency_1d_kdata` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  `interest` float DEFAULT NULL,
  `settlement` float DEFAULT NULL,
  `change_pct1` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `currency_1d_kdata_timestamp_index` (`timestamp`),
  KEY `currency_1d_kdata_entity_id_index` (`entity_id`),
  KEY `currency_1d_kdata_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dividend_detail`
--

DROP TABLE IF EXISTS `dividend_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dividend_detail` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `announce_date` datetime DEFAULT NULL,
  `record_date` datetime DEFAULT NULL,
  `dividend_date` datetime DEFAULT NULL,
  `dividend` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dividend_detail_timestamp_index` (`timestamp`),
  KEY `dividend_detail_entity_id_index` (`entity_id`),
  KEY `dividend_detail_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dividend_financing`
--

DROP TABLE IF EXISTS `dividend_financing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dividend_financing` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `dividend_money` float DEFAULT NULL,
  `ipo_issues` float DEFAULT NULL,
  `ipo_raising_fund` float DEFAULT NULL,
  `spo_issues` float DEFAULT NULL,
  `spo_raising_fund` float DEFAULT NULL,
  `rights_issues` float DEFAULT NULL,
  `rights_raising_fund` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dividend_financing_timestamp_index` (`timestamp`),
  KEY `dividend_financing_entity_id_index` (`entity_id`),
  KEY `dividend_financing_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dragon_and_tiger`
--

DROP TABLE IF EXISTS `dragon_and_tiger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dragon_and_tiger` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `reason` varchar(128) DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `net_in` float DEFAULT NULL,
  `dep1` varchar(128) DEFAULT NULL,
  `dep1_in` float DEFAULT NULL,
  `dep1_out` float DEFAULT NULL,
  `dep1_rate` float DEFAULT NULL,
  `dep2` varchar(128) DEFAULT NULL,
  `dep2_in` float DEFAULT NULL,
  `dep2_out` float DEFAULT NULL,
  `dep2_rate` float DEFAULT NULL,
  `dep3` varchar(128) DEFAULT NULL,
  `dep3_in` float DEFAULT NULL,
  `dep3_out` float DEFAULT NULL,
  `dep3_rate` float DEFAULT NULL,
  `dep4` varchar(128) DEFAULT NULL,
  `dep4_in` float DEFAULT NULL,
  `dep4_out` float DEFAULT NULL,
  `dep4_rate` float DEFAULT NULL,
  `dep5` varchar(128) DEFAULT NULL,
  `dep5_in` float DEFAULT NULL,
  `dep5_out` float DEFAULT NULL,
  `dep5_rate` float DEFAULT NULL,
  `dep_1` varchar(128) DEFAULT NULL,
  `dep_1_in` float DEFAULT NULL,
  `dep_1_out` float DEFAULT NULL,
  `dep_1_rate` float DEFAULT NULL,
  `dep_2` varchar(128) DEFAULT NULL,
  `dep_2_in` float DEFAULT NULL,
  `dep_2_out` float DEFAULT NULL,
  `dep_2_rate` float DEFAULT NULL,
  `dep_3` varchar(128) DEFAULT NULL,
  `dep_3_in` float DEFAULT NULL,
  `dep_3_out` float DEFAULT NULL,
  `dep_3_rate` float DEFAULT NULL,
  `dep_4` varchar(128) DEFAULT NULL,
  `dep_4_in` float DEFAULT NULL,
  `dep_4_out` float DEFAULT NULL,
  `dep_4_rate` float DEFAULT NULL,
  `dep_5` varchar(128) DEFAULT NULL,
  `dep_5_in` float DEFAULT NULL,
  `dep_5_out` float DEFAULT NULL,
  `dep_5_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dragon_and_tiger_timestamp_index` (`timestamp`),
  KEY `dragon_and_tiger_entity_id_index` (`entity_id`),
  KEY `dragon_and_tiger_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `economy`
--

DROP TABLE IF EXISTS `economy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `economy` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `population` bigint DEFAULT NULL,
  `gdp` float DEFAULT NULL,
  `gdp_per_capita` float DEFAULT NULL,
  `gdp_per_employed` float DEFAULT NULL,
  `gdp_growth` float DEFAULT NULL,
  `agriculture_growth` float DEFAULT NULL,
  `industry_growth` float DEFAULT NULL,
  `manufacturing_growth` float DEFAULT NULL,
  `service_growth` float DEFAULT NULL,
  `consumption_growth` float DEFAULT NULL,
  `capital_growth` float DEFAULT NULL,
  `exports_growth` float DEFAULT NULL,
  `imports_growth` float DEFAULT NULL,
  `gni` float DEFAULT NULL,
  `gni_per_capita` float DEFAULT NULL,
  `gross_saving` float DEFAULT NULL,
  `cpi` float DEFAULT NULL,
  `unemployment_rate` float DEFAULT NULL,
  `fdi_of_gdp` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `economy_timestamp_index` (`timestamp`),
  KEY `economy_entity_id_index` (`entity_id`),
  KEY `economy_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emotion`
--

DROP TABLE IF EXISTS `emotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emotion` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `limit_up_count` int DEFAULT NULL,
  `limit_up_open_count` int DEFAULT NULL,
  `limit_up_success_rate` float DEFAULT NULL,
  `max_height` int DEFAULT NULL,
  `continuous_power` int DEFAULT NULL,
  `limit_down_count` int DEFAULT NULL,
  `limit_down_open_count` int DEFAULT NULL,
  `limit_down_success_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `emotion_timestamp_index` (`timestamp`),
  KEY `emotion_entity_id_index` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `etf`
--

DROP TABLE IF EXISTS `etf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etf` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `entity_type` varchar(64) DEFAULT NULL,
  `exchange` varchar(32) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `list_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `category` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `etf_timestamp_index` (`timestamp`),
  KEY `etf_entity_id_index` (`entity_id`),
  KEY `etf_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `etf_1d_kdata`
--

DROP TABLE IF EXISTS `etf_1d_kdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etf_1d_kdata` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  `cumulative_net_value` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `etf_1d_kdata_timestamp_index` (`timestamp`),
  KEY `etf_1d_kdata_entity_id_index` (`entity_id`),
  KEY `etf_1d_kdata_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `etf_stock`
--

DROP TABLE IF EXISTS `etf_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etf_stock` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `entity_type` varchar(64) DEFAULT NULL,
  `exchange` varchar(32) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `stock_id` varchar(64) DEFAULT NULL,
  `stock_code` varchar(64) DEFAULT NULL,
  `stock_name` varchar(128) DEFAULT NULL,
  `report_period` varchar(32) DEFAULT NULL,
  `report_date` datetime DEFAULT NULL,
  `proportion` float DEFAULT NULL,
  `shares` float DEFAULT NULL,
  `market_cap` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `etf_stock_timestamp_index` (`timestamp`),
  KEY `etf_stock_entity_id_index` (`entity_id`),
  KEY `etf_stock_code_index` (`code`),
  KEY `etf_stock_report_period_index` (`report_period`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `etf_valuation`
--

DROP TABLE IF EXISTS `etf_valuation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etf_valuation` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `pe` float DEFAULT NULL,
  `pe1` float DEFAULT NULL,
  `pe_ttm` float DEFAULT NULL,
  `pe_ttm1` float DEFAULT NULL,
  `pb` float DEFAULT NULL,
  `pb1` float DEFAULT NULL,
  `ps` float DEFAULT NULL,
  `ps1` float DEFAULT NULL,
  `pcf` float DEFAULT NULL,
  `pcf1` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `etf_valuation_timestamp_index` (`timestamp`),
  KEY `etf_valuation_entity_id_index` (`entity_id`),
  KEY `etf_valuation_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factor_state`
--

DROP TABLE IF EXISTS `factor_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factor_state` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `state_name` varchar(128) DEFAULT NULL,
  `state` text,
  PRIMARY KEY (`id`),
  KEY `factor_state_timestamp_index` (`timestamp`),
  KEY `factor_state_entity_id_index` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `finance_factor`
--

DROP TABLE IF EXISTS `finance_factor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `finance_factor` (
  `id` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `entity_id` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `report_period` varchar(32) DEFAULT NULL,
  `report_date` datetime DEFAULT NULL,
  `basic_eps` float DEFAULT NULL,
  `basic_eps_yoy` float DEFAULT NULL,
  `deducted_eps` float DEFAULT NULL,
  `diluted_eps` float DEFAULT NULL,
  `bps` float DEFAULT NULL,
  `capital_reserve_ps` float DEFAULT NULL,
  `undistributed_profit_ps` float DEFAULT NULL,
  `op_cash_flow_ps` float DEFAULT NULL,
  `total_op_income` float DEFAULT NULL,
  `gross_profit` float DEFAULT NULL,
  `net_profit` float DEFAULT NULL,
  `deducted_net_profit` float DEFAULT NULL,
  `op_income_growth_yoy` float DEFAULT NULL,
  `net_profit_growth_yoy` float DEFAULT NULL,
  `deducted_net_profit_growth_yoy` float DEFAULT NULL,
  `op_income_growth_qoq` float DEFAULT NULL,
  `net_profit_growth_qoq` float DEFAULT NULL,
  `deducted_net_profit_growth_qoq` float DEFAULT NULL,
  `roe` float DEFAULT NULL,
  `deducted_roe` float DEFAULT NULL,
  `rota` float DEFAULT NULL,
  `gross_profit_margin` float DEFAULT NULL,
  `net_margin` float DEFAULT NULL,
  `advance_receipts_per_op_income` float DEFAULT NULL,
  `sales_net_cash_flow_per_op_income` float DEFAULT NULL,
  `op_net_cash_flow_per_op_income` float DEFAULT NULL,
  `actual_tax_rate` float DEFAULT NULL,
  `current_ratio` float DEFAULT NULL,
  `quick_ratio` float DEFAULT NULL,
  `cash_flow_ratio` float DEFAULT NULL,
  `debt_asset_ratio` float DEFAULT NULL,
  `em` float DEFAULT NULL,
  `equity_ratio` float DEFAULT NULL,
  `total_assets_turnover_days` int DEFAULT NULL,
  `inventory_turnover_days` int DEFAULT NULL,
  `receivables_turnover_days` int DEFAULT NULL,
  `total_assets_turnover` float DEFAULT NULL,
  `inventory_turnover` float DEFAULT NULL,
  `receivables_turnover` float DEFAULT NULL,
  `fi_total_deposit` float DEFAULT NULL,
  `fi_total_loan` float DEFAULT NULL,
  `fi_loan_deposit_ratio` float DEFAULT NULL,
  `fi_capital_adequacy_ratio` float DEFAULT NULL,
  `fi_core_capital_adequacy_ratio` float DEFAULT NULL,
  `fi_npl_ratio` float DEFAULT NULL,
  `fi_npl_provision_coverage` float DEFAULT NULL,
  `fi_net_capital` float DEFAULT NULL,
  `insurance_roi` float DEFAULT NULL,
  `insurance_net_investment_yield` float DEFAULT NULL,
  `insurance_earned_premium` float DEFAULT NULL,
  `insurance_payout` float DEFAULT NULL,
  `insurance_surrender_rate` float DEFAULT NULL,
  `insurance_solvency_adequacy_ratio` float DEFAULT NULL,
  `broker_net_capital` float DEFAULT NULL,
  `broker_net_assets` float DEFAULT NULL,
  `broker_net_capital_assets_ratio` float DEFAULT NULL,
  `broker_self_operated_fixed_income_securities_net_capital_ratio` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `finance_factor_timestamp_index` (`timestamp`),
  KEY `finance_factor_entity_id_index` (`entity_id`),
  KEY `finance_factor_code_index` (`code`),
  KEY `finance_factor_report_period_index` (`report_period`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fund`
--

DROP TABLE IF EXISTS `fund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fund` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `entity_type` varchar(64) DEFAULT NULL,
  `exchange` varchar(32) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `list_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `advisor` varchar(100) DEFAULT NULL,
  `trustee` varchar(100) DEFAULT NULL,
  `operate_mode_id` int DEFAULT NULL,
  `operate_mode` varchar(32) DEFAULT NULL,
  `underlying_asset_type_id` int DEFAULT NULL,
  `underlying_asset_type` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fund_timestamp_index` (`timestamp`),
  KEY `fund_entity_id_index` (`entity_id`),
  KEY `fund_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fund_stock`
--

DROP TABLE IF EXISTS `fund_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fund_stock` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `entity_type` varchar(64) DEFAULT NULL,
  `exchange` varchar(32) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `stock_id` varchar(64) DEFAULT NULL,
  `stock_code` varchar(64) DEFAULT NULL,
  `stock_name` varchar(128) DEFAULT NULL,
  `report_period` varchar(32) DEFAULT NULL,
  `report_date` datetime DEFAULT NULL,
  `proportion` float DEFAULT NULL,
  `shares` float DEFAULT NULL,
  `market_cap` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fund_stock_timestamp_index` (`timestamp`),
  KEY `fund_stock_entity_id_index` (`entity_id`),
  KEY `fund_stock_code_index` (`code`),
  KEY `fund_stock_report_period_index` (`report_period`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `future`
--

DROP TABLE IF EXISTS `future`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `future` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `entity_type` varchar(64) DEFAULT NULL,
  `exchange` varchar(32) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `list_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `future_timestamp_index` (`timestamp`),
  KEY `future_entity_id_index` (`entity_id`),
  KEY `future_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `future_1d_kdata`
--

DROP TABLE IF EXISTS `future_1d_kdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `future_1d_kdata` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  `interest` float DEFAULT NULL,
  `settlement` float DEFAULT NULL,
  `change_pct1` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `future_1d_kdata_timestamp_index` (`timestamp`),
  KEY `future_1d_kdata_entity_id_index` (`entity_id`),
  KEY `future_1d_kdata_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hk_holder`
--

DROP TABLE IF EXISTS `hk_holder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hk_holder` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `holder_code` varchar(32) DEFAULT NULL,
  `holder_name` varchar(32) DEFAULT NULL,
  `share_number` float DEFAULT NULL,
  `share_ratio` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hk_holder_timestamp_index` (`timestamp`),
  KEY `hk_holder_entity_id_index` (`entity_id`),
  KEY `hk_holder_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `holder_trading`
--

DROP TABLE IF EXISTS `holder_trading`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `holder_trading` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `holder_name` varchar(32) DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `holding_pct` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `holder_trading_timestamp_index` (`timestamp`),
  KEY `holder_trading_entity_id_index` (`entity_id`),
  KEY `holder_trading_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `income_statement`
--

DROP TABLE IF EXISTS `income_statement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `income_statement` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `report_period` varchar(32) DEFAULT NULL,
  `report_date` datetime DEFAULT NULL,
  `operating_income` float DEFAULT NULL,
  `total_operating_costs` float DEFAULT NULL,
  `operating_costs` float DEFAULT NULL,
  `rd_costs` float DEFAULT NULL,
  `net_change_in_insurance_contract_reserves` float DEFAULT NULL,
  `business_taxes_and_surcharges` float DEFAULT NULL,
  `sales_costs` float DEFAULT NULL,
  `managing_costs` float DEFAULT NULL,
  `financing_costs` float DEFAULT NULL,
  `assets_devaluation` float DEFAULT NULL,
  `investment_income` float DEFAULT NULL,
  `investment_income_from_related_enterprise` float DEFAULT NULL,
  `operating_profit` float DEFAULT NULL,
  `non_operating_income` float DEFAULT NULL,
  `non_operating_costs` float DEFAULT NULL,
  `loss_on_disposal_non_current_asset` float DEFAULT NULL,
  `total_profits` float DEFAULT NULL,
  `tax_expense` float DEFAULT NULL,
  `net_profit` float DEFAULT NULL,
  `net_profit_as_parent` float DEFAULT NULL,
  `net_profit_as_minority_interest` float DEFAULT NULL,
  `deducted_net_profit` float DEFAULT NULL,
  `eps` float DEFAULT NULL,
  `diluted_eps` float DEFAULT NULL,
  `other_comprehensive_income` float DEFAULT NULL,
  `other_comprehensive_income_as_parent` float DEFAULT NULL,
  `other_comprehensive_income_as_minority_interest` float DEFAULT NULL,
  `total_comprehensive_income` float DEFAULT NULL,
  `total_comprehensive_income_as_parent` float DEFAULT NULL,
  `total_comprehensive_income_as_minority_interest` float DEFAULT NULL,
  `fi_net_interest_income` float DEFAULT NULL,
  `fi_interest_income` float DEFAULT NULL,
  `fi_interest_expenses` float DEFAULT NULL,
  `fi_net_incomes_from_fees_and_commissions` float DEFAULT NULL,
  `fi_incomes_from_fees_and_commissions` float DEFAULT NULL,
  `fi_expenses_for_fees_and_commissions` float DEFAULT NULL,
  `fi_income_from_fair_value_change` float DEFAULT NULL,
  `fi_income_from_exchange` float DEFAULT NULL,
  `fi_other_income` float DEFAULT NULL,
  `fi_operate_and_manage_expenses` float DEFAULT NULL,
  `fi_net_income_from_premium` float DEFAULT NULL,
  `fi_income_from_premium` float DEFAULT NULL,
  `fi_income_from_reinsurance_premium` float DEFAULT NULL,
  `fi_reinsurance_premium` float DEFAULT NULL,
  `fi_undue_duty_reserve` float DEFAULT NULL,
  `fi_net_income_from_bank_interest` float DEFAULT NULL,
  `fi_income_from_bank_interest` float DEFAULT NULL,
  `fi_expenses_for_bank_interest` float DEFAULT NULL,
  `fi_net_incomes_from_fees_and_commissions_of_non_insurance` float DEFAULT NULL,
  `fi_incomes_from_fees_and_commissions_of_non_insurance` float DEFAULT NULL,
  `fi_expenses_for_fees_and_commissions_of_non_insurance` float DEFAULT NULL,
  `fi_insurance_surrender_costs` float DEFAULT NULL,
  `fi_insurance_claims_expenses` float DEFAULT NULL,
  `fi_amortized_insurance_claims_expenses` float DEFAULT NULL,
  `fi_insurance_duty_reserve` float DEFAULT NULL,
  `fi_amortized_insurance_duty_reserve` float DEFAULT NULL,
  `fi_dividend_expenses_to_insured` float DEFAULT NULL,
  `fi_reinsurance_expenses` float DEFAULT NULL,
  `fi_amortized_reinsurance_expenses` float DEFAULT NULL,
  `fi_other_op_expenses` float DEFAULT NULL,
  `fi_net_incomes_from_trading_agent` float DEFAULT NULL,
  `fi_net_incomes_from_underwriting` float DEFAULT NULL,
  `fi_net_incomes_from_customer_asset_management` float DEFAULT NULL,
  `fi_fees_from_other` float DEFAULT NULL,
  `fi_income_from_fair_value_change_of_fi_salable` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `income_statement_timestamp_index` (`timestamp`),
  KEY `income_statement_entity_id_index` (`entity_id`),
  KEY `income_statement_code_index` (`code`),
  KEY `income_statement_report_period_index` (`report_period`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `index`
--

DROP TABLE IF EXISTS `index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `index` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `entity_type` varchar(64) DEFAULT NULL,
  `exchange` varchar(32) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `list_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `publisher` varchar(64) DEFAULT NULL,
  `category` varchar(64) DEFAULT NULL,
  `base_point` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_timestamp_index` (`timestamp`),
  KEY `index_entity_id_index` (`entity_id`),
  KEY `index_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `index_1d_kdata`
--

DROP TABLE IF EXISTS `index_1d_kdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `index_1d_kdata` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_1d_kdata_timestamp_index` (`timestamp`),
  KEY `index_1d_kdata_entity_id_index` (`entity_id`),
  KEY `index_1d_kdata_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `index_1wk_kdata`
--

DROP TABLE IF EXISTS `index_1wk_kdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `index_1wk_kdata` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_1wk_kdata_timestamp_index` (`timestamp`),
  KEY `index_1wk_kdata_entity_id_index` (`entity_id`),
  KEY `index_1wk_kdata_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `index_money_flow`
--

DROP TABLE IF EXISTS `index_money_flow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `index_money_flow` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `net_inflows` float DEFAULT NULL,
  `net_inflow_rate` float DEFAULT NULL,
  `net_main_inflows` float DEFAULT NULL,
  `net_main_inflow_rate` float DEFAULT NULL,
  `net_huge_inflows` float DEFAULT NULL,
  `net_huge_inflow_rate` float DEFAULT NULL,
  `net_big_inflows` float DEFAULT NULL,
  `net_big_inflow_rate` float DEFAULT NULL,
  `net_medium_inflows` float DEFAULT NULL,
  `net_medium_inflow_rate` float DEFAULT NULL,
  `net_small_inflows` float DEFAULT NULL,
  `net_small_inflow_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_money_flow_timestamp_index` (`timestamp`),
  KEY `index_money_flow_entity_id_index` (`entity_id`),
  KEY `index_money_flow_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `index_stock`
--

DROP TABLE IF EXISTS `index_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `index_stock` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `entity_type` varchar(64) DEFAULT NULL,
  `exchange` varchar(32) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `stock_id` varchar(64) DEFAULT NULL,
  `stock_code` varchar(64) DEFAULT NULL,
  `stock_name` varchar(128) DEFAULT NULL,
  `report_period` varchar(32) DEFAULT NULL,
  `report_date` datetime DEFAULT NULL,
  `proportion` float DEFAULT NULL,
  `shares` float DEFAULT NULL,
  `market_cap` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_stock_timestamp_index` (`timestamp`),
  KEY `index_stock_entity_id_index` (`entity_id`),
  KEY `index_stock_code_index` (`code`),
  KEY `index_stock_report_period_index` (`report_period`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `indexus_1d_kdata`
--

DROP TABLE IF EXISTS `indexus_1d_kdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `indexus_1d_kdata` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `indexus_1d_kdata_timestamp_index` (`timestamp`),
  KEY `indexus_1d_kdata_entity_id_index` (`entity_id`),
  KEY `indexus_1d_kdata_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `institutional_investor_holder`
--

DROP TABLE IF EXISTS `institutional_investor_holder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institutional_investor_holder` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `report_period` varchar(32) DEFAULT NULL,
  `report_date` datetime DEFAULT NULL,
  `institutional_investor_type` varchar(64) DEFAULT NULL,
  `holder_code` varchar(32) DEFAULT NULL,
  `holder_name` varchar(32) DEFAULT NULL,
  `shareholding_numbers` float DEFAULT NULL,
  `shareholding_ratio` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `institutional_investor_holder_timestamp_index` (`timestamp`),
  KEY `institutional_investor_holder_entity_id_index` (`entity_id`),
  KEY `institutional_investor_holder_code_index` (`code`),
  KEY `institutional_investor_holder_report_period_index` (`report_period`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `limit_down_info`
--

DROP TABLE IF EXISTS `limit_down_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `limit_down_info` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `is_new` tinyint(1) DEFAULT NULL,
  `is_again_limit` tinyint(1) DEFAULT NULL,
  `currency_value` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `limit_down_info_timestamp_index` (`timestamp`),
  KEY `limit_down_info_entity_id_index` (`entity_id`),
  KEY `limit_down_info_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `limit_up_info`
--

DROP TABLE IF EXISTS `limit_up_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `limit_up_info` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `is_new` tinyint(1) DEFAULT NULL,
  `is_again_limit` tinyint(1) DEFAULT NULL,
  `open_count` int DEFAULT NULL,
  `first_limit_up_time` datetime DEFAULT NULL,
  `last_limit_up_time` datetime DEFAULT NULL,
  `limit_up_type` varchar(64) DEFAULT NULL,
  `order_amount` varchar(64) DEFAULT NULL,
  `success_rate` float DEFAULT NULL,
  `currency_value` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  `reason` varchar(512) DEFAULT NULL,
  `high_days` varchar(64) DEFAULT NULL,
  `high_days_count` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `limit_up_info_timestamp_index` (`timestamp`),
  KEY `limit_up_info_entity_id_index` (`entity_id`),
  KEY `limit_up_info_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `manager_trading`
--

DROP TABLE IF EXISTS `manager_trading`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager_trading` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `trading_person` varchar(32) DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `price` float DEFAULT NULL,
  `holding` float DEFAULT NULL,
  `trading_way` varchar(32) DEFAULT NULL,
  `manager` varchar(32) DEFAULT NULL,
  `manager_position` varchar(32) DEFAULT NULL,
  `relationship_with_manager` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `manager_trading_timestamp_index` (`timestamp`),
  KEY `manager_trading_entity_id_index` (`entity_id`),
  KEY `manager_trading_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `margin_trading`
--

DROP TABLE IF EXISTS `margin_trading`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `margin_trading` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `fin_value` float DEFAULT NULL,
  `fin_buy_value` float DEFAULT NULL,
  `fin_refund_value` float DEFAULT NULL,
  `sec_value` float DEFAULT NULL,
  `sec_sell_value` float DEFAULT NULL,
  `sec_refund_value` float DEFAULT NULL,
  `fin_sec_value` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `margin_trading_timestamp_index` (`timestamp`),
  KEY `margin_trading_entity_id_index` (`entity_id`),
  KEY `margin_trading_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `margin_trading_summary`
--

DROP TABLE IF EXISTS `margin_trading_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `margin_trading_summary` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `margin_value` float DEFAULT NULL,
  `margin_buy` float DEFAULT NULL,
  `short_value` float DEFAULT NULL,
  `short_volume` float DEFAULT NULL,
  `total_value` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `margin_trading_summary_timestamp_index` (`timestamp`),
  KEY `margin_trading_summary_entity_id_index` (`entity_id`),
  KEY `margin_trading_summary_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `trader_name` varchar(128) DEFAULT NULL,
  `order_price` float DEFAULT NULL,
  `order_amount` float DEFAULT NULL,
  `order_type` varchar(64) DEFAULT NULL,
  `status` varchar(64) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_timestamp_index` (`timestamp`),
  KEY `order_entity_id_index` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `position` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `trader_name` varchar(128) DEFAULT NULL,
  `account_stats_id` varchar(64) DEFAULT NULL,
  `long_amount` float DEFAULT NULL,
  `available_long` float DEFAULT NULL,
  `average_long_price` float DEFAULT NULL,
  `short_amount` float DEFAULT NULL,
  `available_short` float DEFAULT NULL,
  `average_short_price` float DEFAULT NULL,
  `profit` float DEFAULT NULL,
  `profit_rate` float DEFAULT NULL,
  `value` float DEFAULT NULL,
  `trading_t` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_stats_id` (`account_stats_id`),
  KEY `position_timestamp_index` (`timestamp`),
  KEY `position_entity_id_index` (`entity_id`),
  CONSTRAINT `position_ibfk_1` FOREIGN KEY (`account_stats_id`) REFERENCES `account_stats` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recoder_state`
--

DROP TABLE IF EXISTS `recoder_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recoder_state` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `state_name` varchar(128) DEFAULT NULL,
  `state` text,
  PRIMARY KEY (`id`),
  KEY `recoder_state_timestamp_index` (`timestamp`),
  KEY `recoder_state_entity_id_index` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rights_issue_detail`
--

DROP TABLE IF EXISTS `rights_issue_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rights_issue_detail` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `rights_issues` float DEFAULT NULL,
  `rights_issue_price` float DEFAULT NULL,
  `rights_raising_fund` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rights_issue_detail_timestamp_index` (`timestamp`),
  KEY `rights_issue_detail_entity_id_index` (`entity_id`),
  KEY `rights_issue_detail_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spo_detail`
--

DROP TABLE IF EXISTS `spo_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spo_detail` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `spo_issues` float DEFAULT NULL,
  `spo_price` float DEFAULT NULL,
  `spo_raising_fund` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `spo_detail_timestamp_index` (`timestamp`),
  KEY `spo_detail_entity_id_index` (`entity_id`),
  KEY `spo_detail_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `entity_type` varchar(64) DEFAULT NULL,
  `exchange` varchar(32) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `list_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_timestamp_index` (`timestamp`),
  KEY `stock_entity_id_index` (`entity_id`),
  KEY `stock_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Stock1dMaFactor`
--

DROP TABLE IF EXISTS `Stock1dMaFactor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Stock1dMaFactor` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `ma5` float DEFAULT NULL,
  `ma10` float DEFAULT NULL,
  `ma34` float DEFAULT NULL,
  `ma55` float DEFAULT NULL,
  `ma89` float DEFAULT NULL,
  `ma144` float DEFAULT NULL,
  `ma120` float DEFAULT NULL,
  `ma250` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Stock1dMaFactor_timestamp_index` (`timestamp`),
  KEY `Stock1dMaFactor_entity_id_index` (`entity_id`),
  KEY `Stock1dMaFactor_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stock_15m_hfq_kdata`
--

DROP TABLE IF EXISTS `stock_15m_hfq_kdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_15m_hfq_kdata` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_15m_hfq_kdata_timestamp_index` (`timestamp`),
  KEY `stock_15m_hfq_kdata_entity_id_index` (`entity_id`),
  KEY `stock_15m_hfq_kdata_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stock_15m_kdata`
--

DROP TABLE IF EXISTS `stock_15m_kdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_15m_kdata` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_15m_kdata_timestamp_index` (`timestamp`),
  KEY `stock_15m_kdata_entity_id_index` (`entity_id`),
  KEY `stock_15m_kdata_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stock_1d_hfq_kdata`
--

DROP TABLE IF EXISTS `stock_1d_hfq_kdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_1d_hfq_kdata` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_1d_hfq_kdata_timestamp_index` (`timestamp`),
  KEY `stock_1d_hfq_kdata_entity_id_index` (`entity_id`),
  KEY `stock_1d_hfq_kdata_code_index` (`code`),
  KEY `entity_id_level_timestamp_idx` (`entity_id`,`level`,`timestamp`) USING BTREE,
  KEY `entity_id_timestamp_idx` (`entity_id`,`timestamp`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stock_1d_kdata`
--

DROP TABLE IF EXISTS `stock_1d_kdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_1d_kdata` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_1d_kdata_timestamp_index` (`timestamp`),
  KEY `stock_1d_kdata_code_index` (`code`),
  KEY `stock_1d_kdata_entity_id_ts_IDX` (`entity_id`,`timestamp`) USING BTREE,
  KEY `stock_1d_kdata_entity_id_index` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stock_1d_ma_stats_factor`
--

DROP TABLE IF EXISTS `stock_1d_ma_stats_factor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_1d_ma_stats_factor` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `ma5` float DEFAULT NULL,
  `ma10` float DEFAULT NULL,
  `ma34` float DEFAULT NULL,
  `ma55` float DEFAULT NULL,
  `ma89` float DEFAULT NULL,
  `ma144` float DEFAULT NULL,
  `ma120` float DEFAULT NULL,
  `ma250` float DEFAULT NULL,
  `vol_ma30` float DEFAULT NULL,
  `live` int DEFAULT NULL,
  `count` int DEFAULT NULL,
  `distance` float DEFAULT NULL,
  `area` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_1d_ma_stats_factor_timestamp_index` (`timestamp`),
  KEY `stock_1d_ma_stats_factor_entity_id_index` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stock_1d_z_factor`
--

DROP TABLE IF EXISTS `stock_1d_z_factor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_1d_z_factor` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `bi_di` tinyint(1) DEFAULT NULL,
  `bi_ding` tinyint(1) DEFAULT NULL,
  `bi_value` float DEFAULT NULL,
  `bi_change` float DEFAULT NULL,
  `bi_slope` float DEFAULT NULL,
  `bi_interval` int DEFAULT NULL,
  `tmp_ding` tinyint(1) DEFAULT NULL,
  `tmp_di` tinyint(1) DEFAULT NULL,
  `fenxing_power` float DEFAULT NULL,
  `current_direction` varchar(16) DEFAULT NULL,
  `current_change` float DEFAULT NULL,
  `current_interval` int DEFAULT NULL,
  `current_slope` float DEFAULT NULL,
  `current_zhongshu_y0` float DEFAULT NULL,
  `current_zhongshu_y1` float DEFAULT NULL,
  `current_zhongshu_change` float DEFAULT NULL,
  `tmp_direction` varchar(16) DEFAULT NULL,
  `opposite_change` float DEFAULT NULL,
  `opposite_slope` float DEFAULT NULL,
  `opposite_interval` int DEFAULT NULL,
  `duan_state` varchar(32) DEFAULT NULL,
  `duan_di` tinyint(1) DEFAULT NULL,
  `duan_ding` tinyint(1) DEFAULT NULL,
  `duan_value` float DEFAULT NULL,
  `duan_change` float DEFAULT NULL,
  `duan_slope` float DEFAULT NULL,
  `duan_interval` int DEFAULT NULL,
  `zhongshu` varchar(512) DEFAULT NULL,
  `zhongshu_change` float DEFAULT NULL,
  `bi_zhongshu` varchar(512) DEFAULT NULL,
  `bi_zhongshu_change` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_1d_z_factor_timestamp_index` (`timestamp`),
  KEY `stock_1d_z_factor_entity_id_index` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stock_1h_hfq_kdata`
--

DROP TABLE IF EXISTS `stock_1h_hfq_kdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_1h_hfq_kdata` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_1h_hfq_kdata_timestamp_index` (`timestamp`),
  KEY `stock_1h_hfq_kdata_entity_id_index` (`entity_id`),
  KEY `stock_1h_hfq_kdata_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stock_1h_kdata`
--

DROP TABLE IF EXISTS `stock_1h_kdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_1h_kdata` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_1h_kdata_timestamp_index` (`timestamp`),
  KEY `stock_1h_kdata_entity_id_index` (`entity_id`),
  KEY `stock_1h_kdata_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stock_1m_hfq_kdata`
--

DROP TABLE IF EXISTS `stock_1m_hfq_kdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_1m_hfq_kdata` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_1m_hfq_kdata_timestamp_index` (`timestamp`),
  KEY `stock_1m_hfq_kdata_entity_id_index` (`entity_id`),
  KEY `stock_1m_hfq_kdata_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stock_1m_kdata`
--

DROP TABLE IF EXISTS `stock_1m_kdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_1m_kdata` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_1m_kdata_timestamp_index` (`timestamp`),
  KEY `stock_1m_kdata_entity_id_index` (`entity_id`),
  KEY `stock_1m_kdata_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stock_1mon_hfq_kdata`
--

DROP TABLE IF EXISTS `stock_1mon_hfq_kdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_1mon_hfq_kdata` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_1mon_hfq_kdata_timestamp_index` (`timestamp`),
  KEY `stock_1mon_hfq_kdata_entity_id_index` (`entity_id`),
  KEY `stock_1mon_hfq_kdata_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stock_1mon_kdata`
--

DROP TABLE IF EXISTS `stock_1mon_kdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_1mon_kdata` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_1mon_kdata_timestamp_index` (`timestamp`),
  KEY `stock_1mon_kdata_entity_id_index` (`entity_id`),
  KEY `stock_1mon_kdata_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stock_1wk_hfq_kdata`
--

DROP TABLE IF EXISTS `stock_1wk_hfq_kdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_1wk_hfq_kdata` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_1wk_hfq_kdata_timestamp_index` (`timestamp`),
  KEY `stock_1wk_hfq_kdata_entity_id_index` (`entity_id`),
  KEY `stock_1wk_hfq_kdata_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stock_1wk_kdata`
--

DROP TABLE IF EXISTS `stock_1wk_kdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_1wk_kdata` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_1wk_kdata_timestamp_index` (`timestamp`),
  KEY `stock_1wk_kdata_entity_id_index` (`entity_id`),
  KEY `stock_1wk_kdata_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stock_1wk_z_factor`
--

DROP TABLE IF EXISTS `stock_1wk_z_factor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_1wk_z_factor` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `bi_di` tinyint(1) DEFAULT NULL,
  `bi_ding` tinyint(1) DEFAULT NULL,
  `bi_value` float DEFAULT NULL,
  `bi_change` float DEFAULT NULL,
  `bi_slope` float DEFAULT NULL,
  `bi_interval` int DEFAULT NULL,
  `tmp_ding` tinyint(1) DEFAULT NULL,
  `tmp_di` tinyint(1) DEFAULT NULL,
  `fenxing_power` float DEFAULT NULL,
  `current_direction` varchar(16) DEFAULT NULL,
  `current_change` float DEFAULT NULL,
  `current_interval` int DEFAULT NULL,
  `current_slope` float DEFAULT NULL,
  `current_zhongshu_y0` float DEFAULT NULL,
  `current_zhongshu_y1` float DEFAULT NULL,
  `current_zhongshu_change` float DEFAULT NULL,
  `tmp_direction` varchar(16) DEFAULT NULL,
  `opposite_change` float DEFAULT NULL,
  `opposite_slope` float DEFAULT NULL,
  `opposite_interval` int DEFAULT NULL,
  `duan_state` varchar(32) DEFAULT NULL,
  `duan_di` tinyint(1) DEFAULT NULL,
  `duan_ding` tinyint(1) DEFAULT NULL,
  `duan_value` float DEFAULT NULL,
  `duan_change` float DEFAULT NULL,
  `duan_slope` float DEFAULT NULL,
  `duan_interval` int DEFAULT NULL,
  `zhongshu` varchar(512) DEFAULT NULL,
  `zhongshu_change` float DEFAULT NULL,
  `bi_zhongshu` varchar(512) DEFAULT NULL,
  `bi_zhongshu_change` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_1wk_z_factor_timestamp_index` (`timestamp`),
  KEY `stock_1wk_z_factor_entity_id_index` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stock_30m_hfq_kdata`
--

DROP TABLE IF EXISTS `stock_30m_hfq_kdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_30m_hfq_kdata` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_30m_hfq_kdata_timestamp_index` (`timestamp`),
  KEY `stock_30m_hfq_kdata_entity_id_index` (`entity_id`),
  KEY `stock_30m_hfq_kdata_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stock_30m_kdata`
--

DROP TABLE IF EXISTS `stock_30m_kdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_30m_kdata` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_30m_kdata_timestamp_index` (`timestamp`),
  KEY `stock_30m_kdata_entity_id_index` (`entity_id`),
  KEY `stock_30m_kdata_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stock_4h_hfq_kdata`
--

DROP TABLE IF EXISTS `stock_4h_hfq_kdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_4h_hfq_kdata` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_4h_hfq_kdata_timestamp_index` (`timestamp`),
  KEY `stock_4h_hfq_kdata_entity_id_index` (`entity_id`),
  KEY `stock_4h_hfq_kdata_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stock_4h_kdata`
--

DROP TABLE IF EXISTS `stock_4h_kdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_4h_kdata` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_4h_kdata_timestamp_index` (`timestamp`),
  KEY `stock_4h_kdata_entity_id_index` (`entity_id`),
  KEY `stock_4h_kdata_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stock_5m_hfq_kdata`
--

DROP TABLE IF EXISTS `stock_5m_hfq_kdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_5m_hfq_kdata` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_5m_hfq_kdata_timestamp_index` (`timestamp`),
  KEY `stock_5m_hfq_kdata_entity_id_index` (`entity_id`),
  KEY `stock_5m_hfq_kdata_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stock_5m_kdata`
--

DROP TABLE IF EXISTS `stock_5m_kdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_5m_kdata` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_5m_kdata_timestamp_index` (`timestamp`),
  KEY `stock_5m_kdata_entity_id_index` (`entity_id`),
  KEY `stock_5m_kdata_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stock_actor_summary`
--

DROP TABLE IF EXISTS `stock_actor_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_actor_summary` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `actor_id` varchar(64) DEFAULT NULL,
  `actor_code` varchar(64) DEFAULT NULL,
  `actor_name` varchar(128) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `report_period` varchar(32) DEFAULT NULL,
  `report_date` datetime DEFAULT NULL,
  `change_ratio` float DEFAULT NULL,
  `is_complete` tinyint(1) DEFAULT NULL,
  `actor_type` varchar(64) DEFAULT NULL,
  `actor_count` int DEFAULT NULL,
  `holding_numbers` float DEFAULT NULL,
  `holding_ratio` float DEFAULT NULL,
  `holding_values` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_actor_summary_timestamp_index` (`timestamp`),
  KEY `stock_actor_summary_entity_id_index` (`entity_id`),
  KEY `stock_actor_summary_code_index` (`code`),
  KEY `stock_actor_summary_report_period_index` (`report_period`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stock_detail`
--

DROP TABLE IF EXISTS `stock_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_detail` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `entity_type` varchar(64) DEFAULT NULL,
  `exchange` varchar(32) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `list_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `industries` varchar(64) DEFAULT NULL,
  `industry_indices` varchar(64) DEFAULT NULL,
  `concept_indices` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `area_indices` varchar(64) DEFAULT NULL,
  `date_of_establishment` datetime DEFAULT NULL,
  `profile` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `main_business` varchar(512) DEFAULT NULL,
  `issues` bigint DEFAULT NULL,
  `price` float DEFAULT NULL,
  `raising_fund` float DEFAULT NULL,
  `issue_pe` float DEFAULT NULL,
  `net_winning_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_detail_timestamp_index` (`timestamp`),
  KEY `stock_detail_entity_id_index` (`entity_id`),
  KEY `stock_detail_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stock_institutional_investor_holder`
--

DROP TABLE IF EXISTS `stock_institutional_investor_holder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_institutional_investor_holder` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `actor_id` varchar(64) DEFAULT NULL,
  `actor_type` varchar(64) DEFAULT NULL,
  `actor_code` varchar(64) DEFAULT NULL,
  `actor_name` varchar(128) DEFAULT NULL,
  `report_period` varchar(32) DEFAULT NULL,
  `report_date` datetime DEFAULT NULL,
  `holding_numbers` float DEFAULT NULL,
  `holding_ratio` float DEFAULT NULL,
  `holding_values` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_institutional_investor_holder_timestamp_index` (`timestamp`),
  KEY `stock_institutional_investor_holder_entity_id_index` (`entity_id`),
  KEY `stock_institutional_investor_holder_code_index` (`code`),
  KEY `stock_institutional_investor_holder_report_period_index` (`report_period`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stock_money_flow`
--

DROP TABLE IF EXISTS `stock_money_flow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_money_flow` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `close` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  `net_inflows` float DEFAULT NULL,
  `net_inflow_rate` float DEFAULT NULL,
  `net_main_inflows` float DEFAULT NULL,
  `net_main_inflow_rate` float DEFAULT NULL,
  `net_huge_inflows` float DEFAULT NULL,
  `net_huge_inflow_rate` float DEFAULT NULL,
  `net_big_inflows` float DEFAULT NULL,
  `net_big_inflow_rate` float DEFAULT NULL,
  `net_medium_inflows` float DEFAULT NULL,
  `net_medium_inflow_rate` float DEFAULT NULL,
  `net_small_inflows` float DEFAULT NULL,
  `net_small_inflow_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_money_flow_timestamp_index` (`timestamp`),
  KEY `stock_money_flow_entity_id_index` (`entity_id`),
  KEY `stock_money_flow_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stock_news`
--

DROP TABLE IF EXISTS `stock_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_news` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `news_title` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_news_timestamp_index` (`timestamp`),
  KEY `stock_news_entity_id_index` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stock_summary`
--

DROP TABLE IF EXISTS `stock_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_summary` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `total_value` float DEFAULT NULL,
  `total_tradable_vaule` float DEFAULT NULL,
  `pe` float DEFAULT NULL,
  `pb` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_summary_timestamp_index` (`timestamp`),
  KEY `stock_summary_entity_id_index` (`entity_id`),
  KEY `stock_summary_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stock_top_ten_free_holder`
--

DROP TABLE IF EXISTS `stock_top_ten_free_holder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_top_ten_free_holder` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `actor_id` varchar(64) DEFAULT NULL,
  `actor_type` varchar(64) DEFAULT NULL,
  `actor_code` varchar(64) DEFAULT NULL,
  `actor_name` varchar(128) DEFAULT NULL,
  `report_period` varchar(32) DEFAULT NULL,
  `report_date` datetime DEFAULT NULL,
  `holding_numbers` float DEFAULT NULL,
  `holding_ratio` float DEFAULT NULL,
  `holding_values` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_top_ten_free_holder_timestamp_index` (`timestamp`),
  KEY `stock_top_ten_free_holder_entity_id_index` (`entity_id`),
  KEY `stock_top_ten_free_holder_code_index` (`code`),
  KEY `stock_top_ten_free_holder_report_period_index` (`report_period`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stock_top_ten_holder`
--

DROP TABLE IF EXISTS `stock_top_ten_holder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_top_ten_holder` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `actor_id` varchar(64) DEFAULT NULL,
  `actor_type` varchar(64) DEFAULT NULL,
  `actor_code` varchar(64) DEFAULT NULL,
  `actor_name` varchar(128) DEFAULT NULL,
  `report_period` varchar(32) DEFAULT NULL,
  `report_date` datetime DEFAULT NULL,
  `holding_numbers` float DEFAULT NULL,
  `holding_ratio` float DEFAULT NULL,
  `holding_values` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_top_ten_holder_timestamp_index` (`timestamp`),
  KEY `stock_top_ten_holder_entity_id_index` (`entity_id`),
  KEY `stock_top_ten_holder_code_index` (`code`),
  KEY `stock_top_ten_holder_report_period_index` (`report_period`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stock_trade_day`
--

DROP TABLE IF EXISTS `stock_trade_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_trade_day` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_trade_day_timestamp_index` (`timestamp`),
  KEY `stock_trade_day_entity_id_index` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stock_valuation`
--

DROP TABLE IF EXISTS `stock_valuation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_valuation` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `capitalization` float DEFAULT NULL,
  `circulating_cap` float DEFAULT NULL,
  `market_cap` float DEFAULT NULL,
  `circulating_market_cap` float DEFAULT NULL,
  `turnover_ratio` float DEFAULT NULL,
  `pe` float DEFAULT NULL,
  `pe_ttm` float DEFAULT NULL,
  `pb` float DEFAULT NULL,
  `ps` float DEFAULT NULL,
  `pcf` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_valuation_timestamp_index` (`timestamp`),
  KEY `stock_valuation_entity_id_index` (`entity_id`),
  KEY `stock_valuation_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stockhk`
--

DROP TABLE IF EXISTS `stockhk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stockhk` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `entity_type` varchar(64) DEFAULT NULL,
  `exchange` varchar(32) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `list_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `south` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stockhk_timestamp_index` (`timestamp`),
  KEY `stockhk_entity_id_index` (`entity_id`),
  KEY `stockhk_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stockhk_1d_hfq_kdata`
--

DROP TABLE IF EXISTS `stockhk_1d_hfq_kdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stockhk_1d_hfq_kdata` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stockhk_1d_hfq_kdata_timestamp_index` (`timestamp`),
  KEY `stockhk_1d_hfq_kdata_entity_id_index` (`entity_id`),
  KEY `stockhk_1d_hfq_kdata_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stockhk_1d_kdata`
--

DROP TABLE IF EXISTS `stockhk_1d_kdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stockhk_1d_kdata` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stockhk_1d_kdata_timestamp_index` (`timestamp`),
  KEY `stockhk_1d_kdata_entity_id_index` (`entity_id`),
  KEY `stockhk_1d_kdata_code_index` (`code`),
  KEY `stockhk_1d_kdata_entity_id_ts_IDX` (`entity_id`,`timestamp`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stockus`
--

DROP TABLE IF EXISTS `stockus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stockus` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `entity_type` varchar(64) DEFAULT NULL,
  `exchange` varchar(32) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `list_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stockus_timestamp_index` (`timestamp`),
  KEY `stockus_entity_id_index` (`entity_id`),
  KEY `stockus_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stockus_15m_hfq_kdata`
--

DROP TABLE IF EXISTS `stockus_15m_hfq_kdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stockus_15m_hfq_kdata` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stockus_15m_hfq_kdata_timestamp_index` (`timestamp`),
  KEY `stockus_15m_hfq_kdata_entity_id_index` (`entity_id`),
  KEY `stockus_15m_hfq_kdata_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stockus_15m_kdata`
--

DROP TABLE IF EXISTS `stockus_15m_kdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stockus_15m_kdata` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stockus_15m_kdata_timestamp_index` (`timestamp`),
  KEY `stockus_15m_kdata_entity_id_index` (`entity_id`),
  KEY `stockus_15m_kdata_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stockus_1d_hfq_kdata`
--

DROP TABLE IF EXISTS `stockus_1d_hfq_kdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stockus_1d_hfq_kdata` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stockus_1d_hfq_kdata_timestamp_index` (`timestamp`),
  KEY `stockus_1d_hfq_kdata_entity_id_index` (`entity_id`),
  KEY `stockus_1d_hfq_kdata_code_index` (`code`),
  KEY `stockus_1d_hfq_kdata_entity_id_IDX` (`entity_id`,`level`,`timestamp`) USING BTREE,
  KEY `stockus_1d_hfq_kdata_entity_id_IDX2` (`entity_id`,`timestamp`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stockus_1d_kdata`
--

DROP TABLE IF EXISTS `stockus_1d_kdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stockus_1d_kdata` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stockus_1d_kdata_timestamp_index` (`timestamp`),
  KEY `stockus_1d_kdata_code_index` (`code`),
  KEY `stockus_1d_kdata_entity_id_ts_IDX` (`entity_id`,`timestamp`) USING BTREE,
  KEY `stockus_1d_kdata_entity_id_index` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stockus_1h_hfq_kdata`
--

DROP TABLE IF EXISTS `stockus_1h_hfq_kdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stockus_1h_hfq_kdata` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stockus_1h_hfq_kdata_timestamp_index` (`timestamp`),
  KEY `stockus_1h_hfq_kdata_entity_id_index` (`entity_id`),
  KEY `stockus_1h_hfq_kdata_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stockus_1h_kdata`
--

DROP TABLE IF EXISTS `stockus_1h_kdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stockus_1h_kdata` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stockus_1h_kdata_timestamp_index` (`timestamp`),
  KEY `stockus_1h_kdata_entity_id_index` (`entity_id`),
  KEY `stockus_1h_kdata_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stockus_1m_hfq_kdata`
--

DROP TABLE IF EXISTS `stockus_1m_hfq_kdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stockus_1m_hfq_kdata` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stockus_1m_hfq_kdata_timestamp_index` (`timestamp`),
  KEY `stockus_1m_hfq_kdata_entity_id_index` (`entity_id`),
  KEY `stockus_1m_hfq_kdata_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stockus_1m_kdata`
--

DROP TABLE IF EXISTS `stockus_1m_kdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stockus_1m_kdata` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stockus_1m_kdata_timestamp_index` (`timestamp`),
  KEY `stockus_1m_kdata_entity_id_index` (`entity_id`),
  KEY `stockus_1m_kdata_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stockus_1mon_hfq_kdata`
--

DROP TABLE IF EXISTS `stockus_1mon_hfq_kdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stockus_1mon_hfq_kdata` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stockus_1mon_hfq_kdata_timestamp_index` (`timestamp`),
  KEY `stockus_1mon_hfq_kdata_entity_id_index` (`entity_id`),
  KEY `stockus_1mon_hfq_kdata_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stockus_1mon_kdata`
--

DROP TABLE IF EXISTS `stockus_1mon_kdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stockus_1mon_kdata` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stockus_1mon_kdata_timestamp_index` (`timestamp`),
  KEY `stockus_1mon_kdata_entity_id_index` (`entity_id`),
  KEY `stockus_1mon_kdata_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stockus_1wk_hfq_kdata`
--

DROP TABLE IF EXISTS `stockus_1wk_hfq_kdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stockus_1wk_hfq_kdata` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stockus_1wk_hfq_kdata_timestamp_index` (`timestamp`),
  KEY `stockus_1wk_hfq_kdata_entity_id_index` (`entity_id`),
  KEY `stockus_1wk_hfq_kdata_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stockus_1wk_kdata`
--

DROP TABLE IF EXISTS `stockus_1wk_kdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stockus_1wk_kdata` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stockus_1wk_kdata_timestamp_index` (`timestamp`),
  KEY `stockus_1wk_kdata_entity_id_index` (`entity_id`),
  KEY `stockus_1wk_kdata_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stockus_30m_hfq_kdata`
--

DROP TABLE IF EXISTS `stockus_30m_hfq_kdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stockus_30m_hfq_kdata` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stockus_30m_hfq_kdata_timestamp_index` (`timestamp`),
  KEY `stockus_30m_hfq_kdata_entity_id_index` (`entity_id`),
  KEY `stockus_30m_hfq_kdata_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stockus_30m_kdata`
--

DROP TABLE IF EXISTS `stockus_30m_kdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stockus_30m_kdata` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stockus_30m_kdata_timestamp_index` (`timestamp`),
  KEY `stockus_30m_kdata_entity_id_index` (`entity_id`),
  KEY `stockus_30m_kdata_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stockus_4h_hfq_kdata`
--

DROP TABLE IF EXISTS `stockus_4h_hfq_kdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stockus_4h_hfq_kdata` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stockus_4h_hfq_kdata_timestamp_index` (`timestamp`),
  KEY `stockus_4h_hfq_kdata_entity_id_index` (`entity_id`),
  KEY `stockus_4h_hfq_kdata_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stockus_4h_kdata`
--

DROP TABLE IF EXISTS `stockus_4h_kdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stockus_4h_kdata` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stockus_4h_kdata_timestamp_index` (`timestamp`),
  KEY `stockus_4h_kdata_entity_id_index` (`entity_id`),
  KEY `stockus_4h_kdata_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stockus_5m_hfq_kdata`
--

DROP TABLE IF EXISTS `stockus_5m_hfq_kdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stockus_5m_hfq_kdata` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stockus_5m_hfq_kdata_timestamp_index` (`timestamp`),
  KEY `stockus_5m_hfq_kdata_entity_id_index` (`entity_id`),
  KEY `stockus_5m_hfq_kdata_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stockus_5m_kdata`
--

DROP TABLE IF EXISTS `stockus_5m_kdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stockus_5m_kdata` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `open` float DEFAULT NULL,
  `close` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `change_pct` float DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stockus_5m_kdata_timestamp_index` (`timestamp`),
  KEY `stockus_5m_kdata_entity_id_index` (`entity_id`),
  KEY `stockus_5m_kdata_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tagger_state`
--

DROP TABLE IF EXISTS `tagger_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tagger_state` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `state_name` varchar(128) DEFAULT NULL,
  `state` text,
  PRIMARY KEY (`id`),
  KEY `tagger_state_timestamp_index` (`timestamp`),
  KEY `tagger_state_entity_id_index` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_ten_holder`
--

DROP TABLE IF EXISTS `top_ten_holder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `top_ten_holder` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `report_period` varchar(32) DEFAULT NULL,
  `report_date` datetime DEFAULT NULL,
  `holder_code` varchar(32) DEFAULT NULL,
  `holder_name` varchar(32) DEFAULT NULL,
  `shareholding_numbers` float DEFAULT NULL,
  `shareholding_ratio` float DEFAULT NULL,
  `change` float DEFAULT NULL,
  `change_ratio` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `top_ten_holder_timestamp_index` (`timestamp`),
  KEY `top_ten_holder_entity_id_index` (`entity_id`),
  KEY `top_ten_holder_code_index` (`code`),
  KEY `top_ten_holder_report_period_index` (`report_period`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_ten_tradable_holder`
--

DROP TABLE IF EXISTS `top_ten_tradable_holder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `top_ten_tradable_holder` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `report_period` varchar(32) DEFAULT NULL,
  `report_date` datetime DEFAULT NULL,
  `holder_code` varchar(32) DEFAULT NULL,
  `holder_name` varchar(32) DEFAULT NULL,
  `shareholding_numbers` float DEFAULT NULL,
  `shareholding_ratio` float DEFAULT NULL,
  `change` float DEFAULT NULL,
  `change_ratio` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `top_ten_tradable_holder_timestamp_index` (`timestamp`),
  KEY `top_ten_tradable_holder_entity_id_index` (`entity_id`),
  KEY `top_ten_tradable_holder_code_index` (`code`),
  KEY `top_ten_tradable_holder_report_period_index` (`report_period`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trader_info`
--

DROP TABLE IF EXISTS `trader_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trader_info` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `trader_name` varchar(128) DEFAULT NULL,
  `entity_type` varchar(128) DEFAULT NULL,
  `start_timestamp` datetime DEFAULT NULL,
  `end_timestamp` datetime DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `real_time` tinyint(1) DEFAULT NULL,
  `kdata_use_begin_time` tinyint(1) DEFAULT NULL,
  `kdata_adjust_type` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trader_info_timestamp_index` (`timestamp`),
  KEY `trader_info_entity_id_index` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `treasury_yield`
--

DROP TABLE IF EXISTS `treasury_yield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treasury_yield` (
  `id` varchar(64) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `yield_2` float DEFAULT NULL,
  `yield_5` float DEFAULT NULL,
  `yield_10` float DEFAULT NULL,
  `yield_30` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `treasury_yield_timestamp_index` (`timestamp`),
  KEY `treasury_yield_entity_id_index` (`entity_id`),
  KEY `treasury_yield_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 's_data'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-06  9:47:19
