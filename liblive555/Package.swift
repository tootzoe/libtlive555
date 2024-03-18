// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription



//let liveBinary = Target.binaryTarget(name: "libtlive555", path: "bins/libtlive555.xcframework.zip")
let liveBinary = Target.binaryTarget(name: "libtlive555", url: "", checksum: "dc9a755d34543f64228f2b1c7838deee3e98d0c8888e0394df90f3cfb7c5761a")



let package = Package(
    name: "liblive555",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "liblive555",
            targets: ["liblive555"]),
    ],
    targets: [
        liveBinary,
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(name: "mediaSvr",
               publicHeadersPath: "include"
               ),
        .target(
            name: "liblive555",
        dependencies: ["libtlive555" , "mediaSvr"]),
        .testTarget(
            name: "liblive555Tests",
            dependencies: ["liblive555"]),
    ]
)
