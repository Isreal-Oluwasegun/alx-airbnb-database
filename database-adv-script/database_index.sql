-- Index on booking.start_date — useful for date range queries and partitioning
CREATE INDEX idx_booking_start_date ON booking(start_date);

-- Index on review.rating — helps with filtering or averaging ratings
CREATE INDEX idx_review_rating ON review(rating);

-- Index on user.email — often used in authentication or lookup
CREATE INDEX idx_user_email ON user(email);

-- Index on property.city — helpful if you're filtering or ranking properties by city
CREATE INDEX idx_property_city ON property(city);

-- 
EXPLAIN ANALYZE
SELECT * FROM booking
WHERE start_date >= '2025-07-01';
