create database inf;
use inf;
create table clg (roll int primary key,name varchar(8),marks int not null,grade varchar(1),city varchar(10));
insert into clg
(roll,name,marks,grade,city)
values
(101,"anil",80,"B","pune"),
(102,"rimi",85,"A","pune"),
(103,"chetan",75,"B","delhi"),
(104,"farah",90,"A","mumbai"),
(105,"sam",60,"B","bhopal");

select * from clg where city="mumbai";
select * from clg where city="pune" and marks>70;

select * from clg where marks>90 or city="bhopal";
select * from clg where marks between 70 and 90;
select * from clg where city in ("delhi","mumbai");

select * from clg where grade in("A","B");

select * from clg limit 3;
select * from clg where marks>70 limit 3;

select * from clg order by city asc;
select * from clg order by name desc;
select * from clg order by grade asc;

select * from clg order by grade desc limit 3 ;


select max(marks ) from clg;
select avg(marks) from clg;

