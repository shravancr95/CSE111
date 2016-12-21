select count(*)
from orders_noindex, customer_noindex, nation
where o_orderpriority = '1-URGENT' and o_orderdate >= '1994-01-01' and o_orderdate <= '1996-12-31' and o_custkey = c_custkey and c_nationkey = n_nationkey and n_name = 'FRANCE';

--orders_index, customer_index: .044s orders_noindex, customer_noindex: 