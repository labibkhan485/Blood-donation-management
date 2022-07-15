set lines 256;
set trimout on;
set tab off;
--Lab 02
--add column
Alter table Blood add temp_column varchar(20);
describe Blood;
select * from Blood;

--drop column
Alter table Blood drop column temp_column;
describe Blood;
select * from Blood;

--modify column data type
Alter table Blood modify blood_type varchar(40);
describe Blood;

--rename column
Alter table Blood 
rename column cost_taka_per_bag to cost_per_bag;
describe Blood;
select * from Blood;
Alter table Blood 
rename column   cost_per_bag to cost_taka_per_bag ;
describe Blood;
select * from Blood;

--delete row 
select * from Donor;
delete from Donor 
where donor_name = 'Labib';
select * from Donor;
insert into Donor(donor_id,donor_name,donor_blood,contact_number,blood_id,register_employee_id) values(101,'Labiba','A+','01834437149',1,1005);
select * from Donor;

--update
update Donor
  set donor_name ='Labib' where donor_id = 101;
select * from Donor;

--Lab 03
--calculations and renaming columns
select (cost_taka_per_bag/5) as reduced_cost_per_bag from Blood where blood_type ='A-';

--applying conditions
select * from blood;
select * from blood where cost_taka_per_bag > 150;

--range search
select * from blood;
select * from blood where cost_taka_per_bag between 800 and 1000;

--membership
select * from Hospital; 
select hospital_name,address,phone_no 
from Hospital
where address like '%ulna%';

--ordering by column values
select * from blood;
select * from blood order by cost_taka_per_bag;
select * from blood order by cost_taka_per_bag,quantity_stock;

--Lab 04
--aggregate functions
select max(cost_taka_per_bag) from blood;
select min(cost_taka_per_bag) from blood;
select count(blood_type) from blood;
select count(*) from blood;
select avg(cost_taka_per_bag) from blood;

--group by clause
select cost_taka_per_bag,count(blood_type)
from blood
group by cost_taka_per_bag;

--having clause
select cost_taka_per_bag,count(blood_type)
from blood
group by cost_taka_per_bag
having cost_taka_per_bag<800;

--Lab 05
--IN
select donor_id,donor_name
from Donor
where donor_name in(select donor_name from Donor where donor_blood='A+');

--UNION
select * from Blood where quantity_stock>350
UNION select * from Blood where quantity_stock<30;

--Intersect
select * from Blood 
Intersect select * from Blood where quantity_stock<30;

--Minus
select * from Blood 
Minus select * from Blood where quantity_stock<30;

--Lab 06
--simple join
select b.blood_id,b.blood_type,b.quantity_stock,b.cost_taka_per_bag,d.donor_name,d.donor_id
from Blood b join Donor d
on b.blood_id = d.blood_id;

--natural join
select b.blood_type,b.quantity_stock,b.cost_taka_per_bag,d.donor_name,d.donor_id
from Blood b natural join Donor d;

--inner join
select b.blood_id,b.blood_type,b.quantity_stock,b.cost_taka_per_bag,d.donor_name,d.donor_id
from Blood b inner join Donor d
on b.blood_id = d.blood_id;

--Outer join
select b.blood_id,b.blood_type,b.quantity_stock,b.cost_taka_per_bag,d.donor_name,d.donor_id
from Blood b left outer join Donor d
on b.blood_id = d.blood_id;
select b.blood_id,b.blood_type,b.quantity_stock,b.cost_taka_per_bag,d.donor_name,d.donor_id
from Blood b right outer join Donor d
on b.blood_id = d.blood_id;
select b.blood_id,b.blood_type,b.quantity_stock,b.cost_taka_per_bag,d.donor_name,d.donor_id
from Blood b full outer join Donor d
on b.blood_id = d.blood_id;


