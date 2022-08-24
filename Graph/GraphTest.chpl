module GraphTest {
  use GraphData;
  proc test1() {
    var g = new SharedGraph();

    var node1 = new shared GraphNode("node1");
    var node2 = new shared GraphNode("node2");
    
    g.addEdge(node1, node2, "edge1");
    g.addEdge(node2, node1, "edge2");
    g.toDot();
  }

  use GenericGraphData;
  proc testGeneric() {
    var g = new GenericGraph();
    
    var node1 = new shared ConcreteNode(5);
    var node2 = new shared ConcreteNode("String Node");
    
    g.addEdge(node1, node2, "edge1");
    g.addEdge(node2, node1, "edge2");
    g.toDot();
  }
  
  proc main() {
    test1();
    testGeneric();
  }
}