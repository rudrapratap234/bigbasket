-- 1. Orders in a specific city
SELECT o.*, c.city 
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE c.city = 'Bengaluru';

-- 2. Distinct category
SELECT DISTINCT category FROM products;

-- 3. Top 5 highest-value orders
SELECT order_id, customer_id, amount_inr AS highest_order_amount
FROM orders
ORDER BY amount_inr DESC
LIMIT 5;

-- 4. Total orders by payment mode
SELECT payment_mode, COUNT(*) AS total_orders
FROM orders
GROUP BY payment_mode;

-- 5. Payment mode filter
SELECT * FROM orders WHERE payment_mode IN ('UPI', 'Credit Card');

-- 6. Amount in range
SELECT * FROM orders WHERE amount_inr BETWEEN 200 AND 800;

-- 7. Amount outside range
SELECT * FROM orders WHERE amount_inr NOT BETWEEN 200 AND 800;

-- 8. Null ratings (Cancelled/Pending)
SELECT * FROM orders WHERE rating IS NULL;
