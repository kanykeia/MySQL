# Установите СУБД MySQL. Создайте в домашней директории файл .my.cnf, задав в нем логин и 
# пароль, который указывался при установке.
kanykei@kanykei-HP-Pavilion-Laptop-15-eh1xxx:~$ sudo apt update
[sudo] password for kanykei: 
Get:1 http://security.ubuntu.com/ubuntu jammy-security InRelease [110 kB]      
Hit:2 http://kg.archive.ubuntu.com/ubuntu jammy InRelease                      
Hit:3 https://download.docker.com/linux/ubuntu jammy InRelease                 
Get:4 http://kg.archive.ubuntu.com/ubuntu jammy-updates InRelease [109 kB]     
Get:5 http://security.ubuntu.com/ubuntu jammy-security/main amd64 DEP-11 Metadata [11,4 kB]
Get:6 http://kg.archive.ubuntu.com/ubuntu jammy-backports InRelease [99,8 kB]
Get:7 http://kg.archive.ubuntu.com/ubuntu jammy-updates/main amd64 DEP-11 Metadata [73,3 kB]
Get:8 http://kg.archive.ubuntu.com/ubuntu jammy-updates/universe amd64 DEP-11 Metadata [92,0 kB]
Get:9 http://kg.archive.ubuntu.com/ubuntu jammy-backports/universe amd64 DEP-11 Metadata [1 196 B]
Fetched 497 kB in 3s (170 kB/s)                                                
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
All packages are up to date.
kanykei@kanykei-HP-Pavilion-Laptop-15-eh1xxx:~$ sudo apt install mysql-server
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following NEW packages will be installed:
  mysql-server
0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
Need to get 9 534 B of archives.
After this operation, 111 kB of additional disk space will be used.
Get:1 http://kg.archive.ubuntu.com/ubuntu jammy-updates/main amd64 mysql-server all 8.0.29-0ubuntu0.22.04.2 [9 534 B]
Fetched 9 534 B in 1s (10,9 kB/s)                        
Selecting previously unselected package mysql-server.
(Reading database ... 204446 files and directories currently installed.)
Preparing to unpack .../mysql-server_8.0.29-0ubuntu0.22.04.2_all.deb ...
Unpacking mysql-server (8.0.29-0ubuntu0.22.04.2) ...
Setting up mysql-server (8.0.29-0ubuntu0.22.04.2) ...
kanykei@kanykei-HP-Pavilion-Laptop-15-eh1xxx:~$ sudo apt install mysql-client
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following NEW packages will be installed:
  mysql-client
0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
Need to get 9 428 B of archives.
After this operation, 111 kB of additional disk space will be used.
Get:1 http://kg.archive.ubuntu.com/ubuntu jammy-updates/main amd64 mysql-client all 8.0.29-0ubuntu0.22.04.2 [9 428 B]
Fetched 9 428 B in 1s (10,8 kB/s)            
Selecting previously unselected package mysql-client.
(Reading database ... 204450 files and directories currently installed.)
Preparing to unpack .../mysql-client_8.0.29-0ubuntu0.22.04.2_all.deb ...
Unpacking mysql-client (8.0.29-0ubuntu0.22.04.2) ...
Setting up mysql-client (8.0.29-0ubuntu0.22.04.2) ...
kanykei@kanykei-HP-Pavilion-Laptop-15-eh1xxx:~$ ps aux | grep mysqld
kanykei    12799  0.0  0.0  20396  2452 pts/0    S+   10:57   0:00 grep --color=auto mysqld
kanykei@kanykei-HP-Pavilion-Laptop-15-eh1xxx:~$ sudo service mysql start
kanykei@kanykei-HP-Pavilion-Laptop-15-eh1xxx:~$ ^C
kanykei@kanykei-HP-Pavilion-Laptop-15-eh1xxx:~$ ps aux | grep mysqld
mysql      12838  3.3  2.4 2106532 387552 ?      Ssl  10:58   0:00 /usr/sbin/mysqld
kanykei    12895  0.0  0.0  20396  2384 pts/0    S+   10:58   0:00 grep --color=auto mysqld
kanykei@kanykei-HP-Pavilion-Laptop-15-eh1xxx:~$ sudo mysql_secure_installation

Securing the MySQL server deployment.

Enter password for user root: 
The 'validate_password' component is installed on the server.
The subsequent steps will run with the existing configuration
of the component.
Using existing password for root.

Estimated strength of the password: 100 
Change the password for root ? ((Press y|Y for Yes, any other key for No) : y

New password: 

Re-enter new password: 

Estimated strength of the password: 100 
Do you wish to continue with the password provided?(Press y|Y for Yes, any other key for No) : n

New password: 

Re-enter new password: 
Sorry, passwords do not match.

New password: 

Re-enter new password: 

Estimated strength of the password: 100 
Do you wish to continue with the password provided?(Press y|Y for Yes, any other key for No) : Y
By default, a MySQL installation has an anonymous user,
allowing anyone to log into MySQL without having to have
a user account created for them. This is intended only for
testing, and to make the installation go a bit smoother.
You should remove them before moving into a production
environment.

Remove anonymous users? (Press y|Y for Yes, any other key for No) : Y
Success.


Normally, root should only be allowed to connect from
'localhost'. This ensures that someone cannot guess at
the root password from the network.

Disallow root login remotely? (Press y|Y for Yes, any other key for No) : Y
Success.

By default, MySQL comes with a database named 'test' that
anyone can access. This is also intended only for testing,
and should be removed before moving into a production
environment.


Remove test database and access to it? (Press y|Y for Yes, any other key for No) : Y
 - Dropping test database...
Success.

 - Removing privileges on test database...
Success.

Reloading the privilege tables will ensure that all changes
made so far will take effect immediately.

Reload privilege tables now? (Press y|Y for Yes, any other key for No) : Y
Success.

All done! 
kanykei@kanykei-HP-Pavilion-Laptop-15-eh1xxx:~$ systemctl start mysql
kanykei@kanykei-HP-Pavilion-Laptop-15-eh1xxx:~$ systemctl status mysql
● mysql.service - MySQL Community Server
     Loaded: loaded (/lib/systemd/system/mysql.service; enabled; vendor preset: enabled)
     Active: active (running) since Sun 2022-06-12 11:06:50 +06; 15s ago
    Process: 13378 ExecStartPre=/usr/share/mysql/mysql-systemd-start pre (code=exited, status=0/SUCCESS)
   Main PID: 13386 (mysqld)
     Status: "Server is operational"
      Tasks: 38 (limit: 18324)
     Memory: 359.8M
        CPU: 472ms
     CGroup: /system.slice/mysql.service
             └─13386 /usr/sbin/mysqld

июн 12 11:06:50 kanykei-HP-Pavilion-Laptop-15-eh1xxx systemd[1]: Starting MySQL Community Server...
июн 12 11:06:50 kanykei-HP-Pavilion-Laptop-15-eh1xxx systemd[1]: Started MySQL Community Server.
kanykei@kanykei-HP-Pavilion-Laptop-15-eh1xxx:~$ sudo systemctl enable mysql
Synchronizing state of mysql.service with SysV service script with /lib/systemd/systemd-sysv-install.
Executing: /lib/systemd/systemd-sysv-install enable mysql
kanykei@kanykei-HP-Pavilion-Laptop-15-eh1xxx:~$ nano .my.cnf
kanykei@kanykei-HP-Pavilion-Laptop-15-eh1xxx:~$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.29-0ubuntu0.22.04.2 (Ubuntu)

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
mysql> exit
Bye
kanykei@kanykei-HP-Pavilion-Laptop-15-eh1xxx:~$ more .my.cnf
[mysql]
user=root
password=Helloworld16,


