-- Write a query to find the total number of bookings made by each user, 
--using the COUNT function and GROUP BY clause.

SELECT
    u.user_id,
    COUNT(b.booking_id) as total_booking
FROM booking as b
JOIN "user" as u ON u.user_id = b.user_id
GROUP BY u.user_id
ORDER BY total_booking DESC
;  


--Use a window function (ROW_NUMBER, RANK) to rank properties 
--based on the total number of bookings they have received.
SELECT 
    p.property_id,
    p.name,
    p.location,
    COUNT(b.booking_id) as booking_count,
    RANK() OVER (
        PARTITION BY p.property_id
        ORDER BY COUNT(b.booking_id) DESC
    ) as booking_rank
    
FROM property as p
JOIN booking as b 
ON b.property_id = P.property_id
GROUP BY p.property_id, p.name, P.location
ORDER BY  booking_rank 