/*
-- =============================================================================
--
-- PREREQUISITES:
-- Make sure to run the database migrations first:
--   V2__create_revenue_per_employee_view.sql
-- This creates the revenue_per_employee view that this exercise uses.
-- =============================================================================
*/
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
--
-- PREREQUISITES:
-- Make sure to run the database migrations first:
--   V2__create_revenue_per_employee_view.sql
-- This creates the revenue_per_employee view that this exercise uses.
-- =============================================================================
*/
*/

-- NOTE: The revenue_per_employee view is already created by migration V2.
-- We will use the existing view instead of creating a new one.

-- Step 1: Query the existing revenue_per_employee view to find the average revenue per department and select the top one.
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