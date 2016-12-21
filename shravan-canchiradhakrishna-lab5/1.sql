SELECT count(c_custkey)
FROM customer NATURAL JOIN nation NATURAL JOIN region
WHERE n_regionkey = r_regionkey and n_nationkey = c_nationkey and r_name <> 'AFRICA' and r_name <> 'EUROPE';