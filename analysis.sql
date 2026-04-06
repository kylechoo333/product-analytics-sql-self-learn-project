======1. Max SignUp Channel======
-- Finding out which channel has the most users sign up from
SELECT
    acquisition_channel,
    COUNT(*) AS total_number_signup
FROM users
GROUP BY acquisition_channel
ORDER BY total_number_signup DESC;


======2. DAU======
SELECT 
    event_date,
    COUNT(DISTINCT user_id) AS total_users
FROM events
GROUP BY event_date
ORDER BY event_date;


======3. Revenue by Acquisition Channel======
WITH channel_spending AS (
  SELECT 
    u.acquisition_channel,
    SUM(t.amount) AS total_revenue
  FROM users u 
  JOIN transactions t 
    ON u.user_id = t.user_id
  GROUP BY u.acquisition_channel
)
SELECT *
FROM channel_spending
ORDER BY total_revenue DESC;


======4. Day 1 Retention======
SELECT
    COUNT(DISTINCT u.user_id) AS total_users,
    COUNT(DISTINCT CASE
        WHEN e.event_date = DATE(u.signup_date, '+1 day')
        THEN u.user_id   
    END) AS retained_users,
    ROUND(
      COUNT(DISTINCT CASE
        WHEN e.event_date = DATE(u.signup_date, '+1 day')
        THEN u.user_id
      END) * 100.0 / COUNT(DISTINCT u.user_id),
      2
    ) AS retention_rate
FROM users u
LEFT JOIN events e 
    ON u.user_id = e.user_id;


======5. Behaviour vs Revenue======
WITH early_engagement AS (
  SELECT    
    u.user_id, 
    COUNT(e.event_id) AS events_first_3_days
  FROM users u
  LEFT JOIN events e
    ON u.user_id = e.user_id
    AND e.event_date BETWEEN u.signup_date AND DATE(u.signup_date, '+2 day')
  GROUP BY u.user_id
)
SELECT 
    ee.user_id,
    ee.events_first_3_days,
    COALESCE(SUM(t.amount), 0) AS total_transaction_amount
FROM early_engagement ee
LEFT JOIN transactions t
    ON ee.user_id = t.user_id
GROUP BY ee.user_id, ee.events_first_3_days
ORDER BY ee.events_first_3_days DESC, total_transaction_amount DESC;