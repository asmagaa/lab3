DELIMITER //
CREATE PROCEDURE GetTableMetadata(IN table_name VARCHAR(100))
READS SQL DATA
BEGIN
    SELECT 
        COLUMN_NAME,
        DATA_TYPE,
        IS_NULLABLE,
        COLUMN_DEFAULT,
        COLUMN_KEY
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE()
    AND TABLE_NAME = table_name
    ORDER BY ORDINAL_POSITION;
END//
DELIMITER ;