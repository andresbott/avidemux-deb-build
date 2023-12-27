
default: help

MAINTAINER := Andres Bott
MAIL := contact@andresbott.com
WEB := https://github.com/andresbott
AVIDEMUX_VERSION := "2.8.1" # needs to match the tag https://github.com/mean00/avidemux2
BUILD := "1"
NV_CODEC_HEADERS := "n11.1.5.3" # cuda headers https://git.videolan.org/?p=ffmpeg/nv-codec-headers.git;a=tags


.PHONY: package
package: build ## generate the debian package
	@echo "pacakging avidemux"
	@docker build \
		--build-arg="MAINTAINER=$(MAINTAINER)" \
		--build-arg="MAIL=$(MAIL)" \
		--build-arg="WEB=$(WEB)" \
		--build-arg="AVIDEMUX_VERSION=$(AVIDEMUX_VERSION)-$(BUILD)" \
		./package -t avidemux-package
	@./package/copy.sh

.PHONY: build
build: base ## build the installable debian packages
	@echo "building avidemux"
	@docker build ./build
		--build-arg="AVIDEMUX_TAG=$(AVIDEMUX_VERSION)" \
		--build-arg="NV_CODEC_HEADERS=$(NV_CODEC_HEADERS)" \
		-t avidemux-builder
	@#./build/copy.sh

base: ## build the base image
	@echo "building docker base image"
	@docker build ./base-img -t avidemux-build-base

clean: ## delete docker images and folders created during build

help: ## Show this help
	@egrep '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST)  | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m·%-20s\033[0m %s\n", $$1, $$2}'