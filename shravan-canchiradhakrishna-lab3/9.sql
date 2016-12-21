select * from 
(select count(*) as num_supp, n_name, min(s_acctbal) from supplier_noindex, nation where s_nationkey = n_nationkey group by n_name) where num_supp < 5;

--supplier_index: .007s supplier_noindex: .005s