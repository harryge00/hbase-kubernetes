FROM jboss/base-jdk:7

MAINTAINER iocanel@gmail.com

USER root

ENV ZOOKEEPER_VERSION 3.4.9
EXPOSE 2181 2888 3888

RUN yum -y install wget bind-utils && yum clean all \
    && wget -q -O - http://apache.mirrors.pair.com/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/zookeeper-${ZOOKEEPER_VERSION}.tar.gz | tar -xzf - -C /opt \
    && mv /opt/zookeeper-${ZOOKEEPER_VERSION} /opt/zookeeper \
    && cp /opt/zookeeper/conf/zoo_sample.cfg /opt/zookeeper/conf/zoo.cfg \
    && mkdir -p /opt/zookeeper/{data,log}

WORKDIR /opt/zookeeper
VOLUME ["/opt/zookeeper/conf", "/opt/zookeeper/data", "/opt/zookeeper/log"]

COPY config-and-run.sh ./bin/
COPY zoo.cfg ./conf/

CMD ["/opt/zookeeper/bin/config-and-run.sh"]
