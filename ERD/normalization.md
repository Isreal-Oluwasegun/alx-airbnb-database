# 📘 Normalization Review: Achieving 3NF in the Airbnb Database

This document outlines the normalization improvements applied to the Airbnb database schema in order to achieve **Third Normal Form (3NF)**. It explains the detected violations, the refactoring steps taken, and how each issue was resolved.

---


## 3NF Violations and Fixes

### User Role as Raw Text

#### Violation:
Initially, the `User` table stored the user’s role as free text:

```sql
User (
  user_id PRIMARY KEY,
  full_name TEXT,
  role TEXT
)


Functional & transitive dependency: user_id → role, and role → permissions

This caused data duplication, inconsistency, and blocked permission mapping

Fix:
Created a separate Role table and introduced a join table UserRole for a many-to-many relationship:

sql
Role (
  role_id PRIMARY KEY,
  role_name TEXT UNIQUE
)

User (
  user_id PRIMARY KEY,
  full_name TEXT
)

UserRole (
  user_id INT,
  role_id INT,
  PRIMARY KEY (user_id, role_id),
  FOREIGN KEY (user_id) REFERENCES User(user_id),
  FOREIGN KEY (role_id) REFERENCES Role(role_id)
)
Now each user can have multiple roles, and each role can be applied to many users.


### Property Location as One Column
#### Violation:
Property addresses were stored as a single column:

sql
location TEXT -- e.g., "17 Lekki Phase 1, Lagos"
This violated 1NF, and blocked filtering or indexing by region

Fix:
Split into multiple atomic fields:

sql
Property (
  property_id PRIMARY KEY,
  street TEXT,
  city TEXT,
  state TEXT,
  country TEXT
)
This enabled precise querying and upheld atomicity.


### Payment Method as Free Text
#### Violation:
Storing payment_method directly in the Payment table introduced:

- Repetition of values like 'card', 'wallet', 'transfer'

- No enforced consistency or structure

Fix:
Created a PaymentMethod lookup table:

sql
PaymentMethod (
  method_id PRIMARY KEY,
  name TEXT UNIQUE
)

Payment (
  payment_id PRIMARY KEY,
  method_id INT REFERENCES PaymentMethod(method_id)
)
Payment types are now normalized and referentially constrained.