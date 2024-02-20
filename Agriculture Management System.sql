create database AgricultureDataBase;
use AgricultureDataBase;

-- Create Region
CREATE TABLE region (
  RegionId varchar(10) NOT NULL,
  Region_Name varchar(35) NOT NULL,
  PRIMARY KEY (RegionId),
  UNIQUE KEY (Region_Name)
) ;

insert into region values
('R01','North-Central'),
('R02','Eastern'),
('R03','southern'),
('R04','North'),
('R05','Centrl'),
('R06','Uva'),
('R07','Western');

-- create City
CREATE TABLE city (
  City_Id varchar(10) NOT NULL,
  City_Name varchar(25) NOT NULL,
  Region_Id varchar(20) ,
  PRIMARY KEY (City_Id),
  UNIQUE KEY  (City_Name),
  constraint fk_city_region 
  foreign key(Region_Id) references region(regionId)
	ON DELETE CASCADE
	ON UPDATE CASCADE
) ;

insert into city values
('C01','Anuradhapura','R01'),
('C02','Polonnaruwa','R01'),
('C03','Ampara','R02'),
('C04','Trincomalee','R02'),
('C05','Hambanthota','R03'),
('C06','Mathara','R03'),
('C07','Galle','R03'),
('C08','Jaffna','R04'),
('C09','Kandy','R06'),
('C10','Mathale','R04'),
('C11','Badulla','R06'),
('C12','Avissawella','R07');

-- CREATE FARMER
CREATE TABLE Farmer (
  Farmer_Id varchar(10) NOT NULL,
  Farmer_Name varchar(30) NOT NULL ,
  Farmer_Home_Number varchar(10) ,
  Farmer_City_Id varchar(20) ,
  Farmer_Region_Id varchar(20),
  PRIMARY KEY (Farmer_Id),
  UNIQUE KEY (Farmer_Home_Number,Farmer_City_Id),
  constraint fk_farmer_city
	foreign key(farmer_city_id) references city(city_id)
	on delete set null
	on update cascade,
     constraint fk_farmer_REGION
foreign key(farmer_region_Id) references region(regionid)
on delete set null
on update cascade
) ;

insert into farmer values
('F01', 'Saman Kumara', '67', 'C01','R01'),
('F02', 'Nilmini Perera', '89', 'C02','R01'),
('F03', 'Dhanaka Jayasekara', '23', 'C03','R02'),
('F04', 'Ananda Jayawardana', '31', 'C07','R03'),
('F05', 'Sunil Fernando', '56', 'C04','R02'),
('F06', 'Lalitha Rodrigo', '78', 'C05','R03'),
('F07', 'Rohan Wickramasekera', '12', 'C06','R03'),
('F08', 'Nimal Perera', '45', 'C07','R03'),
('F09', 'Amila Fernando', '90', 'C08','R04'),
('F10', 'Indira Jayasekara', '34', 'C09','R05'),
('F11', 'Dulanjaya Rodrigo', '67', 'C10','R05'),
('F12', 'Lakmal Wickramasekera', '89', 'C11','R06'),
('F13', 'Swarna Perera', '23', 'C01','R01'),
('F14', 'Kumara Fernando', '56', 'C02','R01'),
('F15', 'Nilmini Jayasekara', '78', 'C03','R02'),
('F16', 'Dhanaka Rodrigo', '12', 'C04','R02'),
('F17', 'Sunil Perera', '45', 'C05','R03'),
('F18', 'Lalitha Fernando', '90', 'C06','R03'),
('F19', 'Rohan Jayasekera', '34', 'C07','R03'),
('F20', 'Nimal Rodrigo', '67', 'C12','R07');

-- create emailsoffarmers
CREATE TABLE emailsoffarmers (
  Email varchar(80) NOT NULL,
  Farmer_Id varchar(5) ,
  PRIMARY KEY (Email),
  CONSTRAINT fk_email_farmer foreiGN KEY (farmer_Id) REFERENCES farmer(farmer_Id) 
  ON DELETE cascade
  ON UPDATE CASCADE
);
INSERT INTO emailsoffarmers
VALUES
('ananda.perera@gmail.com', 'F01'),
('saman.kumara@gmail.com', 'F02'),
('nilmini.perera@gmail.com', 'F03'),
('dhanaka.jayasekara@gmail.com', 'F04'),
('sunil.fernando@gmail.com', 'F05'),
('lalitha.rodrigo@gmail.com', 'F06'),
('rohan.wickramasekera@gmail.com', 'F07'),
('nimal.perera@gmail.com', 'F08'),
('amila.fernando@gmail.com', 'F09'),
('indira.jayasekara@gmail.com', 'F10'),
('dulanjaya.rodrigo@gmail.com', 'F11'),
('lakmal.wickramasekera@gmail.com', 'F12'),
('swarna.perera@gmail.com', 'F13'),
('kumara.fernando@gmail.com', 'F14'),
('nilmini.jayasekara@gmail.com', 'F15'),
('dhanaka.rodrigo@gmail.com', 'F16'),
('sunil.perera@gmail.com', 'F17'),
('lalitha.fernando@gmail.com', 'F18'),
('rohan.jayasekera@gmail.com', 'F19'),
('nimal.rodrigo@gmail.com', 'F20'),
('swarna.pea@gmail.com', 'F13'),
('amila.fernando12@gmail.com', 'F14');

-- create contact_numbers_farmers
CREATE TABLE Contact_numbers_Farmers (
  contact_Number varchar(10) ,
  Farmer_Id varchar(5),
  PRIMARY KEY (contact_Number),
  constraint fk_Farmer_Mobile
  foreign key(Farmer_id)
  references farmer(farmer_id)
  on update cascade
  on delete cascade
 );
 
 insert into contact_numbers_farmers values
('0718890111', 'F01'),
('0788890122', 'F01'),
('0719990133', 'F02'),
('0779990144', 'F03'),
('0711110155', 'F04'),
('0771110166', 'F05'),
('0712220177', 'F06'),
('0772220188', 'F07'),
('0713330199', 'F08'),
('0773330200', 'F09'),
('0714440211', 'F10'),
('0774440222', 'F11'),
('0715550233', 'F12'),
('0775550244', 'F13'),
('0716660255', 'F14'),
('0776660266', 'F15'),
('0717770277', 'F16'),
('0775526423', 'F20');

-- create land
CREATE TABLE land (
  Land_Id varchar(10) NOT NULL,
  Farmer_Id varchar(25),
  PRIMARY KEY (Land_Id),
  constraint fk_land_farmer
  foreign key(farmer_id)
  references farmer(Farmer_id)
  on update cascade
  on delete cascade
); 
insert into land values
('L01','F01'),
('L02', 'F01'),
('L03', 'F02'),
('L04', 'F03'),
('L05', 'F04'),
('L06', 'F05'),
('L07', 'F06'),
('L08', 'F07'),
('L09', 'F08'),
('L10', 'F09'),
('L11', 'F10'),
('L12', 'F11'),
('L13', 'F12'),
('L14', 'F13'),
('L15', 'F14'),
('L16', 'F15'),
('L17', 'F16'),
('L18', 'F17'),
('L19', 'F18'),
('L20', 'F19'),
('L21', 'F20');

-- create weather
CREATE TABLE weather (
  Region_Id varchar(30) ,
  Temperature float ,
  Humidity float ,
  Precipitation float ,
  Weather_Date varchar(30),
  PRIMARY KEY (Region_Id,Weather_Date),
  CONSTRAINT fk_Weather_Region FOREIGN KEY (Region_Id) REFERENCES region(RegionId) 
  ON DELETE CASCADE ON UPDATE CASCADE
) ;

insert into weather values
('R01', 33, 95, 200, 2023/5),
('R02', 35, 100, 225, 2023/5),
('R03', 37, 105, 250, 2023/5),
('R04', 39, 110, 275, 2023/5),
('R05', 41, 115, 300, 2023/5),
('R06', 43, 120, 325, 2023/5),
('R01', 33, 95, 200, 2023/6),
('R02', 35, 100, 225, 2023/6),
('R03', 37, 105, 250, 2023/6),
('R04', 39, 110, 275, 2023/6),
('R05', 41, 115, 300, 2023/6),
('R06', 43, 120, 325, 2023/6),
('R01', 33, 95, 200, 2023/7),
('R02', 35, 100, 225, 2023/7),
('R03', 37, 105, 250, 2023/7),
('R04', 39, 110, 275, 2023/7),
('R05', 41, 115, 300, 2023/7),
('R06', 43, 120, 325, 2023/7),
('R07', 30, 100, 200, 2023/7);

-- create request
CREATE TABLE request (
  Request_Id varchar(30) ,
  Farmer_id varchar(20),
  Request_Date date NOT NULL,
  Request varchar(1000) NOT NULL,
  primary key(request_id),
  CONSTRAINT fk_request_farmer FOREIGN KEY (Farmer_Id) REFERENCES Farmer(Farmer_Id) 
  ON DELETE CASCADE 
  ON UPDATE CASCADE
);
insert into request values
('Rq001', 'F01', '2023-09-08', 'pesticides'),
('Rq002', 'F01', '2023-09-10', 'Seed Instruction'),
('Rq003', 'F02', '2023-09-09', 'Fertilizer'),
('Rq004', 'F02', '2023-09-15', 'Water Pump'),
('Rq005', 'F03', '2023-09-11', 'Tractor'),
('Rq006', 'F04',  '2023-09-12', 'pesticides'),
('Rq007', 'F05', '2023-09-13', 'Seed Instruction'),
('Rq008', 'F06',  '2023-09-14', 'Fertilizer'),
('Rq009', 'F07', '2023-09-16', 'Water Pump'),
('Rq010', 'F08',  '2023-09-17', 'Tractor'),
('Rq011', 'F09', '2023-09-18', 'pesticides'),
('Rq012', 'F10',  '2023-09-19', 'Seed Instruction'),
('Rq013', 'F11', '2023-09-20', 'Fertilizer');

-- create FarmerCommitee
CREATE TABLE FarmerCommitee (
	RepresentativeId varchar(20),
	RegionId varchar(10) ,
	PRIMARY KEY (RegionId),
	CONSTRAINT fk_commitee_farmer FOREIGN KEY (RepresentativeId) REFERENCES Farmer(Farmer_Id) 
	ON DELETE set null
	ON UPDATE CASCADE,
    CONSTRAINT fk_commitee_region  foreiGN KEY (RegionId) REFERENCES region(regionId) 
	ON DELETE cascade
	ON UPDATE CASCADE
) 	;

insert into FarmerCommitee values('F01','R01');
insert into FarmerCommitee values('F03','R02');
insert into FarmerCommitee values('F06','R03');
insert into FarmerCommitee values('F09','R04');
insert into FarmerCommitee values('F11','R05');
insert into FarmerCommitee values('F12','R06');
insert into FarmerCommitee values('F20','R07');

-- create crop
CREATE TABLE crop (
  crop_Id varchar(20) ,
  crop_name varchar(30),
  primary key(crop_id)
) ;

insert into crop values
('CR01','Carrot'),
('CR02', 'Onion'),
('CR03', 'Potato'),
('CR04', 'Tomato'),
('CR05', 'Cabbage'),
('CR06', 'Bean'),
('CR07', 'Chilli'),
('CR08', 'Ginger'),
('CR09', 'Garlic');

-- create crop_farmer
CREATE TABLE crop_farmer (
  Land_Id varchar(20) ,
  crop_Id varchar(20) ,
  size float NOT NULL,
  Plant_Date date NOT NULL,
  PRIMARY KEY (Land_Id,crop_Id,plant_date),
  CONSTRAINT fk_crop_land foreign key  (Land_Id) REFERENCES land(land_Id) 
  ON DELETE cascade
  ON UPDATE CASCADE,
  CONSTRAINT fk_cropframer_crop foreign key (crop_Id) REFERENCES crop(crop_Id) 
  ON DELETE cascade
  ON UPDATE CASCADE
) ;


INSERT INTO crop_farmer (Land_Id, crop_Id, size, Plant_Date)
VALUES
    ('L01', 'CR01', 1.5, '2023-08-01'),
    ('L02', 'CR02', 2.0, '2023-08-02'),
    ('L03', 'CR03', 1.8, '2023-08-03'),
    ('L04', 'CR04', 2.5, '2023-08-04'),
    ('L05', 'CR05', 1.2, '2023-08-05'),
    ('L06', 'CR06', 2.3, '2023-08-06'),
    ('L07', 'CR07', 1.6, '2023-08-07'),
    ('L08', 'CR08', 1.7, '2023-08-08'),
    ('L09', 'CR09', 1.9, '2023-08-09'),
    ('L10', 'CR01', 1.4, '2023-08-10'),
    ('L11', 'CR02', 2.2, '2023-08-11'),
    ('L12', 'CR03', 1.5, '2023-08-12'),
    ('L13', 'CR04', 2.7, '2023-08-13'),
    ('L14', 'CR05', 1.1, '2023-08-14'),
    ('L15', 'CR06', 2.4, '2023-08-15'),
    ('L16', 'CR07', 1.8, '2023-08-16'),
    ('L17', 'CR08', 1.6, '2023-08-17'),
    ('L18', 'CR09', 2.0, '2023-08-18'),
    ('L19', 'CR01', 1.3, '2023-08-19'),
    ('L20', 'CR02', 2.3, '2023-08-20'),
    ('L10', 'CR03', 1.7, '2023-08-21'),
    ('L20', 'CR04', 2.8, '2023-08-22'),
    ('L08', 'CR05', 1.0, '2023-08-23'),
    ('L03', 'CR06', 2.1, '2023-08-24'),
    ('L05', 'CR07', 1.9, '2023-08-25'),
    ('L02', 'CR08', 1.4, '2023-08-26'),
    ('L01', 'CR09', 2.2, '2023-08-27'),
    ('L12', 'CR01', 1.6, '2023-08-28'),
    ('L11', 'CR02', 2.4, '2023-08-29'),
    ('L10', 'CR03', 1.2, '2023-08-30'),
    ('L21', 'CR08', 1.0, '2023-08-15');

-- create harvest
CREATE TABLE harvest (
  Harvest_id varchar(30),
  crop_Id varchar(20),
  Farmer_Price float NOT NULL,
  Quantity float NOT NULL,
  Harvest_date date NOT NULL,
  PRIMARY KEY (Harvest_Id),
  CONSTRAINT fk_Harvest_crop FOREIGN KEY (crop_Id) REFERENCES crop_farmer(crop_Id) 
  ON DELETE set null
  ON UPDATE CASCADE
) ;
INSERT INTO harvest (Harvest_id, crop_Id, Farmer_Price, Quantity, harvest_date)
VALUES
  ('H001', 'CR01', 2.5, 100, '2023-09-10'),
  ('H002', 'CR02', 1.8, 75, '2023-09-11'),
  ('H003', 'CR03', 2.0, 120, '2023-09-12'),
  ('H004', 'CR04', 3.0, 90, '2023-09-13'),
  ('H005', 'CR05', 1.2, 50, '2023-09-14'),
  ('H006', 'CR06', 2.8, 80, '2023-09-15'),
  ('H007', 'CR07', 2.2, 60, '2023-09-16'),
  ('H008', 'CR08', 3.5, 45, '2023-09-17'),
  ('H009', 'CR09', 2.0, 70, '2023-09-18'),
  ('H010', 'CR01', 2.7, 110, '2023-09-19');

-- create product
create table product(
crop_id varchar(30),
product_Id varchar(30),
product_name varchar(30),
product_price float,
CONSTRAINT fk_crop_product  FOREIGN KEY (crop_Id) REFERENCES crop(crop_Id) 
ON DELETE cascade
ON UPDATE CASCADE,
unique key(product_name),
primary key(product_id)
);

INSERT INTO product (crop_id, product_id, product_name, product_price)
VALUES
('CR01', 'P01', 'Carrot Juice', 150),
('CR01', 'P02', 'Carrot Chips', 220),
('CR01', 'P03', 'Carrot Salad', 390),
('CR02', 'P04', 'Onion Rings', 499),
('CR02', 'P05', 'Onion Soup', 529),
('CR02', 'P06', 'Onion Pickles', 69),
('CR03', 'P07', 'Potato Chips', 75),
('CR03', 'P08', 'Potato Wedges', 88),
('CR03', 'P09', 'Mashed Potato', 99),
('CR04', 'P10', 'Tomato Soup', 102),
('CR04', 'P11', 'Tomato Ketchup', 19),
('CR04', 'P12', 'Tomato Salad', 129),
('CR05', 'P13', 'Cabbage Salad', 191),
('CR06', 'P14', 'Bean Curry', 142),
('CR06', 'P15', 'Bean Soup', 153),
('CR07', 'P16', 'Chilli Paste', 162),
('CR07', 'P17', 'Chilli Flakes', 171),
('CR08', 'P18', 'Ginger Tea', 181),
('CR08', 'P19', 'Ginger Garlic Paste', 190),
('CR09', 'P20', 'Garlic Bread', 20);

-- create customer
CREATE TABLE customer (
  customer_Id varchar(30) ,
  Cus_Name varchar(30) ,
  home_number varchar(10) NOT NULL,
  city_id varchar(30) ,
  PRIMARY KEY (customer_Id),
  UNIQUE KEY (home_number,city_id),
  CONSTRAINT fk_customer_city foreiGN KEY (city_Id) REFERENCES city(city_Id) 
  ON DELETE cascade
  ON UPDATE CASCADE
);

INSERT INTO customer (customer_Id, Cus_Name, home_number, city_id)
VALUES
    ('Cust01', 'John Silva', '01', 'C01'),
    ('Cust02', 'Ama Fernando', '02', 'C02'),
    ('Cust03', 'Adeesha Perera', '03', 'C03'),
    ('Cust04', 'Kavindu De Silva', '04', 'C04'),
    ('Cust05', 'Nethmi Gunawardana', '05', 'C05'),
    ('Cust06', 'Shakila Jayasuriya', '06', 'C06'),
    ('Cust07', 'Ashen Wickramasinghe', '07', 'C07'),
    ('Cust08', 'Oshan Pathirana', '08', 'C08'),
    ('Cust09', 'Sarah Rajapaksa', '09', 'C09'),
    ('Cust10', 'Oshan Perumal', '10', 'C10');
    
-- create customer_contact_numbers
CREATE TABLE customer_contact_numbers (
  customer_Id varchar(30) ,
  contact_number varchar(30) NOT NULL,
  PRIMARY KEY (contact_number),
  CONSTRAINT fk_contactNumber_customer foreiGN KEY (customer_Id) REFERENCES customer(customer_Id) 
  ON DELETE cascade
  ON UPDATE CASCADE
) ;

INSERT INTO customer_contact_numbers (customer_Id, contact_number)
VALUES
    ('Cust01', '0712345678'),
    ('Cust02', '0723456789'),
    ('Cust03', '0734567890'),
    ('Cust04', '0745678901'),
    ('Cust05', '0756789012'),
    ('Cust06', '0767890123'),
    ('Cust07', '0778901234'),
    ('Cust08', '0789012345');

-- create orders
CREATE TABLE orders (
  order_Id varchar(30) ,
  product_Id varchar(30) ,
  customer_Id varchar(30) ,  
 order_date date NOT NULL,
  quantity float NOT NULL,
  PRIMARY KEY (order_Id),
  UNIQUE KEY  (product_Id,customer_Id,order_date),
  CONSTRAINT fk_product_order foreign key(product_id) 
  references product(product_id)
   ON DELETE CASCADE ON UPDATE CASCADE,
   
  CONSTRAINT fk_product_customer
  foreign key(customer_id)
  references customer(customer_id)
   ON DELETE CASCADE ON UPDATE CASCADE
) ;

INSERT INTO orders (order_Id, product_Id, customer_Id, order_date, quantity)
VALUES
    ('Order01', 'P01', 'Cust01', '2023-09-10', 5),
    ('Order02', 'P04', 'Cust02', '2023-09-11', 3),
    ('Order03', 'P07', 'Cust03', '2023-09-12', 2.5),
    ('Order04', 'P10', 'Cust04', '2023-09-13', 4),
    ('Order05', 'P13', 'Cust05', '2023-09-14', 3.2),
    ('Order06', 'P16', 'Cust06', '2023-09-15', 2),
    ('Order07', 'P10', 'Cust02', '2023-09-18', 7);

-- create disease
CREATE TABLE disease (
  diseas_Id varchar(30) ,
  disease_Name varchar(30) ,
  PRIMARY KEY (diseas_Id),
  UNIQUE KEY (disease_Name)
) ;

insert into disease values
('D0101', 'Leaf Rust'),
('D0102', 'Bacterial Leaf Blight'),
('D0103', 'Fusarium Wilt'),
('D0104', 'Powdery Mildew'),
('D0105', 'Downy Mildew'),
('D0106', 'Early Blight'),
('D0107', 'Fire Blight');

-- create Land_diseases
create table Land_diseases(
	InformId varchar(30),
	land_id varchar(30),
	diseas_id varchar(30),
	StillSuffer bool,
	CONSTRAINT fk_land_diseas 
    foreign key(land_id)
	references land(land_id)
	ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_diseas_diseas
	foreign key(diseas_id)
	references disease(diseas_id)
	ON DELETE CASCADE ON UPDATE CASCADE,
	primary key(InformId)
);

INSERT INTO Land_diseases (informid, land_id, diseas_id, StillSuffer)
VALUES
  ('Inform001', 'L01', 'D0101', true),
  ('Inform002', 'L02', 'D0102', false),
  ('Inform003', 'L03', 'D0103', true),
  ('Inform004', 'L04', 'D0104', false),
  ('Inform005', 'L05', 'D0105', true),
  ('Inform006', 'L06', 'D0106', false),
  ('Inform007', 'L07', 'D0101', true),
  ('Inform008', 'L08', 'D0102', false),
  ('Inform009', 'L09', 'D0103', true),
  ('Inform010', 'L10', 'D0104', false),
  ('Inform011', 'L11', 'D0105', true),
  ('Inform012', 'L12', 'D0106', false),
  ('Inform013', 'L13', 'D0101', true),
  ('Inform014', 'L14', 'D0102', false),
  ('Inform015', 'L15', 'D0103', true);
  
-- create fertilizer
CREATE TABLE fertilizer (
  Fertilizer_Id varchar(20) NOT NULL,
  Fertilizer_Name varchar(30) NOT NULL,
  PRIMARY KEY (Fertilizer_Id)
);


INSERT INTO fertilizer (Fertilizer_Id, Fertilizer_Name)
VALUES
  ('Fr01', 'Nitrogenous Fertilizer'),
  ('Fr02', 'Phosphatic Fertilizer'),
  ('Fr03', 'Potassic Fertilizer'),
  ('Fr04', 'Organic Fertilizer'),
  ('Fr05', 'Micronutrient Fertilizer'),
  ('Fr06', 'Compound Fertilizer'),
  ('Fr07', 'Urea');
  
-- create fertilizer_order
CREATE TABLE fertilizer_order (
  Order_Id varchar(30) NOT NULL,
  Farmer_Id varchar(10),
  Fertilizer_Id varchar(10),
  Quantity float NOT NULL,
  PRIMARY KEY (Order_Id),
  CONSTRAINT fk_fertilizer_order_farmer FOREIGN KEY (Farmer_Id) REFERENCES Farmer(Farmer_Id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_fertilizer_order_fertilizer FOREIGN KEY (Fertilizer_Id) REFERENCES fertilizer(Fertilizer_Id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO fertilizer_order (Order_Id, Farmer_Id, Fertilizer_Id, Quantity)
VALUES
  ('FO001', 'F01', 'Fr01', 50.0),
  ('FO002', 'F05', 'Fr02', 75.0),
  ('FO003', 'F03', 'Fr03', 60.0),
  ('FO004', 'F04', 'Fr04', 80.0),
  ('FO005', 'F05', 'Fr05', 65.0),
  ('FO006', 'F06', 'Fr06', 70.0),
  ('FO007', 'F04', 'Fr03', 60.0);
  


-- updates and deletes

-- Region table
update region
set Region_Name = 'North' where RegionId = 'R04';
update region
set Region_Name = 'Central' where RegionId = 'R05';
Delete from region
where RegionId = 'R07';

select * from region;

-- City table
update city
set City_Name = 'Nuwara Eliya' where City_Id = 'C10';
update city
set Region_Id = 'R05' where City_Id = 'C09';
Delete from city
where City_Id = 'C12';

select *from city;

-- Farmer table
update farmer
set Farmer_Name = 'Kumari Fernando', Farmer_Home_Number = '60'
where Farmer_Id = 'F14';
update farmer
set Farmer_City_Id = 'C03', Farmer_Region_Id = 'R02'
where Farmer_Id = 'F09';
Delete from farmer
where Farmer_Id = 'F20';

select * from farmer;

-- emailsoffarmers
update emailsoffarmers
set Email = 'anandaperera@ymail.com' 
where Email = 'ananda.perera@gmail.com';
update emailsoffarmers
set Email = 'kumarifernando@ymail.com'
where Email = 'kumara.fernando@gmail.com';
Delete from emailsoffarmers
where Email = 'amila.fernando12@gmail.com';

select * from emailsoffarmers;

-- contact_numbers_farmers
update Contact_numbers_farmers
set contact_Number = '0752266984'
where Farmer_Id = 'F16';
update Contact_numbers_farmers
set contact_Number = '0784589321'
where Farmer_Id = 'F10';
Delete from contact_numbers_farmers
where Farmer_Id = 'F20';

select * from contact_numbers_farmers;

-- land
update land
set Farmer_Id = 'F03' where Land_Id = 'L06';
update land
set Farmer_Id = 'F19' where Land_Id = 'L04';
Delete from land
where Land_Id = 'L21';

select * from land;

-- weather
update weather
set Temperature = 28, Humidity = 100
where Region_Id = 'R05' and Weather_Date = '2023/06';
update weather
set Precipitation = 275
where Region_Id = 'R06' and Weather_Date = '2023/07';
Delete from weather
where Region_Id = 'R01' and Weather_Date = '2023/05';

select * from weather;

-- request
update request
set Request_Date = '2023-09-15'
where Request_Id = 'Rq006';
update request
set Request = 'Need seeds'
where Request_Id = 'Rq012';
Delete from request
where Request_Id = 'Rq001';

select * from request;

-- FarmerCommitee
update FarmerCommitee
set RepresentativeId = 'F02'
where RegionId = 'R01';
update FarmerCommitee
set RepresentativeId = 'F15'
where RegionId = 'R02';
Delete from FarmerCommitee
where RegionId = 'R07';

select * from FarmerCommitee;

-- crop
update crop
set crop_name = 'Rice'
where crop_Id = 'CR07';
update crop
set crop_name = 'Brinjal'
where crop_Id = 'CR02';
Delete from crop
where crop_Id = 'CR09';

select * from crop;

-- crop_farmer
update crop_farmer
set size = 3
where Land_Id = 'L06' and crop_Id = 'CR06' and plant_date = '2023-08-06';
update crop_farmer
set crop_Id = 'CR08'
where Land_Id = '19' and crop_Id = '1.3' and plant_date = '2023-08-19';
Delete from crop_farmer
where Land_Id = 'L21' and crop_Id = 'CR08' and plant_date = '2023-08-15';

select * from crop_farmer;

-- harvest
update harvest
set Quantity = 5
where Harvest_id = 'H002';
update harvest
set crop_Id = 'CR02', Farmer_Price = '150' 
where Harvest_id = 'H002';
Delete from harvest
where Harvest_id = 'H010';

select * from harvest;

-- product
update product
set product_price = 200
where product_id = 'P01';
update product
set product_name = 'Garlic Paste'
where product_id = 'P20';
Delete from product
where product_id = 'P17';

select * from product;

-- customer
update customer
set Cus_Name = 'John Perera'
where customer_Id = 'Cust01';
update customer
set city_id = 'C08'
where customer_Id = 'Cust07';
Delete from customer
where customer_Id = 'Cust10';

select * from customer;

-- customer_contact_numbers
update customer_contact_numbers
set contact_number = '0785643212'
where customer_Id = 'Cust06';
update customer_contact_numbers
set contact_number = '0756941235'
where customer_Id = 'Cust08';
Delete from customer_contact_numbers
where contact_number = '0789012345';

select * from customer_contact_numbers;

-- orders
update orders
set quantity = 6 
where order_Id = 'Order05';
Update orders
set order_date = '2023-09-06'
where order_Id = 'Order03';
Delete from orders
where order_Id = 'Order07';

select * from orders;

-- disease
update disease
set disease_Name = 'Nematode Diease'
where diseas_Id = 'D0101';
update disease
set disease_Name = 'Potato Leafroll Virus'
where diseas_Id = 'D0103';
Delete from disease
where diseas_Id = 'D0107';

select * from disease;

-- Land_diseases
update Land_diseases
set diseas_id = 'D0103'
where InformId = 'Inform005';
update Land_diseases
set StillSuffer = false
where InformId = 'Inform001';
Delete from Land_diseases
where InformId = 'Inform014';

select * from Land_diseases;

-- fertilizer
update fertilizer
set Fertilizer_Name = 'Biofertilizer'
where Fertilizer_Id = 'Fr01';
update fertilizer
set Fertilizer_Name = 'Liquid Fertilizer'
where Fertilizer_Id = 'Fr06';
Delete from fertilizer
where Fertilizer_Id = 'Fr07';

select * from fertilizer;

-- fertilizer_order
update fertilizer_order
set Quantity = 30
where Order_Id = 'FO001';
update fertilizer_order
set Fertilizer_Id = 'Fr03'
where Order_Id = 'FO004';
Delete from fertilizer_order
where Order_Id = 'Fr007';

select * from fertilizer_order;