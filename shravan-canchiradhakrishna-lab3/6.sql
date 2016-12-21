select n_name from nation, customer_noindex, orders_noindex where c_custkey = o_custkey and o_orderdate >= '1995-03-01' and o_orderdate <= '1995-03-31';

--customer_index and order_index: .107s customer_noindex and order_noindex: .105s