/*
-- =============================================================================
-- SQL Practice Exercise: Tier 4, Question 6
--
-- Prompt:
-- The finance team is conducting a data integrity audit. They need a report
-- of any orders where the `total_amount` listed in the `orders` table does
-- not match the sum of its line items (`price * quantity`).
--
-- The report should list the `order_id`, the incorrect `total_amount`
-- from the `orders` table, and the correctly calculated sum, which you
-- should alias as `calculated_revenue`.
--
-- NOTE: This query's result depends on the state of the data defined
-- by the V5__final_audit_setup.sql migration.
-- =============================================================================
*/

-- Solution Query:
SELECT
    o.order_id,
    o.total_amount,
    SUM(p.price * oi.quantity) AS calculated_revenue
FROM
    orders AS o
INNER JOIN
    order_items AS oi ON o.order_id = oi.order_id
INNER JOIN
    products AS p ON oi.product_id = p.product_id
GROUP BY
    o.order_id, o.total_amount
HAVING
    SUM(p.price * oi.quantity) != o.total_amount;