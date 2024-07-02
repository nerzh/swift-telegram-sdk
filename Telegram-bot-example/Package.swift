// swift-tools-version:5.8

import PackageDescription

var packageDependencies: [Package.Dependency] = [
    .package(url: "https://github.com/vapor/vapor.git", .upToNextMajor(from: "4.57.0")),
]

var targetDependencies: [PackageDescription.Target.Dependency] = [
    .product(name: "Vapor", package: "vapor"),
]

packageDependencies.append(.package(path: "/Users/nerzh/mydata/swift_projects/SwiftTelegramSdk"))
targetDependencies.append(.product(name: "SwiftTelegramSdk", package: "SwiftTelegramSdk"))

//packageDependencies.append(.package(url: "https://github.com/nerzh/telegram-vapor-bot", .upToNextMajor(from: "2.1.0")))
//targetDependencies.append(.product(name: "TelegramVaporBot", package: "telegram-vapor-bot"))

let package = Package(
    name: "Telegram-bot-example",
    platforms: [
        .macOS(.v12)
    ],
    dependencies: packageDependencies,
    targets: [
        .executableTarget(
            name: "Telegram-bot-example",
            dependencies: targetDependencies
        )
    ]
)


