module GraphTest {
  use GraphData;
  proc test1() {
    var g = new owned Graph();

    var node1 = new shared GraphNode("node1");
    var node2 = new shared GraphNode("node2");
    
    g.addEdge(node1, node2, "edge1");
    g.addEdge(node2, node1, "edge2");
    g.toDot();
  }
  
  proc main() {
    test1();
  }
}