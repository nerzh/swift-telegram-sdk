# Swift Telegram Sdk for Telegram Bot Api (SDK for creating Telegram Bots in Swift)

### Please, support with ⭐️

🤖 The wrapper for the Telegram Bot API written in Swift. It's not a framework. There is no special syntax here. This is a library that implements all [Telegram Bot API methods](https://core.telegram.org/bots/api#available-methods), which is available to you to work with Vapor, Smoke, FlyingFox.

#### Swift Server Side Community
[Swift Server Side Community - Ukraine / Russian / CIS Telegram Chat](https://t.me/server_side_swift)

# Usage
#### You should to implement TGClientPrtcl protocol
#### You can see an example of TGClient in the implementation for Vapor: [VaporTGClient](https://github.com/nerzh/swift-telegram-sdk/blob/master/Bot-Examples/Vapor/Sources/Vapor-telegram-bot-example/TGBot/VaporTGClient.swift)
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
# Usage with Vapor
#### Example Swift Telegram Bot with Vapor - [Telegram-vapor-bot-example](https://github.com/nerzh/telegram-vapor-bot/tree/master/Bot-Examples/Vapor/Sources/Vapor-telegram-bot-example)
#### create folder with your handlers **TGHandlers/DefaultBotHandlers.swift**
```swift
import Vapor
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

### Setup

#### Create file **TGBotConnectionActor.swift**

Add Actor for TGBot

```swift
import Foundation
import SwiftTelegramSdk

actor TGBotActor {
    private var _bot: TGBot!

    var bot: TGBot {
        self._bot
    }
    
    func setBot(_ bot: TGBot) {
        self._bot = bot
    }
}
```

#### vapor **main.swift**

make strong reference to TGBotConnection instance and add "await" to configure

```swift
import Vapor
import TelegramVaporBot

let botActor: TGBotActor = .init()

try await configure(app)
```

### Use with LongPolling

#### for longpolling you should only configure vapor **configure.swift**

```swift
import Foundation
import Vapor
import SwiftTelegramSdk

public func configure(_ app: Application) async throws {
    let tgApi: String = "XXXXXXXXXX:YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
    let bot: TGBot = try await .init(connectionType: .longpolling(limit: nil,
                                                                  timeout: nil,
                                                                  allowedUpdates: nil),
                                     dispatcher: nil,
                                     tgClient: VaporTGClient(client: app.client),
                                     tgURI: TGBot.standardTGURL,
                                     botId: tgApi,
                                     log: app.logger)
    /// set level of debug if you needed
    //    bot.log.logLevel = .error
    await botActor.setBot(bot)
    await DefaultBotHandlers.addHandlers(bot: botActor.bot)
    try await botActor.bot.start()

    try routes(app)
}
```



### Use with Webhooks

#### vapor **configure.swift**

```swift
import Foundation
import Vapor
import SwiftTelegramSdk

public func configure(_ app: Application) async throws {
    let tgApi: String = "XXXXXXXXXX:YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
    let bot: TGBot = try await .init(connectionType: .webhook(webHookURL: URL(string: "https://your_domain/telegramWebHook")!),
                                     dispatcher: nil,
                                     tgClient: VaporTGClient(client: app.client),
                                     tgURI: TGBot.standardTGURL,
                                     botId: tgApi,
                                     log: app.logger)
    /// set level of debug if you needed
    //    bot.log.logLevel = .error
    await botActor.setBot(bot)
    await DefaultBotHandlers.addHandlers(bot: botActor.bot)
    try await botActor.bot.start()

    try routes(app)
}
```

#### vapor **routes.swift**

```swift
import Vapor

func routes(_ app: Application) throws {
    try app.register(collection: TelegramController())
}
```

#### vapor **TelegramController.swift**

```swift
import Foundation
import Vapor
import SwiftTelegramSdk

final class TelegramController: RouteCollection {
    
    func boot(routes: Vapor.RoutesBuilder) throws {
        routes.post("telegramWebHook", use: telegramWebHook)
    }
}

extension TelegramController {
    
    func telegramWebHook(_ req: Request) async throws -> Bool {
        let update: TGUpdate = try req.content.decode(TGUpdate.self)
        await botActor.bot.dispatcher.process([update])
        return true
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
# Usage with other server frameworks
#### You can also see examples of TGClient in implementations for Hummingbird, Smoke and FlyingFox: [Bot-Examples](https://github.com/nerzh/swift-telegram-sdk/tree/master/Bot-Examples)

# Acknowledgments

Inspired by [Telegrammer](https://github.com/givip/Telegrammer)
