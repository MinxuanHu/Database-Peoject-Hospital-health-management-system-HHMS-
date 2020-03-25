use project_final;

DELIMITER //
CREATE PROCEDURE patient_bill_dietadvice_medicine_result(IN patient1 int, in  patient2 int)
BEGIN
declare FirstPatient int;    
declare SecondPatient  int;
set FirstPatient = patient1;    
set SecondPatient = patient2;	

select prescription.patientId,patient.patientAge,patient.patientGender,
bill.medicineId,medicine.medicineFee,medicine.medicineName,
prescription.prescriptionId,DietAdvice.DietAdviceContent
from patient inner join bill inner join medicine inner join dietAdvice inner join prescription
on bill.patientId=patient.patientId
and bill.medicineId=medicine.medicineId
and prescription.prescriptionId=patient.patientId
and prescription.prescriptionId=DietAdvice.prescriptionId
and patient.patientId in (FirstPatient,SecondPatient); 

END //
DELIMITER ;

call patient_bill_dietadvice_medicine_result(3,4);




