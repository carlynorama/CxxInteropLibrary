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
            targets: ["InteropLibrary"])
    ],
    targets: [
        .target(
            name: "cxxLibrary"),
        .target(
            name: "InteropLibrary",
            dependencies: ["cxxLibrary"]),
        .testTarget(
            name: "CxxInteropLibraryTests",
            dependencies: ["InteropLibrary"],
            swiftSettings: [.interoperabilityMode(.Cxx)])
    ]
)
