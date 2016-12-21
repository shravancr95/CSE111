SELECT count(*) from (SELECT distinct c_custkey as 'customer',n_name as 'custnation', o_orderkey as 'custorderkey' from (SELECT o_orderkey as 'supporderkey', s_suppkey as 'customer', r_name as 'region' from supplier, region, nation, orders, lineitem where s_suppkey = l_suppkey and o_orderkey = l_orderkey and s_nationkey = n_nationkey and n_regionkey = r_regionkey and r_name = 'EUROPE'),customer, nation, orders where c_nationkey = n_nationkey and n_name = 'BRAZIL' and c_custkey = o_custkey and o_orderkey = supporderkey);


SELECT count(*) from (SELECT distinct c_custkey as 'customer',n_name as 'custnation', o_orderkey as 'custorderkey' from (SELECT o_orderkey as 'supporderkey', s_suppkey as 'customer', r_name as 'region' from Q2, Q5, lineitem where s_suppkey = l_suppkey and o_orderkey = l_orderkey and r_name = 'EUROPE'),Q1, Q5 where n_name = 'BRAZIL' and c_custkey = o_custkey and o_orderkey = supporderkey);