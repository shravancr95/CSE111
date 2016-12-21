select n_name, min(s_acctbal), max(s_acctbal), avg(s_acctbal) from nation, supplier where n_nationkey = s_nationkey group by n_name;


select n_name, min(s_acctbal), max(s_acctbal), avg(s_acctbal) 
from Q2
group by n_name;