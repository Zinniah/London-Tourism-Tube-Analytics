-- 1. Attractions served by each Tube line
 
SELECT
line_name,
COUNT(*) AS total_attractions
FROM attrac*ions
GROUP BY line_name
ORDER BY t*tal_attractions DESC;
 
 
-- 2. Fast*st attractions to reach
 
SELECT
* attraction_name,
journey*time_min
FROM attractions
ORDER BY*journey_time_min ASC;
 
 
-- 3. Clos*st attractions
 
SELECT
attract*on_name,
distance_km
FROM attr*ctions
ORDER BY distance_km ASC;
 
*-- 4. Cheapest attractions
 
SELECT* attraction_name,
offpeak_f*re
FROM attractions
ORDER BY offpe*k_fare ASC;
 
 
-- 5. Attractions on*Piccadilly Line
 
SELECT *
FROM att*actions
WHERE line_name = 'Piccadi*ly';
 
 
-- 6. Attractions on Elizab*th Line
 
SELECT *
FROM attractions*WHERE line_name = 'Elizabeth';
 
 
-* 7. Average journey time by line
 
*ELECT
line_name,
AVG(journ*y_time_min) AS avg_journey_time
FR*M attractions
GROUP BY line_name;
*
-- 8. Average distance by line
 
S*LECT
line_name,
AVG(distan*e_km) AS avg_distance
FROM attract*ons
GROUP BY line_name;
