SELECT TOP 3 
    e.EmployeeName,
    SUM(s.Amount) AS TotalSales
FROM Sales s
JOIN Employee e ON s.EmployeeKey = e.EmployeeKey
GROUP BY e.EmployeeName
ORDER BY TotalSales DESC;
