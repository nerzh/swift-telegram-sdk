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
            ],
            swiftSettings: [
                // Enable better optimizations when building in Release configuration. Despite the use of
                // the `.unsafeFlags` construct required by SwiftPM, this flag is recommended for Release
                // builds. See <https://github.com/swift-server/guides#building-for-production> for details.
                .unsafeFlags(["-cross-module-optimization"], .when(configuration: .release))
            ]
        )
    ]
)
