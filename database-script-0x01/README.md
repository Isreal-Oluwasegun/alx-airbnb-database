Sure thing, Isreal! Here's a polished and professional `README.md` file for your **Airbnb-like database schema**—structured for clarity and ready to drop into your project:

---

```markdown
# 🏡 ALX Airbnb Clone — Database Schema

This project sets up a relational database schema for an Airbnb-style booking platform using MySQL. It includes user management, property listings, bookings, payments, messaging, and reviews.

---

## 🗄️ Database Setup

### 📦 Database
- **Name:** `alx_airbnb`

To create and use this database:
```sql
CREATE DATABASE alx_airbnb;
USE alx_airbnb;
```

---

## 🏗️ Tables & Relationships

### 👤 `User`
Stores user profiles.

| Column         | Type         | Description                     |
|----------------|--------------|---------------------------------|
| `user_id`      | INT (PK)     | Unique user ID                  |
| `first_name`   | VARCHAR(50)  | Required                        |
| `last_name`    | VARCHAR(50)  | Required                        |
| `email`        | VARCHAR(50)  | Unique                          |
| `phone_number` | VARCHAR(11)  | Optional                        |
| `created_at`   | TIMESTAMP    | Defaults to current time        |

---

### 🛠️ `Role` & `UserRole`
Defines roles and assigns them to users (many-to-many).

- `Role`:
  - `role_id` INT (PK)
  - `role_name` VARCHAR(5)

- `UserRole`:
  - Composite PK: (`user_id`, `role_id`)
  - FKs to `User` and `Role`

---

### 🏘️ `Property`
Holds listings posted by users.

| Column         | Type             | Description              |
|----------------|------------------|--------------------------|
| `property_id`  | INT (PK)         | Unique property ID       |
| `host_id`      | INT (FK to User) | The listing’s owner      |
| ...            | ...              | Address, price, details  |
| `created_at`   | TIMESTAMP        | Auto-generated           |
| `updated_at`   | TIMESTAMP        | Auto-updated             |

---

### 💬 `Message`
Tracks direct user-to-user communication.

- `message_id`, `sender_id`, `recipient_id`
- `message_body`, `sent_at`
- FKs to `User`

---

### ⭐ `Review`
Guests can rate and review properties.

- 1–5 star `rating`
- `comment`
- FKs to `User` and `Property`

---

### 📅 `Booking`
Tracks reservations for properties.

| Field        | Purpose                                |
|--------------|----------------------------------------|
| `start_date`, `end_date` | Reservation window          |
| `total_price` | Based on number of nights             |
| `status_id`   | FK to `Status` (e.g. confirmed)       |

---

### 📍 `Status`
Tracks booking states:
- `pending`
- `confirmed`
- `canceled`

---

### 💳 `PaymentMethod` & `Payment`
Users pay using Stripe, PayPal, or credit cards.

- `method_id`, `type` (with check constraints)
- `payment_id`, `amount`, `booking_id`, `payment_date`

---

## 🔗 Relationships Summary

- `User` ↔️ `Role` via `UserRole`
- `User` ↔️ `Property` (`host_id`)
- `User` ↔️ `Booking`
- `User` ↔️ `Message` (sender/recipient)
- `Booking` ↔️ `Status`
- `Booking` ↔️ `Payment` via `booking_id`
- `Property` ↔️ `Review`
- `Property` ↔️ `Booking`
- `Payment` ↔️ `PaymentMethod`

---

## ✅ Notes

- Enforces **referential integrity** with foreign keys
- Uses **timestamp defaults** for time tracking
- Normalized for scalability and maintainability
- `CHECK` constraints ensure valid values for `rating`, `status`, and `payment type`

---

## 📚 License

This schema was built as part of the **ALX Software Engineering Backend curriculum**. For educational and demonstration purposes.

```
