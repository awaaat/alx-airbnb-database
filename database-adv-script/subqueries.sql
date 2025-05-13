-- Write a query to 
--find all properties where the average rating is greater than 4.0 using a subquery

SELECT * 
    FROM property as pt
    WHERE pt.property_id IN (
      SELECT rv.property_id
      FROM review as rv
      GROUP BY rv.property_id
    HAVING AVG(rv.rating) > 4
    );


-- Write a correlated subquery to find users who have made more than 3 bookings.
SELECT * FROM "user" as u  
WHERE ( 
    SELECT COUNT(*)
    FROM booking as b
    where b.user_id = u.user_id
    ) > 3;