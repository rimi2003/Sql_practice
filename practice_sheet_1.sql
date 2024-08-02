create database dept;
use dept;

create table employee_dept(id int primary key,department_id numeric, name varchar(10),city varchar(10),salary varchar(10));
insert into employee_dept
values
(1,101,"Rimi","Ranchi",50000),
(2,102,"Rahul","Bgp",20000),
(3,103,"Rakesh","atp",30000),
(4,104,"surseh","atp",7000),
(5,104,'ravi','godda',8000),
(6,102,'yashi','bgp',90000),
(7,102,'sunita','godda',8000);
select department_id ,avg(salary) from employee_dept group by department_id;
select * from employee_dept;
drop table  employee_dept;
select city,count(id) from employee_dept group by city order by count(city);

select department_id, max(salary) from employee_dept where department_id>102 group by department_id;

select count(id),sum(salary) from employee_dept;



