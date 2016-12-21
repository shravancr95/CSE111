--7. How many orders do customers in each country in EUROPE have in each status?
select n_name,o_orderstatus,count(*) from orders, nation, customer, region WHERE o_custkey = c_custkey and c_nationkey = n_nationkey and n_regionkey = r_regionkey and r_name = 'EUROPE' group by n_name,o_orderstatus order by n_name,o_orderstatus;
