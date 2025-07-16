/*
-- =============================================================================
-- PREREQUISITES:
--   V2__create_revenue_per_employee_view.sql (creates revenue_per_employee)
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