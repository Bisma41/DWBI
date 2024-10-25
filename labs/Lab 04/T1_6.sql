SELECT 
    e.EmployeeID, 
    e.FirstName, 
    e.LastName, 
    YEAR(o.OrderDate) AS Year, 
    MONTH(o.OrderDate) AS Month, 
    SUM(od.Quantity * od.UnitPrice) AS TotalSales, 
    AVG(od.Quantity * od.UnitPrice) AS AverageSales
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Employees e ON o.EmployeeID = e.EmployeeID
GROUP BY e.EmployeeID, e.FirstName, e.LastName, YEAR(o.OrderDate), MONTH(o.OrderDate)
ORDER BY Year, Month;
