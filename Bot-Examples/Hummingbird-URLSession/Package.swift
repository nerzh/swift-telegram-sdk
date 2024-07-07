// swift-tools-version:5.9

import PackageDescription

let packageDependencies: [Package.Dependency] = [
    .package(url: "https://github.com/hummingbird-project/hummingbird.git", from: "2.0.0-alpha.1"),
    .package(url: "https://github.com/nerzh/swift-telegram-sdk", .upToNextMajor(from: "3.0.3"))
]

let targetDependencies: [PackageDescription.Target.Dependency] = [
    .product(name: "Hummingbird", package: "hummingbird"),
    .product(name: "SwiftTelegramSdk", package: "swift-telegram-sdk")
]

let package = Package(
    name: "Hummingbird-URLSession-bot-example",
    platforms: [
        .macOS(.v14)
    ],
    dependencies: packageDependencies,
    targets: [
        .executableTarget(
            name: "Hummingbird-URLSession-bot-example",
            dependencies: targetDependencies
        )
    ]
)
