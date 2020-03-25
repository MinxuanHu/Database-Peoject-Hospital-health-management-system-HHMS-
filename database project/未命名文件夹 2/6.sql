use project_final;

-- drop TRIGGER ahead_insert;
DELIMITER //
CREATE TRIGGER ahead_insert
before INSERT ON staff_Info
FOR EACH ROW
BEGIN 
set new.fullname=concat(new.firstname,'',new.lastname);
END;//

show triggers;

insert into staff_info(firstname,lastname,staffId) values('Kavin','hhhh',1);

select * from staff_info;

-- drop trigger ahead_update;
DELIMITER //
CREATE TRIGGER ahead_update
before update ON staff_Info
FOR EACH ROW
BEGIN 
set new.fullname=concat(new.firstname,'',new.lastname);
END;//

update staff_Info set firstname='hhh',lastname='rrr';