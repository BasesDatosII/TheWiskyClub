# CRUD ProductType

DELIMITER //
CREATE PROCEDURE CProductType (IN pTypeName varchar(20), OUT result varchar(50))
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

CALL CProductType('Tabaco', @level);
SELECT @level;
SELECT * FROM ProductType