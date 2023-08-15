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
            name: "InteropLibrary",
            targets: ["InteropLibrary"]),
        .executable(name: "moarcxx", targets: ["moarcxx"])
        ],
    targets: [
        .target(
            name: "InteropLibrary",
            dependencies: ["cxxLibrary"],
            //any target that uses Swift, not just executables.
            swiftSettings: [.interoperabilityMode(.Cxx)]),
        .executableTarget(
            name: "moarcxx",
            dependencies: ["InteropLibrary"],
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
    |   └── InteropLibrary
    |       └── SomeSwiftFile.swift
    └── Tests
        └── ...
```

