# 🍕 Pizza Sales Analysis with SQL Server

This repository contains SQL scripts designed to analyze pizza sales data stored in a Postgre SQL Server database. The analysis includes basic, intermediate, and advanced queries to gain insights into the sales performance of different pizzas, customer preferences, and order trends.

<img width="911" height="469" alt="Coffe Dasboard" src="https://github.com/Mishra025/pizzeria-sql-project-./blob/291292bf3a91298f990d75520db39954c5c929b2/Screenshot%202026-03-07%20020018.png" />
## 🗂 Database Schema

The database consists of four main tables: PIZZAS, ORDERS, ORDERDETAILS, and PIZZA_TYPE. Below is the schema structure:

### PIZZAS

This table contains details about the pizzas available for sale.

| Column      | Type          | Description                        |
|-------------|---------------|------------------------------------|
| PIZZA_ID    | int         | Primary key (Unique identifier for each pizza) |
| NAME        | varchar(50) | Name of the pizza                  |
| SIZE        | varchar(20) | Size of the pizza (e.g., Small, Medium, Large) |
| PRICE       | decimal(10,2) | Price of the pizza                |
| CATEGORY    | varchar(50) | Category of the pizza (e.g., Vegetarian, Non-Vegetarian) |
| INGREDIENTS | varchar(255) | Ingredients used in the pizza     |

### ORDERS

This table contains information about customer orders.

| Column    | Type      | Description                         |
|-----------|-----------|-------------------------------------|
| ORDER_ID  | int     | Primary key (Unique identifier for each order) |
| DATE      | date    | Date of the order                   |
| TIME      | time    | Time of the order                   |

### ORDERDETAILS

This table records the details of each order, including the quantity of pizzas ordered.

| Column           | Type      | Description                             |
|------------------|-----------|-----------------------------------------|
| ORDER_DETAILS_ID | int     | Primary key (Unique identifier for each order detail) |
| ORDER_ID         | int     | Foreign key referencing ORDERS(ORDER_ID) |
| PIZZA_ID         | int     | Foreign key referencing PIZZAS(PIZZA_ID) |
| QUANTITY         | int     | Quantity of pizzas ordered              |

### PIZZA_TYPE

This table defines the types of pizzas available, including their ingredients.

| Column         | Type          | Description                              |
|----------------|---------------|------------------------------------------|
| PIZZA_TYPE_ID  | int         | Primary key (Unique identifier for each pizza type) |
| NAME           | varchar(50) | Name of the pizza type                   |
| CATEGORY       | varchar(50) | Category of the pizza type (e.g., Vegan, Meat, Cheese) |
| INGREDIENTS    | varchar(255) | Ingredients that define this pizza type |

## 🔍 Analysis Overview

The SQL scripts included in this repository focus on analyzing the following areas:

- Sales Trends: Identify daily, weekly, and monthly trends in pizza sales.
- Top-selling Pizzas: Find the most popular pizzas based on quantity sold.
- Revenue Analysis: Calculate total revenue by pizza category, size, and specific time periods.
- Order Frequency: Determine peak order times and the frequency of repeat orders.
- Customer Preferences: Analyze the most common ingredients or categories ordered.
- Pizza Type Analysis: Explore the different types of pizzas, their ingredients, and how they contribute to sales.

## 🚀 Getting Started
1. Set up the SQL Server database using the provided schema.

2. Execute the SQL scripts in the appropriate order to generate insights from the pizza sales data.

## 📄 Requirements

- Postgre SQL Server (or any SQL Server-compatible environment)
- A database with the above schema set up and populated with data.
