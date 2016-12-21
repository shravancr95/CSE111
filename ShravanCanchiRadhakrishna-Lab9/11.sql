select r_name,s_name from supplier,nation,region,(select r_name as m_name,max(s_acctbal) as m_acctbal from supplier,nation,region on (s_nationkey = n_nationkey and n_regionkey = r_regionkey) group by r_name) on (s_nationkey = n_nationkey and n_regionkey = r_regionkey and r_name = m_name and s_acctbal = m_acctbal) order by s_name;

--REWROTE TO MAKE SIMPLER
--select r, s from (select r_name as r, s_name as s, max(s_acctbal) 
--from region, supplier, nation 
--where s_nationkey = n_nationkey and n_regionkey = r_regionkey 
--group by r_name order by s_name);
--USING Q2
select r, s from (select r_name as r, s_name as s, max(s_acctbal) 
from Q2
group by r_name order by s_name);