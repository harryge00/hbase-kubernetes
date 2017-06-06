#!/bin/bash

#sed "s/HDFS_NAMENODE_RPC_HOST/$HDFS_NAMENODE_RPC_HOST/" ${HADOOP_INSTALL_DIR}/etc/hadoop/hdfs-site.xml > ${HADOOP_INSTALL_DIR}/etc/hadoop/hdfs-site.new.xml
#mv ${HADOOP_INSTALL_DIR}/etc/hadoop/hdfs-site.new.xml ${HADOOP_INSTALL_DIR}/etc/hadoop/hdfs-site.xml

cat ${HADOOP_INSTALL_DIR}/etc/hadoop/hdfs-site.xml

# set fqdn
for i in $(seq 1 10)
do
    if grep --quiet $CLUSTER_DOMAIN /etc/hosts; then
        break
    elif grep --quiet $POD_NAME /etc/hosts; then
        cat /etc/hosts | sed "s/$POD_NAME/${POD_NAME}.${POD_NAMESPACE}.svc.${CLUSTER_DOMAIN} $POD_NAME/g" > /etc/hosts.bak
        cat /etc/hosts.bak > /etc/hosts
        break
    else
        echo "waiting for /etc/hosts ready"
        sleep 1
    fi
done

exec "$@"
