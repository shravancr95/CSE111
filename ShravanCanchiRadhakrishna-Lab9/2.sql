create view Q2 as
select s_name, s_suppkey, s_address, s_nationkey, s_phone, s_acctbal, s_comment, n_name, r_name
from supplier, nation, region
where s_nationkey = n_nationkey and n_regionkey = r_regionkey;

SELECT COUNT(s_nationkey), n_name  FROM supplier, nation WHERE n_nationkey = s_nationkey GROUP BY s_nationkey ORDER BY n_name;

select distinct T1.c,Q2.n_name 
from Q2, (SELECT COUNT(s_nationkey) as c, n_name as n  FROM supplier, nation WHERE n_nationkey = s_nationkey GROUP BY s_nationkey ORDER BY n_name asc ) as T1
where T1.n=Q2.n_name order by Q2.n_name;