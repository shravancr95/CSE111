--3. For the orders made in August 1993 ﬁnd the least discount that is larger than the total average discount among all the orders.

select min(l_discount), o_orderkey from 
(select avg(l_discount) as avg_disc from orders, lineitem where l_orderkey = o_orderkey)
, lineitem, orders where l_orderkey = o_orderkey and o_orderdate >= '1993-08-01' and o_orderdate <= '1993-08-31' and l_discount>avg_disc group by l_orderkey ;