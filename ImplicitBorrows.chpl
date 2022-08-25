/*
  Error message:
  ImplicitBorrows.chpl:34: error: in call to 'myFunc', cannot pass result of coercion by reference
  ImplicitBorrows.chpl:34: note: implicit coercion from 'shared Child(int(64))' to 'shared Parent'
  ImplicitBorrows.chpl:29: note: when passing to 'const ref' intent formal 'c'
*/

class Parent {
  var rT: string;
  proc init(type eltType) {
    if eltType == string then
      rT = "string";
    else if eltType == int then
      rT = "int";
  }
}

class Child: Parent {
  type eltType;
  var val: eltType;
  proc init(v) {
    super.init(v.type);
    eltType = v.type;
    val = v;
  }
}

// Fixed by changing this to be an `in` intent
proc myFunc(c: Parent) {
  writeln(c);
}

var c = new shared Child(5);
myFunc(c);
