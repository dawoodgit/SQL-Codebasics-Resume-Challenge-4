#2. What is the percentage of unique product increase in 2021 vs. 2020? The
#final output contains these fields,
#unique_products_2020
#unique_products_2021
#percentage_chg

#counting on product_code
With cte_1 as (SELECT
    COUNT(DISTINCT CASE WHEN fiscal_year = 2020 THEN product_code END) AS unique_products_2020,
    COUNT(DISTINCT CASE WHEN fiscal_year = 2021 THEN product_code END) AS unique_products_2021 
    from gdb023.fact_sales_monthly)
select unique_products_2020 ,
	   unique_products_2021,
       round(100*(unique_products_2021 - unique_products_2020)/unique_products_2020,1) as percentage_chg
       from cte_1;
       
	