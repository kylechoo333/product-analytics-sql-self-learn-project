DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS events;
DROP TABLE IF EXISTS transactions;

CREATE TABLE users (
  user_id INTEGER PRIMARY KEY,
  signup_date DATE,
  country TEXT,
  acquisition_channel TEXT
);

CREATE TABLE events (
    event_id INTEGER PRIMARY KEY,
    user_id INTEGER,
    event_date DATE,
    event_name TEXT
);

CREATE TABLE transactions (
    transaction_id INTEGER PRIMARY KEY,
    user_id INTEGER,
    transaction_date DATE,
    amount REAL
);

