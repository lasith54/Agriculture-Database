-- select
show index from harvest;
explain (
select crop_id, Farmer_Price, Quantity from harvest where farmer_price >3
union
select crop_id, Farmer_Price, Quantity from harvest where farmer_price=8
);
create index CropId_Index using btree on harvest(farmer_price);

-- left join --------
show index from disease;
explain(select f.Farmer_Name,d.disease_Name
from farmer as f
left join land as l on l.Farmer_Id=f.Farmer_Id
left join land_diseases as ld on ld.land_id=l.Land_Id
left join disease as d on d.diseas_Id=ld.diseas_id
where ld.StillSuffer>0

);
create index disease_name_index using btree on land_diseases(stillsuffer);

-- right join--
explain(select f.farmer_name, c.crop_name,cr.size
from farmer as f
right outer join land as l on f.farmer_id=l.farmer_id
right outer join crop_farmer as cr on  cr.Land_Id=l.Land_Id
right outer join crop as c on c.crop_Id=cr.crop_Id
where c.crop_name="cabbage"
);
create index crop_name_index using btree on crop(crop_name);

-- full outer join --
explain (select *
from crop_farmer as cr
left join harvest as h on  h.crop_Id=cr.crop_Id )
union
(select *
from crop_farmer
right join harvest on crop_farmer.crop_Id = harvest.crop_Id
where crop_farmer.size=375
);
create index crop_farmer_crop_id_index using btree on crop_farmer(size);

-- outer union --
explain select Farmer_Name as name, null as Cus_Name,c.contact_Number as number
from farmer natural join
contact_numbers_farmers as c
UNION
select null as Name, Cus_Name, cu.contact_Number as number
FROM customer natural join
customer_contact_numbers as cu where customer.cus_name="Nethmi Gunawardana";
create index farmer_name_index on customer (cus_name);

-- nested   query1 ---
explain select Farmer_Name from Farmer
where Farmer_Id in (
    select l.Farmer_Id
    from Land_diseases as ld
    join Land as l on ld.land_id = l.Land_id
    join crop_farmer as cr where cr.size>20
);
create index land_diseases_land_id_index2 on crop_farmer (size);

-- nested query2 ---
explain(select ld.land_id from Land_diseases AS ld
where ld.stillsuffer=1 and ld.land_id in (
    select cf.Land_Id
    from crop_farmer as cf
    join crop as c on cf.crop_Id = c.crop_Id
    where  cf.size>300
  )
);
create index nestedq on land_diseases(stillSuffer);