-- Purpose:
    -- To rank items (e.g., products, customers) based on performance or other metrics.
    -- To identify top performers or laggards.

--SQL Functions Used:
    -- Window Ranking Functions: RANK(), DENSE_RANK(), ROW_NUMBER(), TOP
    -- Clauses: GROUP BY, ORDER BY

-- which 20 products generate the highest revenue ??

SELECT TOP 20
p.product_name, -- product can be chnaged with category, sub-category etc etc, as per the requirement
SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f 
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY total_revenue DESC

-- solving using window function

SELECT *
FROM (
	SELECT
	p.product_name, -- product can be chnaged with category, sub-category etc etc, as per the requirement
	SUM(f.sales_amount) AS total_revenue,
	ROW_NUMBER() OVER (ORDER BY SUM(f.sales_amount) DESC) AS rank_products -- RANK () function can also be used 
	FROM gold.fact_sales f 
	LEFT JOIN gold.dim_products p
	ON p.product_key = f.product_key
	GROUP BY p.product_name)t
WHERE rank_products <= 20

-- 20 worst performing products in terms of sales 

SELECT TOP 20
p.product_name,
SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f 
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY total_revenue 

-- find the top 10 customers who have generated the highest revenue 

SELECT TOP 10
c.customer_key,
c.first_name,
c.last_name,
SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON c.customer_key = f.customer_key
GROUP BY 
c.customer_key,
c.first_name,
c.last_name
ORDER BY total_revenue DESC

-- Bottom 5 customers with fewest order placed

SELECT TOP 5
c.customer_key,
c.first_name,
c.last_name,
COUNT(DISTINCT order_number) AS total_orders
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON c.customer_key = f.customer_key
GROUP BY 
c.customer_key,
c.first_name,
c.last_name
ORDER BY total_orders
