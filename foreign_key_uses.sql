create database mythirddb;
use mythirddb;
create table dept(id int primary key,name varchar(10));
drop table dep;
insert into dept
values
(101,"it"),
(102,"science"),
(103,"accounts"),
(104,"bst");

update dept 
set id=109
where id=102;
select * from dep;

create table fac(id int primary key,name varchar(10),department_id int, foreign key(department_id) references dept(id) 
on delete cascade
on update cascade);
insert into fac
values
(101,"Rimi",101),
(102,"sam",102),
(103,"dhruv",102),
(104,"rathi",103);

select * from fac;
