/*
-- =============================================================================
-- SQL Practice Exercise: Tier 4, Question 8
--
-- Prompt:
-- The finance team wants to identify our single best sales day of 2025.
--
-- Calculate the total revenue (`price * quantity`) generated for each
-- individual day in the orders table. The final report should show the date
-- and the total revenue for only the single day with the highest revenue.
-- =============================================================================
*/

-- Solution Query:
-- This query joins the necessary tables to link products and their prices to
-- individual orders. It then groups all sales by their `order_date`, calculates
-- the total revenue for each day, sorts the days by that revenue, and
-- selects the top one.

SELECT
    o.order_date,
    SUM(p.price * oi.quantity) AS total_revenue
FROM
    orders AS o
INNER JOIN
    order_items AS oi ON o.order_id = oi.order_id
INNER JOIN
    products AS p ON oi.product_id = p.product_id
GROUP BY
    o.order_date
ORDER BY
    total_revenue DESC
LIMIT 1;