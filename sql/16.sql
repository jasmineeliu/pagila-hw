/*
 * Use a JOIN to order the films by most profitable,
 * where the profit is the total amount that customers have paid for the film.
 * Use tables payment, rental, inventory, and film. 
 */
/*
SELECT title, sum(amount) AS "profit"
FROM film JOIN inventory USING (film_id)
JOIN rental USING (inventory_id)
JOIN payment USING (rental_id)
GROUP BY title
ORDER BY profit DESC;
*/
SELECT title, sum(amount) AS "profit"
FROM film
JOIN inventory ON inventory.film_id=film.film_id
JOIN rental ON inventory.inventory_id=rental.inventory_id
JOIN payment ON rental.rental_id=payment.rental_id
GROUP BY title
ORDER BY profit DESC;
