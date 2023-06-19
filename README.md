# aot-minimal
Demonstration of .NET AOT

Read the accompanying newsletter article:

> [Exploring Native Ahead Of Time Compilation in .NET: Pros, Cons, and Possibilities
](https://arunstephens.com/exploring-native-aot-in-dotnet)

There are three branches in this repo:

- The `jit` branch contains the app that requires the .NET runtime.

- The `aot-broken` branch contains the same app configured using AOT. It starts, but can't serve traffic. (Read more about why in the article.)

- The `aot` branch is the same app with only one simple endpoint, which will run.