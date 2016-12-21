--drop view Q5;
create view Q5 as 
select o_orderkey, o_custkey, o_orderstatus, o_totalprice, o_orderpriority, o_clerk, o_shippriority, o_comment, strftime('%Y', o_orderdate) as o_orderyear
from orders;

select count(*),c_name from orders join customer on (o_custkey = c_custkey) join nation on (c_nationkey = n_nationkey) where n_name = 'CHINA' and o_orderdate like '1996-%' group by c_custkey order by c_name;


select count(*),c_name from orders join customer on (orders.o_custkey = customer.c_custkey) join nation on (customer.c_nationkey = nation.n_nationkey), (select* from Q5) as T1 where nation.n_name = 'CHINA'  and orders.o_orderkey = T1.o_orderkey and T1.o_orderyear = '1996' group by c_custkey order by c_name;
