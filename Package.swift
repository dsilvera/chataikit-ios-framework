// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "ChatAIKit",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "ChatAIKit",
            targets: ["ChatAIKit"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "ChatAIKit",
            path: "ChatAIKit.xcframework"
        )
    ]
)