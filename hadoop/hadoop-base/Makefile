all: push

IMAGE_NAME=${IMAGE_BASE_URL}/hadoop-base

build:
	docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .

push: build
	docker push $(IMAGE_NAME):$(IMAGE_TAG)
