
/*-----------------------------------------------------------------------------------------*
|									Validation procedures								   |							
------------------------------------------------------------------------------------------*/
/*Procedures for valitation InfoEmployee*/
ALTER PROCEDURE isidEmployeeExist  @vinfoEmployee INT --RETURNS 1 for existing employee or 0 in otherwise  
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
ALTER PROCEDURE VCountry @vidCountry INT
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
ALTER PROCEDURE isEmailCorrect @vEmail varchar(50) --returns 1 for a valid email or 0 for a invalid email
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
/*
					 CRUD Department
*/
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