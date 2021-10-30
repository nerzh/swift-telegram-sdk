# Telegram Vapor Bot

## ⭐️ Please, support Swift Telegram Vapor Bot development by giving a ⭐️

### Telegram Bot based on Swift Vapor.
[Swift Server Side Community - Ukraine / Russian / CIS Telegram Chat](https://t.me/server_side_swift)

[My TG Contact - @nerzh](https://t.me/nerzh)


### Usage 

For xamples of using this project please view [Telegram-bot-example](https://github.com/nerzh/telegram-vapor-bot/tree/master/Telegram-bot-example)


### Use with LongPolling

#### for longpolling you should only configure vapor **configure.swift**

```swift
import telegram_vapor_bot

let tgApi: String = "XXXXXXXXXX:YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
let connection: TGConnectionPrtcl = TGLongPollingConnection()
TGBot.configure(connection: connection, botId: tgApi, vaporClient: app.client)
try TGBot.shared.start()

/// set level of debug if you needed 
TGBot.log.logLevel = .error

DefaultBotHandlers.addHandlers(app: app, bot: TGBot.shared)
```



### Use with Webhooks

#### vapor **configure.swift**

```swift
import telegram_vapor_bot

let tgApi: String = "XXXXXXXXXX:YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
let connection: TGConnectionPrtcl = TGWebHookConnection(webHookURL: "https://your_domain/some_webhook_route")
TGBot.configure(connection: connection, botId: tgApi, vaporClient: app.client)
try TGBot.shared.start()

/// set level of debug if you needed 
TGBot.log.logLevel = .error

DefaultBotHandlers.addHandlers(app: app, bot: TGBot.shared)
```

#### vapor **routes.swift**

```swift
import Vapor
import telegram_vapor_bot


func routes(_ app: Application) throws {

    app.post("some_webhook_route") { (request) -> String in
        do {
            let update: TGUpdate = try request.content.decode(TGUpdate.self)
            try TGBot.shared.connection.dispatcher.process([update])
        } catch {
            log.error(error.logMessage)
        }

        return "ok"
    }
}
```



### Add to your Vapor project with Swift Package Manager
add to yor Package.json

```swift
// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Telegram-bot-example",
    platforms: [
       .macOS(.v10_15)
    ],
    dependencies: [
        .package(name: "vapor", url: "https://github.com/vapor/vapor.git", .upToNextMajor(from: "4.45.0")),
        .package(name: "telegram-vapor-bot", url: "https://github.com/nerzh/telegram-vapor-bot", .upToNextMajor(from: "1.2.4")),
    ],
    targets: [
        .target(
            name: "Telegram-bot-example",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "telegram-vapor-bot", package: "telegram-vapor-bot"),
            ]
        )
    ]
)
```

### Acknowledgments

Inspired by [Telegrammer](https://github.com/givip/Telegrammer)
