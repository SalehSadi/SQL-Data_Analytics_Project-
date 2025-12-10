-- Purpose:
    -- To track trends, growth, and changes in key metrics over time.
    -- For time-series analysis and identifying seasonality.
    -- To measure growth or decline over specific periods.

-- SQL Functions Used:
    -- Date Functions: DATEPART(), DATETRUNC(), FORMAT()
    -- Aggregate Functions: SUM(), COUNT(), AVG()

-- Analyze sales performance over time 

SELECT 
	YEAR(order_date) AS order_year,
	MONTH(order_date) AS order_month,
	SUM(sales_amount) AS total_sales,
	COUNT(DISTINCT customer_key) AS total_customers,
	SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL 
GROUP By YEAR(order_date), MONTH(order_date)
ORDER BY YEAR(order_date), MONTH(order_date)

-- using DATETRUNC 

SELECT 
	DATETRUNC(MONTH, order_date) AS order_date, -- month can be replaced by year 
	SUM(sales_amount) AS total_sales,
	COUNT(DISTINCT customer_key) AS total_customers,
	SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL 
GROUP By DATETRUNC(MONTH, order_date)
ORDER BY DATETRUNC(MONTH, order_date)

-- formatting as per requirement 

SELECT 
	FORMAT(order_date, 'yyyy-MMM') AS order_date, -- month can be replaced by year 
	SUM(sales_amount) AS total_sales,
	COUNT(DISTINCT customer_key) AS total_customers,
	SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL 
GROUP By FORMAT(order_date, 'yyyy-MMM') 
ORDER BY FORMAT(order_date, 'yyyy-MMM') 
