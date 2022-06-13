# CRUD ProductType

DELIMITER //
CREATE PROCEDURE CProductType (IN pTypeName varchar(20), OUT result VARCHAR(200))
BEGIN
	IF (pTypeName IS NOT NULL AND pTypeName != "") THEN
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
		SET result = "The name of the Product Type can't be NULL or be empty";
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
			IF (pTypeName IS NOT NULL AND pTypeName != "") THEN
				BEGIN
					IF ((SELECT COUNT(idProductType) FROM ProductType WHERE typeName = pTypeName) = 0) THEN
						UPDATE ProductType SET typeName = pTypeName WHERE idProductType = pIdProductType;
                        SET result = CONCAT(result, 'The name has been modified\n');
					ELSE
						SET result = CONCAT(result, 'The name hasn´t been modified because it already exists\n');
					END IF;
                END;
			ELSE
				SET result = CONCAT(result, 'The name can´t be empty\n');
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

# CRUD Supplier

DELIMITER //
CREATE PROCEDURE CSupplier (IN pSupplierName VARCHAR(20), OUT result VARCHAR(200))
BEGIN
	IF (pSupplierName IS NOT NULL AND pSupplierName != "") THEN
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
		SET result = "The name of the Supplier can't be NULL or be empty";
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
			IF (pSupplierName IS NOT NULL AND pSupplierName != "") THEN
				BEGIN
					IF ((SELECT COUNT(idSupplier) FROM Supplier WHERE supplierName = pSupplierName) = 0) THEN
						UPDATE Supplier SET supplierName = pSupplierName WHERE idSupplier = pIdSupplier;
                        SET result = CONCAT(result, 'The name has been modified\n');
					ELSE
						SET result = CONCAT(result, 'The name hasn´t been modified because it already exists\n');
					END IF;
                END;
			ELSE
				SET result = CONCAT(result, 'The name can´t be empty\n');
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

# CRUD Presentation

DELIMITER //
CREATE PROCEDURE CPresentation (IN pAmountBottles INT, IN pSizeBottle INT, OUT result VARCHAR(200))
BEGIN
	IF (pAmountBottles IS NOT NULL AND pSizeBottle IS NOT NULL) THEN
		BEGIN
			IF (pAmountBottles > 0 AND pSizeBottle > 0) THEN
				BEGIN
					IF ((SELECT COUNT(idPresentation) FROM Presentation WHERE amountBottles = pAmountBottles AND sizeBottle = pSizeBottle) = 0) THEN
						BEGIN
							INSERT INTO Presentation (amountBottles, sizeBottle) VALUES (pAmountBottles, pSizeBottle);
							SET result = "The Presentation has been added";
						END;
					ELSE
						SET result = "There is already a Presentation with that parameters";
					END IF;
                END;
			ELSE
				SET result = "The Amount or Size of the Bottles needs to be greater than 0";
			END IF;
		END;
	ELSE
		SET result = "The Amount or Size of the Bottles can't be NULL";
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE RPresentation (IN pIdPresentation INT, IN pAmountBottles INT, IN pSizeBottle INT)
BEGIN
	SELECT idPresentation AS 'Presentation ID', amountBottles AS 'Amount of Bottles', sizeBottle AS 'Size of the Bottles'
    FROM Presentation WHERE idPresentation = IFNULL(pIdPresentation, idPresentation) AND amountBottles = IFNULL(pAmountBottles, amountBottles)
    AND sizeBottle = IFNULL(pSizeBottle, sizeBottle);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UPresentation (IN pIdPresentation INT, IN pAmountBottles INT, IN pSizeBottle INT, OUT result VARCHAR(200))
BEGIN
	SET result = "";
	IF (pIdPresentation IS NOT NULL AND (SELECT COUNT(IdPresentation) FROM Presentation WHERE idPresentation = pIdPresentation) > 0) THEN
		BEGIN
			IF (pAmountBottles IS NOT NULL AND pAmountBottles > 0) THEN
				BEGIN
					UPDATE Presentation SET amountBottles = pAmountBottles WHERE idPresentation = pIdPresentation;
                    SET result = CONCAT(result, 'The Amount of Bottles has been updated\n');
                END;
			ELSE
				SET result = CONCAT(result, 'The Amount of Bottles needs to be greater than 0\n');
			END IF;
            IF (pSizeBottle IS NOT NULL AND pSizeBottle > 0) THEN
				BEGIN
					UPDATE Presentation SET sizeBottle = pSizeBottle WHERE idPresentation = pIdPresentation;
                    SET result = CONCAT(result, 'The Size of the Bottles has been updated\n');
                END;
			ELSE
				SET result = CONCAT(result, 'The Size of the Bottles needs to be greater than 0\n');
			END IF;
		END;
	ELSE
		SET result = "The Presentation ID can't be NULL or the ID specified doesn´t exists";
	END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DPresentation (IN pIdPresentation INT, OUT result VARCHAR(200))
BEGIN
	IF ((SELECT COUNT(idPresentation) FROM Presentation WHERE idPresentation = pIdPresentation) > 0) THEN
		BEGIN
			DELETE FROM Presentation WHERE idPresentation = pIdPresentation;
            SET result = "The Presentation has been removed";
            #cascade here
        END;
	ELSE
		SET result = "The ID specified doesn´t exists";
	END IF;
END //
DELIMITER ;

#################################################
CALL CPresentation(500, 2, @result);
SELECT @result;
CALL CPresentation(1000, 2, @result);
SELECT @result;
CALL RPresentation(NULL, NULL, NULL);
CALL UPresentation(1,1000,1, @result);
SELECT @result;
CALL DPresentation(2,@result);
SELECT @result;
SELECT * FROM Presentation;
#################################################

# CRUD Cash

DELIMITER //
CREATE PROCEDURE CCash (IN pCashType VARCHAR(20), OUT result VARCHAR(200))
BEGIN
	IF (pCashType IS NOT NULL AND pCashType != "") THEN
		BEGIN
			IF ((SELECT COUNT(idCash) FROM Cash WHERE cashType = pCashType) = 0) THEN
				BEGIN
					INSERT INTO Cash (cashType) VALUES (pCashType);
                    SET result = "The Cash has been added";
                END;
			ELSE
				SET result = "There is already a Cash with that name";
			END IF;
		END;
	ELSE
		SET result = "The name of the Cash can't be NULL or be empty";
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE RCash (IN pIdCash INT, IN pCashType VARCHAR(20))
BEGIN
	SELECT idCash AS 'Cash ID', cashType AS 'Cash Type Name'
    FROM Cash WHERE idCash = IFNULL(pIdCash, idCash) AND cashType = IFNULL(pCashType, cashType);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UCash (IN pIdCash INT, IN pCashType VARCHAR(20), OUT result VARCHAR(200))
BEGIN
	SET result = "";
	IF (pIdCash IS NOT NULL AND (SELECT COUNT(idCash) FROM Cash WHERE idCash = pIdCash) > 0) THEN
		BEGIN
			IF (pCashType IS NOT NULL AND pCashType != "") THEN
				BEGIN
					IF ((SELECT COUNT(idCash) FROM Cash WHERE cashType = pCashType) = 0) THEN
						UPDATE Cash SET cashType = pCashType WHERE idCash = pIdCash;
                        SET result = CONCAT(result, 'The name has been modified\n');
					ELSE
						SET result = CONCAT(result, 'The name hasn´t been modified because it already exists\n');
					END IF;
                END;
			ELSE
				SET result = CONCAT(result, 'The name can´t be empty\n');
			END IF;
		END;
	ELSE
		SET result = "The Cash ID can't be NULL or the ID specified doesn´t exists";
	END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DCash (IN pIdCash INT, OUT result VARCHAR(200))
BEGIN
	IF ((SELECT COUNT(idCash) FROM Cash WHERE idCash = pIdCash) > 0) THEN
		BEGIN
			DELETE FROM Cash WHERE idCash = pIdCash;
            SET result = "The Cash has been removed";
            #cascade here
        END;
	ELSE
		SET result = "The ID specified doesn´t exists";
	END IF;
END //
DELIMITER ;

#################################################
CALL CCash("Dolar", @result);
SELECT @result;
CALL CCash("Pound", @result);
SELECT @result;
CALL RCash(NULL, NULL);
CALL UCash(1, "Dollar", @result);
SELECT @result;
CALL DCash(2,@result);
SELECT @result;
SELECT * FROM Cash;
#################################################









# CRUD 

DELIMITER //
CREATE PROCEDURE C (, OUT result VARCHAR(200))
BEGIN
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE R ()
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
SELECT * FROM ;
#################################################