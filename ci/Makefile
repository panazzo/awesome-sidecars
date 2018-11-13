BUILDIMAGES   := $(wildcard ../src/*/Dockerfile)
PUSHIMAGES   := $(wildcard ../src/*/)
REGISTRY := panazzo

.PHONY: build $(BUILDIMAGES) push $(PUSHIMAGES)

$(BUILDIMAGES):
	./docker_build \
		$(REGISTRY)/$(notdir $(patsubst %/,%,$(dir $@))) \
		$(dir $@)

build: $(BUILDIMAGES)

$(PUSHIMAGES):
	./docker_push $(REGISTRY)/$(notdir $(patsubst %/,%,$(dir $@)))

push: $(PUSHIMAGES)