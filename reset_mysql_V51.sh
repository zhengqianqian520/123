#!/bin/sh
#sed -i "s:^/etc/init.d/mysql:#/etc/init.d/mysql:" /virus/mysql/rmmysql
cd /virus/mysql
ps ax | grep mysqld_dog.sh | awk '{print $1}' | xargs kill -9
sh /virus/mysql/rmmysql
sh /virus/mysql/insmysql
ps ax | grep mysqld_dog.sh | awk '{print $1}' | xargs kill -9
mv /usr/sbin/mysqld_dog.sh /usr/sbin/mysqld_dog.sh_bak
rm -rf /aclog/startup_check/badtable/*
rm -rf /aclog/startup_check/alter_engine_status.txt
rm -rf /aclog/startup_check/process_info
rm -rf /aclog/startup_check/last_period_check.timeflag
touch /aclog/startup_check/last_period_check.timeflag
rm -rf /aclog/startup_check/mysqld_startup_checklist.txt
touch /aclog/startup_check/mysqld_startup_checklist.txt
mv /usr/sbin/mysqld_dog.sh_bak /usr/sbin/mysqld_dog.sh
cd -
