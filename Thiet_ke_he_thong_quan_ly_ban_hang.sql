-- 1. Tạo Database
CREATE DATABASE "SalesDB";

-- Kết nối vào SalesDB trước khi chạy các lệnh sau:

-- 2. Tạo Schema
CREATE SCHEMA sales;

-- 3. Tạo các bảng
CREATE TABLE sales.customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email TEXT NOT NULL UNIQUE ,
    phone TEXT
);

CREATE TABLE sales.products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price FLOAT NOT NULL ,
    stock_quantity INT NOT NULL
);

CREATE TABLE sales.orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES sales.customers(customer_id),
    order_date DATE NOT NULL
);

CREATE TABLE sales.orderitems (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES sales.orders(order_id),
    product_id INT REFERENCES sales.products(product_id),
    quantity INT CHECK (quantity >= 1)
);
