IMAGE_LABEL := my-janus-python-graphdb
IMAGE_TAG := 2
IMAGE_ID := $(IMAGE_LABEL):$(IMAGE_TAG)
IMAGE_VOLUME := $(IMAGE_LABEL)-$(IMAGE_TAG)-volume
CONTAINER_NAME:= $(IMAGE_LABEL)-container

all:stop
	sh build.sh $(IMAGE_ID)  $(DEBUG_FLAG_EXPORTED)
test:
	echo $(IMAGE_ID)
	python examples/test-gremlin-python.py
stop:
	@set -e;
	@exitcode=1;\
	sudo docker container  ps | grep "$(IMAGE_ID)" ; exitcode=$$?;\
	if [ $$exitcode -eq 0 ]; then \
	     sudo docker container  ps | grep "$(IMAGE_ID)" | cut -c1-15 | xargs sudo docker container stop; \
	fi;\
	exitcode=1; sudo docker container inspect $(CONTAINER_NAME) >>/dev/null 2>>1; exitcode=$$?;\
	if [ $$exitcode -eq 0 ]; then \
	    sudo docker rm $(CONTAINER_NAME);\
	fi
attach:stop
	sudo docker run -p 8182:8182 --mount source=$(IMAGE_VOLUME),target=/home/janus/db --name=$(CONTAINER_NAME) $(IMAGE_ID)
run:stop
	sudo docker run -d -p 8182:8182 --mount source=$(IMAGE_VOLUME),target=/home/janus/db  --name=$(CONTAINER_NAME) $(IMAGE_ID)

delete:
	@exitcode=1;\
        sudo docker volume inspect $(IMAGE_VOLUME)>>/dev/null 2>>1; exitcode=$$?;\
	if [ $$exitcode -eq 0 ]; then \
	sudo docker volume rm $(IMAGE_VOLUME);\
	echo Deleted image volume $(IMAGE_VOLUME);\
	fi;\
	exitcode=1;\
	sudo docker image inspect $(IMAGE_ID)>>/dev/null 2>>1; exitcode=$$?;\
	if [ $$exitcode -eq 0 ]; then \
	sudo docker image rm  $(IMAGE_ID);\
	echo Deleted image $(IMAGE_ID);\
	fi;\
	exit 0;

show:
	@echo '\n------------------------------------------------- containers -----------------------------------\n';\
	exitcode=1; sudo docker container inspect $(CONTAINER_NAME)>>/dev/null 2>>1;  exitcode=$$?;\
	if [ $$exitcode -eq 0 ]; then \
	    sudo docker container inspect $(CONTAINER_NAME);\
	fi;\
	sudo docker container ls; \
	echo '\n------------------------------------------------- images ---------------------------------------\n';\
	sudo docker images;
