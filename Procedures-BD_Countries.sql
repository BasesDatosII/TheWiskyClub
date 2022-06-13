# CRUD ProductType

DELIMITER //
CREATE PROCEDURE CProductType (IN pTypeName varchar(20), OUT result VARCHAR(200))
BEGIN
	IF (pTypeName IS NOT NULL) THEN
		BEGIN
			IF ((SELECT COUNT(idProductType) FROM ProductType WHERE typeName = pTypeName) = 0) THEN
				BEGIN
					INSERT INTO ProductType (typeName, isActive) VALUES (pTypeName, 1);
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
CREATE PROCEDURE RProductType (IN pIdProductType INT, IN pTypeName varchar(200), IN pIsActive BIT) 
BEGIN
	SELECT idProductType AS 'Product Type ID', typeName AS 'Product Type Name', isActive AS 'Active'
    FROM ProductType WHERE idProductType = IFNULL(pIdProductType, idProductType) AND typeName = IFNULL(pTypeName, typeName)
    AND isActive = IFNULL(pIsActive, isActive);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UProductType (IN pIdProductType INT, IN pTypeName varchar(20), IN pIsActive BIT, OUT result VARCHAR(200))
BEGIN
	SET result = "";
	IF (pIdProductType IS NOT NULL AND (SELECT COUNT(idProductType) FROM ProductType WHERE idProductType = pIdProductType) > 0) THEN
		BEGIN
			IF (pTypeName IS NOT NULL) THEN
				BEGIN
					IF ((SELECT COUNT(idProductType) FROM ProductType WHERE typeName = pTypeName) = 0) THEN
						UPDATE ProductType SET typeName = pTypeName WHERE idProductType = pIdProductType;
                        SET result = CONCAT(result, 'The name has been modified\n');
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
CREATE PROCEDURE CSupplier (IN pSupplierName VARCHAR(20), OUT result VARCHAR(200))
BEGIN
	IF (pSupplierName IS NOT NULL) THEN
		BEGIN
			IF ((SELECT COUNT(idSupplier) FROM Supplier WHERE supplierName = pSupplierName) = 0) THEN
				BEGIN
					INSERT INTO Supplier (supplierName, isActive) VALUES (pSupplierName, 1);
                    SET result = "The Supplier has been added";
                END;
			ELSE
				SET result = "There is already a Supplier with that name";
			END IF;
		END;
	ELSE
		SET result = "The name of the Supplier can't be NULL";
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE RSupplier (IN pIdSupplier INT, IN pSupplierName varchar(200), IN pIsActive BIT)
BEGIN
	SELECT idSupplier AS 'Supplier ID', supplierName AS 'Supplier Name', isActive AS 'Active'
    FROM Supplier WHERE idSupplier = IFNULL(pIdSupplier, idSupplier) AND supplierName = IFNULL(pSupplierName, SupplierName)
    AND isActive = IFNULL(pIsActive, isActive);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE USupplier (IN pIdSupplier INT, IN pSupplierName varchar(200), IN pIsActive BIT, OUT result VARCHAR(200))
BEGIN
	SET result = "";
	IF (pIdSupplier IS NOT NULL AND (SELECT COUNT(idSupplier) FROM Supplier WHERE idSupplier = pIdSupplier) > 0) THEN
		BEGIN
			IF (pSupplierName IS NOT NULL) THEN
				BEGIN
					IF ((SELECT COUNT(idSupplier) FROM Supplier WHERE supplierName = pSupplierName) = 0) THEN
						UPDATE Supplier SET supplierName = pSupplierName WHERE idSupplier = pIdSupplier;
                        SET result = CONCAT(result, 'The name has been modified\n');
					ELSE
						SET result = CONCAT(result, 'The name hasn´t been modified because it already exists\n');
					END IF;
                END;
			END IF;
            IF (pIsActive IS NOT NULL AND pIsActive = 1) THEN
				BEGIN
					UPDATE Supplier SET isActive = pIsActive WHERE idSupplier = pIdSupplier;
                    SET result = CONCAT(result, 'The Supplier is now active\n');
                END;
			END IF;
		END;
	ELSE
		SET result = "The Supplier ID can't be NULL or the ID specified doesn´t exists";
	END IF;
END //
DELIMITER 

DELIMITER //
CREATE PROCEDURE DSupplier (IN pIdSupplier INT, OUT result VARCHAR(200))
BEGIN
	IF ((SELECT COUNT(idSupplier) FROM Supplier WHERE idSupplier = pIdSupplier) > 0) THEN
		BEGIN
			UPDATE Supplier SET isActive = 0 WHERE idSupplier = pIdSupplier;
            SET result = "The Supplier is now inactive";
            #cascade here
        END;
	ELSE
		SET result = "The ID specified doesn´t exists";
	END IF;
END //
DELIMITER ;

#################################################
CALL CSupplier('Jackass', @result);
SELECT @result;
CALL RSupplier(NULL, NULL, NULL);
CALL USupplier(1, 'DonOmar', 1, @result);
SELECT @result;
CALL DSupplier(1,@result);
SELECT @result;
SELECT * FROM Supplier;
#################################################













DELIMITER //
CREATE PROCEDURE C (, OUT result VARCHAR(200))
BEGIN
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE R (, OUT result VARCHAR(200))
BEGIN
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE U (, OUT result VARCHAR(200))
BEGIN
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE D (, OUT result VARCHAR(200))
BEGIN
END //
DELIMITER ;

#################################################
CALL C(, @result);
SELECT @result;
CALL R();
CALL U(, @result);
SELECT @result;
CALL D(,@result);
SELECT @result;
SELECT * FROM Supplier;
#################################################