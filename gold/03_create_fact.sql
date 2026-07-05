USE Airbnb_DWH;
GO

-- Create Fact Table: Fact_Listings
-- This table stores the measurable values
-- and references the dimension tables.
CREATE TABLE Fact_Listings (

    -- Surrogate key for each listing
    listing_id INT IDENTITY(1,1) PRIMARY KEY,

    -- Foreign Keys
    city_id INT NOT NULL,
    room_id INT NOT NULL,
    host_id INT NOT NULL,

    -- Context Information
    day_type NVARCHAR(20) NOT NULL,
    latitude FLOAT NOT NULL,
    longitude FLOAT NOT NULL,
    distance_to_city_center FLOAT NOT NULL,
    distance_to_metro FLOAT NOT NULL,

    -- Business Measures
    price FLOAT NOT NULL,
    cleanliness_score FLOAT NOT NULL,
    guest_satisfaction_score FLOAT NOT NULL,
    attraction_index FLOAT NOT NULL,
    normalized_attraction_index FLOAT NOT NULL,
    restaurant_index FLOAT NOT NULL,
    normalized_restaurant_index FLOAT NOT NULL,

    -- Foreign Key Constraints
    CONSTRAINT FK_Fact_City
        FOREIGN KEY (city_id)
        REFERENCES Dim_City(city_id),

    CONSTRAINT FK_Fact_Room
        FOREIGN KEY (room_id)
        REFERENCES Dim_Room(room_id),

    CONSTRAINT FK_Fact_Host
        FOREIGN KEY (host_id)
        REFERENCES Dim_Host(host_id)

);
GO