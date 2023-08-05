// swift-tools-version: 5.5

import PackageDescription

let package = Package(
    name: "CombinePublished",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "CombinePublished",
            targets: ["CombinePublished"]
        ),
    ],
    targets: [
        .target(
            name: "CombinePublished"
        ),
        .testTarget(
            name: "CombinePublishedTests",
            dependencies: ["CombinePublished"]
        ),
    ]
)
