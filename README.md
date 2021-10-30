# Telegram Vapor Bot

## ⭐️ Please, support Swift Telegram Vapor Bot development by giving a ⭐️

### Telegram Bot based on Swift Vapor.
[Swift Server Side Community - Ukraine / Russian / CIS Telegram Chat](https://t.me/server_side_swift)

[My TG Contact - @nerzh](https://t.me/nerzh)

### Example Telegram Bot based on Swift Telegram Vapor Bot - Here
[Telegram-bot-example](https://github.com/nerzh/telegram-vapor-bot/tree/master/Telegram-bot-example)

### Usage

#### create folder with your handlers **TGHandlers/DefaultBotHandlers.swift**
```swift
import Vapor
import telegram_vapor_bot

final class DefaultBotHandlers {

    static func addHandlers(app: Vapor.Application, bot: TGBotPrtcl) {
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
            try update.message?.reply(text: update.callbackQuery?.data ?? "data not exist", bot: bot)
        }
        
        let handler2 = TGCallbackQueryHandler(pattern: "press 2") { update, bot in
            try update.message?.reply(text: update.callbackQuery?.data ?? "data not exist", bot: bot)
        }
        
        bot.connection.dispatcher.add(handler)
        bot.connection.dispatcher.add(handler2)
    }

}

```

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
