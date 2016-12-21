--14. List the total value of a transaction between any two countries in EUROPE. Make sure a pair is printed
--only once.
--All suppliers in europe

--SELECT n_name as 'snation', r_name as 'sregion', s_suppkey, o_totalprice as 'stotprice' from lineitem, nation, region, supplier, orders where r_name = 'EUROPE' and r_regionkey = n_regionkey and s_suppkey = l_suppkey and o_orderkey = l_orderkey;

--all customers in europe
select n_name as 'cnation', r_name as 'cregion', c_custkey, o_totalprice as 'ctotprice' from orders,lineitem, nation, region, customer where r_name = 'EUROPE' and r_regionkey = n_regionkey and c_nationkey = n_nationkey and c_custkey = o_orderkey and l_orderkey = o_orderkey;

select distinct ctotprice, cnation, snation from (select cnation, snation, ctotprice from (select distinct n_name as 'cnation', r_name as 'cregion', c_custkey, o_totalprice as 'ctotprice', o_orderkey as 'corderkey' from orders,lineitem, nation, region, customer where r_name = 'EUROPE' and r_regionkey = n_regionkey and c_nationkey = n_nationkey and c_custkey = o_orderkey and l_orderkey = o_orderkey),(SELECT n_name as 'snation', r_name as 'sregion', s_suppkey, o_totalprice as 'stotprice', o_orderkey as 'sorderkey' from lineitem, nation, region, supplier, orders where r_name = 'EUROPE' and r_regionkey = n_regionkey and s_suppkey = l_suppkey and o_orderkey = l_orderkey) where stotprice = ctotprice and sorderkey = corderkey  ) group by cnation, snation;