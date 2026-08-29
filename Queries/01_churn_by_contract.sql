-- =============================================================================
-- Script: 01_churn_by_contract.sql
-- Objective: Calculate customer churn rate percentage grouped by contract type.
-- =============================================================================

USE telco_db;

SELECT 
    Contract,
    COUNT(customerID) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(customerID) * 100, 
    2) AS churn_rate_percentage
FROM customer_churn
GROUP BY Contract
ORDER BY churn_rate_percentage DESC;