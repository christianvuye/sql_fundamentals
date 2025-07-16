/*
-- =============================================================================
-- SQL Practice Exercise: Tier 4, Question 3
--
-- Prompt:
-- The sales team wants to reward its most consistent high-performer, defined
-- as the sales employee with the highest average order value.
--
-- Using the `sales_records` table to link employees to orders, and the
-- corrected `orders` table for order values, create a report that shows
-- the full name of the single top employee and their calculated average
-- order value, rounded to two decimal places.
-- =============================================================================
*/

-- Solution Query:
-- This query joins employees to their sales records and the corresponding orders,
-- filters for the 'Sales' department, then groups by employee to calculate
-- the average order value. Finally, it orders the results and takes the top one.

SELECT
    e.first_name,
    e.last_name,
    ROUND(AVG(o.total_amount), 2) AS average_order_value
FROM
    employees AS e
INNER JOIN
    sales_records AS sr ON e.employee_id = sr.employee_id
INNER JOIN
    orders AS o ON sr.order_id = o.order_id
WHERE
    e.department = 'Sales'
GROUP BY
    e.employee_id, -- Grouping by ID is more robust
    e.first_name,
    e.last_name
ORDER BY
    average_order_value DESC
LIMIT 1;