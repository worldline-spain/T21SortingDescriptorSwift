// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "SortingDescriptor",
    products: [
        .library(
            name: "SortingDescriptor",
            targets: ["SortingDescriptor"]),
    ],
    targets: [
        .target(
            name: "SortingDescriptor",
            dependencies: [],
            path: "./src"),
    ]
)
