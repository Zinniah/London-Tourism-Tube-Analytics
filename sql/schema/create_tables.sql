-- ====================================================================
-- Project: London Tourism & Tube Analytics
-- Schema Setup: Stations, Attractions, and Proximity Mapping
-- ====================================================================

-- Drop tables if they already exist (for clean re-runs)
DROP TABLE IF EXISTS attraction_stations;
DROP TABLE IF EXISTS stations;
DROP TABLE IF EXISTS attractions;

-- 1. Stations Table (TfL Underground Network Data)
CREATE TABLE stations (
    station_id VARCHAR(50) PRIMARY KEY,
    station_name VARCHAR(100) NOT NULL,
    line_name VARCHAR(50) NOT NULL,
    zone INT NOT NULL,
    latitude DECIMAL(9,6),
    longitude DECIMAL(9,6)
);

-- 2. Attractions Table (London Tourist Hotspots)
CREATE TABLE attractions (
    attraction_id SERIAL PRIMARY KEY,
    attraction_name VARCHAR(150) NOT NULL,
    category VARCHAR(50), -- e.g., Museum, Historic, Gallery, Park
    borough VARCHAR(50),
    annual_visitors INT,
    latitude DECIMAL(9,6),
    longitude DECIMAL(9,6)
);

-- 3. Attraction-Stations Proximity Table (Bridge Table)
CREATE TABLE attraction_stations (
    mapping_id SERIAL PRIMARY KEY,
    attraction_id INT REFERENCES attractions(attraction_id) ON DELETE CASCADE,
    station_id VARCHAR(50) REFERENCES stations(station_id) ON DELETE CASCADE,
    walking_distance_meters INT NOT NULL
);

-- Seed Sample Data for Testing & Portfolio Demonstration
INSERT INTO stations (station_id, station_name, line_name, zone, latitude, longitude) VALUES
('STN_01', 'Tottenham Court Road', 'Central / Northern', 1, 51.5161, -0.1311),
('STN_02', 'South Kensington', 'District / Circle / Piccadilly', 1, 51.4941, -0.1738),
('STN_03', 'London Bridge', 'Jubilee / Northern', 1, 51.5055, -0.0865),
('STN_04', 'Westminster', 'Jubilee / District / Circle', 1, 51.5014, -0.1248),
('STN_05', 'Covent Garden', 'Piccadilly', 1, 51.5129, -0.1243);

INSERT INTO attractions (attraction_name, category, borough, annual_visitors, latitude, longitude) VALUES
('The British Museum', 'Museum', 'Camden', 6000000, 51.5194, -0.1270),
('Natural History Museum', 'Museum', 'Kensington and Chelsea', 5000000, 51.4966, -0.1764),
('Tower of London', 'Historic', 'Tower Hamlets', 3000000, 51.5081, -0.0759),
('The London Eye', 'Entertainment', 'Lambeth', 4500000, 51.5033, -0.1195),
('Covent Garden Market', 'Shopping', 'Westminster', 15000000, 51.5117, -0.1240);

INSERT INTO attraction_stations (attraction_id, station_id, walking_distance_meters) VALUES
(1, 'STN_01', 350), -- British Museum -> Tottenham Court Rd
(2, 'STN_02', 200), -- Natural History Museum -> South Kensington
(3, 'STN_03', 400), -- Tower of London -> London Bridge (or Tower Hill)
(4, 'STN_04', 150), -- London Eye -> Westminster
(5, 'STN_05', 50);  -- Covent Garden Market -> Covent Garden
