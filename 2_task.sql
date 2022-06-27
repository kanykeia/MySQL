/* Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR и 
в них долгое время помещались значения в формате "20.10.2017 8:10". 
Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.*/

mysql> DESCRIBE users;
+-------------+-----------------+------+-----+-------------------+-----------------------------------------------+
| Field       | Type            | Null | Key | Default           | Extra                                         |
+-------------+-----------------+------+-----+-------------------+-----------------------------------------------+
| id          | bigint unsigned | NO   | PRI | NULL              | auto_increment                                |
| name        | varchar(255)    | YES  |     | NULL              |                                               |
| birthday_at | date            | YES  |     | NULL              |                                               |
| created_at  | datetime        | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED                             |
| updated_at  | datetime        | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED on update CURRENT_TIMESTAMP |
+-------------+-----------------+------+-----+-------------------+-----------------------------------------------+
5 rows in set (0,00 sec)

mysql> ALTER TABLE users CHANGE COLUMN `created_at` `created_at` varchar(256) NOT NULL;
Query OK, 6 rows affected (0,02 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE users CHANGE COLUMN `updated_at` `updated_at` varchar(256) NOT NULL;
Query OK, 6 rows affected (0,02 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> DESCRIBE users;
+-------------+-----------------+------+-----+---------+----------------+
| Field       | Type            | Null | Key | Default | Extra          |
+-------------+-----------------+------+-----+---------+----------------+
| id          | bigint unsigned | NO   | PRI | NULL    | auto_increment |
| name        | varchar(255)    | YES  |     | NULL    |                |
| birthday_at | date            | YES  |     | NULL    |                |
| created_at  | varchar(256)    | NO   |     | NULL    |                |
| updated_at  | varchar(256)    | NO   |     | NULL    |                |
+-------------+-----------------+------+-----+---------+----------------+
5 rows in set (0,00 sec)

mysql> SELECT * from users;
+----+--------------------+-------------+---------------------+---------------------+
| id | name               | birthday_at | created_at          | updated_at          |
+----+--------------------+-------------+---------------------+---------------------+
|  1 | Геннадий           | 1990-10-05  | 2022-06-27 12:03:08 | 2022-06-27 12:03:08 |
|  2 | Наталья            | 1984-11-12  | 2022-06-27 12:03:08 | 2022-06-27 12:03:08 |
|  3 | Александр          | 1985-05-20  | 2022-06-27 12:03:08 | 2022-06-27 12:03:08 |
|  4 | Сергей             | 1988-02-14  | 2022-06-27 12:03:08 | 2022-06-27 12:03:08 |
|  5 | Иван               | 1998-01-12  | 2022-06-27 12:03:08 | 2022-06-27 12:03:08 |
|  6 | Мария              | 1992-08-29  | 2022-06-27 12:03:08 | 2022-06-27 12:03:08 |
+----+--------------------+-------------+---------------------+---------------------+
6 rows in set (0,00 sec)

mysql> ALTER TABLE users CHANGE COLUMN `updated_at` `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    -> ;
Query OK, 6 rows affected (0,03 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE users CHANGE COLUMN `created_at` `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
Query OK, 6 rows affected (0,03 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> DESCRIBE users;
+-------------+-----------------+------+-----+-------------------+-----------------------------------------------+
| Field       | Type            | Null | Key | Default           | Extra                                         |
+-------------+-----------------+------+-----+-------------------+-----------------------------------------------+
| id          | bigint unsigned | NO   | PRI | NULL              | auto_increment                                |
| name        | varchar(255)    | YES  |     | NULL              |                                               |
| birthday_at | date            | YES  |     | NULL              |                                               |
| created_at  | datetime        | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED on update CURRENT_TIMESTAMP |
| updated_at  | datetime        | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED on update CURRENT_TIMESTAMP |
+-------------+-----------------+------+-----+-------------------+-----------------------------------------------+
5 rows in set (0,01 sec)

mysql> SELECT * from users;
+----+--------------------+-------------+---------------------+---------------------+
| id | name               | birthday_at | created_at          | updated_at          |
+----+--------------------+-------------+---------------------+---------------------+
|  1 | Геннадий           | 1990-10-05  | 2022-06-27 12:03:08 | 2022-06-27 12:03:08 |
|  2 | Наталья            | 1984-11-12  | 2022-06-27 12:03:08 | 2022-06-27 12:03:08 |
|  3 | Александр          | 1985-05-20  | 2022-06-27 12:03:08 | 2022-06-27 12:03:08 |
|  4 | Сергей             | 1988-02-14  | 2022-06-27 12:03:08 | 2022-06-27 12:03:08 |
|  5 | Иван               | 1998-01-12  | 2022-06-27 12:03:08 | 2022-06-27 12:03:08 |
|  6 | Мария              | 1992-08-29  | 2022-06-27 12:03:08 | 2022-06-27 12:03:08 |
+----+--------------------+-------------+---------------------+---------------------+

