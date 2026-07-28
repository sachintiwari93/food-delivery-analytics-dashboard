CREATE DATABASE food_delivery_analytics;
USE food_delivery_analytics;
SHOW DATABASES;
SELECT DATABASE();
SELECT * FROM food_orders
LIMIT 10;
DESCRIBE food_orders;

-- ===== Project analysis start here ======
-- Total Orders
SELECT COUNT(*) as Total_Orders
FROM Food_orders;

-- Total Cities
SELECT DISTINCT City AS Total_Cities
FROM Food_orders;

-- Total Restaurants
SELECT COUNT(DISTINCT `Restaurant name`) AS Total_Restaurants
FROM food_orders;

-- ORDER STATUS ANALYSIS
SELECT `Order Status`,COUNT(*) AS Total 
FROM food_orders
GROUP BY `Order Status`;

-- Order By Cities
SELECT City, COUNT(*) AS Total_Orders
from food_orders
group by City
ORDER BY Total_Orders DESC;

-- TOP 10 RESTAURANTS
SELECT `Restaurant name`,COUNT(*) AS Orders
from food_orders
group by `Restaurant name`
order by Orders DESC
LIMIT 10;

-- Delivery Analysis
SELECT Delivery,COUNT(*) AS Orders
FROM food_orders
group by Delivery
order by Orders desc;

-- Top Subzones by Orders
SELECT Subzone,COUNT(*) AS Total_Orders
FROM food_orders
GROUP BY Subzone
ORDER BY Total_Orders DESC;

-- TOP 10 Subzone
SELECT Subzone,COUNT(*) AS Total_Orders
FROM food_orders
GROUP BY Subzone
ORDER BY Total_Orders desc
LIMIT 10;

-- City + Restaurant Analysis
SELECT City,`Restaurant name`,count(*) as Orders
From food_orders
group by City,`Restaurant name`
order by Orders desc;

-- Order status
SELECT `Order Status`,count(*) as Total
FROM food_orders
Group by `Order Status`
Order by Total desc;

SELECT Distance from food_orders
LIMIT 20;

-- Distance Distribution
SELECT Distance,COUNT(*) AS Total_Orders
FROM food_orders
GROUP BY Distance
ORDER BY Total_Orders DESC;

-- TOP 5 DISTANCE
SELECT Distance,COUNT(*) AS Total_Orders
FROM food_orders
GROUP BY Distance
ORDER BY Total_Orders DESC
LIMIT 5;

-- ITEMS IN ORDER
SELECT `Items in Order` from food_orders
LIMIT 20;

-- WHICH ITEM COMBINATION WAS ORDERED THE MOST
SELECT `Items in Order`,COUNT(*) AS Total_Orders
from food_orders
GROUP BY `Items in Order`
ORDER BY Total_Orders DESC
LIMIT 10;

-- AVERAGE ITEMS PER ORDER
SELECT AVG(LENGTH(`Items in Order`)-LENGTH(REPLACE(`Items in Order`,',',''))+1) as Avg_Items
from food_orders;

-- Top 10 busiest order times
SELECT HOUR(`Order Placed At`) AS Hour,COUNT(*) AS Orders
from food_orders
group by Hour
ORDER BY Orders DESC;

-- PEAK DAY ANALYSIS
SELECT DAYNAME(STR_TO_DATE(`Order Placed At`,'%h:%i %p, %M %d %Y')) as Day_Name,COUNT(*) AS Orders
FROM food_orders
GROUP BY Day_Name
ORDER BY Orders DESC;

-- MONTHLY ORDER
SELECT MONTHNAME(STR_TO_DATE(`Order Placed At`,'%h:%i %p, %M %d %Y')) AS Month_Name,COUNT(*) AS Orders
FROM food_orders
GROUP BY Month_Name;

-- PEAK HOUR + MONTH
SELECT MONTHNAME(STR_TO_DATE(`Order Placed At`, '%h:%i %p, %M %d %Y')) AS Month_Name,
HOUR(STR_TO_DATE(`Order Placed At`, '%h:%i %p, %M %d %Y')) AS Hour,
COUNT(*) AS Orders
FROM food_orders
GROUP BY Month_Name, Hour
ORDER BY Orders DESC;

-- AVERAGE ORDERS PER RESTAURANT
SELECT ROUND(COUNT(*)/COUNT(DISTINCT `Restaurant name`),2) as Avg_Order_Per_Restaurant
FROM food_orders;

-- Delivery Success Rate
SELECT MONTHNAME(STR_TO_DATE(`Order Placed At`, '%h:%i %p, %M %d %Y')) AS Month_Name,
HOUR(STR_TO_DATE(`Order Placed At`, '%h:%i %p, %M %d %Y')) AS Hour,
COUNT(*) AS Orders
FROM food_orders
GROUP BY Month_Name, Hour
ORDER BY Orders DESC;
