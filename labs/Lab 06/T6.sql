SELECT 
    e.EmployeeName,
    t.Year,
    SUM(s.Amount) AS TotalSales,
    AVG(SUM(s.Amount)) OVER (PARTITION BY e.EmployeeKey, t.Year) AS AverageMonthlySales
FROM Sales s
JOIN Employee e ON s.EmployeeKey = e.EmployeeKey
JOIN Time t ON s.TimeKey = t.TimeKey
GROUP BY e.EmployeeName, e.EmployeeKey, t.Year
ORDER BY e.EmployeeName, t.Year;
