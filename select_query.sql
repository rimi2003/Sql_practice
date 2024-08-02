CREATE DATABASE college;
use college;

create table student (
roll_no int primary key,
 name varchar(9), 
 marks int not null, 
 grade varchar(1), 
 city varchar(20)
);
insert into student
(roll_no,name,marks,grade,city)
values
(100,'anil',78,'C','pune'),
(101,'bhumika',93,'A','mumbai'),
(102,'chetan',85,'B','mumbai'),
(103,'druv',89,'B','kanpur'),
(104,'enamuel',12,'F','delhi'),
(105,'farah',82,'B','delhi');

select distinct city from student;
select * from student where marks >80;
select * from student where city ='mumbai';
select * from student where city ='mumbai' and marks>80;



