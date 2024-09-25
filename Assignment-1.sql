-- Create the E_commerce database
CREATE DATABASE E_commerce;

-- Use the E_commerce database
USE E_commerce;

-- Create the Customers table
CREATE TABLE Customers (
    cst_id INT PRIMARY KEY,
    cst_name VARCHAR(50),
    cst_email VARCHAR(100),
    cst_city VARCHAR(50)
);

-- Insert data into the Customers table
INSERT INTO Customers (cst_id, cst_name, cst_email, cst_city)
VALUES (101, 'Karan Rajput', 'karan@gmail.com', 'Indore'),
       (102, 'Yashika Tomar', 'yashika@gmail.com', 'Pune'),
       (103, 'Nitin Rajawat', 'nitin@gmail.com', 'Ratlam'),
       (104, 'Siddharth Saxena', 'siddharth@gmail.com', 'Mumbai');

-- Create the Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    cst_id INT,
    total_amount INT,
    order_status VARCHAR(20),
    order_date DATE,
    FOREIGN KEY (cst_id) REFERENCES Customers(cst_id) 
);
-- Insert  data into the Orders table
INSERT INTO Orders (order_id, cst_id, total_amount, order_status, order_date)
VALUES (1, 101, 1000, 'Processing', '2024-08-01'),
       (2, 102, 400, 'Processing', '2024-09-03'),
       (3, 102, 199, 'Delivered', '2024-07-01'),
	 (4 , 103, 233, 'Processing', '2023-02-01'),
       (5, 104, 244, 'Delivered', '2023-02-02');

-- Create the Products table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price INT,
    returnable VARCHAR(3)
);

-- Insert sample data into the Products table
INSERT INTO Products (product_id, product_name, price, returnable)
VALUES (201, 'Smartphone', 15000, 'Yes'),
       (202, 'Laptop', 150000, 'No'),
       (203, 'Headphones', 2000, 'Yes'),
       (204, 'TV', 7000, 'Yes'),
       (205, 'Smartwatch', 3000, 'No');

-- Question 1: Check the status of your order
SELECT order_id, order_status 
FROM Orders 
WHERE cst_id = 101;
-- Answer : This will return the status of the orders for customer with id 101
-- | order_id | order_status |
-- |----------|--------------|
-- | 1        | Processing   |


-- Question 2: Find the total amount of your orders
SELECT SUM(total_amount) AS total_amount_of_order
FROM Orders 
WHERE cst_id = 102;
-- Answer :  This will return the total amount of orders for customer with id 102
-- | total_amount_of_order |
-- | 599                   |

-- Question 3: Update your city (corrected city column)
UPDATE Customers 
SET cst_city = 'Raipur' 
WHERE cst_id = 101;
-- Answer : This will update the city of customer 101 to 'Raipur'
-- | cst_id | cst_name     | cst_email        | cst_city |
-- | 101    | Karan Rajput | karan@gmail.com   | Raipur  |


-- Question 4: Display returnable products
SELECT product_id, product_name 
FROM Products 
WHERE returnable = 'Yes';
-- Answer :  This will display all products that are returnable| product_id | product_name |
-- |product_id  | product_name |
-- | 201        | Smartphone   |
-- | 203        | Headphones   |
-- | 204        | TV           |





       
    