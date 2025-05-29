DELIMITER //
CREATE OR REPLACE FUNCTION CalculateAge(birth_year INT) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE current_year INT;
    SET current_year = YEAR(CURRENT_DATE());
    RETURN current_year - birth_year;
END//
DELIMITER ;