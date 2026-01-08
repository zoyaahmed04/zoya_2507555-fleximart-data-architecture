USE fleximart;

-- Total revenue from completed orders
SELECT SUM(quantity * unit_price) AS total_revenue
FROM sales
WHERE status = 'Completed';

-- Total completed orders
SELECT COUNT(*) AS total_completed_orders
FROM sales
WHERE status = 'Completed';

-- Top 5 best-selling products
SELECT p.product_name,
       SUM(s.quantity) AS total_units_sold
FROM sales s
JOIN products p ON s.product_id = p.product_id
WHERE s.status = 'Completed'
GROUP BY p.product_name
ORDER BY total_units_sold DESC
LIMIT 5;

-- Revenue by category
SELECT p.category,
       SUM(s.quantity * s.unit_price) AS category_revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
WHERE s.status = 'Completed'
GROUP BY p.category
ORDER BY category_revenue DESC;

-- Top customers by spending
SELECT c.customer_id,
       CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
       SUM(s.quantity * s.unit_price) AS total_spent
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
WHERE s.status = 'Completed'
GROUP BY c.customer_id, customer_name
ORDER BY total_spent DESC
LIMIT 5;
