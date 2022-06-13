
/*-----------------------------------------------------------------------------------------*
|									Validation procedures								   |							
------------------------------------------------------------------------------------------*/
/*Procedures for valitation InfoEmployee*/
CREATE PROCEDURE isidEmployeeExist  @vinfoEmploee INT --RETURNS 1 for existing employee or 0 in otherwise  
AS
BEGIN
	IF((SELECT COUNT(idInfoEmployee) FROM InfoEmployee WHERE @vinfoEmploee=idInfoEmployee) >=1)
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
CREATE PROCEDURE VbithDate @vbirthDate DATE
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
CREATE PROCEDURE isEmailCorrect @pEmail varchar(50) --returns 1 for a valid email or 0 for a invalid email
AS
DECLARE @isEmail BIT = 0
BEGIN
	IF(@pEmail like '%[a-z,0-9]@[a-z]%.[A-Za-z]%[A-Za-z]' 
	AND @pEmail NOT LIKE '%@%@%' 
	AND @pEmail NOT LIKE '%(%'
	AND @pEmail NOT LIKE '%)%'
	AND @pEmail NOT LIKE '%[%'
	AND @pEmail NOT LIKE '%]%'
	AND @pEmail NOT LIKE '%;%'
	AND @pEmail NOT LIKE '%,%'
	AND @pEmail NOT LIKE '%\%')
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
@pphoneNumber INT, @pbirthDate DATE, @pemployeeAddress VARCHAR(100), @idCountry INT
AS 
DECLARE @result VARCHAR(100)
BEGIN

END



