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


INSERT INTO products (name, description, price, stock_quantity) VALUES
('Smartphone', 'Latest model smartphone with advanced features', 599.99, 100),
('Laptop', 'Lightweight and powerful laptop', 899.99, 50),
('Headphones', 'Wireless headphones with noise cancellation', 199.99, 200),
('Camera', 'High-resolution digital camera', 299.99, 30),
('Smartwatch', 'Waterproof smartwatch with fitness tracking', 199.99, 70),
('Tablet', '10-inch tablet with high-resolution screen', 499.99, 40),
('Wireless Charger', 'Fast charging wireless charger', 29.99, 150),
('Bluetooth Speaker', 'Portable Bluetooth speaker', 99.99, 60),
('External Hard Drive', '1TB USB external hard drive', 79.99, 80),
('Gaming Console', 'Latest gaming console with 4K support', 399.99, 45);

INSERT INTO customers (first_name, last_name, email, phone_number, address) VALUES
('John', 'Doe', 'john.doe@example.com', '123-456-7890', '123 Main St, Anytown'),
('Jane', 'Smith', 'jane.smith@example.com', '987-654-3210', '456 Elm St, Othertown'),
('Emily', 'Jones', 'emily.jones@example.com', '555-666-7777', '789 Oak St, Anothertown'),
('Michael', 'Brown', 'michael.brown@example.com', '111-222-3333', '321 Pine St, Sometown'),
('Sarah', 'Johnson', 'sarah.johnson@example.com', '222-333-4444', '654 Maple St, Yourtown'),
('James', 'Wilson', 'james.wilson@example.com', '333-444-5555', '987 Cedar St, Theirtown'),
('Patricia', 'Martinez', 'patricia.martinez@example.com', '444-555-6666', '159 Birch St, Webtown'),
('Robert', 'Garcia', 'robert.garcia@example.com', '555-666-7777', '369 Willow St, Blogtown'),
('Linda', 'Anderson', 'linda.anderson@example.com', '666-777-8888', '852 Poplar St, Pagetown'),
('David', 'Hernandez', 'david.hernandez@example.com', '777-888-9999', '741 Chestnut St, Sitetown');

-- Note: Adjust 'customer_id' as per existing customer data
INSERT INTO orders (customer_id, order_date, total_amount, status) VALUES
(1, NOW(), 599.99, 'Processing'),
(2, NOW(), 899.99, 'Shipped'),
(3, NOW(), 199.99, 'Delivered'),
(4, NOW(), 299.99, 'Processing'),
(5, NOW(), 199.99, 'Delivered'),
(1, NOW(), 499.99, 'Cancelled'),
(2, NOW(), 29.99, 'Shipped'),
(3, NOW(), 99.99, 'Processing'),
(4, NOW(), 79.99, 'Delivered'),
(5, NOW(), 399.99, 'Shipped');

-- Note: Ensure 'order_id' and 'product_id' match existing records
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 599.99),
(2, 2, 1, 899.99),
(3, 3, 2, 199.99),
(4, 4, 1, 299.99),
(5, 5, 1, 199.99),
(6, 6, 1, 499.99),
(7, 7, 3, 29.99),
(8, 8, 1, 99.99),
(9, 9, 1, 79.99),
(10, 10, 1, 399.99);

-- Note: Adjust 'order_id' to match existing orders
INSERT INTO payment_details (order_id, payment_date, amount, payment_method) VALUES
(1, NOW(), 599.99, 'Credit Card'),
(2, NOW(), 899.99, 'PayPal'),
(3, NOW(), 399.98, 'Debit Card'),
(4, NOW(), 299.99, 'Credit Card'),
(5, NOW(), 199.99, 'PayPal'),
(6, NOW(), 499.99, 'Debit Card'),
(7, NOW(), 89.97, 'Credit Card'),
(8, NOW(), 99.99, 'PayPal'),
(9, NOW(), 79.99, 'Debit Card'),
(10, NOW(), 399.99, 'Credit Card');

INSERT INTO products (name, description, price, stock_quantity) VALUES
('E-Reader', 'Compact electronic book reader', 129.99, 80),
('Fitness Tracker', 'Wearable fitness activity tracker', 59.99, 150),
('Digital Camera', 'Compact digital camera with zoom lens', 299.99, 40),
('Gaming Mouse', 'Ergonomic gaming mouse with customizable buttons', 49.99, 100),
('Keyboard', 'Mechanical keyboard with backlit keys', 89.99, 75),
('Webcam', 'High-definition webcam', 69.99, 85),
('Smart TV', '4K Ultra HD Smart TV', 999.99, 30),
('Router', 'High-speed wireless router', 119.99, 55),
('Drone', 'Quadcopter drone with camera', 349.99, 25),
('VR Headset', 'Virtual reality headset for immersive experiences', 399.99, 40);


INSERT INTO customers (first_name, last_name, email, phone_number, address) VALUES
('Alice', 'Wright', 'alice.wright@example.com', '888-777-6666', '200 Sunset Blvd, Sunville'),
('Brian', 'Taylor', 'brian.taylor@example.com', '777-666-5555', '300 Moon St, Moonville'),
('Catherine', 'Evans', 'catherine.evans@example.com', '666-555-4444', '400 Star Rd, Starville'),
('Derek', 'Adams', 'derek.adams@example.com', '555-444-3333', '500 Sky Ave, Skytown'),
('Evelyn', 'Baker', 'evelyn.baker@example.com', '444-333-2222', '600 Ocean Dr, Oceantown'),
('Frank', 'Clark', 'frank.clark@example.com', '333-222-1111', '700 Mountain Ln, Mountaintown'),
('Grace', 'Edwards', 'grace.edwards@example.com', '222-111-0000', '800 Forest Ct, Forestville'),
('Henry', 'Fisher', 'henry.fisher@example.com', '111-000-9999', '900 River St, Rivertown'),
('Isabel', 'Gibson', 'isabel.gibson@example.com', '000-999-8888', '1000 Lake Rd, Lakeville'),
('Jack', 'Harris', 'jack.harris@example.com', '999-888-7777', '1100 Hill St, Hilltown');


-- Note: Adjust 'customer_id' as per existing customer data
INSERT INTO orders (customer_id, order_date, total_amount, status) VALUES
(6, NOW(), 129.99, 'Processing'),
(7, NOW(), 59.99, 'Shipped'),
(8, NOW(), 299.99, 'Delivered'),
(9, NOW(), 49.99, 'Processing'),
(10, NOW(), 89.99, 'Delivered'),
(6, NOW(), 69.99, 'Cancelled'),
(7, NOW(), 999.99, 'Shipped'),
(8, NOW(), 119.99, 'Processing'),
(9, NOW(), 349.99, 'Delivered'),
(10, NOW(), 399.99, 'Shipped');


-- Note: Ensure 'order_id' and 'product_id' match existing records
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(11, 11, 1, 129.99),
(12, 12, 1, 59.99),
(13, 13, 1, 299.99),
(14, 14, 1, 49.99),
(15, 15, 1, 89.99),
(16, 16, 1, 69.99),
(17, 17, 1, 999.99),
(18, 18, 1, 119.99),
(19, 19, 1, 349.99),
(20, 20, 1, 399.99);


-- Note: Adjust 'order_id' to match existing orders
INSERT INTO payment_details (order_id, payment_date, amount, payment_method) VALUES
(11, NOW(), 129.99, 'Credit Card'),
(12, NOW(), 59.99, 'PayPal'),
(13, NOW(), 299.99, 'Debit Card'),
(14, NOW(), 49.99, 'Credit Card'),
(15, NOW(), 89.99, 'PayPal'),
(16, NOW(), 69.99, 'Debit Card'),
(17, NOW(), 999.99, 'Credit Card'),
(18, NOW(), 119.99, 'PayPal'),
(19, NOW(), 349.99, 'Debit Card'),
(20, NOW(), 399.99, 'Credit Card');


