# Ecommerce Checkout Optimization: A/B Test Analysis

## Project Overview
This project analyzes a product hypothesis for an Ecommerce store using the **Google Analytics 4 (GA4) BigQuery public dataset**. The goal was to determine if a **One-Page Checkout** (Test Group) outperforms the traditional **Multi-Step Checkout** (Control Group) in terms of conversion and revenue.

## The Hypothesis
* **Hypothesis:** If we simplify the checkout process to a single page, then the **Conversion Rate (CR)** will increase by at least 5% without negatively impacting the **Average Order Value (AOV)**.

## Tech Stack
* **Data Warehouse:** BigQuery (SQL)
* **Data Processing:** Spark SQL syntax for scalable data transformation (ETL).
* **Visualization:** Tableau (Interactive Dashboards)
* **Version Control:** Git & GitHub

## Project Structure
* `sql_queries/`: SQL scripts for data extraction and cleaning.
* `data/`: Sample CSV export from BigQuery.
* `dashboard/`: Tableau workbook and screenshots.
* `README.md`: Project documentation.

## Methodology & ETL Process
Using **Spark SQL** syntax within BigQuery, I performed the following steps:
1. **Extraction:** Pulled raw event data from `ga4_obfuscated_sample_ecommerce`.
2. **Transformation (ETL):** Cleaned session data and mapped user IDs. Assigned users to Control vs. Test groups using a hash-based split (`FARM_FINGERPRINT`).
3. **Metrics Calculation:** Aggregated data to calculate:
   * **CR (Conversion Rate):** Total Purchases / Total Users
   * **AOV (Average Order Value):** Total Revenue / Total Purchases
   * **ARPU (Average Revenue Per User):** Total Revenue / Total Users

## Dashboard Preview
![A/B Test Dashboard](ab_test_scrin.jpg)

## Key Insights & Product Analysis
* **Conversion vs. Value Trade-off:** The One-Page Checkout (Test) showed a slight decrease in Conversion Rate (**1.7% vs 1.8%** in Control). However, it saw an increase in **Average Order Value (AOV)** to **$64.3**.
* **ARPU Comparison:** The Control group maintains a slightly higher ARPU (**$1.15 vs $1.12**).
* **Conclusion:** The simplified checkout didn't lead to a "conversion win" but attracted higher-value purchases. 
* **Next Step:** I recommend an ad-hoc deep dive into segment behavior (e.g., mobile vs. desktop) to see if the One-Page design caused friction for specific users.
* **Anomaly Detection:** A significant drop in total conversions was observed around mid-January. This was flagged for investigation into potential tracking outages or seasonal trends post-holidays.

## Future Work (Ad-hoc Requests)
* Analyze **Retention Rates** for users in the Test group to see if the simplified checkout leads to higher long-term LTV.
* Segment results by **Marketing Channel** (Paid vs. Organic) to identify where the new checkout performs best.
