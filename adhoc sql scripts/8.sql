SELECT 
    CASE
        WHEN QUARTER(date) = 1 THEN 'Q1'
        WHEN QUARTER(date) = 2 THEN 'Q2'
        WHEN QUARTER(date) = 3 THEN 'Q3'
        WHEN QUARTER(date) = 4 THEN 'Q4'
    END AS quarter_name,
    SUM(sold_quantity) AS total_sold_quantity
FROM
    fact_sales_monthly
WHERE
    fiscal_year = 2020
GROUP BY quarter_name
order by total_sold_quantity desc
limit 1