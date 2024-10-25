SELECT TOP 10
    e.EmployeeID, 
    e.FirstName, 
    e.LastName, 
    SUM(od.Quantity * od.UnitPrice) AS TotalSales
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Employees e ON o.EmployeeID = e.EmployeeID
GROUP BY e.EmployeeID, e.FirstName, e.LastName
ORDER BY TotalSales DESC;
