# hdfs-namenode

hdfs namenode in docker

## How to use it

```bash
docker run -v /data:/var/hdfs/namenode -d --name hdfs-nn -p 8020:8020 -p 50070:50070 dataman/hdfs-namenode:2.7.1
```

## Exposed ports

* TCP   8020    fs.defaultFS                    IPC: ClientProtocol
* TCP   50070   dfs.namenode.http-address       HTTP connector
* TCP   50470   dfs.namenode.https-address      HTTPS connector
