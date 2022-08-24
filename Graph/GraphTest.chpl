module GraphTest {
  use GraphData;
  proc test1() {
    writeln("\n Shared Graph: \n");
    var g = new SharedGraph();

    var node1 = new shared GraphNode("node1");
    var node2 = new shared GraphNode("node2");
    
    g.addEdge(node1, node2, "edge1");
    g.addEdge(node2, node1, "edge2");
    g.toDot();
  }

  use GenericGraphData;
  proc testGeneric() {
    writeln("\n Generic Graph: \n");
    
    var g = new GenericGraph();
    
    var node1 = new shared ConcreteNode(5);
    var node2 = new shared ConcreteNode("String Node");
    
    g.addEdge(node1, node2, "edge1");
    g.addEdge(node2, node1, "edge2");
    g.toDot();
  }

  use UnmanagedGraphData;
  proc testUnmanaged() {
    writeln("\n Unmanaged Graph: \n");
    
    var g = new UnmanagedGraph();

    var id1 = g.addNode("node1");
    var id2 = g.addNode("node2");

    g.addEdge(id1, id2, "edge1");
    g.addEdge(id2, id1, "edge1");
    g.toDot();
  }
  
  proc main() {
    test1();
    testGeneric();
    testUnmanaged();
  }
}