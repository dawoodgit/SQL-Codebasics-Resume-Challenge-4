-- 5. Get the products that have the highest and lowest manufacturing costs.
-- The final output should contain these fields,
-- product_code
-- product
-- manufacturing_cost

with cte_1 as (SELECT f.product_code , p.product , m.manufacturing_cost 
FROM gdb023.fact_sales_monthly f       
left join gdb023.fact_manufacturing_cost m
	on f.product_code = m.product_code
left join gdb023.dim_product p
	on f.product_code = p.product_code
order by manufacturing_cost desc limit 1),
cte_2 as (SELECT f.product_code , p.product , m.manufacturing_cost 
FROM gdb023.fact_sales_monthly f       
left join gdb023.fact_manufacturing_cost m
	on f.product_code = m.product_code
left join gdb023.dim_product p
	on f.product_code = p.product_code
order by manufacturing_cost asc limit 1)
select "Highest mfg cost" as filter_type, product_code , product , manufacturing_cost from cte_1
union
select  "Lowest mfg cost" as filter_type, product_code , product , manufacturing_cost  from cte_2;
