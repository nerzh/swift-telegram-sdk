# Telegram Vapor Bot (SDK for creating Telegram Bots in Swift)

### Please, support with ⭐️

🤖 The wrapper for the Telegram Bot API written in Swift with Vapor. It's not a framework. There is no special syntax here. This is a library that implements all [Telegram Bot API methods](https://core.telegram.org/bots/api#available-methods), which is available to you to work with Vapor.

#### Example Telegram Bot based on Swift Telegram Vapor Bot - Here
[Telegram-bot-example](https://github.com/nerzh/telegram-vapor-bot/tree/master/Telegram-bot-example)

#### Swift Server Side Community
[Swift Server Side Community - Ukraine / Russian / CIS Telegram Chat](https://t.me/server_side_swift)

### Usage

#### create folder with your handlers **TGHandlers/DefaultBotHandlers.swift**
```swift
import Vapor
import TelegramVaporBot

final class DefaultBotHandlers {

    static func addHandlers(app: Vapor.Application, connection: TGConnectionPrtcl) async {
        await defaultBaseHandler(app: app, connection: connection)
        await messageHandler(app: app, connection: connection)
        await commandPingHandler(app: app, connection: connection)
        await commandShowButtonsHandler(app: app, connection: connection)
        await buttonsActionHandler(app: app, connection: connection)
    }
    
    /// Handler for all updates
    private static func defaultBaseHandler(app: Vapor.Application, connection: TGConnectionPrtcl) async {
        await connection.dispatcher.add(TGBaseHandler({ update, bot in
            guard let message = update.message else { return }
            let params: TGSendMessageParams = .init(chatId: .chat(message.chat.id), text: "TGBaseHandler")
            try await connection.bot.sendMessage(params: params)
        }))
    }

    /// Handler for Messages
    private static func messageHandler(app: Vapor.Application, connection: TGConnectionPrtcl) async {
        await connection.dispatcher.add(TGMessageHandler(filters: (.all && !.command.names(["/ping", "/show_buttons"]))) { update, bot in
            let params: TGSendMessageParams = .init(chatId: .chat(update.message!.chat.id), text: "Success")
            try await connection.bot.sendMessage(params: params)
        })
    }

    /// Handler for Commands
    private static func commandPingHandler(app: Vapor.Application, connection: TGConnectionPrtcl) async {
        await connection.dispatcher.add(TGCommandHandler(commands: ["/ping"]) { update, bot in
            try await update.message?.reply(text: "pong", bot: bot)
        })
    }

    /// Show buttons
    private static func commandShowButtonsHandler(app: Vapor.Application, connection: TGConnectionPrtcl) async {
        await connection.dispatcher.add(TGCommandHandler(commands: ["/show_buttons"]) { update, bot in
            guard let userId = update.message?.from?.id else { fatalError("user id not found") }
            let buttons: [[TGInlineKeyboardButton]] = [
                [.init(text: "Button 1", callbackData: "press 1"), .init(text: "Button 2", callbackData: "press 2")]
            ]
            let keyboard: TGInlineKeyboardMarkup = .init(inlineKeyboard: buttons)
            let params: TGSendMessageParams = .init(chatId: .chat(userId),
                                                    text: "Keyboard active",
                                                    replyMarkup: .inlineKeyboardMarkup(keyboard))
            try await connection.bot.sendMessage(params: params)
        })
    }

    /// Handler for buttons callbacks
    private static func buttonsActionHandler(app: Vapor.Application, connection: TGConnectionPrtcl) async {
        await connection.dispatcher.add(TGCallbackQueryHandler(pattern: "press 1") { update, bot in
            let params: TGAnswerCallbackQueryParams = .init(callbackQueryId: update.callbackQuery?.id ?? "0",
                                                            text: update.callbackQuery?.data  ?? "data not exist",
                                                            showAlert: nil,
                                                            url: nil,
                                                            cacheTime: nil)
            try await bot.answerCallbackQuery(params: params)
        })
        
        await connection.dispatcher.add(TGCallbackQueryHandler(pattern: "press 2") { update, bot in
            let params: TGAnswerCallbackQueryParams = .init(callbackQueryId: update.callbackQuery?.id ?? "0",
                                                            text: update.callbackQuery?.data  ?? "data not exist",
                                                            showAlert: nil,
                                                            url: nil,
                                                            cacheTime: nil)
            try await bot.answerCallbackQuery(params: params)
        })
    }
}
```

### Setup

#### Create file **TGBotConnectionActor.swift**

Add Actor for TGConnection

```swift
import Foundation
import TelegramVaporBot

actor TGBotConnection {
    private var _connection: TGConnectionPrtcl!

    var connection: TGConnectionPrtcl {
        self._connection
    }
    
    func setConnection(_ conn: TGConnectionPrtcl) {
        self._connection = conn
    }
}
```

#### vapor **main.swift**

make strong reference to TGBotConnection instance and add "await" to configure

```swift
import Vapor
import TelegramVaporBot

let TGBOT: TGBotConnection = .init()

try await configure(app)
```

### Use with LongPolling

#### for longpolling you should only configure vapor **configure.swift**

```swift
import TelegramVaporBot

public func configure(_ app: Application) async throws {
    let tgApi: String = "XXXXXXXXXX:YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
    /// set level of debug if you needed
    TGBot.log.logLevel = app.logger.logLevel
    let bot: TGBot = .init(app: app, botId: tgApi)
    await TGBOT.setConnection(try await TGLongPollingConnection(bot: bot))
    await DefaultBotHandlers.addHandlers(app: app, connection: TGBOT.connection)
    try await TGBOT.connection.start()

    try routes(app)
}

```



### Use with Webhooks

#### vapor **configure.swift**

```swift
import TelegramVaporBot

public func configure(_ app: Application) async throws {
    let tgApi: String = "XXXXXXXXXX:YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
    /// set level of debug if you needed
    TGBot.log.logLevel = app.logger.logLevel
    let bot: TGBot = .init(app: app, botId: tgApi)
    await TGBOT.setConnection(try await TGWebHookConnection(bot: bot, webHookURL: "https://your_domain/telegramWebHook"))
    await DefaultBotHandlers.addHandlers(app: app, connection: TGBOT.connection)
    try await TGBOT.connection.start()

    try routes(app)
}

```

#### vapor **routes.swift**

```swift
import Vapor
import TelegramVaporBot


func routes(_ app: Application) throws {
    try app.register(collection: TelegramController())
}
```

#### vapor **TelegramController.swift**

```swift
import Vapor
import TelegramVaporBot

final class TelegramController: RouteCollection {
    
    func boot(routes: Vapor.RoutesBuilder) throws {
        routes.post("telegramWebHook", use: telegramWebHook)
    }
}

extension TelegramController {
    
    func telegramWebHook(_ req: Request) async throws -> Bool {
        let update: TGUpdate = try req.content.decode(TGUpdate.self)
        return try await TGBOT.connection.dispatcher.process([update])
    }
}

```


### Add to your Vapor project with Swift Package Manager
add to yor Package.json

```swift
// swift-tools-version:5.8

import PackageDescription

var packageDependencies: [Package.Dependency] = [
    .package(url: "https://github.com/vapor/vapor.git", .upToNextMajor(from: "4.57.0")),
]

packageDependencies.append(.package(url: "https://github.com/nerzh/telegram-vapor-bot", .upToNextMajor(from: "2.1.0")))


let package = Package(
    name: "Telegram-bot-example",
    platforms: [
        .macOS(.v12)
    ],
    dependencies: packageDependencies,
    targets: [
        .executableTarget(
            name: "Telegram-bot-example",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "TelegramVaporBot", package: "telegram-vapor-bot"),
            ]
        )
    ]
)



```

### Acknowledgments

Inspired by [Telegrammer](https://github.com/givip/Telegrammer)
