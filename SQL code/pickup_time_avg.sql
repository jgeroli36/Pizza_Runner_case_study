SELECT 
  CONCAT(ROUND(AVG(TIMESTAMP_DIFF(r.pickup_time, c.order_time, MINUTE)), 2), ' minutes') AS pickup_time_avg
FROM `pizza-runner-508123.pizza_runner.customer_orders_cleaned` c
JOIN `pizza-runner-508123.pizza_runner.runner_orders_cleaned` r
  ON c.order_id = r.order_id
WHERE r.cancellation IS NULL