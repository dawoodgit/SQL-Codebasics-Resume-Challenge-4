-- 7. Get the complete report of the Gross sales amount for the customer “Atliq
-- Exclusive” for each month. This analysis helps to get an idea of low and
-- high-performing months and take strategic decisions.
-- The final report contains these columns:
-- Month
-- Year
-- Gross sales Amount


select
		monthname(date) as Month, f.fiscal_year as Year,
        concat(round(sum(sold_quantity*gross_price)/1000000,2)," Million") as Gross_sales_Amount
from gdb023.fact_sales_monthly f
left join gdb023.dim_customer c
on 
	f.customer_code = c.customer_code
left join gdb023.fact_gross_price g
on
	f.product_code = g.product_code
    and f.fiscal_year = g.fiscal_year
where customer = "Atliq Exclusive"
group by monthname(date) , f.fiscal_year;