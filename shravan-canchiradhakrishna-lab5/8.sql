--8. Count the number of suppliers that supply items with type SMALL BURNISHED and size diﬀerent than 3, 13, 26, 36, and 49.

select count(*) from (select distinct s_suppkey from part, partsupp, supplier where p_type like '%SMALL BURNISHED%' and p_partkey = ps_partkey and ps_suppkey = s_suppkey and p_size <> 3 and p_size <> 13 and p_size <> 26 and p_size <> 36 and p_size <> 49);