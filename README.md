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

---

## 🎯 Business Problems & Objectives

1. **Contract Vulnerability:** Identify which contract types are bleeding the most customers to prioritize pricing interventions.
2. **Onboarding vs. Loyalty:** Determine if churn is a short-term onboarding issue or a long-term competitor issue by bucketing customers into tenure cohorts.
3. **VIP Retention:** Proactively identify the top 3 highest-paying active customers per contract tier to optimize targeted reward campaigns.

---

## 🔍 Analytical Methodology 

To solve these business problems, the analysis was broken down into three distinct SQL workflows (available in the `queries/` directory):

*   **Scenario 1: Contract Churn Analysis (Reference: `01_churn_by_contract.sql`)**
    *   *Methodology:* Utilized Conditional Aggregation (`SUM(CASE WHEN...)`) to isolate churned customers and calculate exact churn rate percentages natively within the query.
*   **Scenario 2: Cohort Analysis via CTEs (Reference: `02_tenure_cohort_analysis.sql`)**
    *   *Methodology:* Leveraged Common Table Expressions (CTEs) to segment users into distinct lifecycle stages (0-12 months, 13-24 months, 25+ months) as a temporary table before applying aggregate churn calculations. This pinpointed exactly *when* attrition peaks.
*   **Scenario 3: VIP Customer Segmentation (Reference: `03_vip_customer_segmentation.sql`)**
    *   *Methodology:* Applied Window Functions (`RANK() OVER (PARTITION BY...)`) to rank active customers by Total Charges within their specific contract tier. This allowed for advanced segmentation while retaining critical row-level identifiers like Customer ID.

---

## 💡 Strategic Recommendations

1. **Overhaul the First-Year Experience:** Data shows nearly 50% of all churn occurs within the first 12 months. Divert a portion of the marketing acquisition budget toward Customer Success onboarding programs to address this critical flaw in the early lifecycle.
2. **Incentivize Contract Upgrades:** Month-to-Month contracts suffer a massive ~43% churn rate. Offer targeted first-month discounts or service upgrades to aggressively transition these users into 1-Year agreements.
3. **Deploy Tiered VIP Rewards:** Utilize the Window Function tracking to dispatch high-tier retention rewards (e.g., hardware upgrades or premium router installations) to the Top 3 annual VIPs, as their $8,000+ lifetime value justifies the investment.
