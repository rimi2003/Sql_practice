---From the following table, write a SQL query to calculate total purchase amount of all orders. Return total purchase amount.
select * from orders_1

select sum(purch_amt) 
from orders_1;

--- From the following table, write a SQL query to calculate the average purchase amount of all orders. Return average purchase amount.
select avg(purch_amt)
from orders_1;

--- From the following table, write a SQL query that counts the number of unique salespeople. Return number of salespeople.  
select count(salesman_id)
from orders_1;

---From the following table, write a SQL query to count the number of customers. Return number of customers.
select count(*)
from orders_1;

--- From the following table, write a SQL query to determine the number of customers who received at least one grade for their activity.
select * from 