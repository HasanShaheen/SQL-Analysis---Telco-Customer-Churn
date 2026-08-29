-- =============================================================================
-- Script: 03_vip_customer_segmentation.sql
-- Objective: Use Window Functions to identify the top 3 highest-paying active customers per contract.
-- =============================================================================

USE telco_db;

WITH RankedCustomers AS (
    SELECT 
        Contract,
        customerID,
        TotalCharges,
        RANK() OVER (PARTITION BY Contract ORDER BY TotalCharges DESC) AS revenue_rank
    FROM customer_churn
    WHERE Churn = 'No' 
)
SELECT 
    Contract,
    customerID,
    TotalCharges,
    revenue_rank
FROM RankedCustomers
WHERE revenue_rank <= 3
ORDER BY Contract, revenue_rank;