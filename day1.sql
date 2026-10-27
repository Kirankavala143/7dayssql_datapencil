create database sql7challenge;
use sq17challenge;

CREATE DATABASE IF NOT EXISTS sql7challenge;
USE sql7challenge;

SHOW TABLES;


 -- 1 .customers
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50),
    signup_date DATE,
    segment VARCHAR(20)
);

-- 2. products
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(40),
    category VARCHAR(40),
    price DECIMAL(10,2),
    cost DECIMAL(10,2)
);

-- 3. orders
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    status VARCHAR(20),
    channel VARCHAR(20),
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

-- 4.order_items
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);

-- 5.payments
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT UNIQUE,
    payment_method VARCHAR(50),
    payment_status VARCHAR(50),
    amount DECIMAL(10,2),

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);

-- 6.deliveries
CREATE TABLE deliveries (
    delivery_id INT PRIMARY KEY,
    order_id INT UNIQUE,
    dispatch_date DATE,
    delivery_date DATE NULL,
    delivery_status VARCHAR(50),

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);

USE sql7challenge;

SELECT COUNT(*) AS total_orders
FROM orders;

SELECT order_id
FROM orders
LIMIT 10;

