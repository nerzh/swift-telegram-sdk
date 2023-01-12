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

    static func addHandlers(app: Vapor.Application) {
        let bot = app.telegram.bot

        defaultHandler(app: app, bot: bot)
        commandPingHandler(app: app, bot: bot)
        commandShowButtonsHandler(app: app, bot: bot)
        buttonsActionHandler(app: app, bot: bot)
    }

    /// add handler for all messages unless command "/ping" 
    private static func defaultHandler(app: Vapor.Application, bot: TGBotPrtcl) {
        let handler = TGMessageHandler(filters: (.all && !.command.names(["/ping"]))) { update, bot in
            let params: TGSendMessageParams = .init(chatId: .chat(update.message!.chat.id), text: "Success")
            try bot.sendMessage(params: params)
        }
        bot.connection.dispatcher.add(handler)
    }

    /// add handler for command "/ping"
    private static func commandPingHandler(app: Vapor.Application, bot: TGBotPrtcl) {
        let handler = TGCommandHandler(commands: ["/ping"]) { update, bot in
            try update.message?.reply(text: "pong", bot: bot)
        }
        bot.connection.dispatcher.add(handler)
    }
    
    /// add handler for command "/show_buttons" - show message with buttons
    private static func commandShowButtonsHandler(app: Vapor.Application, bot: TGBotPrtcl) {
        let handler = TGCommandHandler(commands: ["/show_buttons"]) { update, bot in
            guard let userId = update.message?.from.id else { fatalError("user id not found") }
            let buttons: [[TGInlineKeyboardButton]] = [
                [.init(text: "Button 1", callbackData: "press 1"), .init(text: "Button 2", callbackData: "press 2")]
            ]
            let keyboard: TGInlineKeyboardMarkup = .init(inlineKeyboard: buttons)
            let params: TGSendMessageParams = .init(chatId: .chat(userId),
                                                    text: "Keyboard activ",
                                                    replyMarkup: .inlineKeyboardMarkup(keyboard))
            try bot.sendMessage(params: params)
        }
        bot.connection.dispatcher.add(handler)
    }
    
    /// add two handlers for callbacks buttons
    private static func buttonsActionHandler(app: Vapor.Application, bot: TGBotPrtcl) {
        let handler = TGCallbackQueryHandler(pattern: "press 1") { update, bot in
            let params: TGAnswerCallbackQueryParams = .init(callbackQueryId: update.callbackQuery?.id ?? "0",
                                                            text: update.callbackQuery?.data  ?? "data not exist",
                                                            showAlert: nil,
                                                            url: nil,
                                                            cacheTime: nil)
            try bot.answerCallbackQuery(params: params)
        }

        let handler2 = TGCallbackQueryHandler(pattern: "press 2") { update, bot in
            let params: TGAnswerCallbackQueryParams = .init(callbackQueryId: update.callbackQuery?.id ?? "0",
                                                            text: update.callbackQuery?.data  ?? "data not exist",
                                                            showAlert: nil,
                                                            url: nil,
                                                            cacheTime: nil)
            try bot.answerCallbackQuery(params: params)
        }

        bot.connection.dispatcher.add(handler)
        bot.connection.dispatcher.add(handler2)
    }
}

```

### Use with LongPolling

#### for longpolling you should only configure vapor **configure.swift**

```swift
import TelegramVaporBot

let tgApi: String = "XXXXXXXXXX:YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
let connection = TGLongPollingConnection(app: app)
app.telegram.configuration = .init(connection: connection, botId: tgApi)

/// set level of debug if you needed 
TGBot.log.logLevel = .error

DefaultBotHandlers.addHandlers(app: app)
```



### Use with Webhooks

#### vapor **configure.swift**

```swift
import TelegramVaporBot

let tgApi: String = "XXXXXXXXXX:YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
let connection: TGConnectionPrtcl = TGWebHookConnection(webHookURL: "https://your_domain/some_webhook_route", app: app)
app.telegram.configuration = .init(connection: connection, botId: tgApi)


/// set level of debug if you needed 
TGBot.log.logLevel = .error

DefaultBotHandlers.addHandlers(app: app)
```

#### vapor **routes.swift**

```swift
import Vapor
import TelegramVaporBot


func routes(_ app: Application) throws {

    app.telegramWebhook("some_webhook_route")
    
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
                .product(name: "TelegramVaporBot", package: "telegram-vapor-bot"),
            ]
        )
    ]
)
```

### Acknowledgments

Inspired by [Telegrammer](https://github.com/givip/Telegrammer)
