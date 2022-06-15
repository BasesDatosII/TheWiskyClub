##################################################################################################
# CRUD ProductType
##################################################################################################
DELIMITER //
CREATE PROCEDURE CProductType (IN pTypeName varchar(20), OUT result VARCHAR(16383))
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
CREATE PROCEDURE RProductType (IN pIdProductType INT, IN pTypeName varchar(16383), IN pIsActive BIT) 
BEGIN
	SELECT idProductType AS 'Product Type ID', typeName AS 'Product Type Name', isActive AS 'Active'
    FROM ProductType WHERE idProductType = IFNULL(pIdProductType, idProductType) AND typeName = IFNULL(pTypeName, typeName)
    AND isActive = IFNULL(pIsActive, isActive);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UProductType (IN pIdProductType INT, IN pTypeName varchar(20), IN pIsActive BIT, OUT result VARCHAR(16383))
BEGIN
	SET result = "";
	IF (pIdProductType IS NOT NULL AND (SELECT COUNT(idProductType) FROM ProductType WHERE idProductType = pIdProductType) > 0) THEN
		BEGIN
			IF (pTypeName IS NOT NULL) THEN
				BEGIN
					IF ((SELECT COUNT(idProductType) FROM ProductType WHERE typeName = pTypeName) = 0 AND pTypeName != "") THEN
						BEGIN
							UPDATE ProductType SET typeName = pTypeName WHERE idProductType = pIdProductType;
							SET result = CONCAT(result, 'The name has been modified\n');
						END;
					ELSE
						SET result = CONCAT(result, 'The name hasn´t been modified because it already exists or is empty\n');
					END IF;
                END;
			END IF;
            IF (pIsActive IS NOT NULL AND pIsActive = 1) THEN
				BEGIN
					UPDATE ProductType SET isActive = pIsActive WHERE idProductType = pIdProductType;
                    SET result = CONCAT(result, 'The Product Type is now active\n');
                END;
			END IF;
            SET result = CONCAT(result, 'Changes made successfully \n');
		END;
	ELSE
		SET result = "The Product Type ID can't be NULL or the ID specified doesn´t exists";
	END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DProductType (IN pIdProductType INT, OUT result VARCHAR(16383))
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

##################################################################################################
# CRUD Supplier
##################################################################################################
DELIMITER //
CREATE PROCEDURE CSupplier (IN pSupplierName VARCHAR(20), OUT result VARCHAR(16383))
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
CREATE PROCEDURE RSupplier (IN pIdSupplier INT, IN pSupplierName varchar(20), IN pIsActive BIT)
BEGIN
	SELECT idSupplier AS 'Supplier ID', supplierName AS 'Supplier Name', isActive AS 'Active'
    FROM Supplier WHERE idSupplier = IFNULL(pIdSupplier, idSupplier) AND supplierName = IFNULL(pSupplierName, SupplierName)
    AND isActive = IFNULL(pIsActive, isActive);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE USupplier (IN pIdSupplier INT, IN pSupplierName varchar(20), IN pIsActive BIT, OUT result VARCHAR(16383))
BEGIN
	SET result = "";
	IF (pIdSupplier IS NOT NULL AND (SELECT COUNT(idSupplier) FROM Supplier WHERE idSupplier = pIdSupplier) > 0) THEN
		BEGIN
			IF (pSupplierName IS NOT NULL) THEN
				BEGIN
					IF ((SELECT COUNT(idSupplier) FROM Supplier WHERE supplierName = pSupplierName) = 0 AND pSupplierName != "") THEN
						BEGIN
							UPDATE Supplier SET supplierName = pSupplierName WHERE idSupplier = pIdSupplier;
							SET result = CONCAT(result, 'The name has been modified\n');
						END;
					ELSE
						SET result = CONCAT(result, 'The name hasn´t been modified because it already exists or is empty\n');
					END IF;
                END;
			END IF;
            IF (pIsActive IS NOT NULL AND pIsActive = 1) THEN
				BEGIN
					UPDATE Supplier SET isActive = pIsActive WHERE idSupplier = pIdSupplier;
                    SET result = CONCAT(result, 'The Supplier is now active\n');
                END;
			END IF;
            SET result = CONCAT(result, 'Changes made successfully \n');
		END;
	ELSE
		SET result = "The Supplier ID can't be NULL or the ID specified doesn´t exists";
	END IF;
END //
DELIMITER 

DELIMITER //
CREATE PROCEDURE DSupplier (IN pIdSupplier INT, OUT result VARCHAR(16383))
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

##################################################################################################
# CRUD Presentation
##################################################################################################
DELIMITER //
CREATE PROCEDURE CPresentation (IN pAmountBottles INT, IN pSizeBottle INT, OUT result VARCHAR(16383))
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
CREATE PROCEDURE UPresentation (IN pIdPresentation INT, IN pAmountBottles INT, IN pSizeBottle INT, OUT result VARCHAR(16383))
BEGIN
	SET result = "";
	IF (pIdPresentation IS NOT NULL AND (SELECT COUNT(IdPresentation) FROM Presentation WHERE idPresentation = pIdPresentation) > 0) THEN
		BEGIN
			IF (pAmountBottles IS NOT NULL) THEN
				BEGIN
					IF (pAmountBottles > 0) THEN
						BEGIN
							UPDATE Presentation SET amountBottles = pAmountBottles WHERE idPresentation = pIdPresentation;
							SET result = CONCAT(result, 'The Amount of Bottles has been updated\n');
						END;
					ELSE
						SET result = CONCAT(result, 'The Amount of Bottles needs to be greater than 0\n');
					END IF;
				END;
			END IF;
            IF (pSizeBottle IS NOT NULL) THEN
				BEGIN
					IF (pSizeBottle > 0) THEN
						BEGIN
							UPDATE Presentation SET sizeBottle = pSizeBottle WHERE idPresentation = pIdPresentation;
							SET result = CONCAT(result, 'The Size of the Bottles has been updated\n');
						END;
					ELSE
						SET result = CONCAT(result, 'The Size of Bottles needs to be greater than 0\n');
					END IF;
                END;
			END IF;
            SET result = CONCAT(result, 'Changes made successfully \n');
		END;
	ELSE
		SET result = "The Presentation ID can't be NULL or the ID specified doesn´t exists";
	END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DPresentation (IN pIdPresentation INT, OUT result VARCHAR(16383))
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

# CRUD Cash

DELIMITER //
CREATE PROCEDURE CCash (IN pCashType VARCHAR(20), OUT result VARCHAR(16383))
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
CREATE PROCEDURE UCash (IN pIdCash INT, IN pCashType VARCHAR(20), OUT result VARCHAR(16383))
BEGIN
	SET result = "";
	IF (pIdCash IS NOT NULL AND (SELECT COUNT(idCash) FROM Cash WHERE idCash = pIdCash) > 0) THEN
		BEGIN
			IF (pCashType IS NOT NULL) THEN
				BEGIN
					IF ((SELECT COUNT(idCash) FROM Cash WHERE cashType = pCashType) = 0 AND pCashType != "") THEN
						BEGIN
							UPDATE Cash SET cashType = pCashType WHERE idCash = pIdCash;
							SET result = CONCAT(result, 'The name has been modified\n');
						END;
					ELSE
						SET result = CONCAT(result, 'The name hasn´t been modified because it already exists or is empty\n');
					END IF;
                END;
			END IF;
            SET result = CONCAT(result, 'Changes made successfully \n');
		END;
	ELSE
		SET result = "The Cash ID can't be NULL or the ID specified doesn´t exists";
	END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DCash (IN pIdCash INT, OUT result VARCHAR(16383))
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

##################################################################################################
# CRUD Product
##################################################################################################
DELIMITER //
CREATE PROCEDURE CProduct (IN pProductName VARCHAR(20), IN pCost DECIMAL(15,2), IN pIdProductType INT, IN pImage BLOB,
					IN pIdSupplier INT, IN pIdPresentation INT, IN pIdCash INT, IN pTier INT, OUT result VARCHAR(16383))
BEGIN
	IF (pProductName IS NOT NULL AND pCost IS NOT NULL AND pIdProductType IS NOT NULL AND pIdSupplier IS NOT NULL
		 AND pIdPresentation IS NOT NULL AND pIdCash IS NOT NULL AND pTier IS NOT NULL) THEN
		BEGIN
			IF (pCost > 0 AND pTier BETWEEN 1 AND 3) THEN
				BEGIN
					IF ((SELECT COUNT(idProduct) FROM Product WHERE productName = pProductName) = 0) THEN
						BEGIN
							IF ((SELECT COUNT(idProductType) FROM ProductType WHERE idProductType = pIdProductType) > 0) THEN
								BEGIN
									IF ((SELECT COUNT(idSupplier) FROM Supplier WHERE idSupplier = pIdSupplier) > 0) THEN
										BEGIN
											IF ((SELECT COUNT(idPresentation) FROM Presentation WHERE idPresentation = pIdPresentation) > 0) THEN
												BEGIN
													IF ((SELECT COUNT(idCash) FROM Cash WHERE idCash = pIdCash) > 0) THEN
														BEGIN
															INSERT INTO Product (productName, cost, idProductType, image, idSupplier, idPresentation, idCash, isActive, entryDate, tier)
                                                            VALUES (pProductName, pCost, pIdProductType, pImage, pIdSupplier, pIdPresentation, pIdCash, 1, current_date(), pTier);
															SET result = "The Presentation has been added";
                                                        END;
													ELSE
														SET result = "The Cash ID specified doesn´t exists";
                                                    END IF;
												END;
											ELSE
												SET result = "The Presentation ID specified doesn´t exists";
                                            END IF;
										END;
									ELSE
										SET result = "The Supplier ID specified doesn´t exists";
									END IF;
								END;
							ELSE
								SET result = "The Product Type ID specified doesn´t exists";
							END IF;
						END;
					ELSE
						SET result = "There is already a Product with that name";
					END IF;
                END;
			ELSE
				SET result = "The Cost needs to be greater than 0 or the Tier needs to be between 1 and 3";
			END IF;
		END;
	ELSE
		SET result = "Any of the parameters can't be NULL";
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE RProduct (IN pIdProduct INT, IN pProductName VARCHAR(20), IN pCost DECIMAL(15,2), IN pIdProductType INT,
							IN pIdSupplier INT, IN pIdPresentation INT, IN pIdCash INT, IN pIsActive BIT, IN pEntryDate DATE,IN pTier INT)
BEGIN
	SELECT idProduct AS 'Product ID', productName AS 'Product Name', cost AS 'Product Cost', idProductType AS 'Product Type ID', image AS 'Image',
		idSupplier AS 'Supplier ID',idPresentation AS 'Presentation ID', idCash AS 'Cash ID', isActive AS 'Active', entryDate AS 'Entry Date', tier AS 'Tier'
    FROM Product WHERE idProduct = IFNULL(pIdProduct, idProduct) AND productName = IFNULL(pProductName, productName) AND cost = IFNULL(pCost, cost)
		AND idProductType = IFNULL(pIdProductType, idProductType) AND idSupplier = IFNULL(pIdSupplier, idSupplier) AND idPresentation = IFNULL(pIdPresentation, idPresentation)
		AND idCash = IFNULL(pIdCash, idCash) AND isActive = IFNULL(pIsActive, isActive) AND entryDate = IFNULL(pEntryDate, entryDate)
		AND tier = IFNULL(pTier, tier);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UProduct (IN pIdProduct INT, IN pProductName VARCHAR(20), IN pCost DECIMAL(15,2), IN pIdProductType INT, IN pImage BLOB, IN pIdSupplier INT, 
							IN pIdPresentation INT, IN pIdCash INT, IN pIsActive BIT, IN pEntryDate DATE,IN pTier INT, OUT result VARCHAR(16383))
BEGIN
	SET result = "";
	IF (pIdProduct IS NOT NULL AND (SELECT COUNT(idProduct) FROM Product WHERE idProduct = pIdProduct) > 0) THEN
		BEGIN
			#UPDATING PRODUCT NAME
			IF (pProductName IS NOT NULL) THEN
				BEGIN
					IF ((SELECT COUNT(idProduct) FROM Product WHERE productName = pProductName) = 0 AND pProductName != "") THEN
						BEGIN
							UPDATE Product SET productName = pProductName WHERE idProduct = pIdProduct;
							SET result = CONCAT(result, 'The name has been modified\n');
						END;
					ELSE
						SET result = CONCAT(result, 'The name hasn´t been modified because it already exists or the name can´t be empty\n');
					END IF;
                END;
			END IF;
            #UPDATING PRODUCT COST
            IF (pCost IS NOT NULL) THEN
				BEGIN
					IF (pCost > 0) THEN
						BEGIN
							UPDATE Product SET cost = pCost WHERE idProduct = pIdProduct;
							SET result = CONCAT(result, 'The cost has been modified\n');
						END;
					ELSE
						SET result = CONCAT(result, 'The cost needs to be greater than 0\n');
					END IF;
                END;
			END IF;
            #UPDATING PRODUCT TYPE
			IF (pIdProductType IS NOT NULL) THEN
				BEGIN
					IF ((SELECT COUNT(idProductType) FROM ProductType WHERE idProductType = pIdProductType) > 0) THEN
						BEGIN
							UPDATE Product SET idProductType = pIdProductType WHERE idProduct = pIdProduct;
							SET result = CONCAT(result, 'The Product Type ID has been modified\n');
						END;
					ELSE
						SET result = CONCAT(result, 'The Product Type ID specified doesn´t exists\n');
					END IF;
                END;
			END IF;
            #UPDATING IMAGE
            IF (pImage IS NOT NULL) THEN
				BEGIN
					UPDATE Product SET image = pImage WHERE idProduct = pIdProduct;
					SET result = CONCAT(result, 'The image has been modified\n');
                END;
			END IF;
            #UPDATING SUPPLIER
			IF (pIdSupplier IS NOT NULL) THEN
				BEGIN
					IF ((SELECT COUNT(idSupplier) FROM Supplier WHERE idSupplier = pIdSupplier) > 0) THEN
						BEGIN
							UPDATE Product SET idSupplier = pIdSupplier WHERE idProduct = pIdProduct;
							SET result = CONCAT(result, 'The Supplier ID has been modified\n');
						END;
					ELSE
						SET result = CONCAT(result, 'The Supplier ID specified doesn´t exists\n');
					END IF;
                END;
			END IF;
            #UPDATING PRESENTATION
			IF (pIdPresentation IS NOT NULL) THEN
				BEGIN
					IF ((SELECT COUNT(idPresentation) FROM Presentation WHERE idPresentation = pIdPresentation) > 0) THEN
						BEGIN
							UPDATE Product SET idPresentation = pIdPresentation WHERE idProduct = pIdProduct;
							SET result = CONCAT(result, 'The Presentation ID has been modified\n');
						END;
					ELSE
						SET result = CONCAT(result, 'The Presentation ID specified doesn´t exists\n');
					END IF;
                END;
			END IF;
            #UPDATING CASH
			IF (pIdCash IS NOT NULL) THEN
				BEGIN
					IF ((SELECT COUNT(idCash) FROM Cash WHERE idCash = pIdCash) > 0) THEN
						BEGIN
							UPDATE Product SET idCash = pIdCash WHERE idProduct = pIdProduct;
							SET result = CONCAT(result, 'The Cash ID has been modified\n');
						END;
					ELSE
						SET result = CONCAT(result, 'The Cash ID specified doesn´t exists\n');
					END IF;
                END;
			END IF;
            #UPDATING ISACTIVE
            IF (pIsActive IS NOT NULL AND pIsActive = 1) THEN
				BEGIN
					UPDATE Product SET isActive = pIsActive WHERE idProduct = pIdProduct;
                    SET result = CONCAT(result, 'The Product is now active\n');
                END;
			END IF;
            #UPDATING ENTRYDATE
            IF (pEntryDate IS NOT NULL) THEN
				BEGIN
					UPDATE Product SET entryDate = pEntryDate WHERE idProduct = pIdProduct;
                    SET result = CONCAT(result, 'The Entry Date has been modified\n');
                END;
			END IF;
            #UPDATING TIER
            IF (pTier IS NOT NULL) THEN
				BEGIN
					IF (pTier BETWEEN 1 AND 3) THEN
						BEGIN
							UPDATE Product SET entryDate = pEntryDate WHERE idProduct = pIdProduct;
							SET result = CONCAT(result, 'The Tier has been modified\n');
						END;
					ELSE
						SET result = CONCAT(result, 'The Tier is not between 1 and 3\n');
					END IF;
                END;
			END IF;
            SET result = CONCAT(result, 'Changes made successfully \n');
		END;
	ELSE
		SET result = "The Product ID can't be NULL or the ID specified doesn´t exists";
	END IF;
    
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DProduct (IN pIdProduct INT, OUT result VARCHAR(16383))
BEGIN
	IF ((SELECT COUNT(idProduct) FROM Product WHERE idProduct = pIdProduct) > 0) THEN
		BEGIN
			UPDATE Product SET isActive = 0 WHERE idProduct = pIdProduct;
            SET result = "The Product is now inactive";
            #cascade here
        END;
	ELSE
		SET result = "The ID specified doesn´t exists";
	END IF;
END //
DELIMITER ;

##################################################################################################
# CRUD Location
##################################################################################################
DELIMITER //
CREATE PROCEDURE CLocation (IN pLocation GEOMETRY, IN pTypeLocation BIT, OUT result VARCHAR(16383))
BEGIN
	IF (pLocation IS NOT NULL AND pTypeLocation IS NOT NULL) THEN
	BEGIN
			IF ((SELECT COUNT(idLocation) FROM Location WHERE location = pLocation) = 0) THEN
				BEGIN
					INSERT INTO Location (location, typeLocation, isActive) VALUES (pLocation, pTypeLocation, 1);
                    SET result = "The Location has been added";
                END;
			ELSE
				SET result = "There is already an exact same Location";
			END IF;
		END;
	ELSE
		SET result = "The Location and TypeLocation can't be NULL";
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE RLocation (IN pIdLocation INT, IN pTypeLocation BIT, IN pIsActive BIT)
BEGIN
	SELECT idLocation AS 'Location ID', location AS 'Location', typeLocation AS 'Location Type'
    FROM Location WHERE idLocation = IFNULL(pIdLocation, idLocation) AND typeLocation = IFNULL(pTypeLocation, typeLocation)
    AND isActive = IFNULL(pIsActive, isActive);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE ULocation (IN pIdLocation INT, IN pLocation GEOMETRY, IN pTypeLocation BIT, IN pIsActive BIT, OUT result VARCHAR(16383))
BEGIN
	SET result = "";
	IF (pIdLocation IS NOT NULL AND (SELECT COUNT(idLocation) FROM Location WHERE idLocation = pIdLocation) > 0) THEN
		BEGIN
			IF (pLocation IS NOT NULL) THEN
				BEGIN
					UPDATE Location SET location = pLocation WHERE idLocation = pIdLocation;
					SET result = CONCAT(result, 'The Location has been modified\n');
				END;
			END IF;
            IF (pTypeLocation IS NOT NULL) THEN
				BEGIN
					UPDATE Location SET typeLocation = pTypeLocation WHERE idLocation = pIdLocation;
					SET result = CONCAT(result, 'The Location Type has been modified\n');
				END;
			END IF;
            IF (pIsActive IS NOT NULL AND pIsActive = 1) THEN
				BEGIN
					UPDATE Location SET isActive = pIsActive WHERE idLocation = pIdLocation;
                    SET result = CONCAT(result, 'The Location is now active\n');
                END;
			END IF;
            SET result = CONCAT(result, 'Changes made successfully \n');
		END;
	ELSE
		SET result = "The Location ID can't be NULL or the ID specified doesn´t exists";
	END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DLocation (IN pIdLocation INT, OUT result VARCHAR(16383))
BEGIN
	IF ((SELECT COUNT(idLocation) FROM Location WHERE idLocation = pIdLocation) > 0) THEN
		BEGIN
			UPDATE Location SET isActive = 0 WHERE idLocation = pIdLocation;
            SET result = "The Product Type is now inactive";
            #cascade here
        END;
	ELSE
		SET result = "The ID specified doesn´t exists";
	END IF;
END //
DELIMITER ;

##################################################################################################
# CRUD Club
##################################################################################################
DELIMITER //
CREATE PROCEDURE CClub (IN pClubName VARCHAR(20), IN pIdLocation INT, IN pDeliveryCostProp FLOAT, IN pIdCash INT, OUT result VARCHAR(16383))
BEGIN
	IF (pClubName IS NOT NULL AND pIdLocation IS NOT NULL AND pDeliveryCostProp IS NOT NULL AND pIdCash IS NOT NULL) THEN
	BEGIN
			IF ((SELECT COUNT(idClub) FROM Club WHERE clubName = pClubName) = 0) THEN
				BEGIN
					IF ((SELECT COUNT(idLocation) FROM Location WHERE idLocation = pIdLocation) > 0) THEN
						BEGIN
							IF (pDeliveryCostProp > 0) THEN
								BEGIN
									IF ((SELECT COUNT(idCash) FROM Cash WHERE idCash = pIdCash) > 0) THEN
										BEGIN
											INSERT INTO Club (clubName, idLocation, deliveryCostProp, idCash, isActive)
                                            VALUES (pClubName, pIdLocation, pDeliveryCostProp, pIdCash, 1);
											SET result = "The Club has been added";
										END;
									ELSE
										SET result = "The Cash ID specified doesn´t exists";
									END IF;
								END;
							ELSE
								SET result = "The Delivery Cost Proportion needs to be greater than 0";
							END IF;
						END;
					ELSE
						SET result = "The Location ID specified doesn´t exists";
					END IF;
				END;
			ELSE
				SET result = "There is already a Club with that name";
			END IF;
		END;
	ELSE
		SET result = "Any of the parameters can't be NULL";
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE RClub (IN pIdClub INT, IN pClubName VARCHAR(20), IN pIdLocation INT, IN pDeliveryCostProp FLOAT, IN pIdCash INT, IN pIsActive BIT)
BEGIN
	SELECT idClub AS 'Club ID', clubName AS 'Club Name', idLocation AS 'Location ID',
		deliveryCostProp AS 'Delivery Cost Proportion', idCash AS 'Cash ID', isActive AS 'Active'
    FROM Club WHERE idClub = IFNULL(pIdClub, idClub) AND clubName = IFNULL(pClubName, clubName)
    AND idLocation = IFNULL(pIdLocation, idLocation) AND deliveryCostProp = IFNULL(pDeliveryCostProp, deliveryCostProp)
    AND idCash = IFNULL(pIdCash, idCash);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UClub (IN pIdClub INT, IN pClubName VARCHAR(20), IN pIdLocation INT, IN pDeliveryCostProp FLOAT, IN pIdCash INT, IN pIsActive BIT, OUT result VARCHAR(16383))
BEGIN
	SET result = "";
	IF (pIdClub IS NOT NULL AND (SELECT COUNT(idClub) FROM Club WHERE idClub = pIdClub) > 0) THEN
		BEGIN
			IF (pClubName IS NOT NULL) THEN
				BEGIN
					IF ((SELECT COUNT(idClub) FROM Club WHERE clubName = pClubName) = 0 AND pClubName != "") THEN
						BEGIN
							UPDATE Club SET clubName = pClubName WHERE idClub = pIdClub;
							SET result = CONCAT(result, 'The club name has been modified\n');
						END;
					ELSE
						SET result = CONCAT(result, 'The club name hasn´t been modified because it already exists or the name can´t be empty\n');
					END IF;
                END;
			END IF;
            IF (pIdLocation IS NOT NULL) THEN
				BEGIN
					IF ((SELECT COUNT(idLocation) FROM Location WHERE idLocation = pIdLocation) > 0) THEN
						BEGIN
							UPDATE Club SET idLocation = pIdLocation WHERE idClub = pIdClub;
							SET result = CONCAT(result, 'The Location ID has been modified\n');
						END;
					ELSE
						SET result = CONCAT(result, 'The Location ID specified doesn´t exists\n');
					END IF;
                END;
			END IF;
            IF (pDeliveryCostProp IS NOT NULL) THEN
				BEGIN
					IF (pDeliveryCostProp > 0) THEN
						BEGIN
							UPDATE Club SET deliveryCostProp = pDeliveryCostProp WHERE idClub = pIdClub;
							SET result = CONCAT(result, 'The Delivery Cost Proportion has been modified\n');
						END;
					ELSE
						SET result = "The Delivery Cost Proportion needs to be greater than 0";
					END IF;
                END;
			END IF;
            IF (pIdCash IS NOT NULL) THEN
				BEGIN
					IF ((SELECT COUNT(idCash) FROM Cash WHERE idCash = pIdCash) > 0) THEN
						BEGIN
							UPDATE Club SET idCash = pIdCash WHERE idClub = pIdClub;
							SET result = CONCAT(result, 'The Cash ID has been modified\n');
						END;
					ELSE
						SET result = CONCAT(result, 'The Cash ID specified doesn´t exists\n');
					END IF;
                END;
			END IF;
            IF (pIsActive IS NOT NULL AND pIsActive = 1) THEN
				BEGIN
					UPDATE Club SET isActive = pIsActive WHERE idClub = pIdClub;
                    SET result = CONCAT(result, 'The Club is now active\n');
                END;
			END IF;
            SET result = CONCAT(result, 'Changes made successfully \n');
		END;
	ELSE
		SET result = "The Club ID can't be NULL or the ID specified doesn´t exists";
	END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DClub (IN pIdClub INT, OUT result VARCHAR(16383))
BEGIN
	IF ((SELECT COUNT(idClub) FROM Club WHERE idClub = pIdClub) > 0) THEN
		BEGIN
			UPDATE Club SET isActive = 0 WHERE idClub = pIdClub;
            SET result = "The Club is now inactive";
            #cascade here
        END;
	ELSE
		SET result = "The ID specified doesn´t exists";
	END IF;
END //
DELIMITER ;

# CRUD Inventory

DELIMITER //
CREATE PROCEDURE CInventory (IN pIdClub INT, IN pIdProduct INT, IN pStock INT, OUT result VARCHAR(16383))
BEGIN
	IF (pIdClub IS NOT NULL AND pIdProduct IS NOT NULL AND pStock IS NOT NULL) THEN
	BEGIN
			IF ((SELECT COUNT(idClub) FROM Club WHERE idClub = pIdClub) > 0) THEN
				BEGIN
					IF ((SELECT COUNT(idProduct) FROM Product WHERE idProduct = pIdProduct) > 0) THEN
						BEGIN
							IF (pStock > 0) THEN
								BEGIN
									INSERT INTO Inventory (idClub, idProduct, stock, isActive) VALUES (pIdClub, pIdProduct, pStock, 1);
									SET result = "The Inventory has been added";
								END;
							ELSE
								SET result = "The Stock needs to be greater than 0";
                            END IF;
						END;
					ELSE
						SET result = "The Product ID specified doesn´t exists";
					END IF;
				END;               
			ELSE
				SET result = "The Club ID specified doesn´t exists";
			END IF;
		END;
	ELSE
		SET result = "Any of the parameters can't be NULL";
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE RInventory (IN pIdInventory INT, IN pIdClub INT, IN pIdProduct INT, IN pStock INT, IN pIsActive BIT)
BEGIN
	SELECT idInventory AS 'Inventory ID', idClub AS 'Club ID', idProduct AS 'Product ID',
		stock AS 'Stock', isActive AS 'Active'
    FROM Inventory WHERE idInventory = IFNULL(pIdInventory, idInventory) AND idClub = IFNULL(pIdClub, idClub)
    AND idProduct = IFNULL(pIdProduct, idProduct) AND stock = IFNULL(pStock, stock)
    AND isActive = IFNULL(pIsActive, isActive);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UInventory (IN pIdInventory INT, IN pIdClub INT, IN pIdProduct INT, IN pStock INT, IN pIsActive BIT, OUT result VARCHAR(16383))
BEGIN
	SET result = "";
	IF (pIdInventory IS NOT NULL AND (SELECT COUNT(idInventory) FROM Inventory WHERE idInventory = pIdInventory) > 0) THEN
		BEGIN
			IF (pIdClub IS NOT NULL) THEN
				BEGIN
					IF ((SELECT COUNT(idClub) FROM Club WHERE idClub = pIdClub) > 0) THEN
						BEGIN
							UPDATE Inventory SET idClub = pIdClub WHERE idInventory = pIdInventory;
							SET result = CONCAT(result, 'The Club ID has been modified\n');
						END;
					END IF;
                END;
			END IF;
            IF (pIdProduct IS NOT NULL) THEN
				BEGIN
					IF ((SELECT COUNT(idProduct) FROM Product WHERE idProduct = pIdProduct) > 0) THEN
						BEGIN
							UPDATE Inventory SET idProduct = pIdProduct WHERE idInventory = pIdInventory;
							SET result = CONCAT(result, 'The Product ID has been modified\n');
						END;
					END IF;
                END;
			END IF;
            IF (pStock IS NOT NULL) THEN
				BEGIN
					IF (pStock > 0) THEN
						BEGIN
							UPDATE Inventory SET stock = pStock WHERE idInventory = pIdInventory;
							SET result = CONCAT(result, 'The Stock has been modified\n');
						END;
					ELSE
						SET result = "The Stock needs to be greater than 0";
					END IF;
                END;
			END IF;
            IF (pIsActive IS NOT NULL AND pIsActive = 1) THEN
				BEGIN
					UPDATE Inventory SET isActive = pIsActive WHERE idInventory = pIdInventory;
                    SET result = CONCAT(result, 'The Inventory is now active\n');
                END;
			END IF;
            SET result = CONCAT(result, 'Changes made successfully \n');
		END;
	ELSE
		SET result = "The Inventory ID can't be NULL or the ID specified doesn´t exists";
	END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DInventory (IN pIdInventory INT, OUT result VARCHAR(16383))
BEGIN
	IF ((SELECT COUNT(idInventory) FROM Inventory WHERE idInventory = pIdInventory) > 0) THEN
		BEGIN
			UPDATE Inventory SET isActive = 0 WHERE idInventory = pIdInventory;
            SET result = "The Inventory is now inactive";
            #cascade here
        END;
	ELSE
		SET result = "The ID specified doesn´t exists";
	END IF;
END //
DELIMITER ;

##################################################################################################
# CRUD ClientUser
##################################################################################################

DELIMITER //
CREATE PROCEDURE CClientUser (IN pUserPassword VARCHAR(30), OUT result VARCHAR(16383))
BEGIN
	IF (pUserPassword IS NOT NULL) THEN
	BEGIN
			##IF () THEN HERE GOES THE VALIDATION OF THE FORMAT
				BEGIN
					INSERT INTO ClientUser (userPassword, isActive) VALUES (pUserPassword, 1);
                    SET result = "The User has been added";
                END;
			#ELSE
			#	SET result = "The User Password format is incorrect";
			#END IF;
		END;
	ELSE
		SET result = "The User Password can't be NULL";
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE RClientUser (IN pIdClientUser INT, IN pUserPassword VARCHAR(30), IN pIsActive BIT)
BEGIN
	SELECT idClientUser AS 'Client User ID', userPassword AS 'User Password', isActive AS 'Active'
    FROM ClientUser WHERE idClientUser = IFNULL(pIdClientUser, idClientUser) AND userPassword = IFNULL(pUserPassword, userPassword)
    AND isActive = IFNULL(pIsActive, isActive);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UClientUser (IN pIdClientUser INT, IN pUserPassword VARCHAR(30), IN pIsActive BIT, OUT result VARCHAR(16383))
BEGIN
	SET result = "";
	IF (pIdClientUser IS NOT NULL AND (SELECT COUNT(idClientUser) FROM ClientUser WHERE idClientUser = pIdClientUser) > 0) THEN
		BEGIN
			IF (pUserPassword IS NOT NULL) THEN
				##IF () THEN HERE GOES THE VALIDATION OF THE FORMAT
					BEGIN
						UPDATE ClientUser SET userPassword = pUserPassword WHERE idClientUser = pIdClientUser;
						SET result = "The User has been added";
					END;
				#ELSE
					#SET result = "The User Password format is incorrect";
				#END IF;
			END IF;
            IF (pIsActive IS NOT NULL AND pIsActive = 1) THEN
				BEGIN
					UPDATE ClientUser SET isActive = pIsActive WHERE idClientUser = pIdClientUser;
                    SET result = CONCAT(result, 'The Client User is now active\n');
                END;
			END IF;
            SET result = CONCAT(result, 'Changes made successfully \n');
		END;
	ELSE
		SET result = "The Client User ID can't be NULL or the ID specified doesn´t exists";
	END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DClientUser (IN pIdClientUser INT, OUT result VARCHAR(16383))
BEGIN
	IF ((SELECT COUNT(idClientUser) FROM ClientUser WHERE idClientUser = pIdClientUser) > 0) THEN
		BEGIN
			UPDATE ClientUser SET isActive = 0 WHERE idClientUser = pIdClientUser;
            SET result = "The Client User is now inactive";
            #cascade here
        END;
	ELSE
		SET result = "The ID specified doesn´t exists";
	END IF;
END //
DELIMITER ;

##################################################################################################
# CRUD InfoPeople
##################################################################################################

DELIMITER //
CREATE PROCEDURE CInfoPeople (IN pPeopleName VARCHAR(20), IN pSurname VARCHAR(30), IN pEmail VARCHAR(50), IN pPhoneNumber INT, IN pBirthDate DATE, OUT result VARCHAR(16383))
BEGIN
	IF (pPeopleName IS NOT NULL AND pSurname IS NOT NULL AND pEmail IS NOT NULL AND pPhoneNumber IS NOT NULL AND pBirthDate IS NOT NULL) THEN
	BEGIN
			IF (pPeopleName != "") THEN
				BEGIN
					IF (pSurname != "") THEN
						BEGIN
							IF (pEmail != "") THEN
								BEGIN
									IF (pPhoneNumber BETWEEN 60000000 AND 89999999) THEN
										BEGIN
											IF (pBirthDate < current_date()) THEN
												BEGIN
													INSERT INTO InfoPeople (peopleName, surname, email, phoneNumber, birthDate, isActive)
													VALUES (pPeopleName, pSurname, pEmail, pPhoneNumber, pBirthDate, 1);
                                                    SET result = "The Client Information has been stored";
												END;
											ELSE
												SET result = "The Birth Date can't be greater or equal than the actual Date";
                                            END IF;
										END;
									ELSE
										SET result = "The Phone Number specified needs to be between 60000000 and 89999999";
									END IF;
								END;
							ELSE
								SET result = "The email can't be empty";
							END IF;
						END;
					ELSE
						SET result = "The Surname can't be empty";
					END IF;
				END;
			ELSE
				SET result = "The Name can't be empty";
			END IF;
		END;
	ELSE
		SET result = "Any of the parameters can't be NULL";
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE RInfoPeople (IN pIdInfoPeople INT, IN pPeopleName VARCHAR(20), IN pSurname VARCHAR(30), IN pEmail VARCHAR(50), IN pPhoneNumber INT, IN pBirthDate DATE, IN pIsActive INT)
BEGIN
	SELECT idInfoPeople AS 'Client´s Information ID', peopleName AS 'Name', surname AS 'Surname',
		email AS 'Email', phoneNumber AS 'Phone Number', birthDate AS 'Birth Date', isActive AS 'Active'
    FROM InfoPeople WHERE idInfoPeople = IFNULL(pIdInfoPeople, idInfoPeople) AND peopleName = IFNULL(pPeopleName, peopleName)
    AND surname = IFNULL(pSurname, surname) AND email = IFNULL(pEmail, email) AND phoneNumber = IFNULL(pPhoneNumber, phoneNumber)
	AND birthDate = IFNULL(pBirthDate, birthDate) AND isActive = IFNULL(pIsActive, isActive);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UInfoPeople (IN pIdInfoPeople INT, IN pPeopleName VARCHAR(20), IN pSurname VARCHAR(30), IN pEmail VARCHAR(50), IN pPhoneNumber INT, IN pBirthDate DATE, IN pIsActive BIT, OUT result VARCHAR(16383))
BEGIN
	SET result = "";
	IF (pIdInfoPeople IS NOT NULL AND (SELECT COUNT(idInfoPeople) FROM InfoPeople WHERE idInfoPeople = pIdInfoPeople) > 0) THEN
		BEGIN
			IF (pPeopleName IS NOT NULL) THEN
				BEGIN
					IF (pPeopleName != "") THEN
						BEGIN
							UPDATE InfoPeople SET peopleName = pPeopleName WHERE idInfoPeople = pIdInfoPeople;
							SET result = CONCAT(result, 'The Name has been modified\n');
						END;
					ELSE
						SET result = CONCAT(result, 'The Name can´t be empty\n');
					END IF;
                END;
			END IF;
            IF (pSurname IS NOT NULL) THEN
				BEGIN
					IF (pSurname != "") THEN
						BEGIN
							UPDATE InfoPeople SET surname = pSurname WHERE idInfoPeople = pIdInfoPeople;
							SET result = CONCAT(result, 'The Surname has been modified\n');
						END;
					ELSE
						SET result = CONCAT(result, 'The Surname can´t be empty\n');
					END IF;
                END;
			END IF;
            IF (pEmail IS NOT NULL) THEN
				BEGIN
					IF (pEmail != "") THEN
						BEGIN
							UPDATE InfoPeople SET email = pEmail WHERE idInfoPeople = pIdInfoPeople;
							SET result = CONCAT(result, 'The Email has been modified\n');
						END;
					ELSE
						SET result = CONCAT(result, 'The Email can´t be empty\n');
					END IF;
                END;
			END IF;
            IF (pPhoneNumber IS NOT NULL) THEN
				BEGIN
					IF (pPhoneNumber BETWEEN 60000000 AND 89999999) THEN
						BEGIN
							UPDATE InfoPeople SET phoneNumber = pPhoneNumber WHERE idInfoPeople = pIdInfoPeople;
							SET result = CONCAT(result, 'The Phone Number has been modified\n');
						END;
					ELSE
						SET result = "The Phone Number specified needs to be between 60000000 and 89999999";
					END IF;
                END;
			END IF;
            IF (pBirthDate IS NOT NULL) THEN
				BEGIN
					IF (pBirthDate < current_date()) THEN
						BEGIN
							UPDATE InfoPeople SET birthDate = pBirthDate WHERE idInfoPeople = pIdInfoPeople;
							SET result = CONCAT(result, 'The Birth Date has been modified\n');
						END;
					ELSE
						SET result = "The Birth Date can't be greater or equal than the actual Date";
					END IF;
                END;
			END IF;
            IF (pIsActive IS NOT NULL AND pIsActive = 1) THEN
				BEGIN
					UPDATE InfoPeople SET isActive = pIsActive WHERE idInfoPeople = pIdInfoPeople;
                    SET result = CONCAT(result, 'The Client Information is now active\n');
                END;
			END IF;
            SET result = CONCAT(result, 'Changes made successfully \n');
		END;
	ELSE
		SET result = "The Info People ID can't be NULL or the ID specified doesn´t exists";
	END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DInfoPeople (IN pIdInfoPeople INT, OUT result VARCHAR(16383))
BEGIN
	IF ((SELECT COUNT(idInfoPeople) FROM InfoPeople WHERE idInfoPeople = pIdInfoPeople) > 0) THEN
		BEGIN
			UPDATE InfoPeople SET isActive = 0 WHERE idInfoPeople = pIdInfoPeople;
            SET result = "The Client Information is now inactive";
            #cascade here
        END;
	ELSE
		SET result = "The ID specified doesn´t exists";
	END IF;
END //
DELIMITER ;

#INFOPEOPLE
#################################################
CALL CInfoPeople("Daniel", "Araya Sambucci", "danielarayasambucci@gmail.com", 70145250, "2002-03-10", @result);
SELECT @result;
CALL RInfoPeople(NULL, NULL, NULL, NULL, NULL, NULL, NULL);
CALL UInfoPeople(1, NULL, NULL, NULL, NULL, NULL, 1, @result);
SELECT @result;
CALL DInfoPeople(1,@result);
SELECT @result;
SELECT * FROM InfoPeople;
#################################################

##################################################################################################

#PRODUCT TYPE
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

#SUPPLIER
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

#PRESENTATION
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

#CASH
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

#PRODUCT
#################################################
CALL CProduct("Whiskey", 2.62, 1, NULL,
					1, 1, 1, 1, @result);
SELECT @result;
CALL RProduct(NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
CALL UProduct(1,"Vodka",NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL, @result);
SELECT @result;
CALL DProduct(1,@result);
SELECT @result;
SELECT * FROM Product;
#################################################

#LOCATION
#################################################
CALL CLocation(ST_GeomFromText('POLYGON((0 5, 2 5, 2 7, 0 7, 0 5))'), 1, @result);
SELECT @result;
CALL RLocation(NULL, NULL, NULL);
CALL ULocation(1, NULL, 0, 1, @result);
SELECT @result;
CALL DLocation(1,@result);
SELECT @result;
SELECT * FROM Location;
#################################################

#CLUB
#################################################
CALL CClub("Guardians Club", 1, 2.5, 1, @result);
SELECT @result;
CALL RClub(NULL,NULL,NULL,NULL,NULL, NULL);
CALL UClub(1, "The Guardians Club", NULL, NULL, NULL, 1, @result);
SELECT @result;
CALL DClub(1,@result);
SELECT @result;
SELECT * FROM Club;
#################################################

#INVENTORY
#################################################
CALL CInventory(1,1,20, @result);
SELECT @result;
CALL RInventory(NULL,NULL,NULL,NULL,NULL);
CALL UInventory(1,NULL,NULL,30,1, @result);
SELECT @result;
CALL DInventory(1,@result);
SELECT @result;
SELECT * FROM Inventory;
#################################################

#CLIENT USER
#################################################
CALL CClientUser("Password", @result);
SELECT @result;
CALL RClientUser(NULL,NULL,NULL);
CALL UClientUser(1,NULL,1, @result);
SELECT @result;
CALL DClientUser(1,@result);
SELECT @result;
SELECT * FROM ClientUser;
#################################################

##TEMPLATE

##################################################################################################
# CRUD 
##################################################################################################

DELIMITER //
CREATE PROCEDURE C (, OUT result VARCHAR(16383))
BEGIN
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE R ()
BEGIN
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE U (, OUT result VARCHAR(16383))
BEGIN
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE D (, OUT result VARCHAR(16383))
BEGIN
END //
DELIMITER ;

#
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



#OPEN ORDER
CREATE PROCEDURE OpenOrder(