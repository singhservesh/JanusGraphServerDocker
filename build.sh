set -e;
__tag__and__lable=$1
echo $__tag__and__lable
if [ ! $__tag__and__lable ]; then
      echo "\tDocker target image label and tag is not given.\n\t\tUsage  $0  <label:tag>\n" ; exit 1;
fi 

#Debug flag is given.
set +x;
if [ $2 ]; then
set -x;
fi;

if [ ! -f janusgraph-0.2.2-hadoop2.zip ]; then
    wget https://github.com/JanusGraph/janusgraph/releases/download/v0.2.2/janusgraph-0.2.2-hadoop2.zip 
fi

rm -rf janusgraph-0.2.2-hadoop2
unzip janusgraph-0.2.2-hadoop2.zip >/dev/null
#scripts
cp bin/janusgraph.sh     janusgraph-0.2.2-hadoop2/bin/janusgraph.sh
cp bin/gremlin-server.sh janusgraph-0.2.2-hadoop2/bin/gremlin-server.sh
cp bin/checksocket.sh    janusgraph-0.2.2-hadoop2/bin/checksocket.sh
cp bin/checkconfig.sh    janusgraph-0.2.2-hadoop2/bin/checkconfig.sh
cp bin/cassandra.in.sh   janusgraph-0.2.2-hadoop2/bin/cassandra.in.sh
cp bin/cassandra         janusgraph-0.2.2-hadoop2/bin/cassandra
#docker
cp bin/Dockerfile janusgraph-0.2.2-hadoop2/Dockerfile
#kachara delete
cd janusgraph-0.2.2-hadoop2
rm -rf examples
rm -rf javadocs
rm -rf elasticsearch
rm -rf db/cassandra/data
rm -rf db/cassandra/commitlog
rm -rf db/cassandra/saved_caches
rm -f lib/logback-classic-1.1.2.jar
rm -f bin/gremlin.bat
rm -f bin/gremlin-server.bat


rm -f lib/janusgraph-berkeleyje-0.2.2.jar
rm -f lib/janusgraph-solr-0.2.2.jar
rm -f lib/janusgraph-lucene-0.2.2.jar
rm -f lib/janusgraph-hbase-0.2.2.jar
rm -f lib/janusgraph-bigtable-0.2.2.jar
rm -f lib/janusgraph-es-0.2.2.jar
rm -f lib/scala-compiler-2.10.0.jar
rm -f lib/bigtable-hbase-1.x-shaded-1.0.0.jar
rm -f lib/hbase-shaded-client-1.2.6.jar
rm -f lib/hbase-shaded-server-1.2.6.jar

cat >scripts/init.groovy <<EOF
def globals = [:]
def gc = 0;
def gsize = ConfiguredGraphFactory.getConfigurations().size();

def dpctopologymap = ["storage.backend" : "cql", "storage.hostname" : "127.0.0.1", "graph.graphname" : "dpctopology"];
def found = false;
for(  ;gc < gsize; )
{
   def gname = ConfiguredGraphFactory.getConfigurations()[gc].'graph.graphname'=='dpctopology';
   if ( gname == true ) { found=true; break; }
   gc = gc+1;
}
if( found == false )
{
   ConfiguredGraphFactory.createConfiguration(new MapConfiguration(dpctopologymap));
}
myGraph = ConfiguredGraphFactory.open("dpctopology")
globals << [myGraphTraversal : myGraph.traversal()]

EOF
cd conf/gremlin-server/
cp gremlin-server-configuration.yaml gremlin-server.yaml
sed -i 's/empty-sample.groovy\]\}\}/init.groovy\]},\ngremlin-python: \{\},\ngremlin-jython: \{\}}/g' gremlin-server.yaml
cd ../../
bin/gremlin-server.sh -i org.apache.tinkerpop gremlin-python 3.2.9

sudo docker build -t $1 .
sudo docker images
#sudo docker run -p 8182:8182 --mount source=myvol2,target=/home/janus/db myjanus:2
#sudo docker run -i myjanus:2 /bin/sh
echo "\n********* Generated image $__tag__and__lable **************\n"
