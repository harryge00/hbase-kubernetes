all: push clean

IMAGE_NAME=${IMAGE_BASE_URL}/hbase

addconf:
	cp -rf ../hadoop/conf/*.xml .

build: addconf
	docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .

push: build
	docker push $(IMAGE_NAME):$(IMAGE_TAG)

clean:
	rm core-site.xml hdfs-site.xml yarn-site.xml
