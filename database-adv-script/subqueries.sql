USE alx_airbnb;
SELECT property, AVG(rating)
FROM
	(SELECT property.property_id AS property, review.rating AS rating
	FROM property
	JOIN review
	ON review.property_id = property.property_id) inner_table
GROUP BY 1
HAVING AVG(rating) > 4.0;


SELECT u.*
FROM user u
WHERE (
    SELECT COUNT(*)
    FROM booking b
    WHERE b.user_id = u.user_id
) > 3;

