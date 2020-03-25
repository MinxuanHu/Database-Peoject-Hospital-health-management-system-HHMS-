use project_final;



create VIEW view1 AS
SELECT patientId,patientName,patientAge,(select count(patientAge) from patient) as totalAge
FROM patient inner join staff_nurse
on patient.patientId=staff_nurse.staff_nurseId and staff_nurse.staff_nurseId<4;

select * from view1;
drop view view2;

create VIEW view2 AS
SELECT patient.patientName, injection.injectionDate,injection.injectionFee,bill.billId
FROM patient inner join bill inner join injection
on injection.injectionId=bill.injectionId 
and bill.patientId=patient.patientId
and year(injectionDate) in (select bill.billDate from bill);

select * from view2;

create VIEW view3 AS
select prescription.doctorId ,Doctor.DoctorName,DietAdvice.DietAdviceContent,prescription.patientId
from Doctor ,DietAdvice,prescription
where exists
(select * from prescription 
where prescription.patientId>1
and exists(select * from DietAdvice where DietAdvice.prescriptionId=prescription.prescriptionId 
and DietAdvice.DietAdviceContent<5));

select * from view3;


select* from patient;
select* from prescription;
select* from patient_staffNurse;
select* from injection;
select* from bill;

