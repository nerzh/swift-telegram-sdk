// swift-tools-version:5.8

import PackageDescription

var packageDependencies: [Package.Dependency] = [
    .package(url: "https://github.com/vapor/vapor.git", .upToNextMajor(from: "4.57.0")),
]

var targetDependencies: [PackageDescription.Target.Dependency] = [
    .product(name: "Vapor", package: "vapor"),
]

//packageDependencies.append(.package(path: "/Users/nerzh/mydata/swift_projects/SwiftTelegramSdk"))
//targetDependencies.append(.product(name: "SwiftTelegramSdk", package: "SwiftTelegramSdk"))

packageDependencies.append(.package(url: "https://github.com/nerzh/swift-telegram-sdk", .upToNextMajor(from: "3.0.3")))
targetDependencies.append(.product(name: "SwiftTelegramSdk", package: "swift-telegram-sdk"))

let package = Package(
    name: "Telegram-vapor-bot-example",
    platforms: [
        .macOS(.v12)
    ],
    dependencies: packageDependencies,
    targets: [
        .executableTarget(
            name: "Telegram-vapor-bot-example",
            dependencies: targetDependencies
        )
    ]
)


