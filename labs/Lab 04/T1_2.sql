SELECT 
    p.ProductID,  -- Add ProductID to the SELECT
    p.ProductName, 
    YEAR(o.OrderDate) AS Year, 
    MONTH(o.OrderDate) AS Month, 
    SUM(od.Quantity * od.UnitPrice) AS TotalSales
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName, YEAR(o.OrderDate), MONTH(o.OrderDate)  -- Include ProductID in the GROUP BY clause
ORDER BY Year, Month;
