CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    order_date DATE,
    region VARCHAR(20)
);

-- Insert sample records
INSERT INTO Orders (order_id, customer_id, product_id, quantity, price, order_date, region)
VALUES
(1, 101, 501, 10, 1200.00, '2024-01-05', 'East'),
(2, 102, 502, 3, 800.00,  '2024-02-10', 'West'),
(3, 103, 501, 7, 1500.00, '2024-03-15', 'North'),
(4, 101, 503, 2, 500.00,  '2024-04-12', 'East'),
(5, 104, 504, 5, 950.00,  '2024-05-22', 'South'),
(6, 105, 505, 8, 400.00,  '2024-06-18', 'West'),
(7, 106, 506, 6, 700.00,  '2024-07-05', 'East'),
(8, 107, 501, 12, 1100.00,'2024-08-09', 'South'),
(9, 102, 507, 15, 600.00, '2024-09-13', 'West'),
(10,108, 504, 4, 500.00,  '2024-10-21', 'North'),
(11,101, 505, 9, 1200.00, '2024-11-30', 'East'),
(12,103, 506, 10, 1500.00,'2024-12-12', 'North'),
(13,104, 507, 7, 900.00,  '2025-01-08', 'South'),
(14,105, 502, 2, 300.00,  '2025-02-14', 'West'),
(15,106, 501, 5, 1300.00, '2025-03-25', 'East');

----------------------------------------------------------------------------------------------
-- Total quantity per customer in East region
SELECT customer_id, SUM(quantity) AS "Total Quantity Per Customer"
FROM Orders
WHERE region = 'East'
GROUP BY customer_id;

-- Total sales per region after 2024-01-01
SELECT region, SUM(quantity * price) AS "Total Sales Per Region"
FROM Orders
WHERE order_date > '2024-01-01'
GROUP BY region;

-- Number of qualifying orders per customer (quantity > 5)
SELECT customer_id, COUNT(order_id) AS "Total Orders Per Customer"
FROM Orders
WHERE quantity > 5
GROUP BY customer_id;

-- Average price per product (only for orders with quantity > 10)
SELECT product_id, AVG(price) AS "Average Price Per Product"
FROM Orders
WHERE quantity > 10
GROUP BY product_id;

-- Total sales per customer (only for orders with price > 500)
SELECT customer_id, SUM(quantity * price) AS "Total Sales Per Customer"
FROM Orders
WHERE price > 500
GROUP BY customer_id;

-- Total quantity per region (excluding North)
SELECT region, SUM(quantity) AS "Total Quantity Per Region"
FROM Orders
WHERE region != 'North'
GROUP BY region;

-- Number of orders per customer in 2024
SELECT customer_id, COUNT(order_id) AS "Total Orders Per Customer in 2024"
FROM Orders
WHERE order_date BETWEEN '2024-01-01' AND '2024-12-30'
GROUP BY customer_id;

-- Total sales per product (only for orders with price < 1000)
SELECT product_id, SUM(quantity * price) AS "Total Sales Per Product"
FROM Orders
WHERE price < 1000
GROUP BY product_id;

-- Total quantity per region (only for orders with quantity >= 3)
SELECT region, SUM(quantity) AS "Total Quantity Per Region"
FROM Orders
WHERE quantity >= 3
GROUP BY region;

-- Total sales per customer in South region
SELECT customer_id, SUM(quantity * price) AS "Total Sales Per Customer in South"
FROM Orders
WHERE region = 'South'
GROUP BY customer_id;

----------------------------------------------------------------------------------------------
-- 1. Show each customer's total sales and only those above 15,000
SELECT customer_id, SUM(quantity * price) AS "Total Sales Per Customer"
FROM Orders
GROUP BY customer_id
HAVING SUM(quantity * price) > 15000;

-- 2. Find each product's average price and only those above 1,000
SELECT product_id, AVG(price) AS "Average Price Per Product"
FROM Orders
GROUP BY product_id
HAVING AVG(price) > 1000;

-- 3. List each region's total quantity ordered and only those above 300
SELECT region, SUM(quantity) AS "Total Quantity Per Region"
FROM Orders
GROUP BY region
HAVING SUM(quantity) > 300;

-- 4. Display number of orders per customer and only those with more than 5 orders
SELECT customer_id, COUNT(order_id) AS "Total Orders Per Customer"
FROM Orders
GROUP BY customer_id
HAVING COUNT(order_id) > 5;

-- 5. Find total revenue per product and only those between 10,000 and 25,000
SELECT product_id, SUM(quantity * price) AS "Total Revenue Per Product"
FROM Orders
GROUP BY product_id
HAVING SUM(quantity * price) BETWEEN 10000 AND 25000;

-- 6. Show each region's average sales (quantity * price) and only those above 5,000
SELECT region, AVG(quantity * price) AS "AVG Sales Per Region"
FROM Orders
GROUP BY region
HAVING AVG(quantity * price) > 5000;

-- 7. Display total quantity sold per customer and only those with quantity >= 100
SELECT customer_id, SUM(quantity) AS "Total Quantity Per Customer"
FROM Orders
GROUP BY customer_id
HAVING SUM(quantity) >= 100;

-- 8. Find total sales per customer and only those below 8,000
SELECT customer_id, SUM(quantity * price) AS "Total Sales Per Customer"
FROM Orders
GROUP BY customer_id
HAVING SUM(quantity * price) < 8000;

-- 9. Display average quantity per product and only those above 10
SELECT product_id, AVG(quantity) AS "Average Quantity Per Product"
FROM Orders
GROUP BY product_id
HAVING AVG(quantity) > 10;

-- 10. List total customers per region and only those regions with more than 2 customers
SELECT region, COUNT(order_id) AS "Total Customers Per Region" 
FROM Orders 
GROUP BY region 
HAVING COUNT(customer_id) > 2; 

----------------------------------------------------------------------------------------------
-- 1️ Total Sales per Customer (East Region, Sales > $10,000)
SELECT customer_id, SUM(quantity * price) AS TotalSales
FROM Orders
WHERE region = 'East'
GROUP BY customer_id
HAVING SUM(quantity * price) > 10000;

-- 2️ Total Quantity per Product (Price > $500, Quantity > 200)
SELECT product_id, SUM(quantity) AS TotalQuantity
FROM Orders
WHERE price > 500
GROUP BY product_id
HAVING SUM(quantity) > 200;

-- 3️ Regional Total Sales (After 2024-01-01, Sales > $25,000)
SELECT region, SUM(quantity * price) AS TotalSales
FROM Orders
WHERE order_date > '2024-01-01'
GROUP BY region
HAVING SUM(quantity * price) > 25000;

-- 4️ Number of Orders per Customer (Quantity > 2, Orders > 5)
SELECT customer_id, COUNT(order_id) AS NumOrders
FROM Orders
WHERE quantity > 2
GROUP BY customer_id
HAVING COUNT(order_id) > 5;

-- 5️ Average Price per Product (North Region, Avg > $1,000)
SELECT product_id, AVG(price) AS AvgPrice
FROM Orders
WHERE region = 'North'
GROUP BY product_id
HAVING AVG(price) > 1000;

-- 6️ Customer Total Sales (Quantity = 5, Sales Between $15,000–$30,000)
SELECT customer_id, SUM(quantity * price) AS TotalSales
FROM Orders
WHERE quantity = 5
GROUP BY customer_id
HAVING SUM(quantity * price) BETWEEN 15000 AND 30000;

-- 7️ Total Quantity per Region (Price = $700, Quantity > 500)
SELECT region, SUM(quantity) AS TotalQuantity
FROM Orders
WHERE price = 700
GROUP BY region
HAVING SUM(quantity) > 500;

-- 8️ Product Sales (Between June–Dec 2024, Sales > $20,000)
SELECT product_id, SUM(quantity * price) AS TotalSales
FROM Orders
WHERE order_date BETWEEN '2024-06-01' AND '2024-12-31'
GROUP BY product_id
HAVING SUM(quantity * price) > 20000;

-- 9️ Number of Orders per Customer (South Region, Orders > 3)
SELECT customer_id, COUNT(order_id) AS NumOrders
FROM Orders
WHERE region = 'South'
GROUP BY customer_id
HAVING COUNT(order_id) > 3;

-- Product Quantity and Average (Price = $100, Avg Quantity > 10)
SELECT product_id, SUM(quantity) AS TotalQuantity
FROM Orders
WHERE price > 100
GROUP BY product_id
HAVING AVG(quantity) > 10;


