SELECT 
    c.CategoryName, 
    YEAR(o.OrderDate) AS Year, 
    MONTH(o.OrderDate) AS Month, 
    SUM(od.Quantity * od.UnitPrice) AS MonthlySales, 
    SUM(SUM(od.Quantity * od.UnitPrice)) OVER (PARTITION BY c.CategoryID ORDER BY YEAR(o.OrderDate), MONTH(o.OrderDate)) AS YearToDateSales
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
JOIN Categories c ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryName, c.CategoryID, YEAR(o.OrderDate), MONTH(o.OrderDate)
ORDER BY Year, Month;
