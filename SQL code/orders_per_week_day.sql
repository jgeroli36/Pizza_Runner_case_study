WITH all_days AS (
  SELECT day_num, day_name
  FROM UNNEST([STRUCT(1 AS day_num, 'Sunday' AS day_name),
    STRUCT(2, 'Monday'),
    STRUCT(3, 'Tuesday'),
    STRUCT(4, 'Wednesday'),
    STRUCT(5, 'Thursday'),
    STRUCT(6, 'Friday'),
    STRUCT(7, 'Saturday')]))
SELECT 
  d.day_name AS week_day, COUNT(c.order_id) AS order_count
FROM all_days d
LEFT JOIN `pizza-runner-508123.pizza_runner.customer_orders_cleaned` c
  ON d.day_name = FORMAT_TIMESTAMP('%A', c.order_time, 'UTC')
GROUP BY d.day_num, d.day_name
ORDER BY d.day_num ASC