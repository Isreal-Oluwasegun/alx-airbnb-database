USE alx_airbnb;
SELECT  user.user_id,  COUNT(booking.booking_id)
FROM booking
INNER JOIN user
ON booking.user_id = user.user_id
GROUP BY user.user_id;

SELECT 
property_id,
COUNT(*) AS total_bookings,
RANK() OVER (ORDER BY COUNT(*) DESC) AS booking_rank,
ROW_NUMBER() OVER(ORDER BY COUNT(*) DESC) AS booking_row_num
FROM booking
GROUP BY property_id;

