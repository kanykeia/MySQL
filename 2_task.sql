--Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке--
mysql> SELECT DISTINCT `firstname` FROM `users` ORDER BY `firstname`;
+-----------+
| firstname |
+-----------+
| Alisa     |
| Angel     |
| Ardith    |
| Cassandra |
| Henriette |
| Jason     |
| Lavina    |
| Meghan    |
| Myrl      |
| Octavia   |
| Pinkie    |
| Solon     |
| Vickie    |
+-----------+

