-- ============================================================
-- COMPANY INSIGHTS 360°
-- SQL BUSINESS ANALYSIS
-- Database: SQLite
-- ============================================================


-- 1. OVERALL COMPANY PERFORMANCE
SELECT
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    COUNT(DISTINCT OrderID) AS Total_Orders,
    COUNT(DISTINCT CustomerName) AS Total_Customers,
    ROUND(AVG(Discount) * 100, 2) AS Average_Discount_Percent
FROM sales;


-- 2. SALES AND PROFIT BY REGION
SELECT
    Region,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM sales
GROUP BY Region
ORDER BY Total_Sales DESC;


-- 3. SALES AND PROFIT BY CATEGORY
SELECT
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(AVG(Discount) * 100, 2) AS Average_Discount_Percent
FROM sales
GROUP BY Category
ORDER BY Total_Sales DESC;


-- 4. EMPLOYEE PERFORMANCE
SELECT
    e.EmployeeID,
    e.Name,
    e.Department,
    e.Role,
    SUM(s.Sales) AS Total_Sales,
    SUM(s.Profit) AS Total_Profit,
    COUNT(DISTINCT s.OrderID) AS Total_Orders
FROM employees e
JOIN sales s
    ON e.EmployeeID = s.EmployeeID
GROUP BY
    e.EmployeeID,
    e.Name,
    e.Department,
    e.Role
ORDER BY Total_Sales DESC;


-- 5. YEAR-WISE SALES AND PROFIT
SELECT
    substr(Date, 1, 4) AS Year,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM sales
GROUP BY Year
ORDER BY Year;


-- 6. DISCOUNT VS PROFIT
SELECT
    CASE
        WHEN Discount <= 0.05 THEN '0 to 5'
        WHEN Discount <= 0.10 THEN '5 to 10'
        WHEN Discount <= 0.15 THEN '10 to 15'
        ELSE 'Above 15'
    END AS Discount_Range,
    COUNT(*) AS Number_of_Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(AVG(Profit), 2) AS Average_Profit
FROM sales
GROUP BY Discount_Range
ORDER BY Discount_Range;


-- 7. PROFIT MARGIN BY REGION
SELECT
    Region,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(
        (SUM(Profit) * 100.0) / SUM(Sales),
        2
    ) AS Profit_Margin_Percent
FROM sales
GROUP BY Region
ORDER BY Profit_Margin_Percent DESC;


-- 8. DEPARTMENT-WISE EMPLOYEE PERFORMANCE
SELECT
    d.Department,
    d.Manager,
    d.Budget,
    d.Headcount,
    COUNT(e.EmployeeID) AS Employee_Count,
    ROUND(AVG(e.Salary), 2) AS Average_Salary,
    ROUND(AVG(e.PerformanceScore), 2) AS Average_Performance
FROM departments d
LEFT JOIN employees e
    ON d.Department = e.Department
GROUP BY
    d.Department,
    d.Manager,
    d.Budget,
    d.Headcount
ORDER BY Average_Performance DESC;


-- 9. CUSTOMER-WISE SALES AND PROFIT
SELECT
    CustomerName,
    COUNT(DISTINCT OrderID) AS Total_Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(AVG(Discount) * 100, 2) AS Average_Discount_Percent
FROM sales
GROUP BY CustomerName
ORDER BY Total_Sales DESC;


-- 10. CATEGORY PERFORMANCE BY REGION
SELECT
    Region,
    Category,
    COUNT(DISTINCT OrderID) AS Total_Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(
        (SUM(Profit) * 100.0) / SUM(Sales),
        2
    ) AS Profit_Margin_Percent
FROM sales
GROUP BY
    Region,
    Category
ORDER BY
    Region,
    Total_Sales DESC;