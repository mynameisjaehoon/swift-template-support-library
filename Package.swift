// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftTSL",
    products: [
        .library(
            name: "SwiftTSL",
            targets: ["SwiftTSL"]),
    ],
    dependencies: [

    ],
    targets: [
        .target(
            name: "SwiftTSL",
            dependencies: []),
        .testTarget(
            name: "SwiftTSL",
            dependencies: ["SwiftTSL"]),
    ]
)
