CREATE TRIGGER part_deleted
AFTER DELETE ON part
FOR EACH ROW
WHEN (OLD.p_partkey IN
    (SELECT l_partkey FROM lineitem
    UNION
    SELECT ps_partkey FROM partsupp))
BEGIN
    DELETE FROM lineitem
    WHERE l_partkey = OLD.p_partkey;
    
    DELETE FROM partsupp
    WHERE ps_partkey = OLD.p_partkey;
END;

DELETE FROM part
WHERE p_partkey IN
    (SELECT ps_partkey
    FROM partsupp, supplier, nation
    WHERE ps_suppkey = s_suppkey
        AND s_nationkey = n_nationkey
        AND (n_name = 'CHINA' OR n_name = 'CANADA'));
		
SELECT AVG(ps_supplycost), n_name
FROM partsupp, supplier, nation, region
WHERE ps_suppkey = s_suppkey
        AND s_nationkey = n_nationkey
        AND n_regionkey = r_regionkey
        AND r_name = 'ASIA'
GROUP BY n_name;
