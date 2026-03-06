-- Retrieve the total number of orders placed.
select count(order_id) as total_order 
from orders;
-- Calculate the total revenue generated from pizza sales.
select 
sum(order_details.quantity*pizzas.price) as total_revenue
from pizzas join order_details
on pizzas.pizza_id=order_details.pizza_id
order by total_revenue;
-- Identify the highest-priced pizza.
select pizzas.price,pizza_types.name 
from pizzas join pizza_types 
on pizzas.pizza_type_id=pizza_types.pizza_type_id
order by pizzas.price desc limit 1;
-- Identify the most common pizza size ordered.
select pizzas.size,
count (order_details.order_details_id) as size_count 
from pizzas join order_details
on pizzas.pizza_id=order_details.pizza_id
group by pizzas.size 
order by size_count desc limit 6;
-- List the top 5 most ordered pizza types along with their quantities.
select pizza_types.name ,
count (order_details.quantity) as most_ordered_pizza
from pizzas join pizza_types 
on pizzas.pizza_type_id=pizza_types.pizza_type_id
join order_details
on order_details.pizza_id=pizzas.pizza_id
group by pizza_types.name
order by most_ordered_pizza desc limit 5 ;
-- Join the necessary tables to find the total quantity of each pizza category ordered.
select pizza_types.category,
count (order_details.order_details_id) as total_quantity
from pizzas join pizza_types
on pizzas.pizza_type_id=pizza_types.pizza_type_id
join order_details 
on pizzas.pizza_id=order_details.pizza_id
group by pizza_types.category
order by total_quantity desc ;
-- Determine the distribution of orders by hour of the day.
select 
extract(hour from order_time) as hour,
count(order_id) as order_count
from orders
group by extract(hour from order_time)
order by order_count asc;
-- Join relevant tables to find the category-wise distribution of pizzas.
select category, count(name) from pizza_types 
group by category;
-- Group the orders by date and calculate the average number of pizzas ordered per day.
select avg(quantity) from 
(select orders.order_date,sum(order_details.quantity) 
from order_details join orders
on orders_order_id=order_details.order_id
group by orders.order_date) as order_quantity  ;
--Determine the top 3 most ordered pizza types based on revenue.
SELECT pizza_types.name, 
sum(order_details.quantity * pizzas.price) as revenue
FROM pizza_types
 JOIN pizzas
ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN order_details
ON order_details.pizza_id = pizzas.pizza_id
Group by pizza_types.name 
ORDER BY revenue DESC
LIMIT 3;        
-- Calculate the percentage contribution of each pizza type to total revenue.
SELECT pizza_types.category,
(sum(order_details.quantity*pizzas.price) / (SELECT sum(order_details.quantity*pizzas.price) as total_revenue
FROM order_details 
JOIN pizzas
on pizzas.pizza_id = order_details.pizza_id)) * 100 as revenue_percentage
FROM pizza_types
JOIN pizzas
ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN order_details
ON order_details.pizza_id = pizzas.pizza_id
Group by pizza_types.category
ORDER BY revenue_percentage DESC;  
-- Analyze the cumulative revenue generated over time.
with sales as 
(select DATEPART(HOUR, orders.time) as 'Time',sum(price*quantity) as 'revenue' 
from order_details join orders
on order_details.order_id = orders.order_id
join pizzas
on pizzas.pizza_id = order_details.pizza_id
group by DATEPART(HOUR, orders.time))
SELECT Time ,SUM([Revenue]) OVER (ORDER BY Time) AS [Cumulative Revenue]
FROM sales




























