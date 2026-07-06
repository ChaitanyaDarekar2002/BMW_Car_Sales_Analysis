select * from BMW_Clean_Data

select COUNT(*) as Total_Count from BMW_Clean_Data

--Total Sales

 select sum(Revenue) from BMW_Clean_Data

 --Highest Selling Model

 select Model,sum(Revenue) as Total_sales from BMW_Clean_Data
 group by Model
 order by Total_sales desc

 --Sales by Region

  select Region,sum(Revenue) as Total_sales from BMW_Clean_Data
 group by Region
 order by Total_sales desc

 --Monthly Sales

SELECT 
    MONTH(TRY_CONVERT(date, Date, 103)) AS Month,
    SUM(Revenue) AS TotalSales
FROM BMW_Clean_Data
WHERE TRY_CONVERT(date, Date, 103) IS NOT NULL
GROUP BY MONTH(TRY_CONVERT(date, Date, 103))
ORDER BY Month;

--Average Sales

select AVG(Revenue) as Total_Sales from BMW_Clean_Data

--What is the total number of cars sold

SELECT count(model) AS TotalUnitsSold
FROM BMW_Clean_Data;

--Which car model generated the highest revenue

SELECT TOP 1 Model,
       SUM(Revenue) AS Revenue
FROM BMW_Clean_Data
GROUP BY Model
ORDER BY Revenue DESC;

--Which are the top 5 selling car models

SELECT TOP 5 Model,
       SUM(Quantity_Sold) AS UnitsSold
FROM BMW_Clean_Data
GROUP BY Model
ORDER BY UnitsSold DESC;

--Which region sold the most units

SELECT  Region,
       SUM(Quantity_Sold) AS TotalUnits
FROM BMW_Clean_Data
GROUP BY Region
ORDER BY TotalUnits DESC;
