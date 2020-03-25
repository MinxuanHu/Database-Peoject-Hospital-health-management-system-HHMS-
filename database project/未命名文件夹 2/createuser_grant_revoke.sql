CREATE USER manager IDENTIFIED BY '123456';
 grant all on patient to manager;
--  DROP USER manager;

CREATE USER patientuser IDENTIFIED BY '123';
grant select on patient to patinetuser;
grant select on presciption to patinetuser;
grant select on bill to patinetuser;
 
 CREATE USER doctoruser IDENTIFIED BY '456';
 grant all on patient to doctoruse;
 grant all on prescription to doctoruse;
 
 REVOKE INSERT ON patient FROM doctoruse;
 
CREATE USER testexcute IDENTIFIED BY '111';
grant all on x_raytest to testexcute;
grant all on bloodtest to testexcute;
grant all on colonoscopytest to testexcute;
grant all on sonographytest to testexcute;
grant all on urinetest to testexcute;
grant all on gastroscopytest to testexcute;
grant select on  presciption to testexcute;
   
   
REVOKE INSERT ON prescription FROM testexcute;
 