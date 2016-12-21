select sum(price),
case when cust_Name < supp_Name then cust_Name else supp_Name end as custo, case when cust_Name < supp_Name then supp_Name else cust_Name end as supply from(
select sum(o_totalprice) as price, custo.n_name as cust_Name, supply.n_name as supp_Name
from (
select 
distinct o_orderkey, o_totalprice,  n_name
from orders, customer, nation, region, lineitem
where o_orderkey = l_orderkey and o_custkey = c_custkey and c_nationkey = n_nationkey and n_regionkey = r_regionkey and r_name = 'EUROPE') as custo,
(select 
l_orderkey, n_name
from lineitem, nation, region, supplier
where s_nationkey = n_nationkey and r_regionkey = n_regionkey and s_suppkey = l_suppkey and r_name = 'EUROPE' ) as supply
where custo.o_orderkey = supply.l_orderkey
group by custo.n_name, supply.n_name)
group by custo, supply;

select sum(price),
case when cust_Name < supp_Name then cust_Name else supp_Name end as custo, case when cust_Name < supp_Name then supp_Name else cust_Name end as supply from(
select sum(o_totalprice) as price, custo.n_name as cust_Name, supply.n_name as supp_Name
from (
select 
distinct o_orderkey, o_totalprice,  n_name
from orders, Q1, lineitem
where o_orderkey = l_orderkey and 
o_custkey = c_custkey and
   r_name = 'EUROPE') as custo
,
(select 
l_orderkey, n_name
from lineitem, Q2
where  
      s_suppkey = l_suppkey and 
      r_name = 'EUROPE' ) as supply
where custo.o_orderkey = supply.l_orderkey
group by custo.n_name, supply.n_name)
group by custo, supply;
