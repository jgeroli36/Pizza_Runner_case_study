DROP VIEW IF EXISTS `pizza-runner-508123.pizza_runner.runner_orders_cleaned`;
CREATE VIEW `pizza-runner-508123.pizza_runner.runner_orders_cleaned` AS (
  WITH cleaned_table AS (
    SELECT 
      order_id, 
      runner_id,
      -- Clean and normalize pickup_time, distance, duration, and cancellation fields
      CASE
        WHEN COALESCE(LOWER(TRIM(pickup_time)), '') IN ('', 'null') THEN NULL
        ELSE SAFE_CAST(pickup_time AS TIMESTAMP)
      END AS pickup_time,
      CASE
        WHEN COALESCE(LOWER(TRIM(distance)), '') IN ('', 'null') THEN NULL
        ELSE SAFE_CAST(REGEXP_EXTRACT(distance, r'^[0-9]+(?:\.[0-9]+)?') AS FLOAT64)
      END AS distance_km,
      CASE
        WHEN COALESCE(LOWER(TRIM(duration)), '') IN ('', 'null') THEN NULL
        ELSE SAFE_CAST(REGEXP_REPLACE(duration, r'[^0-9]', '') AS INT64)
      END AS duration_minutes,
      CASE
        WHEN COALESCE(LOWER(TRIM(cancellation)), '') IN ('', 'null') THEN NULL
        ELSE cancellation
      END AS cancellation             
    FROM `pizza-runner-508123.pizza_runner.runner_orders`)
  SELECT *
  FROM cleaned_table);
