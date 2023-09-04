#4. Follow-up: Which segment had the most increase in unique products in
#2021 vs 2020? The final output contains these fields,
#segment
#product_count_2020
#product_count_2021
#difference

#using product_code
with cte_1 as (Select segment, 
	   count(distinct case when fiscal_year = 2020 then p.product_code end) as product_count_2020,
       count(distinct case when fiscal_year = 2021 then p.product_code end) as product_count_2021
from
	gdb023.fact_sales_monthly f
	left join gdb023.dim_product p
	on p.product_code = f.product_code
    group by segment)
Select segment,
	product_count_2020,
    product_count_2021,
    (product_count_2021 - product_count_2020) as difference
    from cte_1 
    order by difference desc;