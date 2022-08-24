module GraphData {
  use List;
  class Graph {
    var edges: list((shared GraphNode, shared GraphNode, string));
  }

  class GraphNode {
    var val: string;
  }
}