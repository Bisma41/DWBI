SELECT 
    e.EmployeeID, 
    e.FirstName, 
    e.LastName, 
    ISNULL(SUM(od.Quantity * od.UnitPrice), 0) AS TotalSales
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Employees e ON o.EmployeeID = e.EmployeeID
GROUP BY e.EmployeeID, e.FirstName, e.LastName;
