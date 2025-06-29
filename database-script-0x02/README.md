# 🏡 ALX Airbnb Database Project

This project is part of the **ALX Software Engineering Backend curriculum**, focusing on database design, normalization, schema definition, and data seeding. The goal is to build a scalable and normalized relational database system simulating an Airbnb-like platform.

---

## 📚 Project Overview

This database system powers key functionalities for:
- User and Role management
- Property hosting and reviews
- Booking and payments
- Messaging between users

It follows industry best practices in normalization, referential integrity, and schema clarity.

---

## 🧱 Schema Overview

| Entity         | Description                                                 |
|----------------|-------------------------------------------------------------|
| `User`         | Registered users, both guests and hosts                     |
| `Role`         | Roles such as `host` and `user`                             |
| `UserRole`     | Assigns roles to users (many-to-many)                       |
| `Property`     | Listings created by hosts                                   |
| `Review`       | Ratings and comments by guests                              |
| `Booking`      | Reservation details including price and duration            |
| `Status`       | States like `pending`, `confirmed`, `canceled`              |
| `Message`      | Communication between users                                 |
| `PaymentMethod`| Accepted payment types: credit_card, paypal, stripe         |
| `Payment`      | Links a booking to a payment record                         |

---

## ✅ Features

- Enforces **data integrity** via foreign keys and constraints
- Follows **3NF normalization**
- Includes **timestamp tracking** for auditing (created_at, updated_at)
- Implements **check constraints** for controlled enums (e.g., rating, status, payment type)

---

## 🛠️ Project Files

| File                      | Description                                |
|---------------------------|--------------------------------------------|
| `schema.sql`              | All `CREATE TABLE` statements               |
| `seed.sql`                | Sample data inserts for testing            |
| `normalization.md`        | Explanation of normalization steps         |
| `requirements.md`         | ERD explanation and relational breakdown   |

---

## 📂 Sample Data

The database is pre-filled with realistic entries for:
- 4 Users (with roles: Host and User)
- 2 Properties in Nigeria (Lagos and Enugu)
- 2 Successful Bookings (with confirmed status)
- Reviews, Messages, and Payments across use cases

---

## 📊 ER Diagram

See the `ERD/` directory for a visual representation of all entities and their relationships.

---

## 🚀 Setup Instructions

To run this project locally:

```bash
# Connect to MySQL and run:
SOURCE schema.sql;
SOURCE seed.sql;
