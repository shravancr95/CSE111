select count(*) as number_of_items, l_receiptdate from lineitem_noindex, customer_noindex, orders_noindex where c_name = 'Customer#000000106' and c_custkey = o_custkey and o_orderkey = l_orderkey group by l_receiptdate;

--lineitem_index, customer_index, orders_index: 0.164s lineitem_noindex, customer_noindex, orders_noindex: 0.137s