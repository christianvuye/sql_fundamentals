/*
-- =============================================================================
-- SQL Practice Exercise: Tier 4, Question 7
--
-- Prompt:
-- The marketing team wants to analyze product purchase affinity... which product
-- is most often purchased in the same order as a 'Quantum Laptop'.
--
-- NOTE: This solution depends on the successful implementation of the
-- V6_create_quantum_laptop_order_view.sql migration, which creates the
-- `quantum_laptop_orders` view used below.
-- =============================================================================
*/

-- Step 2: Final query to find the most frequent co-purchased item.
-- This query joins the view with the order_items and products tables to find
-- all items in the target orders, filters out the laptop itself,
-- and then groups, counts, and ranks the remaining products.
SELECT
    p.product_name
FROM
    quantum_laptop_orders AS qlo
INNER JOIN
    order_items AS oi ON qlo.order_id = oi.order_id
INNER JOIN
    products AS p ON oi.product_id = p.product_id
WHERE
    p.product_name != 'Quantum Laptop'
GROUP BY
    p.product_id,
    p.product_name
ORDER BY
    COUNT(p.product_id) DESC
LIMIT 1;