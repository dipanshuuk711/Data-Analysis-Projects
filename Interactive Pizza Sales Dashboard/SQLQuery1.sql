Create Database Project;	

Use Pizza_DB;

Select * From Pizza_sales;

-- Total Revenue
Select  Sum(Unit_price) as Total_revenue From Pizza_Sales;

-- Average Order Value
Select (Sum(total_price) / Count(Distinct Order_ID)) Average_Order_Value from pizza_sales;

-- Total Pizza Sold
Select  Sum(Quantity) as Total_Sales From Pizza_Sales;

Select Count(Distinct(Order_id)) as Total_Orders From Pizza_Sales;

-- Average pizza/order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales

--Daily sales trend
Select Datename(DW, order_date) as order_day, Count(Distinct order_id) As Total_Orders
From Pizza_Sales
Group by Datename(DW, order_date);

Select Time(DW, order_date) as order_day, Count(Distinct order_id) As Total_Orders
From Pizza_Sales
Group by Datename(DW, order_date);

SELECT
    DATEPART(HOUR, order_time) AS order_hour,
    COUNT(DISTINCT order_id) AS Total_Orders
FROM Pizza_Sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY order_hour ASC;

Select * From Pizza_sales;

-- percentage of sales by category
select pizza_category, 
cast(sum(total_price) as Decimal(10,2)) as Total_Revenue,
Cast(sum(total_price) * 100 / (Select sum(total_price) from pizza_sales) as Decimal(10,2))As PCT
From Pizza_sales
group by pizza_Category;

-- percentage of sales by pizza size
select Pizza_size, 
cast(sum(total_price) as Decimal(10,2)) as Total_Revenue,
Cast(sum(total_price) * 100 / (Select sum(total_price) from pizza_sales) as Decimal(10,2)) As PCT
From Pizza_sales
group by pizza_size
order by pizza_size
 

--Total pizza sold by category
Select 
Pizza_category, 
SUM(quantity) as Total_Quantity_Sold 
From Pizza_Sales
Group By Pizza_Category
Order By Total_Quantity_Sold DESC;


Select TOP 5 pizza_name, SUM(quantity) as Total_Pizzas_Sold
FROM pizza_sales
Group by pizza_name
Order by Total_Pizzas_Sold Desc;


Select TOP 5 pizza_name, SUM(quantity) as Total_Pizzas_Sold
FROM pizza_sales
Group by pizza_name
Order by Total_Pizzas_Sold ASC;