INSERT INTO users (user_id, signup_date, country, acquisition_channel) VALUES
(1, '2026-03-01', 'Singapore', 'Instagram'),
(2, '2026-03-01', 'Singapore', 'Google'),
(3, '2026-03-02', 'Malaysia', 'Instagram'),
(4, '2026-03-02', 'Singapore', 'Referral'),
(5, '2026-03-03', 'Indonesia', 'Google'),
(6, '2026-03-03', 'Singapore', 'Referral'),
(7, '2026-03-04', 'Malaysia', 'Instagram'),
(8, '2026-03-04', 'Singapore', 'Google');

INSERT INTO events (event_id, user_id, event_date, event_name) VALUES
(1, 1, '2026-03-01', 'app_open'),
(2, 1, '2026-03-02', 'app_open'),
(3, 1, '2026-03-03', 'purchase_intent'),
(4, 2, '2026-03-01', 'app_open'),
(5, 2, '2026-03-05', 'app_open'),
(6, 3, '2026-03-02', 'app_open'),
(7, 3, '2026-03-03', 'app_open'),
(8, 4, '2026-03-02', 'app_open'),
(9, 4, '2026-03-06', 'purchase_intent'),
(10, 5, '2026-03-03', 'app_open'),
(11, 5, '2026-03-04', 'app_open'),
(12, 5, '2026-03-05', 'app_open'),
(13, 6, '2026-03-03', 'app_open'),
(14, 7, '2026-03-04', 'app_open'),
(15, 7, '2026-03-05', 'purchase_intent'),
(16, 8, '2026-03-04', 'app_open');

INSERT INTO transactions (transaction_id, user_id, transaction_date, amount) VALUES
(1, 1, '2026-03-03', 25.00),
(2, 1, '2026-03-10', 40.00),
(3, 2, '2026-03-05', 15.00),
(4, 4, '2026-03-06', 60.00),
(5, 5, '2026-03-05', 20.00),
(6, 5, '2026-03-07', 35.00),
(7, 7, '2026-03-06', 45.00);