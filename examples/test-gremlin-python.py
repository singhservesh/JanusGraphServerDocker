from gremlin_python import statics
from gremlin_python.structure.graph import Graph
from gremlin_python.process.graph_traversal import __
from gremlin_python.process.strategies import *
from gremlin_python.driver.driver_remote_connection import DriverRemoteConnection
statics.load_statics(globals());

names = ["River","Zane","Mark","Brooks","Nicolas","Paxton","Judah","Emiliano","Kaden","Bryan","Kyle","Myles","Peter","Charlie","Kyrie","Thiago","Brian","Kenneth","Andres","Lukas","Aidan","Jax","Caden","Milo","Paul","Beckett","Brady","Colin","Omar","Bradley","Javier","Knox","Jaden","Barrett","Israel","Matias","Jorge","Zander","Derek","Josue","Cayden","Holden","Griffin","Arthur","Leon","Felix","Remington","Jake","Killian","Clayton","Sean","Adriel","Riley","Archer","Legend","Erick","Enzo","Corbin","Francisco","Dallas","Emilio","Gunner","Simon","Andre","Walter","Damien","Chance","Phoenix","Colt","Tanner","Stephen","Kameron","Tobias","Manuel","Amari","Emerson","Louis","Cody","Finley","Iker","Martin","Rafael","Nash","Beckham","Cash","Karson","Rylan","Reid","Theo","Ace","Eduardo","Spencer","Raymond","Maximiliano","Anderson","Ronan","Lane","Cristian","Titus","Travis","Jett","Ricardo","Bodhi","Gideon","Jaiden","Fernando","Mario","Conor","Keegan","Ali","Cesar","Ellis","Jayceon","Walker","Cohen","Arlo","Hector","Dante","Kyler","Garrett","Donovan","Seth","Jeffrey","Tyson","Jase","Desmond","Caiden","Gage","Atlas","Major","Devin","Edwin","Angelo","Orion","Conner","Julius","Marco","Jensen","Daxton","Peyton","Zayn","Collin","Jaylen","Dakota","Prince","Johnny","Kayson","Cruz","Hendrix","Atticus","Troy","Kane","Edgar","Sergio","Kash","Marshall","Johnathan","Romeo","Shane","Warren","Joaquin","Wade","Leonel","Trevor","Dominick","Muhammad","Erik","Odin","Quinn","Jaxton","Dalton","Nehemiah","Frank","Grady","Gregory","Andy","Solomon","Malik","Rory","Clark","Reed","Harvey","Zayne","Jay","Jared","Noel","Shawn","Fabian","Ibrahim","Adonis","Ismael","Pedro","Leland","Malakai","Malcolm","Alexis","Kason","Porter","Sullivan","Raiden"];
graph = Graph()
remote_connection = DriverRemoteConnection('ws://localhost:8182/gremlin','myGraphTraversal');
g = graph.traversal().withRemote(remote_connection);
print(graph);
print (g.V().repeat(out()).times(2).name);
print(g);

count = g.V().hasLabel('passenger').count().next()%len(names);
print "Add one more passenger named " +  names[count] ;
g.addV('passenger').property('name', names[count]).next();

print "Add one  more airports";
g.addV('airport').property('name', names[count][1:4].upper()).property('country','IND').next();

print "Total vertex i.e. airports and passengers";
print(g.V().count().next());

print "Total passenger count ";
print(g.V().hasLabel('passenger').count().next());

print "All passengers ";
print(g.V().hasLabel('passenger').properties().toList());

print "Total airport count\n";
print(g.V().hasLabel('airport').count().next());

print "All airports\n";
print(g.V().hasLabel('airport').properties().toList());
