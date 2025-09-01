DELIMITER $$

-- Insert
CREATE PROCEDURE sp_InsertReading (
    IN p_MeterID INT,
    IN p_ReadingDate DATE,
    IN p_PreviousReading DECIMAL(10,2),
    IN p_CurrentReading DECIMAL(10,2),
    IN p_UnitsConsumed DECIMAL(10,2),
    IN p_ReadingType ENUM('Manual','Automatic','Estimated'),
    IN p_Status TINYINT(1),
    IN p_Remarks VARCHAR(255)
)
BEGIN
    INSERT INTO MeterReadings (MeterID, ReadingDate, PreviousReading, CurrentReading, UnitsConsumed, ReadingType, Status, Remarks)
    VALUES (p_MeterID, p_ReadingDate, p_PreviousReading, p_CurrentReading, p_UnitsConsumed, p_ReadingType, p_Status, p_Remarks);
END$$


-- Update
CREATE PROCEDURE sp_UpdateReading (
    IN p_MeterReadingID INT,
    IN p_CurrentReading DECIMAL(10,2),
    IN p_UnitsConsumed DECIMAL(10,2),
    IN p_Status TINYINT(1),
    IN p_Remarks VARCHAR(255)
)
BEGIN
    UPDATE MeterReadings
    SET CurrentReading = p_CurrentReading,
        UnitsConsumed = p_UnitsConsumed,
        Status = p_Status,
        Remarks = p_Remarks
    WHERE MeterReadingID = p_MeterReadingID;
END$$


-- Delete
CREATE PROCEDURE sp_DeleteReading (IN p_MeterReadingID INT)
BEGIN
    DELETE FROM MeterReadings
    WHERE MeterReadingID = p_MeterReadingID;
END$$


-- View (Readings by Customer)
CREATE PROCEDURE sp_ViewReadings (IN p_CustomerID INT)
BEGIN
    SELECT mr.MeterReadingID, mr.ReadingDate, mr.PreviousReading, mr.CurrentReading,
           mr.UnitsConsumed, mr.ReadingType
    FROM MeterReadings mr
    JOIN Meters m ON mr.MeterID = m.MeterID
    WHERE m.CustomerID = p_CustomerID
    ORDER BY mr.ReadingDate DESC;
END$$

DELIMITER ;
