--5. Find the number of orders posted by each customer from CHINA in 1996.
select count(*),c_name from orders join customer on (o_custkey = c_custkey) join nation on (c_nationkey = n_nationkey) where n_name = 'CHINA' and o_orderdate like '1996-%' group by c_custkey order by c_name;
