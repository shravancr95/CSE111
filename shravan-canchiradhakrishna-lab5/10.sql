--10. How many customers from each country have never placed an order and have less than the average account balance?
select count(*),n_name from customer,nation where c_nationkey = n_nationkey and not c_custkey in (select o_custkey from orders) and c_acctbal < (select avg(c_acctbal) from customer) group by n_nationkey order by n_name;
