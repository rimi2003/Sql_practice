CREATE DATABASE myfirstdb;
use myfirstdb;
create table information(student_id numeric(5) ,student_name varchar(10), marks numeric(6));
insert into information values(1001,'Rimi',80);
insert into information values(1002,'Raju',70);
select * from information;
