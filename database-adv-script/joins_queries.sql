USE alx_airbnb;
SELECT booking.*, user.*
FROM booking
INNER JOIN user
ON booking.user_id = user.user_id;
 
   
SELECT property.*, review.*
FROM property
LEFT JOIN review
ON property.property_id = review.property_id;


SELECT user.*,booking.*
FROM booking
LEFT JOIN user ON booking.user_id = user.user_id

UNION

SELECT user.*, booking.*
FROM booking
RIGHT JOIN user ON booking.user_id = user.user_id;
