
create view Q1 as
select c_name, c_custkey, c_address, c_nationkey, c_phone, c_acctbal, c_mktsegment, c_comment, n_name, r_name
from customer, nation, region
where c_nationkey = n_nationkey and n_regionkey = r_regionkey;

SELECT COUNT(o_custkey) FROM orders, customer, nation, region WHERE c_nationkey == n_nationkey AND o_custkey = c_custkey AND n_regionkey == r_regionkey AND r_name == 'ASIA';

SELECT COUNT(o_custkey) as c FROM orders, nation, region, Q1 WHERE o_custkey = c_custkey AND Q1.r_name = 'ASIA';