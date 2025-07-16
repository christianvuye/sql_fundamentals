CREATE VIEW customer_highest_lifetime_spend AS
  SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(o.total_amount) AS total_spend
  FROM customers AS c
  JOIN orders    AS o USING (customer_id)
  GROUP BY c.customer_id, c.first_name, c.last_name
  ORDER BY total_spend DESC
  LIMIT 1;