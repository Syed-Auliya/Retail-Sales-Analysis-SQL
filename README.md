### Retail Sales Analysis using SQL
## Project Overview

This project demonstrates SQL skills commonly used by Data Analysts to clean, explore, and analyze retail sales data. It covers the complete data analysis workflow—from database creation and data cleaning to exploratory data analysis (EDA) and business-driven insights.

The project is designed to showcase practical SQL concepts and analytical thinking for beginners preparing for data analyst interviews.

## Objectives
Create and set up a retail sales database in PostgreSQL.

Import and organize retail sales data.

Clean the dataset by identifying and removing missing values.

Perform exploratory data analysis (EDA).

Solve real-world business questions using SQL.

Generate meaningful business insights from sales data.

## Tools & Technologies
Database: PostgreSQL

Language: SQL

IDE: pgAdmin 4

## Database Information

Database Name:sql_project1_db

Table Name:retail_sales

Table Schema:
Column	Data Type

transactions_id	INT (Primary Key)

sale_date	DATE

sale_time	TIME

customer_id	INT

gender	VARCHAR(15)

age	INT

category	VARCHAR(20)

quantity	INT

price_per_unit	FLOAT

cogs	FLOAT

total_sale	FLOAT

## Project Workflow
1. Database Setup :
Created the database and retail sales table.
Imported the CSV dataset into PostgreSQL.
Added a Primary Key to ensure unique transactions.

2. Data Cleaning :
Renamed incorrectly named columns.
Checked for missing (NULL) values.
Removed incomplete records.
Validated the dataset before analysis.

3. Exploratory Data Analysis (EDA)
Performed exploratory analysis to understand the dataset, including:
Total number of sales
Total number of unique customers
Product categories available
Gender distribution
Sales date range
4. Business Analysis:
The project answers several real-world business questions, including:

Retrieve all sales made on a specific date.

Find Clothing purchases with quantity greater than or equal to 4 during November 2022.

Calculate total sales and total orders for each product category.

Calculate the average customer age for Beauty category purchases.

Find transactions where total sales exceeded 1000.

Calculate total transactions by gender and product category.

Identify the best-selling month in each year using Window Functions.

Find the Top 5 customers based on total sales.

Calculate the number of unique customers in each product category.

Classify sales into Morning, Afternoon, and Evening shifts based on sale time.

## SQL Concepts Used
DDL Commands

DML Commands

Aggregate Functions

GROUP BY

ORDER BY

DISTINCT

WHERE Clause

CASE Expressions

Common Table Expressions (CTEs)

Window Functions

Ranking Functions

Date & Time Functions

Subqueries

## Data Cleaning Techniques

 Key Insights
Identified high-value transactions with sales greater than 1000.

Determined the highest-performing product categories based on revenue.

Identified top-spending customers.

Analyzed monthly sales trends to identify peak sales periods.

Segmented sales into Morning, Afternoon, and Evening shopping shifts.

Measured customer distribution across product categories.

## Learning Outcomes

Through this project, I strengthened my understanding of:

Database creation and management

Data cleaning using SQL

Exploratory Data Analysis (EDA)

Writing business-oriented SQL queries

Window Functions and CTEs

Solving real-world analytical problems using PostgreSQL

If you found this project helpful, feel free to ⭐ star this repository.
