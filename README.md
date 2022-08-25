# Class Hackathon

## What I worked on:

- Implemented a basic graph data structure using a list of shared nodes
  - This was very simple, using a list allowed me to avoid needing to resize anything myself
- Implemented a basic graph data structure using a list of unmanaged nodes
  - The approach I took here of using a list made the cleanup of the data very easy, since I could just free the nodes in the list, so the data cycles from the edges didn't really come in
  - Thinking more, I realized the difficulty would come from just treating it more linked-list like, where there isn't one central list of the nodes, but rather a chain of nodes that could be cycling, etc.
  - I did not have time to look into this more due to some Arkouda issues
- Implemented a "generic" graph, that allows nodes to simultaneously be of type `real`, `int`, or `string`
  - Motivated by Arkouda (this is how the symbol table is setup, with runtime types that cast to values)
  - Creating nodes that can have both types can be confusing, though, this is not really a problem with our classes, more just our types

## General Notes

Edit: Updated the first note after understanding a bit better
1. Implicit coercions are confusing
  - see `ImplicitCoercion.chpl` in this repo for example
  - when passing around child classes, I am getting some confusing messages that have to do with coercion and it is fixed by using `in` intents, though nothing in the error message indicated that would be helpful
  - `in` intents are confusing to me and I don't have any idea why it fixed this case, but I've learned that it does
2. Generic memory management on arguments can result in some unhelpful error messages
  - when the arguments don't have a memory management strategy specified, I would expect all passes of class instances to work on that funciton, but it often doesn't and the error message doesn't help
  - I don't have an exmaple offhand, but this is something that I've struggled with a couple of times
  - I think the Arkouda-style genericity makes this more difficult, when you are having to keep a `GenericValue` and a `ConcreteValue` class and then cast between them, the memory management casting can become tricky