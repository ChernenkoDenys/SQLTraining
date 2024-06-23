CREATE TABLE Customers (
	id SERIAL PRIMARY KEY,
	full_name varchar(100),
	email varchar(155)
);

CREATE TABLE Products (
	id SERIAL PRIMARY KEY,
	full_name varchar(100),
	price numeric
);

CREATE TABLE Orders (
	id SERIAL PRIMARY KEY,
	customer_id integer,
	FOREIGN KEY (customer_id) REFERENCES Customers(id),
	product_id integer,
	FOREIGN KEY (product_id) REFERENCES Products(id),
	order_date date,
	quantity integer
);

CREATE TABLE Suppliers (
	id SERIAL PRIMARY KEY,
	full_name varchar(100),
	contact_name varchar(100)
);

CREATE TABLE ProductSuppliers (
	id SERIAL PRIMARY KEY,
	product_id integer,
	FOREIGN KEY (product_id) REFERENCES Products(id),
	supplier_id integer,
	FOREIGN KEY (supplier_id) REFERENCES Suppliers(id),
	suplly_date date
);



INSERT INTO Customers (full_name, email) VALUES
('John Doe', 'john.doe@gmail.com'),
('Jane Smith', 'jane.smith@gmail.com'),
('Alice Johnson', 'alice.johnson@gmail.com');




INSERT INTO Products (full_name, price) VALUES
('Laptop', 999.99),
('Smartphone', 499.99),
('Headphones', 89.99);




INSERT INTO Orders (customer_id, product_id, order_date, quantity) VALUES
(1, 1, '2023-06-01', 1),
(2, 2, '2023-06-02', 2),
(3, 3, '2023-06-03', 3);




INSERT INTO Suppliers (full_name, contact_name) VALUES
('Denys Chernenko', 'Vlad Ushakov');


INSERT INTO ProductSuppliers (product_id, supplier_id, suplly_date) VALUES
(1, 4, '2023-05-03');



SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM Suppliers;
SELECT * FROM ProductSuppliers;




-- Zero Task

SELECT full_name, price FROM Products;


SELECT full_name, email FROM Customers
WHERE email LIKE '%gmail.com';


SELECT COUNT(*) FROM Orders;


SELECT COUNT(*) from Orders
WHERE customer_id = 1;


SELECT full_name, price FROM Products
WHERE price BETWEEN 10 AND 100;



-- First Task Filtration 
SELECT full_name FROM Products WHERE price > 500;

SELECT Products.full_name, Products.price FROM Products
JOIN ProductSuppliers ON Products.id = ProductSuppliers.product_id
WHERE suplly_date > '2024-01-01';



SELECT Products.full_name, Products.price FROM Products
JOIN Orders ON Products.id = Orders.product_id
WHERE quantity > 1;


SELECT full_name, contact_name FROM Suppliers
WHERE contact_name = 'Vlad Ushakov';



-- Second Task Aggregation

SELECT MAX(price) FROM Products;


SELECT AVG(price) FROM Products;


SELECT SUM(price * quantity) FROM Orders
JOIN Products ON Orders.product_id = Products.id;
WHERE customer_id = 1;

SELECT * FROM Orders 
WHERE customer_id = 1;











