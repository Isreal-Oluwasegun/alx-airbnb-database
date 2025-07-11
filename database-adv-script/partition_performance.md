# Partitioning Performance Report (MySQL Version)

## Objective
Improve performance on the large `booking` table by implementing MySQL-compliant RANGE partitioning using the `start_date` column.

---

## Partitioning Strategy
- Table partitioned by `YEAR(start_date)`
- Partition ranges: 2022, 2023, 2024, future
- Adjusted PK to include `start_date` for MySQL compatibility

---

## Query Performance

**Query Tested:**
```sql
SELECT * FROM booking WHERE start_date BETWEEN '2025-07-01' AND '2025-07-31';
