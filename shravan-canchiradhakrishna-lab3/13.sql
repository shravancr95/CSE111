select avg(c_acctbal) 
from customer_noindex, region, nation 
where c_nationkey = n_nationkey and r_regionkey = n_regionkey and r_name = 'AFRICA' and c_mktsegment = 'MACHINERY';

--customer_index: .007s customer_noindex: .002s