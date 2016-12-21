select cast(success_orders as real)/total_orders as fraction, r_name from 
(select count(o_orderkey) total_orders, r_name
from region, orders_noindex,customer_noindex,nation
where o_custkey = c_custkey and c_nationkey = n_nationkey and r_regionkey = n_regionkey
group by r_name) as T1,(select count(o_orderkey) success_orders, r_name
from region, orders_noindex,customer_noindex,nation
where o_custkey = c_custkey and c_nationkey = n_nationkey and r_regionkey = n_regionkey and o_orderstatus = 'F'
group by r_name ) as T2
where T1.r_name=T2.r_name order by fraction desc;

--orders_index, customer_index: .077s orders_noindex, customer_noindex: .162s