WITH CountrySales AS (
    SELECT 
        c.CountryKey,
        cn.CountryName,
        SUM(s.Amount) AS TotalSales
    FROM Sales s
    JOIN Customer c ON s.CustomerKey = c.CustomerKey
    JOIN Country cn ON c.CountryKey = cn.CountryKey
    GROUP BY c.CountryKey, cn.CountryName
), CumulativeSales AS (
    SELECT 
        CountryName,
        TotalSales,
        SUM(TotalSales) OVER (ORDER BY TotalSales DESC) / SUM(TotalSales) OVER () AS CumulativePercentage
    FROM CountrySales
)
SELECT CountryName, TotalSales
FROM CumulativeSales
WHERE CumulativePercentage <= 0.5
ORDER BY TotalSales DESC;
