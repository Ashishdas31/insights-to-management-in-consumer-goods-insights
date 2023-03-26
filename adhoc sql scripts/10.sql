select * from (SELECT 
    division, a.product_code, product, SUM(sold_quantity) as sum,
    RANK() OVER (PARTITION BY division ORDER BY SUM(sold_quantity) DESC) as ranked
FROM
    fact_sales_monthly a
        JOIN
    dim_product b ON a.product_code = b.product_code
WHERE
    fiscal_year = 2021 
    
GROUP BY product , division , a.product_code
ORDER BY division,sum DESC
) as data
where ranked <=3