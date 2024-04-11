CREATE USER 'sharkfit'@'localhost'identified by 'sharkfit';

grant all privileges on *.* to 'sharkfit'@'localhost';

alter user 'sharkfit'@'localhost' identified with mysql_native_password by 'sharkfit';