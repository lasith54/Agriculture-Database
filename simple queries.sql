use AgricultureDataBaseMini;

-- select--
-- Retrieve Product Made By CR01
select product_name, product_price
from product
where crop_Id = 'CR01';


-- project
select Farmer_Name, Farmer_City_Id, Farmer_Region_Id from farmer;


-- cartiesean product--
-- Check All Possible Options That Farmers can groww
select f.farmer_name, c.crop_name
from farmer as f
cross join crop as c;

-- user view to create 
-- retrieve farmerName with their region
create view farmerviewnew as
select
    Farmer_Region_Id,
	Farmer_Name
from
    Farmer;
select * from FarmerViewNew;

-- change column --
-- change column name size to quantity
alter table crop_farmer
change column size quantity float not null;
select quantity from crop_farmer;

-- Aggregration--
-- get average temperature in each region
select
avg(Temperature) as Avg_Temperature,
Region_Id
from weather
group by Region_ID;

-- like--
-- find out who has google mail
select * from emailsoffarmers
where Email like '%@gmail.com'; 
