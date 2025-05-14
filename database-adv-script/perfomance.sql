
SELECT * from booking as b
JOIN "user" as u ON b.user_id = u.user_id
JOIN property as p on p.property_id = b.property_id
JOIN payment as py on py.booking_id = b.booking_id

ANALYZE EXPLAIN
SELECT * from booking as b
JOIN "user" as u ON b.user_id = u.user_id
JOIN property as p on p.property_id = b.property_id
JOIN payment as py on py.booking_id = b.booking_id