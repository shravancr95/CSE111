select * from lineitem_noindex where l_returnflag = 'N' and l_shipdate = '1998-05-26'

--lineitem_index = .108s lineitem_noindex = .009s