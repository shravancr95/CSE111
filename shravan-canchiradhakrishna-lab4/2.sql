-- --2 2. Print the number of suppliers in each country.
SELECT COUNT(s_nationkey), n_name  FROM supplier, nation WHERE n_nationkey = s_nationkey GROUP BY s_nationkey ORDER BY n_name;