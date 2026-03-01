CREATE TABLE sales (
sale_id INT AUTO_INCREMENT PRIMARY KEY,
product_id INT,
product_name VARCHAR(100),
quantity INT,
price DECIMAL(10,2),
sale_date DATETIME,
customer_id INT );

INSERT INTO sales (product_id, product_name, quantity, price, sale_date,
customer_id)
VALUES
(1,'Laptop', 2, 50000, '2026-02-01 10:00:00', 101),
(2, 'Mobile', 5, 15000, '2026-02-01 11:00:00', 102),
(1,'Laptop', 1, 50000, '2026-02-02 09:30:00', 103),
(3,'Headphones', 10, 2000, '2026-02-02 14:15:00', 101),
(2, 'Mobile', 3, 15000, '2026-02-03 12:00:00', 104),
(4,'Smart Watch', 4, 10000, '2026-02-03 13:45:00', 105),
(1,'Laptop', 1, 50000, '2026-02-04 15:00:00', 106),
(3,'Headphones', 5, 2000, '2026-02-04 16:00:00', 102),
(2,'Mobile', 2, 15000, '2026-02-05 10:30:00', 103),
(4,'Smart Watch', 1, 10000, '2026-02-05 11:00:00', 101);
select * from sales


-- Find the total quantity sold for each product.
Select product_name , sum(quantity) as total_quantity
from sales
group by product_name

-- 2. Get the total sales per product.
SELECT product_name, SUM(quantity * price) AS total_sales
FROM sales
GROUP BY product_name;

-- 3. Find the average quantity sold for each product.
select product_name , avg(quantity) as avg_quantity
from sales
group by product_name

-- 4. Find the number of sales transactions for each product.
Select product_id, count(*) as total_transactions
from sales
group by product_id;

-- 5. Find the minimum quantity sold for each product.
select product_name , min(quantity) as min_quantity
from sales
group by product_name

-- 6. Find the maximum quantity sold for each product.
select product_name , max(quantity) as max_quantity
from sales
group by product_name

-- 7. Find the total quantity sold per product on each day.
select product_id,sale_date,sum(quantity) as total_quantity
from sales
group by product_id,sale_date

-- Get the total sales for each product, grouped by month.
select product_id,
          extract(Month from sale_date) as month,
          sum(quantity) as total_sales
from sales
group by product_id,extract(month from sale_date)

-- 9. Find the number of sales per product by day.
select product_id,sale_date,count(*) as total_sales
from sales
group by product_id,sale_date

-- 10. Get the total quantity sold for each product, grouped by year.
select product_id,
     extract(year from sale_date) AS year,
     sum(quantity) As Total_quantity
from sales
group by product_id, extract(year from sale_date)

USE MYSQL

-- 11. Find the average quantity sold for each product, grouped by month.
select product_id,
	  extract(month from sale_date) as month,
      avg(quantity) as quantity_sold
from sales
group by product_id,extract(month from sale_date)

-- 12. Find the product with the highest total sales.
select product_name,sum(quantity*price) as total_sales
from sales
group by product_name
order by total_sales desc
limit 1

-- 13. Find the product with the lowest total sales.
select product_name,sum(quantity*price) as total_sales
from sales
group by product_name
order by total_sales asc
limit 1

-- 14. Find the total sales per product for a specific month.
select product_name,sum(quantity*price) as total_sales
from sales
where month(sale_date)=2
group by product_name

-- 15. Get the total quantity sold per product for each week.
select product_name,week(sale_date),sum(quantity) as total_quantity_sold
from sales
group by product_name, week(sale_date)

-- 16. Get the total number of sales transactions for each product.
select product_name,count(*)
from sales
group by product_name

-- 17. Find the average quantity sold for each product by week.
select product_name,week(sale_date) as week_number,
      Avg(quantity) as avg_quantity_sold
from sales
group by product_name,
         week(sale_date)
order by product_name,
        week_number
        
-- 18. Find the average sales per transaction for each product.
select product_name,avg(quantity*price) as avg_salary_per_transaction
from sales
group by product_name
order by product_name

-- 19. Get the number of distinct products sold per day.
select sale_date,count(distinct product_name) as distinct_product_sold
from sales
group by sale_date
order by sale_date

-- 20. Find the total quantity sold for each product, grouped by quarter.
select product_name,quarter(sale_date)as quanter_number,
              sum(quantity) as total_quantuty_sold
from sales
group by product_name,quanter_number

-- 21. Get the total sales per product for each day of the week.
select product_name,sum(quantity*price) as total_sales_per_product, dayofweek(sale_date) as day_of_week
from sales
group by product_name, dayofweek(sale_date)
order by product_name, day_of_week

-- 22. Find the product with the highest average sales per transaction.
select product_name , avg(quantity*price) as avg_sales_per_transaction
from sales
group by product_name
order by avg_sales_per_transaction desc
limit 1

-- 23. Find the total quantity sold for each product in a specific year.
select product_name, sum(quantity) as total_quantity_sold, year(sale_date) as year_of_sales
from sales
where year(sale_date) = 2026
group by product_name,year(sale_date)
order by product_name

-- 24. Find the total quantity sold for each product for the current year.
select product_name,sum(quantity) as total_quantity_sold
from sales
where year(sale_date)=year(curdate())
group by product_name

-- 25. Get the total sales for each product in the last quarter.
select product_name,sum(quantity*price) as total_sales
from sales
where quarter(sale_date)=quarter(curdate())-1
     and year(sale_date)=year(curdate())
group by product_name

-- 26. Find the average number of products sold per transaction for each product.
select product_name, avg(quantity) as avg_products_per_transaction
from sales
group by product_name

-- 27. Find the average quantity sold per product per month.
select product_name,avg(quantity) as avg_quantity_sold, month(sale_date) as per_month
from sales
group by product_name,month(sale_date)
order by product_name,per_month

-- 28. Find the total sales for each product, grouped by day of the week.
select product_name, sum(quantity*price) as total_sales, dayofweek(sale_date) as day_of_week
from sales
group by product_name, dayofweek(sale_date)
order by product_name,day_of_week

-- 29. Get the number of sales transactions for each product by year.
select product_name,count(*) as sales_transaction, year(sale_date) as prod_year
from sales
group by product_name, year(sale_date)
order by product_name,prod_year

-- 30. Find the average quantity sold for each product, grouped by quarter.
select product_name,avg(quantity) as avg_quantity ,quarter(sale_date) as quarter_sale
from sales
group by product_name,quarter(sale_date)
order by product_name,quarter_sale

-- 31. Find the total sales for each product for a specific year.
select product_name,sum(quantity*price) as total_sales,year(sale_date) as specific_year
from sales
where year(sale_date)=2026
group by product_name, year(sale_date)
order by product_name,specific_year

-- 32. Get the total quantity sold per product per quarter.
select product_name,sum(quantity) as total_sold, quarter(sale_date) as per_quarter
from sales
group by product_name,quarter(sale_date)
order by product_name,per_quarter

-- 33. Find the average sales per day for each product.
select product_name,avg(daily_sales) as avg_sales_per_day
from (
    select product_name,sale_date,
    sum(quantity*price) as daily_sales
from sales
group by product_name,sale_date
)
 as daily_data
group by product_name

-- 34. Get the total sales per product for each month in the last year.
select product_name,sum(quantity*price) as total_sales, month(sale_date) as each_month, year(sale_date) as last_year
from sales
where year(sale_date)=year(curdate())
group by product_name,month(sale_date),year(sale_date)
order by product_name,each_month,last_year

-- 35. Find the total quantity sold for each product, grouped by week.
select product_name,sum(quantity) as total_quantity , week(sale_date) as per_week
from sales
group by product_name, week(sale_date)
order by product_name,per_week

-- 36. Find the number of sales transactions for each product per month.
select product_name,count(*) as number_sales_transations , month(sale_date) as per_month
from sales
group by product_name, month(sale_date)
order by product_name,per_month

-- 37. Find the product with the highest total sales in the last 6 months.
 select product_name, sum(quantity*price) as total_sales
 from sales
 where sale_date>=date_sub(curdate(),interval 6 month)
 group by product_name
 order by total_sales desc
 limit 1
 
 -- 38. Find the total quantity sold for each product in the first quarter of the year.
 select product_name,sum(quantity) as total_quantity
 from sales
 where quarter(sale_date)=1 and year(sale_date)=2026
 group by product_name
 
 -- 39. Find the number of products sold per product category.
SELECT 
    product_name,
    SUM(quantity) AS total_products_sold
FROM sales
GROUP BY product_name

-- 40. Get the total quantity sold per product, grouped by the day of the month.
select product_name,sum(quantity) as total_quantity, dayofmonth(sale_date) as day_of_month
from sales
group by product_name, dayofmonth(sale_date)
order by product_name,day_of_month

-- 41. Find the number of sales transactions for each product for the past week.
SELECT 
    product_name,
    COUNT(*) AS number_of_total_sales
FROM sales
WHERE sale_date >= DATE_SUB(
    (SELECT MAX(sale_date) FROM sales),
    INTERVAL 7 DAY)
GROUP BY product_name

-- 42. Get the average quantity sold for each product, grouped by year.
select product_name,year(sale_date) as year,
       avg(quantity) as avg_quantity
from sales
group by product_name,year(sale_date)
order by product_name,year

-- 43. Find the product with the highest total quantity sold by month.
select product_name,month(sale_date) as month,
       sum(quantity) as total_quantity
from sales
group by product_name,month(sale_date)

-- 44. Find the product with the highest number of sales transactions by month.
select product_name,num_sales_transaction,month from ( 
       select product_name,count(*) as num_sales_transaction, month(sale_date) as month,
       rank() over (partition by month(sale_date)order by count(*) desc) as rnk
from sales
group by product_name, month(sale_date)) t
where rnk=1

-- 45. Find the total quantity sold for each product, grouped by day of the week.
select product_name,sum(quantity) as total_quantity, dayofweek(sale_date) as day_of_week
from sales
group by product_name,dayofweek(sale_date)

-- 46. Get the total sales per product per month, for the current year.
select product_name,sum(quantity*price) as total_sales, month(sale_date) as per_month_sales
from sales
where year(sale_date)=year(curdate())
group by product_name,month(sale_date)
order by product_name,per_month_sales

-- 47. Find the total quantity sold for each product by the hour of the day.
select product_name, sum(quantity) as total_quantity, hour(sale_date) as sale_hour
from sales
group by product_name,hour(sale_date)
order by product_name,sale_hour

-- 48. Find the total sales for each product, grouped by day of the month.
select product_name, sum(quantity*price) as total_sales ,dayofmonth(sale_date) as day_of_month
from sales
group by product_name,dayofmonth(sale_date)
order by product_name, day_of_month

-- 49. Get the total sales for each product in the last 30 days.
select product_name,sum(quantity*price) as total_sales , day(sale_date) as days
from sales
where sale_date>=curdate()-interval 30 day
group by product_name, day(sale_date)
order by product_name,days

-- 50. Find the total quantity sold for each product, grouped by sales date.
select product_name, sum(quantity) as total_quantity, date(sale_date) as sale_date
from sales
group by product_name , date(sale_date)
order by product_name,sale_date

-- 51. Get the average number of sales transactions per product per week.
select product_name,count(*) as avg_sales_transactions, week(sale_date) as per_week
from sales
group by product_name,week(sale_date)

-- 52. Find the number of products sold for each product, grouped by quarter.
select product_name,quarter(sale_date) as quarter, count(*) as num_sale
from sales
group by product_name,quarter(sale_date)
order by product_name,quarter

-- 53. Find the total sales per product, grouped by the week of the month.
select product_name, sum(quantity*price) as total_sale ,
(week(sale_date,1)-week(date_sub(sale_date,interval dayofmonth(sale_date)-1 day),1)+1) as week_of_month
from sales
group by product_name,week_of_month
order by product_name,week_of_month

-- 54. Find the total sales for each product, grouped by year.
select product_name, sum(quantity*price) as total_sale, year(sale_date) as years
from sales
group by product_name,year(sale_date)
order by product_name,years

-- 55. Get the average sales per product per transaction for each product.
select product_name,avg(quantity*price) as avg_sales
from sales
group by product_name

-- 56. Find the total quantity sold for each product for each specific month.
select product_name,sum(quantity) as total_quantity, month(sale_date) as each_month
from sales
group by product_name,month(sale_date)
order by product_name,each_month

-- 57. Find the total quantity sold per product for the current quarter.
select product_name,sum(quantity) as total_quantity, quarter(sale_date) as quarters
from sales
where year(sale_date)=year(curdate())
and quarter(sale_date)=quarter(curdate())
group by product_name,quarter(sale_date)
order by product_name

-- 58. Find the total sales for each product, grouped by quarter.
select product_name, sum(quantity*price) as total_sales, quarter(sale_date) as quarters
from sales
group by product_name,quarter(sale_date)

-- 59. Find the total number of sales transactions for each product by year.
select product_name, count(*) as total_sales_transactions , year(sale_date) as years
from sales
group by product_name,year(sale_date)
order by product_name,years

-- 60. Find the total quantity sold for each product, grouped by year.
select product_name, sum(quantity) as total_quantity, year(sale_date) as years
from sales
group by product_name, year(sale_date)
order by product_name,years

-- 61. Find the total quantity sold per product for the last quarter.
select product_name,sum(quantity) as total_quantity, quarter(sale_date) as quarters , year(sale_date) as years
from sales
where quarter(sale_date)=quarter(curdate()-interval 1 quarter)
and year(sale_date)=year(curdate()-interval 1 quarter)
group by product_name,quarter(sale_date),year(sale_date)
order by product_name

-- 62. Find the number of sales transactions for each product per day.
select product_name,count(*) as sales_transactions , day(sale_date) as days
from sales
group by product_name, day(sale_date)
order by product_name,days

-- 63. Find the total sales for each product by month for the last 12 months.
select product_name,sum(quantity) as total_sales 
from sales
where (year(sale_date)=2026
and quarter(sale_date)=quarter(curdate())-1)
group by product_name

-- 64. Get the total sales for each product in the current month.
select product_name,sum(quantity*price) as total_sales
from sales
where year(sale_date)=year(curdate())
and month(sale_date)=month(curdate())
group by product_name

-- 65. Find the average sales for each product for each quarter of the year.
select product_name,avg(quantity*price) as avg_sales , quarter(sale_date) as quarters
from sales
group by product_name,quarter(sale_date)
order by product_name, quarters

-- 66. Find the total sales for each product grouped by the day of the week.
select product_name,sum(quantity*price) as total_sale,dayofweek(sale_date) as day_of_week
from sales
group by product_name, dayofweek(sale_date)
order by product_name,day_of_week

-- 67. Find the total quantity sold for each product for each quarter.
select product_name,sum(quantity) as total_quantity , quarter(sale_date) as quarters
from sales
group by product_name,quarter(sale_date)
order by product_name,quarters

-- 68. Get the total number of sales transactions for each product for the current year.
select product_name,count(*) as total_sales_transactions
from sales
where year(sale_date)=year(curdate())
group by product_name
order by product_name

-- 69. Find the total sales for each product, grouped by the last 7 days.
select product_name,sale_date,sum(quantity*price) as total_sales
from sales
where sale_date>=curdate()-interval 7 day
group by product_name,sale_date
order by product_name,sale_date

-- 70. Find the number of products sold for each product, grouped by month.
select product_name,month(sale_date) as months,sum(quantity) as total_products_sold
from sales
group by product_name,month(sale_date)
order by product_name,months

-- 71. Get the total quantity sold for each product by the number of transactions.
select product_name,count(*) as number_of_transactions,
      sum(quantity) as total_quantity
from sales
group by product_name
order by number_of_transactions

-- 72. Find the total sales for each product, grouped by the product ID.
select product_id,sum(quantity*price) as total_sales
from sales
group by product_id
order by product_id

-- 73. Find the average quantity sold for each product, grouped by week.
select product_name,week(sale_date) as week_number,
avg(quantity) as avg_quantity
from sales
group by product_name,week(sale_date)
order by product_name,week_number

-- 74. Find the total quantity sold for each product, grouped by sales date.
select product_name,sum(quantity) as total_quantity, sale_date
from sales
group by product_name, sale_date
order by product_name, sale_date

-- 75. Get the total sales per product for the first half of the year.
select product_name,sum(quantity*price) as total_sales
from sales
where month(sale_date) between 1 and 6
group by product_name

-- 76. Find the total quantity sold for each product in the second quarter of the year.
select product_name, sum(quantity) as total_quantity
from sales
where quarter(sale_date)=2
group by product_name

-- 77. Get the total quantity sold for each product by the day of the week (Monday, Tuesday, etc.).
select product_name,sum(quantity) as total_quantity,dayname(sale_date) as day_of_week
from sales
group by product_name,dayname(sale_date)
order by product_name,day_of_week

-- 78. Find the total sales for each product, grouped by the hour of the day.
select product_name,sum(quantity*price) as total_sales, hour(sale_date) as hour_of_day
from sales
group by product_name,hour(sale_date)
order by product_name,hour_of_day

-- 79. Find the total number of sales transactions for each product for the previous month.
select product_name,count(*) as total_sales_trasaction
from sales
where month(sale_date)=month(curdate())-1
and year(sale_date)=year(curdate())
group by product_name

-- 80. Find the total quantity sold for each product, grouped by product ID and month.
select product_id , month(sale_date) as month, sum(quantity) as total_quantity
from sales
group by product_id,month(sale_date)
order by product_id,month

-- 81. Find the average sales per product for each month.
select product_name,avg(quantity*price) as avg_sales , month(sale_date) as months
from sales
group by product_name,month(sale_date)
order by product_name,months

-- 82. Get the total sales for each product for the first 6 months of the year.
select product_name,sum(quantity*price) as total_sales
from sales
where month(sale_date) between 1 and 6
group by product_name

-- 83. Find the total quantity sold for each product in a specific day of the week.
select product_name,sum(quantity) as total_quantity
from sales
where dayname(sale_date)='Monday'
group by product_name

-- 84. Find the total quantity sold for each product, grouped by sales quarter.
select product_name, quarter(sale_date) as quarters,sum(quantity) as total_quantity
from sales
group by product_name,quarter(sale_date)
order by product_name,quarters

-- 85. Find the total quantity sold for each product grouped by the first 6 months of the year.
select product_name, sum(quantity) as total_quantity
from sales
where month(sale_date) between 1 and 6
group by product_name

-- 86. Find the total sales per product for each day of the month.
select product_name, sum(quantity*price) as total_sales,day(sale_date) as day
from sales
group by product_name,day(sale_date)
order by product_name,day

-- 87. Get the total sales for each product grouped by the year.
select product_name,year(sale_date) as year,sum(quantity*price) as total_sales
from sales
group by product_name,year(sale_date)
order by product_name,year

-- 88. Find the total number of sales transactions for each product, grouped by the first 3 months of the year.
select product_name,count(*) as num_sale_transactions,month(sale_date) as month
from sales
where month(sale_date) between 1 and 3
group by product_name,month(sale_date)
order by product_name,month

-- 89. Find the total quantity sold for each product for the last week.
select product_name,sum(quantity) as total_quantity
from sales
where sale_date >= current_date - interval 7 day
group by product_name

-- 90. Get the average sales per transaction for each product, grouped by month.
select product_name,month(sale_date) as month,avg(quantity*price) as avg_sale_per_transaction
from sales
group by product_name,month(sale_date)
order by product_name,month

-- 91. Find the total quantity sold for each product, grouped by quarter of the year.
select product_name,sum(quantity) as total_quantity, quarter(sale_date) as quarters
from sales
group by product_name,quarter(sale_date) 
order by product_name,quarters

-- 92. Find the total sales per product, grouped by quarter of the year.
select product_name,quarter(sale_date) as quarters, sum(quantity*price) as total_sales
from sales
group by product_name,quarter(sale_date)
order by product_name,quarters

-- 93. Find the total sales per product, grouped by year and month.
select product_name,year(sale_date) as year,month(sale_date) as month,sum(quantity*price) as total_sales
from sales
group by product_name,year(sale_date) , month(sale_date)
order by product_name,year,month

-- 94. Get the total quantity sold for each product, grouped by day of the month.
select product_name,day(sale_date) as day,sum(quantity) as total_quantity
from sales
group by product_name,day(sale_date)
order by product_name,day

-- 95. Find the total sales for each product by the last 30 days.
select product_name,sum(quantity*price) as total_sales
from sales
where sale_date >= current_date - interval 30 day
group by product_name

-- 96. Find the total sales for each product, grouped by the last 6 months.
select product_name,year(sale_date) as year,month(sale_date) as month,sum(quantity*price) as total_sales
from sales
where sale_date >= current_date - interval 6 month
group by product_name, year(sale_date), month(sale_date)
order by product_name,year,month

-- 97. Find the total quantity sold for each product for the current week.
select product_name,sum(quantity) as total_quantity 
from sales
where yearweek(sale_date,1)= yearweek(curdate(),1)
group by product_name

-- 98. Find the average sales per product, grouped by year.
select product_name,year(sale_date) as year, avg(quantity*price) as avg_sales
from sales
group by product_name,year(sale_date)
order by product_name,year

-- 99. Get the total quantity sold for each product, grouped by the first quarter of the year.
select product_name,sum(quantity) as total_quantity
from sales
where month(sale_date) between 1 and 3
group by product_name

-- 100.Find the total sales for each product, grouped by the month.
select product_name,month(sale_date) as months,sum(quantity*price) as total_sales
from sales
group by product_name,month(sale_date)
order by product_name,months