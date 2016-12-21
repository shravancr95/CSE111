--12. What is the minimum, maximum, and average account balance for the suppliers in each country?
select n_name, min(s_acctbal), max(s_acctbal), avg(s_acctbal) from nation, supplier where n_nationkey = s_nationkey group by n_name
