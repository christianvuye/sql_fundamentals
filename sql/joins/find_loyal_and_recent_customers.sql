/*
-- =============================================================================
-- SQL Practice Exercise: Tier 3, Question 9
--
-- File generated on: Tuesday, July 15, 2025
--
-- Prompt:
-- The marketing team wants to send a thank-you gift to loyal customers who
-- have also been active recently. They need a report of customers who meet
-- two criteria:
-- 1. Their very first order was placed before May 1st, 2025.
-- 2. They also placed at least one order on or after May 15th, 2025.
--
-- The final report should show the customer's full name and the date of their
-- first-ever order.
-- =============================================================================
*/

-- Solution Query:
-- This query identifies customers by grouping their orders.
-- The HAVING clause then filters for groups that satisfy both time-based conditions:
-- an early adoption date (MIN) and a recent purchase date (MAX).

SELECT
    c.first_name,
    c.last_name,
    MIN(o.order_date) AS first_order_date
FROM
    customers AS c
INNER JOIN
    orders AS o ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id, -- Grouping by the primary key is most robust
    c.first_name,
    c.last_name
HAVING
    MIN(o.order_date) < '2025-05-01'
    AND MAX(o.order_date) >= '2025-05-15';