-- =============================================================================
-- Script: 02_tenure_cohort_analysis.sql
-- Objective: Use a CTE to bucket customers by tenure and analyze churn by lifecycle stage.
-- =============================================================================

USE telco_db;

WITH TenureBuckets AS (
    SELECT 
        customerID,
        Churn,
        CASE 
            WHEN tenure <= 12 THEN '1. New (0-12 Months)'
            WHEN tenure <= 24 THEN '2. Mid (13-24 Months)'
            ELSE '3. Loyal (25+ Months)'
        END AS tenure_group
    FROM customer_churn
)
SELECT 
    tenure_group,
    COUNT(customerID) AS total_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(customerID) * 100, 
    2) AS churn_rate_percentage
FROM TenureBuckets
GROUP BY tenure_group
ORDER BY tenure_group;