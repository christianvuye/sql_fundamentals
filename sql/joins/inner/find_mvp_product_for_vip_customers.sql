/*
-- =============================================================================
-- SQL Practice Exercise: Tier 4, Question 1
--
-- Prompt:
-- The company is planning a new strategic initiative and wants to identify our
-- "Most Valuable Product" (MVP) for our "Very Important People" (VIP) customers.
--
-- This is a two-part problem:
-- 1. First, you must identify our 'VIP' customers. A VIP is defined as any
--    customer who has placed more than one order AND has a total lifetime
--    spend of over $250.
-- 2. Then, looking only at orders placed by this VIP customer group, find the
--    single product that has generated the most revenue (`price * quantity`).
--
-- The final report should contain only the name of this single MVP product.
-- =============================================================================
*/

-- Step 1: Query to identify the VIP Customers (IDs 1, 5, 8)
-- This query was used to find the list of customer_ids for the next step.
/*
SELECT
    customer_id,
    COUNT(order_id) AS nr_orders,
    SUM(total_amount) AS total_spent
FROM
    orders
GROUP BY
    customer_id
HAVING
    COUNT(order_id) > 1 AND SUM(total_amount) > 250.00;
*/


-- Step 2: Final query to find the top product sold to the VIP customers.
SELECT
    p.product_name
FROM
    products AS p
INNER JOIN
    order_items AS oi ON p.product_id = oi.product_id
INNER JOIN
    orders AS o ON oi.order_id = o.order_id
WHERE
    o.customer_id IN (1, 5, 8) -- List of VIPs from Step 1
GROUP BY
    p.product_name
ORDER BY
    SUM(p.price * oi.quantity) DESC
LIMIT 1;