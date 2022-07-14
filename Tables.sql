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
    address varchar(30),
    order_blood_id number(3) NOT NULL,
    order_quantity number(3),
    order_blood_type varchar(30),
    phone_no varchar(30),
    primary key(hospital_id),
    foreign key(order_blood_id) references Blood(blood_id)
);



