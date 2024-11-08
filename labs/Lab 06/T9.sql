SELECT 
    pc.CategoryName,
    t.Month,
    t.Year,
    SUM(s.Amount) AS MonthlySales,
    AVG(SUM(s.Amount)) OVER (PARTITION BY pc.CategoryKey ORDER BY t.Year, t.Month ROWS 2 PRECEDING) AS MovingAverage
FROM Sales s
JOIN Product p ON s.ProductKey = p.ProductKey
JOIN ProductCategory pc ON p.CategoryKey = pc.CategoryKey
JOIN Time t ON s.TimeKey = t.TimeKey
GROUP BY pc.CategoryKey, pc.CategoryName, t.Year, t.Month
ORDER BY pc.CategoryName, t.Year, t.Month;
