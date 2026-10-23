WITH pizza_changes AS (
  SELECT c.order_id, c.pizza_id,
    CASE 
      WHEN (c.exclusions IS NULL) AND (c.extras IS NULL) 
      THEN 1 
      ELSE 0 
    END AS no_changes,
    CASE 
      WHEN (c.exclusions IS NOT NULL) OR (c.extras IS NOT NULL) 
      THEN 1 
      ELSE 0 
    END AS with_changes
  FROM `pizza-runner-508123.pizza_runner.customer_orders_cleaned` c
  JOIN `pizza-runner-508123.pizza_runner.runner_orders_cleaned` r
    ON c.order_id = r.order_id
  WHERE r.cancellation IS NULL
)
SELECT
  SUM(no_changes) AS no_changes,
  SUM(with_changes) AS with_changes
FROM pizza_changes;