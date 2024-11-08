WITH EmployeeSales AS (
    SELECT 
        e.EmployeeKey,
        e.EmployeeName,
        SUM(s.Amount) AS PersonalSales
    FROM Sales s
    JOIN Employee e ON s.EmployeeKey = e.EmployeeKey
    JOIN Time t ON s.TimeKey = t.TimeKey
    WHERE t.Year = 1997
    GROUP BY e.EmployeeKey, e.EmployeeName
), TotalSalesIncludingSubordinates AS (
    SELECT 
        e1.EmployeeKey AS ManagerKey,
        e1.EmployeeName AS ManagerName,
        ISNULL(SUM(s.Amount), 0) + ISNULL(SUM(s2.Amount), 0) AS TotalSalesWithSubordinates
    FROM Employee e1
    LEFT JOIN Sales s ON e1.EmployeeKey = s.EmployeeKey
    LEFT JOIN Employee e2 ON e2.ManagerKey = e1.EmployeeKey
    LEFT JOIN Sales s2 ON e2.EmployeeKey = s2.EmployeeKey
    JOIN Time t ON (s.TimeKey = t.TimeKey OR s2.TimeKey = t.TimeKey)
    WHERE t.Year = 1997
    GROUP BY e1.EmployeeKey, e1.EmployeeName
)
SELECT 
    es.EmployeeName,
    es.PersonalSales,
    ts.TotalSalesWithSubordinates
FROM EmployeeSales es
JOIN TotalSalesIncludingSubordinates ts ON es.EmployeeKey = ts.ManagerKey
ORDER BY es.EmployeeName;
