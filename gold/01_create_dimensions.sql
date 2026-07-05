USE Airbnb_DWH;
GO

-- Create Dimension: City
CREATE TABLE Dim_City (
    city_id INT IDENTITY(1,1) PRIMARY KEY,
    city_name NVARCHAR(100) NOT NULL UNIQUE
);
GO

-- Create Dimension: Room
CREATE TABLE Dim_Room (
    room_id INT IDENTITY(1,1) PRIMARY KEY,
    room_type NVARCHAR(100) NOT NULL,
    room_shared BIT NOT NULL,
    room_private BIT NOT NULL,
    guest_capacity INT NOT NULL,
    bedrooms INT NOT NULL
);
GO
-- Create Dimension: Host
CREATE TABLE Dim_Host (
    host_id INT IDENTITY(1,1) PRIMARY KEY,
    is_superhost BIT NOT NULL,
    multi INT NOT NULL,
    biz INT NOT NULL
);
GO