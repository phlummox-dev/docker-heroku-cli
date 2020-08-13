
IMG=phlummox/heroku-cli:0.1

docker-build:
	docker build -t $(IMG) .

docker-sh:
	docker -D run --rm -it \
		-v $$PWD:/opt/work \
		--name heroku-cli \
		--workdir /opt/work \
	$(IMG) sh


