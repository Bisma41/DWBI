SELECT 
    p.ProductName,
    t.Month,
    t.Year,
    SUM(s.Amount) AS MonthlySales,
    LAG(SUM(s.Amount), 1) OVER (PARTITION BY p.ProductKey ORDER BY t.Year, t.Month) AS PreviousMonthSales,
    (SUM(s.Amount) - LAG(SUM(s.Amount), 1) OVER (PARTITION BY p.ProductKey ORDER BY t.Year, t.Month)) / NULLIF(LAG(SUM(s.Amount), 1) OVER (PARTITION BY p.ProductKey ORDER BY t.Year, t.Month), 0) * 100 AS SalesGrowthPercentage
FROM Sales s
JOIN Product p ON s.ProductKey = p.ProductKey
JOIN Time t ON s.TimeKey = t.TimeKey
GROUP BY p.ProductKey, p.ProductName, t.Year, t.Month
ORDER BY p.ProductName, t.Year, t.Month;
