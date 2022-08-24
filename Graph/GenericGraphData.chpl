module GenericGraphData {
  use List;
  enum RuntimeType {I, R, S};
  
  class GenericNode {
    var runtimeType: RuntimeType;
    proc init(type t) {
      if t == int then
        runtimeType = RuntimeType.I;
      if t == real then
        runtimeType = RuntimeType.R;
      if t == string then
        runtimeType = RuntimeType.S;
    }

    proc toValue(type t) {
      return try! this: borrowed ConcreteNode(t);
    }
  }

  class ConcreteNode: GenericNode {
    type t;
    var v: t;
    proc init(val: ?ty) {
      super.init(ty);
      t = ty;
      v = val;
    }
  }

  class GenericList {
    type etype;
    forwarding var l: list(etype);
  }
  
  class GenericGraph {
    var edges: owned GenericList((shared GenericNode,
                                  shared GenericNode,
                                  string));

    proc init() {
      edges = new GenericList((shared GenericNode,
                               shared GenericNode,
                               string));
    }

    proc addEdge(in node1: GenericNode,
                 in node2: GenericNode,
                 name: string) {
      edges.append((node1, node2, name));
    }

    proc toDot() {
      for edge in edges {
        select (edge[0].runtimeType) {
          when (RuntimeType.I) {
            select (edge[1].runtimeType) {
              when (RuntimeType.I) {
                writeln(edge[0].toValue(int).v,
                        " --", edge[2], "-> ",
                        edge[1].toValue(int).v);
              }
              when (RuntimeType.R) {
                writeln(edge[0].toValue(int).v,
                        " --", edge[2], "-> ",
                        edge[1].toValue(real).v);
              }
              when (RuntimeType.S) {
                writeln(edge[0].toValue(int).v,
                        " --", edge[2], "-> ",
                        edge[1].toValue(string).v);
              }
            }
          }
          when (RuntimeType.R) {
            select (edge[1].runtimeType) {
              when (RuntimeType.I) {
                writeln(edge[0].toValue(real).v,
                        " --", edge[2], "-> ",
                        edge[1].toValue(int).v);
              }
              when (RuntimeType.R) {
                writeln(edge[0].toValue(real).v,
                        " --", edge[2], "-> ",
                        edge[1].toValue(real).v);
              }
              when (RuntimeType.S) {
                writeln(edge[0].toValue(real).v,
                        " --", edge[2], "-> ",
                        edge[1].toValue(string).v);
              }
            }
          }
          when (RuntimeType.S) {
            select (edge[1].runtimeType) {
              when (RuntimeType.I) {
                writeln(edge[0].toValue(string).v,
                        " --", edge[2], "-> ",
                        edge[1].toValue(int).v);
              }
              when (RuntimeType.R) {
                writeln(edge[0].toValue(string).v,
                        " --", edge[2], "-> ",
                        edge[1].toValue(real).v);
              }
              when (RuntimeType.S) {
                writeln(edge[0].toValue(string).v,
                        " --", edge[2], "-> ",
                        edge[1].toValue(string).v);
              }
            }
          }
        }
      }
    }
  }
}