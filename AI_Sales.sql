CREATE DATABASE sales_ai;
USE sales_ai;
CREATE TABLE customers (customer_id INT PRIMARY KEY,customer_name VARCHAR(100),region VARCHAR(50));
CREATE TABLE products (product_id INT PRIMARY KEY,product_name VARCHAR(100),category VARCHAR(50),price FLOAT);
CREATE TABLE orders (order_id INT PRIMARY KEY,customer_id INT,order_date DATE,FOREIGN KEY (customer_id) REFERENCES customers(customer_id));
CREATE TABLE order_details (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    sales FLOAT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers VALUES(1, 'Ravi', 'South'),(2, 'Amit', 'North'),(3, 'John', 'West'),(4, 'Sara', 'East');
INSERT INTO products VALUES(1, 'Laptop', 'Electronics', 50000),(2, 'Phone', 'Electronics', 20000),(3, 'Shoes', 'Fashion', 3000),(4, 'Watch', 'Accessories', 5000);
DELIMITER $$

CREATE PROCEDURE generate_orders()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 1000 DO
        INSERT INTO orders VALUES (
            i,
            FLOOR(1 + RAND()*4),
            DATE_ADD('2023-01-01', INTERVAL FLOOR(RAND()*365) DAY)
        );
        SET i = i + 1;
    END WHILE;
END $$

DELIMITER ;

CALL generate_orders();


DELIMITER $$

CREATE PROCEDURE generate_order_details()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 1000 DO
        INSERT INTO order_details VALUES (
            i,
            i,
            FLOOR(1 + RAND()*4),
            FLOOR(1 + RAND()*5),
            FLOOR(1000 + RAND()*50000)
        );
        SET i = i + 1;
    END WHILE;
END $$

DELIMITER ;

CALL generate_order_details();


SELECT 
o.order_id,
c.customer_name,
p.product_name,
od.quantity,
od.sales
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN order_details od ON o.order_id = od.order_id
INNER JOIN products p ON od.product_id = p.product_id;


SELECT 
c.customer_name,
o.order_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

SELECT 
p.product_name,
od.order_id
FROM order_details od
RIGHT JOIN products p ON od.product_id = p.product_id;


SELECT c.customer_name, o.order_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id

UNION

SELECT c.customer_name, o.order_id
FROM customers c
RIGHT JOIN orders o ON c.customer_id = o.customer_id;


SELECT 
YEAR(o.order_date) AS year,
MONTH(o.order_date) AS month,
SUM(od.sales) AS total_sales
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
GROUP BY year, month
ORDER BY year, month;

SELECT 
p.product_name,
SUM(od.sales) AS revenue
FROM order_details od
JOIN products p ON od.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC
LIMIT 5;


SELECT 
c.region,
SUM(od.sales) AS total_sales
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_details od ON o.order_id = od.order_id
GROUP BY c.region;


SELECT 
c.customer_name,
SUM(od.sales) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_details od ON o.order_id = od.order_id
GROUP BY c.customer_name
ORDER BY total_spent DESC;

SELECT 
c.customer_id,
COUNT(o.order_id) AS total_orders,
SUM(od.sales) AS total_spent,
AVG(od.sales) AS avg_order_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_details od ON o.order_id = od.order_id
GROUP BY c.customer_id;