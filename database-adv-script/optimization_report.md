# Index Optimization Report

## Objective
Improve query performance across critical tables (`booking`, `user`, `property`, and `payment`) by applying meaningful indexing strategies and refactoring redundant indexes.

---

## Initial Observations

- Several queries filtered or joined using `user_id`, `property_id`, and `booking_id`.
- These columns are **already primary keys**, and thus auto-indexed.
- Creating additional indexes on them would be redundant and could **degrade performance** on write operations.

---

## Final Indexes Created

| Table     | Column         | Index Name                 | Reason for Indexing                          |
|-----------|----------------|----------------------------|----------------------------------------------|
| booking   | `start_date`   | `idx_booking_start_date`   | Date filtering for range-based queries       |
| user      | `email`        | `idx_user_email`           | Efficient lookup for authentication, joins   |
| property  | `city`         | `idx_property_city`        | Filtering and ranking properties by location |
| review    | `rating`       | `idx_review_rating`        | Speeding up average rating calculations      |

---

## Performance Measurement

**Query Tested:**
```sql
SELECT * FROM booking WHERE start_date >= '2025-07-01';
