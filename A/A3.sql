DELIMITER //
CREATE FUNCTION GetUserOrdersValue(user_id INT)
RETURNS DECIMAL(10,2)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE total_value DECIMAL(10,2) DEFAULT 0;
    
    SELECT COALESCE(SUM(p.price * o.quantity), 0) INTO total_value
    FROM orders o
    JOIN products p ON o.product_id = p.id
    WHERE o.user_id = user_id;
    
    RETURN total_value;
END//
DELIMITER ;