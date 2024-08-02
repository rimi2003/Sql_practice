create database institution;
use institution;
create table details(id int primary key,name varchar(8),city varchar(10),marks int(6),grade varchar(1),salary int default 25000);
insert into details
(id,name,city,marks,grade,salary)
values
(101,"anil","pune",80,"B",8000),
(102,"rimi","ranchi",85,"A",10000),
(103,"chetan","mumbai",75,"B",89000),
(104,"farah","pune",90,"A",9000);


create table emp(
 id int,
 salary int default 25000);
insert into emp (id) values(101);

select * from emp;
create table cit (id int primary key,city varchar(50),age int check (age>=18));
insert into cit
(id,city,age)
values
(101,"pune",20),
(102,"delhi",17),
(103,"rnc",22),
(104,"delhi",30);

select * from cit;
