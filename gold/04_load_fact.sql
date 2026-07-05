USE Airbnb_DWH;
GO

-- Clear existing data from the Fact table
-- This allows the ETL pipeline to be rerun safely.

TRUNCATE TABLE Fact_Listings;
GO

-- Load Fact_Listings
-- Join the Silver layer with all Dimension tables
-- to replace descriptive values with surrogate keys.
INSERT INTO Fact_Listings (

    city_id,
    room_id,
    host_id,

    day_type,
    latitude,
    longitude,
    distance_to_city_center,
    distance_to_metro,

    price,
    cleanliness_score,
    guest_satisfaction_score,
    attraction_index,
    normalized_attraction_index,
    restaurant_index,
    normalized_restaurant_index

)

SELECT

    dc.city_id,
    dr.room_id,
    dh.host_id,

    s.day_type,
    s.latitude,
    s.longitude,
    s.distance_to_city_center,
    s.distance_to_metro,

    s.price,
    s.cleanliness_score,
    s.guest_satisfaction_score,
    s.attraction_index,
    s.normalized_attraction_index,
    s.restaurant_index,
    s.normalized_restaurant_index

FROM silver_airbnb AS s

INNER JOIN Dim_City AS dc
ON s.city = dc.city_name

INNER JOIN Dim_Room AS dr
ON s.room_type = dr.room_type
AND s.room_shared = dr.room_shared
AND s.room_private = dr.room_private
AND s.guest_capacity = dr.guest_capacity
AND s.bedrooms = dr.bedrooms

INNER JOIN Dim_Host AS dh
ON s.is_superhost = dh.is_superhost
AND s.multi = dh.multi
AND s.biz = dh.biz;
GO