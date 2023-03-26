SELECT 
    a.customer_code,
    customer,
    
    AVG(pre_invoice_discount_pct) AS average_discount_percentage
FROM
    gdb023.fact_pre_invoice_deductions a
        INNER JOIN
    dim_customer b ON a.customer_code = b.customer_code
WHERE
    fiscal_year = 2021 AND market = 'india'
GROUP BY customer_code , customer
ORDER BY average_discount_percentage DESC
LIMIT 5;