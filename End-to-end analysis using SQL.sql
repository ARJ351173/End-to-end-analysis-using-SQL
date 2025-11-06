CREATE DATABASE sales_analysis;
USE sales_analysis;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100),
    city VARCHAR(50),
    join_date DATE
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(30),
    price DECIMAL(10,2)
);


CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers VALUES
(1,'Amit','amit@gmail.com','Delhi','2023-02-10'),
(2,'Riya','riya@yahoo.com','Mumbai','2023-03-15'),
(3,'Karan','karan@gmail.com','Bangalore','2023-03-20'),
(4,'Neha','neha@outlook.com','Delhi','2023-04-02'),
(5,'Aryan','aryan@gmail.com','Chennai','2023-04-10'),
(6,'Simran','simran@gmail.com','Pune','2023-05-05'),
(7,'Aditya','aditya@yahoo.com','Delhi','2023-05-25'),
(8,'Tanya','tanya@gmail.com','Kolkata','2023-06-10'),
(9,'Rahul','rahul@gmail.com','Delhi','2023-06-18'),
(10,'Isha','isha@gmail.com','Mumbai','2023-07-01');

INSERT INTO products VALUES
(101,'Laptop','Electronics',65000),
(102,'Smartphone','Electronics',35000),
(103,'Headphones','Accessories',2000),
(104,'Tablet','Electronics',28000),
(105,'Smartwatch','Accessories',8000),
(106,'Shoes','Fashion',4000),
(107,'T-shirt','Fashion',1200),
(108,'Jeans','Fashion',2500),
(109,'Backpack','Accessories',1800),
(110,'Camera','Electronics',52000);

INSERT INTO orders VALUES
(201,1,101,1,'2023-03-12'),
(202,2,102,2,'2023-03-18'),
(203,3,103,3,'2023-03-21'),
(204,1,105,1,'2023-04-12'),
(205,4,104,1,'2023-04-22'),
(206,5,107,4,'2023-05-06'),
(207,6,106,2,'2023-05-10'),
(208,2,108,1,'2023-05-25'),
(209,7,101,1,'2023-06-01'),
(210,8,109,3,'2023-06-12'),
(211,9,110,1,'2023-06-20'),
(212,10,104,1,'2023-07-04'),
(213,1,102,1,'2023-07-08'),
(214,3,105,2,'2023-07-15'),
(215,2,107,2,'2023-07-22'),
(216,4,108,3,'2023-07-30'),
(217,5,109,2,'2023-08-02'),
(218,6,103,1,'2023-08-10'),
(219,8,110,1,'2023-08-12'),
(220,9,101,1,'2023-08-20');

SELECT customer_id, COUNT(*) 
FROM customers 
GROUP BY customer_id 
HAVING COUNT(*) > 1;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM customers
WHERE customer_id NOT IN (
    SELECT * FROM (
        SELECT MIN(customer_id)
        FROM customers
        GROUP BY email
    ) AS temp
);

SET SQL_SAFE_UPDATES = 1;

UPDATE customers SET city = 'Unknown' WHERE city IS NULL;

UPDATE customers SET city = UPPER(city);

DESCRIBE orders;

SELECT p.product_name, SUM(o.quantity) AS total_sold
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC;

SELECT c.name, SUM(p.price * o.quantity) AS total_spent
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id
GROUP BY c.name
ORDER BY total_spent DESC;

SELECT MONTH(order_date) AS month, SUM(p.price * o.quantity) AS total_sales
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY MONTH(order_date)
ORDER BY month;

SELECT AVG(p.price * o.quantity) AS avg_order_value
FROM orders o
JOIN products p ON o.product_id = p.product_id;

SELECT order_id, c.name, (p.price * o.quantity) AS order_value
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id
WHERE (p.price * o.quantity) > 50000;

