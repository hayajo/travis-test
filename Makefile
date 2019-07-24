APP_NAME ?= test-app
BUILD_DIR ?= build

.PHONY: all
all: clean test build

.PHONY: clean
clean:
	rm -rf build/
	go clean

.PHONY: test
test:
	go test -v -short ./...

.PHONY: build
build:
	docker run --rm -v $(PWD):/workspace -w /workspace golang go build -o $(BUILD_DIR)/$(APP_NAME) .
