# Pizza Runner Case Study

Link to case study: [https\://8weeksqlchallenge.com/case-study-2/](https://8weeksqlchallenge.com/case-study-2/)

# Entity Relationship Diagram
<img width="1189" height="398" alt="ERD" src="https://github.com/user-attachments/assets/15c56eca-03b8-4756-9c43-0ede317d561b" />

* Created using Lucidchart  
* Entities, Primary Keys (PK) and Foreign Keys (FK)  
  * Pizza\_names  
    1. PK \- pizza\_id  
  * Customer\_orders  
    1. PK \- order\_id  
    2. FK \- pizza\_id  
  * Runner\_orders  
    1. PK, FK \- order\_id  
    2. FK \- runner\_id  
  * Runners  
    1. PK \- runner\_id  
  * Pizza\_recipes  
    1. PK \- pizza\_id  
    2. FK \- toppings  
  * Pizza\_toppings  
    1. PK, FK \- toppings\_id  
* Relationships  
  * runners.runner\_id → runner\_orders.runner\_id (1-to-many)  
  * customer\_orders.order\_id → runner\_orders.order\_id (1-to-1)  
  * pizza\_names.pizza\_id → customer\_orders.pizza\_id (1-to-many)  
  * pizza\_names.pizza\_id → pizza\_recipes.pizza\_id (1-to-1)  
  * pizza\_recipes.toppings → pizza\_toppings.topping\_id (1-to-many)  
  * pizza\_recipes.pizza\_id → pizza\_recipes\_ toppings.pizza\_id (1-to-many)

# BigQuery SQL

#### Schema creation, data insert, cleaning and normalization

* [\`schema\_dataset\`](https://github.com/jgeroli36/Pizza_Runner_case_study/blob/7454829f058d5dd18f0aae94b5aab7c63a25b1ab/SQL%20code/schema_dataset.sql), [\`customer\_orders\_cleaned\`](https://github.com/jgeroli36/Pizza_Runner_case_study/blob/7454829f058d5dd18f0aae94b5aab7c63a25b1ab/SQL%20code/customer_orders_cleaned.sql), [\`runner\_orders\_cleaned\`](https://github.com/jgeroli36/Pizza_Runner_case_study/blob/7454829f058d5dd18f0aae94b5aab7c63a25b1ab/SQL%20code/runner_orders_cleaned.sql)

#### Pizza Metrics

1. How many unique customer orders were made? [\`unique\_order\_count\`](https://github.com/jgeroli36/Pizza_Runner_case_study/blob/7454829f058d5dd18f0aae94b5aab7c63a25b1ab/SQL%20code/unique_order_count.sql)  
   1. <img width="130" height="50" alt="image" src="https://github.com/user-attachments/assets/96673f4d-9d34-473b-a165-019640f7f057" />
2. How many of each type of pizza was delivered? [\`count\_of\_pizza\_types\_delivered\`](https://github.com/jgeroli36/Pizza_Runner_case_study/blob/7454829f058d5dd18f0aae94b5aab7c63a25b1ab/SQL%20code/count_of_pizza_types_delivered.sql)  
   1. <img width="190" height="71" alt="image" src="https://github.com/user-attachments/assets/f52b4fb6-fb31-4bf9-98ca-b85f5fb84a8f" />
3. What was the maximum number of pizzas delivered in a single order? [\`max\_pizza\_count\`](https://github.com/jgeroli36/Pizza_Runner_case_study/blob/7454829f058d5dd18f0aae94b5aab7c63a25b1ab/SQL%20code/max_pizza_count.sql)  
   1. <img width="177" height="48" alt="image" src="https://github.com/user-attachments/assets/d537da97-1801-406d-8e9f-c1006375ee95" />
4. For each customer, how many delivered pizzas had at least 1 change and how many had no changes? [\`pizzas\_with\_and\_without\_changes\`](https://github.com/jgeroli36/Pizza_Runner_case_study/blob/7454829f058d5dd18f0aae94b5aab7c63a25b1ab/SQL%20code/pizzas_with_and_without_changes.sql)  
   1. <img width="174" height="46" alt="image" src="https://github.com/user-attachments/assets/2da747d1-484c-48a7-b5fc-f8666b8fb3ed" />
5. What was the volume of orders for each day of the week? [\`orders\_per\_week\_day\`](https://github.com/jgeroli36/Pizza_Runner_case_study/blob/7454829f058d5dd18f0aae94b5aab7c63a25b1ab/SQL%20code/orders_per_week_day.sql)  
   1. <img width="163" height="206" alt="image" src="https://github.com/user-attachments/assets/e3ebf260-6104-4c5d-bc67-19db71b685fd" />

#### Runner and Customer Experience

1. What was the average time in minutes it took for each runner to arrive at the Pizza Runner HQ to pickup the order? [\`pickup\_time\_avg\`](https://github.com/jgeroli36/Pizza_Runner_case_study/blob/7454829f058d5dd18f0aae94b5aab7c63a25b1ab/SQL%20code/pickup_time_avg.sql)  
   1. <img width="104" height="45" alt="image" src="https://github.com/user-attachments/assets/0562feb0-55e8-4c36-b420-80e1e8478d65" />
2. Is there any relationship between the number of pizzas and how long the order takes to prepare? Orders with 2+ pizzas take longer to prepare, with order \#10 as the exception; [\`pizzas\_made\_per\_min\`](https://github.com/jgeroli36/Pizza_Runner_case_study/blob/7454829f058d5dd18f0aae94b5aab7c63a25b1ab/SQL%20code/pizzas_made_per_min.sql)  
   1. <img width="360" height="155" alt="image" src="https://github.com/user-attachments/assets/8e34b911-b61c-4891-9a07-126041be3604" />
3. What was the average distance travelled for each customer? [\`avg\_distance\_traveled\_per\_customer\`](https://github.com/jgeroli36/Pizza_Runner_case_study/blob/7454829f058d5dd18f0aae94b5aab7c63a25b1ab/SQL%20code/avg_distance_traveled_per_customer.sql)  
   1. <img width="218" height="153" alt="image" src="https://github.com/user-attachments/assets/2f2edd9c-0795-4632-a4a1-72f239f2c249" />  
4. What was the difference between the longest and shortest delivery times for all orders? [\`short\_long\_duration\_diff\`](https://github.com/jgeroli36/Pizza_Runner_case_study/blob/7454829f058d5dd18f0aae94b5aab7c63a25b1ab/SQL%20code/short_long_duration_diff.sql)  
   1. <img width="318" height="239" alt="image" src="https://github.com/user-attachments/assets/b675a018-9c52-40cc-b15a-6c9fc704913b" />
5. What was the average speed for each runner for each delivery and do you notice any trend for these values? For each runner the later the order\_time, the higher the average speed. [\`avg\_runner\_speed\_per\_order\`](https://github.com/jgeroli36/Pizza_Runner_case_study/blob/7454829f058d5dd18f0aae94b5aab7c63a25b1ab/SQL%20code/avg_runner_speed_per_order.sql)  
   1. <img width="398" height="240" alt="image" src="https://github.com/user-attachments/assets/c5e75a15-5054-4647-bb42-e345da75392a" />

#### Ingredient Optimisation

1. What was the most commonly added extra? [\`most\_common\_extra\`](https://github.com/jgeroli36/Pizza_Runner_case_study/blob/7454829f058d5dd18f0aae94b5aab7c63a25b1ab/SQL%20code/most_common_extra.sql)  
   1. <img width="261" height="104" alt="image" src="https://github.com/user-attachments/assets/b189759e-bca7-45f6-a408-45ec479e26bd" />
2. What was the most common exclusion? [\`most\_common\_exclusion\`](https://github.com/jgeroli36/Pizza_Runner_case_study/blob/7454829f058d5dd18f0aae94b5aab7c63a25b1ab/SQL%20code/most_common_exclusion.sql)  
   1. <img width="281" height="104" alt="image" src="https://github.com/user-attachments/assets/877ffda5-5925-496a-aeaa-f1f8d28b264f" /> 
3. Generate an order item for each record in the customers\_orders table in the following format: Meat Lovers \- Exclude Cheese, Bacon \- Extra Mushroom, Peppers; [\`itemized\_orders\`](https://github.com/jgeroli36/Pizza_Runner_case_study/blob/7454829f058d5dd18f0aae94b5aab7c63a25b1ab/SQL%20code/itemized_orders.sql)  
   1. <img width="445" height="399" alt="image" src="https://github.com/user-attachments/assets/5f6f6408-ac10-4df7-b62b-2f7517dcce02" />
4. Generate an alphabetically ordered comma separated ingredient list for each pizza order from the customer\_orders table and add a 2x in front of any relevant ingredients; [\`order\_items\_ingredients\`](https://github.com/jgeroli36/Pizza_Runner_case_study/blob/7454829f058d5dd18f0aae94b5aab7c63a25b1ab/SQL%20code/order_items_ingredients.sql)  
   1. <img width="555" height="399" alt="image" src="https://github.com/user-attachments/assets/1e7d36bb-4f2a-4ebe-b3e1-d6fdaaf1ea32" />
5. What is the total quantity of each ingredient used in all delivered pizzas sorted by most frequent first? [\`total\_topping\_count\`](https://github.com/jgeroli36/Pizza_Runner_case_study/blob/7454829f058d5dd18f0aae94b5aab7c63a25b1ab/SQL%20code/total_topping_count.sql)  
   1. <img width="194" height="346" alt="image" src="https://github.com/user-attachments/assets/b67a6a00-74d5-4eb5-80b1-1d81aa1f9b3b" />

#### Pricing and Ratings

1. If a Meat Lovers pizza costs \$12 and Vegetarian costs \$10 and there were no charges for changes \- how much money has Pizza Runner made so far if there are no delivery fees? [\`pizza\_profit\`](https://github.com/jgeroli36/Pizza_Runner_case_study/blob/7454829f058d5dd18f0aae94b5aab7c63a25b1ab/SQL%20code/pizza_profit.sql)  
   1. <img width="212" height="73" alt="image" src="https://github.com/user-attachments/assets/4c2201a4-5d5a-453c-a988-2f8fa0e4561f" />
2. What if there was an additional \$1 charge for any pizza extras? Add cheese is \$1 extra; [\`pizza\_profit\_extra\_costs\`](https://github.com/jgeroli36/Pizza_Runner_case_study/blob/7454829f058d5dd18f0aae94b5aab7c63a25b1ab/SQL%20code/pizza_profit_extra_costs.sql)  
   1. <img width="212" height="74" alt="image" src="https://github.com/user-attachments/assets/902e3f21-e5f2-4c1a-b9cb-14685a6230e1" />
3. The Pizza Runner team now wants to add an additional ratings system that allows customers to rate their runner. How would you design an additional table for this new dataset \- generate a schema for this new table and insert your own data for ratings for each successful customer order between 1 to 5\.  
   1. [\`runner\_ratings\`](https://github.com/jgeroli36/Pizza_Runner_case_study/blob/7454829f058d5dd18f0aae94b5aab7c63a25b1ab/SQL%20code/runner_ratings.sql), [\`delivery\_pace\`](https://github.com/jgeroli36/Pizza_Runner_case_study/blob/7454829f058d5dd18f0aae94b5aab7c63a25b1ab/SQL%20code/delivery_pace.sql)  
   2. <img width="796" height="240" alt="image" src="https://github.com/user-attachments/assets/df2c1192-20ab-4f6d-ba36-502f8ab7f24d" />
4. Using your newly generated table \- can you join all of the information together to form a table which has the following information for successful deliveries? (Customer\_id, Order\_id, Runner\_id, Rating, Order\_time, Pickup\_time, Time between order and pickup, Delivery duration, Average speed, Total number of pizzas); [\`successful\_orders\_ratings\`](https://github.com/jgeroli36/Pizza_Runner_case_study/blob/7454829f058d5dd18f0aae94b5aab7c63a25b1ab/SQL%20code/successful_orders_ratings.sql)  
   1. <img width="1008" height="238" alt="image" src="https://github.com/user-attachments/assets/73bcbda0-fb5e-4426-83d6-3ff7f6fa4429" />
5. If a Meat Lovers pizza was \$12 and Vegetarian \$10 fixed prices with no cost for extras and each runner is paid \$0.30 per kilometre traveled \- how much money does Pizza Runner have left over after these deliveries? [\`net\_profit\`](https://github.com/jgeroli36/Pizza_Runner_case_study/blob/7454829f058d5dd18f0aae94b5aab7c63a25b1ab/SQL%20code/net_profit.sql)  
   1. <img width="66" height="41" alt="image" src="https://github.com/user-attachments/assets/380e6a47-061f-4b6b-a217-827fc37534b4" />

Bonus Questions

1. If Danny wants to expand his range of pizzas \- how would this impact the existing data design? Write an INSERT statement to demonstrate what would happen if a new Supreme pizza with all the toppings was added to the Pizza Runner menu?  
   1. New values in fields pizza\_id, pizza\_name, and toppings would need to be added to tables pizza\_names and pizza\_recipes  
   2. [\`test\_new\_pizza\_insert\`](https://github.com/jgeroli36/Pizza_Runner_case_study/blob/7454829f058d5dd18f0aae94b5aab7c63a25b1ab/SQL%20code/test_new_pizza_insert.sql), [\`new\_pizza\_insert\`](https://github.com/jgeroli36/Pizza_Runner_case_study/blob/7454829f058d5dd18f0aae94b5aab7c63a25b1ab/SQL%20code/new_pizza_insert.sql)  
   3. <img width="379" height="53" alt="image" src="https://github.com/user-attachments/assets/3d99b7c5-3ed9-40e2-88a2-f5feb460cbbf" />
<img width="250" height="101" alt="image" src="https://github.com/user-attachments/assets/61445aff-7060-49d7-84aa-1b0b6e081bd9" />
<img width="153" height="108" alt="image" src="https://github.com/user-attachments/assets/b5f2fa01-9091-4f5c-9a1b-70fed3b0ee21" />
