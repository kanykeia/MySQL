# Создайте дамп базы данных example из предыдущего задания, разверните содержимое дампа в новую 
# базу данных sample.
kanykei@kanykei-HP-Pavilion-Laptop-15-eh1xxx:~$ mysqldump -u root -p example > example.sql
Enter password: 
kanykei@kanykei-HP-Pavilion-Laptop-15-eh1xxx:~$ ls -la
total 108
drwxr-x--- 18 kanykei kanykei 4096 июн 12 12:05  .
drwxr-xr-x  3 root    root    4096 май 31 23:21  ..
-rw-------  1 kanykei kanykei 2029 июн 12 10:47  .bash_history
-rw-r--r--  1 kanykei kanykei  220 май 31 23:21  .bash_logout
-rw-r--r--  1 kanykei kanykei 3771 май 31 23:21  .bashrc
drwx------ 16 kanykei kanykei 4096 июн  4 22:40  .cache
drwx------ 17 kanykei kanykei 4096 июн 11 18:02  .config
drwxr-xr-x  2 kanykei kanykei 4096 июн  1 00:24  Desktop
-rw-rw-r--  1 kanykei kanykei  226 июн  4 00:08  Dockerfile
drwxr-xr-x  2 kanykei kanykei 4096 июн  1 00:24  Documents
drwxr-xr-x  3 kanykei kanykei 4096 июн 11 19:05  Downloads
-rw-rw-r--  1 kanykei kanykei 1816 июн 12 12:05  example.sql
drwx------  2 kanykei kanykei 4096 июн  7 17:54  .gnupg
drwxrwxr-x  2 kanykei kanykei 4096 июн  2 21:40  .gphoto
-rw-------  1 kanykei kanykei   20 июн 12 11:07  .lesshst
drwx------  3 kanykei kanykei 4096 июн  1 00:24  .local
drwxr-xr-x  2 kanykei kanykei 4096 июн  1 00:24  Music
-rw-rw-r--  1 kanykei kanykei   39 июн 12 11:11  .my.cnf
drwxrwxr-x  5 kanykei kanykei 4096 июн  2 20:49 'My files'
-rw-------  1 kanykei kanykei  234 июн 12 12:02  .mysql_history
drwxr-xr-x  2 kanykei kanykei 4096 июн  1 00:24  Pictures
-rw-r--r--  1 kanykei kanykei  807 май 31 23:21  .profile
drwxr-xr-x  2 kanykei kanykei 4096 июн  1 00:24  Public
drwx------  8 kanykei kanykei 4096 июн  5 22:52  snap
drwx------  2 kanykei kanykei 4096 июн  3 21:56  .ssh
-rw-r--r--  1 kanykei kanykei    0 июн  2 20:53  .sudo_as_admin_successful
drwxr-xr-x  2 kanykei kanykei 4096 июн  1 00:24  Templates
drwxr-xr-x  2 kanykei kanykei 4096 июн  1 00:24  Videos
kanykei@kanykei-HP-Pavilion-Laptop-15-eh1xxx:~$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 11
Server version: 8.0.29-0ubuntu0.22.04.2 (Ubuntu)

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> USE sample;
Database changed
mysql> SHOW TABLES;
Empty set (0,00 sec)

mysql> exit
Bye
kanykei@kanykei-HP-Pavilion-Laptop-15-eh1xxx:~$ mysql sample < example.sql 
kanykei@kanykei-HP-Pavilion-Laptop-15-eh1xxx:~$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 13
Server version: 8.0.29-0ubuntu0.22.04.2 (Ubuntu)

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> USE sample;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> SHOW TABLES;
+------------------+
| Tables_in_sample |
+------------------+
| users            |
+------------------+
1 row in set (0,00 sec)

