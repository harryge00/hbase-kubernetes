# hbase-kubernetes

Distributed hbase based on hdfs above kubernetes with 2 masters and 2 regionservers.

- hadoop: hadoop cluster running on kubernetes with high avaiability: 2 namenodes/3 journalnodes/2 datanodes
- zookeeper: a 3-node zookeeper cluster running on kubernetes. 
- opentsdb: run on hbase

## How to run

Download hbase from `https://archive.apache.org/dist/hbase/1.2.3/hbase-1.2.3-bin.tar.gz` and copy it into hbase-image
```
# docker build -t index.caicloud.io/caicloud/hbase:sohu .
# kubectl create -f hbase.yaml
```
