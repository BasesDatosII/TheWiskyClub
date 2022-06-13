USE WhiskeyClub
/*
Use for inserts and test the procedures
*/

--Inserts for country's
INSERT INTO Country (idCountry, countryName ) VALUES(44, 'Scothland')
INSERT INTO Country (idCountry, countryName ) VALUES(1, 'United States')
INSERT INTO Country (idCountry, countryName ) VALUES(353, 'Ireland')

--Inserts for departments's
INSERT INTO Department(departmentName)VALUES ('Administration')
INSERT INTO Job (jobName, idDepartment) VALUES ('Administrator',1) -- job for administrator
