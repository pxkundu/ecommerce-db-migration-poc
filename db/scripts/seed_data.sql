USE ecommerce_db;

INSERT INTO users (name, email, password_hash, role, phone, metadata) VALUES
('John Doe', 'john.doe@example.com', 'hashed_password_1', 'CUSTOMER', '123-456-7890', '{"theme": "dark"}'),
('Jane Smith', 'jane.smith@example.com', 'hashed_password_2', 'ADMIN', '987-654-3210', '{"theme": "light"}'),
('Vendor Corp', 'vendor@corp.com', 'hashed_password_3', 'VENDOR', '555-123-4567', '{"verified": true}'),
('Alice Brown', 'alice.brown@example.com', 'hashed_password_4', 'CUSTOMER', '444-555-6666', NULL);

INSERT INTO addresses (user_id, address_type, street, city, state, country, postal_code, is_default) VALUES
(1, 'SHIPPING', '123 Main St', 'New York', 'NY', 'USA', '10001', TRUE),
(1, 'BILLING', '123 Main St', 'New York', 'NY', 'USA', '10001', FALSE),
(4, 'SHIPPING', '456 Oak Ave', 'Los Angeles', 'CA', 'USA', '90001', TRUE);

INSERT INTO vendors (company_name, contact_name, email, phone, address) VALUES
('TechTrend Innovations', 'Mike Johnson', 'mike@techtrend.com', '555-123-4567', '789 Tech Park, San Francisco, CA'),
('Gadget World', 'Sarah Lee', 'sarah@gadgetworld.com', '555-987-6543', '101 Gadget St, Seattle, WA');

INSERT INTO product_categories (name, parent_category_id) VALUES
('Electronics', NULL),
('Laptops', 1),
('Smartphones', 1),
('Accessories', NULL);

INSERT INTO products (name, description, price, vendor_id, category_id, metadata) VALUES
('Gaming Laptop', 'High-performance gaming laptop', 1299.99, 1, 2, '{"color": "black"}'),
('Smartphone Pro', 'Latest 5G smartphone', 799.99, 2, 3, '{"color": "silver"}'),
('Wireless Earbuds', 'True wireless earbuds', 99.99, 1, 4, NULL);

INSERT INTO inventory (product_id, quantity, restock_level, last_restocked_at) VALUES
(1, 50, 10, '2025-05-01 10:00:00'),
(2, 100, 20, '2025-05-15 12:00:00'),
(3, 200, 50, '2025-05-20 14:00:00');

INSERT INTO customers (customer_id, user_id, loyalty_points, date_of_birth) VALUES
(1, 1, 100, '1990-03-15'),
(2, 4, 50, '1985-07-22');

INSERT INTO orders (customer_id, order_date, status, shipping_address_id, billing_address_id, total_amount) VALUES
(1, '2025-05-25 09:00:00', 'PENDING', 1, 2, 1399.98),
(2, '2025-05-26 11:00:00', 'PROCESSING', 3, 3, 99.99);

INSERT INTO order_items (order_id, product_id, quantity, price_at_order_time) VALUES
(1, 1, 1, 1299.99),
(1, 3, 1, 99.99),
(2, 3, 1, 99.99);

INSERT INTO payments (order_id, payment_method, payment_status, amount, payment_time) VALUES
(1, 'CREDIT_CARD', 'PENDING', 1399.98, NULL),
(2, 'PAYPAL', 'COMPLETED', 99.99, '2025-05-26 11:05:00');

INSERT INTO shipments (order_id, shipment_status, tracking_number, carrier, shipped_date) VALUES
(1, 'PENDING', NULL, NULL, NULL),
(2, 'IN_TRANSIT', 'TRK123456', 'UPS', '2025-05-26 12:00:00');

INSERT INTO product_reviews (product_id, customer_id, rating, review_text) VALUES
(3, 1, 4, 'Great sound quality, but battery life could be better'),
(1, 2, 5, 'Amazing performance for gaming!');

INSERT INTO notifications (user_id, message, read_status) VALUES
(1, 'Your order #1 has been placed.', FALSE),
(4, 'Your order #2 is being processed.', FALSE);

INSERT INTO audit_log (user_id, table_name, operation, row_data) VALUES
(2, 'orders', 'INSERT', '{"order_id": 1, "customer_id": 1}', '2025-05-25 09:00:00'),
(2, 'orders', 'UPDATE', '{"order_id": 2, "status": "PROCESSING"}', '2025-05-26 11:00:00');

INSERT INTO schema_versions (version_label, applied_by) VALUES
('1.0.0', 'admin');
