CREATE DATABASE alx_airbnb;
USE alx_airbnb;

CREATE TABLE Role (
role_id INT PRIMARY KEY,
role_name VARCHAR(5) NOT NULL);
CREATE TABLE User(
user_id INT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
email VARCHAR(50) UNIQUE,
phone_number VARCHAR(11) NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
CREATE TABLE Message(
message_id INT NOT NULL,
sender_id INT NOT NULL,
recipient_id INT NOT NULL,
message_body TEXT NOT NULL,
sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (sender_id) REFERENCES User(user_id),
FOREIGN KEY (recipient_id) REFERENCES User(user_id));
CREATE TABLE UserRole(
user_id INT,
role_id INT,
PRIMARY KEY (user_id, role_id),
FOREIGN KEY (user_id) REFERENCES User(user_id),
FOREIGN KEY (role_id) REFERENCES Role(role_id));
CREATE TABLE Property(
property_id INT PRIMARY KEY,
host_id INT NOT NULL,
name VARCHAR(100) NOT NULL,
description TEXT NOT NULL,
street VARCHAR(100) NOT NULL,
city VARCHAR(100) NOT NULL,
state VARCHAR(100) NOT NULL,
country VARCHAR(100) NOT NULL,
pricepernight DECIMAL(8, 2) NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (host_id) REFERENCES User(user_id));
CREATE TABLE Review(
review_id INT PRIMARY KEY,
property_id INT NOT NULL,
user_id INT NOT NULL,
rating INT NOT NULL CHECK ( rating >= 1 AND rating <=5),
comment VARCHAR(255) NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (property_id) REFERENCES Property(property_id),
FOREIGN KEY (user_id) REFERENCES User(user_id));
CREATE TABLE Status(
status_id INT PRIMARY KEY,
name VARCHAR(20) NOT NULL UNIQUE CHECK (name IN ('pending', 'confirmed', 'canceled')));
CREATE TABLE Booking(
booking_id INT PRIMARY KEY,
property_id INT NOT NULL,
user_id INT NOT NULL,
start_date TIMESTAMP NOT NULL,
end_date TIMESTAMP NOT NULL,
total_price DECIMAL(8,2) NOT NULL,
status_id INT,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (status_id) REFERENCES Status(status_id),
FOREIGN KEY (property_id) REFERENCES Property(property_id),
FOREIGN KEY (user_id) REFERENCES User(user_id));
CREATE TABLE PaymentMethod(
method_id INT PRIMARY KEY,
type VARCHAR(20) NOT NULL UNIQUE CHECK (type IN ('credit_card', 'paypal', 'stripe')));
CREATE TABLE Payment(
payment_id INT PRIMARY KEY,
booking_id INT NOT NULL,
method_id INT NOT NULL,
amount DECIMAL(12, 2) NOT NULL,
payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (method_id) REFERENCES PaymentMethod(method_id));

