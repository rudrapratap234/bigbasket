- VERIFICATION COUNTS:
-- products: 31
-- customers: 50
-- orders: 500
-- category_targets: 6
-- orders status breakdown: Delivered (434), Cancelled (42), Pending (24)

SELECT COUNT(*) AS total_products FROM products;
SELECT COUNT(*) AS total_customers FROM customers;
SELECT COUNT(*) AS total_orders FROM orders;
SELECT COUNT(*) AS total_targets FROM category_targets;

SELECT status, COUNT(*) AS count_by_status
FROM orders
GROUP BY status;
