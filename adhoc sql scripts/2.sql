SELECT 
    unique_products_2020,
    unique_products_2021,
    round(((sold_quantity_2021 - sold_quantity_2020) / sold_quantity_2020),3) * 100 AS percentage_chg
FROM
    (SELECT 
        product_code AS unique_products_2020,
            SUM(sold_quantity) AS sold_quantity_2020
    FROM
        gdb023.fact_sales_monthly
    WHERE
        fiscal_year = '2020'
    GROUP BY product_code) a
        INNER JOIN
    (SELECT 
        product_code AS unique_products_2021,
            SUM(sold_quantity) AS sold_quantity_2021
    FROM
        gdb023.fact_sales_monthly
    WHERE
        fiscal_year = '2021'
    GROUP BY product_code) b ON a.unique_products_2020 = b.unique_products_2021
;