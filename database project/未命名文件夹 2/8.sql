use project_final;
drop PROCEDURE patient_x_raytest_sonographytest_result;
DELIMITER //
CREATE PROCEDURE patient_x_raytest_sonographytest_result( in  D int)
BEGIN

declare day  int;
set day= D;	
select patient.patientId,patient.patientName,patientAge,patient.patientGender,
prescription.prescriptionId,prescription.doctorId,
x_raytest.x_raytestId,x_raytest.x_raytestDate,x_raytest.x_raytestName,
sonographytest.sonographytestId,sonographytest.sonographytestDate,sonographytest.PV,sonographytest.L_SIZE
from patient inner join prescription inner join x_raytest   join sonographytest
on prescription.patientId = patient.patientId
and x_raytest.prescriptionId=prescription.prescriptionId
and sonographytest.prescriptionId=prescription.prescriptionId
and prescription.prescriptionId not in (select x_raytest.prescriptionId from x_raytest where x_raytestName like '%e%' )
and sonographytest.L_SIZE in (select sonographytest.PV from sonographytest where exists(select  * from sonographytest where day(sonographytestDate)>=day))
order by patientId;
END //
DELIMITER ;

call patient_x_raytest_sonographytest_result(5);

select * from x_raytest;