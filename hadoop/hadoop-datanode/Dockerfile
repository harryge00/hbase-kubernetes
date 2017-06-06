FROM $BASE_IMAGE

ENV  HDFS_DATANODE_ROOT_DIR=/var/hdfs/datanode
ENV  HDFS_NAMENODE_RPC_HOST=0.0.0.0
ENV  HDFS_NAMENODE_RPC_PORT=8020
ENV  JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64

ADD  conf/core-site.xml  ${HADOOP_INSTALL_DIR}/etc/hadoop/core-site.xml
ADD  conf/hdfs-site.xml  ${HADOOP_INSTALL_DIR}/etc/hadoop/hdfs-site.xml
ADD  conf/yarn-site.xml  ${HADOOP_INSTALL_DIR}/etc/hadoop/yarn-site.xml
COPY  conf/id_rsa.pub /root/.ssh/authorized_keys

ADD  docker-entrypoint.sh /usr/local/sbin/docker-entrypoint.sh

RUN \
    mkdir /var/run/sshd && \
    chmod 0755 /var/run/sshd && \
    service ssh start

VOLUME  ["${HDFS_DATANODE_ROOT_DIR}"]


# TCP  50010  dfs.datanode.address    port for data transfer
# TCP  50020  dfs.datanode.ipc.address  ipc server
# TCP  50075  dfs.datanode.http.address  http server
# TCP  50475  dfs.datanode.https.address  https server

EXPOSE 50010 50020 50075 50475

RUN chmod a+x /usr/local/sbin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/sbin/docker-entrypoint.sh"]
CMD ["bin/hdfs", "datanode"]
