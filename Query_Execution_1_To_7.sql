-- Find customers who consumed more than 50 units in August 2025

SELECT c.CustomerName, mr.UnitsConsumed, mr.ReadingDate
FROM MeterReadings mr
JOIN Meters m ON mr.MeterID = m.MeterID
JOIN Customers c ON m.CustomerID = c.CustomerID
WHERE MONTH(mr.ReadingDate) = 8
  AND YEAR(mr.ReadingDate) = 2025
  AND mr.UnitsConsumed > 50;

-- Get average units consumed by ReadingType

SELECT ReadingType, AVG(UnitsConsumed) AS AvgConsumption
FROM MeterReadings
GROUP BY ReadingType;

-- Show the highest consumption reading per customer

SELECT c.CustomerName, MAX(mr.UnitsConsumed) AS MaxConsumption
FROM MeterReadings mr
JOIN Meters m ON mr.MeterID = m.MeterID
JOIN Customers c ON m.CustomerID = c.CustomerID
GROUP BY c.CustomerName;

-- Identify suspicious readings (Current < Previous)

SELECT c.CustomerName, mr.ReadingDate, mr.PreviousReading, mr.CurrentReading
FROM MeterReadings mr
JOIN Meters m ON mr.MeterID = m.MeterID
JOIN Customers c ON m.CustomerID = c.CustomerID
WHERE mr.CurrentReading < mr.PreviousReading;

-- Find total units consumed per customer in July and August 2025

SELECT c.CustomerName, SUM(mr.UnitsConsumed) AS TotalConsumption
FROM MeterReadings mr
JOIN Meters m ON mr.MeterID = m.MeterID
JOIN Customers c ON m.CustomerID = c.CustomerID
WHERE YEAR(mr.ReadingDate) = 2025
  AND MONTH(mr.ReadingDate) IN (7, 8)
GROUP BY c.CustomerName;

-- Rank the customers based on total consumption in July and August 2025

SELECT c.CustomerName,
       SUM(mr.UnitsConsumed) AS TotalConsumption,
       RANK() OVER (ORDER BY SUM(mr.UnitsConsumed) DESC) AS RankOrder
FROM MeterReadings mr
JOIN Meters m ON mr.MeterID = m.MeterID
JOIN Customers c ON m.CustomerID = c.CustomerID
WHERE YEAR(mr.ReadingDate) = 2025
  AND MONTH(mr.ReadingDate) IN (7, 8)
GROUP BY c.CustomerName;

-- Show last reading for each customer (most recent date)

SELECT c.CustomerName, mr.ReadingDate, mr.CurrentReading
FROM MeterReadings mr
JOIN Meters m ON mr.MeterID = m.MeterID
JOIN Customers c ON m.CustomerID = c.CustomerID
WHERE mr.ReadingDate = (
    SELECT MAX(mr2.ReadingDate)
    FROM MeterReadings mr2
    WHERE mr2.MeterID = mr.MeterID
);
