// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "telegram-vapor-bot",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "telegram-vapor-bot",
            targets: ["telegram-vapor-bot"]),
    ],
    dependencies: [
        .package(name: "vapor", url: "https://github.com/vapor/vapor.git", .upToNextMajor(from: "4.45.0")),
        .package(name: "SwiftRegularExpression", url: "https://github.com/nerzh/swift-regular-expression", .upToNextMajor(from: "0.2.4")),
    ],
    targets: [
        .target(
            name: "telegram-vapor-bot",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "SwiftRegularExpression", package: "SwiftRegularExpression"),
            ]
        )
    ]
)
