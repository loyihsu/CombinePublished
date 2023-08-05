// swift-tools-version: 5.5

import PackageDescription

let package = Package(
    name: "CombinePublished",
    platforms: [.iOS(.v14), .macOS(.v11)],
    products: [
        .library(
            name: "CombinePublished",
            targets: ["CombinePublished"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0"),
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
