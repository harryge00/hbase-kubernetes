# hbase-kubernetes

Distributed hbase based on hdfs above kubernetes with 2 masters and 2 regionservers.

- hadoop: hadoop cluster running on kubernetes with high avaiability: 2 namenodes/3 journalnodes/2 datanodes
- zookeeper: a 3-node zookeeper cluster running on kubernetes. 
- opentsdb: run on hbase

## How to run

Download hbase from `https://archive.apache.org/dist/hbase/1.2.3/hbase-1.2.3-bin.tar.gz` and copy it into hbase-image
```
# cd hbase-image
# IMAGE_BASE_URL=cargo.caicloudprivatetest.com/caicloud IMAGE_TAG=lastest make
# cd ..
# kubectl create -f hmaster.yaml
# kubectl create -f region.yaml
```

Feel free to file a issue