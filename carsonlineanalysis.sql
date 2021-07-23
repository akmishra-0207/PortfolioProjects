/* The CarsOnline consists of the following tables:

cars - Provides details about the various cars (both sold and unsold)

car_types - Provides further details about the car type (i.e., Ford Mustang 1980)

fuel_types - Provides further details about the car fuel type (i.e., Diesel, Electric etc.)

transmission_types - Provides further details about the car gearbox type

customers - Provides details about the company’s customers who have bought at least one car

genders - Provides further details about the gender of each customer

locations - Provides further details about the location of each customer

sales - Provides details about each car purchase
*/



USE carsonline;
SELECT*
FROM cars;
SELECT *
FROM car_types;

-- Show the avg price for each model of the car made by bmd in year 2019.

SELECT c.car_id, c.price, ct.car_make, ct.car_model, ct.car_year, AVG(c.price) AS 'AvgPriceAccordingToModel'
FROM cars c INNER JOIN car_types ct
			ON c.car_type_id = ct.car_type_id
WHERE ct.car_make = 'bmw'
AND ct.car_year = 2019
GROUP BY ct.car_model;

SELECT *
FROM cars;
SELECT *
FROM fuel_types;

-- Find the total number of cars according to fuel type in desending order.

SELECT ft.fuel_type_name, COUNT(*) AS 'number_of_cars_by_fuel_type'
FROM cars c INNER JOIN fuel_types ft
			ON c.fuel_type_id = ft.fuel_type_id
GROUP BY ft.fuel_type_name
ORDER BY COUNT(*) DESC;


SELECT *
FROM cars;
SELECT *
FROM transmission_types;

-- Get the avg price for each transmission_name in desending order.

SELECT tt.transmission_name, AVG(c.price) AS 'AvgPriceTransmissionName'
FROM cars c INNER JOIN transmission_types tt
			ON c.transmission_type_id = tt.transmission_type_id
GROUP BY tt.transmission_name
ORDER BY AVG(c.price);

-- display the unique number of hybrid cars for each car_make. Sort the output by the number of cars (Descending)

SELECT ct.car_make , COUNT(DISTINCT ct.car_model) AS 'hybrid_cars'
FROM cars c INNER JOIN car_types ct
			ON c.car_type_id = ct.car_type_id
            INNER JOIN fuel_types ft
            ON c.fuel_type_id = ft.fuel_type_id
WHERE ft.fuel_type_name = 'hybrid'
GROUP BY ct.car_make
ORDER BY COUNT(DISTINCT ct.car_model) DESC;

-- display the number of manual-gearbox cars, by each car_year and car_make. Sort the output by the year (ascending)

SELECT ct.car_year, ct.car_make, COUNT(*) AS 'number_of_cars'
FROM cars c JOIN transmission_types tt 
ON   c.transmission_type_id = tt.transmission_type_id
			JOIN car_types ct 
ON   c.car_type_id = ct.car_type_id
WHERE tt.transmission_name = 'Manual'
GROUP BY ct.car_year, ct.car_make
ORDER BY ct.car_year




