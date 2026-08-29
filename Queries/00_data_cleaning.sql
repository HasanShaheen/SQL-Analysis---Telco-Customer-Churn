-- =============================================================================
-- Script: 00_data_cleaning.sql
-- Objective: Clean blank spaces in TotalCharges for new customers and cast to numeric.
-- =============================================================================

USE telco_db;

SET SQL_SAFE_UPDATES = 0;

UPDATE customer_churn
SET TotalCharges = '0'
WHERE TRIM(TotalCharges) = '';

ALTER TABLE customer_churn
MODIFY COLUMN TotalCharges DECIMAL(10,2);

SET SQL_SAFE_UPDATES = 1;