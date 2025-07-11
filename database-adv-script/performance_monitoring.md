## Step 1: Monitor Queries Using `SHOW PROFILE` or `EXPLAIN ANALYZE`

### xample Target Query

```sql
SELECT * FROM booking WHERE start_date BETWEEN '2025-07-01' AND '2025-07-31';
```

### Use `SHOW PROFILE`

```sql
SET profiling = 1;

-- Run your query
SELECT * FROM booking WHERE start_date BETWEEN '2025-07-01' AND '2025-07-31';

-- View profiling details
SHOW PROFILE FOR QUERY 1;
```

> This exposes time spent in stages like parsing, optimizing, execution, and sending result to client.

### Use `EXPLAIN`

```sql
EXPLAIN SELECT * FROM booking WHERE start_date BETWEEN '2025-07-01' AND '2025-07-31';
```

> Key fields to inspect: `type`, `key`, `rows`, `Extra`

---

## Step 2: Identify Bottlenecks

Common performance issues might include:

| Symptom                  | Meaning                            | Example Fix                    |
|--------------------------|-------------------------------------|--------------------------------|
| `type = ALL`             | Full table scan                     | Add index on `start_date`      |
| `key = NULL`             | No index used                       | Create relevant index          |
| High `rows` count        | Scanning too many rows              | Filter better or restructure   |
| `Extra = Using where`    | Filtering done after scanning       | Make filtering indexed         |

---

## Step 3: Apply Fixes

### Create Needed Index

```sql
CREATE INDEX idx_booking_start_date ON booking(start_date);
```

Or if already partitioned and MySQL requires composite PK:

```sql
ALTER TABLE booking DROP PRIMARY KEY;
ALTER TABLE booking ADD PRIMARY KEY (booking_id, start_date);
```

Then create index:

```sql
CREATE INDEX idx_booking_date_range ON booking(start_date);
```

---

## Step 4: Write Your Report (`performance_monitoring.md`)

```markdown
# Database Performance Monitoring Report

## Query Tested
```sql
SELECT * FROM booking WHERE start_date BETWEEN '2025-07-01' AND '2025-07-31';
```

---

## Before Optimization

- Access Type: `ALL` (Full Table Scan)
- Key Used: `NULL`
- Rows Scanned: ~48,000
- Execution Time: ~950 ms

---

## After Optimization

- Created index: `idx_booking_start_date`
- Access Type: `range`
- Key Used: `idx_booking_start_date`
- Rows Scanned: ~3,500
- Execution Time: ~160 ms

**Performance Improved by ~83%**

---

## Conclusion

Proper indexing and schema adjustment (partition-aware PK) dramatically reduced query time and row scan volume. Regular profiling ensures scalability across growing data.
```

