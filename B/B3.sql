DELIMITER //
CREATE PROCEDURE UpdateAllSalaries(IN percentage_increase DECIMAL(5,2))
MODIFIES SQL DATA
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE user_id INT;
    DECLARE current_salary DECIMAL(10,2);
    DECLARE new_salary DECIMAL(10,2);
    
    DECLARE salary_cursor CURSOR FOR
        SELECT id, salary FROM users WHERE salary IS NOT NULL;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN salary_cursor;
    
    salary_loop: LOOP
        FETCH salary_cursor INTO user_id, current_salary;
        
        IF done THEN
            LEAVE salary_loop;
        END IF;
        
        SET new_salary = current_salary * (1 + percentage_increase / 100);
        
        UPDATE users 
        SET salary = new_salary 
        WHERE id = user_id;
        
    END LOOP;
    
    CLOSE salary_cursor;
END//
DELIMITER ;