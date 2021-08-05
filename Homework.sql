
--Week 4 Day 3 Homework		
--Question 1
SELECT district, first_name, last_name, email
FROM address
INNER JOIN customer
ON address.address_id = customer.address_id
WHERE district = 'Texas';

--Question 2
SELECT first_name, last_name, amount
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount >6.99
ORDER BY amount ASC;

--Question 3
SELECT first_name, last_name, email, SUM(amount)
FROM(
	SELECT payment.customer_id, first_name, last_name, email, amount
	FROM payment
	INNER JOIN customer
	ON payment.customer_id = customer.customer_id
) as payment_customer
GROUP BY first_name, last_name, email
HAVING SUM(amount) > 175
ORDER BY SUM(amount) DESC

--Question 4

SELECT first_name, last_name, email, country
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id	
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal'

--Question 5

SELECT first_name, last_name, staff.staff_id, COUNT(payment_id)
FROM staff
INNER JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY staff.staff_id
ORDER BY COUNT(payment_id) DESC;
-- Jon Stephens with 7304 transactions.

--Question 6

SELECT title, COUNT(film_actor.actor_id)
FROM film
INNER JOIN film_actor
ON film.film_id = film_actor.film_id
INNER JOIN actor
ON film_actor.actor_id = actor.actor_id
GROUP BY title
ORDER BY COUNT(film_actor.actor_id) DESC;
-- Lambs Cincinatti has the most actors at 15.

--Question 7
SELECT first_name, last_name, email
FROM customer
WHERE customer_id in (
	SELECT customer_id
	FROM payment
	WHERE amount > 6.99
)
ORDER BY first_name ASC;

--Question 8
SELECT COUNT(film_id), category.name
FROM category
INNER JOIN film_category
ON category.category_id = film_category.category_id
GROUP BY category.name
ORDER BY COUNT(film_id) DESC;
--Sports is the most prevalent in the films. 

	

