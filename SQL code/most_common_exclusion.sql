SELECT p.topping_id, p.topping_name, COUNT(c.exclusions) AS exclusions_count
  FROM `pizza-runner-508123.pizza_runner.pizza_toppings` p
  JOIN `pizza-runner-508123.pizza_runner.customer_orders_cleaned` c
   ON CAST(p.topping_id AS STRING) IN UNNEST(SPLIT(c.exclusions, ', '))
GROUP BY p.topping_id, p.topping_name
ORDER BY exclusions_count DESC
