--10. Find the maximum discount for each type of items having PROMO in their type name.
select p_type,max(l_discount) from lineitem,part where l_partkey = p_partkey AND p_type like '%PROMO%' group by p_type order by p_type;
