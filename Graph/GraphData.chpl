module GraphData {
  use List;
  class Graph {
    var edges: list((shared GraphNode,
                     shared GraphNode,
                     string));
    proc addEdge(node1: shared GraphNode,
                 node2: shared GraphNode,
                 edgeName: string) {
      edges.append((node1, node2, edgeName));
    }

    proc toDot() {
      for edge in edges do
        writeln(edge[0].val, " -> ", edge[1].val);
    }
  }

  class GraphNode {
    var val: string;
  }
}