SELECT b.*, u.*
FROM booking b
JOIN user u ON b.user_id = u.user_id
JOIN property p ON b.property_id = p.property_id
JOIN payment pay ON b.booking_id = pay.booking_id
WHERE b.booking_id = 1 AND u.user_id = 2;

EXPLAIN ANALYZE
SELECT b.*, u.*
FROM booking b
JOIN user u ON b.user_id = u.user_id
JOIN property p ON b.property_id = p.property_id
JOIN payment pay ON b.booking_id = pay.booking_id;

CREATE INDEX idx_booking_start_date ON booking(start_date);
CREATE INDEX idx_user_email ON user(email);
CREATE INDEX idx_property_city ON property(city);



