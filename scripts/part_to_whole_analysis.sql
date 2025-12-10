/* Purpose:
    - To compare performance or metrics across dimensions or time periods.
    - To evaluate differences between categories.
    - Useful for A/B testing or regional comparisons.

SQL Functions Used:
    - SUM(), AVG(): Aggregates values for comparison.
    - Window Functions: SUM() OVER() for total calculations.
*/

-- which categories contribute the most to the overall sales ?

WITH catagory_sales AS (
SELECT 
catagory,
SUM(sales_amount) AS total_sales -- could be total nr of cx, orders etc 
FROM gold.fact_sales f 
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
GROUP BY catagory)

SELECT 
catagory,
total_sales,
SUM(total_sales) OVER () overall_sales,
CONCAT(ROUND((CAST(total_sales AS FLOAT)/ SUM(total_sales) OVER ()) * 100, 2), '%') AS percentage_of_total
FROM catagory_sales
ORDER BY total_sales DESC

