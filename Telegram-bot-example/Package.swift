// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Telegram-bot-example",
    platforms: [
       .macOS(.v10_15)
    ],
    dependencies: [
        .package(name: "vapor", url: "https://github.com/vapor/vapor.git", .upToNextMajor(from: "4.45.0")),
        .package(name: "telegram-vapor-bot-lib", url: "https://github.com/nerzh/telegram-vapor-bot-lib", .upToNextMajor(from: "1.0.2")),
    ],
    targets: [
        .target(
            name: "Telegram-bot-example",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "telegram-vapor-bot-lib", package: "telegram-vapor-bot-lib"),
            ]
    ]
)


