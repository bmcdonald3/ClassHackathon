module UnmanagedGraphData {
  use List;
  class UnmanagedGraph {
    var nodes: list(unmanaged Node);
    var edges: list((unmanaged Node, unmanaged Node, string));

    proc init() {
      nodes = new list(unmanaged Node);
      edges = new list((unmanaged Node, unmanaged Node, string));
    }

    proc deinit() {
      forall node in nodes {
        delete node;
      }
    }
  
    class Node {
      var val: string;

      proc init(in v) {
        val = v;
      }
    }

    // Add a node to the nodes list, return the list index
    proc addNode(val: string) {
      return nodes.append(new unmanaged Node(val));
    }

    proc addEdge(id1: int, id2: int, edgeName: string) {
      edges.append((nodes[id1], nodes[id2], edgeName));
    }

    proc toDot() {
      for edge in edges do
        writeln(edge[0].val, " --",
                edge[2], "-> ",
                edge[1].val);
    }
  }
}