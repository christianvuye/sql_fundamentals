/*
-- =============================================================================
-- SQL Practice Exercise: Tier 4, Question 4
--
-- Prompt:
-- The marketing team wants to run a re-engagement campaign for "inactive"
-- customers. An inactive customer is defined as anyone whose most recent
-- order was placed before May 1st, 2025.
--
-- The team needs a report showing the full name of each inactive customer
-- and the total lifetime revenue (`price * quantity`) generated from them.
--
-- NOTE: This query depends on the V3__insert_order_items_rows.sql migration.
-- =============================================================================
*/

-- Solution Query:
SELECT
    c.first_name,
    c.last_name,
    MAX(o.order_date) AS most_recent_order,
    SUM(p.price * oi.quantity) AS total_revenue
FROM
    customers AS c
INNER JOIN
    orders AS o ON c.customer_id = o.customer_id
INNER JOIN
    order_items AS oi ON o.order_id = oi.order_id
INNER JOIN
    products AS p ON oi.product_id = p.product_id
GROUP BY
    c.customer_id, c.first_name, c.last_name
HAVING
    MAX(o.order_date) < '2025-05-01';