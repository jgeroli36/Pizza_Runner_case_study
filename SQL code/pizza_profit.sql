SELECT COUNT(a.pizza_id) AS pizzas_sold, b.pizza_name,
  "$" || SUM(
    CASE
      WHEN b.pizza_name = "Meatlovers" THEN 12
      WHEN b.pizza_name = "Vegetarian" THEN 10
     END) AS profit
FROM `pizza-runner-508123.pizza_runner.customer_orders_cleaned` AS a
JOIN `pizza-runner-508123.pizza_runner.pizza_names` AS b
  ON a.pizza_id = b.pizza_id
GROUP BY a.pizza_id, b.pizza_name