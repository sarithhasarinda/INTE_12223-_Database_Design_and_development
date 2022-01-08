CREATE TABLE hospital 
(
    hospitalName varchar(255) NOT NULL,
    hospitalAddress varchar(255),
    PRIMARY KEY (hospitalName)
);

create table hospitalTelephone
(
	hospitalName varchar(255) NOT NULL,
    telephoneNumber char(10) NOT NULL,
	PRIMARY KEY (hospitalName,telephoneNumber )
);

create table ward
(
	wardNo varchar(5) NOT NULL,
    wardName varchar(50),
    hospitalName varchar(255),
    PRIMARY KEY (wardNo),
    Foreign key (hospitalName) references hospital(hospitalName)
);

create table consultant
(
	consultantID varchar(10) NOT null,
    qualifications varchar(255),
    salary decimal(10,2),
    consultantTitle varchar(5),
    consultantSurname varchar(50),
    consultantForename varchar(50),
    hospitalName varchar(255),
    PRIMARY KEY (consultantID),
	Foreign key (hospitalName) references hospital(hospitalName)
);

create table patient
(
	patientCode varchar(10) NOT NULL,
    patientAddress varchar(255),
    patientName varchar(255),
    primary key (patientCode)
);

create table consultant_patient
(
	consultantID varchar(10) NOT null,
    patientCode varchar(10) NOT NULL,
    assignDate date,
    assignTime time,
    primary key(consultantID,patientCode),
    foreign key(consultantID) references consultant(consultantID),
    foreign key(patientCode) references patient(patientCode)    
);

create table drug 
(
	drugCode varchar(10) not null,
	drugName varchar(255),
	primary key (drugCode)
);

create table prescribe
(
	drugCode varchar(10) not null,
	patientCode varchar(10) not null,
	prescribeDate date,
	prescribeDosage int,
	primary key (drugCode, patientCode),
	foreign key  (drugCode) references drug(drugCode),
	foreign key (patientCode) references patient(patientCode)
);
