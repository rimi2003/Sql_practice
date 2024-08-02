create database dt;
use dt;
create table pyt (customer_id int primary key, customer_name varchar(8),mode varchar (20),city varchar(20));
insert into pyt
(customer_id, customer_name, mode, city)
values
(101,"anil","net_banking","pune"),
(102,"rimi","credit_card","delhi"),
(103,"chetan","credit_card","ranchi"),
(104,"farah","credit_card","mumbai"),
(105,"sam","net_banking","mumbai"),
(106,"lia","debit_card","portland"),
(107,"lucas","debit_card","miami");

select mode ,count(customer_name) from pyt group by mode;

create database sd;
use sd;

CREATE TABLE CUSTOMERS (
   ID INT NOT NULL,
   NAME VARCHAR (20) NOT NULL,
   AGE INT NOT NULL,
   ADDRESS CHAR (25),
   SALARY DECIMAL (18, 2),
   PRIMARY KEY (ID)
);

INSERT INTO CUSTOMERS VALUES
(1, 'Ramesh', 32, 'Ahmedabad', 2000.00),
(2, 'Khilan', 25, 'Delhi', 1500.00),
(3, 'Kaushik', 23, 'Kota', 2000.00),
(4, 'Chaitali', 25, 'Mumbai', 6500.00),
(5, 'Hardik', 27, 'Bhopal', 8500.00),
(6, 'Komal', 22, 'Hyderabad', 4500.00),
(7, 'Muffy', 24, 'Indore', 10000.00);

select age ,count(id) from customers group by age;
select age,max(salary) from customers group by age;
select address, avg(salary) from customers group by address;
select address,age,sum(salary) from customers group by address,age;
update customers set age=30 where age=25;
select * from customers;

set sql_safe_updates= 0;

update customers set salary=salary+1; 

delete from customers where age>28;


   
     
   









