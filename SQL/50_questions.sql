use org1;

-- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
select first_name AS WORKER_NAME from worker;

-- Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
select UPPER(first_name) from worker;

-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
select distinct department from worker;

-- Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.
select substring(first_name, 1, 3) from worker; -- post processing

-- Q-5. Write an SQL query to find the position of the alphabet (‘b’) in the first name column ‘Amitabh’ from Worker table.
select instr(first_name, 'b') from worker where first_name = 'Amitabh';

-- Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
select RTRIM(first_name) from worker;

-- Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
select LTRIM(first_name) from worker;

-- Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
select distinct department, LENGTH(department) from worker;
select department, LENGTH(department) from worker group by department;

-- Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
select REPLACE(first_name, 'a', 'A')  from worker;

-- Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME.
-- A space char should separate them.
select CONCAT(first_name, ' ', last_name) AS COMPLETE_NAME from worker;

-- Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
select * from worker order by first_name;

-- Q-12. Write an SQL query to print all Worker details from the Worker table order by 
-- FIRST_NAME Ascending and DEPARTMENT Descending.
select * from worker order by first_name, department DESC;

-- Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
select * from worker where first_name in ('Vipul', 'Satish');

-- Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
select * from worker where first_name not in ('Vipul', 'Satish');

-- Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin*”.
select * from worker where department like 'Admin%';

-- Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
select * from worker where first_name like '%a%';

-- Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
select * from worker where first_name like '%a';

-- Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
select * from worker where first_name like '%h' and first_name in (select first_name from worker group by first_name having LENGTH(first_name) = 6);
-- alternate
select * from worker where first_name like '_____h';

-- Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
select * from worker where salary between 100000 and 500000;

-- Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.
select * from worker where joining_date like '2014-02%';
-- alternate 
select * from worker where year(joining_date) = 2014 and month(joining_date) = 02;

-- Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
select count(department) from worker group by department having department = 'Admin';
-- alternate 
select count(department) from worker where department = 'Admin';

-- Q-22. Write an SQL query to fetch worker full names with salaries >= 50000 and <= 100000.
select concat(first_name, ' ', last_name) as full_name from worker where salary between 50000 and 100000;

-- Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
select department, count(worker_id) as no_of_workers from worker group by department order by count(worker_id) desc;

-- Q-24. Write an SQL query to print details of the Workers who are also Managers.
select * from worker where worker_id in (select worker_ref_id from title where worker_title = 'Manager');
-- alternate 
select w.* from worker as w inner join title as t on w.worker_id = t.worker_ref_id where t.worker_title = 'Manager';

-- Q-25. Write an SQL query to fetch number (more than 1) of same titles in the ORG of different types.
select worker_title, count(worker_title) from title group by worker_title having count(worker_title) > 1;

-- Q-26. Write an SQL query to show only odd rows from a table.
select * from worker where MOD (WORKER_ID, 2) != 0; 
-- alternate
select * from worker where MOD (WORKER_ID, 2) <> 0;

-- Q-27. Write an SQL query to show only even rows from a table. 
select * from worker where mod(worker_id, 2) = 0;

-- Q-28. Write an SQL query to clone a new table from another table.
CREATE TABLE worker_clone LIKE worker;
INSERT INTO worker_clone select * from worker;
select * from worker_clone;

-- Q-29. Write an SQL query to fetch intersecting records of two tables.
select w1.* from worker as w1 inner join worker_clone as w2 using(worker_id);

-- Q-30. Write an SQL query to show records from one table that another table does not have.
-- MINUS
select w1.* from worker as w1 left join worker_clone as w2 using(worker_id) where w2.worker_id is null;

-- Q-31. Write an SQL query to show the current date and time.
-- DUAL
select curdate();
select now();

-- Q-32. Write an SQL query to show the top n (say 5) records of a table order by descending salary.
select * from worker as w1 where (select count(w2.salary) from worker as w2 where w2.salary > w1.salary) < 5 order by salary desc;
-- alterante
select * from worker order by salary desc LIMIT 5;

-- Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
select * from worker as w1 where (select count(w2.salary) from worker as w2 where w2.salary > w1.salary) = 4;
-- alternate
select * from worker order by salary desc LIMIT 4,1;

-- Q-34. Write an SQL query to determine the 5th highest salary without using LIMIT keyword.
select salary from worker w1
WHERE 4 = (
SELECT COUNT(DISTINCT (w2.salary))
from worker w2
where w2.salary >= w1.salary
);
 
-- Q-35. Write an SQL query to fetch the list of employees with the same salary.
select * from worker as w1 where salary in (select w2.salary from worker as w2 where w2.salary = w1.salary and w1.worker_id != w2.worker_id);
-- alternate
select w1.* from worker as w1, worker as w2 where w1.salary = w2.salary and w1.worker_id != w2.worker_id;
-- alternate 
select w1.* from worker as w1 inner join worker as w2 ON w1.salary = w2.salary and w1.worker_id != w2.worker_id;


-- Q-36. Write an SQL query to show the second highest salary from a table using sub-query.
select max(salary) from worker where salary not in (select max(salary) from worker);
-- alternate
select salary from worker as w1 where (select count(distinct w2.salary) from worker as w2 where w2.salary > w1.salary) = 1;

-- Q-37. Write an SQL query to show one row twice in results from a table.
select * from worker
UNION ALL
select * from worker ORDER BY worker_id;

-- Q-38. Write an SQL query to list worker_id who does not get bonus.
select worker_id from worker where worker_id not in (select worker_ref_id from bonus);

-- Q-39. Write an SQL query to fetch the first 50% records from a table.
select * from worker where worker_id <= (select max(worker_id)/2 from worker);
-- alternate
select * from worker where worker_id <= ( select count(worker_id)/2 from worker);

-- Q-40. Write an SQL query to fetch the departments that have less than 4 people in it.
select department, count(department) as no_of_workers from worker group by department having count(department) < 4;

-- Q-41. Write an SQL query to show all departments along with the number of people in there.
select department, count(department) as number_of_people from worker group by department;

-- Q-42. Write an SQL query to show the last record from a table.
select * from worker where worker_id = (select max(worker_id) from worker);

-- Q-43. Write an SQL query to fetch the first row of a table.
select * from worker where worker_id = (select min(worker_id) from worker);

-- Q-44. Write an SQL query to fetch the last five records from a table.
select * from worker as w1 where (select count(w2.worker_id) from worker as w2 where w2.worker_id > w1.worker_id) <= 4;
-- alternate
(select * from worker order by worker_id desc limit 5) order by worker_id;
-- alternate
select * from (select * from worker order by worker_id desc limit 5) as t order by worker_id;


-- Q-45. Write an SQL query to print the name of employees having the highest salary in each department.
select department, concat(first_name, ' ', last_name) as highest_paid_employee, salary from worker 
where salary in (select max(salary) from worker group by department);
-- alternate
select w.department, w.first_name, w.salary from
 (select max(salary) as maxsal, department from worker group by department) as temp
inner join worker as w on temp.department = w.department and temp.maxsal = w.salary;


-- Q-46. Write an SQL query to fetch three max salaries from a table using co-related subquery
select distinct salary from worker as w1 
where (select count(distinct w2.salary) from worker as w2 where w2.salary > w1.salary) <= 2 order by w1.salary desc;
-- alternate
select distinct salary from worker order by salary desc limit 3;


-- Q-47. Write an SQL query to fetch three min salaries from a table using co-related subquery
select distinct salary from worker as w1 
where (select count(distinct w2.salary) from worker as w2 where w2.salary < w1.salary) <= 2 order by w1.salary;


-- Q-48. Write an SQL query to fetch nth max salaries from a table.
select distinct salary from worker as w1 
where (select count(distinct w2.salary) from worker as w2 where w2.salary > w1.salary) <= n-1 order by w1.salary desc;


-- Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
select department, sum(salary) as department_salary from worker group by department order by department_salary desc;


-- Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.
select first_name, salary from worker where salary = (select max(Salary) from worker);