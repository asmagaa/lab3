DELIMITER //
CREATE TRIGGER users_after_insert
AFTER INSERT ON users
FOR EACH ROW
BEGIN
    INSERT INTO user_log (user_id, action, details)
    VALUES (
        NEW.id,
        'INSERT',
        CONCAT('New user: ', NEW.username, ' (', NEW.email, ')')
    );
END//
DELIMITER ;