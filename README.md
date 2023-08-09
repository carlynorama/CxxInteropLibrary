# Package with Both C++ and Swift

This project is for testing C++ and Swift in the same source base in the context of a library. 

- Apple Swift version 5.9 (swiftlang-5.9.0.128.2 clang-1500.0.40.1)

## Project startup

### Being Project

cd $PROJECT_DIR
swift package init --type library
touch README.md
git init


auto-vs manual module map.

// Some IDEs and build systems can generate a module map file for a C++ build 
// target automatically. Swift Package Manager automatically generates a module 
// map file when it finds an umbrella header in a C++ target. Xcode automatically
// generates a module map file for a framework target, with the module map 
// referencing framework’s public headers.In other cases you might be required to 
// create a module map manually.
//https://www.swift.org/documentation/cxx-interop/#importing-c-into-swift

module.modulemap

```
module cxxLibrary {
    header "SimpleCxxFunctions.h"

    export *
}
```





```
swift test
```



## References

- https://developer.apple.com/videos/play/wwdc2023/10172/
- https://developer.apple.com/documentation/Swift/MixingLanguagesInAnXcodeProject 
- https://www.swift.org/documentation/cxx-interop/
- https://www.swift.org/documentation/cxx-interop/project-build-setup/