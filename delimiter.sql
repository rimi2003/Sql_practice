-- Create the table
use sdelimeter;

drop table players ;
CREATE TABLE players (
    playerid INT PRIMARY KEY,
    name VARCHAR(100),
    country VARCHAR(100),
    goals INT
);

-- Insert values
INSERT INTO players (playerid, name, country, goals) 
VALUES 
    (1, 'Cristiano Ronaldo', 'Portugal', 780),
    (2, 'Lionel Messi', 'Argentina', 751),
    (3, 'Romario', 'Brazil', 772),
    (4, 'Pele', 'Brazil', 767),
    (5, 'Ferenc Puskas', 'Hungary', 704),
    (6, 'Gerd Muller', 'Germany', 735),
    (7, 'Eusebio', 'Portugal', 733),
    (8, 'Josef Bican', 'Austria-Hungary', 805),
    (9, 'Ferenc Deak', 'Hungary', 576),
    (10, 'Tulio Maravilha', 'Brazil', 575);

-- Define stored procedure
delimiter //
create procedure top_goals()
begin
select name,country,goals 
from players
order by goals desc;
end //
delimiter ;
call top_goals;











delimiter //
create procedure top_goaler()
begin 
select name,country, goals 
from players order by goals desc;
end  //
delimeter;
drop procedure top_goaler;
DELIMITER //
call top_goaler;

----store procedure using pin----

delimeter //
create procedure sp_sort salary 
(in var int)
begin 
select name,age,salary from emp_details
order by salary desc limit var;
end // 
delimiter ;

create table emp(name varchar(10),age numeric(5),dapartment varchar(30),salary numeric(20));
insert into emp
values
('ramesh',20,'finance',50000),
('sam',18,'sales',40000),
('bob',25,'finanace',30000),
('derry',26,'finanace',60000),
('daneil',30,'sales',55000);
create procedure update_salary
(in name varchar(30), in new_salary float)
begin 
update emp_ set
salary=new_salary where
name= name;
end  //
delimiter ;




