
-- Inner Join of booking and users
SELECT * 
FROM booking as bk
INNER JOIN "user" as usr
ON bk.user_id = usr.user_id

-- Left join of property and reviews
SELECT * 
FROM  property as pr
LEFT JOIN review as rv
ON pr.property_id = rv.property_id
--Full outer join of users and booking
SELECT * 
FROM "user" as usr
FULL OUTER JOIN booking as bk 
ON usr.user_id = bk.user_id