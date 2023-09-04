#3. Provide a report with all the unique product counts for each segment and
#sort them in descending order of product counts. The final output contains 2 fields,
#segment
#product_count

Select segment, 
	   count(distinct p.product_code) as product_count
from
	gdb023.fact_sales_monthly f
	left join gdb023.dim_product p
	on
    f.product_code = p.product_code
group by segment
order by product_count desc;