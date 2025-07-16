/*
-- =============================================================================
-- SQL Practice Exercise: Tier 4, Question 5
--
-- Prompt:
-- The marketing team wants to analyze how salary might correlate with sales
-- performance. They need a report on the 'Sales' department.
--
-- For every employee in the 'Sales' department, find the total revenue
-- (`price * quantity`) from all customers who live in that employee's
-- primary city.
--
-- The final report should show the employee's full name, their salary,
-- and their associated total revenue.
--
-- Implementation Note:
-- This query intentionally omits the `sales_records` table. While
-- `sales_records` provides a direct link between an employee and a sale,
-- the business prompt required a different analysis: associating an employee
-- with all revenue from customers in their primary city. This represents a
-- "territory revenue" calculation rather than direct sales attribution.
-- =============================================================================
*/

-- Solution Query:
SELECT
    e.first_name,
    e.last_name,
    e.salary,
    SUM(p.price * oi.quantity) AS total_revenue
FROM
    employees AS e
INNER JOIN
    employee_locations AS el ON e.employee_id = el.employee_id
INNER JOIN
    customers AS c ON el.city = c.city
INNER JOIN
    orders AS o ON c.customer_id = o.customer_id
INNER JOIN
    order_items AS oi ON o.order_id = oi.order_id
INNER JOIN
    products AS p ON oi.product_id = p.product_id
WHERE
    el.is_primary = TRUE AND e.department = 'Sales'
GROUP BY
    e.employee_id,
    e.first_name,
    e.last_name,
    e.salary;