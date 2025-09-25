# Mysql-Project-1-
Retail sales
````markdown
# Retail Sales Data Analysis - SQL Project 1

## Project Overview

This project involves the cleaning, exploration, and analysis of a **Retail Sales Dataset** using **SQL (MySQL)**. The primary goal is to derive meaningful insights into sales performance, customer behavior, and product category trends.

The analysis is structured into three main phases:
1.  **Data Preparation and Cleaning:** Creating a working environment and ensuring data quality (handling NULL values).
2.  **Data Exploration:** Initial summary of the dataset (e.g., total sales, customer count).
3.  **Data Analysis:** Answering specific business questions about sales, categories, and customer metrics.

## Database and Table Structure

### Database: `SQL_PROJECT_P1`
### Table: `RETAIL_SALES_TABLE` / `RETAIL_SALES_CLEAN`

| Column Name | Data Type | Description |
| :--- | :--- | :--- |
| `transactions_id` | INT | Unique identifier for each transaction (Primary Key) |
| `sale_date` | DATE | Date of the transaction |
| `sale_time` | TIME | Time of the transaction |
| `customer_id` | INT | Unique identifier for the customer |
| `gender` | VARCHAR(15) | Gender of the customer |
| `age` | INT | Age of the customer |
| `category` | VARCHAR(15) | Product category of the item sold |
| `quantity` | INT | Number of units sold in the transaction |
| `price_per_unit` | FLOAT | Price of a single unit |
| `cogs` | FLOAT | Cost of Goods Sold for the transaction |
| `total_sale` | FLOAT | Total revenue from the transaction |

---

## Data Analysis Questions and Insights

The following business questions were addressed through the SQL queries:

### Sales and Transaction Analysis

1.  **Retrieve all columns for sales made on a specific date (2022-11-05).**
2.  **Retrieve all transactions where the category is 'clothing' and the quantity sold is $\ge 4$ in the month of November 2022.**
3.  **Calculate the total sales for each product category.** (Identifies top-performing categories by revenue)
4.  **Find all transactions where the total sale is greater than 1000.** (Highlights high-value transactions)
5.  **Find the average sale for each month and determine the best-selling month each year.** (Uses a `RANK()` window function to identify seasonal trends)

### Customer and Behavioral Analysis

6.  **Calculate the average age of customers who purchased items from the 'Beauty' category.**
7.  **Find the total number of transactions made by each gender in each category.** (Provides insight into gender-based preferences by category)
8.  **Find the top 5 customers based on the highest total sales.** (Identifies the most valuable customers using a `RANK()` window function)
9.  **Find the number of unique customers who purchased items from each category.** (Measures category popularity in terms of customer reach)

### Time-based Analysis

10. **Determine the number of orders for each defined shift:**
    * **Morning:** $(\text{Hour} \le 12)$
    * **Afternoon:** $(\text{Hour} \text{ between } 12 \text{ and } 17)$
    * **Evening:** $(\text{Hour} > 17)$
    (Uses a `CASE` statement and a Common Table Expression (CTE) to analyze sales by time of day)

---

## How to Run the Project

To execute the queries and replicate the analysis:

1.  **Database Setup:** Ensure you have a MySQL environment (or any SQL environment compatible with the syntax provided).
2.  **Create Database:** The script begins by dropping and creating the database:
    ```sql
    DROP DATABASE IF EXISTS `SQL_PROJECT_P1`;
    CREATE DATABASE `sql_project_p1`;
    USE `sql_project_p1`;
    ```
3.  **Run the Script:** Execute the full content of the `my sql project 1.sql` file. Note that a dataset must be loaded into the `RETAIL_SALES_TABLE` *before* the `INSERT` statement for the cleaning section to work correctly.

**Note:** The script includes the table creation and cleaning steps, followed by the complete set of analysis queries.
````
