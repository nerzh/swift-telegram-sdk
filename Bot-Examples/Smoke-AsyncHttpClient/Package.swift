// swift-tools-version:5.9

import PackageDescription

let packageDependencies: [Package.Dependency] = [
    .package(url: "https://github.com/amzn/smoke-framework.git", from: "2.0.0"),
    .package(url: "https://github.com/swift-server/async-http-client.git", from: "1.6.0"),
    .package(url: "https://github.com/nerzh/swift-telegram-sdk", .upToNextMajor(from: "3.0.3"))
]

let targetDependencies: [PackageDescription.Target.Dependency] = [
    .product(name: "SmokeOperationsHTTP1Server", package: "smoke-framework"),
    .product(name: "AsyncHTTPClient", package: "async-http-client"),
    .product(name: "SwiftTelegramSdk", package: "swift-telegram-sdk")
]

let package = Package(
    name: "Smoke-AsyncHttpClient-bot-example",
    platforms: [
        .macOS(.v14)
    ],
    dependencies: packageDependencies,
    targets: [
        .executableTarget(
            name: "Smoke-AsyncHttpClient-bot-example",
            dependencies: targetDependencies
        )
    ]
)
