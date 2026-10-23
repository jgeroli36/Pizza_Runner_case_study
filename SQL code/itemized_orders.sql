SELECT a.order_id, 
      b.pizza_name ||
      COALESCE(
      ' - Exclude ' || 
      (SELECT STRING_AGG(c.topping_name, ', ')
        FROM `pizza-runner-508123.pizza_runner.pizza_toppings` c
        WHERE CAST(c.topping_id AS STRING) IN UNNEST(SPLIT(a.exclusions, ', '))), '') ||
      COALESCE(
      ' - Extra ' ||
      (SELECT STRING_AGG(c.topping_name, ', ')
        FROM `pizza-runner-508123.pizza_runner.pizza_toppings` c
        WHERE CAST(c.topping_id AS STRING) IN UNNEST(SPLIT(a.extras, ', '))),'') AS order_item
FROM `pizza-runner-508123.pizza_runner.customer_orders_cleaned` a
FULL JOIN `pizza-runner-508123.pizza_runner.pizza_names` b
  ON a.pizza_id = b.pizza_id
ORDER BY a.order_id