// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "telegram-vapor-bot-lib",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "telegram-vapor-bot-lib",
            targets: ["telegram-vapor-bot-lib"]),
    ],
    dependencies: [
        .package(name: "vapor", url: "https://github.com/vapor/vapor.git", .upToNextMajor(from: "4.45.0")),
    ],
    targets: [
        .target(
            name: "telegram-vapor-bot-lib",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
            ]
        )
    ]
)
