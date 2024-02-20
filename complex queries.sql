-- union --
-- retreive harvest from crop01 and crop02
select crop_id, Farmer_Price, Quantity from harvest where farmer_price >3
union
select crop_id, Farmer_Price, Quantity from harvest where farmer_price=8;

-- intersection --
select f.farmer_name,cc.contact_number
from farmer as f
natural join contact_numbers_farmers as cc
where f.Farmer_Region_Id="R01" 
and f.farmer_id in(
select farmercommitee.RepresentativeId
from farmercommitee
where farmercommitee.RegionId="R01"
);

-- retreive farmers in region R01 except representative --- 
-- set differnce --
select f.Farmer_Name as Followers
from Farmer as f
where f.Farmer_Region_Id = 'R01'
and f.Farmer_Id not in (
    select fc.RepresentativeId
    from FarmerCommitee as  fc
    where fc.RegionId = 'R01'
); 

-- division --
select F.Farmer_Id, F.Farmer_Name from Farmer as F
where not exists (
	select Crop_Id
	from crop as c
	where c.Crop_Id in(
    select CO.Crop_Id
    from crop_farmer AS CO
    join land AS L ON CO.Land_Id = L.Land_Id
    where L.Farmer_Id = F.Farmer_Id
  )
); 

-- inner join
-- retrieve farmers in north central province--
select f.farmer_id, f.farmer_name
from farmer as f
inner join	region as r on f.Farmer_Region_Id=r.Regionid
where Region_Name='North-Central';

-- natural join--
-- retrieve the customer who ordered product P01 ---
select c.Cus_Name, o.product_Id
from customer as  c
natural join orders as  o 
where o.product_Id = 'P01';

-- left outer join
select f.Farmer_Name,d.disease_Name
from farmer as f
left join land as l on l.Farmer_Id=f.Farmer_Id
left join land_diseases as ld on ld.land_id=l.Land_Id
left join disease as d on d.diseas_Id=ld.diseas_id
where ld.StillSuffer>0;

-- right join
select f.farmer_name, c.crop_name,cr.Quantity
from farmer as f
right outer join land as l on f.farmer_id=l.farmer_id
right outer join crop_farmer as cr on  cr.Land_Id=l.Land_Id
right outer join crop as c on c.crop_Id=cr.crop_Id
where c.crop_name="cabbage";

-- full outer join
(select *
from crop_farmer as cr
left join harvest as h on  h.crop_Id=cr.crop_Id )
union
(select *
from crop_farmer
right join harvest on crop_farmer.crop_Id = harvest.crop_Id
where crop_farmer.Quantity=375);

-- outer union
select Farmer_Name as name, null as Cus_Name,c.contact_Number as number
from farmer natural join
contact_numbers_farmers as c
UNION
select null as Name, Cus_Name, cu.contact_Number as number
FROM customer natural join
customer_contact_numbers as cu where customer.cus_name="Nethmi Gunawardana";

-- Nested Query 1
select Farmer_Name from Farmer
where Farmer_Id in (
    select l.Farmer_Id
    from Land_diseases as ld
    join Land as l on ld.land_id = l.Land_id
    join crop_farmer as cr where cr.Quantity>20
);

-- Nested Query 2
select ld.land_id from Land_diseases AS ld
where ld.stillsuffer=1 and ld.land_id in (
    select cf.Land_Id
    from crop_farmer as cf
    join crop as c on cf.crop_Id = c.crop_Id
    where  cf.Quantity>300
);

-- Nested Query 3
-- crops that grow more than 1000 quantity--
select  distinct c.crop_name from crop_farmer as cr
natural join crop as c
where (
		select sum(crop_farmer.quantity)
        from crop_farmer
        group by cr.crop_Id
)>1000;
 