# Refactoring to immutability - Kevlin Henney (https://www.youtube.com/watch?v=APUCMSPiNh4)
Problem when objects are mutable and shared

## Remove Modifiers
Remove unused modifiers (e.g. setters) and consider Replace Modifiers with Constructors, Extract Modifiers to Builder and Make Void Functions Fluent

## Replace Modification with Constructors
Many sequences of modification can often be replaced with a broader set of meaningful constructors

## Move Modifiers to Builder
Define a mutable companion class to handle sequences of modification (cf. String and StringBuilder)

## Replace Side Effect with New Object
Return a new object instead of changing an existing one. Often, Make Void Method Fluent is a useful stepping stone.

## Make Void Methods Fluent
Have a method return an existing or new object the caller can chain from.


## Replace Mutable Collection with Persistent Collection
Use, create and repurpose a mutable collection with - or as - a persistent collection, i.e., one that is effectively immutable to referential observers, allowing sharing without cost of copying.

## Replace Mutable Collection Values with Immutable Values
A collection that is itself unchanging or persistent cannot preserve its immutability guarantee if its collected references are mutable, so use immutable values for collection elements.

## Replace State-based Object Behaviour with Polymorphism
Replace flags that are unchanging for a given collection, but cause branching to different behaviours with polymorphism, i.e. use instances of types to represent the behavioural differences.


## Extract Iteration
Repetition is repetitive, so factor out common loops into appropriately named and parameterised methods.

## Extract Control Flow as Higher-Order Functions
Much control flow has stable structure but variable conditions or actions, so use pluggable behaviour.

## Replace Control Flow with Data Structure
Many data structures embody control intelligence, e.g. sorted collections and regular expressions, so replace long-hand logic and control with more intelligent data structures.

## Replace Control Flow with Data Flow
Use pipelines, polymorphism and higher-order methods to replace control flow with data flow.

## Replace Loop with Stream Filtering
Use collection pipelines to replace explicit looping and control flow with data flow.