select count(*),r_name from (select distinct o_orderkey,r_name from lineitem, orders, region, supplier, nation WHERE l_orderkey = o_orderkey and l_suppkey = s_suppkey and s_nationkey = n_nationkey and n_regionkey = r_regionkey AND l_receiptdate like '1995-%' and o_orderstatus = 'F') group by r_name order by r_name;


select count(*),r_name from (select distinct o_orderkey,r_name from lineitem, Q5,
 Q2, nation WHERE l_orderkey = o_orderkey and l_suppkey = s_suppkey and s_nationkey = n_nationkey and 
l_receiptdate like '1995-%' and o_orderstatus = 'F') group by r_name order by r_name;
