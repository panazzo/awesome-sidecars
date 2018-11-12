IMAGES 	 := $(wildcard ../src/*/Dockerfile)
REGISTRY := panazzo

.PHONY: build push

build: $(IMAGES)
	./docker_build \
		$(REGISTRY)/$(notdir $(patsubst %/,%,$(dir $<))) \
		$(dir $<)

push: $(IMAGES)
	./docker_push $(REGISTRY)/$(notdir $(patsubst %/,%,$(dir $<)))