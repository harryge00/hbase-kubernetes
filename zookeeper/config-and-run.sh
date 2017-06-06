#!/bin/bash


echo "$SERVER_ID / $MAX_SERVERS" 
if [ ! -z "$SERVER_ID" ] && [ ! -z "$MAX_SERVERS" ]; then
  echo "Starting up in clustered mode"
  echo "" >> /opt/zookeeper/conf/zoo.cfg
  echo "#Server List" >> /opt/zookeeper/conf/zoo.cfg
  for i in $( eval echo {1..$MAX_SERVERS});do
    if [ "$SERVER_ID" = "$i" ];then
      echo "server.$i=0.0.0.0:2888:3888" >> /opt/zookeeper/conf/zoo.cfg
    else
      echo "server.$i=${ZOOKEEPER_MEMBER}-${i}:2888:3888" >> /opt/zookeeper/conf/zoo.cfg
    fi
  done
  cat /opt/zookeeper/conf/zoo.cfg

  # Persists the ID of the current instance of Zookeeper
  echo ${SERVER_ID} > /opt/zookeeper/data/myid
  else
    echo "Starting up in standalone mode"
fi

exec /opt/zookeeper/bin/zkServer.sh start-foreground