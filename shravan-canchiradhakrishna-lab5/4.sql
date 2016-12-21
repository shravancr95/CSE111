--4. How many customers and suppliers are in each country from EUROPE?
--collect all customers
select distinct all_customers, all_suppliers, cust_nation from 
(select count (c_custkey) as all_customers, n_name as cust_nation, r_name, c_custkey from customer, nation, region where  r_regionkey = n_regionkey and r_name = 'EUROPE' and c_nationkey = n_nationkey group by n_name), 
(select count(s_suppkey) as all_suppliers, n_name as supp_nation, r_name from supplier, nation, region where  r_regionkey = n_regionkey and r_name = 'EUROPE' and s_nationkey = n_nationkey group by n_name), nation where cust_nation = supp_nation;
