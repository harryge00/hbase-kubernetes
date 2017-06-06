#!/bin/bash

export HBASE_CONF_FILE=/opt/hbase/conf/hbase-site.xml
export HADOOP_USER_NAME=hdfs
export HBASE_MANAGES_ZK=false

sed -i "s/@HBASE_MASTER_PORT@/$HBASE_MASTER_PORT/g" $HBASE_CONF_FILE
sed -i "s/@HBASE_MASTER_INFO_PORT@/$HBASE_MASTER_INFO_PORT/g" $HBASE_CONF_FILE
sed -i "s/@HBASE_REGION_PORT@/$HBASE_REGION_PORT/g" $HBASE_CONF_FILE
sed -i "s/@HBASE_REGION_INFO_PORT@/$HBASE_REGION_INFO_PORT/g" $HBASE_CONF_FILE
sed -i "s/@HDFS_PATH@/$HDFS_SERVICE:$HDFS_PORT\/$ZNODE_PARENT/g" $HBASE_CONF_FILE
sed -i "s/@ZOOKEEPER_IP_LIST@/$ZOOKEEPER_SERVICE_LIST/g" $HBASE_CONF_FILE
sed -i "s/@ZOOKEEPER_PORT@/$ZOOKEEPER_PORT/g" $HBASE_CONF_FILE
sed -i "s/@ZNODE_PARENT@/$ZNODE_PARENT/g" $HBASE_CONF_FILE
cat /dev/null > /opt/hbase/conf/regionservers
for i in ${HBASE_REGION_LIST[@]}
do
   arr=(${i//:/ })
   echo "${arr[1]}" >> /opt/hbase/conf/regionservers
done

for i in ${HBASE_MASTER_LIST[@]}
do
   arr=(${i//:/ })
   echo "${arr[0]} ${arr[1]}" >> /etc/hosts
done

for i in ${HBASE_REGION_LIST[@]}
do
   arr=(${i//:/ })
   echo "${arr[0]} ${arr[1]}" >> /etc/hosts
done

if [ "$HBASE_SERVER_TYPE" = "master" ]; then
    /opt/hbase/bin/hbase master start
elif [ "$HBASE_SERVER_TYPE" = "regionserver" ]; then
    /opt/hbase/bin/hbase regionserver start
fi
