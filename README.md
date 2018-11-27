# JanusGraphServerDocker

This is Docker image for Janus Graph running under Gremlin Server with Cassandra as backend store. Cassandra and JanusGraph will use CQL only. 
JanusGraph server can work with gremlin.sh client and any other customized gremlin client. This also works with gremlin-python. 
The Janusgraph and Cassandra are taken from janusgraph-0.2.2-hadoop2. For python clients, use gremlin-python 3.2.9 drivers. One can write his own drivers also.


## Getting Started

Follow the steps and prerequisites to start the janus graph server with cassandra cql. 
Use examples to write gremlin queries using gremlin-python drivers.

### Prerequisites
Please make sure that :
```
1) docker is installed
2) gremlin-pythong 3.2.9 is installed.
3) Python is installed 
4) GNU Make( optional )

```

--Usage--

To create a docker image use:
```
make 
```

to run docker image use:
```
make run
```

to run docker image in attached mode use:
```
make attach
```

to delete an existing image use:
```
make delete
```

to run test script/example use:
```
make test
```

To list all the images and containers use:
```
make show
```

If GNU Make utility is not installed then docker image can be created by running build.sh script:
```
./build.sh
```


### Installing

A step by step series of examples that tell you how to get a development env running

Say what the step will be

```
Clone source code using HTTPS:
git clone https://github.com/singhservesh/JanusGraphServerDocker.git
OR using SSH:
git clone git@github.com:singhservesh/JanusGraphServerDocker.git

```

And repeat

```
cd JanusGraphServerDocker/
```

Try below commands one by one.
```
make
make run
```

## Running the tests

```
make test

    graphtraversalsource[graph[empty]]
    Add one more passenger named Zane
    Add one  more airports
    Total vertex i.e. airports and passengers
    4
    Total passenger count
    2
    All passengers
    [vp[name->River], vp[name->Zane]]
    Total airport count

    2
    All airports
    [vp[name->IVE], vp[country->IND], vp[name->ANE], vp[country->IND]]
```


### Break down into end to end tests

make test will run test-gremlin-python.py script and add vertices and then it will print it.

```
make test 
or 
python examples/test-gremlin-python.py
```

### And coding style tests

nill

```
nill
```

## Deployment

This was tested on Ubuntu 16.04 LTS.

## Built With

* [NA](http://www.NA.NANANANAN/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [root](https://github.com/singhservesh/) - Used to generate .....

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/singhservesh/b2asdfasdf46794029asdf57c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [Pending](http://WorkInProgress.Infn.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/singhservesh/JanusGraph/tags). 

## Authors

* **Servesh Singh** - *Initial work* - [Servesh Singh](https://github.com/singhservesh)

See also the list of [contributors](https://github.com/singhservesh/JanusGraphServerDocker/contributors) who participated in this project.

## License

This project is licensed under the GNU GENERAL PUBLIC license - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* fbpoc team, Mahidhar Ramesh Rajala, et.al.
* Inspiration
* etc
