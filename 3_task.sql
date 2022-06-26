-- . Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = false). Предварительно добавить такое поле в таблицу profiles со значением по умолчанию = true (или 1)--

mysql> ALTER TABLE profiles ADD is_active BIT DEFAULT false NULL;
Query OK, 0 rows affected (0,02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> UPDATE profiles
    -> SET is_active = 1
    -> WHERE YEAR(CURRENT_TIMESTAMP) - YEAR(birthday) - (RIGHT(CURRENT_TIMESTAMP, 5) < RIGHT(birthday, 5)) >= 18
    -> ;
Rows matched: 10  Changed: 10  Warnings: 0


