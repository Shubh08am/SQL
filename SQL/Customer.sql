CREATE DATABASE tmp;
USE tmp;

CREATE TABLE account(
id INT PRIMARY KEY AUTO_INCREMENT,
name varchar(255) unique,
balance int not null default 3000,
constraint acc_balance_chk check(balance >= 1000)
);

insert into account
	(id, name, balance) values
		(001, 'raju', 10000),
        (002, 'ramesh', 1000),
        (003, 'rakesh', 300); -- -> this one will throw error
        
insert into account
	(id, name, balance) values
		(001, 'raju', 10000),
        (002, 'ramesh', 1000);
        
DROP TABLE account;

insert into account
	(id, name) values
		(003, 'rakesh');

select * from account;
