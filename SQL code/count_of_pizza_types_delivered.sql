SELECT n.pizza_name, COUNT(o.pizza_id) AS count_delivered
  FROM `pizza-runner-508123.pizza_runner.pizza_names` n
  JOIN `pizza-runner-508123.pizza_runner.customer_orders_cleaned` o
   ON n.pizza_id = o.pizza_id
  JOIN `pizza-runner-508123.pizza_runner.runner_orders_cleaned` r
   ON r.order_id = o.order_id
WHERE r.cancellation is NULL
GROUP BY n.pizza_name