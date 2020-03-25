use project_final;

drop PROCEDURE special_patient_colonoscopytest_gastroscopytest_result;
DELIMITER //
CREATE PROCEDURE special_patient_colonoscopytest_gastroscopytest_result( in  m1 int,in  y2 int)
BEGIN
   
declare month1  int;
declare year2  int;
  
set month1= m1;	
set year2= y2;	
select patient.patientId,patient.patientName,patientAge,patient.patientGender,
prescription.prescriptionId,
colonoscopytest.colonoscopytestId,colonoscopytest.colonoscopytestDate,colonoscopytest.ANAL,colonoscopytest.colonoscopytestId,colonoscopytest.ECTUM,
gastroscopytest.gastroscopytestId,gastroscopytest.gastroscopytestDate,gastroscopytest.CORPUS,gastroscopytest.FUNDWS
from patient,prescription,colonoscopytest,gastroscopytest
where prescription.patientId = patient.patientId

and colonoscopytest.prescriptionId=prescription.prescriptionId
and gastroscopytest.prescriptionId=prescription.prescriptionId
and month(gastroscopytest.gastroscopytestDate) in (select month(colonoscopytestDate) from colonoscopytest where colonoscopytest.colonoscopytestId<>month1)
and Year(gastroscopytest.gastroscopytestDate) in (select year(colonoscopytestDate) from colonoscopytest where colonoscopytest.colonoscopytestId<>year2)
order by patientId;
END //
DELIMITER ;
call special_patient_colonoscopytest_gastroscopytest_result(1,2);

select * from patient;
select * from prescription;
select * from gastroscopytest;
