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
-- Initial query retrieving bookings with user, property, and payment details
SELECT *
FROM booking AS b
JOIN "user" AS u ON b.user_id = u.user_id
JOIN property AS p ON b.property_id = p.property_id
JOIN payment AS py ON py.booking_id = b.booking_id
WHERE u.user_id IS NOT NULL
  AND p.property_id IS NOT NULL
  AND py.booking_id IS NOT NULL;

