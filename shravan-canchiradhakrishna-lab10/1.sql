CREATE TRIGGER t1
AFTER INSERT ON orders

Begin
    UPDATE orders 
    SET o_orderdate=DATEtime('NOW') where o_orderkey=NEW.o_orderkey;    
END;

INSERT INTO orders
SELECT * FROM orders WHERE
o_orderdate LIKE '%1995-10%'
;

SELECT * FROM orders
WHERE o_orderdate LIKE strftime('%Y-%m-%d') || '%';
