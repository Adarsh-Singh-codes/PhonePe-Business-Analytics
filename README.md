# 📊 PhonePe Business Analytics — End-to-End Data Pipeline Project

### 🚀 Comprehensive UPI Business Intelligence Project | ETL · SQL · BigQuery · Power BI

![Dashboard Image](https://raw.githubusercontent.com/Adarsh-Singh-codes/PhonePe-Business-Analytics/main/visuals/Gen%20ai%20Genetrated%20infographics/Phonpe%20Dashboard%20-%20POWER_BI_pages-to-jpg-0001.jpg)

*End-to-End BI Project by Adarsh Ajit Singh*

---

## 🏁 Executive Summary

This project presents an *end-to-end data analytics solution* built to analyze **PhonePe’s UPI market performance**, leveraging data engineering and business intelligence tools.  
From raw transaction datasets to actionable insights, this project demonstrates *the full data pipeline workflow* — including ETL with Python, cloud-based SQL warehousing in **Google BigQuery**, and interactive visualization in **Power BI**.

The result is a *comprehensive digital payments intelligence dashboard*, providing insights into UPI transaction patterns, regional performance, market share, and emerging fintech growth trends.

---

## ⚙️ Project Workflow

### **1️⃣ Data Source Layer (Raw Data)**
- UPI transaction datasets from multiple domains (Money Transfer, Bills, Insurance, Loans).
- Data formats: `.csv`, `.xlsx`
![PYTHON-ETL](https://raw.githubusercontent.com/Adarsh-Singh-codes/PhonePe-Business-Analytics/main/visuals/Screenshot%20(20).png)

### **2️⃣ ETL Layer (Python + Google Colab)**
Performed in **Google Colab**, using `pandas` for:
- Data cleaning and standardization
- Column normalization and schema alignment
- Null handling, duplicates removal, and format correction
- Revenue and platform fee calculations

Output:  
`upi_cleaned.csv` and `phonepe_cleaned.csv`
![Bigquery/SQL](https://github.com/Adarsh-Singh-codes/PhonePe-Business-Analytics/blob/main/visuals/Screenshot%20(42).png)
### **3️⃣ Cloud Data Warehouse (Google BigQuery)**
Data uploaded to **Google Cloud Platform (GCP)** under project:  
`scalaa.phonepe_upi_project`

Created datasets:
- `upi_transactions`
- `phonepe_summary`
- `regional_performance_view`
- `failure_analysis_view`

Executed SQL queries for:
- Aggregation of total transaction value and count by state
- Failure rate and performance analysis
- Regional and payment channel trends
![POWER_BI](https://github.com/Adarsh-Singh-codes/PhonePe-Business-Analytics/blob/main/visuals/Gen%20ai%20Genetrated%20infographics/Phonpe%20Dashboard%20-%20POWER_BI_pages-to-jpg-0005.jpg)
### **4️⃣ Visualization Layer (Power BI)**
Connected Power BI to BigQuery (Direct Query).  
Developed multi-page interactive dashboards for:
- KPI Overview
- UPI Market Share (PhonePe, Paytm, GPay, etc.)
- Recharge & Bills Analytics
- Insurance and Loans Breakdown
- Failure & Performance Metrics

---
[![PhonePe Dashboard](./visuals/Gen%20ai%20Genetrated%20infographics/Phonpe%20Dashboard%20-%20POWER_BI_pages-to-jpg-0006.jpg)](visuals/Gen%20ai%20Genetrated%20infographics/Phonpe%20Dashboard%20-%20POWER_BI_pages-to-jpg-0006.jpg)

## 🧠 Business Insights

- **PhonePe holds 46.4% UPI Market Share**, maintaining leadership with 96.2% transaction success rate.
- **UPI Transactions grew 34.8% YoY**, surpassing ₹5.4 Lakh Crore total value in FY 2025.
- **Top-performing states:** Maharashtra, Karnataka, Delhi, Gujarat, and Uttar Pradesh.
- **Recharge & Bills** segment contributes **12–15% of total PhonePe transactions**, reflecting India’s shift to digital payments.
- With **UPI’s international expansion** (UAE, Singapore, France), PhonePe is positioned for global fintech growth.

---

## 🧩 Tools & Technologies

| Layer | Tool | Purpose |
|-------|------|----------|
| **Data Collection** | CSV, Excel | Raw Transaction Data |
| **ETL Processing** | Python (pandas, numpy) | Cleaning & Transformation |
| **Cloud Storage & Querying** | Google BigQuery | SQL Aggregation & Modeling |
| **Visualization** | Microsoft Power BI | Interactive BI Dashboards |
| **Collaboration** | Google Colab, GitHub | Development & Version Control |

---

## 🗂️ Folder Structure

```
📁 PhonePe-End-to-End-Analytics/
│
├── 📄 README.md
├── 📊 PhonePe Dashboard - POWER_BI.pbix
├── 📁 data/
│   ├── phonepe_cleaned.csv
│   ├── upi_cleaned.csv
│   ├── failure_analysis_clean.csv
│   ├── regional_performance_clean.csv
│   ├── market_share_clean.csv
│   └── phonepe_summary_clean.csv
│
├── 📁 notebooks/
│   └── PhonePe_UPI.ipynb  # Python ETL script (Google Colab)
│
├── 📁 sql/
│   └── phonepe_upi_queries.sql  # BigQuery SQL aggregation scripts
│
└── 📁 assets/
    ├── infographic_1.png
    ├── infographic_2.png
    ├── pipeline_flow.png
    └── dashboard_preview.png
```

---

## 📈 Dashboard Highlights

| Section | Description |
|----------|--------------|
| **Overview** | KPI Summary & UPI Metrics |
| **Recharge & Bills** | Utility Payments & UPI Trends |
| **Insurance** | Policy Payment Breakdown |
| **UPI Market** | Share & Growth Analysis |
| **Regional Insights** | State-wise Transaction Performance |

---

## 🌍 Infographics

- **PhonePe Business Analytics — End-to-End Pipeline**
- **UPI Market Landscape (India 2025)**
- **Global UPI Expansion & Market Potential**
- **Top 5 States by PhonePe Market Share**

*(All visual assets included in the `/assets` folder.)*

---

## 📊 Key SQL Queries (Sample)

```sql
-- State-wise UPI Transactions Summary
SELECT
  state,
  SUM(amount) AS total_txn_value,
  COUNT(transaction_id) AS total_transactions,
  AVG(amount) AS avg_transaction
FROM `scalaa.phonepe_upi_project.upi_transactions`
GROUP BY state
ORDER BY total_txn_value DESC;

-- UPI Dataset Coverage Period
SELECT
  MIN(date) AS start_date,
  MAX(date) AS end_date
FROM `scalaa.phonepe_upi_project.upi_transactions`;
```

---

## 🧾 Results Snapshot

| Metric | Value |
|---------|--------|
| **UPI Market Share (PhonePe)** | 46.4% |
| **Transaction Success Rate** | 96.2% |
| **YoY Growth (UPI)** | +34.8% |
| **Total UPI Value** | ₹5.4 Lakh Crore |
| **Average Transaction Value** | ₹436 |

---

## 💼 Project Outcomes

- Demonstrated **end-to-end analytics lifecycle** — from ETL to dashboard.
- Gained *real-world experience with cloud SQL pipelines (BigQuery → Power BI)*.
- Delivered *strategic insights* into India’s fintech ecosystem and digital adoption.

---

## 🔮 Future Enhancements

- Integrate **real-time UPI transaction APIs (NPCI)**.
- Deploy dashboard on **Power BI Service** for live tracking.
- Add **predictive modeling** for UPI growth and failure forecasting using Python.

---

## 👨‍💻 Author

**Adarsh Ajit Singh**  
📍 Data Analyst | Business Intelligence | Cloud Analytics  
🌐 [GitHub: Adarsh-Singh-codes](https://github.com/Adarsh-Singh-codes)

---

## 🏷️ Tags

`#DataAnalytics` `#BusinessIntelligence` `#ETL` `#SQL` `#BigQuery`  
`#Python` `#PowerBI` `#UPI` `#PhonePe` `#FintechAnalytics`

---

### 🏁 *“From Data to Decisions — Transforming Fintech Insights into Business Intelligence.”*
