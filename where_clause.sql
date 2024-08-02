create database employee;
use employee;
create table employee (emp_id numeric(10) primary key, e_name varchar(20), city varchar(20), salary numeric(30));
insert into employee
values
(101,'Rimi','Ranchi',30000),
(102,'Ajay','Ranchi',20000),
(103,'Deepak','Atp',8000),
(104,'Sam','Atp',9000),
(105,'Daneil','mumbai',10000),
(106,'Jam','Atp',30900);

select emp_id,e_name from employee where city ='ranchi' and emp_id>100;
select emp_id,e_name from employee where emp_id>101 or city='delhi';
alter table employee
add date_of_joining  date not null;

alter table employee
drop column salary;
select * from employee;
alter table employee
drop constraint defaultsalary;

drop table employee;
select city,count(emp_id) 
from employee
group by city; 

SELECT city, COUNT(*) as total_employees
FROM employee
GROUP BY city;

select city,avg(salary) as avg_salary
from employee
group by city
having count(*)>2;

select city,max(salary) as max_salary
from employee
group by city;

select * from employee where salary>5000 and city='Atp';
select * from employee 

