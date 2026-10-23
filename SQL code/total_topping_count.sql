SELECT 
  c.topping_name,
  SUM(1 + 
    CASE 
      WHEN a.extras IS NOT NULL 
        AND CAST(c.topping_id AS STRING) IN UNNEST(SPLIT(a.extras, ', ')) 
      THEN 1 ELSE 0 
    END) AS topping_count
FROM `pizza-runner-508123.pizza_runner.customer_orders_cleaned` a
JOIN `pizza-runner-508123.pizza_runner.pizza_recipes` d
  ON a.pizza_id = d.pizza_id
CROSS JOIN UNNEST(SPLIT(d.toppings, ',')) AS topping_id_str
JOIN `pizza-runner-508123.pizza_runner.pizza_toppings` c
  ON CAST(c.topping_id AS STRING) = TRIM(topping_id_str)
WHERE 
  a.exclusions IS NULL 
  OR CAST(c.topping_id AS STRING) NOT IN UNNEST(SPLIT(a.exclusions, ', '))
GROUP BY c.topping_name
ORDER BY topping_count DESC