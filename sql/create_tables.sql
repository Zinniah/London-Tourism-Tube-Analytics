-- London Tourism Tube Analytics
-- Create Main Table
 
CREATE TABLE attractions (
 
attraction_id INT PRIMARY KEY,
 
attraction_name VARCHAR(100),
 
category VARCHAR(50),
 
nearest_station VARCHAR(100),
 
line_name VARCHAR(50),
 
distance_km DECIMAL(5,2),
 
journey_time_min INT,
 
peak_fare DECIMAL(5,2),
 
offpeak_fare DECIMAL(5,2)
 
);
 
-- Sample Data
 
INSERT INTO attractions VALUES
(1,'Buckingham Palace','Royal','Green Park','Victoria',4.0,9,3.60,3.10),
(2,'Big Ben','Historic','Westminster','District',19.4,35,3.60,3.10),
(3,'London Eye','Entertainment','Waterloo','Victoria',21.0,38,3.60,3.10),
(4,'British Museum','Museum','Tottenham Court Road','Elizabeth',14.0,18,3.60,3.10),
(5,'Tower of London','Historic','Tower Hill','District',24.2,44,3.60,3.10),
(6,'Covent Garden','Shopping','Covent Garden','Piccadilly',17.0,30,3.60,3.10),
(7,'St Pauls Cathedral','Historic','Farringdon','Elizabeth',13.0,15,3.60,3.10),
(8,'Hyde Park','Park','Hyde Park Corner','Piccadilly',18.5,32,3.60,3.10);
