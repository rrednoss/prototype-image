.DEFAULT_GOAL := build

fmt:
	go fmt ./...
.PHONY:fmt

lint: fmt
	golint ./...
.PHONY:lint

vet: fmt
	go vet ./...
	shadow ./...
.PHONY:vet

build: vet
	docker build -t rrednoss/prototype-image:2.0.0 .
.PHONY:build

deploy: build
	docker push rrednoss/prototype-image:2.0.0
.PHONY: deploy

