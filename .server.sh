#!/bin/bash

# usr/local/bin/deamon -d & >/dev/null 2>&1

# mongoDB 
function mongo_start (){
	sudo ls ~/ >/dev/null
	sudo /usr/local/mongodb-4.0.9/bin/mongod -f /usr/local/mongodb-4.0.9/etc/mongo.conf
}
function mongo_cli (){
    /usr/local/mongodb-4.0.9/bin/mongo
}

function mongo_shutdown () {
	PID=$(ps -ef |grep mongod | awk 'NR==1{print $2}')
	sudo kill -9 $PID	
	echo "is success: $?  kill pid: $PID"
}

# redis
function redis_start () {
   sudo ls ~/ >/dev/null
   sudo /usr/local/redis-5.0.4/src/redis-server  /usr/local/redis-5.0.4/redis.conf
   echo "is success: $? the process pid: $(cat /var/run/redis_6379.pid)"
}

function redis_shutdown () {
	sudo kill -9 $(cat /var/run/redis_6379.pid)
	echo "is success: $? kill pid: $(cat /var/run/redis_6379.pid)"
}

function redis_cli () {
	/usr/local/redis-5.0.4/src/redis-cli
}

# mysql
function mysql_start () {
   sudo ls ~/ >/dev/null
   sudo /usr/local/mysql/support-files/mysql.server start
}

function mysql_shutdown () {
   sudo ls ~/ >/dev/null
   sudo /usr/local/mysql/support-files/mysql.server stop
}

function mysql_cli () {
   # root  password
   # test  xxd123qwe
	/usr/local/mysql/bin/mysql -uroot -ppassword
}

CMD=$1
if [ "$CMD" == "mongo_shutdown" ]; then
	mongo_shutdown
elif [ "$CMD" == "mongo_start" ]; then
    mongo_start
elif [ "$CMD" == "mongo_cli" ]; then
	mongo_cli
elif [ "$CMD" == "redis_start" ]; then
	redis_start
elif [ "$CMD" == "redis_shutdown" ]; then
	redis_shutdown
elif [ "$CMD" == "redis_cli" ]; then
	redis_cli
elif [ "$CMD" == "mysql_start" ]; then
	mysql_start
elif [ "$CMD" == "mysql_shutdown" ]; then
	mysql_shutdown
elif [ "$CMD" == "mysql_cli" ]; then
	mysql_cli
else
	echo "无法识别的命令: $CMD"
	exit -1
fi
