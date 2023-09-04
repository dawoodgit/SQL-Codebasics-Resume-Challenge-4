-- 9. Which channel helped to bring more gross sales in the fiscal year 2021
-- and the percentage of contribution? The final output contains these fields,
-- channel
-- gross_sales_mln
-- percentage

with cte_1 as (select channel ,
	   round(sum(f.sold_quantity*g.gross_price)/1000000,2) as gross_sales_mln
from gdb023.fact_sales_monthly f
join gdb023.dim_customer c 
on f.customer_code = c.customer_code
join gdb023.fact_gross_price g 
on f.product_code = g.product_code
    and f.fiscal_year = g.fiscal_year
where f.fiscal_year = 2021
group by channel)
select *,
	concat(round(((gross_sales_mln/sum(gross_sales_mln) over())*100),2), "%") as percentage
from cte_1 order by percentage desc;