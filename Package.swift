// swift-tools-version:5.8

import PackageDescription

let name: String = "TelegramVaporBot"

let package = Package(
    name: name,
    platforms: [
        .macOS(.v12)
    ],
    products: [
        .library(
            name: name,
            targets: [name]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", .upToNextMajor(from: "4.80.0")),
        .package(url: "https://github.com/nerzh/swift-regular-expression", .upToNextMajor(from: "0.2.4")),
    ],
    targets: [
        .target(
            name: name,
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "SwiftRegularExpression", package: "swift-regular-expression"),
            ]
        )
    ]
)
