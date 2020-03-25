use project_final;

select * from medicine;
insert into diagnosis values(5,'urine_cure_and_colonoscopy_cure','NO','YES','NO','NO','NO','YES');

select * from DIAGNOSIS;

ALTER TABLE prescription
add doctorId int;
ALTER TABLE prescription
Add Constraint fk_doctor Foreign Key (doctorId) References doctor(DoctorId);   

select * from prescription; 

ALTER TABLE prescription
add patientId int;
ALTER TABLE prescription
Add Constraint fk_patient Foreign Key (patientId) References patient(patientId);  

ALTER TABLE patient
add staff_nurseId int;
ALTER TABLE patient
Add Constraint fk_satff_nurse Foreign Key (staff_nurseId) References staff_nurse(staff_nurseId);  

select * from prescription;

ALTER TABLE staff_nurse
add patientId int;
ALTER TABLE staff_nurse
Add Constraint fk_patientstaff Foreign Key (patientId) References patient(patientId); 

select * from staff_nurse;

ALTER TABLE injection
add prescriptionId int;
ALTER TABLE injection
Add Constraint fk_injection_prescription Foreign Key (prescriptionId) References prescription(prescriptionId); 
select * from injection;

ALTER TABLE DietAdvice
add prescriptionId int;
ALTER TABLE DietAdvice
Add Constraint fk_dietadvice_prescription Foreign Key (prescriptionId) References prescription(prescriptionId); 
select * from DietAdvice;

ALTER TABLE medicine
add prescriptionId int;
ALTER TABLE medicine
Add Constraint fk_medicine_prescription Foreign Key (prescriptionId) References prescription(prescriptionId); 
select * from medicine;

ALTER TABLE bloodtest
add prescriptionId int;
ALTER TABLE bloodtest
Add Constraint fk_mbloodtest_prescription Foreign Key (prescriptionId) References prescription(prescriptionId); 
select * from bloodtest;

ALTER TABLE x_raytest
add prescriptionId int;
ALTER TABLE x_raytest
Add Constraint fk_x_raytest_prescription Foreign Key (prescriptionId) References prescription(prescriptionId); 
select * from x_raytest;

ALTER TABLE urinetest
add prescriptionId int;
ALTER TABLE urinetest
Add Constraint fk_urinetest_prescription Foreign Key (prescriptionId) References prescription(prescriptionId); 
select * from urinetest;

ALTER TABLE gastroscopytest
add prescriptionId int;
ALTER TABLE gastroscopytest
Add Constraint fk_gastroscopytest_prescription Foreign Key (prescriptionId) References prescription(prescriptionId); 
select * from gastroscopytest;

ALTER TABLE sonographytest
add prescriptionId int;
ALTER TABLE sonographytest
Add Constraint fk_sonographytest_prescription Foreign Key (prescriptionId) References prescription(prescriptionId); 
select * from sonographytest;

ALTER TABLE colonoscopytest
add prescriptionId int;
ALTER TABLE colonoscopytest
Add Constraint fk_colonoscopytest_prescription Foreign Key (prescriptionId) References prescription(prescriptionId); 
select * from colonoscopytest;

ALTER TABLE diagnosis
add bloodtestId int;
ALTER TABLE diagnosis
Add Constraint fk_diagnosis_bloodtest Foreign Key (bloodtestId) References bloodtest(bloodtestId); 
select* from diagnosis;

ALTER TABLE diagnosis
add urinetestId int;
ALTER TABLE diagnosis
Add Constraint fk_diagnosis_urinetest Foreign Key (urinetestId) References urinetest(urinetestId); 

ALTER TABLE diagnosis
add x_raytestId int;
ALTER TABLE diagnosis
Add Constraint fk_diagnosis_x_raytest Foreign Key (x_raytestId) References x_raytest(x_raytestId); 

ALTER TABLE diagnosis
add gastroscopytestId int;
ALTER TABLE diagnosis
Add Constraint fk_diagnosis_gastroscopytest Foreign Key (gastroscopytestId) References gastroscopytest(gastroscopytestId); 

ALTER TABLE diagnosis
add sonographytestId int;
ALTER TABLE diagnosis
Add Constraint fk_diagnosis_sonographytest Foreign Key (sonographytestId) References sonographytest(sonographytestId); 

ALTER TABLE diagnosis
add colonoscopytestId int;
ALTER TABLE diagnosis
Add Constraint fk_diagnosis_colonoscopytest Foreign Key (colonoscopytestId) References colonoscopytest(colonoscopytestId);


ALTER TABLE diagnosis
add diagnosisFee int;
select * from diagnosis;
insert into diagnosis
(diagnosisdiagnosisFee)values(100);
UPDATE diagnosis
SET diagnosisFee = 50
WHERE diagnosisId in(2,4,6);
select * from diagnosis;




ALTER TABLE bill
add medicineId int;
ALTER TABLE bill
Add Constraint fk_bill_medicine Foreign Key (medicineId) References mdicine(medicineId); 
select * from bill;


ALTER TABLE bill
Add Constraint fk_bill_diagnosis Foreign Key (diagnosisId) References diagnosis(diagnosisId); 

ALTER TABLE bill
add patientId int;
ALTER TABLE bill
Add Constraint fk_bill_patient Foreign Key (patientId) References patient(patientId); 

ALTER TABLE bill
add diagnosisId int;
ALTER TABLE bill
Add Constraint fk_bill_patient Foreign Key (patientId) References patient(patientId); 


ALTER TABLE bill
add injectionId int;
ALTER TABLE bill
Add Constraint fk_bill_patient Foreign Key (patientId) References patient(patientId); 


UPDATE bill
SET TestFee = 100
WHERE billId in(1,2 ,3,4,5,6);
select * from bill;
select * from injection;

ALTER TABLE injection
add injectionFee int;

UPDATE injection
SET injectionFee = 20
WHERE injectionId =5;

ALTER TABLE medicine
add medicineFee int;
UPDATE medicine
SET medicineFee = 90
WHERE medicineId =3;
select * from diagnosis;

ALTER TABLE DietAdvice
add patientId int;
ALTER TABLE DietAdvice
Add Constraint fk_dietAdvice_patient Foreign Key (patientId) References patient(patientId); 



ALTER TABLE patient_staffNurse
ADD CONSTRAINT fk_patient_staffNurse
foreign key (patientId) references patient(patientId);
 
ALTER TABLE patient_staffNurse
ADD CONSTRAINT fk_staffNurse_patient
foreign key(staff_nurseId) references staff_nurse(staff_nurseId);

select * from bill;
insert into colonoscopytest values(6,'2018-12-07','Low','High',8);
insert into patient_staffNurse values(1,1,2),(2,2,3),(3,3,1),(4,4,2),(5,1,3),(6,1,4),(7,6,2),(8,3,3);

ALTER TABLE prescription
ADD CONSTRAINT fk_prescription_doctor
foreign key(doctorId) references Doctor(doctorId);


UPDATE prescription
SET patientId = 5,doctorId=5
WHERE prescriptionId=6;

ALTER TABLE diagnosis
ADD CONSTRAINT fk_diagnosis_dietadviceprescription
foreign key(DietAdviceId) references DietAdvice(DietAdviceId);


UPDATE injection
SET prescriptionId = 6,patientId =6
WHERE injectionId=6;

UPDATE bill
SET patientId =6,injectionId =5,diagnosisId=3,medicineId=3
WHERE billId=6;

UPDATE colonoscopytest
SET prescriptionId=5
WHERE colonoscopytestId=1;

ALTER TABLE patient_staffnurse
ADD CONSTRAINT fk_patient
foreign key(patientId) references patient(patientId);


ALTER TABLE bill
ADD CONSTRAINT fk_bill_med
foreign key(medicineId) references medicine(medicineId);

select * from bill;
insert into bill values(1,'2016-12-12',1,100,1,1,1),(2,'2015-09-09',2,100,2,3,2),(3,'2015-01-13',3,100,3,2,3),(4,'2015-11-07',4,100,4,5,4),(5,'2015-12-02',5,100,5,4,5);

ALTER TABLE prescription
ADD CONSTRAINT fk_prescription_doc
foreign key(doctorId) references doctor(doctorId);

ALTER TABLE prescription
add patientId int;

ALTER TABLE diagnosis
ADD CONSTRAINT fk_d_diet
foreign key(dietadviceId) references dietadvice(dietadviceId);

select * from medicine;
insert into staff_nurse values(1),(2),(3),(4),(5);
UPDATE staff_info
SET staffId=5
WHERE lastname='chat';

insert into diagnosis values(1,'some cure',1,1,1,1,1,1,1,100),(2,'more cure',2,4,3,2,2,2,3,300),(3,'2some cure',3,5,2,3,3,3,2,200),(4,'some cure',5,2,4,4,4,4,4,340),(5,'more cure',4,3,5,5,5,5,5,100);


