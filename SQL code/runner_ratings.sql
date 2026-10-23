DROP TABLE IF EXISTS `pizza-runner-508123.pizza_runner.runner_ratings`;
CREATE TABLE `pizza-runner-508123.pizza_runner.runner_ratings`
  (rating INT64,
   delivery_instructions STRING,
   delivery_handling STRING,
   delivery_pace STRING);

INSERT INTO `pizza-runner-508123.pizza_runner.runner_ratings`
  (rating, delivery_instructions, delivery_handling, delivery_pace)
VALUES
  (1, 'Did not follow delivery instructions; Unresponsive to chat', 'Items were poorly handled; packaging in poor condition', '29 +'),
  (2, 'Struggled with delivery instructions; Did not respond to chat in a timely matter', 'Items not handled with care; packaging not in good order', '21 - 28.99'),
  (3, 'Delivery instructions somewhat followed; Slow to respond to chat', 'Minimal issues with packaging', '19 - 20.99'),
  (4, 'Delivery instructions followed; Responded to chat in a timely matter', 'Packaging and items in good order', '15 - 18.99'),
  (5, 'Delivery instructions followed; Chat responses were immediate and thorough', 'Packaging and items in perfect order', '< 15');