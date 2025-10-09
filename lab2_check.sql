CREATE TABLE product (
	Product_id INT PRIMARY KEY,
	product_name VARCHAR(50) UNIQUE,
	price INT CHECK (price >0),
	quantity INT CHECK (quantity >=1)
);

CREATE TABLE orders (
	order_id INT PRIMARY KEY,
	Customer_name VARCHAR(50) ,
	city VARCHAR(50) DEfAULT 'Lahore'
);

INSERT INTO product (Product_id, product_name, price, quantity) VALUES
(1, 'Laptop', 120000, 5),
(2, 'Smartphone', 80000, 10),
(3, 'Headphones', 5000, 15);

INSERT INTO orders (order_id, Customer_name, city) VALUES
(101, 'Ali Raza', 'Lahore'),
(102, 'Sara Khan', 'Karachi'),
(103, 'Usman Tariq', DEFAULT); 

ALTER TABLE orders
ADD CONSTRAINT unique_customer_name UNIQUE (Customer_name);

ALTER TABLE orders
DROP CONSTRAINT unique_customer_name;
                                             
