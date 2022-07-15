set lines 256;
set trimout on;
set tab off;

--Lab 07
--Normal pl/sql
SET SERVEROUTPUT ON 
declare
  donorName Donor.donor_name%type;
  donorId Donor.donor_id%type :=101;
Begin
  select donor_name into donorName
  from donor
  where donor_id = donorId;
  dbms_output.put_line('Name of the donor :'||donorName);
END;
/

--IF...Else
SET SERVEROUTPUT ON 
declare
  full_price blood.cost_taka_per_bag%type;
  bloodType blood.blood_type%type :='A-';
  discount_price blood.cost_taka_per_bag%type :=500;
Begin
  select cost_taka_per_bag into full_price
  from blood
  where blood_type = bloodType;
  
  IF full_price>500 then
    full_price :=  discount_price;
  Else
    full_price := full_price;
  END IF;
  dbms_output.put_line('Price of one bag of '||bloodType||' is '||full_price);
END;
/

--Lab 08
--cursor and loop
SET SERVEROUTPUT ON 
declare
  cursor blood_cur is select blood_id,blood_type,cost_taka_per_bag from blood;
  blood_cost blood_cur%ROWTYPE;
Begin
  open blood_cur;
  loop
    fetch blood_cur into blood_cost;
    exit when blood_cur%ROWCOUNT>6;
    dbms_output.put_line('Blood id: '||blood_cost.blood_id||' Blood type: '||blood_cost.blood_type||' Per bag cost:'||blood_cost.cost_taka_per_bag||'taka');
    end loop;
    close blood_cur;
END;
/

--plsql procedure 

SET SERVEROUTPUT ON 
create or replace procedure getName IS
  donorName Donor.donor_name%type;
  donorId Donor.donor_id%type :=101;
Begin
  select donor_name into donorName
  from donor
  where donor_id = donorId;
  dbms_output.put_line('Name of the donor :'||donorName);
END;
/
Begin
  getName;
END;
/

--pl/sql function
create or replace function average_cost return number is
avg_cost blood.cost_taka_per_bag%type;
Begin
  select AVG(cost_taka_per_bag) into avg_cost
  from blood;
  return avg_cost;
END;
/
set SERVEROUTPUT on
Begin dbms_output.put_line('Average cost per bag: '||average_cost||'taka');
end;
/


--Lab 09
--Trigger
create or replace trigger check_quantity before update or insert on hospital
for each row 
begin
 IF : new.order_quantity>1000 OR :new.order_quantity<1 then
 raise_application_error(-20000,'Order is too large or small');
end if;
end;
/
--trigger(another)
create or replace trigger insertion_blood before update or insert on blood
for each row
begin 
  if:new.blood_type='A+' then
  :new.cost_taka_per_bag :=100;
  elsif:new.blood_type='A-' then
  :new.cost_taka_per_bag :=800;
  elsif:new.blood_type='B+' then
  :new.cost_taka_per_bag :=150;
  elsif:new.blood_type='B-' then
  :new.cost_taka_per_bag :=1000;
  elsif:new.blood_type='AB+' then
  :new.cost_taka_per_bag :=130;
  elsif:new.blood_type='AB-' then
  :new.cost_taka_per_bag :=900;
  elsif:new.blood_type='O+' then
  :new.cost_taka_per_bag :=100;
  elsif:new.blood_type='O-' then
  :new.cost_taka_per_bag :=1000;

  end if;
end;
/
--transaction management
drop table temp;
create table temp(
  Roll number(3),
  Name varchar(30)
);
insert into temp values (1,'A');
insert into temp values (2,'B');
insert into temp values (3,'C');
insert into temp values (4,'D');
insert into temp values (5,'E');
commit;
select * from temp;
delete * from temp;
rollback;
select * from temp;
insert into temp values (6,'F');
savepoint name_6;
insert into temp values (7,'G');
savepoint name_7;
rollback to name_6;
select * from temp;



