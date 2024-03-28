-- How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT last_name) AS unique_ln
FROM sakila.actor;

-- In how many different languages where the films originally produced? (Use the column language_id from the film table)
SELECT COUNT(DISTINCT language_id) AS unique_languages
FROM sakila.film;

-- How many movies were released with "PG-13" rating?
SELECT COUNT(*) AS P13_movies
FROM sakila.film
WHERE rating ="PG-13";

-- Get 10 the longest movies from 2006.
SELECT
  title, length
FROM 
  sakila.film
WHERE 
  release_year = 2006
ORDER BY 
  length DESC
LIMIT 10;

-- How many days has been the company operating (check DATEDIFF() function)?


-- Show rental info with additional columns month and weekday. Get 20.
SELECT 
  *, 
  MONTH(rental_date) AS mes, 
  DAYNAME(rental_date) AS dia_de_la_semana
FROM 
  sakila.rental
LIMIT 20;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT 
	*,
  MONTH(rental_date) AS mes, 
  DAYNAME(rental_date) AS dia_de_la_semana,
	CASE 
		WHEN DAYNAME(rental_date) IN ("Saturday", "Sunday") THEN "weekend" 
        ELSE "week-day" 
	END AS day_type
FROM 
  sakila.rental;
  
-- How many rentals were in the last month of activity? Primero miro cuál es el mes de las últimos alquileres para saber qué mes tengo que buscar a la hora de contar el total de alquileres
SELECT 
  DATE_FORMAT(rental_date, '%m-%Y') AS mes_año 
FROM 
  sakila.rental 
ORDER BY 
  mes_año DESC;
  
SELECT COUNT(*) AS last_month_rentals
FROM sakila.rental
WHERE MONTH(rental_date) = 08








