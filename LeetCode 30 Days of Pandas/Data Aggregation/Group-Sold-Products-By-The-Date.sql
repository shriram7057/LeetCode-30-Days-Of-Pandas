SELECT 
    TO_CHAR(sell_date, 'YYYY-MM-DD') AS sell_date,
    COUNT(product) AS num_sold,
    LISTAGG(product, ',') 
        WITHIN GROUP (ORDER BY product) AS products
FROM (
    SELECT DISTINCT sell_date, product
    FROM Activities
)
GROUP BY TO_CHAR(sell_date, 'YYYY-MM-DD')
ORDER BY sell_date;