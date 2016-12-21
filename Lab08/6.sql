--select count(l_orderkey) * 0.1 from lineitem;
update lineitem_index
set l_discount = l_discount + 0.1;

--lineitem_index:0.534s lineitem_noindex: 0.265