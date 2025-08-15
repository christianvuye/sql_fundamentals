-- This single migration sets the orders table to a final state for the
-- Tier 4, Question 6 data integrity audit. It ensures some records have
-- an incorrect total_amount to be found by the audit query, while others
-- are correct. This script replaces all previous migrations for this exercise.

-- These orders will have INCORRECT totals for the audit to find.
UPDATE orders SET total_amount = 250.00 WHERE order_id = 101;
UPDATE orders SET total_amount = 75.50 WHERE order_id = 102;
UPDATE orders SET total_amount = 420.00 WHERE order_id = 103;
UPDATE orders SET total_amount = 950.00 WHERE order_id = 106;
UPDATE orders SET total_amount = 120.00 WHERE order_id = 107;
UPDATE orders SET total_amount = 210.00 WHERE order_id = 110;

-- These orders will have CORRECT totals and should NOT be found by the audit.
UPDATE orders SET total_amount = 175.50 WHERE order_id = 104;
UPDATE orders SET total_amount = 75.00 WHERE order_id = 105;
UPDATE orders SET total_amount = 51.00 WHERE order_id = 108;
UPDATE orders SET total_amount = 75.00 WHERE order_id = 109;
UPDATE orders SET total_amount = 25.50 WHERE order_id = 111;
UPDATE orders SET total_amount = 600.50 WHERE order_id = 112;
UPDATE orders SET total_amount = 150.00 WHERE order_id = 113;
UPDATE orders SET total_amount = 300.25 WHERE order_id = 114;
UPDATE orders SET total_amount = 150.00 WHERE order_id = 115;