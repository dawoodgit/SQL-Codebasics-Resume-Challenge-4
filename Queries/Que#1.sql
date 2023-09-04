# 1. Provide the list of markets in which customer "Atliq Exclusive" operates its
# business in the APAC region

    
Select distinct(market) as Markets
FROM gdb023.fact_sales_monthly f 
Left Join gdb023.dim_customer c 
using (customer_code)
where customer = "Atliq Exclusive" and region = "APAC"
order by Markets;





# !!!!!!!!!!!!!!!!!!!!!!!!! using dim table only
SELECT
	distinct(market) as Markets
    FROM gdb023.dim_customer
    where customer = "Atliq Exclusive" and region = "APAC"
    order by Markets;