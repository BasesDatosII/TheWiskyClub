CREATE TABLE Country
(
	idCountry INT PRIMARY KEY IDENTITY,
	countryName VARCHAR(20) NOT NULL
)
GO

CREATE TABLE InfoEmployee
(
	idInfoEmployee INT PRIMARY KEY IDENTITY,
	peopleName VARCHAR(20) NOT NULL,
	surname VARCHAR(30) NOT NULL,
	email VARCHAR(50) NOT NULL,
	phoneNumber INT NOT NULL,
	birthDate DATE NOT NULL,
	employeeAddress VARCHAR(100) NOT NULL,
	idCountry INT NOT NULL,
	CONSTRAINT fk_InfoEmployeeCountry FOREIGN KEY (idCountry)
	REFERENCES Country(idCountry)
)
GO

CREATE TABLE Department
(
	idDepartment INT PRIMARY KEY IDENTITY,
	departmentName VARCHAR(30) NOT NULL
)
GO


CREATE TABLE Job
(
	idJob INT PRIMARY KEY IDENTITY,
	jobName VARCHAR(20) NOT NULL,
	idDepartment INT NOT NULL,
	CONSTRAINT fk_JobDepartment FOREIGN KEY (idDepartment)
	REFERENCES Department(idDepartment)
)
GO

CREATE TABLE CashClub
(
	idCashClub INT PRIMARY KEY IDENTITY,
	cashType VARCHAR(20) NOT NULL,
	idClub INT NOT NULL
)
GO

CREATE TABLE EmployeerUser
(
	idEmployeerUser INT PRIMARY KEY IDENTITY,
	pasword VARCHAR(30) NOT NULL,
	isActive BIT NOT NULL, --1 = ACTIVE, 0 = NON ACTIVE
)
GO

CREATE TABLE Employee
(
	idEmployee INT PRIMARY KEY IDENTITY,
	idInfoEmployee INT NOT NULL,
	CONSTRAINT fk_EmployeeInfoEmployee FOREIGN KEY (idInfoEmployee)
	REFERENCES InfoEmployee(idInfoEmployee),
	isActive BIT NOT NULL,
	salary money NOT NULL,
	idJob INT NOT NULL,
	CONSTRAINT fk_EmployeeJob FOREIGN KEY (idJob)
	REFERENCES Job(idJob),
	idEmployeerUser INT NOT NULL,
	CONSTRAINT fk_EmployeeEmployeerUser FOREIGN KEY (idEmployeerUser)
	REFERENCES EmployeerUser(idEmployeerUser),
	idCashClub INT NOT NULL,
	CONSTRAINT fk_EmployeeCashClub FOREIGN KEY (idCashClub)
	REFERENCES CashClub(idCashClub),
	calification FLOAT NOT NULL
)