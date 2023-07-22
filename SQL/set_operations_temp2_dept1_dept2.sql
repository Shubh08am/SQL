-- set operations

-- List out all the employees in the company
-- UNION
select * from dept1
UNION
select * from dept2;

-- List out all the employees in all the departments who works as salesman
-- UNION
select* from dept1 where role = 'salesman'
UNION 
select * from dept2 where role = 'salesman';

-- List out all the employees that work in both the departments
-- INTERSECTION (emulation)
select dept1.* from dept1 inner join dept2 using(empid);
-- alternate
select dept1.* from dept1 inner join dept2 ON dept1.empid = dept2.empid;

-- List out all the employees working in dept1 but not in dept2
-- MINUS (emulation)
select dept1.* from dept1 left join dept2 using(empid) where dept2.empid is null;



