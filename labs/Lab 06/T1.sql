SELECT 
    c.State,
    t.Month,
    t.Year,
    SUM(s.Amount) AS MonthlySales,
    LAG(SUM(s.Amount), 1) OVER (PARTITION BY c.State, t.Month ORDER BY t.Year) AS PreviousYearSales
FROM Sales s
JOIN Customer c ON s.CustomerKey = c.CustomerKey
JOIN Time t ON s.TimeKey = t.TimeKey
GROUP BY c.State, t.Month, t.Year
ORDER BY c.State, t.Year, t.Month;
