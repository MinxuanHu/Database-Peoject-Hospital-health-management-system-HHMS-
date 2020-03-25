use project_final;

-- drop procedure patient_injectionDate_yearConstraint;
DELIMITER //
CREATE PROCEDURE patient_injectionDate_yearConstraint(IN year1 int, in year2 int,in year3 int)
BEGIN
declare FirstYear int;    
declare SecondYear int; 
declare thirdYear int; 
set FirstYear = year1;    
set SecondYear = year2;	
set ThirdYear = year3;	
select patient.patientId,patient.patientName, patient.patientGender,injection.injectionId,injection.injectionFee,injection.injectionDate,bill.billId
from patient inner join injection inner join bill
on bill.injectionId=injection.injectionId and patient.patientId=bill.patientId
and year(injection.injectionDate) not in (FirstYear,SecondYear,ThirdYear);
END //
DELIMITER ;

call patient_injectionDate_yearConstraint(2012, 2009,2016);

update injection set injectionDate='2016-08-08' 
where injectionId=3;

select * from injection;
