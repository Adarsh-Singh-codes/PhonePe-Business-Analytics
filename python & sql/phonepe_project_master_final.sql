
-- ============================================================
-- 📊 PHONEPE END-TO-END BUSINESS ANALYSIS PROJECT (FINAL SQL)
-- Author: Adarsh Ajit Singh
-- Platform: Google BigQuery
-- Description: Generates full analytical data for Power BI dashboard
-- Source Datasets:
--   1. phonepe_summary_clean.csv
--   2. failure_analysis_clean.csv
--   3. regional_performance_clean.csv
--   4. market_share_clean.csv
--   5. upi_transactions_clean.csv
-- ============================================================

-- ========== 1️⃣ PHONEPE TRANSACTION SUMMARY ==========
WITH phonepe_summary AS (
  SELECT
    Service_Type,
    Payment_Status,
    State,
    DATE(Transaction_Date) AS Transaction_Date,
    ROUND(SUM(Amount), 2) AS Total_Transaction_Value,
    COUNT(Transaction_ID) AS Total_Transactions,
    SAFE_DIVIDE(
      SUM(CASE WHEN Payment_Status = 'Successful' THEN 1 ELSE 0 END),
      COUNT(Transaction_ID)
    ) * 100 AS Success_Rate_Percent,
    ROUND(AVG(Amount), 2) AS Avg_Transaction_Value
  FROM
    `your_project.your_dataset.phonepe_summary_clean`
  GROUP BY
    Service_Type, Payment_Status, State, Transaction_Date
),

-- ========== 2️⃣ FAILURE ANALYSIS ==========
failure_analysis AS (
  SELECT
    Failure_Reason,
    COUNT(Transaction_ID) AS Failure_Count,
    ROUND(SAFE_DIVIDE(COUNT(Transaction_ID),
      (SELECT COUNT(*) FROM `your_project.your_dataset.failure_analysis_clean`)) * 100, 2) AS Failure_Percent
  FROM
    `your_project.your_dataset.failure_analysis_clean`
  GROUP BY
    Failure_Reason
  ORDER BY
    Failure_Count DESC
),

-- ========== 3️⃣ REGIONAL PERFORMANCE ==========
regional_perf AS (
  SELECT
    State,
    ROUND(SUM(Transaction_Value), 2) AS Total_Transaction_Value,
    ROUND(AVG(Success_Rate), 2) AS Avg_Success_Rate
  FROM
    `your_project.your_dataset.regional_performance_clean`
  GROUP BY
    State
),

-- ========== 4️⃣ MARKET SHARE ==========
market_share AS (
  SELECT
    State,
    ROUND(SUM(UPI_Value), 2) AS Total_UPI_Value,
    ROUND(SUM(PhonePe_Value), 2) AS PhonePe_Value,
    ROUND(SAFE_DIVIDE(SUM(PhonePe_Value), SUM(UPI_Value)) * 100, 2) AS Market_Share_Percent
  FROM
    `your_project.your_dataset.market_share_clean`
  GROUP BY
    State
),

-- ========== 5️⃣ UPI TRANSACTIONS ==========
upi_txn AS (
  SELECT
    FORMAT_DATE('%b %Y', DATE(Transaction_Date)) AS MonthYear,
    ROUND(SUM(Amount), 2) AS Total_UPI_Value,
    ROUND(SUM(PhonePe_Value), 2) AS PhonePe_Value,
    ROUND(SAFE_DIVIDE(SUM(PhonePe_Value), SUM(Amount)) * 100, 2) AS PhonePe_Share_Percent
  FROM
    `your_project.your_dataset.upi_transactions_clean`
  GROUP BY
    MonthYear
)

-- ========== FINAL OUTPUT COMBINED ==========
SELECT
  'PhonePe Summary' AS Section,
  (SELECT SUM(Total_Transaction_Value) FROM phonepe_summary) AS Total_PhonePe_Value,
  (SELECT AVG(Success_Rate_Percent) FROM phonepe_summary) AS Avg_Success_Rate,
  (SELECT COUNT(DISTINCT Service_Type) FROM phonepe_summary) AS Total_Services,
  (SELECT ROUND(AVG(Avg_Transaction_Value), 2) FROM phonepe_summary) AS Avg_Transaction_Value,
  (SELECT AVG(Market_Share_Percent) FROM market_share) AS Avg_Market_Share,
  (SELECT ROUND(SAFE_DIVIDE(MAX(Total_UPI_Value) - MIN(Total_UPI_Value), MIN(Total_UPI_Value)) * 100, 2) FROM upi_txn) AS YoY_Growth_Percent,
  (SELECT STRING_AGG(Failure_Reason || ' (' || Failure_Percent || '%)', ', ') FROM failure_analysis) AS Failure_Distribution;
