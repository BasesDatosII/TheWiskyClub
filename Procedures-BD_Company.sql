
/*-----------------------------------------------------------------------------------------*
|									Validation procedures								   |							
------------------------------------------------------------------------------------------*/
/*Procedures for valitation InfoEmployee*/
CREATE PROCEDURE isidEmployeeExist  @vinfoEmployee INT --RETURNS 1 for existing employee or 0 in otherwise  
AS
BEGIN
	IF((SELECT COUNT(idInfoEmployee) FROM InfoEmployee WHERE @vinfoEmployee=idInfoEmployee) >=1)
		BEGIN
			PRINT N'Employee already exist'
			RETURN (1)
		END
	ELSE
		BEGIN
			PRINT N'Employee does not exist'
			RETURN (0)
		END
END
GO
CREATE PROCEDURE VbirthDate @vbirthDate DATE
as 
BEGIN
	IF(@vbirthDate < GETDATE())
		BEGIN
			RETURN (1)
		END
	ELSE
		BEGIN
			PRINT N'Birth date cannot be after that today'
			RETURN (0)
		END
END
GO 
CREATE PROCEDURE VCountry @vidCountry INT
AS
BEGIN
	IF((SELECT COUNT(idCountry) FROM Country WHERE @vidCountry = idCountry)>=1) --exist
		BEGIN
			RETURN(1)
		END
	ELSE --Country does not exist
		BEGIN
			RETURN(0)
		END
END
GO
CREATE PROCEDURE isEmailCorrect @vEmail varchar(50) --returns 1 for a valid email or 0 for a invalid email
AS
DECLARE @isEmail BIT = 0
BEGIN
	IF(@vEmail like '%[a-z,0-9]@[a-z]%.[A-Za-z]%[A-Za-z]' 
	AND @vEmail NOT LIKE '%@%@%' 
	AND @vEmail NOT LIKE '%(%'
	AND @vEmail NOT LIKE '%)%'
	AND @vEmail NOT LIKE '%[%'
	AND @vEmail NOT LIKE '%]%'
	AND @vEmail NOT LIKE '%;%'
	AND @vEmail NOT LIKE '%,%'
	AND @vEmail NOT LIKE '%\%')
		BEGIN
			set @isEmail = 1
		END
	RETURN(@isEmail)
END
GO
--CREATE PROCEDURE isDepartmentExist @vidD INT NOT NULL
CREATE PROCEDURE isDepartmentExist @vidD INT
AS
BEGIN
	IF((SELECT count(idDepartment) FROM Department WHERE @vidD = idDepartment)>=1)
		RETURN(1)
	ELSE
		RETURN(0)
END
GO
CREATE PROCEDURE isJobExist @vIdJob INT
AS
BEGIN
	IF(@vIdJob IS NOT NULL )
		BEGIN 
		IF((SELECT COUNT(idJob) FROM Job WHERE @vIdJob = idJob)>=1)
			BEGIN
				RETURN(1)
			END
		ELSE
			RETURN(0)
		END
	ELSE
		RETURN(-1)
END
GO
CREATE PROCEDURE isEmployeeUserExist @vidEmployeeUser INT 
AS
BEGIN
	IF(@vidEmployeeUser IS NOT NULL)
		BEGIN
			IF((SELECT COUNT(idEmployeeUser) FROM EmployeeUser WHERE idEmployeeUser = @vidEmployeeUser) >= 1)
				RETURN(1)
			ELSE
				RETURN(0)
		END
	ELSE
		RETURN(-1)
END
GO
CREATE PROCEDURE isCashClubExist @vidCashClub INT
AS 
BEGIN
	IF (@vidCashClub IS NOT NULL )
		BEGIN 
		IF((SELECT COUNT(idCashClub) FROM CashClub WHERE @vidCashClub = idCashClub) >= 1)
			BEGIN
				RETURN(1)
			END
		ELSE
			RETURN(0)
		END
	ELSE
		RETURN(-1)
END
GO
CREATE PROCEDURE isEmployeeExist @vidEmployee INT
AS 
BEGIN
	IF(@vidEmployee IS NOT NULL)
		IF((SELECT COUNT(idEmployee) FROM Employee WHERE idEmployee =@vidEmployee) >= 1)
			RETURN(1)
		ELSE
			RETURN(0)
	RETURN(0)
END
GO


	/*
	Try to convert varchar to varbinary when the password is secure
	*/
CREATE PROCEDURE ispasswordCorrectFormat @vpassword VARCHAR(8000)
AS
BEGIN 
	IF(len(@vpassword)>=8)--more than 8 is secure
		BEGIN
		IF(@vpassword NOT LIKE '%[a-z]%' or @vpassword NOT LIKE '%[0-9]%' or @vpassword NOT LIKE '%[A-Z]%'
		or @vpassword NOT LIKE '%[~!@#$%^&*()_+-={}\[\]:"|\;,./<>?'']%' ESCAPE '\' )
			BEGIN
			PRINT N'Wrong format'
			RETURN(0)
			END
		ELSE
			BEGIN
			PRINT N'Sucess'
			RETURN(1)
			END
		END	
	ELSE
		BEGIN
			PRINT N'len less than 8'
			RETURN(0)
		END
END
GO
EXEC ispasswordCorrectFormat @vpassword = 'aaaraaaaa%2' 

/*-----------------------------------------------------------------------------------------*
|									CRUD InfoEmployee								   |							
------------------------------------------------------------------------------------------*/
/*This procedure can be used by any user employee
*/
CREATE PROCEDURE CInfoEmployee @pidInfoEmployee int, @ppeopleName VARCHAR(20), @psurname VARCHAR(30), @pemail VARCHAR(50),
@pphoneNumber INT, @pbirthDate DATE, @pemployeeAddress VARCHAR(100), @pidCountry INT
AS 
DECLARE @result VARCHAR(100)
DECLARE @respIdpeopleExist BIT
DECLARE @respVbirthdate BIT
DECLARE @respVCountry BIT
DECLARE @respEmail BIT 
BEGIN
	EXEC @respIdpeopleExist = isidEmployeeExist @vinfoEmployee = @pidInfoEmployee
	EXEC @respVbirthdate = VbirthDate @vbirthDate=@pbirthDate
	EXEC @respVCountry = VCountry @vidCountry = @pidCountry
	EXEC @respEmail = isEmailCorrect @vEmail  = @pemail
	--val admin roles
	IF(@respIdpeopleExist = 0)
		BEGIN
		IF(@respVbirthdate = 1)
			BEGIN
			IF(@respVCountry = 1)
				BEGIN
				IF (@respEmail = 1 )
					BEGIN
					INSERT INTO InfoEmployee (idInfoEmployee,peopleName,surname, email, phoneNumber, birthDate, employeeAddress,idCountry)
					VALUES(@pidInfoEmployee, @ppeopleName, @psurname, @pemail, @pphoneNumber, @pbirthDate, @pemployeeAddress, @pidCountry)
					SET @result = 'The information is now in database sucessfully' 
					END
				ELSE
					SET @result = 'The email have incorrect format' 
				END
			ELSE
				SET @result = 'This country is not in database'  
			END
		ELSE
			SET @result = 'Birth date incorrect'
		END
	ELSE
		SET @result = 'This id exist, please try with another one'
	RETURN (@result)
END
GO
CREATE PROCEDURE RInfoEmployee @pidInfoEmployee int, @ppeopleName VARCHAR(20), @psurname VARCHAR(30), @pemail VARCHAR(50),
@pphoneNumber INT, @pbirthDate DATE, @pemployeeAddress VARCHAR(100), @pidCountry INT
AS
DECLARE @result VARCHAR(100)
DECLARE @respIdpeopleExist BIT
DECLARE @respVbirthdate BIT
DECLARE @respVCountry BIT
DECLARE @respEmail BIT 
BEGIN
	EXEC @respIdpeopleExist = isidEmployeeExist @vinfoEmployee = @pidInfoEmployee
	EXEC @respVbirthdate = VbirthDate @vbirthDate=@pbirthDate
	EXEC @respVCountry = VCountry @vidCountry = @pidCountry
	EXEC @respEmail = isEmailCorrect @vEmail  = @pemail
	IF(@respIdpeopleExist = 1)
		BEGIN
		IF(@respVbirthdate = 1)
			BEGIN
			IF(@respVCountry = 1)
				BEGIN
				IF (@respEmail = 1 )
					BEGIN
						SELECT IE.idInfoEmployee, IE.peopleName, IE.surname, IE.email, IE.phoneNumber, IE.birthDate, IE.employeeAddress, IE.idCountry
						FROM InfoEmployee as IE WHERE  IE.idInfoEmployee = ISNULL(@pidInfoEmployee , IE.idInfoEmployee  ) 
						AND IE.peopleName = ISNULL(@ppeopleName, IE.peopleName) 
						AND IE.surname = ISNULL(@psurname, IE.surname)
						AND IE.email = ISNULL(@pemail, IE.email)
						AND IE.phoneNumber = ISNULL(@pphoneNumber, IE.phoneNumber)
						AND IE.birthDate = ISNULL(@pbirthDate, IE.birthDate)
						AND IE.employeeAddress = ISNULL(@pemployeeAddress, IE.employeeAddress)
						AND IE.idCountry = ISNULL(@pidCountry, IE.idCountry)
						END
				ELSE
					SET @result = 'The email have incorrect format' 
				END
			ELSE
				SET @result = 'This country is not in database'  
			END
		ELSE
			SET @result = 'Birth date incorrect'
		END
	ELSE
		SET @result = 'This id exist, please try with another one'
	RETURN (@result)
END
GO
CREATE PROCEDURE UInfoEmployee @pidInfoEmployee int, @ppeopleName VARCHAR(20), @psurname VARCHAR(30), @pemail VARCHAR(50),
@pphoneNumber INT, @pbirthDate DATE, @pemployeeAddress VARCHAR(100), @pidCountry INT
AS
DECLARE @result VARCHAR(100)
DECLARE @respIdpeopleExist BIT
DECLARE @respVbirthdate BIT
DECLARE @respVCountry BIT
DECLARE @respEmail BIT 
BEGIN
	EXEC @respIdpeopleExist = isidEmployeeExist @vinfoEmployee = @pidInfoEmployee
	EXEC @respVbirthdate = VbirthDate @vbirthDate=@pbirthDate
	EXEC @respVCountry = VCountry @vidCountry = @pidCountry
	EXEC @respEmail = isEmailCorrect @vEmail  = @pemail
	IF (@pidInfoEmployee IS NOT NULL)
		BEGIN
		IF(@respIdpeopleExist = 1 )
			BEGIN
			IF(@respVbirthdate = 1)
				BEGIN
				IF(@respVCountry = 1)
					BEGIN
					IF (@respEmail = 1 )
						BEGIN
							UPDATE InfoEmployee SET peopleName = ISNULL(@ppeopleName, peopleName) 
							,surname = ISNULL(@psurname, surname)
							,email = ISNULL(@pemail, email)
							,phoneNumber = ISNULL(@pphoneNumber, phoneNumber)
							,birthDate = ISNULL(@pbirthDate, birthDate)
							,employeeAddress = ISNULL(@pemployeeAddress, employeeAddress)
							,idCountry = ISNULL(@pidCountry, idCountry) WHERE InfoEmployee.idInfoEmployee = @pidInfoEmployee
							SET @result = '¡Update Sucessfully!' 
						END
					ELSE
						SET @result = 'The email have incorrect format' 
					END
				ELSE
					SET @result = 'This country is not in database'  
				END
			ELSE
				SET @result = 'Birth date incorrect'
			END
		ELSE
			SET @result = 'This id do not exist, please try with another one'
		END
	ELSE 
		BEGIN
			SET @result = 'The id cannot be null'
		END
	RETURN (@result)
END
/*============================================================================
					 CRUD Départment
*============================================================================*/

GO
--Only for admins
CREATE PROCEDURE CDepartment @idUser INT, @departmentname VARCHAR(30)
AS
BEGIN
	--VALIDATE ADMIN 
	IF (@departmentname IS NOT NULL)
		BEGIN
			INSERT INTO Department (departmentName) VALUES (@departmentname)
		END
	ELSE
		PRINT N'Department cannot be null'
END
GO 
CREATE PROCEDURE UDepartment @idUser INT, @department VARCHAR(30)
AS
BEGIN
	IF (@department IS NOT NULL)
		BEGIN
			UPDATE Department SET departmentName = @department 
		END
	ELSE
		PRINT N'Department cannot be null'
END
/*============================================================================
					 CRUD JOB
*============================================================================*/
go
--we need to convert this to ONLY FOR ADMIN USERS
CREATE PROCEDURE CJob @pjobName VARCHAR(20), @pidDepartment INT
AS
DECLARE @respidDepartmetExist BIT
BEGIN 
	IF (@pjobName IS NOT NULL AND @pidDepartment IS NOT NULL)
		BEGIN
			EXEC @respidDepartmetExist = isDepartmentExist @vidD = @pidDepartment
			IF(@respidDepartmetExist = 1)
				BEGIN
					INSERT INTO Job (jobName, idDepartment) VALUES(@pjobName, @pidDepartment)
					PRINT N'Sucessfully insert into job'
				END
			ELSE
				PRINT N'Id deparmet already exist'
		END
END
GO
CREATE PROCEDURE UJob @pidJob INT NOT NULL, @pJobName INT, @pidDeparment INT
AS 
DECLARE @respjobExist BIT
DECLARE @respidDepartmetExist BIT 
BEGIN
	BEGIN TRANSACTION
	EXEC @respjobExist = isJobExist @vIdJob = @pidJob 
	IF(@pidDeparment IS NOT NULL)
		BEGIN
			EXEC @respidDepartmetExist = isDepartmentExist @vidD = @pidDeparment
		END
	ELSE
		BEGIN
			SET @respidDepartmetExist = 1
		END
	IF(@respidDepartmetExist = 1)
		BEGIN
		IF(@respjobExist = 0)
			BEGIN
				UPDATE Job SET jobName = ISNULL( @pJobName, jobName ), idDepartment = ISNULL(@pidDeparment, idDepartment) WHERE
				@pidJob = idJob
			END
		ELSE
			BEGIN
				PRINT N'Job is not in the database'
			END
		END
	ELSE
		BEGIN
			PRINT N'Department do not exist' 
		END
	COMMIT TRANSACTION
END
GO
/*============================================================================
					 CRUD Employee user
*============================================================================*/
--create
CREATE PROCEDURE CEmployeeUser @pidEmployee INT, @ppassword VARBINARY(8000)
AS
DECLARE @respUserExist BIT
BEGIN
	EXEC @respUserExist = isEmployeeUserExist @vidEmployeeUser = @pidEmployee 
	IF (@respUserExist =0)
		BEGIN
			INSERT INTO EmployeeUser (idEmployeeUser, pasword) VALUES (@pidEmployee,ENCRYPTBYPASSPHRASE('password',@ppassword))
		END
	ELSE
		PRINT N'This user already exist' 
END
GO
--update pasword
CREATE PROCEDURE UEmployeeUserPassword @pidEmployee INT NOT NULL, @ppassword VARBINARY(8000) NOT NULL
AS
DECLARE @respUserExist BIT
BEGIN
	EXEC @respUserExist = isEmployeeUserExist @vidEmployeeUser = @pidEmployee 
	IF (@respUserExist =1)
		BEGIN
			UPDATE EmployeeUser SET pasword = ENCRYPTBYPASSPHRASE('password',@ppassword) WHERE @pidEmployee = idEmployeeUser
		END
	ELSE
		PRINT N'This user do not exist' 
END
GO
--update reinstate user
CREATE PROCEDURE reinstateEmployeeUser @pidEmployee INT NOT NULL 
AS
DECLARE @respUserExist BIT
BEGIN
	EXEC @respUserExist = isEmployeeUserExist @vidEmployeeUser = @pidEmployee 
	IF (@respUserExist =1)
		BEGIN
			UPDATE EmployeeUser SET isActive = 1 WHERE @pidEmployee = idEmployeeUser
		END
	ELSE
		PRINT N'This user do not exist' 
END
go
--read
CREATE PROCEDURE REmployeeUser  @pidEmployee INT, @pisActive BIT
AS
BEGIN
	SELECT idEmployeeUser, isActive FROM EmployeeUser WHERE  idEmployeeUser = ISNULL(@pidEmployee, idEmployeeUser) 
						AND isActive = ISNULL(@pisActive, isActive) 
END
GO
--delete
CREATE PROCEDURE DEmployeeUser @pidEmployee INT NOT NULL
AS
DECLARE @respUserExist BIT
BEGIN
	EXEC @respUserExist = isEmployeeUserExist @vidEmployeeUser = @pidEmployee 
	IF (@respUserExist =1)
		BEGIN
			UPDATE EmployeeUser SET isActive = 0 WHERE  @pidEmployee = idEmployeeUser
		END
	ELSE
		PRINT N'This user do not exist' 
END
GO
/*============================================================================
					 CRUD CASH CLUB
*============================================================================*/
--CREATE PROCEDURE CcashClub @pcashType VARCHAR(20) NOT NULL, @pidClub INT NOT NULL
CREATE PROCEDURE CcashClub @pcashType VARCHAR(20), @pidClub INT
AS
BEGIN
	IF (@pcashType IS NOT NULL AND @pidClub IS NOT NULL)
		INSERT INTO CashClub (cashType, idClub) VALUES (@pcashType, @pidClub)
END
GO
CREATE PROCEDURE RCashClub @pidCashClub INT, @pcashType VARCHAR(20), @pidClub INT
AS 
BEGIN 
	SELECT idCashClub, cashType, idClub FROM CashClub WHERE idCashClub = ISNULL(@pidCashClub, idCashClub) AND
		cashType= ISNULL(@pcashType, cashType) AND idClub = ISNULL(@pidClub, idClub)

END
go
--read cash club
CREATE PROCEDURE UcashClub @pidCashClub INT NOT NULL, @pcashType VARCHAR(20), @pidClub INT
AS
DECLARE @respCashClubExist BIT
BEGIN
	EXEC @respCashClubExist = isCashClubExist @vidCashClub = @pidCashClub
	IF(@respCashClubExist = 1)
	BEGIN
		UPDATE CashClub SET cashType = ISNULL(@pcashType, cashType), idClub = ISNULL(@pidClub, idClub)
		WHERE idCashClub = @pidCashClub
	END
	ELSE
		BEGIN
		PRINT N'Cash club do not exist to update' 
		END
END
GO
/*============================================================================
					 CRUD Employee
*============================================================================*/
-- create employee
CREATE PROCEDURE CEmployee @pidEmployee INT,
							@pidInfoEmployee INT,
							@psalary money, 
							@pidJob INT, 	
							@pidEmployeeUser INT, 
							@pidCashClub INT
AS
DECLARE @respidInfoEmployee BIT
DECLARE @respidJob BIT
DECLARE @residCashClub BIT
DECLARE @respidEmployeeUser BIT
DECLARE @result VARCHAR(100)
BEGIN
	EXEC @respidInfoEmployee = isidEmployeeExist @vinfoEmployee = @pidInfoEmployee
	EXEC @respidJob = isJobExist @vIdJob = @pidJob 
	EXEC @residCashClub  = isCashClubExist @vidCashClub = @pidCashClub
	EXEC @respidEmployeeUser = isEmployeeUserExist @vidEmployeeUser = @pidEmployeeUser 
	BEGIN TRANSACTION
	IF(@respidInfoEmployee = 1)
		BEGIN
		IF(@respidEmployeeUser = 1)
			BEGIN
				IF(@residCashClub = 1)
					BEGIN
					IF(@respidJob = 1)
						BEGIN
							INSERT INTO Employee (idEmployee, idInfoEmployee, salary, idJob,idEmployeeUser, idCashClub) 
							VALUES (@pidEmployee, @pidInfoEmployee, @psalary, @pidJob, @pidEmployeeUser,  @pidCashClub)
							SET @result = 'insert sucessfully'
						END
					ELSE
						SET @result = 'Invalid ID JOB'
					END
			ELSE
				SET @result = 'Invalid id cash club'
			END
		ELSE
			SET @result = 'Invalid EmployeeUser'
		END
	ELSE
		SET @result = 'Invalid idInfoPeople'
		
	PRINT @result
	RETURN (@result)
	COMMIT TRANSACTION
END
go
-- --					UPDATES 
-- set Employee Job 
CREATE PROCEDURE setEmployeeJob @pidEmployee INT, @pidJob INT
AS
DECLARE @resEmployee BIT
DECLARE @respidJob BIT
BEGIN
--we need to valitate this for admins only
	EXEC @resEmployee = isEmployeeExist @vidEmployee = @pidEmployee
	EXEC @respidJob = isJobExist @vIdJob = @pidJob 
	IF(@resEmployee =1)
		BEGIN
		IF(@respidJob = 1)
			BEGIN
				UPDATE Employee SET idJob = ISNULL(@pidJob, idJob) WHERE @pidEmployee = idEmployee
			END 
		ELSE
			PRINT N'Id job do no exist'
		END
	ELSE
		PRINT N'Employee do not exist'
END
go
--update reinstate Employee
CREATE PROCEDURE reinstateEmployee @pidEmployee INT
AS
DECLARE @resEmployee BIT
BEGIN
	EXEC @resEmployee = isEmployeeExist @vidEmployee = @pidEmployee
	IF(@resEmployee =1)
		BEGIN
		UPDATE Employee SET isActive = 1 WHERE @pidEmployee = idEmployee		
		END
	ELSE
		PRINT N'Employee do not exist'
END
GO
CREATE PROCEDURE UCalification  @pidEmployee INT, @pcalification FLOAT
AS
DECLARE @resEmployee BIT
BEGIN
	EXEC @resEmployee = isEmployeeExist @vidEmployee = @pidEmployee
	IF(@resEmployee =1)
		BEGIN
		UPDATE Employee SET calification = @pcalification WHERE @pidEmployee = idEmployee		
		END
	ELSE
		PRINT N'Employee do not exist'
END
go
--update salary
CREATE PROCEDURE USalary  @pidEmployee INT, @psalary money
AS
DECLARE @resEmployee BIT
BEGIN
	EXEC @resEmployee = isEmployeeExist @vidEmployee = @pidEmployee
	IF(@resEmployee =1)
		BEGIN
		UPDATE Employee SET salary = @psalary WHERE @pidEmployee = idEmployee		
		END
	ELSE
		PRINT N'Employee do not exist'
END
go
--delete Employee
CREATE PROCEDURE DEmployee @pidEmployee INT
AS
DECLARE @resEmployee BIT
BEGIN
	EXEC @resEmployee = isEmployeeExist @vidEmployee = @pidEmployee
	IF(@resEmployee =1)
		BEGIN
		UPDATE Employee SET isActive = 0 WHERE @pidEmployee = idEmployee		
		END
	ELSE
		PRINT N'Employee do not exist'
END
GO
--READ
CREATE PROCEDURE REmployee @pidEmployee INT, 
						   @pidInfoEmployee INT, 
						   @pdisActive BIT,
						   @psalary money,
						   @pidJob INT,
						   @pidEmployeeUser INT,
						   @pdidCashClub INT,
						   @pcalification FLOAT
AS
BEGIN
	SELECT idEmployee, idInfoEmployee, isActive, salary, idJob, idEmployeeUser,idCashClub, calification
	FROM Employee WHERE idEmployee = ISNULL(@pidEmployee,idEmployee)
						AND idInfoEmployee = ISNULL(@pidInfoEmployee,idInfoEmployee)
						AND isActive = ISNULL(@pdisActive,isActive)
						AND salary = ISNULL(@psalary,salary)
						AND idJob = ISNULL(@pidJob,idJob)
						AND idEmployeeUser = ISNULL(@pidEmployeeUser,idEmployee)
						AND idCashClub = ISNULL(@pdidCashClub,idCashClub)
						AND calification = ISNULL(@pcalification,calification)
END
go

/*============================================================================
					 CRUD Employee
*============================================================================*/
CREATE PROCEDURE CCountry @countryName VARCHAR(20)
AS
BEGIN
	DECLARE @result NVARCHAR(MAX)
	IF (@countryName IS NOT NULL)
		BEGIN
			IF ((SELECT COUNT(idCountry) FROM Country WHERE countryName = @countryName) = 0)
				BEGIN
					INSERT INTO Country (countryName) VALUES (@countryName)
				END
			ELSE
				PRINT N'Country name already exists'
		END
	ELSE
		BEGIN
			SET @result = 'Any of the parameters can´t be null'
			SELECT @result
		END
END
GO

CREATE PROCEDURE RCountry @idCountry INT = NULL, @countryName VARCHAR(20) = NULL
AS
BEGIN
	SELECT idCountry AS 'Country ID', countryName AS 'Country Name'
	FROM Country WHERE idCountry = ISNULL(@idCountry, idCountry) AND
	countryName = ISNULL(@countryName, countryName)
END
GO

CREATE PROCEDURE UCountry @idCountry INT, @countryName VARCHAR(20)
AS
BEGIN
	DECLARE @result NVARCHAR(MAX)
	IF (@idCountry IS NOT NULL AND (SELECT COUNT(idCountry) FROM Country WHERE idCountry = @idCountry) > 0)
		BEGIN
			IF (@countryName IS NOT NULL)
				BEGIN
					IF ((SELECT COUNT(idCountry) FROM Country WHERE countryName = @countryName) = 0)
						BEGIN
							UPDATE Country SET countryName = @countryName WHERE idCountry = @idCountry
							SET @result = CONCAT(@result, 'Country name has been modified' + CHAR(13))
						END
					ELSE
						BEGIN
							SET @result = CONCAT(@result, 'Country name already exists' + CHAR(13))
						END
				END
			SET @result = CONCAT(@result, 'hanges made succesfully' + CHAR(13))
			SELECT @result
		END
	ELSE
		BEGIN
			SET @result = 'Country ID specified doesn´t exists'
			SELECT @result
		END
END
GO

CREATE PROCEDURE DCountry @idCountry VARCHAR(20)
AS
BEGIN
	DECLARE @result NVARCHAR(MAX)
	IF ((SELECT COUNT(idCountry) FROM Country WHERE idCountry = @idCountry) > 0)
		BEGIN
			DELETE Country WHERE idCountry = @idCountry
			SET @result = 'Country deleted'
			SELECT @result
		END
	ELSE
		BEGIN
			SET @result = 'Country ID specified doesn´t exists'
			SELECT @result
		END
END
GO

/*============================================================================
					 Report
*============================================================================*/

CREATE PROCEDURE Payroll @idDepartment INT = NULL, @salary INT = NULL, @calification FLOAT = NULL
AS
BEGIN
	SELECT idEmployee AS 'Employee ID', peopleName AS ' Employee Name', surname AS 'Employee Surname',
	countryName AS 'Country Name', salary AS 'Salary', jobName AS 'Job Name',
	departmentName AS 'Department Name', cashType as 'CashType', idClub AS 'Club ID', calification AS 'Calification'
	FROM Employee E INNER JOIN InfoEmployee IE ON E.idInfoEmployee = IE.idInfoEmployee
	INNER JOIN Country C ON IE.idCountry = C.idCountry
	INNER JOIN Job J ON E.idJob = J.idJob INNER JOIN Department D ON J.idDepartment = D.idDepartment
	INNER JOIN CashClub CC ON  E.idCashClub = CC.idCashClub
	WHERE D.idDepartment = ISNULL(@idDepartment, D.idDepartment) AND salary = ISNULL(@salary, salary)
	AND calification = ISNULL(@calification, calification)
END
GO




CREATE PROCEDURE CountryQuery @idCountry INT
AS
BEGIN
	IF (@idCountry IS NOT NULL)
		BEGIN
			IF (@idCountry = 1)
				EXEC ('CALL CountryQuery (NULL, NULL, NULL, NULL, NULL, NULL);') AT LS_WUNITEDSTATES
			ELSE IF (@idCountry = 2)
				EXEC ('CALL CountryQuery (NULL, NULL, NULL, NULL, NULL, NULL);') AT LS_WSCOTLAND
			ELSE IF (@idCountry = 3)
				EXEC ('CALL CountryQuery (NULL, NULL, NULL, NULL, NULL, NULL);') AT LS_WIRELAND
		END
END



/*============================================================================
					 CRUD CALLS
*============================================================================*/

EXEC CcashClub @pcashType = 'Dollar', @pidClub = 1
EXEC CcashClub @pcashType = 'Pound', @pidClub = 2
EXEC CcashClub @pcashType = 'Euro', @pidClub = 3
EXEC RCashClub 
EXEC UcashClub

EXEC CDepartment @idUser = NULL, @departmentname = 'Contability'

EXEC CJob @pjobName = 'Accountant', @pidDepartment = 1

EXEC CCountry @countryName = 'Costa Rica'

EXEC CInfoEmployee @pidInfoEmployee = 1, @ppeopleName = 'Esteban', @psurname = 'Leiva', @pemail = 'esteban@gmail.com',
@pphoneNumber = 80808293, @pbirthdate = '2002-04-20', @pemployeeAddress = 'San José, Costa Rica', @pidCountry = 1

--EXEC CEmployeeUser @pIdEmployee = 1, @ppassword = CONVERT(VARBINARY(8000),ENCRYPTBYPASSPHRASE('password','Password')
--EXEC CEmployee @pidEmployee = 1, @pidInfoEmployee = 1, @psalary = 500000, @pidJob = 1, @pidEmployeeUser = 1, @pidCashClub = 1
INSERT INTO EmployeeUser (idEmployeeUser, pasword, isActive) VALUES (1, CONVERT(VARBINARY(8000),ENCRYPTBYPASSPHRASE('password','Password'), 1), 1)
INSERT INTO Employee (idEmployee, idInfoEmployee, isActive, salary, idJob, idEmployeeUser, idCashClub, calification) VALUES (1, 1, 1, 500000, 1, 1, 1, 4.6)

EXEC Payroll

EXEC CountryQuery @idCountry = 1


SELECT * FROM CashClub
SELECT * FROM Department
EXEC RCountry
SELECT * FROM Job
SELECT * FROM InfoEmployee
SELECT * FROM EmployeeUser
SELECT * FROM Employee

