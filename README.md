# JanusGraphServerDocker

This is a Docker image for JanusGraph running under Gremlin Server with cassandra as backend store.
JanusGraph server can work with gremlin.sh client and any other customized gremlin client. This also works with gremlin-python.
This Janusgraph and Cassandra version is taken from janus-0.2.2-hadoop2.
For python clients, use gremlin-python 3.2.9 drivers. One can write his own drivers also.

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

If GNU Make utility is not insall , one can try:
./build.sh script directory to create an docker image
```


### Installing

A step by step series of examples that tell you how to get a development env running

Say what the step will be

```
Give the example
```

And repeat

```
until finished
```

End with an example of getting some data out of the system or using it for a little demo

## Running the tests

Explain how to run the automated tests for this system

### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Dropasdfasdfwizard](http://www.dasdfasdfasdfropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROasdfasdfME](https://rometools.github.io/asdfasdfrome/) - Used to generate RSS Feeds

## Contributing

Please read [CONTRIBadsfasdfUTING.md](https://gist.github.com/singhservesh/b2asdfasdf46794029asdf57c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemiasdfasdfVer](http://seasdfmasdfasdfver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Servesh Singh** - *Initial work* - [Servesh Singh](https://github.com/singhservesh)

See also the list of [contributors](https://github.com/singhservesh/JanusGraphServerDocker/contributors) who participated in this project.

## License

This project is licensed under the GNU GENERAL PUBLIC license - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* fbpoc team, Mahidhar Ramesh Rajala, et.al.
* Inspiration
* etc
