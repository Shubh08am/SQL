USE tmp;

DROP TABLE account;

create table account(
id int primary key,
name varchar(255) unique,
balance int not null default 0
);

select * from account;

-- describe account
DESC account;

-- ADD - add new column
ALTER TABLE account ADD interest FLOAT NOT NULL DEFAULT 0;

-- MODIFY - modify the column
alter table account MODIFY interest DOUBLE NOT NULL DEFAULT 1;

-- CHANGE COLUMN - rename and modify the column
alter table account CHANGE COLUMN interest saving_interest float not null default 0;

-- DROP COLUMN - delete column
alter table account DROP COLUMN saving_interest;
 
-- RENAME TO - rename the table
alter table account RENAME TO account_details;