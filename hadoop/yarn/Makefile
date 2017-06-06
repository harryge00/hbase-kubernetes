all: push clean

NAME=${IMAGE_BASE_URL}/yarn
addconf:
	cp -rf ../conf .

build: addconf
	docker build -t $(NAME):$(IMAGE_TAG) .

push: build
	docker push $(NAME):$(IMAGE_TAG)

clean: addconf
	rm -rf conf
