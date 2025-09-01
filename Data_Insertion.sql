INSERT INTO Customers (CustomerName, Address) VALUES
('Lokesh', 'Bangalore'),
('Arjun', 'Chennai'),
('Priya', 'Tumkur'),
('Karthik', 'bangalore'),
('Divya', 'Mangalore');

INSERT INTO Meters (CustomerID, MeterNumber) VALUES
(1, 'MTR001'),
(2, 'MTR002'),
(3, 'MTR003'),
(4, 'MTR004'),
(5, 'MTR005');

-- Insertion into MeterReadings Table

-- Lokesh
INSERT INTO MeterReadings (MeterID, ReadingDate, PreviousReading, CurrentReading, UnitsConsumed, ReadingType, Status, Remarks) VALUES
(1, '2025-07-10', 100, 160, 60, 'Manual', 1, 'Normal'),
(1, '2025-08-10', 160, 230, 70, 'Automatic', 1, 'Normal');

-- Arjun
INSERT INTO MeterReadings (MeterID, ReadingDate, PreviousReading, CurrentReading, UnitsConsumed, ReadingType, Status, Remarks) VALUES
(2, '2025-07-12', 200, 250, 50, 'Automatic', 1, 'Normal'),
(2, '2025-08-12', 250, 330, 80, 'Manual', 1, 'Normal');

-- Priya
INSERT INTO MeterReadings (MeterID, ReadingDate, PreviousReading, CurrentReading, UnitsConsumed, ReadingType, Status, Remarks) VALUES
(3, '2025-07-15', 300, 360, 60, 'Estimated', 1, 'Normal'),
(3, '2025-08-15', 360, 410, 50, 'Automatic', 1, 'Normal');

-- Karthik
INSERT INTO MeterReadings (MeterID, ReadingDate, PreviousReading, CurrentReading, UnitsConsumed, ReadingType, Status, Remarks) VALUES
(4, '2025-07-18', 150, 200, 50, 'Manual', 1, 'Normal'),
(4, '2025-08-18', 200, 280, 80, 'Estimated', 1, 'Normal');

-- Divya
INSERT INTO MeterReadings (MeterID, ReadingDate, PreviousReading, CurrentReading, UnitsConsumed, ReadingType, Status, Remarks) VALUES
(5, '2025-07-20', 400, 460, 60, 'Automatic', 1, 'Normal'),
(5, '2025-08-20', 460, 530, 70, 'Manual', 1, 'Normal');

