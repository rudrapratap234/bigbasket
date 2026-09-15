# BigBasket Category Performance Diagnostic

An end-to-end diagnostic pipeline linking SQLite data modeling, spreadsheet reconciliation, Tableau visual analytics, and Python/Pandas data cleaning. The project audits 6 core product categories across 500 orders (Jan–Jun 2026) to determine targets variance, identify margin drivers, and rectify data quality anomalies from upstream order logs.

---

## 1. Project Directory & File Structure
```text
bigbasket/
├── generate_data.py               # Deterministic seed data generator
├── bigbasket_capstone.db          # SQLite relational database
├── orders_raw.csv                 # Deliberately messy raw order exports
├── products.csv                   # Master catalog dataset
├── monthly_category_revenue.csv   # Task 5(b) clean aggregated export (36 rows)
├── verify.sql                     # Database sanity checks & table row counts
├── 01_foundations.sql             # Tasks 3: Basic SQL retrieval & filtering queries
├── 02_aggregation_joins.sql       # Task 4: Aggregation, HAVING, and LEFT JOIN queries
├── 03_reporting.sql               # Task 5: CASE WHEN tiering & monthly reporting
├── bigbasket_cross_check.xlsx     # Part 2: Reconciled multi-tab spreadsheet model
├── clean_data.py                  # Part 4: Python cleaning & outlier handling script
├── ai_log.md                      # RCTCF AI-assisted prompting record
└── README.md                      # Project documentation, KPI summary & data story
