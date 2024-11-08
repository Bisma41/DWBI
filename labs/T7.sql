SELECT 
    p.ProductName,
    t.Month,
    t.Year,
    SUM(s.Amount) AS TotalSalesAmount,
    SUM(s.Discount) AS TotalDiscountAmount
FROM Sales s
JOIN Product p ON s.ProductKey = p.ProductKey
JOIN Time t ON s.TimeKey = t.TimeKey
GROUP BY p.ProductName, t.Month, t.Year
ORDER BY p.ProductName, t.Year, t.Month;
