Create database Alliens;

Use Alliens;

Create table Staff (
		StaffID int,
        FirstName varchar(25) not null,
        LastName varchar(30) not null,
        StaffRole varchar(15) not null,
        Title varchar(15) not null,
        StaffAddress varchar(30) not null,
        Picture longblob,
        Email varchar(50) not null,
        Text varchar(50) not null,
        Phone varchar (20) not null,
        Date_of_birth date,
        
        Primary Key(StaffID)
	);
    
Create table Branch(
		BranchID int,
        BranchName varchar(30) not null,
        BranchAddress varchar(30) not null,
        Branch_email varchar(35) not null,
        Branch_phone varchar(20) not null,
        
        Primary key(BranchID)
	);
    
Create table Patients(
		PatientID int,
        FirstName varchar(25) not null,
        LastName varchar(30) not null,
        DateofBirth date,
        Gender enum ('M','F'),
        PatientAddress varchar(30) not null,
        Picture longblob,
        Email varchar(50) not null,
        Phone varchar (20) not null,
        
        Primary key(PatientID)
	);

Create table Admission(
		AdmissionID int,
        AdmissionDate datetime not null,
        DischargeDate datetime not null,
        RoomNumber varchar(10) not null,
        BranchID int,
        PatientID int,
        
        Primary key (AdmissionID),
        Foreign key(BranchID) references Branch(BranchID),
        Foreign key(PatientID) references Patients(PatientID)
	);
    
Create table Death(
		DeathID int,
        DateofDeath datetime not null,
        CauseofDeath varchar(30) not null,
        PatientID int,
        
        Primary key(DeathID),
        Foreign key(PatientID) references Patients(PatientID)
	);
    
Create table Medication (
		MedicationID int,
        MedicationName varchar(25) not null,
        Dosage varchar(30) not null,
        Description varchar(50) not null,
        BranchID int,
        
        Primary key(MedicationID),
        Foreign key(BranchID) references Branch(BranchID)
	);
    
Create table Diagnosis(
		DiagnosisID int,
        DiagnosisName varchar(25) not null,
        Description varchar (35) not null,
        
        Primary key(DiagnosisID)
	);
    
Create table Treatment(
		TreatmentID int,
        PatientID int,
        StaffID int,
        DiagnosisID int,
        MedicationID int,
        BranchID int,
        AdmissionID int,
        TreatmentDate datetime not null,
        Cost decimal (10,2),
        Duration int,
        
        Primary key(TreatmentID),
        Foreign Key(PatientID) references Patients(PatientID),
        Foreign Key(StaffID) references Staff(StaffID),
        Foreign key(DiagnosisID) references Diagnosis(DiagnosisID),
        Foreign key(MedicationID) references Medication(medicationID),
        foreign key(BranchID) references Branch(BranchID),
        foreign key(AdmissionID) references Admission(AdmissionID)
	);