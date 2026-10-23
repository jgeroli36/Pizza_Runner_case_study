WITH order_summary AS(
  SELECT customer_id, order_id, order_time,
    COUNT(pizza_id) AS pizza_count
  FROM `pizza-runner-508123.pizza_runner.customer_orders_cleaned`
  GROUP BY customer_id, order_id, order_time),
dlvrypace AS(
  SELECT a.order_id, runner_id,
    ROUND(distance_km /
    CAST(duration_minutes AS FLOAT64) + 
    CAST(ROUND(TIMESTAMP_DIFF(pickup_time, a.order_time, MINUTE), 2) AS FLOAT64), 2) AS delivery_pace
  FROM order_summary AS a
  JOIN `pizza-runner-508123.pizza_runner.runner_orders_cleaned` AS b
    ON a.order_id = b.order_id
  WHERE cancellation IS NULL)
SELECT c.customer_id, c.order_id, d.runner_id, 
    CASE
      WHEN d.delivery_pace < 15 THEN "5"
      WHEN d.delivery_pace BETWEEN 15 AND 18.99 THEN "4"
      WHEN d.delivery_pace BETWEEN 19 AND 22.99 THEN "3"
      WHEN d.delivery_pace BETWEEN 23 AND 26.99 THEN "2"
      WHEN d.delivery_pace > 27 THEN "1"
      ELSE NULL
    END AS rating,
  c.order_time, e.pickup_time, 
  TIMESTAMP_DIFF(e.pickup_time, c.order_time, MINUTE) AS order_pickup_timediff, 
  e.duration_minutes,
  ROUND(e.distance_km / (e.duration_minutes / 60), 2) AS avg_speed,
  c.pizza_count
FROM order_summary AS c
JOIN `pizza-runner-508123.pizza_runner.runner_orders_cleaned` AS e
  ON c.order_id = e.order_id
JOIN dlvrypace AS d
  ON d.order_id = c.order_id
GROUP BY d.runner_id, c.order_id, c.customer_id, c.order_time, e.pickup_time, e.duration_minutes, e.distance_km, e.cancellation, d.delivery_pace, c.pizza_count
HAVING e.cancellation IS NULL

