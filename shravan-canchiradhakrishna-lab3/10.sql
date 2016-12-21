select sum(o_totalprice) 
from orders_noindex, nation, customer_noindex, region
where o_custkey = c_custkey and c_nationkey = n_nationkey and r_regionkey = n_regionkey and r_name = 'EUROPE' and o_orderdate >= '1996-01-01' and o_orderdate <= '1996-12-31';

--orders_index, customer_index: .307s orders_noindex, customer_noindex: .061s