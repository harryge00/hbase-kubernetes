Fabric8 - ZooKeeper Docker Image
================================

A ZooKeeper Docker Image for use with Kubernetes.

The image supports the following ZooKeeper modes:

* Standalone
* Clustered

# Standalone Mode
To start the image in standalone mode you can simply use:

    docker run fabric8/zookeeper

# Clustered Mode
To start the image in clustered mode you need to specify a couple of environment variables for the container.

| Environment Variable                          | Description                           |
| --------------------------------------------- | --------------------------------------|
| SERVER_ID                                     | The id of the  server                 |
| MAX_SERVERS                                   | The number of servers in the ensemble |


Each container started with both of the above variables will use the following env variable setup:

    server.1=zookeeper-1:2888:3888
    server.2=zookeeper-2:2888:3888
    server.3=zookeeper-3:2888:3888
    ...
    server.N=zookeeper-N:2888:3888

Ensuring that zookeeper-1, zookeeper-2 ... zookeeper-N can be resolved is beyond the scope of this image.
You can use DNS, or Kubernetes services, etc depending on your environment (see below).

## Inside Kubernetes

Inside Kubernetes you can use a pod setup that looks like:

    {
      "kind": "Pod",
      "apiVersion": "v1beta3",
      "metadata": {
        "name": "zookeeper-1",
        "labels": {
          "name": "zookeeper",
          "server-id": "1"
        }
      },
      "spec": {
        "containers": [
          {
            "name": "server",
            "image": "fabric8/zookeeper",
            "env":[
              { "name": "SERVER_ID", "value": "1" },
              { "name": "MAX_SERVERS", "value": "3" }
            ],
            "ports":[
              {
                "containerPort": 2181
              },
              {
                "containerPort": 2888
              },
              {
                "containerPort": 3888
              }
            ]
          }
        ]
      }

In the example above we are creating a pod that creates a container using this image. The container is configured to use the environment variable required for a clustered setup.
Last but not least pod is carefully named (as zookeeper-${SERVER_ID}) so that the other zookeeper servers can easily find it by hostname.