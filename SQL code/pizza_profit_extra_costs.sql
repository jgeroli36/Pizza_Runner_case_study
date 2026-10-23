WITH extra_costs AS (
  SELECT a.order_id, a.pizza_id, a.extras,
    SUM(
      CASE 
        WHEN c.topping_name LIKE '%Cheese%' THEN 2 
        ELSE 1 
      END) AS total_extra_cost
  FROM `pizza-runner-508123.pizza_runner.customer_orders_cleaned` AS a
  CROSS JOIN UNNEST(SPLIT(a.extras, ', ')) AS extra_id
  JOIN `pizza-runner-508123.pizza_runner.pizza_toppings` AS c
    ON CAST(c.topping_id AS STRING) = TRIM(extra_id)
  WHERE a.extras IS NOT NULL
  GROUP BY a.order_id, a.pizza_id, a.extras)
SELECT 
  COUNT(a.pizza_id) AS pizzas_sold, b.pizza_name,
  "$" || CAST(
    SUM(
      CASE
        WHEN b.pizza_name = "Meatlovers" THEN 12
        WHEN b.pizza_name = "Vegetarian" THEN 10
        ELSE 0
      END
      + COALESCE(e.total_extra_cost, 0)) AS STRING) AS profit
FROM `pizza-runner-508123.pizza_runner.customer_orders_cleaned` AS a
JOIN `pizza-runner-508123.pizza_runner.pizza_names` AS b
  ON a.pizza_id = b.pizza_id
LEFT JOIN extra_costs AS e
  ON a.order_id = e.order_id
  AND a.extras = e.extras
GROUP BY a.pizza_id, b.pizza_name;