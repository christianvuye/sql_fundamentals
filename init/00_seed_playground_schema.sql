-- SQL Practice Assistant Database Script
-- Dialect: PostgreSQL

-- Drop tables if they exist to allow for a clean re-run
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS employee_locations;
DROP TABLE IF EXISTS sales_records;

-- ---------------------------------
-- customers Table
-- ---------------------------------
CREATE TABLE customers (
    customer_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(2)
);

INSERT INTO customers (customer_id, first_name, last_name, city, state) VALUES
(1, 'John', 'Doe', 'New York', 'NY'),
(2, 'Jane', 'Smith', 'Los Angeles', 'CA'),
(3, 'Alice', 'Johnson', 'Chicago', 'IL'),
(4, 'Robert', 'Brown', 'Houston', 'TX'),
(5, 'Emily', 'Jones', 'Phoenix', 'AZ'),
(6, 'Michael', 'Garcia', 'Philadelphia', 'PA'),
(7, 'Sarah', 'Miller', 'San Antonio', 'TX'),
(8, 'David', 'Wilson', 'San Diego', 'CA'),
(9, 'Laura', 'Moore', 'Dallas', 'TX'),
(10, 'James', 'Taylor', 'San Jose', 'CA'),
(11, 'Linda', 'Anderson', 'Austin', 'TX'),
(12, 'Richard', 'Thomas', 'Jacksonville', 'FL');

-- ---------------------------------
-- employees Table
-- ---------------------------------
CREATE TABLE employees (
    employee_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO employees (employee_id, first_name, last_name, department, salary) VALUES
(1, 'Emma', 'Clark', 'Sales', 60000),
(2, 'Liam', 'Rodriguez', 'Marketing', 82000),
(3, 'Olivia', 'Martinez', 'Sales', 71000),
(4, 'Noah', 'Hernandez', 'Engineering', 95000),
(5, 'Ava', 'Lopez', 'Sales', 78000),
(6, 'William', 'Gonzalez', 'Engineering', 110000),
(7, 'Sophia', 'Perez', 'Marketing', 68000),
(8, 'James', 'Sanchez', 'Sales', 88000);

-- ---------------------------------
-- products Table
-- ---------------------------------
CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(50),
    price DECIMAL(10, 2)
);

INSERT INTO products (product_id, product_name, price) VALUES
(1, 'Quantum Laptop', 1200.00),
(2, 'Nebula Mouse', 25.50),
(3, 'Stellar Keyboard', 75.00),
(4, 'Galaxy Monitor', 300.25),
(5, 'Orbit Docking Station', 150.00);

-- ---------------------------------
-- orders Table (Corrected Version)
-- ---------------------------------
CREATE TABLE orders (
    order_id INT,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2)
);

INSERT INTO orders (order_id, customer_id, order_date, total_amount) VALUES
(101, 1, '2025-05-10', 1275.00),
(102, 1, '2025-04-20', 51.00),
(103, 2, '2025-05-05', 300.25),
(104, 3, '2025-05-12', 175.50),
(105, 4, '2025-05-15', 75.00),
(106, 5, '2025-05-01', 1200.00),
(107, 5, '2025-05-20', 600.50),
(108, 6, '2025-04-28', 55.60),
(109, 7, '2025-05-07', 85.00),
(110, 8, '2025-05-09', 210.00),
(111, 8, '2025-05-18', 45.00),
(112, 9, '2025-04-25', 620.00),
(113, 10, '2025-05-11', 90.25),
(114, 11, '2025-05-03', 135.00),
(115, 12, '2025-05-22', 70.00);

-- ---------------------------------
-- order_items Table
-- ---------------------------------
CREATE TABLE order_items (
    order_item_id INT,
    order_id INT,
    product_id INT,
    quantity INT
);

INSERT INTO order_items (order_item_id, order_id, product_id, quantity) VALUES
(1, 101, 1, 1),
(2, 101, 3, 1),
(3, 102, 2, 2),
(4, 103, 4, 1),
(5, 104, 2, 1),
(6, 104, 5, 1),
(7, 105, 3, 1),
(8, 106, 1, 1),
(9, 107, 4, 2);

-- ---------------------------------
-- employee_locations Table
-- ---------------------------------
CREATE TABLE employee_locations (
    employee_id INT,
    city VARCHAR(50),
    is_primary BOOLEAN
);

INSERT INTO employee_locations (employee_id, city, is_primary) VALUES
(1, 'New York', TRUE),
(1, 'Boston', FALSE),
(2, 'Los Angeles', TRUE),
(3, 'New York', TRUE),
(4, 'Chicago', TRUE),
(5, 'Los Angeles', FALSE),
(5, 'San Francisco', TRUE);

-- ---------------------------------
-- sales_records Table
-- ---------------------------------
CREATE TABLE sales_records (
    order_id INT,
    employee_id INT
);

INSERT INTO sales_records (order_id, employee_id) VALUES
(101, 1),
(102, 3),
(103, 1),
(104, 5),
(105, 8),
(106, 1),
(107, 5),
(108, 3),
(109, 8),
(110, 1),
(111, 5),
(112, 8),
(113, 1),
(114, 3),
(115, 3);