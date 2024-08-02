create database sports;
use  sports;
 

CREATE TABLE games (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    company VARCHAR(100),
    type VARCHAR(50),
    production_year INT,
    sys VARCHAR(50),
    production_cost DECIMAL(15, 2),
    revenue DECIMAL(15, 2),
    rating DECIMAL(3, 2)
);
INSERT INTO games (title, company, type, production_year, sys, production_cost, revenue, rating) VALUES
('Game Title 1', 'Company A', 'Action', 2020, 'PC', 5000000.00, 15000000.00, 8.5),
('Game Title 2', 'Company B', 'RPG', 2019, 'PS4', 3000000.00, 10000000.00, 9.0),
('Game Title 3', 'Company C', 'Adventure', 2021, 'Xbox', 4500000.00, 12000000.00, 8.0),
('Game Title 4', 'Company D', 'Strategy', 2018, 'Switch', 2500000.00, 8000000.00, 7.5),
('Game Title 5', 'Company E', 'Sports', 2022, 'PC', 6000000.00, 20000000.00, 9.2);


##Total Revenue for Each Company Ex-1
select * from games;
#Obtain the name and total revenue for each company.

select  company,sum(revenue) 
from games
group by company;

#Exercise 2: Games Produced per Year with Average Revenue and Cost
select production_year,avg(production_cost) ,avg(revenue)
from games
group by production_year,production_cost;

SELECT  
  production_year,
  COUNT(*) AS count,
  AVG(production_cost) AS avg_cost,
  AVG(revenue) AS avg_revenue
FROM games
GROUP BY production_year;

#EX-3 Number of Profitable Games of Each Game Type
select type
from games
where production_cost<revenue
group by type;

SELECT   
  type,
  COUNT(*) AS number_of_games
FROM games
WHERE revenue > production_cost
GROUP BY type;




