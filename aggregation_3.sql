/* (по желанию) Подсчитайте произведение чисел в столбце таблицы */
mysql> DROP TABLE IF EXISTS `some_values`;
Query OK, 0 rows affected, 1 warning (0,01 sec)
mysql> CREATE TABLE `some_values` (
    ->   `value` int(10) NOT NULL);
Query OK, 0 rows affected, 1 warning (0,01 sec)
mysql> INSERT INTO `some_values` VALUES (7),(3),(5),(9),(9),(9),(2),(6);
Query OK, 8 rows affected (0,01 sec)
Records: 8  Duplicates: 0  Warnings: 0
mysql> SELECT * FROM `some_values`;
+-------+
| value |
+-------+
|     7 |
|     3 |
|     5 |
|     9 |
|     9 |
|     9 |
|     2 |
|     6 |
+-------+
8 rows in set (0,00 sec)
mysql> SELECT ROUND(EXP(SUM(log(value))), 0) product FROM some_values;
+---------+
| product |
+---------+
|  918540 |
+---------+
1 row in set (0,00 sec)

