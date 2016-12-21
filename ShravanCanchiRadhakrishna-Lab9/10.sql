--drop view Q10;

create view Q10 as
select p_type, max(l_discount)
from part, lineitem
where p_partkey = l_partkey
group by p_type;

select p_type,max(l_discount) from lineitem,part where l_partkey = p_partkey AND p_type like '%PROMO%' group by p_type order by p_type;

select * from Q10 where p_type like '%PROMO%';