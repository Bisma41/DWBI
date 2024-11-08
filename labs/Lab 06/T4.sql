WITH RankedSales AS (
    SELECT 
        p.ProductName,
        t.Year,
        e.EmployeeName,
        SUM(s.Amount) AS TotalSales,
        RANK() OVER (PARTITION BY p.ProductKey, t.Year ORDER BY SUM(s.Amount) DESC) AS SalesRank
    FROM Sales s
    JOIN Product p ON s.ProductKey = p.ProductKey
    JOIN Employee e ON s.EmployeeKey = e.EmployeeKey
    JOIN Time t ON s.TimeKey = t.TimeKey
    GROUP BY p.ProductKey, p.ProductName, t.Year, e.EmployeeName
)
SELECT 
    ProductName,
    Year,
    EmployeeName,
    TotalSales
FROM RankedSales
WHERE SalesRank = 1
ORDER BY ProductName, Year;
