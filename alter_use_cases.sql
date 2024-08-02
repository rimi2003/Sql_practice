create database mdt;
use mdt;

create table student(id int primary key, name varchar(10),grade varchar(1),city varchar(10));
insert into student
values
(101,"Rimi","A","Ranchi"),
(102,"Rahul","B","Bgp"),
(103,"Rakesh","A","atp"),
(10,"surseh","A","patna");

select * from student;
alter table student
add column age int not null default 19;

alter table student 
modify column age varchar(2);

alter table student 
change age student_age int;

alter table student
drop column stu_age;

alter table student 
rename to stu;

truncate table student;
