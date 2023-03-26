SELECT 
    a.segment,
    product_count_2021,
    product_count_2020,
    (product_count_2021 - product_count_2020) AS difference
FROM
    (SELECT 
        segment, SUM(sold_quantity) AS product_count_2020
    FROM
        dim_product a
    INNER JOIN fact_sales_monthly b ON a.product_code = b.product_code
    WHERE
        fiscal_year = 2020
    GROUP BY segment) a
        INNER JOIN
    (SELECT 
        segment, SUM(sold_quantity) AS product_count_2021
    FROM
        dim_product a
    INNER JOIN fact_sales_monthly b ON a.product_code = b.product_code
    WHERE
        fiscal_year = 2021
    GROUP BY segment) b ON a.segment = b.segment