create view Q151 as 
select * 
from customer
where c_acctbal >= 0;

create view Q152 as 
select * 
from supplier
where s_acctbal >= 0;

SELECT count(*) from (SELECT distinct o_orderkey from customer, orders, lineitem, supplier where c_custkey = o_custkey and l_suppkey = s_suppkey and o_orderkey = l_orderkey and s_acctbal >= 0 and c_acctbal>=0);

SELECT count(*) from (SELECT distinct o_orderkey from Q152, Q151, orders, lineitem where c_custkey = o_custkey and l_suppkey = s_suppkey and o_orderkey = l_orderkey);