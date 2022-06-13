# CRUD ProductType

DELIMITER //
CREATE PROCEDURE CProductType (IN pTypeName varchar(20), OUT result VARCHAR(200))
BEGIN
	IF (pTypeName IS NOT NULL) THEN
		BEGIN
			IF ((SELECT COUNT(idProductType) FROM ProductType WHERE typeName = pTypeName) = 0) THEN
				BEGIN
					INSERT INTO ProductType (typeName, isactive) VALUES (pTypeName, 1);
                    SET result = "The Product Type has been added";
                END;
			ELSE
				SET result = "There is already a Product Type with that name";
			END IF;
		END;
	ELSE
		SET result = "The name of the Product Type can't be NULL";
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE RProductType (IN pIdProductType INT, pTypeName varchar(200), pIsActive BIT) 
BEGIN
	SELECT idProductType AS 'Product Type ID', typeName AS 'Product Type Name', isActive AS 'Active'
    FROM ProductType WHERE idProductType = IFNULL(pIdProductType, idProductType) AND typeName = IFNULL(pTypeName, typeName)
    AND isActive = IFNULL(pisActive, isActive);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UProductType (IN pIdProductType INT, pTypeName varchar(20), pIsActive BIT, OUT result VARCHAR(200))
BEGIN
	SET result = "";
	IF (pIdProductType IS NOT NULL AND (SELECT COUNT(idProductType) FROM ProductType WHERE idProductType = pIdProductType) > 0) THEN
		BEGIN
			IF (pTypeName IS NOT NULL) THEN
				BEGIN
					IF ((SELECT COUNT(idProductType) FROM ProductType WHERE typeName = pTypeName) = 0) THEN
						UPDATE ProductType SET typeName = pTypeName WHERE idProductType = pIdProductType;
                        SET result = CONCAT(result, 'The name has been modified\n');
                        SET result = REPLACE(result, ',', CHAR(10));
					ELSE
						SET result = CONCAT(result, 'The name hasn´t been modified because it already exists\n');
					END IF;
                END;
			END IF;
            IF (pIsActive IS NOT NULL AND pIsActive = 1) THEN
				BEGIN
					UPDATE ProductType SET isActive = pIsActive WHERE idProductType = pIdProductType;
                    SET result = CONCAT(result, 'The Product Type is now active\n');
                END;
			END IF;
		END;
	ELSE
		SET result = "The Product Type ID can't be NULL or the ID specified doesn´t exists";
	END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DProductType (IN pIdProductType INT, OUT result VARCHAR(200))
BEGIN
	IF ((SELECT COUNT(idProductType) FROM ProductType WHERE idProductType = pIdProductType) > 0) THEN
		BEGIN
			UPDATE ProductType SET isActive = 0 WHERE idProductType = pIdProductType;
            SET result = "The Product Type is now inactive";
            #cascade here
        END;
	ELSE
		SET result = "The ID specified doesn´t exists";
	END IF;
END //
DELIMITER ;

#################################################
CALL CProductType('Tabaco', @result);
SELECT @result;
CALL RProductType(NULL, NULL, NULL);
CALL UProductType(1, 'Whiskey', 1, @result);
SELECT @result;
CALL DProductType(2,@result);
SELECT @result;
SELECT * FROM ProductType;
#################################################

DELIMITER //
CREATE PROCEDURE CSupplier ()
BEGIN
	
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE RSupplier ()
BEGIN
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE USupplier ()
BEGIN
END //
DELIMITER 

DELIMITER //
CREATE PROCEDURE DSupplier ()
BEGIN
END //
DELIMITER ;














DELIMITER //
CREATE PROCEDURE C ()
BEGIN
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE R ()
BEGIN
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE U ()
BEGIN
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE D ()
BEGIN
END //
DELIMITER ;