# cs536

My work completed for this class is published here.

## Course Description

Introduction to the theory and practice of compiler design. Comparison of features of several programming languages and their implications for implementation techniques. Several programming projects required. 

## Topics

### Basic ideas of scanning and parsing

*   including, e.g., writing finite-state machines and/or regular expressions for tokens, writing a CFG for a language, properties of different parsing algorithms.
*   You don't need to know the intricacy of each algorithm and you will NOT be asked to run a parsing algorithm on some example. However, you might be asked questions like: "Is LL(1) more efficient than CYK?"

### Semantic analysis and scoping

*   identifying multiply declared names
*   matching variable uses to corresponding declarations
*   static vs dynamic scoping

### Type Checking

*   type checking Moo constructs
*   extensions to handle new constructs
*   different approaches to types (e.g., static vs dynamic typing)

### Runtime Storage Management

*   general storage layout (stack, heap, static data area)

*   activation records
    *   what is in an activation record and why
    *   manipulation of activation records on:
        *   method call
        *   method entry
        *   method return

*   access to variables at runtime
    *   for parameters, locals, globals
    *   access links and displays to access non-local variables at runtime for languages with nested subprograms
    *   static vs dynamic scoping

both implementation point of view and understanding tradeoffs

### Parameter-Passing Modes

*   call-by-value
*   call-by-reference
*   call-by-value-result
*   call-by-name
*   lazy evaluation

both from a language-design point of view, a programmer's point of view, and a compiler-writer's point of view

### Code Generation

*   generating code for Moo constructs
*   extensions to handle new constructs

### Optimization

*   goals (safety and profitability)
*   peephole optimization
*   copy propagation
*   loop optimizations
    *   moving loop-invariant computations out of the loop
    *   strength reduction in <tt>for</tt> loops
*   control-flow graphs
*   dataflow analysis by successive approximation
*   points-to analysis

### Special topics

*   Basic understanding questions of what were the problems solved in the special topic