--drop view Q5;
create view Q5 as 
select o_orderkey, o_custkey, o_orderstatus, o_totalprice, o_orderpriority, o_clerk, o_shippriority, o_comment, strftime('%Y', o_orderdate) as o_orderyear
from orders;

select count(distinct p_partkey), p_mfgr, o_orderpriority from   region, nation, supplier, lineitem, orders, part where  r_regionkey = n_regionkey AND n_nationkey = s_nationkey AND s_suppkey = l_suppkey AND l_partkey = p_partkey AND l_orderkey = o_orderkey AND r_name = 'AMERICA' group by  p_mfgr,o_orderpriority;


select count(distinct p_partkey), p_mfgr, o_orderpriority from   region, nation, supplier, lineitem, part, Q5 
where  r_regionkey = n_regionkey AND n_nationkey = s_nationkey AND s_suppkey = l_suppkey AND l_partkey = p_partkey AND l_orderkey = o_orderkey AND r_name = 'AMERICA' 
group by  p_mfgr, o_orderpriority;
