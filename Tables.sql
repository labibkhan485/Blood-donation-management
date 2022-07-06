set lines 256;
set trimout on;
set tab off;
drop table Donor;
drop table employee;
drop table Hospital;
drop table Manager;
drop table Blood;
create table Blood(
    blood_id number(3) NOT NULL,
    blood_type varchar(30),
    cost_taka_per_bag number(5),
    quantity_stock number(5),
    primary key(blood_id)
);


create table Manager(
    employee_id number(4) NOT NULL,
    manager_name varchar(30),
    contact varchar(30),
    primary key(employee_id)
);
create table employee(
    employee_id number(4) NOT NULL,
    employee_name varchar(30),
    contact_no varchar(30),
    manager_id number(4) NOT NULL,
    primary key(employee_id),
    foreign key(manager_id) references Manager(employee_id)
);
create table Donor(
    donor_id number(3) NOT NULL,
    donor_name varchar(30),
    donor_blood varchar(30),
    contact_number varchar(30),
    blood_id number(3) NOT NULL,
    register_employee_id number(4) NOT NULL,
    primary key(donor_id),
    foreign key(blood_id) references Blood,
    foreign key(register_employee_id) references employee(employee_id)
);
create table Hospital(
    hospital_id number(4) NOT NULL,
    hospital_name varchar(30) NOT NULL,
    address varchar(100),
    order_blood_id number(3) NOT NULL,
    order_quantity number(3),
    order_blood_type varchar(30),
    phone_no varchar(30),
    primary key(hospital_id),
    foreign key(order_blood_id) references Blood(blood_id)
);
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



