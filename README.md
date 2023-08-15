# Package with Both C++ and Swift

This project is for testing C++ and Swift in the context of a library. 

- Apple Swift version 5.9 (swiftlang-5.9.0.128.2 clang-1500.0.40.1)
- XCode 15, beta 6

code can be run via either 

```zsh
# pretty decent coverage of Swift calls by tests
swift test 
#for misc functions that need runtime testing:
swift run moarcxx
```

## References

- https://developer.apple.com/videos/play/wwdc2023/10172/
- https://developer.apple.com/documentation/Swift/MixingLanguagesInAnXcodeProject 
- https://developer.apple.com/documentation/swift/callingapisacrosslanguageboundaries
- https://www.swift.org/documentation/cxx-interop/
- https://www.swift.org/documentation/cxx-interop/project-build-setup/

## What's in the Package

### InteropLibrary

JUST Swift files. Currently only has the one struct `ThingCatalog` to make it easier to call the C++ in tests and in the CLI.

Thing catalog uses C++ from the std.__ Standard library overlay, without the presences of a dedicated library target. 

### moarcxx

Badly named Swift CLI (since its actually moarswift, really). For knocking out runtime checks. Not useful or full coverage. Will likely be renamed/retooled or just deleted.  
