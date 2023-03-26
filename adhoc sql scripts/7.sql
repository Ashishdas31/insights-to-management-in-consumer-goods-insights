SELECT 
    MONTHNAME(date) AS Month,
    a.fiscal_year AS Year,
    round(sum(gross_price * sold_quantity),1) AS Gross_sales_Amount
FROM
    fact_sales_monthly a
        JOIN
    dim_customer b ON a.customer_code = b.customer_code
        JOIN
    fact_gross_price c ON c.product_code = a.product_code
WHERE
    customer = 'Atliq Exclusive'
GROUP BY Month , Year
