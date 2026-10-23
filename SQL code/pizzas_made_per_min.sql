WITH order_prep_metrics AS (
  SELECT c.order_id, COUNT(c.order_id) AS pizza_count, 
    TIMESTAMP_DIFF(r.pickup_time, c.order_time, MINUTE) AS prep_time
  FROM `pizza-runner-508123.pizza_runner.customer_orders_cleaned` c
  JOIN `pizza-runner-508123.pizza_runner.runner_orders_cleaned` r
    ON c.order_id = r.order_id
  WHERE r.cancellation IS NULL
  GROUP BY c.order_id, r.pickup_time, c.order_time)
SELECT order_id, pizza_count, prep_time,
  ROUND(SAFE_DIVIDE(prep_time, pizza_count), 2) AS pizzas_made_per_min
FROM order_prep_metrics
ORDER BY prep_time DESC
LIMIT 5;