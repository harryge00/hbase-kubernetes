all: push

NAME=$(IMAGE_BASE_URL)/zookeeper

build: 
	docker build -t $(NAME):$(IMAGE_TAG) .

push: build
	docker push $(NAME):$(IMAGE_TAG)
