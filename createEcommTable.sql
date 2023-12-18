-- Drop the existing database if it exists
DROP DATABASE IF EXISTS `ECommerceStore`;

-- Create the new database for the e-commerce store
CREATE DATABASE `ECommerceStore`;
USE `ECommerceStore`;

-- Create table for product details
CREATE TABLE products (
  product_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(100),
  description TEXT,
  price DECIMAL(10, 2),
  stock_quantity INT,
  PRIMARY KEY (product_id)
);

-- Create table for customers
CREATE TABLE customers (
  customer_id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(100),
  phone_number VARCHAR(15),
  address TEXT,
  PRIMARY KEY (customer_id)
);

-- Create table for orders
CREATE TABLE orders (
  order_id INT NOT NULL AUTO_INCREMENT,
  customer_id INT NOT NULL,
  order_date DATETIME,
  total_amount DECIMAL(10, 2),
  status VARCHAR(50),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  PRIMARY KEY (order_id)
);

-- Create table for order items
CREATE TABLE order_items (
  order_item_id INT NOT NULL AUTO_INCREMENT,
  order_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT,
  price DECIMAL(10, 2),
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id),
  PRIMARY KEY (order_item_id)
);

-- Create table for payment details
CREATE TABLE payment_details (
  payment_id INT NOT NULL AUTO_INCREMENT,
  order_id INT NOT NULL,
  payment_date DATETIME,
  amount DECIMAL(10, 2),
  payment_method VARCHAR(50),
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  PRIMARY KEY (payment_id)
);
