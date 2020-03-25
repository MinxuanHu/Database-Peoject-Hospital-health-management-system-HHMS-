use project_final;

-- drop PROCEDURE patient_bloodtest_urinetest_result;
DELIMITER //
CREATE PROCEDURE patient_bloodtest_urinetest_result(IN patient1 int, in  patient2 int)
BEGIN
declare FirstPatient int;    
declare SecondPatient  int;
set FirstPatient = patient1;    
set SecondPatient = patient2;	

select prescription.patientId,patient.patientAge,patient.patientGender,
bloodtest.bloodtestId,bloodtest.bloodtestDate,bloodtest.HIV,bloodtest.ESR,
urinetest.urinetestid,urinetest.urinetestDate,urinetest.Sugar,urinetest.Album

from patient inner join prescription inner join bloodtest inner join urinetest
on patient.patientId=prescription.patientId
and prescription.prescriptionId=bloodtest.prescriptionId
and prescription.prescriptionId=urinetest.prescriptionId
and patient.patientId in (FirstPatient,SecondPatient); 

END //
DELIMITER ;

call patient_bloodtest_urinetest_result(2,5);
select * from patient;



