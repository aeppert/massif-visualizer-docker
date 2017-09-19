
all: container

.PHONY: container
container:
	docker build -t aeppert/massif-visualizer .
