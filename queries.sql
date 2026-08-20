
SELECT 
    p.Category,
    p.Sub_Category,
    ROUND(SUM(f.Sales), 2) AS Total_Revenue,
    COUNT(DISTINCT f.Order_ID) AS Total_Orders
FROM FactSales f
JOIN DimProduct p ON f.Product_ID = p.Product_ID
GROUP BY p.Category, p.Sub_Category
ORDER BY Total_Revenue DESC
LIMIT 10;



SELECT 
    c.Customer_Name,
    c.Segment,
    COUNT(DISTINCT f.Order_ID) AS Total_Orders,
    ROUND(SUM(f.Sales), 2) AS Total_Spent
FROM FactSales f
JOIN DimCustomer c ON f.Customer_ID = c.Customer_ID
GROUP BY c.Customer_ID, c.Customer_Name, c.Segment
ORDER BY Total_Spent DESC
LIMIT 5;



SELECT 
    Ship_Mode,
    COUNT(Order_ID) AS Total_Orders,
    ROUND(AVG(Shipping_Days), 1) AS Avg_Shipping_Days
FROM FactSales
GROUP BY Ship_Mode
ORDER BY Avg_Shipping_Days ASC;
