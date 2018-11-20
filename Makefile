all:
	sh build.sh
test:
	python examples/test-gremlin-python.py
stop:
	sudo docker container  ps | grep "myjanus:2"  | cut -c1-15 | xargs sudo docker container stop
run:
	sudo docker run -p 8182:8182 --mount source=myvol2,target=/home/janus/db myjanus:2

