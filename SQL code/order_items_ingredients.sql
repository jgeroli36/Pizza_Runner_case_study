SELECT a.order_id, b.pizza_name || COALESCE(': ' || (
    SELECT STRING_AGG(
      CASE
        WHEN CAST(c.topping_id AS STRING) IN UNNEST(SPLIT(a.extras, ', '))
        THEN '2x ' || c.topping_name
        ELSE c.topping_name
      END, ', ')
    FROM `pizza-runner-508123.pizza_runner.pizza_toppings` c
    WHERE CAST(c.topping_id AS STRING) IN UNNEST(SPLIT(d.toppings, ', '))
      AND CAST(c.topping_id AS STRING) NOT IN UNNEST(SPLIT(a.exclusions, ', '))), '') AS order_item
FROM `pizza-runner-508123.pizza_runner.customer_orders_cleaned` a
FULL JOIN `pizza-runner-508123.pizza_runner.pizza_names` b
  ON a.pizza_id = b.pizza_id
FULL JOIN `pizza-runner-508123.pizza_runner.pizza_recipes` d
  ON b.pizza_id = d.pizza_id
ORDER BY a.order_id