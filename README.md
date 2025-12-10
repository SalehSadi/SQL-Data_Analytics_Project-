# 📊 SQL Data Analytics Project

* Project name: SQL Data Analytics Project
* Author: Saleh Md. Sadi
* Status: Completed
* Thank you: Special thanks to Baraa Khatib Salkini for the SQL tutorials that helped me learn and build this project.

Welcome to my **SQL Analytics Project** — a comprehensive analysis of ERP and CRM sales and customer data using **T-SQL**.

This project demonstrates **real-world analytics skills**, including aggregation, segmentation, ranking, trend analysis, and reporting using SQL.

---

## 🚀 Project Overview

The project focuses on **analyzing sales, products, and customer data** to generate actionable insights:

* Explore and understand datasets
* Calculate aggregated metrics and KPIs
* Segment customers and products
* Identify top/bottom performers
* Analyze trends and growth over time

This project is a **portfolio-ready showcase of advanced SQL analytics**.

---

## 🎯 Project Objectives

### ✔ 1. Generate Business Insights

* Aggregate key metrics (total sales, orders, quantity, average price)
* Analyze customer behavior and spending patterns
* Evaluate product performance and revenue contribution
* Perform time-series and cumulative analysis
* Rank top and bottom customers and products

### ✔ 2. Customer & Product Segmentation

* Segment customers: VIP, Regular, New
* Segment products: High-Performer, Mid-Range, Low-Performer
* Categorize products by cost range
* Track recency, lifespan, and average order metrics

---

## 📁 Dataset & Source Systems

| Source         | Description                             |
| -------------- | --------------------------------------- |
| **ERP System** | Sales transactions, product master data |
| **CRM System** | Customer profiles and demographics      |

---

## 🧱 Project Structure

```
├── datasets/               # Raw CSV files (ERP & CRM)
├── scripts/                # SQL analytics scripts
├── docs/                   # Analytics documentation
├── README.md               # Project overview
└── LICENSE
```

---

## 🗂 Key Deliverables

* Aggregated metrics (total sales, quantity, orders, customers)
* Customer segmentation reports (VIP, Regular, New)
* Product performance reports (High, Mid, Low)
* Top/bottom products and customers
* Trend and time-series analysis (monthly/yearly)
* Running totals and moving averages

---

## 📄 Documentation Included

* **Data dictionary**
* **Query explanations & business logic**
* **Customer and product segmentation rules**
* **Analytics report views**

---

## 🛠 Technologies Used

* **SQL Server** – Query execution and analytics
* **T-SQL** – Aggregation, ranking, and window functions
* **GitHub** – Version control and repository

---

## 🧪 How to Use This Project

1. Clone the repository.
2. Load SQL scripts into SQL Server.
3. Import CSV datasets into staging tables.
4. Execute analytics queries or views to generate insights.

---

## 📌 Example SQL Snippets

### 1️⃣ Aggregated Metrics

```sql
-- Total sales
SELECT SUM(sales_amount) AS total_sales FROM gold.fact_sales;

-- Total orders
SELECT COUNT(DISTINCT order_number) AS total_orders FROM gold.fact_sales;

-- Total customers
SELECT COUNT(DISTINCT customer_key) AS total_customers FROM gold.fact_sales;
```

### 2️⃣ Customer Segmentation

```sql
WITH customer_spending AS (
    SELECT
        c.customer_key,
        SUM(f.sales_amount) AS total_spending,
        DATEDIFF(month, MIN(order_date), MAX(order_date)) AS lifespan
    FROM gold.fact_sales f
    LEFT JOIN gold.dim_customers c
    ON f.customer_key = c.customer_key
    GROUP BY c.customer_key
)
SELECT 
    CASE 
        WHEN lifespan > 12 AND total_spending > 5000 THEN 'VIP'
        WHEN lifespan >= 12 AND total_spending <= 5000 THEN 'Regular'
        ELSE 'New'
    END AS customer_segment,
    COUNT(customer_key) AS total_customers
FROM customer_spending
GROUP BY customer_segment;
```

### 3️⃣ Product Performance Report

```sql
CREATE VIEW gold.report_products AS
WITH base_query AS (
    SELECT f.order_number, f.order_date, f.customer_key, f.sales_amount, f.quantity,
           p.product_key, p.product_name, p.catagory, p.subcategory, p.cost
    FROM gold.fact_sales f
    LEFT JOIN gold.dim_products p
    ON f.product_key = p.product_key
),
product_aggregations AS (
    SELECT product_key, product_name, catagory, subcategory, cost,
           DATEDIFF(MONTH, MIN(order_date), MAX(order_date)) AS lifespan,
           MAX(order_date) AS last_sale_date,
           COUNT(DISTINCT order_number) AS total_orders,
           COUNT(DISTINCT customer_key) AS total_customers,
           SUM(sales_amount) AS total_sales,
           SUM(quantity) AS total_quantity
    FROM base_query
    GROUP BY product_key, product_name, catagory, subcategory, cost
)
SELECT *, 
       CASE WHEN total_sales > 50000 THEN 'High-Performer'
            WHEN total_sales >= 10000 THEN 'Mid-Range'
            ELSE 'Low-Performer'
       END AS product_segment
FROM product_aggregations;
```

---

## 🙌 Purpose of This Project

This project demonstrates:

* **Advanced SQL analytics skills**
* **Customer and product insights generation**
* **Portfolio-ready showcase for SQL Analytics roles**

---

