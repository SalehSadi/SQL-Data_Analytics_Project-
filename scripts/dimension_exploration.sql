-- purpose is to explore different dimensions for better clearity
-- explore all the countries of the customers

SELECT DISTINCT country FROM gold.dim_customers

-- explore all product categories

SELECT DISTINCT category FROM gold.dim_products

-- explore all product categories including sub-category

SELECT DISTINCT 
  category, 
  subcategory, 
  product_name 
FROM gold.dim_products
ORDER BY 1, 2, 3
 
