SELECT 
    product_code, product, manufacturing_cost
FROM
    (SELECT 
        a.product_code, product, manufacturing_cost
    FROM
        fact_manufacturing_cost a
    INNER JOIN dim_product b ON a.product_code = b.product_code
    WHERE
        manufacturing_cost = (SELECT 
                MAX(manufacturing_cost)
            FROM
                fact_manufacturing_cost)
            OR manufacturing_cost = (SELECT 
                MIN(manufacturing_cost)
            FROM
                fact_manufacturing_cost)) a
    
    
    

