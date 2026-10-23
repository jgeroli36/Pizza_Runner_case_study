WITH test_updates AS (
  SELECT 
    3 AS pizza_id, 
    "Supreme" AS pizza_name, 
    "1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12" AS toppings
)
SELECT 
  a.pizza_id AS test_pizza_id,
  a.pizza_name AS test_pizza_name,
  a.toppings AS test_toppings
FROM test_updates AS a
LEFT JOIN `pizza-runner-508123.pizza_runner.pizza_recipes` AS b
  ON a.pizza_id = b.pizza_id
LEFT JOIN `pizza-runner-508123.pizza_runner.pizza_names` AS c
  ON a.pizza_id = c.pizza_id;