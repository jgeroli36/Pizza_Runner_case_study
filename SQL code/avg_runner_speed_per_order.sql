WITH runner_speed AS (
  SELECT runner_id, order_id,
    ROUND(distance_km / (duration_minutes / 60), 2) AS avg_km_per_hr
  FROM `pizza-runner-508123.pizza_runner.runner_orders_cleaned`
  WHERE cancellation IS NULL
  GROUP BY runner_id, order_id, avg_km_per_hr
  ORDER BY runner_id)
SELECT r.runner_id, r.order_id, r.avg_km_per_hr, 
  COUNT(c.pizza_id) AS pizza_count,
  FORMAT_TIMESTAMP("%l:%M %p", c.order_time) AS order_time
FROM `pizza-runner-508123.pizza_runner.customer_orders_cleaned` c
JOIN `runner_speed` r
  ON c.order_id = r.order_id
GROUP BY r.runner_id, r.order_id, r.avg_km_per_hr, order_time
ORDER BY r.avg_km_per_hr DESC

  