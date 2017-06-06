#!/bin/sh

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

if [ ! -f ${HDFS_NAMENODE_ROOT_DIR}/current/VERSION ]; then
    echo Formatting namenode root fs in ${HDFS_NAMENODE_ROOT_DIR}
    bin/hdfs namenode -format -nonInteractive
fi

if [ "${HDFS_INIT_NAMENODE}" = "true" ]; then
    echo forcing initialize shared edits...
    bin/hdfs namenode -initializeSharedEdits -nonInteractive
else
    echo booting standby...
    bin/hdfs namenode -bootstrapStandby -nonInteractive
fi

bin/hdfs zkfc -formatZK -nonInteractive
sbin/hadoop-daemon.sh --script bin/hdfs start zkfc

exec "$@"
