select  count(o_orderpriority), strftime('%Y', o_orderdate) as orderdate, r_name
from orders_noindex, nation, supplier_noindex, region, lineitem_noindex
where s_suppkey = l_suppkey and l_orderkey = o_orderkey and s_nationkey = n_nationkey and r_regionkey = n_regionkey and o_orderpriority = '1-URGENT' 
group by r_name, orderdate;

--orders_index, supplier_index, lineitem_index: .123s orders_noindex, supplier_noindex, lineitem_noindex: .245s
