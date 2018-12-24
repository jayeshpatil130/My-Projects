-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema HospitalManagement1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema HospitalManagement1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `HospitalManagement1` ;
USE `HospitalManagement1` ;

-- -----------------------------------------------------
-- Table `HospitalManagement1`.`Patients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HospitalManagement1`.`Patients` (
  `idPatients` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Gender` ENUM('Male','Female','Other') NOT NULL,
  `Age` INT NOT NULL,
  `Type`  ENUM('InPatient','OutPatient') NOT NULL,
  `Phone_no` VARCHAR(45) NULL,
  PRIMARY KEY (`idPatients`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HospitalManagement1`.`Employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HospitalManagement1`.`Employee` (
  `idEmployee` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Gender` ENUM('Male','Female','Other') NOT NULL,
  `Age` INT NOT NULL,
  `Phone_no` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEmployee`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HospitalManagement1`.`Speciality`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HospitalManagement1`.`Speciality` (
  `idSpeciality` INT NOT NULL,
  `Speciality_Type` VARCHAR(45) NULL,
  PRIMARY KEY (`idSpeciality`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HospitalManagement1`.`Doctors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HospitalManagement1`.`Doctors` (
  `Employee_idEmployee` INT NOT NULL,
  `Doctor_id` INT NOT NULL,
  `Speciality_idSpeciality` INT NOT NULL,
  INDEX `fk_Doctors_Employee_idx` (`Employee_idEmployee` ASC) VISIBLE,
  PRIMARY KEY (`Doctor_id`, `Employee_idEmployee`, `Speciality_idSpeciality`),
  INDEX `fk_Doctors_Speciality1_idx` (`Speciality_idSpeciality` ASC) VISIBLE,
  CONSTRAINT `fk_Doctors_Employee`
    FOREIGN KEY (`Employee_idEmployee`)
    REFERENCES `HospitalManagement1`.`Employee` (`idEmployee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Doctors_Speciality1`
    FOREIGN KEY (`Speciality_idSpeciality`)
    REFERENCES `HospitalManagement1`.`Speciality` (`idSpeciality`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HospitalManagement1`.`Nurse`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HospitalManagement1`.`Nurse` (
  `Position` VARCHAR(45) NOT NULL,
  `Employee_idEmployee` INT NOT NULL,
  `NurseID` INT NOT NULL,
  INDEX `fk_Nurse_Employee1_idx` (`Employee_idEmployee` ASC) VISIBLE,
  PRIMARY KEY (`NurseID`, `Employee_idEmployee`),
  CONSTRAINT `fk_Nurse_Employee1`
    FOREIGN KEY (`Employee_idEmployee`)
    REFERENCES `HospitalManagement1`.`Employee` (`idEmployee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HospitalManagement1`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HospitalManagement1`.`Staff` (
  `Department` VARCHAR(45) NOT NULL,
  `Employee_idEmployee` INT NOT NULL,
  `StaffID` INT NOT NULL,
  INDEX `fk_Staff_Employee1_idx` (`Employee_idEmployee` ASC) VISIBLE,
  PRIMARY KEY (`StaffID`, `Employee_idEmployee`),
  CONSTRAINT `fk_Staff_Employee1`
    FOREIGN KEY (`Employee_idEmployee`)
    REFERENCES `HospitalManagement1`.`Employee` (`idEmployee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HospitalManagement1`.`Diagnosis_Current`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HospitalManagement1`.`Diagnosis_Current` (
  `Remark` VARCHAR(45) NOT NULL,
  `Patients_idPatients` INT NOT NULL,
  `Diagnosis_ID` INT NOT NULL,
  INDEX `fk_Diagnosis_Current_Patients1_idx` (`Patients_idPatients` ASC) VISIBLE,
  PRIMARY KEY (`Diagnosis_ID`, `Patients_idPatients`),
  CONSTRAINT `fk_Diagnosis_Current_Patients1`
    FOREIGN KEY (`Patients_idPatients`)
    REFERENCES `HospitalManagement1`.`Patients` (`idPatients`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HospitalManagement1`.`Room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HospitalManagement1`.`Room` (
  `idRoom` INT NOT NULL,
  `Patients_idPatients` INT NOT NULL,
  PRIMARY KEY (`idRoom`),
  INDEX `fk_Room_Patients1_idx` (`Patients_idPatients` ASC) VISIBLE,
  CONSTRAINT `fk_Room_Patients1`
    FOREIGN KEY (`Patients_idPatients`)
    REFERENCES `HospitalManagement1`.`Patients` (`idPatients`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HospitalManagement1`.`Bill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HospitalManagement1`.`Bill` (
  `idBill` INT NOT NULL,
  `Cost` INT NOT NULL,
  `Status` VARCHAR(45) NOT NULL,
  `Patients_idPatients` INT NOT NULL,
  PRIMARY KEY (`idBill`, `Patients_idPatients`),
  INDEX `fk_Bill_Patients1_idx` (`Patients_idPatients` ASC) VISIBLE,
  CONSTRAINT `fk_Bill_Patients1`
    FOREIGN KEY (`Patients_idPatients`)
    REFERENCES `HospitalManagement1`.`Patients` (`idPatients`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HospitalManagement1`.`Payment_Id`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HospitalManagement1`.`Payment_Id` (
  `idPayment_Id` INT NOT NULL,
  `Pay_Type` VARCHAR(45) NOT NULL,
  `Bill_idBill` INT NOT NULL,
  PRIMARY KEY (`idPayment_Id`, `Bill_idBill`),
  INDEX `fk_Payment_Id_Bill1_idx` (`Bill_idBill` ASC) VISIBLE,
  CONSTRAINT `fk_Payment_Id_Bill1`
    FOREIGN KEY (`Bill_idBill`)
    REFERENCES `HospitalManagement1`.`Bill` (`idBill`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HospitalManagement1`.`Lab_test`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HospitalManagement1`.`Lab_test` (
  `idLab_test` INT NOT NULL,
  `TestName` VARCHAR(45) NOT NULL,
  `Result` VARCHAR(45) NOT NULL,
  `Patients_idPatients` INT NOT NULL,
  PRIMARY KEY (`idLab_test`, `Patients_idPatients`),
  INDEX `fk_Lab_test_Patients1_idx` (`Patients_idPatients` ASC) VISIBLE,
  CONSTRAINT `fk_Lab_test_Patients1`
    FOREIGN KEY (`Patients_idPatients`)
    REFERENCES `HospitalManagement1`.`Patients` (`idPatients`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HospitalManagement1`.`Prescription`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HospitalManagement1`.`Prescription` (
  `DateTime` DATETIME NOT NULL,
  `Dose` VARCHAR(45) NULL,
  `Patients_idPatients` INT NOT NULL,
  `Doctors_Doctor_id` INT NOT NULL,
  `Prescriptionid` INT NOT NULL AUTO_INCREMENT,
  INDEX `fk_Prescription_Patients1_idx` (`Patients_idPatients` ASC) VISIBLE,
  INDEX `fk_Prescription_Doctors1_idx` (`Doctors_Doctor_id` ASC) VISIBLE,
  PRIMARY KEY (`Prescriptionid`, `Doctors_Doctor_id`, `Patients_idPatients`),
  CONSTRAINT `fk_Prescription_Patients1`
    FOREIGN KEY (`Patients_idPatients`)
    REFERENCES `HospitalManagement1`.`Patients` (`idPatients`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Prescription_Doctors1`
    FOREIGN KEY (`Doctors_Doctor_id`)
    REFERENCES `HospitalManagement1`.`Doctors` (`Doctor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HospitalManagement1`.`Room_has_Nurse`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HospitalManagement1`.`Room_has_Nurse` (
  `Room_idRoom` INT NOT NULL,
  `Nurse_NurseID` INT NOT NULL,
  PRIMARY KEY (`Room_idRoom`, `Nurse_NurseID`),
  INDEX `fk_Room_has_Nurse_Nurse1_idx` (`Nurse_NurseID` ASC) VISIBLE,
  INDEX `fk_Room_has_Nurse_Room1_idx` (`Room_idRoom` ASC) VISIBLE,
  CONSTRAINT `fk_Room_has_Nurse_Room1`
    FOREIGN KEY (`Room_idRoom`)
    REFERENCES `HospitalManagement1`.`Room` (`idRoom`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Room_has_Nurse_Nurse1`
    FOREIGN KEY (`Nurse_NurseID`)
    REFERENCES `HospitalManagement1`.`Nurse` (`NurseID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HospitalManagement1`.`Records`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HospitalManagement1`.`Records` (
  `idRecords` INT NOT NULL,
  `Description` VARCHAR(255) NOT NULL,
  `Staff_StaffID` INT NOT NULL,
  `Patients_idPatients` INT NOT NULL,
  `Appointments` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idRecords`, `Patients_idPatients`),
  INDEX `fk_Records_Staff1_idx` (`Staff_StaffID` ASC) VISIBLE,
  INDEX `fk_Records_Patients1_idx` (`Patients_idPatients` ASC) VISIBLE,
  CONSTRAINT `fk_Records_Staff1`
    FOREIGN KEY (`Staff_StaffID`)
    REFERENCES `HospitalManagement1`.`Staff` (`StaffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Records_Patients1`
    FOREIGN KEY (`Patients_idPatients`)
    REFERENCES `HospitalManagement1`.`Patients` (`idPatients`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HospitalManagement1`.`Patient_Insurance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HospitalManagement1`.`Patient_Insurance` (
  `Policy_Number` INT NOT NULL AUTO_INCREMENT,
  `Comapany_Name` VARCHAR(45) NOT NULL,
  `Date` DATE NOT NULL,
  `Patients_idPatients` INT NOT NULL,
  PRIMARY KEY (`Policy_Number`, `Patients_idPatients`),
  INDEX `fk_Patient_Insurance_Patients1_idx` (`Patients_idPatients` ASC) VISIBLE,
  CONSTRAINT `fk_Patient_Insurance_Patients1`
    FOREIGN KEY (`Patients_idPatients`)
    REFERENCES `HospitalManagement1`.`Patients` (`idPatients`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HospitalManagement1`.`Medication`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HospitalManagement1`.`Medication` (
  `idMedication` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`idMedication`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HospitalManagement1`.`Medication_has_Prescription`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HospitalManagement1`.`Medication_has_Prescription` (
  `Medication_idMedication` INT NOT NULL,
  `Prescription_Prescriptionid` INT NOT NULL,
  `Prescription_Doctors_Doctor_id` INT NOT NULL,
  `Prescription_Patients_idPatients` INT NOT NULL,
  PRIMARY KEY (`Medication_idMedication`, `Prescription_Prescriptionid`, `Prescription_Doctors_Doctor_id`, `Prescription_Patients_idPatients`),
  INDEX `fk_Medication_has_Prescription_Prescription1_idx` (`Prescription_Prescriptionid` ASC, `Prescription_Doctors_Doctor_id` ASC, `Prescription_Patients_idPatients` ASC) VISIBLE,
  INDEX `fk_Medication_has_Prescription_Medication1_idx` (`Medication_idMedication` ASC) VISIBLE,
  CONSTRAINT `fk_Medication_has_Prescription_Medication1`
    FOREIGN KEY (`Medication_idMedication`)
    REFERENCES `HospitalManagement1`.`Medication` (`idMedication`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Medication_has_Prescription_Prescription1`
    FOREIGN KEY (`Prescription_Prescriptionid` , `Prescription_Doctors_Doctor_id` , `Prescription_Patients_idPatients`)
    REFERENCES `HospitalManagement1`.`Prescription` (`Prescriptionid` , `Doctors_Doctor_id` , `Patients_idPatients`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;




INSERT INTO patients (idPatients,Name, Gender, Age, Type, Phone_no) VALUES
('1','Jayesh','Male','25','InPatient','+1354545554'),
('2','Sumit','Male','24','InPatient','+13544545554'),
('3','naomi','Female','55','OutPatient','+13222245554'),
('4','Akshay','Male','15','OutPatient','+132737735554'),
('5','Kedar','Male','23','OutPatient','+8572245554'),
('6','Kunal','Male','25','InPatient','+1356245554'),
('7','Kendar','Male','23','InPatient','+82222245554'),
('8','shubhangi','Female','20','InPatient','+177756245554'),
('9','Ishita','Female','21','OutPatient','+87872245554'),
('10','Ash','Male','35','InPatient','+10996245554');

INSERT INTO patients (idPatients,Name, Gender, Age, Type, Phone_no) VALUES
('16','Jaesh','Female','25','InPatient','+13549954');

select * from bill;


INSERT INTO employee (idEmployee,Name, Gender, Age, Phone_no) VALUES
('101','jhon','Male','45','+1354599954'),
('102','josheph','Male','34','+13578545554'),
('103','stacy','Female','65','+1322268554'),
('104','Abhilekh','Male','25','+132775554'),
('105','amit','Male','33','+8572247884'),
('106','patkure','Male','35','+1356246854'),
('107','tejas','Male','43','+82228885554'),
('108','gracy','Female','30','+17775676554'),
('109','scotty','Female','31','+87872977554'),
('110','celina','Male','45','+10996246654'),
('111','jhhony','Male','35','+135454784'),
('112','joshua','Male','34','+13546885554'),
('113','chandler','Female','28','+132257845554'),
('114','ross','Male','25','+1327668735554'),
('115','harvey','Male','33','+856888245554');


INSERT INTO Speciality (idSpeciality, Speciality_Type ) VALUES
('301','Neurologist'),
('302','Physician'),
('303','Gynac'),
('304','Orthopedist'),
('305','cardiologist'),
('306','pediatric');

INSERT INTO doctors (Doctor_id,Employee_idEmployee, Speciality_idSpeciality) VALUES
('201','101','302'),
('202','102','303'),
('203','103','305'),
('204','104','304'),
('205','105','301');


INSERT INTO nurse (NurseId, Employee_idEmployee, Position) VALUES
('401','106','Senior'),
('402','107','Junior'),
('403','108','Senior'),
('404','109','Junior'),
('405','110','Junior');

INSERT INTO Staff (StaffID, Employee_idEmployee, Department) VALUES
('501','111','Lab'),
('502','112','Office'),
('503','113','Cleaning'),
('504','114','Lab'),
('505','115','Office');

INSERT INTO Diagnosis_Current (Diagnosis_ID, Patients_idPatients, Remark) VALUES
('601','1','need admitted'),
('602','2','ok'),
('603','3','recover in 1 day'),
('604','4','take medication 2 times'),
('605','5','serious');


INSERT INTO Bill (iDBill, Patients_idPatients, Cost, Status) VALUES
('701','1','2000','Paid'),
('702','2','1000','Pending'),
('703','3','1500','Paid'),
('704','4','1200','Pending'),
('705','5','1100','Paid');


INSERT INTO Payment_Id (idPayment_Id, Pay_Type, Bill_idBill) VALUES
('801','Insurance','701'),
('802','Card','703'),
('803','Card','705');

INSERT INTO Lab_test (idLab_test, TestName, Result,Patients_idPatients) VALUES
('901','Blood','O','1'),
('902','Melases','Postive','3'),
('903','Sugar','High','5');

INSERT INTO Prescription (DateTime, Dose,Patients_idPatients,Doctors_Doctor_id, Prescriptionid) VALUES
('2018-12-18 13:17:17','as given','1','201','801'),
('2017-11-18 12:18:17','2 time a day','2','202','802'),
('2018-10-18 17:15:17','1 time a day','3','201','803'),
('2018-12-19 11:17:17','as given','4','203','804'),
('2018-12-18 13:19:19','once','5','204','805');



update Prescription set Prescriptionid =1001 where Patients_idPatients=1;
update Prescription set Prescriptionid =1002 where Patients_idPatients=2;
update Prescription set Prescriptionid =1003 where Patients_idPatients=3;
update Prescription set Prescriptionid =1004 where Patients_idPatients=4;
update Prescription set Prescriptionid =1005 where Patients_idPatients=5;


Select * from Prescription;

INSERT INTO Medication (idMedication, Name) VALUES
('1101','Medifal'),
('1102','sinarest'),
('1103','IV'),
('1104','asprin'),
('1105','omni cold'),
('1106','sumo gold');
 
 delete from medication where idMedication =1106;


INSERT INTO Patient_Insurance (Policy_Number, Comapany_Name, Date, Patients_idPatients) VALUES
('1201','Bluecross','2018-12-18','1'),
('1202','Bluecross','2018-12-12','2'),
('1203','ISO','2018-12-11','3'),
('1204','HelathS','2018-12-19','4'),
('1205','Health Gold','2018-12-10','5'),
('1206','ISO silver','2018-12-14','6');


INSERT INTO Records (idRecords, Description, Staff_StaffID, Patients_idPatients, Appointments) VALUES
('1301','Next ','501','1','No'),
('1302','No','502','2','yes'),
('1303','Sechduled','503','3','No'),
('1304','No','504','4','yes'),
('1305','Sechduled','502','5','No'),
('1306','Next on','505','6','yes');
 
 
Select * from Records;

INSERT INTO Room (idRoom, Patients_idPatients) VALUES
('1401','1'),
('1402','2'),
('1403','6'),
('1404','7'),
('1405','8'),
('1406','10');


INSERT INTO room_has_nurse (Room_idRoom, Nurse_NurseID) VALUES
('1401','401'),
('1402','402'),
('1403','403'),
('1404','401'),
('1405','404'),
('1406','405');

INSERT INTO medication_has_prescription (Medication_idMedication,Prescription_Prescriptionid,Prescription_Doctors_Doctor_id,Prescription_Patients_idPatients) VALUES
('1101','1001','201','1'),
('1102','1002','202','2'),
('1103','1003','201','3'),
('1104','1004','203','4'),
('1105','1005','204','5');

DELIMITER $$
CREATE TRIGGER patient_bill 
    AFTER insert ON patients
    FOR EACH ROW 
BEGIN
    insert into bill (iDBill,Patients_idPatients, Cost,Status) values (0,1,0,'');
END; $$
DELIMITER ;

Drop Trigger patient_bill;

DELIMITER $$
create trigger Check_genderP 
Before insert on patients 
for each row 
begin  
if new.gender not in ('Male ','Female','Other') then  
 UPDATE `Sorry Cant update check gender` SET x=1;
end if; 
end; 
$$

delimiter ;



DELIMITER $$
create trigger Check_gender
Before insert on Employee
for each row 
begin  
if new.gender not in ('Male ','Female','Other') then  
 UPDATE `Sorry Cant update check gender` SET x=1; 
end if; 
end; 
$$
delimiter ;

create index in1 on bill(idBill,status);
show index from in1;

DELIMITER $$
create trigger Check_Type 
Before insert on Patients
for each row 
begin  
if new.Type not in ('InPatient ','OutPatient') then  
 UPDATE `Sorry Cant update check gender` SET x=1;
end if; 
end; 
$$
delimiter ;



CREATE VIEW `Due_Bill` AS
Select iDBill,Patients_idPatients, Cost AS DueAmount from Bill where status='Pending';


CREATE VIEW `Bill_report1` AS
Select Patients.idPatients,Patients.Name, Patients.Gender, Patients.Age, Patients.Phone_no,
Bill.iDBill, Bill.Cost, Bill.Status from patients Inner join Bill on
Patients.idPatients=Bill.Patients_idPatients Where Bill.Status='Paid';


CREATE VIEW `Patient_RoomAllocated` AS
Select Patients.idPatients,Patients.Name, Patients.Gender, Patients.Age, Patients.Phone_no,
Room.idRoom from patients Inner join Room on
Patients.idPatients=Room.Patients_idPatients;


USE `hospitalmanagement1`;
DROP procedure IF EXISTS `Total Revenue`;

DELIMITER $$
USE `hospitalmanagement1`$$
CREATE PROCEDURE `Total_Revenue2` ()
BEGIN

declare total_revenue int;
set total_revenue = ( Select Sum(Cost) from Bill);
select total_revenue as total_revenue ;

END$$

DELIMITER ;
call Total_Revenue2();

DELIMITER $$
USE `hospitalmanagement1`$$
CREATE PROCEDURE `GetDoctor` ()
BEGIN

Select employee.idEmployee,employee.Name,doctors.Doctor_id,Speciality.Speciality_Type from doctors 
Inner join employee on
doctors.Employee_idEmployee = employee.idEmployee
Inner join Speciality on doctors.Speciality_idSpeciality = Speciality.idSpeciality;

END$$

DELIMITER ;
call GetDoctor();

