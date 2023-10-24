// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ViewControllerable",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "ViewControllerable",
            targets: ["ViewControllerable"]),
    ],
    targets: [
        .target(
            name: "ViewControllerable",
            dependencies: []),
        .testTarget(
            name: "ViewControllerableTests",
            dependencies: ["ViewControllerable"]),
    ]
)
