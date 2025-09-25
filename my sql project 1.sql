DROP DATABASE IF EXISTS `SQL_PROJECT_P1`;
CREATE DATABASE `sql_project_p1`;
USE `sql_project_p1`;



CREATE TABLE `RETAIL_SALES_TABLE` (
transactions_id INT,
sale_date DATE,
sale_time TIME,
customer_id INT,
gender VARCHAR(15), 
age INT,
category VARCHAR(15), 
quantity INT,
price_per_unit FLOAT, 
cogs FLOAT, 
total_sale FLOAT
);

SELECT *
 FROM RETAIL_SALES_TABLE
 ; 
 
 SELECT 
       COUNT(*)
 FROM RETAIL_SALES_TABLE
 ; 

-- Data cleaning - -
--  creating a duplicate table to work with --

CREATE TABLE `RETAIL_SALES_CLEAN`
LIKE `RETAIL_SALES_TABLE`
;

SELECT *
 FROM RETAIL_SALES_TABLE
 ;
 
 INSERT RETAIL_SALES_CLEAN
 SELECT *
 FROM RETAIL_SALES_TABLE
 ;
 
 SELECT *
 FROM RETAIL_SALES_CLEAN
 ;

-- clearing of the null values --

SELECT *
 FROM RETAIL_SALES_CLEAN
 ;

SELECT *
 FROM retail_sales_clean
WHERE 
transactions_id is null
or
sale_date is null
or
sale_time is null
or
customer_id is null
or
gender is null
or
age is null
or
category is null
or
quantity is null
or 
price_per_unit is null
or
cogs is null
or 
total_sale is null
;

-- DELETE NULL--
DELETE
FROM retail_sales_clean
WHERE 
transactions_id is null
or
sale_date is null
or
sale_time is null
or
customer_id is null
or
gender is null
or
age is null
or
category is null
or
quantity is null
or 
price_per_unit is null
or
cogs is null
or 
total_sale is null
;

-- DATA EXPLORATION --

-- How many sales? --

select 
      count(*) as Total_sales
from retail_sales_clean
;
 
 -- How many customers?
 select 
      count(distinct customer_id) as customers
from retail_sales_clean
;

-- How many categories

select distinct category
from retail_sales_clean
;

-- DATA ANALYSIS --

-- 1.Retrieve all columns for sales made on 2022-11-05--

select * 
from retail_sales_clean
;

select * 
from retail_sales_clean
where sale_date ='2022-11-05';

-- 2.Retrieve all the transactions where the category is 'clothing' and the quantity sold is more than 4 in the month of Nov-202

select *
from retail_sales_clean
where category = 'clothing'
and
extract(year from sale_date) = 2022 and extract(month from sale_date) = 11
and
quantity >=  '4'
;

-- 3.calculate the total sales for each category

select category,sum(total_sale) as total_sales
from retail_sales_clean
group by  category
;

-- 4.average age of customers who purchased items from the beauty category

select category,
avg(age) as median_age
from retail_sales_clean
where category ='Beauty'
group by category
;

-- 5. all transactions where the total_sale is graeter than 1000

select *
from retail_sales_clean
where total_sale >= '1000'
;

-- 6. find the total number of transactions made by each gender in each category

select gender,category,
count(transactions_id) as transactions
from retail_sales_clean
group by gender,category
order by gender
;
-- 7. find the average sale for each month and find out the best selling month each year

select * from
(
	select date_format(sale_date, '%Y') as year_sale,
	date_format(sale_date, '%M') as month_sale,
	avg (total_sale) as average_sale,
	rank () over (partition by  date_format(sale_date, '%Y') order by avg (total_sale) desc ) as ranks
	from retail_sales_clean
	group by year_sale,month_sale
	 order by year_sale,average_sale desc
)as T1
where ranks = 1 
;

-- 8.find the top 5 customers based on the the highest total salees

select * from
(
	select customer_id,
	sum(total_sale) as total_sales,
	rank () over (order by sum(total_sale) desc) as ranks
	from retail_sales_clean
	group by customer_id
) as T2
where ranks <= 5
;

-- 9.find the number of unique customers who purchased items from each category

select
category,
 COUNT(DISTINCT customer_id) AS unique_cust 
from retail_sales_clean
group by category
;

-- 10. create each shift and number of orders ( Morning <=12, Afternon btwn 12 & 17, Evening >17 )

with hourly_sale
as
(
	select *,
		case
			when hour (sale_time) < 12 then 'Morning'
			when hour (sale_time) between 12 and 17 then 'Afternoon'
			else 'Evening'
		end as shift
	from retail_sales_clean
)
select shift,
count(transactions_id) as total_orders
from hourly_sale
group by shift
;


-- END OF PROJECT -- 



