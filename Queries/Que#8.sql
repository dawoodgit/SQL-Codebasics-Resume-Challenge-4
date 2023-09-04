-- 8. In which quarter of 2020, got the maximum total_sold_quantity? The final
-- output contains these fields sorted by the total_sold_quantity,
-- Quarter
-- total_sold_quantity


SELECT QUARTER(DATE_SUB(date, INTERVAL 8 MONTH)) AS Quarter,
       CONCAT(round(SUM(sold_quantity) / 1000000, 2), ' Million') AS total_sold_quantity
FROM gdb023.fact_sales_monthly
WHERE fiscal_year = 2020
GROUP BY Quarter
ORDER BY total_sold_quantity DESC;