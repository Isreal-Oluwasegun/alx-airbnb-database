USE alx_airbnb;
INSERT INTO User (user_id, first_name, last_name, email, phone_number) VALUES
(1, 'Tolu', 'Adams', 'tolu.adams@example.com', '08012345678'),
(2, 'Fatima', 'Bello', 'fatima.bello@example.com', '08198765432'),
(3, 'Ken', 'Okoro', 'ken.okoro@example.com', '07011223344'),
(4, 'Ada', 'Ike', 'ada.ike@example.com', '08056789012');

INSERT INTO Role (role_id, role_name) VALUES
(1, 'host'),
(2, 'user');

INSERT INTO UserRole (user_id, role_id) VALUES
(1, 1),
(2, 2),
(3, 2),
(4, 1);

INSERT INTO Property (property_id, host_id, name, description, street, city, state, country, pricepernight) VALUES
(1, 1, 'Tolu’s Penthouse', 'A modern flat with ocean views', '1 Banana Island Rd', 'Lagos', 'Lagos', 'Nigeria', 550.00),
(2, 4, 'Ada’s Cozy Spot', 'A quiet bungalow near downtown', '24 Palm Grove Street', 'Enugu', 'Enugu', 'Nigeria', 250.00);

INSERT INTO Message (message_id, sender_id, recipient_id, message_body) VALUES
(1, 2, 1, 'Hi, is Tolu’s place available in June?'),
(2, 1, 2, 'Yes, it’s available. Let me know your exact dates.'),
(3, 3, 4, 'Hey Ada! Can you allow pets?');

INSERT INTO Review (review_id, property_id, user_id, rating, comment) VALUES
(1, 1, 2, 5, 'Beautiful home and great host. Highly recommend!'),
(2, 2, 3, 4, 'Lovely experience but the location was a bit tricky.');

INSERT INTO Status (status_id, name) VALUES
(1, 'pending'),
(2, 'confirmed'),
(3, 'canceled');

INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status_id) VALUES
(1, 1, 2, '2025-08-01', '2025-08-05', 2200.00, 2),
(2, 2, 3, '2025-07-15', '2025-07-17', 500.00, 2);

INSERT INTO PaymentMethod (method_id, type) VALUES
(1, 'credit_card'),
(2, 'paypal'),
(3, 'stripe');

INSERT INTO Payment (payment_id, booking_id, method_id, amount) VALUES
(1, 1, 1, 2200.00),
(2, 2, 3, 500.00);
