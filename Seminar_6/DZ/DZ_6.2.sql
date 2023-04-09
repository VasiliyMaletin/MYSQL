-- Task_2
DROP PROCEDURE IF EXISTS even_numbers
DELIMITER //
CREATE PROCEDURE even_numbers(IN numbers INT)
BEGIN
    DECLARE n INT;
    DECLARE result VARCHAR(45);
    SET n = numbers;

	REPEAT
		IF n % 2 = 0 THEN
			IF result IS NULL THEN
				SET result = concat(n);
			ELSE
				SET result = concat(result, ', ', n);
			END IF;
			SET n = n + 2;
		ELSE
			SET n = n + 1;
        END IF;
	UNTIL n > 10
	END REPEAT;

	SELECT result;
END //

CALL even_numbers(1);