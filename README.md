# Assignment-6-RDBMS_SQL_Queries
RDBMS SQL Queries - Creation, Normalization, Insertion, Views, Stored Procedures

---


##  Original Table 

```
CREATE TABLE MeterReading (
    MeterReadingID INT PRIMARY KEY,
    MeterID INT,
    CustomerID INT,
    ReadingDate DATE,
    PreviousReading DECIMAL(10,2),
    CurrentReading DECIMAL(10,2),
    UnitsConsumed DECIMAL(10,2),
    ReadingType VARCHAR(20),
    Status BIT,
    Remarks NVARCHAR(255)
);
```
---

## 🔹 Normalization Steps

### 1NF – Remove repeating/duplicate data

* Ensure atomic values.
* Still, Customer and Meter details repeated in every reading.

### 2NF – Separate entities

* Created **Customers** table for customer details.
* Created **Meters** table linked to customers.
* Kept **MeterReadings** table for readings.

### 3NF – Remove transitive dependencies

* Each non-key attribute depends only on its table’s primary key.
* Relationships:

  * One **Customer** → Many **Meters**
  * One **Meter** → Many **Readings**

---

##  Normalized Tables

1. **Customers**
   `(CustomerID, CustomerName, Address)`
2. **Meters**
   `(MeterID, CustomerID, MeterNumber)`
3. **MeterReadings**
   `(MeterReadingID, MeterID, ReadingDate, PreviousReading, CurrentReading, UnitsConsumed, ReadingType, Status, Remarks)`

---
