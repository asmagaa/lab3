DELIMITER //
CREATE PROCEDURE CalculateFactorial(IN n INT, OUT result BIGINT)
READS SQL DATA
BEGIN
    DECLARE temp_result BIGINT;
    
    IF n <= 1 THEN
        SET result = 1;
    ELSE
        CALL CalculateFactorial(n - 1, temp_result);
        SET result = n * temp_result;
    END IF;
END//
DELIMITER ;