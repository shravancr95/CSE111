--11. Return the top 5 lowest value (l extendedprice*(1-l discount)) not shipped items as of September 2, 1994 sorted by their value in descending order.
select v from (select l_extendedprice*(1-l_discount) as v from lineitem where l_shipdate > '1994-09-02' order by (l_extendedprice*(1-l_discount)) asc limit 5) order by v desc;
