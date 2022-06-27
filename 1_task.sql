-- Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.--

-- Очищаю некоторые данные с таблицы--

mysql> UPDATE users SET `created_at` = NULL where id = 1;
Query OK, 1 row affected (0,01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE users SET `updated_at` = NULL where id = 3;
Query OK, 1 row affected (0,00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE users SET `updated_at` = CURRENT_TIMESTAMP where `updated_at` IS NULL;
Query OK, 1 row affected (0,00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE users SET `created_at` = CURRENT_TIMESTAMP where `created_at` IS NULL;
Query OK, 1 row affected (0,01 sec)
Rows matched: 1  Changed: 1  Warnings: 0


