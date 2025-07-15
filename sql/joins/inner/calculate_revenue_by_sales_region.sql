/*
-- =============================================================================
-- SQL Practice Exercise: Tier 3, Question 10
--
-- Prompt:
-- For end-of-year accounting, we need to calculate the total revenue generated
-- by a specific subset of our sales force.
--
-- The report should sum the revenue (`price * quantity`) for all order items
-- that meet these two criteria:
-- 1. The sale was handled by an employee whose primary work location is in
--    'New York' or 'Los Angeles'.
-- 2. The product sold was NOT a 'Quantum Laptop' or a 'Stellar Keyboard'.
--
-- The final report should be a single value, rounded to two decimal places.
-- =============================================================================
*/

-- Solution Query:
-- This query joins across five tables to link employees to the products
-- they sold, filters for the specified locations and products, and
-- aggregates the total revenue.

SELECT
    ROUND(SUM(p.price * oi.quantity), 2) AS total_revenue
FROM
    employees AS e
INNER JOIN
    employee_locations AS el ON e.employee_id = el.employee_id
INNER JOIN
    sales_records AS sr ON e.employee_id = sr.employee_id
INNER JOIN
    order_items AS oi ON sr.order_id = oi.order_id
INNER JOIN
    products AS p ON oi.product_id = p.product_id
WHERE
    el.city IN ('New York', 'Los Angeles') AND el.is_primary = TRUE
    AND p.product_name NOT IN ('Quantum Laptop', 'Stellar Keyboard');