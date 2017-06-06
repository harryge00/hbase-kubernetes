# hdfs-datanode

hdfs datanode in docker

## How to use it

```bash
docker run -e HDFS_NAMENODE_RPC_HOST=$NAMENODEHOST -v /data:/var/hdfs/datanode --net=host --name hdfs-dn -d dataman/hdfs-datanode:2.7.1
```

## Exposed ports

* TCP   50010   dfs.datanode.address            port for data transfer
* TCP   50020   dfs.datanode.ipc.address        ipc server
* TCP   50075   dfs.datanode.http.address       http server
* TCP   50475   dfs.datanode.https.address      https server

## FAQ

Q1: Tab **Overview** is giving me 3 living datanodes on namenode webpage, while tab **Datanodes** is showing 1 living datanode only.Why?

A1. Plz make sure your datanode servers have the different **hostname**
