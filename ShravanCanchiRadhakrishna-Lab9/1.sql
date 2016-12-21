--drop view Q1;
create view Q1 as
select c_name, c_custkey, c_address, c_nationkey, c_phone, c_acctbal, c_mktsegment, c_comment, n_name, r_name
from customer, nation, region
where c_nationkey = n_nationkey and n_regionkey = r_regionkey;

SELECT avg(o_totalprice), c_name FROM (SELECT o_totalprice, c_custkey, o_custkey, c_name FROM orders, customer, nation WHERE n_name = 'BRAZIL' AND orders.o_custkey = customer.c_custkey AND customer.c_nationkey = nation.n_nationkey) GROUP BY o_custkey;

select Q1.c_name, avgPrice from Q1, (SELECT avg(o_totalprice) as avgPrice, c_name FROM (SELECT o_totalprice, c_custkey, o_custkey, c_name FROM orders, customer, nation WHERE n_name = 'BRAZIL' AND orders.o_custkey = customer.c_custkey AND customer.c_nationkey = nation.n_nationkey) GROUP BY o_custkey) as T1 where Q1.c_name = T1.c_name;



--select * from Q1;