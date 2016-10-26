FROM java:8-jre

ADD opentsdb-2.2.0_all.deb .
RUN dpkg -i opentsdb-2.2.0_all.deb
RUN rm ./opentsdb-2.2.0_all.deb


RUN echo "tsd.storage.hbase.zk_quorum = zookeeper-1:2181,zookeeper-2:2181,zookeeper-3:2181" >> /etc/opentsdb/opentsdb.conf
ADD hbase-service.sh /opt/hbase-service.sh
ADD opentsdb-service.sh /opt/opentsdb-service.sh

ENV HBASE_VERSION 1.2.3
ENV HBASE_HOME /opt/hbase
COPY ./hbase-1.2.3-bin.tar.gz /hbase-setup/hbase-1.2.3-bin.tar.gz
RUN tar zxf /hbase-setup/hbase-1.2.3-bin.tar.gz -C /opt/ \
    && ln -s /opt/hbase-1.2.3 /opt/hbase
RUN rm /hbase-setup/hbase-1.2.3-bin.tar.gz

ADD create_table.sh /usr/share/opentsdb/tools/create_table.sh
ADD hbase-site.xml ${HBASE_HOME}/conf/hbase-site.xml
ADD hdfs-site.xml ${HBASE_HOME}/conf/hdfs-site.xml
ADD core-site.xml ${HBASE_HOME}/conf/core-site.xml

EXPOSE 4242
CMD ["/opt/opentsdb-service.sh"]
