// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "TelegramVaporBot",
    platforms: [
        .macOS(.v12)
    ],
    products: [
        .library(
            name: "TelegramVaporBot",
            targets: ["TelegramVaporBot"]),
    ],
    dependencies: [
        .package(name: "vapor", url: "https://github.com/vapor/vapor.git", .upToNextMajor(from: "4.57.0")),
        .package(name: "SwiftRegularExpression", url: "https://github.com/nerzh/swift-regular-expression", .upToNextMajor(from: "0.2.4")),
    ],
    targets: [
        .executableTarget(
            name: "TelegramVaporBot",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "SwiftRegularExpression", package: "SwiftRegularExpression"),
            ]
        )
    ]
)
