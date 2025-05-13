## ✅ Objective: Identify and Create Indexes to Improve Query Performance

### 🎯 Objective:
To improve query performance by identifying and creating indexes on high-usage columns in the `User`, `Booking`, and `Property` tables.

---

### 🔍 Step 1: Identify High-Usage Columns
Based on the queries written so far and the frequent usage of certain columns in `JOIN`, `WHERE`, `GROUP BY`, and `ORDER BY` clauses, the following columns are identified for indexing:

| Table      | Column         | Reason for Indexing                      |
|------------|----------------|------------------------------------------|
| `user`     | `user_id`      | Frequently used in `JOIN` operations with `booking` |
| `booking`  | `user_id`      | Used in `JOIN` and filtering operations  |
| `booking`  | `property_id`  | Used in `JOIN` and aggregations          |
| `property` | `property_id`  | Used in `JOIN` and ordering operations   |

---

### 🛠️ Step 2: Create Indexes
The following SQL commands are used to create the indexes. These commands will be saved in a file named `database_index.sql`.

```sql
-- database_index.sql

-- Index on user_id in user table
CREATE INDEX IF NOT EXISTS idx_user_user_id ON "user"(user_id);

-- Index on user_id in booking table
CREATE INDEX IF NOT EXISTS idx_booking_user_id ON booking(user_id);

-- Index on property_id in booking table
CREATE INDEX IF NOT EXISTS idx_booking_property_id ON booking(property_id);

-- Index on property_id in property table
CREATE INDEX IF NOT EXISTS idx_property_property_id ON property(property_id);



EXPLAIN ANALYZE
SELECT u.user_id, COUNT(b.booking_id) AS total_bookings
FROM booking AS b
JOIN "user" AS u ON u.user_id = b.user_id
GROUP BY u.user_id
ORDER BY total_bookings DESC;
