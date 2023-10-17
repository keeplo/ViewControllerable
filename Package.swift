// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ControllerableViewModel",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "ControllerableViewModel",
            targets: ["ControllerableViewModel"]),
    ],
    targets: [
        .target(
            name: "ControllerableViewModel",
            dependencies: []),
        .testTarget(
            name: "ControllerableViewModelTests",
            dependencies: ["ControllerableViewModel"]),
    ]
)
