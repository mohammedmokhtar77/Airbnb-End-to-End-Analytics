USE Airbnb_DWH;
GO


-- Clear existing data from dimension tables
-- This allows the script to be re-executed
-- without creating duplicate records.
TRUNCATE TABLE Dim_City;
TRUNCATE TABLE Dim_Room;
TRUNCATE TABLE Dim_Host;
GO

-- Load Dim_City
INSERT INTO Dim_City (city_name)
SELECT DISTINCT city
FROM silver_airbnb;
GO

-- Load Dim_Room
INSERT INTO Dim_Room (
    room_type,
    room_shared,
    room_private,
    guest_capacity,
    bedrooms
)
SELECT DISTINCT
    room_type,
    room_shared,
    room_private,
    guest_capacity,
    bedrooms
FROM silver_airbnb;
GO


-- Load Dim_Host
INSERT INTO Dim_Host (
    is_superhost,
    multi,
    biz
)
SELECT DISTINCT
    is_superhost,
    multi,
    biz
FROM silver_airbnb;
GO