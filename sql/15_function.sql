/*
 * Use a JOIN to count the number films in each category in the specified language.
 * Use table category, film_category, film, and language.
 */
CREATE OR REPLACE FUNCTION category_counts_by_language(language_given TEXT) RETURNS TABLE(name TEXT, count BIGINT) AS
$$
SELECT category.name, count(*) as "sum"
FROM category JOIN film_category USING (category_id)
JOIN film USING (film_id)
JOIN language USING (language_id)
WHERE language.name = language_given
GROUP BY category_id
ORDER BY name;
$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

SELECT * FROM category_counts_by_language('English');
SELECT * FROM category_counts_by_language('Italian');
SELECT * FROM category_counts_by_language('Japanese');
SELECT * FROM category_counts_by_language('Mandarin');
SELECT * FROM category_counts_by_language('French');
SELECT * FROM category_counts_by_language('German');
SELECT * FROM category_counts_by_language('Latin');
