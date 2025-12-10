-- Purpose:
    -- To calculate aggregated metrics (e.g., totals, averages) for quick insights.
    -- To identify overall trends or spot anomalies.

-- Find the total sales

SELECT SUM(sales_amount) AS total_sales FROM gold.fact_sales

-- find how many items are sold 

SELECT SUM(quantity) AS total_quantity FROM gold.fact_sales

-- find the average selling price 

SELECT AVG(price) AS avg_price FROM gold.fact_sales

-- find the total number of orders 

SELECT COUNT(order_number) AS total_orders FROM gold.fact_sales
SELECT COUNT(DISTINCT order_number) AS total_orders FROM gold.fact_sales -- MUST USE DISTINCT
SELECT * FROM gold.fact_sales -- this can be a little confusuing but one order can have different items, 3 products in one order 

-- find the total number of products

SELECT COUNT(product_key) AS total_products FROM gold.dim_products -- product name can be used instead of product key 
SELECT COUNT(DISTINCT product_key) AS total_products FROM gold.dim_products -- both numbers are same

-- find the total number of customers 

SELECT COUNT(customer_key) AS total_customers FROM gold.dim_customers


-- find the total number of customers who have placed an order 

SELECT COUNT(DISTINCT customer_key) AS total_customers FROM gold.fact_sales

-- Generate a report that shows all key metrics of the business 

SELECT 'total_sales' AS measure_name, SUM(sales_amount) AS measure_value FROM gold.fact_sales
UNION ALL 
SELECT 'total_quantity' AS measure_name, SUM(quantity) AS measure_value FROM gold.fact_sales
UNION ALL 
SELECT 'average_price' AS measure_name, AVG(price) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'total_nr_orders' AS measure_name, COUNT(DISTINCT order_number) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'total_nr_products' AS measure_name, COUNT(product_key) AS measure_value FROM gold.dim_products
UNION ALL 
SELECT 'total_nr_customers' AS measure_name, COUNT(customer_key) AS measure_value FROM gold.dim_customers
