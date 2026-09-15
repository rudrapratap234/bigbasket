# AI-Assisted Prompt Log

## Prompt 1: SQL Reporting & Category Target Variance (Task 5 & 7)
* **Role:** Senior Data Analyst & SQLite Specialist
* **Context:** Working with BigBasket e-commerce SQLite tables (`orders`, `products`, `category_targets`) covering Jan-Jun 2026.
* **Task:** Formulate SQLite queries to generate a 3-tier product revenue CASE statement, monthly category aggregations, and floating-point safe target variance metrics.
* **Constraints:** Must use SQLite `strftime('%Y-%m', order_date)`, avoid integer truncation by casting or multiplying with 100.0, and handle 0-order records via LEFT JOIN.
* **Format:** Valid, clean SQLite script.

### Concrete Verification Step:
Ran the generated query directly against `bigbasket_capstone.db` via sqlite3 and verified that the monthly aggregated revenue across all 36 rows sums exactly to 88,282 INR without decimal truncation.

---

## Prompt 2: Pandas Data Cleaning & IQR Outlier Capping (Task 5 & 10)
* **Role:** Python Data Engineer
* **Context:** Deliberately corrupted e-commerce order logs (`orders_raw.csv`) containing whitespace/casing anomalies, null amounts, and 40x synthetic multipliers.
* **Task:** Implement IQR upper-fence calculation on non-null Delivered orders and cap extreme values using `.clip(upper=upper_fence)`.
* **Constraints:** Compute Q1 and Q3 via `.quantile()`, do not drop outlier rows (cap only), and maintain ratings as null for Cancelled/Pending orders.
* **Format:** Clean Pandas snippet with assertions.

### Concrete Verification Step:
Re-ran the IQR capping logic in the notebook and manually verified that exactly 29 outlier rows above the upper fence (592.50) were clamped without dropping rows or modifying unaffected rows.
