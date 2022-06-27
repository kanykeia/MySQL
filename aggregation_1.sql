/* Подсчитайте средний возраст пользователей в таблице users */
mysql> SELECT ROUND(AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW())), 0) AS `AVG age` FROM users;
+---------+
| AVG age |
+---------+
|      32 |
+---------+
1 row in set (0,00 sec)

