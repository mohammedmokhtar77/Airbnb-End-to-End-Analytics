USE Airbnb_DWH;
GO

-- Gold Layer Validation Queries

-- Validation 1: Compare record counts
-- The Fact table should contain the same number of records
-- as the Silver table.
SELECT
    (SELECT COUNT(*) FROM silver_airbnb) AS Silver_Count,
    (SELECT COUNT(*) FROM Fact_Listings) AS Fact_Count;
GO

-- Validation 2: Check number of cities
SELECT COUNT(*) AS Total_Cities
FROM Dim_City;
GO

-- Validation 3: Check number of room configurations
SELECT COUNT(*) AS Total_Room_Types
FROM Dim_Room;
GO

-- Validation 4: Check number of host types
SELECT COUNT(*) AS Total_Host_Types
FROM Dim_Host;
GO

-- Validation 5: Check for NULL Foreign Keys
-- There should be no NULL values.
SELECT *
FROM Fact_Listings
WHERE city_id IS NULL
   OR room_id IS NULL
   OR host_id IS NULL;
GO

-- Validation 6: Verify City Relationships
-- Every city_id in the Fact table must exist in Dim_City.
SELECT f.city_id
FROM Fact_Listings f
LEFT JOIN Dim_City d
ON f.city_id = d.city_id
WHERE d.city_id IS NULL;
GO

-- Validation 7: Verify Room Relationships
SELECT f.room_id
FROM Fact_Listings f
LEFT JOIN Dim_Room d
ON f.room_id = d.room_id
WHERE d.room_id IS NULL;
GO

-- Validation 8: Verify Host Relationships
SELECT f.host_id
FROM Fact_Listings f
LEFT JOIN Dim_Host d
ON f.host_id = d.host_id
WHERE d.host_id IS NULL;
GO

-- Validation 9: Preview the Star Schema
SELECT TOP (10)

    f.listing_id,
    c.city_name,
    r.room_type,
    h.is_superhost,

    f.price,
    f.guest_satisfaction_score,
    f.cleanliness_score,
    f.day_type

FROM Fact_Listings f

INNER JOIN Dim_City c
ON f.city_id = c.city_id

INNER JOIN Dim_Room r
ON f.room_id = r.room_id

INNER JOIN Dim_Host h
ON f.host_id = h.host_id;
GO