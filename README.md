# Telegram Vapor Bot

## ⭐️ Please, support Swift Telegram Vapor Bot development by giving a ⭐️

🤖 The wrapper for the Telegram Bot API written in Swift with Vapor. It's not a framework. There is no special syntax here. This is a library that implements all [Telegram Bot API methods](https://core.telegram.org/bots/api#available-methods), which is available to you to work with Vapor.

### Example Telegram Bot based on Swift Telegram Vapor Bot - Here
[Telegram-bot-example](https://github.com/nerzh/telegram-vapor-bot/tree/master/Telegram-bot-example)

### Telegram Bot based on Swift Vapor.
[Swift Server Side Community - Ukraine / Russian / CIS Telegram Chat](https://t.me/server_side_swift)

[My TG Contact - @nerzh](https://t.me/nerzh)

### Detailed usage article for beginners from telegram Swift Server Side Community member @dimabiserov
[Article on Medium](https://dimabiserov.medium.com/how-to-create-a-telegram-bot-with-swift-using-vapor-a4d4480219ca)

### Usage

#### create folder with your handlers **TGHandlers/DefaultBotHandlers.swift**
```swift
import Vapor
import TelegramVaporBot

final class DefaultBotHandlers {

    static func addHandlers(app: Vapor.Application, connection: TGConnectionPrtcl) async {
        await defaultHandler(app: app, connection: connection)
        await commandPingHandler(app: app, connection: connection)
        await commandShowButtonsHandler(app: app, connection: connection)
        await buttonsActionHandler(app: app, connection: connection)
    }

    private static func defaultHandler(app: Vapor.Application, connection: TGConnectionPrtcl) async {
        await connection.dispatcher.add(TGMessageHandler(filters: (.all && !.command.names(["/ping", "/show_buttons"]))) { update, bot in
            let params: TGSendMessageParams = .init(chatId: .chat(update.message!.chat.id), text: "Success")
            try await connection.bot.sendMessage(params: params)
        })
    }

    private static func commandPingHandler(app: Vapor.Application, connection: TGConnectionPrtcl) async {
        await connection.dispatcher.add(TGCommandHandler(commands: ["/ping"]) { update, bot in
            try await update.message?.reply(text: "pong", bot: bot)
        })
    }

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

### Use with LongPolling

#### for longpolling you should only configure vapor **configure.swift**

```swift
import TelegramVaporBot

public func configure(_ app: Application) throws {
    let tgApi: String = "XXXXXXXXXX:YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
    /// set level of debug if you needed
    TGBot.log.logLevel = .info
    let bot: TGBot = .init(app: app, botId: tgApi)
    TGBotConnection = TGLongPollingConnection(bot: bot)
    Task {
        await DefaultBotHandlers.addHandlers(app: app, connection: TGBotConnection)
        try await TGBotConnection.start()
    }

    try routes(app)
}

```



### Use with Webhooks

#### vapor **configure.swift**

```swift
import TelegramVaporBot

public func configure(_ app: Application) throws {
    let tgApi: String = "XXXXXXXXXX:YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
    /// set level of debug if you needed
    TGBot.log.logLevel = .info
    let bot: TGBot = .init(app: app, botId: tgApi)
    TGBotConnection = TGWebHookConnection(bot: bot, webHookURL: "https://your_domain/telegramWebHook")
    Task {
        await DefaultBotHandlers.addHandlers(app: app, connection: TGBotConnection)
        try await TGBotConnection.start()
    }

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
        routes.get("telegramWebHook", use: telegramWebHook)
    }
}

extension TelegramController {
    
    func telegramWebHook(_ req: Request) async throws -> Bool {
        let update: TGUpdate = try req.content.decode(TGUpdate.self)
        try await TGBotConnection.dispatcher.process([update])
        return true
    }
}

```


### Add to your Vapor project with Swift Package Manager
add to yor Package.json

```swift
// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Telegram-bot-example",
    platforms: [
       .macOS(.v12)
    ],
    dependencies: [
        .package(name: "vapor", url: "https://github.com/vapor/vapor.git", .upToNextMajor(from: "4.57.0")),
        .package(name: "TelegramVaporBot", url: "https://github.com/nerzh/telegram-vapor-bot", .upToNextMajor(from: "2.0.0")),
    ],
    targets: [
        .target(
            name: "Telegram-bot-example",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "TelegramVaporBot", package: "TelegramVaporBot"),
            ]
        )
    ]
)
```

### Acknowledgments

Inspired by [Telegrammer](https://github.com/givip/Telegrammer)
