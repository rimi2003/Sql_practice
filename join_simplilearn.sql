CREATE TABLE cricket (
    cricket_id INT PRIMARY KEY,
    name VARCHAR(100)
);

-- Insert values into the table
INSERT INTO cricket (cricket_id, name) VALUES (1, 'Sachin Tendulkar');
INSERT INTO cricket (cricket_id, name) VALUES (2, 'Virat Kohli');
INSERT INTO cricket (cricket_id, name) VALUES (3, 'Ricky Ponting');
INSERT INTO cricket (cricket_id, name) VALUES (4, 'Brian Lara');
INSERT INTO cricket (cricket_id, name) VALUES (5, 'Jacques Kallis');
INSERT INTO cricket (cricket_id, name) VALUES (6, 'AB de Villiers');
INSERT INTO cricket (cricket_id, name) VALUES (7, 'Steve Smith');
INSERT INTO cricket (cricket_id, name) VALUES (8, 'Kane Williamson');
INSERT INTO cricket (cricket_id, name) VALUES (9, 'Joe Root');
INSERT INTO cricket (cricket_id, name) VALUES (10, 'Rohit Sharma');

select * from cricket
CREATE TABLE football (
    football_id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO football (football_id, name) VALUES 
(1, 'Manchester United'),
(2, 'Liverpool'),
(3, 'Barcelona'),
(4, 'Real Madrid'),
(5, 'Bayern Munich');


select * from football;

select * from  cricket as c inner join football as f on c.cricket_id= f.football_id;
----
select c.cricket_id, c.name,f.football_id,f.name from cricket as c inner join football as f on c.cricket_id=f.football_id;

CREATE TABLE Players (
    player_id INT PRIMARY KEY,
    name VARCHAR(50),
    team_id INT,
);

-- Creating table 2: Teams
CREATE TABLE Teams (
    team_id INT PRIMARY KEY,
    team_name VARCHAR(50)
);

-- Inserting data into Teams table
INSERT INTO Teams (team_id, team_name) VALUES
(1, 'Manchester United'),
(2, 'Liverpool'),
(3, 'Barcelona');

-- Inserting data into Players table
INSERT INTO Players (player_id, name, team_id) VALUES
(1, 'Lionel Messi', 3),
(2, 'Cristiano Ronaldo', 1),
(3, 'Mohamed Salah', 2);

SELECT p.player_id,t.team_id,t.team_name
FROM players as p
INNER JOIN Teams as t ON p.team_id = t.team_id;

CREATE TABLE product (
    product_code INT PRIMARY KEY,
    product_name VARCHAR(100),
    product_line VARCHAR(50),
    product_sale DECIMAL(10,2),
    product_vendor VARCHAR(50),
    product_description TEXT,
    quantity_in_stock INT,
    buy_price DECIMAL(10,2),
    msrp DECIMAL(10,2)
);

-- Inserting sample values into the product table
INSERT INTO product (product_code, product_name, product_line, product_sale, product_vendor, product_description, quantity_in_stock, buy_price, msrp) VALUES
(1, 'Laptop', 'Electronics', 999.99, 'ABC Electronics', 'A powerful laptop for work and gaming.', 50, 799.99, 1099.99),
(2, 'Smartphone', 'Electronics', 599.99, 'XYZ Mobiles', 'High-end smartphone with advanced features.', 100, 499.99, 699.99),
(3, 'Chair', 'Furniture', 149.99, 'Comfort Furniture', 'Comfortable chair with ergonomic design.', 30, 129.99, 199.99),
(4, 'Desk', 'Furniture', 249.99, 'Office Furnishings', 'Spacious desk for office or home use.', 20, 199.99, 299.99),
(5, 'Bookshelf', 'Furniture', 179.99, 'Home Essentials', 'Stylish bookshelf for organizing books.', 25, 149.99, 229.99),
(6, 'Headphones', 'Electronics', 149.99, 'SoundTech', 'High-quality headphones for immersive audio experience.', 50, 129.99, 199.99);

select * from product;
----
CREATE TABLE product_line (
    line_id INT PRIMARY KEY,
    line_name VARCHAR(50),
    text_description TEXT,
    html_description TEXT
);

-- Inserting sample values into the product_line table
INSERT INTO product_line (line_id, line_name) VALUES
(1, 'Electronics'), 
(2, 'Furniture'),
(3, 'Clothing');

select * from product_line;

select product_code, product_name, line_id, line_name 
from product as p inner join product_line as pl
on p.product_code=pl.line_id


CREATE TABLE orders (
    order_number INT PRIMARY KEY,
    order_date DATE,
    required_date DATE,
    shipped_date DATE,
    status VARCHAR(50),
    comments TEXT,
    customer_number INT,
 )
-- Inserting sample values into the orders table
INSERT INTO orders (order_number, order_date, required_date, shipped_date, status, comments, customer_number) VALUES
(1001, '2024-05-01', '2024-05-10', '2024-05-05', 'Shipped', 'Customer requested expedited shipping.', 101),
(1002, '2024-05-02', '2024-05-12', '2024-05-07', 'Shipped', 'Order complete with all items.', 102),
(1003, '2024-05-03', '2024-05-15', NULL, 'Pending', 'Items are currently out of stock.', 103),
(1004, '2024-05-04', '2024-05-20', NULL, 'Pending', 'Customer requested a change in delivery address.', 101),
(1005, '2024-05-05', '2024-05-25', NULL, 'Pending', 'Payment for the order is pending.', 104),
(1006, '2024-05-06', '2024-05-30', NULL, 'Pending', NULL, 102);

select * from orders;

--------------
CREATE TABLE order_details (
    order_no INT,
    product_code INT,
    quantity_ordered INT,
    price_each DECIMAL(10, 2),
    order_line_number INT,
    PRIMARY KEY (order_no, order_line_number)
);

-- Inserting sample values into the order_details table
INSERT INTO order_details (order_no, product_code, quantity_ordered, price_each, order_line_number) VALUES
(1001, 1, 2, 999.99, 1),
(1001, 3, 4, 149.99, 2),
(1002, 2, 3, 599.99, 1),
(1003, 5, 1, 179.99, 1),
(1003, 4, 1, 249.99, 2),
(1003, 6, 2, 149.99, 3);

select * from order_details;
select * from orders;
------we want to calculate revenue generated by each product order and status of the produt

---------------left join---------
