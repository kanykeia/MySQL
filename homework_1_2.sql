#Создайте базу данных example, разместите в ней таблицу users, состоящую из двух столбцов, #числового id и строкового name.
kanykei@kanykei-HP-Pavilion-Laptop-15-eh1xxx:~$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
Server version: 8.0.29-0ubuntu0.22.04.2 (Ubuntu)

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE example;
Query OK, 1 row affected (0,00 sec)

mysql> USE example;
Database changed
mysql> CREATE TABLE users (id INT, name TEXT);
Query OK, 0 rows affected (0,01 sec)

mysql> DESCRIBE users;
+-------+------+------+-----+---------+-------+
| Field | Type | Null | Key | Default | Extra |
+-------+------+------+-----+---------+-------+
| id    | int  | YES  |     | NULL    |       |
| name  | text | YES  |     | NULL    |       |
+-------+------+------+-----+---------+-------+
2 rows in set (0,00 sec)
