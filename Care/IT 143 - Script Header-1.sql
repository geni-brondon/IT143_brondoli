/*****************************************************************************************************************
NAME:    EC_IT143_W4.2_hello_world_s4_brondoli 
PURPOSE: create a script that demonstrates the use of views,
tables, and stored procedures in SQL Server.

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     05/23/2022   brondoli      1. Built this script for EC IT440


RUNTIME: 
Xm Xs

NOTES: 
This is where I talk about what this script is, why I built it, and other stuff...
 
******************************************************************************************************************/



--Step 1: Start with a question.

--Q1: write a query to wiew  the top 3
--car_name,Year and selling_price from care table

select top 3 car_name,
Year,
selling_price
from care ;


--Step 4: Turn the ad hoc SQL query into a view.

create view dbo.my_second_view
as 
select top 3 car_name,
YEAR,
selling_price
from care ;

select * from dbo.my_second_view ;



--Step 5: Turn the view into a table.

select * into dbo.my_second_table
from dbo.my_second_view ;

select * from dbo.my_second_table ;

--Drop and re-create your table multiple times as needed.

drop table dbo.my_second_table ;

create table dbo.my_second_table

( car_name nvarchar(255) not null  default ' genouis_car',
 Year smallint not null,
 selling_price float
 constraint pk_my_second_table 
 primary key (car_name)
) ;


--Load the table from the view using an ad hoc SQL script.


truncate table dbo.my_second_table ;

insert into dbo.my_second_table (car_name, Year, selling_price)
select car_name, Year, selling_price
from dbo.my_second_view ;

select * from dbo.my_second_table ;


 --Turn the ad hoc SQL script into a stored procedure.

 create procedure dbo.second_procedure
 as 

 truncate table dbo.my_second_table ;

insert into dbo.my_second_table (car_name, Year, selling_price)
select car_name, Year, selling_price
from dbo.my_second_view ;

select * from dbo.my_second_table ;



 --Call the stored procedure.

 exec dbo.second_procedure ;