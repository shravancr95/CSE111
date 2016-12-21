select count(*) from 
(select count(c_name) as num_cust, l_discount, c_name 
from lineitem_noindex, customer_noindex, orders_noindex
where l_discount <= 0.05 and l_orderkey = o_orderkey and c_custkey = o_custkey group by c_name);

-- lineitem_index, customer_index, orders_index: .353s lineitem_noindex, customer_noindex, orders_noindex: .228