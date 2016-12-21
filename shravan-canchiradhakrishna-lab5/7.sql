--7. For each order priority, count the number of items ordered in 1996 and received earlier than the committed date. List the results in descending priority order.

select priority, count(*) from (
(select distinct o_orderpriority as 'priority', l_partkey as 'partkey' from orders, lineitem where o_orderdate >= '1996-01-01' and o_orderdate <= '1996-12-31' and l_orderkey = o_orderkey and l_commitdate > l_receiptdate)
) group by priority order by priority DESC;