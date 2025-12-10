--Purpose:
    -- To determine the temporal boundaries of key data points.
    -- To understand the range of historical data.

-- find the date of the first and last order 
-- how many years of sales are available 

SELECT 
	MIN(order_date) first_order_date,
	MAX(order_date) last_order_date,
	DATEDIFF(year, MIN(order_date), MAX(order_date)) AS order_range_years -- year can be replaced by months, days etc  
FROM gold.fact_sales

-- find the youngest and oldest customer 

SELECT 
  MIN(birthdate) AS oldest_birthdate,
  DATEDIFF(year, MIN(birthdate), GETDATE()) AS oldest_customer,
  MAX(birthdate) AS youngest_birthdate,
  DATEDIFF(year, MAX(birthdate), GETDATE()) AS youngest_customer
FROM gold.dim_customers
