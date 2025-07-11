USE alx_airbnb;
SELECT booking.*, user.*
FROM booking
INNER JOIN user
ON booking.user_id = user.user_id;
 
SELECT property.*, review.*
FROM property
LEFT JOIN review
ON property.property_id = review.property_id
ORDER BY property_id ASC;

SELECT user.*, booking.*
FROM booking
FULL OUTER JOIN user ON booking.user_id = user.user_id
ORDER BY user_id ASC;
