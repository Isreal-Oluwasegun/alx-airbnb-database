# Advanced Join Queries — ALX Airbnb Database

This README documents the use of advanced SQL join queries to extract meaningful data from the alx_airbnb database. The queries demonstrate INNER JOIN, LEFT JOIN, and FULL OUTER JOIN operations applied across key tables: booking, user, property, and review

## Database Used
```sql
USE alx_airbnb;
```
Activates the target database containing Airbnb-style data models for users, properties, bookings, and review

## Query 1: Bookings with User Details
```sql 
SELECT booking.*, user.*
FROM booking
INNER JOIN user
ON booking.user_id = user.user_id;
```
Purpose:
Retrieves all bookings that are linked to users, showing full booking and user data. This filters out any orphaned bookings without valid users.

Join Type:
INNER JOIN — returns only matched rows where booking.user_id = user.user_id.

## Query 2: Property Listings and Reviews
```sql
SELECT property.*, review.*
FROM property
LEFT JOIN review
ON property.property_id = review.property_id
ORDER BY property_id ASC;
```
Purpose:
Displays all properties, including those without any reviews. Useful for identifying listings that haven’t been rated.

Join Type:
LEFT JOIN — includes all records from property and matched records from review

## Query 3: Comprehensive User–Booking Overview
```SQL
SELECT user.*, booking.*
FROM booking
FULL OUTER JOIN user ON booking.user_id = user.user_id
```
Purpose:
Combines booking and user data to ensure no data is excluded:

Users without bookings

Bookings without valid user associations

Join Type:
FULL OUTER JOIN equivalent using UNION — since MySQL lacks native FULL OUTER JOIN, this query merges LEFT and RIGHT JOINs to simulate that functionality.

