WITH gross_profit AS (
  SELECT
  SUM(
    CASE
      WHEN b.pizza_name = "Meatlovers" THEN 12
      WHEN b.pizza_name = "Vegetarian" THEN 10
     END) AS profit
  FROM `pizza-runner-508123.pizza_runner.customer_orders_cleaned` AS a
  JOIN `pizza-runner-508123.pizza_runner.pizza_names` AS b
    ON a.pizza_id = b.pizza_id),
runner_earnings AS (                 
  SELECT SUM(distance_km * 0.3) AS runner_pay
  FROM `pizza-runner-508123.pizza_runner.runner_orders_cleaned`)
SELECT "$" || ROUND(c.profit - d.runner_pay, 2) AS net_profit
FROM gross_profit AS c, runner_earnings AS d
