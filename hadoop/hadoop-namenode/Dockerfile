FROM $BASE_IMAGE

ENV  HDFS_NAMENODE_ROOT_DIR=/var/hdfs/name
ENV  JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64

ADD  conf/core-site.xml  ${HADOOP_INSTALL_DIR}/etc/hadoop/core-site.xml
ADD  conf/hdfs-site.xml  ${HADOOP_INSTALL_DIR}/etc/hadoop/hdfs-site.xml
ADD  conf/yarn-site.xml  ${HADOOP_INSTALL_DIR}/etc/hadoop/yarn-site.xml
COPY  conf/id_rsa /root/.ssh/id_rsa
COPY  conf/id_rsa.pub /root/.ssh/id_rsa.pub

ADD  docker-entrypoint.sh /usr/local/sbin/docker-entrypoint.sh

VOLUME  ["${HDFS_NAMENODE_ROOT_DIR}"]

RUN \
    mkdir /var/run/sshd && \
    chmod 0755 /var/run/sshd && \
    service ssh start

# TCP  8020   fs.defaultFS    IPC: ClientProtocol
# TCP  50070  dfs.namenode.http-address  HTTP connector
# TCP  50470  dfs.namenode.https-address  HTTPS connector

EXPOSE 22 8020 50070 50470

RUN chmod a+x /usr/local/sbin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/sbin/docker-entrypoint.sh"]
#CMD  ["/usr/sbin/sshd"]
CMD ["bin/hdfs", "namenode"]
#CMD ["./sbin/start-dfs.sh"]
