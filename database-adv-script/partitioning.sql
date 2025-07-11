CREATE TABLE booking_partitioned (
    booking_id INT,
    user_id INT,
    property_id INT,
    start_date DATE NOT NULL,
    end_date DATE,
    PRIMARY KEY (booking_id, start_date)
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION p_future VALUES LESS THAN MAXVALUE
);

EXPLAIN SELECT * FROM booking
WHERE start_date BETWEEN '2025-07-01' AND '2025-07-31';
