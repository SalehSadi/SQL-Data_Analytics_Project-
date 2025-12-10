-- To begin the project, all table and columns should be explored for better clarity,
-- along with that the following info should be explored as well 
--  TABLE_CATALOG, TABLE_SCHEMA, TABLE_NAME, TABLE_TYPE as sub-category information

-- explore all objects in the data base 

SELECT * FROM INFORMATION_SCHEMA.TABLES

-- explore all columns in the data base 
  
SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'dim_customers'  
