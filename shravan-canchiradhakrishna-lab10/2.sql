CREATE TRIGGER t2
AFTER UPDATE ON customer
WHEN NEW.c_acctbal<0 AND old.c_acctbal>0
BEGIN
    UPDATE customer SET c_comment = c_comment || "Negative Balance!!! Add money now!"
    Where c_custkey=NEW.c_custkey;
END;
    


CREATE TRIGGER t3
AFTER UPDATE ON customer
WHEN NEW.c_acctbal>0 and old.c_acctbal<0
BEGIN
    UPDATE customer SET c_comment = substr(c_comment,1,length(c_comment)-34)
    Where c_custkey=NEW.c_custkey;
END;


UPDATE customer
SET c_acctbal=-200
WHERE c_custkey in(SELECT c_custkey 
                   FROM region, nation, customer
                   WHERE r_name='ASIA'
                   AND r_regionkey=n_regionkey
                   AND n_nationkey = c_nationkey);
                   
 
SELECT count(distinct c_custkey)
from customer, nation
where c_acctbal<0
        AND c_nationkey=n_nationkey
        AND n_name= 'CHINA';
        

UPDATE customer
SET c_acctbal=100
WHERE c_custkey IN(
                   SELECT c_custkey 
                   FROM nation, customer
                   WHERE
                   n_name = 'CHINA'
                   AND n_nationkey = c_nationkey);     
                   
                               
  
SELECT count(distinct c_custkey)
from customer, nation,region
where c_acctbal<0
        AND n_regionkey=r_regionkey
        AND c_nationkey=n_nationkey
        AND r_name= 'ASIA';
        
