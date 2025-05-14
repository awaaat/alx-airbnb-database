# Optimization Report: Booking Data Query

## Objective

To retrieve all booking records with associated user, property, and payment details efficiently. The original query involved multiple joins that, without optimization, led to slower performance on larger datasets.

---

## 1. Initial Query

```sql
SELECT * FROM booking AS b
JOIN "user" AS u ON b.user_id = u.user_id
JOIN property AS p ON b.property_id = p.property_id
JOIN payment AS py ON py.booking_id = b.booking_id;
