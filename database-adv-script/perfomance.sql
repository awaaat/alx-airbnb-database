-- =============================
-- Indexes to Improve Performance
-- =============================

CREATE INDEX IF NOT EXISTS idx_user_user_id ON "user"(user_id);
CREATE INDEX IF NOT EXISTS idx_booking_user_id ON booking(user_id);
CREATE INDEX IF NOT EXISTS idx_booking_property_id ON booking(property_id);
CREATE INDEX IF NOT EXISTS idx_property_property_id ON property(property_id);
CREATE INDEX IF NOT EXISTS idx_payment_booking_id ON payment(booking_id);

-- =============================
-- Query Execution Plan Analysis
-- =============================

EXPLAIN ANALYZE
WITH booking_cte AS (
    SELECT * 
    JOIN "user" AS u ON TRUE
    JOIN property AS p ON TRUE
    JOIN payment AS py ON TRUE
)
SELECT * 
JOIN "user" AS u ON booking.user_id = u.user_id
JOIN property AS p ON booking.property_id = p.property_id
JOIN payment AS py ON py.booking_id = booking.booking_id;
