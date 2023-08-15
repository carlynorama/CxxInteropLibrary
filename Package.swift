// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CxxInteropLibrary",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "cxxLibrary",
            targets: ["cxxLibrary"]
            ),
        .library(
            name: "InteropLibrary",
            targets: ["InteropLibrary"]),
        .executable(name: "moarcxx", targets: ["moarcxx"])    ],
    targets: [
        .target(
            name: "cxxLibrary",
            exclude: ["resources/REFERENCES.md"],
            // puts it in .build/debug/CxxInteropLibrary_cxxLibrary.bundle/resources
            //resources: [.copy("resources")]
            resources: [.process("resources")]//,
            //cxxSettings: [CXXSetting]?
        ),
        .target(
            name: "InteropLibrary",
            dependencies: ["cxxLibrary"],
            resources: [.copy("resources")],
            //resources: [.embedInCode("resources")], //!!!
            swiftSettings: [.interoperabilityMode(.Cxx)]),
        .executableTarget(
            name: "moarcxx",
            dependencies: ["InteropLibrary"],
            swiftSettings: [.interoperabilityMode(.Cxx)]),
        .testTarget(
            name: "CxxInteropLibraryTests",
            dependencies: ["InteropLibrary"],
            swiftSettings: [.interoperabilityMode(.Cxx)])
    ]
)
