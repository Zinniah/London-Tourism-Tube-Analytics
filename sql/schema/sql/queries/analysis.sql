-- ====================================================================
-- Analytical Queries: London Tourism & Tube Analytics
-- ====================================================================

-- Query 1: Find the closest tube station and walking distance for every major attraction
SELECT 
    a.attraction_name,
    a.category,
    a.borough,
    s.station_name,
    s.line_name,
    s.zone,
    ast.walking_distance_meters
FROM attractions a
JOIN attraction_stations ast ON a.attraction_id = ast.attraction_id
JOIN stations s ON ast.station_id = s.station_id
ORDER BY ast.walking_distance_meters ASC;


-- Query 2: Borough Tourism Impact Rank (Using Window Functions)
-- Evaluates total visitor volume per borough to highlight high-traffic tourist hubs
WITH BoroughFootfall AS (
    SELECT 
        borough,
        COUNT(attraction_id) AS total_attractions,
        SUM(annual_visitors) AS total_annual_visitors
    FROM attractions
    GROUP BY borough
)
SELECT 
    borough,
    total_attractions,
    total_annual_visitors,
    DENSE_RANK() OVER (ORDER BY total_annual_visitors DESC) AS visitor_traffic_rank
FROM BoroughFootfall;


-- Query 3: Fare Zone Grouping & Attraction Inventory
-- Helps visitors plan single-zone day trips to minimize TfL ticket fares
SELECT 
    s.zone,
    STRING_AGG(a.attraction_name, ', ') AS attractions_in_this_zone,
    COUNT(a.attraction_id) AS attraction_count
FROM attractions a
JOIN attraction_stations ast ON a.attraction_id = ast.attraction_id
JOIN stations s ON ast.station_id = s.station_id
GROUP BY s.zone
ORDER BY s.zone ASC;
-- Query 4: Estimate Travel Cost to Attractions Based on TfL Zone Fares
SELECT 
    a.attraction_name,
    s.station_name,
    s.zone AS station_zone,
    f.peak_fare_gbp AS estimated_peak_fare,
    f.off_peak_fare_gbp AS estimated_off_peak_fare
FROM attractions a
JOIN attraction_stations ast ON a.attraction_id = ast.attraction_id
JOIN stations s ON ast.station_id = s.station_id
JOIN fare_rates f ON s.zone = f.zone_from AND f.zone_to = s.zone;
