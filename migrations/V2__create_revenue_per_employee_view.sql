create view revenue_per_employee(employee_id, total_revenue) as
SELECT e.employee_id,
       sum(p.price * oi.quantity::numeric) AS total_revenue
FROM employees e
         JOIN sales_records sr USING (employee_id)
         JOIN orders o USING (order_id)
         JOIN order_items oi USING (order_id)
         JOIN products p USING (product_id)
GROUP BY e.employee_id;

alter table revenue_per_employee
    owner to postgres;
