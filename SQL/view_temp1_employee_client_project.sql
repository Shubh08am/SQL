-- VIEW
USE temp1;

select * from employee;

-- creating a view
CREATE VIEW custom_view AS SELECT fname, lname, age FROM employee;

-- viewing from view
SELECT * FROM custom_view;

-- altering the view
ALTER VIEW custom_view AS SELECT fname, lname, city FROM employee;

-- droping the view
DROP VIEW IF EXISTS custom_view;