-- Retails sales Analysis
CREATE DATABASE sql_project1_db;

--Create Table
DROP TABLE IF EXISTS retail_sales;
CREATE TABLE retail_sales
				(
				transactions_id	INT PRIMARY KEY,
				sale_date DATE,
				sale_time TIME,
				customer_id	INT,
				gender VARCHAR(15),
				age	INT,
				category VARCHAR(20),
				quantiy	INT,
				price_per_unit FLOAT,
				cogs FLOAT,
				total_sale FLOAT
				);

ALTER TABLE retail_sales
ADD PRIMARY KEY(transactions_id);

/*=============================================
            DATA CLEANING
===============================================*/

ALTER TABLE retail_sales
RENAME COLUMN quantiy TO quantity;

SELECT * FROM retail_sales
WHERE transactions_id IS NULL
	OR sale_date IS NULL
	OR sale_time IS NULL
	OR customer_id IS NULL
	OR gender IS NULL
	OR age IS NULL
	OR category IS NULL
	OR quantity IS NULL
	OR price_per_unit IS NULL
	OR cogs IS NULL
	OR total_sale IS NULL;
	
DELETE FROM retail_sales
WHERE transactions_id IS NULL
	OR sale_date IS NULL
	OR sale_time IS NULL
	OR customer_id IS NULL
	OR gender IS NULL
	OR age IS NULL
	OR category IS NULL
	OR quantity IS NULL
	OR price_per_unit IS NULL
	OR cogs IS NULL
	OR total_sale IS NULL;

select * from retail_sales;
/*====================================================
          EXPLORATORY DATA ANALYSIS
====================================================*/
-- How many sales we have?
SELECT COUNT(*) AS "Total sales"
FROM retail_sales;

-- How many Unique custmers we have?
SELECT COUNT(DISTINCT customer_id)as "Total Cusomers"
FROM retail_sales;

-- What are categories we have ?
SELECT DISTINCT category
FROM retail_sales ;

--Gender Types Available
SELECT DISTINCT gender
FROM retail_sales;

--Date Range
SELECT MIN(sale_date),
	   MAX(sale_date)
FROM retail_sales;

/*====================================================
        DATA ANALYSIS ANDBUSINESS PROBLEM SOLUTIONS
====================================================*/
--1 Write a SQL query to retrieve all columns for sales made on '2022-11-05:
SELECT * FROM retail_sales
WHERE sale_date = '2022-11-05';

--2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than or equal to '4'
-- in the month of Nov-2022:
SELECT * FROM retail_sales
WHERE
	category='Clothing' 
	AND quantity >= 4 
	AND TO_CHAR(sale_date,'YYYY-MM')='2022-11';

--3 Write a SQL query to calculate the total sales (total_sale) for each category.:
SELECT category,
	SUM(total_sale)AS net_sales,
	COUNT(*) AS total_orders
	FROM retail_sales
	GROUP BY category
	ORDER BY total_orders DESC;

--4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.:
SELECT ROUND(AVG(age))as average_age
FROM retail_sales
WHERE category='Beauty';

--Median Age
SELECT PERCENTILE_CONT(0.5)
WITHIN GROUP(ORDER BY age) as "Median_age"
FROM retail_sales;

--5 Write a SQL query to find all transactions where the total_sale is greater than 1000.:
SELECT * FROM retail_sales
WHERE total_sale >1000;

--6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.:
SELECT category,gender,COUNT(transactions_id) AS total_transactions
FROM retail_sales
GROUP BY gender,category
ORDER BY category,total_transactions desc;

--7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year:
--Using CTE
WITH rk_cte as(
SELECT 
		EXTRACT(YEAR FROM sale_date)AS year,
		EXTRACT(MONTH FROM sale_date)AS month,
		ROUND(AVG(total_sale)) AS avg_sale,
		RANK()OVER(PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sale)DESC) AS rank
FROM retail_sales
GROUP BY 1,2)
SELECT * FROM rk_cte
WHERE rank =1;

--Using Subquery
SELECT year,month,avg_sale FROM (SELECT 
		EXTRACT(YEAR FROM sale_date)AS year,
		EXTRACT(MONTH FROM sale_date)AS month,
		ROUND(AVG(total_sale)) AS avg_sale,
		RANK()OVER(PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sale)DESC) AS rank
FROM retail_sales
GROUP BY 1,2)AS T1
WHERE rank=1;

--8 Write a SQL query to find the top 5 customers based on the highest total sales :
SELECT customer_id,
	   SUM(total_sale)AS total_sales
  	   FROM retail_sales
	   GROUP BY customer_id
	   ORDER BY 2 DESC
	   LIMIT 5;

--9 Write a SQL query to find the number of unique customers who purchased items from each category.:
SELECT category,
		COUNT(DISTINCT customer_id) uniq_cust
		FROM retail_sales
		GROUP BY category;

--10 Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17):
WITH hourly_shift AS(
SELECT *,
	CASE 
		WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
		WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
		ELSE 'Evening'
		END AS shift
	FROM retail_sales
)
SELECT shift,COUNT(*)AS total_orders
FROM hourly_shift
GROUP BY shift;

SELECT * FROM retail_sales;
/*===================================================
          END OF PROJECT
=====================================================*/
