FROM $BASE_IMAGE

ADD  conf/core-site.xml  ${HADOOP_INSTALL_DIR}/etc/hadoop/core-site.xml
ADD  conf/hdfs-site.xml  ${HADOOP_INSTALL_DIR}/etc/hadoop/hdfs-site.xml
ADD  conf/yarn-site.xml  ${HADOOP_INSTALL_DIR}/etc/hadoop/yarn-site.xml
COPY  conf/id_rsa.pub /root/.ssh/authorized_keys

ADD docker-entrypoint.sh /usr/local/sbin/docker-entrypoint.sh

# Enable jmx for journalnode
RUN echo "export HADOOP_OPTS=\"-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=8010 -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false\"" >> ${HADOOP_INSTALL_DIR}/etc/hadoop/hadoop-env.sh

EXPOSE 8485

RUN chmod a+x /usr/local/sbin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/sbin/docker-entrypoint.sh"]
CMD ["bin/hdfs", "journalnode"]
