-- INNER JOIN
-- Enlist the employee ids, names, along with the project allocated to them
select e.id, e.fname, e.lname, p.* from employee as e INNER JOIN project as p ON e.id =  p.empID;
-- alternate -> without using JOIN keyword
select e.id, e.fname, e.lname, p.* from employee as e, project as p WHERE e.id =  p.empID;

-- Fetch out all the employee ids and their contact details who have been working from jaipur with the clients name working in hyderabad
select e.id, e.emailID, e.PhoneNo, c.fname, c.lname from employee as e INNER JOIN client_details as c ON e.id = c.empID
where e.city = 'Jaipur' and c.city = 'Hyderabad';


UPDATE project set empID = 3 where id = 4;
select * from project;


-- LEFT JOIN
-- Fetch out each project allocated to each employee
select p.*, e.* from employee as e LEFT JOIN project as p ON e.id = p.empID;

-- RIGHT JOIN
-- List out all the projects along with the employee's name and their respective allocated email ID
select p.*, e.fname, e.lname, e.emailID from employee as e RIGHT JOIN project as p ON e.id = p.empID;

-- CROSS JOIN
-- list out all the possible combinations for the employee's name and project that can exist
select e.fname, e.lname, p.id, p.name from employee as e CROSS JOIN project as p;


