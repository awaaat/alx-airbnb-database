# Booking Table Partitioning Performance Report

## Objective

Improve query performance on the large `booking` table by implementing table partitioning based on the `start_date` column.

## Method

- Renamed the original `booking` table to `booking_backup`.
- Created a new `booking` table partitioned by `start_date`.
- Added yearly partitions: `booking_2022`, `booking_2023`, and `booking_2024`.
- Copied existing data from the backup table into the partitioned structure.
- Ran `EXPLAIN ANALYZE` on queries filtering by date.

## Results

### Before Partitioning

```sql
EXPLAIN ANALYZE SELECT * FROM booking_backup
WHERE start_date BETWEEN '2023-06-01' AND '2023-06-30';
