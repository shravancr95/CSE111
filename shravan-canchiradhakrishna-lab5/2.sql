--avg account balance;
SELECT distinct count(s_acctbal) , r_name
FROM 
--avg account balance per region
(SELECT r_name as suppregion, avg(s_acctbal) as avg_acctbal FROM region ,nation,supplier where s_nationkey = n_nationkey and r_regionkey = n_regionkey group by r_regionkey),region , nation , supplier
WHERE r_name = suppregion and avg_acctbal > s_acctbal and r_regionkey = n_regionkey and s_nationkey=n_nationkey group by r_regionkey;
