set -x
if [ -f janusgraph-0.2.2-hadoop2/bin/janusgraph.sh ]; then
    cd janusgraph-0.2.2-hadoop2/; bin/janusgraph.sh stop; cd ..
fi
rm -rf janusgraph-0.2.2-hadoop2
unzip janusgraph-0.2.2-hadoop2.zip
cd janusgraph-0.2.2-hadoop2
rm -rf db/cassandra/data
rm -rf db/cassandra/commitlog
rm -rf db/cassandra/saved_caches
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



