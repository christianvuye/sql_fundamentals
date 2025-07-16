CREATE VIEW quantum_laptop_order AS
SELECT order_id
FROM order_items AS oi
INNER JOIN products AS p
  USING (product_id)
WHERE product_name = 'Quantum Laptop';