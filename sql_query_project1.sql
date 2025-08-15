CREATE DATABASE sql_project1;

USE sql_project1;

CREATE TABLE retail_sales (
    transactions_id   INT PRIMARY KEY,
    sale_date         DATE,
    sale_time         TIME,
    customer_id       INT,
    gender            VARCHAR(10),
    age               INT,
    category          VARCHAR(50),
    quantity          INT,
    price_per_unit    DECIMAL(10,2),
    cogs              DECIMAL(10,2),
    total_sale        DECIMAL(10,2)
);
SET GLOBAL local_infile = 1;
SELECT * FROM retail_sales ;

SELECT * FROM  retail_sales
WHERE transactions_id IS NULL;

SELECT * 
FROM retail_sales
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
   
SET SQL_SAFE_UPDATES = 0;

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

-- DATA EXPLORATION

-- 1. HOW MANY SALES WE HAVE?
SELECT COUNT(*) as total_sales FROM retail_sales;

-- 2. HOW MANY CUSTOMER WE HAD
SELECT COUNT(distinct customer_id) as total_sales FROM retail_sales;

-- 3. Total revenue
SELECT SUM(total_sale) AS total_revenue FROM retail_sales;
 
 -- 4. Average customer age
SELECT AVG(age) AS avg_customer_age FROM retail_sales;

-- 5. Sales by category
SELECT category, SUM(total_sale) AS category_sales
FROM retail_sales
GROUP BY category
ORDER BY category_sales DESC;

-- 6. Sales by gender
SELECT gender, SUM(total_sale) AS gender_sales
FROM retail_sales
GROUP BY gender;


-- 8. Average price per unit by category
SELECT category, AVG(price_per_unit) AS avg_price
FROM retail_sales
GROUP BY category
ORDER BY avg_price DESC;


-- 10. Top 5 customers by spending
SELECT customer_id, SUM(total_sale) AS total_spent
FROM retail_sales
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 5;
--------------------------------------------------------------------------------------------------------------
-- Q1: Retrieve all columns for sales made on '2022-11-05'

-- Q2: Retrieve all transactions where the category is 'Clothing' and the quantity sold is 4 in the month of Nov-2022

-- Q3: Calculate the total sales (total_sale) for each category

-- Q4: Find the average age of customers who purchased items from the 'Beauty' category

-- Q5: Find all transactions where the total_sale is greater than 1000
-------------------------------------------------------------------------------------------------------------

-- Q1: Write a SQL query to retrieve all columns for sales made on '2022-11-05'
SELECT *
FROM retail_sales
WHERE sale_date = '2022-11-05';

-- Q2: Write a SQL query to retrieve all transactions where the category is 'Clothing' 
--     and the quantity sold is 4 in the month of Nov-2022
SELECT *
FROM retail_sales
WHERE category = 'Clothing'
  AND quantity = 4
  AND sale_date BETWEEN '2022-11-01' AND '2022-11-30';
  
-- Q3: Write a SQL query to calculate the total sales (total_sale) for each category
SELECT category, SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY category;

-- Q4: Write a SQL query to find the average age of customers who purchased items 
--     from the 'Beauty' category
SELECT category, AVG(age) AS avg_age
FROM retail_sales
WHERE category = 'Beauty'
GROUP BY category;

-- Q5: Write a SQL query to find all transactions where the total_sale is greater than 1000
SELECT *
FROM retail_sales
WHERE total_sale > 1000;


