-- 3. How many orders are posted by customers in ASIA?
SELECT COUNT(o_custkey) FROM orders, customer, nation, region WHERE c_nationkey == n_nationkey AND o_custkey = c_custkey AND n_regionkey == r_regionkey AND r_name == 'ASIA';