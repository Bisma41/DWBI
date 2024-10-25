SELECT 
    p.ProductName, 
    YEAR(o.OrderDate) AS Year, 
    MONTH(o.OrderDate) AS Month, 
    SUM(od.Quantity * od.UnitPrice) AS TotalSales
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName, YEAR(o.OrderDate), MONTH(o.OrderDate)
ORDER BY Year, Month;
