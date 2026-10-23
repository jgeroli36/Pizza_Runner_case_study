SELECT c.order_id, COUNT(c.order_id) AS max_pizza_count
  FROM `pizza-runner-508123.pizza_runner.customer_orders_cleaned` c
  JOIN `pizza-runner-508123.pizza_runner.runner_orders_cleaned` r
    ON c.order_id = r.order_id
WHERE r.cancellation is NULL
GROUP BY c.order_id
ORDER BY max_pizza_count DESC
LIMIT 1
