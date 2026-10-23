WITH deliverypace AS(
  SELECT b.order_id, b.runner_id, b.distance_km,
    ROUND(b.distance_km /
    CAST(b.duration_minutes AS FLOAT64) + 
    CAST(ROUND(TIMESTAMP_DIFF(b.pickup_time, a.order_time, MINUTE), 2) AS FLOAT64), 2) AS delivery_pace
  FROM `pizza-runner-508123.pizza_runner.customer_orders_cleaned` AS a
  JOIN `pizza-runner-508123.pizza_runner.runner_orders_cleaned` AS b
    ON a.order_id = b.order_id
  WHERE b.cancellation IS NULL),
min_max_avg AS(
  SELECT 
    ROUND(AVG(delivery_pace), 2) AS avg_pace,
    MAX(delivery_pace) AS max_pace,
    MIN(delivery_pace) AS min_pace
  FROM deliverypace)
SELECT avg_pace, min_pace, max_pace,
  (max_pace + min_pace) / 2.0 AS mean_pace
FROM min_max_avg