/*
-- =============================================================================
-- SQL Practice Exercise: Tier 4, Question 9
--
-- Prompt:
-- To prepare for a meeting with our suppliers, management needs a report on
-- product sales broken down by the employee who sold them.
--
-- The report should show the employee's full name, the product's name, and
-- the total revenue (`price * quantity`) for that specific employee-product
-- combination. The final report should be ordered by the total revenue in
-- descending order and only show the top 5 combinations.
-- =============================================================================
*/

-- Solution Query:
-- This query joins all tables required to link an employee to the specific
-- products they sold via the sales_records table. It then groups by the
-- unique combination of employee and product to calculate the revenue for that
-- pairing, and finally orders and limits the result to find the top 5.

SELECT
    e.first_name,
    e.last_name,
    p.product_name,
    SUM(p.price * oi.quantity) AS total_revenue
FROM
    employees AS e
INNER JOIN
    sales_records AS sr ON e.employee_id = sr.employee_id
INNER JOIN
    order_items AS oi ON sr.order_id = oi.order_id
INNER JOIN
    products AS p ON oi.product_id = p.product_id
GROUP BY
    e.employee_id,
    e.first_name,
    e.last_name,
    p.product_id,
    p.product_name
ORDER BY
    total_revenue DESC
LIMIT 5;