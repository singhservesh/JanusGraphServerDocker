FROM anapsix/alpine-java:8
#FROM anapsix/alpine-java:8_jdk
#FROM openjdk:8-jdk-alpine
WORKDIR /home/janus
COPY . /home/janus
CMD ["sh", "./bin/janusgraph.sh", "start"]
