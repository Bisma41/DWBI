SELECT 
    p.ProductName, 
    e.EmployeeID, 
    e.FirstName, 
    e.LastName, 
    SUM(od.Quantity * od.UnitPrice) AS Sales
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
JOIN Employees e ON o.EmployeeID = e.EmployeeID
GROUP BY p.ProductName, e.EmployeeID, e.FirstName, e.LastName
ORDER BY p.ProductName, Sales DESC;
