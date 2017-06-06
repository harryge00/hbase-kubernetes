## k8s-hadoop ##

- hadoop-base: hadoop base image 
- hadoop-namenode: nn based on hadoop-base
- hadoop-datanode: dn based on hadoop-base
- hadoop-journalnode: jn based on hadoop-base
- yarn: why shoud we use it?
- yaml：yamls for creating k8s-hadoop cluster

## Building Image

```
IMAGE_BASE_URL=your_base_url IMAGE_TAG=latest make
```

## Run hadoop
```
kubectl create -f ../zookeeper/zookeeper.yaml
kubectl create -f yaml/journalnode.yaml
# Wait until journal node is ready
kubectl create -f yaml/namenode0.yaml
kubectl create -f yaml/namenode1.yaml
# Wait until namenodes are ready
kubectl create -f yaml/datanode.yaml
```
