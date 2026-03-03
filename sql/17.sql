/*
 * Use a JOIN to order the countries by most profitable,
 * where the profit is the total amount that all customers from that country have payed.
 * Use tables payment, rental, customer, address, city, and country.
 * Order by country alphabetically.
 */
SELECT country, sum(amount) AS "profit"
FROM payment 
JOIN rental ON rental.rental_id = payment.rental_id
JOIN customer ON rental.customer_id = customer.customer_id
JOIN address ON address.address_id = customer.address_id
JOIN city ON city.city_id = address.city_id
JOIN country ON city.country_id = country.country_id
GROUP BY country
ORDER BY country;
