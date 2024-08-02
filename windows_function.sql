select * from employee
---over----
select e.*,
max(salary) over() as max_salary
from employee e;

select e.*,
max(salary) over(partition by department)
as max_salary
from employee e;

---using of min,max and count----
select e.*,
min(salary) over(partition by department)
as min_salary
from employee e;

select e.*,
sum(salary) over(partition by department)
as sum_salary
from employee e;

select e.*,
count(salary) over(partition by department)
as count_salary
from employee e;

---we can also find out the number of rows---
select e.*,
row_number() over(order by employee_id) as rn
from employee e;

select e.*,
row_number() over(partition by department order by employee_id ) as rn
from employee e;

---fetch the first two employees from each department to join the company---

select * from 
(select e.*,row_number() over(partition by department order by employee_id) as rn
from employee e) emp
where emp.rn<3;

---fetch the top 2 employees from each department earning the maximum salary---

select * from(
select e.*,rank() over(partition by department order by salary desc) as rnk
from employee e)ep
where ep.rnk<3;

---dense rank---
-- Create the table
CREATE TABLE emp (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    city VARCHAR(100)
-- Create the table
CREATE TABLE emp (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);
drop table emp
-- Insert 10 values into the table
INSERT INTO emp (emp_id, name, department, salary) VALUES
(1, 'Alice Smith', 'HR', 55000.00),
(2, 'Bob Johnson', 'Finance', 62000.00),
(3, 'Charlie Williams', 'IT', 75000.00),
(4, 'Dana Brown', 'Marketing', 60000.00),
(5, 'Evan Davis', 'Marketing', 60000.00),
(6, 'Fiona Clark', 'HR', 55000.00),
(7, 'George Lopez', 'Finance', 63000.00),
(8, 'Hannah Miller', 'HR', 55000.00),
(9, 'Ian Wilson', 'Finance', 59000.00),
(10, 'Jane Garcia', 'HR', 61000.00);



select e.*,
rank() over(partition by department order by salary desc) as rnk,
dense_rank() over (partition by department order by salary desc) as dense_rnk
from emp e;

----use of row number,dense rank,rank---
select e.*,
rank() over(partition by department order by salary desc) as rnk,
dense_rank() over(partition by department order by salary desc) as dense_rnk,
row_number() over(partition by department order by salary desc) as rn
from emp e;

---use of lag---
select e.*,
lag(salary) over(partition by department order by emp_id)as prev_salary
from emp e;

select e.*,
lag(salary) over(order by emp_id) as prev_salary
from emp e;

select e.*,
lag(salary,1,0)over(partition by department order by emp_id)as prev_emp_salary
from emp e;

select e.*,
lag(salary,2,0)over(partition by department order by emp_id)as prev_emp_salary
from emp e;

---lead is basically the rows that are following the current record---
select e.*,
lag (salary) over(partition by department order by emp_id)as prev_emp_salary,
lead(salary) over(partition by department order by emp_id)as next_emp_salary
from emp e;

--- fetch a querry to display if the salary of an employee is higher 
---lower or equal to the previous employeee salary

select e.*,
lag(salary) over(partition by department order by emp_id )as prev_emp_salary,
case 
when e.salary>lag(salary) over(partition by department order by emp_id) then 'higher than the previous employee'
when e.salary<lag(salary) over(partition by department order by emp_id) then 'lower than the previous employee'
when e.salary=lag(salary) over(partition by department order by emp_id) then 'equal the previous employee'
end as salary_comparison
from emp e;