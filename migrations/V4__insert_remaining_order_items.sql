-- This migration adds the missing line items for the remaining orders
-- to ensure the data integrity audit can run against all orders.
INSERT INTO order_items (order_item_id, order_id, product_id, quantity) VALUES
(12, 109, 3, 1),    -- order_amount=85.00, calculated=75.00
(13, 110, 2, 1),    -- order_amount=210.00, calculated=25.50
(14, 111, 2, 1),    -- order_amount=45.00, calculated=25.50
(15, 113, 5, 1),    -- order_amount=90.25, calculated=150.00
(16, 114, 4, 1),    -- order_amount=135.00, calculated=300.25
(17, 115, 3, 2);    -- order_amount=70.00, calculated=150.00