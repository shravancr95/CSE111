select c_mktsegment, min(c_acctbal), max(c_acctbal), avg(c_acctbal), sum(c_acctbal) from customer_noindex group by c_mktsegment;

--customer_index: .107 customer_noindex: .103