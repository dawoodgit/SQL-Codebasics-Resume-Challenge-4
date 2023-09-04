-- 10. Get the Top 3 products in each division that have a high
-- total_sold_quantity in the fiscal_year 2021? The final output contains these fields,
-- division
-- product_code
-- product
-- total_sold_quantity
-- rank_order

with cte1 as (select division , p.product_code , product,
	round((sum(sold_quantity))/1000,2) as total_sold_quantity,
	dense_rank() over(partition by division order by sum(sold_quantity) desc) as Division_Rank
	from gdb023.fact_sales_monthly f 
    left join gdb023.dim_product p 
    on
    f.product_code = p.product_code
    where fiscal_year = 2021
    group by division, f.product_code, product)
select *
from cte1
where Division_Rank <= 3;