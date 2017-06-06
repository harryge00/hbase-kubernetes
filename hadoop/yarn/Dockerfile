FROM index.caicloud.io/caicloud/hadoop-base:sysinfra

ADD  conf/core-site.xml  ${HADOOP_INSTALL_DIR}/etc/hadoop/core-site.xml
ADD  conf/hdfs-site.xml  ${HADOOP_INSTALL_DIR}/etc/hadoop/hdfs-site.xml
ADD  conf/yarn-site.xml  ${HADOOP_INSTALL_DIR}/etc/hadoop/yarn-site.xml
COPY  conf/id_rsa.pub /root/.ssh/authorized_keys

ADD docker-entrypoint.sh /usr/local/sbin/docker-entrypoint.sh

RUN chmod a+x /usr/local/sbin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/sbin/docker-entrypoint.sh"]
CMD ["bin/yarn", "-h"]
