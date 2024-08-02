select * from orders

-- From the following table, write a  SQL query to calculate total purchase amount of all orders.
-- Return total purchase amount.

-- Create the table
CREATE TABLE od (
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(10, 2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT
);

-- Insert values into the table
INSERT INTO od (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES
(1, 1500.00, '2023-01-01', 101, 501),
(2, 2500.00, '2023-01-05', 102, 502),
(3, 3000.00, '2023-01-10', 103, 503),
(4, 2000.00, '2023-01-07',104,504);

select * from od
select sum(purch_amt) from od;

--From the following table, write a  SQL query to calculate the average purchase amount of all orders. 
--Return average purchase amount. 
select avg(purch_amt) from od;

--From the following table, write a  SQL query that counts the number of unique salespeople.
--Return number of salespeople.  

select count( DISTINCT salesman_id) from od;

--From the following table, write a  SQL query to count the number of customers. Return number of customers.

select * from customer
-- Create the table cust
CREATE TABLE cust (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(100),
    city VARCHAR(100),
    grade INT,
    salesman_id INT
);

-- Insert values into the table, leaving one column in grade as null
INSERT INTO cust (customer_id, cust_name, city, grade, salesman_id) VALUES
(1, 'John Doe', 'New York', 10, 101),
(2, 'Jane Smith', 'Los Angeles', 20, 102),
(3, 'Alice Johnson', 'Chicago', NULL, 103),
(4, 'Bob Brown', 'Houston', 30, 104),
(5, 'Charlie Davis', 'Phoenix', NULL, 105);

select count(*) from cust;
select * from cust;

-- From the following table, write a  SQL query to determine the number of customers who received at least one grade for their activity.  
select count(grade) from cust

--From the following table, write a  SQL query to find the maximum purchase amount.  

select max(purch_amt) from od

--. From the following table, write a  SQL query to find the minimum purchase amount. 
select min(purch_amt) from od

--From the following table, write a  SQL query to find the highest grade of the customers in each city. Return city, maximum grade.  
select * from customer

select city,max(grade) as max_grade
from customer
group by city;

--From the following table, write a  SQL query to find the highest purchase amount ordered by each customer. 
--Return customer ID, maximum purchase amount. 

select * from od

select customer_id, MAX(purch_amt) as max_purchase
from od
group by customer_id;

--From the following table, write a  SQL query to find the highest purchase amount ordered by each customer on a particular date. 
--Return, order date and highest purchase amount.

select customer_id, ord_date,MAX(purch_amt) as max_purchase
from od
group by customer_id,ord_date;

--From the following table, write a  SQL query to determine the highest purchase amount made by each salesperson on '2012-08-17'.
--Return salesperson ID, purchase amount 

select salesman_id, ord_date, MAX(purch_amt) as max_purchase
from od
where ord_date='2023-01-05'
group by salesman_id,ord_date;


-- 12) From the following table, write a  SQL query to find the highest order (purchase) amount by each customer on a particular order date.
--Filter the result by highest order (purchase) amount above 2000.00. 
--Return customer id, order date and maximum purchase amount.
select customer_id,ord_date ,max(purch_amt) as max_purchase
from od
where purch_amt>2000
group by customer_id,ord_date ;

select customer_id,ord_date ,max(purch_amt) as max_purchase
from od
group by customer_id,ord_date 
having MAX(purch_amt)>2000;

-- 13)From the following table, write a  SQL query to find the maximum order (purchase) amount in the range 2000 - 6000 (Begin and end values are included.) by combination of each customer and order date. -
--Return customer id, order date and maximum purchase amount.

select customer_id, ord_date,MAX(purch_amt) as max_purchase
from od
group by customer_id, ord_date
having MAX(purch_amt) BETWEEN 2000 and 6000;

-- 14)From the following table, write a  SQL query to find the maximum order (purchase) amount based on 
--the combination of each customer and order date. Filter the rows for maximum order (purchase) 
--amount is either 2000, 3000, 5760, 6000.
-- Return customer id, order date and maximum purchase amount.

select * from od
select customer_id, ord_date, MAX(purch_amt) as max_amt
from od
group by customer_id, ord_date
having MAX(purch_amt) in (6000,2500,8000)

--15) From the following table, write a  SQL query to determine the maximum order amount for each customer. 
--The customer ID should be in the range 3002 and
--3007(Begin and end values are included.). Return customer id and maximum purchase amount.

select customer_id, MAX(purch_amt)
from od
group by customer_id
having customer_id BETWEEN 102 and 104 

--16)   From the following table, write a  SQL query to find the maximum order (purchase) amount for each customer. 
--The customer ID should be in the range 3002 and 3007(Begin and end values are included.).Filter the rows for-
-- maximum order (purchase) amount is higher than 1000. Return customer id and maximum purchase amount.

select customer_id,MAX(purch_amt) 
from od 
where customer_id BETWEEN 102 AND 104 
group by customer_id
having max(purch_amt)>2000;

--17) From the following table, write a  SQL query to determine the maximum order (purchase) amount
-- generated by each salesperson. Filter the rows for the salesperson ID is in the range 5003 and 5008
-- (Begin and end values are included.). Return salesperson id and maximum purchase amount.

select salesman_id,MAX(purch_amt) as max_purchase
from od
where salesman_id BETWEEN 502 and 504
group by salesman_id

--18)From the following table, write a  SQL query to count all the orders generated on '2012-08-17'. 
--Return number of orders.
select count(*) 
from od
where ord_date='2023-01-10';

--19) From the following table, write a SQL query to count the number of salespeople in a city.
-- Return number of salespeople.

select count(*) 
from  salesman
where city is NOT NULL

select * from salesman

--20)From the following table, write a SQL query to count the number of orders based on the combination of each
-- order date and salesperson. Return order date, salesperson id. 

-- This query counts the number of orders for each combination of 'ord_date' and 'salesman_id' in the 'orders' table.
SELECT ord_date, salesman_id, COUNT(*)
-- Specifies the table from which to retrieve the data (in this case, 'orders').
FROM od
-- Groups the result set by the 'ord_date' and 'salesman_id' columns.
GROUP BY ord_date, salesman_id;


--21)From the following table, write a SQL query to calculate the average product price. Return average product price.

CREATE TABLE item_mas (
    PRO_ID INT,
    PRO_NAME VARCHAR(50),
    PRO_PRICE DECIMAL(10, 2),
    PRO_COM VARCHAR(50)
);

INSERT INTO item_mas (PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM) VALUES 
(1, 'Product A', 19.99, 20),
(2, 'Product B', 29.99,20),
(3, 'Product C', 39.99, 30),
(4, 'Product D', 49.99, 30);

select * from item_mas;

select AVG(PRO_PRICE) as avg_price 
from item_mas

--22)From the following table, write a  SQL query to count the number of products 
--whose price are higher than or equal to 350. Return number of products.

select count(PRO_NAME) 
from item_mas 
where PRO_PRICE >=29.99

--23) From the following table, write a SQL query to compute the average 
--price for unique companies. Return average price and company id.

select PRO_COM as company_id,avg(PRO_PRICE) as avg_price
from item_mas
group by PRO_COM;

--24)From the following table, write a  SQL query to compute the sum of the allotment
--amount of all departments.Return sum of the allotment amount.

CREATE TABLE emp_department (
    DPT_CODE INT,
    DPT_NAME VARCHAR(50),
    DPT_ALLOTMENT DECIMAL(10, 2)
);

INSERT INTO emp_department (DPT_CODE, DPT_NAME, DPT_ALLOTMENT) VALUES 
(101, 'Human Resources', 50000.00),
(102, 'Finance', 75000.00),
(103, 'IT', 120000.00),
(104, 'Marketing', 60000.00);

select * from emp_department
select DPT_NAME,sum(DPT_ALLOTMENT) 
from emp_department
group by DPT_NAME;

select sum(DPT_ALLOTMENT)
FROM emp_department

--From the following table, write a SQL query to count the number of employees in each department.-
-- Return department code and number of employee

select * from employees
CREATE TABLE emp_detail (
    EMP_IDNO INT,
    EMP_FNAME VARCHAR(50),
    EMP_LNAME VARCHAR(50),
    EMP_DEPT VARCHAR(50)
);

INSERT INTO emp_detail (EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT) VALUES 
(1, 'John', 'Doe', 'Human Resources'),
(2, 'Jane', 'Smith', 'Finance'),
(3, 'Robert', 'Johnson', 'IT'),
(4, 'Emily', 'Davis', 'Marketing');

select * from emp_detail

select EMP_DEPT, count(*)
from emp_detail
group by EMP_DEPT







