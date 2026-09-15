-- (a) Revenue tiering
SELECT 
    p.product_id,
    p.product_name,
    SUM(o.amount_inr) AS total_revenue,
    CASE 
        WHEN SUM(o.amount_inr) >= 3000 THEN 'High'
        WHEN SUM(o.amount_inr) >= 1000 THEN 'Medium'
        ELSE 'Low'
    END AS revenue_tier
FROM products p
LEFT JOIN orders o ON p.product_id = o.product_id AND o.status = 'Delivered'
GROUP BY p.product_id, p.product_name;

-- (b) Monthly category report
SELECT 
    p.category,
    strftime('%Y-%m', o.order_date) AS month,
    COUNT(o.order_id) AS order_count,
    SUM(o.amount_inr) AS total_revenue,
    AVG(o.amount_inr) AS avg_revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id
WHERE o.status = 'Delivered'
GROUP BY p.category, month
ORDER BY p.category, month;

-- (c) Target variance analysis
WITH monthly_cat AS (
    SELECT 
        p.category,
        SUM(o.amount_inr) AS total_revenue
    FROM orders o
    JOIN products p ON o.product_id = p.product_id
    WHERE o.status = 'Delivered'
    GROUP BY p.category
)
SELECT 
    m.category,
    m.total_revenue,
    ct.target_revenue_inr,
    (ct.target_revenue_inr - m.total_revenue) AS variance,
    ((m.total_revenue - ct.target_revenue_inr) * 100.0) / ct.target_revenue_inr AS percentage_variance,
    CASE 
        WHEN m.total_revenue >= ct.target_revenue_inr THEN 'Above Target'
        WHEN (ct.target_revenue_inr - m.total_revenue) <= (0.15 * ct.target_revenue_inr) THEN 'Below Target - Watch'
        ELSE 'Below Target - Critical'
    END AS performance_tag
FROM monthly_cat m
JOIN category_targets ct ON m.category = ct.category;
