SELECT avg(julianday(l_receiptdate)-julianday(l_shipdate)) from lineitem_noindex;

--lineitem_index: 0.171s lineitem_noindex: 0.133