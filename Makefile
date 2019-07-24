APP_NAME ?= test-app
BUILD_DIR ?= build

.PHONY: all
all: clean test build

.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)
	go clean

.PHONY: test
test:
	go test -v -short ./...

.PHONY: build
build:
	# docker run --rm -v $(PWD):/workspace -w /workspace golang go build -o $(BUILD_DIR)/$(APP_NAME) .
	# docker run --rm -v $(PWD):/workspace -w /workspace hayajo/golang go build -o $(BUILD_DIR)/$(APP_NAME) .
	docker run --rm -v $(PWD):/workspace -w /workspace golang go build -o $(BUILD_DIR)/$(APP_NAME) .
	docker run --rm -v $(PWD):/workspace -w /workspace golang chown $(shell id -u):$(shell id -g) -R $(BUILD_DIR)
