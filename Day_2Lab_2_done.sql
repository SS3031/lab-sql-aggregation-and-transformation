use sakila;
-- 1.1 Determine the shortest and longest movie durations:
SELECT 
    MAX(length) AS max_duration, 
    MIN(length) AS min_duration 
FROM 
    film;
    
-- 1.2 Express the average movie duration in hours and minutes:
SELECT 
    CONCAT(FLOOR(AVG(length) / 60), 'h ', 
           ROUND(AVG(length) % 60), 'm') AS average_duration 
FROM 
    film;

-- 2.1 Calculate the number of days that the company has been operating:
SELECT 
    DATEDIFF(MAX(rental_date), MIN(rental_date)) AS days_operating 
FROM 
    rental;
-- 2.2 Retrieve rental information and add two additional columns to show the month and weekday of the rental:
SELECT 
    rental_id, 
    rental_date, 
    MONTH(rental_date) AS rental_month, 
    DAYNAME(rental_date) AS rental_weekday 
FROM 
    rental 
LIMIT 20;

-- 2.3 Retrieve rental information and add an additional column called DAY_TYPE with values 'weekend' or 'workday', depending on the day of the week:
SELECT 
    rental_id, 
    rental_date, 
    CASE 
        WHEN DAYOFWEEK(rental_date) IN (1,7) THEN 'weekend' 
        ELSE 'workday' 
    END AS day_type 
FROM 
    rental 
LIMIT 20;
-- Bonus: You need to ensure that customers can easily access information about the movie collection. To achieve this, retrieve the film titles and their rental duration. If any rental duration value is NULL, replace it with the string 'Not Available'. Sort the results of the film title in ascending order.

SELECT 
    title, 
    IFNULL(rental_duration, 'Not Available') AS rental_duration 
FROM 
    film 
ORDER BY 
    title ASC;
