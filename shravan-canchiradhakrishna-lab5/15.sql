--15. The market share for a given nation within a given region is deﬁned as the fraction of the revenue, sum of l extendedprice*(1-l discount), from the products in that region that were supplied by suppliers from the given nation. Determine the market share of GERMANY in ASIA in 1995 (l shipdate).

--market share =  l_extendedprice*(1-l discount)
--suppliers are germany while customers are asia
-- we calculated revenue from germany 
--select germany_market_share/asia_market_share as marketshare from (
--select sum(l_extendedprice*(1-l_discount)) as germany_market_share, n_name, l_extendedprice, l_discount, o_orderdate from nation, lineitem, orders, supplier where  l_suppkey = s_suppkey and s_nationkey = n_nationkey and n_name = 'GERMANY' and l_shipdate >= '1995-01-01' and l_shipdate <= '1995-12-31'),

--(select sum(l_extendedprice*(1-l_discount)) as asia_market_share, r_name, l_extendedprice, l_discount, o_orderdate from nation, lineitem, orders, supplier, customer, region where l_orderkey = o_orderkey and c_custkey = o_custkey and s_nationkey = n_nationkey and n_regionkey = r_regionkey and r_name = 'ASIA' and l_shipdate >= '1995-01-01' and l_shipdate <= '1995-12-31');
--select german_sum/sum(l_extendedprice*(1-l_discount)) from (select distinct sum(germany) as 'german_sum' from (

--select distinct l_extendedprice*(1-l_discount) as 'germany', o_orderkey as 'germany_o' from supplier, customer, lineitem, orders, nation where l_suppkey = s_suppkey and s_nationkey = n_nationkey and l_orderkey = o_orderkey and n_name = 'GERMANY' and l_shipdate >= '1995-01-01' and l_shipdate <= '1995-12-31') as t1,

--(select distinct l_extendedprice*(1-l_discount) as 'asia', o_orderkey as 'asia_o' from supplier, customer, lineitem, orders, nation, region where l_suppkey = s_suppkey and s_nationkey = n_nationkey and l_orderkey = o_orderkey and n_regionkey = r_regionkey and r_name = 'ASIA'  and l_shipdate >= '1995-01-01' and l_shipdate <= '1995-12-31') as t2 where t1.germany_o = t2.asia_o), lineitem, supplier, nation, region where l_suppkey = s_suppkey and s_nationkey = n_nationkey and n_regionkey = r_regionkey and r_name = 'ASIA' and l_shipdate >= '1995-01-01' and l_shipdate <= '1995-12-31';

select (select sum(l_extendedprice*(1-l_discount)) from lineitem,orders,customer,nation cn,region cr,supplier,nation sn where l_orderkey = o_orderkey and o_custkey = c_custkey and c_nationkey = cn.n_nationkey and cn.n_regionkey = cr.r_regionkey and cr.r_name = 'ASIA' and l_suppkey = s_suppkey and s_nationkey = sn.n_nationkey and sn.n_name = 'GERMANY' and substr(l_shipdate,1,4) = '1995')/(select sum(l_extendedprice*(1-l_discount)) from lineitem,orders,customer,nation cn,region cr where l_orderkey = o_orderkey and o_custkey = c_custkey and c_nationkey = cn.n_nationkey and cn.n_regionkey = cr.r_regionkey and cr.r_name = 'ASIA' and substr(l_shipdate,1,4) = '1995');