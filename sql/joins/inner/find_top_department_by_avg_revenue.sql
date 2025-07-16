/*
-- =============================================================================
-- PREREQUISITES:
--   V2__create_revenue_per_employee_view.sql (creates revenue_per_employee)
-- =============================================================================
*/
-- The revenue_per_employee view is already created in the migration file
-- V2__create_revenue_per_employee_view.sql, so no need to recreate it here


-- Step 1: Query the VIEW to find the average revenue per department and select the top one.
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