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
            //any target that uses Swift, not just executables.
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

In this case that would look like:

```
#incude <cxxLibrary/someCPPFile.hpp>
```


## After Startup

Note this project uses resources files. They can be enabled in the Package.swift file

```swift
        .target(
            name: "cxxLibrary",
            exclude: ["resources/REFERENCES.md"],
            resources: [.process("resources")]
        ),
        .target(
            name: "InteropLibrary",
            dependencies: ["cxxLibrary"],
            resources: [.copy("resources")],
            swiftSettings: [.interoperabilityMode(.Cxx)]),
```

In the above example the C++ bundle's resources will be put directly in the bundle (.process), the Swift bundle will have the resources folder moved with all it's structure (.copy). 

Swift can call the Bundle with Bundle.module. Still working on how to set up an alias to swift::Bundle in the C++, but in the mean time the Swift can hand the C++ a path and it works well enough for testing. There was a way in ObjectiveC 

- https://github.com/apple/swift-package-manager/blob/48192bbdd2800a38a82fa658a244e70b3167ec5d/Sources/Build/BuildDescription/ClangTargetBuildDescription.swift#L304-L364
- https://forums.swift.org/t/access-a-package-s-bundle-module-from-c-c/63339 
