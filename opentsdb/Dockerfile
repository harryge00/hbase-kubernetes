FROM java:8-jre

ADD opentsdb-2.2.0_all.deb .
RUN dpkg -i opentsdb-2.2.0_all.deb
RUN rm ./opentsdb-2.2.0_all.deb

RUN echo "tsd.storage.hbase.zk_quorum = zookeeper-1:2181,zookeeper-2:2181,zookeeper-3:2181" >> /etc/opentsdb/opentsdb.conf
ADD supervisor.conf /etc/supervisor/conf.d/supervisord.conf
ADD hbase-service.sh /opt/hbase-service.sh
ADD opentsdb-service.sh /opt/opentsdb-service.sh

EXPOSE 4242
CMD ["/opt/opentsdb-service.sh"]
