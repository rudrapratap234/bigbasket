-- (a) INNER JOIN with HAVING total_revenue > 10000
SELECT 
    p.category,
    COUNT(o.order_id) AS total_orders,
    SUM(o.amount_inr) AS total_revenue,
    AVG(o.amount_inr) AS avg_revenue
FROM orders o
INNER JOIN products p ON o.product_id = p.product_id
WHERE o.status = 'Delivered'
GROUP BY p.category
HAVING SUM(o.amount_inr) > 10000;

-- (b) LEFT JOIN to show total orders per product
SELECT 
    p.product_id,
    p.product_name,
    COUNT(o.order_id) AS total_orders
FROM products p
LEFT JOIN orders o ON p.product_id = o.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_orders ASC;
