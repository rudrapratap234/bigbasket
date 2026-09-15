# AI-Assisted Prompt Log

## Prompt 1: Task 5(b) & 5(c) SQL Query Construction
* *Role:* Senior Data Analyst & SQLite Expert
* *Context:* Working on an e-commerce database with orders, products, and category_targets tables in SQLite.
* *Task:* Write SQL queries for monthly category metrics and variance calculation against category targets.
* *Constraints:* Must use SQLite strftime('%Y-%m', order_date), avoid integer division by using 100.0, and include tags: 'Above Target', 'Below Target - Watch' (within 15%), and 'Below Target - Critical'.
* *Format:* Valid, clean SQLite queries.

## Actual Verification Step Performed:
Ran the generated SQL queries against bigbasket_capstone.db using SQLite command line and verified that the monthly aggregated revenue across all 36 rows sums exactly to 88,282 INR.
