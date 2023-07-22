-- SUB QUERIES
use temp1;

select * from employee;

-- WHERE clause same table
-- employee with age > 20
select * from employee where age in (select age from employee where age > 20);

-- WHERE clause different table 
-- employee details working in more then one project
select * from employee where id in (select empid from project group by empid having count(empid) > 1);


-- single value subqueries
-- employee details having age > avg(age)
select * from employee where age > (select avg(age) from employee);

-- FROM clause - derived table
-- select max age person whose first name has 'a'
select max(age) from (select * from employee where fname like '%a%') as t1;

-- Corelated Subqueries
-- Find the 3rd oldest employee
select * from employee as e1 where (select count(e2.age) from employee as e2 where e1.age > e2.age) = 2;
-- for each e1.age, inner query will run completely one time




