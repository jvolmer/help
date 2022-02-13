# Functional architecture by Mark Seemann at NDC Conferences 2016 - https://youtu.be/US8QG9I1XW0
functional programming results in clean architecture by design
* pure functions (without side-effects) can only call pure functions 
* side-effects are only important for outer rings like IO and database - boundaries between domain and interfaces are defined by pure vs impure functions
* OO: there are entities (business objects) and values (carriers of data), in DDD (Eric Evans): business logic changes faster, so don't put logic in here but in services -> anaemic domain model and difficult to keep track of - seperate data from behavior; FP: data and functions, module as collection of functions, module is basically a service -> maintainable code base
* pure function is intrinsically testable (is isolated) - unit test: test a unit in isolation from its dependencies; OO: encapsulation and isolation is difficult to achieve both, test-induced damage like a lot of boiler-plate code to achieve isolation (like constructors with all input variables)

# OOP v̶s̶ and FP by Mario Fusco - https://www.youtube.com/watch?v=p6cZO5V2ehw
* polymorphism is THE thing that truly differentiates OO programs from non-OO ones, polymorphism dose NOT create a source code dependency from the caller to the callee
* biggest OO advantage is decomposition: OOP breaks programs down into classes that give behaviour to some kind of data; FP breaks programs down into functions that perform some operations over its arguements
* composition: FP: f(g(x)), OOP: inheritance or association (often implemented with dependency injection)
* biggest FP advantage: immutability: thread-safety, parallelizability, caching, correctness, consistency, better encapsulation: OOP makes code understandable by encapsulating moving parts; FP makes code understandable by minimizing moving parts, but this is only for historical reasons, nothing mandates that OOP implies mutability
* big FP plus: referential transparency means no side-effects
* error management: throwing exceptions is a side effect, use optional for empty result, execeptions should be used only for non-recoverable errors
* OOP : FP = Imperative : Declarative

Polymorphism - Funcional decomposition
Mutable - Immutable
Exceptions - Opional / Validation
Imperative - Declarative
Stateful - Stateless
Threads - Futures: no shared state
Statements - Expressions, e.g. isTrue ? doThis() : doThat() vs if (isTrue) result = doThis() else result = doThat
Iteration - Recursion: iterative is much more readable and can be faster

* FP for calculation parts, OOP for stateful and architectual parts (coordination) or vice versa? FP to orchestrate and combine small componenent(objects) in a functional way
* 85% foncional languarge purity is good enough

* OOP models data (noun-based), FP processes them (action/verb-based), good software is written in both styles
* clearly delineate with parts of your code are purely functional (e.g. because they need to run in parallel) and which are not (for efficiency or readability)
* poly-paradigm programming is more generic, powerful and effective than polyglot programming
* if you come from OOP, study FP, if you come from FP, study OOP, use both
* be pragmatic

# Functional Principles for Object Oriented Development by Jessica Kerr - https://www.youtube.com/watch?v=pMGY9ViIGNU
Oath of Non-Allegiance: I promise not to exclude from consideration any idea based on its source, but to consider ideas across schools and heritage in order to finde the ones hat best fit the current situation.
## Data in, data out (Testable, easier to understand)
* 80 - 85% of methods
* good functions: don't access global state, don't modify the input, don't bother the rest of the world -> make it a static method
* think about the data flow
* isolate business logic from externals
## Immutability
* we won't change the object, because we can't
* the less state that can change, the less you have to think about
* concurrency
* use only final members and use defensive copy: `private final ImmutableList<Phone> phones;` (guava)
* copy on modification is not inefficient because we don't do deep copies but use linked lists
## Verbs are people too
* functions are values, pass them around: 
* do it already: Strategy, Command, Template pattern, callbacks, behavior in js
* most important that application logic reads cleanly, devide cleanly from craft
* lambda functions
## Declarative style
* say what we are doing, not how we do it
* do it already: sql
* readable code, smaller and simpler pieces, familiar != readable (familiar (fast thinking) depends very much on audience: slow thinking is more effortful but everybody can do it - target that)
* e.g. for loop -> is not declaritive, better: use a filter
## Strong typing
* goal find more error at compile time than runtime
* results in declarative style
* universal vocabulary: DDD
* the beginning of wisdom is to call things by their right names
* create a type for every object, string is an implementation detail
* painful in Java because have to write full class, hash code comparison, ... (more craft) but for some things worthy, tipp: have a static method in class for construction to make it as concise as possible
* interface segregation principle: make more specific interfaces as input to a function to be more specific
## Lazy evaluation
* delay evaluation of an expression until the last responsible moment
* already do it: provider, factories, sql cursors
* separate what to do than when to stop -> single responsiblity (most important for developers)
* use streams
