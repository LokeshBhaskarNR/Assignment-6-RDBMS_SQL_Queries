CREATE DATABASE IF NOT EXISTS MeterDB;

USE MeterDB;

-- Customers
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    Address VARCHAR(255)
);

-- Meters
CREATE TABLE Meters (
    MeterID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    MeterNumber VARCHAR(50) UNIQUE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Meter Readings
CREATE TABLE MeterReadings (
    MeterReadingID INT AUTO_INCREMENT PRIMARY KEY,
    MeterID INT NOT NULL,
    ReadingDate DATE NOT NULL,
    PreviousReading DECIMAL(10,2) NOT NULL,
    CurrentReading DECIMAL(10,2) NOT NULL,
    UnitsConsumed DECIMAL(10,2) NOT NULL,
    ReadingType ENUM('Manual','Automatic','Estimated'),
    Status TINYINT(1),
    Remarks VARCHAR(255),
    FOREIGN KEY (MeterID) REFERENCES Meters(MeterID)
);