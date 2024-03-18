// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription



//let liveBinary = Target.binaryTarget(name: "libtlive555", path: "bins/libtlive555.xcframework.zip") 
let liveBinary = Target.binaryTarget(name: "libtlive555", url: "https://github.com/tootzoe/libtlive555/blob/main/releases/v20240215/libtlive555.xcframework.zip?raw=true" , checksum: "7eb3ef3cc952a8701c32f35e18ee1642cc33804d9b08ca37d4907a20ba242f08" )

   


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
               publicHeadersPath: "include",
                cSettings: [
                    .define("NO_OPENSSL"),
                    .define("BSD=1"),
                    .define("_FILE_OFFSET_BITS=64"),
                    .define("_LARGEFILE_SOURCE=1"),
                    .define("HAVE_SOCKADDR_LEN=1"),
                    .define("SOCKLEN_T=socklen_t"),
                    .define("NEED_XLOCALE_H")
                ]
               ),
        .target(
            name: "liblive555",
        dependencies: ["libtlive555" , "mediaSvr"]
           
       
        ),
        .testTarget(
            name: "liblive555Tests",
            dependencies: ["liblive555"]),
    ]
)
 
