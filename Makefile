PROJECT := default-app
VERSION := $(shell git describe --tags --always --dirty)
PLATFORM := $(if $(PLATFORM),$(PLATFORM),linux/amd64)

all: build

version:
	@echo $(VERSION)

generate: version
	npm run generate

build: generate
	docker build . --tag $(PROJECT):$(VERSION) --platform $(PLATFORM)

run:
	docker run -it -p 8080:80 $(PROJECT):$(VERSION)

export:
	docker save $(PROJECT):$(VERSION) | gzip > $(PROJECT)_$(VERSION).tar.gz
