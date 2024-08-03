---From the following tables, write a  SQL query to find all the orders issued by the salesman 'Paul Adam'. 
---Return ord_no, purch_amt, ord_date, customer_id and salesman_id.

select * from orders_1
where salesman_id= 
(select  salesman_id  from salesman where name ='Paul Adam')