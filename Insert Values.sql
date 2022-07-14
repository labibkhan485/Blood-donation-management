set lines 256;
set trimout on;
set tab off;


-- Blood table information
insert into Blood(blood_id,blood_type,cost_taka_per_bag,quantity_stock) values(1,'A+',100,400);
insert into Blood(blood_id,blood_type,cost_taka_per_bag,quantity_stock) values(2,'A-',800,30);
insert into Blood(blood_id,blood_type,cost_taka_per_bag,quantity_stock) values(3,'B+',150,350);
insert into Blood(blood_id,blood_type,cost_taka_per_bag,quantity_stock) values(4,'B-',1000,25);
insert into Blood(blood_id,blood_type,cost_taka_per_bag,quantity_stock) values(5,'AB+',130,380);
insert into Blood(blood_id,blood_type,cost_taka_per_bag,quantity_stock) values(6,'AB-',900,28);
insert into Blood(blood_id,blood_type,cost_taka_per_bag,quantity_stock) values(7,'O+',100,400);
insert into Blood(blood_id,blood_type,cost_taka_per_bag,quantity_stock) values(8,'O-',1000,27);



--Manager table information
insert into Manager(employee_id,manager_name,contact) values(1001,'Rakib','01881897449');
insert into Manager(employee_id,manager_name,contact) values(1002,'Mahin','01756189744');
insert into Manager(employee_id,manager_name,contact) values(1003,'Shihab','01749189744');
insert into Manager(employee_id,manager_name,contact) values(1004,'Pushan','01532165470');

--Employee table information
insert into employee(employee_id,employee_name,contact_no,manager_id) values(1005,'John','01881431490',1001);
insert into employee(employee_id,employee_name,contact_no,manager_id) values(1006,'Kabir','01321456719',1002);
insert into employee(employee_id,employee_name,contact_no,manager_id) values(1007,'Haily','01934567891',1001);
insert into employee(employee_id,employee_name,contact_no,manager_id) values(1008,'Depp','01819765321',1003);

--Donor table information
insert into Donor(donor_id,donor_name,donor_blood,contact_number,blood_id,register_employee_id) values(101,'Labib','A+','01834437149',1,1005);
insert into Donor(donor_id,donor_name,donor_blood,contact_number,blood_id,register_employee_id) values(102,'Rownak','A-','0134123480',2,1006);
insert into Donor(donor_id,donor_name,donor_blood,contact_number,blood_id,register_employee_id) values(103,'Shuvo','B+','01756291819',3,1005);
insert into Donor(donor_id,donor_name,donor_blood,contact_number,blood_id,register_employee_id) values(104,'Tanim','A+','01919326545',1,1007);
--Hospital table information
insert into Hospital(hospital_name,hospital_id,address,order_blood_id,order_blood_type,order_quantity,phone_no) values('DMC',111,'Dhaka',1,'A+',50,'01709584321');
insert into Hospital(hospital_name,hospital_id,address,order_blood_id,order_blood_type,order_quantity,phone_no) values('Sadar Hospital',112,'Khulna',2,'A-',10,'01905561447');


describe Blood;
describe Manager;
describe employee;
describe Donor;
describe Hospital;

select * from Blood;
select * from Manager;
select * from employee;
select * from Donor;
select * from Hospital;
