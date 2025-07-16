/*
-- =============================================================================
-- SQL Practice Exercise: Tier 4, Question 10
--
-- Prompt:
-- The company wants to award a bonus to the employee who sold a 'Quantum
-- Laptop' to our single most valuable customer. "Most valuable customer" is
-- defined as the customer with the highest total lifetime spend.
--
-- The final report should show the full name of the employee (or employees)
-- who gets the bonus.
--
-- NOTE: This solution depends on the successful implementation of the
-- V6_create_quantum_laptop_order_view.sql migration, which creates the
-- `customer_highest_lifetime_spend` view used below.
-- =============================================================================
*/

-- Step 1: Create a VIEW to identify the single most valuable customer.
-- This migration should be saved as V7_create_vip_customer_view.sql (example name)
CREATE OR REPLACE VIEW customer_highest_lifetime_spend AS
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    ORDER BY SUM(total_amount) DESC
    LIMIT 1;


-- Step 2: Final query to find the employee who sold a laptop to the VIP customer.
-- This query joins the VIP customer view with the sales and product data to
-- find the specific employee who handled the qualifying transaction.
SELECT
    e.first_name,
    e.last_name
FROM
    customer_highest_lifetime_spend AS chls
INNER JOIN
    orders AS o ON chls.customer_id = o.customer_id
INNER JOIN
    sales_records AS sr ON o.order_id = sr.order_id
INNER JOIN
    employees AS e ON sr.employee_id = e.employee_id
INNER JOIN
    order_items AS oi ON o.order_id = oi.order_id
INNER JOIN
    products AS p ON oi.product_id = p.product_id
WHERE
    p.product_name ='Quantum Laptop';