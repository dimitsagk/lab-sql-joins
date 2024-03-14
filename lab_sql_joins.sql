SELECT * FROM film;
SELECT * FROM film_category;
SELECT * FROM category;

-- List the number of films per category.
SELECT 
	c.name AS film_category,
    COUNT(fc.film_id) AS numbers_films_per_category
    FROM film_category as fc
JOIN category as c
ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY COUNT(fc.film_id) DESC;

-- Retrieve the store ID, city, and country for each store.
SELECT * FROM store;
SELECT * FROM address;
SELECT * FROM city;
SELECT * FROM country;

-- SELECT s.store_id, s.address_id, a.city_id FROM store AS s
SELECT s.store_id, c.city, co.country FROM store AS s
JOIN address AS a
ON s.address_id = a.address_id
JOIN city AS c
ON a.city_id = c.city_id
JOIN country as co
ON c.country_id = co.country_id;

-- Calculate the total revenue generated by each store in dollars.
SELECT * FROM payment;
SELECT * FROM staff;
SELECT * FROM store;

SELECT s.store_id, SUM(p.amount) FROM store AS s
JOIN staff as sf
ON s.store_id = sf.store_id
JOIN payment as p
ON sf.staff_id = p.staff_id
GROUP BY s.store_id;

-- Determine the average running time of films for each category.
SELECT * FROM film;
SELECT * FROM film_category;
SELECT * FROM category;

SELECT c.name, AVG(f.length) FROM film as f
JOIN film_category as fc
ON f.film_id = fc.film_id
JOIN category as c
ON fc.category_id = c.category_id
GROUP BY c.name;
