/* Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. Следует учесть, что необходимы дни недели текущего года, а не года рождения.*/

mysql> SELECT DAYNAME(CONCAT(YEAR(NOW()), "-", SUBSTRING(birthday_at, 6, 10))) AS birtday_name_in_this_year, COUNT(DAYNAME(CONCAT(YEAR(NOW()), "-", SUBSTRING(birthday_at, 6, 10)))) AS AMOUNT_of_birthdays FROM users GROUP BY birtday_name_in_this_year;
+---------------------------+---------------------+
| birtday_name_in_this_year | AMOUNT_of_birthdays |
+---------------------------+---------------------+
| Wednesday                 |                   2 |
| Saturday                  |                   1 |
| Friday                    |                   1 |
| Monday                    |                   2 |
+---------------------------+---------------------+
4 rows in set (0,00 sec)

