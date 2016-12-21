--4. How many items with size below 50 does each supplier from CHINA have?
SELECT COUNT(ps_suppkey), s_name FROM part, supplier, nation, partsupp WHERE s_suppkey = ps_suppkey AND p_partkey = ps_partkey AND s_nationkey = n_nationkey AND n_name = 'CHINA' AND p_size < 50 group by s_name; 