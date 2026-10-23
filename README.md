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
   1. ![][image2]  
2. How many of each type of pizza was delivered? [\`count\_of\_pizza\_types\_delivered\`](https://github.com/jgeroli36/Pizza_Runner_case_study/blob/7454829f058d5dd18f0aae94b5aab7c63a25b1ab/SQL%20code/count_of_pizza_types_delivered.sql)  
   1. ![][image3]   
3. What was the maximum number of pizzas delivered in a single order? [\`max\_pizza\_count\`](https://github.com/jgeroli36/Pizza_Runner_case_study/blob/7454829f058d5dd18f0aae94b5aab7c63a25b1ab/SQL%20code/max_pizza_count.sql)  
   1. ![][image4]  
4. For each customer, how many delivered pizzas had at least 1 change and how many had no changes? [\`pizzas\_with\_and\_without\_changes\`](https://github.com/jgeroli36/Pizza_Runner_case_study/blob/7454829f058d5dd18f0aae94b5aab7c63a25b1ab/SQL%20code/pizzas_with_and_without_changes.sql)  
   1. ![][image5]  
5. What was the volume of orders for each day of the week? [\`orders\_per\_week\_day\`](https://github.com/jgeroli36/Pizza_Runner_case_study/blob/7454829f058d5dd18f0aae94b5aab7c63a25b1ab/SQL%20code/orders_per_week_day.sql)  
   1. ![][image6]

#### Runner and Customer Experience

1. What was the average time in minutes it took for each runner to arrive at the Pizza Runner HQ to pickup the order? [\`pickup\_time\_avg\`](https://github.com/jgeroli36/Pizza_Runner_case_study/blob/7454829f058d5dd18f0aae94b5aab7c63a25b1ab/SQL%20code/pickup_time_avg.sql)  
   1. ![][image7]  
2. Is there any relationship between the number of pizzas and how long the order takes to prepare? Orders with 2+ pizzas take longer to prepare, with order \#10 as the exception; [\`pizzas\_made\_per\_min\`](https://github.com/jgeroli36/Pizza_Runner_case_study/blob/7454829f058d5dd18f0aae94b5aab7c63a25b1ab/SQL%20code/pizzas_made_per_min.sql)  
   1. ![][image8]  
3. What was the average distance travelled for each customer? [\`avg\_distance\_traveled\_per\_customer\`](https://github.com/jgeroli36/Pizza_Runner_case_study/blob/7454829f058d5dd18f0aae94b5aab7c63a25b1ab/SQL%20code/avg_distance_traveled_per_customer.sql)  
   1. ![][image9]  
4. What was the difference between the longest and shortest delivery times for all orders? [\`short\_long\_duration\_diff\`](https://github.com/jgeroli36/Pizza_Runner_case_study/blob/7454829f058d5dd18f0aae94b5aab7c63a25b1ab/SQL%20code/short_long_duration_diff.sql)  
   1. ![][image10]  
5. What was the average speed for each runner for each delivery and do you notice any trend for these values? For each runner the later the order\_time, the higher the average speed. [\`avg\_runner\_speed\_per\_order\`](https://github.com/jgeroli36/Pizza_Runner_case_study/blob/7454829f058d5dd18f0aae94b5aab7c63a25b1ab/SQL%20code/avg_runner_speed_per_order.sql)  
   1. ![][image11]

#### Ingredient Optimisation

1. What was the most commonly added extra? [\`most\_common\_extra\`](https://github.com/jgeroli36/Pizza_Runner_case_study/blob/7454829f058d5dd18f0aae94b5aab7c63a25b1ab/SQL%20code/most_common_extra.sql)  
   1. ![][image12]  
2. What was the most common exclusion? [\`most\_common\_exclusion\`](https://github.com/jgeroli36/Pizza_Runner_case_study/blob/7454829f058d5dd18f0aae94b5aab7c63a25b1ab/SQL%20code/most_common_exclusion.sql)  
   1. ![][image13]  
3. Generate an order item for each record in the customers\_orders table in the following format: Meat Lovers \- Exclude Cheese, Bacon \- Extra Mushroom, Peppers; [\`itemized\_orders\`](https://github.com/jgeroli36/Pizza_Runner_case_study/blob/7454829f058d5dd18f0aae94b5aab7c63a25b1ab/SQL%20code/itemized_orders.sql)  
   1. ![][image14]  
4. Generate an alphabetically ordered comma separated ingredient list for each pizza order from the customer\_orders table and add a 2x in front of any relevant ingredients; [\`order\_items\_ingredients\`](https://github.com/jgeroli36/Pizza_Runner_case_study/blob/7454829f058d5dd18f0aae94b5aab7c63a25b1ab/SQL%20code/order_items_ingredients.sql)  
   1. ![][image15]  
5. What is the total quantity of each ingredient used in all delivered pizzas sorted by most frequent first? [\`total\_topping\_count\`](https://github.com/jgeroli36/Pizza_Runner_case_study/blob/7454829f058d5dd18f0aae94b5aab7c63a25b1ab/SQL%20code/total_topping_count.sql)  
   1. ![][image16]

#### Pricing and Ratings

1. If a Meat Lovers pizza costs \$12 and Vegetarian costs \$10 and there were no charges for changes \- how much money has Pizza Runner made so far if there are no delivery fees? [\`pizza\_profit\`](https://github.com/jgeroli36/Pizza_Runner_case_study/blob/7454829f058d5dd18f0aae94b5aab7c63a25b1ab/SQL%20code/pizza_profit.sql)  
   1. ![][image17]  
2. What if there was an additional \$1 charge for any pizza extras? Add cheese is \$1 extra; [\`pizza\_profit\_extra\_costs\`](https://github.com/jgeroli36/Pizza_Runner_case_study/blob/7454829f058d5dd18f0aae94b5aab7c63a25b1ab/SQL%20code/pizza_profit_extra_costs.sql)  
   1. ![][image18]  
3. The Pizza Runner team now wants to add an additional ratings system that allows customers to rate their runner. How would you design an additional table for this new dataset \- generate a schema for this new table and insert your own data for ratings for each successful customer order between 1 to 5\.  
   1. [\`runner\_ratings\`](https://github.com/jgeroli36/Pizza_Runner_case_study/blob/7454829f058d5dd18f0aae94b5aab7c63a25b1ab/SQL%20code/runner_ratings.sql), [\`delivery\_pace\`](https://github.com/jgeroli36/Pizza_Runner_case_study/blob/7454829f058d5dd18f0aae94b5aab7c63a25b1ab/SQL%20code/delivery_pace.sql)  
   2. ![][image19]  
4. Using your newly generated table \- can you join all of the information together to form a table which has the following information for successful deliveries? (Customer\_id, Order\_id, Runner\_id, Rating, Order\_time, Pickup\_time, Time between order and pickup, Delivery duration, Average speed, Total number of pizzas); [\`successful\_orders\_ratings\`](https://github.com/jgeroli36/Pizza_Runner_case_study/blob/7454829f058d5dd18f0aae94b5aab7c63a25b1ab/SQL%20code/successful_orders_ratings.sql)  
   1. ![][image20]  
5. If a Meat Lovers pizza was \$12 and Vegetarian \$10 fixed prices with no cost for extras and each runner is paid \$0.30 per kilometre traveled \- how much money does Pizza Runner have left over after these deliveries? [\`net\_profit\`](https://github.com/jgeroli36/Pizza_Runner_case_study/blob/7454829f058d5dd18f0aae94b5aab7c63a25b1ab/SQL%20code/net_profit.sql)  
   1. ![][image21]

Bonus Questions

1. If Danny wants to expand his range of pizzas \- how would this impact the existing data design? Write an INSERT statement to demonstrate what would happen if a new Supreme pizza with all the toppings was added to the Pizza Runner menu?  
   1. New row values in fields pizza\_id, pizza\_name, and toppings would need to be added to tables pizza\_names and pizza\_recipes  
   2. [\`test\_new\_pizza\_insert\`](https://github.com/jgeroli36/Pizza_Runner_case_study/blob/7454829f058d5dd18f0aae94b5aab7c63a25b1ab/SQL%20code/test_new_pizza_insert.sql), [\`new\_pizza\_insert\`](https://github.com/jgeroli36/Pizza_Runner_case_study/blob/7454829f058d5dd18f0aae94b5aab7c63a25b1ab/SQL%20code/new_pizza_insert.sql)  
   3. ![][image22]![][image23]![][image24]
