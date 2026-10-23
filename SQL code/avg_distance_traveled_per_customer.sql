SELECT c.customer_id, CONCAT(ROUND(AVG(r.distance_km), 2), "km") AS avg_distance_traveled
  FROM `pizza-runner-508123.pizza_runner.runner_orders_cleaned` r
  JOIN `pizza-runner-508123.pizza_runner.customer_orders_cleaned` c
    ON c.order_id = r.order_id
  WHERE cancellation IS NULL
  GROUP BY c.customer_id