create database db;
use db;
create table student (roll int primary key,name varchar(8),marks int not null,grade varchar(1),city varchar(10));
insert into student
(roll,name,marks,grade,city)
values
(101,"anil",80,"B","pune"),
(102,"rimi",85,"A","pune"),
(103,"chetan",75,"B","delhi"),
(104,"farah",90,"A","mumbai"),
(105,"sam",60,"B","mumbai");
select city ,avg(marks) from student group by city order by city;
select city ,avg(marks) from student group by city order by city desc





