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
                                                            VALUES (pProductName, pCost, pIdProductType, pImage, pIdSupplier, pIdPresentation, pIdCash, 1, CURRENT_DATE(), pTier);
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
						SET result = CONCAT('The Delivery Cost Proportion needs to be greater than 0\n');
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
						SET result = CONCAT('The Stock needs to be greater than 0\n');
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
						SET result = CONCAT('The User has been added\n');
					END;
				#ELSE
					#SET result = CONCAT('The User Password format is incorrect\n');
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
									IF ((SELECT CHAR_LENGTH (pPhoneNumber)) = 8) THEN
										BEGIN
											IF (pBirthDate < CURRENT_DATE()) THEN
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
										SET result = "The Phone Number specified needs to have 8 digits";
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
					IF ((SELECT CHAR_LENGTH (pPhoneNumber)) = 8) THEN
						BEGIN
							UPDATE InfoPeople SET phoneNumber = pPhoneNumber WHERE idInfoPeople = pIdInfoPeople;
							SET result = CONCAT(result, 'The Phone Number has been modified\n');
						END;
					ELSE
						SET result = CONCAT('The Phone Number specified needs to have 8 digits\n');
					END IF;
                END;
			END IF;
            IF (pBirthDate IS NOT NULL) THEN
				BEGIN
					IF (pBirthDate < CURRENT_DATE()) THEN
						BEGIN
							UPDATE InfoPeople SET birthDate = pBirthDate WHERE idInfoPeople = pIdInfoPeople;
							SET result = CONCAT(result, 'The Birth Date has been modified\n');
						END;
					ELSE
						SET result = CONCAT('The Birth Date can´t be greater or equal than the actual Date\n');
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

##################################################################################################
# CRUD ClientPeople
##################################################################################################

DELIMITER //
CREATE PROCEDURE CClientPeople (IN pIdClientUser INT, IN pIdInfoPeople INT, OUT result VARCHAR(16383))
BEGIN
	IF (pIdClientUser IS NOT NULL AND pIdInfoPeople IS NOT NULL) THEN
	BEGIN
			IF ((SELECT COUNT(idClientUser) FROM ClientUser WHERE idClientUser = pIdClientUser) > 0) THEN
				BEGIN
					IF ((SELECT COUNT(idInfoPeople) FROM InfoPeople WHERE idInfoPeople = pIdInfoPeople) > 0) THEN
						BEGIN
							INSERT INTO ClientPeople (idClientUser, idInfoPeople, isActive) VALUES (pIdClientUser, pIdInfoPeople, 1);
							SET result = "The Client People has been added";
						END;
					ELSE
						SET result = "The Info People ID specified doesn´t exists";
					END IF;
				END;               
			ELSE
				SET result = "The Client User ID specified doesn´t exists";
			END IF;
		END;
	ELSE
		SET result = "Any of the parameters can't be NULL";
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE RClientPeople (IN pIdClientPeople INT, IN pIdClientUser INT, IN pIdInfoPeople INT, IN pSalesCounter INT, IN pIsActive BIT)
BEGIN
	SELECT idClientPeople AS 'Client People ID', idClientUser AS 'Client User ID', idInfoPeople AS 'Info People ID',
		salesCounter AS 'Sales Counter', isActive AS 'Active'
    FROM ClientPeople WHERE idClientPeople = IFNULL(pIdClientPeople, idClientPeople) AND idClientUser = IFNULL(pIdClientUser, idClientUser)
    AND idInfoPeople = IFNULL(pIdInfoPeople, idInfoPeople) AND salesCounter = IFNULL(pSalesCounter, salesCounter)
	AND isActive = IFNULL(pIsActive, isActive);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UClientPeople (IN pIdClientPeople INT, IN pIdClientUser INT, IN pIdInfoPeople INT, IN pSalesCounter INT, IN pIsActive BIT, OUT result VARCHAR(16383))
BEGIN
	SET result = "";
	IF (pIdClientPeople IS NOT NULL AND (SELECT COUNT(idClientPeople) FROM ClientPeople WHERE idClientPeople = pIdClientPeople) > 0) THEN
		BEGIN
			IF (pIdClientUser IS NOT NULL) THEN
				BEGIN
					IF ((SELECT COUNT(idClientUser) FROM ClientUser WHERE idClientUser = pIdClientUser) > 0) THEN
						BEGIN
							UPDATE ClientPeople SET idClientUser = pIdClientUser WHERE idClientPeople = pIdClientPeople;
							SET result = CONCAT(result, 'The Client User ID has been modified\n');
						END;
					ELSE
						SET result = CONCAT('The Client User ID specified doesn´t exists\n');
					END IF;
                END;
			END IF;
            IF (pIdInfoPeople IS NOT NULL) THEN
				BEGIN
					IF ((SELECT COUNT(idInfoPeople) FROM InfoPeople WHERE idInfoPeople = pIdInfoPeople) > 0) THEN
						BEGIN
							UPDATE ClientPeople SET idInfoPeople = pIdInfoPeople WHERE idClientPeople = pIdClientPeople;
							SET result = CONCAT(result, 'The Info People ID has been modified\n');
						END;
					ELSE
						SET result = CONCAT('The Info People ID specified doesn´t exists\n');
					END IF;
                END;
			END IF;
            IF (pSalesCounter IS NOT NULL) THEN
				BEGIN
					IF (pSalesCounter >= 0) THEN
						BEGIN
							UPDATE ClientPeople SET salesCounter = pSalesCounter WHERE idClientPeople = pIdClientPeople;
							SET result = CONCAT(result, 'The Sales Counter has been modified\n');
						END;
					ELSE
						SET result = CONCAT('The Sales Counter can´t be lower than 0\n');
					END IF;
                END;
			END IF;
            IF (pIsActive IS NOT NULL AND pIsActive = 1) THEN
				BEGIN
					UPDATE ClientPeople SET isActive = pIsActive WHERE idClientPeople = pIdClientPeople;
                    SET result = CONCAT(result, 'The Client People is now active\n');
                END;
			END IF;
            SET result = CONCAT(result, 'Changes made successfully \n');
		END;
	ELSE
		SET result = "The Client People ID can't be NULL or the ID specified doesn´t exists";
	END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DClientPeople (IN pIdClientPeople INT, OUT result VARCHAR(16383))
BEGIN
	IF ((SELECT COUNT(idClientPeople) FROM ClientPeople WHERE idClientPeople = pIdClientPeople) > 0) THEN
		BEGIN
			UPDATE ClientPeople SET isActive = 0 WHERE idClientPeople = pIdClientPeople;
            SET result = "The Client Information is now inactive";
            #cascade here
        END;
	ELSE
		SET result = "The ID specified doesn´t exists";
	END IF;
END //
DELIMITER ;

##################################################################################################
# CRUD Card
##################################################################################################

DELIMITER //
CREATE PROCEDURE CCard (IN pIdClientUser INT, IN pCardNumber VARCHAR(30), IN pExpirationDate DATE, IN pCVV INT, OUT result VARCHAR(16383))
BEGIN
	IF (pIdClientUser IS NOT NULL AND pCardNumber IS NOT NULL AND pExpirationDate IS NOT NULL AND pCVV IS NOT NULL) THEN
		BEGIN
			IF ((SELECT COUNT(idClientUser) FROM ClientUser WHERE idClientUser = pIdClientUser) > 0) THEN
				BEGIN
					IF (CHAR_LENGTH(pCardNumber) BETWEEN 13 AND 18) THEN
						BEGIN
							IF ((SELECT COUNT(cardNumber) FROM Card WHERE cardNumber = pCardNumber) = 0) THEN
								BEGIN
									IF (pExpirationDate > CURRENT_DATE()) THEN
										BEGIN
											IF (CHAR_LENGTH(pCVV) BETWEEN 3 AND 4) THEN
												BEGIN
													INSERT INTO Card (idInfoPeople, cardNumber, expirationDate, cvv) VALUES
													((SELECT IP.idInfoPeople FROM ClientUser CU INNER JOIN ClientPeople CP ON CU.idClientUser = CP.idClientUser
														INNER JOIN InfoPeople IP ON CP.idInfoPeople = IP.idInfoPeople
														WHERE CP.idClientUser = pIdClientUser), pCardNumber, pExpirationDate, pCVV);
														SET result = "The Card has been added";
												END;
											ELSE
												SET result = "The CVV needs to have between 3 and 4 digits";
											END IF;
										END;
									ELSE
										SET result = "The Card is expired";
									END IF;
								END;
							ELSE
								SET result = "That Card Number is already in the system";
							END IF;
						END;
					ELSE
						SET result = "The Card Number needs to have between 13 and 18 digits";
					END IF;
				END;
			ELSE
				SET result = "The Client User ID specified doesn´t exists";
			END IF;
		END;
	ELSE
		SET result = "Any of the parameters can't be NULL";
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE RCard (IN pIdCard INT, IN pIdInfoPeople INT, IN pCardNumber VARCHAR(30), IN pExpirationDate DATE, IN pCVV INT)
BEGIN
	SELECT idCard AS 'Card ID', idInfoPeople AS 'Info People ID', cardNumber AS 'Card Number',
		expirationDate AS 'Expiration Date', cvv AS 'CVV'
    FROM Card WHERE idCard = IFNULL(pIdCard, idCard) AND idInfoPeople = IFNULL(pIdInfoPeople, idInfoPeople)
    AND cardNumber = IFNULL(pCardNumber, cardNumber) AND expirationDate = IFNULL(pExpirationDate, expirationDate);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UCard (IN pIdCard INT, IN pIdInfoPeople INT, IN pCardNumber INT, IN pExpirationDate DATE, IN pCVV INT, OUT result VARCHAR(16383))
BEGIN
	SET result = "";
	IF (pIdCard IS NOT NULL AND (SELECT COUNT(idCard) FROM Card WHERE idCard = pIdCard) > 0) THEN
		BEGIN
			IF (pIdInfoPeople IS NOT NULL) THEN
				BEGIN
					IF ((SELECT COUNT(idInfoPeople) FROM InfoPeople WHERE idInfoPeople = pIdInfoPeople) > 0) THEN
						BEGIN
							UPDATE Card SET idInfoPeople = pIdInfoPeople WHERE idCard = pIdCard;
							SET result = CONCAT(result, 'The Info People ID has been modified\n');
						END;
					ELSE
						SET result = CONCAT('The Info People ID specified doesn´t exists\n');
					END IF;
                END;
			END IF;
            IF (pCardNumber IS NOT NULL) THEN
				BEGIN
					IF (CHAR_LENGTH(pCardNumber) BETWEEN 13 AND 18) THEN
						BEGIN
							IF ((SELECT COUNT(cardNumber) FROM Card WHERE cardNumber = pCardNumber) = 0) THEN
								BEGIN
									UPDATE Card SET cardNumber = pCardNumber WHERE idCard = pIdCard;
									SET result = CONCAT(result, 'The Card Number has been modified\n');
								END;
							ELSE
								SET result = CONCAT('That Card Number is already in the system\n');
                            END IF;
						END;
					ELSE
						SET result = CONCAT('The Card Number needs to have between 13 and 18 digits\n');
					END IF;
                END;
			END IF;
            IF (pExpirationDate IS NOT NULL) THEN
				BEGIN
					IF (pExpirationDate > CURRENT_DATE()) THEN
						BEGIN
							UPDATE Card SET expirationDate = pExpirationDate WHERE idCard = pIdCard;
							SET result = CONCAT(result, 'The Expiration Date has been modified\n');
						END;
					ELSE
						SET result = CONCAT('The Card is expired\n');
					END IF;
                END;
			END IF;
			IF (pCVV IS NOT NULL) THEN
				BEGIN
					IF (CHAR_LENGTH(pCVV) BETWEEN 3 AND 4) THEN
						BEGIN
							UPDATE Card SET cvv = pCVV WHERE idCard = pIdCard;
							SET result = CONCAT(result, 'The CVV has been modified\n');
						END;
					ELSE
						SET result = CONCAT('The CVV needs to have between 3 and 4 digits\n');
					END IF;
                END;
			END IF;
            SET result = CONCAT(result, 'Changes made successfully\n');
		END;
	ELSE
		SET result = "The Client People ID can't be NULL or the ID specified doesn´t exists";
	END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DCard (IN pIdCard INT, OUT result VARCHAR(16383))
BEGIN
	IF ((SELECT COUNT(idCard) FROM Card WHERE idCard = pIdCard) > 0) THEN
		BEGIN
			DELETE FROM Card WHERE idCard = pIdCard;
            SET result = "The Card has been removed";
            #cascade here
        END;
	ELSE
		SET result = "The Card ID specified doesn´t exists";
	END IF;
END //
DELIMITER ;

##################################################################################################
# CRUD ClientLocation
##################################################################################################

DELIMITER //
CREATE PROCEDURE CClientLocation (IN pIdClientUser INT, IN pIdLocation INT, OUT result VARCHAR(16383))
BEGIN
	IF (pIdClientUser IS NOT NULL AND pIdLocation IS NOT NULL) THEN
	BEGIN
			IF ((SELECT COUNT(idClientUser) FROM ClientUser WHERE idClientUser = pIdClientUser) > 0) THEN
				BEGIN
					IF ((SELECT COUNT(idLocation) FROM Location WHERE idLocation = pIdLocation) > 0) THEN
						BEGIN
							INSERT INTO ClientLocation (idClientPeople, idLocation) VALUES
                            ((SELECT idClientPeople FROM ClientUser CU INNER JOIN ClientPeople CP ON CU.idClientUser = CP.idClientUser
								WHERE CP.idClientUser = pIdClientUser), pIdLocation);
							SET result = "The Client Location has been added";
						END;
					ELSE
						SET result = "The Location ID specified doesn´t exists";
					END IF;
				END;               
			ELSE
				SET result = "The Client User ID specified doesn´t exists";
			END IF;
		END;
	ELSE
		SET result = "Any of the parameters can't be NULL";
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE RClientLocation (IN pIdClientLocation INT, IN pIdClientPeople INT, IN pIdLocation INT)
BEGIN
	SELECT idClientLocation AS 'Client Location ID', idClientPeople AS 'Client People ID', idLocation AS 'Location ID'
    FROM ClientLocation WHERE idClientLocation = IFNULL(pIdClientLocation, idClientLocation)
    AND idClientPeople = IFNULL(pIdClientPeople, idClientPeople)
    AND idLocation = IFNULL(pIdLocation, idLocation);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UClientLocation (IN pIdClientLocation INT, IN pIdClientPeople INT, IN pIdLocation INT, OUT result VARCHAR(16383))
BEGIN
	SET result = "";
	IF (pIdClientLocation IS NOT NULL AND (SELECT COUNT(idClientLocation) FROM ClientLocation WHERE idClientLocation = pIdClientLocation) > 0) THEN
		BEGIN
			IF (pIdClientPeople IS NOT NULL) THEN
				BEGIN
					IF ((SELECT COUNT(idClientPeople) FROM ClientPeople WHERE idClientPeople = pIdClientPeople) > 0) THEN
						BEGIN
							UPDATE ClientLocation SET idClientPeople = pIdClientPeople WHERE idClientLocation = pIdClientLocation;
							SET result = CONCAT(result, 'The Client People ID has been modified\n');
						END;
					ELSE
						SET result = CONCAT('The Client People ID specified doesn´t exists\n');
					END IF;
                END;
			END IF;
            IF (pIdLocation IS NOT NULL) THEN
				BEGIN
					IF ((SELECT COUNT(idLocation) FROM Location WHERE idLocation = pIdLocation) > 0) THEN
						BEGIN
							UPDATE ClientLocation SET idLocation = pIdLocation WHERE idClientLocation = pIdClientLocation;
							SET result = CONCAT(result, 'The Client Location ID has been modified\n');
						END;
					ELSE
						SET result = CONCAT('The Location ID specified doesn´t exists\n');
					END IF;
                END;
			END IF;
            SET result = CONCAT(result, 'Changes made successfully \n');
		END;
	ELSE
		SET result = "The Client Location ID can't be NULL or the ID specified doesn´t exists";
	END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DClientLocation (IN pIdClientLocation INT, OUT result VARCHAR(16383))
BEGIN
	IF ((SELECT COUNT(idClientLocation) FROM ClientLocation WHERE idClientLocation = pIdClientLocation) > 0) THEN
		BEGIN
			DELETE FROM ClientLocation WHERE idClientLocation = pIdClientLocation;
            SET result = "The Client Location has been removed";
            #cascade here
        END;
	ELSE
		SET result = "The Client Location ID specified doesn´t exists";
	END IF;
END //
DELIMITER ;

##################################################################################################
# CRUD Membership
##################################################################################################

DELIMITER //
CREATE PROCEDURE CMembership (IN pNameMembership VARCHAR(30), IN pCost DECIMAL(15,2), IN pProductDiscount FLOAT, IN pDeliveryDiscount FLOAT, OUT result VARCHAR(16383))
BEGIN
	IF (pNameMembership IS NOT NULL AND pCost IS NOT NULL AND pProductDiscount IS NOT NULL AND pDeliveryDiscount IS NOT NULL) THEN
	BEGIN
			IF ((SELECT COUNT(idMembership) FROM Membership WHERE nameMembership = pNameMembership) = 0 AND pNameMembership != "") THEN
				BEGIN
					IF (pCost > 0) THEN
						BEGIN
							IF (pProductDiscount > 0) THEN
								BEGIN
									IF (pDeliveryDiscount >= 0) THEN
										BEGIN
											INSERT INTO Membership (nameMembership, cost, productDiscount, deliveryDiscount, isActive) VALUES
											(pNameMembership, pCost, pProductDiscount, pDeliveryDiscount, 1);
											SET result = "The Membership has been added";
										END;
									ELSE
										SET result = "The Delivery Discount needs to be greater or equal than 0";
									END IF;
								END;
							ELSE
								SET result = "The Product Discount needs to be greater than 0";
							END IF;
						END;
					ELSE
						SET result = "The Cost needs to be greater than 0";
					END IF;
				END;               
			ELSE
				SET result = "There's already a Membership with that name or the name can't be empty";
			END IF;
		END;
	ELSE
		SET result = "Any of the parameters can't be NULL";
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE RMembership (IN pIdMembership INT, IN pNameMembership VARCHAR(30), IN pCost DECIMAL(15,2), IN pProductDiscount FLOAT, IN pDeliveryDiscount FLOAT, IN pIsActive BIT)
BEGIN
	SELECT idMembership AS 'Membership ID', nameMembership AS 'Membership Name', cost AS 'Cost',
	productDiscount AS 'Product Discount', deliveryDiscount AS 'Delivery Discount', isActive AS 'Active'
    FROM Membership WHERE idMembership = IFNULL(pIdMembership, idMembership) AND nameMembership = IFNULL(pNameMembership, nameMembership)
    AND cost = IFNULL(pCost, cost) AND productDiscount = IFNULL(pProductDiscount, productDiscount)
    AND deliveryDiscount = IFNULL(pDeliveryDiscount, deliveryDiscount);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UMembership (IN pIdMembership INT, IN pNameMembership VARCHAR(30), IN pCost DECIMAL(15,2), IN pProductDiscount FLOAT, IN pDeliveryDiscount FLOAT, IN pIsActive BIT, OUT result VARCHAR(16383))
BEGIN
	SET result = "";
	IF (pIdMembership IS NOT NULL AND (SELECT COUNT(idMembership) FROM Membership WHERE idMembership = pIdMembership) > 0) THEN
		BEGIN
			IF (pNameMembership IS NOT NULL) THEN
				BEGIN
					IF ((SELECT COUNT(idMembership) FROM Membership WHERE nameMembership = pNameMembership) > 0 AND pNameMembership != "") THEN
						BEGIN
							UPDATE Membership SET nameMembership = pNameMembership WHERE idMembership = pIdMembership;
							SET result = CONCAT(result, 'The Membership Name has been modified\n');
						END;
					ELSE
						SET result = CONCAT('There´s already a Membership with that name or the name can´t be empty\n');
					END IF;
                END;
			END IF;
            IF (pCost IS NOT NULL) THEN
				BEGIN
					IF (pCost > 0) THEN
						BEGIN
							UPDATE Membership SET cost = pCost WHERE idMembership = pIdMembership;
							SET result = CONCAT(result, 'The Cost has been modified\n');
						END;
					ELSE
						SET result = CONCAT('The Cost needs to be greater than 0\n');
					END IF;
                END;
			END IF;
            IF (pProductDiscount IS NOT NULL) THEN
				BEGIN
					IF (pProductDiscount > 0) THEN
						BEGIN
							UPDATE Membership SET productDiscount = pProductDiscount WHERE idMembership = pIdMembership;
							SET result = CONCAT(result, 'The Product Discount has been modified\n');
						END;
					ELSE
						SET result = CONCAT('The Product Discount needs to be greater than 0\n');
					END IF;
                END;
			END IF;
            IF (pDeliveryDiscount IS NOT NULL) THEN
				BEGIN
					IF (pDeliveryDiscount >= 0) THEN
						BEGIN
							UPDATE Membership SET deliveryDiscount = pDeliveryDiscount WHERE idMembership = pIdMembership;
							SET result = CONCAT(result, 'The Delivery Discount has been modified\n');
						END;
					ELSE
						SET result = CONCAT('The Delivery Discount needs to be greater or equal than 0\n');
					END IF;
                END;
			END IF;
			IF (pIsActive IS NOT NULL AND pIsActive = 1) THEN
				BEGIN
					UPDATE Membership SET isActive = pIsActive WHERE idMembership = pIdMembership;
                    SET result = CONCAT(result, 'The Membership is now active\n');
                END;
			END IF;
            SET result = CONCAT(result, 'Changes made successfully \n');
		END;
	ELSE
		SET result = 'The Membership ID can´t be NULL or the ID specified doesn´t exists\n';
	END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DMembership (IN pIdMembership INT, OUT result VARCHAR(16383))
BEGIN
	IF ((SELECT COUNT(idMembership) FROM Membership WHERE idMembership = pIdMembership) > 0) THEN
		BEGIN
			UPDATE Membership SET isActive = 0 WHERE idMembership = pIdMembership;
            SET result = "The Client Information is now inactive";
            #cascade here
        END;
	ELSE
		SET result = "The ID specified doesn´t exists";
	END IF;
END //
DELIMITER ;

##################################################################################################
# CRUD ClientMembership
##################################################################################################

DELIMITER //
CREATE PROCEDURE CClientMembership (IN pIdMembership INT, IN pIdClientUser INT, OUT result VARCHAR(16383))
BEGIN
	IF (pIdMembership IS NOT NULL AND pIdClientUser IS NOT NULL) THEN
	BEGIN
			IF ((SELECT COUNT(idMembership) FROM Membership WHERE idMembership = pIdMembership) > 0) THEN
				BEGIN
					IF ((SELECT COUNT(idClientUser) FROM ClientUser WHERE idClientUser = pIdClientUser) > 0) THEN
						BEGIN
							IF ((SELECT COUNT(idClientMembership) FROM ClientMembership WHERE idClientPeople =
                            (SELECT idClientPeople FROM ClientUser CU INNER JOIN ClientPeople CP ON CU.idClientUser = CP.idClientUser
							WHERE CP.idClientUser = pIdClientUser)) = 0) THEN
								BEGIN
									INSERT INTO ClientMembership (idMembership, idClientPeople) VALUES
									(pIdMembership, (SELECT idClientPeople FROM ClientUser CU INNER JOIN ClientPeople CP ON CU.idClientUser = CP.idClientUser
									WHERE CP.idClientUser = pIdClientUser));
									SET result = "The Client Membership has been added";
								END;
							ELSE
								SET result = "The Client already has a membership";
							END IF;
						END;
					ELSE
						SET result = "The Client User ID specified doesn´t exists";
					END IF;
				END;               
			ELSE
				SET result = "The Membership ID specified doesn´t exists";
			END IF;
		END;
	ELSE
		SET result = "Any of the parameters can't be NULL";
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE RClientMembership (IN pIdClientMembership INT, IN pIdMembership INT, IN pIdClientPeople INT)
BEGIN
	SELECT idClientMembership AS 'Client Membership ID', idMembership AS 'Membership ID',
    idClientPeople AS 'Client People ID'
    FROM ClientMembership WHERE idClientMembership = IFNULL(pIdClientMembership, idClientMembership)
    AND idMembership = IFNULL(pIdMembership, idMembership) AND idClientPeople = IFNULL(pIdClientPeople, idClientPeople);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UClientMembership (IN pIdClientMembership INT, IN pIdMembership INT, IN pIdClientPeople INT, OUT result VARCHAR(16383))
BEGIN
	SET result = "";
	IF (pIdClientMembership IS NOT NULL AND (SELECT COUNT(idClientMembership) FROM ClientMembership WHERE idClientMembership = pIdClientMembership) > 0) THEN
		BEGIN
			IF (pIdMembership IS NOT NULL) THEN
				BEGIN
					IF ((SELECT COUNT(idMembership) FROM Membership WHERE idMembership = pIdMembership) > 0) THEN
						BEGIN
							UPDATE ClientMembership SET idMembership = pIdMembership WHERE idClientMembership = pIdClientMembership;
							SET result = CONCAT(result, 'The Membership ID has been modified\n');
						END;
					ELSE
						SET result = CONCAT('The Membership ID specified doesn´t exists\n');
					END IF;
                END;
			END IF;
            IF (pIdClientPeople IS NOT NULL) THEN
				BEGIN
					IF ((SELECT COUNT(idClientPeople) FROM ClientPeople WHERE idClientPeople = pIdClientPeople) > 0) THEN
						BEGIN
							IF ((SELECT COUNT(idClientMembership) FROM ClientMembership WHERE idClientPeople = pIdClientPeople) = 0) THEN
								BEGIN
									UPDATE ClientMembership SET idClientPeople = pIdClientPeople WHERE idClientMembership = pIdClientMembership;
									SET result = CONCAT(result, 'The ClientPeople ID has been modified\n');
								END;
							ELSE
								SET result = CONCAT('The Client People ID specified already has a membership\n');
                            END IF;
						END;
					ELSE
						SET result = CONCAT('The Client People ID specified doesn´t exists\n');
					END IF;
                END;
			END IF;
            SET result = CONCAT(result, 'Changes made successfully \n');
		END;
	ELSE
		SET result = "The Client Membership ID can't be NULL or the ID specified doesn´t exists";
	END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DClientMembership (IN pIdClientMembership INT, OUT result VARCHAR(16383))
BEGIN
	IF ((SELECT COUNT(idClientMembership) FROM ClientMembership WHERE idClientMembership = pIdClientMembership) > 0) THEN
		BEGIN
			DELETE FROM ClientMembership WHERE idClientMembership = pIdClientMembership;
            SET result = "The Client Membership has been removed";
            #cascade here
        END;
	ELSE
		SET result = "The Client Membership ID specified doesn´t exists";
	END IF;
END //
DELIMITER ;

##################################################################################################
# CRUD WorkerReview
##################################################################################################

DELIMITER //
CREATE PROCEDURE CWorkerReview (IN pIdClientUser INT, IN pIdWorker INT, OUT result VARCHAR(16383))
BEGIN
	IF (pIdClientUser IS NOT NULL AND pIdWorker IS NOT NULL) THEN
		BEGIN
			IF ((SELECT COUNT(idClientUser) FROM ClientUser WHERE idClientUser = pIdClientUser) > 0) THEN
				BEGIN
					INSERT INTO WorkerReview (idClientUser, idWorker, dateWR) VALUES
					(pIdClientUser, pIdWorker, CURRENT_DATE());
					SET result = "The Worker Review has been added";
				END;
			ELSE
				SET result = "The Client User ID specified doesn´t exists";
			END IF;
		END;
	ELSE
		SET result = "Any of the parameters can't be NULL";
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE RWorkerReview (IN pIdWorkerReview INT, IN pIdClientUser INT, IN pIdWorker INT, IN pDateWR DATE)
BEGIN
	SELECT idWorkerReview AS 'Worker Review ID', idClientUser AS 'Client User ID',
    idWorker AS 'Worker ID', dateWR AS 'Worker Review Date'
    FROM WorkerReview WHERE idWorkerReview = IFNULL(pIdWorkerReview, idWorkerReview)
    AND idClientUser = IFNULL(pIdClientUser, idClientUser) AND idWorker = IFNULL(pIdWorker, idWorker)
    AND dateWR = IFNULL(pDateWR, dateWR);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UWorkerReview (IN pIdWorkerReview INT, IN pIdClientUser INT, IN pIdWorker INT, IN pDateWR DATE, OUT result VARCHAR(16383))
BEGIN
	SET result = "";
	IF (pIdWorkerReview IS NOT NULL AND (SELECT COUNT(idWorkerReview) FROM WorkerReview WHERE idWorkerReview = pIdWorkerReview) > 0) THEN
		BEGIN
			IF (pIdClientUser IS NOT NULL) THEN
				BEGIN
					IF ((SELECT COUNT(idClientUser) FROM ClientUser WHERE idClientUser = pIdClientUser) > 0) THEN
						BEGIN
							UPDATE WorkerReview SET idClientUser = pIdClientUser WHERE idWorkerReview = pIdWorkerReview;
							SET result = CONCAT(result, 'The Client User ID has been modified\n');
						END;
					ELSE
						SET result = CONCAT('The Client User ID specified doesn´t exists\n');
					END IF;
                END;
			END IF;
            IF (pIdWorker IS NOT NULL) THEN
				BEGIN
					UPDATE WorkerReview SET idWorker = pIdWorker WHERE idWorkerReview = pIdWorkerReview;
					SET result = CONCAT(result, 'The Worker ID has been modified\n');
				END;
			END IF;
            IF (pDateWR IS NOT NULL) THEN
				BEGIN
					IF (pDateWR <= CURRENT_DATE()) THEN
						BEGIN
							UPDATE WorkerReview SET dateWR = pDateWR WHERE idWorkerReview = pIdWorkerReview;
							SET result = CONCAT(result, 'The Worker Review Date has been modified\n');
						END;
					ELSE
						SET result = CONCAT('The Worker Review Date can´t be greater than actual date\n');
					END IF;
                END;
			END IF;
            SET result = CONCAT(result, 'Changes made successfully \n');
		END;
	ELSE
		SET result = "The Worker Review ID can't be NULL or the ID specified doesn´t exists";
	END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DWorkerReview (IN pIdWorkerReview INT, OUT result VARCHAR(16383))
BEGIN
	IF ((SELECT COUNT(idWorkerReview) FROM WorkerReview WHERE idWorkerReview = pIdWorkerReview) > 0) THEN
		BEGIN
			DELETE FROM WorkerReview WHERE idWorkerReview = pIdWorkerReview;
            SET result = "The Worker Review has been removed";
            #cascade here
        END;
	ELSE
		SET result = "The Worker Review ID specified doesn´t exists";
	END IF;
END //
DELIMITER ;

##################################################################################################
# CRUD Qualification
##################################################################################################

DELIMITER //
CREATE PROCEDURE CQualification (IN pIdWorkerReview INT, IN pQualDescription VARCHAR(200), OUT result VARCHAR(16383))
BEGIN
	IF (pIdWorkerReview IS NOT NULL AND pQualDescription IS NOT NULL) THEN
		BEGIN
			IF ((SELECT COUNT(idWorkerReview) FROM WorkerReview WHERE idWorkerReview = pIdWorkerReview) > 0) THEN
				BEGIN
					IF (pQualDescription != "") THEN
						BEGIN
							INSERT INTO Qualification (idWorkerReview, qualDescription) VALUES
							(pIdWorkerReview, pQualDescription);
							SET result = "The Qualification has been added";
						END;
					ELSE
						SET result = "The Qualification can´t be empty";
					END IF;
				END;
			ELSE
				SET result = "The Worker Review ID specified doesn´t exists";
			END IF;
		END;
	ELSE
		SET result = "Any of the parameters can't be NULL";
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE RQualification (IN pIdQualification INT, IN pIdWorkerReview INT, IN pQualDescription VARCHAR(200))
BEGIN
	SELECT idQualification AS 'Qualification ID', idWorkerReview AS 'Worker Review ID',
    qualDescription AS 'Qualification Description'
    FROM Qualification WHERE idQualification = IFNULL(pIdQualification, idQualification)
    AND idWorkerReview = IFNULL(pIdWorkerReview, idWorkerReview)
    AND qualDescription = IFNULL(pQualDescription, qualDescription);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UQualification (IN pIdQualification INT, IN pIdWorkerReview INT, IN pQualDescription VARCHAR(200), OUT result VARCHAR(16383))
BEGIN
	SET result = "";
	IF (pIdQualification IS NOT NULL AND (SELECT COUNT(idQualification) FROM Qualification WHERE idQualification = pIdQualification) > 0) THEN
		BEGIN
			IF (pIdWorkerReview IS NOT NULL) THEN
				BEGIN
					IF ((SELECT COUNT(idWorkerReview) FROM WorkerReview WHERE idWorkerReview = pIdWorkerReview) > 0) THEN
						BEGIN
							UPDATE Qualification SET idWorkerReview = pIdWorkerReview WHERE idQualification = pIdQualification;
							SET result = CONCAT(result, 'The Worker Review ID has been modified\n');
						END;
					ELSE
						SET result = CONCAT('The Worker Review ID specified doesn´t exists\n');
					END IF;
                END;
			END IF;
            IF (pQualDescription IS NOT NULL) THEN
				BEGIN
					IF (pQualDescription != "") THEN
						BEGIN
							UPDATE Qualification SET qualDescription = pQualDescription WHERE idQualification = pIdQualification;
							SET result = CONCAT(result, 'The Qualification Description has been modified\n');
						END;
					ELSE
						SET result = CONCAT('The Qualification Description can´t be empty\n');
					END IF;
				END;
			END IF;
            SET result = CONCAT(result, 'Changes made successfully \n');
		END;
	ELSE
		SET result = "The Qualification ID can't be NULL or the ID specified doesn´t exists";
	END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DQualification (IN pIdQualification INT, OUT result VARCHAR(16383))
BEGIN
	IF ((SELECT COUNT(idQualification) FROM Qualification WHERE idQualification = pIdQualification) > 0) THEN
		BEGIN
			DELETE FROM Qualification WHERE idQualification = pIdQualification;
            SET result = "The Qualification has been removed";
            #cascade here
        END;
	ELSE
		SET result = "The Qualification ID specified doesn´t exists";
	END IF;
END //
DELIMITER ;

##################################################################################################
# CRUD Complaint
##################################################################################################

DELIMITER //
CREATE PROCEDURE CComplaint (IN pIdWorkerReview INT, IN pCompDescription VARCHAR(200), OUT result VARCHAR(16383))
BEGIN
	IF (pIdWorkerReview IS NOT NULL AND pCompDescription IS NOT NULL) THEN
		BEGIN
			IF ((SELECT COUNT(idWorkerReview) FROM WorkerReview WHERE idWorkerReview = pIdWorkerReview) > 0) THEN
				BEGIN
					IF (pCompDescription != "") THEN
						BEGIN
							INSERT INTO Complaint (idWorkerReview, compDescription, solved) VALUES
							(pIdWorkerReview, pCompDescription, 1);
							SET result = "The Complaint has been added";
						END;
					ELSE
						SET result = "The Complaint can´t be empty";
					END IF;
				END;
			ELSE
				SET result = "The Worker Review ID specified doesn´t exists";
			END IF;
		END;
	ELSE
		SET result = "Any of the parameters can't be NULL";
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE RComplaint (IN pIdComplaint INT, IN pIdWorkerReview INT, IN pCompDescription VARCHAR(200), IN pSolved BIT)
BEGIN
	SELECT idComplaint AS 'Complaint ID', idWorkerReview AS 'Worker Review ID',
    compDescription AS 'Qualification Description', solved AS 'Solved'
    FROM Complaint WHERE idComplaint = IFNULL(pIdComplaint, idComplaint)
    AND idWorkerReview = IFNULL(pIdWorkerReview, idWorkerReview)
    AND compDescription = IFNULL(pCompDescription, compDescription)
	AND solved = IFNULL(pSolved, solved);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UComplaint (IN pIdComplaint INT, IN pIdWorkerReview INT, IN pCompDescription VARCHAR(200), IN pSolved BIT, OUT result VARCHAR(16383))
BEGIN
	SET result = "";
	IF (pIdComplaint IS NOT NULL AND (SELECT COUNT(idComplaint) FROM Complaint WHERE idComplaint = pIdComplaint) > 0) THEN
		BEGIN
			IF (pIdWorkerReview IS NOT NULL) THEN
				BEGIN
					IF ((SELECT COUNT(idWorkerReview) FROM WorkerReview WHERE idWorkerReview = pIdWorkerReview) > 0) THEN
						BEGIN
							UPDATE Complaint SET idWorkerReview = pIdWorkerReview WHERE idComplaint = pIdComplaint;
							SET result = CONCAT(result, 'The Worker Review ID has been modified\n');
						END;
					ELSE
						SET result = CONCAT('The Worker Review ID specified doesn´t exists\n');
					END IF;
                END;
			END IF;
            IF (pCompDescription IS NOT NULL) THEN
				BEGIN
					IF (pCompDescription != "") THEN
						BEGIN
							UPDATE Complaint SET compDescription = pCompDescription WHERE idComplaint = pIdComplaint;
							SET result = CONCAT(result, 'The Complaint Description has been modified\n');
						END;
					ELSE
						SET result = CONCAT('The Complaint Description can´t be empty\n');
					END IF;
				END;
			END IF;
			IF (pSolved IS NOT NULL) THEN
				BEGIN
					UPDATE Complaint SET solved = pSolved WHERE idComplaint = pIdComplaint;
                    SET result = CONCAT(result, 'The Complaint Status has been modified\n');
				END;
			END IF;
            SET result = CONCAT(result, 'Changes made successfully \n');
		END;
	ELSE
		SET result = "The Complaint ID can't be NULL or the ID specified doesn´t exists";
	END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DComplaint (IN pIdComplaint INT, OUT result VARCHAR(16383))
BEGIN
	IF ((SELECT COUNT(idComplaint) FROM Complaint WHERE idComplaint = pIdComplaint) > 0) THEN
		BEGIN
			DELETE FROM Complaint WHERE idComplaint = pIdComplaint;
            SET result = "The Complaint has been removed";
            #cascade here
        END;
	ELSE
		SET result = "The Complaint ID specified doesn´t exists";
	END IF;
END //
DELIMITER ;

##################################################################################################
# CRUD Review
##################################################################################################

DELIMITER //
CREATE PROCEDURE CReview (IN pIdProduct INT, IN pScore INT, IN pRevDescription VARCHAR(200), IN pIdClientUser INT, OUT result VARCHAR(16383))
BEGIN
	IF (pIdProduct IS NOT NULL AND pScore IS NOT NULL AND pRevDescription IS NOT NULL AND pIdClientUser IS NOT NULL) THEN
	BEGIN
			IF ((SELECT COUNT(idProduct) FROM Product WHERE idProduct = pIdProduct) > 0) THEN
				BEGIN
					IF (pScore BETWEEN 1 AND 5) THEN
						BEGIN
							IF (pRevDescription != "") THEN
								BEGIN
									IF ((SELECT COUNT(idClientUser) FROM ClientUser WHERE idClientUser = pIdClientUser) > 0) THEN
										BEGIN
											#CHECKS IF USER DOESN´T HAVE ALREADY A REVIEW ON THE SPECIFIED PRODUCT
											IF ((SELECT COUNT(idReview) FROM Review WHERE idProduct = pIdProduct AND idClientUser = pIdClientUser) = 0) THEN
												BEGIN
													INSERT INTO Review (idProduct, score, revDescription, idClientUser, revDate) VALUES
													(pIdProduct, pScore, pRevDescription, pIdClientUser, CURRENT_DATE());
													SET result = "The Review has been added";
												END;
											ELSE
												SET result = "The Client User ID specified already has a review in this product";
											END IF;
										END;
									ELSE
										SET result = "The Client User ID specified doesn´t exists";
									END IF;
								END;
							ELSE
								SET result = "The Review Description can´t be empty";
							END IF;
						END;
					ELSE
						SET result = "The Score needs to be between 1 and 5";
					END IF;
				END;               
			ELSE
				SET result = "The Product ID specified doesn´t exists";
			END IF;
		END;
	ELSE
		SET result = "Any of the parameters can't be NULL";
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE RReview (IN pIdReview INT, IN pIdProduct INT, IN pScore INT, IN pRevDescription VARCHAR(200), IN pIdClientUser INT, IN pRevDate DATE)
BEGIN
	SELECT idReview AS 'Review ID', idProduct AS 'Product ID', score AS 'Score',
	revDescription AS 'Review Description',idClientUser AS 'Client User ID', revDate AS 'Review Date'
    FROM Review WHERE idReview = IFNULL(pIdReview, idReview) AND idProduct = IFNULL(pIdProduct, idProduct)
    AND score = IFNULL(pScore, score) AND revDescription = IFNULL(pRevDescription, revDescription)
    AND idClientUser = IFNULL(pIdClientUser, idClientUser) AND revDate = IFNULL(pRevDate, revDate);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UReview (IN pIdReview INT, IN pIdProduct INT, IN pScore INT, IN pRevDescription VARCHAR(200), IN pIdClientUser INT, IN pRevDate DATE, OUT result VARCHAR(16383))
BEGIN
	SET result = "";
	IF (pIdReview IS NOT NULL AND (SELECT COUNT(idReview) FROM Review WHERE idReview = pIdReview) > 0) THEN
		BEGIN
			IF (pIdProduct IS NOT NULL) THEN
				BEGIN
					IF ((SELECT COUNT(idProduct) FROM Product WHERE idProduct = pIdProduct) > 0) THEN
						BEGIN
							IF ((SELECT COUNT(idReview) FROM Review WHERE idProduct = pIdProduct AND idClientUser = 
								(SELECT idClientUser FROM Review WHERE idReview = pIdReview)) = 0) THEN
								BEGIN
									UPDATE Review SET idProduct = pIdProduct WHERE idReview = pIdReview;
									SET result = CONCAT(result, 'The Product ID has been modified\n');
								END;
							ELSE
								SET result = CONCAT('The Client User ID specified on this Review ID already has a review in this product\n');
							END IF;
						END;
					ELSE
						SET result = CONCAT('The Product ID specified doesn´t exists\n');
					END IF;
                END;
			END IF;
            IF (pScore IS NOT NULL) THEN
				BEGIN
					IF (pScore BETWEEN 1 AND 5) THEN
						BEGIN
							UPDATE Review SET score = pScore WHERE idReview = pIdReview;
							SET result = CONCAT(result, 'The Score has been modified\n');
						END;
					ELSE
						SET result = CONCAT('The Score needs to be between 1 and 5\n');
					END IF;
				END;
			END IF;
            IF (pRevDescription IS NOT NULL) THEN
				BEGIN
					IF (pRevDescription != "") THEN
						BEGIN
							UPDATE Review SET revDescription = pRevDescription WHERE idReview = pIdReview;
							SET result = CONCAT(result, 'The Review Description has been modified\n');
						END;
					ELSE
						SET result = CONCAT('The Review Description can´t be empty\n');
					END IF;
				END;
			END IF;
            IF (pIdClientUser IS NOT NULL) THEN
				BEGIN
					IF ((SELECT COUNT(idClientUser) FROM ClientUser WHERE idClientUser = pIdClientUser) > 0) THEN
						BEGIN
							UPDATE Review SET idClientUser = pIdClientUser WHERE idReview = pIdReview;
							SET result = CONCAT(result, 'The Client User ID has been modified\n');
						END;
					ELSE
						SET result = CONCAT('The Client User ID specified doesn´t exists\n');
					END IF;
                END;
			END IF;
            IF (pRevDate IS NOT NULL) THEN
				BEGIN
					IF (pRevDate <= CURRENT_DATE()) THEN
						BEGIN
							UPDATE Review SET revDate = pRevDate WHERE idReview = pIdReview;
							SET result = CONCAT(result, 'The Review Date has been modified\n');
						END;
					ELSE
						SET result = CONCAT('The Review Date can´t be greater than actual date\n');
					END IF;
				END;
			END IF;
            SET result = CONCAT(result, 'Changes made successfully \n');
		END;
	ELSE
		SET result = "The Review ID can't be NULL or the ID specified doesn´t exists";
	END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DReview (IN pIdReview INT, OUT result VARCHAR(16383))
BEGIN
	IF ((SELECT COUNT(idReview) FROM Review WHERE idReview = pIdReview) > 0) THEN
		BEGIN
			DELETE FROM Review WHERE idReview = pIdReview;
            SET result = "The Review has been removed";
            #cascade here
        END;
	ELSE
		SET result = "The Review ID specified doesn´t exists";
	END IF;
END //
DELIMITER ;



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


##################################################################################################


#OPEN ORDER
DELIMITER //
CREATE PROCEDURE OpenOrder(IN pIdClientUser INT, IN pIdClub INT, IN pIdEmployer INT, IN pIdMailer INT, OUT result VARCHAR(16383))
BEGIN
	IF (pIdClientUser IS NOT NULL AND pIdClub IS NOT NULL AND pIdEmployer IS NOT NULL AND pIdMailer IS NOT NULL) THEN
		BEGIN
			IF ((SELECT COUNT(idClientUser) FROM ClientUser WHERE idClientUser = pIdClientUser) > 0) THEN
				BEGIN
					IF ((SELECT COUNT(idClub) FROM Club WHERE idClub = pIdClub) > 0) THEN
						BEGIN
							INSERT INTO OrderP (idClientPeople, orderDate, idClub, idEmployer, idMailer) VALUES
							((SELECT idClientPeople FROM ClientUser CU INNER JOIN ClientPeople CP ON CU.idClientUser = CP.idClientUser WHERE CP.idClientUser = pIdClientUser),
							CURRENT_DATE(), pIdClub, pIdEmployer, pIdMailer);
							SET result = LAST_INSERT_ID();
						END;
					ELSE
						SET result = "The Club ID specified doesn´t exists";
					END IF;
				END;
			ELSE
				SET result = "The Client User ID specified doesn´t exists";
			END IF;
		END;
	ELSE
		SET result = "Any of the parameters can't be NULL";
	END IF;
END//
DELIMITER ;

#BUY PRODUCT
DELIMITER //
CREATE PROCEDURE BuyProduct(IN pIdOrderP INT, IN pIdProduct INT, IN pAmount INT, OUT result VARCHAR(16383))
BEGIN
	IF (pIdOrderP IS NOT NULL AND pIdProduct IS NOT NULL AND pAmount IS NOT NULL) THEN
		BEGIN
			IF ((SELECT COUNT(idOrderP) FROM OrderP WHERE idOrderP = pIdOrderP) > 0) THEN
				BEGIN
					IF ((SELECT COUNT(idProduct) FROM Product WHERE idProduct = pIdProduct) > 0) THEN
						BEGIN
							IF (pAmount > 0) THEN
								BEGIN
									START TRANSACTION;
										SET @idClub = (SELECT idClub FROM OrderP WHERE idOrderP = pIdOrderP);
										IF ((SELECT isActive FROM Inventory WHERE idProduct = pIdProduct AND idClub = @idClub) = 1) THEN
											BEGIN
												SET @cantAct = (SELECT stock - pAmount FROM Inventory WHERE idProduct = pIdProduct AND idClub = @idClub);
												IF (@cantAct >= 0) THEN
													BEGIN
														INSERT INTO OrderLine (idOrderP, idProduct, cost, amount) VALUES
														(pIdOrderP, pIdProduct, (SELECT cost FROM Product WHERE idProduct = pIdProduct), pAmount);
														UPDATE Inventory SET stock = @cantAct WHERE idProduct = pIdProduct AND idClub = @idClub;
														SET result = "Product bought succesfully";
													END;
												ELSE
													SET result = "The inventory of that product doesn´t has enough stock";
												END IF;
											END;
										ELSE
											SET result = "The inventory of that product is currently inactive";
										END IF;
									COMMIT;
								END;
							ELSE
								SET result = "The amount needs to be greater than 0";
							END IF;
						END;
					ELSE
						SET result = "The Product ID specified doesn´t exists";
					END IF;
				END;
			ELSE
				SET result = "The Order ID specified doesn´t exists";
			END IF;
		END;
	ELSE
		SET result = "Any of the parameters can't be NULL";
	END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE ReadLine(IN pIdOrderP INT)
BEGIN
	SELECT idOrderLine AS 'Order Line ID', idProduct AS 'Product ID',
		cost AS 'Cost', amount AS 'Amount' FROM OrderLine WHERE idOrderP = pIdOrderP;
END //
DELIMITER ;

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

#CLIENTPEOPLE
#################################################
CALL CClientPeople(1, 1, @result);
SELECT @result;
CALL RClientPeople(NULL, NULL, NULL, NULL, NULL);
CALL UClientPeople(1, NULL, NULL, NULL, 1, @result);
SELECT @result;
CALL DClientPeople(1,@result);
SELECT @result;
SELECT * FROM ClientPeople;
#################################################

#CARD
#################################################
CALL CCard(1, "5050505020202020", "2024-04-01", 392, @result);
SELECT @result;
CALL CCard(1, "5050505020202021", "2024-04-01", 392, @result);
SELECT @result;
CALL RCard(NULL, NULL, NULL, NULL, NULL);
CALL UCard(1, NULL, NULL, NULL, 391, @result);
SELECT @result;
CALL DCard(2,@result);
SELECT @result;
SELECT * FROM Card;
#################################################

#CLIENTLOCATION
#################################################
CALL CClientLocation(1, 1, @result);
SELECT @result;
CALL CClientLocation(1, 1, @result);
SELECT @result;
CALL RClientLocation(NULL, NULL, NULL);
CALL UClientLocation(1, NULL, 2, @result);
SELECT @result;
CALL DClientLocation(2,@result);
SELECT @result;
SELECT * FROM ClientLocation;
#################################################

#MEMBERSHIP
#################################################
CALL CMembership("Tier Short Glass", 10, 5, 0, @result);
SELECT @result;
CALL RMembership(NULL, NULL, NULL, NULL, NULL, NULL);
CALL UMembership(1, NULL, NULL, NULL, NULL, 1, @result);
SELECT @result;
CALL DMembership(1,@result);
SELECT @result;
SELECT * FROM Membership;
#################################################

#CLIENTMEMBERSHIP
#################################################
CALL CClientMembership(1, 1, @result);
SELECT @result;
CALL RClientMembership(NULL, NULL, NULL);
CALL UClientMembership(1, NULL, NULL, @result);
SELECT @result;
CALL DClientMembership(1,@result);
SELECT @result;
SELECT * FROM ClientMembership;
#################################################

#WORKERREVIEW
#################################################
CALL CWorkerReview(1, 1, @result);
SELECT @result;
CALL RWorkerReview(NULL, NULL, NULL, NULL);
CALL UWorkerReview(1, NULL, NULL, NULL, @result);
SELECT @result;
CALL DWorkerReview(1,@result);
SELECT @result;
SELECT * FROM WorkerReview;
#################################################

#QUALIFICATION
#################################################
CALL CQualification(1, "I don't like him", @result);
SELECT @result;
CALL CQualification(1, "I like him", @result);
SELECT @result;
CALL RQualification(NULL, NULL, NULL);
CALL UQualification(1, NULL, "I like him", @result);
SELECT @result;
CALL DQualification(2,@result);
SELECT @result;
SELECT * FROM Qualification;
#################################################

#COMPLAINT
#################################################
CALL CComplaint(1, "I don't like him", @result);
SELECT @result;
CALL CComplaint(1, "I don´t like how he talks", @result);
SELECT @result;
CALL RComplaint(NULL, NULL, NULL, NULL);
CALL UComplaint(1, NULL, NULL, 0, @result);
SELECT @result;
CALL DComplaint(2,@result);
SELECT @result;
SELECT * FROM Complaint;
#################################################

#REVIEW
#################################################
CALL CReview(1, 4, "Insane", 1, @result);
SELECT @result;
CALL RReview(NULL, NULL, NULL, NULL, NULL, NULL);
CALL UReview(1, NULL, 5, NULL, NULL, NULL, @result);
SELECT @result;
CALL DReview(1,@result);
SELECT @result;
SELECT * FROM Review;
#################################################





#OPENORDER
#################################################
CALL OpenOrder(1, 1, 1, 2, @result);
SELECT @result;
SELECT * FROM OrderP;
#################################################

#BUYPRODUCT
#################################################
CALL BuyProduct(1, 1, 5, @result);
CALL BuyProduct(1, 1, 6, @result);
SELECT @result;
SELECT * FROM OrderLine;
#################################################

#READLINE
#################################################
CALL ReadLine(2);
#################################################


