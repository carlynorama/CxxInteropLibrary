# Project startup

## Begin Project

```
cd $PROJECT_DIR
swift package init --type library
touch README.md
git init
```

## Update Package File

```swift
// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CxxInteropLibrary",
    products: [
        .library(
            name: "cxxLibrary",
            targets: ["cxxLibrary"]),
        .library(
            name: "InteropLibrary",
            targets: ["InteropLibrary"]),
        ],
    targets: [
        .target(
            name: "cxxLibrary"),
        .target(
            name: "InteropLibrary",
            dependencies: ["cxxLibrary"],
            //any target that uses swift, not just executables.
            swiftSettings: [.interoperabilityMode(.Cxx)]),
        .testTarget(
            name: "CxxInteropLibraryTests",
            dependencies: ["InteropLibrary"],
            //dependencies: ["InteropLibrary", "cxxLibrary"],
            swiftSettings: [.interoperabilityMode(.Cxx)])
    ]
)
```

## Create Directory Structure

The general outline for the project. The key is that the sub folders in the Sources directory are named the same as the products/targets and that all the cpp header files end up in the include folder. 


```txt
└── Project
    └── Sources
    │   └── cxxLibrary
    |   |   |── include
    |   |   |   └── module.modulemap
    |   |   |   └── someCPPFile.hpp
    |   |   └── someCPPFile.cpp
    |   └── InteropLibrary
    |       └── SomeSwiftFile.swift
    └── Tests
        └── ...
```

The module map looks like: 

```
module cxxLibrary {
    header "someCPPFile.hpp"

    export *
}
```

The [documentation says](https://www.swift.org/documentation/cxx-interop/#importing-c-into-swift) 

>"Swift Package Manager automatically generates a module map file when it finds an umbrella header in a C++ target. Xcode automatically generates a module map file for a framework target, with the module map referencing framework’s public headers. In other cases you might be required to create a module map manually."

I tried making a header file in include called cxxLibrary.h, but the SPM did not in fact seem able to pick up on it in either Xcode or VScode. 


```
#incude <cxxLibrary/someCPPFile.hpp>
```


