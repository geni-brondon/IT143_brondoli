/*****************************************************************************************************************
NAME:    EC_IT143_W4.2_hello_world_s1_Brondoli
PURPOSE: My script purpose...

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     05/23/2022   Brondoli     1. Built this script for EC IT440


RUNTIME: 
Xm Xs

NOTES: 
This is where I talk about what this script is, why I built it, and other stuff...
 
******************************************************************************************************************/

--Step 1: Start with a question.
--Q1-write a query to show all the countries and their gasoline_usd_per_liter
--from the prices table.

--A1- Let's write a simple SELECT statement to retrieve 
--the country and gasoline price from the prices table.



select country, gasoline_usd_per_liter
from prices;



--Turn the ad hoc SQL query into a view

create view  last_view
as
select country, gasoline_usd_per_liter
from prices;

select * from last_view;

--Step 5: Turn the view into a table.

select * into last_table
from last_view;

select * from last_table;
select * from last_view;

--Drop and re-create your table multiple times as needed.

drop table last_table;

create table last_table
(country nvarchar(255) not null default 'Congo',
gasoline_usd_per_liter float not null
constraint pk_last_table
primary key (country)
);

--Step 6: Load the table from the view using an ad hoc SQL script.

truncate table last_table;

insert into last_table (country, gasoline_usd_per_liter)
select country, gasoline_usd_per_liter
from last_view;

--Step 7: Turn the ad hoc SQL script into a stored procedure.

create procedure last_procedure
as

truncate table last_table;

insert into last_table (country, gasoline_usd_per_liter)
select country, gasoline_usd_per_liter
from last_view;
select * from last_table;


--Step 8: Call the stored procedure.

exec last_procedure;