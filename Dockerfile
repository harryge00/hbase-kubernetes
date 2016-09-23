FROM centos:6.6

RUN yum install -y java-1.7.0-openjdk-devel.x86_64
ENV JAVA_HOME=/usr/lib/jvm/jre

RUN yum install -y nc \
    && yum install -y tar \
    && mkdir /hbase-setup

WORKDIR /hbase-setup

COPY ./hbase-1.2.3-bin.tar.gz /hbase-setup/hbase-1.2.3-bin.tar.gz
RUN tar zxf hbase-1.2.3-bin.tar.gz -C /opt/ \
    && ln -s /opt/hbase-1.2.3 /opt/hbase

ADD hbase-site.xml /opt/hbase/conf/hbase-site.xml
ADD start-k8s-hbase.sh /opt/hbase/bin/start-k8s-hbase.sh
RUN chmod +x /opt/hbase/bin/start-k8s-hbase.sh

WORKDIR /opt/hbase/bin

ENV PATH=$PATH:/opt/hbase/bin

CMD /opt/hbase/bin/start-k8s-hbase.sh
