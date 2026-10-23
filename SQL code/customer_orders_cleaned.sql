DROP VIEW IF EXISTS `pizza-runner-508123.pizza_runner.customer_orders_cleaned`;
CREATE VIEW `pizza-runner-508123.pizza_runner.customer_orders_cleaned` AS (
  WITH cleaned_table AS (
    SELECT 
      order_id, 
      customer_id,
      pizza_id,
      -- Clean and normalize exclusions and extras fields
      CASE
        WHEN COALESCE(LOWER(TRIM(exclusions)), '') IN ('', 'null') THEN NULL
        ELSE exclusions
      END AS exclusions,
      CASE
        WHEN COALESCE(LOWER(TRIM(extras)), '') IN ('', 'null') THEN NULL
        ELSE extras
      END AS extras,
      order_time                
    FROM `pizza-runner-508123.pizza_runner.customer_orders`)
  SELECT *
  FROM cleaned_table);
