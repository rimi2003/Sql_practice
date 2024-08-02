
CREATE TABLE employees (
    empid INT PRIMARY KEY,
    empname VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    date_of_joining DATE,
    department VARCHAR(50),
    city VARCHAR(50),
    salary DECIMAL(10, 2)
);

INSERT INTO employees (empid, empname, age, gender, date_of_joining, department, city, salary)
VALUES
    (1, 'John Doe', 30, 'Male', '2020-01-15', 'Engineering', 'New York', 70000.00),
    (2, 'Jane Smith', 28, 'Female', '2019-05-20', 'HR', 'Los Angeles', 60000.00),
    (3, 'Michael Johnson', 35, 'Male', '2018-11-10', 'Sales', 'Chicago', 75000.00),
    (4, 'Emily Brown', 32, 'Female', '2021-02-28', 'Engineering', 'New York', 80000.00),
    (5, 'David Williams', 40, 'Male', '2017-09-03', 'Finance', 'Chicago', 90000.00),
    (6, 'Sarah Wilson', 27, 'Female', '2022-03-12', 'HR', 'Los Angeles', 55000.00),
    (7, 'James Lee', 33, 'Male', '2016-07-18', 'Sales', 'Chicago', 72000.00),
    (8, 'Jessica Taylor', 29, 'Female', '2019-08-25', 'Engineering', 'New York', 75000.00),
    (9, 'Daniel Anderson', 31, 'Male', '2020-04-05', 'Finance', 'Chicago', 85000.00),
    (10, 'Amanda Martinez', 26, 'Female', '2021-10-30', 'HR', 'Los Angeles', 58000.00),
    (11, 'Christopher Garcia', 34, 'Male', '2018-03-15', 'Sales', 'Chicago', 70000.00),
    (12, 'Megan Rodriguez', 33, 'Female', '2017-06-22', 'Engineering', 'New York', 78000.00),
    (13, 'Ryan Hernandez', 36, 'Male', '2019-01-10', 'Finance', 'Chicago', 92000.00),
    (14, 'Olivia Lopez', 25, 'Female', '2020-11-05', 'HR', 'Los Angeles', 60000.00),
    (15, 'Matthew Martinez', 37, 'Male', '2018-04-20', 'Sales', 'Chicago', 73000.00),
    (16, 'Sophia Gonzalez', 28, 'Female', '2017-08-14', 'Engineering', 'New York', 76000.00),
    (17, 'Joshua Perez', 29, 'Male', '2022-02-10', 'Finance', 'Chicago', 89000.00),
    (18, 'Emma Torres', 30, 'Female', '2021-05-15', 'HR', 'Los Angeles', 57000.00),
    (19, 'Andrew Flores', 35, 'Male', '2019-09-08', 'Sales', 'Chicago', 71000.00),
    (20, 'Madison Diaz', 27, 'Female', '2016-12-25', 'Engineering', 'New York', 79000.00);

	select * from employees;

	select department,avg(salary) from employees
	group by department;

	select department,avg(age) as avg_age from employees
	group by department;

	select department,sum(salary) from employees
	group by department;

	---how many employee live in the particular city
	select count(empid),city from employees
	group by city;

	select year(date_of_joining) as year,count(empid)
	from employees
	group by date_of_joining;

	CREATE TABLE sales (
    product_id INT PRIMARY KEY,
    sell_price DECIMAL(10, 2),
    quantity INT,
    state VARCHAR(50)
);

INSERT INTO sales (product_id, sell_price, quantity, state)
VALUES
    (101, 50.00, 100, 'New York'),
    (102, 75.00, 75, 'California'),
    (103, 30.00, 200, 'Texas'),
    (104, 100.00, 50, 'Florida'),
    (105, 45.00, 150, 'New York'),
    (106, 80.00, 100, 'California'),
    (107, 35.00, 180, 'Texas'),
    (108, 95.00, 60, 'Florida'),
    (109, 55.00, 120, 'New York'),
    (110, 70.00, 90, 'California'),
    (111, 25.00, 220, 'Texas'),
    (112, 110.00, 40, 'Florida'),
    (113, 60.00, 110, 'New York'),
    (114, 85.00, 80, 'California'),
    (115, 40.00, 170, 'Texas');
	
	select * from sales;

	---we want to calculate revenue from each productid

	select product_id,sum(sell_price*quantity) as revenue 
	from sales
	group by product_id;

	CREATE TABLE c_product (
    product_id INT PRIMARY KEY,
    cost_price DECIMAL(10, 2)
);

INSERT INTO c_product(product_id, cost_price)
VALUES
    (1, 50.00),
    (2, 35.00),
    (3, 75.00),
    (4, 60.00),
    (5, 45.00),
    (6, 55.00),
    (7, 80.00),
    (8, 65.00),
    (9, 40.00),
    (10, 70.00),
    (11, 90.00),
    (12, 30.00),
    (13, 85.00),
    (14, 25.00),
    (15, 95.00);

	select * from c_product;

----now we want to calculate profits acquired by both the id in both the table sales and c_product

select c.product_id,sum((s.sell_price-c.cost_price) * s.quantity) as profit
from sales as s inner join c_product as c
on s.product_id=c.product_id
group by c.product_id;

select * from employees;

---find the cities where there are more than 2 employees

select count(empid),city from employees
group by city
having count(empid)>2;

---find those departments whose average salary is more than the 75000

select department,avg(salary) from employees
group by department
having avg(salary)>75000;

---find the cities where the total salary>200000
select city,sum(salary) as sum_salary
from employees
group by city
having sum(salary)>20000;

---find out department more than two employee

select department,count(empid)
from employees
group by department
having count(empid)>2;

----find out the cities who have more than the 2 employee apart from the chicago

select city,count(empid)
from employees
where city!='chicago'
group by city
having count(empid)>2;

---find out total no. of employees from each department that has an average salary>75000;

select empid,department,avg(salary) as avg_salary
from employees
group by empid,department
having avg(salary)>75000;

