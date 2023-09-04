-- 6. Generate a report which contains the top 5 customers who received an
-- average high pre_invoice_discount_pct for the fiscal year 2021 and in the
-- Indian market. The final output contains these fields,
-- customer_code
-- customer
-- average_discount_percentage

SELECT c.customer_code , c.customer , 
	   concat(round(pre_invoice_discount_pct*100,2)," %") as average_discount_percentage
FROM gdb023.fact_pre_invoice_deductions pd
join dim_customer c 
	on 
    pd.customer_code = c.customer_code
where fiscal_year = 2021 and market = "India"
order by pre_invoice_discount_pct desc
limit 5;