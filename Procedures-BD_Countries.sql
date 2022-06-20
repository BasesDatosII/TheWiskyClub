##################################################################################################
#CRUDS
##################################################################################################

##################################################################################################
# CRUD ProductType
##################################################################################################
DELIMITER //
CREATE PROCEDURE CProductType (IN pTypeName varchar(20), OUT result VARCHAR(16383))
BEGIN
	#CREATING A PRODUCT TYPE
	#CHECKING DATA TYPES AND WHAT THEY CONTAIN
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
	#READING PRODUCT TYPE DATABASE INFORMATION
	SELECT idProductType AS 'Product Type ID', typeName AS 'Product Type Name', isActive AS 'Active'
    FROM ProductType WHERE idProductType = IFNULL(pIdProductType, idProductType) AND typeName = IFNULL(pTypeName, typeName)
    AND isActive = IFNULL(pIsActive, isActive);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UProductType (IN pIdProductType INT, IN pTypeName varchar(20), IN pIsActive BIT, OUT result VARCHAR(16383))
BEGIN
	#UPDATING PRODUCT TYPE DATABASE INFORMATION
	SET result = "";
	#CHECKS IF PRODUCTTYPID EXISTS
    START TRANSACTION;
	IF (pIdProductType IS NOT NULL AND (SELECT COUNT(idProductType) FROM ProductType WHERE idProductType = pIdProductType) > 0) THEN
		BEGIN
			#UPDATING TYPENAME
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
            #UPDATING ACTIVE
            IF (pIsActive IS NOT NULL AND pIsActive = 1) THEN
				BEGIN
					#PRODUCT TYPE ACTIVE
					UPDATE ProductType SET isActive = pIsActive WHERE idProductType = pIdProductType;
                    #PRODUCTS WITH THAT PRODUCT TYPE ACTIVE
					UPDATE Product SET isActive = 1 WHERE idProductType = pIdProductType;
                    SET result = CONCAT(result, 'The Product Type is now active\n');
                END;
			END IF;
            SET result = CONCAT(result, 'Changes made successfully \n');
		END;
	ELSE
		SET result = "The Product Type ID can't be NULL or the ID specified doesn´t exists";
	END IF;
    COMMIT;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DProductType (IN pIdProductType INT, OUT result VARCHAR(16383))
BEGIN
	#DEACTIVATING PRODUCTTYPE
	IF ((SELECT COUNT(idProductType) FROM ProductType WHERE idProductType = pIdProductType) > 0) THEN
		BEGIN
			START TRANSACTION;
				#PRODUCT TYPE INACTIVE
				UPDATE ProductType SET isActive = 0 WHERE idProductType = pIdProductType;
                #PRODUCTS WITH THAT TYPE INACTIVE
                UPDATE Product SET isActive = 0 WHERE idProductType = pIdProductType;
                #INVENTORYS WITH PRODUCTS WITH THAT PRODUCT TYPE INACTIVE
                #UPDATE Inventory SET isActive = 0 WHERE idProduct IN (SELECT idProduct FROM Product WHERE idProductType = pIdProductType);
				SET result = "The Product Type is now inactive";
			COMMIT;
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
	#CREATING A SUPPLIER
    #CHECKING DATA TYPES AND WHAT THEY CONTAIN
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
	#READING SUPPLIER DATABASE INFORMATION
	SELECT idSupplier AS 'Supplier ID', supplierName AS 'Supplier Name', isActive AS 'Active'
    FROM Supplier WHERE idSupplier = IFNULL(pIdSupplier, idSupplier) AND supplierName = IFNULL(pSupplierName, SupplierName)
    AND isActive = IFNULL(pIsActive, isActive);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE USupplier (IN pIdSupplier INT, IN pSupplierName varchar(20), IN pIsActive BIT, OUT result VARCHAR(16383))
BEGIN
	#UPDATING SUPPLIER DATABASE INFORMATION
	SET result = "";
    #CHECKS IF SUPPLIER ID EXISTS
    START TRANSACTION;
	IF (pIdSupplier IS NOT NULL AND (SELECT COUNT(idSupplier) FROM Supplier WHERE idSupplier = pIdSupplier) > 0) THEN
		BEGIN
			#UPDATING SUPPLIER NAME
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
            #UPDATING SUPPLIER ISACTIVE
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
    COMMIT;
END //
DELIMITER 

DELIMITER //
CREATE PROCEDURE DSupplier (IN pIdSupplier INT, OUT result VARCHAR(16383))
BEGIN
	#DEACTIVATING SUPPLIER
	IF ((SELECT COUNT(idSupplier) FROM Supplier WHERE idSupplier = pIdSupplier) > 0) THEN
		BEGIN
			UPDATE Supplier SET isActive = 0 WHERE idSupplier = pIdSupplier;
            SET result = "The Supplier is now inactive";
        END;
	ELSE
		SET result = "The ID specified doesn´t exists";
	END IF;
END //
DELIMITER ;

##################################################################################################
# CRUD Cash
##################################################################################################
DELIMITER //
CREATE PROCEDURE CCash (IN pCashType VARCHAR(20), OUT result VARCHAR(16383))
BEGIN
	#CREATING CASH
    #CHECKING DATA TYPES AND WHAT THEY CONTAIN
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
	#READING CASH DATABASE INFORMATION
	SELECT idCash AS 'Cash ID', cashType AS 'Cash Type Name'
    FROM Cash WHERE idCash = IFNULL(pIdCash, idCash) AND cashType = IFNULL(pCashType, cashType);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UCash (IN pIdCash INT, IN pCashType VARCHAR(20), OUT result VARCHAR(16383))
BEGIN
	#UPDATING CASH DATABASE INFORMATION
	SET result = "";
    #CHECKS IF CASH ID EXISTS
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
	#DELETING CASH
	IF ((SELECT COUNT(idCash) FROM Cash WHERE idCash = pIdCash) > 0) THEN
		BEGIN
			DELETE FROM Cash WHERE idCash = pIdCash;
            SET result = "The Cash has been removed";
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
					IN pIdSupplier INT, IN pIdCash INT, IN pTier INT, IN pProductDescr VARCHAR(200), OUT result VARCHAR(16383))
BEGIN
	#CREATING PRODUCT
    #CHECKING DATA TYPES AND WHAT THEY CONTAIN
	IF (pProductName IS NOT NULL AND pCost IS NOT NULL AND pIdProductType IS NOT NULL AND pIdSupplier IS NOT NULL
		 IS NOT NULL AND pIdCash IS NOT NULL AND pTier IS NOT NULL AND pProductDescr IS NOT NULL) THEN
		BEGIN
			IF (pCost > 0 AND pTier BETWEEN 1 AND 3) THEN
				BEGIN
					IF ((SELECT COUNT(idProduct) FROM Product WHERE productName = pProductName) = 0) THEN
						BEGIN
							IF ((SELECT COUNT(idProductType) FROM ProductType WHERE idProductType = pIdProductType AND isActive = 1) > 0) THEN
								BEGIN
									IF ((SELECT COUNT(idSupplier) FROM Supplier WHERE idSupplier = pIdSupplier AND isActive = 1) > 0) THEN
										BEGIN
											IF ((SELECT COUNT(idCash) FROM Cash WHERE idCash = pIdCash) > 0) THEN
												BEGIN
													IF (pProductDescr != "") THEN
														BEGIN
															INSERT INTO Product (productName, cost, idProductType, image, idSupplier, idCash, isActive, entryDate, tier, productDescr)
															VALUES (pProductName, pCost, pIdProductType, pImage, pIdSupplier, pIdCash, 1, CURRENT_DATE(), pTier, pProductDescr);
                                                            #CREATES POPULAR PRODUCTS DATA FOR THIS PRODUCT
															CALL CPopularProducts(LAST_INSERT_ID(), @result);
															SET result = "The Product has been added";
														END;
													ELSE
														SET result = "The Product Description can't be empty";
													END IF;
												END;
											ELSE
												SET result = "The Cash ID specified doesn´t exists";
											END IF;
										END;
									ELSE
										SET result = "The Supplier ID specified doesn´t exists or is inactive";
									END IF;
								END;
							ELSE
								SET result = "The Product Type ID specified doesn´t exists or is inactive";
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
CREATE PROCEDURE RProduct (IN pIdProduct INT, IN pProductName VARCHAR(20), IN pCost DECIMAL(15,2), IN pIdProductType INT, IN pIdSupplier INT,
							IN pIdCash INT, IN pIsActive BIT, IN pEntryDate DATE,IN pTier INT, IN pProductDescr VARCHAR(200))
BEGIN
	#READING PRODUCT DATABASE INFORMATION
	SELECT idProduct AS 'Product ID', productName AS 'Product Name', cost AS 'Product Cost', idProductType AS 'Product Type ID', image AS 'Image', idSupplier AS 'Supplier ID',
		idCash AS 'Cash ID', isActive AS 'Active', entryDate AS 'Entry Date', tier AS 'Tier', productDescr AS 'Product Description'
    FROM Product WHERE idProduct = IFNULL(pIdProduct, idProduct) AND productName = IFNULL(pProductName, productName) AND cost = IFNULL(pCost, cost)
		AND idProductType = IFNULL(pIdProductType, idProductType) AND idSupplier = IFNULL(pIdSupplier, idSupplier)
		AND idCash = IFNULL(pIdCash, idCash) AND isActive = IFNULL(pIsActive, isActive) AND entryDate = IFNULL(pEntryDate, entryDate)
		AND tier = IFNULL(pTier, tier) AND productDescr = IFNULL(pProductDescr, productDescr);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UProduct (IN pIdProduct INT, IN pProductName VARCHAR(20), IN pCost DECIMAL(15,2), IN pIdProductType INT, IN pImage BLOB, IN pIdSupplier INT, 
							IN pIdCash INT, IN pIsActive BIT, IN pEntryDate DATE,IN pTier INT, IN pProductDescr VARCHAR(200), OUT result VARCHAR(16383))
BEGIN
	 #UPDATING PRODUCT DATABASE INFORMATION
	SET result = "";
    #CHECKS IF PRODUCT ID EXISTS
    START TRANSACTION;
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
					#PRODUCT ACTIVE
					UPDATE Product SET isActive = pIsActive WHERE idProduct = pIdProduct;
                    #INVENTORYS WITH THAT PRODUCT ACTIVE
					UPDATE Inventory SET isActive = 1 WHERE idProduct = pIdProduct;
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
            #UPDATING PRODUCT DESCRIPTION
            IF (pProductDescr IS NOT NULL) THEN
				BEGIN
					IF (pProductDescr != "") THEN
						BEGIN
							UPDATE Product SET productDescr = pProductDescr WHERE idProduct = pIdProduct;
							SET result = CONCAT(result, 'The Product Description has been modified\n');
						END;
					ELSE
						SET result = CONCAT(result, 'The Product Description can´t be empty\n');
					END IF;
                END;
			END IF;
            SET result = CONCAT(result, 'Changes made successfully \n');
		END;
	ELSE
		SET result = "The Product ID can't be NULL or the ID specified doesn´t exists";
	END IF;
    COMMIT;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DProduct (IN pIdProduct INT, OUT result VARCHAR(16383))
BEGIN
	#DEACTIVATING PRODUCT
	IF ((SELECT COUNT(idProduct) FROM Product WHERE idProduct = pIdProduct) > 0) THEN
		BEGIN
			START TRANSACTION;
				#PRODUCT INACTIVE
				UPDATE Product SET isActive = 0 WHERE idProduct = pIdProduct;
                #INVENTORYS WITH THAT PRODUCT INACTIVE
                UPDATE Inventory SET isActive = 0 WHERE idProduct = pIdProduct;
				SET result = "The Product is now inactive";
            COMMIT;
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
CREATE PROCEDURE CPresentation (IN pIdProduct INT, IN pAmountBottles INT, IN pSizeBottle INT, OUT result VARCHAR(16383))
BEGIN
	#CREATING A PRESENTATION
    #CHECKING DATA TYPES AND WHAT THEY CONTAIN
	IF (pIdProduct IS NOT NULL AND pAmountBottles IS NOT NULL AND pSizeBottle IS NOT NULL) THEN
		BEGIN
			IF ((SELECT COUNT(idProduct) FROM Product WHERE idProduct = pIdProduct) > 0) THEN
				BEGIN
					IF (pAmountBottles > 0 AND pSizeBottle > 0) THEN
						BEGIN
							IF ((SELECT COUNT(idPresentation) FROM Presentation WHERE idProduct = pIdProduct AND amountBottles = pAmountBottles AND sizeBottle = pSizeBottle) = 0) THEN
								BEGIN
									INSERT INTO Presentation (idProduct, amountBottles, sizeBottle) VALUES (pIdProduct, pAmountBottles, pSizeBottle);
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
				SET result = "The Product ID specified doesn´t exists";
			END IF;
		END;
	ELSE
		SET result = "Any of the parameters can't be NULL";
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE RPresentation (IN pIdPresentation INT, IN pIdProduct INT, IN pAmountBottles INT, IN pSizeBottle INT)
BEGIN
	#READING PRESENTATION DATABASE INFORMATION
	SELECT idPresentation AS 'Presentation ID', idProduct AS 'Product ID',
    amountBottles AS 'Amount of Bottles', sizeBottle AS 'Size of the Bottles'
    FROM Presentation WHERE idPresentation = IFNULL(pIdPresentation, idPresentation) AND idProduct = IFNULL(pIdProduct, idProduct)
    AND amountBottles = IFNULL(pAmountBottles, amountBottles) AND sizeBottle = IFNULL(pSizeBottle, sizeBottle);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UPresentation (IN pIdPresentation INT, IN pIdProduct INT, IN pAmountBottles INT, IN pSizeBottle INT, OUT result VARCHAR(16383))
BEGIN
	#UPDATING PRESENTATION DATABASE INFORMATION
	SET result = "";
    #CHECKS IF PRESENTATION ID EXISTS
	IF (pIdPresentation IS NOT NULL AND (SELECT COUNT(IdPresentation) FROM Presentation WHERE idPresentation = pIdPresentation) > 0) THEN
		BEGIN
			#UPDATE PRODUCT ID
            IF (pIdProduct IS NOT NULL) THEN
				BEGIN
					IF ((SELECT COUNT(idProduct) FROM Product WHERE idProduct = pIdProduct) > 0) THEN
						BEGIN
							UPDATE Presentation SET idProduct = pIdProduct WHERE idPresentation = pIdPresentation;
							SET result = CONCAT(result, 'The Product ID has been updated\n');
						END;
					ELSE
						SET result = CONCAT(result, 'The Product ID specified doesn´t exists\n');
					END IF;
				END;
			END IF;
			#UPDATE AMOUNT OF BOTTLES
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
            #UPDATE SIZE OF BOTTLES
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
	#DELETING PRESENTATION
	IF ((SELECT COUNT(idPresentation) FROM Presentation WHERE idPresentation = pIdPresentation) > 0) THEN
		BEGIN
			DELETE FROM Presentation WHERE idPresentation = pIdPresentation;
            SET result = "The Presentation has been removed";
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
	#CREATING LOCATION
    #CHECKING DATA TYPES AND WHAT THEY CONTAIN
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
	#READING LOCATION DATABASE INFORMATION
	SELECT idLocation AS 'Location ID', location AS 'Location', typeLocation AS 'Location Type'
    FROM Location WHERE idLocation = IFNULL(pIdLocation, idLocation) AND typeLocation = IFNULL(pTypeLocation, typeLocation)
    AND isActive = IFNULL(pIsActive, isActive);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE ULocation (IN pIdLocation INT, IN pLocation GEOMETRY, IN pTypeLocation BIT, IN pIsActive BIT, OUT result VARCHAR(16383))
BEGIN
	 #UPDATING LOCATION DATABASE INFORMATION
	SET result = "";
    #CHECKS IF LOCATION ID EXISTS
    START TRANSACTION;
	IF (pIdLocation IS NOT NULL AND (SELECT COUNT(idLocation) FROM Location WHERE idLocation = pIdLocation) > 0) THEN
		BEGIN
			#UPDATES LOCATION SPATIAL DATA
			IF (pLocation IS NOT NULL) THEN
				BEGIN
					UPDATE Location SET location = pLocation WHERE idLocation = pIdLocation;
					SET result = CONCAT(result, 'The Location has been modified\n');
				END;
			END IF;
            #UPDATES LOCATION TYPE
            IF (pTypeLocation IS NOT NULL) THEN
				BEGIN
					UPDATE Location SET typeLocation = pTypeLocation WHERE idLocation = pIdLocation;
					SET result = CONCAT(result, 'The Location Type has been modified\n');
				END;
			END IF;
            #UPDATES ACTIVE
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
    COMMIT;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DLocation (IN pIdLocation INT, OUT result VARCHAR(16383))
BEGIN
	#DEACTIVATING LOCATION
	IF ((SELECT COUNT(idLocation) FROM Location WHERE idLocation = pIdLocation) > 0) THEN
		BEGIN
			START TRANSACTION;
			UPDATE Location SET isActive = 0 WHERE idLocation = pIdLocation;
            SET result = "The Location is now inactive";
            COMMIT;
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
	#CREATING CLUB
    #CHECKING DATA TYPES AND WHAT THEY CONTAIN
	IF (pClubName IS NOT NULL AND pIdLocation IS NOT NULL AND pDeliveryCostProp IS NOT NULL AND pIdCash IS NOT NULL) THEN
	BEGIN
			IF ((SELECT COUNT(idClub) FROM Club WHERE clubName = pClubName) = 0) THEN
				BEGIN
					IF ((SELECT COUNT(idLocation) FROM Location WHERE idLocation = pIdLocation) > 0) THEN
						BEGIN
							IF ((SELECT typeLocation FROM Location WHERE idLocation = pIdLocation) = 1) THEN
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
								SET result = "The Location ID specified is of type ClientLocation";
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
	#READING CLUB DATABASE INFORMATION
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
	#UPDATING CLUB DATABASE INFORMATION
	SET result = "";
    #CHECKS IF CLUB ID EXISTS
    START TRANSACTION;
	IF (pIdClub IS NOT NULL AND (SELECT COUNT(idClub) FROM Club WHERE idClub = pIdClub) > 0) THEN
		BEGIN
			#UPDATING CLUB NAME
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
            #UPDATING CLUB LOCATION ID
            IF (pIdLocation IS NOT NULL) THEN
				BEGIN
					IF ((SELECT COUNT(idLocation) FROM Location WHERE idLocation = pIdLocation) > 0) THEN
						BEGIN
							IF ((SELECT typeLocation FROM Location WHERE idLocation = pIdLocation) = 1) THEN
								BEGIN
									UPDATE Club SET idLocation = pIdLocation WHERE idClub = pIdClub;
									SET result = CONCAT(result, 'The Location ID has been modified\n');
								END;
							ELSE
								SET result = "The Location ID specified is of type ClientLocation";
							END IF;
						END;
					ELSE
						SET result = CONCAT(result, 'The Location ID specified doesn´t exists\n');
					END IF;
                END;
			END IF;
            #UPDATING DELIVERY COST PROPORTION
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
            #UPDATING CASH ID
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
            #UPDATING ACTIVE
            IF (pIsActive IS NOT NULL AND pIsActive = 1) THEN
				BEGIN
					#CLUB ACTIVE
					UPDATE Club SET isActive = pIsActive WHERE idClub = pIdClub;
                    #LOCATION OF CLUB ACTIVE
                    UPDATE Location SET isActive = 0 WHERE idLocation = (
					SELECT idLocation FROM Club WHERE idClub = pIdClub);
					#INVENTORY'S OF THE CLUB ACTIVE
					UPDATE Inventory SET isActive = 0 WHERE idClub = pIdClub;
                    SET result = CONCAT(result, 'The Club is now active\n');
                END;
			END IF;
            SET result = CONCAT(result, 'Changes made successfully \n');
		END;
	ELSE
		SET result = "The Club ID can't be NULL or the ID specified doesn´t exists";
	END IF;
    COMMIT;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DClub (IN pIdClub INT, OUT result VARCHAR(16383))
BEGIN
	#DEACTIVATING CLUB
	IF ((SELECT COUNT(idClub) FROM Club WHERE idClub = pIdClub) > 0) THEN
		BEGIN
			START TRANSACTION;
			#CLUB INACTIVE
			UPDATE Club SET isActive = 0 WHERE idClub = pIdClub;
            #LOCATION INACTIVE
            UPDATE Location SET isActive = 0 WHERE idLocation = (
            SELECT idLocation FROM Club WHERE idClub = pIdClub);
            #INVENTORY INACTIVE
            UPDATE Inventory SET isActive = 0 WHERE idClub = pIdClub;
            SET result = "The Club is now inactive";
            COMMIT;
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
	#CREATING INVENTORY
    #CHECKING DATA TYPES AND WHAT THEY CONTAIN
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
	#READING INVENTORY DATABASE INFORMATION
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
	 #UPDATING INVENTORY DATABASE INFORMATION
	SET result = "";
    #CHECKS IF INVENTORY ID EXISTS
    START TRANSACTION;
	IF (pIdInventory IS NOT NULL AND (SELECT COUNT(idInventory) FROM Inventory WHERE idInventory = pIdInventory) > 0) THEN
		BEGIN
			#UPDATING CLUB ID
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
            #UPDATING PRODUCT ID
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
            #UPDATING STOCK
            IF (pStock IS NOT NULL) THEN
				BEGIN
					#IF STOCK > 0 ADDS MORE STOCK
					IF (pStock > 0) THEN
						BEGIN
							SET @ActAmount = (SELECT stock FROM Inventory WHERE idInventory = pIdInventory);
							UPDATE Inventory SET stock = (@ActAmount + pStock) WHERE idInventory = pIdInventory;
							SET result = CONCAT(result, 'The Stock has been modified\n');
						END;
					#IF STOCK = 0 RESETS STOCK
					ELSE
						BEGIN
							UPDATE Inventory SET stock = pStock WHERE idInventory = pIdInventory;
							SET result = CONCAT(result, 'The Stock has been reseted to 0\n');
                        END;
					END IF;
				END;
			END IF;
            #UPDATING ACTIVE
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
    COMMIT;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DInventory (IN pIdInventory INT, OUT result VARCHAR(16383))
BEGIN
	#DEACTIVATING INVENTORY
	IF ((SELECT COUNT(idInventory) FROM Inventory WHERE idInventory = pIdInventory) > 0) THEN
		BEGIN
			START TRANSACTION;
			UPDATE Inventory SET isActive = 0 WHERE idInventory = pIdInventory;
            SET result = "The Inventory is now inactive";
            COMMIT;
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
CREATE PROCEDURE CClientUser (IN pUserPassword BLOB, OUT result VARCHAR(16383))
BEGIN
	#CREATING CLIENT USER
    #CHECKING DATA TYPES AND WHAT THEY CONTAIN
	IF (pUserPassword IS NOT NULL) THEN
	BEGIN
		#VALIDATING THE USERS PASSWORD FORMAT
			##IF () THEN HERE GOES THE VALIDATION OF THE FORMAT
				BEGIN
					#ENCRYPTING USERS PASSWORD
					INSERT INTO ClientUser (userPassword, isActive) VALUES (AES_ENCRYPT(pUserPassword, 'Bases2'), 1);
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
CREATE PROCEDURE RClientUser (IN pIdClientUser INT, IN pUserPassword BLOB, IN pIsActive BIT)
BEGIN
	#READING CLIENT USER DATABASE INFORMATION
    #DECRYPTING CLIENT USER PASSWORD
	SELECT idClientUser AS 'Client User ID', AES_DECRYPT(userPassword, 'Bases2') AS 'User Password', isActive AS 'Active'
    FROM ClientUser WHERE idClientUser = IFNULL(pIdClientUser, idClientUser) AND userPassword = IFNULL(AES_DECRYPT(pUserPassword, 'Bases2'), userPassword)
    AND isActive = IFNULL(pIsActive, isActive);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UClientUser (IN pIdClientUser INT, IN pUserPassword BLOB, IN pIsActive BIT, OUT result VARCHAR(16383))
BEGIN
	 #UPDATING CLIENT USER DATABASE INFORMATION
	SET result = "";
    #CHECKS IF CLIENT USER ID EXISTS
    START TRANSACTION;
	IF (pIdClientUser IS NOT NULL AND (SELECT COUNT(idClientUser) FROM ClientUser WHERE idClientUser = pIdClientUser) > 0) THEN
		BEGIN
			#UPDATING USER PASSWORD
			IF (pUserPassword IS NOT NULL) THEN
				#VALIDATING USER PASSWORD FORMAT
				##IF () THEN HERE GOES THE VALIDATION OF THE FORMAT
					BEGIN
						#ENCRYPTING USER PASSWORD
						UPDATE ClientUser SET userPassword = AES_ENCRYPT(pUserPassword, 'Bases2') WHERE idClientUser = pIdClientUser;
						SET result = CONCAT('The Client User Password has been modified\n');
					END;
				#ELSE
					#SET result = CONCAT('The User Password format is incorrect\n');
				#END IF;
			END IF;
            #UPDATING ACTIVE
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
    COMMIT;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DClientUser (IN pIdClientUser INT, OUT result VARCHAR(16383))
BEGIN
	#DEACTIVATING CLIENT USER
	IF ((SELECT COUNT(idClientUser) FROM ClientUser WHERE idClientUser = pIdClientUser) > 0) THEN
		BEGIN
			START TRANSACTION;
				UPDATE ClientUser SET isActive = 0 WHERE idClientUser = pIdClientUser;
				SET result = "The Client User is now inactive";
				SET @ActId = (SELECT idClientPeople FROM ClientPeople WHERE idClientUser = pIdClientUser);
				#THIS CALL UNACTIVE CLIENT PEOPLE ID AND ALSO CALLS DINFOPEOPLE TO UNACTIVE INFO PEOPLE ID
				CALL DClientPeople (@ActId, @result);
			COMMIT;
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
	#CREATING INFO PEOPLE
    #CHECKING DATA TYPES AND WHAT THEY CONTAIN
	IF (pPeopleName IS NOT NULL AND pSurname IS NOT NULL AND pEmail IS NOT NULL AND pPhoneNumber IS NOT NULL AND pBirthDate IS NOT NULL) THEN
	BEGIN
			IF (pPeopleName != "") THEN
				BEGIN
					IF (pSurname != "") THEN
						BEGIN
							IF (pEmail != "") THEN
								BEGIN
									#CHECKS FOR A PHONE NUMBER OF 8 DIGITS
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
	#READING INFOPEOPLE DATABASE INFORMATION
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
	 #UPDATING INFOPEOPLE DATABASE INFORMATION
	SET result = "";
    #CHECKS IF INFOPEOPLE ID EXISTS
    START TRANSACTION;
	IF (pIdInfoPeople IS NOT NULL AND (SELECT COUNT(idInfoPeople) FROM InfoPeople WHERE idInfoPeople = pIdInfoPeople) > 0) THEN
		BEGIN
			#UPDATING PEOPLE NAME
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
            #UPDATING PEOPLE SURNAME
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
            #UPDATING EMAIL
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
            #UPDATING PHONE NUMBER
            IF (pPhoneNumber IS NOT NULL) THEN
				BEGIN
					#FHECKS FOR PHONE NUMBER OF 8 DIGITS
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
            #UPDATING BIRTH DATE
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
            #UPDATING ACTIVE
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
    COMMIT;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DInfoPeople (IN pIdInfoPeople INT, OUT result VARCHAR(16383))
BEGIN
	#DEACTIVATING INFOPEOPLE
	IF ((SELECT COUNT(idInfoPeople) FROM InfoPeople WHERE idInfoPeople = pIdInfoPeople) > 0) THEN
		BEGIN
			UPDATE InfoPeople SET isActive = 0 WHERE idInfoPeople = pIdInfoPeople;
            SET result = "The Client Information is now inactive";
            
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
	#CREATING CLIENT PEOPLE
    #CHECKING DATA TYPES AND WHAT THEY CONTAIN
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
	#READING CLIENT PEOPLE DATABASE INFORMATION
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
	 #UPDATING CLIENT PEOPLE DATABASE INFORMATION
	SET result = "";
    #CHECKS IF CLIENT PEOPLE EXISTS
	START TRANSACTION;
	IF (pIdClientPeople IS NOT NULL AND (SELECT COUNT(idClientPeople) FROM ClientPeople WHERE idClientPeople = pIdClientPeople) > 0) THEN
		BEGIN
			#UPDATING CLIENT USER ID
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
            #UPDATING INFO PEOPLE
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
            #UPDATING SALES COUNTER
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
            #UPDATING ACTIVE
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
    COMMIT;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DClientPeople (IN pIdClientPeople INT, OUT result VARCHAR(16383))
BEGIN
	#DEACTIVATING CLIENT PEOPLE
	IF ((SELECT COUNT(idClientPeople) FROM ClientPeople WHERE idClientPeople = pIdClientPeople) > 0) THEN
		BEGIN
			#CLIENT PEOPLE INACTIVE
			UPDATE ClientPeople SET isActive = 0 WHERE idClientPeople = pIdClientPeople;
            #CALLS DINFOPEOPLE TO DEACTIVATE INFO PEOPLE OF THIS CLIENT
            SET @ActId = (SELECT idInfoPeople FROM ClientPeople WHERE idClientPeople = pIdClientPeople);
            CALL DInfoPeople(@ActId, @result);
            SET result = "The Client Information is now inactive";
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
	#CREATING CARD
    #CHECKING DATA TYPES AND WHAT THEY CONTAIN
	IF (pIdClientUser IS NOT NULL AND pCardNumber IS NOT NULL AND pExpirationDate IS NOT NULL AND pCVV IS NOT NULL) THEN
		BEGIN
			IF ((SELECT COUNT(idClientUser) FROM ClientUser WHERE idClientUser = pIdClientUser) > 0) THEN
				BEGIN
					#CHECKS CARD NUMBER LENGTH
					IF (CHAR_LENGTH(pCardNumber) BETWEEN 13 AND 18) THEN
						BEGIN
							IF ((SELECT COUNT(cardNumber) FROM Card WHERE cardNumber = pCardNumber) = 0) THEN
								BEGIN
									IF (pExpirationDate > CURRENT_DATE()) THEN
										BEGIN
											#CHECKS CVV LENGTH
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
	#READING CARD DATABASE INFORMATION
	SELECT idCard AS 'Card ID', idInfoPeople AS 'Info People ID', cardNumber AS 'Card Number',
		expirationDate AS 'Expiration Date', cvv AS 'CVV'
    FROM Card WHERE idCard = IFNULL(pIdCard, idCard) AND idInfoPeople = IFNULL(pIdInfoPeople, idInfoPeople)
    AND cardNumber = IFNULL(pCardNumber, cardNumber) AND expirationDate = IFNULL(pExpirationDate, expirationDate);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UCard (IN pIdCard INT, IN pIdInfoPeople INT, IN pCardNumber INT, IN pExpirationDate DATE, IN pCVV INT, OUT result VARCHAR(16383))
BEGIN
	 #UPDATING CARD DATABASE INFORMATION
	SET result = "";
    #CHECKS IF CARD ID EXISTS
	IF (pIdCard IS NOT NULL AND (SELECT COUNT(idCard) FROM Card WHERE idCard = pIdCard) > 0) THEN
		BEGIN
			#UPDATING INFO PEOPLE ID
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
            #UPDATING CARD NUMBER
            IF (pCardNumber IS NOT NULL) THEN
				BEGIN
					#CHECKS CARD LENGTH
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
            #UPDATING EXPIRATION DATE
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
            #UPDATING CVV
			IF (pCVV IS NOT NULL) THEN
				BEGIN
					#CHECKS CVV LENGTH
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
	#DELETING CARD
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
	#CREATING CLIENT LOCATION
    #CHECKING DATA TYPES AND WHAT THEY CONTAIN
	IF (pIdClientUser IS NOT NULL AND pIdLocation IS NOT NULL) THEN
		BEGIN
			IF ((SELECT COUNT(idClientUser) FROM ClientUser WHERE idClientUser = pIdClientUser) > 0) THEN
				BEGIN
					IF ((SELECT COUNT(idLocation) FROM Location WHERE idLocation = pIdLocation) > 0) THEN
						BEGIN
							IF ((SELECT typeLocation FROM Location WHERE idLocation = pIdLocation) = 0) THEN
								BEGIN
									INSERT INTO ClientLocation (idClientPeople, idLocation) VALUES
									((SELECT idClientPeople FROM ClientUser CU INNER JOIN ClientPeople CP ON CU.idClientUser = CP.idClientUser
										WHERE CP.idClientUser = pIdClientUser), pIdLocation);
									SET result = "The Client Location has been added";
								END;
							ELSE
								SET result = "The Location ID specified is of type Club";
							END IF;
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
	#READING CLIENT LOCATION DATABASE INFORMATION
	SELECT idClientLocation AS 'Client Location ID', idClientPeople AS 'Client People ID', idLocation AS 'Location ID'
    FROM ClientLocation WHERE idClientLocation = IFNULL(pIdClientLocation, idClientLocation)
    AND idClientPeople = IFNULL(pIdClientPeople, idClientPeople)
    AND idLocation = IFNULL(pIdLocation, idLocation);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UClientLocation (IN pIdClientLocation INT, IN pIdClientPeople INT, IN pIdLocation INT, OUT result VARCHAR(16383))
BEGIN
	 #UPDATING CLIENT LOCATION DATABASE INFORMATION
	SET result = "";
    #CHECKS IF CLIENT LOCATION ID EXISTS
	IF (pIdClientLocation IS NOT NULL AND (SELECT COUNT(idClientLocation) FROM ClientLocation WHERE idClientLocation = pIdClientLocation) > 0) THEN
		BEGIN
			#UPDATING CLIENT PEOPLE ID
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
            #UPDATING LOCATION ID
            IF (pIdLocation IS NOT NULL) THEN
				BEGIN
					IF ((SELECT COUNT(idLocation) FROM Location WHERE idLocation = pIdLocation) > 0) THEN
						BEGIN
							#CHECKS TYPE OF THE LOCATION
							IF ((SELECT typeLocation FROM Location WHERE idLocation = pIdLocation) = 0) THEN
								BEGIN
									UPDATE ClientLocation SET idLocation = pIdLocation WHERE idClientLocation = pIdClientLocation;
									SET result = CONCAT(result, 'The Client Location ID has been modified\n');
								END;
							ELSE
								SET result = "The Location ID specified is of type Club";
							END IF;
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
	#DELETING CLIENT LOCATION
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
	#CREATING MEMBERSHIP
    #CHECKING DATA TYPES AND WHAT THEY CONTAIN
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
	#READING MEMBERSHIP DATABASE INFORMATION
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
	 #UPDATING MEMBERSHIP DATABASE INFORMATION
	SET result = "";
    #CHECKS IF MEMBERSHIP ID EXISTS
    START TRANSACTION;
	IF (pIdMembership IS NOT NULL AND (SELECT COUNT(idMembership) FROM Membership WHERE idMembership = pIdMembership) > 0) THEN
		BEGIN
			#UPDATING MEMBERSHIP NAME
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
            #UPDATING COST
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
            #UPDATING PRODUCT DISCOUNT
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
            #DELIVERY DISCOUNT
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
            #UPDATING ACTIVE
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
    COMMIT;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DMembership (IN pIdMembership INT, OUT result VARCHAR(16383))
BEGIN
	#DEACTIVATING MEMBERSHIP
	IF ((SELECT COUNT(idMembership) FROM Membership WHERE idMembership = pIdMembership) > 0) THEN
		BEGIN
			START TRANSACTION;
			UPDATE Membership SET isActive = 0 WHERE idMembership = pIdMembership;
            SET result = "The Client Information is now inactive";
            COMMIT;
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
	#CREATING CLIENT MEMBERSHIP
    #CHECKING DATA TYPES AND WHAT THEY CONTAIN
	IF (pIdMembership IS NOT NULL AND pIdClientUser IS NOT NULL) THEN
	BEGIN
			IF ((SELECT COUNT(idMembership) FROM Membership WHERE idMembership = pIdMembership) > 0) THEN
				BEGIN
					IF ((SELECT COUNT(idClientUser) FROM ClientUser WHERE idClientUser = pIdClientUser) > 0) THEN
						BEGIN
							#CHECKS IF CLIENT ALREADY HAS A MEMBERSHIP
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
	#READING CLIENT MEMBERSHIP DATABASE INFORMATION
	SELECT idClientMembership AS 'Client Membership ID', idMembership AS 'Membership ID',
    idClientPeople AS 'Client People ID'
    FROM ClientMembership WHERE idClientMembership = IFNULL(pIdClientMembership, idClientMembership)
    AND idMembership = IFNULL(pIdMembership, idMembership) AND idClientPeople = IFNULL(pIdClientPeople, idClientPeople);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UClientMembership (IN pIdClientMembership INT, IN pIdMembership INT, IN pIdClientPeople INT, OUT result VARCHAR(16383))
BEGIN
	#UPDATING CLIENT MEMBERSHIP
	SET result = "";
    #CHECKS IF CLIENT MEMBERSHIP ID EXISTS
    START TRANSACTION;
	IF (pIdClientMembership IS NOT NULL AND (SELECT COUNT(idClientMembership) FROM ClientMembership WHERE idClientMembership = pIdClientMembership) > 0) THEN
		BEGIN
			#UPDATING MEMBERSHIP ID
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
            #UPDATING CLIENT PEOPLE ID
            IF (pIdClientPeople IS NOT NULL) THEN
				BEGIN
					IF ((SELECT COUNT(idClientPeople) FROM ClientPeople WHERE idClientPeople = pIdClientPeople) > 0) THEN
						BEGIN
							#CHECKS IF CLIENT ALREADY HAS A MEMBERSHIP
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
    COMMIT;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DClientMembership (IN pIdClientMembership INT, OUT result VARCHAR(16383))
BEGIN
	#DELETING CLIENT MEMBERSHIP
	IF ((SELECT COUNT(idClientMembership) FROM ClientMembership WHERE idClientMembership = pIdClientMembership) > 0) THEN
		BEGIN
			START TRANSACTION;
			DELETE FROM ClientMembership WHERE idClientMembership = pIdClientMembership;
            SET result = "The Client Membership has been removed";
            COMMIT;
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
	#CREATING WORKER REVIEW
    #CHECKING DATA TYPES AND WHAT THEY CONTAIN
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
	#READING WORKER REVIEW DATABASE INFORMATION
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
	 #UPDATING WORKER REVIEW DATABASE INFORMATION
	SET result = "";
    #CHECKS IF WORKER REVIEW ID EXISTS
    START TRANSACTION;
	IF (pIdWorkerReview IS NOT NULL AND (SELECT COUNT(idWorkerReview) FROM WorkerReview WHERE idWorkerReview = pIdWorkerReview) > 0) THEN
		BEGIN
			#UPDATING CLIENT USER ID
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
            #UPDATING WORKER ID
            IF (pIdWorker IS NOT NULL) THEN
				BEGIN
					UPDATE WorkerReview SET idWorker = pIdWorker WHERE idWorkerReview = pIdWorkerReview;
					SET result = CONCAT(result, 'The Worker ID has been modified\n');
				END;
			END IF;
            #UPDATING DATE OF REVIEW
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
    COMMIT;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DWorkerReview (IN pIdWorkerReview INT, OUT result VARCHAR(16383))
BEGIN
	#DELETING WORKER REVIEW
	IF ((SELECT COUNT(idWorkerReview) FROM WorkerReview WHERE idWorkerReview = pIdWorkerReview) > 0) THEN
		BEGIN
			START TRANSACTION;
            #DELETING QUALIFICATIONS FOR THAT WORKER REVIEW
            DELETE FROM Qualification WHERE idWorkerReview = pIdWorkerReview;
			#DELETING COMPLAINTS FOR THAT WORKER REVIEW
			DELETE FROM Complaint WHERE idWorkerReview = pIdWorkerReview;
            #DELETING WORKER REVIEW
			DELETE FROM WorkerReview WHERE idWorkerReview = pIdWorkerReview;
            SET result = "The Worker Review has been removed";
            COMMIT;
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
	#CREATING QUALIFICATION
    #CHECKING DATA TYPES AND WHAT THEY CONTAIN
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
	#READING QUALIFICATION DATABASE INFORMATION
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
	 #UPDATING QUALIFICATION DATABASE INFORMATION
	SET result = "";
    #CHECKS IF QUALIFICATION ID EXISTS
    START TRANSACTION;
	IF (pIdQualification IS NOT NULL AND (SELECT COUNT(idQualification) FROM Qualification WHERE idQualification = pIdQualification) > 0) THEN
		BEGIN
			#UPDATING WORKER REVIEW ID
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
            #UPDATING QUALIFICATION DESCRIPTION
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
    COMMIT;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DQualification (IN pIdQualification INT, OUT result VARCHAR(16383))
BEGIN
	#DELETING QUALIFICATION
	IF ((SELECT COUNT(idQualification) FROM Qualification WHERE idQualification = pIdQualification) > 0) THEN
		BEGIN
			START TRANSACTION;
			DELETE FROM Qualification WHERE idQualification = pIdQualification;
            SET result = "The Qualification has been removed";
            COMMIT;
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
	#CREATING COMPLAINT
    #CHECKING DATA TYPES AND WHAT THEY CONTAIN
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
	#READING COMPLAINT DATABASE INFORMATION
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
	 #UPDATING COMPLAINT DATABASE INFORMATION
	SET result = "";
    #CHECKS IF COMPLAINT ID EXISTS
    START TRANSACTION;
	IF (pIdComplaint IS NOT NULL AND (SELECT COUNT(idComplaint) FROM Complaint WHERE idComplaint = pIdComplaint) > 0) THEN
		BEGIN
			#UPDATING WORKER REVIEW ID
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
            #UPDATING COMPLAINT DESCRIPTION
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
            #UPDATING IF IT IS SOLVED
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
    COMMIT;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DComplaint (IN pIdComplaint INT, OUT result VARCHAR(16383))
BEGIN
	#DELETING COMPLAINT
	IF ((SELECT COUNT(idComplaint) FROM Complaint WHERE idComplaint = pIdComplaint) > 0) THEN
		BEGIN
			START TRANSACTION;
			DELETE FROM Complaint WHERE idComplaint = pIdComplaint;
            SET result = "The Complaint has been removed";
            COMMIT;
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
	#CREATING REVIEW
	IF (pIdProduct IS NOT NULL AND pScore IS NOT NULL AND pRevDescription IS NOT NULL AND pIdClientUser IS NOT NULL) THEN
		BEGIN
			IF ((SELECT COUNT(idProduct) FROM Product WHERE idProduct = pIdProduct) > 0) THEN
				BEGIN
					#CHECKS IF SCORE IS VALID (ONLY CAN BE 1,2,3,4 OR 5)
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
	#READING REVIEW DATABASE INFORMATION
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
	 #UPDATING REVIEW DATABASE INFORMATION
	SET result = "";
    #CHECKS IF REVIEW ID EXISTS
    START TRANSACTION;
	IF (pIdReview IS NOT NULL AND (SELECT COUNT(idReview) FROM Review WHERE idReview = pIdReview) > 0) THEN
		BEGIN
			#UPDATING PRODUCT ID
			IF (pIdProduct IS NOT NULL) THEN
				BEGIN
					IF ((SELECT COUNT(idProduct) FROM Product WHERE idProduct = pIdProduct) > 0) THEN
						BEGIN
							#CHECKS IF CLIENT USER ID DOESN´T ALREADY HAVE A REVIEW FOR THIS PRODUCT
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
            #UPDATES SCORE
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
            #UPDATES REVIEW DESCRIPTION
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
            #UPDATES CLIENT USER ID
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
            #UPDATES REVIEW DATE
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
    COMMIT;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DReview (IN pIdReview INT, OUT result VARCHAR(16383))
BEGIN
	#DELETING REVIEW
	IF ((SELECT COUNT(idReview) FROM Review WHERE idReview = pIdReview) > 0) THEN
		BEGIN
			START TRANSACTION;
			DELETE FROM Review WHERE idReview = pIdReview;
            SET result = "The Review has been removed";
            COMMIT;
        END;
	ELSE
		SET result = "The Review ID specified doesn´t exists";
	END IF;
END //
DELIMITER ;

##################################################################################################
# CRUD PopularProducts
##################################################################################################

DELIMITER //
CREATE PROCEDURE CPopularProducts (IN pIdProduct INT, OUT result VARCHAR(16383))
BEGIN
	#CREATING POPULAR PRODUCTS
    #CHECKING DATA TYPES AND WHAT THEY CONTAIN
	IF (pIdProduct IS NOT NULL) THEN
		BEGIN
			IF ((SELECT COUNT(idProduct) FROM Product WHERE idProduct = pIdProduct) > 0) THEN
				BEGIN
					#CHECKS IF THE PRODUCT ALREADY HAS A POPULAR PRODUCTS ROW
					IF ((SELECT COUNT(idPopularProducts) FROM PopularProducts WHERE idProduct = pIdProduct) = 0) THEN
						BEGIN
							INSERT INTO PopularProducts (idProduct) VALUES (pIdProduct);
							SET result = "The Popular Product has been added";
						END;
					ELSE
						SET result = "The Product ID specified already has a Popular Product Data for this product";
                    END IF;
				END;
			ELSE
				SET result = "The Popular Product ID specified doesn´t exists";
			END IF;
		END;
	ELSE
		SET result = "Any of the parameters can't be NULL";
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE RPopularProducts (IN pIdPopularProducts INT, IN pIdProduct INT, IN pAmount INT)
BEGIN
	#READING POPULAR PRODUCTS DATABASE INFORMATION
	SELECT idPopularProducts AS 'Popular Products ID', idProduct AS 'Product ID', amount AS 'Amount Sold'
    FROM PopularProducts WHERE idPopularProducts = IFNULL(pIdPopularProducts, idPopularProducts)
    AND idProduct = IFNULL(pIdProduct, idProduct) AND amount = IFNULL(pAmount, amount);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UPopularProducts (IN pIdPopularProducts INT, IN pIdProduct INT, IN pAmount INT, OUT result VARCHAR(16383))
BEGIN
	 #UPDATING POPULAR PRODUCTS DATABASE INFORMATION
	SET result = "";
    #CHECKS IF POPULAR PRODUCTS ID EXISTS
    START TRANSACTION;
	IF ((pIdPopularProducts IS NOT NULL AND (SELECT COUNT(idPopularProducts) FROM PopularProducts WHERE idPopularProducts = pIdPopularProducts) > 0) OR
		#IT CAN ALSO BE UPDATED BY THE PRODUCT ID (ONLY IN THE AMOUNT CASE)
		(pIdProduct IS NOT NULL AND (SELECT COUNT(idPopularProducts) FROM PopularProducts WHERE idProduct = pIdProduct) > 0)) THEN
		BEGIN
			#UPDATING PRODUCT ID
			IF (pIdProduct IS NOT NULL) THEN
				BEGIN
					IF ((SELECT COUNT(idProduct) FROM Product WHERE idProduct = pIdProduct) > 0) THEN
						BEGIN
							#CHECKS IF THE PRODUCT ALREADY HAS A POPULAR PRODUCTS ROW
							IF ((SELECT COUNT(idPopularProducts) FROM PopularProducts WHERE idProduct = pIdProduct) = 0) THEN
								BEGIN
									UPDATE PopularProducts SET idProduct = pIdProduct WHERE idPopularProducts = pIdPopularProducts;
									SET result = CONCAT(result, 'The Product ID has been modified\n');
								END;
							ELSE
								SET result = CONCAT('The Product ID specified already has a Popular Product Data for this product\n');
							END IF;
						END;
					ELSE
						SET result = CONCAT('The Product ID specified doesn´t exists\n');
					END IF;
                END;
			END IF;
            IF (pAmount IS NOT NULL) THEN
				BEGIN
					IF (pAmount >= 0) THEN
						BEGIN
                            #DECIDES THE MESSAGE AND OPERATION TO RETURN BASED ON THE PAMOUNT PARAMETER
							IF (pAmount > 0) THEN
								BEGIN
									#CHECKS ACTUAL AMOUNT DEPENDING ON KEY IDPOPULARPRODUCTS
                                    IF (pIdPopularProducts IS NOT NULL) THEN
										BEGIN
											SET @ActAmount = (SELECT amount FROM PopularProducts WHERE idPopularProducts = pIdPopularProducts);
											UPDATE PopularProducts SET amount = (@ActAmount + pAmount)
											WHERE idPopularProducts = pIdPopularProducts;
										END;
									#CHECKS ACTUAL AMOUNT DEPENDING ON KEY IDPRODUCT
									ELSE IF (pIdProduct IS NOT NULL) THEN
										BEGIN
											SET @ActAmount = (SELECT amount FROM PopularProducts WHERE idProduct = pIdProduct);
											UPDATE PopularProducts SET amount = (@ActAmount + pAmount)
											WHERE idProduct = pIdProduct;
										END;
									END IF;
									END IF;
									SET result = CONCAT(result, 'The Amount has been modified\n');
								END;
							ELSE
								BEGIN
									UPDATE PopularProducts SET amount = pAmount WHERE idPopularProducts = pIdPopularProducts;
									SET result = CONCAT(result, 'The Amount has been reseted to 0\n');
								END;
							END IF;
						END;
					ELSE
						SET result = CONCAT('The Amount needs to be greater or equal than 0\n');
					END IF;
				END;
			END IF;
            SET result = CONCAT(result, 'Changes made successfully \n');
		END;
	ELSE
		SET result = "The Popular Products ID AND the Product ID can't be NULL or the ID specified doesn´t exists";
	END IF;
    COMMIT;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DPopularProducts (IN pIdPopularProducts INT, OUT result VARCHAR(16383))
BEGIN
	#DELETING POPULAR PRODUCTS
	IF ((SELECT COUNT(idPopularProducts) FROM PopularProducts WHERE idPopularProducts = pIdPopularProducts) > 0) THEN
		BEGIN
			START TRANSACTION;
			DELETE FROM PopularProducts WHERE idPopularProducts = pIdPopularProducts;
            SET result = "The Popular Products has been removed";
            COMMIT;
        END;
	ELSE
		SET result = "The Popular Products ID specified doesn´t exists";
	END IF;
END //
DELIMITER ;


##################################################################################################
#PROCEDURES
##################################################################################################
#CALCULATE DELIVERY COST
DELIMITER //
CREATE PROCEDURE CalculateDeliveryC(IN pIdClientUser INT, IN pIdClientLocation INT, IN pIdClub INT, OUT deliveryCost DECIMAL(15,2))
BEGIN
	SET deliveryCost = (SELECT (deliveryCostProp * (SELECT ST_DISTANCE(
    #GEOGRAPHY FOR CLUB LOCATION
    (SELECT location FROM Location L INNER JOIN Club C ON L.idLocation = C.idLocation WHERE idClub = pIdClub)
    #GEOGRAPHY FOR CLIENT LOCATION
    ,(SELECT location FROM Location L INNER JOIN ClientLocation CL ON L.idLocation = CL.idLocation
		INNER JOIN ClientPeople CP ON CL.idClientPeople = CP.idClientPeople
        INNER JOIN ClientUser CU ON CP.idClientUser = CU.idClientUser
		WHERE CU.idClientUser = pIdClientUser AND CL.idClientLocation = pIdClientLocation)))) FROM Club WHERE idClub = pIdClub);
END //
DELIMITER ;

#UPDATE CLIENT SALES COUNTER
DELIMITER //
CREATE PROCEDURE UClientSalesCounter (IN pIdClientUser INT, IN pAmount INT)
BEGIN
	#SETS NEW AMOUNT
	SET @ActAmount = (SELECT salesCounter FROM ClientPeople CP INNER JOIN ClientUser CU ON CP.idClientUser = CU.idClientUser
		WHERE CU.idClientUser = pIdClientUser);
	#GETS CLIENT PEOPLE ID 
	SET @ActId = (SELECT idClientPeople FROM ClientPeople CP INNER JOIN ClientUser CU ON CP.idClientUser = CU.idClientUser
		WHERE CU.idClientUser = pIdClientUser);
	#UPDATES SALES COUNTER
	UPDATE ClientPeople SET salesCounter = (@ActAmount + pAmount) WHERE idClientPeople = @ActId;
END //
DELIMITER ;

#OPEN ORDER
DELIMITER //
CREATE PROCEDURE OpenOrder(IN pIdClientUser INT, IN pIdClientLocation INT, IN pIdClub INT, IN pIdEmployer INT, IN pIdMailer INT, OUT result VARCHAR(16383))
BEGIN
	#PROCEDURE TO OPEN AN ORDER
	#CHECKING DATA TYPES AND WHAT THEY CONTAIN
	IF (pIdClientUser IS NOT NULL AND pIdClientLocation IS NOT NULL AND pIdClub IS NOT NULL AND pIdEmployer IS NOT NULL AND pIdMailer IS NOT NULL) THEN
		BEGIN
			IF ((SELECT COUNT(idClientUser) FROM ClientUser WHERE idClientUser = pIdClientUser) > 0) THEN
				BEGIN
					IF ((SELECT COUNT(idClientLocation) FROM ClientLocation CL INNER JOIN ClientPeople CP ON CL.idClientPeople = CP.idClientPeople
						INNER JOIN ClientUser CU ON CP.idClientUser = CU.idClientUser WHERE CU.idClientUser = pIdClientUser AND idClientLocation = pIdClientLocation) > 0) THEN
						BEGIN
							IF ((SELECT COUNT(idClub) FROM Club WHERE idClub = pIdClub) > 0) THEN
								BEGIN
									#CALCULATES DELIVERY COST AND STORES IT IN SYSTEM VARIABLE @deliveryCost
									CALL CalculateDeliveryC (pIdClientUser, pIdClientLocation, pIdClub, @deliveryCost);
									INSERT INTO OrderP (idClientPeople, orderDate, idClub, idEmployer, idMailer, deliveryCost) VALUES
									((SELECT idClientPeople FROM ClientUser CU INNER JOIN ClientPeople CP ON CU.idClientUser = CP.idClientUser WHERE CP.idClientUser = pIdClientUser),
									CURRENT_DATE(), pIdClub, pIdEmployer, pIdMailer, @deliveryCost);
                                    #RETURNS ORDERP ID
									SET result = LAST_INSERT_ID();
								END;
							ELSE
								SET result = "The Club ID specified doesn´t exists";
							END IF;
						END;
					ELSE
						SET result = "The Client Location ID specified doesn´t exists or is from another Client";
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
	#PROCEDURE TO BUT A PRODUCT
	#CHECKING DATA TYPES AND WHAT THEY CONTAIN
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
                                        #CHECKS IF THE PRODUCT IN THAT CLUB IS AVAILABLE
										IF ((SELECT isActive FROM Inventory WHERE idProduct = pIdProduct AND idClub = @idClub) = 1) THEN
											BEGIN
												#SETS THE NEW AMOUNT OF THE INVENTORY
												SET @ActAmount = (SELECT stock - pAmount FROM Inventory WHERE idProduct = pIdProduct AND idClub = @idClub);
                                                #IF < 0, THE STOCK DOESN'T IS ENOUGH
												IF (@ActAmount >= 0) THEN
													BEGIN
														#CHECKS IF THE PRODUCT IS ALREADY IN THE ORDER AND UPDATES THE VALUE IF IT IS
                                                        IF ((SELECT COUNT(idOrderLine) FROM OrderLine WHERE idOrderp = pIdOrderP AND idProduct = pIdProduct) > 0) THEN
																UPDATE OrderLine SET amount = (amount + pAmount) WHERE idOrderp = pIdOrderP AND idProduct = pIdProduct;
														ELSE
															INSERT INTO OrderLine (idOrderP, idProduct, cost, amount) VALUES
															(pIdOrderP, pIdProduct, (SELECT cost FROM Product WHERE idProduct = pIdProduct), pAmount);
														END IF;
														UPDATE Inventory SET stock = @ActAmount WHERE idProduct = pIdProduct AND idClub = @idClub;
                                                        #UPDATES POPULAR PRODUCT SALES
                                                        IF ((SELECT COUNT(idPopularProducts) FROM PopularProducts WHERE idProduct = pIdProduct) = 0) THEN
															CALL CPopularProducts(pIdProduct, @result);
														END IF;
                                                        #UPDATES POPULAR PRODUCTS ROW FOR THIS PRODUCT
                                                        CALL UPopularProducts(NULL, pIdProduct, pAmount, @result);
                                                        #UPDATES CLIENT SALES COUNTER
                                                        CALL UClientSalesCounter ((SELECT CU.idClientUser FROM ClientPeople CP INNER JOIN ClientUser CU
															ON CP.idClientUser = CU.idClientUser WHERE idClientPeople = 
                                                            (SELECT idClientPeople FROM OrderP WHERE idOrderP = pIdOrderP)), pAmount);
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
	#READS THE LINES OF AN SPECIFIC ORDERP ID
	SELECT idOrderLine AS 'Order Line ID', idProduct AS 'Product ID',
		cost AS 'Cost', amount AS 'Amount' FROM OrderLine WHERE idOrderP = pIdOrderP;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE ProductQuery (IN pIdProductType INT, IN pProductName VARCHAR(20), IN pCost DECIMAL(15,2),
	IN pIsActive BIT, IN pIdLocation INT, IN pOrder BIT, IN pQueryType BIT)
BEGIN
	#INFO OF THE PRODUCT
	SELECT P.idProduct AS 'Product ID', productName AS 'Product Name', cost AS 'Product Cost', typeName AS 'Product Type', image AS 'Image', supplierName AS 'Supplier',
		P.isActive AS 'Active', entryDate AS 'Entry Date', tier AS 'Tier', productDescr AS 'Product Description', C.clubName AS 'Club Name', ST_DISTANCE(L1.location, L2.location) AS 'Distance Between Location and Products',
        amount AS 'Amount of Sales'
	#REFERENCE OF ALL THE PRODUCTS WITH AN INVENTORY
	FROM Product P INNER JOIN PopularProducts PP ON P.idProduct = PP.idProduct INNER JOIN ProductType PT ON P.idProductType = PT.idProductType
    INNER JOIN Supplier S ON P.idSupplier = S.idSupplier INNER JOIN Inventory I ON I.idProduct = P.idProduct
    INNER JOIN Club C ON I.idClub = C.idClub INNER JOIN Location L1 ON C.idLocation = L1.idLocation,
    #REFERENCE OF A PARTICULAR LOCATION 
    Location L2
    #OPTIONAL PARAMETERES (ONLY pIdLocation NEEDS TO BE GIVED OR THE QUERY IS GOING TO BE EMPTY, NEEDS A REFERENCE LOCATION)
    WHERE productName = IFNULL(pProductName, productName) AND cost = IFNULL(pCost, cost)
		AND P.idProductType = IFNULL(pIdProductType, P.idProductType) AND P.isActive = IFNULL(pIsActive, P.isActive)
        AND L2.idLocation = pIdLocation
	#ORDER BY DEPENDING ON ASC, DESC AND BY DISTANCE OR POPULAR PRODUCTS
	ORDER BY
		(CASE WHEN pOrder = 1 AND pQueryType = 1 THEN ST_DISTANCE(L1.location, L2.location) END) ASC,
        (CASE WHEN pOrder = 0 AND pQueryType = 1 THEN ST_DISTANCE(L1.location, L2.location) END) DESC,
        (CASE WHEN pOrder = 1 AND pQueryType = 0 THEN amount END) ASC,
        (CASE WHEN pOrder = 0 AND pQueryType = 0 THEN amount END) DESC
    ;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE BillQuery (IN pIdOrderP INT)
BEGIN
	SELECT productName, amount, OL.cost, SUM(amount*OL.cost) AS 'Total Cost'
	FROM OrderP OP INNER JOIN OrderLine OL ON OP.idOrderP = OL.idOrderP
    INNER JOIN Product P ON P.idProduct = OL.idProduct
    WHERE OP.idOrderP = pIdOrderP
	GROUP BY productName
UNION ALL
SELECT NULL, NULL, NULL, SUM(amount*OL.cost)
	FROM OrderP OP INNER JOIN OrderLine OL ON OP.idOrderP = OL.idOrderP
    INNER JOIN Product P ON P.idProduct = OL.idProduct
	WHERE OP.idOrderP = pIdOrderP;
END //
DELIMITER ;


##################################################################################################
#CRUD CALLS
##################################################################################################

#PRODUCT TYPE
#################################################
CALL CProductType('Tabaco', @result);
SELECT @result;
CALL CProductType('Vodka', @result);
SELECT @result;
CALL RProductType(NULL, NULL, NULL);
CALL UProductType(1, 'Tabaco', 1, @result);
SELECT @result;
CALL DProductType(2,@result);
SELECT @result;
SELECT * FROM ProductType;
#################################################

#SUPPLIER
#################################################
CALL CSupplier('Jackass', @result);
SELECT @result;
CALL CSupplier('Strong', @result);
SELECT @result;
CALL RSupplier(NULL, NULL, NULL);
CALL USupplier(1, 'DonOmar', 1, @result);
SELECT @result;
CALL DSupplier(1,@result);
SELECT @result;
SELECT * FROM Supplier;
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
CALL CProduct("Whiskey", 2.62, 2, NULL,
					2, 1, 1, "Is Insane", @result);
SELECT @result;
CALL CProduct("Beer", 1.2, 2, NULL,
					2, 1, 2, "Is incredible", @result);
SELECT @result;
CALL RProduct(NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL, NULL);
CALL UProduct(1,"Vodka",NULL,NULL,NULL,NULL,NULL,1,NULL,NULL, NULL, @result);
SELECT @result;
CALL DProduct(1,@result);
SELECT @result;
SELECT * FROM Product;
#################################################

#PRESENTATION
#################################################
CALL CPresentation(1, 500, 2, @result);
SELECT @result;
CALL CPresentation(1, 1000, 2, @result);
SELECT @result;
CALL RPresentation(NULL, NULL, NULL, NULL);
CALL UPresentation(1, NULL, 1000, 1, @result);
SELECT @result;
CALL DPresentation(2,@result);
SELECT @result;
SELECT * FROM Presentation;
#################################################

#LOCATION
#################################################
CALL CLocation(ST_GeomFromText('POINT(0 0)'), 1, @result);
SELECT @result;
CALL CLocation(ST_GeomFromText('POINT(-15 -3)'), 1, @result);
SELECT @result;
CALL CLocation(ST_GeomFromText('POINT(10 12)'), 0, @result);
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
CALL CClub("Whiskeys Club", 2, 1.2, 1, @result);
SELECT @result;
CALL RClub(NULL,NULL,NULL,NULL,NULL, NULL);
CALL UClub(1, "The Guardians Club", 2, NULL, NULL, 1, @result);
SELECT @result;
CALL DClub(1,@result);
SELECT @result;
SELECT * FROM Club;
#################################################

#INVENTORY
#################################################
CALL CInventory(1,1,20, @result);
SELECT @result;
CALL CInventory(1,2,30, @result);
SELECT @result;
CALL CInventory(2,2,30, @result);
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
SELECT * FROM ClientPeople;
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
CALL CClientLocation(1, 3, @result);
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

#POPULARPRODUCTS
#################################################
CALL CPopularProducts(2, @result);
SELECT @result;
CALL RPopularProducts(NULL, NULL, NULL);
CALL UPopularProducts(1, NULL, 0, @result);
SELECT @result;
CALL DPopularProducts(3,@result);
SELECT @result;
SELECT * FROM PopularProducts;
#################################################

##################################################################################################
#PROCEDURE CALLS
##################################################################################################

#OPENORDER
#################################################
CALL OpenOrder(1, 1, 1, 1, 2, @result);
SELECT @result;
SELECT * FROM OrderP;
#################################################

#BUYPRODUCT
#################################################
CALL BuyProduct(1, 1, 2, @result);
SELECT @result;
CALL BuyProduct(1, 2, 6, @result);
SELECT @result;
SELECT * FROM OrderLine;
#################################################

#READLINE
#################################################
CALL ReadLine(1);
#################################################

#CALCULATEDELIVERYC
#################################################
CALL CalculateDeliveryC(1, 1, 1);
#################################################

#PRODUCT QUERY
#################################################
CALL ProductQuery(NULL, NULL, NULL, NULL, 2, NULL, NULL);
#################################################

#BILL QUERY
#################################################
CALL BillQuery(1);
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


