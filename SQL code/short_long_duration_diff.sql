WITH min_max AS (
  SELECT
    MAX(duration_minutes) AS max_duration, MIN(duration_minutes) AS min_duration
    FROM `pizza-runner-508123.pizza_runner.runner_orders_cleaned`)
SELECT r.order_id, r.duration_minutes,
  ABS(m.max_duration - r.duration_minutes) AS long_diff,
  ABS(m.min_duration - r.duration_minutes) AS short_diff
  FROM(
    SELECT max_duration, min_duration
      FROM min_max) m, 
      `pizza-runner-508123.pizza_runner.runner_orders_cleaned` r
    WHERE cancellation IS NULL  