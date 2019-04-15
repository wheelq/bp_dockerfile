all: help

build:
	@echo "Building docker container..."
	@./docker-build.sh

clean:
	@echo "Removing unused docker containers..."
	@./docker-clean.sh

clean-all: clean
	@echo "Removing image..."
	@docker rmi myimage

interactive:
	@docker run --rm -it --entrypoint /bin/bash wheelq/myimage

install-stub:
	@echo "installing wheelq_myimage-docker to /usr/local/bin"
	@cp ./bin/wheelq_myimage-docker /usr/local/bin

help:
	@echo "the help menu"
	@echo "  make build"
	@echo "  make clean"
	@echo "  make clean-all"
	@echo "  make help"
	@echo "  make install-stub"
	@echo "  make interactive"

.PHONY: build clean
