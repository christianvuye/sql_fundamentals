/*
-- =============================================================================
-- SQL Practice Exercise: Tier 4, Question 2
--
-- Prompt:
-- The executive team is assessing departmental efficiency and its impact on sales.
-- They want to find the department with the highest average revenue per employee.
--
-- This is a multi-step problem:
-- 1. First, you must calculate the total revenue (`price` * `quantity`)
--    associated with each individual employee.
-- 2. Then, using that result, calculate the average of these revenue totals
--    for each department.
-- 3. The final report should show only the name of the single department with
--    the highest average revenue.
-- =============================================================================
*/

-- Step 1: Create a VIEW to store the total revenue for each employee.
-- This VIEW simplifies the final query.
CREATE OR REPLACE VIEW revenue_per_employee AS
SELECT
    e.employee_id,
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
    e.employee_id;


-- Step 2: Query the VIEW to find the average revenue per department and select the top one.
SELECT
    e.department,
    AVG(rpe.total_revenue) AS average_revenue
FROM
    employees AS e
INNER JOIN
    revenue_per_employee AS rpe ON e.employee_id = rpe.employee_id
GROUP BY
    e.department
ORDER BY
    average_revenue DESC
LIMIT 1;