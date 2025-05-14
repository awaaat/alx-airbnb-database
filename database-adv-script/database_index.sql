-- Index on user_id in "user" table (quotes needed because "user" is a reserved keyword)
CREATE INDEX IF NOT EXISTS idx_user_user_id ON "user" (user_id);

-- Index on user_id in booking table
CREATE INDEX IF NOT EXISTS idx_booking_user_id ON booking (user_id);

-- Index on property_id in booking table
CREATE INDEX IF NOT EXISTS idx_booking_property_id ON booking (property_id);

-- Index on property_id in property table
CREATE INDEX IF NOT EXISTS idx_property_property_id ON property (property_id);


EXPLAIN ANALYZE
SELECT u.user_id, COUNT(b.booking_id) AS total_bookings
FROM booking AS b
JOIN "user" AS u ON u.user_id = b.user_id
GROUP BY u.user_id
ORDER BY total_bookings DESC;