SELECT 
    o.CustomerID, 
    YEAR(o.OrderDate) AS Year, 
    MONTH(o.OrderDate) AS Month, 
    SUM(od.Quantity * od.UnitPrice) AS Sales
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
WHERE o.OrderDate BETWEEN '1996-01-01' AND '1997-12-31'
GROUP BY o.CustomerID, YEAR(o.OrderDate), MONTH(o.OrderDate)
ORDER BY Year, Month;
