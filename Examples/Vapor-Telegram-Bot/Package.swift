// swift-tools-version:5.8

import PackageDescription

let packageDependencies: [Package.Dependency] = [
    .package(url: "https://github.com/vapor/vapor.git", .upToNextMajor(from: "4.57.0")),
    .package(url: "https://github.com/nerzh/swift-telegram-sdk", .upToNextMajor(from: "3.0.3"))
]

let targetDependencies: [PackageDescription.Target.Dependency] = [
    .product(name: "Vapor", package: "vapor"),
    .product(name: "SwiftTelegramSdk", package: "swift-telegram-sdk")
]

let package = Package(
    name: "Vapor-Telegram-Bot",
    platforms: [
        .macOS(.v12)
    ],
    dependencies: packageDependencies,
    targets: [
        .executableTarget(
            name: "Vapor-Telegram-Bot",
            dependencies: targetDependencies
        )
    ]
)
