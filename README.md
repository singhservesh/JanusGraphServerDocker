# JanusGraphServerDocker
This is a Docker for JanusGraph running under Gremlin Server.
Please make sure that :
1) docker is installed
2) gremlin-pythong 3.2.9 is installed.
3) Python is installed 



--Usage--

to create a docker image use:
make 

to run docker image use:
make run

to run docker image in attached mode use:
make attach

to delete an existing image use:
make delete

to run test script/example use:
make test

To list all the images and containers use:
make show

If GNU make utility is not insall , one can try:
./build.sh script directory to create an docker image
