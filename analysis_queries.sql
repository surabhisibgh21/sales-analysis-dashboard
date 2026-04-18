CREATE TABLE orders (
    Order_Date DATE,
    Category VARCHAR(50),
    Sales FLOAT,
    Profit FLOAT,
    Region VARCHAR(50),
    Product_Name VARCHAR(255)
);

SELECT SUM(Sales) AS total_sales
FROM orders;

SELECT Category, SUM(Sales) AS revenue
FROM orders
GROUP BY Category
ORDER BY revenue DESC;

SELECT YEAR(Order_Date) AS year,
       MONTH(Order_Date) AS month,
       SUM(Sales) AS total_sales
FROM orders
GROUP BY year, month
ORDER BY year, month;

SELECT Product_Name, SUM(Sales) AS revenue
FROM orders
GROUP BY Product_Name
ORDER BY revenue DESC
LIMIT 5;

SELECT Region, SUM(Sales) AS revenue
FROM orders
GROUP BY Region;

SELECT Product_Name,
       SUM(Sales) AS revenue,
       RANK() OVER (ORDER BY SUM(Sales) DESC) AS rank
FROM orders
GROUP BY Product_Name;