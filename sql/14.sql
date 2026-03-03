/*
 * Use a JOIN to list all films in the "Family" category.
 * Use table category, film_category, and film.
 */
SELECT title 
FROM film JOIN film_category USING (film_id)
JOIN category USING (category_id)
WHERE name = 'Family'
ORDER BY title;
