# 📉 Telco Customer Churn - Retention & VIP Analytics

## 📌 Project Overview
This project analyzes a 7,000+ row telecommunications dataset to identify drivers of customer churn and segment high-value users. Using advanced SQL techniques in MySQL (CTEs, Window Functions, and Conditional Aggregation), the analysis provides actionable intelligence for the Marketing and Customer Success teams to optimize retention budgets.

**Dataset Source:** [IBM Telco Customer Churn on Kaggle](https://www.kaggle.com/datasets/blastchar/telco-customer-churn)

---

## 📂 Repository Structure

```text
├── queries/
│   ├── 00_data_cleaning.sql                  # Handling blank spaces & type casting
│   ├── 01_churn_by_contract.sql              # Conditional aggregation for churn rates
│   ├── 02_tenure_cohort_analysis.sql         # CTE-based tenure bucketing
│   └── 03_vip_customer_segmentation.sql      # Window functions for top spender ranking
└── README.md                                 # Executive summary & SQL methodology


