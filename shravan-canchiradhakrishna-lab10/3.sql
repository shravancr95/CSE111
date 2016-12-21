CREATE TRIGGER hp_delete
AFTER DELETE ON lineitem
FOR EACH ROW
WHEN (OLD.l_orderkey IN (SELECT o_orderkey FROM orders))
BEGIN
    UPDATE orders
    SET o_orderpriority = 'HIGH'
	WHERE o_orderkey = OLD.l_orderkey;
END;

CREATE TRIGGER hp_insert
AFTER INSERT on lineitem
FOR EACH ROW
WHEN (NEW.l_orderkey IN (SELECT o_orderkey FROM orders))
BEGIN
    UPDATE orders
    SET o_orderpriority = 'HIGH'
        WHERE o_orderkey = NEW.l_orderkey;
END;

DELETE FROM lineitem
WHERE l_orderkey IN
    (SELECT o_orderkey
    FROM orders
    WHERE o_orderdate LIKE '1996-10%');

	
SELECT count(*)
FROM orders
WHERE o_orderpriority LIKE 'HIGH'
    AND o_orderdate between '1996-09-01' AND '1996-11-30';
