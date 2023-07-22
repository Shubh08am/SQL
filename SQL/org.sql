USE org;

CREATE TABLE worker (
	worker_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(25) NOT NULL,
	last_name VARCHAR(25) NOT NULL,
	salary INT(15),
	joining_date DATETIME,
	department VARCHAR(25)
);

INSERT INTO worker 
	(worker_id, first_name, last_name, salary, joining_date, department) VALUES
		(001, 'Ram', 'Das', 100000, '14-02-20 09.00.00', 'HR'),
        (002, 'Mohan', 'Chaudhary', 80000, '14-02-20 09.00.00', 'Admin'),
        (003, 'Mohini', 'Sharma', 50000, '14-02-20 09.00.00', 'HR'),
        (004, 'Raju', 'Das', 70000, '14-02-20 09.00.00', 'Admin'),
        (005, 'Rakesh', 'Joshi', 60000, '14-02-20 09.00.00', 'Admin'),
        (006, 'Hema', 'Kumari', 750000, '14-02-20 09.00.00', 'Account'),
        (007, 'Raj', 'Mishra', 850000, '14-02-20 09.00.00', 'Account'),
        (008, 'Lakshman', 'Jaiswal', 900000, '14-02-20 09.00.00', 'Admin');
        
CREATE TABLE bonus(
	worker_ref_id INT,
    bonus_amount INT(10),
    bonus_date DATETIME,
    FOREIGN KEY(worker_ref_id)
		REFERENCES worker(worker_id)
        ON DELETE CASCADE
);

INSERT INTO bonus
	(worker_ref_id, bonus_amount, bonus_date) VALUES
		(001, 5000, '15-05-21'),
        (002, 5000, '15-05-21'),
        (003, 5000, '15-05-21'),
        (001, 5000, '16-05-21'),
        (002, 5000, '16-05-21');

CREATE TABLE title(
	worker_ref_id INT,
	worker_title VARCHAR(255),
    affected_from DATETIME,
    FOREIGN KEY(worker_ref_id)
		REFERENCES worker(worker_id)
        ON DELETE CASCADE
);

INSERT INTO title
	(worker_ref_id, worker_title, affected_from) VALUES
		(001, 'Manager', '2016-06-11 00:00:00'),
        (002, 'Executive', '2016-06-11 00:00:00'),
        (008, 'Executive', '2016-06-11 00:00:00'),
        (005, 'Manager', '2016-06-11 00:00:00'),
        (004, 'Assistent Manager', '2016-06-11 00:00:00'),
        (007, 'Executive', '2016-06-11 00:00:00'),
        (006, 'Lead', '2016-06-11 00:00:00'),
        (003, 'Lead', '2016-06-11 00:00:00');
        




        
        