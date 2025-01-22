# Objective-C ARC Strong Reference Cycle Memory Leak

This repository demonstrates a common memory leak issue in Objective-C caused by a strong reference cycle under Automatic Reference Counting (ARC).  Two classes retain each other, preventing the system from deallocating them, leading to memory buildup over time. The solution demonstrates how to properly break the reference cycle using weak references.

## Bug Description
The `Bug.m` file contains a simple example of two classes (`ClassA` and `ClassB`) which create a strong reference cycle, resulting in a memory leak.  The leak isn't immediately apparent, but manifests over time with repeated instantiation of these classes.

## Solution
The `BugSolution.m` file presents a corrected version of the code. The strong reference cycle is broken by using a `weak` property in one of the classes. This ensures that the cycle is broken, and the objects are properly deallocated when no longer needed.

## How to Run
1. Clone this repository.
2. Open the project in Xcode.
3. Run the application. Observe memory usage before and after fixing the bug.  (using Instruments for a more precise analysis).