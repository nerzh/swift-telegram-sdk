# Swift Telegram Sdk for Telegram Bot Api (SDK for creating Telegram Bots in Swift)

### Please, support with ⭐️

🤖 The wrapper for the Telegram Bot API written in Swift. It's not a framework. There is no special syntax here. This is a library that implements all [Telegram Bot API methods](https://core.telegram.org/bots/api#available-methods), which is available to you to work with Vapor, Smoke, FlyingFox.

#### Swift Server Side Community
[Swift Server Side Community - Ukraine / Russian / CIS Telegram Chat](https://t.me/server_side_swift)

# Usage
- Clone one of [examples](https://github.com/nerzh/swift-telegram-sdk/tree/master/Examples)
  ```shell
  git clone https://github.com/nerzh/swift-telegram-sdk
  cd swift-telegram-sdk/Examples/Vapor-Telegram-Bot
  ```
- Add your telegram bot id to [configure.swift](https://github.com/nerzh/swift-telegram-sdk/blob/master/Examples/Vapor-Telegram-Bot/Sources/Vapor-Telegram-Bot/configure.swift)
  ```swift
  let tgApi: String = "XXXXXXXXXX:YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
  ```
- Run in Xcode or build and run binary file
- check commands in your telegram bots
  - /ping
  - /show_buttons
# Examples
- [Vapor Telegram Bot](https://github.com/nerzh/swift-telegram-sdk/tree/master/Examples/Vapor-Telegram-Bot)
- [Hummingbird Telegram Bot (AsyncHttpClient)](https://github.com/nerzh/swift-telegram-sdk/tree/master/Examples/Hummingbird-AsyncHttpClient-Telegram-Bot)
- [Hummingbird Telegram Bot (URLSession)](https://github.com/nerzh/swift-telegram-sdk/tree/master/Examples/Hummingbird-URLSession-Telegram-Bot)
- [Smoke Telegram Bot (AsyncHttpClient)](https://github.com/nerzh/swift-telegram-sdk/tree/master/Examples/Smoke-AsyncHttpClient-Telegram-Bot)
- [FlyingFox Telegram Bot (AsyncHttpClient)](https://github.com/nerzh/swift-telegram-sdk/tree/master/Examples/FlyingFox-AsyncHttpClient-Telegram-Bot)

# Advanced Example Usage
## You should to implement TGClientPrtcl protocol
To configure and run a bot with or without any framework, you need to implement a simple TGClient protocol to send requests to the network with Content-Type: multipart/form-data.
You can see an example here: [VaporTGClient](https://github.com/nerzh/swift-telegram-sdk/blob/master/Examples/Vapor-Telegram-Bot/Sources/Vapor-Telegram-Bot/TGBot/VaporTGClient.swift)

```swift
import Logging

public protocol TGClientPrtcl {
    
    var log: Logger { get set }
    
    @discardableResult
    func post<Params: Encodable, Response: Decodable>(_ url: URL, params: Params?, as mediaType: HTTPMediaType?) async throws -> Response
    
    @discardableResult
    func post<Response: Decodable>(_ url: URL) async throws -> Response
}
```
## Bot configuration.
### Define bot ID
```swift
let tgApi: String = "XXXXXXXXXX:YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
```
### Define connection type
##### LongPolling
```swift
var connectionType: TGConnectionType = .longpolling(limit: nil,
                                                    timeout: nil,
                                                    allowedUpdates: nil)
```
##### WebHook
```swift
var connectionType: TGConnectionType = .webhook(webHookURL: URL(string: "\(TG_WEBHOOK_DOMAIN!)/\(TGWebHookRouteName)")!)
```
```swift
/// Add route for webhook. For example Vapor:

/// routes.swift
func routes(_ app: Application) throws {
    try app.register(collection: TelegramController())
}


/// TelegramController.swift
final class TelegramController: RouteCollection {
    func boot(routes: Vapor.RoutesBuilder) throws {
        routes.post(TGWebHookRouteName, use: telegramWebHook)
    }

    func telegramWebHook(_ req: Request) async throws -> Bool {
        let update: TGUpdate = try req.content.decode(TGUpdate.self)
        Task { await botActor.bot.dispatcher.process([update]) }
        return true
    }
}
```
### Start bot with added handlers
```swift
let bot: TGBot = try await .init(connectionType: connectionType,
                                 dispatcher: nil,
                                 tgClient: VaporTGClient(client: app.client),
                                 tgURI: TGBot.standardTGURL,
                                 botId: botId,
                                 log: app.logger)
try await DefaultBotHandlers.addHandlers(bot: bot)
try await botActor.bot.start()
```

### DefaultBotHandlers code example
```swift
import SwiftTelegramSdk

final class DefaultBotHandlers {

    static func addHandlers(bot: TGBot) async {
        await defaultBaseHandler(bot: bot)
        await messageHandler(bot: bot)
        await commandPingHandler(bot: bot)
        await commandShowButtonsHandler(bot: bot)
        await buttonsActionHandler(bot: bot)
    }
    
    private static func defaultBaseHandler(bot: TGBot) async {
        await bot.dispatcher.add(TGBaseHandler({ update in
            guard let message = update.message else { return }
            let params: TGSendMessageParams = .init(chatId: .chat(message.chat.id), text: "TGBaseHandler")
            try await bot.sendMessage(params: params)
        }))
    }

    private static func messageHandler(bot: TGBot) async {
        await bot.dispatcher.add(TGMessageHandler(filters: (.all && !.command.names(["/ping", "/show_buttons"]))) { update in
            let params: TGSendMessageParams = .init(chatId: .chat(update.message!.chat.id), text: "Success")
            try await bot.sendMessage(params: params)
        })
    }

    private static func commandPingHandler(bot: TGBot) async {
        await bot.dispatcher.add(TGCommandHandler(commands: ["/ping"]) { update in
            try await update.message?.reply(text: "pong", bot: bot)
        })
    }

    private static func commandShowButtonsHandler(bot: TGBot) async {
        await bot.dispatcher.add(TGCommandHandler(commands: ["/show_buttons"]) { update in
            guard let userId = update.message?.from?.id else { fatalError("user id not found") }
            let buttons: [[TGInlineKeyboardButton]] = [
                [.init(text: "Button 1", callbackData: "press 1"), .init(text: "Button 2", callbackData: "press 2")]
            ]
            let keyboard: TGInlineKeyboardMarkup = .init(inlineKeyboard: buttons)
            let params: TGSendMessageParams = .init(chatId: .chat(userId),
                                                    text: "Keyboard active",
                                                    replyMarkup: .inlineKeyboardMarkup(keyboard))
            try await bot.sendMessage(params: params)
        })
    }

    private static func buttonsActionHandler(bot: TGBot) async {
        await bot.dispatcher.add(TGCallbackQueryHandler(pattern: "press 1") { update in
            TGBot.log.info("press 1")
            guard let userId = update.callbackQuery?.from.id else { fatalError("user id not found") }
            let params: TGAnswerCallbackQueryParams = .init(callbackQueryId: update.callbackQuery?.id ?? "0",
                                                            text: update.callbackQuery?.data  ?? "data not exist",
                                                            showAlert: nil,
                                                            url: nil,
                                                            cacheTime: nil)
            try await bot.answerCallbackQuery(params: params)
            try await bot.sendMessage(params: .init(chatId: .chat(userId), text: "press 1"))
        })
        
        await bot.dispatcher.add(TGCallbackQueryHandler(pattern: "press 2") { update in
            TGBot.log.info("press 2")
            guard let userId = update.callbackQuery?.from.id else { fatalError("user id not found") }
            let params: TGAnswerCallbackQueryParams = .init(callbackQueryId: update.callbackQuery?.id ?? "0",
                                                            text: update.callbackQuery?.data  ?? "data not exist",
                                                            showAlert: nil,
                                                            url: nil,
                                                            cacheTime: nil)
            try await bot.answerCallbackQuery(params: params)
            try await bot.sendMessage(params: .init(chatId: .chat(userId), text: "press 2"))
        })
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

packageDependencies.append(.package(url: "https://github.com/nerzh/swift-telegram-sdk", .upToNextMajor(from: "3.0.0")))


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
                .product(name: "SwiftTelegramSdk", package: "swift-telegram-sdk"),
            ]
        )
    ]
)



```
# Acknowledgments

Inspired by [Telegrammer](https://github.com/givip/Telegrammer)
