DELIMITER //
CREATE FUNCTION IsUserActive(user_id INT)
RETURNS BOOLEAN
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE order_count INT DEFAULT 0;
    
    SELECT COUNT(*) INTO order_count
    FROM orders
    WHERE user_id = user_id 
    AND order_date >= DATE_SUB(CURDATE(), INTERVAL 30 DAY);
    
    RETURN order_count > 0;
END//
DELIMITER ;