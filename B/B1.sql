DELIMITER //
CREATE PROCEDURE AddNewUser(
    IN p_username VARCHAR(50),
    IN p_email VARCHAR(100),
    IN p_age INT,
    IN p_salary DECIMAL(10,2),
    IN p_department VARCHAR(50)
)
MODIFIES SQL DATA
BEGIN
    INSERT INTO users (username, email, age, salary, department)
    VALUES (p_username, p_email, p_age, p_salary, p_department);
END//
DELIMITER ;