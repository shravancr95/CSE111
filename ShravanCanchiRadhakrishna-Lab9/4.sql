create view Q2 as
select s_name, n_name, r_name 
from region, supplier, nation
where s_nationkey = n_nationkey and r_regionkey = n_regionkey;

SELECT COUNT(ps_suppkey), s_name FROM part, supplier, nation, partsupp WHERE s_suppkey = ps_suppkey AND p_partkey = ps_partkey AND s_nationkey = n_nationkey AND n_name = 'CHINA' AND p_size < 50 group by s_name; 

SELECT ps, Q2.s_name 
from (SELECT count(ps_suppkey) as ps, s_name as s FROM part, supplier, nation, partsupp WHERE s_suppkey = ps_suppkey AND p_partkey = ps_partkey AND s_nationkey = n_nationkey AND n_name = 'CHINA' AND p_size < 50 group by s_name) as T1, Q2 
where T1.s = Q2.s_name;