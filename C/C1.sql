DELIMITER //
CREATE TRIGGER users_after_update
AFTER UPDATE ON users
FOR EACH ROW
BEGIN
    INSERT INTO user_log (user_id, action, details)
    VALUES (
        NEW.id, 
        'UPDATE', 
        CONCAT('Updated: ', OLD.username, ' -> ', NEW.username)
    );
END//
DELIMITER ;