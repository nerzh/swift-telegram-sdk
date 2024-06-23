// swift-tools-version:5.10

import PackageDescription

let package = Package(
    name: "TelegramVaporBot",
    platforms: [
        .macOS(.v14)
    ],
    products: [
        .library(
            name: "TelegramVaporBot",
            targets: ["TelegramVaporBot"]),
    ],
    dependencies: [
        .package(url: "https://github.com/photovirus/TelegramBotKit.git", .upToNextMajor(from: "1.0.0")),
        .package(url: "https://github.com/vapor/vapor.git", .upToNextMajor(from: "4.80.0")),
    ],
    targets: [
        .target(
            name: "TelegramVaporBot",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "TelegramBotKit", package: "TelegramBotKit"),
            ]
        ),
    ]
)
