DELIMITER //
CREATE PROCEDURE GetUsersByDepartment(IN dept_name VARCHAR(50))
READS SQL DATA
BEGIN
    SELECT id, username, email, age, salary, department
    FROM users 
    WHERE department = dept_name;
END//
DELIMITER ;