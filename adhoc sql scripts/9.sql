set @total = (SELECT 
    sum(gross_price*sold_quantity) as gross_sales_mln
FROM
    fact_sales_monthly a
        JOIN
    dim_customer b ON a.customer_code = b.customer_code
        JOIN
    fact_gross_price c ON c.product_code = a.product_code
    where a.fiscal_year=2021);
SELECT 
    channel,
    SUM(gross_price * sold_quantity) AS gross_sales_mln,
    ((SUM(gross_price * sold_quantity) / @total) * 100) percentage
FROM
    fact_sales_monthly a
        JOIN
    dim_customer b ON a.customer_code = b.customer_code
        JOIN
    fact_gross_price c ON c.product_code = a.product_code
WHERE
    a.fiscal_year = 2021
GROUP BY channel
ORDER BY percentage DESC;
    
