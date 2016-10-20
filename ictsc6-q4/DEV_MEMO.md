# Ansible内で使用しているmysql.tarとmysqldump.sqlの作成手順

中身的には`mysql_secure_installation`を叩いただけ

~~(決してAnsibleで書くのが面倒くさかったとか、`mysql_secure_installation`をどうするか考えるか面倒だったとか、そんなんじゃないです)~~

一応そのままスクリプトとして実行可能になってる(はず)

## mysql.tar

```
sudo yum -y install mysql-server
sudo service mysqld start
sudo mysql_secure_installation #passwordは'root'

sudo service mysqld stop

cd /var/lib/mysql
sudo tar --selinux -cf /tmp/mysql.tar *
```

## mysqldump.sql

memo: わざわざdumpしないでAnsibleで直接SQL叩いてもいいかも

```
echo "
    CREATE DATABASE ictsc;
    CREATE TABLE ictsc.user (
        id INT NOT NULL PRIMARY KEY,
        name VARCHAR(50)
    );

    INSERT INTO ictsc.user (id, name) VALUES (1, 'ictsc');
    INSERT INTO ictsc.user (id, name) VALUES (2, 'ictsc6666666666666666');
" | mysql -u root --password=root

mysqldump --user=root --password=root -B ictsc > mysqldump.sql
```
