
select count(*) from inventory where film_id=439;
#solution with join

#solution with join 
select count(*)  from inventory
			join film on film.film_id=inventory.film_id
			where film.title = "Hunchback Impossible";

			-- solution with subquery
			SELECT COUNT(*)
			FROM (
				SELECT inventory_id
				FROM inventory
				JOIN film ON film.film_id = inventory.film_id
				WHERE film.title = 'Hunchback Impossible'
			) AS subquery_alias;
     #2
     SELECT
    title AS film_title,
    length AS film_length
FROM
    film
WHERE
    length > (SELECT AVG(length) FROM film);

    
    #3
   SELECT
    actor.actor_id,
    actor.first_name,
    actor.last_name
FROM
    actor
WHERE
    actor.actor_id IN (
        SELECT
            film_actor.actor_id
        FROM
            film_actor
        JOIN
            film
        ON
            film.film_id = film_actor.film_id
        WHERE
            film.title = 'Alone Trip'
    );

#4
SELECT f.title
FROM film f
WHERE f.film_id IN (
  SELECT fc.film_id
  FROM film_category fc
  JOIN category c
  USING (category_id)
  WHERE c.name = 'Family'
);

#5
SELECT
    first_name,
    last_name,
    email
FROM
    customer
WHERE
    address_id IN (
        SELECT
            address_id
        FROM
            address
        WHERE
            city_id IN (
                SELECT
                    city_id
                FROM
                    city
                WHERE
                    country_id IN (
                        SELECT
                            country_id
                        FROM
                            country
                        WHERE
                            country = 'Canada'
                    )
            )
    );
#joins
SELECT
    c.first_name,
    c.last_name,
    c.email
FROM
    customer AS c
JOIN
    address AS a
ON
    c.address_id = a.address_id
JOIN
    city AS ci
ON
    a.city_id = ci.city_id
JOIN
    country AS co
ON
    ci.country_id = co.country_id
WHERE
    co.country = 'Canada';
