-- Step 1: Rename booking to backup only if it exists
DO $$
BEGIN
    IF EXISTS (SELECT FROM information_schema.tables 
               WHERE table_name = 'booking') THEN
        ALTER TABLE booking RENAME TO booking_backup;
    END IF;
END $$;

-- Step 2: Create partitioned booking table (booking_id + start_date = PK)
CREATE TABLE booking (
    booking_id INT NOT NULL,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(50),
    created_at TIMESTAMP DEFAULT NOW(),
    PRIMARY KEY (booking_id, start_date)
) PARTITION BY RANGE (start_date);

-- Step 3: Create yearly partitions
CREATE TABLE booking_2022 PARTITION OF booking
    FOR VALUES FROM ('2022-01-01') TO ('2023-01-01');

CREATE TABLE booking_2023 PARTITION OF booking
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE booking_2024 PARTITION OF booking
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

-- Step 4: Optional - copy data if backup exists
DO $$
BEGIN
    IF EXISTS (SELECT FROM information_schema.tables 
               WHERE table_name = 'booking_backup') THEN
        INSERT INTO booking (booking_id, user_id, property_id, start_date, end_date, status, created_at)
        SELECT booking_id, user_id, property_id, start_date, end_date, status, created_at
        FROM booking_backup;
    END IF;
END $$;

-- Step 5: EXPLAIN ANALYZE query
EXPLAIN ANALYZE
SELECT * FROM booking
WHERE start_date BETWEEN '2023-06-01' AND '2023-06-30';
