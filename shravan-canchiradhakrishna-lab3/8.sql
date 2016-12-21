select s_name from supplier_noindex, nation, region where s_nationkey = n_nationkey and n_regionkey = r_regionkey and r_name = 'ASIA' and s_acctbal < 10000 order by s_name asc;

--supplier_index:.004s supplier_noindex: .1 s